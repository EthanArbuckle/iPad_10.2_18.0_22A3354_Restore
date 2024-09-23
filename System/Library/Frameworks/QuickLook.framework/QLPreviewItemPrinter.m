@implementation QLPreviewItemPrinter

- (QLPreviewItemPrinter)initWithItem:(id)a3
{
  id v4;
  id v5;
  OS_dispatch_queue *v6;
  OS_dispatch_queue *accessPrinterQueue;
  OS_dispatch_semaphore *v8;
  OS_dispatch_semaphore *waitForPrinterSemaphore;
  void *v10;
  QLPreviewItemPrinter *v11;
  QLPreviewItemPrinter *v12;
  _QWORD v14[4];
  QLPreviewItemPrinter *v15;
  objc_super v16;

  v4 = a3;
  if (v4
    && (v16.receiver = self,
        v16.super_class = (Class)QLPreviewItemPrinter,
        (self = -[QLPreviewItemPrinter init](&v16, sel_init)) != 0))
  {
    v5 = -[QLItemPresenterViewController initForPrinting:]([QLItemPresenterViewController alloc], "initForPrinting:", 1);
    -[QLPreviewItemPrinter setPresenter:](self, "setPresenter:", v5);

    v6 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.quicklook.previewprinter.accessprinter", 0);
    accessPrinterQueue = self->_accessPrinterQueue;
    self->_accessPrinterQueue = v6;

    v8 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
    waitForPrinterSemaphore = self->_waitForPrinterSemaphore;
    self->_waitForPrinterSemaphore = v8;

    -[QLPreviewItemPrinter presenter](self, "presenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __37__QLPreviewItemPrinter_initWithItem___block_invoke;
    v14[3] = &unk_24C7260E8;
    v11 = self;
    v15 = v11;
    objc_msgSend(v10, "loadPreviewControllerWithContents:context:completionHandler:", v4, 0, v14);

    self = v11;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __37__QLPreviewItemPrinter_initWithItem___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_didReceivePrinter:", 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "presenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "printer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_didReceivePrinter:", v3);

  }
}

- (id)printer
{
  return self->_itemPrinter;
}

- (int64_t)numberOfPages
{
  objc_super v4;

  -[QLPreviewItemPrinter _waitForPrinterSynchronously](self, "_waitForPrinterSynchronously");
  v4.receiver = self;
  v4.super_class = (Class)QLPreviewItemPrinter;
  return -[QLPreviewPrinter numberOfPages](&v4, sel_numberOfPages);
}

- (void)prepareForDrawingPages:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  objc_super v6;

  length = a3.length;
  location = a3.location;
  -[QLPreviewItemPrinter _waitForPrinterSynchronously](self, "_waitForPrinterSynchronously");
  v6.receiver = self;
  v6.super_class = (Class)QLPreviewItemPrinter;
  -[QLPreviewPrinter prepareForDrawingPages:](&v6, sel_prepareForDrawingPages_, location, length);
}

- (void)drawPageAtIndex:(int64_t)a3 inRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  objc_super v10;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[QLPreviewItemPrinter _waitForPrinterSynchronously](self, "_waitForPrinterSynchronously");
  v10.receiver = self;
  v10.super_class = (Class)QLPreviewItemPrinter;
  -[QLPreviewPrinter drawPageAtIndex:inRect:](&v10, sel_drawPageAtIndex_inRect_, a3, x, y, width, height);
}

- (void)_didReceivePrinter:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_itemPrinter, a3);
  v5 = a3;
  self->_didReceivePrinter = 1;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_waitForPrinterSemaphore);

}

- (void)_waitForPrinterSynchronously
{
  NSObject *accessPrinterQueue;
  _QWORD block[5];

  accessPrinterQueue = self->_accessPrinterQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__QLPreviewItemPrinter__waitForPrinterSynchronously__block_invoke;
  block[3] = &unk_24C724B00;
  block[4] = self;
  dispatch_sync(accessPrinterQueue, block);
}

intptr_t __52__QLPreviewItemPrinter__waitForPrinterSynchronously__block_invoke(intptr_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 160))
    return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(v1 + 152), 0xFFFFFFFFFFFFFFFFLL);
  return result;
}

- (QLPrintingProtocol)itemPrinter
{
  return self->_itemPrinter;
}

- (void)setItemPrinter:(id)a3
{
  objc_storeStrong((id *)&self->_itemPrinter, a3);
}

- (QLItemPresenterViewController)presenter
{
  return self->_presenter;
}

- (void)setPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_presenter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presenter, 0);
  objc_storeStrong((id *)&self->_itemPrinter, 0);
  objc_storeStrong((id *)&self->_waitForPrinterSemaphore, 0);
  objc_storeStrong((id *)&self->_accessPrinterQueue, 0);
}

@end
