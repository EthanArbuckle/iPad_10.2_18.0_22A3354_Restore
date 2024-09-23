@implementation ATXGamePlayKitRandomSource

- (ATXGamePlayKitRandomSource)init
{
  uint64_t v3;
  ATXGamePlayKitARC4RandomSource *v4;
  ATXGamePlayKitRandomSource *p_super;
  objc_super v7;

  v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    v4 = objc_alloc_init(ATXGamePlayKitARC4RandomSource);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)ATXGamePlayKitRandomSource;
    v4 = -[ATXGamePlayKitRandomSource init](&v7, sel_init);
    self = &v4->super;
  }
  p_super = &v4->super;

  return p_super;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  return (id)objc_opt_new();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXGamePlayKitRandomSource)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ATXGamePlayKitRandomSource;
  return -[ATXGamePlayKitRandomSource init](&v4, sel_init, a3);
}

+ (id)sharedRandom
{
  if (+[ATXGamePlayKitRandomSource sharedRandom]::onceToken != -1)
    dispatch_once(&+[ATXGamePlayKitRandomSource sharedRandom]::onceToken, &__block_literal_global_56);
  return (id)+[ATXGamePlayKitRandomSource sharedRandom]::source;
}

void __42__ATXGamePlayKitRandomSource_sharedRandom__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)+[ATXGamePlayKitRandomSource sharedRandom]::source;
  +[ATXGamePlayKitRandomSource sharedRandom]::source = v0;

}

- (int64_t)nextInt
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("subclass must define nextInt"));
  return 0;
}

- (unint64_t)nextIntWithUpperBound:(unint64_t)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("subclass must define nextIntWithUpperBound:"));
  return 0;
}

- (float)nextUniform
{
  return (float)-[ATXGamePlayKitRandomSource nextIntWithUpperBound:](self, "nextIntWithUpperBound:", 16777217)
       * 0.000000059605;
}

- (BOOL)nextBool
{
  return -[ATXGamePlayKitRandomSource nextIntWithUpperBound:](self, "nextIntWithUpperBound:", 2) != 0;
}

- (id)arrayByShufflingObjectsInArray:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  if ((unint64_t)objc_msgSend(v15, "count") > 1)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v15, "count"));
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = v15;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = 0;
      v9 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          v12 = -[ATXGamePlayKitRandomSource nextIntWithUpperBound:](self, "nextIntWithUpperBound:", (v8 + i + 1));
          if (v12 == v8 + (_DWORD)i)
          {
            objc_msgSend(v5, "addObject:", v11);
          }
          else
          {
            objc_msgSend(v5, "objectAtIndex:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v13);

            objc_msgSend(v5, "setObject:atIndexedSubscript:", v11, v12);
          }
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        v8 += i;
      }
      while (v7);
    }

    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v5);
  }
  else
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v15);
  }

  return v4;
}

@end
