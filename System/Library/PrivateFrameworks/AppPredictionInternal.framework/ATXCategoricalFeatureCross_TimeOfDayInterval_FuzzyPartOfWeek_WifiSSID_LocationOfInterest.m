@implementation ATXCategoricalFeatureCross_TimeOfDayInterval_FuzzyPartOfWeek_WifiSSID_LocationOfInterest

- (ATXCategoricalFeatureCross_TimeOfDayInterval_FuzzyPartOfWeek_WifiSSID_LocationOfInterest)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  ATXCategoricalFeatureCross_TimeOfDayInterval_FuzzyPartOfWeek_WifiSSID_LocationOfInterest *v8;
  objc_super v10;
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v11[0] = v3;
  v4 = (void *)objc_opt_new();
  v11[1] = v4;
  v5 = (void *)objc_opt_new();
  v11[2] = v5;
  v6 = (void *)objc_opt_new();
  v11[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10.receiver = self;
  v10.super_class = (Class)ATXCategoricalFeatureCross_TimeOfDayInterval_FuzzyPartOfWeek_WifiSSID_LocationOfInterest;
  v8 = -[ATXOneHotCategoricalFeatureCross initWithFeatures:](&v10, sel_initWithFeatures_, v7);

  return v8;
}

@end
