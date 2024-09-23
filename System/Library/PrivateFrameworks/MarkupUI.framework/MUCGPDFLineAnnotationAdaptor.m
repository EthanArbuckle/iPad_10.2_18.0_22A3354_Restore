@implementation MUCGPDFLineAnnotationAdaptor

+ (id)_concreteAKAnnotationWithCGPDFAnnotation:(CGPDFAnnotation *)a3 ofPage:(CGPDFPage *)a4
{
  id v5;
  CGPDFDictionary *CGPDFDictionary;
  double v7;
  double v8;
  double v9;
  char *v10;
  char *v11;
  _BOOL4 Array;
  uint64_t v13;
  char *v14;
  char *v16;
  char *__s1;
  CGPDFArrayRef value;

  v5 = +[MUPDFAnnotationAdaptorHelper newAKAnnotationFromCGPDFAnnotation:](MUPDFAnnotationAdaptorHelper, "newAKAnnotationFromCGPDFAnnotation:");
  if (!v5)
  {
    CGPDFDictionary = (CGPDFDictionary *)CGPDFAnnotationGetCGPDFDictionary();
    v5 = (id)objc_opt_new();
    +[MUPDFAnnotationAdaptorHelper migrateAKStrokedAnnotationPropertiesTo:fromAnnotationDictionary:ofPDFPage:](MUPDFAnnotationAdaptorHelper, "migrateAKStrokedAnnotationPropertiesTo:fromAnnotationDictionary:ofPDFPage:", v5, CGPDFDictionary, a4);
    +[MUPDFAnnotationAdaptorHelper migrateAKTextAnnotationPropertiesTo:fromAnnotationDictionary:ofPDFPage:](MUPDFAnnotationAdaptorHelper, "migrateAKTextAnnotationPropertiesTo:fromAnnotationDictionary:ofPDFPage:", v5, CGPDFDictionary, a4);
    objc_msgSend(v5, "strokeWidth");
    if (v7 == 0.0)
      objc_msgSend(v5, "setStrokeWidth:", 1.0);
    value = 0;
    if (!CGPDFDictionaryGetArray(CGPDFDictionary, "L", &value) || CGPDFArrayGetCount(value) != 4)
    {

      return 0;
    }
    v8 = *MEMORY[0x24BDBEFB0];
    v9 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    *(double *)&__s1 = 0.0;
    if (CGPDFArrayGetNumber(value, 0, (CGPDFReal *)&__s1))
      v10 = __s1;
    else
      *(double *)&v10 = v8;
    if (CGPDFArrayGetNumber(value, 1uLL, (CGPDFReal *)&__s1))
      v11 = __s1;
    else
      *(double *)&v11 = v9;
    if (CGPDFArrayGetNumber(value, 2uLL, (CGPDFReal *)&__s1))
      v8 = *(double *)&__s1;
    if (CGPDFArrayGetNumber(value, 3uLL, (CGPDFReal *)&__s1))
      v9 = *(double *)&__s1;
    objc_msgSend(v5, "setStartPoint:", *(double *)&v10, *(double *)&v11);
    objc_msgSend(v5, "setEndPoint:", v8, v9);
    objc_msgSend(v5, "setMidPoint:", (*(double *)&v10 + v8) * 0.5, (*(double *)&v11 + v9) * 0.5);
    Array = CGPDFDictionaryGetArray(CGPDFDictionary, "LE", &value);
    v13 = 0;
    if (Array)
    {
      if (CGPDFArrayGetCount(value) == 2)
      {
        *(double *)&__s1 = 0.0;
        v13 = 0;
        if (CGPDFArrayGetName(value, 0, (const char **)&__s1))
        {
          v14 = __s1;
          v13 = !strcmp(__s1, "OpenArrow") || !strcmp(v14, "ClosedArrow");
        }
        if (CGPDFArrayGetName(value, 1uLL, (const char **)&__s1))
        {
          v16 = __s1;
          if (!strcmp(__s1, "OpenArrow") || !strcmp(v16, "ClosedArrow"))
            v13 |= 2uLL;
        }
      }
      else
      {
        v13 = 0;
      }
    }
    objc_msgSend(v5, "setArrowHeadStyle:", v13);
  }
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
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  __CFString *v27;
  __CFString *v28;
  void *v29;
  __CFString *v30;
  void *v31;
  _QWORD v33[2];
  _QWORD v34[5];

  v34[4] = *MEMORY[0x24BDAC8D0];
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
    objc_msgSend(v10, "setValue:forKey:", CFSTR("/Line"), CFSTR("/Subtype"));
    +[MUPDFAnnotationAdaptorHelper addBoundsOfAnnotation:forPage:toDictionary:](MUPDFAnnotationAdaptorHelper, "addBoundsOfAnnotation:forPage:toDictionary:", v9, a4, v10);
    +[MUPDFAnnotationAdaptorHelper addModificationDateOfAnnotation:toDictionary:](MUPDFAnnotationAdaptorHelper, "addModificationDateOfAnnotation:toDictionary:", v9, v10);
    +[MUPDFAnnotationAdaptorHelper addFlagsOfAnnotation:toDictionary:](MUPDFAnnotationAdaptorHelper, "addFlagsOfAnnotation:toDictionary:", v9, v10);
    +[MUPDFAnnotationAdaptorHelper addContentsStringOfAnnotation:toDictionary:](MUPDFAnnotationAdaptorHelper, "addContentsStringOfAnnotation:toDictionary:", v9, v10);
    objc_msgSend(v9, "startPoint");
    v12 = v11;
    v14 = v13;
    objc_msgSend(v9, "endPoint");
    v16 = v15;
    v18 = v17;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v19;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v14);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = v20;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v34[2] = v21;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v34[3] = v22;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setValue:forKey:", v23, CFSTR("/L"));
    +[MUPDFAnnotationAdaptorHelper addBorderStyleOfAnnotation:toDictionary:](MUPDFAnnotationAdaptorHelper, "addBorderStyleOfAnnotation:toDictionary:", v9, v10);
    objc_msgSend(v9, "strokeColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[MUPDFAnnotationAdaptorHelper addRGBColor:forKey:toDictionary:](MUPDFAnnotationAdaptorHelper, "addRGBColor:forKey:toDictionary:", v24, CFSTR("/C"), v10);

    +[MUPDFAnnotationAdaptorHelper addTextLabelOfAnnotation:toDictionary:](MUPDFAnnotationAdaptorHelper, "addTextLabelOfAnnotation:toDictionary:", v9, v10);
    objc_msgSend(v9, "strokeColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[MUPDFAnnotationAdaptorHelper addRGBColor:forKey:toDictionary:](MUPDFAnnotationAdaptorHelper, "addRGBColor:forKey:toDictionary:", v25, CFSTR("/IC"), v10);

    if ((objc_msgSend(v9, "arrowHeadStyle") & 1) != 0)
      v26 = CFSTR("/ClosedArrow");
    else
      v26 = CFSTR("/None");
    v27 = v26;
    if ((objc_msgSend(v9, "arrowHeadStyle") & 2) != 0)
      v28 = CFSTR("/ClosedArrow");
    else
      v28 = CFSTR("/None");
    v33[0] = v27;
    v33[1] = v28;
    v29 = (void *)MEMORY[0x24BDBCE30];
    v30 = v28;
    objc_msgSend(v29, "arrayWithObjects:count:", v33, 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setValue:forKey:", v31, CFSTR("/LE"));
    +[MUPDFAnnotationAdaptorHelper addAppearanceStreamOfAnnotation:forPage:toDictionary:](MUPDFAnnotationAdaptorHelper, "addAppearanceStreamOfAnnotation:forPage:toDictionary:", v9, a4, v10);
    +[MUPDFAnnotationAdaptorHelper addAKAnnotation:toAnnotationDictionary:](MUPDFAnnotationAdaptorHelper, "addAKAnnotation:toAnnotationDictionary:", v9, v10);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
