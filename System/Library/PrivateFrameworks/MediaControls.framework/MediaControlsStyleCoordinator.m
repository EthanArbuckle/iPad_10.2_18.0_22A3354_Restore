@implementation MediaControlsStyleCoordinator

- (void)animateAlongsideTransition:(id)a3 completion:(id)a4
{
  id v6;
  NSMutableArray *animations;
  void *v8;
  void *v9;
  NSMutableArray *v10;
  NSMutableArray *v11;
  NSMutableArray *completions;
  void *v13;
  void *v14;
  NSMutableArray *v15;
  NSMutableArray *v16;
  id aBlock;

  aBlock = a3;
  v6 = a4;
  if (aBlock)
  {
    animations = self->_animations;
    if (animations)
    {
      v8 = _Block_copy(aBlock);
      -[NSMutableArray addObject:](animations, "addObject:", v8);
    }
    else
    {
      v9 = (void *)MEMORY[0x1E0C99DE8];
      v8 = _Block_copy(aBlock);
      objc_msgSend(v9, "arrayWithObject:", v8);
      v10 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      v11 = self->_animations;
      self->_animations = v10;

    }
  }
  if (v6)
  {
    completions = self->_completions;
    if (completions)
    {
      v13 = _Block_copy(v6);
      -[NSMutableArray addObject:](completions, "addObject:", v13);
    }
    else
    {
      v14 = (void *)MEMORY[0x1E0C99DE8];
      v13 = _Block_copy(v6);
      objc_msgSend(v14, "arrayWithObject:", v13);
      v15 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      v16 = self->_completions;
      self->_completions = v15;

    }
  }

}

- (void)performAnimations
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)-[NSMutableArray copy](self->_animations, "copy", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++) + 16))();
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)performCompletions
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)-[NSMutableArray copy](self->_completions, "copy", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++) + 16))();
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong((id *)&self->_animations, 0);
}

@end
