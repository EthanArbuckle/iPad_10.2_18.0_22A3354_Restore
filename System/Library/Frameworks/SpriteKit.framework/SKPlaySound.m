@implementation SKPlaySound

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKPlaySound)init
{
  SKPlaySound *v2;
  SKPlaySound *v3;
  SKSoundSource *soundSource;
  SKCPlaySound *v5;
  SKCAction *v6;
  objc_super v8;
  objc_super v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SKPlaySound;
  v2 = -[SKAction init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    soundSource = v2->_soundSource;
    v2->_soundSource = 0;

    v5 = (SKCPlaySound *)operator new();
    v9.receiver = v3;
    v9.super_class = (Class)SKPlaySound;
    v6 = -[SKAction caction](&v9, sel_caction);
    SKCPlaySound::SKCPlaySound(v5, v6);
    v3->_mycaction = v5;
    v8.receiver = v3;
    v8.super_class = (Class)SKPlaySound;
    -[SKAction setCppAction:](&v8, sel_setCppAction_, v5);
  }
  return v3;
}

- (SKPlaySound)initWithCoder:(id)a3
{
  id v4;
  SKPlaySound *v5;
  SKCPlaySound *v6;
  SKCAction *v7;
  uint64_t v8;
  NSString *fileName;
  void *v10;
  NSString *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSString *filePath;
  CGFloat v16;
  CGFloat v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  uint64_t v22;
  objc_super v24;
  objc_super v25;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SKPlaySound;
  v5 = -[SKAction initWithCoder:](&v26, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (SKCPlaySound *)operator new();
    v25.receiver = v5;
    v25.super_class = (Class)SKPlaySound;
    v7 = -[SKAction caction](&v25, sel_caction);
    SKCPlaySound::SKCPlaySound(v6, v7);
    v5->_mycaction = v6;
    v24.receiver = v5;
    v24.super_class = (Class)SKPlaySound;
    -[SKAction setCppAction:](&v24, sel_setCppAction_, v6);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_fileName"));
    v8 = objc_claimAutoreleasedReturnValue();
    fileName = v5->_fileName;
    v5->_fileName = (NSString *)v8;

    v10 = (void *)objc_opt_class();
    v11 = v5->_fileName;
    SKGetResourceBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_audioURLWithName:bundle:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "path");
    v14 = objc_claimAutoreleasedReturnValue();
    filePath = v5->_filePath;
    v5->_filePath = (NSString *)v14;

    objc_msgSend(v4, "decodeCGPointForKey:", CFSTR("_position"));
    v5->_position.x = v16;
    v5->_position.y = v17;
    v5->_mycaction->var21 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_wait"));
    if (v5->_filePath)
    {
      SKCRendererEnsureSoundContext();
      +[SKSoundBuffer bufferWithFileNamed:](SKSoundBuffer, "bufferWithFileNamed:", v5->_filePath);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[SKSoundSource sourceWithBuffer:](SKSoundSource, "sourceWithBuffer:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v19)
      {
        objc_msgSend(v19, "setPosition:", v5->_position.x, v5->_position.y);
        objc_storeStrong((id *)&v5->_soundSource, v20);
        objc_storeWeak(&v5->_mycaction->var19, v20);
        if (v5->_mycaction->var21)
          objc_msgSend(v18, "duration");
        else
          v21 = 0.0;
        -[SKAction setDuration:](v5, "setDuration:", v21);
      }
      else
      {
        -[NSString lastPathComponent](v5->_filePath, "lastPathComponent");
        v22 = objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("SKAction: Error loading sound resource: \"%@\"), v22);
        v20 = (void *)v22;
      }

    }
    else
    {
      objc_msgSend(0, "lastPathComponent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("SKAction: Error loading sound resource: \"%@\"), v18);
    }

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SKPlaySound;
  -[SKAction encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_fileName, CFSTR("_fileName"));
  objc_msgSend(v4, "encodeCGPoint:forKey:", CFSTR("_position"), self->_position.x, self->_position.y);
  objc_msgSend(v4, "encodeBool:forKey:", self->_mycaction->var21, CFSTR("_wait"));

}

+ (id)playSoundFileNamed:(id)a3 atPosition:(CGPoint)a4 waitForCompletion:(BOOL)a5
{
  CGFloat y;
  CGFloat x;
  id v8;
  SKPlaySound *v9;
  uint64_t v10;
  NSString *fileName;
  void *v12;
  NSString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSString *filePath;
  void *v18;
  void *v19;
  void *v20;
  double v21;

  y = a4.y;
  x = a4.x;
  v8 = a3;
  v9 = objc_alloc_init(SKPlaySound);
  v9->_position.x = x;
  v9->_position.y = y;
  v10 = objc_msgSend(v8, "copy");
  fileName = v9->_fileName;
  v9->_fileName = (NSString *)v10;

  v12 = (void *)objc_opt_class();
  v13 = v9->_fileName;
  SKGetResourceBundle();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_audioURLWithName:bundle:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "path");
  v16 = objc_claimAutoreleasedReturnValue();
  filePath = v9->_filePath;
  v9->_filePath = (NSString *)v16;

  v9->_mycaction->var21 = a5;
  if (v9->_filePath)
  {
    SKCRendererEnsureSoundContext();
    +[SKSoundBuffer bufferWithFileNamed:](SKSoundBuffer, "bufferWithFileNamed:", v9->_filePath);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[SKSoundSource sourceWithBuffer:](SKSoundSource, "sourceWithBuffer:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      objc_msgSend(v19, "setPosition:", v9->_position.x, v9->_position.y);
      objc_storeStrong((id *)&v9->_soundSource, v20);
      objc_storeWeak(&v9->_mycaction->var19, v20);
      if (v9->_mycaction->var21)
        objc_msgSend(v18, "duration");
      else
        v21 = 0.0;
      -[SKAction setDuration:](v9, "setDuration:", v21);
    }
    else
    {
      NSLog(CFSTR("SKAction: Error loading sound resource: \"%@\"), v8);
    }

  }
  else
  {
    NSLog(CFSTR("SKAction: Error loading sound resource: \"%@\"), v8);
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  char *v4;
  id *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SKPlaySound;
  v4 = -[SKAction copyWithZone:](&v12, sel_copyWithZone_, a3);
  objc_storeStrong((id *)v4 + 3, self->_fileName);
  v5 = (id *)(v4 + 16);
  objc_storeStrong((id *)v4 + 2, self->_filePath);
  *(CGPoint *)(v4 + 40) = self->_position;
  *(_BYTE *)(*((_QWORD *)v4 + 4) + 121) = self->_mycaction->var21;
  if (*((_QWORD *)v4 + 2))
  {
    SKCRendererEnsureSoundContext();
    +[SKSoundBuffer bufferWithFileNamed:](SKSoundBuffer, "bufferWithFileNamed:", *v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[SKSoundSource sourceWithBuffer:](SKSoundSource, "sourceWithBuffer:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "setPosition:", *((double *)v4 + 5), *((double *)v4 + 6));
      objc_storeStrong((id *)v4 + 7, v8);
      objc_storeWeak((id *)(*((_QWORD *)v4 + 4) + 112), v8);
      if (*(_BYTE *)(*((_QWORD *)v4 + 4) + 121))
        objc_msgSend(v6, "duration");
      else
        v9 = 0.0;
      -[SKAction setDuration:](self, "setDuration:", v9);
    }
    else
    {
      objc_msgSend(*v5, "lastPathComponent");
      v10 = objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("SKAction: Error loading sound resource: \"%@\"), v10);
      v8 = (void *)v10;
    }

  }
  return v4;
}

+ (id)_audioURLWithName:(id)a3 bundle:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "URLForResource:withExtension:", v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(v6, "URLForResource:withExtension:", v5, CFSTR("caf"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(v6, "URLForResource:withExtension:", v5, CFSTR("wav"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        objc_msgSend(v6, "URLForResource:withExtension:", v5, CFSTR("caff"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v7)
        {
          objc_msgSend(v6, "URLForResource:withExtension:", v5, CFSTR("aiff"));
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v7)
          {
            objc_msgSend(v6, "URLForResource:withExtension:", v5, CFSTR("mp3"));
            v7 = (void *)objc_claimAutoreleasedReturnValue();
          }
        }
      }
    }
  }

  return v7;
}

- (id)reversedAction
{
  return -[SKAction copy](self, "copy");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_soundSource, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
}

@end
