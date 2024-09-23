@implementation PDFPageIconLayer

- (PDFPageIconLayer)initWithSize:(CGSize)a3
{
  double height;
  double width;
  PDFPageIconLayer *v5;
  PDFPageIconLayer *v6;
  id v7;
  id v8;
  objc_super v10;

  height = a3.height;
  width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)PDFPageIconLayer;
  v5 = -[PDFPageIconLayer init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    -[PDFPageIconLayer setFrame:](v5, "setFrame:", 0.0, 0.0, width, height);
    objc_msgSend(MEMORY[0x24BDF6950], "lightGrayColor");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[PDFPageIconLayer setBorderColor:](v6, "setBorderColor:", objc_msgSend(v7, "CGColor"));

    -[PDFPageIconLayer setBorderWidth:](v6, "setBorderWidth:", 1.0);
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[PDFPageIconLayer setBackgroundColor:](v6, "setBackgroundColor:", objc_msgSend(v8, "CGColor"));

    -[PDFPageIconLayer setContentsGravity:](v6, "setContentsGravity:", *MEMORY[0x24BDE5C90]);
    -[PDFPageIconLayer setZPosition:](v6, "setZPosition:", 0.0);
    objc_storeWeak((id *)&v6->_document, 0);
    v6->_pageIndex = 0;
    v6->_needsUpdate = 0;
  }
  return v6;
}

- (PDFDocument)document
{
  return (PDFDocument *)objc_loadWeakRetained((id *)&self->_document);
}

- (int)pageIndex
{
  return self->_pageIndex;
}

- (void)setNeedsUpdate
{
  self->_needsUpdate = 1;
}

- (void)setFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  objc_super v6;

  height = a3.size.height;
  width = a3.size.width;
  v6.receiver = self;
  v6.super_class = (Class)PDFPageIconLayer;
  -[PDFPageIconLayer setFrame:](&v6, sel_setFrame_, a3.origin.x, a3.origin.y);
  self->_frameSize.width = width;
  self->_frameSize.height = height;
}

- (void)updateAsPageIndex:(int)a3 forDocument:(id)a4
{
  id v6;
  id WeakRetained;
  int pageIndex;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  int v13;
  id location;

  v6 = a4;
  if (updateAsPageIndex_forDocument__onceToken != -1)
    dispatch_once(&updateAsPageIndex_forDocument__onceToken, &__block_literal_global_18);
  if (self->_needsUpdate)
    goto LABEL_7;
  WeakRetained = objc_loadWeakRetained((id *)&self->_document);
  if (WeakRetained != v6)
  {

LABEL_7:
    objc_storeWeak((id *)&self->_document, v6);
    self->_pageIndex = a3;
    self->_needsUpdate = 0;
    objc_initWeak(&location, self);
    v9 = updateAsPageIndex_forDocument__gIconsQueue;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __50__PDFPageIconLayer_updateAsPageIndex_forDocument___block_invoke_2;
    v10[3] = &unk_24C25E430;
    objc_copyWeak(&v12, &location);
    v11 = v6;
    v13 = a3;
    dispatch_async(v9, v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
    goto LABEL_8;
  }
  pageIndex = self->_pageIndex;

  if (pageIndex != a3)
    goto LABEL_7;
LABEL_8:

}

void __50__PDFPageIconLayer_updateAsPageIndex_forDocument___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("PDFIconsView", v2);
  v1 = (void *)updateAsPageIndex_forDocument__gIconsQueue;
  updateAsPageIndex_forDocument__gIconsQueue = (uint64_t)v0;

}

void __50__PDFPageIconLayer_updateAsPageIndex_forDocument___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  double *v3;
  id v4;
  void *v5;
  double BackingScaleFactor;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD block[4];
  double *v14;
  id v15;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = (double *)WeakRetained;
  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained(WeakRetained + 4);
    v5 = v4;
    if (v4 && *(id *)(a1 + 32) == v4 && *(_DWORD *)(a1 + 48) == *((_DWORD *)v3 + 10))
    {
      BackingScaleFactor = PDFScreenGetBackingScaleFactor();
      v7 = BackingScaleFactor * v3[6];
      v8 = BackingScaleFactor * v3[7];
      objc_msgSend(v5, "pageAtIndex:", *(int *)(a1 + 48));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = CFSTR("PDFPageImageProperty_DrawBookmark");
      v16[1] = CFSTR("PDFPageImageProperty_DrawAnnotations");
      v17[0] = MEMORY[0x24BDBD1C0];
      v17[1] = MEMORY[0x24BDBD1C8];
      v16[2] = CFSTR("PDFPageImageProperty_WithRotation");
      v17[2] = MEMORY[0x24BDBD1C8];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "imageOfSize:forBox:withOptions:", 1, v10, v7, v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = objc_retainAutorelease(v11);
      if (objc_msgSend(v12, "CGImage") && *(void **)(a1 + 32) == v5 && *(_DWORD *)(a1 + 48) == *((_DWORD *)v3 + 10))
      {
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __50__PDFPageIconLayer_updateAsPageIndex_forDocument___block_invoke_3;
        block[3] = &unk_24C25CBE8;
        v14 = v3;
        v15 = v12;
        dispatch_async(MEMORY[0x24BDAC9B8], block);

      }
    }

  }
}

uint64_t __50__PDFPageIconLayer_updateAsPageIndex_forDocument___block_invoke_3(uint64_t a1)
{
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setContents:", objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "CGImage"));
  return objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

- (void)setDocument:(id)a3
{
  objc_storeWeak((id *)&self->_document, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_document);
}

@end
