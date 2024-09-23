@implementation ARUISpriteSheetFactory

+ (id)defaultSpriteSheet
{
  void *v2;
  void *v3;
  void *v4;
  ARUISpriteSheet *v5;
  void *v6;
  ARUISpriteSheet *v7;

  +[ARUISpriteSheetFactory sharedInstance](ARUISpriteSheetFactory, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultSpriteTexture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[ARUIGridSpriteGenerator generatorWithSpriteCount:framesPerSprite:rowsPerSprite:columnsPerSprite:](ARUIGridSpriteGenerator, "generatorWithSpriteCount:framesPerSprite:rowsPerSprite:columnsPerSprite:", 3, 121, 4, 32);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [ARUISpriteSheet alloc];
  objc_msgSend(v4, "generateSprites");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ARUISpriteSheet initWithTexture:sprites:](v5, "initWithTexture:sprites:", v3, v6);

  return v7;
}

- (id)defaultSpriteTexture
{
  ARUISpriteTexture **p_defaultSpriteTexture;
  ARUISpriteTexture *WeakRetained;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  p_defaultSpriteTexture = &self->_defaultSpriteTexture;
  WeakRetained = (ARUISpriteTexture *)objc_loadWeakRetained((id *)&self->_defaultSpriteTexture);
  if (!WeakRetained)
  {
    arui_rings_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = CFSTR("ringIconSprite");
      _os_log_impl(&dword_212DE7000, v4, OS_LOG_TYPE_DEFAULT, "Loading texture with image format: %@", (uint8_t *)&v9, 0xCu);
    }

    v5 = (void *)MEMORY[0x24BEBD640];
    ActivityRingsUIFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("ringIconSprite"), v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = -[ARUISpriteTexture initWithImage:]([ARUISpriteTexture alloc], "initWithImage:", v7);
    objc_storeWeak((id *)p_defaultSpriteTexture, WeakRetained);

  }
  return WeakRetained;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_2);
  return (id)sharedInstance___sharedSpriteSheetFactory;
}

void __40__ARUISpriteSheetFactory_sharedInstance__block_invoke()
{
  ARUISpriteSheetFactory *v0;
  void *v1;

  v0 = objc_alloc_init(ARUISpriteSheetFactory);
  v1 = (void *)sharedInstance___sharedSpriteSheetFactory;
  sharedInstance___sharedSpriteSheetFactory = (uint64_t)v0;

}

+ (id)spriteSheetForRingType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  ARUISpriteSheet *v10;
  void *v11;
  ARUISpriteSheet *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  if (a3 == 3)
  {
    +[ARUISpriteSheetFactory defaultSpriteSheet](ARUISpriteSheetFactory, "defaultSpriteSheet");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[ARUISpriteSheetFactory sharedInstance](ARUISpriteSheetFactory, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "defaultSpriteTexture");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[ARUIGridSpriteGenerator generatorWithSpriteCount:framesPerSprite:rowsPerSprite:columnsPerSprite:](ARUIGridSpriteGenerator, "generatorWithSpriteCount:framesPerSprite:rowsPerSprite:columnsPerSprite:", 3, 121, 4, 32);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "generateSprites");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = [ARUISpriteSheet alloc];
    v13[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[ARUISpriteSheet initWithTexture:sprites:](v10, "initWithTexture:sprites:", v6, v11);

    return v12;
  }
}

- (id)wheelchairSpriteTexture
{
  ARUISpriteTexture **p_wheelchairSpriteTexture;
  ARUISpriteTexture *WeakRetained;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  p_wheelchairSpriteTexture = &self->_wheelchairSpriteTexture;
  WeakRetained = (ARUISpriteTexture *)objc_loadWeakRetained((id *)&self->_wheelchairSpriteTexture);
  if (!WeakRetained)
  {
    arui_rings_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = CFSTR("ringIconSprite_WHEELCHAIR");
      _os_log_impl(&dword_212DE7000, v4, OS_LOG_TYPE_DEFAULT, "Loading texture with image format: %@", (uint8_t *)&v9, 0xCu);
    }

    v5 = (void *)MEMORY[0x24BEBD640];
    ActivityRingsUIFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("ringIconSprite_WHEELCHAIR"), v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = -[ARUISpriteTexture initWithImage:]([ARUISpriteTexture alloc], "initWithImage:", v7);
    objc_storeWeak((id *)p_wheelchairSpriteTexture, WeakRetained);

  }
  return WeakRetained;
}

+ (id)wheelchairSpriteSheet
{
  void *v2;
  void *v3;
  void *v4;
  ARUISpriteSheet *v5;
  void *v6;
  ARUISpriteSheet *v7;

  +[ARUISpriteSheetFactory sharedInstance](ARUISpriteSheetFactory, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wheelchairSpriteTexture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[ARUIGridSpriteGenerator generatorWithSpriteCount:framesPerSprite:rowsPerSprite:columnsPerSprite:](ARUIGridSpriteGenerator, "generatorWithSpriteCount:framesPerSprite:rowsPerSprite:columnsPerSprite:", 3, 121, 4, 32);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [ARUISpriteSheet alloc];
  objc_msgSend(v4, "generateSprites");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ARUISpriteSheet initWithTexture:sprites:](v5, "initWithTexture:sprites:", v3, v6);

  return v7;
}

+ (id)wheelchairSpriteSheetForRingType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  ARUISpriteSheet *v10;
  void *v11;
  ARUISpriteSheet *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  if (a3 == 3)
  {
    +[ARUISpriteSheetFactory wheelchairSpriteSheet](ARUISpriteSheetFactory, "wheelchairSpriteSheet");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[ARUISpriteSheetFactory sharedInstance](ARUISpriteSheetFactory, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "wheelchairSpriteTexture");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[ARUIGridSpriteGenerator generatorWithSpriteCount:framesPerSprite:rowsPerSprite:columnsPerSprite:](ARUIGridSpriteGenerator, "generatorWithSpriteCount:framesPerSprite:rowsPerSprite:columnsPerSprite:", 3, 121, 4, 32);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "generateSprites");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = [ARUISpriteSheet alloc];
    v13[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[ARUISpriteSheet initWithTexture:sprites:](v10, "initWithTexture:sprites:", v6, v11);

    return v12;
  }
}

- (id)sharingSpriteTexture
{
  ARUISpriteTexture **p_sharingSpriteTexture;
  ARUISpriteTexture *WeakRetained;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  p_sharingSpriteTexture = &self->_sharingSpriteTexture;
  WeakRetained = (ARUISpriteTexture *)objc_loadWeakRetained((id *)&self->_sharingSpriteTexture);
  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("sharingRingIconSprite"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    arui_rings_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v4;
      _os_log_impl(&dword_212DE7000, v5, OS_LOG_TYPE_DEFAULT, "Loading texture with image format: %@", (uint8_t *)&v10, 0xCu);
    }

    v6 = (void *)MEMORY[0x24BEBD640];
    ActivityRingsUIFrameworkBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageNamed:inBundle:compatibleWithTraitCollection:", v4, v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = -[ARUISpriteTexture initWithImage:]([ARUISpriteTexture alloc], "initWithImage:", v8);
    objc_storeWeak((id *)p_sharingSpriteTexture, WeakRetained);

  }
  return WeakRetained;
}

+ (id)sharingSpriteSheet
{
  void *v2;
  void *v3;
  void *v4;
  ARUISpriteSheet *v5;
  void *v6;
  ARUISpriteSheet *v7;

  +[ARUISpriteSheetFactory sharedInstance](ARUISpriteSheetFactory, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sharingSpriteTexture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[ARUIGridSpriteGenerator generatorWithSpriteCount:framesPerSprite:rowsPerSprite:columnsPerSprite:](ARUIGridSpriteGenerator, "generatorWithSpriteCount:framesPerSprite:rowsPerSprite:columnsPerSprite:", 3, 1, 1, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [ARUISpriteSheet alloc];
  objc_msgSend(v4, "generateSprites");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ARUISpriteSheet initWithTexture:sprites:](v5, "initWithTexture:sprites:", v3, v6);

  return v7;
}

- (id)wheelchairSharingSpriteTexture
{
  ARUISpriteTexture **p_wheelchairSharingSpriteTexture;
  ARUISpriteTexture *WeakRetained;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  p_wheelchairSharingSpriteTexture = &self->_wheelchairSharingSpriteTexture;
  WeakRetained = (ARUISpriteTexture *)objc_loadWeakRetained((id *)&self->_wheelchairSharingSpriteTexture);
  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("sharingRingIconSprite_WHEELCHAIR"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    arui_rings_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v4;
      _os_log_impl(&dword_212DE7000, v5, OS_LOG_TYPE_DEFAULT, "Loading texture with image format: %@", (uint8_t *)&v10, 0xCu);
    }

    v6 = (void *)MEMORY[0x24BEBD640];
    ActivityRingsUIFrameworkBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageNamed:inBundle:compatibleWithTraitCollection:", v4, v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = -[ARUISpriteTexture initWithImage:]([ARUISpriteTexture alloc], "initWithImage:", v8);
    objc_storeWeak((id *)p_wheelchairSharingSpriteTexture, WeakRetained);

  }
  return WeakRetained;
}

+ (id)wheelchairSharingSpriteSheet
{
  void *v2;
  void *v3;
  void *v4;
  ARUISpriteSheet *v5;
  void *v6;
  ARUISpriteSheet *v7;

  +[ARUISpriteSheetFactory sharedInstance](ARUISpriteSheetFactory, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wheelchairSharingSpriteTexture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[ARUIGridSpriteGenerator generatorWithSpriteCount:framesPerSprite:rowsPerSprite:columnsPerSprite:](ARUIGridSpriteGenerator, "generatorWithSpriteCount:framesPerSprite:rowsPerSprite:columnsPerSprite:", 3, 1, 1, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [ARUISpriteSheet alloc];
  objc_msgSend(v4, "generateSprites");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ARUISpriteSheet initWithTexture:sprites:](v5, "initWithTexture:sprites:", v3, v6);

  return v7;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_wheelchairSharingSpriteTexture);
  objc_destroyWeak((id *)&self->_sharingSpriteTexture);
  objc_destroyWeak((id *)&self->_wheelchairSpriteTexture);
  objc_destroyWeak((id *)&self->_defaultSpriteTexture);
}

@end
