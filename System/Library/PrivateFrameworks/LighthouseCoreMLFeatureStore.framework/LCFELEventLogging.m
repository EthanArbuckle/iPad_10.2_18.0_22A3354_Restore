@implementation LCFELEventLogging

+ (BOOL)emitModelTrainingEvent:(id)a3
{
  +[LCFELCoreAnalyticsHandler emitModelTrainingEvent:](LCFELCoreAnalyticsHandler, "emitModelTrainingEvent:", a3);
  return 1;
}

+ (BOOL)emitShadowEvaluationEvent:(id)a3
{
  +[LCFELCoreAnalyticsHandler emitShadowEvaluationEvent:](LCFELCoreAnalyticsHandler, "emitShadowEvaluationEvent:", a3);
  return 1;
}

+ (BOOL)emitFeatureImportanceEvent:(id)a3
{
  +[LCFELCoreAnalyticsHandler emitFeatureImportanceEvent:](LCFELCoreAnalyticsHandler, "emitFeatureImportanceEvent:", a3);
  return 1;
}

+ (BOOL)emitChangePointDetectionEvent:(id)a3
{
  +[LCFELCoreAnalyticsHandler emitChangePointDetectionEvent:](LCFELCoreAnalyticsHandler, "emitChangePointDetectionEvent:", a3);
  return 1;
}

@end
