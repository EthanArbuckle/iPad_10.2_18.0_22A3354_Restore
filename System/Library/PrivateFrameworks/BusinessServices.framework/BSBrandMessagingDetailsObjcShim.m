@implementation BSBrandMessagingDetailsObjcShim

- (NSString)localizedResponseTime
{
  void *v2;

  if (*(_QWORD *)&self->messagingDetails[OBJC_IVAR___BSBrandMessagingDetailsObjcShim_messagingDetails])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_21CAF81CC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (BSBrandMessagingDetailsObjcShim)init
{
  BSBrandMessagingDetailsObjcShim *result;

  result = (BSBrandMessagingDetailsObjcShim *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
