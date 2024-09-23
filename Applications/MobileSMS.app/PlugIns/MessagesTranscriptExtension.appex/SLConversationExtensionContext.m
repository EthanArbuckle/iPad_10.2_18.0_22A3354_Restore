@implementation SLConversationExtensionContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (qword_100008E20 != -1)
    dispatch_once(&qword_100008E20, &stru_100004200);
  return (id)qword_100008E18;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (qword_100008E30 != -1)
    dispatch_once(&qword_100008E30, &stru_100004220);
  return (id)qword_100008E28;
}

- (id)remoteProxy
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SLConversationExtensionContext _auxiliaryConnection](self, "_auxiliaryConnection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "remoteObjectProxy"));

  return v3;
}

- (void)requestDismissal
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[SLConversationExtensionContext remoteProxy](self, "remoteProxy"));
  objc_msgSend(v2, "requestDismissal");

}

- (void)openURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[SLConversationExtensionContext remoteProxy](self, "remoteProxy"));
  objc_msgSend(v8, "openURL:completionHandler:", v7, v6);

}

@end
