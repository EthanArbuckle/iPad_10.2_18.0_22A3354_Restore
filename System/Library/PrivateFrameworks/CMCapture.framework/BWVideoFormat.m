@implementation BWVideoFormat

+ (id)formatByResolvingRequirements:(id)a3
{
  return (id)objc_msgSend(a1, "formatByResolvingRequirements:printErrors:", a3, 1);
}

- (NSDictionary)pixelBufferAttributes
{
  return self->_pixelBufferAttributes;
}

+ (id)formatByResolvingRequirements:(id)a3 printErrors:(BOOL)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BWVideoFormatRequirements *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v15;
  uint64_t v16;
  const __CFString *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a3, "count"))
  {
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = *MEMORY[0x1E0C99778];
    v17 = CFSTR("requirements array must have 1 or more objects");
LABEL_25:
    objc_exception_throw((id)objc_msgSend(v15, "exceptionWithName:reason:userInfo:", v16, v17, 0));
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v22, v29, 16);
  if (!v5)
    goto LABEL_10;
  v6 = v5;
  v7 = *(_QWORD *)v23;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v23 != v7)
        objc_enumerationMutation(a3);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v15 = (void *)MEMORY[0x1E0C99DA0];
        v16 = *MEMORY[0x1E0C99778];
        v17 = CFSTR("requirementsArray must contain BWVideoFormatRequirements objects");
        goto LABEL_25;
      }
    }
    v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v22, v29, 16);
  }
  while (v6);
LABEL_10:
  v9 = objc_alloc_init(BWVideoFormatRequirements);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
LABEL_12:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v12)
        objc_enumerationMutation(a3);
      if (!-[BWVideoFormatRequirements _resolveWith:printErrors:]((uint64_t)v9, *(void **)(*((_QWORD *)&v18 + 1) + 8 * v13)))return 0;
      if (v11 == ++v13)
      {
        v11 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
        if (v11)
          goto LABEL_12;
        goto LABEL_18;
      }
    }
  }
  else
  {
LABEL_18:
    if (!-[NSArray count](-[BWVideoFormatRequirements supportedPixelFormats](v9, "supportedPixelFormats"), "count"))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      return 0;
    }
    -[BWVideoFormatRequirements _resolvePixelFormat]((id *)&v9->super.super.isa);
    if (-[NSArray count](-[BWVideoFormatRequirements supportedCacheModes](v9, "supportedCacheModes"), "count") >= 2)
    {
      v27 = -[NSArray firstObject](-[BWVideoFormatRequirements supportedCacheModes](v9, "supportedCacheModes"), "firstObject");
      -[BWVideoFormatRequirements setSupportedCacheModes:](v9, "setSupportedCacheModes:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1));
    }
    if (-[NSArray count](-[BWVideoFormatRequirements supportedColorSpaceProperties](v9, "supportedColorSpaceProperties"), "count") >= 2)
    {
      v26 = -[NSArray firstObject](-[BWVideoFormatRequirements supportedColorSpaceProperties](v9, "supportedColorSpaceProperties"), "firstObject");
      -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v9, "setSupportedColorSpaceProperties:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1));
    }
    return -[BWVideoFormat _initWithResolvedRequirements:]([BWVideoFormat alloc], v9);
  }
}

- (_QWORD)_initWithResolvedRequirements:(_QWORD *)a1
{
  _QWORD *v2;
  int v4;
  int v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  objc_super v13;

  v2 = a1;
  if (a1)
  {
    if (a2
      && objc_msgSend((id)objc_msgSend(a2, "supportedPixelFormats"), "count") == 1
      && (v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "supportedPixelFormats"), "firstObject"), "unsignedIntValue")) != 0&& ((v5 = v4, (FigCapturePixelFormatIsVersatileRaw(v4) & 1) != 0)|| objc_msgSend(a2, "width") && objc_msgSend(a2, "height"))&& (unint64_t)objc_msgSend((id)objc_msgSend(a2, "supportedCacheModes"), "count") <= 1&& (unint64_t)objc_msgSend((id)objc_msgSend(a2, "supportedColorSpaceProperties"), "count") <= 1&& (v13.receiver = v2, v13.super_class = (Class)BWVideoFormat, (v2 = objc_msgSendSuper2(&v13, sel_init)) != 0))
    {
      v2[1] = objc_msgSend(a2, "width");
      v2[2] = objc_msgSend(a2, "height");
      *((_DWORD *)v2 + 8) = v5;
      v2[3] = objc_msgSend(a2, "sliceCount");
      v2[5] = objc_msgSend(a2, "bytesPerRowAlignment");
      v2[6] = objc_msgSend(a2, "planeAlignment");
      *((_DWORD *)v2 + 18) = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "supportedCacheModes"), "firstObject"), "unsignedIntValue");
      v6 = a2[9];
      if (v6)
      {
        v7 = a2[1];
        if (v7)
        {
          v8 = v7 % v6;
          if (v6 - v8 >= v6)
            v6 = -(uint64_t)v8;
          else
            v6 -= v8;
        }
        else
        {
          v6 = 0;
        }
      }
      v2[7] = v6 + v2[1];
      v9 = a2[10];
      if (v9)
      {
        v10 = a2[2];
        if (v10)
        {
          v11 = v10 % v9;
          if (v9 - v11 >= v9)
            v9 = -(uint64_t)v11;
          else
            v9 -= v11;
        }
        else
        {
          v9 = 0;
        }
      }
      v2[8] = v9 + v2[2];
      *((_BYTE *)v2 + 76) = objc_msgSend(a2, "prewireBuffers");
      *((_BYTE *)v2 + 77) = objc_msgSend(a2, "memoryPoolUseAllowed");
      v2[10] = objc_msgSend((id)objc_msgSend(a2, "pixelBufferAttributes"), "copy");
      *((_DWORD *)v2 + 22) = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "supportedColorSpaceProperties"), "firstObject"), "intValue");
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (unint64_t)width
{
  return self->_width;
}

- (unsigned)pixelFormat
{
  return self->_pixelFormat;
}

- (unint64_t)height
{
  return self->_height;
}

- (int)colorSpaceProperties
{
  return self->_colorSpaceProperties;
}

- (unint64_t)bytesPerRowAlignment
{
  return self->_bytesPerRowAlignment;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWVideoFormat;
  -[BWVideoFormat dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unsigned int v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unsigned int v13;

  if (a3 == self)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = -[BWVideoFormat width](self, "width");
  if (v5 != objc_msgSend(a3, "width"))
    return 0;
  v6 = -[BWVideoFormat height](self, "height");
  if (v6 != objc_msgSend(a3, "height"))
    return 0;
  v7 = -[BWVideoFormat sliceCount](self, "sliceCount");
  if (v7 != objc_msgSend(a3, "sliceCount"))
    return 0;
  v8 = -[BWVideoFormat pixelFormat](self, "pixelFormat");
  if (v8 != objc_msgSend(a3, "pixelFormat"))
    return 0;
  v9 = -[BWVideoFormat bytesPerRowAlignment](self, "bytesPerRowAlignment");
  if (v9 != objc_msgSend(a3, "bytesPerRowAlignment"))
    return 0;
  v10 = -[BWVideoFormat planeAlignment](self, "planeAlignment");
  if (v10 != objc_msgSend(a3, "planeAlignment"))
    return 0;
  v11 = -[BWVideoFormat extendedWidth](self, "extendedWidth");
  if (v11 != objc_msgSend(a3, "extendedWidth"))
    return 0;
  v12 = -[BWVideoFormat extendedHeight](self, "extendedHeight");
  if (v12 != objc_msgSend(a3, "extendedHeight"))
    return 0;
  v13 = -[BWVideoFormat cacheMode](self, "cacheMode");
  return v13 == objc_msgSend(a3, "cacheMode");
}

- (unint64_t)sliceCount
{
  return self->_sliceCount;
}

- (unint64_t)extendedWidth
{
  return self->_extendedWidth;
}

- (unint64_t)extendedHeight
{
  return self->_extendedHeight;
}

- (unsigned)cacheMode
{
  return self->_cacheMode;
}

- (unint64_t)planeAlignment
{
  return self->_planeAlignment;
}

+ (int)colorSpacePropertiesWithSourceColorSpace:(int)a3 sourcePixelFormat:(unsigned int)a4 sourceDimensions:(id)a5 requestedPixelFormat:(unsigned int)a6 supportedColorSpaces:(id)a7
{
  int var0;
  int result;
  int IsWide;
  uint64_t v14;
  int v15;
  int v16;
  int v17;

  var0 = a5.var0;
  if ((FigCapturePixelFormatIsYCbCr(a4) & 1) != 0 || (result = FigCapturePixelFormatIsBGRA(a4)) != 0)
  {
    IsWide = BWColorSpaceIsWide(a3);
    if (FigCapturePixelFormatIsBGRA(a6))
      v14 = a4;
    else
      v14 = a6;
    v15 = FigCaptureUncompressedPixelFormatForPixelFormat(v14);
    if (v15 == 875704438)
    {
      if (IsWide)
        v17 = 4;
      else
        v17 = 2;
      if (var0 < 960)
        return 1;
      else
        return v17;
    }
    else
    {
      v16 = v15;
      if (v15 == 875704422)
      {
        if (IsWide)
          return 3;
        else
          return 1;
      }
      else if (FigCapturePixelFormatIsTenBit(v15))
      {
        if (a3 == 3)
        {
          return 10;
        }
        else if (IsWide)
        {
          if (objc_msgSend(a7, "containsObject:", &unk_1E49FB070))
            return 6;
          else
            return 5;
        }
        else if (FigCapturePixelFormatIs422(v16))
        {
          return 2;
        }
        else
        {
          return 0;
        }
      }
      else
      {
        return 2;
      }
    }
  }
  return result;
}

+ (int)colorSpacePropertiesForSourceThatSupportsWideColor:(BOOL)a3 sourceColorSpace:(int)a4 sourcePixelFormat:(unsigned int)a5 sourceDimensions:(id)a6 requestedPixelFormat:(unsigned int)a7 supportedColorSpaces:(id)a8
{
  if (a3)
    return objc_msgSend((id)objc_opt_class(), "colorSpacePropertiesWithSourceColorSpace:sourcePixelFormat:sourceDimensions:requestedPixelFormat:supportedColorSpaces:", *(_QWORD *)&a4, *(_QWORD *)&a5, a6, *(_QWORD *)&a7, a8);
  else
    return 0;
}

- (BOOL)prewireBuffers
{
  return self->_prewireBuffers;
}

- (id)description
{
  void *v3;
  unint64_t extendedHeight;
  unsigned int colorSpaceProperties;
  unsigned int v6;
  unint64_t v7;
  const __CFString *v8;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 0);
  objc_msgSend(v3, "appendFormat:", CFSTR("%i x %i"), self->_width, self->_height);
  if (self->_sliceCount)
    objc_msgSend(v3, "appendFormat:", CFSTR(" x %i"), self->_sliceCount);
  extendedHeight = self->_extendedHeight;
  if (self->_extendedWidth != self->_width || extendedHeight != self->_height)
    objc_msgSend(v3, "appendFormat:", CFSTR(" (%i x %i)"), self->_extendedWidth, extendedHeight);
  objc_msgSend(v3, "appendString:", CFSTR(", "));
  objc_msgSend(v3, "appendString:", BWStringFromCVPixelFormatType(self->_pixelFormat));
  colorSpaceProperties = self->_colorSpaceProperties;
  if (colorSpaceProperties)
    objc_msgSend(v3, "appendFormat:", CFSTR(", ColorSpace = %@"), BWColorSpacePropertiesToString(colorSpaceProperties));
  if (self->_bytesPerRowAlignment)
    objc_msgSend(v3, "appendFormat:", CFSTR(", BPRAlignment = %i"), self->_bytesPerRowAlignment);
  if (self->_planeAlignment)
    objc_msgSend(v3, "appendFormat:", CFSTR(", PlaneAlignment = %i"), self->_planeAlignment);
  if (self->_cacheMode)
  {
    HIDWORD(v7) = self->_cacheMode;
    LODWORD(v7) = HIDWORD(v7);
    v6 = v7 >> 8;
    if (v6 > 7)
      v8 = CFSTR("Unknown");
    else
      v8 = off_1E49243C0[v6];
    objc_msgSend(v3, "appendFormat:", CFSTR(", CacheMode = %@"), v8);
  }
  if (self->_memoryPoolUseAllowed)
    objc_msgSend(v3, "appendFormat:", CFSTR(", MemoryPoolUseAllowed"));
  return v3;
}

- (BOOL)memoryPoolUseAllowed
{
  return self->_memoryPoolUseAllowed;
}

+ (id)pixelBufferAttachmentsForColorSpaceProperties:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  _QWORD *v8;
  id result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[3];
  _QWORD v41[3];
  _QWORD v42[3];
  _QWORD v43[3];
  _QWORD v44[3];
  _QWORD v45[3];
  _QWORD v46[3];
  _QWORD v47[3];
  _QWORD v48[3];
  _QWORD v49[3];
  _QWORD v50[3];
  _QWORD v51[3];
  _QWORD v52[3];
  _QWORD v53[3];
  _QWORD v54[3];
  _QWORD v55[3];
  _QWORD v56[3];
  _QWORD v57[3];
  _QWORD v58[3];
  _QWORD v59[3];
  _QWORD v60[3];
  _QWORD v61[4];

  v61[3] = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 1:
      v3 = *MEMORY[0x1E0CA8D88];
      v4 = *MEMORY[0x1E0CA8EE8];
      v56[0] = *MEMORY[0x1E0CA8D68];
      v56[1] = v4;
      v5 = *MEMORY[0x1E0CA8F10];
      v57[0] = v3;
      v57[1] = v5;
      v56[2] = *MEMORY[0x1E0CA8E98];
      v57[2] = *MEMORY[0x1E0CA8EB0];
      v6 = (void *)MEMORY[0x1E0C99D80];
      v7 = v57;
      v8 = v56;
      goto LABEL_14;
    case 2:
      v10 = *MEMORY[0x1E0CA8D88];
      v11 = *MEMORY[0x1E0CA8EE8];
      v54[0] = *MEMORY[0x1E0CA8D68];
      v54[1] = v11;
      v12 = *MEMORY[0x1E0CA8F18];
      v55[0] = v10;
      v55[1] = v12;
      v54[2] = *MEMORY[0x1E0CA8E98];
      v55[2] = *MEMORY[0x1E0CA8EB0];
      v6 = (void *)MEMORY[0x1E0C99D80];
      v7 = v55;
      v8 = v54;
      goto LABEL_14;
    case 3:
      v13 = *MEMORY[0x1E0CA8D98];
      v14 = *MEMORY[0x1E0CA8EE8];
      v60[0] = *MEMORY[0x1E0CA8D68];
      v60[1] = v14;
      v15 = *MEMORY[0x1E0CA8F10];
      v61[0] = v13;
      v61[1] = v15;
      v60[2] = *MEMORY[0x1E0CA8E98];
      v61[2] = *MEMORY[0x1E0CA8EB0];
      v6 = (void *)MEMORY[0x1E0C99D80];
      v7 = v61;
      v8 = v60;
      goto LABEL_14;
    case 4:
      v16 = *MEMORY[0x1E0CA8D98];
      v17 = *MEMORY[0x1E0CA8EE8];
      v58[0] = *MEMORY[0x1E0CA8D68];
      v58[1] = v17;
      v18 = *MEMORY[0x1E0CA8F18];
      v59[0] = v16;
      v59[1] = v18;
      v58[2] = *MEMORY[0x1E0CA8E98];
      v59[2] = *MEMORY[0x1E0CA8EB0];
      v6 = (void *)MEMORY[0x1E0C99D80];
      v7 = v59;
      v8 = v58;
      goto LABEL_14;
    case 5:
      v19 = *MEMORY[0x1E0CA8D98];
      v20 = *MEMORY[0x1E0CA8EE8];
      v52[0] = *MEMORY[0x1E0CA8D68];
      v52[1] = v20;
      v21 = *MEMORY[0x1E0CA8F18];
      v53[0] = v19;
      v53[1] = v21;
      v52[2] = *MEMORY[0x1E0CA8E98];
      v53[2] = *MEMORY[0x1E0CA8EA8];
      v6 = (void *)MEMORY[0x1E0C99D80];
      v7 = v53;
      v8 = v52;
      goto LABEL_14;
    case 6:
      v22 = *MEMORY[0x1E0CA8D80];
      v23 = *MEMORY[0x1E0CA8EE8];
      v48[0] = *MEMORY[0x1E0CA8D68];
      v48[1] = v23;
      v24 = *MEMORY[0x1E0CA8F00];
      v49[0] = v22;
      v49[1] = v24;
      v48[2] = *MEMORY[0x1E0CA8E98];
      v49[2] = *MEMORY[0x1E0CA8EA8];
      v6 = (void *)MEMORY[0x1E0C99D80];
      v7 = v49;
      v8 = v48;
      goto LABEL_14;
    case 7:
      v25 = *MEMORY[0x1E0CA8D98];
      v26 = *MEMORY[0x1E0CA8EE8];
      v50[0] = *MEMORY[0x1E0CA8D68];
      v50[1] = v26;
      v27 = *MEMORY[0x1E0CA8F10];
      v51[0] = v25;
      v51[1] = v27;
      v50[2] = *MEMORY[0x1E0CA8E98];
      v51[2] = *MEMORY[0x1E0CA8EA8];
      v6 = (void *)MEMORY[0x1E0C99D80];
      v7 = v51;
      v8 = v50;
      goto LABEL_14;
    case 8:
      v28 = *MEMORY[0x1E0CA8D98];
      v29 = *MEMORY[0x1E0CA8EE8];
      v46[0] = *MEMORY[0x1E0CA8D68];
      v46[1] = v29;
      v30 = *MEMORY[0x1E0CA8F18];
      v47[0] = v28;
      v47[1] = v30;
      v46[2] = *MEMORY[0x1E0CA8E98];
      v47[2] = *MEMORY[0x1E0CA8EB8];
      v6 = (void *)MEMORY[0x1E0C99D80];
      v7 = v47;
      v8 = v46;
      goto LABEL_14;
    case 9:
      v31 = *MEMORY[0x1E0CA8D98];
      v32 = *MEMORY[0x1E0CA8EE8];
      v44[0] = *MEMORY[0x1E0CA8D68];
      v44[1] = v32;
      v33 = *MEMORY[0x1E0CA8F10];
      v45[0] = v31;
      v45[1] = v33;
      v44[2] = *MEMORY[0x1E0CA8E98];
      v45[2] = *MEMORY[0x1E0CA8EB8];
      v6 = (void *)MEMORY[0x1E0C99D80];
      v7 = v45;
      v8 = v44;
      goto LABEL_14;
    case 10:
      v34 = *MEMORY[0x1E0CA8D80];
      v35 = *MEMORY[0x1E0CA8EE8];
      v42[0] = *MEMORY[0x1E0CA8D68];
      v42[1] = v35;
      v36 = *MEMORY[0x1E0CA8F00];
      v43[0] = v34;
      v43[1] = v36;
      v42[2] = *MEMORY[0x1E0CA8E48];
      v43[2] = *MEMORY[0x1E0CA8E50];
      v6 = (void *)MEMORY[0x1E0C99D80];
      v7 = v43;
      v8 = v42;
      goto LABEL_14;
    case 11:
      v37 = *MEMORY[0x1E0CA8D98];
      v38 = *MEMORY[0x1E0CA8EE8];
      v40[0] = *MEMORY[0x1E0CA8D68];
      v40[1] = v38;
      v39 = *MEMORY[0x1E0CA8F10];
      v41[0] = v37;
      v41[1] = v39;
      v40[2] = *MEMORY[0x1E0CA8E48];
      v41[2] = *MEMORY[0x1E0CA8E50];
      v6 = (void *)MEMORY[0x1E0C99D80];
      v7 = v41;
      v8 = v40;
LABEL_14:
      result = (id)objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v7, v8, 3);
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (opaqueCMFormatDescription)formatDescription
{
  CMVideoFormatDescriptionRef formatDescriptionOut;

  formatDescriptionOut = 0;
  if (CMVideoFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], self->_pixelFormat, self->_width, self->_height, 0, &formatDescriptionOut))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return (opaqueCMFormatDescription *)CFAutorelease(formatDescriptionOut);
}

+ (int)colorSpacePropertiesForPixelBufferAttachments:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;

  v4 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8D68]);
  v5 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8E98]);
  v6 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8E48]);
  v7 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8EE8]);
  v8 = *MEMORY[0x1E0CA8D98];
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CA8D98])
    && objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA8F10])
    && (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CA8EB0]) & 1) != 0)
  {
    return 3;
  }
  if (objc_msgSend(v4, "isEqualToString:", v8))
  {
    v10 = *MEMORY[0x1E0CA8EB0];
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA8EB0]))
    {
      if ((objc_msgSend(v5, "isEqualToString:", v10) & 1) != 0)
        return 4;
    }
  }
  v11 = *MEMORY[0x1E0CA8D88];
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CA8D88])
    && objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA8F10])
    && (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CA8EB0]) & 1) != 0)
  {
    return 1;
  }
  if (objc_msgSend(v4, "isEqualToString:", v11)
    && objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA8F18])
    && (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CA8EB0]) & 1) != 0)
  {
    return 2;
  }
  if (objc_msgSend(v4, "isEqualToString:", v8)
    && objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA8F18])
    && (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CA8EA8]) & 1) != 0)
  {
    return 5;
  }
  if (objc_msgSend(v4, "isEqualToString:", v8)
    && objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA8F10])
    && (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CA8EA8]) & 1) != 0)
  {
    return 7;
  }
  v12 = *MEMORY[0x1E0CA8D80];
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CA8D80])
    && objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA8F00])
    && (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CA8EA8]) & 1) != 0)
  {
    return 6;
  }
  if (objc_msgSend(v4, "isEqualToString:", v8)
    && objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA8F18])
    && (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CA8EB8]) & 1) != 0)
  {
    return 8;
  }
  if (objc_msgSend(v4, "isEqualToString:", v8)
    && objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA8F10])
    && (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CA8EB8]) & 1) != 0)
  {
    return 9;
  }
  if (objc_msgSend(v4, "isEqualToString:", v12)
    && objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA8F00])
    && !v5
    && (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CA8E50]) & 1) != 0)
  {
    return 10;
  }
  result = objc_msgSend(v4, "isEqualToString:", v8);
  if (result)
  {
    v13 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA8F10]);
    result = 0;
    if (v13)
    {
      if (!v5)
      {
        if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CA8E50]))
          return 11;
        else
          return 0;
      }
    }
  }
  return result;
}

+ (void)initialize
{
  objc_opt_class();
}

- (BOOL)isHLGColorSpace
{
  return (self->_colorSpaceProperties - 5) < 3;
}

- (unsigned)mediaType
{
  return 1986618469;
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> %@"), NSStringFromClass(v4), self, -[BWVideoFormat description](self, "description"));
}

+ (int)colorSpacePropertiesForSourceThatSupportsWideColor:(BOOL)a3 sourceColorSpace:(int)a4 sourcePixelFormat:(unsigned int)a5 sourceDimensions:(id)a6 requestedPixelFormat:(unsigned int)a7
{
  return objc_msgSend((id)objc_opt_class(), "colorSpacePropertiesForSourceThatSupportsWideColor:sourceColorSpace:sourcePixelFormat:sourceDimensions:requestedPixelFormat:supportedColorSpaces:", a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6, *(_QWORD *)&a7, 0);
}

+ (int)colorSpacePropertiesWithSourceColorSpace:(int)a3 sourcePixelFormat:(unsigned int)a4 sourceDimensions:(id)a5 requestedPixelFormat:(unsigned int)a6
{
  return objc_msgSend((id)objc_opt_class(), "colorSpacePropertiesWithSourceColorSpace:sourcePixelFormat:sourceDimensions:requestedPixelFormat:supportedColorSpaces:", *(_QWORD *)&a3, *(_QWORD *)&a4, a5, *(_QWORD *)&a6, 0);
}

+ (id)colorInfoWithSourceColorSpace:(int)a3 sourcePixelFormat:(unsigned int)a4 sourceDimensions:(id)a5 requestedPixelFormat:(unsigned int)a6
{
  uint64_t v6;

  v6 = objc_msgSend((id)objc_opt_class(), "colorSpacePropertiesWithSourceColorSpace:sourcePixelFormat:sourceDimensions:requestedPixelFormat:", *(_QWORD *)&a3, *(_QWORD *)&a4, a5, *(_QWORD *)&a6);
  return (id)objc_msgSend((id)objc_opt_class(), "pixelBufferAttachmentsForColorSpaceProperties:", v6);
}

- (void)setWidth:(unint64_t)a3
{
  self->_width = a3;
}

- (void)setHeight:(unint64_t)a3
{
  self->_height = a3;
}

- (void)setSliceCount:(unint64_t)a3
{
  self->_sliceCount = a3;
}

- (void)setPixelFormat:(unsigned int)a3
{
  self->_pixelFormat = a3;
}

- (void)setBytesPerRowAlignment:(unint64_t)a3
{
  self->_bytesPerRowAlignment = a3;
}

- (void)setPlaneAlignment:(unint64_t)a3
{
  self->_planeAlignment = a3;
}

- (void)setExtendedWidth:(unint64_t)a3
{
  self->_extendedWidth = a3;
}

- (void)setExtendedHeight:(unint64_t)a3
{
  self->_extendedHeight = a3;
}

- (void)setCacheMode:(unsigned int)a3
{
  self->_cacheMode = a3;
}

- (void)setPrewireBuffers:(BOOL)a3
{
  self->_prewireBuffers = a3;
}

- (void)setMemoryPoolUseAllowed:(BOOL)a3
{
  self->_memoryPoolUseAllowed = a3;
}

@end
