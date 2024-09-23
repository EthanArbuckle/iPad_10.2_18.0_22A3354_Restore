@implementation WKFormRotatingAccessoryPopover

- (WKFormRotatingAccessoryPopover)initWithView:(id)a3
{
  WKFormRotatingAccessoryPopover *v3;
  WKFormRotatingAccessoryPopover *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WKFormRotatingAccessoryPopover;
  v3 = -[WKRotatingPopover initWithView:](&v6, sel_initWithView_, a3);
  v4 = v3;
  if (v3)
    -[WKRotatingPopover setDismissionDelegate:](v3, "setDismissionDelegate:", v3);
  return v4;
}

- (void)accessoryDone
{
  -[WKContentView accessoryDone](-[WKRotatingPopover view](self, "view"), "accessoryDone");
}

- (unint64_t)popoverArrowDirections
{
  if ((unint64_t)(objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication"), "statusBarOrientation")- 3) > 1)return 3;
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA828], "sharedInstance"), "isOnScreen"))
    return 12;
  return 3;
}

@end
