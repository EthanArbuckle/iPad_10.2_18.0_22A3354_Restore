@implementation GEOConfigRemoveBlockListener

void __GEOConfigRemoveBlockListener_block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  _QWORD *WeakRetained;
  _QWORD *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = *(_QWORD *)(a1 + 32);
  if (v12)
  {
    WeakRetained = objc_loadWeakRetained((id *)(v12 + 8));
    if (WeakRetained)
    {
      v14 = WeakRetained;
      objc_msgSend(v9, "objectForKeyedSubscript:", WeakRetained);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "count"))
      {
        v16 = 0;
        while (objc_msgSend(v15, "pointerAtIndex:", v16) != *(_QWORD *)(a1 + 32))
        {
          if (++v16 >= (unint64_t)objc_msgSend(v15, "count"))
            goto LABEL_9;
        }
        objc_msgSend(v15, "removePointerAtIndex:", v16);
      }
LABEL_9:
      objc_msgSend(v15, "compact");
      if (!objc_msgSend(v15, "count"))
      {
        objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, v14);
        -[_GEOConfigKeyHelper keyString](v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, v17);

        -[_GEOConfigKeyHelper keyNumber](v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, v18);

        v19 = (void *)MEMORY[0x1E0C99E60];
        -[_GEOConfigKeyHelper keyString](v14);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setWithObject:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        _GEORemoveChangeListenerForKeys(v21);

      }
    }
  }

}

@end
