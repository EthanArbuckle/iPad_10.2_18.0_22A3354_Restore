@implementation BKEventDeliveryChain

- (BOOL)isEqual:(id)a3
{
  BKEventDeliveryChain *v4;
  uint64_t v5;
  BKEventDeliveryChain *v6;
  BKEventDeliveryChain *v7;
  BOOL v8;
  id *v9;

  v4 = (BKEventDeliveryChain *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    v6 = v4;
    if (v5)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = v6;
      else
        v7 = 0;
    }
    else
    {
      v7 = 0;
    }
    v9 = v7;

    v8 = v9
      && BSEqualObjects()
      && BSEqualObjects()
      && BSEqualObjects()
      && (!-[NSArray count](self->_deferringPath, "count") && !objc_msgSend(v9[4], "count")
       || BSEqualObjects());

  }
  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[BKSEventDeferringChainIdentity hash](self->_identity, "hash");
  return -[BKSHIDEventSenderDescriptor hash](self->_senderDescriptor, "hash") ^ v3;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;

  v8 = a3;
  v4 = (id)objc_msgSend(v8, "appendObject:withName:", self->_identity, CFSTR("identity"));
  v5 = (id)objc_msgSend(v8, "appendObject:withName:", self->_senderDescriptor, CFSTR("sender"));
  v6 = (id)objc_msgSend(v8, "appendObject:withName:", self->_dispatchTarget, CFSTR("target"));
  v7 = (id)objc_msgSend(v8, "appendObject:withName:", self->_deferringPath, CFSTR("path"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferringPath, 0);
  objc_storeStrong((id *)&self->_senderDescriptor, 0);
  objc_storeStrong((id *)&self->_dispatchTarget, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

- (id)resolutionPath
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[5];
  id v35;
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(*(id *)(a1 + 8), "display");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 8), "environment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0D00CB0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __38__BKEventDeliveryChain_resolutionPath__block_invoke;
    v34[3] = &unk_1E81F7180;
    v34[4] = a1;
    v6 = v4;
    v35 = v6;
    v23 = v3;
    v36 = v23;
    objc_msgSend(v5, "build:", v34);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v2;
    objc_msgSend(v2, "addObject:", v7);

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v8 = a1;
    v9 = *(id *)(a1 + 32);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v31;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v31 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD **)(*((_QWORD *)&v30 + 1) + 8 * v13);
          if (v14)
            v14 = (_QWORD *)v14[2];
          v15 = v14;
          objc_msgSend(v15, "predicate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "display");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v17)
          {
            objc_msgSend(MEMORY[0x1E0D00CF8], "nullDisplay");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v15, "target");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (v18)
          {
            v20 = (void *)MEMORY[0x1E0D00CB0];
            v25[0] = MEMORY[0x1E0C809B0];
            v25[1] = 3221225472;
            v25[2] = __38__BKEventDeliveryChain_resolutionPath__block_invoke_2;
            v25[3] = &unk_1E81F71A8;
            v26 = v18;
            v27 = v6;
            v28 = v17;
            v29 = v8;
            objc_msgSend(v20, "build:", v25);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "addObject:", v21);

          }
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
      }
      while (v11);
    }

  }
  else
  {
    v24 = 0;
  }
  return v24;
}

void __38__BKEventDeliveryChain_resolutionPath__block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1[4] + 16);
  v4 = a2;
  objc_msgSend(v4, "setPid:", objc_msgSend(v3, "pid"));
  objc_msgSend(v4, "setEnvironment:", a1[5]);
  objc_msgSend(v4, "setDisplay:", a1[6]);
  objc_msgSend(v4, "setDispatchingTarget:", *(_QWORD *)(a1[4] + 16));

}

void __38__BKEventDeliveryChain_resolutionPath__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "setPid:", objc_msgSend(v3, "pid"));
  objc_msgSend(*(id *)(a1 + 32), "token");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setToken:", v4);

  objc_msgSend(v5, "setEnvironment:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v5, "setDisplay:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v5, "setDispatchingTarget:", *(_QWORD *)(*(_QWORD *)(a1 + 56) + 16));

}

@end
