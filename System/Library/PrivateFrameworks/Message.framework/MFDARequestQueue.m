@implementation MFDARequestQueue

- (MFDARequestQueue)initWithAccount:(id)a3 folderID:(id)a4
{
  id v7;
  id v8;
  MFDARequestQueue *v9;
  MFDARequestQueue *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MFDARequestQueue;
  v9 = -[MFRequestQueue init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeStrong((id *)&v10->_folderID, a4);
  }

  return v10;
}

- (id)filterRequests:(id)a3
{
  id v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__MFDARequestQueue_filterRequests___block_invoke;
  v7[3] = &unk_1E4E88E40;
  v5 = v4;
  v8 = v5;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v7);

  return v5;
}

void __35__MFDARequestQueue_filterRequests___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "first");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v5, "first");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "shouldSend")
      && (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v5) & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    }

  }
}

- (BOOL)processRequests:(id)a3
{
  void *v4;
  id v5;
  id v6;
  BOOL v7;
  uint64_t *v8;
  char v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  MFDARequestQueue *v16;
  _QWORD *v17;
  uint64_t *v18;
  _QWORD v19[3];
  int v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 1;
  -[MFDARequestQueue filterRequests:](self, "filterRequests:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v20 = -1;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __36__MFDARequestQueue_processRequests___block_invoke;
  v14 = &unk_1E4E88E68;
  v17 = v19;
  v6 = v5;
  v15 = v6;
  v16 = self;
  v18 = &v21;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v11);
  if (objc_msgSend(v6, "count", v11, v12, v13, v14))
  {
    v7 = -[DAMailAccount processRequests:mailbox:](self->_account, "processRequests:mailbox:", v6, self->_folderID);
    v8 = v22;
    if (!v7)
      *((_BYTE *)v22 + 24) = 0;
  }
  else
  {
    v8 = v22;
  }
  v9 = *((_BYTE *)v8 + 24);

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(&v21, 8);
  return v9;
}

void __36__MFDARequestQueue_processRequests___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  int v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "first");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "bodyFormat");
  v5 = v4;
  if (v4 != -1
    && v4 != *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
    && objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "processRequests:mailbox:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32)) & 1) == 0)*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = -1;
  }
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
  if (v5 != -1)
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v5;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folderID, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
