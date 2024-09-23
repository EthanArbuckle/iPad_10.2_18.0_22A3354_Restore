@implementation NUNIRenderer

+ (id)sharedInstanceWithPixelFormat:(unint64_t)a3 textureSuffix:(id)a4 rendererStyle:(unint64_t)a5
{
  id v8;
  id v9;
  NUNIAegirRenderer *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NUNIGlobetrotterRenderer *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v8 = a4;
  v9 = a1;
  objc_sync_enter(v9);
  if (a5 == 1)
  {
    v15 = [NUNIGlobetrotterRenderer alloc];
    a5 = 1;
LABEL_12:
    v10 = -[NUNIClassicRenderer initWithPixelFormat:textureSuffix:rendererStyle:](v15, "initWithPixelFormat:textureSuffix:rendererStyle:", a3, v8, a5);
    goto LABEL_13;
  }
  if (a5 == 2)
  {
    v10 = -[NUNIAegirRenderer initWithPixelFormat:textureSuffix:rendererStyle:]([NUNIAegirRenderer alloc], "initWithPixelFormat:textureSuffix:rendererStyle:", a3, v8, 2);
    +[PreferencePane aegirRenderingPreferencePane](_TtC12NanoUniverse14PreferencePane, "aegirRenderingPreferencePane");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", CFSTR("AegirRenderingReset"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      objc_msgSend(v11, "reset");
      objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("AegirRenderingReset"));

    }
    goto LABEL_10;
  }
  if (a5 != 3)
  {
    v15 = [NUNIClassicRenderer alloc];
    goto LABEL_12;
  }
  v10 = -[NUNICalliopeRenderer initWithPixelFormat:textureSuffix:rendererStyle:]([NUNICalliopeRenderer alloc], "initWithPixelFormat:textureSuffix:rendererStyle:", a3, v8, 3);
  +[PreferencePane calliopeRenderingPreferencePane](_TtC12NanoUniverse14PreferencePane, "calliopeRenderingPreferencePane");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", CFSTR("CalliopeRenderingReset"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(v11, "reset");
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("CalliopeRenderingReset"));

  }
LABEL_10:
  -[NUNIAegirRenderer setRendererOptions:](v10, "setRendererOptions:", v11);

LABEL_13:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(0, "setObject:forKeyedSubscript:", v10, v19);

  objc_sync_exit(v9);
  return v10;
}

+ (void)_deallocInstanceWithPixelFormat:(unint64_t)a3 rendererStyle:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  id obj;

  obj = a1;
  objc_sync_enter(obj);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(0, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "discard");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(0, "setObject:forKeyedSubscript:", 0, v7);

  objc_sync_exit(obj);
}

- (NUNIRenderer)initWithPixelFormat:(unint64_t)a3 textureSuffix:(id)a4 rendererStyle:(unint64_t)a5
{
  id v9;
  NUNIRenderer *v10;
  NUNIRenderer *v11;
  void *v12;
  objc_super v14;

  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NUNIRenderer;
  v10 = -[NUNIRenderer init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_rendererStyle = a5;
    v10->_pixelFormat = a3;
    objc_storeStrong((id *)&v10->_textureSuffix, a4);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v11, sel__asyncDeallocInstance, *MEMORY[0x24BDB8598], 0);

  }
  return v11;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDB8598], 0);

  v4.receiver = self;
  v4.super_class = (Class)NUNIRenderer;
  -[NUNIRenderer dealloc](&v4, sel_dealloc);
}

- (id)spheroidAtPoint:(id)a3 scene:(NUNIViewport)a4 viewport:
{
  return 0;
}

- (void)_asyncDeallocInstance
{
  _QWORD block[5];
  id v4;
  id location;

  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    objc_msgSend((id)objc_opt_class(), "_deallocInstanceWithPixelFormat:rendererStyle:", -[NUNIRenderer pixelFormat](self, "pixelFormat"), -[NUNIRenderer rendererStyle](self, "rendererStyle"));
  }
  else
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __37__NUNIRenderer__asyncDeallocInstance__block_invoke;
    block[3] = &unk_24CFD8248;
    objc_copyWeak(&v4, &location);
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

void __37__NUNIRenderer__asyncDeallocInstance__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
    objc_msgSend((id)objc_opt_class(), "_deallocInstanceWithPixelFormat:rendererStyle:", objc_msgSend(WeakRetained, "pixelFormat"), objc_msgSend(WeakRetained, "rendererStyle"));

}

- (unint64_t)rendererStyle
{
  return self->_rendererStyle;
}

- (unint64_t)pixelFormat
{
  return self->_pixelFormat;
}

- (NSString)textureSuffix
{
  return self->_textureSuffix;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textureSuffix, 0);
}

@end
