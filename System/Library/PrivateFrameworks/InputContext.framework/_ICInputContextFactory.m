@implementation _ICInputContextFactory

+ (id)predictionManager
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _ICPredictionManager *v6;

  v2 = (void *)objc_opt_new();
  v3 = (void *)objc_opt_new();
  objc_msgSend(v2, "addObject:", v3);

  v4 = (void *)objc_opt_new();
  objc_msgSend(v2, "addObject:", v4);

  if (_os_feature_enabled_impl())
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v2, "addObject:", v5);

  }
  v6 = -[_ICPredictionManager initWithPredictionSources:]([_ICPredictionManager alloc], "initWithPredictionSources:", v2);

  return v6;
}

+ (id)lexiconManager
{
  void *v2;
  void *v3;
  _ICLexiconManager *v4;

  v2 = (void *)objc_opt_new();
  v3 = (void *)objc_opt_new();
  objc_msgSend(v2, "addObject:", v3);

  v4 = -[_ICLexiconManager initWithLexiconSources:]([_ICLexiconManager alloc], "initWithLexiconSources:", v2);
  return v4;
}

@end
