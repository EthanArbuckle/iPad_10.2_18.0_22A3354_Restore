@implementation HREMediaPlaybackActionMap

- (HREMediaPlaybackActionMap)initWithState:(int64_t)a3 volume:(id)a4 playbackArchive:(id)a5
{
  id v8;
  id v9;
  HREMediaPlaybackActionMap *v10;
  HREMediaPlaybackActionMap *v11;
  objc_super v13;

  v8 = a4;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HREMediaPlaybackActionMap;
  v10 = -[HREActionMap _initWithCondition:childMaps:](&v13, sel__initWithCondition_childMaps_, 0, 0);
  v11 = v10;
  if (v10)
  {
    -[HREMediaPlaybackActionMap setTargetPlaybackState:](v10, "setTargetPlaybackState:", a3);
    -[HREMediaPlaybackActionMap setTargetVolume:](v11, "setTargetVolume:", v8);
    -[HREMediaPlaybackActionMap setPlaybackArchive:](v11, "setPlaybackArchive:", v9);
  }

  return v11;
}

+ (id)emptyMap
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__HREMediaPlaybackActionMap_emptyMap__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (emptyMap_onceToken_1 != -1)
    dispatch_once(&emptyMap_onceToken_1, block);
  return (id)emptyMap_emptyMap_1;
}

void __37__HREMediaPlaybackActionMap_emptyMap__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "statelessActionMapWithVolume:playbackArchive:", 0, 0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)emptyMap_emptyMap_1;
  emptyMap_emptyMap_1 = v1;

}

+ (id)actionMapWithState:(int64_t)a3 volume:(id)a4 playbackArchive:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithState:volume:playbackArchive:", a3, v9, v8);

  return v10;
}

+ (id)statelessActionMapWithVolume:(id)a3 playbackArchive:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithState:volume:playbackArchive:", 0, v7, v6);

  return v8;
}

- (id)addingCondition:(id)a3
{
  -[HREActionMap setCondition:](self, "setCondition:", a3);
  return self;
}

- (id)mergeWithActionMaps:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  HREMediaPlaybackActionMap *v9;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "na_filter:", &__block_literal_global_15);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v5, "na_all:", &__block_literal_global_2_10) & 1) != 0)
    {
      +[HREMediaPlaybackActionMap statelessActionMapWithVolume:playbackArchive:](HREMediaPlaybackActionMap, "statelessActionMapWithVolume:playbackArchive:", 0, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __49__HREMediaPlaybackActionMap_mergeWithActionMaps___block_invoke_3;
      v11[3] = &unk_24F218ED0;
      v11[4] = self;
      v7 = v6;
      v12 = v7;
      objc_msgSend(v5, "na_each:", v11);
      -[HREMediaPlaybackActionMap mergeMap:intoMap:](self, "mergeMap:intoMap:", self, v7);
      v8 = v12;
      v9 = (HREMediaPlaybackActionMap *)v7;

    }
    else
    {
      NSLog(CFSTR("Cannot merge maps! All maps must be the same type as self (%@) to merge: %@"), self, v5);
      v9 = self;
    }
    v4 = v5;
  }
  else
  {
    v9 = self;
  }

  return v9;
}

uint64_t __49__HREMediaPlaybackActionMap_mergeWithActionMaps___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;

  v2 = a2;
  +[HREActionMap emptyMap](HREActionMap, "emptyMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4 ^ 1u;
}

uint64_t __49__HREMediaPlaybackActionMap_mergeWithActionMaps___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __49__HREMediaPlaybackActionMap_mergeWithActionMaps___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "mergeMap:intoMap:", a2, *(_QWORD *)(a1 + 40));
}

- (id)flattenedMapEvaluatedForObject:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HREMediaPlaybackActionMap;
  -[HREActionMap flattenedMapEvaluatedForObject:](&v4, sel_flattenedMapEvaluatedForObject_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)mergeMap:(id)a3 intoMap:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v5 = a4;
  objc_msgSend(v12, "playbackArchive");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v12, "playbackArchive");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v5, "setPlaybackArchive:", v8);

  }
  if (objc_msgSend(v12, "targetPlaybackState"))
    objc_msgSend(v5, "setTargetPlaybackState:", objc_msgSend(v12, "targetPlaybackState"));
  objc_msgSend(v12, "targetVolume");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v12, "targetVolume");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v5, "setTargetVolume:", v11);

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HREMediaPlaybackActionMap;
  v4 = -[HREActionMap copyWithZone:](&v13, sel_copyWithZone_, a3);
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v7, "setTargetPlaybackState:", -[HREMediaPlaybackActionMap targetPlaybackState](self, "targetPlaybackState"));
  -[HREMediaPlaybackActionMap targetVolume](self, "targetVolume");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v7, "setTargetVolume:", v9);

  -[HREMediaPlaybackActionMap playbackArchive](self, "playbackArchive");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend(v7, "setPlaybackArchive:", v11);

  return v5;
}

- (int64_t)targetPlaybackState
{
  return self->_targetPlaybackState;
}

- (void)setTargetPlaybackState:(int64_t)a3
{
  self->_targetPlaybackState = a3;
}

- (NSNumber)targetVolume
{
  return self->_targetVolume;
}

- (void)setTargetVolume:(id)a3
{
  objc_storeStrong((id *)&self->_targetVolume, a3);
}

- (HFPlaybackArchive)playbackArchive
{
  return self->_playbackArchive;
}

- (void)setPlaybackArchive:(id)a3
{
  objc_storeStrong((id *)&self->_playbackArchive, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackArchive, 0);
  objc_storeStrong((id *)&self->_targetVolume, 0);
}

@end
