@implementation MediaAuthenticationProtocolHandler

- (_TtC19AppStoreKitInternal34MediaAuthenticationProtocolHandler)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MediaAuthenticationProtocolHandler();
  return -[AMSURLProtocolHandler init](&v3, sel_init);
}

- (void)reconfigureNewRequest:(id)a3 originalTask:(id)a4 redirect:(BOOL)a5 error:(id *)a6
{
  id v10;
  id v11;
  _TtC19AppStoreKitInternal34MediaAuthenticationProtocolHandler *v12;

  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_1D88A4E94(v10, v11, a5, (uint64_t)a6);

}

@end
