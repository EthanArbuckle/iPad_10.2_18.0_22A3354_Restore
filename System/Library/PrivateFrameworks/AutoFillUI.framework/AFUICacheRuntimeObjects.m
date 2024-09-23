@implementation AFUICacheRuntimeObjects

void ___AFUICacheRuntimeObjects_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  __AFUIColorClass = (uint64_t)NSClassFromString(CFSTR("UIColor"));
  __AFUIFontClass = (uint64_t)NSClassFromString(CFSTR("UIFont"));
  __AFUIResponderClass = (uint64_t)NSClassFromString(CFSTR("UIResponder"));
  __AFUIViewClass = (uint64_t)NSClassFromString(CFSTR("UIView"));
  __AFUIViewControllerClass = (uint64_t)NSClassFromString(CFSTR("UIViewController"));
  __AFUINavigationControllerClass = (uint64_t)NSClassFromString(CFSTR("UINavigationController"));
  __AFUIApplicationClass = (uint64_t)NSClassFromString(CFSTR("UIApplication"));
  __AFUITextFieldClass = (uint64_t)NSClassFromString(CFSTR("UITextField"));
  __AFUISecureTextFieldClass = (uint64_t)NSClassFromString(CFSTR("_AFUIFakeSecureTextField"));
  __AFUITextViewClass = (uint64_t)NSClassFromString(CFSTR("UITextView"));
  __AFUIButtonClass = (uint64_t)NSClassFromString(CFSTR("UIButton"));
  __AFUITraitsClass = (uint64_t)NSClassFromString(CFSTR("UITextInputTraits"));
  NSProtocolFromString(CFSTR("UITextInputTraits"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)__AFUITraitsProtocol;
  __AFUITraitsProtocol = v0;

  NSProtocolFromString(CFSTR("UITextInput"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)__AFUITextInputProtocol;
  __AFUITextInputProtocol = v2;

}

@end
