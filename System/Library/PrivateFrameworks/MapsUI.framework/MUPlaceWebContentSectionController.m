@implementation MUPlaceWebContentSectionController

- (MUPlaceWebContentSectionController)initWithMapItem:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  MUWebContentTraits *v8;
  MUWebContentViewController *v9;
  void *v10;
  MUWebContentViewController *v11;
  void *v12;
  MUPlaceWebContentSectionController *v13;
  NSObject *v14;
  NSObject *v15;
  MUPlaceWebContentSectionController *v16;
  NSObject *v17;
  objc_super v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MUWebContentTraits);
  -[MUWebContentTraits setVibrant:](v8, "setVibrant:", +[MUInfoCardStyle platterStyle](MUInfoCardStyle, "platterStyle") == 1);
  -[MUWebContentTraits setNativelyDrawingPlatter:](v8, "setNativelyDrawingPlatter:", objc_msgSend(v7, "shouldDrawPlatter"));
  v9 = [MUWebContentViewController alloc];
  objc_msgSend(v7, "url");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MUWebContentViewController initWithURL:traits:](v9, "initWithURL:traits:", v10, v8);

  if (v11 && (objc_msgSend(v7, "url"), v12 = (void *)objc_claimAutoreleasedReturnValue(), v12, v12))
  {
    v19.receiver = self;
    v19.super_class = (Class)MUPlaceWebContentSectionController;
    v13 = -[MUPlaceSectionController initWithMapItem:](&v19, sel_initWithMapItem_, v6);
    if (v13)
    {
      MUGetPlaceCardLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v14))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_191DB8000, v14, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MUPlaceWebContentSectionControllerInit", ", buf, 2u);
      }

      objc_storeStrong((id *)&v13->_webContentConfig, a4);
      v13->_shouldRemoveWebContent = 0;
      objc_storeStrong((id *)&v13->_webContentViewController, v11);
      -[MUPlaceWebContentSectionController _setupWebContentViewController](v13, "_setupWebContentViewController");
      MUGetPlaceCardLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v15))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_191DB8000, v15, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MUPlaceWebContentSectionControllerInit", ", buf, 2u);
      }

    }
    self = v13;
    v16 = self;
  }
  else
  {
    MUGetPlaceCardLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v7;
      _os_log_impl(&dword_191DB8000, v17, OS_LOG_TYPE_FAULT, "MUPlaceWebContentSectionController: Cannot load a webmodule with config %@ because the config url is empty", buf, 0xCu);
    }

    v16 = 0;
  }

  return v16;
}

- (void)_setupWebContentViewController
{
  int v3;
  MUPlaceSectionView *v4;
  MUPlaceSectionView *v5;
  void *v6;
  MUPlaceSectionView *v7;
  MUPlaceSectionView *sectionView;
  MUPlatterView *v9;
  void *v10;
  MUPlatterView *v11;
  MUPlaceSectionView *v12;
  MUPlaceSectionView *v13;
  MUPlaceSectionView *v14;
  MUPlaceSectionView *v15;

  -[MUWebContentViewController setDelegate:](self->_webContentViewController, "setDelegate:", self);
  v3 = -[GEOWebContentModuleConfiguration shouldDrawPlatter](self->_webContentConfig, "shouldDrawPlatter");
  v4 = [MUPlaceSectionView alloc];
  v5 = v4;
  if (v3)
  {
    -[MUPlaceSectionController sectionHeaderViewModel](self, "sectionHeaderViewModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[MUPlaceSectionView initWithStyle:sectionHeaderViewModel:](v5, "initWithStyle:sectionHeaderViewModel:", 1, v6);
    sectionView = self->_sectionView;
    self->_sectionView = v7;

    v9 = [MUPlatterView alloc];
    -[MUWebContentViewController view](self->_webContentViewController, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[MUPlatterView initWithContentView:](v9, "initWithContentView:", v10);

    v12 = self->_sectionView;
  }
  else
  {
    v13 = -[MUPlaceSectionView initWithStyle:alwaysHideSeparators:](v4, "initWithStyle:alwaysHideSeparators:", 0, 0);
    v14 = self->_sectionView;
    self->_sectionView = v13;

    v15 = self->_sectionView;
    -[MUWebContentViewController view](self->_webContentViewController, "view");
    v11 = (MUPlatterView *)objc_claimAutoreleasedReturnValue();
    v12 = v15;
  }
  -[MUPlaceSectionView attachViewToContentView:](v12, "attachViewToContentView:", v11);

  -[MUPlaceSectionView configureWithSectionController:](self->_sectionView, "configureWithSectionController:", self);
}

- (UIViewController)sectionViewController
{
  return (UIViewController *)self->_webContentViewController;
}

- (UIView)sectionView
{
  return (UIView *)self->_sectionView;
}

- (BOOL)hasContent
{
  MUWebContentViewController *webContentViewController;

  webContentViewController = self->_webContentViewController;
  if (webContentViewController)
    LOBYTE(webContentViewController) = -[MUWebContentViewController isLoading](webContentViewController, "isLoading")
                                    || !self->_shouldRemoveWebContent;
  return (char)webContentViewController;
}

- (BOOL)isLoading
{
  return -[MUWebContentViewController isLoading](self->_webContentViewController, "isLoading");
}

- (BOOL)isWebContentViewControllerParentPlacecardLoading:(id)a3
{
  return 0;
}

- (void)removeWebContentViewController:(id)a3 arguments:(id)a4
{
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  self->_shouldRemoveWebContent = 1;
  MUGetPlaceCardLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_191DB8000, v5, OS_LOG_TYPE_INFO, "MUPlaceWebContentSectionController: Webmodule requested removal, will tell parent to update", v7, 2u);
  }

  -[MUPlaceSectionController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "placeSectionControllerDidUpdateContent:", self);

}

- (void)webContentViewController:(id)a3 performHeightChangeWithBlock:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id location;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  objc_initWeak(&location, self);
  v12 = (void *)MEMORY[0x1E0DC3F10];
  v13 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __112__MUPlaceWebContentSectionController_webContentViewController_performHeightChangeWithBlock_animated_completion___block_invoke;
  v19[3] = &unk_1E2E020B8;
  objc_copyWeak(&v21, &location);
  v19[4] = self;
  v14 = v10;
  v20 = v14;
  v16[0] = v13;
  v16[1] = 3221225472;
  v16[2] = __112__MUPlaceWebContentSectionController_webContentViewController_performHeightChangeWithBlock_animated_completion___block_invoke_2;
  v16[3] = &unk_1E2E02260;
  objc_copyWeak(&v18, &location);
  v15 = v11;
  v17 = v15;
  objc_msgSend(v12, "_mapsui_animateWithDuration:animations:completion:", v19, v16, 0.3);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

void __112__MUPlaceWebContentSectionController_webContentViewController_performHeightChangeWithBlock_animated_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "placeSectionControllerRequestsRootView:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    objc_msgSend(v4, "_mapsui_layoutIfNeeded");

    WeakRetained = v5;
  }

}

void __112__MUPlaceWebContentSectionController_webContentViewController_performHeightChangeWithBlock_animated_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "placeSectionControllerRequestsLayoutChange:", v4);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = v4;
  }

}

- (void)webContentViewControllerDidStopLoading:(id)a3
{
  id v4;

  -[MUPlaceWebContentSectionController webContentDelegate](self, "webContentDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "webContentSectionControllerDidStopLoading:", self);

}

- (id)draggableContent
{
  return 0;
}

- (int)analyticsModuleType
{
  return 25;
}

- (BOOL)isImpressionable
{
  return 1;
}

- (MUPlaceWebContentSectionControllerDelegate)webContentDelegate
{
  return (MUPlaceWebContentSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_webContentDelegate);
}

- (void)setWebContentDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_webContentDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_webContentDelegate);
  objc_storeStrong((id *)&self->_sectionView, 0);
  objc_storeStrong((id *)&self->_webContentViewController, 0);
  objc_storeStrong((id *)&self->_webContentConfig, 0);
}

@end
