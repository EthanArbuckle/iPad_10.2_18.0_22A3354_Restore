@implementation MUCGPDFPopupAnnotationAdaptor

+ (id)_concreteAKAnnotationWithCGPDFAnnotation:(CGPDFAnnotation *)a3 ofPage:(CGPDFPage *)a4
{
  id v4;
  uint64_t CGPDFDictionary;
  void *v6;
  void *v7;

  v4 = +[MUPDFAnnotationAdaptorHelper newAKAnnotationFromCGPDFAnnotation:](MUPDFAnnotationAdaptorHelper, "newAKAnnotationFromCGPDFAnnotation:");
  if (!v4)
  {
    CGPDFDictionary = CGPDFAnnotationGetCGPDFDictionary();
    v4 = (id)objc_opt_new();
    +[MUPDFAnnotationAdaptorHelper getTextStringForKey:fromAnnotationDictionary:](MUPDFAnnotationAdaptorHelper, "getTextStringForKey:fromAnnotationDictionary:", "Contents", CGPDFDictionary);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(v4, "setContents:", v6);
    +[MUPDFAnnotationAdaptorHelper getRGBColorForKey:fromAnnotationDictionary:](MUPDFAnnotationAdaptorHelper, "getRGBColorForKey:fromAnnotationDictionary:", "C", CGPDFDictionary);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v4, "setFillColor:", v7);
    objc_msgSend(v4, "setRectangle:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));

  }
  return v4;
}

+ (id)_concreteDictionaryRepresentationOfAKAnnotation:(id)a3 forPage:(CGPDFPage *)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  void *v11;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", CFSTR("/Annot"), CFSTR("/Type"));
  objc_msgSend(v6, "setValue:forKey:", CFSTR("/Popup"), CFSTR("/Subtype"));
  +[MUPDFAnnotationAdaptorHelper addBoundsOfAnnotation:forPage:toDictionary:](MUPDFAnnotationAdaptorHelper, "addBoundsOfAnnotation:forPage:toDictionary:", v5, a4, v6);
  +[MUPDFAnnotationAdaptorHelper addModificationDateOfAnnotation:toDictionary:](MUPDFAnnotationAdaptorHelper, "addModificationDateOfAnnotation:toDictionary:", v5, v6);
  +[MUPDFAnnotationAdaptorHelper addFlagsOfAnnotation:toDictionary:](MUPDFAnnotationAdaptorHelper, "addFlagsOfAnnotation:toDictionary:", v5, v6);
  objc_msgSend(v5, "contents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    objc_msgSend(v5, "contents");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (__CFString *)objc_msgSend(v9, "mutableCopy");

    -[__CFString replaceOccurrencesOfString:withString:options:range:](v10, "replaceOccurrencesOfString:withString:options:range:", CFSTR("/"), CFSTR("//"), 2, 0, 1);
  }
  else
  {
    v10 = &stru_24E5D4C60;
  }
  objc_msgSend(v6, "setObject:forKey:", v10, CFSTR("/Contents"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "fillColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[MUPDFAnnotationAdaptorHelper addRGBColor:forKey:toDictionary:](MUPDFAnnotationAdaptorHelper, "addRGBColor:forKey:toDictionary:", v11, CFSTR("/C"), v6);

  }
  +[MUPDFAnnotationAdaptorHelper addTextLabelOfAnnotation:toDictionary:](MUPDFAnnotationAdaptorHelper, "addTextLabelOfAnnotation:toDictionary:", v5, v6);
  objc_msgSend(v6, "setValue:forKey:", MEMORY[0x24BDBD1C8], CFSTR("/Open"));
  +[MUPDFAnnotationAdaptorHelper addAKAnnotation:toAnnotationDictionary:](MUPDFAnnotationAdaptorHelper, "addAKAnnotation:toAnnotationDictionary:", v5, v6);

  return v6;
}

@end
