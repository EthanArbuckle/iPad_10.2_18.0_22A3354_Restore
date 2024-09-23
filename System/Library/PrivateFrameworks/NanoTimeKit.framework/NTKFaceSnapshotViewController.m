@implementation NTKFaceSnapshotViewController

- (NTKFaceSnapshotViewController)initWithFace:(id)a3
{
  id v5;
  NTKFaceSnapshotViewController *v6;
  NTKFaceSnapshotViewController *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  uint8_t buf[4];
  NTKFaceSnapshotViewController *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NTKFaceSnapshotViewController;
  v6 = -[NTKFaceSnapshotViewController initWithNibName:bundle:](&v13, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_face, a3);
    -[NTKFace addObserver:](v7->_face, "addObserver:", v7);
    _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[NTKFaceSnapshotViewController face](v7, "face");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v15 = v7;
      v16 = 2112;
      v17 = v9;
      _os_log_impl(&dword_1B72A3000, v8, OS_LOG_TYPE_DEFAULT, "SnapshotVC %p: Observing face %@", buf, 0x16u);

    }
    -[NTKFaceSnapshotViewController _attemptToFetchSnapshot](v7, "_attemptToFetchSnapshot");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v7, sel_complicationsChanged, CFSTR("NTKWidgetComplicationProviderComplicationsDidChange"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v7, sel_complicationTemplatesChanged, CFSTR("NTKCompanionWidgetComplicationManagerComplicationTemplatesDidChange"), 0);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[NTKFace removeObserver:](self->_face, "removeObserver:", self);
  if (self->_snapshotRequest)
  {
    +[NTKFaceSnapshotCache snapshotCache](NTKFaceSnapshotCache, "snapshotCache");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancelSnapshotRequest:", self->_snapshotRequest);

  }
  v4.receiver = self;
  v4.super_class = (Class)NTKFaceSnapshotViewController;
  -[NTKFaceSnapshotViewController dealloc](&v4, sel_dealloc);
}

- (void)_attemptToFetchSnapshot
{
  void *v3;
  NTKFaceSnapshotCacheRequest *snapshotRequest;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  NTKFaceSnapshotCacheRequestOptions *v18;
  NTKFaceSnapshotCacheRequest *v19;
  void *v20;
  NTKFaceSnapshotCacheRequest *v21;
  void *v22;
  NTKFaceSnapshotCacheRequest *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t, void *);
  void *v27;
  NTKFaceSnapshotViewController *v28;
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  NTKFaceSnapshotViewController *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (self->_snapshotRequest)
  {
    +[NTKFaceSnapshotCache snapshotCache](NTKFaceSnapshotCache, "snapshotCache");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancelSnapshotRequest:", self->_snapshotRequest);

    snapshotRequest = self->_snapshotRequest;
    self->_snapshotRequest = 0;

  }
  +[NTKFaceSnapshotCache snapshotCache](NTKFaceSnapshotCache, "snapshotCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFaceSnapshotViewController face](self, "face");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cachedSnapshotOfFace:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTKFaceSnapshotViewController face](self, "face");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dailySnapshotKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  -[NTKFaceSnapshotViewController face](self, "face");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unsafeDailySnapshotKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");

  _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v15)
    {
      -[NTKFaceSnapshotViewController face](self, "face");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v33 = self;
      v34 = 2112;
      v35 = v16;
      _os_log_impl(&dword_1B72A3000, v14, OS_LOG_TYPE_DEFAULT, "SnapshotVC %p: Fetched cached snapshot of face %@", buf, 0x16u);

    }
    -[NTKFaceSnapshotViewController _handleSnapshot:forKey:](self, "_handleSnapshot:forKey:", v7, v10);
  }
  else
  {
    if (v15)
    {
      -[NTKFaceSnapshotViewController face](self, "face");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v33 = self;
      v34 = 2112;
      v35 = v17;
      _os_log_impl(&dword_1B72A3000, v14, OS_LOG_TYPE_DEFAULT, "SnapshotVC %p: Cached snapshot miss of face %@", buf, 0x16u);

    }
    objc_initWeak((id *)buf, self);
    v18 = -[NTKFaceSnapshotCacheRequestOptions initWithPriority:]([NTKFaceSnapshotCacheRequestOptions alloc], "initWithPriority:", 3);
    v19 = [NTKFaceSnapshotCacheRequest alloc];
    -[NTKFaceSnapshotViewController face](self, "face");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __56__NTKFaceSnapshotViewController__attemptToFetchSnapshot__block_invoke;
    v27 = &unk_1E6BD5770;
    objc_copyWeak(&v31, (id *)buf);
    v28 = self;
    v29 = v10;
    v30 = v13;
    v21 = -[NTKFaceSnapshotCacheRequest initWithFace:options:completion:](v19, "initWithFace:options:completion:", v20, v18, &v24);

    +[NTKFaceSnapshotCache snapshotCache](NTKFaceSnapshotCache, "snapshotCache", v24, v25, v26, v27, v28);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "fetchSnapshotWithRequest:", v21);

    v23 = self->_snapshotRequest;
    self->_snapshotRequest = v21;

    objc_destroyWeak(&v31);
    objc_destroyWeak((id *)buf);
  }

}

void __56__NTKFaceSnapshotViewController__attemptToFetchSnapshot__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD block[4];
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "face");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dailySnapshotKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "face");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unsafeDailySnapshotKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 40)))
    {
      v11 = objc_loadWeakRetained((id *)(a1 + 56));
      objc_msgSend(v11, "_handleSnapshot:forKey:", v4, *(_QWORD *)(a1 + 40));

    }
    else
    {
      _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *(void **)(a1 + 32);
        v14 = *(_QWORD *)(a1 + 40);
        v15 = *(_QWORD *)(a1 + 48);
        objc_msgSend(v13, "face");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219266;
        v20 = v13;
        v21 = 2112;
        v22 = v14;
        v23 = 2112;
        v24 = v15;
        v25 = 2112;
        v26 = v8;
        v27 = 2112;
        v28 = v10;
        v29 = 2112;
        v30 = v16;
        _os_log_impl(&dword_1B72A3000, v12, OS_LOG_TYPE_DEFAULT, "SnapshotVC %p: Snapshot key changed from %@ / %@ to %@ / %@ of face %@. Retrying…", buf, 0x3Eu);

      }
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __56__NTKFaceSnapshotViewController__attemptToFetchSnapshot__block_invoke_10;
      block[3] = &unk_1E6BCD7F0;
      objc_copyWeak(&v18, v5);
      dispatch_async(MEMORY[0x1E0C80D38], block);
      objc_destroyWeak(&v18);
    }

  }
}

void __56__NTKFaceSnapshotViewController__attemptToFetchSnapshot__block_invoke_10(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_attemptToFetchSnapshot");

}

- (void)_handleSnapshot:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NTKFaceSnapshotCacheRequest *snapshotRequest;
  int v13;
  NTKFaceSnapshotViewController *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[NTKFaceSnapshotViewController face](self, "face");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 134218498;
    v14 = self;
    v15 = 2112;
    v16 = v6;
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_1B72A3000, v8, OS_LOG_TYPE_DEFAULT, "SnapshotVC %p: Handling snapshot %@ of face %@", (uint8_t *)&v13, 0x20u);

  }
  -[NTKFaceSnapshotViewController setSnapshotImage:](self, "setSnapshotImage:", v6);
  v10 = (void *)objc_msgSend(v7, "copy");

  -[NTKFaceSnapshotViewController setSnapshotKeyOfSnapshotImage:](self, "setSnapshotKeyOfSnapshotImage:", v10);
  -[NTKFaceSnapshotViewController imageView](self, "imageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setImage:", v6);

  snapshotRequest = self->_snapshotRequest;
  self->_snapshotRequest = 0;

}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  UIImageView *v5;
  UIImageView *imageView;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NTKFaceSnapshotViewController;
  -[NTKFaceSnapshotViewController viewDidLoad](&v10, sel_viewDidLoad);
  v3 = objc_alloc(MEMORY[0x1E0DC3890]);
  -[NTKFaceSnapshotViewController snapshotImage](self, "snapshotImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (UIImageView *)objc_msgSend(v3, "initWithImage:", v4);
  imageView = self->_imageView;
  self->_imageView = v5;

  -[NTKFaceSnapshotViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFaceSnapshotViewController imageView](self, "imageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v8);

  -[NTKFaceSnapshotViewController imageView](self, "imageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setContentMode:", 2);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  void *v14;
  double Width;
  void *v16;
  objc_super v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  v17.receiver = self;
  v17.super_class = (Class)NTKFaceSnapshotViewController;
  -[NTKFaceSnapshotViewController viewWillLayoutSubviews](&v17, sel_viewWillLayoutSubviews);
  -[NTKFaceSnapshotViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v18.origin.x = v5;
  v18.origin.y = v7;
  v18.size.width = v9;
  v18.size.height = v11;
  v12 = CGRectGetWidth(v18) * 0.5;
  v19.origin.x = v5;
  v19.origin.y = v7;
  v19.size.width = v9;
  v19.size.height = v11;
  v13 = CGRectGetHeight(v19) * 0.5;
  -[NTKFaceSnapshotViewController imageView](self, "imageView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20.origin.x = v5;
  v20.origin.y = v7;
  v20.size.width = v9;
  v20.size.height = v11;
  Width = CGRectGetWidth(v20);
  v21.origin.x = v5;
  v21.origin.y = v7;
  v21.size.width = v9;
  v21.size.height = v11;
  objc_msgSend(v14, "setBounds:", 0.0, 0.0, Width, CGRectGetHeight(v21));

  -[NTKFaceSnapshotViewController imageView](self, "imageView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setCenter:", v12, v13);

}

- (void)faceConfigurationDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  NTKFaceSnapshotViewController *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134218242;
    v7 = self;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "SnapshotVC %p: Face config changed for face %@", (uint8_t *)&v6, 0x16u);
  }

  -[NTKFaceSnapshotViewController _updateFaceSnapshotIfNecessaryOfFace](self, "_updateFaceSnapshotIfNecessaryOfFace");
}

- (void)faceResourceDirectoryDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  NTKFaceSnapshotViewController *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134218242;
    v7 = self;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "SnapshotVC %p: Resource directory changed for face %@", (uint8_t *)&v6, 0x16u);
  }

  -[NTKFaceSnapshotViewController _updateFaceSnapshotIfNecessaryOfFace](self, "_updateFaceSnapshotIfNecessaryOfFace");
}

- (void)complicationsChanged
{
  NSObject *v3;
  int v4;
  NTKFaceSnapshotViewController *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 134217984;
    v5 = self;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "SnapshotVC %p: Complications changed", (uint8_t *)&v4, 0xCu);
  }

  -[NTKFaceSnapshotViewController _updateFaceSnapshotIfNecessaryOfFace](self, "_updateFaceSnapshotIfNecessaryOfFace");
}

- (void)complicationTemplatesChanged
{
  NSObject *v3;
  int v4;
  NTKFaceSnapshotViewController *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 134217984;
    v5 = self;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "SnapshotVC %p: Complication templates changed", (uint8_t *)&v4, 0xCu);
  }

  -[NTKFaceSnapshotViewController _updateFaceSnapshotIfNecessaryOfFace](self, "_updateFaceSnapshotIfNecessaryOfFace");
}

- (void)_updateFaceSnapshotIfNecessaryOfFace
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  _QWORD block[5];

  -[NTKFaceSnapshotViewController snapshotKeyOfSnapshotImage](self, "snapshotKeyOfSnapshotImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFaceSnapshotViewController face](self, "face");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dailySnapshotKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__NTKFaceSnapshotViewController__updateFaceSnapshotIfNecessaryOfFace__block_invoke;
    block[3] = &unk_1E6BCD5F0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __69__NTKFaceSnapshotViewController__updateFaceSnapshotIfNecessaryOfFace__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_attemptToFetchSnapshot");
}

- (NTKFace)face
{
  return self->_face;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (UIImage)snapshotImage
{
  return self->_snapshotImage;
}

- (void)setSnapshotImage:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotImage, a3);
}

- (NSString)snapshotKeyOfSnapshotImage
{
  return self->_snapshotKeyOfSnapshotImage;
}

- (void)setSnapshotKeyOfSnapshotImage:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotKeyOfSnapshotImage, a3);
}

- (NTKFaceSnapshotCacheRequest)snapshotRequest
{
  return self->_snapshotRequest;
}

- (void)setSnapshotRequest:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotRequest, 0);
  objc_storeStrong((id *)&self->_snapshotKeyOfSnapshotImage, 0);
  objc_storeStrong((id *)&self->_snapshotImage, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_face, 0);
}

@end
