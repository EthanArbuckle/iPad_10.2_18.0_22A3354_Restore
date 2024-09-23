@implementation AVUnreachableAssetInspectorLoader

- (AVUnreachableAssetInspectorLoader)initWithFigError:(int)a3 userInfo:(id)a4
{
  AVUnreachableAssetInspectorLoader *v6;
  AVUnreachableAssetInspectorLoader *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVUnreachableAssetInspectorLoader;
  v6 = -[AVAssetInspectorLoader init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_figError = a3;
    v6->_figErrorUserInfo = (NSDictionary *)a4;
    v7->_statusOfValueForKeyReturnsLoaded = 0;
  }
  return v7;
}

- (id)initForUnitTests
{
  id result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVUnreachableAssetInspectorLoader;
  result = -[AVAssetInspectorLoader init](&v3, sel_init);
  if (result)
  {
    *((_DWORD *)result + 4) = 0;
    *((_QWORD *)result + 3) = 0;
    *((_BYTE *)result + 32) = 1;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVUnreachableAssetInspectorLoader;
  -[AVAssetInspectorLoader dealloc](&v3, sel_dealloc);
}

- (int64_t)statusOfValueForKey:(id)a3 error:(id *)a4
{
  if (self->_statusOfValueForKeyReturnsLoaded)
    return 2;
  if (a4)
    *a4 = (id)AVLocalizedErrorWithUnderlyingOSStatus(self->_figError, self->_figErrorUserInfo);
  return 3;
}

- (void)loadValuesAsynchronouslyForKeys:(id)a3 completionHandler:(id)a4
{
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
}

- (Class)_classForTrackInspectors
{
  return 0;
}

@end
