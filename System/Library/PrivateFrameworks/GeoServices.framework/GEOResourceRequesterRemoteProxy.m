@implementation GEOResourceRequesterRemoteProxy

- (void)fetchResources:(id)a3 force:(BOOL)a4 unpack:(BOOL)a5 manifestConfiguration:(id)a6 auditToken:(id)a7 signpostID:(unint64_t)a8 queue:(id)a9 handler:(id)a10
{
  _BOOL8 v12;
  _BOOL8 v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  GEOResourceFetchRequest *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;

  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = a10;
  v16 = a9;
  v17 = a7;
  v18 = a6;
  v19 = -[GEOResourceFetchRequest initWithTraits:auditToken:throttleToken:]([GEOResourceFetchRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, v17, 0);

  -[GEOResourceFetchRequest setResources:](v19, "setResources:", v14);
  -[GEOResourceFetchRequest setForce:](v19, "setForce:", v13);
  -[GEOResourceFetchRequest setUnpack:](v19, "setUnpack:", v12);
  -[GEOResourceFetchRequest setManifestConfiguration:](v19, "setManifestConfiguration:", v18);

  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __121__GEOResourceRequesterRemoteProxy_fetchResources_force_unpack_manifestConfiguration_auditToken_signpostID_queue_handler___block_invoke;
  v22[3] = &unk_1E1C210C8;
  v23 = v14;
  v24 = v15;
  v20 = v15;
  v21 = v14;
  -[GEOXPCRequest send:withReply:handler:](v19, "send:withReply:handler:", 0, v16, v22);

}

void __121__GEOResourceRequesterRemoteProxy_fetchResources_force_unpack_manifestConfiguration_auditToken_signpostID_queue_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  if (v5)
    goto LABEL_6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend(v14, "names"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "count"),
        v8 = objc_msgSend(*(id *)(a1 + 32), "count"),
        v6,
        v7 != v8))
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected response: %@"), v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "GEOErrorWithCode:reason:", -11, v13);
    v5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_6:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_7;
  }
  v9 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v14, "names");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "paths");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "error");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *, void *))(v9 + 16))(v9, v5, v10, v11);

LABEL_7:
}

@end
