@implementation MUCGPDFTextWidgetAnnotationAdaptor

+ (id)_concreteAKAnnotationWithCGPDFAnnotation:(CGPDFAnnotation *)a3 ofPage:(CGPDFPage *)a4
{
  id v5;
  CGPDFDictionary *CGPDFDictionary;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  CGPDFDictionaryRef v11;
  CGPDFDictionaryRef v12;
  void *v13;
  CGPDFStringRef string;
  CGPDFInteger v16;
  CGPDFDictionaryRef value;

  v5 = +[MUPDFAnnotationAdaptorHelper newAKAnnotationFromCGPDFAnnotation:](MUPDFAnnotationAdaptorHelper, "newAKAnnotationFromCGPDFAnnotation:");
  if (v5)
    return v5;
  CGPDFDictionary = (CGPDFDictionary *)CGPDFAnnotationGetCGPDFDictionary();
  v16 = 0;
  value = 0;
  string = 0;
  v5 = (id)objc_opt_new();
  objc_msgSend(v5, "setTextIsFixedWidth:", 1);
  objc_msgSend(v5, "setTextIsFixedHeight:", 0);
  +[MUPDFAnnotationAdaptorHelper migrateAKStrokedAnnotationPropertiesTo:fromAnnotationDictionary:ofPDFPage:](MUPDFAnnotationAdaptorHelper, "migrateAKStrokedAnnotationPropertiesTo:fromAnnotationDictionary:ofPDFPage:", v5, CGPDFDictionary, a4);
  +[MUPDFAnnotationAdaptorHelper migrateAKFilledAnnotationPropertiesTo:fromAnnotationDictionary:ofPDFPage:](MUPDFAnnotationAdaptorHelper, "migrateAKFilledAnnotationPropertiesTo:fromAnnotationDictionary:ofPDFPage:", v5, CGPDFDictionary, a4);
  +[MUPDFAnnotationAdaptorHelper migrateAKRectangularShapeAnnotationPropertiesTo:fromAnnotationDictionary:ofPDFPage:](MUPDFAnnotationAdaptorHelper, "migrateAKRectangularShapeAnnotationPropertiesTo:fromAnnotationDictionary:ofPDFPage:", v5, CGPDFDictionary, a4);
  if (!CGPDFDictionaryGetDictionary(CGPDFDictionary, "Parent", &value))
    value = 0;
  +[MUPDFAnnotationAdaptorHelper getFullFieldNameFromAnnotationDictionary:](MUPDFAnnotationAdaptorHelper, "getFullFieldNameFromAnnotationDictionary:", CGPDFDictionary);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFieldName:", v7);

  if (!CGPDFDictionaryGetInteger(CGPDFDictionary, "Ff", &v16) && value)
    CGPDFDictionaryGetInteger(value, "Ff", &v16);
  if (CGPDFDictionaryGetString(CGPDFDictionary, "V", &string) || value && CGPDFDictionaryGetString(value, "V", &string))
    v8 = (__CFString *)CGPDFStringCopyTextString(string);
  else
    v8 = 0;
  if (CGPDFDictionaryGetString(CGPDFDictionary, "DV", &string)
    || value && CGPDFDictionaryGetString(value, "DV", &string))
  {
    v9 = (__CFString *)CGPDFStringCopyTextString(string);
    if (v9)
      objc_msgSend(v5, "setCustomPlaceholderText:", v9);
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (CGPDFDictionaryGetString(CGPDFDictionary, "DA", &string))
  {
    v11 = CGPDFDictionary;
LABEL_23:
    +[MUPDFAnnotationAdaptorHelper readDefaultAppearanceStringFromPDFDictionary:ofPage:toDictionary:](MUPDFAnnotationAdaptorHelper, "readDefaultAppearanceStringFromPDFDictionary:ofPage:toDictionary:", v11, a4, v10);
    goto LABEL_24;
  }
  if (value && CGPDFDictionaryGetString(value, "DA", &string))
  {
    v11 = value;
    goto LABEL_23;
  }
LABEL_24:
  if (CGPDFDictionaryGetString(CGPDFDictionary, "Q", &string))
  {
    v12 = CGPDFDictionary;
  }
  else
  {
    if (!value || !CGPDFDictionaryGetString(value, "Q", &string))
      goto LABEL_30;
    v12 = value;
  }
  +[MUPDFAnnotationAdaptorHelper readQuaddingFromPDFDictionary:toDictionary:](MUPDFAnnotationAdaptorHelper, "readQuaddingFromPDFDictionary:toDictionary:", v12, v10);
LABEL_30:
  if (-[__CFString length](v8, "length"))
  {
    v13 = (void *)objc_msgSend(MEMORY[0x24BE03AB8], "newTextStorageOriginalFontSavvyWithString:attributes:", v8, v10);
    objc_msgSend(v5, "setAnnotationText:", v13);

  }
  else if (!-[__CFString length](v9, "length"))
  {
    objc_msgSend(v5, "setShouldUsePlaceholderText:", 0);
  }
  objc_msgSend(v5, "setTypingAttributes:", v10);
  objc_msgSend(v5, "setOriginalExifOrientation:", +[MUPDFUtilities exifOrientationOfPage:](MUPDFUtilities, "exifOrientationOfPage:", a4));
  objc_msgSend(v5, "setOriginalModelBaseScaleFactor:", 1.0);
  objc_msgSend(MEMORY[0x24BE03A30], "adjustAnnotationBoundsToFitText:", v5);
  objc_msgSend(v5, "setOriginalExifOrientation:", 0);
  objc_msgSend(v5, "setOriginalModelBaseScaleFactor:", 0.0);

  return v5;
}

+ (id)_concreteDictionaryRepresentationOfAKAnnotation:(id)a3 forPage:(CGPDFPage *)a4
{
  id v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v8 = (void *)MEMORY[0x24BDBCED8];
    v9 = v5;
    objc_msgSend(v8, "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setValue:forKey:", CFSTR("/Annot"), CFSTR("/Type"));
    objc_msgSend(v10, "setValue:forKey:", CFSTR("/Widget"), CFSTR("/Subtype"));
    +[MUPDFAnnotationAdaptorHelper addBoundsOfAnnotation:forPage:toDictionary:](MUPDFAnnotationAdaptorHelper, "addBoundsOfAnnotation:forPage:toDictionary:", v9, a4, v10);
    +[MUPDFAnnotationAdaptorHelper addModificationDateOfAnnotation:toDictionary:](MUPDFAnnotationAdaptorHelper, "addModificationDateOfAnnotation:toDictionary:", v9, v10);
    +[MUPDFAnnotationAdaptorHelper addFlagsOfAnnotation:toDictionary:](MUPDFAnnotationAdaptorHelper, "addFlagsOfAnnotation:toDictionary:", v9, v10);
    +[MUPDFAnnotationAdaptorHelper addDefaultAppearanceStreamOfAnnotation:toDictionary:](MUPDFAnnotationAdaptorHelper, "addDefaultAppearanceStreamOfAnnotation:toDictionary:", v9, v10);
    +[MUPDFAnnotationAdaptorHelper addBorderStyleOfAnnotation:toDictionary:](MUPDFAnnotationAdaptorHelper, "addBorderStyleOfAnnotation:toDictionary:", v9, v10);
    +[MUPDFAnnotationAdaptorHelper addQuaddingOfAnnotation:toDictionary:](MUPDFAnnotationAdaptorHelper, "addQuaddingOfAnnotation:toDictionary:", v9, v10);
    +[MUPDFAnnotationAdaptorHelper addTextLabelOfAnnotation:toDictionary:](MUPDFAnnotationAdaptorHelper, "addTextLabelOfAnnotation:toDictionary:", v9, v10);
    objc_msgSend(v10, "setObject:forKey:", CFSTR("/Tx"), CFSTR("/FT"));
    +[MUPDFAnnotationAdaptorHelper addTextOfAnnotation:toDictionary:forKey:canUsePlaceholder:](MUPDFAnnotationAdaptorHelper, "addTextOfAnnotation:toDictionary:forKey:canUsePlaceholder:", v9, v10, CFSTR("/V"), 0);
    objc_msgSend(v9, "customPlaceholderText");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[MUPDFAnnotationAdaptorHelper addString:toDictionary:forKey:](MUPDFAnnotationAdaptorHelper, "addString:toDictionary:forKey:", v11, v10, CFSTR("/DV"));

    objc_msgSend(v9, "fieldName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[MUPDFAnnotationAdaptorHelper addString:toDictionary:forKey:](MUPDFAnnotationAdaptorHelper, "addString:toDictionary:forKey:", v12, v10, CFSTR("/T"));

    +[MUPDFAnnotationAdaptorHelper addAppearanceStreamOfAnnotation:forPage:toDictionary:](MUPDFAnnotationAdaptorHelper, "addAppearanceStreamOfAnnotation:forPage:toDictionary:", v9, a4, v10);
    +[MUPDFAnnotationAdaptorHelper addAKAnnotation:toAnnotationDictionary:](MUPDFAnnotationAdaptorHelper, "addAKAnnotation:toAnnotationDictionary:", v9, v10);

  }
  else
  {
    NSLog(CFSTR("%s: Unexpected parameter type: %@"), "+[MUCGPDFTextWidgetAnnotationAdaptor _concreteDictionaryRepresentationOfAKAnnotation:forPage:]", v5);
    v10 = 0;
  }

  return v10;
}

@end
