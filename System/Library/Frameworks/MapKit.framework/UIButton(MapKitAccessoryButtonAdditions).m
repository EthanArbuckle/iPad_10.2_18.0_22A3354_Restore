@implementation UIButton(MapKitAccessoryButtonAdditions)

- (id)_mapkit_accessoryControlToExtendWithCallout
{
  id v2;

  if ((unint64_t)(objc_msgSend(a1, "buttonType") - 2) > 2)
    v2 = 0;
  else
    v2 = a1;
  return v2;
}

@end
