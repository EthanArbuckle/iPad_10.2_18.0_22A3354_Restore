@implementation UIView(JU_UITraitCollectionOverrides_Private)

- (id)_juLayoutDirectionValue
{
  return objc_getAssociatedObject(a1, sel_juLayoutDirection);
}

- (unint64_t)_juLayoutDirectionFromLayoutDirectionValue:()JU_UITraitCollectionOverrides_Private
{
  unint64_t result;

  if (!a3)
    return -1;
  result = objc_msgSend(a3, "integerValue");
  if (result >= 2)
    return -1;
  return result;
}

@end
