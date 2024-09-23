@implementation AXMHapticOutputAction

- (AXMHapticOutputAction)initWithURL:(id)a3
{
  id v4;
  AXMActiveSoundOutputActionHandle *v5;
  AXMHapticOutputAction *v6;

  v4 = a3;
  v5 = objc_alloc_init(AXMActiveSoundOutputActionHandle);
  v6 = -[AXMHapticOutputAction _initWithURL:handle:](self, "_initWithURL:handle:", v4, v5);

  return v6;
}

- (id)_initWithURL:(id)a3 handle:(id)a4
{
  id v7;
  id *v8;
  void *v9;
  void *v10;
  char v11;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AXMHapticOutputAction;
  v8 = -[AXMOutputAction _initWithHandle:](&v13, sel__initWithHandle_, a4);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "fileExistsAtPath:", v10);

    if ((v11 & 1) != 0)
    {
      objc_storeStrong(v8 + 2, a3);
    }
    else
    {

      v8 = 0;
    }

  }
  return v8;
}

- (NSURL)hapticFileURL
{
  return self->_hapticFileURL;
}

- (double)hapticIntensity
{
  return self->_hapticIntensity;
}

- (void)setHapticIntensity:(double)a3
{
  self->_hapticIntensity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hapticFileURL, 0);
}

@end
