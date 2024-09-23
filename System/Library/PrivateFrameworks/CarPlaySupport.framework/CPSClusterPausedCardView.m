@implementation CPSClusterPausedCardView

+ (id)titleFont
{
  return (id)objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 17.0, *MEMORY[0x24BDF7868], a2, a1);
}

+ (id)createPlatterView
{
  CPSCardPlatterView *v2;

  v2 = [CPSCardPlatterView alloc];
  return -[CPSCardPlatterView initWithFrame:cornerRadius:maskedCorners:](v2, "initWithFrame:cornerRadius:maskedCorners:", 15, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24), 12.0);
}

@end
