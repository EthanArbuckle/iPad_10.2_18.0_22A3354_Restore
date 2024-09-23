@implementation MUCGPDFStampAnnotationAdaptor

+ (id)_concreteAKAnnotationWithCGPDFAnnotation:(CGPDFAnnotation *)a3 ofPage:(CGPDFPage *)a4
{
  id v5;
  uint64_t CGPDFDictionary;

  v5 = +[MUPDFAnnotationAdaptorHelper newAKAnnotationFromCGPDFAnnotation:](MUPDFAnnotationAdaptorHelper, "newAKAnnotationFromCGPDFAnnotation:");
  if (!v5)
  {
    CGPDFDictionary = CGPDFAnnotationGetCGPDFDictionary();
    v5 = (id)objc_opt_new();
    +[MUPDFAnnotationAdaptorHelper migrateAKRectangularShapeAnnotationPropertiesTo:fromAnnotationDictionary:ofPDFPage:](MUPDFAnnotationAdaptorHelper, "migrateAKRectangularShapeAnnotationPropertiesTo:fromAnnotationDictionary:ofPDFPage:", v5, CGPDFDictionary, a4);
    objc_msgSend(v5, "setShouldUsePlaceholderText:", 0);
    objc_msgSend(v5, "setEditsDisableAppearanceOverride:", 0);
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
  objc_msgSend(v7, "setObject:forKey:", CFSTR("/Annot"), CFSTR("/Type"));
  objc_msgSend(v7, "setObject:forKey:", CFSTR("/Stamp"), CFSTR("/Subtype"));
  +[MUPDFAnnotationAdaptorHelper addBoundsOfAnnotation:forPage:toDictionary:](MUPDFAnnotationAdaptorHelper, "addBoundsOfAnnotation:forPage:toDictionary:", v6, a4, v7);
  +[MUPDFAnnotationAdaptorHelper addModificationDateOfAnnotation:toDictionary:](MUPDFAnnotationAdaptorHelper, "addModificationDateOfAnnotation:toDictionary:", v6, v7);
  +[MUPDFAnnotationAdaptorHelper addFlagsOfAnnotation:toDictionary:](MUPDFAnnotationAdaptorHelper, "addFlagsOfAnnotation:toDictionary:", v6, v7);
  +[MUPDFAnnotationAdaptorHelper addContentsStringOfAnnotation:toDictionary:](MUPDFAnnotationAdaptorHelper, "addContentsStringOfAnnotation:toDictionary:", v6, v7);
  +[MUPDFAnnotationAdaptorHelper addTextLabelOfAnnotation:toDictionary:](MUPDFAnnotationAdaptorHelper, "addTextLabelOfAnnotation:toDictionary:", v6, v7);
  +[MUPDFAnnotationAdaptorHelper addAppearanceStreamOfAnnotation:forPage:toDictionary:](MUPDFAnnotationAdaptorHelper, "addAppearanceStreamOfAnnotation:forPage:toDictionary:", v6, a4, v7);
  +[MUPDFAnnotationAdaptorHelper addAKAnnotation:toAnnotationDictionary:](MUPDFAnnotationAdaptorHelper, "addAKAnnotation:toAnnotationDictionary:", v6, v7);

  return v7;
}

@end
