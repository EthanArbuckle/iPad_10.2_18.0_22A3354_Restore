@implementation ADClient

+ (ADClient)sharedClient
{
  return 0;
}

- (void)requestAttributionDetailsWithBlock:(void *)completionHandler
{
  if (completionHandler)
    (*((void (**)(void *, _QWORD, _QWORD))completionHandler + 2))(completionHandler, 0, 0);
}

- (void)determineAppInstallationAttributionWithCompletionHandler:(id)a3
{
  if (a3)
    (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (void)lookupAdConversionDetails:(id)a3
{
  if (a3)
    (*((void (**)(id, _QWORD, _QWORD))a3 + 2))(a3, 0, 0);
}

- (void)segmentDataForSignedInUserWithBlock:(id)a3
{
  if (a3)
    (*((void (**)(id, const __CFString *, _QWORD, _QWORD, double))a3 + 2))(a3, CFSTR("1"), 0, 0, 0.0);
}

@end
