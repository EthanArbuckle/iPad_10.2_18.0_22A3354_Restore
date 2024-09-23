@implementation NSArray(INImageProxyInjecting)

- (void)_injectProxiesForImages:()INImageProxyInjecting completion:
{
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  INImageProxyInjectionOperation *v12;
  uint64_t v13;
  uint64_t v14;
  INImageProxyInjectionOperation *v15;
  void *v16;
  id *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id obj;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  _QWORD v30[2];
  _QWORD v31[4];
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD block[4];
  id v38;
  INImageProxyInjectionOperation *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  v6 = a4;
  if (v6)
  {
    INImageProxyInjectionQueue();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (objc_msgSend(a1, "count"))
    {
      v23 = v6;
      v9 = objc_alloc_init(MEMORY[0x1E0CB3828]);
      objc_msgSend(v9, "setUnderlyingQueue:", v7);
      objc_msgSend(v9, "setMaxConcurrentOperationCount:", 1);
      objc_msgSend(v9, "setSuspended:", 1);
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      obj = a1;
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
      if (v10)
      {
        v11 = v10;
        v12 = 0;
        v13 = *(_QWORD *)v34;
        do
        {
          v14 = 0;
          v15 = v12;
          do
          {
            if (*(_QWORD *)v34 != v13)
              objc_enumerationMutation(obj);
            v16 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v14);
            if (objc_msgSend(v16, "conformsToProtocol:", &unk_1EE0390D0))
            {
              v12 = objc_alloc_init(INImageProxyInjectionOperation);
              -[INImageProxyInjectionOperation setInjector:](v12, "setInjector:", v16);
              -[INImageProxyInjectionOperation setImageProxyRequestBlock:](v12, "setImageProxyRequestBlock:", v24);
              v31[0] = MEMORY[0x1E0C809B0];
              v31[1] = 3221225472;
              v31[2] = __69__NSArray_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke_2;
              v31[3] = &unk_1E22924C0;
              v32 = v8;
              -[INImageProxyInjectionOperation setCopyReturnBlock:](v12, "setCopyReturnBlock:", v31);
              v17 = &v32;
            }
            else
            {
              v18 = (void *)MEMORY[0x1E0CB34C8];
              v29[0] = MEMORY[0x1E0C809B0];
              v29[1] = 3221225472;
              v29[2] = __69__NSArray_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke_3;
              v29[3] = &unk_1E2293C38;
              v30[0] = v8;
              v30[1] = v16;
              objc_msgSend(v18, "blockOperationWithBlock:", v29);
              v12 = (INImageProxyInjectionOperation *)objc_claimAutoreleasedReturnValue();
              v17 = (id *)v30;
            }

            if (v15)
              -[INImageProxyInjectionOperation addDependency:](v12, "addDependency:", v15);
            objc_msgSend(v9, "addOperation:", v12);

            ++v14;
            v15 = v12;
          }
          while (v11 != v14);
          v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
        }
        while (v11);
      }
      else
      {
        v12 = 0;
      }

      v19 = (void *)MEMORY[0x1E0CB34C8];
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __69__NSArray_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke_4;
      v26[3] = &unk_1E2293BE8;
      v6 = v23;
      v27 = v8;
      v28 = v23;
      v20 = v8;
      objc_msgSend(v19, "blockOperationWithBlock:", v26);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v12)
        objc_msgSend(v21, "addDependency:", v12);
      objc_msgSend(v9, "addOperation:", v22);
      objc_msgSend(v9, "setSuspended:", 0);

    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __69__NSArray_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke;
      block[3] = &unk_1E2293BE8;
      v38 = v8;
      v39 = (INImageProxyInjectionOperation *)v6;
      v9 = v8;
      dispatch_async(v7, block);

      v12 = v39;
    }

  }
}

@end
