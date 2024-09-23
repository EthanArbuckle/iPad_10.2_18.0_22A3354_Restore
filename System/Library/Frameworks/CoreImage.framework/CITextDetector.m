@implementation CITextDetector

- (CITextDetector)initWithContext:(id)a3 options:(id)a4
{
  CITextDetector *v6;
  void *v7;
  void *v8;
  float v9;
  float v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CITextDetector;
  v6 = -[CIDetector init](&v12, sel_init);
  if (v6)
  {
    if (initWithContext_options__onceToken != -1)
      dispatch_once(&initWithContext_options__onceToken, &__block_literal_global_68);
    if ((initWithContext_options__loadedOK & 1) != 0)
    {
      v6->textDetector = (FKTextDetector *)objc_msgSend(objc_alloc(NSClassFromString(CFSTR("FKTextDetector"))), "initWithDimensions:", 128.0, 128.0);
      if (!a3)
        a3 = +[CIContext _singletonContext](CIContext, "_singletonContext");
      -[CITextDetector setContext:](v6, "setContext:", a3);
      if (!v6->featureOptions)
        v6->featureOptions = (NSMutableDictionary *)(id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v7 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("CIDetectorMinFeatureSize"));
      if (v7)
      {
        v8 = v7;
        objc_msgSend(v7, "floatValue");
        if (v9 >= 0.0 && (objc_msgSend(v8, "floatValue"), v10 <= 1.0))
          -[NSMutableDictionary setObject:forKey:](v6->featureOptions, "setObject:forKey:", v8, CFSTR("CIDetectorMinFeatureSize"));
        else
          NSLog(CFSTR("Unknown CIDetectorMinFeatureSize specified. Ignoring."));
      }
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

void __42__CITextDetector_initWithContext_options___block_invoke()
{
  void *v0;

  v0 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/Futhark.framework"));
  objc_msgSend(v0, "load");
  if (objc_msgSend(v0, "classNamed:", CFSTR("FKTextDetector")))
    initWithContext_options__loadedOK = 1;
  else
    NSLog(CFSTR("FKTextDetector not loaded"));
}

- (void)dealloc
{
  FKTextDetector *textDetector;
  NSMutableDictionary *featureOptions;
  objc_super v5;

  -[CITextDetector setContext:](self, "setContext:", 0);
  textDetector = self->textDetector;
  if (textDetector)
  {

    self->textDetector = 0;
  }
  featureOptions = self->featureOptions;
  if (featureOptions)

  v5.receiver = self;
  v5.super_class = (Class)CITextDetector;
  -[CITextDetector dealloc](&v5, sel_dealloc);
}

- (id)featuresInImage:(id)a3 options:(id)a4
{
  NSObject *v7;
  void (*v8)(uint64_t);
  id v9;
  double x;
  double y;
  double width;
  double height;
  void *v14;
  void *v15;
  float v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  const __CFString *v23;
  CIContext *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  float v28;
  double BoundingBox;
  CGFloat v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  float v36;
  void *v37;
  void *v38;
  unint64_t i;
  void *v40;
  float v41;
  double v42;
  CGFloat v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  float v49;
  uint64_t v50;
  CITextFeature *v51;
  CITextFeature *v52;
  uint64_t v53;
  CITextFeature *v54;
  CITextFeature *v55;
  NSObject *v56;
  int v58;
  id v59;
  void *v60;
  unint64_t v61;
  CGAffineTransform v62;
  CGPoint v63;
  CGPoint v64;
  CGPoint v65;
  CGPoint v66;
  CGPoint v67;
  CGPoint v68;
  CGPoint v69;
  CGPoint v70;
  CGAffineTransform buf;
  uint64_t v72;
  CVPixelBufferRef pixelBufferOut;
  _QWORD v74[2];
  void (*v75)(uint64_t);
  void *v76;
  CITextDetector *v77;
  uint64_t v78;
  _QWORD v79[3];
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;

  v79[1] = *MEMORY[0x1E0C80C00];
  v7 = ci_signpost_log_detector();
  if ((unint64_t)&self->super.super.isa + 1 >= 2)
  {
    v56 = v7;
    if (os_signpost_enabled(v7))
    {
      LOWORD(buf.a) = 0;
      _os_signpost_emit_with_name_impl(&dword_1921E4000, v56, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "CITextDetector", (const char *)&unk_192520C83, (uint8_t *)&buf, 2u);
    }
  }
  v74[0] = MEMORY[0x1E0C809B0];
  v8 = __42__CITextDetector_featuresInImage_options___block_invoke;
  v74[1] = 3221225472;
  v75 = __42__CITextDetector_featuresInImage_options___block_invoke;
  v76 = &__block_descriptor_40_e5_v8__0l;
  v77 = self;
  if (!a3)
  {
    v59 = (id)MEMORY[0x1E0C9AA60];
LABEL_34:
    v8((uint64_t)v74);
    return v59;
  }
  if (self->textDetector)
  {
    v72 = 0;
    pixelBufferOut = 0;
    v59 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    memset(&buf, 0, sizeof(buf));
    v9 = -[CITextDetector adjustedImageFromImage:orientation:inverseCTM:](self, "adjustedImageFromImage:orientation:inverseCTM:", a3, objc_msgSend((id)objc_msgSend(a4, "valueForKey:", CFSTR("CIDetectorImageOrientation")), "intValue"), &buf);
    objc_msgSend(v9, "extent");
    x = v80.origin.x;
    y = v80.origin.y;
    width = v80.size.width;
    height = v80.size.height;
    self->_width = CGRectGetWidth(v80);
    v81.origin.x = x;
    v81.origin.y = y;
    v81.size.width = width;
    v81.size.height = height;
    self->_height = CGRectGetHeight(v81);
    -[FKTextDetector resetOptions](self->textDetector, "resetOptions");
    v14 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", self->featureOptions);
    objc_msgSend(v14, "addEntriesFromDictionary:", a4);
    v15 = (void *)objc_msgSend(v14, "objectForKey:", CFSTR("CIDetectorMinFeatureSize"));
    if (v15)
    {
      objc_msgSend(v15, "floatValue");
      -[FKTextDetector setMinimumCharacterHeight:](self->textDetector, "setMinimumCharacterHeight:", (int)(self->_height * v16));
    }
    v17 = (void *)objc_msgSend(v14, "objectForKey:", CFSTR("CIDetectorDetectDiacritics"));
    if (v17)
      -[FKTextDetector setDetectDiacritics:](self->textDetector, "setDetectDiacritics:", objc_msgSend(v17, "BOOLValue"));
    v18 = (void *)objc_msgSend(v14, "objectForKey:", CFSTR("CIDetectorReturnSubFeatures"));
    if (v18)
      -[FKTextDetector setReturnSubFeatures:](self->textDetector, "setReturnSubFeatures:", objc_msgSend(v18, "BOOLValue"));
    v19 = (void *)objc_msgSend(v14, "objectForKey:", CFSTR("CITextDetectorMinimizeFalseDetections"));
    if (v19)
      -[FKTextDetector setMinimizeFalseDetections:](self->textDetector, "setMinimizeFalseDetections:", objc_msgSend(v19, "BOOLValue"));
    v20 = (void *)objc_msgSend(v14, "objectForKey:", CFSTR("CIDetectorLanguage"));
    v21 = objc_msgSend(v14, "objectForKey:", CFSTR("CIDetectorExtraCharacters"));
    if (!v20 || (v22 = v21, (objc_msgSend(v20, "isEqualToString:", CFSTR("CIDetectorLanguageNone")) & 1) != 0))
    {
      v23 = 0;
LABEL_15:
      -[FKTextDetector setRecognitionLanguage:](self->textDetector, "setRecognitionLanguage:", v23);
      v78 = *MEMORY[0x1E0CA8FF0];
      v79[0] = MEMORY[0x1E0C9AA70];
      CVPixelBufferCreate(0, (unint64_t)self->_width, (unint64_t)self->_height, 0x34323066u, (CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v79, &v78, 1), &pixelBufferOut);
      CVBufferSetAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E0CA8EE8], (CFTypeRef)*MEMORY[0x1E0CA8F10], kCVAttachmentMode_ShouldPropagate);
      if (pixelBufferOut)
      {
        v24 = -[CITextDetector context](self, "context");
        -[CIContext render:toCVPixelBuffer:](v24, "render:toCVPixelBuffer:", v9, pixelBufferOut);
        v25 = (void *)-[FKTextDetector detectFeaturesInBuffer:withRegionOfInterest:error:](self->textDetector, "detectFeaturesInBuffer:withRegionOfInterest:error:", pixelBufferOut, &v72, x, y, width, height);
        if (v72)
          NSLog(CFSTR("Text detection failed with error: %@"), v72);
        CVPixelBufferRelease(pixelBufferOut);
        v26 = 0;
        v60 = v25;
        while (objc_msgSend(v25, "count") > v26)
        {
          v61 = v26;
          v27 = (void *)objc_msgSend(v25, "objectAtIndex:", v26);
          v28 = self->_width;
          BoundingBox = makeBoundingBox(v27, v28);
          v31 = v30;
          v33 = v32;
          v35 = v34;
          v70.x = 0.0;
          v70.y = 0.0;
          v69.x = 0.0;
          v69.y = 0.0;
          v68.x = 0.0;
          v68.y = 0.0;
          v67.x = 0.0;
          v67.y = 0.0;
          v36 = self->_width;
          *(float *)&v30 = self->_height;
          v37 = (void *)objc_msgSend(v27, "subFeatures", makeCorners(v27, &v70, &v69, &v68, &v67, v36, *(float *)&v30));
          v38 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v37, "count"));
          for (i = 0; objc_msgSend(v37, "count") > i; ++i)
          {
            v40 = (void *)objc_msgSend(v37, "objectAtIndex:", i);
            v41 = self->_width;
            v42 = makeBoundingBox(v40, v41);
            v44 = v43;
            v46 = v45;
            v48 = v47;
            v66.x = 0.0;
            v66.y = 0.0;
            v65.x = 0.0;
            v65.y = 0.0;
            v64.x = 0.0;
            v64.y = 0.0;
            v63.x = 0.0;
            v63.y = 0.0;
            v49 = self->_width;
            *(float *)&v43 = self->_height;
            v50 = objc_msgSend(v40, "text", makeCorners(v40, &v66, &v65, &v64, &v63, v49, *(float *)&v43));
            v51 = [CITextFeature alloc];
            v62 = buf;
            v82.origin.x = v42;
            v82.origin.y = v44;
            v82.size.width = v46;
            v82.size.height = v48;
            v83 = CGRectApplyAffineTransform(v82, &v62);
            v52 = -[CITextFeature initWithBounds:topLeft:topRight:bottomLeft:bottomRight:subFeatures:messageString:](v51, "initWithBounds:topLeft:topRight:bottomLeft:bottomRight:subFeatures:messageString:", 0, v50, v83.origin.x, v83.origin.y, v83.size.width, v83.size.height, buf.tx + v66.y * buf.c + buf.a * v66.x, buf.ty + v66.y * buf.d + buf.b * v66.x, buf.tx + buf.c * v64.y + buf.a * v64.x, buf.ty + buf.d * v64.y + buf.b * v64.x, buf.tx + buf.c * v65.y + buf.a * v65.x, buf.ty + buf.d * v65.y + buf.b * v65.x, buf.tx + buf.c * v63.y + buf.a * v63.x, buf.ty + buf.d * v63.y + buf.b * v63.x);
            if (v52)
              objc_msgSend(v38, "addObject:", v52);

          }
          v53 = objc_msgSend(v27, "text");
          v54 = [CITextFeature alloc];
          v62 = buf;
          v84.origin.x = BoundingBox;
          v84.origin.y = v31;
          v84.size.width = v33;
          v84.size.height = v35;
          v85 = CGRectApplyAffineTransform(v84, &v62);
          v55 = -[CITextFeature initWithBounds:topLeft:topRight:bottomLeft:bottomRight:subFeatures:messageString:](v54, "initWithBounds:topLeft:topRight:bottomLeft:bottomRight:subFeatures:messageString:", v38, v53, v85.origin.x, v85.origin.y, v85.size.width, v85.size.height, buf.tx + v70.y * buf.c + buf.a * v70.x, buf.ty + v70.y * buf.d + buf.b * v70.x, buf.tx + buf.c * v68.y + buf.a * v68.x, buf.ty + buf.d * v68.y + buf.b * v68.x, buf.tx + buf.c * v69.y + buf.a * v69.x, buf.ty + buf.d * v69.y + buf.b * v69.x, buf.tx + buf.c * v67.y + buf.a * v67.x, buf.ty + buf.d * v67.y + buf.b * v67.x);
          if (v55)
            objc_msgSend(v59, "addObject:", v55);

          v25 = v60;
          v26 = v61 + 1;
        }
      }
      else
      {
        v59 = (id)MEMORY[0x1E0C9AA60];
      }
      v8 = v75;
      goto LABEL_34;
    }
    if ((objc_msgSend(v20, "isEqualToString:", CFSTR("CIDetectorLanguageASCII")) & 1) != 0)
    {
      v23 = CFSTR("ASCII");
    }
    else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("CIDetectorLanguageEnglish")) & 1) != 0)
    {
      v23 = CFSTR("en");
    }
    else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("CIDetectorLanguageDanish")) & 1) != 0)
    {
      v23 = CFSTR("da");
    }
    else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("CIDetectorLanguageDutch")) & 1) != 0)
    {
      v23 = CFSTR("nl");
    }
    else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("CIDetectorLanguageFrench")) & 1) != 0)
    {
      v23 = CFSTR("fr");
    }
    else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("CIDetectorLanguageGerman")) & 1) != 0)
    {
      v23 = CFSTR("de");
    }
    else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("CIDetectorLanguageIcelandic")) & 1) != 0)
    {
      v23 = CFSTR("is");
    }
    else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("CIDetectorLanguageItalian")) & 1) != 0)
    {
      v23 = CFSTR("it");
    }
    else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("CIDetectorLanguageNorwegian")) & 1) != 0)
    {
      v23 = CFSTR("no");
    }
    else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("CIDetectorLanguagePortuguese")) & 1) != 0)
    {
      v23 = CFSTR("pt");
    }
    else
    {
      if ((objc_msgSend(v20, "isEqualToString:", CFSTR("CIDetectorLanguageSpanish")) & 1) == 0)
      {
        v58 = objc_msgSend(v20, "isEqualToString:", CFSTR("CIDetectorLanguageSwedish"));
        if (v58)
          v23 = CFSTR("se");
        else
          v23 = 0;
        if (!v22)
          goto LABEL_15;
        goto LABEL_59;
      }
      v23 = CFSTR("es");
    }
    v58 = 1;
    if (!v22)
      goto LABEL_15;
LABEL_59:
    if (v58)
      v23 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@;%@"), v23, v22);
    goto LABEL_15;
  }
  v59 = (id)MEMORY[0x1E0C9AA60];
  __42__CITextDetector_featuresInImage_options___block_invoke((uint64_t)v74);
  return v59;
}

void __42__CITextDetector_featuresInImage_options___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v2 = ci_signpost_log_detector();
  v3 = *(_QWORD *)(a1 + 32);
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v4 = v2;
    if (os_signpost_enabled(v2))
    {
      *(_WORD *)v5 = 0;
      _os_signpost_emit_with_name_impl(&dword_1921E4000, v4, OS_SIGNPOST_INTERVAL_END, v3, "CITextDetector", (const char *)&unk_192520C83, v5, 2u);
    }
  }
}

- (id)featuresInImage:(id)a3
{
  return -[CITextDetector featuresInImage:options:](self, "featuresInImage:options:", a3, 0);
}

- (CIContext)context
{
  return self->context;
}

- (void)setContext:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (CGAffineTransform)ctmForImageWithBounds:(SEL)a3 orientation:(CGRect)a4
{
  double v5;
  double v6;
  BOOL v7;
  double v8;
  int v9;
  _OWORD *v10;
  CGFloat y;
  __int128 v12;
  CGAffineTransform v14;
  CGAffineTransform t1;
  _QWORD v16[11];
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  double v27;
  __int128 v28;
  __int128 v29;
  double v30;
  double v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  __int128 v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  __int128 v42;
  double v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = fmax(a4.size.width, a4.size.height);
  t1.b = 0.0;
  t1.c = 0.0;
  v16[0] = 0x3FF0000000000000;
  v16[1] = 0;
  v16[2] = 0;
  v16[3] = 0x3FF0000000000000;
  v16[4] = 0;
  v16[5] = 0;
  v16[6] = 0xBFF0000000000000;
  v16[7] = 0;
  v16[8] = 0;
  v16[9] = 0x3FF0000000000000;
  v6 = 1024.0 / v5;
  v7 = v5 <= 1228.0;
  v8 = 1.0;
  if (!v7)
    v8 = v6;
  *(double *)&v16[10] = a4.size.width * v8;
  v17 = xmmword_1924948E0;
  v18 = 0;
  v19 = 0;
  v20 = 0xBFF0000000000000;
  v21 = a4.size.width * v8;
  v22 = a4.size.height * v8;
  v24 = 0;
  v25 = 0;
  v23 = 0x3FF0000000000000;
  v26 = xmmword_192493540;
  v28 = xmmword_1924948E0;
  v29 = xmmword_192493540;
  v27 = a4.size.height * v8;
  v30 = a4.size.height * v8;
  v31 = a4.size.width * v8;
  v32 = xmmword_1924948E0;
  v34 = 0;
  v35 = 0;
  v33 = 0x3FF0000000000000;
  v36 = a4.size.width * v8;
  v37 = xmmword_1924948F0;
  v39 = 0u;
  v40 = 0u;
  v38 = 0x3FF0000000000000;
  v41 = 0x3FF0000000000000;
  v42 = xmmword_192493540;
  v43 = a4.size.height * v8;
  v44 = 0;
  if ((a5 - 9) >= 0xFFFFFFF8)
    v9 = a5 - 1;
  else
    v9 = 0;
  v10 = &v16[6 * v9];
  t1.a = v8;
  t1.d = v8;
  y = a4.origin.y;
  *(int8x16_t *)&t1.tx = vandq_s8((int8x16_t)vmulq_n_f64(vnegq_f64((float64x2_t)a4.origin), v8), (int8x16_t)vcgtq_f64(vabsq_f64((float64x2_t)a4.origin), (float64x2_t)vdupq_n_s64(0x3F847AE147AE147BuLL)));
  v12 = v10[1];
  *(_OWORD *)&v14.a = *v10;
  *(_OWORD *)&v14.c = v12;
  *(_OWORD *)&v14.tx = v10[2];
  return CGAffineTransformConcat(retstr, &t1, &v14);
}

- (id)adjustedImageFromImage:(id)a3 orientation:(int)a4 inverseCTM:(CGAffineTransform *)a5
{
  uint64_t v6;
  id v7;
  __int128 v9;
  CGAffineTransform v11;
  CGAffineTransform v12;
  CGAffineTransform v13;

  v6 = *(_QWORD *)&a4;
  v7 = a3;
  memset(&v13, 0, sizeof(v13));
  objc_msgSend(a3, "extent");
  if (self)
    -[CITextDetector ctmForImageWithBounds:orientation:](self, "ctmForImageWithBounds:orientation:", v6);
  else
    memset(&v13, 0, sizeof(v13));
  v11 = v13;
  CGAffineTransformInvert(&v12, &v11);
  v9 = *(_OWORD *)&v12.c;
  *(_OWORD *)&a5->a = *(_OWORD *)&v12.a;
  *(_OWORD *)&a5->c = v9;
  *(_OWORD *)&a5->tx = *(_OWORD *)&v12.tx;
  v12 = v13;
  if (!CGAffineTransformIsIdentity(&v12))
  {
    v12 = v13;
    return (id)objc_msgSend(v7, "imageByApplyingTransform:", &v12);
  }
  return v7;
}

@end
