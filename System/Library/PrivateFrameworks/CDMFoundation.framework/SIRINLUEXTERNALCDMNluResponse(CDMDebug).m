@implementation SIRINLUEXTERNALCDMNluResponse(CDMDebug)

- (void)setDebugText:()CDMDebug
{
  objc_setAssociatedObject(a1, a2, a3, (void *)1);
}

- (id)debugText
{
  return objc_getAssociatedObject(a1, sel_setDebugText_);
}

@end
