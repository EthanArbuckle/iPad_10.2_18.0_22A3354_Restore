@implementation MFSimpleAnimationCoordinator

- (id)initCoordinatorAnimated:(BOOL)a3
{
  _BOOL8 v3;
  MFSimpleAnimationCoordinator *v4;
  MFSimpleAnimationCoordinator *v5;

  v3 = a3;
  v4 = -[MFSimpleAnimationCoordinator init](self, "init");
  v5 = v4;
  if (v4)
    -[MFSimpleAnimationCoordinator setAnimated:](v4, "setAnimated:", v3);
  return v5;
}

- (MFSimpleAnimationCoordinator)init
{
  MFSimpleAnimationCoordinator *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFSimpleAnimationCoordinator;
  v2 = -[MFSimpleAnimationCoordinator init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFSimpleAnimationCoordinator setAnimations:](v2, "setAnimations:", v3);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFSimpleAnimationCoordinator setCompletions:](v2, "setCompletions:", v4);

  }
  return v2;
}

- (void)animateAlongsideAnimations:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  if (v13)
  {
    v7 = (void *)objc_msgSend(v13, "copy");
    -[MFSimpleAnimationCoordinator animations](self, "animations");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = _Block_copy(v7);
    objc_msgSend(v8, "addObject:", v9);

  }
  if (v6)
  {
    v10 = (void *)objc_msgSend(v6, "copy");
    -[MFSimpleAnimationCoordinator completions](self, "completions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = _Block_copy(v10);
    objc_msgSend(v11, "addObject:", v12);

  }
}

- (void)playAnimations
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[MFSimpleAnimationCoordinator animations](self, "animations", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v2);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5++) + 16))();
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (void)playCompletions:(BOOL)a3
{
  void *v3;
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
  -[MFSimpleAnimationCoordinator completions](self, "completions", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v3);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++) + 16))();
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (BOOL)isAnimated
{
  return self->_animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (NSMutableArray)animations
{
  return self->_animations;
}

- (void)setAnimations:(id)a3
{
  objc_storeStrong((id *)&self->_animations, a3);
}

- (NSMutableArray)completions
{
  return self->_completions;
}

- (void)setCompletions:(id)a3
{
  objc_storeStrong((id *)&self->_completions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong((id *)&self->_animations, 0);
}

@end
