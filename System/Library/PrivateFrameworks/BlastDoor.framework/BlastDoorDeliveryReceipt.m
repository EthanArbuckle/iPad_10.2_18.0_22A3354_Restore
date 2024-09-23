@implementation BlastDoorDeliveryReceipt

- (NSString)description
{
  return (NSString *)sub_1AD4AB274((uint64_t)self, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for DeliveryReceipt, &OBJC_IVAR___BlastDoorDeliveryReceipt_deliveryReceipt);
}

- (BlastDoorMetadata)metadata
{
  BlastDoorDeliveryReceipt *v2;
  id v3;

  v2 = self;
  v3 = sub_1AD4B07CC();

  return (BlastDoorMetadata *)v3;
}

- (BlastDoorDeliveryReceipt)init
{
  BlastDoorDeliveryReceipt *result;

  result = (BlastDoorDeliveryReceipt *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD066230((uint64_t)self + OBJC_IVAR___BlastDoorDeliveryReceipt_deliveryReceipt, (uint64_t (*)(_QWORD))type metadata accessor for DeliveryReceipt);
}

@end
