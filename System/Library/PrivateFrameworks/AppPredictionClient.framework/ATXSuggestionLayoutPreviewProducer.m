@implementation ATXSuggestionLayoutPreviewProducer

+ (id)previewLayoutFor2x2SuggestionWidget
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  +[ATXSuggestionLayoutPreviewProducer _proactiveSuggestionWithBundleId:layoutType:title:](ATXSuggestionLayoutPreviewProducer, "_proactiveSuggestionWithBundleId:layoutType:title:", CFSTR("com.apple.mobilesafari"), 3, CFSTR("Browse the Internet with Safari"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0D81220]);
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithLayoutType:oneByOneSuggestions:oneByTwoSuggestions:twoByTwoSuggestions:oneByFourSuggestions:twoByFourSuggestions:fourByFourSuggestions:fourByEightSuggestions:", 5, 0, 0, v4, 0, 0, 0, 0);

  objc_msgSend(v5, "setIsValidForSuggestionsWidget:", 1);
  return v5;
}

+ (id)previewLayoutFor2x4SuggestionWidget
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  +[ATXSuggestionLayoutPreviewProducer _proactiveSuggestionWithBundleId:layoutType:title:](ATXSuggestionLayoutPreviewProducer, "_proactiveSuggestionWithBundleId:layoutType:title:", CFSTR("com.apple.mobilesafari"), 5, CFSTR("Browse the Internet with Safari"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXSuggestionLayoutPreviewProducer _proactiveSuggestionWithBundleId:layoutType:title:](ATXSuggestionLayoutPreviewProducer, "_proactiveSuggestionWithBundleId:layoutType:title:", CFSTR("com.apple.AppStore"), 5, CFSTR("Read about today's App picks"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D81220]);
  v8[0] = v2;
  v8[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithLayoutType:oneByOneSuggestions:oneByTwoSuggestions:twoByTwoSuggestions:oneByFourSuggestions:twoByFourSuggestions:fourByFourSuggestions:fourByEightSuggestions:", 9, 0, 0, 0, v5, 0, 0, 0);

  objc_msgSend(v6, "setIsValidForSuggestionsWidget:", 1);
  return v6;
}

+ (id)previewLayoutFor4x4SuggestionWidget
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  +[ATXSuggestionLayoutPreviewProducer _proactiveSuggestionWithBundleId:layoutType:title:](ATXSuggestionLayoutPreviewProducer, "_proactiveSuggestionWithBundleId:layoutType:title:", CFSTR("com.apple.mobilesafari"), 5, CFSTR("Browse the Internet with Safari"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXSuggestionLayoutPreviewProducer _proactiveSuggestionWithBundleId:layoutType:title:](ATXSuggestionLayoutPreviewProducer, "_proactiveSuggestionWithBundleId:layoutType:title:", CFSTR("com.apple.AppStore"), 5, CFSTR("Read about today's App picks"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXSuggestionLayoutPreviewProducer _proactiveSuggestionWithBundleId:layoutType:title:](ATXSuggestionLayoutPreviewProducer, "_proactiveSuggestionWithBundleId:layoutType:title:", CFSTR("com.apple.mobileslideshow"), 5, CFSTR("View Photos"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXSuggestionLayoutPreviewProducer _proactiveSuggestionWithBundleId:layoutType:title:](ATXSuggestionLayoutPreviewProducer, "_proactiveSuggestionWithBundleId:layoutType:title:", CFSTR("com.apple.camera"), 5, CFSTR("Take a photo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0D81220]);
  v10[0] = v2;
  v10[1] = v3;
  v10[2] = v4;
  v10[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithLayoutType:oneByOneSuggestions:oneByTwoSuggestions:twoByTwoSuggestions:oneByFourSuggestions:twoByFourSuggestions:fourByFourSuggestions:fourByEightSuggestions:", 11, 0, 0, 0, v7, 0, 0, 0);

  objc_msgSend(v8, "setIsValidForSuggestionsWidget:", 1);
  return v8;
}

+ (id)previewLayoutForAppPredictionPanel
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(&unk_1E4DC2D20, "count"));
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = objc_msgSend(&unk_1E4DC2D20, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(&unk_1E4DC2D20);
        +[ATXSuggestionLayoutPreviewProducer _proactiveSuggestionWithBundleId:layoutType:title:](ATXSuggestionLayoutPreviewProducer, "_proactiveSuggestionWithBundleId:layoutType:title:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v6), 1, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v6));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(&unk_1E4DC2D20, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81220]), "initWithLayoutType:oneByOneSuggestions:oneByTwoSuggestions:twoByTwoSuggestions:oneByFourSuggestions:twoByFourSuggestions:fourByFourSuggestions:fourByEightSuggestions:", 0, v2, 0, 0, 0, 0, 0, 0);
  objc_msgSend(v8, "setIsValidForSuggestionsWidget:", 1);

  return v8;
}

+ (id)_clientModelSpecForPreview
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D811A0]), "initWithClientModelId:clientModelVersion:", CFSTR("Hardcoded Preview"), CFSTR("1.0"));
}

+ (id)_executableSpecForAppPredictionWithBundleId:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0D811A8];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithExecutableObject:executableDescription:executableIdentifier:suggestionExecutableType:", v4, v4, v4, 1);

  return v5;
}

+ (id)_uiSpecForPreviewWithLayoutType:(int64_t)a3 title:(id)a4 subtitle:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = (objc_class *)MEMORY[0x1E0D811B8];
  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_msgSend([v7 alloc], "initWithApplicableSuggestionLayout:", a3);
  v15[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v14) = 0;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D811D0]), "initWithTitle:subtitle:predictionReason:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:shouldClearOnEngagement:", v9, v8, CFSTR("Preview Suggestion"), v11, 0, 1, v14);

  return v12;
}

+ (id)_scoreSpecForPreview
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D811C0]), "initWithRawScore:suggestedConfidenceCategory:", 1, 1.0);
}

+ (id)_proactiveSuggestionWithBundleId:(id)a3 layoutType:(int64_t)a4 title:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = a5;
  v8 = a3;
  +[ATXSuggestionLayoutPreviewProducer _clientModelSpecForPreview](ATXSuggestionLayoutPreviewProducer, "_clientModelSpecForPreview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXSuggestionLayoutPreviewProducer _executableSpecForAppPredictionWithBundleId:](ATXSuggestionLayoutPreviewProducer, "_executableSpecForAppPredictionWithBundleId:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[ATXSuggestionLayoutPreviewProducer _uiSpecForPreviewWithLayoutType:title:subtitle:](ATXSuggestionLayoutPreviewProducer, "_uiSpecForPreviewWithLayoutType:title:subtitle:", a4, v7, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[ATXSuggestionLayoutPreviewProducer _scoreSpecForPreview](ATXSuggestionLayoutPreviewProducer, "_scoreSpecForPreview");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81190]), "initWithClientModelSpecification:executableSpecification:uiSpecification:scoreSpecification:", v9, v10, v11, v12);

  return v13;
}

@end
