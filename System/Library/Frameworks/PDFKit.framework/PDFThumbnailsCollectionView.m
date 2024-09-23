@implementation PDFThumbnailsCollectionView

- (id)initFromThumbnailView:(id)a3
{
  id v4;
  PDFThumbnailsCollectionView *v5;
  PDFThumbnailsCollectionView *v6;
  uint64_t v7;
  NSCache *cache;
  id v9;
  id v10;
  uint64_t v11;
  UICollectionView *collectionView;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  UICollectionViewDiffableDataSource *dataSource;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  objc_super v33;
  _QWORD v34[5];

  v34[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)PDFThumbnailsCollectionView;
  v5 = -[PDFThumbnailsCollectionView init](&v33, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_thumbnailView, v4);
    v7 = objc_opt_new();
    cache = v6->_cache;
    v6->_cache = (NSCache *)v7;

    v9 = objc_alloc_init(MEMORY[0x24BDF6908]);
    objc_msgSend(v9, "setScrollDirection:", 0);
    objc_msgSend(v9, "setSectionInset:", 5.0, 0.0, 5.0, 0.0);
    objc_msgSend(v9, "setMinimumLineSpacing:", 0.0);
    v32 = v9;
    objc_msgSend(v9, "setEstimatedItemSize:", *MEMORY[0x24BDF7638], *(double *)(MEMORY[0x24BDF7638] + 8));
    v10 = objc_alloc(MEMORY[0x24BDF68D8]);
    objc_msgSend(v4, "bounds");
    v11 = objc_msgSend(v10, "initWithFrame:collectionViewLayout:", v9);
    collectionView = v6->_collectionView;
    v6->_collectionView = (UICollectionView *)v11;

    -[PDFThumbnailsCollectionView addSubview:](v6, "addSubview:", v6->_collectionView);
    -[UICollectionView setDragInteractionEnabled:](v6->_collectionView, "setDragInteractionEnabled:", 1);
    -[UICollectionView setDragDelegate:](v6->_collectionView, "setDragDelegate:", v6);
    -[UICollectionView setDropDelegate:](v6->_collectionView, "setDropDelegate:", v6);
    -[UICollectionView setTranslatesAutoresizingMaskIntoConstraints:](v6->_collectionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v26 = (void *)MEMORY[0x24BDD1628];
    -[UICollectionView bottomAnchor](v6->_collectionView, "bottomAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFThumbnailsCollectionView bottomAnchor](v6, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v30);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v29;
    -[UICollectionView topAnchor](v6->_collectionView, "topAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFThumbnailsCollectionView topAnchor](v6, "topAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v27);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = v25;
    -[UICollectionView leadingAnchor](v6->_collectionView, "leadingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFThumbnailsCollectionView leadingAnchor](v6, "leadingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v34[2] = v15;
    -[UICollectionView trailingAnchor](v6->_collectionView, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFThumbnailsCollectionView trailingAnchor](v6, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v34[3] = v18;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "activateConstraints:", v19);

    -[UICollectionView registerClass:forCellWithReuseIdentifier:](v6->_collectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("PDFIconCollectionViewCell"));
    -[PDFThumbnailsCollectionView makeDatasource](v6, "makeDatasource");
    v20 = objc_claimAutoreleasedReturnValue();
    dataSource = v6->_dataSource;
    v6->_dataSource = (UICollectionViewDiffableDataSource *)v20;

    -[UICollectionView setDataSource:](v6->_collectionView, "setDataSource:", v6->_dataSource);
    -[UICollectionView setDelegate:](v6->_collectionView, "setDelegate:", v6);
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView setBackgroundColor:](v6->_collectionView, "setBackgroundColor:", v22);

    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6988]), "initWithDelegate:", v6);
    -[UICollectionView addInteraction:](v6->_collectionView, "addInteraction:", v23);

  }
  return v6;
}

- (id)makeDatasource
{
  id v3;
  UICollectionView *collectionView;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_alloc(MEMORY[0x24BDF68F8]);
  collectionView = self->_collectionView;
  v5 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __45__PDFThumbnailsCollectionView_makeDatasource__block_invoke;
  v12[3] = &unk_24C25CB50;
  objc_copyWeak(&v13, &location);
  v6 = (void *)objc_msgSend(v3, "initWithCollectionView:cellProvider:", collectionView, v12);
  objc_msgSend(v6, "reorderingHandlers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCanReorderItemHandler:", &__block_literal_global_5);

  objc_msgSend(v6, "reorderingHandlers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __45__PDFThumbnailsCollectionView_makeDatasource__block_invoke_3;
  v10[3] = &unk_24C25CB98;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v8, "setDidReorderHandler:", v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
  return v6;
}

id __45__PDFThumbnailsCollectionView_makeDatasource__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id WeakRetained;
  void *v11;

  v7 = a3;
  v8 = a4;
  objc_msgSend(a2, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("PDFIconCollectionViewCell"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v11 = WeakRetained;
  if (v8 && WeakRetained)
    objc_msgSend(WeakRetained, "configureCell:withPage:indexPath:", v9, v8, v7);

  return v9;
}

uint64_t __45__PDFThumbnailsCollectionView_makeDatasource__block_invoke_2()
{
  return 1;
}

void __45__PDFThumbnailsCollectionView_makeDatasource__block_invoke_3(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "movePageWithTransaction:", v5);

}

- (void)updateImageForCell:(id)a3 indexPath:(id)a4 page:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id WeakRetained;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD block[4];
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "page");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v10)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
    objc_msgSend(WeakRetained, "PDFView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "document");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "renderingProperties");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "displayBox");

    -[PDFThumbnailsCollectionView cachedImageForPage:displayBox:thumbnailView:](self, "cachedImageForPage:displayBox:thumbnailView:", v10, v16, WeakRetained);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v8, "imageView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "image");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17 != v19)
      {
        v20 = objc_msgSend(v9, "item");
        _PDFLog(OS_LOG_TYPE_INFO, (uint64_t)"PDFThumbnailsCollectionView", (uint64_t)"Setting cell image for cell n°%lu", v21, v22, v23, v24, v25, v20);
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __65__PDFThumbnailsCollectionView_updateImageForCell_indexPath_page___block_invoke_2;
        block[3] = &unk_24C25CBE8;
        v33 = v8;
        v34 = v17;
        dispatch_async(MEMORY[0x24BDAC9B8], block);

      }
    }
    else
    {
      v26 = objc_msgSend(v9, "item");
      _PDFLog(OS_LOG_TYPE_INFO, (uint64_t)"PDFThumbnailsCollectionView", (uint64_t)"Image for cell n°%lu is not cached", v27, v28, v29, v30, v31, v26);
      objc_initWeak(&location, self);
      v35[0] = MEMORY[0x24BDAC760];
      v35[1] = 3221225472;
      v35[2] = __65__PDFThumbnailsCollectionView_updateImageForCell_indexPath_page___block_invoke;
      v35[3] = &unk_24C25CBC0;
      objc_copyWeak(&v38, &location);
      v36 = v8;
      v37 = v10;
      -[PDFThumbnailsCollectionView loadImageWithPage:displayBox:thumbnailView:completionHandler:](self, "loadImageWithPage:displayBox:thumbnailView:completionHandler:", v37, v16, WeakRetained, v35);

      objc_destroyWeak(&v38);
      objc_destroyWeak(&location);
    }

  }
}

void __65__PDFThumbnailsCollectionView_updateImageForCell_indexPath_page___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v8)
  {
    if (WeakRetained)
    {
      objc_msgSend(*(id *)(a1 + 32), "page");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(void **)(a1 + 40);

      if (v5 == v6)
      {
        objc_msgSend(*(id *)(a1 + 32), "imageView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setImage:", v8);

      }
    }
  }

}

void __65__PDFThumbnailsCollectionView_updateImageForCell_indexPath_page___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "imageView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImage:", v1);

}

- (void)configureCell:(id)a3 withPage:(id)a4 indexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id WeakRetained;
  void *v18;
  void *v19;
  uint64_t v20;
  double v21;
  void *v22;
  uint64_t v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v51[4];
  id v52;
  id v53;
  CGAffineTransform v54;
  CGAffineTransform v55;
  CGRect v56;
  CGRect v57;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v10, "item");
  _PDFLog(OS_LOG_TYPE_DEBUG, (uint64_t)"PDFThumbnailsCollectionView", (uint64_t)"Configuring cell n°%lu", v12, v13, v14, v15, v16, v11);
  WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  objc_msgSend(WeakRetained, "PDFView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "document");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(WeakRetained, "layoutMode");
  objc_msgSend(WeakRetained, "thumbnailSize");
  v50 = v18;
  if (v20)
    objc_msgSend(v8, "setThumbnailHeight:", v21);
  else
    objc_msgSend(v8, "setThumbnailWidth:");
  objc_msgSend(v19, "renderingProperties");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "displayBox");

  objc_msgSend(v9, "boundsForBox:", v23);
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  memset(&v55, 0, sizeof(v55));
  v32 = PDFDegToRad((double)objc_msgSend(v9, "rotation"));
  CGAffineTransformMakeRotation(&v55, v32);
  v54 = v55;
  v56.origin.x = v25;
  v56.origin.y = v27;
  v56.size.width = v29;
  v56.size.height = v31;
  v57 = CGRectApplyAffineTransform(v56, &v54);
  objc_msgSend(v8, "updateAspectConstraintWithSize:", v57.size.width, v57.size.height);
  objc_msgSend(v8, "setPage:", v9);
  -[PDFThumbnailsCollectionView updateImageForCell:indexPath:page:](self, "updateImageForCell:indexPath:page:", v8, v10, v9);
  objc_initWeak((id *)&v54, self);
  v51[0] = MEMORY[0x24BDAC760];
  v51[1] = 3221225472;
  v51[2] = __64__PDFThumbnailsCollectionView_configureCell_withPage_indexPath___block_invoke;
  v51[3] = &unk_24C25CC10;
  objc_copyWeak(&v53, (id *)&v54);
  v33 = v9;
  v52 = v33;
  objc_msgSend(v8, "actionsButton");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "_setMenuProvider:", v51);

  objc_msgSend(v8, "actionsButton");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setShowsMenuAsPrimaryAction:", 1);

  LODWORD(v35) = -[PDFThumbnailsCollectionView shouldDisplayActionButtonForPage:](self, "shouldDisplayActionButtonForPage:", v33);
  objc_msgSend(v8, "actionsButton");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setHidden:", v35 ^ 1);

  objc_msgSend(v8, "invalidateIntrinsicContentSize");
  objc_msgSend(v33, "document");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "indexForPage:", v33);

  v39 = (void *)MEMORY[0x24BDD17C8];
  PDFKitLocalizedString(CFSTR("Thumbnail for page %ld"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v38 + 1;
  objc_msgSend(v39, "stringWithFormat:", v40, v38 + 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityLabel:", v42);

  PDFKitLocalizedString(CFSTR("PDF thumbnail"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityIdentifier:", v43);

  v44 = (void *)MEMORY[0x24BDD17C8];
  PDFKitLocalizedString(CFSTR("Page actions for page %ld"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "stringWithFormat:", v45, v41);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actionsButton");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setAccessibilityLabel:", v46);

  PDFKitLocalizedString(CFSTR("Page actions"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actionsButton");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setAccessibilityIdentifier:", v48);

  objc_destroyWeak(&v53);
  objc_destroyWeak((id *)&v54);

}

id __64__PDFThumbnailsCollectionView_configureCell_withPage_indexPath___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "contextMenuForPage:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)cacheKeyForPage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)MEMORY[0x24BDBCED8];
  v11 = CFSTR("pageHash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v3, "hash"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryWithDictionary:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "lastAnnotationChange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("lastAnnotation"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v3, "rotation"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("rotation"));

  return v7;
}

- (void)updateCacheForPage:(id)a3 withImage:(id)a4
{
  id v7;
  id v8;
  size_t Height;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSCache *cache;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;

  if (a3 && a4)
  {
    v7 = objc_retainAutorelease(a4);
    v8 = a3;
    Height = CGImageGetHeight((CGImageRef)objc_msgSend(v7, "CGImage"));
    v10 = objc_retainAutorelease(v7);
    *(double *)&v11 = (double)(4 * Height * CGImageGetBytesPerRow((CGImageRef)objc_msgSend(v10, "CGImage")));
    _PDFLog(OS_LOG_TYPE_INFO, (uint64_t)"PDFThumbnailsCollectionView", (uint64_t)"Adding new image to the cache with a cost of %f", v12, v13, v14, v15, v16, v11);
    cache = self->_cache;
    -[PDFThumbnailsCollectionView cacheKeyForPage:](self, "cacheKeyForPage:", v8);
    v23 = (id)objc_claimAutoreleasedReturnValue();

    -[NSCache setObject:forKey:cost:](cache, "setObject:forKey:cost:", v10, v23, (unint64_t)*(double *)&v11);
  }
  else
  {
    a4;
    v23 = a3;
    _PDFLog(OS_LOG_TYPE_ERROR, (uint64_t)"PDFThumbnailsCollectionView", (uint64_t)"Invalid nil parameter(s) to [updateCacheForPage:%p withImage:%p]", v18, v19, v20, v21, v22, (uint64_t)v23);
  }

}

- (id)cachedImageForPage:(id)a3 displayBox:(int64_t)a4 thumbnailView:(id)a5
{
  NSCache *cache;
  void *v6;
  void *v7;

  cache = self->_cache;
  -[PDFThumbnailsCollectionView cacheKeyForPage:](self, "cacheKeyForPage:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCache objectForKey:](cache, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)loadImageWithPage:(id)a3 displayBox:(int64_t)a4 thumbnailView:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27[2];
  id location;
  _QWORD v29[4];
  id v30;
  id v31;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v10, "document");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "pageCount");
  v15 = objc_msgSend(v13, "indexForPage:", v10);
  if (v15 > 0x7FFFFFFFFFFFFFFELL || v15 > v14 - 1)
  {
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __92__PDFThumbnailsCollectionView_loadImageWithPage_displayBox_thumbnailView_completionHandler___block_invoke;
    v29[3] = &unk_24C25CC38;
    v31 = v12;
    v30 = v10;
    objc_msgSend(v19, "addOperationWithBlock:", v29);

  }
  else
  {
    objc_initWeak(&location, self);
    v16 = (void *)MEMORY[0x24BDD1478];
    v20 = MEMORY[0x24BDAC760];
    v21 = 3221225472;
    v22 = __92__PDFThumbnailsCollectionView_loadImageWithPage_displayBox_thumbnailView_completionHandler___block_invoke_2;
    v23 = &unk_24C25CC88;
    objc_copyWeak(v27, &location);
    v26 = v12;
    v24 = v10;
    v27[1] = (id)a4;
    v25 = v11;
    objc_msgSend(v16, "blockOperationWithBlock:", &v20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFThumbnailsCollectionView imageDrawingOperationQueue](self, "imageDrawingOperationQueue", v20, v21, v22, v23);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addOperation:", v17);

    objc_destroyWeak(v27);
    objc_destroyWeak(&location);
  }

}

uint64_t __92__PDFThumbnailsCollectionView_loadImageWithPage_displayBox_thumbnailView_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __92__PDFThumbnailsCollectionView_loadImageWithPage_displayBox_thumbnailView_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "thumbnailSizeForPage:displayBox:thumbnailView:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40));
    v5 = v4;
    v7 = v6;
    v8 = *(void **)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 64);
    v22[0] = CFSTR("PDFPageImageProperty_DrawAnnotations");
    v22[1] = CFSTR("PDFPageImageProperty_WithRotation");
    v23[0] = MEMORY[0x24BDBD1C8];
    v23[1] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageOfSize:forBox:withOptions:", v9, v10, v5, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "updateCacheForPage:withImage:", *(_QWORD *)(a1 + 32), v11);
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __92__PDFThumbnailsCollectionView_loadImageWithPage_displayBox_thumbnailView_completionHandler___block_invoke_4;
    v15[3] = &unk_24C25CC60;
    v18 = *(id *)(a1 + 48);
    v16 = *(id *)(a1 + 32);
    v17 = v11;
    v13 = v11;
    objc_msgSend(v12, "addOperationWithBlock:", v15);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __92__PDFThumbnailsCollectionView_loadImageWithPage_displayBox_thumbnailView_completionHandler___block_invoke_3;
    v19[3] = &unk_24C25CC38;
    v21 = *(id *)(a1 + 48);
    v20 = *(id *)(a1 + 32);
    objc_msgSend(v14, "addOperationWithBlock:", v19);

    v13 = v21;
  }

}

uint64_t __92__PDFThumbnailsCollectionView_loadImageWithPage_displayBox_thumbnailView_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t __92__PDFThumbnailsCollectionView_loadImageWithPage_displayBox_thumbnailView_completionHandler___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)datasourceQueue
{
  if (datasourceQueue_once != -1)
    dispatch_once(&datasourceQueue_once, &__block_literal_global_106);
  return (id)datasourceQueue__datasourceQueue;
}

void __46__PDFThumbnailsCollectionView_datasourceQueue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("com.apple.pdfkit.thumbnails-datasource-queue", attr);
  v2 = (void *)datasourceQueue__datasourceQueue;
  datasourceQueue__datasourceQueue = (uint64_t)v1;

}

- (id)imageDrawingOperationQueue
{
  if (imageDrawingOperationQueue_once != -1)
    dispatch_once(&imageDrawingOperationQueue_once, &__block_literal_global_108);
  return (id)imageDrawingOperationQueue__imageDrawingOperationQueue;
}

uint64_t __57__PDFThumbnailsCollectionView_imageDrawingOperationQueue__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1710]);
  v1 = (void *)imageDrawingOperationQueue__imageDrawingOperationQueue;
  imageDrawingOperationQueue__imageDrawingOperationQueue = (uint64_t)v0;

  objc_msgSend((id)imageDrawingOperationQueue__imageDrawingOperationQueue, "setMaxConcurrentOperationCount:", 1);
  objc_msgSend((id)imageDrawingOperationQueue__imageDrawingOperationQueue, "setName:", CFSTR("com.apple.pdfkit.thumbnails-drawing-operation-queue"));
  return objc_msgSend((id)imageDrawingOperationQueue__imageDrawingOperationQueue, "setQualityOfService:", 25);
}

- (void)applySnapshotWithAnimation:(BOOL)a3
{
  id WeakRetained;
  void *v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  BOOL v13;
  id location;

  WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  objc_msgSend(WeakRetained, "PDFView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "document");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (WeakRetained)
    v8 = v7 == 0;
  else
    v8 = 1;
  if (!v8 && (objc_msgSend(v7, "isLocked") & 1) == 0)
  {
    objc_initWeak(&location, self);
    -[PDFThumbnailsCollectionView datasourceQueue](self, "datasourceQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __58__PDFThumbnailsCollectionView_applySnapshotWithAnimation___block_invoke;
    v10[3] = &unk_24C25CCF0;
    objc_copyWeak(&v12, &location);
    v11 = v7;
    v13 = a3;
    dispatch_async(v9, v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

void __58__PDFThumbnailsCollectionView_applySnapshotWithAnimation___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  id v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  _QWORD *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDF6720]);
    v14[0] = CFSTR("Thumbnails");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendSectionsWithIdentifiers:", v4);

    if (objc_msgSend(*(id *)(a1 + 32), "pageCount"))
    {
      v5 = 0;
      do
      {
        objc_msgSend(*(id *)(a1 + 32), "pageAtIndex:", v5);
        v6 = objc_claimAutoreleasedReturnValue();
        v7 = (void *)v6;
        if (v6)
        {
          v13 = v6;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v13, 1);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v8, CFSTR("Thumbnails"));

        }
        ++v5;
      }
      while (objc_msgSend(*(id *)(a1 + 32), "pageCount") > v5);
    }
    v9 = (void *)WeakRetained[54];
    v10 = *(unsigned __int8 *)(a1 + 48);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __58__PDFThumbnailsCollectionView_applySnapshotWithAnimation___block_invoke_2;
    v11[3] = &unk_24C25C350;
    v12 = WeakRetained;
    objc_msgSend(v9, "applySnapshot:animatingDifferences:completion:", v3, v10, v11);

  }
}

uint64_t __58__PDFThumbnailsCollectionView_applySnapshotWithAnimation___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_selectAndScrollToCurrentPageIfNeeded");
}

- (CGSize)thumbnailSizeForPage:(id)a3
{
  PDFThumbnailView **p_thumbnailView;
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  p_thumbnailView = &self->_thumbnailView;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_thumbnailView);
  objc_msgSend(WeakRetained, "PDFView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "document");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "renderingProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "displayBox");

  -[PDFThumbnailsCollectionView thumbnailSizeForPage:displayBox:](self, "thumbnailSizeForPage:displayBox:", v5, v10);
  v12 = v11;
  v14 = v13;

  v15 = v12;
  v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (CGSize)thumbnailSizeForPage:(id)a3 displayBox:(int64_t)a4
{
  PDFThumbnailView **p_thumbnailView;
  id v7;
  id WeakRetained;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  p_thumbnailView = &self->_thumbnailView;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_thumbnailView);
  -[PDFThumbnailsCollectionView thumbnailSizeForPage:displayBox:thumbnailView:](self, "thumbnailSizeForPage:displayBox:thumbnailView:", v7, a4, WeakRetained);
  v10 = v9;
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (CGSize)thumbnailSizeForPage:(id)a3 displayBox:(int64_t)a4 thumbnailView:(id)a5
{
  id v8;
  id v9;
  double BackingScaleFactor;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id WeakRetained;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGSize result;

  v8 = a5;
  v9 = a3;
  BackingScaleFactor = PDFScreenGetBackingScaleFactor();
  objc_msgSend(v9, "boundsForBox:", a4);
  v12 = v11;
  v14 = v13;

  v15 = v14 / v12;
  WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  v17 = objc_msgSend(WeakRetained, "layoutMode");
  objc_msgSend(v8, "thumbnailSize");
  v19 = v18;
  v21 = v20;

  v22 = v21 + -6.0;
  v23 = v19 + -6.0;
  if (v17)
    v23 = (v21 + -6.0) / v15;
  else
    v22 = v15 * (v19 + -6.0);
  v24 = BackingScaleFactor + BackingScaleFactor;
  v25 = (BackingScaleFactor + BackingScaleFactor) * v22;
  v26 = v24 * v23;

  v27 = v26;
  v28 = v25;
  result.height = v28;
  result.width = v27;
  return result;
}

- (BOOL)allowsPageReordering
{
  return -[UICollectionView dragInteractionEnabled](self->_collectionView, "dragInteractionEnabled");
}

- (void)setAllowsPageReordering:(BOOL)a3
{
  -[UICollectionView setDragInteractionEnabled:](self->_collectionView, "setDragInteractionEnabled:", a3);
}

- (void)updateIconsImages
{
  -[PDFThumbnailsCollectionView applySnapshotWithAnimation:](self, "applySnapshotWithAnimation:", 0);
}

- (id)currentPage
{
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;

  -[UICollectionView indexPathsForSelectedItems](self->_collectionView, "indexPathsForSelectedItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
    objc_msgSend(WeakRetained, "PDFView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "document");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pageAtIndex:", objc_msgSend(v5, "item"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)documentChanged:(id)a3
{
  -[PDFThumbnailsCollectionView applySnapshotWithAnimation:](self, "applySnapshotWithAnimation:", 0);
}

- (void)documentMutated:(id)a3
{
  -[PDFThumbnailsCollectionView applySnapshotWithAnimation:](self, "applySnapshotWithAnimation:", 0);
}

- (void)currentPageChanged:(id)a3
{
  -[PDFThumbnailsCollectionView _updateScrubber](self, "_updateScrubber", a3);
  -[PDFThumbnailsCollectionView _selectAndScrollToCurrentPageIfNeeded](self, "_selectAndScrollToCurrentPageIfNeeded");
}

- (void)pageChanged:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x24BEDCDF0];
  v5 = a3;
  objc_msgSend(v4, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_pageChanged_, 0);
  objc_msgSend(v5, "userInfo");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", CFSTR("page"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    -[PDFThumbnailsCollectionView _reloadPage:](self, "_reloadPage:", v6);

}

- (void)_reloadPage:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[PDFThumbnailsCollectionView datasourceQueue](self, "datasourceQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__PDFThumbnailsCollectionView__reloadPage___block_invoke;
  block[3] = &unk_24C25CD18;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __43__PDFThumbnailsCollectionView__reloadPage___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[54], "snapshot");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4
      && objc_msgSend(v4, "numberOfItems") >= 1
      && objc_msgSend(v5, "indexOfSectionIdentifier:", CFSTR("Thumbnails")) != 0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = objc_loadWeakRetained(v3 + 52);
      objc_msgSend(v6, "PDFView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "document");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = objc_msgSend(v8, "indexForPage:", *(_QWORD *)(a1 + 32));
      if (v9 < objc_msgSend(v5, "numberOfItemsInSection:", CFSTR("Thumbnails")))
      {
        v10 = v3[54];
        objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v9, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "itemIdentifierForIndexPath:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3[54], "snapshot");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "indexOfItemIdentifier:", *(_QWORD *)(a1 + 32));
        if (v13 && v14 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v16[0] = v12;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "reconfigureItemsWithIdentifiers:", v15);

          objc_msgSend(v3[54], "applySnapshot:animatingDifferences:", v13, 0);
        }

      }
    }

  }
}

- (void)_updateScrubber
{
  id WeakRetained;
  uint64_t v4;
  void *v5;
  BOOL v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  v4 = objc_msgSend(WeakRetained, "layoutMode");

  -[UICollectionView collectionViewLayout](self->_collectionView, "collectionViewLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = v4 == 0;
  else
    v6 = 1;
  if (!v6)
  {
    v7 = v5;
    if (v4 == 1)
      objc_msgSend(v5, "setScrollDirection:", 1);
    -[UICollectionView setCollectionViewLayout:](self->_collectionView, "setCollectionViewLayout:", v7);
    v5 = v7;
  }

}

- (void)_selectAndScrollToCurrentPageIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  int v9;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  objc_msgSend(WeakRetained, "PDFView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "document");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentPage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "document");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexForPage:", v5);

  v8 = objc_msgSend(v4, "pageCount");
  v9 = v7 & ~(v7 >> 31);
  if (v9 >= v8 - 1)
    v9 = v8 - 1;
  v10 = v9;
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v9, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView dataSource](self->_collectionView, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "numberOfSectionsInCollectionView:", self->_collectionView);

  if (v13)
  {
    if (-[UICollectionView numberOfItemsInSection:](self->_collectionView, "numberOfItemsInSection:", 0) > v10)
    {
      -[UICollectionView scrollToItemAtIndexPath:atScrollPosition:animated:](self->_collectionView, "scrollToItemAtIndexPath:atScrollPosition:animated:", v11, 0, 1);
      -[UICollectionView indexPathsForSelectedItems](self->_collectionView, "indexPathsForSelectedItems");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "containsObject:", v11);

      if ((v15 & 1) == 0)
      {
        -[UICollectionView selectItemAtIndexPath:animated:scrollPosition:](self->_collectionView, "selectItemAtIndexPath:animated:scrollPosition:", v11, 1, 0);
        -[PDFThumbnailsCollectionView _updateActionsButtonVisibilityAtIndexPath:](self, "_updateActionsButtonVisibilityAtIndexPath:", v11);
      }
    }
  }

}

- (BOOL)_canEditDocument
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  objc_msgSend(WeakRetained, "PDFView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "document");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = objc_msgSend(v5, "documentCanBeEdited:", v4);
  else
    v6 = 0;

  return v6;
}

- (void)_updateActionsButtonVisibilityAtIndexPath:(id)a3
{
  PDFThumbnailView **p_thumbnailView;
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  uint64_t v11;
  void *v12;
  id v13;

  p_thumbnailView = &self->_thumbnailView;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_thumbnailView);
  objc_msgSend(WeakRetained, "PDFView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "document");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pageAtIndex:", objc_msgSend(v5, "item"));
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[UICollectionView cellForItemAtIndexPath:](self->_collectionView, "cellForItemAtIndexPath:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    v10 = v9 == 0;
  else
    v10 = 1;
  if (!v10)
  {
    v11 = -[PDFThumbnailsCollectionView shouldDisplayActionButtonForPage:](self, "shouldDisplayActionButtonForPage:", v13) ^ 1;
    objc_msgSend(v9, "actionsButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHidden:", v11);

  }
}

- (void)updateImageForCell:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  PDFThumbnailsCollectionView *v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[PDFThumbnailsCollectionView datasourceQueue](self, "datasourceQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__PDFThumbnailsCollectionView_updateImageForCell_atIndexPath___block_invoke;
  block[3] = &unk_24C25CD40;
  objc_copyWeak(&v15, &location);
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __62__PDFThumbnailsCollectionView_updateImageForCell_atIndexPath___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD *v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = *(void **)(a1 + 32);
    if (v3)
    {
      v4 = (void *)WeakRetained[54];
      v5 = *(_QWORD *)(a1 + 40);
      v8 = WeakRetained;
      v6 = v3;
      objc_msgSend(v4, "itemIdentifierForIndexPath:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "updateImageForCell:indexPath:page:", v6, *(_QWORD *)(a1 + 40), v7);

      WeakRetained = v8;
    }
  }

}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  -[PDFThumbnailsCollectionView updateImageForCell:atIndexPath:](self, "updateImageForCell:atIndexPath:", a4, a5);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  PDFThumbnailView **p_thumbnailView;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;

  p_thumbnailView = &self->_thumbnailView;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_thumbnailView);
  objc_msgSend(WeakRetained, "PDFView");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "document");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pageAtIndex:", objc_msgSend(v6, "item"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "goToPage:", v9);

  -[PDFThumbnailsCollectionView _updateActionsButtonVisibilityAtIndexPath:](self, "_updateActionsButtonVisibilityAtIndexPath:", v6);
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  objc_msgSend(WeakRetained, "PDFView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "document");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_dataSource, "itemIdentifierForIndexPath:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_initWeak(&location, self);
      v13 = (void *)MEMORY[0x24BDF6980];
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __95__PDFThumbnailsCollectionView_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke;
      v16[3] = &unk_24C25CD68;
      objc_copyWeak(&v18, &location);
      v17 = v12;
      objc_msgSend(v13, "configurationWithIdentifier:previewProvider:actionProvider:", v8, 0, v16);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

id __95__PDFThumbnailsCollectionView_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "contextMenuForPage:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17[3];
  id location;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  -[UICollectionView indexPathForItemAtPoint:](self->_collectionView, "indexPathForItemAtPoint:", x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[PDFThumbnailsCollectionView collectionView:contextMenuConfigurationForItemAtIndexPath:point:](self, "collectionView:contextMenuConfigurationForItemAtIndexPath:point:", self->_collectionView, v8, x, y);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
    objc_msgSend(WeakRetained, "PDFView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "document");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", objc_msgSend(v12, "pageCount") - 1, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v14 = (void *)MEMORY[0x24BDF6980];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __85__PDFThumbnailsCollectionView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
    v16[3] = &unk_24C25CD90;
    objc_copyWeak(v17, &location);
    v17[1] = *(id *)&x;
    v17[2] = *(id *)&y;
    objc_msgSend(v14, "configurationWithIdentifier:previewProvider:actionProvider:", v13, 0, v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_destroyWeak(v17);
    objc_destroyWeak(&location);

  }
  return v9;
}

id __85__PDFThumbnailsCollectionView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "contextMenuForBackgroundAtLocation:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  return -[PDFThumbnailsCollectionView previewForCollectionView:contextMenuInteraction:](self, "previewForCollectionView:contextMenuInteraction:", self->_collectionView, a3);
}

- (id)contextMenuInteraction:(id)a3 previewForDismissingMenuWithConfiguration:(id)a4
{
  return -[PDFThumbnailsCollectionView previewForCollectionView:contextMenuInteraction:](self, "previewForCollectionView:contextMenuInteraction:", self->_collectionView, a3);
}

- (id)previewForCollectionView:(id)a3 contextMenuInteraction:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  UIView *v14;
  UIView *backgroundOnePixelView;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  void *v22;
  void *v23;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "locationInView:", v6);
  v9 = v8;
  v11 = v10;
  objc_msgSend(v6, "indexPathForItemAtPoint:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[PDFThumbnailsCollectionView previewForCollectionView:indexPath:](self, "previewForCollectionView:indexPath:", v6, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!self->_backgroundOnePixelView)
    {
      v14 = (UIView *)objc_opt_new();
      backgroundOnePixelView = self->_backgroundOnePixelView;
      self->_backgroundOnePixelView = v14;

      objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](self->_backgroundOnePixelView, "setBackgroundColor:", v16);

      objc_msgSend(v6, "addSubview:", self->_backgroundOnePixelView);
    }
    objc_msgSend(v7, "locationInView:", self);
    v18 = v17;
    v20 = v19;
    -[UIView setFrame:](self->_backgroundOnePixelView, "setFrame:", v9, v11, 0.0, 0.0);
    v21 = objc_alloc_init(MEMORY[0x24BDF6CC8]);
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setBackgroundColor:", v22);

    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6CD0]), "initWithContainer:center:", self, v18, v20);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E90]), "initWithView:parameters:target:", self->_backgroundOnePixelView, v21, v23);

  }
  return v13;
}

- (id)previewForCollectionView:(id)a3 indexPath:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  if (a4)
  {
    objc_msgSend(a3, "cellForItemAtIndexPath:", a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc_init(MEMORY[0x24BDF6CC8]);
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v6);

    v7 = (void *)MEMORY[0x24BDF6870];
    objc_msgSend(v4, "imageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    objc_msgSend(v7, "bezierPathWithRoundedRect:cornerRadius:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setVisiblePath:", v9);

    v10 = objc_alloc(MEMORY[0x24BDF6CD0]);
    objc_msgSend(v4, "imageView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "center");
    v12 = (void *)objc_msgSend(v10, "initWithContainer:center:", v4);

    v13 = objc_alloc(MEMORY[0x24BDF6E90]);
    objc_msgSend(v4, "imageView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithView:parameters:target:", v14, v5, v12);

  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (id)collectionView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFThumbnailsCollectionView previewForCollectionView:indexPath:](self, "previewForCollectionView:indexPath:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)collectionView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFThumbnailsCollectionView previewForCollectionView:indexPath:](self, "previewForCollectionView:indexPath:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)contextMenuForBackgroundAtLocation:(CGPoint)a3
{
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(WeakRetained, "PDFView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "document");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "pageAtIndex:", objc_msgSend(v7, "pageCount") - 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFThumbnailsCollectionView _pasteActionIfAvailableAfterPage:](self, "_pasteActionIfAvailableAfterPage:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v5, "addObject:", v9);
  objc_msgSend(MEMORY[0x24BDF6BA8], "menuWithTitle:image:identifier:options:children:", &stru_24C25F170, 0, 0, 0, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)contextMenuForPage:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[PDFThumbnailsCollectionView defaultContextMenuForPage:](self, "defaultContextMenuForPage:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && objc_msgSend(v7, "count"))
    objc_msgSend(v6, "addObjectsFromArray:", v8);
  objc_msgSend(WeakRetained, "thumbnailContextMenuDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v9, "menuElementsForPage:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count"))
      objc_msgSend(v6, "addObjectsFromArray:", v10);

  }
  objc_msgSend(WeakRetained, "PDFView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "document");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "indexForPage:", v4) + 1;

  v14 = (void *)MEMORY[0x24BDD16F0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringFromNumber:numberStyle:", v15, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x24BDD17C8];
  PDFKitLocalizedString(CFSTR("Page %@"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", v18, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6BA8], "menuWithTitle:image:identifier:options:children:", v19, 0, 0, 0, v6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (BOOL)shouldDisplayActionButtonForPage:(id)a3
{
  void *v4;
  void *v5;
  _BOOL4 v6;

  -[PDFThumbnailsCollectionView contextMenuForPage:](self, "contextMenuForPage:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "children");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
    v6 = !-[UICollectionView hasActiveDrag](self->_collectionView, "hasActiveDrag");
  else
    LOBYTE(v6) = 0;

  return v6;
}

- (id)_pasteActionIfAvailableAfterPage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  int v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id location;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[PDFThumbnailsCollectionView _canEditDocument](self, "_canEditDocument"))
  {
    v24 = v4;
    objc_initWeak(&location, self);
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    objc_msgSend(MEMORY[0x24BDF6C40], "generalPasteboard");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "itemProviders");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    if (v7)
    {
      v23 = *(_QWORD *)v33;
      do
      {
        v22 = v7;
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v33 != v23)
            objc_enumerationMutation(v6);
          v9 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          v28 = 0u;
          v29 = 0u;
          v30 = 0u;
          v31 = 0u;
          -[PDFThumbnailsCollectionView supportedUTTypes](self, "supportedUTTypes");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
          if (v11)
          {
            v12 = *(_QWORD *)v29;
            while (2)
            {
              for (j = 0; j != v11; ++j)
              {
                if (*(_QWORD *)v29 != v12)
                  objc_enumerationMutation(v10);
                objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * j), "identifier");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                v15 = objc_msgSend(v9, "hasItemConformingToTypeIdentifier:", v14);

                if (v15)
                {
                  v17 = (void *)MEMORY[0x24BDF67B8];
                  PDFKitLocalizedString(CFSTR("Paste"));
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("doc.on.clipboard"));
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  v25[0] = MEMORY[0x24BDAC760];
                  v25[1] = 3221225472;
                  v25[2] = __64__PDFThumbnailsCollectionView__pasteActionIfAvailableAfterPage___block_invoke;
                  v25[3] = &unk_24C25CDB8;
                  objc_copyWeak(&v27, &location);
                  v26 = v24;
                  objc_msgSend(v17, "actionWithTitle:image:identifier:handler:", v18, v19, CFSTR("paste"), v25);
                  v20 = (void *)objc_claimAutoreleasedReturnValue();

                  v16 = v20;
                  objc_destroyWeak(&v27);

                  v6 = v16;
                  goto LABEL_20;
                }
              }
              v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
              if (v11)
                continue;
              break;
            }
          }

        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
      }
      while (v7);
    }
    v16 = 0;
LABEL_20:

    objc_destroyWeak(&location);
    v4 = v24;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

void __64__PDFThumbnailsCollectionView__pasteActionIfAvailableAfterPage___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "pasteAfterPage:", *(_QWORD *)(a1 + 32));

}

- (id)defaultContextMenuForPage:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v6 = (void *)MEMORY[0x24BDF67B8];
  PDFKitLocalizedString(CFSTR("Copy"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("doc.on.doc"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __57__PDFThumbnailsCollectionView_defaultContextMenuForPage___block_invoke;
  v13[3] = &unk_24C25CDB8;
  objc_copyWeak(&v15, &location);
  v9 = v4;
  v14 = v9;
  objc_msgSend(v6, "actionWithTitle:image:identifier:handler:", v7, v8, CFSTR("copy"), v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addObject:", v10);
  -[PDFThumbnailsCollectionView _pasteActionIfAvailableAfterPage:](self, "_pasteActionIfAvailableAfterPage:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v5, "addObject:", v11);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v5;
}

void __57__PDFThumbnailsCollectionView_defaultContextMenuForPage___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "copyPage:", *(_QWORD *)(a1 + 32));

}

- (void)copyPage:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v4 = (objc_class *)MEMORY[0x24BDD15F0];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v7 = (void *)objc_msgSend(v5, "copy");

  v8 = MEMORY[0x24BDBD1A8];
  -[PDFThumbnailsCollectionView itemProvider:registerDataRepresentationForPage:draggedPages:](self, "itemProvider:registerDataRepresentationForPage:draggedPages:", v6, v7, MEMORY[0x24BDBD1A8]);
  -[PDFThumbnailsCollectionView itemProvider:registerFileRepresentationForPage:draggedPages:](self, "itemProvider:registerFileRepresentationForPage:draggedPages:", v6, v7, v8);
  v11[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6C40], "generalPasteboard");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setItemProviders:", v9);

}

- (void)pasteAfterPage:(id)a3
{
  id WeakRetained;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id obj;
  uint64_t v25;
  PDFThumbnailsCollectionView *v26;
  _QWORD v27[8];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[3];
  unint64_t v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v22 = a3;
  v26 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  objc_msgSend(WeakRetained, "PDFView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "document");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  v37 = 0;
  v6 = objc_msgSend(v23, "indexForPage:", v22);
  v7 = objc_msgSend(v23, "pageCount");
  v8 = v6 + 1;
  if (v6 + 1 >= v7)
    v8 = v7;
  v37 = v8;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(MEMORY[0x24BDF6C40], "generalPasteboard");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "itemProviders");
  obj = (id)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
  if (v10)
  {
    v25 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v33 != v25)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        -[PDFThumbnailsCollectionView supportedUTTypes](v26, "supportedUTTypes");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
        if (v14)
        {
          v15 = *(_QWORD *)v29;
          while (2)
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v29 != v15)
                objc_enumerationMutation(v13);
              v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
              objc_msgSend(v17, "identifier");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v12, "hasItemConformingToTypeIdentifier:", v18);

              if (v19)
              {
                objc_msgSend(v17, "identifier");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v27[0] = MEMORY[0x24BDAC760];
                v27[1] = 3221225472;
                v27[2] = __46__PDFThumbnailsCollectionView_pasteAfterPage___block_invoke;
                v27[3] = &unk_24C25CE08;
                v27[4] = v26;
                v27[5] = v17;
                v27[6] = v12;
                v27[7] = v36;
                v21 = (id)objc_msgSend(v12, "loadFileRepresentationForTypeIdentifier:completionHandler:", v20, v27);

                goto LABEL_18;
              }
            }
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
            if (v14)
              continue;
            break;
          }
        }
LABEL_18:

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
    }
    while (v10);
  }

  _Block_object_dispose(v36, 8);
}

void __46__PDFThumbnailsCollectionView_pasteAfterPage___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[5];

  if (a2)
  {
    v9 = (void *)a1[4];
    v8 = a1[5];
    v10 = a1[7];
    v11 = *(_QWORD *)(*(_QWORD *)(v10 + 8) + 24);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __46__PDFThumbnailsCollectionView_pasteAfterPage___block_invoke_2;
    v12[3] = &unk_24C25CDE0;
    v12[4] = v10;
    objc_msgSend(v9, "_insertFileAtURL:type:atIndex:completionHandler:", a2, v8, v11, v12);
  }
  else
  {
    _PDFLog(OS_LOG_TYPE_ERROR, (uint64_t)"PDFThumbnailsCollectionView", (uint64_t)"Item provider %@ returned a nil URL. Error: %@", a4, a5, a6, a7, a8, a1[6]);
  }
}

uint64_t __46__PDFThumbnailsCollectionView_pasteAfterPage___block_invoke_2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += a2;
  return result;
}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  return -[PDFThumbnailsCollectionView itemsForDragWithSession:atIndexPath:](self, "itemsForDragWithSession:atIndexPath:", a4, a5);
}

- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[UICollectionView indexPathsForSelectedItems](self->_collectionView, "indexPathsForSelectedItems", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[PDFThumbnailsCollectionView _updateActionsButtonVisibilityAtIndexPath:](self, "_updateActionsButtonVisibilityAtIndexPath:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)collectionView:(id)a3 dragSessionDidEnd:(id)a4
{
  void *v5;
  dispatch_time_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  PDFThumbnailsCollectionView *v10;

  -[UICollectionView indexPathsForSelectedItems](self->_collectionView, "indexPathsForSelectedItems", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = dispatch_time(0, 100000000);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __64__PDFThumbnailsCollectionView_collectionView_dragSessionDidEnd___block_invoke;
  v8[3] = &unk_24C25CBE8;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_after(v6, MEMORY[0x24BDAC9B8], v8);

}

void __64__PDFThumbnailsCollectionView_collectionView_dragSessionDidEnd___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "_updateActionsButtonVisibilityAtIndexPath:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (id)collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", CFSTR("com.adobe.pdf"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v8, "hasItemsConformingToTypeIdentifiers:", v12);

  if (v13)
  {
    -[PDFThumbnailsCollectionView itemsForDragWithSession:atIndexPath:](self, "itemsForDragWithSession:atIndexPath:", v8, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v14;
}

- (id)itemsForDragWithSession:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t);
  void *v28;
  PDFThumbnailsCollectionView *v29;
  id v30;
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  void *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_dataSource, "itemIdentifierForIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(v6, "items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "arrayWithCapacity:", objc_msgSend(v10, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  objc_msgSend(v6, "items");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v40;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v40 != v14)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v15), "localObject");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          objc_msgSend(v11, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v13);
  }

  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__0;
  v37 = __Block_byref_object_dispose__0;
  v38 = 0;
  v17 = (void *)MEMORY[0x24BDF6C40];
  v18 = -[PDFThumbnailsCollectionView _dragDataOwner](self, "_dragDataOwner");
  v25 = MEMORY[0x24BDAC760];
  v26 = 3221225472;
  v27 = __67__PDFThumbnailsCollectionView_itemsForDragWithSession_atIndexPath___block_invoke;
  v28 = &unk_24C25CE30;
  v32 = &v33;
  v29 = self;
  v19 = v8;
  v30 = v19;
  v20 = v11;
  v31 = v20;
  objc_msgSend(v17, "_performAsDataOwner:block:", v18, &v25);
  v21 = objc_alloc(MEMORY[0x24BDF69F0]);
  v22 = (void *)objc_msgSend(v21, "initWithItemProvider:", v34[5], v25, v26, v27, v28, v29);
  objc_msgSend(v22, "setLocalObject:", v19);
  v43 = v22;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v43, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v33, 8);
  return v23;
}

uint64_t __67__PDFThumbnailsCollectionView_itemsForDragWithSession_atIndexPath___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x24BDD15F0]);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1 + 32), "itemProvider:registerDataRepresentationForPage:draggedPages:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "itemProvider:registerFileRepresentationForPage:draggedPages:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)itemProvider:(id)a3 registerDataRepresentationForPage:(id)a4 draggedPages:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v7 = a3;
  v8 = (void *)objc_msgSend(a4, "copy");
  objc_msgSend((id)*MEMORY[0x24BDF84E0], "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __91__PDFThumbnailsCollectionView_itemProvider_registerDataRepresentationForPage_draggedPages___block_invoke;
  v11[3] = &unk_24C25CE80;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v7, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", v9, 0, v11);

}

uint64_t __91__PDFThumbnailsCollectionView_itemProvider_registerDataRepresentationForPage_draggedPages___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v10[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __91__PDFThumbnailsCollectionView_itemProvider_registerDataRepresentationForPage_draggedPages___block_invoke_2;
  v8[3] = &unk_24C25CE58;
  v9 = v3;
  v6 = v3;
  objc_msgSend(v4, "writePDFDocumentFromPages:completionHandler:", v5, v8);

  return 0;
}

void __91__PDFThumbnailsCollectionView_itemProvider_registerDataRepresentationForPage_draggedPages___block_invoke_2(uint64_t a1, void *a2)
{
  PDFDocument *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  if (v6)
  {
    v3 = -[PDFDocument initWithURL:]([PDFDocument alloc], "initWithURL:", v6);
    v4 = *(_QWORD *)(a1 + 32);
    -[PDFDocument dataRepresentation](v3, "dataRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v4 + 16))(v4, v5, 0);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)itemProvider:(id)a3 registerFileRepresentationForPage:(id)a4 draggedPages:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v7 = a3;
  v8 = (void *)objc_msgSend(a4, "copy");
  objc_msgSend((id)*MEMORY[0x24BDF84E0], "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __91__PDFThumbnailsCollectionView_itemProvider_registerFileRepresentationForPage_draggedPages___block_invoke;
  v11[3] = &unk_24C25CEA8;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v7, "registerFileRepresentationForTypeIdentifier:fileOptions:visibility:loadHandler:", v9, 0, 0, v11);

}

uint64_t __91__PDFThumbnailsCollectionView_itemProvider_registerFileRepresentationForPage_draggedPages___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v10[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __91__PDFThumbnailsCollectionView_itemProvider_registerFileRepresentationForPage_draggedPages___block_invoke_2;
  v8[3] = &unk_24C25CE58;
  v9 = v3;
  v6 = v3;
  objc_msgSend(v4, "writePDFDocumentFromPages:completionHandler:", v5, v8);

  return 0;
}

void __91__PDFThumbnailsCollectionView_itemProvider_registerFileRepresentationForPage_draggedPages___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  int v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (v7)
  {
    v6 = objc_msgSend(v7, "startAccessingSecurityScopedResource");
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    if (v6)
      objc_msgSend(v7, "stopAccessingSecurityScopedResource");
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)writePDFDocumentFromPages:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  PDFDocument *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void (**v52)(id, void *, _QWORD);
  const __CFString *v53;
  id v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  objc_msgSend(WeakRetained, "PDFView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "document");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "documentAttributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Title"));
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc_init(PDFDocument);
  v14 = (void *)MEMORY[0x20BD1ACC8]();
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v15 = v6;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v57 != v18)
          objc_enumerationMutation(v15);
        v20 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * i), "copy");
        -[PDFDocument insertPage:atIndex:](v13, "insertPage:atIndex:", v20, -[PDFDocument pageCount](v13, "pageCount"));

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
    }
    while (v17);
  }

  objc_autoreleasePoolPop(v14);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "temporaryDirectory");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "UUIDString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "URLByAppendingPathComponent:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "path");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0;
  objc_msgSend(v21, "removeItemAtPath:error:", v26, &v55);
  v27 = v55;

  if (v27 && objc_msgSend(v27, "code") != 4)
  {
    objc_msgSend(v25, "path");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    _PDFLog(OS_LOG_TYPE_DEFAULT, (uint64_t)"PDFThumbnailsCollectionView", (uint64_t)"Failed to remove temporary folder (at path %@) prior to storing temporary PDF document with error: %@", v36, v37, v38, v39, v40, (uint64_t)v35);

    v7[2](v7, 0, v27);
  }
  else
  {
    v53 = v12;
    objc_msgSend(v25, "path");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = 0;
    objc_msgSend(v21, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v28, 1, 0, &v54);
    v29 = v54;

    if (v29)
    {
      _PDFLog(OS_LOG_TYPE_DEFAULT, (uint64_t)"PDFThumbnailsCollectionView", (uint64_t)"Failed to create directory for scanned PDF with error: %@", v30, v31, v32, v33, v34, (uint64_t)v29);
      v7[2](v7, 0, v29);
    }
    else
    {
      v52 = (void (**)(id, void *, _QWORD))v7;
      if (objc_msgSend(v15, "count") == 1)
      {
        objc_msgSend(v15, "firstObject");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v41;
        v50 = (void *)MEMORY[0x24BDD17C8];
        if (v53)
          v43 = v53;
        else
          v43 = CFSTR("Exported Page");
        objc_msgSend(v41, "label");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "stringWithFormat:", CFSTR("%@ n°%@"), v43, v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        if (v53)
          v46 = v53;
        else
          v46 = CFSTR("Exported Page");
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ (%lu)"), v46, objc_msgSend(v15, "count"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.pdf"), v45);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "URLByAppendingPathComponent:", v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[PDFDocument writeToURL:](v13, "writeToURL:", v48))
      {
        v52[2](v52, v48, 0);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 512, 0);
        v51 = v45;
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(id, void *, void *))v52)[2](v52, 0, v49);

        v45 = v51;
      }

      v7 = (void (**)(id, _QWORD, id))v52;
    }

    v12 = (__CFString *)v53;
  }

}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  uint64_t v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (-[PDFThumbnailsCollectionView _canEditDocument](self, "_canEditDocument"))
  {
    objc_msgSend(v8, "localDragSession");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = objc_msgSend(v7, "hasActiveDrag");
      v11 = objc_alloc(MEMORY[0x24BDF6900]);
      if (v10)
        v12 = 3;
      else
        v12 = 2;
      v26 = objc_msgSend(v11, "initWithDropOperation:intent:", v12, 1);
      goto LABEL_24;
    }
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    objc_msgSend(v8, "items");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v30)
    {
      v14 = *(_QWORD *)v39;
      v32 = v13;
      v33 = v7;
      v29 = *(_QWORD *)v39;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v39 != v14)
            objc_enumerationMutation(v13);
          v31 = v15;
          v16 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v15);
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          -[PDFThumbnailsCollectionView supportedUTTypes](self, "supportedUTTypes");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v35;
            while (2)
            {
              v21 = 0;
              do
              {
                if (*(_QWORD *)v35 != v20)
                  objc_enumerationMutation(v17);
                v22 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v21);
                objc_msgSend(v16, "itemProvider");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "identifier");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = objc_msgSend(v23, "hasItemConformingToTypeIdentifier:", v24);

                if ((v25 & 1) != 0)
                {
                  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6900]), "initWithDropOperation:intent:", 2, 1);

                  v7 = v33;
                  goto LABEL_25;
                }
                ++v21;
              }
              while (v19 != v21);
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
              if (v19)
                continue;
              break;
            }
          }

          v15 = v31 + 1;
          v13 = v32;
          v7 = v33;
          v14 = v29;
        }
        while (v31 + 1 != v30);
        v30 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      }
      while (v30);
    }

  }
  v26 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6900]), "initWithDropOperation:", 1);
LABEL_24:
  v27 = (void *)v26;
LABEL_25:

  return v27;
}

- (unint64_t)_insertPagesFromProvidedPDFDocument:(id)a3 atPageIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  PDFThumbnailsCollectionView *v23;
  void *v24;
  id WeakRetained;

  v6 = a3;
  v23 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  objc_msgSend(WeakRetained, "PDFView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "document");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "renderingProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "displayBox");

  v10 = objc_msgSend(v6, "pageCount");
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    for (i = 0; i != v10; ++i)
    {
      v13 = (void *)MEMORY[0x20BD1ACC8]();
      objc_msgSend(v6, "pageAtIndex:", i);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v14, "copy");

      objc_msgSend(v15, "boundsForBox:", 1);
      objc_msgSend(v15, "setBounds:forBox:", v9);
      objc_msgSend(v7, "insertPage:atIndex:", v15, a4 + i);
      objc_msgSend(v11, "addObject:", v15);

      objc_autoreleasePoolPop(v13);
    }
  }
  PDFKitLocalizedString(CFSTR("Insert pages"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFThumbnailsCollectionView undoManager](v23, "undoManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "prepareWithInvocationTarget:", v23);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removePages:", v11);

  -[PDFThumbnailsCollectionView undoManager](v23, "undoManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  PDFKitLocalizedString(v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setActionName:", v20);

  v21 = objc_msgSend(v11, "count");
  return v21;
}

- (void)_insertPDFDocumentWithURL:(id)a3 atIndex:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  PDFDocument *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  PDFDocument *v15;
  id v16;
  _QWORD block[5];
  PDFDocument *v18;
  id v19;
  unint64_t v20;

  v16 = a3;
  v8 = a5;
  v9 = -[PDFDocument initWithURL:]([PDFDocument alloc], "initWithURL:", v16);
  v15 = v9;
  if (v9)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __83__PDFThumbnailsCollectionView__insertPDFDocumentWithURL_atIndex_completionHandler___block_invoke;
    block[3] = &unk_24C25CED0;
    block[4] = self;
    v18 = v9;
    v20 = a4;
    v19 = v8;
    dispatch_sync(MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    _PDFLog(OS_LOG_TYPE_ERROR, (uint64_t)"PDFThumbnailsCollectionView", (uint64_t)"PDF document could not be created from URL %@", v10, v11, v12, v13, v14, (uint64_t)v16);
    (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
  }

}

uint64_t __83__PDFThumbnailsCollectionView__insertPDFDocumentWithURL_atIndex_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_insertPagesFromProvidedPDFDocument:atPageIndex:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_insertImageWithURL:(id)a3 atIndex:(unint64_t)a4 completionHandler:(id)a5
{
  const __CFURL *v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  CGImageSource *v13;
  CGImageRef ImageAtIndex;
  void *v15;
  unint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  PDFPage *v27;
  void *v28;
  id v29;
  _QWORD block[5];
  PDFPage *v31;
  id v32;
  unint64_t v33;
  _QWORD v34[2];
  _QWORD v35[3];

  v35[2] = *MEMORY[0x24BDAC8D0];
  v8 = (const __CFURL *)a3;
  v9 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  objc_msgSend(WeakRetained, "PDFView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "document");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = CGImageSourceCreateWithURL(v8, 0);
  ImageAtIndex = CGImageSourceCreateImageAtIndex(v13, 0, 0);
  if (objc_msgSend(v12, "pageCount") && objc_msgSend(v12, "pageCount") >= a4)
  {
    if (a4)
      v16 = a4 - 1;
    else
      v16 = 0;
    objc_msgSend(v12, "pageAtIndex:", v16);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "boundsForBox:", 0);
    v18 = v17;
    CGImageGetSizeAfterOrientation();
    objc_msgSend(MEMORY[0x24BDD1968], "PDFKitValueWithPDFRect:", 0.0, 0.0, v18, v18 * v19 / v20);
    v29 = WeakRetained;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = CFSTR("PDFPageImageInitializationOptionMediaBox");
    v34[1] = CFSTR("PDFPageImageInitializationOptionUpscaleIfSmaller");
    v35[0] = v21;
    v35[1] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = v29;
  }
  else
  {
    v15 = (void *)MEMORY[0x24BDBD1B8];
  }
  v27 = -[PDFPage initWithCGImage:options:]([PDFPage alloc], "initWithCGImage:options:", ImageAtIndex, v15);
  if (v13)
    CFRelease(v13);
  if (v27)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __77__PDFThumbnailsCollectionView__insertImageWithURL_atIndex_completionHandler___block_invoke;
    block[3] = &unk_24C25CED0;
    block[4] = self;
    v31 = v27;
    v33 = a4;
    v32 = v9;
    dispatch_sync(MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    _PDFLog(OS_LOG_TYPE_ERROR, (uint64_t)"PDFThumbnailsCollectionView", (uint64_t)"PDF document could not be created from URL %@", v22, v23, v24, v25, v26, (uint64_t)v8);
    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
  }

}

uint64_t __77__PDFThumbnailsCollectionView__insertImageWithURL_atIndex_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)a1[4];
  v8[0] = a1[5];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a1[7]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "insertPages:atIndexes:", v3, v5);

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (id)supportedUTTypes
{
  if (supportedUTTypes_onceToken != -1)
    dispatch_once(&supportedUTTypes_onceToken, &__block_literal_global_181);
  return (id)supportedUTTypes_supportedTypes;
}

void __47__PDFThumbnailsCollectionView_supportedUTTypes__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BDF8410];
  v3[0] = *MEMORY[0x24BDF84E0];
  v3[1] = v0;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 2);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)supportedUTTypes_supportedTypes;
  supportedUTTypes_supportedTypes = v1;

}

- (void)_insertFileAtURL:(id)a3 type:(id)a4 atIndex:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id WeakRetained;
  void *v13;
  id v14;

  v14 = a3;
  v10 = a4;
  v11 = a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  objc_msgSend(WeakRetained, "thumbnailDataSourceDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v13, "insertFileAtURL:atIndex:completionHandler:", v14, a5, v11);
  }
  else if ((id)*MEMORY[0x24BDF84E0] == v10)
  {
    -[PDFThumbnailsCollectionView _insertPDFDocumentWithURL:atIndex:completionHandler:](self, "_insertPDFDocumentWithURL:atIndex:completionHandler:", v14, a5, v11);
  }
  else if ((id)*MEMORY[0x24BDF8410] == v10)
  {
    -[PDFThumbnailsCollectionView _insertImageWithURL:atIndex:completionHandler:](self, "_insertImageWithURL:atIndex:completionHandler:", v14, a5, v11);
  }

}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id obj;
  uint64_t v23;
  _QWORD v25[6];
  id v26;
  _QWORD *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[3];
  uint64_t v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v20 = a3;
  v19 = a4;
  objc_msgSend(v19, "destinationIndexPath");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", objc_msgSend(v20, "numberOfItemsInSection:", 0), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if ((objc_msgSend(v20, "hasActiveDrag") & 1) == 0)
  {
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x2020000000;
    v37 = 0;
    v37 = objc_msgSend(v21, "item");
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(v19, "items");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
    if (v6)
    {
      v23 = *(_QWORD *)v33;
      obj = v5;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v33 != v23)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "dragItem");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "itemProvider");
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (v9)
          {
            v30 = 0u;
            v31 = 0u;
            v28 = 0u;
            v29 = 0u;
            -[PDFThumbnailsCollectionView supportedUTTypes](self, "supportedUTTypes");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
            if (v11)
            {
              v12 = *(_QWORD *)v29;
              while (2)
              {
                for (j = 0; j != v11; ++j)
                {
                  if (*(_QWORD *)v29 != v12)
                    objc_enumerationMutation(v10);
                  v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
                  objc_msgSend(v14, "identifier");
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  v16 = objc_msgSend(v9, "hasItemConformingToTypeIdentifier:", v15);

                  if (v16)
                  {
                    objc_msgSend(v14, "identifier");
                    v17 = (void *)objc_claimAutoreleasedReturnValue();
                    v25[0] = MEMORY[0x24BDAC760];
                    v25[1] = 3221225472;
                    v25[2] = __73__PDFThumbnailsCollectionView_collectionView_performDropWithCoordinator___block_invoke;
                    v25[3] = &unk_24C25CE08;
                    v25[4] = self;
                    v25[5] = v14;
                    v27 = v36;
                    v26 = v9;
                    v18 = (id)objc_msgSend(v26, "loadFileRepresentationForTypeIdentifier:completionHandler:", v17, v25);

                    goto LABEL_20;
                  }
                }
                v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
                if (v11)
                  continue;
                break;
              }
            }
LABEL_20:

          }
        }
        v5 = obj;
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
      }
      while (v6);
    }

    _Block_object_dispose(v36, 8);
  }

}

void __73__PDFThumbnailsCollectionView_collectionView_performDropWithCoordinator___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[5];

  if (a2)
  {
    v9 = (void *)a1[4];
    v8 = a1[5];
    v10 = a1[7];
    v11 = *(_QWORD *)(*(_QWORD *)(v10 + 8) + 24);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __73__PDFThumbnailsCollectionView_collectionView_performDropWithCoordinator___block_invoke_2;
    v12[3] = &unk_24C25CDE0;
    v12[4] = v10;
    objc_msgSend(v9, "_insertFileAtURL:type:atIndex:completionHandler:", a2, v8, v11, v12);
  }
  else
  {
    _PDFLog(OS_LOG_TYPE_ERROR, (uint64_t)"PDFThumbnailsCollectionView", (uint64_t)"Item provider %@ returned a nil URL. Error: %@", a4, a5, a6, a7, a8, a1[6]);
  }
}

uint64_t __73__PDFThumbnailsCollectionView_collectionView_performDropWithCoordinator___block_invoke_2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += a2;
  return result;
}

- (void)removePages:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;

  v20 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  objc_msgSend(WeakRetained, "PDFView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "document");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v20, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "reverseObjectEnumerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __43__PDFThumbnailsCollectionView_removePages___block_invoke;
  v21[3] = &unk_24C25CEF8;
  v22 = v6;
  v23 = v7;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v21);
  if ((unint64_t)objc_msgSend(v20, "count") <= 1)
    v12 = CFSTR("Remove page");
  else
    v12 = CFSTR("Remove pages");
  PDFKitLocalizedString(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFThumbnailsCollectionView undoManager](self, "undoManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "prepareWithInvocationTarget:", self);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reverseObjectEnumerator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "allObjects");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "insertPages:atIndexes:", v20, v17);

  -[PDFThumbnailsCollectionView undoManager](self, "undoManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  PDFKitLocalizedString(v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setActionName:", v19);

}

void __43__PDFThumbnailsCollectionView_removePages___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = objc_msgSend(*(id *)(a1 + 32), "indexForPage:", a2);
  objc_msgSend(*(id *)(a1 + 32), "removePageAtIndex:", v3);
  v4 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

}

- (void)insertPages:(id)a3 atIndexes:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id WeakRetained;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  unint64_t i;
  void *v19;
  void *v20;
  unint64_t v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;

  v29 = a3;
  v6 = a4;
  v7 = objc_msgSend(v29, "count");
  if (v7 == objc_msgSend(v6, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
    objc_msgSend(WeakRetained, "PDFView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "document");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v6, "count");
    v17 = v29;
    if (v16)
    {
      for (i = 0; i < v21; ++i)
      {
        objc_msgSend(v17, "objectAtIndexedSubscript:", i);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectAtIndexedSubscript:", i);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "insertPage:atIndex:", v19, objc_msgSend(v20, "unsignedIntegerValue"));

        v21 = objc_msgSend(v6, "count");
        v17 = v29;
      }
    }
    if ((unint64_t)objc_msgSend(v17, "count") <= 1)
      v22 = CFSTR("Insert page");
    else
      v22 = CFSTR("Insert pages");
    PDFKitLocalizedString(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFThumbnailsCollectionView undoManager](self, "undoManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "prepareWithInvocationTarget:", self);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "removePages:", v29);

    -[PDFThumbnailsCollectionView undoManager](self, "undoManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    PDFKitLocalizedString(v23);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setActionName:", v27);

  }
  else
  {
    _PDFLog(OS_LOG_TYPE_ERROR, (uint64_t)"PDFThumbnailsCollectionView", (uint64_t)"Number of pages to insert is different from the number of indexes", v8, v9, v10, v11, v12, v28);
  }

}

- (void)movePage:(id)a3 toIndex:(unint64_t)a4
{
  PDFThumbnailView **p_thumbnailView;
  id v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  p_thumbnailView = &self->_thumbnailView;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_thumbnailView);
  objc_msgSend(WeakRetained, "PDFView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "document");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v16, "indexForPage:", v7);
  objc_msgSend(v16, "removePageAtIndex:", v10);
  objc_msgSend(v16, "insertPage:atIndex:", v7, a4);
  PDFKitLocalizedString(CFSTR("Move page"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFThumbnailsCollectionView undoManager](self, "undoManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "prepareWithInvocationTarget:", self);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "movePage:toIndex:", v7, v10);

  -[PDFThumbnailsCollectionView undoManager](self, "undoManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  PDFKitLocalizedString(v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setActionName:", v15);

}

- (void)movePageWithTransaction:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "difference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasChanges");

  if (v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
    objc_msgSend(WeakRetained, "thumbnailDataSourceDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v4, "difference");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handlePageOrderedCollectionDifference:", v9);

    }
    else
    {
      v25 = WeakRetained;
      objc_msgSend(WeakRetained, "PDFView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "document");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v26 = v4;
      objc_msgSend(v4, "difference");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removals");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      obj = v13;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v29 != v16)
              objc_enumerationMutation(obj);
            v18 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
            objc_msgSend(v18, "object");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (v19)
            {
              objc_msgSend(v11, "removePageAtIndex:", objc_msgSend(v18, "index"));
              objc_msgSend(v11, "insertPage:atIndex:", v19, objc_msgSend(v18, "associatedIndex"));
              PDFKitLocalizedString(CFSTR("Move page"));
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              -[PDFThumbnailsCollectionView undoManager](self, "undoManager");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "prepareWithInvocationTarget:", self);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "movePage:toIndex:", v19, objc_msgSend(v18, "index"));

              -[PDFThumbnailsCollectionView undoManager](self, "undoManager");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              PDFKitLocalizedString(v20);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "setActionName:", v24);

            }
          }
          v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        }
        while (v15);
      }

      WeakRetained = v25;
      v4 = v26;
      v8 = 0;
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundOnePixelView, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_destroyWeak((id *)&self->_thumbnailView);
}

@end
