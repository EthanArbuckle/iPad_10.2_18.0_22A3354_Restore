@implementation IRStatisticsMO

+ (void)setPropertiesOfStatisticsMO:(id)a3 withStatisticsDO:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "setNumberOfContextChanges:", objc_msgSend(v5, "numberOfContextChanges"));
  objc_msgSend(v6, "setNumberOfMiLoPredictions:", objc_msgSend(v5, "numberOfMiLoPredictions"));
  objc_msgSend(v6, "setNumberOfMiLoPredictionsInUpdatesMode:", objc_msgSend(v5, "numberOfMiLoPredictionsInUpdatesMode"));
  objc_msgSend(v6, "setLastMiLoLSLItems:", objc_msgSend(v5, "lastMiLoLSLItems"));
  objc_msgSend(v6, "setLastMiLoQualityReasonBitmap:", objc_msgSend(v5, "lastMiLoQualityReasonBitmap"));
  objc_msgSend(v6, "setLastMiLoQuality:", objc_msgSend(v5, "lastMiLoQuality"));
  objc_msgSend(v6, "setLastMiLoModels:", objc_msgSend(v5, "lastMiLoModels"));
  objc_msgSend(v6, "setTimeInUpdatesModeInSeconds:", objc_msgSend(v5, "timeInUpdatesModeInSeconds"));
  objc_msgSend(v6, "setNumberOfPickerChoiceEvents:", objc_msgSend(v5, "numberOfPickerChoiceEvents"));
  objc_msgSend(v6, "setNumberOfCorrectPickerChoiceEvents:", objc_msgSend(v5, "numberOfCorrectPickerChoiceEvents"));
  objc_msgSend(v5, "lastClearDate");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setLastClearDate:", v7);
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("IRStatisticsMO"));
}

- (id)convert
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v15;

  v15 = -[IRStatisticsMO numberOfContextChanges](self, "numberOfContextChanges");
  v3 = -[IRStatisticsMO numberOfMiLoPredictions](self, "numberOfMiLoPredictions");
  v4 = -[IRStatisticsMO numberOfMiLoPredictionsInUpdatesMode](self, "numberOfMiLoPredictionsInUpdatesMode");
  v5 = -[IRStatisticsMO lastMiLoLSLItems](self, "lastMiLoLSLItems");
  v6 = -[IRStatisticsMO lastMiLoQualityReasonBitmap](self, "lastMiLoQualityReasonBitmap");
  v7 = -[IRStatisticsMO lastMiLoQuality](self, "lastMiLoQuality");
  v8 = -[IRStatisticsMO lastMiLoModels](self, "lastMiLoModels");
  v9 = -[IRStatisticsMO timeInUpdatesModeInSeconds](self, "timeInUpdatesModeInSeconds");
  v10 = -[IRStatisticsMO numberOfPickerChoiceEvents](self, "numberOfPickerChoiceEvents");
  v11 = -[IRStatisticsMO numberOfCorrectPickerChoiceEvents](self, "numberOfCorrectPickerChoiceEvents");
  -[IRStatisticsMO lastClearDate](self, "lastClearDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRStatisticsDO statisticsDOWithNumberOfContextChanges:numberOfMiLoPredictions:numberOfMiLoPredictionsInUpdatesMode:lastMiLoLSLItems:lastMiLoQualityReasonBitmap:lastMiLoQuality:lastMiLoModels:timeInUpdatesModeInSeconds:numberOfPickerChoiceEvents:numberOfCorrectPickerChoiceEvents:lastClearDate:](IRStatisticsDO, "statisticsDOWithNumberOfContextChanges:numberOfMiLoPredictions:numberOfMiLoPredictionsInUpdatesMode:lastMiLoLSLItems:lastMiLoQualityReasonBitmap:lastMiLoQuality:lastMiLoModels:timeInUpdatesModeInSeconds:numberOfPickerChoiceEvents:numberOfCorrectPickerChoiceEvents:lastClearDate:", v15, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
