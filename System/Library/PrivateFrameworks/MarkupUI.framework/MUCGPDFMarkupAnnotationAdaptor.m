@implementation MUCGPDFMarkupAnnotationAdaptor

+ (id)_concreteAKAnnotationWithCGPDFAnnotation:(CGPDFAnnotation *)a3 ofPage:(CGPDFPage *)a4
{
  id v4;
  CGPDFDictionary *CGPDFDictionary;
  char *v6;
  uint64_t v7;
  void *v8;
  size_t Count;
  size_t v11;
  void *v12;
  size_t i;
  CGPDFReal v14;
  CGPDFReal v15;
  CGPDFReal v16;
  CGPDFReal v17;
  CGPDFReal v18;
  CGPDFReal v19;
  CGPDFReal v20;
  void *v21;
  _QWORD v22[8];
  CGPDFReal v23;
  CGPDFArrayRef array;
  char *value;

  v4 = +[MUPDFAnnotationAdaptorHelper newAKAnnotationFromCGPDFAnnotation:](MUPDFAnnotationAdaptorHelper, "newAKAnnotationFromCGPDFAnnotation:");
  if (!v4)
  {
    CGPDFDictionary = (CGPDFDictionary *)CGPDFAnnotationGetCGPDFDictionary();
    v4 = (id)objc_opt_new();
    value = 0;
    if (!CGPDFDictionaryGetName(CGPDFDictionary, "Subtype", (const char **)&value))
    {
LABEL_15:

      v4 = 0;
      return v4;
    }
    v6 = value;
    if (!strcmp(value, "Highlight"))
    {
      v7 = 1;
    }
    else if (!strcmp(v6, "Underline"))
    {
      v7 = 2;
    }
    else if (!strcmp(v6, "StrikeOut"))
    {
      v7 = 3;
    }
    else
    {
      NSLog(CFSTR("%s: Unexpected value for key \"Subtype\" : %s"), "+[MUCGPDFMarkupAnnotationAdaptor _concreteAKAnnotationWithCGPDFAnnotation:ofPage:]", v6);
      v7 = 0;
    }
    objc_msgSend(v4, "setStyle:", v7);
    +[MUPDFAnnotationAdaptorHelper getRGBColorForKey:fromAnnotationDictionary:](MUPDFAnnotationAdaptorHelper, "getRGBColorForKey:fromAnnotationDictionary:", "C", CGPDFDictionary);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(v4, "setColor:", v8);
    array = 0;
    if (!CGPDFDictionaryGetArray(CGPDFDictionary, "QuadPoints", &array)
      || (Count = CGPDFArrayGetCount(array), (Count & 7) != 0))
    {

      goto LABEL_15;
    }
    v11 = Count;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", Count >> 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      for (i = 0; i < v11; i += 8)
      {
        v23 = 0.0;
        CGPDFArrayGetNumber(array, i, &v23);
        v14 = v23;
        CGPDFArrayGetNumber(array, i + 1, &v23);
        v15 = v23;
        CGPDFArrayGetNumber(array, i + 2, &v23);
        v16 = v23;
        CGPDFArrayGetNumber(array, i + 3, &v23);
        v17 = v23;
        CGPDFArrayGetNumber(array, i + 4, &v23);
        v18 = v23;
        CGPDFArrayGetNumber(array, i + 5, &v23);
        v19 = v23;
        CGPDFArrayGetNumber(array, i + 6, &v23);
        v20 = v23;
        CGPDFArrayGetNumber(array, i + 7, &v23);
        *(CGPDFReal *)v22 = v18;
        *(CGPDFReal *)&v22[1] = v19;
        *(CGPDFReal *)&v22[2] = v14;
        *(CGPDFReal *)&v22[3] = v15;
        *(CGPDFReal *)&v22[4] = v16;
        *(CGPDFReal *)&v22[5] = v17;
        *(CGPDFReal *)&v22[6] = v20;
        *(CGPDFReal *)&v22[7] = v23;
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithQuadrilateral:", v22);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v21);

      }
    }
    objc_msgSend(v4, "setQuadPoints:", v12);

  }
  return v4;
}

+ (id)_concreteDictionaryRepresentationOfAKAnnotation:(id)a3 forPage:(CGPDFPage *)a4
{
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", CFSTR("/Annot"), CFSTR("/Type"));
  v7 = objc_msgSend(v5, "style") - 1;
  if (v7 <= 2)
    objc_msgSend(v6, "setObject:forKey:", off_24E5D4960[v7], CFSTR("/Subtype"));
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v5, "quadPoints");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        if (v14)
          objc_msgSend(v14, "quadrilateralValue");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 0.0, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v15);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 0.0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v16);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 0.0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v17);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 0.0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v18);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v25);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v19);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 0.0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v20);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 0.0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v21);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 0.0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v22);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v11);
  }

  objc_msgSend(v6, "setObject:forKey:", v8, CFSTR("/QuadPoints"));
  +[MUPDFAnnotationAdaptorHelper addBoundsOfAnnotation:forPage:toDictionary:](MUPDFAnnotationAdaptorHelper, "addBoundsOfAnnotation:forPage:toDictionary:", v5, a4, v6);
  objc_msgSend(v5, "color");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[MUPDFAnnotationAdaptorHelper addRGBColor:forKey:toDictionary:](MUPDFAnnotationAdaptorHelper, "addRGBColor:forKey:toDictionary:", v23, CFSTR("/C"), v6);

  +[MUPDFAnnotationAdaptorHelper addModificationDateOfAnnotation:toDictionary:](MUPDFAnnotationAdaptorHelper, "addModificationDateOfAnnotation:toDictionary:", v5, v6);
  +[MUPDFAnnotationAdaptorHelper addFlagsOfAnnotation:toDictionary:](MUPDFAnnotationAdaptorHelper, "addFlagsOfAnnotation:toDictionary:", v5, v6);
  +[MUPDFAnnotationAdaptorHelper addContentsStringOfAnnotation:toDictionary:](MUPDFAnnotationAdaptorHelper, "addContentsStringOfAnnotation:toDictionary:", v5, v6);
  +[MUPDFAnnotationAdaptorHelper addTextLabelOfAnnotation:toDictionary:](MUPDFAnnotationAdaptorHelper, "addTextLabelOfAnnotation:toDictionary:", v5, v6);
  +[MUPDFAnnotationAdaptorHelper addAppearanceStreamOfAnnotation:forPage:toDictionary:](MUPDFAnnotationAdaptorHelper, "addAppearanceStreamOfAnnotation:forPage:toDictionary:", v5, a4, v6);
  +[MUPDFAnnotationAdaptorHelper addAKAnnotation:toAnnotationDictionary:](MUPDFAnnotationAdaptorHelper, "addAKAnnotation:toAnnotationDictionary:", v5, v6);

  return v6;
}

@end
