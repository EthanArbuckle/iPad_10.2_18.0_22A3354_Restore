@implementation DOCThumbnailFittingImageView

- (DOCThumbnailFittingImageView)initWithSize:(CGSize)a3 node:(id)a4
{
  double height;
  double width;
  id v8;
  DOCThumbnailFittingImageView *v9;
  DOCThumbnailFittingImageView *v10;
  objc_super v12;

  height = a3.height;
  width = a3.width;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DOCThumbnailFittingImageView;
  v9 = -[DOCFittingImageView initWithFrame:](&v12, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_node, a4);
    -[DOCThumbnailFittingImageView doc_commonInitWithSize:](v10, "doc_commonInitWithSize:", width, height);
  }

  return v10;
}

- (DOCThumbnailFittingImageView)initWithSize:(CGSize)a3 url:(id)a4
{
  double height;
  double width;
  id v8;
  DOCThumbnailFittingImageView *v9;
  DOCThumbnailFittingImageView *v10;
  objc_super v12;

  height = a3.height;
  width = a3.width;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DOCThumbnailFittingImageView;
  v9 = -[DOCFittingImageView initWithFrame:](&v12, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_url, a4);
    -[DOCThumbnailFittingImageView doc_commonInitWithSize:](v10, "doc_commonInitWithSize:", width, height);
  }

  return v10;
}

- (void)doc_commonInitWithSize:(CGSize)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  -[DOCBorderedFittingImageView setFittingSize:](self, "setFittingSize:", a3.width, a3.height);
  -[DOCThumbnailFittingImageView setAccessibilityIgnoresInvertColors:](self, "setAccessibilityIgnoresInvertColors:", 1);
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)-[DOCThumbnailFittingImageView registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v6, sel_updateThumbnail);

}

- (DOCThumbnailFittingImageView)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DOCStackedThumbnailView.m"), 65, CFSTR("initWithCoder: is not supported"));

  abort();
}

- (void)updateThumbnail
{
  double v3;
  void *v4;
  uint64_t v5;
  id v6;

  -[DOCThumbnailFittingImageView traitCollection](self, "traitCollection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayScale");
  if (v3 <= 0.0)
  {

  }
  else
  {
    -[DOCThumbnailFittingImageView traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceStyle");

    if (v5)
    {
      if (self->_node)
      {
        -[DOCThumbnailFittingImageView updateThumbnailForNode:](self, "updateThumbnailForNode:");
      }
      else if (self->_url)
      {
        -[DOCThumbnailFittingImageView updateThumbnailForURL:](self, "updateThumbnailForURL:");
      }
    }
  }
}

- (void)updateThumbnailForNode:(id)a3
{
  id v4;
  void *v5;
  _BOOL8 v6;
  DOCThumbnailDescriptor *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  DOCThumbnailDescriptor *v14;
  void *v15;
  id v16;

  v4 = a3;
  -[DOCThumbnailFittingImageView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle") != 2;

  +[DOCThumbnailGenerator sharedGenerator](DOCThumbnailGenerator, "sharedGenerator");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v7 = [DOCThumbnailDescriptor alloc];
  -[DOCFittingImageView fittingSize](self, "fittingSize");
  v9 = v8;
  v11 = v10;
  -[DOCThumbnailFittingImageView traitCollection](self, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "displayScale");
  v14 = -[DOCThumbnailDescriptor initWithSize:scale:style:isFolded:isInteractive:isFolder:](v7, "initWithSize:scale:style:isFolded:isInteractive:isFolder:", v6, 0, 0, objc_msgSend(v4, "isFolder"), v9, v11, v13);

  objc_msgSend(v16, "thumbnailForNode:descriptor:", v4, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = objc_msgSend(v4, "isFolder");

  -[DOCBorderedFittingImageView updateImage:addDecoration:](self, "updateImage:addDecoration:", v15, v12 ^ 1);
}

- (void)updateThumbnailForURL:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  dispatch_block_t v7;
  char v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  dispatch_time_t v21;
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD *v28;
  id v29;
  char v30;
  _QWORD block[5];
  id v32;
  _QWORD *v33;
  id v34[6];
  id v35;
  _QWORD v36[4];
  id location[2];

  v4 = a3;
  objc_initWeak(location, self);
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  v36[3] = 0;
  v5 = MEMORY[0x24BDAC760];
  v34[1] = (id)MEMORY[0x24BDAC760];
  v34[2] = (id)3221225472;
  v34[3] = __54__DOCThumbnailFittingImageView_updateThumbnailForURL___block_invoke;
  v34[4] = &unk_24D72AA60;
  objc_copyWeak(&v35, location);
  v34[5] = v36;
  DOCRunInMainThread();
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __54__DOCThumbnailFittingImageView_updateThumbnailForURL___block_invoke_2;
  block[3] = &unk_24D72AA88;
  objc_copyWeak(v34, location);
  v33 = v36;
  block[4] = self;
  v6 = v4;
  v32 = v6;
  v7 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, block);
  v8 = objc_msgSend(v6, "startAccessingSecurityScopedResource");
  objc_msgSend(MEMORY[0x24BDE5EF8], "sharedGenerator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x24BDE5EF0]);
  -[DOCFittingImageView fittingSize](self, "fittingSize");
  v12 = v11;
  v14 = v13;
  -[DOCThumbnailFittingImageView traitCollection](self, "traitCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "displayScale");
  v17 = (void *)objc_msgSend(v10, "initWithFileAtURL:size:scale:representationTypes:", v6, -1, v12, v14, v16);

  objc_msgSend(v17, "setBadgeType:", 0);
  objc_msgSend(MEMORY[0x24BE2DEF0], "useBlastDoorThumbnails");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setShouldUseRestrictedExtension:", objc_msgSend(v18, "isEnabled"));

  v25[0] = v5;
  v25[1] = 3221225472;
  v25[2] = __54__DOCThumbnailFittingImageView_updateThumbnailForURL___block_invoke_3;
  v25[3] = &unk_24D72AAD8;
  objc_copyWeak(&v29, location);
  v28 = v36;
  v19 = v6;
  v26 = v19;
  v20 = v7;
  v27 = v20;
  v30 = v8;
  objc_msgSend(v9, "generateBestRepresentationForRequest:completionHandler:", v17, v25);
  v21 = dispatch_time(0, 100000000);
  v23[0] = v5;
  v23[1] = 3221225472;
  v23[2] = __54__DOCThumbnailFittingImageView_updateThumbnailForURL___block_invoke_15;
  v23[3] = &unk_24D72AB00;
  v24 = v20;
  v22 = v20;
  dispatch_after(v21, MEMORY[0x24BDAC9B8], v23);

  objc_destroyWeak(&v29);
  objc_destroyWeak(v34);
  objc_destroyWeak(&v35);
  _Block_object_dispose(v36, 8);
  objc_destroyWeak(location);

}

void __54__DOCThumbnailFittingImageView_updateThumbnailForURL___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(WeakRetained, "generatorGeneration") + 1;
    objc_msgSend(v3, "setGeneratorGeneration:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
    WeakRetained = v3;
  }

}

void __54__DOCThumbnailFittingImageView_updateThumbnailForURL___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  int v9;
  id v10;
  _BOOL8 v11;
  void *v12;
  DOCThumbnailDescriptor *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  DOCThumbnailDescriptor *v20;
  void *v21;
  id v22;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    if (v4 == objc_msgSend(WeakRetained, "generatorGeneration"))
    {
      objc_msgSend(*(id *)(a1 + 32), "traitCollection");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "userInterfaceStyle");

      v7 = objc_msgSend(*(id *)(a1 + 40), "startAccessingSecurityScopedResource");
      v8 = *(void **)(a1 + 40);
      v22 = 0;
      v9 = objc_msgSend(v8, "getPromisedItemResourceValue:forKey:error:", &v22, *MEMORY[0x24BDBCBE8], 0);
      v10 = v22;
      if (v9)
      {
        v11 = v6 != 2;
        +[DOCThumbnailGenerator sharedGenerator](DOCThumbnailGenerator, "sharedGenerator");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = [DOCThumbnailDescriptor alloc];
        objc_msgSend(v3, "fittingSize");
        v15 = v14;
        v17 = v16;
        objc_msgSend(v3, "traitCollection");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "displayScale");
        v20 = -[DOCThumbnailDescriptor initWithSize:scale:style:isFolded:isInteractive:isFolder:](v13, "initWithSize:scale:style:isFolded:isInteractive:isFolder:", v11, 1, 0, v10 == (id)*MEMORY[0x24BDF83C0], v15, v17, v19);

        objc_msgSend(v12, "iconForURL:descriptor:", *(_QWORD *)(a1 + 40), v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setThumbnail:", v21);

      }
      if (v7)
        objc_msgSend(*(id *)(a1 + 40), "stopAccessingSecurityScopedResource");

    }
  }

}

void __54__DOCThumbnailFittingImageView_updateThumbnailForURL___block_invoke_3(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained;
    v10 = v5;
    v11 = v6;
    v12 = a1[4];
    v13 = a1[5];
    DOCRunInMainThread();

  }
}

void __54__DOCThumbnailFittingImageView_updateThumbnailForURL___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  NSObject **v8;
  NSObject *v9;
  id v10;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  if (v2 == objc_msgSend(*(id *)(a1 + 32), "generatorGeneration"))
  {
    objc_msgSend(*(id *)(a1 + 40), "UIImage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      dispatch_block_cancel(*(dispatch_block_t *)(a1 + 64));
      objc_msgSend(*(id *)(a1 + 32), "setThumbnail:", 0);
      objc_msgSend(*(id *)(a1 + 32), "setImage:", v3);
      v4 = *(void **)(a1 + 56);
      v10 = 0;
      v5 = objc_msgSend(v4, "getPromisedItemResourceValue:forKey:error:", &v10, *MEMORY[0x24BDBCBE8], 0);
      v6 = v10;
      v7 = v6;
      if (v5)
        objc_msgSend(*(id *)(a1 + 32), "setAddDecoration:", objc_msgSend(v6, "isEqual:", *MEMORY[0x24BDF83C0]) ^ 1);

    }
    else
    {
      v8 = (NSObject **)MEMORY[0x24BE2DFF0];
      v9 = *MEMORY[0x24BE2DFF0];
      if (!*MEMORY[0x24BE2DFF0])
      {
        DOCInitLogging();
        v9 = *v8;
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __54__DOCThumbnailFittingImageView_updateThumbnailForURL___block_invoke_4_cold_1(a1, v9);
    }

  }
  if (*(_BYTE *)(a1 + 80))
    objc_msgSend(*(id *)(a1 + 56), "stopAccessingSecurityScopedResource");
}

void __54__DOCThumbnailFittingImageView_updateThumbnailForURL___block_invoke_15(uint64_t a1)
{
  dispatch_block_perform(DISPATCH_BLOCK_INHERIT_QOS_CLASS, *(dispatch_block_t *)(a1 + 32));
}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DOCThumbnailFittingImageView;
  -[DOCThumbnailFittingImageView didMoveToWindow](&v4, sel_didMoveToWindow);
  -[DOCThumbnailFittingImageView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[DOCThumbnailFittingImageView updateThumbnail](self, "updateThumbnail");
}

- (DOCNode)node
{
  return self->_node;
}

- (NSURL)url
{
  return self->_url;
}

- (int64_t)generatorGeneration
{
  return self->_generatorGeneration;
}

- (void)setGeneratorGeneration:(int64_t)a3
{
  self->_generatorGeneration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_node, 0);
}

void __54__DOCThumbnailFittingImageView_updateThumbnailForURL___block_invoke_4_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 56);
  v4 = 136315650;
  v5 = "-[DOCThumbnailFittingImageView updateThumbnailForURL:]_block_invoke_4";
  v6 = 2112;
  v7 = v2;
  v8 = 2112;
  v9 = v3;
  _os_log_error_impl(&dword_2172C6000, a2, OS_LOG_TYPE_ERROR, "%s: Failed to get thumbnail for %@ (error: %@), falling back to default doc type", (uint8_t *)&v4, 0x20u);
}

@end
