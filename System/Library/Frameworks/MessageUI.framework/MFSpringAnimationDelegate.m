@implementation MFSpringAnimationDelegate

- (MFSpringAnimationDelegate)init
{
  MFSpringAnimationDelegate *v2;
  NSMutableArray *v3;
  NSMutableArray *completionBlocks;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFSpringAnimationDelegate;
  v2 = -[MFSpringAnimationDelegate init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    completionBlocks = v2->_completionBlocks;
    v2->_completionBlocks = v3;

  }
  return v2;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_completionBlocks;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8) + 16))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  -[NSMutableArray removeAllObjects](self->_completionBlocks, "removeAllObjects", (_QWORD)v9);
}

- (NSMutableArray)completionBlocks
{
  return self->_completionBlocks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionBlocks, 0);
}

@end
