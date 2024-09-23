@implementation MUCGPDFFreeTextAnnotationAdaptor

+ (id)_concreteAKAnnotationWithCGPDFAnnotation:(CGPDFAnnotation *)a3 ofPage:(CGPDFPage *)a4
{
  id v5;
  CGPDFDictionary *CGPDFDictionary;
  CGPDFDictionaryRef value;

  v5 = +[MUPDFAnnotationAdaptorHelper newAKAnnotationFromCGPDFAnnotation:](MUPDFAnnotationAdaptorHelper, "newAKAnnotationFromCGPDFAnnotation:");
  if (!v5)
  {
    CGPDFDictionary = (CGPDFDictionary *)CGPDFAnnotationGetCGPDFDictionary();
    v5 = (id)objc_opt_new();
    objc_msgSend(v5, "setTextIsFixedWidth:", 1);
    objc_msgSend(v5, "setTextIsFixedHeight:", 0);
    +[MUPDFAnnotationAdaptorHelper migrateAKStrokedAnnotationPropertiesTo:fromAnnotationDictionary:ofPDFPage:](MUPDFAnnotationAdaptorHelper, "migrateAKStrokedAnnotationPropertiesTo:fromAnnotationDictionary:ofPDFPage:", v5, CGPDFDictionary, a4);
    +[MUPDFAnnotationAdaptorHelper migrateAKFilledAnnotationPropertiesTo:fromAnnotationDictionary:ofPDFPage:](MUPDFAnnotationAdaptorHelper, "migrateAKFilledAnnotationPropertiesTo:fromAnnotationDictionary:ofPDFPage:", v5, CGPDFDictionary, a4);
    +[MUPDFAnnotationAdaptorHelper migrateAKRectangularShapeAnnotationPropertiesTo:fromAnnotationDictionary:ofPDFPage:](MUPDFAnnotationAdaptorHelper, "migrateAKRectangularShapeAnnotationPropertiesTo:fromAnnotationDictionary:ofPDFPage:", v5, CGPDFDictionary, a4);
    +[MUPDFAnnotationAdaptorHelper migrateAKTextAnnotationPropertiesTo:fromAnnotationDictionary:ofPDFPage:](MUPDFAnnotationAdaptorHelper, "migrateAKTextAnnotationPropertiesTo:fromAnnotationDictionary:ofPDFPage:", v5, CGPDFDictionary, a4);
    value = 0;
    if (CGPDFDictionaryGetDictionary(CGPDFDictionary, "AAPL:AnnotExtras", &value))
      objc_msgSend(v5, "setStrokeWidth:", 0.0);
    objc_msgSend(v5, "setOriginalExifOrientation:", +[MUPDFUtilities exifOrientationOfPage:](MUPDFUtilities, "exifOrientationOfPage:", a4));
    objc_msgSend(v5, "setOriginalModelBaseScaleFactor:", 1.0);
    objc_msgSend(MEMORY[0x24BE03A30], "adjustAnnotationBoundsToFitText:", v5);
    objc_msgSend(v5, "setOriginalExifOrientation:", 0);
    objc_msgSend(v5, "setOriginalModelBaseScaleFactor:", 0.0);
  }
  return v5;
}

+ (id)_concreteDictionaryRepresentationOfAKAnnotation:(id)a3 forPage:(CGPDFPage *)a4
{
  void *v5;
  id v6;
  void *v7;

  v5 = (void *)MEMORY[0x24BDBCED8];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", CFSTR("/Annot"), CFSTR("/Type"));
  objc_msgSend(v7, "setValue:forKey:", CFSTR("/FreeText"), CFSTR("/Subtype"));
  +[MUPDFAnnotationAdaptorHelper addBoundsOfAnnotation:forPage:toDictionary:](MUPDFAnnotationAdaptorHelper, "addBoundsOfAnnotation:forPage:toDictionary:", v6, a4, v7);
  +[MUPDFAnnotationAdaptorHelper addModificationDateOfAnnotation:toDictionary:](MUPDFAnnotationAdaptorHelper, "addModificationDateOfAnnotation:toDictionary:", v6, v7);
  +[MUPDFAnnotationAdaptorHelper addFlagsOfAnnotation:toDictionary:](MUPDFAnnotationAdaptorHelper, "addFlagsOfAnnotation:toDictionary:", v6, v7);
  +[MUPDFAnnotationAdaptorHelper addContentsStringOfAnnotation:toDictionary:](MUPDFAnnotationAdaptorHelper, "addContentsStringOfAnnotation:toDictionary:", v6, v7);
  +[MUPDFAnnotationAdaptorHelper addDefaultAppearanceStreamOfAnnotation:toDictionary:](MUPDFAnnotationAdaptorHelper, "addDefaultAppearanceStreamOfAnnotation:toDictionary:", v6, v7);
  +[MUPDFAnnotationAdaptorHelper addBorderStyleOfAnnotation:toDictionary:](MUPDFAnnotationAdaptorHelper, "addBorderStyleOfAnnotation:toDictionary:", v6, v7);
  +[MUPDFAnnotationAdaptorHelper addQuaddingOfAnnotation:toDictionary:](MUPDFAnnotationAdaptorHelper, "addQuaddingOfAnnotation:toDictionary:", v6, v7);
  +[MUPDFAnnotationAdaptorHelper addTextLabelOfAnnotation:toDictionary:](MUPDFAnnotationAdaptorHelper, "addTextLabelOfAnnotation:toDictionary:", v6, v7);
  +[MUPDFAnnotationAdaptorHelper addAppearanceStreamOfAnnotation:forPage:toDictionary:](MUPDFAnnotationAdaptorHelper, "addAppearanceStreamOfAnnotation:forPage:toDictionary:", v6, a4, v7);
  +[MUPDFAnnotationAdaptorHelper addAKAnnotation:toAnnotationDictionary:](MUPDFAnnotationAdaptorHelper, "addAKAnnotation:toAnnotationDictionary:", v6, v7);

  return v7;
}

@end
