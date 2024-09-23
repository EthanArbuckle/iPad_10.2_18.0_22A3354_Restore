@implementation MPCPlayerChangeRequest

- (MPCPlayerChangeRequest)initWithCommandRequests:(id)a3
{
  id v4;
  MPCPlayerChangeRequest *v5;
  uint64_t v6;
  NSArray *commands;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPCPlayerChangeRequest;
  v5 = -[MPCPlayerChangeRequest init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    commands = v5->_commands;
    v5->_commands = (NSArray *)v6;

  }
  return v5;
}

- (id)description
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = self->_commands;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        MPCRemoteCommandDescriptionCopy(objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v8), "command"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  v10 = (void *)MEMORY[0x24BDD17C8];
  v11 = objc_opt_class();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("<%@: %p commands=(%@)>"), v11, self, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)performWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__MPCPlayerChangeRequest_performWithCompletion___block_invoke;
  v6[3] = &unk_24CAB9910;
  v7 = v4;
  v5 = v4;
  -[MPCPlayerChangeRequest performWithExtendedStatusCompletion:](self, "performWithExtendedStatusCompletion:", v6);

}

- (void)performWithExtendedStatusCompletion:(id)a3
{
  id v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  MPCPlayerCommandStatus *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  __int16 v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  MPCMediaRemoteCommandOperation *v37;
  uint64_t v38;
  uint64_t i;
  MPCMediaRemoteCommandOperation *v40;
  MPCMediaRemoteCommandOperation *v41;
  void *v42;
  NSArray *obj;
  __int16 v44;
  MPCPlayerChangeRequest *v45;
  MPCPlayerCommandStatus *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD v51[4];
  id v52;
  id v53;
  id v54;
  os_signpost_id_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  MPCPlayerCommandStatus *v62;
  uint8_t buf[4];
  MPCPlayerCommandStatus *v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (-[NSArray count](self->_commands, "count"))
  {
    v42 = v5;
    v6 = os_log_create("com.apple.amp.mediaplaybackcore", "MediaRemote");
    v7 = os_signpost_id_make_with_pointer(v6, self);

    v8 = os_log_create("com.apple.amp.mediaplaybackcore", "MediaRemote");
    v9 = v8;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_210BD8000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PlayerChangeRequest", ", buf, 2u);
    }

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v45 = self;
    v46 = (MPCPlayerCommandStatus *)objc_claimAutoreleasedReturnValue();
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v10 = self->_commands;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
    if (v11)
    {
      v12 = v11;
      v13 = 0;
      v14 = *(_QWORD *)v57;
      while (1)
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v57 != v14)
            objc_enumerationMutation(v10);
          v16 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v15);
          objc_msgSend(v16, "playerPath");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17
            || (objc_msgSend(v16, "controller"),
                v18 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v18, "resolvedPlayerPath"),
                v17 = (void *)objc_claimAutoreleasedReturnValue(),
                v18,
                v17))
          {
            if (v13)
              goto LABEL_14;
LABEL_13:
            v13 = v17;
            goto LABEL_14;
          }
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, v45, CFSTR("MPCPlayerChangeRequest.m"), 143, CFSTR("Cannot perform command request without a player path [not on request, or fallback from controller] request=%@"), v16);

          v17 = 0;
          if (!v13)
            goto LABEL_13;
LABEL_14:
          if ((objc_msgSend(v13, "isEqual:", v17) & 1) == 0)
          {
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, v45, CFSTR("MPCPlayerChangeRequest.m"), 146, CFSTR("All requests must have the same player path."));

          }
          ++v15;
        }
        while (v12 != v15);
        v21 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
        v12 = v21;
        if (!v21)
          goto LABEL_27;
      }
    }
    v13 = 0;
LABEL_27:

    v27 = -[MPCPlayerChangeRequest options](v45, "options");
    v28 = objc_alloc_init(MEMORY[0x24BDD1710]);
    objc_msgSend(v28, "setQualityOfService:", 25);
    v44 = v27;
    if ((v27 & 0x100) != 0)
      v29 = -1;
    else
      v29 = 1;
    objc_msgSend(v28, "setMaxConcurrentOperationCount:", v29);
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSArray count](v45->_commands, "count"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)MEMORY[0x24BDD1478];
    v51[0] = MEMORY[0x24BDAC760];
    v51[1] = 3221225472;
    v51[2] = __62__MPCPlayerChangeRequest_performWithExtendedStatusCompletion___block_invoke;
    v51[3] = &unk_24CAB5C28;
    v54 = v42;
    v32 = v30;
    v52 = v32;
    v55 = v7;
    v33 = v28;
    v53 = v33;
    objc_msgSend(v31, "blockOperationWithBlock:", v51);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    obj = v45->_commands;
    v35 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
    if (v35)
    {
      v36 = v35;
      v37 = 0;
      v38 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v36; ++i)
        {
          if (*(_QWORD *)v48 != v38)
            objc_enumerationMutation(obj);
          v40 = -[MPCMediaRemoteCommandOperation initWithCommandRequest:options:sendDate:]([MPCMediaRemoteCommandOperation alloc], "initWithCommandRequest:options:sendDate:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i), -[MPCPlayerChangeRequest options](v45, "options"), v46);
          objc_msgSend(v32, "addObject:", v40);
          objc_msgSend(v34, "addDependency:", v40);
          if ((v44 & 0x100) == 0)
          {
            if (v37)
              -[MPCMediaRemoteCommandOperation addDependency:](v40, "addDependency:", v37);
            v41 = v40;

            v37 = v41;
          }
          objc_msgSend(v33, "addOperation:", v40);

        }
        v36 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
      }
      while (v36);
    }
    else
    {
      v37 = 0;
    }

    objc_msgSend(v33, "addOperation:", v34);
    v5 = v42;
    goto LABEL_44;
  }
  v22 = [MPCPlayerCommandStatus alloc];
  v23 = (void *)MEMORY[0x24BDDCB80];
  objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlayerRequestError"), 1002, CFSTR("No commands provided."));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "statusWithCode:error:", 200, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = -[MPCPlayerCommandStatus initWithMPStatus:request:](v22, "initWithMPStatus:request:", v25, 0);

  v26 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v64 = v46;
    _os_log_impl(&dword_210BD8000, v26, OS_LOG_TYPE_ERROR, "[PCR] performWithExtendedStatusCompletion: | failed to perform command [no commands provided] status=%{public}@", buf, 0xCu);
  }

  if (v5)
  {
    v62 = v46;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v62, 1);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))v5 + 2))(v5, v13);
LABEL_44:

  }
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (NSArray)commands
{
  return self->_commands;
}

- (void)setCommands:(id)a3
{
  objc_storeStrong((id *)&self->_commands, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commands, 0);
}

void __62__MPCPlayerChangeRequest_performWithExtendedStatusCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  uint8_t buf[16];

  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "msv_map:", &__block_literal_global_34);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  v3 = os_log_create("com.apple.amp.mediaplaybackcore", "MediaRemote");
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 56);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v4, OS_SIGNPOST_INTERVAL_END, v5, "PlayerChangeRequest", ", buf, 2u);
  }

  dispatch_get_global_queue(17, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__MPCPlayerChangeRequest_performWithExtendedStatusCompletion___block_invoke_35;
  block[3] = &unk_24CABA2D0;
  v8 = *(id *)(a1 + 40);
  dispatch_async(v6, block);

}

uint64_t __62__MPCPlayerChangeRequest_performWithExtendedStatusCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "status");
}

void __48__MPCPlayerChangeRequest_performWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(a2, "msv_firstWhere:", &__block_literal_global_6721);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

BOOL __48__MPCPlayerChangeRequest_performWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

+ (void)performRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __52__MPCPlayerChangeRequest_performRequest_completion___block_invoke;
  v8[3] = &unk_24CAB3BE0;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a1, "performRequest:options:extendedStatusCompletion:", a3, 0, v8);

}

+ (void)performRequest:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __60__MPCPlayerChangeRequest_performRequest_options_completion___block_invoke;
  v10[3] = &unk_24CAB3BE0;
  v11 = v8;
  v9 = v8;
  objc_msgSend(a1, "performRequest:options:extendedStatusCompletion:", a3, a4, v10);

}

+ (void)performRequest:(id)a3 extendedStatusCompletion:(id)a4
{
  objc_msgSend(a1, "performRequest:options:extendedStatusCompletion:", a3, 0, a4);
}

+ (void)performRequest:(id)a3 options:(unint64_t)a4 extendedStatusCompletion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  if (v8)
  {
    v15[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "requestWithCommandRequests:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "requestWithCommandRequests:", MEMORY[0x24BDBD1A8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v11, "setOptions:", a4);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __74__MPCPlayerChangeRequest_performRequest_options_extendedStatusCompletion___block_invoke;
  v13[3] = &unk_24CAB9910;
  v14 = v9;
  v12 = v9;
  objc_msgSend(v11, "performWithExtendedStatusCompletion:", v13);

}

+ (id)requestWithCommandRequests:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCommandRequests:", v4);

  return v5;
}

void __74__MPCPlayerChangeRequest_performRequest_options_extendedStatusCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "firstObject");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __60__MPCPlayerChangeRequest_performRequest_options_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "error");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __52__MPCPlayerChangeRequest_performRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "error");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

@end
