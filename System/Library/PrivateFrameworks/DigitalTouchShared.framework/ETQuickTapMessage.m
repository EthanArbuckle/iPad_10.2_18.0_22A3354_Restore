@implementation ETQuickTapMessage

+ (id)doubleTapMessageWithColor:(id)a3
{
  id v3;
  ETQuickTapMessage *v4;

  v3 = a3;
  v4 = objc_alloc_init(ETQuickTapMessage);
  -[ETTapMessage addTapAtPoint:time:color:](v4, "addTapAtPoint:time:color:", v3, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), 0.0);

  return v4;
}

- (id)messageTypeAsString
{
  return CFSTR("QuickTap");
}

@end
