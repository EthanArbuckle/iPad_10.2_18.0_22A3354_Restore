@implementation AVAssetResourceLoadingRequestor

- (AVAssetResourceLoadingRequestor)initWithRequestInfo:(__CFDictionary *)a3
{
  AVAssetResourceLoadingRequestor *v3;
  AVAssetResourceLoadingRequestorInternal *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVAssetResourceLoadingRequestor;
  v3 = -[AVAssetResourceLoadingRequestor init](&v6, sel_init);
  if (v3)
  {
    v4 = objc_alloc_init(AVAssetResourceLoadingRequestorInternal);
    v3->_requestor = v4;
    if (v4)
    {
      if (FigCustomURLRequestInfoGetIsSecureStopSupported())
        v3->_requestor->providesExpiredSessionReports = 0;
      else
        v3->_requestor->providesExpiredSessionReports = 0;
    }
    else
    {

      return 0;
    }
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVAssetResourceLoadingRequestor;
  -[AVAssetResourceLoadingRequestor dealloc](&v3, sel_dealloc);
}

- (BOOL)providesExpiredSessionReports
{
  return self->_requestor->providesExpiredSessionReports;
}

@end
