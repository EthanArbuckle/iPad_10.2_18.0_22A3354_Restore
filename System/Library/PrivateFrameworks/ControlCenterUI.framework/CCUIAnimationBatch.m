@implementation CCUIAnimationBatch

- (CCUIAnimationBatch)init
{
  CCUIAnimationBatch *v2;
  uint64_t v3;
  NSUUID *UUID;
  NSMutableDictionary *v5;
  NSMutableDictionary *animationsByParameters;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CCUIAnimationBatch;
  v2 = -[CCUIAnimationBatch init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = objc_claimAutoreleasedReturnValue();
    UUID = v2->_UUID;
    v2->_UUID = (NSUUID *)v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    animationsByParameters = v2->_animationsByParameters;
    v2->_animationsByParameters = v5;

  }
  return v2;
}

- (void)addAnimation:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "parameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_animationsByParameters, "objectForKey:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[NSMutableDictionary setObject:forKey:](self->_animationsByParameters, "setObject:forKey:", v5, v4);
  }
  objc_msgSend(v5, "addObject:", v6);

}

- (void)iterateAnimationsWithBlock:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  NSMutableDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, void *))a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_animationsByParameters;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_animationsByParameters, "objectForKey:", v10, (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v10, v11);

      }
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (void)iterateAnimationsOfType:(Class)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  Class v10;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__CCUIAnimationBatch_iterateAnimationsOfType_withBlock___block_invoke;
  v8[3] = &unk_1E8CFCEC8;
  v9 = v6;
  v10 = a3;
  v7 = v6;
  -[CCUIAnimationBatch iterateAnimationsWithBlock:](self, "iterateAnimationsWithBlock:", v8);

}

void __56__CCUIAnimationBatch_iterateAnimationsOfType_withBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_animationsByParameters, 0);
}

@end
