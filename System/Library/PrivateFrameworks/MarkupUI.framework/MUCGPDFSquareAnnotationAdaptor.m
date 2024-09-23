@implementation MUCGPDFSquareAnnotationAdaptor

+ (id)_concreteAKAnnotationWithCGPDFAnnotation:(CGPDFAnnotation *)a3 ofPage:(CGPDFPage *)a4
{
  id v5;
  uint64_t CGPDFDictionary;

  v5 = +[MUPDFAnnotationAdaptorHelper newAKAnnotationFromCGPDFAnnotation:](MUPDFAnnotationAdaptorHelper, "newAKAnnotationFromCGPDFAnnotation:");
  if (!v5)
  {
    CGPDFDictionary = CGPDFAnnotationGetCGPDFDictionary();
    v5 = (id)objc_opt_new();
    +[MUPDFAnnotationAdaptorHelper migrateAKStrokedAnnotationPropertiesTo:fromAnnotationDictionary:ofPDFPage:](MUPDFAnnotationAdaptorHelper, "migrateAKStrokedAnnotationPropertiesTo:fromAnnotationDictionary:ofPDFPage:", v5, CGPDFDictionary, a4);
    +[MUPDFAnnotationAdaptorHelper migrateAKFilledAnnotationPropertiesTo:fromAnnotationDictionary:ofPDFPage:](MUPDFAnnotationAdaptorHelper, "migrateAKFilledAnnotationPropertiesTo:fromAnnotationDictionary:ofPDFPage:", v5, CGPDFDictionary, a4);
    +[MUPDFAnnotationAdaptorHelper migrateAKRectangularShapeAnnotationPropertiesTo:fromAnnotationDictionary:ofPDFPage:](MUPDFAnnotationAdaptorHelper, "migrateAKRectangularShapeAnnotationPropertiesTo:fromAnnotationDictionary:ofPDFPage:", v5, CGPDFDictionary, a4);
    +[MUPDFAnnotationAdaptorHelper migrateAKTextAnnotationPropertiesTo:fromAnnotationDictionary:ofPDFPage:](MUPDFAnnotationAdaptorHelper, "migrateAKTextAnnotationPropertiesTo:fromAnnotationDictionary:ofPDFPage:", v5, CGPDFDictionary, a4);
  }
  return v5;
}

+ (id)_concreteDictionaryRepresentationOfAKAnnotation:(id)a3 forPage:(CGPDFPage *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", CFSTR("/Annot"), CFSTR("/Type"));
  objc_msgSend(v6, "setObject:forKey:", CFSTR("/Square"), CFSTR("/Subtype"));
  +[MUPDFAnnotationAdaptorHelper addBoundsOfAnnotation:forPage:toDictionary:](MUPDFAnnotationAdaptorHelper, "addBoundsOfAnnotation:forPage:toDictionary:", v5, a4, v6);
  +[MUPDFAnnotationAdaptorHelper addModificationDateOfAnnotation:toDictionary:](MUPDFAnnotationAdaptorHelper, "addModificationDateOfAnnotation:toDictionary:", v5, v6);
  +[MUPDFAnnotationAdaptorHelper addFlagsOfAnnotation:toDictionary:](MUPDFAnnotationAdaptorHelper, "addFlagsOfAnnotation:toDictionary:", v5, v6);
  +[MUPDFAnnotationAdaptorHelper addContentsStringOfAnnotation:toDictionary:](MUPDFAnnotationAdaptorHelper, "addContentsStringOfAnnotation:toDictionary:", v5, v6);
  +[MUPDFAnnotationAdaptorHelper addBorderStyleOfAnnotation:toDictionary:](MUPDFAnnotationAdaptorHelper, "addBorderStyleOfAnnotation:toDictionary:", v5, v6);
  if (objc_msgSend(v5, "conformsToAKStrokedAnnotationProtocol"))
  {
    objc_msgSend(v5, "strokeColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MUPDFAnnotationAdaptorHelper addRGBColor:forKey:toDictionary:](MUPDFAnnotationAdaptorHelper, "addRGBColor:forKey:toDictionary:", v7, CFSTR("/C"), v6);

  }
  +[MUPDFAnnotationAdaptorHelper addTextLabelOfAnnotation:toDictionary:](MUPDFAnnotationAdaptorHelper, "addTextLabelOfAnnotation:toDictionary:", v5, v6);
  if (objc_msgSend(v5, "conformsToAKFilledAnnotationProtocol"))
  {
    objc_msgSend(v5, "fillColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      +[MUPDFAnnotationAdaptorHelper addRGBColor:forKey:toDictionary:](MUPDFAnnotationAdaptorHelper, "addRGBColor:forKey:toDictionary:", v8, CFSTR("/IC"), v6);

  }
  +[MUPDFAnnotationAdaptorHelper addAppearanceStreamOfAnnotation:forPage:toDictionary:](MUPDFAnnotationAdaptorHelper, "addAppearanceStreamOfAnnotation:forPage:toDictionary:", v5, a4, v6);
  +[MUPDFAnnotationAdaptorHelper addAKAnnotation:toAnnotationDictionary:](MUPDFAnnotationAdaptorHelper, "addAKAnnotation:toAnnotationDictionary:", v5, v6);

  return v6;
}

@end
