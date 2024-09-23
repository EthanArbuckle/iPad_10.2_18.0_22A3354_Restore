@implementation GKRandomSource

- (GKRandomSource)init
{
  uint64_t v3;
  GKARC4RandomSource *v4;
  GKRandomSource *p_super;
  objc_super v7;

  v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    v4 = objc_alloc_init(GKARC4RandomSource);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)GKRandomSource;
    v4 = -[GKRandomSource init](&v7, sel_init);
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

- (GKRandomSource)initWithCoder:(NSCoder *)aDecoder
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKRandomSource;
  return -[GKRandomSource init](&v4, sel_init, aDecoder);
}

+ (GKRandomSource)sharedRandom
{
  if (qword_25591E718 != -1)
    dispatch_once(&qword_25591E718, &__block_literal_global_0);
  return (GKRandomSource *)(id)_MergedGlobals;
}

void __30__GKRandomSource_sharedRandom__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_MergedGlobals;
  _MergedGlobals = v0;

}

- (int64_t)nextInt
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("subclass must define nextInt"));
  return 0;
}

- (unint64_t)nextIntWithUpperBound:(unint64_t)a3
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("subclass must define nextIntWithUpperBound:"));
  return 0;
}

- (float)nextUniform
{
  return (float)-[GKRandomSource nextIntWithUpperBound:](self, "nextIntWithUpperBound:", 16777217) * 0.000000059605;
}

- (BOOL)nextBool
{
  return -[GKRandomSource nextIntWithUpperBound:](self, "nextIntWithUpperBound:", 2) != 0;
}

- (NSArray)arrayByShufflingObjectsInArray:(NSArray *)array
{
  NSArray *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t i;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  NSArray *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = array;
  if (-[NSArray count](v4, "count") > 1)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSArray count](v4, "count"));
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v18 = v4;
    v7 = v4;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          while (1)
          {
            if (*(_QWORD *)v20 != v11)
              objc_enumerationMutation(v7);
            v15 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
            v16 = -[GKRandomSource nextIntWithUpperBound:](self, "nextIntWithUpperBound:", (v10 + i + 1));
            if (v16 == v10 + (_DWORD)i)
              break;
            v13 = v16;
            objc_msgSend(v6, "objectAtIndex:", v16);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v14);

            objc_msgSend(v6, "setObject:atIndexedSubscript:", v15, v13);
            if (v9 == ++i)
              goto LABEL_5;
          }
          objc_msgSend(v6, "addObject:", v15);
        }
LABEL_5:
        v10 += i;
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v9);
    }

    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:", v6);
    v4 = v18;
  }
  else
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:", v4);
  }

  return (NSArray *)v5;
}

@end
