@implementation AXMVisionResult

+ (AXMVisionResult)resultWithImage:(id)a3 features:(id)a4 orientation:(id)a5 metricSession:(id)a6
{
  return (AXMVisionResult *)objc_msgSend(a1, "resultWithImage:features:orientation:metricSession:userContext:", a3, a4, a5, a6, 0);
}

+ (AXMVisionResult)resultWithImage:(id)a3 features:(id)a4 orientation:(id)a5 metricSession:(id)a6 userContext:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = -[AXMVisionResult _init]([AXMVisionResult alloc], "_init");
  objc_msgSend(v16, "setFeatures:", v14);

  objc_msgSend(v16, "setImage:", v15);
  objc_msgSend(v16, "setAppliedImageOrientation:", v13);

  objc_msgSend(v16, "setMetricSession:", v12);
  objc_msgSend(v16, "setUserContext:", v11);

  return (AXMVisionResult *)v16;
}

- (id)_init
{
  id result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AXMVisionResult;
  result = -[AXMVisionResult init](&v3, sel_init);
  if (result)
    *((_QWORD *)result + 10) = 0;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  AXMVisionResult *v4;
  BOOL v5;

  v4 = (AXMVisionResult *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[AXMVisionResult isEqualToAXMVisionResult:](self, "isEqualToAXMVisionResult:", v4);
  }

  return v5;
}

- (BOOL)isEqualToAXMVisionResult:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v5 = a3;
  -[AXMVisionResult features](self, "features");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "features");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqual:", v7))
  {
    -[AXMVisionResult captionTranslationLocale](self, "captionTranslationLocale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 || (objc_msgSend(v5, "captionTranslationLocale"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[AXMVisionResult captionTranslationLocale](self, "captionTranslationLocale");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "captionTranslationLocale");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (v8)
      {
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {
      v11 = 1;
    }

    goto LABEL_9;
  }
  v11 = 0;
LABEL_10:

  return v11;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[AXMVisionResult features](self, "features");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)sortedFeatures
{
  void *v2;
  void *v3;

  -[AXMVisionResult features](self, "features");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingComparator:", &__block_literal_global_10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __33__AXMVisionResult_sortedFeatures__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  double MinY;
  double v9;
  double MinX;
  uint64_t v11;
  double v12;
  void *v14;
  void *v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "featureType");
  if (v6 < objc_msgSend(v5, "featureType"))
    goto LABEL_6;
  v7 = objc_msgSend(v4, "featureType");
  if (v7 > objc_msgSend(v5, "featureType"))
    goto LABEL_8;
  objc_msgSend(v4, "normalizedFrame");
  MinY = CGRectGetMinY(v16);
  objc_msgSend(v5, "normalizedFrame");
  if (MinY >= CGRectGetMinY(v17))
  {
    objc_msgSend(v4, "normalizedFrame");
    v9 = CGRectGetMinY(v18);
    objc_msgSend(v5, "normalizedFrame");
    if (v9 <= CGRectGetMinY(v19))
    {
      objc_msgSend(v4, "normalizedFrame");
      MinX = CGRectGetMinX(v20);
      objc_msgSend(v5, "normalizedFrame");
      if (MinX < CGRectGetMinX(v21))
        goto LABEL_6;
      objc_msgSend(v4, "normalizedFrame");
      v12 = CGRectGetMinX(v22);
      objc_msgSend(v5, "normalizedFrame");
      if (v12 <= CGRectGetMinX(v23))
      {
        objc_msgSend(v4, "value");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "value");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v14, "compare:", v15);

        goto LABEL_9;
      }
    }
LABEL_8:
    v11 = 1;
    goto LABEL_9;
  }
LABEL_6:
  v11 = -1;
LABEL_9:

  return v11;
}

- (AXMVisionFeature)colorInfoFeature
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[AXMVisionResult features](self, "features", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v6, "featureType") == 4)
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (AXMVisionFeature *)v3;
}

- (AXMVisionFeature)assetMetadataFeature
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[AXMVisionResult features](self, "features", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v6, "featureType") == 13)
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (AXMVisionFeature *)v3;
}

- (AXMSemanticTextFactory)semanticTextFactory
{
  AXMSemanticTextFactory *semanticTextFactory;
  AXMSemanticTextFactory *v4;
  AXMSemanticTextFactory *v5;

  semanticTextFactory = self->_semanticTextFactory;
  if (!semanticTextFactory)
  {
    v4 = objc_alloc_init(AXMSemanticTextFactory);
    v5 = self->_semanticTextFactory;
    self->_semanticTextFactory = v4;

    semanticTextFactory = self->_semanticTextFactory;
  }
  return semanticTextFactory;
}

- (id)parentOCRFeatureTypes
{
  return &unk_1E62894A0;
}

- (id)smallestChildOCRFeatureTypes
{
  return &unk_1E62894B8;
}

- (NSString)detectedTextType
{
  NSString *detectedTextType;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  void *v9;
  void *v10;

  detectedTextType = self->_detectedTextType;
  if (!detectedTextType)
  {
    -[AXMVisionResult ocrFeatures](self, "ocrFeatures");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ax_filteredArrayUsingBlock:", &__block_literal_global_40_0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "isValueSpeakable"))
    {
      +[AXMVisionFeature nameForOCRType:](AXMVisionFeature, "nameForOCRType:", objc_msgSend(v6, "ocrFeatureType"));
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      v8 = self->_detectedTextType;
      self->_detectedTextType = v7;

    }
    detectedTextType = self->_detectedTextType;
  }
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByTrimmingCharactersInSet:](detectedTextType, "stringByTrimmingCharactersInSet:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

uint64_t __35__AXMVisionResult_detectedTextType__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isOCR");
}

- (NSString)detectedTextSummary
{
  NSString *detectedTextSummary;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  NSString *v17;
  NSString *v18;
  void *v19;
  void *v20;
  void *v21;
  NSString *v22;
  NSString *v23;
  void *v24;
  void *v25;

  detectedTextSummary = self->_detectedTextSummary;
  if (!detectedTextSummary)
  {
    -[AXMVisionResult ocrFeatures](self, "ocrFeatures");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ax_filteredArrayUsingBlock:", &__block_literal_global_43);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "isValueSpeakable"))
    {
      objc_msgSend(v6, "value");
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      v8 = self->_detectedTextSummary;
      self->_detectedTextSummary = v7;

    }
    -[AXMVisionResult ocrFeatures](self, "ocrFeatures");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ax_filteredArrayUsingBlock:", &__block_literal_global_44);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "isValueSpeakable"))
    {
      objc_msgSend(v11, "values");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "isEqual:", v14);

      if ((v15 & 1) == 0)
      {
        objc_msgSend(v11, "values");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
        v17 = (NSString *)objc_claimAutoreleasedReturnValue();
        v18 = self->_detectedTextSummary;
        self->_detectedTextSummary = v17;

      }
    }
    -[AXMVisionResult ocrFeatures](self, "ocrFeatures");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "ax_filteredArrayUsingBlock:", &__block_literal_global_46);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v21, "isValueSpeakable"))
    {
      objc_msgSend(v21, "value");
      v22 = (NSString *)objc_claimAutoreleasedReturnValue();
      v23 = self->_detectedTextSummary;
      self->_detectedTextSummary = v22;

    }
    detectedTextSummary = self->_detectedTextSummary;
  }
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByTrimmingCharactersInSet:](detectedTextSummary, "stringByTrimmingCharactersInSet:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v25;
}

uint64_t __38__AXMVisionResult_detectedTextSummary__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "isTable") & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "isNutritionLabel");

  return v3;
}

uint64_t __38__AXMVisionResult_detectedTextSummary__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEnvelope");
}

uint64_t __38__AXMVisionResult_detectedTextSummary__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isReceipt");
}

- (NSString)detectedTextDescription
{
  NSString *detectedTextDescription;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSString *v13;
  NSString *v14;

  detectedTextDescription = self->_detectedTextDescription;
  if (!detectedTextDescription)
  {
    -[AXMVisionResult ocrFeatures](self, "ocrFeatures");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ax_filteredArrayUsingBlock:", &__block_literal_global_47);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "isValueSpeakable"))
    {
      objc_msgSend(v6, "value");
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      v8 = self->_detectedTextDescription;
      self->_detectedTextDescription = v7;

    }
    -[AXMVisionResult ocrFeatures](self, "ocrFeatures");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ax_filteredArrayUsingBlock:", &__block_literal_global_48);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "isValueSpeakable"))
    {
      objc_msgSend(v11, "values");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
      v13 = (NSString *)objc_claimAutoreleasedReturnValue();
      v14 = self->_detectedTextDescription;
      self->_detectedTextDescription = v13;

    }
    detectedTextDescription = self->_detectedTextDescription;
  }
  return detectedTextDescription;
}

uint64_t __42__AXMVisionResult_detectedTextDescription__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isTextDocument");
}

uint64_t __42__AXMVisionResult_detectedTextDescription__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEnvelope");
}

- (NSString)localizedDetectedTextTypeHint
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("detected.text.type.hint"), &stru_1E6260C18, CFSTR("Accessibility"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)localizedDetectedTextSummaryHint
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("detected.text.summary.hint"), &stru_1E6260C18, CFSTR("Accessibility"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)localizedDetectedTextHint
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("detected.text.hint"), &stru_1E6260C18, CFSTR("Accessibility"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)_processFeatureChild:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __CFString *v33;
  uint64_t v34;
  __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t i;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id obj;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "ocrFeatureType");
  +[AXMVisionFeature nameForOCRType:](AXMVisionFeature, "nameForOCRType:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMVisionResult parentOCRFeatureTypes](self, "parentOCRFeatureTypes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "containsObject:", v9);

  if (v10)
  {
    objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("AXMType"));
    objc_msgSend(v4, "value");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
      objc_msgSend(v5, "setObject:forKey:", v11, CFSTR("AXMContent"));
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = (void *)v11;
    if (v6 == 2)
    {
      v42 = v5;
      -[AXMVisionResult semanticTextFactory](self, "semanticTextFactory");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "value");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXMVisionResult effectiveTextDetectionLocales](self, "effectiveTextDetectionLocales");
      v45 = v4;
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "firstObject");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "semanticTextForText:withLocale:", v44, v47);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v21, "isSemanticallyComplete"))
      {
        v61 = v7;
        v75 = 0u;
        v76 = 0u;
        v73 = 0u;
        v74 = 0u;
        objc_msgSend(v45, "subfeatures");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v73, v79, 16);
        v4 = v45;
        if (v49)
        {
          v50 = v49;
          v51 = *(_QWORD *)v74;
          do
          {
            for (i = 0; i != v50; ++i)
            {
              if (*(_QWORD *)v74 != v51)
                objc_enumerationMutation(v48);
              -[AXMVisionResult _processFeatureChild:](self, "_processFeatureChild:", *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * i));
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "addObject:", v53);

            }
            v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v73, v79, 16);
          }
          while (v50);
        }

        v5 = v42;
        objc_msgSend(v42, "setObject:forKey:", v12, CFSTR("AXMChildren"));
        v54 = (void *)MEMORY[0x1E0CB3B18];
        objc_msgSend(v4, "normalizedFrame");
        objc_msgSend(v54, "axmValueWithCGRect:");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setObject:forKey:", v55, CFSTR("AXMBounds"));

        v7 = v61;
      }
      else
      {
        v5 = v42;
        v4 = v45;
      }
    }
    else
    {
      v13 = v7;
      if (v6 == 13 || v6 == 7)
        objc_msgSend(v5, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("AXMRowType"));
      v71 = 0u;
      v72 = 0u;
      v69 = 0u;
      v70 = 0u;
      objc_msgSend(v4, "subfeatures");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v70;
        do
        {
          for (j = 0; j != v16; ++j)
          {
            if (*(_QWORD *)v70 != v17)
              objc_enumerationMutation(v14);
            -[AXMVisionResult _processFeatureChild:](self, "_processFeatureChild:", *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * j));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v19);

          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
        }
        while (v16);
      }

      objc_msgSend(v5, "setObject:forKey:", v12, CFSTR("AXMChildren"));
      v20 = (void *)MEMORY[0x1E0CB3B18];
      objc_msgSend(v4, "normalizedFrame");
      objc_msgSend(v20, "axmValueWithCGRect:");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v21, CFSTR("AXMBounds"));
      v7 = v13;
    }

    v22 = v62;
LABEL_43:

    goto LABEL_44;
  }
  -[AXMVisionResult smallestChildOCRFeatureTypes](self, "smallestChildOCRFeatureTypes");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v23, "containsObject:", v24);

  if (v25)
  {
    objc_msgSend(v4, "value");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("AXMType"));
    if (v6 == 4)
    {
      v59 = v5;
      v60 = v7;
      v58 = v4;
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = v22;
      objc_msgSend(v22, "componentsSeparatedByCharactersInSet:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF != ''"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "filteredArrayUsingPredicate:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      obj = v29;
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v66;
        v33 = &stru_1E6260C18;
        while (2)
        {
          v34 = 0;
          v35 = v33;
          do
          {
            if (*(_QWORD *)v66 != v32)
              objc_enumerationMutation(obj);
            v36 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v34);
            -[AXMVisionResult semanticTextFactory](self, "semanticTextFactory");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            -[AXMVisionResult effectiveTextDetectionLocales](self, "effectiveTextDetectionLocales");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "firstObject");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = objc_msgSend(v37, "_textExistsInLexicon:withLocale:", v36, v39);

            if ((v40 & 1) == 0 && !objc_msgSend(v36, "intValue"))
            {

              goto LABEL_40;
            }
            -[__CFString stringByAppendingString:](v35, "stringByAppendingString:", CFSTR(" "));
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "stringByAppendingString:", v36);
            v33 = (__CFString *)objc_claimAutoreleasedReturnValue();

            ++v34;
            v35 = v33;
          }
          while (v31 != v34);
          v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
          if (v31)
            continue;
          break;
        }
      }
      else
      {
LABEL_40:
        v33 = &stru_1E6260C18;
      }

      v5 = v59;
      objc_msgSend(v59, "setObject:forKey:", v33, CFSTR("AXMContent"));

      v4 = v58;
      v7 = v60;
      v22 = v63;
    }
    else
    {
      objc_msgSend(v5, "setObject:forKey:", v22, CFSTR("AXMContent"));
    }
    v56 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend(v4, "normalizedFrame");
    objc_msgSend(v56, "axmValueWithCGRect:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v12, CFSTR("AXMBounds"));
    goto LABEL_43;
  }
LABEL_44:

  return v5;
}

- (id)_processFeatureTree:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v4 = a3;
  v5 = objc_msgSend(v4, "featureType");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  switch(v5)
  {
    case 5:
      +[AXMVisionFeature nameForFeatureType:](AXMVisionFeature, "nameForFeatureType:", 5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("AXMType"));

      objc_msgSend(v4, "faceDetectionResult");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "likelyExpression");
      v10 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("description.face"), &stru_1E6260C18, CFSTR("Accessibility"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[AXMVisionFeatureFaceDetectionResult nameForFaceExpression:](AXMVisionFeatureFaceDetectionResult, "nameForFaceExpression:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v14, CFSTR("AXMContent"));

      v15 = (void *)MEMORY[0x1E0CB3B18];
      objc_msgSend(v4, "normalizedFrame");
      objc_msgSend(v15, "axmValueWithCGRect:");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v16, CFSTR("AXMBounds"));

      goto LABEL_10;
    case 6:
    case 9:
      goto LABEL_11;
    case 7:
      +[AXMVisionFeature nameForFeatureType:](AXMVisionFeature, "nameForFeatureType:", 7);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v21, CFSTR("AXMType"));

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      v20 = CFSTR("description.person");
      goto LABEL_6;
    case 8:
      -[AXMVisionResult _processFeatureChild:](self, "_processFeatureChild:", v4);
      v8 = v6;
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 10:
      +[AXMVisionFeature nameForFeatureType:](AXMVisionFeature, "nameForFeatureType:", 10);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v23, CFSTR("AXMType"));

      objc_msgSend(v4, "classificationLabel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v19, CFSTR("AXMContent"));
      goto LABEL_9;
    default:
      if (v5 != 19)
        goto LABEL_11;
      +[AXMVisionFeature nameForFeatureType:](AXMVisionFeature, "nameForFeatureType:", 19);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v17, CFSTR("AXMType"));

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      v20 = CFSTR("description.prominent.object");
LABEL_6:
      objc_msgSend(v18, "localizedStringForKey:value:table:", v20, &stru_1E6260C18, CFSTR("Accessibility"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v22, CFSTR("AXMContent"));

LABEL_9:
      v24 = (void *)MEMORY[0x1E0CB3B18];
      objc_msgSend(v4, "normalizedFrame");
      objc_msgSend(v24, "axmValueWithCGRect:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v8, CFSTR("AXMBounds"));
LABEL_10:

LABEL_11:
      return v6;
  }
}

- (NSDictionary)detectedFeatureDictionary
{
  void *v3;
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v20;
  id obj;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[5];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMVisionResult evaluatedFeatureTypes](self, "evaluatedFeatureTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v3;
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v24)
  {
    v22 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v32 != v22)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __44__AXMVisionResult_detectedFeatureDictionary__block_invoke;
        v30[3] = &unk_1E625D708;
        v30[4] = v5;
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v30);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXMVisionResult features](self, "features");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "filteredArrayUsingPredicate:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        +[AXMVisionFeature nameForFeatureType:](AXMVisionFeature, "nameForFeatureType:", objc_msgSend(v5, "integerValue"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKey:", v10, CFSTR("AXMTypeContainer"));

        if (objc_msgSend(v5, "integerValue") == 8
          || objc_msgSend(v5, "integerValue") == 5
          || objc_msgSend(v5, "integerValue") == 10
          || objc_msgSend(v5, "integerValue") == 19
          || objc_msgSend(v5, "integerValue") == 7)
        {
          v25 = v7;
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          v29 = 0u;
          v12 = v9;
          v13 = v9;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v27;
            do
            {
              for (j = 0; j != v15; ++j)
              {
                if (*(_QWORD *)v27 != v16)
                  objc_enumerationMutation(v13);
                -[AXMVisionResult _processFeatureTree:](self, "_processFeatureTree:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j));
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v11, "addObject:", v18);

              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
            }
            while (v15);
          }

          objc_msgSend(v6, "setObject:forKey:", v11, CFSTR("AXMChildren"));
          v7 = v25;
          v9 = v12;
        }
        objc_msgSend(v23, "addObject:", v6);

      }
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v24);
  }

  objc_msgSend(v20, "setObject:forKey:", v23, CFSTR("AXMChildren"));
  return (NSDictionary *)v20;
}

BOOL __44__AXMVisionResult_detectedFeatureDictionary__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a2, "featureType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (id)detectedFeatureDescriptionWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v4 = a3;
  +[AXMDescriptionBuilder builderWithOptions:](AXMDescriptionBuilder, "builderWithOptions:", 7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (AXRuntimeCheck_MediaAnalysisSupport())
  {
    -[AXMVisionResult mediaAnalysisFaceFeatures](self, "mediaAnalysisFaceFeatures");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addMediaAnalysisDetectedFaces:", v6);
  }
  else
  {
    -[AXMVisionResult faceFeatures](self, "faceFeatures");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addDetectedFaces:", v6);
  }

  -[AXMVisionResult captionFeatures](self, "captionFeatures");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (AXRuntimeCheck_MediaAnalysisSupport())
  {
    -[AXMVisionResult mediaAnalysisImageCaptionFeatures](self, "mediaAnalysisImageCaptionFeatures");
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }
  if (!objc_msgSend(v7, "count")
    || -[AXMVisionResult includesNSFWFeatures](self, "includesNSFWFeatures")
    || objc_msgSend(v7, "count")
    && (objc_msgSend(v7, "firstObject"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "isLowConfidence"),
        v9,
        v10))
  {
    if (AXRuntimeCheck_MediaAnalysisSupport())
      -[AXMVisionResult mediaAnalysisSceneClassificationFeatures](self, "mediaAnalysisSceneClassificationFeatures");
    else
      -[AXMVisionResult sceneClassificationFeatures](self, "sceneClassificationFeatures");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addDetectedClassificationFeatures:", v11);

  }
  if (AXRuntimeCheck_MediaAnalysisSupport())
  {
    -[AXMVisionResult mediaAnalysisImageCaptionFeatures](self, "mediaAnalysisImageCaptionFeatures");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMediaAnalysisDetectedImageCaption:", v13);
  }
  else
  {
    -[AXMVisionResult captionFeatures](self, "captionFeatures");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDetectedCaption:", v13);
  }

  objc_msgSend(v5, "setIsNSFW:", -[AXMVisionResult includesNSFWFeatures](self, "includesNSFWFeatures"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ModifyForSensitiveContent"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setShouldModifyCaptionForSensitiveContent:", objc_msgSend(v14, "BOOLValue"));
  -[AXMVisionResult sensitiveContentForCaptionFeatures](self, "sensitiveContentForCaptionFeatures");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPrimarySensitiveContentFeature:", v16);

  -[AXMVisionResult blurFeatures](self, "blurFeatures");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBlurFeature:", v18);

  -[AXMVisionResult brightnessFeatures](self, "brightnessFeatures");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "firstObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBrightnessFeature:", v20);

  -[AXMVisionResult iconClassFeatures](self, "iconClassFeatures");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addDetectedIconClasses:", v21);

  objc_msgSend(v5, "buildSpeakableDescription");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)detectedCaptionFeatureDescriptionWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  +[AXMDescriptionBuilder builderWithOptions:](AXMDescriptionBuilder, "builderWithOptions:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMVisionResult captionFeatures](self, "captionFeatures");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (AXRuntimeCheck_MediaAnalysisSupport())
  {
    -[AXMVisionResult mediaAnalysisImageCaptionFeatures](self, "mediaAnalysisImageCaptionFeatures");
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  if (!objc_msgSend(v6, "count")
    || -[AXMVisionResult includesNSFWFeatures](self, "includesNSFWFeatures")
    || objc_msgSend(v6, "count")
    && (objc_msgSend(v6, "firstObject"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isLowConfidence"),
        v8,
        v9))
  {
    if (AXRuntimeCheck_MediaAnalysisSupport())
      -[AXMVisionResult mediaAnalysisSceneClassificationFeatures](self, "mediaAnalysisSceneClassificationFeatures");
    else
      -[AXMVisionResult sceneClassificationFeatures](self, "sceneClassificationFeatures");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addDetectedClassificationFeatures:", v10);

  }
  if (AXRuntimeCheck_MediaAnalysisSupport())
  {
    -[AXMVisionResult mediaAnalysisImageCaptionFeatures](self, "mediaAnalysisImageCaptionFeatures");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMediaAnalysisDetectedImageCaption:", v12);
  }
  else
  {
    -[AXMVisionResult captionFeatures](self, "captionFeatures");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDetectedCaption:", v12);
  }

  objc_msgSend(v5, "setIsNSFW:", -[AXMVisionResult includesNSFWFeatures](self, "includesNSFWFeatures"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ModifyForSensitiveContent"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setShouldModifyCaptionForSensitiveContent:", objc_msgSend(v13, "BOOLValue"));
  -[AXMVisionResult sensitiveContentForCaptionFeatures](self, "sensitiveContentForCaptionFeatures");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPrimarySensitiveContentFeature:", v15);

  objc_msgSend(v5, "buildSpeakableDescription");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)detectedSceneClassificationFeatureDescriptionWithOptions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  +[AXMDescriptionBuilder builderWithOptions:](AXMDescriptionBuilder, "builderWithOptions:", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (AXRuntimeCheck_MediaAnalysisSupport())
    -[AXMVisionResult mediaAnalysisSceneClassificationFeatures](self, "mediaAnalysisSceneClassificationFeatures");
  else
    -[AXMVisionResult sceneClassificationFeatures](self, "sceneClassificationFeatures");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addDetectedClassificationFeatures:", v5);

  objc_msgSend(v4, "buildSpeakableDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)captionTranslationLocale
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (AXRuntimeCheck_MediaAnalysisSupport())
  {
    -[AXMVisionResult mediaAnalysisImageCaptionFeatures](self, "mediaAnalysisImageCaptionFeatures");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaAnalysisTranslatedImageCaption");
  }
  else
  {
    -[AXMVisionResult captionFeatures](self, "captionFeatures");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "translatedCaption");
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "targetLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)localizedDetectedIconHint
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("detected.icon.hint"), &stru_1E6260C18, CFSTR("Accessibility"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMVisionResult)initWithCoder:(id)a3
{
  id v4;
  AXMVisionResult *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
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
  void *v24;
  void *v25;

  v4 = a3;
  v5 = -[AXMVisionResult _init](self, "_init");
  if (v5)
  {
    AXMSecureCodingClasses();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, AXMVisionResultCodingKeyImage);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMVisionResult setImage:](v5, "setImage:", v7);

    AXMSecureCodingClasses();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, AXMVisionResultCodingKeyFeatures);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMVisionResult setFeatures:](v5, "setFeatures:", v9);

    AXMSecureCodingClasses();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("detectedTextDescription"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMVisionResult setDetectedTextDescription:](v5, "setDetectedTextDescription:", v11);

    AXMSecureCodingClasses();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("detectedTextType"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMVisionResult setDetectedTextType:](v5, "setDetectedTextType:", v13);

    AXMSecureCodingClasses();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("detectedTextSummary"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMVisionResult setDetectedTextSummary:](v5, "setDetectedTextSummary:", v15);

    AXMSecureCodingClasses();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("appliedImageOrientation"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMVisionResult setAppliedImageOrientation:](v5, "setAppliedImageOrientation:", v17);

    -[AXMVisionResult setImageRegistrationState:](v5, "setImageRegistrationState:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("imageRegistrationState")));
    AXMSecureCodingClasses();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("userContext"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMVisionResult setUserContext:](v5, "setUserContext:", v19);

    AXMSecureCodingClasses();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("equivalenceToken"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMVisionResult setEquivalenceToken:](v5, "setEquivalenceToken:", v21);

    AXMSecureCodingClasses();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("brailleEdges"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMVisionResult setBrailleEdges:](v5, "setBrailleEdges:", v23);

    AXMSecureCodingClasses();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("effectiveTextDetectionLocales"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMVisionResult setEffectiveTextDetectionLocales:](v5, "setEffectiveTextDetectionLocales:", v25);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  -[AXMVisionResult image](self, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, AXMVisionResultCodingKeyImage);

  -[AXMVisionResult features](self, "features");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, AXMVisionResultCodingKeyFeatures);

  -[AXMVisionResult detectedTextDescription](self, "detectedTextDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("detectedTextDescription"));

  -[AXMVisionResult detectedTextType](self, "detectedTextType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("detectedTextType"));

  -[AXMVisionResult detectedTextSummary](self, "detectedTextSummary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("detectedTextSummary"));

  -[AXMVisionResult effectiveTextDetectionLocales](self, "effectiveTextDetectionLocales");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("effectiveTextDetectionLocales"));

  -[AXMVisionResult appliedImageOrientation](self, "appliedImageOrientation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("appliedImageOrientation"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[AXMVisionResult imageRegistrationState](self, "imageRegistrationState"), CFSTR("imageRegistrationState"));
  -[AXMVisionResult userContext](self, "userContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("userContext"));

  -[AXMVisionResult equivalenceToken](self, "equivalenceToken");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("equivalenceToken"));

  -[AXMVisionResult brailleEdges](self, "brailleEdges");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("brailleEdges"));

  -[AXMVisionResult metricSession](self, "metricSession");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("metrics"));

}

- (NSDictionary)featureGates
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[AXMVisionResult features](self, "features", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "featureGates");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_msgSend(v9, "featureGates");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addEntriesFromDictionary:", v11);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return (NSDictionary *)v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("Locale");
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = CFSTR("ModifyForSensitiveContent");
  v13[0] = v3;
  v13[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMVisionResult detectedFeatureDescriptionWithOptions:](self, "detectedFeatureDescriptionWithOptions:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  -[AXMVisionResult image](self, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMVisionResult features](self, "features");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMVisionResult detectedTextDescription](self, "detectedTextDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("AXMVisionResult<%p>: Image:%@ Results:%@ Feature Description: '%@'. Text Description: '%@'."), self, v7, v8, v5, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (CIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (NSArray)features
{
  return self->_features;
}

- (void)setFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_features, a3);
}

- (NSSet)evaluatedFeatureTypes
{
  return self->_evaluatedFeatureTypes;
}

- (void)setEvaluatedFeatureTypes:(id)a3
{
  objc_storeStrong((id *)&self->_evaluatedFeatureTypes, a3);
}

- (NSNumber)appliedImageOrientation
{
  return self->_appliedImageOrientation;
}

- (void)setAppliedImageOrientation:(id)a3
{
  objc_storeStrong((id *)&self->_appliedImageOrientation, a3);
}

- (void)setDetectedTextDescription:(id)a3
{
  objc_storeStrong((id *)&self->_detectedTextDescription, a3);
}

- (NSArray)effectiveTextDetectionLocales
{
  return self->_effectiveTextDetectionLocales;
}

- (void)setEffectiveTextDetectionLocales:(id)a3
{
  objc_storeStrong((id *)&self->_effectiveTextDetectionLocales, a3);
}

- (void)setDetectedTextSummary:(id)a3
{
  objc_storeStrong((id *)&self->_detectedTextSummary, a3);
}

- (void)setDetectedTextType:(id)a3
{
  objc_storeStrong((id *)&self->_detectedTextType, a3);
}

- (AXMetricSession)metricSession
{
  return self->_metricSession;
}

- (void)setMetricSession:(id)a3
{
  objc_storeStrong((id *)&self->_metricSession, a3);
}

- (int64_t)imageRegistrationState
{
  return self->_imageRegistrationState;
}

- (void)setImageRegistrationState:(int64_t)a3
{
  self->_imageRegistrationState = a3;
}

- (NSSecureCoding)userContext
{
  return self->_userContext;
}

- (void)setUserContext:(id)a3
{
  objc_storeStrong((id *)&self->_userContext, a3);
}

- (NSData)equivalenceToken
{
  return self->_equivalenceToken;
}

- (void)setEquivalenceToken:(id)a3
{
  objc_storeStrong((id *)&self->_equivalenceToken, a3);
}

- (NSData)brailleEdges
{
  return self->_brailleEdges;
}

- (void)setBrailleEdges:(id)a3
{
  objc_storeStrong((id *)&self->_brailleEdges, a3);
}

- (void)setSemanticTextFactory:(id)a3
{
  objc_storeStrong((id *)&self->_semanticTextFactory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_semanticTextFactory, 0);
  objc_storeStrong((id *)&self->_brailleEdges, 0);
  objc_storeStrong((id *)&self->_equivalenceToken, 0);
  objc_storeStrong((id *)&self->_userContext, 0);
  objc_storeStrong((id *)&self->_metricSession, 0);
  objc_storeStrong((id *)&self->_detectedTextType, 0);
  objc_storeStrong((id *)&self->_detectedTextSummary, 0);
  objc_storeStrong((id *)&self->_effectiveTextDetectionLocales, 0);
  objc_storeStrong((id *)&self->_detectedTextDescription, 0);
  objc_storeStrong((id *)&self->_appliedImageOrientation, 0);
  objc_storeStrong((id *)&self->_evaluatedFeatureTypes, 0);
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

- (NSArray)faceFeatures
{
  void *v2;
  void *v3;

  -[AXMVisionResult features](self, "features");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ax_filteredArrayUsingBlock:", &__block_literal_global_248);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __65__AXMVisionResult_AXMVisionEngineLookupConvenience__faceFeatures__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isFace");
}

- (NSArray)sceneClassificationFeatures
{
  void *v2;
  void *v3;

  -[AXMVisionResult features](self, "features");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ax_filteredArrayUsingBlock:", &__block_literal_global_249);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __80__AXMVisionResult_AXMVisionEngineLookupConvenience__sceneClassificationFeatures__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSceneClassification");
}

- (NSArray)objectClassificationFeatures
{
  void *v2;
  void *v3;

  -[AXMVisionResult features](self, "features");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ax_filteredArrayUsingBlock:", &__block_literal_global_250);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __81__AXMVisionResult_AXMVisionEngineLookupConvenience__objectClassificationFeatures__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isObjectClassification");
}

- (NSArray)captionFeatures
{
  void *v2;
  void *v3;

  -[AXMVisionResult features](self, "features");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ax_filteredArrayUsingBlock:", &__block_literal_global_251);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __68__AXMVisionResult_AXMVisionEngineLookupConvenience__captionFeatures__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isCaption");
}

- (NSArray)mediaAnalysisImageCaptionFeatures
{
  void *v2;
  void *v3;

  -[AXMVisionResult features](self, "features");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ax_filteredArrayUsingBlock:", &__block_literal_global_252);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __86__AXMVisionResult_AXMVisionEngineLookupConvenience__mediaAnalysisImageCaptionFeatures__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isMediaAnalysisImageCaption");
}

- (NSArray)mediaAnalysisSceneClassificationFeatures
{
  void *v2;
  void *v3;

  -[AXMVisionResult features](self, "features");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ax_filteredArrayUsingBlock:", &__block_literal_global_253);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __93__AXMVisionResult_AXMVisionEngineLookupConvenience__mediaAnalysisSceneClassificationFeatures__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isMediaAnalysisSceneClassification");
}

- (NSArray)mediaAnalysisObjectClassificationFeatures
{
  void *v2;
  void *v3;

  -[AXMVisionResult features](self, "features");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ax_filteredArrayUsingBlock:", &__block_literal_global_254);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __94__AXMVisionResult_AXMVisionEngineLookupConvenience__mediaAnalysisObjectClassificationFeatures__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isMediaAnalysisObjectClassification");
}

- (NSArray)mediaAnalysisNSFWClassificationFeatures
{
  void *v2;
  void *v3;

  -[AXMVisionResult features](self, "features");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ax_filteredArrayUsingBlock:", &__block_literal_global_255);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __92__AXMVisionResult_AXMVisionEngineLookupConvenience__mediaAnalysisNSFWClassificationFeatures__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isMediaAnalysisNSFWClassification");
}

- (NSArray)mediaAnalysisSignificantEventClassificationFeatures
{
  void *v2;
  void *v3;

  -[AXMVisionResult features](self, "features");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ax_filteredArrayUsingBlock:", &__block_literal_global_256);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __104__AXMVisionResult_AXMVisionEngineLookupConvenience__mediaAnalysisSignificantEventClassificationFeatures__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isMediaAnalysisSignificantEventClassification");
}

- (NSArray)mediaAnalysisFaceFeatures
{
  void *v2;
  void *v3;

  -[AXMVisionResult features](self, "features");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ax_filteredArrayUsingBlock:", &__block_literal_global_257);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __78__AXMVisionResult_AXMVisionEngineLookupConvenience__mediaAnalysisFaceFeatures__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isMediaAnalysisFace");
}

- (BOOL)includesNSFWFeatures
{
  void *v2;
  void *v3;
  BOOL v4;

  -[AXMVisionResult features](self, "features");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ax_filteredArrayUsingBlock:", &__block_literal_global_258);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

uint64_t __73__AXMVisionResult_AXMVisionEngineLookupConvenience__includesNSFWFeatures__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;

  v2 = a2;
  if (AXRuntimeCheck_MediaAnalysisSupport())
    v3 = objc_msgSend(v2, "isMediaAnalysisNSFWClassification");
  else
    v3 = objc_msgSend(v2, "isNSFWClassification");
  v4 = v3;

  return v4;
}

- (NSArray)modelClassificationFeatures
{
  void *v2;
  void *v3;

  -[AXMVisionResult features](self, "features");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ax_filteredArrayUsingBlock:", &__block_literal_global_259);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __80__AXMVisionResult_AXMVisionEngineLookupConvenience__modelClassificationFeatures__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isModelClassification");
}

- (NSArray)ocrFeatures
{
  void *v2;
  void *v3;

  -[AXMVisionResult features](self, "features");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ax_filteredArrayUsingBlock:", &__block_literal_global_260);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __64__AXMVisionResult_AXMVisionEngineLookupConvenience__ocrFeatures__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isOCR");
}

- (NSArray)blurFeatures
{
  void *v2;
  void *v3;

  -[AXMVisionResult features](self, "features");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ax_filteredArrayUsingBlock:", &__block_literal_global_261);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __65__AXMVisionResult_AXMVisionEngineLookupConvenience__blurFeatures__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isBlur");
}

- (NSArray)brightnessFeatures
{
  void *v2;
  void *v3;

  -[AXMVisionResult features](self, "features");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ax_filteredArrayUsingBlock:", &__block_literal_global_262);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __71__AXMVisionResult_AXMVisionEngineLookupConvenience__brightnessFeatures__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isBrightness");
}

- (NSArray)iconClassFeatures
{
  void *v2;
  void *v3;

  -[AXMVisionResult features](self, "features");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ax_filteredArrayUsingBlock:", &__block_literal_global_263);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __70__AXMVisionResult_AXMVisionEngineLookupConvenience__iconClassFeatures__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isIconClass");
}

- (id)sensitiveContentFeatures
{
  void *v2;
  void *v3;

  -[AXMVisionResult features](self, "features");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ax_filteredArrayUsingBlock:", &__block_literal_global_264);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __77__AXMVisionResult_AXMVisionEngineLookupConvenience__sensitiveContentFeatures__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "captionMayContainSensitiveContent");
}

- (NSArray)sensitiveContentForCaptionFeatures
{
  void *v2;
  void *v3;

  -[AXMVisionResult features](self, "features");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ax_filteredArrayUsingBlock:", &__block_literal_global_265);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __87__AXMVisionResult_AXMVisionEngineLookupConvenience__sensitiveContentForCaptionFeatures__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "isMediaAnalysisImageCaption") & 1) != 0)
    v3 = 0;
  else
    v3 = objc_msgSend(v2, "captionMayContainSensitiveContent");

  return v3;
}

- (BOOL)captionMayContainSensitiveContent
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[AXMVisionResult captionFeatures](self, "captionFeatures", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "captionMayContainSensitiveContent") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)includesFeaturesForImageExploration
{
  void *v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  -[AXMVisionResult features](self, "features");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __88__AXMVisionResult_AXMVisionEngineLookupConvenience__includesFeaturesForImageExploration__block_invoke;
  v4[3] = &unk_1E625D980;
  v4[4] = &v5;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v4);

  LOBYTE(v2) = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

void __88__AXMVisionResult_AXMVisionEngineLookupConvenience__includesFeaturesForImageExploration__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v3 = objc_msgSend(v9, "featureType");
  switch(v3)
  {
    case 5:
    case 6:
    case 8:
      goto LABEL_2;
    case 7:
    case 9:
    case 11:
    case 12:
      goto LABEL_9;
    case 10:
      goto LABEL_6;
    case 13:
      objc_msgSend(v9, "assetMetadata");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
LABEL_2:
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      goto LABEL_9;
    default:
      if (v3 == 27)
        goto LABEL_6;
      if (v3 == 31)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
LABEL_6:
        +[AXMPhotoVisionSupport _deniedVoiceOverObjectClassificationLabels](AXMPhotoVisionSupport, "_deniedVoiceOverObjectClassificationLabels");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "classificationLabel");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v4, "containsObject:", v5);

        if ((v6 & 1) == 0)
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;

      }
LABEL_9:

      return;
  }
}

@end
