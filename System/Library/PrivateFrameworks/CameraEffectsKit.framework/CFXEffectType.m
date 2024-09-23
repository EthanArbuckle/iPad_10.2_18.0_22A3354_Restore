@implementation CFXEffectType

+ (void)initialize
{
  if (initialize_onceToken_0 != -1)
    dispatch_once(&initialize_onceToken_0, &__block_literal_global_6);
}

void __27__CFXEffectType_initialize__block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CFXEffectType *v12;
  CFXEffectType *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  _QWORD v20[6];

  v20[5] = *MEMORY[0x24BDAC8D0];
  v0 = objc_alloc(MEMORY[0x24BDBCF00]);
  v20[0] = CFSTR("Animoji");
  v20[1] = CFSTR("Filter");
  v20[2] = CFSTR("Shapes");
  v20[3] = CFSTR("Text");
  v20[4] = CFSTR("EmojiStickers");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 5);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v0, "initWithArray:", v1);
  v3 = (void *)s_OrderedEffectTypes;
  s_OrderedEffectTypes = v2;

  v4 = objc_alloc(MEMORY[0x24BDBCED8]);
  v5 = (void *)objc_msgSend(v4, "initWithCapacity:", objc_msgSend((id)s_OrderedEffectTypes, "count"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = (id)s_OrderedEffectTypes;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
        v12 = [CFXEffectType alloc];
        v13 = -[CFXEffectType initWithIdentifier:](v12, "initWithIdentifier:", v11, (_QWORD)v15);
        objc_msgSend(v5, "setValue:forKey:", v13, v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  v14 = (void *)s_EffectTypeMap;
  s_EffectTypeMap = (uint64_t)v5;

}

- (CFXEffectType)initWithIdentifier:(id)a3
{
  id v5;
  CFXEffectType *v6;
  CFXEffectType *v7;
  const __CFString *v8;
  int v9;
  NSString *localizedTitle;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CFXEffectType;
  v6 = -[CFXEffectType init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    v8 = CFSTR("Filter");
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("Filter")))
    {
      v9 = 1;
    }
    else
    {
      v8 = CFSTR("Shapes");
      if (objc_msgSend(v5, "isEqualToString:", CFSTR("Shapes"))
        || (v8 = CFSTR("Text"), objc_msgSend(v5, "isEqualToString:", CFSTR("Text")))
        || (v8 = CFSTR("EmojiStickers"), objc_msgSend(v5, "isEqualToString:", CFSTR("EmojiStickers"))))
      {
        v9 = 2;
      }
      else
      {
        v8 = CFSTR("Animoji");
        if (!objc_msgSend(v5, "isEqualToString:", CFSTR("Animoji")))
          goto LABEL_9;
        v9 = 7;
      }
    }
    v7->_jtEffectType = v9;
    localizedTitle = v7->_localizedTitle;
    v7->_localizedTitle = &v8->isa;

  }
LABEL_9:

  return v7;
}

+ (id)effectTypeIdentifiers
{
  return (id)s_OrderedEffectTypes;
}

+ (id)effectTypeWithIdentifier:(id)a3
{
  return (id)objc_msgSend((id)s_EffectTypeMap, "objectForKey:", a3);
}

- (NSOrderedSet)effects
{
  NSOrderedSet *effects;
  void *v4;
  NSOrderedSet *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSOrderedSet *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  effects = self->_effects;
  if (!effects)
  {
    +[CFXEffect effectIdentifiersForEffectType:](CFXEffect, "effectIdentifiersForEffectType:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (NSOrderedSet *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEE0]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          +[CFXEffect effectWithIdentifier:forEffectType:](CFXEffect, "effectWithIdentifier:forEffectType:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), self, (_QWORD)v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            -[NSOrderedSet addObject:](v5, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

    v12 = self->_effects;
    self->_effects = v5;

    effects = self->_effects;
  }
  return effects;
}

- (BOOL)isEqual:(id)a3
{
  CFXEffectType *v4;
  CFXEffectType *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (CFXEffectType *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[CFXEffectType identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXEffectType identifier](v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqual:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[CFXEffectType identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (void)setEffects:(id)a3
{
  objc_storeStrong((id *)&self->_effects, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int)jtEffectType
{
  return self->_jtEffectType;
}

- (void)setJtEffectType:(int)a3
{
  self->_jtEffectType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_effects, 0);
}

@end
