@implementation CARSetupAppIconProgressView

- (CARSetupAppIconProgressView)initWithFrame:(CGRect)a3
{
  CARSetupAppIconProgressView *v3;
  void *v4;
  void *v5;
  CARMicaPlayer *v6;
  void *v7;
  void *v8;
  CARMicaPlayer *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CARSetupAppIconProgressView;
  v3 = -[CARSetupAppIconProgressView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLForResource:withExtension:", CFSTR("CarPlayProgress"), CFSTR("caar"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = [CARMicaPlayer alloc];
    objc_msgSend(v5, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CARSetupAppIconProgressView traitCollection](v3, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "displayScale");
    v9 = -[CARMicaPlayer initWithPath:retinaScale:](v6, "initWithPath:retinaScale:", v7);

    -[CARMicaPlayer setDelegate:](v9, "setDelegate:", v3);
    -[CARSetupAppIconProgressView layer](v3, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CARMicaPlayer addToLayer:onTop:gravity:](v9, "addToLayer:onTop:gravity:", v10, 1, *MEMORY[0x24BDE5C90]);

    -[CARSetupAppIconProgressView setMicaPlayer:](v3, "setMicaPlayer:", v9);
  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CARSetupAppIconProgressView;
  -[CARSetupAppIconProgressView layoutSubviews](&v5, sel_layoutSubviews);
  -[CARSetupAppIconProgressView micaPlayer](self, "micaPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARSetupAppIconProgressView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "moveAndResizeWithinParentLayer:usingGravity:animate:", v4, *MEMORY[0x24BDE5C90], 0);

}

- (void)startAnimating
{
  id v2;

  -[CARSetupAppIconProgressView micaPlayer](self, "micaPlayer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "play");

}

- (void)stopAnimating
{
  id v2;

  -[CARSetupAppIconProgressView micaPlayer](self, "micaPlayer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pause");

}

- (void)micaPlayerDidStartPlaying:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  CARSetupLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_237AF2000, v3, OS_LOG_TYPE_INFO, "started playing app icon progress animation", v4, 2u);
  }

}

- (void)micaPlayerDidStopPlaying:(id)a3
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a3;
  CARSetupLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_237AF2000, v4, OS_LOG_TYPE_INFO, "finished playing app icon progress animation, looping", v5, 2u);
  }

  objc_msgSend(v3, "setPlaybackTime:", 1.39);
  objc_msgSend(v3, "play");

}

- (CARMicaPlayer)micaPlayer
{
  return self->_micaPlayer;
}

- (void)setMicaPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_micaPlayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_micaPlayer, 0);
}

@end
