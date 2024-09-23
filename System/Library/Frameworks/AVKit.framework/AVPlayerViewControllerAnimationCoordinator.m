@implementation AVPlayerViewControllerAnimationCoordinator

- (AVPlayerViewControllerAnimationCoordinator)init
{
  AVPlayerViewControllerAnimationCoordinator *v2;
  uint64_t v3;
  NSMutableArray *animations;
  uint64_t v5;
  NSMutableArray *completions;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVPlayerViewControllerAnimationCoordinator;
  v2 = -[AVPlayerViewControllerAnimationCoordinator init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    animations = v2->_animations;
    v2->_animations = (NSMutableArray *)v3;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    completions = v2->_completions;
    v2->_completions = (NSMutableArray *)v5;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong((id *)&self->_animations, 0);
}

- (void)addCoordinatedAnimations:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  -[AVPlayerViewControllerAnimationCoordinator animations](self, "animations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (v12)
    {
      -[AVPlayerViewControllerAnimationCoordinator animations](self, "animations");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v12, "copy");
      objc_msgSend(v8, "addObject:", v9);

    }
    if (v6)
    {
      -[AVPlayerViewControllerAnimationCoordinator completions](self, "completions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v6, "copy");
      objc_msgSend(v10, "addObject:", v11);

    }
  }
  else
  {
    NSLog(CFSTR("*** AVPlayerViewControllerAnimationCoordinator: Animations added to coordinator after animations performed will be ignored."));
  }

}

- (void)performCoordinatedAnimations
{
  void *v3;
  void *v4;
  NSMutableArray *animations;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[AVPlayerViewControllerAnimationCoordinator animations](self, "animations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  animations = self->_animations;
  self->_animations = 0;

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10) + 16))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10));
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  -[AVPlayerViewControllerAnimationCoordinator animations](self, "animations", (_QWORD)v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeAllObjects");

}

- (NSMutableArray)animations
{
  return self->_animations;
}

- (NSMutableArray)completions
{
  return self->_completions;
}

- (void)didFinishAnimations:(BOOL)a3
{
  void *v4;
  void *v5;
  NSMutableArray *completions;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[AVPlayerViewControllerAnimationCoordinator completions](self, "completions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  completions = self->_completions;
  self->_completions = 0;

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11) + 16))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11));
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  -[AVPlayerViewControllerAnimationCoordinator completions](self, "completions", (_QWORD)v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeAllObjects");

}

@end
