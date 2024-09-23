@implementation AAUIAppleLogoMicaView

- (AAUIAppleLogoMicaView)init
{
  AAUIAppleLogoMicaView *v2;
  AAUIAppleLogoMicaView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AAUIAppleLogoMicaView;
  v2 = -[AAUIAppleLogoMicaView init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[AAUIAppleLogoMicaView loadMicaFile](v2, "loadMicaFile");
  return v3;
}

- (void)loadMicaFile
{
  void *v3;
  AAUIMicaPlayer *v4;
  void *v5;
  AAUIMicaPlayer *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathForResource:ofType:", CFSTR("SignInProgress"), CFSTR("caar"));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v4 = [AAUIMicaPlayer alloc];
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  v6 = -[AAUIMicaPlayer initWithPath:retinaScale:](v4, "initWithPath:retinaScale:", v10);
  -[AAUIAppleLogoMicaView setMicaPlayer:](self, "setMicaPlayer:", v6);

  -[AAUIAppleLogoMicaView micaPlayer](self, "micaPlayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIAppleLogoMicaView layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addToLayer:onTop:gravity:", v8, 1, *MEMORY[0x1E0CD2F90]);

  -[AAUIAppleLogoMicaView micaPlayer](self, "micaPlayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pause");

}

- (void)layoutSubviews
{
  AAUIMicaPlayer *micaPlayer;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AAUIAppleLogoMicaView;
  -[AAUIAppleLogoMicaView layoutSubviews](&v5, sel_layoutSubviews);
  micaPlayer = self->_micaPlayer;
  -[AAUIAppleLogoMicaView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIMicaPlayer moveAndResizeWithinParentLayer:usingGravity:animate:](micaPlayer, "moveAndResizeWithinParentLayer:usingGravity:animate:", v4, *MEMORY[0x1E0CD2F90], 0);

}

- (AAUIMicaPlayer)micaPlayer
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
