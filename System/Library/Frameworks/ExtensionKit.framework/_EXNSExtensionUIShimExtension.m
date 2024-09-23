@implementation _EXNSExtensionUIShimExtension

- (void)prepareForSceneConnectionWithConfiguration:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setSceneClass:", objc_opt_class());

}

@end
