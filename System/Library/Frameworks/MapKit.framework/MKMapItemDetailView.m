@implementation MKMapItemDetailView

uint64_t __57___MKMapItemDetailView_orientationDidChangeNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidateIntrinsicContentSize");
}

@end
