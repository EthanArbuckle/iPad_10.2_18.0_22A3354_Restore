@implementation ICPDFAttachmentRenderOperation

- (ICPDFAttachmentRenderOperation)initWithView:(id)a3
{
  id v4;
  ICPDFAttachmentRenderOperation *v5;
  ICPDFAttachmentRenderOperation *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ICPDFAttachmentRenderOperation;
  v5 = -[ICPDFAttachmentRenderOperation init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    -[ICPDFAttachmentRenderOperation setView:](v5, "setView:", v4);
    -[ICPDFAttachmentRenderOperation view](v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    -[ICPDFAttachmentRenderOperation setSize:](v6, "setSize:", v8, v9);

    objc_msgSend(v4, "window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "screen");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      objc_msgSend(v11, "scale");
    else
      v12 = 1.0;
    -[ICPDFAttachmentRenderOperation setScale:](v6, "setScale:", v12);

  }
  return v6;
}

- (id)generateImageForPrinting
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  CGPDFPage *(*v13)(uint64_t);
  void *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  -[ICPDFAttachmentRenderOperation view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICPDFAttachmentRenderOperation view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    objc_msgSend(v4, "managedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __58__ICPDFAttachmentRenderOperation_generateImageForPrinting__block_invoke;
    v14 = &unk_1EA7DE5C8;
    v16 = &v17;
    v15 = v5;
    objc_msgSend(v6, "performBlockAndWait:", &v11);

    if (v18[3] && (-[ICPDFAttachmentRenderOperation size](self, "size", v11, v12, v13, v14), v7 > 0.0))
    {
      objc_msgSend(MEMORY[0x1E0D63BF8], "renderedImageForPage:scale:size:colorSpace:", v18[3], TSUDeviceRGBColorSpace(), 1.0, 1536.0, v8 * (1536.0 / v7));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      CGPDFPageRelease((CGPDFPageRef)v18[3]);
    }
    else
    {
      v9 = 0;
    }

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

CGPDFPage *__58__ICPDFAttachmentRenderOperation_generateImageForPrinting__block_invoke(uint64_t a1)
{
  CGPDFPage *result;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "page");
  result = *(CGPDFPage **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (result)
    return CGPDFPageRetain(result);
  return result;
}

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  -[ICPDFAttachmentRenderOperation view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    objc_msgSend(v4, "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __38__ICPDFAttachmentRenderOperation_main__block_invoke;
    v16[3] = &unk_1EA7DD7D0;
    v16[4] = self;
    v16[5] = &v17;
    objc_msgSend(v5, "performBlockAndWait:", v16);

    v6 = TSUDeviceRGBColorSpace();
    v7 = v18[3];
    if (v7)
    {
      v8 = v6;
      v9 = (void *)MEMORY[0x1E0D63BF8];
      -[ICPDFAttachmentRenderOperation scale](self, "scale");
      v11 = v10;
      -[ICPDFAttachmentRenderOperation size](self, "size");
      objc_msgSend(v9, "renderedImageForPage:scale:size:colorSpace:", v7, v8, v11, v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      CGPDFPageRelease((CGPDFPageRef)v18[3]);
    }
    else
    {
      v14 = 0;
    }
    v15 = v14;
    performBlockOnMainThreadAndWait();

    _Block_object_dispose(&v17, 8);
  }

}

void __38__ICPDFAttachmentRenderOperation_main__block_invoke(uint64_t a1)
{
  CGPDFPage *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "page");
  v2 = *(CGPDFPage **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v2)
    CGPDFPageRetain(v2);

}

void __38__ICPDFAttachmentRenderOperation_main__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v2);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRendering:", 0);

}

- (ICPDFAttachmentView)view
{
  return (ICPDFAttachmentView *)objc_loadWeakRetained((id *)&self->_view);
}

- (void)setView:(id)a3
{
  objc_storeWeak((id *)&self->_view, a3);
}

- (ICAttachment)attachment
{
  return (ICAttachment *)objc_loadWeakRetained((id *)&self->_attachment);
}

- (double)width
{
  return self->_width;
}

- (CGSize)size
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_size, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setSize:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->_size, &v3, 16, 1, 0);
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_attachment);
  objc_destroyWeak((id *)&self->_view);
}

@end
