@implementation NSMeasurement(WFSerializableContent)

+ (id)objectWithWFSerializedRepresentation:()WFSerializableContent
{
  return WFDeserializeNSMeasurement(a3);
}

@end
