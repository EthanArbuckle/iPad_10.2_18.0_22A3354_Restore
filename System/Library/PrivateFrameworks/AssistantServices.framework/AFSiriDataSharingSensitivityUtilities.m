@implementation AFSiriDataSharingSensitivityUtilities

+ (BOOL)isRequestSensitiveWithPolicy:(int64_t)a3 optInStatus:(int64_t)a4 siriLanguageCode:(id)a5
{
  id v7;
  void *v8;

  v7 = a5;
  +[AFSiriDataSharingSensitivityManager shared](AFSiriDataSharingSensitivityManager, "shared");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v8, "isRequestSensitiveWithPolicy:optInStatus:siriLanguageCode:", a3, a4, v7);

  return a4;
}

@end
