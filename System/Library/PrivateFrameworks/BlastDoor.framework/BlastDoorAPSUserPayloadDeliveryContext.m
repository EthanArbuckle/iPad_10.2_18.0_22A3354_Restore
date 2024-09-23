@implementation BlastDoorAPSUserPayloadDeliveryContext

- (NSString)description
{
  void *v2;

  sub_1AD63B798();
  v2 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BOOL)has_count
{
  return (self->aPSUserPayloadDeliveryContext[OBJC_IVAR___BlastDoorAPSUserPayloadDeliveryContext_aPSUserPayloadDeliveryContext] & 1) == 0;
}

- (int64_t)count
{
  if (self->aPSUserPayloadDeliveryContext[OBJC_IVAR___BlastDoorAPSUserPayloadDeliveryContext_aPSUserPayloadDeliveryContext])
    return 0;
  else
    return *(int64_t *)((char *)&self->super.isa
                             + OBJC_IVAR___BlastDoorAPSUserPayloadDeliveryContext_aPSUserPayloadDeliveryContext);
}

- (BlastDoorAPSUserPayloadDeliveryContext)init
{
  BlastDoorAPSUserPayloadDeliveryContext *result;

  result = (BlastDoorAPSUserPayloadDeliveryContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
