@implementation AKAppleLogoMicaView

- (AKAppleLogoMicaView)init
{
  AKAppleLogoMicaView *v2;
  AKAppleLogoMicaView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AKAppleLogoMicaView;
  v2 = -[AKAppleLogoMicaView init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[AKAppleLogoMicaView loadMicaFile](v2, "loadMicaFile");
  return v3;
}

- (void)loadMicaFile
{
  AKUIMicaPlayer *v3;
  void *v4;
  AKUIMicaPlayer *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = [AKUIMicaPlayer alloc];
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  v5 = -[AKUIMicaPlayer initWithFileName:retinaScale:](v3, "initWithFileName:retinaScale:", CFSTR("SignInProgress"));
  -[AKAppleLogoMicaView setMicaPlayer:](self, "setMicaPlayer:", v5);

  -[AKAppleLogoMicaView micaPlayer](self, "micaPlayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAppleLogoMicaView layer](self, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addToLayer:onTop:gravity:", v7, 1, *MEMORY[0x1E0CD2F90]);

  -[AKAppleLogoMicaView micaPlayer](self, "micaPlayer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pause");

}

- (void)layoutSubviews
{
  AKUIMicaPlayer *micaPlayer;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AKAppleLogoMicaView;
  -[AKAppleLogoMicaView layoutSubviews](&v5, sel_layoutSubviews);
  micaPlayer = self->_micaPlayer;
  -[AKAppleLogoMicaView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKUIMicaPlayer moveAndResizeWithinParentLayer:usingGravity:animate:](micaPlayer, "moveAndResizeWithinParentLayer:usingGravity:animate:", v4, *MEMORY[0x1E0CD2F90], 0);

}

- (AKUIMicaPlayer)micaPlayer
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
