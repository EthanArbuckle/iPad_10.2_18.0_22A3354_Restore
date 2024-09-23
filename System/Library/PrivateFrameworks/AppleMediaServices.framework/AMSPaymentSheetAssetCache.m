@implementation AMSPaymentSheetAssetCache

- (AMSPaymentSheetAssetCache)init
{
  AMSPaymentSheetAssetCache *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AMSPaymentSheetAssetCache;
  v2 = -[AMSPaymentSheetAssetCache init](&v4, sel_init);
  if (v2)
    v2->_imageArrayRef = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  return v2;
}

- (void)dealloc
{
  __CFArray *imageArrayRef;
  objc_super v4;

  imageArrayRef = self->_imageArrayRef;
  if (imageArrayRef)
    CFRelease(imageArrayRef);
  v4.receiver = self;
  v4.super_class = (Class)AMSPaymentSheetAssetCache;
  -[AMSPaymentSheetAssetCache dealloc](&v4, sel_dealloc);
}

- (void)retainAsset:(void *)a3
{
  CFArrayAppendValue(self->_imageArrayRef, a3);
}

@end
