@implementation SSSScreenshotAnnotationControllerAKOverlayContainerViewAccessibility

id __95___SSSScreenshotAnnotationControllerAKOverlayContainerViewAccessibility__axMarkupAKOverlayView__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accessibilityLabelForOverlayView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
