@implementation AVVolumeHUDAssertion

- (AVVolumeHUDAssertion)initWithSceneIdentifier:(id)a3 clientIdentifier:(id)a4
{
  id v7;
  id v8;
  AVVolumeHUDAssertion *v9;
  AVVolumeHUDAssertion *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AVVolumeHUDAssertion;
  v9 = -[AVVolumeHUDAssertion init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sceneIdentifier, a3);
    objc_storeStrong((id *)&v10->_clientIdentifier, a4);
    v10->_prefersSystemVolumeHUDHidden = 0;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  int v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "clientIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVVolumeHUDAssertion clientIdentifier](self, "clientIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", v6))
    {
      objc_msgSend(v4, "sceneIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVVolumeHUDAssertion sceneIdentifier](self, "sceneIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqualToString:", v8))
      {
        v9 = objc_msgSend(v4, "prefersSystemVolumeHUDHidden");
        v10 = v9 ^ -[AVVolumeHUDAssertion prefersSystemVolumeHUDHidden](self, "prefersSystemVolumeHUDHidden") ^ 1;
      }
      else
      {
        LOBYTE(v10) = 0;
      }

    }
    else
    {
      LOBYTE(v10) = 0;
    }

  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[AVVolumeHUDAssertion sceneIdentifier](self, "sceneIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVVolumeHUDAssertion clientIdentifier](self, "clientIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = &stru_1E5BB5F88;
  objc_msgSend(v3, "stringByAppendingString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AVVolumeHUDAssertion prefersSystemVolumeHUDHidden](self, "prefersSystemVolumeHUDHidden"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash") ^ v8;

  return v10;
}

- (UIWindowScene)windowSceneForVolumeDisplay
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)*MEMORY[0x1E0DC4730];
  -[AVVolumeHUDAssertion sceneIdentifier](self, "sceneIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "avkit_windowSceneWithSessionIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIWindowScene *)v4;
}

- (NSString)volumeAudioCategory
{
  void *v2;
  void *v3;

  -[AVVolumeHUDAssertion _systemController](self, "_systemController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "volumeCategoryForAudioCategory:", CFSTR("MediaPlayback"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)_systemController
{
  void *v2;
  void *v3;

  -[AVVolumeHUDAssertion delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentSystemController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (AVVolumeHUDAssertionDelegate)delegate
{
  return (AVVolumeHUDAssertionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (NSString)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (BOOL)prefersSystemVolumeHUDHidden
{
  return self->_prefersSystemVolumeHUDHidden;
}

- (void)setPrefersSystemVolumeHUDHidden:(BOOL)a3
{
  self->_prefersSystemVolumeHUDHidden = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
