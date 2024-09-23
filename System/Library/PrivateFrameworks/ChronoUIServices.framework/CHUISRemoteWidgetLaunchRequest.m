@implementation CHUISRemoteWidgetLaunchRequest

- (CHSExtensionIdentity)extensionIdentity
{
  return (CHSExtensionIdentity *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                         + OBJC_IVAR___CHUISRemoteWidgetLaunchRequest_extensionIdentity));
}

- (void)setExtensionIdentity:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHUISRemoteWidgetLaunchRequest_extensionIdentity);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHUISRemoteWidgetLaunchRequest_extensionIdentity) = (Class)a3;
  v3 = a3;

}

- (BSAction)action
{
  return (BSAction *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR___CHUISRemoteWidgetLaunchRequest_action));
}

- (void)setAction:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHUISRemoteWidgetLaunchRequest_action);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHUISRemoteWidgetLaunchRequest_action) = (Class)a3;
  v3 = a3;

}

- (CHUISRemoteWidgetLaunchRequest)initWithData:(id)a3
{
  uint64_t v3;
  id v4;
  unint64_t v5;
  unint64_t v6;

  v3 = (uint64_t)a3;
  if (a3)
  {
    v4 = a3;
    v3 = sub_1B71956B4();
    v6 = v5;

  }
  else
  {
    v6 = 0xF000000000000000;
  }
  return (CHUISRemoteWidgetLaunchRequest *)sub_1B7154A34(v3, v6);
}

- (CHUISRemoteWidgetLaunchRequest)init
{
  CHUISRemoteWidgetLaunchRequest *result;

  result = (CHUISRemoteWidgetLaunchRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
