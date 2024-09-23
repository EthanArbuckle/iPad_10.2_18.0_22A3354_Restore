@implementation VKLabelMarker(MapKitAdditions)

- (void)setSubtitle:()MapKitAdditions
{
  objc_setAssociatedObject(a1, &_MKCalloutSourceSubtitleKey, a3, (void *)3);
}

- (id)subtitle
{
  return objc_getAssociatedObject(a1, &_MKCalloutSourceSubtitleKey);
}

- (void)setLeftCalloutAccessoryView:()MapKitAdditions
{
  objc_setAssociatedObject(a1, &_MKCalloutSourceLeftCalloutAccessoryViewKey, a3, (void *)1);
}

- (id)leftCalloutAccessoryView
{
  return objc_getAssociatedObject(a1, &_MKCalloutSourceLeftCalloutAccessoryViewKey);
}

- (void)setRightCalloutAccessoryView:()MapKitAdditions
{
  objc_setAssociatedObject(a1, &_MKCalloutSourceRightCalloutAccessoryViewKey, a3, (void *)1);
}

- (id)rightCalloutAccessoryView
{
  return objc_getAssociatedObject(a1, &_MKCalloutSourceRightCalloutAccessoryViewKey);
}

- (void)setDetailCalloutAccessoryView:()MapKitAdditions
{
  objc_setAssociatedObject(a1, &_MKCalloutSourceDetailCalloutAccessoryViewKey, a3, (void *)1);
}

- (id)detailCalloutAccessoryView
{
  return objc_getAssociatedObject(a1, &_MKCalloutSourceDetailCalloutAccessoryViewKey);
}

@end
