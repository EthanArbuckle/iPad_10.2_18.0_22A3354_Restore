@implementation GSPermanentAdditionEnumerator

- (GSPermanentAdditionEnumerator)initWithStorage:(id)a3 nameSpace:(id)a4 withOptions:(unint64_t)a5 withoutOptions:(unint64_t)a6 ordering:(int)a7
{
  id v13;
  id v14;
  GSPermanentAdditionEnumerator *v15;
  GSPermanentAdditionEnumerator *v16;
  uint64_t v17;
  GSDaemonProxySync *proxy;
  id token;
  void *v20;
  objc_super v22;

  v13 = a3;
  v14 = a4;
  v22.receiver = self;
  v22.super_class = (Class)GSPermanentAdditionEnumerator;
  v15 = -[GSPermanentAdditionEnumerator init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_storage, a3);
    objc_storeStrong((id *)&v16->_nameSpace, a4);
    v16->_withOptions = a5;
    v16->_withoutOptions = a6;
    +[GSDaemonProxySync proxy](GSDaemonProxySync, "proxy");
    v17 = objc_claimAutoreleasedReturnValue();
    proxy = v16->_proxy;
    v16->_proxy = (GSDaemonProxySync *)v17;

    token = v16->_token;
    v20 = &unk_1E9775950;
    if (a7 == -1)
      v20 = &unk_1E9775938;
    v16->_token = v20;

    -[GSPermanentAdditionEnumerator _fetchNextBatch](v16, "_fetchNextBatch");
  }

  return v16;
}

- (void)dealloc
{
  id v3;
  objc_super v4;

  v3 = -[GSDaemonProxySync result](self->_proxy, "result");
  v4.receiver = self;
  v4.super_class = (Class)GSPermanentAdditionEnumerator;
  -[GSPermanentAdditionEnumerator dealloc](&v4, sel_dealloc);
}

- (void)_fetchNextBatch
{
  GSDaemonProxySync *proxy;
  int64_t v4;
  NSString *nameSpace;
  unint64_t withOptions;
  unint64_t withoutOptions;
  id token;
  _QWORD v9[5];

  proxy = self->_proxy;
  v4 = -[GSPermanentStorage remoteID](self->_storage, "remoteID");
  nameSpace = self->_nameSpace;
  withOptions = self->_withOptions;
  withoutOptions = self->_withoutOptions;
  token = self->_token;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__GSPermanentAdditionEnumerator__fetchNextBatch__block_invoke;
  v9[3] = &unk_1E9771C00;
  v9[4] = self;
  -[GSDaemonProxySync listAdditionsOfStorage:nameSpace:withOptions:withoutOptions:andEnumerationState:completionHandler:](proxy, "listAdditionsOfStorage:nameSpace:withOptions:withoutOptions:andEnumerationState:completionHandler:", v4, nameSpace, withOptions, withoutOptions, token, v9);
}

void __48__GSPermanentAdditionEnumerator__fetchNextBatch__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  id v23;
  id v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (v12)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setPubExtension:", v12);
  if (v13)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setPrivExtension:", v13);
  v16 = *(_QWORD *)(a1 + 32);
  if (v11)
  {
    v24 = v15;
    v25 = v14;
    v26 = v13;
    objc_storeStrong((id *)(v16 + 72), a5);
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v11, "count"));
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v18 = v11;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v28 != v21)
            objc_enumerationMutation(v18);
          v23 = -[GSAddition _initWithStorage:andDictionary:]([GSAddition alloc], "_initWithStorage:andDictionary:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i));
          objc_msgSend(v17, "addObject:", v23);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v20);
    }

    v15 = v24;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "handleObjResult:error:", v17, v24);

    v13 = v26;
    v14 = v25;
  }
  else
  {
    objc_msgSend(*(id *)(v16 + 56), "handleObjResult:error:", 0, v15);
  }

}

- (id)nextObject
{
  void *v2;
  unint64_t pos;
  unint64_t v6;
  NSArray *v7;
  NSArray *v8;
  NSArray *array;
  NSError *v10;
  NSError *error;
  GSDaemonProxySync *proxy;

  if (self->_error)
    goto LABEL_2;
  if (self->_proxy)
  {
    pos = self->_pos;
    if (pos >= -[NSArray count](self->_array, "count"))
    {
      -[GSDaemonProxySync result](self->_proxy, "result");
      v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
      array = self->_array;
      self->_array = v8;

      -[GSDaemonProxySync error](self->_proxy, "error");
      v10 = (NSError *)objc_claimAutoreleasedReturnValue();
      self->_pos = 0;
      if (v10)
      {
        error = self->_error;
        self->_error = v10;

        goto LABEL_2;
      }
      if (self->_token)
      {
        -[GSPermanentAdditionEnumerator _fetchNextBatch](self, "_fetchNextBatch");
      }
      else
      {
        proxy = self->_proxy;
        self->_proxy = 0;

      }
    }
  }
  v6 = self->_pos;
  if (v6 < -[NSArray count](self->_array, "count"))
  {
    v7 = self->_array;
    ++self->_pos;
    -[NSArray objectAtIndex:](v7, "objectAtIndex:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    return v2;
  }
LABEL_2:
  v2 = 0;
  return v2;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_token, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_array, 0);
  objc_storeStrong((id *)&self->_nameSpace, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

@end
