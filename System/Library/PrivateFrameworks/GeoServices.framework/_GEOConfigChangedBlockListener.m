@implementation _GEOConfigChangedBlockListener

- (void)callListener
{
  char *WeakRetained;
  __int128 v4;
  id v5;
  NSObject *queue;
  id v7;
  __int128 v8;
  _QWORD block[4];
  id v10;
  __int128 v11;

  if (self)
  {
    WeakRetained = (char *)objc_loadWeakRetained((id *)&self->keyHelper);
    if (WeakRetained)
      v4 = *(_OWORD *)(WeakRetained + 40);
    else
      v4 = 0uLL;
    v8 = v4;

    v5 = self->block;
    if (v5)
    {
      queue = self->queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __46___GEOConfigChangedBlockListener_callListener__block_invoke;
      block[3] = &unk_1E1C10550;
      v10 = v5;
      v11 = v8;
      v7 = v5;
      dispatch_async(queue, block);

    }
  }
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  OS_dispatch_queue *queue;
  void *v7;
  id WeakRetained;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->queue;
  v7 = (void *)MEMORY[0x18D765024](self->block);
  WeakRetained = objc_loadWeakRetained((id *)&self->keyHelper);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p: q: %@ b: %@ k: %@>"), v5, self, queue, v7, WeakRetained);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->block, 0);
  objc_storeStrong((id *)&self->queue, 0);
  objc_destroyWeak((id *)&self->keyHelper);
}

@end
