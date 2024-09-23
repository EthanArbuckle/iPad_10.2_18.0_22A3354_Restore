@implementation MUCGPDFAnnotationAdaptor

+ (id)supportedAnnotationTypes
{
  if (supportedAnnotationTypes_onceToken != -1)
    dispatch_once(&supportedAnnotationTypes_onceToken, &__block_literal_global_5);
  return (id)supportedAnnotationTypes_sSupportedTypes;
}

void __52__MUCGPDFAnnotationAdaptor_supportedAnnotationTypes__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("Circle"), CFSTR("Popup"), CFSTR("Widget"), CFSTR("FreeText"), CFSTR("Line"), CFSTR("Square"), CFSTR("Stamp"), CFSTR("Highlight"), CFSTR("StrikeOut"), CFSTR("Underline"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)supportedAnnotationTypes_sSupportedTypes;
  supportedAnnotationTypes_sSupportedTypes = v0;

}

+ (id)newAKAnnotationWithCGPDFAnnotation:(CGPDFAnnotation *)a3 ofPage:(CGPDFPage *)a4
{
  CGPDFDictionary *CGPDFDictionary;
  void *v7;
  id v8;
  void *v9;
  double v10;
  void *v11;
  char isKindOfClass;
  char *value;

  CGPDFDictionary = (CGPDFDictionary *)CGPDFAnnotationGetCGPDFDictionary();
  v7 = 0;
  switch(CGPDFAnnotationGetType())
  {
    case 2u:
    case 4u:
    case 5u:
    case 7u:
    case 0xCu:
    case 0x11u:
    case 0x13u:
    case 0x14u:
    case 0x17u:
      goto LABEL_4;
    case 0x19u:
      value = 0;
      if (CGPDFDictionaryGetName(CGPDFDictionary, "FT", (const char **)&value))
        strcmp(value, "Tx");
LABEL_4:
      v8 = (id)objc_opt_self();
      if (v8)
      {
        objc_msgSend(v8, "_concreteAKAnnotationWithCGPDFAnnotation:ofPage:", a3, a4);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v9;
        if (v9)
        {
          objc_msgSend(v9, "originalModelBaseScaleFactor");
          if (v10 == 0.0)
            objc_msgSend(v7, "setOriginalModelBaseScaleFactor:", 1.0);
          if (!objc_msgSend(v7, "originalExifOrientation"))
            objc_msgSend(v7, "setOriginalExifOrientation:", +[MUPDFUtilities exifOrientationOfPage:](MUPDFUtilities, "exifOrientationOfPage:", a4));
          objc_opt_self();
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) == 0)
            +[MUPDFAnnotationAdaptorHelper migrateAppearanceStreamFromCGPDFAnnotationDict:toAKAnnotation:compensatingForPageRotation:](MUPDFAnnotationAdaptorHelper, "migrateAppearanceStreamFromCGPDFAnnotationDict:toAKAnnotation:compensatingForPageRotation:", CGPDFDictionary, v7, +[MUPDFUtilities normalizedRotationAngleOfPage:](MUPDFUtilities, "normalizedRotationAngleOfPage:", a4));
        }
      }
      else
      {
        v7 = 0;
      }
      break;
    default:
      return v7;
  }
  return v7;
}

+ (id)newPlaceholderAKAnnotationWithCGPDFAnnotation:(CGPDFAnnotation *)a3 ofPage:(CGPDFPage *)a4
{
  void *v5;
  void *v6;
  double v7;

  +[MUCGPDFStampAnnotationAdaptor _concreteAKAnnotationWithCGPDFAnnotation:ofPage:](MUCGPDFStampAnnotationAdaptor, "_concreteAKAnnotationWithCGPDFAnnotation:ofPage:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "originalModelBaseScaleFactor");
    if (v7 == 0.0)
      objc_msgSend(v6, "setOriginalModelBaseScaleFactor:", 1.0);
    if (!objc_msgSend(v6, "originalExifOrientation"))
      objc_msgSend(v6, "setOriginalExifOrientation:", +[MUPDFUtilities exifOrientationOfPage:](MUPDFUtilities, "exifOrientationOfPage:", a4));
    +[MUPDFAnnotationAdaptorHelper migrateAppearanceStreamFromCGPDFAnnotationDict:toAKAnnotation:compensatingForPageRotation:](MUPDFAnnotationAdaptorHelper, "migrateAppearanceStreamFromCGPDFAnnotationDict:toAKAnnotation:compensatingForPageRotation:", CGPDFAnnotationGetCGPDFDictionary(), v6, +[MUPDFUtilities normalizedRotationAngleOfPage:](MUPDFUtilities, "normalizedRotationAngleOfPage:", a4));
  }
  return v6;
}

+ (id)pdfDictionaryRepresentationOfAKAnnotation:(id)a3 forPage:(CGPDFPage *)a4
{
  id v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  char v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  char v29;
  void *v30;
  char v31;
  void *v32;
  char v33;
  char v35;

  v5 = a3;
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_self();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_isKindOfClass();

    if ((v9 & 1) == 0)
    {
      objc_opt_self();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_opt_isKindOfClass();

      if ((v11 & 1) == 0)
      {
        objc_opt_self();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_opt_isKindOfClass();

        if ((v13 & 1) == 0)
        {
          objc_opt_self();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_opt_isKindOfClass();

          if ((v15 & 1) == 0)
          {
            objc_opt_self();
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
LABEL_20:

              goto LABEL_21;
            }
            objc_opt_self();
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
LABEL_19:

              goto LABEL_20;
            }
            objc_opt_self();
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
LABEL_18:

              goto LABEL_19;
            }
            objc_opt_self();
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
LABEL_17:

              goto LABEL_18;
            }
            objc_opt_self();
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
LABEL_16:

              goto LABEL_17;
            }
            objc_opt_self();
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
LABEL_15:

              goto LABEL_16;
            }
            objc_opt_self();
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {

              goto LABEL_15;
            }
            objc_opt_self();
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_opt_isKindOfClass();

            if ((v35 & 1) == 0)
            {
              objc_opt_self();
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                goto LABEL_20;
              objc_opt_self();
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                goto LABEL_19;
              objc_opt_self();
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                goto LABEL_18;
              objc_opt_self();
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                goto LABEL_17;
              objc_opt_self();
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_opt_isKindOfClass();

              if ((v27 & 1) == 0)
              {
                objc_opt_self();
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = objc_opt_isKindOfClass();

                if ((v29 & 1) == 0)
                {
                  objc_opt_self();
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  v31 = objc_opt_isKindOfClass();

                  if ((v31 & 1) == 0)
                  {
                    objc_opt_self();
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    v33 = objc_opt_isKindOfClass();

                    if ((v33 & 1) == 0)
                      NSLog(CFSTR("%s: Unsupported annotation: %@"), "+[MUCGPDFAnnotationAdaptor pdfDictionaryRepresentationOfAKAnnotation:forPage:]", v5);
                    goto LABEL_33;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_21:
  v23 = (id)objc_opt_self();
  if (!v23)
  {
LABEL_33:
    v24 = 0;
    goto LABEL_34;
  }
  objc_msgSend(v23, "_concreteDictionaryRepresentationOfAKAnnotation:forPage:", v5, a4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_34:

  return v24;
}

+ (id)_concreteAKAnnotationWithCGPDFAnnotation:(CGPDFAnnotation *)a3 ofPage:(CGPDFPage *)a4
{
  return 0;
}

+ (id)_concreteDictionaryRepresentationOfAKAnnotation:(id)a3 forPage:(CGPDFPage *)a4
{
  return 0;
}

@end
