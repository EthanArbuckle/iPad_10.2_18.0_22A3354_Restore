@implementation HDRImage

- (unint64_t)width
{
  return gFunc_CVPixelBufferGetWidth(-[HDRImage imageBuffer](self, "imageBuffer"));
}

- (unint64_t)height
{
  return gFunc_CVPixelBufferGetHeight(-[HDRImage imageBuffer](self, "imageBuffer"));
}

- (double)imageSize
{
  unsigned int v2;

  v2 = objc_msgSend(a1, "width");
  return COERCE_DOUBLE(__PAIR64__(objc_msgSend(a1, "height"), v2));
}

+ (BOOL)getGainMapHeadroom:(double *)a3 fromProperties:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  float v11;
  BOOL v12;
  id v13;
  const char *v14;
  id v15;
  BOOL v16;
  float v17;
  float v18;
  float v19;
  double v20;
  double v21;
  float v22;
  float v23;
  float v24;
  id v25;

  v5 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("{MakerApple}"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("33"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("48"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v9 = v7;
LABEL_7:
    if (v9)
      v12 = v8 == 0;
    else
      v12 = 1;
    if (v12)
    {
      if ((gIIODebugFlags & 0x300000) != 0)
      {
        objc_msgSend(v9, "description");
        v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v14 = (const char *)objc_msgSend(v13, "UTF8String");
        objc_msgSend(v8, "description");
        v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        ImageIOLog("☀️  Invalid Meteor+ makernote data (hdrGain=%s, gainMapValue=%s)", v14, (const char *)objc_msgSend(v15, "UTF8String"));

      }
      v16 = 0;
    }
    else
    {
      objc_msgSend(v9, "floatValue");
      v18 = v17;
      objc_msgSend(v8, "floatValue");
      +[HDRImage gainMapHeadroomForHDRGain:gainMapValue:](HDRImage, "gainMapHeadroomForHDRGain:gainMapValue:", v18, v19);
      v21 = v20;
      if ((gIIODebugFlags & 0x300000) != 0)
      {
        objc_msgSend(v9, "floatValue");
        v23 = v22;
        objc_msgSend(v8, "floatValue");
        ImageIOLog("☀️  Meteor+ headroom: %f (hdrGain=%f, gainMapValue=%f)", v21, v23, v24);
      }
      if (a3)
        *a3 = v21;
      v16 = 1;
    }
    goto LABEL_23;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kCGFallbackHDRGain"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = gIIODebugFlags & 0x300000;
  if (v9)
  {
    if (v10)
    {
      objc_msgSend(v9, "floatValue");
      ImageIOLog("☀️  Missing makernote data, using fallback hdrGain=%f\n", v11);
    }

    v8 = &unk_1E1BDC478;
    goto LABEL_7;
  }
  if (v10)
  {
    objc_msgSend(v5, "description");
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    ImageIOLog("☀️  Missing makernote data: %s, no fallback provided", (const char *)objc_msgSend(v25, "UTF8String"));

  }
  v16 = 0;
  v9 = 0;
LABEL_23:

  return v16;
}

+ (double)gainMapHeadroomForHDRGain:(double)a3 gainMapValue:(double)a4
{
  double v4;
  double v5;

  if (a3 >= 1.0)
  {
    if (a4 <= 0.01)
      return exp2(a4 * -70.0 + 3.0);
    v4 = a4 * -0.303030303 + 2.0;
    v5 = 0.303030303;
  }
  else
  {
    if (a4 <= 0.01)
      return exp2(a4 * -20.0 + 1.8);
    v4 = a4 * -0.101010101 + 1.5;
    v5 = 0.101010101;
  }
  return exp2(v4 + v5);
}

+ (BOOL)getGainMapVersionMajor:(unint64_t *)a3 minor:(unint64_t *)a4 fromMetadata:(CGImageMetadata *)a5
{
  __CFString *v8;
  CGImageMetadataTag *v9;
  CGImageMetadataTag *v10;
  id v11;
  char isKindOfClass;
  unint64_t v13;
  id v14;

  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("HDRGainMap"), CFSTR("HDRGainMapVersion"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v9 = CGImageMetadataCopyTagWithPath(a5, 0, v8);
    v10 = v9;
    if (v9)
    {
      v11 = (id)CGImageMetadataTagCopyValue(v9);
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) != 0)
      {
        v13 = objc_msgSend(v11, "integerValue");
        if (a3)
          *a3 = v13 >> 16;
        if (a4)
          *a4 = (unsigned __int16)v13;
      }
      else
      {
        objc_msgSend(v11, "description");
        v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        LogError("+[HDRImage getGainMapVersionMajor:minor:fromMetadata:]", 398, "Invalid version tag value: %s", (const char *)objc_msgSend(v14, "UTF8String"));

      }
    }
    else
    {
      -[__CFString description](v8, "description");
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      LogError("+[HDRImage getGainMapVersionMajor:minor:fromMetadata:]", 392, "Failed to get metadata tag: %s", (const char *)objc_msgSend(v11, "UTF8String"));
      isKindOfClass = 0;
    }

  }
  else
  {
    isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

+ (BOOL)getGainMapHeadroom:(double *)a3 fromMetadata:(CGImageMetadata *)a4
{
  __CFString *v7;
  CGImageMetadataTag *v8;
  CGImageMetadataTag *v9;
  id v10;
  char isKindOfClass;
  id v12;
  double v13;
  double v14;
  const char *v15;
  uint64_t v17;
  uint64_t v18;

  v17 = 0;
  v18 = 0;
  if ((objc_msgSend(a1, "getGainMapVersionMajor:minor:fromMetadata:", &v18, &v17, a4) & 1) == 0)
  {
    -[CGImageMetadata description](a4, "description");
    v7 = (__CFString *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    LogError("+[HDRImage getGainMapHeadroom:fromMetadata:]", 418, "Failed to read gain map version info: %s", (const char *)-[__CFString UTF8String](v7, "UTF8String"));
LABEL_15:
    isKindOfClass = 0;
    goto LABEL_19;
  }
  if (v18 == 1 && v17 == 0)
  {
    -[CGImageMetadata description](a4, "description");
    v7 = (__CFString *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    _cg_jpeg_mem_term("+[HDRImage getGainMapHeadroom:fromMetadata:]", 424, "Version 1.0 gain map metadata does not contain headroom value: %s", (const char *)-[__CFString UTF8String](v7, "UTF8String"));
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("HDRGainMap"), CFSTR("HDRGainMapHeadroom"));
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v8 = CGImageMetadataCopyTagWithPath(a4, 0, v7);
  v9 = v8;
  if (v8)
  {
    v10 = (id)CGImageMetadataTagCopyValue(v8);
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {
      v12 = v10;
      objc_msgSend(v12, "doubleValue");
      v14 = v13;
      if ((gIIODebugFlags & 0x300000) != 0)
        ImageIOLog("Gain map headroom value: %f", v13);
      if (a3)
        *a3 = v14;
      v10 = v12;
    }
    else
    {
      objc_msgSend(v10, "description");
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      LogError("+[HDRImage getGainMapHeadroom:fromMetadata:]", 438, "Invalid gain map headroom tag value: %s", (const char *)objc_msgSend(v12, "UTF8String"));
    }
  }
  else
  {
    -[__CFString description](v7, "description");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = (const char *)objc_msgSend(v10, "UTF8String");
    -[CGImageMetadata description](a4, "description");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    LogError("+[HDRImage getGainMapHeadroom:fromMetadata:]", 432, "Failed to get metadata tag %s from metadata: %s", v15, (const char *)objc_msgSend(v12, "UTF8String"));
    isKindOfClass = 0;
  }

LABEL_19:
  return isKindOfClass & 1;
}

+ (CGImageMetadata)createGainMapMetadataWithHeadroom:(double)a3
{
  CGMutableImageMetadataRef Mutable;
  void *v5;
  CGImageMetadataTag *v6;
  __CFString *v7;
  void *v8;
  CGImageMetadataTag *v9;
  __CFString *v10;
  CGImageMetadata *v11;

  Mutable = CGImageMetadataCreateMutable();
  if (CGImageMetadataRegisterNamespaceForPrefix(Mutable, CFSTR("http://ns.apple.com/HDRGainMap/1.0/"), CFSTR("HDRGainMap"), 0))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 0x20000);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = CGImageMetadataTagCreate(CFSTR("http://ns.apple.com/HDRGainMap/1.0/"), CFSTR("HDRGainMap"), CFSTR("HDRGainMapVersion"), kCGImageMetadataTypeDefault, v5);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("HDRGainMap"), CFSTR("HDRGainMapVersion"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (CGImageMetadataSetTagWithPath(Mutable, 0, v7, v6))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = CGImageMetadataTagCreate(CFSTR("http://ns.apple.com/HDRGainMap/1.0/"), CFSTR("HDRGainMap"), CFSTR("HDRGainMapHeadroom"), kCGImageMetadataTypeDefault, v8);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("HDRGainMap"), CFSTR("HDRGainMapHeadroom"));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (CGImageMetadataSetTagWithPath(Mutable, 0, v10, v9))
      {
        v11 = Mutable;
      }
      else
      {
        LogError("+[HDRImage createGainMapMetadataWithHeadroom:]", 475, "Failed to set HDRGainMap metadata headroom tag!");
        v11 = 0;
      }

    }
    else
    {
      LogError("+[HDRImage createGainMapMetadataWithHeadroom:]", 467, "Failed to set HDRGainMap metadata version tag!");
      v11 = 0;
    }

  }
  else
  {
    LogError("+[HDRImage createGainMapMetadataWithHeadroom:]", 456, "Failed to register HDRGainMap metadata tag!");
    v11 = 0;
  }

  return v11;
}

- (id)flexGTCInfoWithCurveData:(id)a3 headroom:(float)a4 identifier:(id)a5
{
  double v8;
  int v9;
  HDRFlexRangeParameters *flexRangeParams;
  float v11;
  float v12;
  float v13;
  float v14;
  HDRFlexRangeParameters *v15;
  int v16;
  float v17;
  int v18;
  int v19;
  float v20;
  int v21;
  int v22;
  int v23;
  float v24;
  float v25;
  int v26;
  float v27;
  float v28;
  float v29;
  int v30;
  void *v31;
  double v32;
  void *v33;
  double v34;
  void *v35;
  double v36;
  void *v37;
  double v38;
  void *v39;
  double v40;
  void *v41;
  double v42;
  void *v43;
  CGColorSpace *v44;
  CGColorSpaceRef Linearized;
  const char *v46;
  void *v47;
  unint64_t v48;
  float v49;
  float v50;
  double v51;
  _QWORD *v52;
  _QWORD *v53;
  void *v54;
  void *v55;
  int v56;
  int v57;
  void *v58;
  float v59;
  float v60;
  void *v61;
  float v62;
  float v63;
  double v64;
  float v65;
  void *v66;
  double v67;
  void *v68;
  double v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  id v77;
  id v78;
  HDRFlexRangeParameters *v79;
  id v80;
  _QWORD v81[3];
  _QWORD v82[3];
  _QWORD v83[3];
  _QWORD v84[5];

  v84[3] = *MEMORY[0x1E0C80C00];
  v80 = a3;
  v77 = a5;
  v78 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v78, "setObject:forKeyedSubscript:", v77, *MEMORY[0x1E0C95558]);
  *(float *)&v8 = log2f(a4);
  v9 = LODWORD(v8);
  flexRangeParams = self->_flexRangeParams;
  v79 = flexRangeParams;
  if (flexRangeParams)
  {
    -[HDRFlexRangeParameters baseHeadroom](flexRangeParams, "baseHeadroom");
    v12 = v11;
    -[HDRFlexRangeParameters alternateHeadroom](self->_flexRangeParams, "alternateHeadroom");
    v14 = v13;
    v15 = self->_flexRangeParams;
    if (v12 <= v13)
      -[HDRFlexRangeParameters baseHeadroom](v15, "baseHeadroom");
    else
      -[HDRFlexRangeParameters alternateHeadroom](v15, "alternateHeadroom");
    v18 = v16;
    -[HDRFlexRangeParameters channelGamma](self->_flexRangeParams, "channelGamma");
    v21 = v23;
    -[HDRFlexRangeParameters channelMin](self->_flexRangeParams, "channelMin");
    if (v12 <= v14)
    {
      v27 = v24;
      -[HDRFlexRangeParameters channelMax](self->_flexRangeParams, "channelMax");
      v29 = v28;
      -[HDRFlexRangeParameters channelAlternateOffset](self->_flexRangeParams, "channelAlternateOffset");
      v19 = v30;
      -[HDRFlexRangeParameters channelBaseOffset](self->_flexRangeParams, "channelBaseOffset");
      v22 = LODWORD(v8);
      v20 = -v27;
      v17 = -v29;
    }
    else
    {
      v20 = v24;
      -[HDRFlexRangeParameters channelMax](self->_flexRangeParams, "channelMax");
      v17 = v25;
      -[HDRFlexRangeParameters channelAlternateOffset](self->_flexRangeParams, "channelAlternateOffset");
      v19 = v26;
      -[HDRFlexRangeParameters channelAlternateOffset](self->_flexRangeParams, "channelAlternateOffset");
      v22 = LODWORD(v8);
    }
  }
  else
  {
    v17 = -*(float *)&v8;
    v18 = 0;
    v19 = 981668463;
    v20 = -0.0;
    v21 = 1074580685;
    v22 = 981668463;
  }
  LODWORD(v8) = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setObject:forKeyedSubscript:", v31, *MEMORY[0x1E0C95578]);

  LODWORD(v32) = v18;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setObject:forKeyedSubscript:", v33, *MEMORY[0x1E0C95568]);

  *(float *)&v34 = v20;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setObject:forKeyedSubscript:", v35, *MEMORY[0x1E0C95590]);

  *(float *)&v36 = v17;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setObject:forKeyedSubscript:", v37, *MEMORY[0x1E0C95588]);

  LODWORD(v38) = v19;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setObject:forKeyedSubscript:", v39, *MEMORY[0x1E0C95570]);

  LODWORD(v40) = v22;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setObject:forKeyedSubscript:", v41, *MEMORY[0x1E0C95560]);

  LODWORD(v42) = v21;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setObject:forKeyedSubscript:", v43, *MEMORY[0x1E0C95580]);

  v44 = -[HDRImage gainMapColorSpace](self, "gainMapColorSpace");
  if (!v44)
    v44 = -[HDRImage colorSpace](self, "colorSpace");
  Linearized = CGColorSpaceCreateLinearized(v44);
  if ((CGColorSpaceGetCICPInfo() & 1) == 0)
  {
    v46 = (const char *)-[__CFString UTF8String]((id)objc_retainAutorelease((id)CFCopyDescription(Linearized)), "UTF8String");
    LogError("cicp_tagFromColorSpace", 53, "Failed to get CICP info for space: %s", v46);
  }
  v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v80, "count"));
  v48 = 0;
  v49 = -v17;
  v50 = a4 + -1.0;
  v51 = v17 * -0.693147181;
  v52 = (_QWORD *)MEMORY[0x1E0C95550];
  v53 = (_QWORD *)MEMORY[0x1E0C95540];
  while (v48 < objc_msgSend(v80, "count"))
  {
    objc_msgSend(v80, "objectAtIndexedSubscript:", v48);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "objectAtIndexedSubscript:", 0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "floatValue");
    v57 = v56;

    objc_msgSend(v54, "objectAtIndexedSubscript:", 1);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "floatValue");
    v60 = v59;

    objc_msgSend(v54, "objectAtIndexedSubscript:", 2);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "floatValue");
    v63 = v62;

    if (!v79)
    {
      v65 = (float)(v50 * v60) + 1.0;
      v63 = (float)(v50 * v63) / (v51 * v65);
      v60 = (float)(v20 + log2f(v65)) / v49;
    }
    v83[0] = *MEMORY[0x1E0C95548];
    LODWORD(v64) = v57;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v64);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v84[0] = v66;
    v83[1] = *v52;
    *(float *)&v67 = v60;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v84[1] = v68;
    v83[2] = *v53;
    *(float *)&v69 = v63;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v84[2] = v70;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v84, v83, 3);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "addObject:", v71);

    ++v48;
  }
  v72 = *MEMORY[0x1E0C955A8];
  v82[0] = v78;
  v73 = *MEMORY[0x1E0C955B0];
  v81[0] = v72;
  v81[1] = v73;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 0);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v81[2] = *MEMORY[0x1E0C955A0];
  v82[1] = v74;
  v82[2] = v47;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v82, v81, 3);
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  return v75;
}

+ (id)gainMapHeadroomFromFlexGTCInfo:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v7;

  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0C955A8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "description");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    LogError("+[HDRImage gainMapHeadroomFromFlexGTCInfo:]", 557, "Invalid FlexGTC gainmap info: %s", (const char *)objc_msgSend(v4, "UTF8String"));
LABEL_6:
    v5 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C95578]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v3, "description");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    LogError("+[HDRImage gainMapHeadroomFromFlexGTCInfo:]", 563, "Invalid FlexGTC gainmap info: %s", (const char *)objc_msgSend(v7, "UTF8String"));

    goto LABEL_6;
  }
  v4 = v4;
  v5 = v4;
LABEL_7:

  return v5;
}

+ (BOOL)getGainMapHeadroom:(double *)a3 fromFlexGTCInfo:(id)a4
{
  void *v5;
  void *v6;
  long double v7;

  objc_msgSend(a1, "gainMapHeadroomFromFlexGTCInfo:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "doubleValue");
    *a3 = exp2(v7);
  }

  return v6 != 0;
}

+ (BOOL)getGainMapMin:(float *)a3 max:(float *)a4 fromFlexGTCInfo:(id)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;
  char isKindOfClass;
  int v12;
  int v13;
  id v14;

  v7 = a5;
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0C955A8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0C95590]);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0C95588]);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) != 0)
      {
        if (a3)
        {
          objc_msgSend(v9, "floatValue");
          *(_DWORD *)a3 = v12;
        }
        if (a4)
        {
          objc_msgSend(v10, "floatValue");
          *(_DWORD *)a4 = v13;
        }
      }
      else
      {
        objc_msgSend(v8, "description");
        v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        LogError("+[HDRImage getGainMapMin:max:fromFlexGTCInfo:]", 595, "Invalid FlexGTC gainmap info: %s", (const char *)objc_msgSend(v14, "UTF8String"));

      }
    }
    else
    {
      objc_msgSend(v8, "description");
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      LogError("+[HDRImage getGainMapMin:max:fromFlexGTCInfo:]", 589, "Invalid FlexGTC gainmap info: %s", (const char *)objc_msgSend(v10, "UTF8String"));
      isKindOfClass = 0;
    }

  }
  else
  {
    objc_msgSend(v8, "description");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    LogError("+[HDRImage getGainMapMin:max:fromFlexGTCInfo:]", 583, "Invalid FlexGTC gainmap info: %s", (const char *)objc_msgSend(v9, "UTF8String"));
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

+ (id)curveDataFromFlexGTCInfo:(id)a3
{
  void *v3;
  unint64_t v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  BOOL v12;
  char v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v20;
  void *v21;
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v20 = a3;
  objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x1E0C955A0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v3, "count"))
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
    v4 = 0;
    v5 = (_QWORD *)MEMORY[0x1E0C95540];
    while (1)
    {
      if (v4 >= objc_msgSend(v3, "count"))
      {
        v17 = v21;
        v16 = v21;
        goto LABEL_24;
      }
      objc_msgSend(v3, "objectAtIndexedSubscript:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        break;
      objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0C95548]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0C95550]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", *v5);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      if (v7)
        v11 = v8 == 0;
      else
        v11 = 1;
      v12 = v11 || v9 == 0;
      v13 = v12;
      if (v12)
      {
        objc_msgSend(v6, "description");
        v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        LogError("+[HDRImage curveDataFromFlexGTCInfo:]", 625, "Invalid FlexGTC table data point: %s", (const char *)objc_msgSend(v14, "UTF8String"));
      }
      else
      {
        v22[0] = v7;
        v22[1] = v8;
        v22[2] = v9;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3);
        v14 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObject:", v14);
      }

      ++v4;
      if ((v13 & 1) != 0)
        goto LABEL_23;
    }
    objc_msgSend(v6, "description");
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    LogError("+[HDRImage curveDataFromFlexGTCInfo:]", 618, "Invalid FlexGTC table data point: %s", (const char *)objc_msgSend(v18, "UTF8String"));

LABEL_23:
    v16 = 0;
    v17 = v21;
LABEL_24:

  }
  else
  {
    objc_msgSend(v3, "description");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    LogError("+[HDRImage curveDataFromFlexGTCInfo:]", 611, "Invalid FlexGTC table data: %s", (const char *)objc_msgSend(v15, "UTF8String"));

    v16 = 0;
  }

  return v16;
}

+ (id)flexRangeParametersWithHeadroom:(double)a3 options:(id)a4
{
  id v5;
  HDRFlexRangeParameters *v6;
  void *v7;
  int v8;
  void *v9;
  double v10;
  int v11;
  float v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  char v17;
  float v18;
  double v19;
  float v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __CFString *v27;
  CGColorSpaceRef v28;
  void *v29;

  v5 = a4;
  v6 = objc_alloc_init(HDRFlexRangeParameters);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kCGFlexRangeBaseIsHDR"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kCGFlexRangeMin"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = log2(a3);
  if (v9)
    v11 = v8;
  else
    v11 = 0;
  if (v11 == 1)
  {
    objc_msgSend(v9, "floatValue", v10);
    v13 = (float)-v12;
  }
  else
  {
    v13 = v10;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kCGFlexRangeMax"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v14;
  if (v14)
    v17 = v8;
  else
    v17 = 1;
  if ((v17 & 1) == 0)
  {
    objc_msgSend(v14, "floatValue");
    v13 = *(float *)&v15;
  }
  v18 = v13;
  if (v8)
    *(float *)&v15 = v13;
  else
    *(float *)&v15 = 0.0;
  -[HDRFlexRangeParameters setBaseHeadroom:](v6, "setBaseHeadroom:", v15);
  if (v8)
    v18 = 0.0;
  *(float *)&v19 = v18;
  -[HDRFlexRangeParameters setAlternateHeadroom:](v6, "setAlternateHeadroom:", v19);
  -[HDRFlexRangeParameters setIsMono:](v6, "setIsMono:", 1);
  if (v9)
  {
    objc_msgSend(v9, "floatValue");
    v21 = v20;
  }
  else
  {
    v21 = -v13;
    if (!v8)
      v21 = 0.0;
  }
  *(float *)&v21 = v21;
  -[HDRFlexRangeParameters setChannelMin:](v6, "setChannelMin:", v21);
  if (v16)
  {
    objc_msgSend(v16, "floatValue");
    v18 = *(float *)&v22;
  }
  *(float *)&v22 = v18;
  -[HDRFlexRangeParameters setChannelMax:](v6, "setChannelMax:", v22);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kCGFlexRangeGamma"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    objc_msgSend(v23, "floatValue");
    -[HDRFlexRangeParameters setChannelGamma:](v6, "setChannelGamma:");
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kCGFlexRangeEpsilon"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25)
  {
    objc_msgSend(v25, "floatValue");
    -[HDRFlexRangeParameters setChannelBaseOffset:](v6, "setChannelBaseOffset:");
    objc_msgSend(v26, "floatValue");
    -[HDRFlexRangeParameters setChannelAlternateOffset:](v6, "setChannelAlternateOffset:");
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kCGFlexRangeAlternateColorSpace"));
  v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = CGColorSpaceCreateWithName(v27);
      if (v28)
      {
        -[HDRFlexRangeParameters setAlternateColorSpace:](v6, "setAlternateColorSpace:", v28);
        CFRelease(v28);
      }
      else
      {
        LogError("+[HDRImage flexRangeParametersWithHeadroom:options:]", 668, "Unrecognized colorspace name: %s", (const char *)-[__CFString UTF8String](objc_retainAutorelease(v27), "UTF8String"));
      }
    }
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kCGFlexRangeUseAlternateColor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDRFlexRangeParameters setUseBaseColor:](v6, "setUseBaseColor:", objc_msgSend(v29, "BOOLValue") ^ 1);
  if (!-[HDRFlexRangeParameters useBaseColor](v6, "useBaseColor")
    && !-[HDRFlexRangeParameters alternateColorSpace](v6, "alternateColorSpace"))
  {
    LogError("+[HDRImage flexRangeParametersWithHeadroom:options:]", 674, "Request to use alternate color but no alternate colorspace specified: %s", (const char *)-[__CFString UTF8String](objc_retainAutorelease(v27), "UTF8String"));
  }

  return v6;
}

- (CGColorSpace)colorSpace
{
  CGColorSpace *imageSpace;
  __CVBuffer *imageBuffer;
  void *v5;
  id v7;

  imageSpace = self->_imageSpace;
  if (!imageSpace)
  {
    imageBuffer = self->_imageBuffer;
    if (imageBuffer)
    {
      imageSpace = (CGColorSpace *)gFunc_CVBufferCopyAttachment(self->_imageBuffer, *(_QWORD *)gIIO_kCVImageBufferCGColorSpaceKey, 0);
      if (!imageSpace)
      {
        v5 = (void *)gFunc_CVBufferCopyAttachments(imageBuffer, 1);
        imageSpace = (CGColorSpace *)gFunc_CVImageBufferCreateColorSpaceFromAttachments();

        self->_imageSpace = imageSpace;
        if (imageSpace)
          return imageSpace;
        -[__CVBuffer description](self->_imageBuffer, "description");
        v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        LogError("-[HDRImage colorSpace]", 692, "Failed to create color space from image buffer: %s", (const char *)objc_msgSend(v7, "UTF8String"));

        imageSpace = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
      }
      self->_imageSpace = imageSpace;
    }
    else
    {
      return 0;
    }
  }
  return imageSpace;
}

- (BOOL)hasGainMap
{
  return self->_gainMapBuffer != 0;
}

- (CGColorSpace)gainMapColorSpace
{
  HDRFlexRangeParameters *flexRangeParams;
  CGColorSpace *v5;

  if (!self->_gainMapSpace)
  {
    if (self->_gainMapBuffer)
    {
      flexRangeParams = self->_flexRangeParams;
      if (flexRangeParams)
      {
        if (!-[HDRFlexRangeParameters useBaseColor](flexRangeParams, "useBaseColor"))
        {
          v5 = CGColorSpaceRetain(-[HDRFlexRangeParameters alternateColorSpace](self->_flexRangeParams, "alternateColorSpace"));
          self->_gainMapSpace = v5;
          if (!v5)
            LogError("-[HDRImage gainMapColorSpace]", 710, "FlexRange alternate colorspace not set, cannot use alternate color!");
        }
      }
    }
  }
  return self->_gainMapSpace;
}

- (double)gainMapSize
{
  unsigned int Width;

  if (!objc_msgSend(a1, "hasGainMap"))
    return 0.0;
  Width = gFunc_CVPixelBufferGetWidth(objc_msgSend(a1, "gainMapBuffer"));
  return COERCE_DOUBLE(__PAIR64__(gFunc_CVPixelBufferGetHeight(objc_msgSend(a1, "gainMapBuffer")), Width));
}

- (HDRImage)init
{
  -[HDRImage doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (HDRImage)initWithImageBuffer:(__CVBuffer *)a3
{
  return -[HDRImage initWithImageBuffer:gainMapBuffer:](self, "initWithImageBuffer:gainMapBuffer:", a3, 0);
}

- (HDRImage)initWithImageBuffer:(__CVBuffer *)a3 gainMapBuffer:(__CVBuffer *)a4
{
  return -[HDRImage initWithImageBuffer:gainMapBuffer:gainMapMetadata:imageProperties:](self, "initWithImageBuffer:gainMapBuffer:gainMapMetadata:imageProperties:", a3, a4, 0, 0);
}

- (HDRImage)initWithImageBuffer:(__CVBuffer *)a3 gainMapBuffer:(__CVBuffer *)a4 gainMapMetadata:(CGImageMetadata *)a5 imageProperties:(id)a6
{
  id v10;
  void *v11;
  HDRImage *v12;
  _BOOL4 v13;
  double v14;
  void *v15;
  uint64_t v16;
  NSDictionary *flexGTCInfo;
  float v18;
  void *v19;
  int v20;
  int v21;
  double v23;

  v10 = a6;
  if (a4)
  {
    +[HDRFlexRangeParameters flexRangeParametersFromMetadata:](HDRFlexRangeParameters, "flexRangeParametersFromMetadata:", a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  v12 = -[HDRImage initWithImageBuffer:gainMapBuffer:flexRangeParameters:](self, "initWithImageBuffer:gainMapBuffer:flexRangeParameters:", a3, a4, v11);
  if (a4 && !v11)
  {
    v23 = 0.0;
    if (a5 && (objc_msgSend((id)objc_opt_class(), "getGainMapHeadroom:fromMetadata:", &v23, a5) & 1) != 0
      || (v13 = +[HDRImage getGainMapHeadroom:fromProperties:](HDRImage, "getGainMapHeadroom:fromProperties:", &v23, v10), v14 = 1.0, v13))
    {
      v14 = v23;
    }
    v12->_headroom = v14;
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kCGFlexGTCInfo"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = objc_msgSend(v15, "copy");
      flexGTCInfo = v12->_flexGTCInfo;
      v12->_flexGTCInfo = (NSDictionary *)v16;

      v23 = 0.0;
      if (objc_msgSend((id)objc_opt_class(), "getGainMapHeadroom:fromFlexGTCInfo:", &v23, v15))
      {
        v18 = v23;
        v12->_headroom = v18;
      }
    }
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kCGToneMappingMode"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = objc_msgSend(v19, "intValue");
      v21 = 0;
      switch(v20)
      {
        case 1:
          v21 = 5;
          goto LABEL_24;
        case 2:
          v21 = 4;
          goto LABEL_24;
        case 3:
          if (v12->_type == 3)
            v21 = 1;
          else
            v21 = 2;
          goto LABEL_24;
        case 4:
          v21 = 3;
          goto LABEL_24;
        case 5:
LABEL_24:
          v12->_toneMappingMode = v21;
          break;
        default:
          break;
      }
    }
  }
  if (!-[HDRImage orientation](v12, "orientation"))
    -[HDRImage setOrientation:](v12, "setOrientation:", 1);

  return v12;
}

- (HDRImage)initWithImageBuffer:(__CVBuffer *)a3 gainMapBuffer:(__CVBuffer *)a4 flexRangeParameters:(id)a5
{
  id v8;
  HDRImage *v9;
  float v10;
  float v11;
  float v12;
  uint64_t v13;
  HDRFlexRangeParameters *flexRangeParams;
  CGColorSpace *ColorSpace;
  uint64_t v16;
  uint64_t v17;
  int v18;
  void *v19;
  float v20;
  double v22;
  objc_super v23;

  v8 = a5;
  v23.receiver = self;
  v23.super_class = (Class)HDRImage;
  v9 = -[HDRImage init](&v23, sel_init);
  v9->_imageBuffer = (__CVBuffer *)gFunc_CVPixelBufferRetain(a3);
  v9->_toneMappingMode = 0;
  if (a4)
  {
    if (v8)
    {
      v9->_type = 6;
      objc_msgSend(v8, "baseHeadroom");
      v11 = v10;
      objc_msgSend(v8, "alternateHeadroom");
      v9->_headroom = exp2(fmaxf(v11, v12));
      v13 = objc_msgSend(v8, "copy");
      flexRangeParams = v9->_flexRangeParams;
      v9->_flexRangeParams = (HDRFlexRangeParameters *)v13;

    }
    else
    {
      v9->_type = 4;
      v9->_headroom = 4.0;
    }
    v9->_gainMapBuffer = (__CVBuffer *)gFunc_CVPixelBufferRetain(a4);
    goto LABEL_15;
  }
  ColorSpace = (CGColorSpace *)gFunc_CVImageBufferGetColorSpace(a3);
  if (CGColorSpaceIsHLGBased(ColorSpace))
  {
    v16 = 2;
    v17 = 0x4013B455C0000000;
LABEL_10:
    v9->_type = v16;
    *(_QWORD *)&v9->_headroom = v17;
    v18 = 4;
    goto LABEL_11;
  }
  if (CGColorSpaceIsPQBased(ColorSpace))
  {
    v16 = 3;
    v17 = 0x4048A16B40000000;
    goto LABEL_10;
  }
  if (CGColorSpaceUsesExtendedRange(ColorSpace))
  {
    v9->_type = 5;
    v9->_headroom = 16.0;
    v18 = 3;
  }
  else
  {
    v18 = 0;
    v9->_type = 0;
    v9->_headroom = 1.0;
  }
LABEL_11:
  v9->_toneMappingMode = v18;
  if (CGColorSpaceContainsFlexGTCInfo())
  {
    v19 = (void *)CGColorSpaceCopyFlexGTCInfo();
    v22 = 0.0;
    if (objc_msgSend((id)objc_opt_class(), "getGainMapHeadroom:fromFlexGTCInfo:", &v22, v19))
    {
      v20 = v22;
      v9->_headroom = v20;
    }
    v9->_toneMappingMode = 5;

  }
LABEL_15:

  return v9;
}

- (void)dealloc
{
  __n128 v3;
  objc_super v4;

  v3 = ((__n128 (*)())gFunc_CVPixelBufferRelease)();
  gFunc_CVPixelBufferRelease(v3);
  CGColorSpaceRelease(self->_imageSpace);
  CGColorSpaceRelease(self->_gainMapSpace);
  v4.receiver = self;
  v4.super_class = (Class)HDRImage;
  -[HDRImage dealloc](&v4, sel_dealloc);
}

+ (BOOL)getPixelType:(int *)a3 YCCMatrixString:(id *)a4 chromaSubsampling:componentRange:bitDepth:forBuffer:
{
  _WORD *v4;
  _QWORD *v5;
  _WORD *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _WORD *v10;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  char v17;
  void *v18;
  char v19;
  char v20;
  void *v21;
  int v22;
  char v23;
  char v24;
  id v25;
  int v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  unsigned int v32;
  void *v33;
  unsigned int v34;
  uint32x2_t v35;
  id v36;
  id v37;
  void *v38;
  _WORD *v40;

  v8 = v7;
  v40 = v6;
  v9 = v5;
  v10 = v4;
  v13 = ((uint64_t (*)())gFunc_CVPixelBufferGetPixelFormatType)();
  v14 = (void *)gFunc_CVPixelFormatDescriptionCreateWithPixelFormatType(0, v13);
  objc_msgSend(v14, "objectForKeyedSubscript:", *(_QWORD *)gIIO_kCVPixelFormatContainsRGB);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "BOOLValue");

  v17 = v16 ^ 1;
  if (!a3)
    v17 = 1;
  if ((v17 & 1) == 0)
    *a3 = 1;
  objc_msgSend(v14, "objectForKeyedSubscript:", *(_QWORD *)gIIO_kCVPixelFormatContainsGrayscale);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "BOOLValue");

  v20 = v19 ^ 1;
  if (!a3)
    v20 = 1;
  if ((v20 & 1) == 0)
    *a3 = 3;
  objc_msgSend(v14, "objectForKeyedSubscript:", *(_QWORD *)gIIO_kCVPixelFormatContainsYCbCr);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "BOOLValue");

  v23 = v22 ^ 1;
  if (!a3)
    v23 = 1;
  if ((v23 & 1) == 0)
    *a3 = 2;
  v24 = v16 | v22 | v19;
  if ((v24 & 1) != 0)
  {
    v25 = (id)gFunc_CVBufferCopyAttachment(v8, *(_QWORD *)gIIO_kCVImageBufferYCbCrMatrixKey, 0);
    if (v25)
      v26 = 0;
    else
      v26 = v22;
    if (v26 == 1)
    {
      v25 = objc_retainAutorelease(*(id *)gIIO_kCVImageBufferYCbCrMatrix_ITU_R_601_4);
      LogError("+[HDRImage getPixelType:YCCMatrixString:chromaSubsampling:componentRange:bitDepth:forBuffer:]", 898, "*** Missing YCC matrix, falling back to %s", (const char *)objc_msgSend(v25, "UTF8String"));
    }
    if (a4)
      *a4 = objc_retainAutorelease(v25);
    objc_msgSend(v14, "objectForKeyedSubscript:", *(_QWORD *)gIIO_kCVPixelFormatPlanes);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v10)
    {
      v29 = objc_msgSend(v27, "count") == 2 ? v22 : 0;
      if (v29 == 1)
      {
        objc_msgSend(v28, "objectAtIndexedSubscript:", 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "objectForKeyedSubscript:", *(_QWORD *)gIIO_kCVPixelFormatHorizontalSubsampling);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "unsignedShortValue");

        objc_msgSend(v30, "objectForKeyedSubscript:", *(_QWORD *)gIIO_kCVPixelFormatVerticalSubsampling);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "unsignedShortValue");

        v35 = vmax_u32((uint32x2_t)__PAIR64__(v34, v32), (uint32x2_t)0x100000001);
        v10[1] = v35.i16[2];
        *v10 = v35.i16[0];

      }
    }
    if (v9)
    {
      objc_msgSend(v14, "objectForKeyedSubscript:", *(_QWORD *)gIIO_kCVPixelFormatComponentRange);
      v36 = (id)objc_claimAutoreleasedReturnValue();
      if (!v36)
        v36 = *(id *)gIIO_kCVPixelFormatComponentRange_FullRange;
      v37 = objc_retainAutorelease(v36);
      *v9 = v37;

    }
    if (v40)
    {
      objc_msgSend(v14, "objectForKeyedSubscript:", *(_QWORD *)gIIO_kCVPixelFormatBitsPerComponent);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *v40 = objc_msgSend(v38, "unsignedShortValue");

    }
  }
  else
  {
    objc_msgSend(v14, "description");
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    LogError("+[HDRImage getPixelType:YCCMatrixString:chromaSubsampling:componentRange:bitDepth:forBuffer:]", 889, "*** Unsupported pixel format: %s", (const char *)objc_msgSend(v25, "UTF8String"));
  }

  return v24;
}

+ (BOOL)getInputYCCMatrix:(id *)a3 forYCCMatrixString:(id)a4
{
  id v5;
  int IntegerCodePointForString;
  __int128 v7;
  int32x4_t v8;
  int32x4_t v9;

  v5 = a4;
  IntegerCodePointForString = gFunc_CVYCbCrMatrixGetIntegerCodePointForString();
  if ((IntegerCodePointForString - 5) >= 2)
  {
    if ((IntegerCodePointForString - 9) < 2)
    {
      v7 = xmmword_18820BE10;
      v8 = (int32x4_t)xmmword_18820BE20;
      v9 = (int32x4_t)xmmword_18820BE30;
      goto LABEL_8;
    }
    if (IntegerCodePointForString == 1)
    {
      v7 = xmmword_18820BDE0;
      v8 = (int32x4_t)xmmword_18820BDF0;
      v9 = (int32x4_t)xmmword_18820BE00;
      goto LABEL_8;
    }
    LogError("+[HDRImage getInputYCCMatrix:forYCCMatrixString:]", 981, "Unrecognized YCC matrix: '%s' (%d), using 601", (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"), IntegerCodePointForString);
  }
  v7 = xmmword_18820BE40;
  v8 = (int32x4_t)xmmword_18820BE50;
  v9 = (int32x4_t)xmmword_18820BE60;
LABEL_8:
  if (a3)
  {
    *((_DWORD *)a3 + 2) = v7;
    *((_DWORD *)a3 + 6) = DWORD1(v7);
    *(_QWORD *)a3 = vzip1q_s32(v9, v8).u64[0];
    *((_QWORD *)a3 + 2) = vtrn2q_s32(v9, v8).u64[0];
    *((_DWORD *)a3 + 10) = DWORD2(v7);
    *((_QWORD *)a3 + 4) = vzip1q_s32(vdupq_laneq_s32(v9, 2), vdupq_laneq_s32(v8, 2)).u64[0];
  }

  return 1;
}

+ (BOOL)getOutputYCCMatrix:(id *)a3 forYCCMatrixString:(id)a4
{
  id v5;
  int IntegerCodePointForString;
  __int128 v7;
  int32x4_t v8;
  int32x4_t v9;

  v5 = a4;
  IntegerCodePointForString = gFunc_CVYCbCrMatrixGetIntegerCodePointForString();
  if ((IntegerCodePointForString - 5) >= 2)
  {
    if ((IntegerCodePointForString - 9) < 2)
    {
      v7 = xmmword_18820BEA0;
      v8 = (int32x4_t)xmmword_18820BEB0;
      v9 = (int32x4_t)xmmword_18820BEC0;
      goto LABEL_8;
    }
    if (IntegerCodePointForString == 1)
    {
      v7 = xmmword_18820BE70;
      v8 = (int32x4_t)xmmword_18820BE80;
      v9 = (int32x4_t)xmmword_18820BE90;
      goto LABEL_8;
    }
    LogError("+[HDRImage getOutputYCCMatrix:forYCCMatrixString:]", 1038, "Unrecognized YCC matrix: '%s' (%d), using 601", (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"), IntegerCodePointForString);
  }
  v7 = xmmword_18820BED0;
  v8 = (int32x4_t)xmmword_18820BEE0;
  v9 = (int32x4_t)xmmword_18820BEF0;
LABEL_8:
  if (a3)
  {
    *((_DWORD *)a3 + 2) = v7;
    *((_DWORD *)a3 + 6) = DWORD1(v7);
    *(_QWORD *)a3 = vzip1q_s32(v9, v8).u64[0];
    *((_QWORD *)a3 + 2) = vtrn2q_s32(v9, v8).u64[0];
    *((_DWORD *)a3 + 10) = DWORD2(v7);
    *((_QWORD *)a3 + 4) = vzip1q_s32(vdupq_laneq_s32(v9, 2), vdupq_laneq_s32(v8, 2)).u64[0];
  }

  return 1;
}

+ (BOOL)getComponentMin:(id)a1 componentMax:(SEL)a2 forPixelType:componentRange:bitDepth:
{
  __int128 *v2;
  int32x4_t *v3;
  int v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int32x4_t *v9;
  __int128 *v10;
  id v11;
  unsigned int v12;
  __int128 v13;
  int32x4_t v14;
  BOOL v15;

  v7 = v6;
  v8 = v4;
  v9 = v3;
  v10 = v2;
  v11 = v5;
  if (objc_msgSend(v11, "isEqualToString:", *(_QWORD *)gIIO_kCVPixelFormatComponentRange_FullRange))
  {
    v12 = ~(-1 << v7);
    if (v8 == 2)
    {
      v13 = xmmword_18820BF40;
      v14 = vdupq_n_s32(v12);
    }
    else
    {
      v14 = vdupq_n_s32(v12);
      v13 = 0uLL;
    }
LABEL_8:
    if (v10)
      *v10 = v13;
    if (v9)
      *v9 = v14;
    v15 = 1;
  }
  else
  {
    if (objc_msgSend(v11, "isEqualToString:", *(_QWORD *)gIIO_kCVPixelFormatComponentRange_VideoRange))
    {
      v14 = (int32x4_t)xmmword_18820BF00;
      *(_QWORD *)&v13 = 0x1000000010;
      *((_QWORD *)&v13 + 1) = 0x1000000010;
      switch(v7)
      {
        case 8:
          goto LABEL_8;
        case 10:
          v14 = (int32x4_t)xmmword_18820BF30;
          *(_QWORD *)&v13 = 0x4000000040;
          *((_QWORD *)&v13 + 1) = 0x4000000040;
          goto LABEL_8;
        case 12:
          v14 = (int32x4_t)xmmword_18820BF20;
          *(_QWORD *)&v13 = 0x10000000100;
          *((_QWORD *)&v13 + 1) = 0x10000000100;
          goto LABEL_8;
        case 16:
          v14 = (int32x4_t)xmmword_18820BF10;
          *(_QWORD *)&v13 = 0x100000001000;
          *((_QWORD *)&v13 + 1) = 0x100000001000;
          goto LABEL_8;
        default:
          LogError("+[HDRImage getComponentMin:componentMax:forPixelType:componentRange:bitDepth:]", 1086, "Unsupported bit depth: %d", v7);
          goto LABEL_14;
      }
    }
    LogError("+[HDRImage getComponentMin:componentMax:forPixelType:componentRange:bitDepth:]", 1091, "Unsupported component range: %s", (const char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String"));
LABEL_14:
    v15 = 0;
  }

  return v15;
}

+ (BOOL)getInputPixelRange:(id *)a3 forPixelType:(int)a4 componentRange:(id)a5 bitDepth:(unsigned __int16)a6
{
  char v6;
  int v9;
  int32x4_t v10;
  int32x4_t v11;
  int8x16_t v12;
  float32x4_t v13;
  float32x4_t v19;
  float32x4_t v20;
  uint32x4_t v22;
  uint32x4_t v23;

  v6 = a6;
  v23.i32[2] = 0;
  v23.i64[0] = 0;
  v22.i32[2] = 0;
  v22.i64[0] = 0;
  v9 = objc_msgSend(a1, "getComponentMin:componentMax:forPixelType:componentRange:bitDepth:", &v23, &v22, *(_QWORD *)&a4, a5, a6);
  if (a3 && v9)
  {
    v10.i32[0] = 2;
    v11.i32[0] = a4;
    v12 = (int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vceqq_s32(v11, v10), 0);
    v13 = (float32x4_t)vbslq_s8(v12, (int8x16_t)xmmword_18820BF50, (int8x16_t)0);
    __asm { FMOV            V3.4S, #1.0 }
    v19 = vmlaq_f32(vmulq_f32(vnegq_f32((float32x4_t)vbslq_s8(v12, (int8x16_t)xmmword_18820BF60, _Q3)), vcvtq_f32_u32(v23)), vcvtq_f32_u32(v22), v13);
    v13.f32[0] = (float)~(-1 << v6);
    v20 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v13.f32, 0);
    *(float32x4_t *)a3 = vdivq_f32(v20, vcvtq_f32_u32((uint32x4_t)vsubq_s32((int32x4_t)v22, (int32x4_t)v23)));
    *((float32x4_t *)a3 + 1) = vdivq_f32(v19, v20);
  }
  return v9;
}

+ (BOOL)getOutputPixelRange:(id *)a3 forPixelType:(int)a4 componentRange:(id)a5 bitDepth:(unsigned __int16)a6
{
  char v6;
  int v9;
  int32x4_t v10;
  int32x4_t v11;
  int8x16_t v12;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  uint32x4_t v22;
  uint32x4_t v23;

  v6 = a6;
  v23.i32[2] = 0;
  v23.i64[0] = 0;
  v22.i32[2] = 0;
  v22.i64[0] = 0;
  v9 = objc_msgSend(a1, "getComponentMin:componentMax:forPixelType:componentRange:bitDepth:", &v23, &v22, *(_QWORD *)&a4, a5, a6);
  if (a3 && v9)
  {
    v10.i32[0] = 2;
    v11.i32[0] = a4;
    v12 = (int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vceqq_s32(v11, v10), 0);
    __asm { FMOV            V2.4S, #1.0 }
    v18 = (float32x4_t)vbslq_s8(v12, (int8x16_t)xmmword_18820BF60, _Q2);
    v19 = vmlaq_f32(vmulq_f32(vnegq_f32((float32x4_t)vbslq_s8(v12, (int8x16_t)xmmword_18820BF50, (int8x16_t)0)), vcvtq_f32_u32(v22)), vcvtq_f32_u32(v23), v18);
    v18.f32[0] = (float)~(-1 << v6);
    v20 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v18.f32, 0);
    *(float32x4_t *)a3 = vdivq_f32(vcvtq_f32_u32((uint32x4_t)vsubq_s32((int32x4_t)v22, (int32x4_t)v23)), v20);
    *((float32x4_t *)a3 + 1) = vdivq_f32(v19, v20);
  }
  return v9;
}

+ (BOOL)getInputPixelType:(int *)a3 range:(id *)a4 YCCMatrix:(id *)a5 forBuffer:(__CVBuffer *)a6
{
  int v10;
  id v11;
  id v12;
  int v13;
  char v14;
  int v15;
  id v17;
  id v18;
  unsigned __int16 v19;
  unsigned int v20;

  v20 = 0;
  v19 = 0;
  v17 = 0;
  v18 = 0;
  v10 = objc_msgSend(a1, "getPixelType:YCCMatrixString:chromaSubsampling:componentRange:bitDepth:forBuffer:", &v20, &v18, 0, &v17, &v19, a6);
  v11 = v18;
  v12 = v17;
  if (v10)
  {
    v13 = objc_msgSend(a1, "getInputPixelRange:forPixelType:componentRange:bitDepth:", a4, v20, v12, v19);
    v14 = v13;
    if (v20 == 2)
      v15 = v13;
    else
      v15 = 0;
    if (v15 == 1)
      v14 = objc_msgSend(a1, "getInputYCCMatrix:forYCCMatrixString:", a5, v11);
  }
  else
  {
    v14 = 0;
  }
  if (a3)
    *a3 = v20;

  return v14;
}

+ (BOOL)getOutputPixelType:(id)a1 range:(SEL)a2 YCCMatrix:(int *)a3 chromaSubsampling:(id *)a4 forBuffer:(id *)a5
{
  uint64_t v5;
  uint64_t v6;
  int v11;
  id v12;
  id v13;
  int v14;
  char v15;
  int v16;
  id v18;
  id v19;
  unsigned __int16 v20;
  unsigned int v21;

  v21 = 0;
  v20 = 0;
  v18 = 0;
  v19 = 0;
  v11 = objc_msgSend(a1, "getPixelType:YCCMatrixString:chromaSubsampling:componentRange:bitDepth:forBuffer:", &v21, &v19, v5, &v18, &v20, v6);
  v12 = v19;
  v13 = v18;
  if (v11)
  {
    v14 = objc_msgSend(a1, "getOutputPixelRange:forPixelType:componentRange:bitDepth:", a4, v21, v13, v20);
    v15 = v14;
    if (v21 == 2)
      v16 = v14;
    else
      v16 = 0;
    if (v16 == 1)
      v15 = objc_msgSend(a1, "getOutputYCCMatrix:forYCCMatrixString:", a5, v12);
  }
  else
  {
    v15 = 0;
  }
  if (a3)
    *a3 = v21;

  return v15;
}

+ (BOOL)getColorTRC:(id *)a3 matrix:(id *)a4 toneMapping:(id *)a5 fromSourceSpace:(CGColorSpace *)a6 toEDR:(float)a7 toneMappingMode:(int)a8
{
  CFStringRef *v15;
  CGColorSpaceRef v16;
  double v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  char v31;
  const __CFString *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  _QWORD v37[2];
  _QWORD v38[2];
  uint64_t v39;
  void *v40;
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[2];
  _QWORD v44[2];
  uint64_t v45;
  void *v46;
  _QWORD v47[2];
  _QWORD v48[3];

  v48[2] = *MEMORY[0x1E0C80C00];
  v15 = (CFStringRef *)MEMORY[0x1E0C9D958];
  if (a7 <= 1.0)
    v15 = (CFStringRef *)MEMORY[0x1E0C9DA00];
  v16 = CGColorSpaceCreateWithName(*v15);
  switch(a8)
  {
    case 0:
      v33 = CFSTR("kCGHDRMediaReferenceWhite");
      v34 = &unk_1E1BDC498;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
    case 2:
      v43[0] = CFSTR("kCGHDRMediaReferenceWhite");
      v43[1] = CFSTR("kCGApplyToneMappingForBT2100");
      v44[0] = &unk_1E1BDC488;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a7 == 1.0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v44[1] = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 2);
      v19 = objc_claimAutoreleasedReturnValue();

      v20 = (void *)v19;
      break;
    case 3:
      v48[0] = &unk_1E1BDC488;
      v21 = *MEMORY[0x1E0C9DAD0];
      v47[0] = CFSTR("kCGHDRMediaReferenceWhite");
      v47[1] = v21;
      v45 = *MEMORY[0x1E0C9D8C0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a7 == 1.0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v22;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v48[1] = v23;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 2);
      v24 = objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    case 4:
      v42[0] = &unk_1E1BDC488;
      v25 = *MEMORY[0x1E0C9D8D0];
      v41[0] = CFSTR("kCGHDRMediaReferenceWhite");
      v41[1] = v25;
      v39 = *MEMORY[0x1E0C9DBF8];
      *(float *)&v17 = a7;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v17);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v26;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v42[1] = v27;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 2);
      v24 = objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    case 5:
      v38[0] = &unk_1E1BDC498;
      v28 = *MEMORY[0x1E0C9D8C8];
      v37[0] = CFSTR("kCGHDRMediaReferenceWhite");
      v37[1] = v28;
      v35 = *MEMORY[0x1E0C9DA78];
      *(float *)&v17 = a7;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v17);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v29;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v38[1] = v30;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
      v24 = objc_claimAutoreleasedReturnValue();

LABEL_10:
      v20 = (void *)v24;
      break;
    default:
      v20 = 0;
      break;
  }
  v31 = objc_msgSend(a1, "getColorTRC:matrix:toneMapping:fromSourceSpace:toTargetSpace:options:", a3, a4, a5, a6, v16, v20);
  CFRelease(v16);

  return v31;
}

+ (BOOL)getColorTRC:(id *)a3 matrix:(id *)a4 toneMapping:(id *)a5 fromEDR:(float)a6 toTargetSpace:(CGColorSpace *)a7
{
  CFStringRef *v12;
  CGColorSpaceRef v13;
  char v14;

  v12 = (CFStringRef *)MEMORY[0x1E0C9D958];
  if (a6 <= 1.0)
    v12 = (CFStringRef *)MEMORY[0x1E0C9DA00];
  v13 = CGColorSpaceCreateWithName(*v12);
  v14 = objc_msgSend(a1, "getColorTRC:matrix:toneMapping:fromSourceSpace:toTargetSpace:options:", a3, a4, a5, v13, a7, &unk_1E1BDC4C8);
  CFRelease(v13);
  return v14;
}

+ (BOOL)getColorTRC:(id *)a3 matrix:(id *)a4 toneMapping:(id *)a5 fromSourceSpace:(CGColorSpace *)a6 toTargetSpace:(CGColorSpace *)a7 options:(id)a8
{
  const __CFDictionary *v13;
  __int128 *v14;
  __int128 v15;
  __int128 v16;
  id v17;
  __int128 v18;
  __int128 v19;
  CGColorConversionInfoRef v20;
  uint64_t *v21;
  int v22;
  id v23;
  const char *v24;
  int32x2_t *v25;
  __int128 v26;
  char v27;
  int32x4_t *v28;
  int32x4_t v29;
  int32x4_t v30;
  int32x4_t v31;
  __int128 v32;
  __int128 v33;
  int32x2_t *v34;
  __int128 v35;
  float *v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  uint64_t v44;
  int32x4_t v45;
  int32x4_t v46;
  int32x4_t v47;
  uint64_t v48;
  __int128 v49;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  __n128 (*v54)(uint64_t, uint64_t);
  uint64_t (*v55)();
  const char *v56;
  __int128 v57;
  __int128 v58;
  int v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  char v63;
  uint64_t v64;
  float *v65;
  uint64_t v66;
  __n128 (*v67)(uint64_t, uint64_t);
  uint64_t (*v68)();
  const char *v69;
  __int128 v70;
  __int128 v71;
  int v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  char v76;
  uint64_t v77;
  int32x4_t *v78;
  uint64_t v79;
  __n128 (*v80)(uint64_t, uint64_t);
  uint64_t (*v81)();
  const char *v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  char v89;
  uint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  __n128 (*v93)(uint64_t, uint64_t);
  uint64_t (*v94)();
  const char *v95;
  __int128 v96;
  __int128 v97;
  int v98;
  uint64_t v99;
  uint64_t *v100;
  uint64_t v101;
  char v102;
  uint64_t v103;
  int32x4_t *v104;
  uint64_t v105;
  __n128 (*v106)(uint64_t, uint64_t);
  uint64_t (*v107)();
  const char *v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  uint64_t v112;
  uint64_t *v113;
  uint64_t v114;
  char v115;
  uint64_t v116;
  uint64_t *v117;
  uint64_t v118;
  __n128 (*v119)(uint64_t, uint64_t);
  uint64_t (*v120)();
  const char *v121;
  __int128 v122;
  __int128 v123;
  int v124;
  uint64_t v125;
  uint64_t *v126;
  uint64_t v127;
  char v128;

  v13 = (const __CFDictionary *)a8;
  if (!CGColorSpaceEqualToColorSpace())
  {
    v20 = CGColorConversionInfoCreateWithOptions(a6, a7, v13);
    if (!v20)
    {
      -[CGColorSpace description](a6, "description");
      v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v24 = (const char *)objc_msgSend(v23, "UTF8String");
      -[CGColorSpace description](a7, "description");
      v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      LogError("+[HDRImage getColorTRC:matrix:toneMapping:fromSourceSpace:toTargetSpace:options:]", 1293, "Failed to create color converter from: %s to: %s", v24, (const char *)objc_msgSend(v17, "UTF8String"));

      LOBYTE(v17) = 0;
      goto LABEL_46;
    }
    v125 = 0;
    v126 = &v125;
    v127 = 0x2020000000;
    v128 = 0;
    v116 = 0;
    v117 = &v116;
    v118 = 0x5812000000;
    v119 = __Block_byref_object_copy_;
    v120 = __Block_byref_object_dispose_;
    v121 = "";
    v122 = 0u;
    v123 = 0u;
    v124 = 0;
    v112 = 0;
    v113 = &v112;
    v114 = 0x2020000000;
    v115 = 0;
    v103 = 0;
    v104 = (int32x4_t *)&v103;
    v105 = 0x6012000000;
    v106 = __Block_byref_object_copy__55;
    v107 = __Block_byref_object_dispose__56;
    v108 = "";
    v109 = 0u;
    v110 = 0u;
    v111 = 0u;
    v99 = 0;
    v100 = &v99;
    v101 = 0x2020000000;
    v102 = 0;
    v90 = 0;
    v91 = &v90;
    v92 = 0x5812000000;
    v93 = __Block_byref_object_copy__58;
    v94 = __Block_byref_object_dispose__59;
    v95 = "";
    v96 = 0u;
    v97 = 0u;
    v98 = 0;
    v86 = 0;
    v87 = &v86;
    v88 = 0x2020000000;
    v89 = 0;
    v77 = 0;
    v78 = (int32x4_t *)&v77;
    v79 = 0x6012000000;
    v80 = __Block_byref_object_copy__55;
    v81 = __Block_byref_object_dispose__56;
    v82 = "";
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v73 = 0;
    v74 = &v73;
    v75 = 0x2020000000;
    v76 = 0;
    v64 = 0;
    v65 = (float *)&v64;
    v66 = 0x5812000000;
    v67 = __Block_byref_object_copy_;
    v68 = __Block_byref_object_dispose_;
    v69 = "";
    v70 = 0u;
    v71 = 0u;
    v72 = 0;
    v60 = 0;
    v61 = &v60;
    v62 = 0x2020000000;
    v63 = 0;
    v51 = 0;
    v52 = &v51;
    v53 = 0x5812000000;
    v54 = __Block_byref_object_copy__58;
    v55 = __Block_byref_object_dispose__59;
    v56 = "";
    v57 = 0u;
    v58 = 0u;
    v59 = 0;
    LODWORD(v17) = CGColorConversionInfoIterateFunctionsWithCallbacks();
    if (!(_DWORD)v17)
    {
LABEL_45:
      CFRelease(v20);
      _Block_object_dispose(&v51, 8);
      _Block_object_dispose(&v60, 8);
      _Block_object_dispose(&v64, 8);
      _Block_object_dispose(&v73, 8);
      _Block_object_dispose(&v77, 8);
      _Block_object_dispose(&v86, 8);
      _Block_object_dispose(&v90, 8);
      _Block_object_dispose(&v99, 8);
      _Block_object_dispose(&v103, 8);
      _Block_object_dispose(&v112, 8);
      _Block_object_dispose(&v116, 8);
      _Block_object_dispose(&v125, 8);
      goto LABEL_46;
    }
    if (*((_BYTE *)v126 + 24))
    {
      v21 = v117;
      switch(*((_DWORD *)v117 + 12))
      {
        case 0:
          v22 = 1;
          goto LABEL_20;
        case 1:
          v22 = 2;
          goto LABEL_20;
        case 2:
          v22 = 3;
          goto LABEL_20;
        case 3:
          v22 = 4;
          goto LABEL_20;
        case 4:
          v22 = 5;
          goto LABEL_20;
        case 5:
          a3->var0 = 6;
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", *(uint64_t *)((char *)v21 + 60), 4 * *(uint64_t *)((char *)v21 + 52));
          *(_QWORD *)&a3[1].var1.var3 = objc_claimAutoreleasedReturnValue();
          v21 = v117;
          break;
        case 6:
          v22 = 7;
          goto LABEL_20;
        case 7:
          v22 = 8;
          goto LABEL_20;
        case 8:
          v22 = 10;
          goto LABEL_20;
        case 9:
          v22 = 9;
LABEL_20:
          a3->var0 = v22;
          break;
        default:
          a3->var0 = 0;
          break;
      }
      a3->var1.var3 = *((float *)v21 + 14);
      a3->var1.var4 = *((float *)v21 + 15);
      a3->var1.var5 = *((float *)v21 + 16);
      a3->var1.var6 = *((float *)v21 + 17);
      a3->var1.var7 = *((float *)v21 + 18);
      *((_DWORD *)&a3->var1 + 8) = *((_DWORD *)v21 + 19);
      LODWORD(a3->var2) = *((_DWORD *)v21 + 20);
      HIDWORD(a3->var2) = *((_DWORD *)v21 + 13);
    }
    else
    {
      a3->var0 = 0;
    }
    if (*((_BYTE *)v61 + 24))
    {
      v25 = *(int32x2_t **)((char *)v52 + 76);
      a3->var0 = 11;
      v26 = *(_OWORD *)&a3[1].var0;
      LODWORD(v26) = v25[1].i32[0];
      a3[1].var0 = v26;
      DWORD1(v26) = v25[1].i32[1];
      *(_OWORD *)&a3[1].var0 = v26;
      DWORD2(v26) = v25[2].i32[0];
      *(_OWORD *)&a3[1].var0 = v26;
      HIDWORD(v26) = v25[2].i32[1];
      *(_OWORD *)&a3[1].var0 = v26;
      a3->var2 = (void *)vrev64_s32(*v25);
    }
    if (*((_BYTE *)v87 + 24))
    {
      v27 = 0;
      v28 = v78;
    }
    else
    {
      if (!*((_BYTE *)v113 + 24) || (v27 = *((_BYTE *)v100 + 24)) != 0)
      {
        v32 = *MEMORY[0x1E0C83FE8];
        v33 = *(_OWORD *)(MEMORY[0x1E0C83FE8] + 32);
        *(_OWORD *)&a4[16].var1 = *(_OWORD *)(MEMORY[0x1E0C83FE8] + 16);
        *(_OWORD *)&a4[32].var1 = v33;
        *(_OWORD *)&a4->var1 = v32;
        v27 = 1;
LABEL_30:
        a4[48].var1 = v27;
        if (*((_BYTE *)v100 + 24))
        {
          switch(*((_DWORD *)v91 + 12))
          {
            case 7:
              v34 = *(int32x2_t **)((char *)v91 + 76);
              a5->var0 = 2;
              v35 = *(_OWORD *)&a5->var3.var1;
              LODWORD(v35) = v34[1].i32[0];
              *(_DWORD *)&a5->var3.var1 = v35;
              DWORD1(v35) = v34[1].i32[1];
              *(_OWORD *)&a5->var3.var1 = v35;
              DWORD2(v35) = v34[2].i32[0];
              *(_OWORD *)&a5->var3.var1 = v35;
              HIDWORD(v35) = v34[2].i32[1];
              *(_OWORD *)&a5->var3.var1 = v35;
              a5->var2 = (void *)vrev64_s32(*v34);
              break;
            case 9:
              v40 = *(uint64_t *)((char *)v91 + 76);
              a5->var0 = 1;
              *(_OWORD *)&a5->var1.var3 = *(_OWORD *)(v40 + 20);
              *(_QWORD *)&a5->var1.var7 = *(_QWORD *)(v40 + 36);
              LODWORD(a5->var2) = *(_DWORD *)(v40 + 44);
              v41 = *(_OWORD *)&a5->var3.var1;
              LODWORD(v42) = *(_DWORD *)(v40 + 56);
              *(_DWORD *)&a5->var3.var1 = v42;
              DWORD1(v42) = *(_DWORD *)(v40 + 60);
              *(_OWORD *)&a5->var3.var1 = v42;
              DWORD2(v42) = *(_DWORD *)(v40 + 64);
              *(_OWORD *)&a5->var3.var1 = v42;
              HIDWORD(v42) = *(_DWORD *)(v40 + 68);
              goto LABEL_39;
            case 0xA:
              v43 = *(uint64_t *)((char *)v91 + 76);
              a5->var0 = 4;
              *(_OWORD *)&a5->var1.var3 = *(_OWORD *)(v43 + 20);
              a5->var1.var7 = *(float *)(v43 + 36);
              *((_DWORD *)&a5->var1 + 8) = *(_DWORD *)v43;
              LODWORD(a5->var2) = *(_DWORD *)(v43 + 16);
              v42 = *(_OWORD *)&a5->var3.var1;
              LODWORD(v42) = *(_DWORD *)(v43 + 4);
              *(_DWORD *)&a5->var3.var1 = v42;
              DWORD1(v42) = *(_DWORD *)(v43 + 8);
              *(_OWORD *)&a5->var3.var1 = v42;
              DWORD2(v42) = *(_DWORD *)(v43 + 12);
LABEL_39:
              *(_OWORD *)&a5->var3.var1 = v42;
              break;
            case 0xB:
              v44 = *(uint64_t *)((char *)v91 + 76);
              a5->var0 = 5;
              objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v44 + 36, 4 * *(_QWORD *)(v44 + 28));
              *(_QWORD *)&a5[1].var1.var1 = objc_claimAutoreleasedReturnValue();
              *(_OWORD *)&a5->var3.var1 = *(_OWORD *)(v44 + 8);
              LODWORD(a5->var2) = *(_DWORD *)(v44 + 24);
              break;
            default:
              LogError("+[HDRImage getColorTRC:matrix:toneMapping:fromSourceSpace:toTargetSpace:options:]", 1536, "Unsupported tone mapping transform format: %ld, unsupported!", *((unsigned int *)v91 + 12));
              a5->var0 = 0;
              break;
          }
          if (*((_BYTE *)v113 + 24))
          {
            LOBYTE(a5[2].var1.var3) = 0;
            v45 = v104[3];
            v46 = v104[4];
            v47 = v104[5];
            LODWORD(a5[1].var1.var7) = v47.i32[0];
            *(_DWORD *)&a5[1].var3.var1 = v47.i32[1];
            *(_QWORD *)&a5[1].var1.var5 = vzip1q_s32(v45, v46).u64[0];
            a5[1].var2 = (void *)vtrn2q_s32(v45, v46).u64[0];
            LODWORD(a5[2].var1.var1) = v47.i32[2];
            *(_QWORD *)&a5[2].var0 = vzip1q_s32(vdupq_laneq_s32(v45, 2), vdupq_laneq_s32(v46, 2)).u64[0];
          }
          else
          {
            LOBYTE(a5[2].var1.var3) = 1;
            v48 = MEMORY[0x1E0C83FE8];
            v49 = *(_OWORD *)(MEMORY[0x1E0C83FE8] + 16);
            *(_OWORD *)&a5[1].var1.var5 = *MEMORY[0x1E0C83FE8];
            *(_OWORD *)&a5[1].var2 = v49;
            *(_OWORD *)&a5[2].var0 = *(_OWORD *)(v48 + 32);
          }
        }
        else
        {
          if (*((_BYTE *)v74 + 24))
          {
            a5->var0 = 3;
            v36 = v65;
            a5->var1.var3 = v65[14];
            a5->var1.var4 = v36[15];
            a5->var1.var5 = v36[16];
            a5->var1.var6 = v36[17];
            a5->var1.var7 = v36[18];
            *((float *)&a5->var1 + 8) = v36[19];
            LOBYTE(a5[2].var1.var3) = 1;
            v37 = MEMORY[0x1E0C83FE8];
            v38 = *(_OWORD *)(MEMORY[0x1E0C83FE8] + 16);
            *(_OWORD *)&a5[1].var1.var5 = *MEMORY[0x1E0C83FE8];
            *(_OWORD *)&a5[1].var2 = v38;
          }
          else
          {
            a5->var0 = 0;
            LOBYTE(a5[2].var1.var3) = 1;
            v37 = MEMORY[0x1E0C83FE8];
            v39 = *(_OWORD *)(MEMORY[0x1E0C83FE8] + 16);
            *(_OWORD *)&a5[1].var1.var5 = *MEMORY[0x1E0C83FE8];
            *(_OWORD *)&a5[1].var2 = v39;
          }
          *(_OWORD *)&a5[2].var0 = *(_OWORD *)(v37 + 32);
        }
        goto LABEL_45;
      }
      v28 = v104;
    }
    v29 = v28[3];
    v30 = v28[4];
    v31 = v28[5];
    *(_DWORD *)&a4[24].var1 = v31.i32[1];
    *(_DWORD *)&a4[40].var1 = v31.i32[2];
    *(_DWORD *)&a4[8].var1 = v31.i32[0];
    *(_QWORD *)&a4->var1 = vzip1q_s32(v29, v30).u64[0];
    *(_QWORD *)&a4[16].var1 = vtrn2q_s32(v29, v30).u64[0];
    *(_QWORD *)&a4[32].var1 = vzip1q_s32(vdupq_laneq_s32(v29, 2), vdupq_laneq_s32(v30, 2)).u64[0];
    goto LABEL_30;
  }
  a3->var0 = 0;
  v14 = (__int128 *)MEMORY[0x1E0C83FE8];
  v15 = *MEMORY[0x1E0C83FE8];
  v16 = *(_OWORD *)(MEMORY[0x1E0C83FE8] + 32);
  *(_OWORD *)&a4[16].var1 = *(_OWORD *)(MEMORY[0x1E0C83FE8] + 16);
  *(_OWORD *)&a4[32].var1 = v16;
  *(_OWORD *)&a4->var1 = v15;
  LOBYTE(v17) = 1;
  a4[48].var1 = 1;
  a5->var0 = 0;
  LOBYTE(a5[2].var1.var3) = 1;
  v18 = v14[2];
  v19 = *v14;
  *(_OWORD *)&a5[1].var2 = v14[1];
  *(_OWORD *)&a5[2].var0 = v18;
  *(_OWORD *)&a5[1].var1.var5 = v19;
LABEL_46:

  return (char)v17;
}

uint64_t __81__HDRImage_getColorTRC_matrix_toneMapping_fromSourceSpace_toTargetSpace_options___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  id v9;
  uint64_t result;
  uint64_t v11;

  if ((gIIODebugFlags & 0x300000) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a2 + 52) + 8 * *a5), "description");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    ImageIOLog("CGColorConversion TRC: %ld [%d] %s", a3, a4, (const char *)objc_msgSend(v9, "UTF8String"));

  }
  if (a4 != 1 && (a4 != 3 || *a5 != a5[1] || *a5 != a5[2]))
  {
    LogError("+[HDRImage getColorTRC:matrix:toneMapping:fromSourceSpace:toTargetSpace:options:]_block_invoke", 1335, "Unsupported TRC configuration");
    return 0;
  }
  if (CGColorTRCGetGammaID() == 7)
    return 1;
  CGColorTRCGetFunction();
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    LogError("+[HDRImage getColorTRC:matrix:toneMapping:fromSourceSpace:toTargetSpace:options:]_block_invoke", 1328, "Already have TRC stage!");
    return 0;
  }
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  *(_OWORD *)(v11 + 48) = 0u;
  *(_OWORD *)(v11 + 64) = 0u;
  *(_DWORD *)(v11 + 80) = 0;
  result = 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  return result;
}

uint64_t __81__HDRImage_getColorTRC_matrix_toneMapping_fromSourceSpace_toTargetSpace_options___block_invoke_2(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7;
  uint64_t result;
  _OWORD *v9;
  uint64_t v10;
  _OWORD *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  if ((gIIODebugFlags & 0x300000) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a2 + 60) + 8 * a4), "description");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    ImageIOLog("CGColorConversion matrix: %ld/%ld %s", a3, a4, (const char *)objc_msgSend(v7, "UTF8String"));

  }
  if (*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
    {
      LogError("+[HDRImage getColorTRC:matrix:toneMapping:fromSourceSpace:toTargetSpace:options:]_block_invoke_2", 1344, "Already have TM color matrix stage!");
      return 0;
    }
    CGColorMatrixGetMatrix();
    v9 = *(_OWORD **)(a1[6] + 8);
    v9[3] = v12;
    v9[4] = v13;
    v9[5] = v14;
    v10 = a1[5];
  }
  else
  {
    if (*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
    {
      LogError("+[HDRImage getColorTRC:matrix:toneMapping:fromSourceSpace:toTargetSpace:options:]_block_invoke_2", 1352, "Already have color matrix stage!");
      return 0;
    }
    CGColorMatrixGetMatrix();
    v11 = *(_OWORD **)(a1[8] + 8);
    v11[3] = v12;
    v11[4] = v13;
    v11[5] = v14;
    v10 = a1[7];
  }
  result = 1;
  *(_BYTE *)(*(_QWORD *)(v10 + 8) + 24) = 1;
  return result;
}

uint64_t __81__HDRImage_getColorTRC_matrix_toneMapping_fromSourceSpace_toTargetSpace_options___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v6;

  if ((gIIODebugFlags & 0x300000) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a2 + 68) + 8 * a4), "description");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    ImageIOLog("CGColorConversion NxM: %ld %s", a3, (const char *)objc_msgSend(v6, "UTF8String"));

  }
  CGColorNxMTransformGetTransform();
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    LogError("+[HDRImage getColorTRC:matrix:toneMapping:fromSourceSpace:toTargetSpace:options:]_block_invoke_3", 1363, "Already have color NxM transform stage!");
  else
    LogError("+[HDRImage getColorTRC:matrix:toneMapping:fromSourceSpace:toTargetSpace:options:]_block_invoke_3", 1384, "CGColorConversion NxM: %ld/%ld, unsupported!");
  return 0;
}

+ (BOOL)supportsSourceColorSpace:(CGColorSpace *)a3
{
  _OWORD v4[9];
  _OWORD v5[4];
  _OWORD v6[5];

  memset(v6, 0, sizeof(v6));
  memset(v5, 0, sizeof(v5));
  memset(v4, 0, sizeof(v4));
  return objc_msgSend(a1, "getColorTRC:matrix:toneMapping:fromSourceSpace:toEDR:toneMappingMode:", v6, v5, v4, a3, 0, COERCE_DOUBLE((unint64_t)COERCE_UNSIGNED_INT(1.0)));
}

+ (BOOL)supportsTargetColorSpace:(CGColorSpace *)a3
{
  _OWORD v4[9];
  _OWORD v5[4];
  _OWORD v6[5];

  memset(v6, 0, sizeof(v6));
  memset(v5, 0, sizeof(v5));
  memset(v4, 0, sizeof(v4));
  return objc_msgSend(a1, "getColorTRC:matrix:toneMapping:fromEDR:toTargetSpace:", v6, v5, v4, a3, COERCE_DOUBLE((unint64_t)COERCE_UNSIGNED_INT(1.0)));
}

- (BOOL)getInputColorTransform:(id *)a3 toEDR:(float)a4
{
  NSDictionary *flexGTCInfo;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  NSDictionary *v12;
  void *v13;
  int v14;
  CGColorSpace *v15;
  CGColorSpace *v16;
  CGColorSpaceRef ExtendedLinearized;
  CGColorSpace *v18;
  uint64_t v19;
  double v20;
  id v22;
  id v23;
  char v24;
  float v25;
  float headroom;
  float v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  _OWORD v33[5];
  _OWORD v34[9];
  uint64_t v35;

  flexGTCInfo = self->_flexGTCInfo;
  v8 = (void *)objc_opt_class();
  v9 = v8;
  if (!flexGTCInfo)
  {
    v18 = -[HDRImage colorSpace](self, "colorSpace");
    v19 = -[HDRImage toneMappingMode](self, "toneMappingMode");
    *(float *)&v20 = a4;
    return objc_msgSend(v9, "getColorTRC:matrix:toneMapping:fromSourceSpace:toEDR:toneMappingMode:", a3, &a3[2], &a3->var1.var1.var7, v18, v19, v20);
  }
  objc_msgSend(v8, "curveDataFromFlexGTCInfo:", self->_flexGTCInfo);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v35 = 0;
    v11 = objc_msgSend((id)objc_opt_class(), "getGainMapMin:max:fromFlexGTCInfo:", (char *)&v35 + 4, &v35, self->_flexGTCInfo);
    v12 = self->_flexGTCInfo;
    if ((v11 & 1) != 0)
    {
      -[NSDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", *MEMORY[0x1E0C955B0]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "unsignedIntValue");

      if (!v14)
      {
        ExtendedLinearized = CGColorSpaceCreateExtendedLinearized(-[HDRImage colorSpace](self, "colorSpace"));
        goto LABEL_13;
      }
      v15 = (CGColorSpace *)CGColorSpaceCreateFromCICP();
      v16 = v15;
      if (v15)
      {
        ExtendedLinearized = CGColorSpaceCreateExtendedLinearized(v15);
        CFRelease(v16);
LABEL_13:
        memset(v34, 0, sizeof(v34));
        if (objc_msgSend((id)objc_opt_class(), "getColorTRC:matrix:toneMapping:fromSourceSpace:toTargetSpace:options:", a3, &a3[1].var1, v34, -[HDRImage colorSpace](self, "colorSpace"), ExtendedLinearized, &unk_1E1BDC4F0))
        {
          LODWORD(a3->var1.var1.var7) = 5;
          v25 = log2f(a4);
          headroom = self->_headroom;
          v27 = 1.0 - (float)(v25 / log2f(headroom));
          *(float *)&v28 = *((float *)&v35 + 1) * v27;
          *(float *)&v29 = *(float *)&v35 * v27;
          +[HDRImageConverter flexGTCTableDataFromCurveArray:min:max:](HDRImageConverter, "flexGTCTableDataFromCurveArray:min:max:", v10, v28, v29);
          *(_QWORD *)&a3[1].var0.var1.var7 = objc_claimAutoreleasedReturnValue();
          v30 = self->_headroom;
          *(float *)&v30 = v30;
          *(float32x4_t *)&a3[1].var0.var1.var3 = vdivq_f32((float32x4_t)xmmword_18820BF70, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v30, 0));
          *(float *)&v30 = 1.0 / self->_headroom;
          a3[1].var0.var1.var0 = *(float *)&v30;
          a3[1].var0.var1.var1 = 1.0;
          memset(v33, 0, sizeof(v33));
          v31 = (void *)objc_opt_class();
          *(float *)&v32 = a4;
          v24 = objc_msgSend(v31, "getColorTRC:matrix:toneMapping:fromSourceSpace:toEDR:toneMappingMode:", v33, &a3[2], v34, ExtendedLinearized, 0, v32);
        }
        else
        {
          v24 = 0;
        }
        CFRelease(ExtendedLinearized);

        return v24;
      }
      LogError("-[HDRImage getInputColorTransform:toEDR:]", 1612, "Failed to create color space from CICP tag: '%u'", v14);
    }
    else
    {
      -[NSDictionary description](v12, "description");
      v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      LogError("-[HDRImage getInputColorTransform:toEDR:]", 1602, "Failed to extract FlexGTC gainMap info: '%s'", (const char *)objc_msgSend(v23, "UTF8String"));

    }
  }
  else
  {
    -[NSDictionary description](self->_flexGTCInfo, "description");
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    LogError("-[HDRImage getInputColorTransform:toEDR:]", 1596, "Failed to extract FlexGTC curve data: '%s'", (const char *)objc_msgSend(v22, "UTF8String"));

  }
  return 0;
}

- (BOOL)getOutputColorTransform:(id *)a3 fromEDR:(float)a4
{
  void *v7;
  CGColorSpace *v8;
  double v9;

  v7 = (void *)objc_opt_class();
  v8 = -[HDRImage colorSpace](self, "colorSpace");
  *(float *)&v9 = a4;
  return objc_msgSend(v7, "getColorTRC:matrix:toneMapping:fromEDR:toTargetSpace:", &a3[1].var2.var1.var7, a3, &a3->var2, v8, v9);
}

- (BOOL)getInputImagePixelTransform:(id *)a3
{
  int v5;
  BOOL v6;
  __int128 v7;
  __int128 v8;
  float32x2_t v9;
  float32x2_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  int v17;
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;

  v17 = 0;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v12 = 0u;
  v5 = objc_msgSend((id)objc_opt_class(), "getInputPixelType:range:YCCMatrix:forBuffer:", &v17, &v15, &v12, -[HDRImage imageBuffer](self, "imageBuffer"));
  v6 = v5;
  if (a3 && v5)
  {
    a3->var0 = v17;
    v7 = v16;
    *(_OWORD *)&a3[4].var0 = v15;
    *(_OWORD *)&a3[8].var0 = v7;
    v8 = v13;
    *(_OWORD *)&a3[12].var0 = v12;
    *(_OWORD *)&a3[16].var0 = v8;
    *(_OWORD *)&a3[20].var0 = v14;
    -[HDRImage orientation](self, "orientation");
    v19 = 0u;
    v20 = 0u;
    v18 = 0u;
    CGImageGetTransformForOrientationAndSize();
    v9 = vcvt_f32_f64(v19);
    v10 = vcvt_f32_f64(v20);
    *(float32x2_t *)&a3[24].var0 = vcvt_f32_f64(v18);
    *(float32x2_t *)&a3[26].var0 = v9;
    *(float32x2_t *)&a3[28].var0 = v10;
  }
  return v6;
}

- (BOOL)getOutputImagePixelTransform:(id *)a3
{
  int v4;
  __int128 v5;
  __int128 v6;
  int v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  int v14;

  v14 = 0;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v9 = 0u;
  v8 = 0;
  v4 = objc_msgSend((id)objc_opt_class(), "getOutputPixelType:range:YCCMatrix:chromaSubsampling:forBuffer:", &v14, &v12, &v9, &v8, -[HDRImage imageBuffer](self, "imageBuffer"));
  if (a3 && v4)
  {
    a3->var0 = v14;
    v5 = v13;
    *(_OWORD *)&a3[4].var0 = v12;
    *(_OWORD *)&a3[8].var0 = v5;
    v6 = v10;
    *(_OWORD *)&a3[12].var0 = v9;
    *(_OWORD *)&a3[16].var0 = v6;
    *(_OWORD *)&a3[20].var0 = v11;
    LOWORD(v6) = 1;
    WORD3(v6) = 1;
    *(_DWORD *)((char *)&v6 + 2) = v8;
    *(_QWORD *)&a3[24].var0 = v6;
  }
  return v4;
}

- (BOOL)getInputGainMapPixelTransform:(id *)a3
{
  int v5;
  BOOL v6;
  __int128 v7;
  __int128 v8;
  float32x2_t v9;
  float32x2_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  int v17;
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;

  v17 = 0;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v12 = 0u;
  v5 = objc_msgSend((id)objc_opt_class(), "getInputPixelType:range:YCCMatrix:forBuffer:", &v17, &v15, &v12, -[HDRImage gainMapBuffer](self, "gainMapBuffer"));
  v6 = v5;
  if (a3 && v5)
  {
    a3->var0 = v17;
    v7 = v16;
    *(_OWORD *)&a3[4].var0 = v15;
    *(_OWORD *)&a3[8].var0 = v7;
    v8 = v13;
    *(_OWORD *)&a3[12].var0 = v12;
    *(_OWORD *)&a3[16].var0 = v8;
    *(_OWORD *)&a3[20].var0 = v14;
    -[HDRImage gainMapOrientation](self, "gainMapOrientation");
    v19 = 0u;
    v20 = 0u;
    v18 = 0u;
    CGImageGetTransformForOrientationAndSize();
    v9 = vcvt_f32_f64(v19);
    v10 = vcvt_f32_f64(v20);
    *(float32x2_t *)&a3[24].var0 = vcvt_f32_f64(v18);
    *(float32x2_t *)&a3[26].var0 = v9;
    *(float32x2_t *)&a3[28].var0 = v10;
  }
  return v6;
}

- (BOOL)getOutputGainMapPixelTransform:(id *)a3
{
  int v5;
  BOOL result;
  int8x8_t v7;
  int32x2_t v8;
  int8x8_t v9;
  int32x2_t v10;
  int16x4_t v11;
  int16x4_t v12;
  unsigned int v13;
  int v14;
  __int128 v15;
  __int128 v16;
  int16x4_t v17;
  int8x8_t v18;
  __int32 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  int v25;

  v25 = 0;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v20 = 0u;
  v19 = 0;
  v5 = objc_msgSend((id)objc_opt_class(), "getOutputPixelType:range:YCCMatrix:chromaSubsampling:forBuffer:", &v25, &v23, &v20, &v19, -[HDRImage gainMapBuffer](self, "gainMapBuffer"));
  result = 0;
  if (v5)
  {
    -[HDRImage gainMapSize](self, "gainMapSize");
    v18 = v7;
    v8 = (int32x2_t)vand_s8(v7, (int8x8_t)0xFFFF0000FFFFLL);
    -[HDRImage imageSize](self, "imageSize");
    v10 = (int32x2_t)vand_s8(v9, (int8x8_t)0xFFFF0000FFFFLL);
    v11 = (int16x4_t)vceq_s32(v8, v10);
    if ((vminv_u16((uint16x4_t)vuzp1_s16(v11, v11)) & 0x8000) != 0)
    {
      v13 = 1;
      if (!a3)
        return 1;
    }
    else
    {
      v12 = (int16x4_t)vceq_s32(v8, (int32x2_t)vshr_n_u32((uint32x2_t)v10, 1uLL));
      if ((vminv_u16((uint16x4_t)vuzp1_s16(v12, v12)) & 0x8000) == 0)
      {
        LogError("-[HDRImage getOutputGainMapPixelTransform:]", 1756, "Unsupported gain map size: %ux%u image size: %ux%u", v18.u16[0], v18.u16[2], v9.u16[0], v9.u16[2]);
        return 0;
      }
      v13 = 2;
      if (!a3)
        return 1;
    }
    v14 = v25;
    a3->var0 = v25;
    v15 = v24;
    *(_OWORD *)&a3[4].var0 = v23;
    *(_OWORD *)&a3[8].var0 = v15;
    v16 = v21;
    *(_OWORD *)&a3[12].var0 = v20;
    *(_OWORD *)&a3[16].var0 = v16;
    *(_OWORD *)&a3[20].var0 = v22;
    switch(v14)
    {
      case 3:
        goto LABEL_11;
      case 2:
        v17.i16[0] = 1;
        v17.i16[3] = 1;
        *(__int32 *)((char *)v17.i32 + 2) = v19;
        *(int16x4_t *)&a3[24].var0 = vmul_s16(v17, vdup_n_s16(v13));
        return 1;
      case 1:
LABEL_11:
        *(_QWORD *)&a3[24].var0 = (unsigned __int16)v13;
        break;
    }
    return 1;
  }
  return result;
}

- (BOOL)getInputGainMapColorMatrix:(id *)a3
{
  CGColorSpace *v5;
  CGColorSpace *v6;
  CGColorSpace *v7;
  CGColorSpace *v8;
  CGColorSpace *Linearized;
  __CFString *v10;
  void *v11;
  double v12;
  char v13;
  _OWORD v15[9];
  _OWORD v16[5];

  if (!-[HDRImage hasGainMap](self, "hasGainMap"))
    return 0;
  memset(v16, 0, sizeof(v16));
  memset(v15, 0, sizeof(v15));
  v5 = -[HDRImage gainMapColorSpace](self, "gainMapColorSpace");
  if (!v5 || (v6 = v5, CGColorSpaceGetModel(v5) != kCGColorSpaceModelRGB))
    v6 = -[HDRImage colorSpace](self, "colorSpace");
  v7 = (CGColorSpace *)CGColorSpaceCopyBaseColorSpace();
  v8 = v7;
  if (!v7)
    v7 = v6;
  Linearized = CGColorSpaceCreateLinearized(v7);
  if (!Linearized)
  {
    v10 = objc_retainAutorelease((id)CFCopyDescription(v6));
    LogError("-[HDRImage getInputGainMapColorMatrix:]", 1799, "Failed to linearized gain map space: %s, using sRGB Linear instead!", (const char *)-[__CFString UTF8String](v10, "UTF8String"));

    Linearized = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA00]);
  }
  v11 = (void *)objc_opt_class();
  -[HDRImage headroom](self, "headroom");
  *(float *)&v12 = v12;
  v13 = objc_msgSend(v11, "getColorTRC:matrix:toneMapping:fromSourceSpace:toEDR:toneMappingMode:", v16, a3, v15, Linearized, 0, v12);
  CGColorSpaceRelease(Linearized);
  CGColorSpaceRelease(v8);
  return v13;
}

- (BOOL)getOutputGainMapColorMatrix:(HDRImage *)self lumaWeights:(SEL)a2 isLuma:(id *)a3
{
  uint64_t v3;
  _BYTE *v4;
  _BYTE *v5;
  uint64_t v6;
  int v9;
  id v10;
  char v11;
  CGColorSpace *v12;
  void *v13;
  double v14;
  __int128 v16;
  __int128 v17;
  id v18;
  int v19;

  v5 = v4;
  v6 = v3;
  if (!-[HDRImage hasGainMap](self, "hasGainMap"))
    return 0;
  v19 = 0;
  v18 = 0;
  v9 = objc_msgSend((id)objc_opt_class(), "getPixelType:YCCMatrixString:chromaSubsampling:componentRange:bitDepth:forBuffer:", &v19, &v18, 0, 0, 0, -[HDRImage gainMapBuffer](self, "gainMapBuffer"));
  v10 = v18;
  v11 = 0;
  if (v9)
  {
    v12 = -[HDRImage gainMapColorSpace](self, "gainMapColorSpace", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0);
    if (!v12)
      v12 = -[HDRImage colorSpace](self, "colorSpace");
    v13 = (void *)objc_opt_class();
    -[HDRImage headroom](self, "headroom");
    *(float *)&v14 = v14;
    v11 = objc_msgSend(v13, "getColorTRC:matrix:toneMapping:fromEDR:toTargetSpace:", &v17, a3, &v16, v12, v14);
    if ((v11 & 1) != 0)
    {
      if (v19 == 3)
      {
        if (v6)
          *(_OWORD *)v6 = xmmword_18820BF70;
        if (v5)
          *v5 = 1;
      }
      else
      {
        if (v5)
          *v5 = 0;
        if (v6)
        {
          *(_QWORD *)v6 = 0;
          *(_QWORD *)(v6 + 8) = 0;
        }
      }
    }
  }

  return v11;
}

- (BOOL)getInputGainMapTransform:(id *)a3 toEDR:(float)a4 needsGainMap:(BOOL *)a5 baseIsSDR:(BOOL *)a6
{
  int32x2_t v11;
  BOOL v12;
  float v18;
  float v19;
  _BOOL4 v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  __int128 v24;
  __int128 v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  int32x2_t v31;
  BOOL v33;
  uint64_t v34;
  __int128 v35;
  unint64_t v37;
  const char *v38;
  __int128 v39;
  __int128 v40;
  float32x4_t v41;
  float32x4_t v42;
  float32x4_t v43;

  if (-[HDRImage type](self, "type") == 4)
  {
    v12 = 1;
    if (a4 > 1.0)
    {
      *(float *)v11.i32 = a4 + -1.0;
      if ((float)(a4 + -1.0) < 0.0)
        *(float *)v11.i32 = 0.0;
      *(_DWORD *)&a3[10].var1.var1.var1 = 1;
      *(int32x4_t *)&a3[12].var0.var0 = vdupq_n_s32(0x400CCCCDu);
      *(int32x4_t *)&a3[13].var1.var0.var0 = vdupq_lane_s32(v11, 0);
      __asm { FMOV            V0.4S, #1.0 }
      *(_OWORD *)&a3[14].var1.var1.var1 = _Q0;
      *(_OWORD *)&a3[16].var0.var0 = 0u;
      *(_OWORD *)&a3[17].var1.var0.var0 = 0u;
      *(_OWORD *)&a3[18].var1.var1.var1 = 0u;
      goto LABEL_14;
    }
    goto LABEL_16;
  }
  if (-[HDRImage type](self, "type") == 6)
  {
    -[HDRFlexRangeParameters baseHeadroom](self->_flexRangeParams, "baseHeadroom");
    v19 = exp2f(v18);
    -[HDRFlexRangeParameters alternateHeadroom](self->_flexRangeParams, "alternateHeadroom");
    v12 = v19 <= 1.0;
    if (v19 > 1.0)
      v20 = v19 > a4;
    else
      v20 = a4 > 1.0;
    if (v20)
    {
      -[HDRFlexRangeParameters channelGammaRGB](self->_flexRangeParams, "channelGammaRGB");
      v43 = v21;
      -[HDRFlexRangeParameters channelMinRGB](self->_flexRangeParams, "channelMinRGB");
      v42 = v22;
      -[HDRFlexRangeParameters channelMaxRGB](self->_flexRangeParams, "channelMaxRGB");
      v41 = v23;
      -[HDRFlexRangeParameters channelBaseOffsetRGB](self->_flexRangeParams, "channelBaseOffsetRGB");
      v40 = v24;
      -[HDRFlexRangeParameters channelAlternateOffsetRGB](self->_flexRangeParams, "channelAlternateOffsetRGB");
      v39 = v25;
      v26 = log2f(a4);
      -[HDRFlexRangeParameters baseHeadroom](self->_flexRangeParams, "baseHeadroom");
      v28 = v26 - v27;
      -[HDRFlexRangeParameters alternateHeadroom](self->_flexRangeParams, "alternateHeadroom");
      v30 = v29;
      -[HDRFlexRangeParameters baseHeadroom](self->_flexRangeParams, "baseHeadroom");
      *(float *)v31.i32 = fminf(fmaxf(v28 / (float)(v30 - *(float *)v31.i32), 0.0), 1.0);
      if (v19 >= a4)
        *(float *)v31.i32 = -*(float *)v31.i32;
      __asm { FMOV            V1.4S, #1.0 }
      *(_DWORD *)&a3[10].var1.var1.var1 = 2;
      *(float32x4_t *)&a3[12].var0.var0 = vdivq_f32(_Q1, v43);
      *(float32x4_t *)&a3[13].var1.var0.var0 = vsubq_f32(v41, v42);
      *(float32x4_t *)&a3[14].var1.var1.var1 = v42;
      *(_OWORD *)&a3[16].var0.var0 = v40;
      *(_OWORD *)&a3[17].var1.var0.var0 = v39;
      *(int32x4_t *)&a3[18].var1.var1.var1 = vdupq_lane_s32(v31, 0);
LABEL_14:
      -[HDRImage getInputGainMapColorMatrix:](self, "getInputGainMapColorMatrix:", &a3[20]);
      -[HDRImage getInputGainMapPixelTransform:](self, "getInputGainMapPixelTransform:", a3);
      v33 = 1;
      if (!a5)
        goto LABEL_18;
      goto LABEL_17;
    }
LABEL_16:
    v33 = 0;
    *(_DWORD *)&a3[10].var1.var1.var1 = 0;
    v34 = MEMORY[0x1E0C83FE8];
    v35 = *(_OWORD *)(MEMORY[0x1E0C83FE8] + 16);
    *(_OWORD *)&a3[20].var0.var0 = *MEMORY[0x1E0C83FE8];
    *(_OWORD *)&a3[21].var1.var0.var0 = v35;
    *(_OWORD *)&a3[22].var1.var1.var1 = *(_OWORD *)(v34 + 32);
    LOBYTE(a3[24].var0.var0) = 1;
    if (!a5)
    {
LABEL_18:
      if (a6)
        *a6 = v12;
      return 1;
    }
LABEL_17:
    *a5 = v33;
    goto LABEL_18;
  }
  v37 = -[HDRImage type](self, "type");
  if (v37 > 6)
    v38 = "???";
  else
    v38 = off_1E1BBDFE8[v37];
  LogError("-[HDRImage getInputGainMapTransform:toEDR:needsGainMap:baseIsSDR:]", 1918, "Unexpected HDR type: %s", v38);
  return 0;
}

- (BOOL)getOutputGainMapTransform:(id *)a3 fromEDR:(float)a4 needsGainMap:(BOOL *)a5 baseIsSDR:(BOOL *)a6
{
  int32x2_t v10;
  BOOL v16;
  float v17;
  float v18;
  int32x2_t v19;
  float v20;
  float v21;
  float v22;
  float v23;
  int32x2_t v24;
  int32x2_t v25;
  int32x2_t v26;
  int32x2_t v27;
  BOOL v28;
  int32x2_t v30;
  int32x2_t v31;
  float v32;
  float v34;
  BOOL v35;

  if (-[HDRImage type](self, "type") == 4)
  {
    __asm { FMOV            V0.2S, #1.0 }
    *(float *)&_D0.i32[1] = a4;
    *(int32x2_t *)&a3[14].var1.var0 = _D0;
    v16 = 1;
    a3->var0.var0.var0 = 1;
    *(float *)v10.i32 = 1.0 / (float)(a4 + -1.0);
    *(float *)_D0.i32 = -1.0 / (float)(a4 + -1.0);
    *(int32x4_t *)&a3[1].var0.var1.var1 = vdupq_n_s32(0x3EE8BA2Eu);
    *(int32x4_t *)&a3[2].var1.var0 = vdupq_lane_s32(v10, 0);
    *(int32x4_t *)&a3[4].var0.var0.var0 = vdupq_lane_s32(_D0, 0);
    *(int32x4_t *)&a3[5].var0.var1.var1 = vdupq_n_s32(0x3A83126Fu);
    *(_OWORD *)&a3[6].var1.var0 = 0u;
    *(_OWORD *)&a3[8].var0.var0.var0 = 0u;
  }
  else
  {
    if (-[HDRImage type](self, "type") != 6)
    {
      v28 = 0;
      goto LABEL_7;
    }
    -[HDRFlexRangeParameters baseHeadroom](self->_flexRangeParams, "baseHeadroom");
    v34 = exp2f(v17);
    -[HDRFlexRangeParameters alternateHeadroom](self->_flexRangeParams, "alternateHeadroom");
    v32 = exp2f(v18);
    -[HDRFlexRangeParameters channelGamma](self->_flexRangeParams, "channelGamma");
    v31 = v19;
    -[HDRFlexRangeParameters channelMin](self->_flexRangeParams, "channelMin");
    v21 = v20;
    -[HDRFlexRangeParameters channelMax](self->_flexRangeParams, "channelMax");
    v23 = v22;
    -[HDRFlexRangeParameters channelBaseOffset](self->_flexRangeParams, "channelBaseOffset");
    v30 = v24;
    -[HDRFlexRangeParameters channelAlternateOffset](self->_flexRangeParams, "channelAlternateOffset");
    *(float *)v25.i32 = 1.0 / (float)(v23 - v21);
    *(float *)v26.i32 = (float)-v21 / (float)(v23 - v21);
    *(_QWORD *)&a3[14].var1.var0 = __PAIR64__(LODWORD(v32), LODWORD(v34));
    a3->var0.var0.var0 = 2;
    *(int32x4_t *)&a3[1].var0.var1.var1 = vdupq_lane_s32(v31, 0);
    *(int32x4_t *)&a3[2].var1.var0 = vdupq_lane_s32(v25, 0);
    *(int32x4_t *)&a3[4].var0.var0.var0 = vdupq_lane_s32(v26, 0);
    *(int32x4_t *)&a3[5].var0.var1.var1 = vdupq_lane_s32(v30, 0);
    *(int32x4_t *)&a3[6].var1.var0 = vdupq_lane_s32(v27, 0);
    *(_OWORD *)&a3[8].var0.var0.var0 = 0u;
    v16 = v34 < v32;
  }
  *a6 = v16;
  v35 = 0;
  -[HDRImage getOutputGainMapColorMatrix:lumaWeights:isLuma:](self, "getOutputGainMapColorMatrix:lumaWeights:isLuma:", &a3[9].var0.var1, &a3[16], &v35);
  a3[17].var0.var1.var1 = v35;
  -[HDRImage getOutputGainMapPixelTransform:](self, "getOutputGainMapPixelTransform:", &a3[18].var1);
  v28 = 1;
LABEL_7:
  *a5 = v28;
  return 1;
}

- (BOOL)getInputImageTransform:(id *)a3 toEDR:(float)a4
{
  BOOL v7;
  double v8;

  v7 = -[HDRImage getInputImagePixelTransform:](self, "getInputImagePixelTransform:");
  *(float *)&v8 = a4;
  return v7 & -[HDRImage getInputColorTransform:toEDR:](self, "getInputColorTransform:toEDR:", &a3[1].var1, v8);
}

- (BOOL)getOutputImageTransform:(id *)a3 fromEDR:(float)a4
{
  BOOL v7;
  double v8;

  v7 = -[HDRImage getOutputImagePixelTransform:](self, "getOutputImagePixelTransform:", &a3[2].var0.var1.var2);
  *(float *)&v8 = a4;
  return v7 & -[HDRImage getOutputColorTransform:fromEDR:](self, "getOutputColorTransform:fromEDR:", a3, v8);
}

- (BOOL)getInputTransform:(id *)a3 toEDR:(float)a4
{
  double v7;
  int v8;
  unsigned int v9;
  BOOL v10;
  _QWORD *p_var3;
  simd_float3x3 v12;
  uint32x4_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int16 v26;
  _OWORD v27[3];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  simd_float3x3 v31;
  simd_float3x3 v32;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDRImage.mm"), 2015, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outTransform != NULL"));

  }
  v26 = 0;
  if (-[HDRImage hasGainMap](self, "hasGainMap")
    && (*(float *)&v7 = a4,
        -[HDRImage getInputGainMapTransform:toEDR:needsGainMap:baseIsSDR:](self, "getInputGainMapTransform:toEDR:needsGainMap:baseIsSDR:", &a3[3], (char *)&v26 + 1, &v26, v7), HIBYTE(v26)))
  {
    v8 = v26;
    if ((_BYTE)v26)
      v9 = 3;
    else
      v9 = 1;
    a3->var0 = v9;
    a4 = 1.0;
    if (!v8)
    {
      -[HDRImage headroom](self, "headroom");
      a4 = v7;
    }
  }
  else
  {
    a3->var0 = 0;
  }
  *(float *)&v7 = a4;
  v10 = -[HDRImage getInputImageTransform:toEDR:](self, "getInputImageTransform:toEDR:", &a3->var1.var1, v7);
  if (HIBYTE(v26) && !LOBYTE(a3[5].var0))
  {
    p_var3 = (_QWORD *)&a3[2].var1.var1.var1.var1.var3;
    if (LOBYTE(a3[2].var2.var0.var0))
    {
      v31 = __invert_f3(*(simd_float3x3 *)&a3[4].var1.var1.var1.var1.var7);
      LODWORD(a3[2].var1.var1.var1.var1.var5) = v31.columns[0].i32[2];
      *p_var3 = v31.columns[0].i64[0];
      LODWORD(a3[2].var1.var1.var1.var2) = v31.columns[1].i32[2];
      *(_QWORD *)&a3[2].var1.var1.var1.var1.var7 = v31.columns[1].i64[0];
      *(_DWORD *)&a3[2].var1.var1.var2.var1 = v31.columns[2].i32[2];
      *(_QWORD *)&a3[2].var1.var1.var1.var3.var1 = v31.columns[2].i64[0];
      LOBYTE(a3[2].var2.var0.var0) = 0;
    }
    else
    {
      v12 = *(simd_float3x3 *)&a3[4].var1.var1.var1.var1.var7;
      v13 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&a3[2].var1.var1.var1.var1.var7, (float32x4_t)v12.columns[1]), (int8x16_t)vceqq_f32(*(float32x4_t *)&a3[2].var1.var1.var1.var1.var3, (float32x4_t)v12.columns[0])), (int8x16_t)vceqq_f32(*(float32x4_t *)&a3[2].var1.var1.var1.var3.var1, (float32x4_t)v12.columns[2]));
      v13.i32[3] = v13.i32[2];
      if ((vminvq_u32(v13) & 0x80000000) != 0)
      {
        v18 = *MEMORY[0x1E0C83FE8];
        v19 = *(_OWORD *)(MEMORY[0x1E0C83FE8] + 32);
        *(_OWORD *)&a3[2].var1.var1.var1.var1.var7 = *(_OWORD *)(MEMORY[0x1E0C83FE8] + 16);
        *(_OWORD *)&a3[2].var1.var1.var1.var3.var1 = v19;
        *(_OWORD *)p_var3 = v18;
        LOBYTE(a3[2].var2.var0.var0) = 1;
      }
      else
      {
        v23 = *(_OWORD *)&a3[2].var1.var1.var1.var1.var3;
        v24 = *(_OWORD *)&a3[2].var1.var1.var1.var1.var7;
        v25 = *(_OWORD *)&a3[2].var1.var1.var1.var3.var1;
        v32 = __invert_f3(v12);
        v14 = 0;
        v27[0] = v23;
        v27[1] = v24;
        v27[2] = v25;
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        do
        {
          *(__int128 *)((char *)&v28 + v14 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v32.columns[0], COERCE_FLOAT(v27[v14])), (float32x4_t)v32.columns[1], *(float32x2_t *)&v27[v14], 1), (float32x4_t)v32.columns[2], (float32x4_t)v27[v14], 2);
          ++v14;
        }
        while (v14 != 3);
        v15 = v28;
        v16 = v29;
        v17 = v30;
        a3[2].var1.var1.var1.var1.var5 = *((float *)&v28 + 2);
        LODWORD(a3[2].var1.var1.var1.var2) = DWORD2(v16);
        *p_var3 = v15;
        *(_QWORD *)&a3[2].var1.var1.var1.var1.var7 = v16;
        *(_DWORD *)&a3[2].var1.var1.var2.var1 = DWORD2(v17);
        *(_QWORD *)&a3[2].var1.var1.var1.var3.var1 = v17;
      }
    }
  }
  return v10;
}

- (BOOL)getOutputTransform:(id *)a3 fromEDR:(float)a4
{
  double v7;
  int v8;
  int v9;
  _BOOL4 v10;
  unsigned int v11;
  $4AC482BDBE1B562F9714664080762768 *p_var1;
  int v13;
  void *v16;
  __int16 v17;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDRImage.mm"), 2060, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outTransform != NULL"));

  }
  v17 = 0;
  if (-[HDRImage hasGainMap](self, "hasGainMap"))
  {
    *(float *)&v7 = a4;
    -[HDRImage getOutputGainMapTransform:fromEDR:needsGainMap:baseIsSDR:](self, "getOutputGainMapTransform:fromEDR:needsGainMap:baseIsSDR:", &a3[2].var2, (char *)&v17 + 1, &v17, v7);
    v8 = v17;
    if ((_BYTE)v17)
      v9 = 3;
    else
      v9 = 1;
    v10 = HIBYTE(v17) == 0;
    if (HIBYTE(v17))
      v11 = v9;
    else
      v11 = 0;
  }
  else
  {
    v8 = 0;
    v11 = 0;
    v10 = 1;
  }
  a3->var0 = v11;
  p_var1 = &a3->var1.var0.var1;
  if (v8)
    v13 = v10;
  else
    v13 = 1;
  LODWORD(v7) = 1.0;
  if (v13)
    *(float *)&v7 = a4;
  return -[HDRImage getOutputImageTransform:fromEDR:](self, "getOutputImageTransform:fromEDR:", p_var1, v7);
}

- (id)inputTransformToEDR:(float)a3
{
  HDRInputTransform *v5;
  uint64_t v6;
  double v7;
  HDRInputTransform *v8;
  HDRInputTransform *v9;

  v5 = objc_alloc_init(HDRInputTransform);
  v6 = -[HDRInputTransform storage](v5, "storage");
  *(float *)&v7 = a3;
  if (-[HDRImage getInputTransform:toEDR:](self, "getInputTransform:toEDR:", v6, v7))
    v8 = v5;
  else
    v8 = 0;
  v9 = v8;

  return v9;
}

- (id)outputTransformFromEDR:(float)a3
{
  HDROutputTransform *v5;
  uint64_t v6;
  double v7;
  HDROutputTransform *v8;
  HDROutputTransform *v9;

  v5 = objc_alloc_init(HDROutputTransform);
  v6 = -[HDROutputTransform storage](v5, "storage");
  *(float *)&v7 = a3;
  if (-[HDRImage getOutputTransform:fromEDR:](self, "getOutputTransform:fromEDR:", v6, v7))
    v8 = v5;
  else
    v8 = 0;
  v9 = v8;

  return v9;
}

- (int64_t)type
{
  return self->_type;
}

- (int)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int)a3
{
  self->_orientation = a3;
}

- (double)headroom
{
  return self->_headroom;
}

- (void)setHeadroom:(double)a3
{
  self->_headroom = a3;
}

- (__CVBuffer)imageBuffer
{
  return self->_imageBuffer;
}

- (__CVBuffer)gainMapBuffer
{
  return self->_gainMapBuffer;
}

- (int)gainMapOrientation
{
  return self->_gainMapOrientation;
}

- (void)setGainMapOrientation:(int)a3
{
  self->_gainMapOrientation = a3;
}

- (HDRFlexRangeParameters)flexRangeParams
{
  return self->_flexRangeParams;
}

- (void)setFlexRangeParams:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSDictionary)flexGTCInfo
{
  return self->_flexGTCInfo;
}

- (int)toneMappingMode
{
  return self->_toneMappingMode;
}

- (void)setToneMappingMode:(int)a3
{
  self->_toneMappingMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flexGTCInfo, 0);
  objc_storeStrong((id *)&self->_flexRangeParams, 0);
}

@end
