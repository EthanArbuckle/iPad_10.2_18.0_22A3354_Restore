@implementation NTKSwatchRenderer

+ (id)_sharedRenderer
{
  if (_sharedRenderer_onceToken != -1)
    dispatch_once(&_sharedRenderer_onceToken, &__block_literal_global);
  return (id)_sharedRenderer_sharedRenderer;
}

void __36__NTKSwatchRenderer__sharedRenderer__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[NTKSwatchRenderer _init]([NTKSwatchRenderer alloc], "_init");
  v1 = (void *)_sharedRenderer_sharedRenderer;
  _sharedRenderer_sharedRenderer = (uint64_t)v0;

}

- (id)_init
{
  NTKSwatchRenderer *v2;
  NTKSwatchRenderer *v3;
  _QWORD block[4];
  NTKSwatchRenderer *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NTKSwatchRenderer;
  v2 = -[NTKSwatchRenderer init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __26__NTKSwatchRenderer__init__block_invoke;
    block[3] = &unk_1E6BCD5F0;
    v6 = v2;
    if (_init_onceToken != -1)
      dispatch_once(&_init_onceToken, block);

  }
  return v3;
}

void __26__NTKSwatchRenderer__init__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

}

+ (BOOL)containsSwatchForKey:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a1, "cachedSwatchForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

+ (id)cachedSwatchForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "_sharedRenderer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_cachedSwatchImageForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)renderSwatchForView:(id)a3 size:(CGSize)a4 device:(id)a5 key:(id)a6 using:(unint64_t)a7
{
  double height;
  double width;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;

  height = a4.height;
  width = a4.width;
  v13 = a6;
  v14 = a5;
  v15 = a3;
  objc_msgSend(a1, "_sharedRenderer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_renderSwatchForView:size:device:key:using:", v15, v14, v13, a7, width, height);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (void)renderSwatchForView:(id)a3 size:(CGSize)a4 device:(id)a5 key:(id)a6 using:(unint64_t)a7 completion:(id)a8
{
  double height;
  double width;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  height = a4.height;
  width = a4.width;
  v15 = a8;
  v16 = a6;
  v17 = a5;
  v18 = a3;
  objc_msgSend(a1, "_sharedRenderer");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_renderSwatchForView:size:device:key:using:completion:", v18, v17, v16, a7, v15, width, height);

}

- (id)_cachedSwatchImageForKey:(id)a3
{
  return -[NSCache objectForKey:](self->_swatchCache, "objectForKey:", a3);
}

- (void)_setSwatchImage:(id)a3 forKey:(id)a4
{
  -[NSCache setObject:forKey:](self->_swatchCache, "setObject:forKey:", a3, a4);
}

- (BOOL)_isCATransactionCommitting
{
  return (objc_msgSend(MEMORY[0x1E0CD28B0], "currentState") >> 3) & 1;
}

- (void)_renderSwatchForView:(id)a3 size:(CGSize)a4 device:(id)a5 key:(id)a6 using:(unint64_t)a7 completion:(id)a8
{
  double height;
  double width;
  id v16;
  id v17;

  height = a4.height;
  width = a4.width;
  v16 = a8;
  -[NTKSwatchRenderer _renderSwatchForView:size:device:key:using:](self, "_renderSwatchForView:size:device:key:using:", a3, a5, a6, a7, width, height);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a8 + 2))(v16, v17);

}

- (id)_renderSwatchForView:(id)a3 size:(CGSize)a4 device:(id)a5 key:(id)a6 using:(unint64_t)a7
{
  double height;
  double width;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  int v21;
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  unint64_t v26;
  uint64_t v27;

  height = a4.height;
  width = a4.width;
  v27 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a5;
  v15 = a6;
  _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v21 = 136315650;
    v22 = "-[NTKSwatchRenderer _renderSwatchForView:size:device:key:using:]";
    v23 = 2112;
    v24 = v15;
    v25 = 2048;
    v26 = a7;
    _os_log_impl(&dword_1B72A3000, v16, OS_LOG_TYPE_INFO, "%s — rendering swatch for %@ using %ld", (uint8_t *)&v21, 0x20u);
  }

  if (a7 == 1)
  {
    -[NTKSwatchRenderer _ui_renderSwatchUsingUIGraphicsImageRenderer:](self, "_ui_renderSwatchUsingUIGraphicsImageRenderer:", v13);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a7)
      goto LABEL_9;
    -[NTKSwatchRenderer _ca_renderSwatchUsingCARenderServer:size:forDevice:](self, "_ca_renderSwatchUsingCARenderServer:size:forDevice:", v13, v14, width, height);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v17;
  if (v17)
  {
    -[NTKSwatchRenderer _setSwatchImage:forKey:](self, "_setSwatchImage:forKey:", v17, v15);
    goto LABEL_12;
  }
LABEL_9:
  _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    -[NTKSwatchRenderer _renderSwatchForView:size:device:key:using:].cold.1((uint64_t)v15, v19);

  v18 = 0;
LABEL_12:

  return v18;
}

- (id)_ui_renderSwatchUsingUIGraphicsImageRenderer:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0DC3828]);
  objc_msgSend(v4, "bounds");
  v8 = (void *)objc_msgSend(v5, "initWithSize:", v6, v7);
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__NTKSwatchRenderer__ui_renderSwatchUsingUIGraphicsImageRenderer___block_invoke;
  v12[3] = &unk_1E6BCD618;
  objc_copyWeak(&v14, &location);
  v9 = v4;
  v13 = v9;
  objc_msgSend(v8, "imageWithActions:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v10;
}

void __66__NTKSwatchRenderer__ui_renderSwatchUsingUIGraphicsImageRenderer___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "renderInContext:", objc_msgSend(v5, "CGContext"));

  }
}

- (id)_ca_renderSwatchUsingCARenderServer:(id)a3 size:(CGSize)a4 forDevice:(id)a5
{
  double height;
  double width;
  id v9;
  id v10;
  NSObject *v11;
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
  void *v23;
  void *v24;
  NTKFaceSnapshottingWindow *v25;
  NTKFaceSnapshottingWindow *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v31[4];
  id v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  double v36;

  height = a4.height;
  width = a4.width;
  v9 = a3;
  v10 = a5;
  if (-[NTKSwatchRenderer _isCATransactionCommitting](self, "_isCATransactionCommitting"))
  {
    _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[NTKSwatchRenderer _ca_renderSwatchUsingCARenderServer:size:forDevice:].cold.1(v11);

    v12 = 0;
  }
  else
  {
    v13 = (void *)MEMORY[0x1BCCA7FA8]();
    objc_msgSend(v9, "bounds");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F20]), "initWithNibName:bundle:", 0, 0);
    objc_msgSend(v22, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setFrame:", v15, v17, v19, v21);

    objc_msgSend(v22, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addSubview:", v9);

    v25 = [NTKFaceSnapshottingWindow alloc];
    v26 = -[NTKFaceSnapshottingWindow initWithFrame:](v25, "initWithFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v19, v21);
    -[NTKFaceSnapshottingWindow updateForDevice:](v26, "updateForDevice:", v10);
    -[NTKFaceSnapshottingWindow setHidden:](v26, "setHidden:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceSnapshottingWindow setBackgroundColor:](v26, "setBackgroundColor:", v27);

    _UIAppSetStatusBarOrientation();
    _UIAppSetStatusBarHeight();
    -[NTKFaceSnapshottingWindow setRootViewController:](v26, "setRootViewController:", v22);
    -[NTKFaceSnapshottingWindow setHidden:](v26, "setHidden:", 0);
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    -[NTKFaceSnapshottingWindow setNeedsLayout](v26, "setNeedsLayout");
    -[NTKFaceSnapshottingWindow layoutIfNeeded](v26, "layoutIfNeeded");
    -[NTKFaceSnapshottingWindow setNeedsDisplay](v26, "setNeedsDisplay");
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    objc_msgSend(MEMORY[0x1E0CD28B0], "flush");
    objc_msgSend(MEMORY[0x1E0CD28B0], "synchronize");
    NTKRenderSnapshotFromWindow(v26, 2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithBounds:", 0.0, 0.0, width, height);
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __72__NTKSwatchRenderer__ca_renderSwatchUsingCARenderServer_size_forDevice___block_invoke;
    v31[3] = &unk_1E6BCD640;
    v33 = 0;
    v34 = 0;
    v32 = v28;
    v35 = width;
    v36 = height;
    objc_msgSend(v29, "imageWithActions:", v31);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeFromSuperview");
    -[NTKFaceSnapshottingWindow setRootViewController:](v26, "setRootViewController:", 0);
    -[NTKFaceSnapshottingWindow setHidden:](v26, "setHidden:", 1);

    objc_autoreleasePoolPop(v13);
  }

  return v12;
}

uint64_t __72__NTKSwatchRenderer__ca_renderSwatchUsingCARenderServer_size_forDevice___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swatchCache, 0);
}

- (void)_renderSwatchForView:(uint64_t)a1 size:(NSObject *)a2 device:key:using:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[NTKSwatchRenderer _renderSwatchForView:size:device:key:using:]";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_1B72A3000, a2, OS_LOG_TYPE_ERROR, "%s — swatchImage returned nil for %@", (uint8_t *)&v2, 0x16u);
}

- (void)_ca_renderSwatchUsingCARenderServer:(os_log_t)log size:forDevice:.cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "-[NTKSwatchRenderer _ca_renderSwatchUsingCARenderServer:size:forDevice:]";
  _os_log_error_impl(&dword_1B72A3000, log, OS_LOG_TYPE_ERROR, "%s — currently kCATransactionCommitting; aborting swatch render",
    (uint8_t *)&v1,
    0xCu);
}

@end
