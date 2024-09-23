@implementation BTShareAudioBringCloseViewController

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  if (gLogCategory_BTShareAudioViewController <= 30
    && (gLogCategory_BTShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v9.receiver = self;
  v9.super_class = (Class)BTShareAudioBringCloseViewController;
  -[BTShareAudioBaseViewController viewWillAppear:](&v9, sel_viewWillAppear_, v3);
  -[BTShareAudioViewController mainBundle](self->super._mainController, "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CULocalizedStringEx();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->super._titleLabel, "setText:", v6);

  -[BTShareAudioBringCloseViewController _cycleProductImage](self, "_cycleProductImage");
  -[BTShareAudioViewController mainBundle](self->super._mainController, "mainBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CULocalizedStringEx();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIButton setTitle:forState:](self->_cancelButton, "setTitle:forState:", v8, 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  OS_dispatch_source *cycleImageTimer;
  NSObject *v6;
  OS_dispatch_source *v7;
  objc_super v8;

  v3 = a3;
  if (gLogCategory_BTShareAudioViewController <= 30
    && (gLogCategory_BTShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v8.receiver = self;
  v8.super_class = (Class)BTShareAudioBringCloseViewController;
  -[BTShareAudioBaseViewController viewWillDisappear:](&v8, sel_viewWillDisappear_, v3);
  cycleImageTimer = self->_cycleImageTimer;
  if (cycleImageTimer)
  {
    v6 = cycleImageTimer;
    dispatch_source_cancel(v6);
    v7 = self->_cycleImageTimer;
    self->_cycleImageTimer = 0;

  }
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v10.receiver = self;
  v10.super_class = (Class)BTShareAudioBringCloseViewController;
  -[BTShareAudioBringCloseViewController viewDidLayoutSubviews](&v10, sel_viewDidLayoutSubviews);
  -[UIView layer](self->_productImageContainerView, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mask");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDE56B8], "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bounds](self->_productImageContainerView, "bounds");
    objc_msgSend(v5, "setFrame:");
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.0);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11[0] = objc_msgSend(v6, "CGColor");
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 1.0);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11[1] = objc_msgSend(v7, "CGColor");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setColors:", v8);

    objc_msgSend(v5, "setLocations:", &unk_24FD32B58);
    objc_msgSend(v5, "setStartPoint:", 0.0, 0.5);
    objc_msgSend(v5, "setEndPoint:", 1.0, 0.5);
    -[UIView layer](self->_productImageContainerView, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMask:", v5);

  }
}

- (void)eventCancel:(id)a3
{
  id v4;

  v4 = a3;
  if (gLogCategory_BTShareAudioViewController <= 30
    && (gLogCategory_BTShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[BTShareAudioViewController reportUserCancelled](self->super._mainController, "reportUserCancelled");

}

- (void)_cycleProductImage
{
  NSMutableArray *v3;
  NSMutableArray *cycleImageArray;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  OS_dispatch_source *v19;
  OS_dispatch_source *cycleImageTimer;
  unint64_t cycleNextIndex;
  NSMutableArray *v22;
  void *v23;
  _QWORD handler[5];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (!self->_cycleImageArray)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    cycleImageArray = self->_cycleImageArray;
    self->_cycleImageArray = v3;

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v5 = objc_msgSend(&unk_24FD32B70, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v26;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v26 != v7)
            objc_enumerationMutation(&unk_24FD32B70);
          objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v8));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](self->_cycleImageArray, "addObject:", v9);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(&unk_24FD32B70, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v6);
    }
    v10 = (void *)MEMORY[0x24BDF6AE0];
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "configurationWithHierarchicalColor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithPointSize:weight:scale:", 3, 2, 160.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "configurationByApplyingConfiguration:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setPreferredSymbolConfiguration:](self->_shareImageView, "setPreferredSymbolConfiguration:", v14);
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](self->_shareImageView, "setTintColor:", v15);

  }
  -[UIImageView setContentMode:](self->_shareImageView, "setContentMode:", 4);
  if (self->_cycleImageTimer)
  {
    objc_msgSend(MEMORY[0x24BDE57E8], "animation");
    v16 = objc_claimAutoreleasedReturnValue();
    -[NSObject setDuration:](v16, "setDuration:", 0.5);
    -[NSObject setType:](v16, "setType:", *MEMORY[0x24BDE5E30]);
    -[NSObject setSubtype:](v16, "setSubtype:", *MEMORY[0x24BDE5E18]);
    objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D20]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setTimingFunction:](v16, "setTimingFunction:", v17);

    -[UIImageView layer](self->_shareImageView, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addAnimation:forKey:", v16, 0);

  }
  else
  {
    v19 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, MEMORY[0x24BDAC9B8]);
    cycleImageTimer = self->_cycleImageTimer;
    self->_cycleImageTimer = v19;
    v16 = v19;

    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __58__BTShareAudioBringCloseViewController__cycleProductImage__block_invoke;
    handler[3] = &unk_24FD30F18;
    handler[4] = self;
    dispatch_source_set_event_handler(v16, handler);
    CUDispatchTimerSet();
    dispatch_activate(v16);
  }

  cycleNextIndex = self->_cycleNextIndex;
  if (-[NSMutableArray count](self->_cycleImageArray, "count") > cycleNextIndex)
  {
    v22 = self->_cycleImageArray;
    ++self->_cycleNextIndex;
    -[NSMutableArray objectAtIndexedSubscript:](v22, "objectAtIndexedSubscript:");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_shareImageView, "setImage:", v23);

    self->_cycleNextIndex %= (unint64_t)-[NSMutableArray count](self->_cycleImageArray, "count");
  }
}

uint64_t __58__BTShareAudioBringCloseViewController__cycleProductImage__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cycleProductImage");
}

- (UILabel)infoLabel
{
  return self->_infoLabel;
}

- (void)setInfoLabel:(id)a3
{
  objc_storeStrong((id *)&self->_infoLabel, a3);
}

- (UIImageView)bannerImageView
{
  return self->_bannerImageView;
}

- (void)setBannerImageView:(id)a3
{
  objc_storeStrong((id *)&self->_bannerImageView, a3);
}

- (UIView)productImageContainerView
{
  return self->_productImageContainerView;
}

- (void)setProductImageContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_productImageContainerView, a3);
}

- (UIImageView)shareImageView
{
  return self->_shareImageView;
}

- (void)setShareImageView:(id)a3
{
  objc_storeStrong((id *)&self->_shareImageView, a3);
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_shareImageView, 0);
  objc_storeStrong((id *)&self->_productImageContainerView, 0);
  objc_storeStrong((id *)&self->_bannerImageView, 0);
  objc_storeStrong((id *)&self->_infoLabel, 0);
  objc_storeStrong((id *)&self->_cycleImageTimer, 0);
  objc_storeStrong((id *)&self->_cycleImageArray, 0);
}

@end
