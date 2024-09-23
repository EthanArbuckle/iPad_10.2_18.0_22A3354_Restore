@implementation BLSBacklightChangeSourceEventSuppressionMetadata(BLSHSuppressionEvent)

- (uint64_t)initWithSuppressionEvent:()BLSHSuppressionEvent
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  v6 = objc_msgSend(v4, "reason");

  return objc_msgSend(a1, "initWithType:reason:", v5, v6);
}

@end
