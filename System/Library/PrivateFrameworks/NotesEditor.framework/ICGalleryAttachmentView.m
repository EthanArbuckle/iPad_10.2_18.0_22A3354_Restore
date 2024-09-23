@implementation ICGalleryAttachmentView

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  -[ICGalleryAttachmentView attachmentDidLoadObserver](self, "attachmentDidLoadObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICGalleryAttachmentView attachmentDidLoadObserver](self, "attachmentDidLoadObserver");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:", v5);

    -[ICGalleryAttachmentView setAttachmentDidLoadObserver:](self, "setAttachmentDidLoadObserver:", 0);
  }
  -[ICGalleryAttachmentView previewImagesDidUpdateObserver](self, "previewImagesDidUpdateObserver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICGalleryAttachmentView previewImagesDidUpdateObserver](self, "previewImagesDidUpdateObserver");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:", v8);

    -[ICGalleryAttachmentView setPreviewImagesDidUpdateObserver:](self, "setPreviewImagesDidUpdateObserver:", 0);
  }
  v9.receiver = self;
  v9.super_class = (Class)ICGalleryAttachmentView;
  -[ICAttachmentView dealloc](&v9, sel_dealloc);
}

+ (double)effectiveAspectRatioForWidth:(double)a3 height:(double)a4
{
  double result;

  result = 0.75;
  if (a3 != 0.0 && a4 != 0.0)
  {
    result = a3 / a4;
    if (a3 / a4 < *MEMORY[0x1E0D64980])
      result = *MEMORY[0x1E0D64980];
    if (result >= *MEMORY[0x1E0D64978])
      return *MEMORY[0x1E0D64978];
  }
  return result;
}

+ (CGSize)sizeOfViewForAttachment:(id)a3 textViewContentWidth:(double)a4 existingView:(id)a5
{
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  int v33;
  uint64_t v34;
  unint64_t v35;
  int v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t i;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  unint64_t v51;
  uint64_t v52;
  double v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  CGSize result;

  v8 = a3;
  objc_msgSend(a5, "subAttachmentItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(a1, "subAttachmentItemsForGalleryAttachment:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = floor(a4);
  objc_msgSend(a1, "collectionViewLeftRightMargins");
  v12 = v11;
  objc_msgSend(a1, "topButtonHeight");
  v14 = v13;
  objc_msgSend(a1, "collectionViewTopBottomMargins");
  v16 = v15;
  v17 = objc_msgSend(v9, "count");
  if (v10 <= 0.0 || v17 == 0)
  {
    v19 = 160.0;
    v20 = 160.0;
  }
  else
  {
    objc_msgSend(a1, "collectionViewLeftRightMargins");
    v22 = v21;
    objc_msgSend(a1, "collectionViewLeftRightMargins");
    v24 = v23;
    objc_msgSend(v9, "firstObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "size");
    v27 = v26;
    objc_msgSend(v25, "size");
    objc_msgSend((id)objc_opt_class(), "effectiveAspectRatioForWidth:height:", v28, v27);
    v30 = v29;
    objc_msgSend(a1, "collectionViewMaxHeight");
    if (v27 >= v31)
      v27 = v31;
    objc_msgSend(a1, "collectionViewMinHeight");
    if (v27 < v32)
      v27 = v32;
    v33 = objc_msgSend(a1, "collectionViewShouldPeek");
    v34 = objc_msgSend(v9, "count");
    if (v33 && ((v35 = v34, v36 = objc_msgSend(MEMORY[0x1E0DC3708], "ic_isiPad"), v10 < 500.0) || !v36))
    {
      v39 = v12 + v12;
      v40 = v10 + v24 * -2.0;
      v41 = round(v30 * v27);
      v42 = 2;
      if (v35 < 2)
        v42 = v35;
      if (v10 <= 640.0)
        v43 = v35 != 0;
      else
        v43 = v42;
      if (v43 >= 2)
      {
        for (i = 1; i != v43; ++i)
        {
          v39 = v22 + v39;
          v40 = v40 - v22;
          objc_msgSend(v9, "objectAtIndexedSubscript:", i);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "size");
          v47 = v46;
          objc_msgSend(v45, "size");
          objc_msgSend(a1, "effectiveAspectRatioForWidth:height:", v47);
          v41 = v41 + round(v27 * v48);

        }
      }
      v49 = 2.0;
      if (v41 >= 160.0)
        v50 = v41;
      else
        v50 = 160.0;
      if (v50 > v40)
      {
        if (v35 >= v43)
          v51 = v43;
        else
          v51 = v35;
        if (v51)
        {
          v52 = 0;
          v53 = 0.0;
          do
          {
            objc_msgSend(v9, "objectAtIndexedSubscript:", v52);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "size");
            v56 = v55;
            objc_msgSend(v54, "size");
            objc_msgSend(a1, "effectiveAspectRatioForWidth:height:", v56);
            v53 = v53 + v57;

            ++v52;
          }
          while (v51 != v52);
        }
        else
        {
          v53 = 0.0;
        }
        v27 = round(v40 / v53);
        v50 = v40;
        v49 = 2.0;
      }
      v58 = v14 + v16 * v49;
      if (v35 <= v43 || (v50 = v22 + 50.0 + v50, v50 <= v40))
        v40 = v50;
      else
        v27 = round(v40 / (v50 / v27));
      v20 = v39 + v40;
      v19 = v58 + v27;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D64BF0], "sizeOfViewForAttachment:textViewContentWidth:", v8, v10);
      v20 = v37;
      v19 = v38;
    }

  }
  v59 = v20;
  v60 = v19;
  result.height = v60;
  result.width = v59;
  return result;
}

+ (id)titleForGalleryAttachment:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a3;
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
    objc_msgSend(v3, "title");
  else
    objc_msgSend(v3, "defaultTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "needsInitialFetchFromCloud"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Downloading…"), &stru_1EA7E9860, 0);
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }

  return v5;
}

- (double)collectionViewItemHeight
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;

  -[ICGalleryAttachmentView bounds](self, "bounds");
  v3 = v2;
  objc_msgSend((id)objc_opt_class(), "collectionViewTopBottomMargins");
  v5 = v4;
  objc_msgSend((id)objc_opt_class(), "topButtonHeight");
  return fmax(v3 - (v6 + v5 * 2.0), 16.0);
}

- (void)invalidateCollectionViewLayout
{
  -[ICGalleryAttachmentView collectionViewItemHeight](self, "collectionViewItemHeight");
  -[ICGalleryAttachmentView invalidateCollectionViewLayoutWithNewItemHeight:](self, "invalidateCollectionViewLayoutWithNewItemHeight:");
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v13;
  objc_super v14;
  CGRect v15;
  CGRect v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[ICGalleryAttachmentView frame](self, "frame");
  v9 = v8;
  v11 = v10;
  v14.receiver = self;
  v14.super_class = (Class)ICGalleryAttachmentView;
  -[ICGalleryAttachmentView setFrame:](&v14, sel_setFrame_, x, y, width, height);
  if (v9 != width || v11 != height)
    -[ICGalleryAttachmentView invalidateCollectionViewLayout](self, "invalidateCollectionViewLayout");
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  if (!CGRectIsNull(v15))
  {
    v16.origin.x = x;
    v16.origin.y = y;
    v16.size.width = width;
    v16.size.height = height;
    if (!CGRectIsInfinite(v16))
    {
      -[ICGalleryAttachmentView attachment](self, "attachment");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
        -[ICGalleryAttachmentView setupCollectionViewIfNecessary](self, "setupCollectionViewIfNecessary");
    }
  }
}

- (void)setAttachment:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id location;
  objc_super v24;

  v4 = a3;
  -[ICGalleryAttachmentView attachment](self, "attachment");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    v24.receiver = self;
    v24.super_class = (Class)ICGalleryAttachmentView;
    -[ICGalleryAttachmentView setAttachment:](&v24, sel_setAttachment_, v4);
    -[ICGalleryAttachmentView invalidateCollectionViewLayout](self, "invalidateCollectionViewLayout");
    -[ICGalleryAttachmentView attachmentDidLoadObserver](self, "attachmentDidLoadObserver");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICGalleryAttachmentView attachmentDidLoadObserver](self, "attachmentDidLoadObserver");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObserver:", v8);

      -[ICGalleryAttachmentView setAttachmentDidLoadObserver:](self, "setAttachmentDidLoadObserver:", 0);
    }
    -[ICGalleryAttachmentView previewImagesDidUpdateObserver](self, "previewImagesDidUpdateObserver");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICGalleryAttachmentView previewImagesDidUpdateObserver](self, "previewImagesDidUpdateObserver");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeObserver:", v11);

      -[ICGalleryAttachmentView setPreviewImagesDidUpdateObserver:](self, "setPreviewImagesDidUpdateObserver:", 0);
    }
    if (v4)
    {
      -[ICGalleryAttachmentView updateItems](self, "updateItems");
      objc_initWeak(&location, self);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *MEMORY[0x1E0D63608];
      v14 = MEMORY[0x1E0C809B0];
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __41__ICGalleryAttachmentView_setAttachment___block_invoke;
      v21[3] = &unk_1EA7DD288;
      objc_copyWeak(&v22, &location);
      objc_msgSend(v12, "addObserverForName:object:queue:usingBlock:", v13, 0, 0, v21);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICGalleryAttachmentView setAttachmentDidLoadObserver:](self, "setAttachmentDidLoadObserver:", v15);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *MEMORY[0x1E0D63660];
      v19[0] = v14;
      v19[1] = 3221225472;
      v19[2] = __41__ICGalleryAttachmentView_setAttachment___block_invoke_2;
      v19[3] = &unk_1EA7DD288;
      objc_copyWeak(&v20, &location);
      objc_msgSend(v16, "addObserverForName:object:queue:usingBlock:", v17, 0, 0, v19);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICGalleryAttachmentView setPreviewImagesDidUpdateObserver:](self, "setPreviewImagesDidUpdateObserver:", v18);

      objc_destroyWeak(&v20);
      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
    }
  }

}

void __41__ICGalleryAttachmentView_setAttachment___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  void *v5;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_opt_class();
  objc_msgSend(v3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  ICCheckedDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "updateItemForObjectID:", v5);

}

void __41__ICGalleryAttachmentView_setAttachment___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  void *v5;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_opt_class();
  objc_msgSend(v3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  ICCheckedDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "updateItemForObjectID:", v5);

}

- (void)setHighlightColor:(id)a3
{
  id v4;
  double v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ICGalleryAttachmentView;
  v4 = a3;
  -[ICGalleryAttachmentView setHighlightColor:](&v10, sel_setHighlightColor_, v4);
  if (v4)
    v5 = *MEMORY[0x1E0D64900];
  else
    v5 = 0.0;
  -[ICGalleryAttachmentView layer](self, "layer", v10.receiver, v10.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBorderWidth:", v5);

  v7 = objc_retainAutorelease(v4);
  v8 = objc_msgSend(v7, "CGColor");

  -[ICGalleryAttachmentView layer](self, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBorderColor:", v8);

}

- (void)setHighlightPatternRegexFinder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICGalleryAttachmentView;
  -[ICGalleryAttachmentView setHighlightPatternRegexFinder:](&v4, sel_setHighlightPatternRegexFinder_, a3);
  -[ICGalleryAttachmentView updateAttachmentTitleLabel](self, "updateAttachmentTitleLabel");
}

+ (id)subAttachmentItemsForGalleryAttachment:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, void *);
  void *v16;
  id v17;
  id v18;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "attachmentModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v3, "subAttachments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __66__ICGalleryAttachmentView_subAttachmentItemsForGalleryAttachment___block_invoke;
  v16 = &unk_1EA7DD2B0;
  v17 = v3;
  v18 = v8;
  v9 = v8;
  v10 = v3;
  objc_msgSend(v5, "enumerateSubAttachmentsWithBlock:", &v13);
  v11 = (void *)objc_msgSend(v9, "copy", v13, v14, v15, v16);

  return v11;
}

void __66__ICGalleryAttachmentView_subAttachmentItemsForGalleryAttachment___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  ICGalleryAttachmentViewSubAttachmentItem *v5;
  void *v6;
  ICGalleryAttachmentViewSubAttachmentItem *v7;

  v4 = a3;
  v5 = [ICGalleryAttachmentViewSubAttachmentItem alloc];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ICGalleryAttachmentViewSubAttachmentItem initWithAttachmentIdentifier:context:](v5, "initWithAttachmentIdentifier:context:", v4, v6);

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
}

- (BOOL)updateItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  v3 = (void *)objc_opt_class();
  -[ICGalleryAttachmentView attachment](self, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subAttachmentItemsForGalleryAttachment:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICGalleryAttachmentView subAttachmentItems](self, "subAttachmentItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if ((v7 & 1) == 0)
    -[ICGalleryAttachmentView setSubAttachmentItems:](self, "setSubAttachmentItems:", v5);

  return v7 ^ 1;
}

- (void)didChangeMergeableData
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__ICGalleryAttachmentView_didChangeMergeableData__block_invoke;
  block[3] = &unk_1EA7DD2D8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __49__ICGalleryAttachmentView_didChangeMergeableData__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateItemsAndLayout");
}

- (void)didUpdatePreviewImages
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICGalleryAttachmentView;
  -[ICGalleryAttachmentView didUpdatePreviewImages](&v3, sel_didUpdatePreviewImages);
  -[ICGalleryAttachmentView didChangeSize](self, "didChangeSize");
}

- (void)updateItemsAndLayout
{
  if (-[ICGalleryAttachmentView updateItems](self, "updateItems"))
  {
    -[ICGalleryAttachmentView didUpdateSubAttachmentItems](self, "didUpdateSubAttachmentItems");
    -[ICGalleryAttachmentView didChangeSize](self, "didChangeSize");
  }
}

- (void)updateItemForObjectID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  char v20;
  _QWORD block[6];
  char v22;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D639F0];
  -[ICGalleryAttachmentView attachment](self, "attachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ic_existingObjectWithID:context:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "parentAttachment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICGalleryAttachmentView attachment](self, "attachment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 == v10)
  {
    -[ICGalleryAttachmentView subAttachmentItems](self, "subAttachmentItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v12)
    {
      v13 = 0;
      while (1)
      {
        -[ICGalleryAttachmentView subAttachmentItems](self, "subAttachmentItems");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectAtIndexedSubscript:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "attachment");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16 == v8)
          break;

        ++v13;
        -[ICGalleryAttachmentView subAttachmentItems](self, "subAttachmentItems");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "count");

        if (v13 >= v18)
          goto LABEL_2;
      }
      objc_msgSend(v8, "managedObjectContext");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "ic_refreshObject:mergeChanges:", v8, 0);

      v20 = objc_msgSend(v15, "updateSize");
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __49__ICGalleryAttachmentView_updateItemForObjectID___block_invoke;
      block[3] = &unk_1EA7DD300;
      v22 = v20;
      block[4] = self;
      block[5] = v13;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
  }
LABEL_2:

}

uint64_t __49__ICGalleryAttachmentView_updateItemForObjectID___block_invoke(uint64_t a1)
{
  _BOOL8 v2;

  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "didChangeSize");
    v2 = *(_BYTE *)(a1 + 48) != 0;
  }
  else
  {
    v2 = 0;
  }
  return objc_msgSend(*(id *)(a1 + 32), "didUpdateSubAttachmentAtIndex:sizeDidChange:", *(_QWORD *)(a1 + 40), v2);
}

- (NSArray)subAttachmentItems
{
  return self->_subAttachmentItems;
}

- (void)setSubAttachmentItems:(id)a3
{
  objc_storeStrong((id *)&self->_subAttachmentItems, a3);
}

- (NSObject)attachmentDidLoadObserver
{
  return self->_attachmentDidLoadObserver;
}

- (void)setAttachmentDidLoadObserver:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentDidLoadObserver, a3);
}

- (NSObject)previewImagesDidUpdateObserver
{
  return self->_previewImagesDidUpdateObserver;
}

- (void)setPreviewImagesDidUpdateObserver:(id)a3
{
  objc_storeStrong((id *)&self->_previewImagesDidUpdateObserver, a3);
}

- (NSIndexPath)indexPathForPreviewing
{
  return self->_indexPathForPreviewing;
}

- (void)setIndexPathForPreviewing:(id)a3
{
  objc_storeStrong((id *)&self->_indexPathForPreviewing, a3);
}

- (ICGalleryAttachmentViewCollectionViewLayout)collectionViewLayout
{
  return self->_collectionViewLayout;
}

- (void)setCollectionViewLayout:(id)a3
{
  objc_storeStrong((id *)&self->_collectionViewLayout, a3);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (ICCollapsibleActivityView)activityView
{
  return self->_activityView;
}

- (void)setActivityView:(id)a3
{
  objc_storeStrong((id *)&self->_activityView, a3);
}

- (ICThumbnailDataCache)collectionViewCache
{
  return self->_collectionViewCache;
}

- (void)setCollectionViewCache:(id)a3
{
  objc_storeStrong((id *)&self->_collectionViewCache, a3);
}

- (UILongPressGestureRecognizer)longPressGestureRecognizer
{
  return self->_longPressGestureRecognizer;
}

- (void)setLongPressGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, a3);
}

- (NSIndexPath)movingIndexPath
{
  return self->_movingIndexPath;
}

- (void)setMovingIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_movingIndexPath, a3);
}

- (NSIndexPath)indexPathForZoomTransition
{
  return self->_indexPathForZoomTransition;
}

- (void)setIndexPathForZoomTransition:(id)a3
{
  objc_storeStrong((id *)&self->_indexPathForZoomTransition, a3);
}

- (ICGalleryAttachmentEditorController)galleryEditorController
{
  return self->_galleryEditorController;
}

- (void)setGalleryEditorController:(id)a3
{
  objc_storeStrong((id *)&self->_galleryEditorController, a3);
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, a3);
}

- (ICAttachmentPresenter)iPhoneSystemPaperAttachmentPresenter
{
  return self->_iPhoneSystemPaperAttachmentPresenter;
}

- (void)setIPhoneSystemPaperAttachmentPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_iPhoneSystemPaperAttachmentPresenter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iPhoneSystemPaperAttachmentPresenter, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_galleryEditorController, 0);
  objc_storeStrong((id *)&self->_indexPathForZoomTransition, 0);
  objc_storeStrong((id *)&self->_movingIndexPath, 0);
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_collectionViewCache, 0);
  objc_storeStrong((id *)&self->_activityView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
  objc_storeStrong((id *)&self->_indexPathForPreviewing, 0);
  objc_storeStrong((id *)&self->_previewImagesDidUpdateObserver, 0);
  objc_storeStrong((id *)&self->_attachmentDidLoadObserver, 0);
  objc_storeStrong((id *)&self->_subAttachmentItems, 0);
}

+ (double)topButtonHeight
{
  return 21.0;
}

+ (double)collectionViewMinHeight
{
  return 200.0;
}

+ (double)collectionViewMaxHeight
{
  return 456.0;
}

+ (double)collectionViewLeftRightMargins
{
  return 9.0;
}

+ (double)collectionViewTopBottomMargins
{
  return 9.0;
}

+ (BOOL)collectionViewShouldPeek
{
  return 1;
}

- (BOOL)shouldAddTapGesture
{
  return 0;
}

- (BOOL)shouldAddMenuLongPressGesture
{
  return 1;
}

- (void)openAttachment
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;

  -[ICGalleryAttachmentView indexPathForPreviewing](self, "indexPathForPreviewing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ICGalleryAttachmentView indexPathForPreviewing](self, "indexPathForPreviewing");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "row");
    -[ICGalleryAttachmentView subAttachmentItems](self, "subAttachmentItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v5 >= v7)
    {
      v3 = 0;
    }
    else
    {
      -[ICGalleryAttachmentView indexPathForPreviewing](self, "indexPathForPreviewing");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = (void *)objc_msgSend(v8, "row");

      -[ICGalleryAttachmentView setIndexPathForPreviewing:](self, "setIndexPathForPreviewing:", 0);
    }
  }
  -[ICGalleryAttachmentView openAttachmentAtIndex:](self, "openAttachmentAtIndex:", v3);
}

- (id)indexPathForItemClosestToPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  id v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  y = a3.y;
  x = a3.x;
  v36 = *MEMORY[0x1E0C80C00];
  -[ICGalleryAttachmentView collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathForItemAtPoint:", x, y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    -[ICGalleryAttachmentView collectionView](self, "collectionView", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "indexPathsForVisibleItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v10)
    {
      v11 = v10;
      v7 = 0;
      v12 = *(_QWORD *)v32;
      v13 = INFINITY;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v32 != v12)
            objc_enumerationMutation(v9);
          v15 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          -[ICGalleryAttachmentView collectionView](self, "collectionView");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "cellForItemAtIndexPath:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v17, "bounds");
          v19 = v18;
          v21 = v20;
          v23 = v22;
          v25 = v24;
          -[ICGalleryAttachmentView collectionView](self, "collectionView");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "convertRect:toView:", v26, v19, v21, v23, v25);

          TSDDistanceToRect();
          if (v27 < v13)
          {
            v28 = v27;
            v29 = v15;

            v13 = v28;
            v7 = v29;
          }

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v11);
    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (void)invalidateCollectionViewLayoutWithNewItemHeight:(double)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v12;
  _QWORD block[5];

  -[ICGalleryAttachmentView collectionViewLayout](self, "collectionViewLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemHeight");
  v7 = v6;

  v8 = round(a3);
  if (v8 - v7 >= 0.0)
    v9 = v8 - v7;
  else
    v9 = -(v8 - v7);
  -[ICGalleryAttachmentView collectionViewLayout](self, "collectionViewLayout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "invalidateLayoutWithNewItemHeight:", v8);

  if (v7 == 0.0 || v9 > 20.0)
  {
    -[ICGalleryAttachmentView galleryAttachmentViewCellImageCache](self, "galleryAttachmentViewCellImageCache");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeAllThumbnailData");

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __106__ICGalleryAttachmentView_PlatformSpecificResponsibilty__invalidateCollectionViewLayoutWithNewItemHeight___block_invoke;
    block[3] = &unk_1EA7DD2D8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

void __106__ICGalleryAttachmentView_PlatformSpecificResponsibilty__invalidateCollectionViewLayoutWithNewItemHeight___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForVisibleItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadItemsAtIndexPaths:", v4);

}

- (void)setupCollectionViewIfNecessary
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  ICGalleryAttachmentViewCollectionViewLayout *v47;
  ICGalleryAttachmentViewCollectionViewLayout *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;

  if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
    -[ICGalleryAttachmentView setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", 1);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v78 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision") & 1) != 0)
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemFillColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "systemFillColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICGalleryAttachmentView setBackgroundColor:](self, "setBackgroundColor:", v3);

  -[ICGalleryAttachmentView titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    -[ICGalleryAttachmentView setTitleLabel:](self, "setTitleLabel:", v5);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICGalleryAttachmentView titleLabel](self, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTextColor:", v6);

    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 14.0, *MEMORY[0x1E0DC1448]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ic_fontWithSingleLineA");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICGalleryAttachmentView titleLabel](self, "titleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFont:", v9);

    -[ICGalleryAttachmentView titleLabel](self, "titleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[ICGalleryAttachmentView titleLabel](self, "titleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setUserInteractionEnabled:", 0);

    -[ICGalleryAttachmentView titleLabel](self, "titleLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICGalleryAttachmentView addSubview:](self, "addSubview:", v13);

    v14 = objc_alloc_init(MEMORY[0x1E0D64BD0]);
    -[ICGalleryAttachmentView setActivityView:](self, "setActivityView:", v14);

    -[ICGalleryAttachmentView activityView](self, "activityView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[ICGalleryAttachmentView activityView](self, "activityView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setLeadingSpace:", 8.0);

    -[ICGalleryAttachmentView activityView](self, "activityView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTrailingSpace:", 8.0);

    -[ICGalleryAttachmentView activityView](self, "activityView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setCollapsed:", 1);

    -[ICGalleryAttachmentView activityView](self, "activityView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICGalleryAttachmentView addSubview:](self, "addSubview:", v19);

    -[ICGalleryAttachmentView titleLabel](self, "titleLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "leadingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICGalleryAttachmentView leadingAnchor](self, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, 9.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "addObject:", v23);

    -[ICGalleryAttachmentView titleLabel](self, "titleLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICGalleryAttachmentView activityView](self, "activityView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "leadingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "addObject:", v28);

    -[ICGalleryAttachmentView activityView](self, "activityView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "centerYAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICGalleryAttachmentView titleLabel](self, "titleLabel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "centerYAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "addObject:", v33);

    -[ICGalleryAttachmentView activityView](self, "activityView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "trailingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICGalleryAttachmentView trailingAnchor](self, "trailingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintLessThanOrEqualToAnchor:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v78, "addObject:", v37);
    -[ICGalleryAttachmentView didChangeAttachmentTitle](self, "didChangeAttachmentTitle");

  }
  -[ICGalleryAttachmentView tapGestureRecognizer](self, "tapGestureRecognizer");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v38)
  {
    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_didTapTopOfGalleryView_);
    -[ICGalleryAttachmentView setTapGestureRecognizer:](self, "setTapGestureRecognizer:", v39);

    -[ICGalleryAttachmentView tapGestureRecognizer](self, "tapGestureRecognizer");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setDelegate:", self);

    -[ICGalleryAttachmentView tapGestureRecognizer](self, "tapGestureRecognizer");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICGalleryAttachmentView addGestureRecognizer:](self, "addGestureRecognizer:", v41);

  }
  -[ICGalleryAttachmentView collectionView](self, "collectionView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v42)
  {
    objc_opt_class();
    -[ICGalleryAttachmentView attachment](self, "attachment");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "attachmentModel");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    ICCheckedDynamicCast();
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = objc_alloc_init(MEMORY[0x1E0D63A38]);
    -[ICGalleryAttachmentView setCollectionViewCache:](self, "setCollectionViewCache:", v46);

    v47 = [ICGalleryAttachmentViewCollectionViewLayout alloc];
    -[ICGalleryAttachmentView collectionViewItemHeight](self, "collectionViewItemHeight");
    v48 = -[ICGalleryAttachmentViewCollectionViewLayout initWithAttachmentGalleryModel:itemHeight:itemSpacing:margins:](v47, "initWithAttachmentGalleryModel:itemHeight:itemSpacing:margins:", v45);
    -[ICGalleryAttachmentView setCollectionViewLayout:](self, "setCollectionViewLayout:", v48);

    v49 = objc_alloc(MEMORY[0x1E0DC35B8]);
    -[ICGalleryAttachmentView collectionViewLayout](self, "collectionViewLayout");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = (void *)objc_msgSend(v49, "initWithFrame:collectionViewLayout:", v50, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
    -[ICGalleryAttachmentView setCollectionView:](self, "setCollectionView:", v51);

    -[ICGalleryAttachmentView collectionView](self, "collectionView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (void *)MEMORY[0x1E0DC3A50];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "nibWithNibName:bundle:", CFSTR("ICGalleryAttachmentViewCell"), v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "registerNib:forCellWithReuseIdentifier:", v55, CFSTR("ICGalleryViewCollectionViewCell"));

    -[ICGalleryAttachmentView collectionView](self, "collectionView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setDelegate:", self);

    -[ICGalleryAttachmentView collectionView](self, "collectionView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setDataSource:", self);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICGalleryAttachmentView collectionView](self, "collectionView");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setBackgroundColor:", v58);

    -[ICGalleryAttachmentView collectionView](self, "collectionView");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[ICGalleryAttachmentView collectionView](self, "collectionView");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setAlwaysBounceVertical:", 0);

    -[ICGalleryAttachmentView collectionView](self, "collectionView");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setShowsVerticalScrollIndicator:", 0);

    -[ICGalleryAttachmentView collectionView](self, "collectionView");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setScrollsToTop:", 0);

    -[ICGalleryAttachmentView collectionView](self, "collectionView");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICGalleryAttachmentView addSubview:](self, "addSubview:", v64);

    -[ICGalleryAttachmentView collectionView](self, "collectionView");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    _NSDictionaryOfVariableBindings(CFSTR("collectionView"), v65, 0);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-0@900-[collectionView]-0@900-|"), 0, 0, v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "addObjectsFromArray:", v67);

    v68 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("V:|-%g-[collectionView]-0-|"), 0x4035000000000000);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintsWithVisualFormat:options:metrics:views:", v69, 0, 0, v66);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "addObjectsFromArray:", v70);

    -[ICGalleryAttachmentView titleLabel](self, "titleLabel");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "firstBaselineAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICGalleryAttachmentView collectionView](self, "collectionView");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "topAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "constraintEqualToAnchor:", v74);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "addObject:", v75);

    -[ICGalleryAttachmentView layer](self, "layer");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setCornerRadius:", 9.0);

    -[ICGalleryAttachmentView layer](self, "layer");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "setMasksToBounds:", 1);

  }
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v78);
  -[ICGalleryAttachmentView updateActivityView](self, "updateActivityView");

}

- (void)respondToLongPressReorderingGesture:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  id v20;

  v4 = a3;
  -[ICGalleryAttachmentView collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  -[ICGalleryAttachmentView collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "indexPathForItemAtPoint:", v7, v9);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  -[ICGalleryAttachmentView setMovingIndexPath:](self, "setMovingIndexPath:");

  v11 = objc_msgSend(v4, "state");
  if (v11 == 3)
  {
    -[ICGalleryAttachmentView collectionView](self, "collectionView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "endInteractiveMovement");
LABEL_9:

    -[ICGalleryAttachmentView setMovingIndexPath:](self, "setMovingIndexPath:", 0);
LABEL_10:
    v12 = v20;
    if (!v20)
      goto LABEL_14;
    goto LABEL_11;
  }
  if (v11 == 2)
  {
    -[ICGalleryAttachmentView collectionView](self, "collectionView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "updateInteractiveMovementTargetPosition:", v7, v9);

    goto LABEL_10;
  }
  if (v11 != 1)
  {
    -[ICGalleryAttachmentView collectionView](self, "collectionView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cancelInteractiveMovement");
    goto LABEL_9;
  }
  v12 = v20;
  if (!v20)
    goto LABEL_14;
  -[ICGalleryAttachmentView collectionView](self, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "beginInteractiveMovementForItemAtIndexPath:", v20);

LABEL_11:
  -[ICGalleryAttachmentView collectionView](self, "collectionView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "cellForItemAtIndexPath:", v20);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICGalleryAttachmentView movingIndexPath](self, "movingIndexPath");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0.5;
  if (!v18)
    v19 = 1.0;
  objc_msgSend(v17, "setAlpha:", v19);

  v12 = v20;
LABEL_14:

}

- (void)didTapTopOfGalleryView:(id)a3
{
  -[ICGalleryAttachmentView openAttachmentAtIndex:](self, "openAttachmentAtIndex:", 0);
}

- (void)didChangeAttachmentTitle
{
  void *v3;

  -[ICGalleryAttachmentView galleryEditorController](self, "galleryEditorController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attachmentTitleDidChange");

  -[ICGalleryAttachmentView updateAttachmentTitleLabel](self, "updateAttachmentTitleLabel");
}

- (void)updateAttachmentTitleLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICGalleryAttachmentView titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v3);

  v5 = (void *)objc_opt_class();
  -[ICGalleryAttachmentView attachment](self, "attachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "titleForGalleryAttachment:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICGalleryAttachmentView highlightPatternRegexFinder](self, "highlightPatternRegexFinder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && v7)
  {
    v19[0] = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v9;
    v19[1] = *MEMORY[0x1E0DC1138];
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 14.0, *MEMORY[0x1E0DC1448]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ic_fontWithSingleLineA");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v7, v12);
    if (v13)
    {
      -[ICGalleryAttachmentView highlightPatternRegexFinder](self, "highlightPatternRegexFinder");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "ICTintColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "ic_attributedStringByHighlightingRegexFinderMatches:withHighlightColor:", v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[ICGalleryAttachmentView titleLabel](self, "titleLabel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setAttributedText:", v16);

    }
  }
  else
  {
    -[ICGalleryAttachmentView titleLabel](self, "titleLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setText:", v7);

  }
}

- (void)didUpdateSubAttachmentItems
{
  void *v3;
  void *v4;
  void *v5;

  -[ICGalleryAttachmentView collectionViewLayout](self, "collectionViewLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateLayout");

  -[ICGalleryAttachmentView collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

  -[ICGalleryAttachmentView galleryEditorController](self, "galleryEditorController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateDocumentViewControllerFromModel");

  -[ICGalleryAttachmentView updateActivityView](self, "updateActivityView");
}

- (void)didUpdateSubAttachmentAtIndex:(int64_t)a3 sizeDidChange:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v4 = a4;
  v13[1] = *MEMORY[0x1E0C80C00];
  -[ICGalleryAttachmentView collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "numberOfItemsInSection:", 0);

  if (v8 > a3)
  {
    -[ICGalleryAttachmentView collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a3, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reloadItemsAtIndexPaths:", v11);

    if (v4)
    {
      -[ICGalleryAttachmentView collectionViewLayout](self, "collectionViewLayout");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "invalidateLayout");

    }
  }
  -[ICGalleryAttachmentView updateActivityView](self, "updateActivityView");
}

- (void)updateActivityView
{
  void *v3;
  char v4;
  char v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  BOOL v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[ICGalleryAttachmentView attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "needsInitialFetchFromCloud");

  v5 = 1;
  if ((v4 & 1) == 0)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[ICGalleryAttachmentView subAttachmentItems](self, "subAttachmentItems", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v5 = 0;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "attachment");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11 == 0;

          v5 |= v12;
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }
    else
    {
      v5 = 0;
    }

  }
  -[ICGalleryAttachmentView activityView](self, "activityView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCollapsed:", (v5 & 1) == 0);

}

- (void)openAttachmentAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  ICGalleryAttachmentEditorController *v10;
  void *v11;
  ICGalleryAttachmentEditorController *v12;
  void *v13;
  ICAttachmentPresenter *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  ICAttachmentPresenter *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  if (!-[ICAttachmentView showRecoverNoteAlertIfNecessary](self, "showRecoverNoteAlertIfNecessary"))
  {
    objc_opt_class();
    -[ICGalleryAttachmentView attachment](self, "attachment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attachmentModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ICCheckedDynamicCast();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "subAttachmentCount"))
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a3, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICGalleryAttachmentView setIndexPathForZoomTransition:](self, "setIndexPathForZoomTransition:", v8);

      -[ICGalleryAttachmentView galleryEditorController](self, "galleryEditorController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        v10 = [ICGalleryAttachmentEditorController alloc];
        -[ICGalleryAttachmentView attachment](self, "attachment");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[ICGalleryAttachmentEditorController initWithGalleryAttachment:browserMode:delegate:](v10, "initWithGalleryAttachment:browserMode:delegate:", v11, 0, self);
        -[ICGalleryAttachmentView setGalleryEditorController:](self, "setGalleryEditorController:", v12);

      }
      objc_msgSend(v7, "singleSubAttachmentAtIndex:", a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (_UIApplicationIsExtension())
      {
        v14 = [ICAttachmentPresenter alloc];
        -[ICGalleryAttachmentView attachment](self, "attachment");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v26[0] = v15;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICGalleryAttachmentView attachment](self, "attachment");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isReadOnly") ^ 1;
        -[ICGalleryAttachmentView window](self, "window");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "rootViewController");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[ICAttachmentPresenter initWithViewControllerManager:attachments:startingAtIndex:delegate:displayShowInNote:editable:presentingViewController:](v14, "initWithViewControllerManager:attachments:startingAtIndex:delegate:displayShowInNote:editable:presentingViewController:", 0, v16, 0, self, 0, v18, v20);
        -[ICGalleryAttachmentView setIPhoneSystemPaperAttachmentPresenter:](self, "setIPhoneSystemPaperAttachmentPresenter:", v21);

        -[ICGalleryAttachmentView iPhoneSystemPaperAttachmentPresenter](self, "iPhoneSystemPaperAttachmentPresenter");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "presentAttachmentWithSelectedSubAttachment:", v13);

      }
      else
      {
        -[ICGalleryAttachmentView ic_viewControllerManager](self, "ic_viewControllerManager");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICGalleryAttachmentView attachment](self, "attachment");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICGalleryAttachmentView attachment](self, "attachment");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "presentAttachment:delegate:displayShowInNote:editable:selectedSubAttachment:presentingViewController:", v24, self, 0, objc_msgSend(v25, "isReadOnly") ^ 1, v13, 0);

      }
    }

  }
}

- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4
{
  return 1;
}

- (void)collectionView:(id)a3 moveItemAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v7 = a5;
  v8 = a4;
  -[ICGalleryAttachmentView galleryEditorController](self, "galleryEditorController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "row");

  v10 = objc_msgSend(v7, "row");
  objc_msgSend(v11, "movePageFromIndex:toIndex:", v9, v10);

}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[ICGalleryAttachmentView subAttachmentItems](self, "subAttachmentItems", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;

  v5 = a4;
  objc_opt_class();
  -[ICGalleryAttachmentView collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("ICGalleryViewCollectionViewCell"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v5, "row");
  -[ICGalleryAttachmentView subAttachmentItems](self, "subAttachmentItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v9 >= v11)
  {
    v16 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[ICGalleryAttachmentView(PlatformSpecificResponsibilty) collectionView:cellForItemAtIndexPath:].cold.1((uint64_t)v5, self, v16);

  }
  else
  {
    objc_msgSend(v8, "setDelegate:", self);
    -[ICGalleryAttachmentView subAttachmentItems](self, "subAttachmentItems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "attachment");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAttachment:", v14);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v15);

  }
  return v8;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  -[ICGalleryAttachmentView openAttachmentAtIndex:](self, "openAttachmentAtIndex:", objc_msgSend(a4, "item", a3));
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  CGSize result;

  v6 = a5;
  -[ICGalleryAttachmentView collectionViewLayout](self, "collectionViewLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itemSize");
  v9 = v8;
  v11 = v10;

  v12 = objc_msgSend(v6, "item");
  -[ICGalleryAttachmentView subAttachmentItems](self, "subAttachmentItems");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v12 < v14)
  {
    -[ICGalleryAttachmentView subAttachmentItems](self, "subAttachmentItems");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndexedSubscript:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "attachment");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = (void *)objc_opt_class();
      objc_msgSend(v16, "attachment");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "sizeWidth");
      v21 = v20;
      objc_msgSend(v16, "attachment");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "sizeHeight");
      objc_msgSend(v18, "effectiveAspectRatioForWidth:height:", v21, v23);
      v25 = v24;

      -[ICGalleryAttachmentView collectionViewLayout](self, "collectionViewLayout");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "itemHeight");
      v9 = round(v25 * v27);

      -[ICGalleryAttachmentView collectionViewLayout](self, "collectionViewLayout");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "itemHeight");
      v11 = v29;

    }
  }
  v30 = v9;
  v31 = v11;
  result.height = v31;
  result.width = v30;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  v5 = 9.0;
  v6 = 9.0;
  v7 = 9.0;
  v8 = 9.0;
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (double)galleryAttachmentViewItemHeight
{
  void *v2;
  double v3;
  double v4;

  -[ICGalleryAttachmentView collectionViewLayout](self, "collectionViewLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "itemHeight");
  v4 = v3;

  return v4;
}

- (void)galleryAttachmentEditorControllerDidDismiss
{
  -[ICGalleryAttachmentView setGalleryEditorController:](self, "setGalleryEditorController:", 0);
}

- (void)galleryAttachmentEditorControllerDeleteAttachment
{
  -[ICAttachmentView delete:](self, "delete:", self);
}

- (id)attachmentPresenter:(id)a3 transitionViewForAttachment:(id)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[ICGalleryAttachmentView collectionView](self, "collectionView", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICGalleryAttachmentView indexPathForZoomTransition](self, "indexPathForZoomTransition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cellForItemAtIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)attachmentPresenter:(id)a3 transitionViewForIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[ICGalleryAttachmentView collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cellForItemAtIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)scrollCollectionViewToIndexPath:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = objc_msgSend(v10, "section");
  -[ICGalleryAttachmentView collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 >= objc_msgSend(v5, "numberOfSections"))
    goto LABEL_4;
  v6 = objc_msgSend(v10, "item");
  -[ICGalleryAttachmentView collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "numberOfItemsInSection:", objc_msgSend(v10, "section"));

  if (v6 < v8)
  {
    -[ICGalleryAttachmentView collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scrollToItemAtIndexPath:atScrollPosition:animated:", v10, 8, 0);

    -[ICGalleryAttachmentView collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layoutIfNeeded");
LABEL_4:

  }
}

- (void)handleDeleteAttachmentFromPresenter:(id)a3
{
  -[ICAttachmentView delete:](self, "delete:", self);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  id v5;
  unsigned __int8 v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  objc_super v14;

  v4 = a3;
  -[ICGalleryAttachmentView tapGestureRecognizer](self, "tapGestureRecognizer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[ICGalleryAttachmentView attachment](self, "attachment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v4, "locationInView:", self);
      v9 = v8;
      -[ICGalleryAttachmentView collectionView](self, "collectionView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "frame");
      v12 = v11;

      v6 = v9 < v12;
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)ICGalleryAttachmentView;
    v6 = -[ICGalleryAttachmentView gestureRecognizerShouldBegin:](&v14, sel_gestureRecognizerShouldBegin_, v4);
  }

  return v6;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Scanned document attachment"), &stru_1EA7E9860, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)ICGalleryAttachmentView;
  -[ICAttachmentView accessibilityValue](&v20, sel_accessibilityValue);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("%lu scans"), &stru_1EA7E9860, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  -[ICGalleryAttachmentView subAttachmentItems](self, "subAttachmentItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringWithFormat:", v5, objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICGalleryAttachmentView subAttachmentItems](self, "subAttachmentItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "attachment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ocrSummary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByTrimmingCharactersInSet:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Possible text for first scan: %@"), &stru_1EA7E9860, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v16, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }
  __ICAccessibilityStringForVariables();
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

@end
