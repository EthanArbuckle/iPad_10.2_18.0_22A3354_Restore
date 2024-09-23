@implementation ICDocCamThumbnailCollectionViewController

- (ICDocCamThumbnailCollectionViewController)initWithDelegate:(id)a3
{
  id v4;
  ICDocCamThumbnailCollectionViewLayout *v5;
  ICDocCamThumbnailCollectionViewController *v6;
  ICDocCamThumbnailCollectionViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v5 = objc_alloc_init(ICDocCamThumbnailCollectionViewLayout);
  v14.receiver = self;
  v14.super_class = (Class)ICDocCamThumbnailCollectionViewController;
  v6 = -[ICDocCamThumbnailCollectionViewController initWithCollectionViewLayout:](&v14, sel_initWithCollectionViewLayout_, v5);
  v7 = v6;
  if (v6)
  {
    -[ICDocCamThumbnailCollectionViewController setLayout:](v6, "setLayout:", v5);
    -[ICDocCamThumbnailCollectionViewController collectionView](v7, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDataSource:", v7);

    -[ICDocCamThumbnailCollectionViewController collectionView](v7, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDelegate:", v7);

    -[ICDocCamThumbnailCollectionViewController collectionView](v7, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundColor:", v11);

    -[ICDocCamThumbnailCollectionViewController setDelegate:](v7, "setDelegate:", v4);
    -[ICDocCamThumbnailCollectionViewController layout](v7, "layout");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDelegate:", v7);

  }
  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICDocCamThumbnailCollectionViewController;
  -[ICDocCamThumbnailCollectionViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[ICDocCamThumbnailCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("ICDocCamThumbnailCellKind"));

  -[ICDocCamThumbnailCollectionViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClipsToBounds:", 0);

}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ICDocCamThumbnailCollectionViewController;
  -[ICDocCamThumbnailCollectionViewController didReceiveMemoryWarning](&v2, sel_didReceiveMemoryWarning);
}

- (CGSize)collectionView:(id)a3 imageSizeAtIndex:(int64_t)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGSize result;

  -[ICDocCamThumbnailCollectionViewController documentInfoArray](self, "documentInfoArray", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6
    && (v7 = (void *)v6,
        -[ICDocCamThumbnailCollectionViewController documentInfoArray](self, "documentInfoArray"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "count"),
        v8,
        v7,
        v9))
  {
    -[ICDocCamThumbnailCollectionViewController documentInfoArray](self, "documentInfoArray");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "croppedAndFilteredImageUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      -[ICDocCamThumbnailCollectionViewController documentInfoArray](self, "documentInfoArray");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", a4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "meshAnimImageUUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[ICDocCamThumbnailCollectionViewController imageCache](self, "imageCache");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "getImageSize:", v12);
    v17 = v16;
    v19 = v18;

    v20 = v17;
    v21 = v19;
  }
  else
  {
    v20 = 0.0;
    v21 = 0.0;
  }
  result.height = v21;
  result.width = v20;
  return result;
}

- (CGRect)targetViewRect
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[ICDocCamThumbnailCollectionViewController delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "targetViewRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (id)rootView
{
  void *v2;
  void *v3;

  -[ICDocCamThumbnailCollectionViewController delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rootView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int64_t v10;

  -[ICDocCamThumbnailCollectionViewController documentInfoArray](self, "documentInfoArray", a3, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    return 0;
  v6 = (void *)v5;
  -[ICDocCamThumbnailCollectionViewController documentInfoArray](self, "documentInfoArray");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (!v8)
    return 0;
  -[ICDocCamThumbnailCollectionViewController documentInfoArray](self, "documentInfoArray");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  return v10;
}

- (void)setImageWithUUID:(id)a3 forCell:(id)a4 useResizedImage:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  NSObject *v28;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  -[ICDocCamThumbnailCollectionViewController imageCache](self, "imageCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "getImage:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v28 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[ICDocCamThumbnailCollectionViewController setImageWithUUID:forCell:useResizedImage:].cold.1((uint64_t)v8, v28);

    goto LABEL_7;
  }
  if (!v5)
  {
LABEL_7:
    objc_msgSend(v9, "imageView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setImage:", v11);
    goto LABEL_8;
  }
  -[ICDocCamThumbnailCollectionViewController collectionView](self, "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "collectionViewLayout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "size");
  v15 = v14;
  v17 = v16;
  objc_msgSend(v13, "frameSizeForImageSize:");
  v19 = v18;
  v21 = v20;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "scale");
  v24 = v23;

  v25 = fmax(v24, 1.0);
  +[ICDocCamUtilities aspectFillSize:targetSize:](ICDocCamUtilities, "aspectFillSize:targetSize:", v15, v17, v19 * v25, v21 * v25);
  +[ICDocCamUtilities resizedImage:newSize:interpolationQuality:](ICDocCamUtilities, "resizedImage:newSize:interpolationQuality:", v11, 3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setImage:", v26);

LABEL_8:
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  float v8;
  void *v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("ICDocCamThumbnailCellKind"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ICDocCamThumbnailCollectionViewController isPerformingBatchUpdates](self, "isPerformingBatchUpdates"))
    v8 = 0.5;
  else
    v8 = 1.0;
  objc_msgSend(v7, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v10 = v8;
  objc_msgSend(v9, "setSpeed:", v10);

  -[ICDocCamThumbnailCollectionViewController documentInfoArray](self, "documentInfoArray");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    -[ICDocCamThumbnailCollectionViewController documentInfoArray](self, "documentInfoArray");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14)
    {
      -[ICDocCamThumbnailCollectionViewController documentInfoArray](self, "documentInfoArray");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v6, "item"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "croppedAndFilteredImageUUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        -[ICDocCamThumbnailCollectionViewController documentInfoArray](self, "documentInfoArray");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectAtIndexedSubscript:", objc_msgSend(v6, "item"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "meshAnimImageUUID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

      }
      -[ICDocCamThumbnailCollectionViewController setImageWithUUID:forCell:useResizedImage:](self, "setImageWithUUID:forCell:useResizedImage:", v17, v7, -[ICDocCamThumbnailCollectionViewController isPerformingBatchUpdates](self, "isPerformingBatchUpdates") ^ 1);

    }
  }

  return v7;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[ICDocCamThumbnailCollectionViewController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "thumbnailViewDidTap:", v5);

}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  objc_super v11;

  height = a3.height;
  width = a3.width;
  v11.receiver = self;
  v11.super_class = (Class)ICDocCamThumbnailCollectionViewController;
  v7 = a4;
  -[ICDocCamThumbnailCollectionViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[ICDocCamThumbnailCollectionViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClipsToBounds:", 1);

  -[ICDocCamThumbnailCollectionViewController layout](self, "layout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTransitioning:", 1);

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __96__ICDocCamThumbnailCollectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v10[3] = &unk_24C5B7B50;
  v10[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", &__block_literal_global_18, v10);

}

void __96__ICDocCamThumbnailCollectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  ICDocCamThumbnailCollectionViewLayout *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v2 = objc_alloc_init(ICDocCamThumbnailCollectionViewLayout);
  objc_msgSend(*(id *)(a1 + 32), "setLayout:", v2);

  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", v3);

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "layout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCollectionViewLayout:animated:", v6, 1);

  objc_msgSend(*(id *)(a1 + 32), "reloadDataForCollectionView");
  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setClipsToBounds:", 0);

  objc_msgSend(*(id *)(a1 + 32), "layout");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTransitioning:", 0);

}

- (void)reloadDataForCollectionView
{
  id v3;

  if (-[ICDocCamThumbnailCollectionViewController isPerformingBatchUpdates](self, "isPerformingBatchUpdates"))
  {
    -[ICDocCamThumbnailCollectionViewController setNeedReloadAfterBatchUpdates:](self, "setNeedReloadAfterBatchUpdates:", 1);
  }
  else
  {
    -[ICDocCamThumbnailCollectionViewController collectionView](self, "collectionView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reloadData");

  }
}

- (void)update
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__ICDocCamThumbnailCollectionViewController_update__block_invoke;
  block[3] = &unk_24C5B7AE0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __51__ICDocCamThumbnailCollectionViewController_update__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadDataForCollectionView");
}

- (void)addNewDocument:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;

  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.documentcamera", ");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[ICDocCamThumbnailCollectionViewController addNewDocument:completionBlock:].cold.1((uint64_t)v6, v8);

  -[ICDocCamThumbnailCollectionViewController setIsPerformingBatchUpdates:](self, "setIsPerformingBatchUpdates:", 1);
  -[ICDocCamThumbnailCollectionViewController documentInfoArray](self, "documentInfoArray");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamThumbnailCollectionViewController collectionView](self, "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __76__ICDocCamThumbnailCollectionViewController_addNewDocument_completionBlock___block_invoke;
  v21[3] = &unk_24C5B80C0;
  v21[4] = self;
  v22 = v6;
  v23 = v11;
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __76__ICDocCamThumbnailCollectionViewController_addNewDocument_completionBlock___block_invoke_2;
  v17[3] = &unk_24C5B8FA8;
  v17[4] = self;
  v18 = v23;
  v19 = v22;
  v20 = v7;
  v14 = v7;
  v15 = v23;
  v16 = v22;
  objc_msgSend(v12, "performBatchUpdates:completion:", v21, v17);

}

void __76__ICDocCamThumbnailCollectionViewController_addNewDocument_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addNewDocument:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "insertItemsAtIndexPaths:", v4);

}

void __76__ICDocCamThumbnailCollectionViewController_addNewDocument_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  NSObject *v8;
  void *v9;

  v2 = *(_QWORD *)(a1 + 56);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  objc_msgSend(*(id *)(a1 + 32), "setIsPerformingBatchUpdates:", 0);
  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cellForItemAtIndexPath:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = 1.0;
  objc_msgSend(v5, "setSpeed:", v6);

  objc_msgSend(*(id *)(a1 + 48), "croppedAndFilteredImageUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(*(id *)(a1 + 48), "meshAnimImageUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = os_log_create("com.apple.documentcamera", ");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __76__ICDocCamThumbnailCollectionViewController_addNewDocument_completionBlock___block_invoke_2_cold_1((uint64_t *)(a1 + 48), (uint64_t)v7, v8);

  objc_msgSend(*(id *)(a1 + 32), "setImageWithUUID:forCell:useResizedImage:", v7, v4, 1);
  if (objc_msgSend(*(id *)(a1 + 32), "needReloadAfterBatchUpdates"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setNeedReloadAfterBatchUpdates:", 0);
    objc_msgSend(*(id *)(a1 + 32), "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reloadData");

  }
}

- (void)animateLayoutChange
{
  ICDocCamThumbnailCollectionViewLayout *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = objc_alloc_init(ICDocCamThumbnailCollectionViewLayout);
  -[ICDocCamThumbnailCollectionViewController setLayout:](self, "setLayout:", v3);

  -[ICDocCamThumbnailCollectionViewController layout](self, "layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);

  -[ICDocCamThumbnailCollectionViewController collectionView](self, "collectionView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ICDocCamThumbnailCollectionViewController layout](self, "layout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCollectionViewLayout:animated:", v5, 1);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NSMutableArray)documentInfoArray
{
  return self->_documentInfoArray;
}

- (void)setDocumentInfoArray:(id)a3
{
  objc_storeStrong((id *)&self->_documentInfoArray, a3);
}

- (ICDocCamImageCache)imageCache
{
  return self->_imageCache;
}

- (void)setImageCache:(id)a3
{
  objc_storeStrong((id *)&self->_imageCache, a3);
}

- (ICDocCamThumbnailViewDelegate)delegate
{
  return (ICDocCamThumbnailViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ICDocCamThumbnailCollectionViewLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
  objc_storeStrong((id *)&self->_layout, a3);
}

- (BOOL)isPerformingBatchUpdates
{
  return self->_isPerformingBatchUpdates;
}

- (void)setIsPerformingBatchUpdates:(BOOL)a3
{
  self->_isPerformingBatchUpdates = a3;
}

- (BOOL)needReloadAfterBatchUpdates
{
  return self->_needReloadAfterBatchUpdates;
}

- (void)setNeedReloadAfterBatchUpdates:(BOOL)a3
{
  self->_needReloadAfterBatchUpdates = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layout, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_documentInfoArray, 0);
}

- (void)setImageWithUUID:(uint64_t)a1 forCell:(NSObject *)a2 useResizedImage:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_20CE8E000, a2, OS_LOG_TYPE_ERROR, "Error finding image: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)addNewDocument:(uint64_t)a1 completionBlock:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = a1;
  _os_log_debug_impl(&dword_20CE8E000, a2, OS_LOG_TYPE_DEBUG, "addNewDocument: %p", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

void __76__ICDocCamThumbnailCollectionViewController_addNewDocument_completionBlock___block_invoke_2_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 134218242;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_debug_impl(&dword_20CE8E000, log, OS_LOG_TYPE_DEBUG, "addNewDocument: %p %@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_1();
}

@end
