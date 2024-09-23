@implementation NSValue(DKRenderPointAdditions)

+ (uint64_t)dk_valueWithRenderPoint:()DKRenderPointAdditions
{
  return objc_msgSend(MEMORY[0x24BDD1968], "value:withObjCType:", a3, "{?={CGPoint=dd}ddd}");
}

- (uint64_t)dk_renderPointValue
{
  return objc_msgSend(a1, "getValue:size:", x8_0, 40);
}

@end
