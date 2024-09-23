@implementation MRUHapticViewController

- (MRUHapticViewController)initWithContext:(unint64_t)a3 nowPlayingController:(id)a4
{
  id v5;
  MRUHapticViewController *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MRUHapticViewController;
  v5 = a4;
  v6 = -[MRUHapticViewController init](&v8, sel_init);
  v6->_context = a3;
  -[MRUHapticViewController setNowPlayingController:](v6, "setNowPlayingController:", v5, v8.receiver, v8.super_class);

  return v6;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
  MRUHapticView *v3;
  MRUHapticView *v4;

  v3 = [MRUHapticView alloc];
  v4 = -[MRUHapticView initWithContext:frame:](v3, "initWithContext:frame:", self->_context, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[MRUHapticViewController setView:](self, "setView:", v4);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MRUHapticViewController;
  -[MRUHapticViewController viewDidLoad](&v12, sel_viewDidLoad);
  -[MRUNowPlayingController metadataController](self->_nowPlayingController, "metadataController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nowPlayingInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "internationalStandardRecordingCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "internationalStandardRecordingCode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUHapticViewController updateArtworkImageWithMediaCode:treatCodesAsAdamIDs:](self, "updateArtworkImageWithMediaCode:treatCodesAsAdamIDs:", v7, 0);
  }
  else
  {
    objc_msgSend(v5, "adamID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToNumber:", v9);

    if ((v10 & 1) != 0)
    {
      -[MRUHapticViewController view](self, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "updateArtworkImageForHapticStatus:", 2);
    }
    else
    {
      objc_msgSend(v5, "adamID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRUHapticViewController updateArtworkImageWithMediaCode:treatCodesAsAdamIDs:](self, "updateArtworkImageWithMediaCode:treatCodesAsAdamIDs:", v11, 1);

    }
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MRUHapticViewController;
  -[MRUHapticViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  self->_hasAppeared = 1;
  -[MRUHapticViewController updateVisibility](self, "updateVisibility");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MRUHapticViewController;
  -[MRUHapticViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  self->_hasAppeared = 0;
  -[MRUHapticViewController updateVisibility](self, "updateVisibility");
}

- (void)setOnScreen:(BOOL)a3
{
  if (self->_onScreen != a3)
  {
    self->_onScreen = a3;
    -[MRUHapticViewController updateVisibility](self, "updateVisibility");
  }
}

- (void)setDimmed:(BOOL)a3
{
  _QWORD v5[5];
  BOOL v6;

  if (self->_dimmed != a3)
  {
    self->_dimmed = a3;
    -[MRUHapticViewController updateVisibility](self, "updateVisibility");
    objc_msgSend(MEMORY[0x1E0DC4038], "_defaultAnimationDuration");
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __37__MRUHapticViewController_setDimmed___block_invoke;
    v5[3] = &unk_1E5818D00;
    v5[4] = self;
    v6 = a3;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v5);
  }
}

void __37__MRUHapticViewController_setDimmed___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDimmed:", v1);

}

- (void)setNowPlayingController:(id)a3
{
  MRUNowPlayingController *v4;
  MRUNowPlayingController *nowPlayingController;
  MRUNowPlayingController *v6;

  v4 = (MRUNowPlayingController *)a3;
  -[MRUNowPlayingController removeObserver:](self->_nowPlayingController, "removeObserver:", self);
  nowPlayingController = self->_nowPlayingController;
  self->_nowPlayingController = v4;
  v6 = v4;

  -[MRUNowPlayingController addObserver:](v6, "addObserver:", self);
}

- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeNowPlayingInfo:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id v12;

  v12 = a5;
  objc_msgSend(v12, "internationalStandardRecordingCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v12, "internationalStandardRecordingCode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUHapticViewController updateArtworkImageWithMediaCode:treatCodesAsAdamIDs:](self, "updateArtworkImageWithMediaCode:treatCodesAsAdamIDs:", v7, 0);
  }
  else
  {
    objc_msgSend(v12, "adamID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToNumber:", v9);

    if ((v10 & 1) != 0)
    {
      -[MRUHapticViewController view](self, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "updateArtworkImageForHapticStatus:", 2);
    }
    else
    {
      objc_msgSend(v12, "adamID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRUHapticViewController updateArtworkImageWithMediaCode:treatCodesAsAdamIDs:](self, "updateArtworkImageWithMediaCode:treatCodesAsAdamIDs:", v11, 1);

    }
  }

}

- (void)updateArtworkImageWithMediaCode:(id)a3 treatCodesAsAdamIDs:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;

  v4 = a4;
  v6 = a3;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0CC1C90], "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTreatCodesAsAdamIDs:", v4);

  objc_msgSend(MEMORY[0x1E0CC1C90], "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __79__MRUHapticViewController_updateArtworkImageWithMediaCode_treatCodesAsAdamIDs___block_invoke;
  v9[3] = &unk_1E58196D8;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v8, "checkHapticTrackAvailabilityForMediaMatchingCode:completionHandler:", v6, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __79__MRUHapticViewController_updateArtworkImageWithMediaCode_treatCodesAsAdamIDs___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v9 = WeakRetained;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0CC1C90], "sharedManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "isActive");

      objc_msgSend(v9, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = v5 == 0;
    }
    else
    {
      objc_msgSend(WeakRetained, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = 2;
    }
    objc_msgSend(v6, "updateArtworkImageForHapticStatus:", v8);

    WeakRetained = v9;
  }

}

- (void)artworkView:(id)a3 didChangeArtworkImage:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[MRUHapticViewController view](self, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setArtworkImage:", v5);

}

- (BOOL)isOnScreen
{
  return self->_onScreen;
}

- (BOOL)isDimmed
{
  return self->_dimmed;
}

- (unint64_t)context
{
  return self->_context;
}

- (void)setContext:(unint64_t)a3
{
  self->_context = a3;
}

- (MRUNowPlayingController)nowPlayingController
{
  return self->_nowPlayingController;
}

- (BOOL)hasAppeared
{
  return self->_hasAppeared;
}

- (void)setHasAppeared:(BOOL)a3
{
  self->_hasAppeared = a3;
}

- (BOOL)delayArtworkChange
{
  return self->_delayArtworkChange;
}

- (void)setDelayArtworkChange:(BOOL)a3
{
  self->_delayArtworkChange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nowPlayingController, 0);
}

@end
