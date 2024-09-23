@implementation AXMSoundOutputAction

+ (id)_soundFileURLForSoundID:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB34D0];
  v4 = a3;
  objc_msgSend(v3, "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLForResource:withExtension:subdirectory:", v4, CFSTR("aiff"), CFSTR("sounds"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

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
  v13.super_class = (Class)AXMSoundOutputAction;
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
      objc_storeStrong(v8 + 3, a3);
    }
    else
    {

      v8 = 0;
    }

  }
  return v8;
}

- (id)_initWithSoundID:(id)a3 handle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  AXMSoundOutputAction **v9;
  AXMSoundOutputAction *v10;

  v6 = a3;
  v7 = a4;
  +[AXMSoundOutputAction _soundFileURLForSoundID:](AXMSoundOutputAction, "_soundFileURLForSoundID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = -[AXMSoundOutputAction _initWithURL:handle:](self, "_initWithURL:handle:", v8, v7);
    v10 = (AXMSoundOutputAction *)v6;
    self = v9[2];
    v9[2] = v10;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (AXMSoundOutputAction)initWithURL:(id)a3
{
  return (AXMSoundOutputAction *)-[AXMSoundOutputAction _initWithURL:handle:](self, "_initWithURL:handle:", a3, 0);
}

- (AXMSoundOutputAction)initWithSoundID:(id)a3
{
  return (AXMSoundOutputAction *)-[AXMSoundOutputAction _initWithSoundID:handle:](self, "_initWithSoundID:handle:", a3, 0);
}

- (NSURL)soundFileURL
{
  return self->_soundFileURL;
}

- (NSString)soundID
{
  return self->_soundID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_soundFileURL, 0);
  objc_storeStrong((id *)&self->_soundID, 0);
}

@end
