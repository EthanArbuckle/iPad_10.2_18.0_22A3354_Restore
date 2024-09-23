@implementation SKAudioNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_makeBackingNode
{
  SKCAudioNode *v2;

  v2 = (SKCAudioNode *)operator new();
  SKCAudioNode::SKCAudioNode(v2);
  return v2;
}

- (void)_didMakeBackingNode
{
  self->_skcAudioNode = -[SKNode _backingNode](self, "_backingNode");
}

- (SKAudioNode)init
{
  return -[SKAudioNode initWithAVAudioNode:](self, "initWithAVAudioNode:", 0);
}

- (SKAudioNode)initWithAVAudioNode:(AVAudioNode *)node
{
  AVAudioNode *v5;
  SKAudioNode *v6;
  SKAudioNode *v7;
  objc_super v9;

  v5 = node;
  v9.receiver = self;
  v9.super_class = (Class)SKAudioNode;
  v6 = -[SKNode init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    -[SKAudioNode setAutoplayLooped:](v6, "setAutoplayLooped:", 1);
    -[SKAudioNode setPositional:](v7, "setPositional:", 1);
    objc_storeStrong((id *)v7->_skcAudioNode + 73, node);
    -[SKAudioNode commonInit](v7, "commonInit");
  }

  return v7;
}

- (SKAudioNode)initWithCoder:(NSCoder *)aDecoder
{
  NSCoder *v4;
  SKAudioNode *v5;
  SKAudioNode *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  _QWORD *skcAudioNode;
  void *v17;
  id v19;
  objc_super v20;

  v4 = aDecoder;
  v20.receiver = self;
  v20.super_class = (Class)SKAudioNode;
  v5 = -[SKNode initWithCoder:](&v20, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    -[SKAudioNode commonInit](v5, "commonInit");
    -[SKAudioNode setAutoplayLooped:](v6, "setAutoplayLooped:", -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("_autoplayLooped")));
    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_audioName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKAudioNode setAudioFileName:](v6, "setAudioFileName:", v7);

    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_audioURL"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKAudioNode setAudioURL:](v6, "setAudioURL:", v8);

    -[SKAudioNode audioFileName](v6, "audioFileName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[SKAudioNode audioFileName](v6, "audioFileName");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      SKGetResourceBundle();
      v11 = (id)objc_claimAutoreleasedReturnValue();
      -[SKAudioNode _setAudioName:bundle:](v6, "_setAudioName:bundle:", v10, v11);
LABEL_6:

      goto LABEL_7;
    }
    -[SKAudioNode audioURL](v6, "audioURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = objc_alloc(MEMORY[0x1E0C89A98]);
      -[SKAudioNode audioURL](v6, "audioURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0;
      v15 = objc_msgSend(v13, "initForReading:error:", v14, &v19);
      v10 = v19;
      skcAudioNode = v6->_skcAudioNode;
      v17 = (void *)skcAudioNode[70];
      skcAudioNode[70] = v15;

      v11 = objc_alloc_init(MEMORY[0x1E0C89AD8]);
      -[SKAudioNode setAvAudioNode:](v6, "setAvAudioNode:", v11);
      goto LABEL_6;
    }
  }
LABEL_7:

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SKAudioNode;
  -[SKNode encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[SKAudioNode autoplayLooped](self, "autoplayLooped"), CFSTR("_autoplayLooped"));
  -[SKAudioNode audioFileName](self, "audioFileName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_audioName"));

  -[SKAudioNode audioURL](self, "audioURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("_audioURL"));

}

- (BOOL)isEqualToNode:(id)a3
{
  SKAudioNode *v4;
  unsigned __int8 *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  objc_super v18;

  v4 = (SKAudioNode *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v18.receiver = self;
      v18.super_class = (Class)SKAudioNode;
      if (!-[SKNode isEqualToNode:](&v18, sel_isEqualToNode_, v5) || self->_autoplayLooped != v5[152])
        goto LABEL_16;
      -[SKAudioNode audioFileName](self, "audioFileName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {

      }
      else
      {
        objc_msgSend(v5, "audioFileName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v8)
        {
LABEL_11:
          -[SKAudioNode audioURL](self, "audioURL");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {

          }
          else
          {
            objc_msgSend(v5, "audioURL");
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v13)
            {
LABEL_15:
              v7 = 1;
LABEL_17:

              goto LABEL_18;
            }
          }
          -[SKAudioNode audioURL](self, "audioURL");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "audioURL");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v14, "isEqual:", v15);

          if ((v16 & 1) != 0)
            goto LABEL_15;
LABEL_16:
          v7 = 0;
          goto LABEL_17;
        }
      }
      -[SKAudioNode audioFileName](self, "audioFileName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "audioFileName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToString:", v10);

      if ((v11 & 1) == 0)
        goto LABEL_16;
      goto LABEL_11;
    }
    v7 = 0;
  }
LABEL_18:

  return v7;
}

- (SKAudioNode)initWithFileNamed:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  SKAudioNode *v11;
  SKAudioNode *v12;
  uint64_t v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend((id)objc_opt_class(), "_audioURLWithName:bundle:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v14 = 0;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C89A98]), "initForReading:error:", v8, &v14);
  }
  else
  {
    v9 = 0;
  }
  v10 = objc_alloc_init(MEMORY[0x1E0C89AD8]);
  v11 = -[SKAudioNode initWithAVAudioNode:](self, "initWithAVAudioNode:", v10);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)v11->_skcAudioNode + 70, v9);
    -[SKAudioNode setAudioFileName:](v12, "setAudioFileName:", v6);
  }

  return v12;
}

- (SKAudioNode)initWithFileNamed:(NSString *)name
{
  NSString *v4;
  void *v5;
  SKAudioNode *v6;

  v4 = name;
  SKGetResourceBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SKAudioNode initWithFileNamed:bundle:](self, "initWithFileNamed:bundle:", v4, v5);

  return v6;
}

- (SKAudioNode)initWithURL:(NSURL *)url
{
  NSURL *v4;
  void *v5;
  id v6;
  SKAudioNode *v7;
  SKAudioNode *v8;
  uint64_t v10;

  v4 = url;
  if (v4)
  {
    v10 = 0;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C89A98]), "initForReading:error:", v4, &v10);
  }
  else
  {
    v5 = 0;
  }
  v6 = objc_alloc_init(MEMORY[0x1E0C89AD8]);
  v7 = -[SKAudioNode initWithAVAudioNode:](self, "initWithAVAudioNode:", v6);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)v7->_skcAudioNode + 70, v5);
    -[SKAudioNode setAudioURL:](v8, "setAudioURL:", v4);
  }

  return v8;
}

- (id)audioFile
{
  return *((id *)self->_skcAudioNode + 70);
}

- (id)audioFileName
{
  return *((id *)self->_skcAudioNode + 72);
}

- (void)setAudioFileName:(id)a3
{
  objc_storeStrong((id *)self->_skcAudioNode + 72, a3);
}

- (id)audioURL
{
  return *((id *)self->_skcAudioNode + 71);
}

- (void)setAudioURL:(id)a3
{
  objc_storeStrong((id *)self->_skcAudioNode + 71, a3);
}

- (AVAudioNode)avAudioNode
{
  return (AVAudioNode *)*((id *)self->_skcAudioNode + 73);
}

- (void)setAvAudioNode:(AVAudioNode *)avAudioNode
{
  objc_storeStrong((id *)self->_skcAudioNode + 73, avAudioNode);
}

- (void)_playLooped
{
  id v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;

  objc_initWeak(&location, self);
  v3 = *((id *)self->_skcAudioNode + 70);
  -[SKAudioNode avAudioNode](self, "avAudioNode");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 1;
  if (!v6)
  {
    v7 = objc_loadWeakRetained(&location);
    objc_msgSend(v7, "scene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __26__SKAudioNode__playLooped__block_invoke;
      v9[3] = &unk_1EA4FE100;
      objc_copyWeak(&v10, &location);
      objc_msgSend(v5, "scheduleFile:atTime:completionHandler:", v3, 0, v9);
      objc_destroyWeak(&v10);
    }
  }

  objc_destroyWeak(&location);
}

void __26__SKAudioNode__playLooped__block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__SKAudioNode__playLooped__block_invoke_2;
  block[3] = &unk_1EA4FE100;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __26__SKAudioNode__playLooped__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_playLooped");

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

- (void)_setAudioName:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD *skcAudioNode;
  void *v12;
  _QWORD *v13;
  void *v14;
  id v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v6 = a3;
  v7 = a4;
  -[SKAudioNode setAudioFileName:](self, "setAudioFileName:", v6);
  if (v6)
  {
    objc_msgSend((id)objc_opt_class(), "_audioURLWithName:bundle:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v21 = 0;
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C89A98]), "initForReading:error:", v8, &v21);
      v10 = v21;
      skcAudioNode = self->_skcAudioNode;
      v12 = (void *)skcAudioNode[70];
      skcAudioNode[70] = v9;

    }
    v13 = self->_skcAudioNode;
    v14 = (void *)v13[73];
    if (v14 || !v13[70])
    {
      v13[73] = 0;
    }
    else
    {
      v15 = objc_alloc_init(MEMORY[0x1E0C89AD8]);
      v16 = self->_skcAudioNode;
      v17 = (void *)v16[73];
      v16[73] = v15;

      -[SKNode parent](self, "parent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "scene");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
        goto LABEL_7;
      -[SKNode parent](self, "parent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "scene");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKAudioNode _connectToScene:](self, "_connectToScene:", v20);

    }
LABEL_7:

  }
}

- (void)_connectToScene:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a3;
  -[SKAudioNode audioFile](self, "audioFile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKAudioNode avAudioNode](self, "avAudioNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "engine");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      objc_msgSend(v7, "detachNode:", v6);
    objc_msgSend(v14, "audioEngine");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v6, "setRenderingAlgorithm:", 1);
      objc_msgSend(v9, "attachNode:", v6);
      objc_msgSend(v4, "processingFormat");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "channelCount") >= 2)
      {
        v11 = objc_alloc(MEMORY[0x1E0C89AA8]);
        objc_msgSend(v10, "sampleRate");
        v12 = objc_msgSend(v11, "initStandardFormatWithSampleRate:channels:", 1);

        v10 = (void *)v12;
      }
      objc_msgSend(v14, "avAudioEnvironmentNode");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "connect:to:format:", v6, v13, v10);

      if (self->_autoplayLooped)
      {
        -[SKAudioNode _playLooped](self, "_playLooped");
        if (objc_msgSend(v9, "isRunning"))
          objc_msgSend(v6, "play");
      }

    }
  }

}

- (BOOL)autoplayLooped
{
  return self->_autoplayLooped;
}

- (void)setAutoplayLooped:(BOOL)autoplayLooped
{
  self->_autoplayLooped = autoplayLooped;
}

- (BOOL)isPositional
{
  return self->_positional;
}

- (void)setPositional:(BOOL)positional
{
  self->_positional = positional;
}

@end
