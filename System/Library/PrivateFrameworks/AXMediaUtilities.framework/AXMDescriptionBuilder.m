@implementation AXMDescriptionBuilder

+ (id)builderWithOptions:(int64_t)a3
{
  return -[AXMDescriptionBuilder _initWithOptions:]([AXMDescriptionBuilder alloc], "_initWithOptions:", a3);
}

- (id)_initWithOptions:(int64_t)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AXMDescriptionBuilder;
  result = -[AXMDescriptionBuilder init](&v5, sel_init);
  if (result)
    *((_QWORD *)result + 1) = a3;
  return result;
}

- (void)addDetectedFaces:(id)a3
{
  NSMutableArray *faceFeatures;
  NSMutableArray *v5;
  NSMutableArray *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "count"))
  {
    faceFeatures = self->_faceFeatures;
    if (!faceFeatures)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      v6 = self->_faceFeatures;
      self->_faceFeatures = v5;

      faceFeatures = self->_faceFeatures;
    }
    -[NSMutableArray addObjectsFromArray:](faceFeatures, "addObjectsFromArray:", v7);
  }

}

- (void)addMediaAnalysisDetectedFaces:(id)a3
{
  NSMutableArray *mediaAnalysisFaceFeatures;
  NSMutableArray *v5;
  NSMutableArray *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "count"))
  {
    mediaAnalysisFaceFeatures = self->_mediaAnalysisFaceFeatures;
    if (!mediaAnalysisFaceFeatures)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      v6 = self->_mediaAnalysisFaceFeatures;
      self->_mediaAnalysisFaceFeatures = v5;

      mediaAnalysisFaceFeatures = self->_mediaAnalysisFaceFeatures;
    }
    -[NSMutableArray addObjectsFromArray:](mediaAnalysisFaceFeatures, "addObjectsFromArray:", v7);
  }

}

- (void)setMediaAnalysisDetectedImageCaption:(id)a3
{
  objc_storeStrong((id *)&self->_mediaAnalysisImageCaptionFeature, a3);
}

- (void)addDetectedClassificationFeatures:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v9, "classificationLocalizedValue");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "classificationLabel");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXMDescriptionBuilder addDetectedClassificationLocalizedValue:forLabel:](self, "addDetectedClassificationLocalizedValue:forLabel:", v10, v11);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (void)addDetectedClassificationLocalizedValue:(id)a3 forLabel:(id)a4
{
  id v6;
  NSMutableDictionary *classificationLabelsToLocValuesMap;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (objc_msgSend(v10, "length") && objc_msgSend(v6, "length"))
  {
    classificationLabelsToLocValuesMap = self->_classificationLabelsToLocValuesMap;
    if (!classificationLabelsToLocValuesMap)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v9 = self->_classificationLabelsToLocValuesMap;
      self->_classificationLabelsToLocValuesMap = v8;

      classificationLabelsToLocValuesMap = self->_classificationLabelsToLocValuesMap;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](classificationLabelsToLocValuesMap, "setObject:forKeyedSubscript:", v10, v6);
  }

}

- (void)setDetectedCaption:(id)a3
{
  objc_storeStrong((id *)&self->_captionFeature, a3);
}

- (void)addDetectedIconClasses:(id)a3
{
  NSMutableArray *iconClassFeatures;
  NSMutableArray *v5;
  NSMutableArray *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "count"))
  {
    iconClassFeatures = self->_iconClassFeatures;
    if (!iconClassFeatures)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      v6 = self->_iconClassFeatures;
      self->_iconClassFeatures = v5;

      iconClassFeatures = self->_iconClassFeatures;
    }
    -[NSMutableArray addObjectsFromArray:](iconClassFeatures, "addObjectsFromArray:", v7);
  }

}

- (BOOL)_usesTemplateForLowConfidenceAndExplicitFeatures
{
  return self->_builderOptions & 1;
}

- (BOOL)_shouldSummarizeDetectedPeople
{
  return (LOBYTE(self->_builderOptions) >> 1) & 1;
}

- (BOOL)_shouldPersonalizeCaptionWithKnownPeople
{
  return (LOBYTE(self->_builderOptions) >> 2) & 1;
}

- (BOOL)_shouldReplaceCaptionWithGenericTemplate
{
  AXMVisionFeature *v3;
  AXMVisionFeature *v4;
  uint64_t v5;
  __CFString *v6;
  BOOL v7;

  if (-[AXMDescriptionBuilder _usesTemplateForLowConfidenceAndExplicitFeatures](self, "_usesTemplateForLowConfidenceAndExplicitFeatures"))
  {
    v3 = self->_captionFeature;
    if (AXRuntimeCheck_MediaAnalysisSupport())
    {
      v4 = self->_mediaAnalysisImageCaptionFeature;

      v3 = v4;
    }
    v5 = -[AXMVisionFeature isLowConfidence](v3, "isLowConfidence");
    if ((v5 & 1) != 0)
    {
      v6 = CFSTR("caption-low-confidence");
    }
    else
    {
      v5 = -[AXMDescriptionBuilder isNSFW](self, "isNSFW");
      if (!(_DWORD)v5)
      {
        v7 = 0;
        goto LABEL_11;
      }
      v6 = CFSTR("caption-nsfw");
    }
    __65__AXMDescriptionBuilder__shouldReplaceCaptionWithGenericTemplate__block_invoke(v5, v6);
    v7 = 1;
LABEL_11:

    return v7;
  }
  return 0;
}

void __65__AXMDescriptionBuilder__shouldReplaceCaptionWithGenericTemplate__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (!CoreAnalyticsLibraryCore_frameworkLibrary)
  {
    v6 = xmmword_1E625CE00;
    v7 = 0;
    CoreAnalyticsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (CoreAnalyticsLibraryCore_frameworkLibrary)
  {
    dispatch_get_global_queue(17, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__AXMDescriptionBuilder__shouldReplaceCaptionWithGenericTemplate__block_invoke_2;
    block[3] = &unk_1E625CCC0;
    v5 = v2;
    dispatch_async(v3, block);

  }
}

void __65__AXMDescriptionBuilder__shouldReplaceCaptionWithGenericTemplate__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  void (*v3)(const __CFString *, _QWORD *);
  _Unwind_Exception *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;

  v1 = MEMORY[0x1E0C809B0];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__AXMDescriptionBuilder__shouldReplaceCaptionWithGenericTemplate__block_invoke_3;
  v5[3] = &unk_1E625CC98;
  v6 = *(id *)(a1 + 32);
  v2 = v5;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v3 = (void (*)(const __CFString *, _QWORD *))getAnalyticsSendEventLazySymbolLoc_ptr;
  v11 = getAnalyticsSendEventLazySymbolLoc_ptr;
  if (!getAnalyticsSendEventLazySymbolLoc_ptr)
  {
    v7[0] = v1;
    v7[1] = 3221225472;
    v7[2] = __getAnalyticsSendEventLazySymbolLoc_block_invoke;
    v7[3] = &unk_1E625C4E8;
    v7[4] = &v8;
    __getAnalyticsSendEventLazySymbolLoc_block_invoke((uint64_t)v7);
    v3 = (void (*)(const __CFString *, _QWORD *))v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v3)
  {
    v4 = (_Unwind_Exception *)__77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v4);
  }
  v3(CFSTR("com.apple.accessibility.vot.caption.fallbacktemplates"), v2);

}

id __65__AXMDescriptionBuilder__shouldReplaceCaptionWithGenericTemplate__block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = CFSTR("fallbacktemplate");
  v4[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)buildSpeakableDescription
{
  NSMutableString *speakableDescription;
  NSMutableString *v5;
  NSMutableString *v6;
  AXMVisionFeature *v7;
  AXMVisionFeature *v8;
  _BOOL4 v9;
  NSMutableString *v10;
  NSMutableString *v11;
  char v12;

  speakableDescription = self->_speakableDescription;
  if (speakableDescription)
    return speakableDescription;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (NSMutableString *)objc_claimAutoreleasedReturnValue();
  v6 = self->_speakableDescription;
  self->_speakableDescription = v5;

  v12 = 0;
  v7 = self->_captionFeature;
  if (AXRuntimeCheck_MediaAnalysisSupport())
  {
    v8 = self->_mediaAnalysisImageCaptionFeature;

    v7 = v8;
  }
  if (v7)
  {
    v9 = -[AXMDescriptionBuilder _shouldReplaceCaptionWithGenericTemplate](self, "_shouldReplaceCaptionWithGenericTemplate");
    v10 = self->_speakableDescription;
    if (v9)
      -[AXMDescriptionBuilder _addGenericTemplateForCaptionInformationToDescription:](self, "_addGenericTemplateForCaptionInformationToDescription:", v10);
    else
      -[AXMDescriptionBuilder _addCaptionInformationToDescription:didConsumeDetectedFaceInfo:](self, "_addCaptionInformationToDescription:didConsumeDetectedFaceInfo:", v10, &v12);
  }
  -[AXMDescriptionBuilder _addBrightnessInformationToDescription:](self, "_addBrightnessInformationToDescription:", self->_speakableDescription);
  -[AXMDescriptionBuilder _addBlurInformationToDescription:](self, "_addBlurInformationToDescription:", self->_speakableDescription);
  if (!v12)
  {
    -[AXMDescriptionBuilder _addFaceInformationToDescription:](self, "_addFaceInformationToDescription:", self->_speakableDescription);
    v12 = 1;
    if (v7)
      goto LABEL_12;
    goto LABEL_11;
  }
  if (!v7)
LABEL_11:
    -[AXMDescriptionBuilder _addClassificationInformationToDescription:](self, "_addClassificationInformationToDescription:", self->_speakableDescription);
LABEL_12:
  -[AXMDescriptionBuilder _addIconClassInformationToDescription:](self, "_addIconClassInformationToDescription:", self->_speakableDescription);
  v11 = self->_speakableDescription;

  return v11;
}

- (id)_stringForPauseType:(int64_t)a3
{
  if (a3)
    return CFSTR(".");
  else
    return CFSTR(",");
}

- (void)_appendPauseType:(int64_t)a3 toDescriptionIfNeeded:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  if (objc_msgSend(v7, "length")
    && (objc_msgSend(v7, "hasSuffix:", CFSTR(",")) & 1) == 0
    && (objc_msgSend(v7, "hasSuffix:", CFSTR(".")) & 1) == 0)
  {
    -[AXMDescriptionBuilder _stringForPauseType:](self, "_stringForPauseType:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR("%@ "), v6);

  }
}

- (void)_appendToDescription:(id)a3 afterPauseType:(int64_t)a4 withContents:(id)a5
{
  id v8;
  id v9;

  v9 = a3;
  v8 = a5;
  if (objc_msgSend(v8, "length"))
  {
    -[AXMDescriptionBuilder _appendPauseType:toDescriptionIfNeeded:](self, "_appendPauseType:toDescriptionIfNeeded:", a4, v9);
    objc_msgSend(v9, "appendString:", v8);
  }

}

- (void)_addBrightnessInformationToDescription:(id)a3
{
  AXMVisionFeature *brightnessFeature;
  id v5;
  double v6;
  const __CFString *v7;
  void *v8;
  id v9;

  brightnessFeature = self->_brightnessFeature;
  if (brightnessFeature)
  {
    v5 = a3;
    -[AXMVisionFeature brightness](brightnessFeature, "brightness");
    if (v6 <= 0.2)
    {
      v7 = CFSTR("photo.description.brightness.level.1");
    }
    else if (v6 <= 0.4)
    {
      v7 = CFSTR("photo.description.brightness.level.2");
    }
    else if (v6 <= 0.6)
    {
      v7 = CFSTR("photo.description.brightness.level.3");
    }
    else if (v6 <= 0.8)
    {
      v7 = CFSTR("photo.description.brightness.level.4");
    }
    else
    {
      v7 = CFSTR("photo.description.brightness.level.5");
    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", v7, &stru_1E6260C18, CFSTR("Accessibility"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMDescriptionBuilder _appendToDescription:afterPauseType:withContents:](self, "_appendToDescription:afterPauseType:withContents:", v5, 0, v8);

  }
}

- (void)_addBlurInformationToDescription:(id)a3
{
  AXMVisionFeature *blurFeature;
  id v5;
  double v6;
  const __CFString *v7;
  void *v8;
  id v9;

  blurFeature = self->_blurFeature;
  if (blurFeature)
  {
    v5 = a3;
    -[AXMVisionFeature blur](blurFeature, "blur");
    if (v6 >= 0.166666667)
    {
      if (v6 >= 0.333333333)
      {
        if (v6 >= 0.5)
        {
          if (v6 >= 0.666666667)
          {
            if (v6 >= 0.833333333)
              v7 = CFSTR("photo.description.blurriness.level.6");
            else
              v7 = CFSTR("photo.description.blurriness.level.5");
          }
          else
          {
            v7 = CFSTR("photo.description.blurriness.level.4");
          }
        }
        else
        {
          v7 = CFSTR("photo.description.blurriness.level.3");
        }
      }
      else
      {
        v7 = CFSTR("photo.description.blurriness.level.2");
      }
    }
    else
    {
      v7 = CFSTR("photo.description.blurriness.level.1");
    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", v7, &stru_1E6260C18, CFSTR("Accessibility"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMDescriptionBuilder _appendToDescription:afterPauseType:withContents:](self, "_appendToDescription:afterPauseType:withContents:", v5, 0, v8);

  }
}

- (id)_knownPersonNames
{
  uint64_t v3;
  NSMutableArray *v4;
  NSMutableArray *v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = -[NSMutableArray count](self->_faceFeatures, "count");
  v4 = self->_faceFeatures;
  if (AXRuntimeCheck_MediaAnalysisSupport())
  {
    v3 = -[NSMutableArray count](self->_mediaAnalysisFaceFeatures, "count");
    v5 = self->_mediaAnalysisFaceFeatures;

    v4 = v5;
  }
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = v4;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v12, "faceDetectionResult", (_QWORD)v18);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (AXRuntimeCheck_MediaAnalysisSupport())
          {
            objc_msgSend(v12, "mediaAnalysisFaceDetectionResult");
            v14 = objc_claimAutoreleasedReturnValue();

            v13 = (void *)v14;
          }
          objc_msgSend(v13, "name");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v15, "length"))
            objc_msgSend(v6, "addObject:", v15);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }

    objc_msgSend(v6, "allObjects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v16;
}

- (void)_addPersonSummaryToDescription:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  -[AXMDescriptionBuilder _knownPersonNames](self, "_knownPersonNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    if (objc_msgSend(v4, "count") == 1)
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("people.summary.one.person"), &stru_1E6260C18, CFSTR("Accessibility"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringWithFormat:", v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXMDescriptionBuilder _appendToDescription:afterPauseType:withContents:](self, "_appendToDescription:afterPauseType:withContents:", v15, 0, v9);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3738], "localizedStringByJoiningStrings:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[NSMutableArray count](self->_faceFeatures, "count");
      if (AXRuntimeCheck_MediaAnalysisSupport())
        v10 = -[NSMutableArray count](self->_mediaAnalysisFaceFeatures, "count");
      v11 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("people.summary.multiple.people"), &stru_1E6260C18, CFSTR("Accessibility"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0CB37F0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringFromNumber:numberStyle:", v9, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringWithFormat:", v8, v13, v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXMDescriptionBuilder _appendToDescription:afterPauseType:withContents:](self, "_appendToDescription:afterPauseType:withContents:", v15, 0, v14);

    }
  }

}

- (void)_addDetailedFaceInformationToDescription:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSMutableArray *v12;
  unint64_t v13;
  void *i;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSMutableArray *v45;
  AXMDescriptionBuilder *v46;
  uint64_t v47;
  uint64_t v48;
  id obj;
  id obja;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_faceFeatures;
  if (AXRuntimeCheck_MediaAnalysisSupport())
  {
    v6 = self->_mediaAnalysisFaceFeatures;

    v5 = v6;
  }
  if (-[NSMutableArray count](v5, "count"))
  {
    -[NSMutableArray sortUsingComparator:](v5, "sortUsingComparator:", &__block_literal_global_77);
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("photo.description.faces"), &stru_1E6260C18, CFSTR("Accessibility"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, -[NSMutableArray count](v5, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMDescriptionBuilder _appendToDescription:afterPauseType:withContents:](self, "_appendToDescription:afterPauseType:withContents:", v4, 0, v10);

    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v45 = v5;
    v12 = v5;
    obj = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
    v51 = v11;
    if (obj)
    {
      v47 = 1;
      v48 = *(_QWORD *)v57;
      v13 = 0x1E0CB3000uLL;
      v46 = self;
      do
      {
        for (i = 0; i != obj; i = (char *)i + 1)
        {
          if (*(_QWORD *)v57 != v48)
            objc_enumerationMutation(v12);
          v15 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v15, "faceDetectionResult");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (AXRuntimeCheck_MediaAnalysisSupport())
          {
            objc_msgSend(v15, "mediaAnalysisFaceDetectionResult");
            v17 = objc_claimAutoreleasedReturnValue();

            v16 = (void *)v17;
          }
          v18 = objc_msgSend(v16, "likelyExpression");
          if ((v18 & 0xFFFFFFFFFFFFFFFDLL) != 0)
          {
            v19 = v18;
            objc_msgSend(*(id *)(v13 + 2024), "numberWithInteger:", v18);
            v20 = v13;
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "objectForKey:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (v22)
            {
              objc_msgSend(*(id *)(v20 + 2024), "numberWithInteger:", objc_msgSend(v22, "integerValue") + 1);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(v20 + 2024), "numberWithInteger:", v19);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "setObject:forKey:", v23, v24);

            }
            else
            {
              objc_msgSend(*(id *)(v20 + 2024), "numberWithInteger:", v19);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "setObject:forKey:", &unk_1E6288138, v23);
            }

            v13 = 0x1E0CB3000;
          }
          objc_msgSend(v16, "attributes");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[NSMutableArray count](v12, "count") != 1)
          {
            v26 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("face.number"), &stru_1E6260C18, CFSTR("Accessibility"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            self = v46;
            objc_msgSend(v26, "localizedStringWithFormat:", v28, (char *)i + v47);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[AXMDescriptionBuilder _appendToDescription:afterPauseType:withContents:](v46, "_appendToDescription:afterPauseType:withContents:", v4, 0, v29);

            v11 = v51;
            v13 = 0x1E0CB3000;
          }
          objc_msgSend(v16, "name");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[AXMDescriptionBuilder _appendToDescription:afterPauseType:withContents:](self, "_appendToDescription:afterPauseType:withContents:", v4, 0, v30);

          objc_msgSend(v25, "accessibilityLabelForAttributes");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[AXMDescriptionBuilder _appendToDescription:afterPauseType:withContents:](self, "_appendToDescription:afterPauseType:withContents:", v4, 0, v31);

        }
        v47 = (v47 + (_DWORD)i);
        obj = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
      }
      while (obj);
    }

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    objc_msgSend(v11, "allKeys");
    obja = (id)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v53;
      do
      {
        for (j = 0; j != v33; ++j)
        {
          if (*(_QWORD *)v53 != v34)
            objc_enumerationMutation(obja);
          v36 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * j);
          objc_msgSend(v11, "objectForKey:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v37, "integerValue");

          +[AXMVisionFeatureFaceDetectionResult localizedStringFormatterForExpression:](AXMVisionFeatureFaceDetectionResult, "localizedStringFormatterForExpression:", v36);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "localizedStringForKey:value:table:", v39, &stru_1E6260C18, CFSTR("Accessibility"));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = v40;
          v11 = v51;
          objc_msgSend(v43, "localizedStringWithFormat:", v42, v38);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          -[AXMDescriptionBuilder _appendToDescription:afterPauseType:withContents:](self, "_appendToDescription:afterPauseType:withContents:", v4, 0, v44);

        }
        v33 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
      }
      while (v33);
    }

    v5 = v45;
  }

}

uint64_t __66__AXMDescriptionBuilder__addDetailedFaceInformationToDescription___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "faceDetectionResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (AXRuntimeCheck_MediaAnalysisSupport())
  {
    objc_msgSend(v4, "mediaAnalysisFaceDetectionResult");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }
  objc_msgSend(v5, "faceDetectionResult");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (AXRuntimeCheck_MediaAnalysisSupport())
  {
    objc_msgSend(v5, "mediaAnalysisFaceDetectionResult");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "name");
    v13 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v13;
  }
  v14 = 0;
  if (v7 && v11)
    v14 = objc_msgSend(v7, "compare:", v11);

  return v14;
}

- (void)_addFaceInformationToDescription:(id)a3
{
  id v4;

  v4 = a3;
  if (-[AXMDescriptionBuilder _shouldSummarizeDetectedPeople](self, "_shouldSummarizeDetectedPeople"))
    -[AXMDescriptionBuilder _addPersonSummaryToDescription:](self, "_addPersonSummaryToDescription:", v4);
  else
    -[AXMDescriptionBuilder _addDetailedFaceInformationToDescription:](self, "_addDetailedFaceInformationToDescription:", v4);

}

- (void)_addCaptionInformationToDescription:(id)a3 didConsumeDetectedFaceInfo:(BOOL *)a4
{
  id v6;
  AXMVisionFeature *v7;
  void *v8;
  AXMVisionFeature *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  uint64_t i;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  __CFString *v27;
  uint64_t v28;
  uint64_t v29;
  __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  const __CFString *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  const __CFString *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  id v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = self->_captionFeature;
  -[AXMVisionFeature translatedCaption](v7, "translatedCaption");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (AXRuntimeCheck_MediaAnalysisSupport())
  {
    v9 = self->_mediaAnalysisImageCaptionFeature;

    -[AXMVisionFeature mediaAnalysisTranslatedImageCaption](v9, "mediaAnalysisTranslatedImageCaption");
    v10 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v10;
    v7 = v9;
  }
  if (v8)
  {
    +[AXMLocSupport sharedInstance](AXMLocSupport, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "targetLocale");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "localeBaseLanguageIsEnglish:", v12);

    objc_msgSend(v8, "text");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if ((v13 & 1) == 0)
    {
LABEL_72:
      -[AXMDescriptionBuilder _appendToDescription:afterPauseType:withContents:](self, "_appendToDescription:afterPauseType:withContents:", v6, 0, v15);
      goto LABEL_73;
    }
    if (!-[NSObject length](v14, "length"))
    {
LABEL_73:

      goto LABEL_74;
    }
    if (!-[AXMDescriptionBuilder _shouldPersonalizeCaptionWithKnownPeople](self, "_shouldPersonalizeCaptionWithKnownPeople"))
    {
LABEL_38:
      if (!-[AXMDescriptionBuilder shouldModifyCaptionForSensitiveContent](self, "shouldModifyCaptionForSensitiveContent"))goto LABEL_72;
      -[AXMDescriptionBuilder primarySensitiveContentFeature](self, "primarySensitiveContentFeature");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v33)
        goto LABEL_72;
      -[AXMDescriptionBuilder primarySensitiveContentFeature](self, "primarySensitiveContentFeature");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "classificationLabel");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v35, "isEqualToString:", CFSTR("Blood"))
        && (-[NSObject containsString:](v15, "containsString:", CFSTR("blood")) & 1) == 0)
      {
        v36 = CFSTR(" that might contain blood");
      }
      else if (objc_msgSend(v35, "isEqualToString:", CFSTR("Demonstration"))
             && (-[NSObject containsString:](v15, "containsString:", CFSTR("demonstration")) & 1) == 0)
      {
        v36 = CFSTR(" that might be a demonstration");
      }
      else
      {
        if (!objc_msgSend(v35, "isEqualToString:", CFSTR("Destruction")))
        {
          if (objc_msgSend(v35, "isEqualToString:", CFSTR("Fire Devastation"))
            && (-[NSObject containsString:](v15, "containsString:", CFSTR("fire")) & 1) == 0)
          {
            v36 = CFSTR(" that might include fire");
            goto LABEL_70;
          }
          if (objc_msgSend(v35, "isEqualToString:", CFSTR("Flood Devastation"))
            && (-[NSObject containsString:](v15, "containsString:", CFSTR("flood")) & 1) == 0)
          {
            v36 = CFSTR(" that might be a flood");
            goto LABEL_70;
          }
          if (objc_msgSend(v35, "isEqualToString:", CFSTR("Funeral"))
            && (-[NSObject containsString:](v15, "containsString:", CFSTR("funeral")) & 1) == 0)
          {
            v36 = CFSTR(" that might be a funeral");
            goto LABEL_70;
          }
          if (objc_msgSend(v35, "isEqualToString:", CFSTR("Hospital"))
            && (-[NSObject containsString:](v15, "containsString:", CFSTR("hospital")) & 1) == 0)
          {
            v36 = CFSTR(" that might be a hospital");
            goto LABEL_70;
          }
          if (objc_msgSend(v35, "isEqualToString:", CFSTR("Religious Setting"))
            && (-[NSObject containsString:](v15, "containsString:", CFSTR("religious")) & 1) == 0)
          {
            v36 = CFSTR(" that might be a religious setting");
            goto LABEL_70;
          }
          if (objc_msgSend(v35, "isEqualToString:", CFSTR("Vehicle Crash"))
            && (-[NSObject containsString:](v15, "containsString:", CFSTR("crash")) & 1) == 0)
          {
            v36 = CFSTR(" that might be a vehicle crash");
            goto LABEL_70;
          }
          if (!objc_msgSend(v35, "isEqualToString:", CFSTR("War"))
            || (-[NSObject containsString:](v15, "containsString:", CFSTR("war")) & 1) != 0)
          {
            AXMediaLogCommon();
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
              -[AXMDescriptionBuilder _addCaptionInformationToDescription:didConsumeDetectedFaceInfo:].cold.1(self, v37);
            goto LABEL_71;
          }
        }
        v36 = CFSTR(" that might be a scene of destruction");
      }
LABEL_70:
      -[NSObject stringByAppendingString:](v15, "stringByAppendingString:", v36);
      v37 = v15;
      v15 = objc_claimAutoreleasedReturnValue();
LABEL_71:

      goto LABEL_72;
    }
    -[AXMDescriptionBuilder _knownPersonNames](self, "_knownPersonNames");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "count") != 1)
    {
LABEL_37:

      goto LABEL_38;
    }
    objc_msgSend(v16, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0;
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", CFSTR("^(?!.*?\\b(person|people|child|children|baby|babies)\\b.*?\\ba\\s+person\\b)(?!.*?\\ba\\s+person\\b.*?\\b(person|people|child|children|baby|babies)\\b)(?<prefix>.*?)\\ba\\s+person(\\s+that\\s+is\\b)?\\b(?<suffix>.*)$"), 3, &v51);
    v41 = v51;
    if (v41)
    {
      AXMediaLogCommon();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v21 = v41;
        -[AXMDescriptionBuilder _addCaptionInformationToDescription:didConsumeDetectedFaceInfo:].cold.2((uint64_t)v41, v19, v20);
LABEL_36:

        goto LABEL_37;
      }
    }
    else
    {
      v40 = v18;
      objc_msgSend(v18, "matchesInString:options:range:", v15, 0, 0, -[NSObject length](v15, "length"));
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v19 = (id)objc_claimAutoreleasedReturnValue();
      v44 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
      if (v44)
      {
        v38 = v17;
        v39 = v16;
        v42 = *(_QWORD *)v48;
        while (2)
        {
          for (i = 0; i != v44; ++i)
          {
            if (*(_QWORD *)v48 != v42)
              objc_enumerationMutation(v19);
            v23 = v19;
            v24 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
            v25 = objc_msgSend(v24, "rangeWithName:", CFSTR("prefix"));
            if (v25 == 0x7FFFFFFFFFFFFFFFLL)
            {
              v27 = 0;
            }
            else
            {
              -[NSObject substringWithRange:](v15, "substringWithRange:", v25, v26);
              v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            v28 = objc_msgSend(v24, "rangeWithName:", CFSTR("suffix"));
            if (v28 == 0x7FFFFFFFFFFFFFFFLL)
            {
              v30 = 0;
            }
            else
            {
              -[NSObject substringWithRange:](v15, "substringWithRange:", v28, v29);
              v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            if (-[__CFString length](v27, "length") || -[__CFString length](v30, "length"))
            {
              v45 = (void *)MEMORY[0x1E0CB3940];
              if (-[__CFString length](v27, "length"))
                v31 = v27;
              else
                v31 = &stru_1E6260C18;
              v43 = v31;
              if (-[__CFString length](v30, "length"))
                v32 = v30;
              else
                v32 = &stru_1E6260C18;
              v17 = v38;
              objc_msgSend(v45, "stringWithFormat:", CFSTR("%@%@%@"), v43, v38, v32);
              v46 = objc_claimAutoreleasedReturnValue();

              *a4 = 1;
              v15 = v46;
              v16 = v39;
              v19 = v23;
              goto LABEL_34;
            }

            v19 = v23;
          }
          v44 = -[NSObject countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
          if (v44)
            continue;
          break;
        }
        v17 = v38;
        v16 = v39;
      }
LABEL_34:

      v18 = v40;
    }
    v21 = v41;
    goto LABEL_36;
  }
LABEL_74:

}

- (id)_templateRulesForTag:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__AXMDescriptionBuilder__templateRulesForTag___block_invoke;
  block[3] = &unk_1E625CCC0;
  block[4] = self;
  v3 = _templateRulesForTag__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_templateRulesForTag__onceToken, block);
  objc_msgSend((id)_templateRulesForTag___TemplateRules, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __46__AXMDescriptionBuilder__templateRulesForTag___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathForResource:ofType:", CFSTR("AXCaptionTemplateRules"), CFSTR("plist"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_templateRulesForTag___TemplateRules;
  _templateRulesForTag___TemplateRules = v1;

}

- (id)_subsumedTagsForTags:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        -[AXMDescriptionBuilder _templateRulesForTag:](self, "_templateRulesForTag:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("subsume"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "count"))
          objc_msgSend(v5, "addObjectsFromArray:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_ignoredTagsForTags:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
        if (-[AXMDescriptionBuilder isNSFW](self, "isNSFW", (_QWORD)v16)
          && objc_msgSend(v11, "isEqualToString:", CFSTR("baby")))
        {
          objc_msgSend(v5, "addObject:", v11);
        }
        else
        {
          -[AXMDescriptionBuilder _templateRulesForTag:](self, "_templateRulesForTag:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("ignored"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "BOOLValue");

          if (v14)
            objc_msgSend(v5, "addObject:", v11);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)_addGenericTemplateForCaptionInformationToDescription:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  const __CFString *v22;
  uint64_t v23;
  const __CFString *v24;
  uint64_t v25;
  const __CFString *v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  _QWORD v33[4];
  id v34;
  id v35;
  _QWORD v36[6];

  v4 = a3;
  if (-[AXMDescriptionBuilder shouldModifyCaptionForSensitiveContent](self, "shouldModifyCaptionForSensitiveContent")
    && -[AXMDescriptionBuilder isNSFW](self, "isNSFW"))
  {
    -[AXMDescriptionBuilder _appendToDescription:afterPauseType:withContents:](self, "_appendToDescription:afterPauseType:withContents:", v4, 0, CFSTR("Possible adult content"));
  }
  -[NSMutableDictionary allKeys](self->_classificationLabelsToLocValuesMap, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __79__AXMDescriptionBuilder__addGenericTemplateForCaptionInformationToDescription___block_invoke;
  v36[3] = &unk_1E625CD28;
  v36[4] = self;
  objc_msgSend(v5, "sortedArrayUsingComparator:", v36);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXMDescriptionBuilder _subsumedTagsForTags:](self, "_subsumedTagsForTags:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMDescriptionBuilder _ignoredTagsForTags:](self, "_ignoredTagsForTags:", v7);
  v33[0] = v6;
  v33[1] = 3221225472;
  v33[2] = __79__AXMDescriptionBuilder__addGenericTemplateForCaptionInformationToDescription___block_invoke_2;
  v33[3] = &unk_1E625CD50;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v34 = v9;
  v10 = v8;
  v35 = v10;
  objc_msgSend(v7, "ax_filteredArrayUsingBlock:", v33);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "count");
  if (v12)
  {
    v13 = v12;
    v29 = v10;
    v30 = v9;
    v31 = v4;
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("aeiouAEIOU"));
    v32 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i != v13; ++i)
    {
      objc_msgSend(v11, "objectAtIndex:", i);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXMDescriptionBuilder _templateRulesForTag:](self, "_templateRulesForTag:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("speech"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v18)
      {
        -[NSMutableDictionary objectForKeyedSubscript:](self->_classificationLabelsToLocValuesMap, "objectForKeyedSubscript:", v16);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "lowercaseString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("nonCountNounOrPlural"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "BOOLValue");

      if (i)
      {
        if (v13 - 1 == i)
          v22 = CFSTR(" and ");
        else
          v22 = CFSTR(", ");
        objc_msgSend(v14, "appendString:", v22);
        if ((v21 & 1) != 0)
        {
          objc_msgSend(v14, "appendString:", v18);
        }
        else
        {
          v23 = objc_msgSend(v18, "rangeOfCharacterFromSet:", v32);
          v24 = CFSTR("a");
          if (!v23)
            v24 = CFSTR("an");
          objc_msgSend(v14, "appendFormat:", CFSTR("%@ %@"), v24, v18);
        }
      }
      else if ((v21 & 1) != 0)
      {
        objc_msgSend(v14, "appendFormat:", CFSTR("A photo of %@"), v18, v28);
      }
      else
      {
        v25 = objc_msgSend(v18, "rangeOfCharacterFromSet:", v32);
        v26 = CFSTR("a");
        if (!v25)
          v26 = CFSTR("an");
        objc_msgSend(v14, "appendFormat:", CFSTR("A photo containing %@ %@"), v26, v18);
      }

    }
    v4 = v31;
    -[AXMDescriptionBuilder _appendToDescription:afterPauseType:withContents:](self, "_appendToDescription:afterPauseType:withContents:", v31, 0, v14);
    v10 = v29;
    v9 = v30;
    v27 = (void *)v32;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("No_Description"), &stru_1E6260C18, CFSTR("Accessibility"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMDescriptionBuilder _appendToDescription:afterPauseType:withContents:](self, "_appendToDescription:afterPauseType:withContents:", v4, 0, v14);
  }

}

uint64_t __79__AXMDescriptionBuilder__addGenericTemplateForCaptionInformationToDescription___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  uint64_t v15;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "_templateRulesForTag:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_templateRulesForTag:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("priority"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("priority"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v14 = v13;

  if (v11 > v14)
    v15 = -1;
  else
    v15 = v11 < v14;

  return v15;
}

uint64_t __79__AXMDescriptionBuilder__addGenericTemplateForCaptionInformationToDescription___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(*(id *)(a1 + 40), "containsObject:", v3) ^ 1;

  return v4;
}

- (void)_addClassificationInformationToDescription:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSMutableDictionary *classificationLabelsToLocValuesMap;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  classificationLabelsToLocValuesMap = self->_classificationLabelsToLocValuesMap;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __68__AXMDescriptionBuilder__addClassificationInformationToDescription___block_invoke;
  v14[3] = &unk_1E625CD78;
  v15 = v5;
  v11 = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](classificationLabelsToLocValuesMap, "enumerateKeysAndObjectsUsingBlock:", v14);
  objc_msgSend(v11, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortedArrayUsingComparator:", &__block_literal_global_171);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __68__AXMDescriptionBuilder__addClassificationInformationToDescription___block_invoke_3;
  v12[3] = &unk_1E625CDE0;
  v12[4] = self;
  v13 = v4;
  v10 = v4;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v12);

}

uint64_t __68__AXMDescriptionBuilder__addClassificationInformationToDescription___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

uint64_t __68__AXMDescriptionBuilder__addClassificationInformationToDescription___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __68__AXMDescriptionBuilder__addClassificationInformationToDescription___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_appendToDescription:afterPauseType:withContents:", *(_QWORD *)(a1 + 40), 0, a2);
}

- (void)_addIconClassInformationToDescription:(id)a3
{
  NSMutableArray *iconClassFeatures;
  id v5;
  void *v6;
  id v7;

  iconClassFeatures = self->_iconClassFeatures;
  v5 = a3;
  -[NSMutableArray axm_featureWithHighestConfidence](iconClassFeatures, "axm_featureWithHighestConfidence");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMDescriptionBuilder _appendToDescription:afterPauseType:withContents:](self, "_appendToDescription:afterPauseType:withContents:", v5, 0, v6);

}

- (AXMVisionFeature)blurFeature
{
  return self->_blurFeature;
}

- (void)setBlurFeature:(id)a3
{
  objc_storeStrong((id *)&self->_blurFeature, a3);
}

- (AXMVisionFeature)brightnessFeature
{
  return self->_brightnessFeature;
}

- (void)setBrightnessFeature:(id)a3
{
  objc_storeStrong((id *)&self->_brightnessFeature, a3);
}

- (BOOL)isNSFW
{
  return self->_isNSFW;
}

- (void)setIsNSFW:(BOOL)a3
{
  self->_isNSFW = a3;
}

- (BOOL)shouldModifyCaptionForSensitiveContent
{
  return self->_shouldModifyCaptionForSensitiveContent;
}

- (void)setShouldModifyCaptionForSensitiveContent:(BOOL)a3
{
  self->_shouldModifyCaptionForSensitiveContent = a3;
}

- (AXMVisionFeature)primarySensitiveContentFeature
{
  return self->_primarySensitiveContentFeature;
}

- (void)setPrimarySensitiveContentFeature:(id)a3
{
  objc_storeStrong((id *)&self->_primarySensitiveContentFeature, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primarySensitiveContentFeature, 0);
  objc_storeStrong((id *)&self->_brightnessFeature, 0);
  objc_storeStrong((id *)&self->_blurFeature, 0);
  objc_storeStrong((id *)&self->_mediaAnalysisImageCaptionFeature, 0);
  objc_storeStrong((id *)&self->_mediaAnalysisFaceFeatures, 0);
  objc_storeStrong((id *)&self->_captionFeature, 0);
  objc_storeStrong((id *)&self->_iconClassFeatures, 0);
  objc_storeStrong((id *)&self->_classificationLabelsToLocValuesMap, 0);
  objc_storeStrong((id *)&self->_faceFeatures, 0);
  objc_storeStrong((id *)&self->_visualDescription, 0);
  objc_storeStrong((id *)&self->_speakableDescription, 0);
}

- (void)_addCaptionInformationToDescription:(void *)a1 didConsumeDetectedFaceInfo:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "primarySensitiveContentFeature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_2(&dword_1B0E3B000, a2, v4, "Cannot modify caption for sensitive content. unexpected category: %@", (uint8_t *)&v5);

}

- (void)_addCaptionInformationToDescription:(uint64_t)a3 didConsumeDetectedFaceInfo:.cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_2(&dword_1B0E3B000, a2, a3, "Failed to create caption personalization regex: %@", (uint8_t *)&v3);
}

@end
