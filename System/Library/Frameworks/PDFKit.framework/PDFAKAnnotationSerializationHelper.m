@implementation PDFAKAnnotationSerializationHelper

+ (void)addAKAnnotation:(id)a3 toAnnotationDictionary:(__CFDictionary *)a4
{
  void *v6;
  const __CFAllocator *v7;
  __CFDictionary *Mutable;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  __CFDictionary *MutableCopy;
  __CFDictionary *v14;
  id v15;

  v15 = a3;
  v6 = (void *)MEMORY[0x20BD1ACC8]();
  v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  objc_msgSend(v15, "dataRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "base64EncodedStringWithOptions:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(a1, "_annotationClassHasSeniority:", v15))
      v12 = CFSTR("/AAPL:AKAnnotationObject");
    else
      v12 = CFSTR("/AAPL:AKAnnotationV2");
    CFDictionarySetValue(Mutable, v12, v11);
    MutableCopy = CFDictionaryCreateMutableCopy(v7, 0, a4);
    if (MutableCopy)
    {
      v14 = MutableCopy;
      CFDictionaryRemoveValue(MutableCopy, CFSTR("/AAPL:PaperKit"));
      CFDictionarySetValue(Mutable, CFSTR("/AAPL:AKPDFAnnotationDictionary"), v14);
      CFRelease(v14);
    }
    CFDictionarySetValue(a4, CFSTR("/AAPL:AKExtras"), Mutable);
    CFRelease(Mutable);

  }
  objc_autoreleasePoolPop(v6);

}

+ (id)akAnnotationFromCGPDFAnnotation:(CGPDFAnnotation *)a3 andDictionary:(CGPDFDictionary *)a4
{
  void *v4;
  int IsVersioned;
  void *v8;
  CFStringRef v9;
  __CFString *v10;
  void *v11;
  id v12;
  char v13;
  CGPDFStringRef string;
  CGPDFDictionaryRef value;

  v4 = 0;
  if (a3 && a4)
  {
    IsVersioned = CGPDFAnnotationIsVersioned();
    v8 = (void *)MEMORY[0x20BD1ACC8]();
    if (!IsVersioned || CGPDFAnnotationIsPristine())
    {
      value = 0;
      if (CGPDFDictionaryGetDictionary(a4, "AAPL:AKExtras", &value)
        && ((string = 0, CGPDFDictionaryGetString(value, "AAPL:AKAnnotationObject", &string))
         || CGPDFDictionaryGetString(value, "AAPL:AKAnnotationV2", &string))
        && (v9 = CGPDFStringCopyTextString(string)) != 0)
      {
        v10 = (__CFString *)v9;
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v9, 0);

        objc_msgSend(AKAnnotationClass(), "annotationWithData:", v11);
        v12 = (id)objc_claimAutoreleasedReturnValue();

        objc_autoreleasePoolPop(v8);
        if (v12)
          v13 = IsVersioned;
        else
          v13 = 1;
        if ((v13 & 1) == 0
          && (objc_msgSend(a1, "_shouldUseAKAnnotation:toRepresentCGPDFDictionary:", v12, a4) & 1) == 0)
        {
          goto LABEL_18;
        }
      }
      else
      {
        objc_autoreleasePoolPop(v8);
        v12 = 0;
      }
      v12 = v12;
      v4 = v12;
LABEL_19:

      return v4;
    }
    objc_autoreleasePoolPop(v8);
    v12 = 0;
LABEL_18:
    v4 = 0;
    goto LABEL_19;
  }
  return v4;
}

+ (BOOL)_annotationClassHasSeniority:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isMemberOfClass:", AKInkAnnotationClass()) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", AKDoodleAnnotationClass()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", AKArrowAnnotationClass()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", AKRectAnnotationClass()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", AKOvalAnnotationClass()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", AKTextBoxAnnotationClass()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", AKTextFieldAnnotationClass()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", AKArrowShapeAnnotationClass()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", AKBorderMaskAnnotationClass()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", AKCropAnnotationClass()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", AKHeartAnnotationClass()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", AKImageAnnotationClass()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", AKLoupeAnnotationClass()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", AKPolygonAnnotationClass()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", AKSignatureAnnotationClass()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", AKSpeechBubbleAnnotationClass()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", AKStarAnnotationClass()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", AKThoughtBubbleAnnotationClass()) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isMemberOfClass:", AKTriangleAnnotationClass());
  }

  return v4;
}

+ (BOOL)_shouldUseAKAnnotation:(id)a3 toRepresentCGPDFDictionary:(CGPDFDictionary *)a4
{
  id v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  char v10;
  float64x2_t v11;
  double v12;
  double v13;
  double v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  void *v20;
  CFStringRef v21;
  float64_t v22;
  float64_t v23;
  float64_t v24;
  CGPDFStringRef string;
  float64x2_t v26;
  float64x2_t v27;
  CGPDFDictionaryRef v28;
  CGPDFDictionaryRef value;

  v5 = a3;
  if (!a4)
    goto LABEL_12;
  value = 0;
  if (!CGPDFDictionaryGetDictionary(a4, "AAPL:AKExtras", &value))
  {
LABEL_9:
    v10 = 0;
    goto LABEL_13;
  }
  v28 = 0;
  if (!CGPDFDictionaryGetDictionary(value, "AAPL:AKPDFAnnotationDictionary", &v28))
  {
    AKBorderMaskAnnotationClass();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v11 = *(float64x2_t *)(MEMORY[0x24BDBF090] + 16);
      v26 = *(float64x2_t *)MEMORY[0x24BDBF090];
      v27 = v11;
      if (CGPDFDictionaryGetRect())
      {
        objc_msgSend(v5, "drawingBounds");
        v24 = v12;
        objc_msgSend(v5, "drawingBounds");
        v23 = v13;
        objc_msgSend(v5, "drawingBounds");
        v22 = v14;
        objc_msgSend(v5, "drawingBounds");
        v15.f64[0] = v24;
        v15.f64[1] = v23;
        v16.f64[1] = v22;
        v17 = vabdq_f64(v27, v16);
        v18 = (float64x2_t)vdupq_n_s64(0x3F747AE147AE147BuLL);
        if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vcgeq_f64(v18, vabdq_f64(v26, v15)), (int32x4_t)vcgeq_f64(v18, v17))))) & 1) != 0)goto LABEL_9;
        AKArrowShapeAnnotationClass();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          AKArrowAnnotationClass();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if ((objc_opt_respondsToSelector() & 1) == 0
              || (objc_msgSend(v5, "annotationText"),
                  v20 = (void *)objc_claimAutoreleasedReturnValue(),
                  objc_msgSend(v20, "string"),
                  v6 = (__CFString *)objc_claimAutoreleasedReturnValue(),
                  v20,
                  !v6))
            {
              v6 = &stru_24C25F170;
            }
            string = 0;
            v7 = &stru_24C25F170;
            if (CGPDFDictionaryGetString(a4, "Contents", &string))
            {
              v21 = CGPDFStringCopyTextString(string);
              if (v21)
                v7 = (__CFString *)v21;
            }
            v10 = -[__CFString isEqualToString:](v6, "isEqualToString:", v7);
            goto LABEL_5;
          }
        }
      }
    }
LABEL_12:
    v10 = 1;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x24BDD1650], "mapTableWithKeyOptions:valueOptions:", 1282, 512);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  _dictionaryForPDFDictionary(v28, v6);
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1650], "mapTableWithKeyOptions:valueOptions:", 1282, 512);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _dictionaryForPDFDictionary(a4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString removeObjectForKey:](v7, "removeObjectForKey:", CFSTR("AAPL:AKExtras"));
  objc_msgSend(v9, "removeObjectForKey:", CFSTR("AAPL:AKExtras"));
  objc_msgSend(v9, "removeObjectForKey:", CFSTR("AP"));
  -[__CFString removeObjectForKey:](v7, "removeObjectForKey:", CFSTR("AP"));
  objc_msgSend(v9, "removeObjectForKey:", CFSTR("Parent"));
  -[__CFString removeObjectForKey:](v7, "removeObjectForKey:", CFSTR("Popup"));
  v10 = objc_msgSend(v9, "isEqualToDictionary:", v7);

LABEL_5:
LABEL_13:

  return v10;
}

@end
