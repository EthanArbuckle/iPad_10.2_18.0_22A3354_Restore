@implementation AVTUIStickerGeneratorPool

+ (id)cacheKeyForAvatarRecord:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a3;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEditable"))
  {
    objc_msgSend(v3, "avatarData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "avt_SHA256");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingFormat:", CFSTR("_%@"), v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }

  return v4;
}

- (AVTUIStickerGeneratorPool)initWithMaxStickerGeneratorCount:(int64_t)a3
{
  void *v5;
  void *v6;
  AVTUIStickerGeneratorPool *v7;

  +[AVTUIEnvironment defaultEnvironment](AVTUIEnvironment, "defaultEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AVTUIStickerGeneratorPool initWithMaxStickerGeneratorCount:logger:](self, "initWithMaxStickerGeneratorCount:logger:", a3, v6);

  return v7;
}

- (AVTUIStickerGeneratorPool)initWithMaxStickerGeneratorCount:(int64_t)a3 logger:(id)a4
{
  id v7;
  AVTUIStickerGeneratorPool *v8;
  AVTUIStickerGeneratorPool *v9;
  uint64_t v10;
  NSMutableDictionary *availableStickerGenerators;
  uint64_t v12;
  NSMutableDictionary *inUseStickerGenerators;
  objc_super v15;

  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)AVTUIStickerGeneratorPool;
  v8 = -[AVTUIStickerGeneratorPool init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    if (a3 <= 0)
      a3 = 5;
    v8->_maxCount = a3;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", a3);
    v10 = objc_claimAutoreleasedReturnValue();
    availableStickerGenerators = v9->_availableStickerGenerators;
    v9->_availableStickerGenerators = (NSMutableDictionary *)v10;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", a3);
    v12 = objc_claimAutoreleasedReturnValue();
    inUseStickerGenerators = v9->_inUseStickerGenerators;
    v9->_inUseStickerGenerators = (NSMutableDictionary *)v12;

    objc_storeStrong((id *)&v9->_logger, a4);
  }

  return v9;
}

- (id)avatarForRecord:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D00858], "avatarForRecord:", a3);
}

- (id)generatorForAvatarRecord:(id)a3 inGenerators:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "cacheKeyForAvatarRecord:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)stealGeneratorForAvatarRecord:(id)a3 inGenerators:(id)a4 needAvatar:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v8 = a3;
  v9 = a4;
  -[AVTUIStickerGeneratorPool generatorForAvatarRecord:inGenerators:](self, "generatorForAvatarRecord:inGenerators:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 || !objc_msgSend(v9, "count"))
  {
    objc_msgSend((id)objc_opt_class(), "cacheKeyForAvatarRecord:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectForKey:", v11);

    v12 = v10;
  }
  else
  {
    objc_msgSend(v9, "allKeys");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "objectForKey:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (a5)
    {
      -[AVTUIStickerGeneratorPool avatarForRecord:](self, "avatarForRecord:", v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setAvatar:", v17);

    }
    else
    {
      objc_msgSend(v15, "setAvatar:", 0);
    }
    objc_msgSend(v9, "removeObjectForKey:", v14);
    v12 = v16;

  }
  return v12;
}

- (id)dequeueStickerGeneratorForAvatarRecord:(id)a3
{
  return -[AVTUIStickerGeneratorPool dequeueStickerGeneratorForAvatarRecord:needAvatar:](self, "dequeueStickerGeneratorForAvatarRecord:needAvatar:", a3, 1);
}

- (id)dequeueStickerGeneratorForAvatarRecord:(id)a3 needAvatar:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v4 = a4;
  v6 = a3;
  -[AVTUIStickerGeneratorPool inUseStickerGenerators](self, "inUseStickerGenerators");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTUIStickerGeneratorPool generatorForAvatarRecord:inGenerators:](self, "generatorForAvatarRecord:inGenerators:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    -[AVTUIStickerGeneratorPool availableStickerGenerators](self, "availableStickerGenerators");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTUIStickerGeneratorPool stealGeneratorForAvatarRecord:inGenerators:needAvatar:](self, "stealGeneratorForAvatarRecord:inGenerators:needAvatar:", v6, v9, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      -[AVTUIStickerGeneratorPool inUseStickerGenerators](self, "inUseStickerGenerators");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");
      -[AVTUIStickerGeneratorPool availableStickerGenerators](self, "availableStickerGenerators");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count") + v11;
      v14 = -[AVTUIStickerGeneratorPool maxCount](self, "maxCount");

      if (v13 >= v14)
      {
        v15 = (void *)MEMORY[0x1DF0D05A4]();
        -[AVTUIStickerGeneratorPool inUseStickerGenerators](self, "inUseStickerGenerators");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "allKeys");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "firstObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        -[AVTUIStickerGeneratorPool flushGeneratorForKey:](self, "flushGeneratorForKey:", v18);
        objc_autoreleasePoolPop(v15);
      }
      -[AVTUIStickerGeneratorPool inUseStickerGenerators](self, "inUseStickerGenerators");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "count");
      -[AVTUIStickerGeneratorPool availableStickerGenerators](self, "availableStickerGenerators");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "count") + v20;
      v23 = -[AVTUIStickerGeneratorPool maxCount](self, "maxCount");

      if (v22 >= v23
        || (!v4
          ? (v24 = 0)
          : (-[AVTUIStickerGeneratorPool avatarForRecord:](self, "avatarForRecord:", v6),
             v24 = (void *)objc_claimAutoreleasedReturnValue()),
            v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D00698]), "initWithAvatar:", v24),
            v24,
            !v8))
      {
        -[AVTUIStickerGeneratorPool inUseStickerGenerators](self, "inUseStickerGenerators");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVTUIStickerGeneratorPool stealGeneratorForAvatarRecord:inGenerators:needAvatar:](self, "stealGeneratorForAvatarRecord:inGenerators:needAvatar:", v6, v25, v4);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        -[AVTUIStickerGeneratorPool logger](self, "logger");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVTUIStickerGeneratorPool inUseStickerGenerators](self, "inUseStickerGenerators");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "logStickerGeneratorPoolDidntHaveAvailableGenerator:maxCount:", objc_msgSend(v27, "count"), -[AVTUIStickerGeneratorPool maxCount](self, "maxCount"));

      }
    }
  }
  -[AVTUIStickerGeneratorPool inUseStickerGenerators](self, "inUseStickerGenerators");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "cacheKeyForAvatarRecord:", v6);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setObject:forKey:", v8, v29);

  return v8;
}

- (void)didStopUsingStickerGeneratorForRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "cacheKeyForAvatarRecord:", v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[AVTUIStickerGeneratorPool inUseStickerGenerators](self, "inUseStickerGenerators");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[AVTUIStickerGeneratorPool inUseStickerGenerators](self, "inUseStickerGenerators");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", v9);

    -[AVTUIStickerGeneratorPool availableStickerGenerators](self, "availableStickerGenerators");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v6, v9);

  }
}

- (void)flushGeneratorForKey:(id)a3
{
  id v4;
  void *v5;
  id v6;

  if (a3)
  {
    v4 = a3;
    -[AVTUIStickerGeneratorPool inUseStickerGenerators](self, "inUseStickerGenerators");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", v4);

    -[AVTUIStickerGeneratorPool availableStickerGenerators](self, "availableStickerGenerators");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", v4);

  }
}

- (void)flushGeneratorForRecord:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "cacheKeyForAvatarRecord:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[AVTUIStickerGeneratorPool flushGeneratorForKey:](self, "flushGeneratorForKey:", v5);
}

- (void)flush
{
  void *v3;
  id v4;

  -[AVTUIStickerGeneratorPool inUseStickerGenerators](self, "inUseStickerGenerators");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[AVTUIStickerGeneratorPool availableStickerGenerators](self, "availableStickerGenerators");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

}

- (int64_t)maxCount
{
  return self->_maxCount;
}

- (NSMutableDictionary)availableStickerGenerators
{
  return self->_availableStickerGenerators;
}

- (NSMutableDictionary)inUseStickerGenerators
{
  return self->_inUseStickerGenerators;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_inUseStickerGenerators, 0);
  objc_storeStrong((id *)&self->_availableStickerGenerators, 0);
}

@end
