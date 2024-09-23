@implementation AXMKPlaceInfoContactRowViewAccessibilityElement

- (id)accessibilityDragSourceDescriptors
{
  void *v2;
  void *v3;

  -[AXMKPlaceInfoContactRowViewAccessibilityElement accessibilityContainer](self, "accessibilityContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityDragSourceDescriptors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
