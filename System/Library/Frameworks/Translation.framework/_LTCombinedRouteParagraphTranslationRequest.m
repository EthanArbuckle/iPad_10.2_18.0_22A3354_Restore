@implementation _LTCombinedRouteParagraphTranslationRequest

- (id)requestContext
{
  void *v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_LTCombinedRouteParagraphTranslationRequest;
  -[_LTTranslationRequest requestContext](&v6, sel_requestContext);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRoute:", 0);
  if (-[_LTTranslationRequest forcedOfflineTranslation](self, "forcedOfflineTranslation"))
  {
    v4 = 1;
LABEL_5:
    objc_msgSend(v3, "setRoute:", v4);
    return v3;
  }
  if (-[_LTTranslationRequest _forcedOnlineTranslation](self, "_forcedOnlineTranslation"))
  {
    v4 = 2;
    goto LABEL_5;
  }
  return v3;
}

@end
