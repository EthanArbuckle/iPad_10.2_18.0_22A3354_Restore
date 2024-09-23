@implementation AKAppleIDAuthenticationUISurrogateContext

- (AKAppleIDAuthenticationUISurrogateContext)initWithSurrogateID:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  AKAppleIDAuthenticationUISurrogateContext *v7;

  v4 = (objc_class *)MEMORY[0x1E0CB3A28];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithUUIDString:", v5);

  v7 = (AKAppleIDAuthenticationUISurrogateContext *)-[AKAppleIDAuthenticationUISurrogateContext _initWithIdentifier:](self, "_initWithIdentifier:", v6);
  return v7;
}

@end
