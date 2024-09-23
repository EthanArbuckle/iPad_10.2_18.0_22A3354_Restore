@implementation ATXHomeScreenWidgetFeedback

- (ATXHomeScreenWidgetFeedback)init
{
  void *v3;
  void *v4;
  ATXHomeScreenWidgetFeedback *v5;

  +[_ATXAppLaunchHistogramManager sharedInstance](_ATXAppLaunchHistogramManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "categoricalHistogramForLaunchType:", 62);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ATXHomeScreenWidgetFeedback initWithWidgetFeedbackHistogram:](self, "initWithWidgetFeedbackHistogram:", v4);

  return v5;
}

- (ATXHomeScreenWidgetFeedback)initWithWidgetFeedbackHistogram:(id)a3
{
  id v5;
  ATXHomeScreenWidgetFeedback *v6;
  ATXHomeScreenWidgetFeedback *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXHomeScreenWidgetFeedback;
  v6 = -[ATXHomeScreenWidgetFeedback init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_histogram, a3);

  return v7;
}

- (id)categoryStringForFeedbackType:(unint64_t)a3
{
  id result;
  NSObject *v4;

  switch(a3)
  {
    case 1uLL:
      result = CFSTR("TimesPseudoTapped");
      break;
    case 2uLL:
      result = CFSTR("TimesDisplayed");
      break;
    case 3uLL:
      result = CFSTR("UserInitiatedRotations");
      break;
    case 4uLL:
      result = CFSTR("TimesSuggestedBySystem");
      break;
    case 5uLL:
      result = CFSTR("TimesSystemFallBack");
      break;
    case 6uLL:
      result = CFSTR("TimesSystemUpdate");
      break;
    case 7uLL:
      result = CFSTR("TimesDismissed");
      break;
    case 8uLL:
      __atxlog_handle_default();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
        -[ATXHomeScreenWidgetFeedback categoryStringForFeedbackType:].cold.1(v4);

      result = 0;
      break;
    default:
      result = CFSTR("TimesTapped");
      break;
  }
  return result;
}

- (void)addEventForWidgetBundleId:(id)a3 type:(unint64_t)a4
{
  double v4;

  LODWORD(v4) = 1.0;
  -[ATXHomeScreenWidgetFeedback addEventForWidgetBundleId:type:weight:](self, "addEventForWidgetBundleId:type:weight:", a3, a4, v4);
}

- (void)addEventForWidgetBundleId:(id)a3 type:(unint64_t)a4 weight:(float)a5
{
  _ATXAppLaunchCategoricalHistogram *histogram;
  void *v9;
  id v10;
  void *v11;
  double v12;
  id v13;

  histogram = self->_histogram;
  v9 = (void *)MEMORY[0x1E0C99D68];
  v10 = a3;
  objc_msgSend(v9, "now");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXHomeScreenWidgetFeedback categoryStringForFeedbackType:](self, "categoryStringForFeedbackType:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v12 = a5;
  -[_ATXAppLaunchCategoricalHistogram addLaunchWithBundleId:date:category:weight:](histogram, "addLaunchWithBundleId:date:category:weight:", v10, v13, v11, v12);

}

- (double)eventCountForWidgetBundleId:(id)a3 type:(unint64_t)a4
{
  _ATXAppLaunchCategoricalHistogram *histogram;
  id v7;
  void *v8;
  double v9;
  double v10;

  histogram = self->_histogram;
  v7 = a3;
  -[ATXHomeScreenWidgetFeedback categoryStringForFeedbackType:](self, "categoryStringForFeedbackType:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ATXAppLaunchCategoricalHistogram totalLaunchesForBundleId:category:](histogram, "totalLaunchesForBundleId:category:", v7, v8);
  v10 = v9;

  return v10;
}

- (double)tapEngagementRateForWidgetBundleId:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  -[ATXHomeScreenWidgetFeedback eventCountForWidgetBundleId:type:](self, "eventCountForWidgetBundleId:type:", v4, 2);
  v6 = 0.0;
  if (v5 != 0.0)
  {
    v7 = v5;
    -[ATXHomeScreenWidgetFeedback eventCountForWidgetBundleId:type:](self, "eventCountForWidgetBundleId:type:", v4, 0);
    v6 = v8 / v7;
  }

  return v6;
}

- (double)pseudoTapEngagementRateForWidgetBundleId:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  -[ATXHomeScreenWidgetFeedback eventCountForWidgetBundleId:type:](self, "eventCountForWidgetBundleId:type:", v4, 2);
  v6 = 0.0;
  if (v5 != 0.0)
  {
    v7 = v5;
    -[ATXHomeScreenWidgetFeedback eventCountForWidgetBundleId:type:](self, "eventCountForWidgetBundleId:type:", v4, 1);
    v6 = v8 / v7;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_histogram, 0);
}

- (void)categoryStringForFeedbackType:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_FAULT, "ATXHomeScreenWidgetFeedback: Unexpected ATXHomeScreenWidgetFeedbackType value received.", v1, 2u);
}

@end
