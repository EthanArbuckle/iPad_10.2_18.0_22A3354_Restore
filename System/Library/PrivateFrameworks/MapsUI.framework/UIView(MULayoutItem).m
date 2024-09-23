@implementation UIView(MULayoutItem)

- (uint64_t)_mapsui_disableTranslatesAutoresizingMaskIntoConstraints
{
  return objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
}

@end
