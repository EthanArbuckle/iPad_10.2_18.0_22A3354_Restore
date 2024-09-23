@implementation MRMediaRemotePlaybackSessionRequestSupportedType

uint64_t ___MRMediaRemotePlaybackSessionRequestSupportedType_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void ___MRMediaRemotePlaybackSessionRequestSupportedType_block_invoke_35(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(a2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void ___MRMediaRemotePlaybackSessionRequestSupportedType_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(a2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void ___MRMediaRemotePlaybackSessionRequestSupportedType_block_invoke_3(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void ___MRMediaRemotePlaybackSessionRequestSupportedType_block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void (*v7)(void);
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id ErrorWithDescription;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "airPlayReceivers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "containsObject:", v4);

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("resolvedSourcePlayerPath %@ is an airplay destination"), *(_QWORD *)(a1 + 32));
    ErrorWithDescription = (id)MRMediaRemoteCreateErrorWithDescription(155, (uint64_t)v6);

    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_5:
    v7();
    goto LABEL_6;
  }
  ErrorWithDescription = (id)MRPlaybackSessionMigrateCopySupportedTypeMatch(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  if (ErrorWithDescription)
  {
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    goto LABEL_5;
  }
  v8 = (void *)MRPlaybackSessionMigrateCopyCurrentTypes(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  v9 = (void *)MRPlaybackSessionMigrateCopySupportedTypes(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  if (v8)
  {
    v10 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (v9)
    {
      v11 = MRMediaRemoteCopyCommandDescription(133);
      v12 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("%@ options do not match. source=%@ currentType=%@ destination=%@ supportedTypes=%@"), v11, *(_QWORD *)(a1 + 32), v8, *(_QWORD *)(a1 + 40), v9, 0);
      v13 = 154;
    }
    else
    {
      v16 = *(_QWORD *)(a1 + 40);
      v11 = MRMediaRemoteCopyCommandDescription(133);
      v12 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("destination %@ does not support %@ (source currentTypes = %@)"), v16, v11, v8);
      v13 = 153;
    }
  }
  else
  {
    v14 = objc_alloc(MEMORY[0x1E0CB3940]);
    v15 = *(_QWORD *)(a1 + 32);
    v11 = MRMediaRemoteCopyCommandDescription(133);
    v12 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("source %@ does not support %@ (destination supportedTypes = %@)"), v15, v11, v9);
    v13 = 152;
  }

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SupportedCommands do not allow migration because %@"), v12);
  v18 = (void *)MRMediaRemoteCreateErrorWithDescription(v13, (uint64_t)v17);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_6:

}

void __MRMediaRemotePlaybackSessionRequestSupportedType_block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = *(void **)(a1 + 40);
  if (v13)
  {
    v18 = v13;
    v14 = v9;
    v15 = v10;
    v16 = v11;
    v17 = v12;
    msv_dispatch_async_on_queue();

  }
}

uint64_t __MRMediaRemotePlaybackSessionRequestSupportedType_block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1[8] + 16))(a1[8], a1[4], a1[5], a1[6], a1[7]);
}

void __MRMediaRemotePlaybackSessionRequestSupportedType_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id Error;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *ErrorWithDescription;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;

  v5 = a2;
  if (objc_msgSend(v5, "isResolved"))
  {
    v6 = (void *)MRPlaybackSessionMigrateCopyCorrespondingPlayerPath(v5, *(void **)(a1 + 32));
    v7 = *(void **)(a1 + 40);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __MRMediaRemotePlaybackSessionRequestSupportedType_block_invoke_4;
    v16[3] = &unk_1E30C9228;
    v17 = v5;
    v18 = *(id *)(a1 + 40);
    v8 = *(id *)(a1 + 56);
    v19 = v6;
    v20 = v8;
    v9 = v6;
    MRMediaRemoteNowPlayingResolvePlayerPath(v9, v7, v16);

  }
  else
  {
    if (a3)
      Error = a3;
    else
      Error = (id)MRMediaRemoteNowPlayingPlayerPathCreateError(v5);
    v11 = Error;
    v12 = *(_QWORD *)(a1 + 56);
    v13 = objc_msgSend(Error, "code");
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("sourcePlayerPath %@ was resolved to %@. Likely there is no now playing app?"), *(_QWORD *)(a1 + 48), v5);
    ErrorWithDescription = (void *)MRMediaRemoteCreateErrorWithDescription(v13, (uint64_t)v14);
    (*(void (**)(uint64_t, id, _QWORD, _QWORD, void *))(v12 + 16))(v12, v5, 0, 0, ErrorWithDescription);

  }
}

void __MRMediaRemotePlaybackSessionRequestSupportedType_block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id Error;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *ErrorWithDescription;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;

  v5 = a2;
  objc_msgSend(v5, "origin");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_4;
  v7 = (void *)v6;
  objc_msgSend(v5, "client");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = *(void **)(a1 + 32);
    v11 = *(void **)(a1 + 40);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __MRMediaRemotePlaybackSessionRequestSupportedType_block_invoke_5;
    v19[3] = &unk_1E30C9200;
    v22 = *(id *)(a1 + 56);
    v20 = *(id *)(a1 + 32);
    v21 = v5;
    _MRMediaRemotePlaybackSessionRequestSupportedType(v10, v21, v11, v19);

  }
  else
  {
LABEL_4:
    if (a3)
      Error = a3;
    else
      Error = (id)MRMediaRemoteNowPlayingPlayerPathCreateError(v5);
    v13 = Error;
    v14 = *(_QWORD *)(a1 + 56);
    v15 = *(_QWORD *)(a1 + 32);
    v16 = objc_msgSend(Error, "code");
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("destinationPlayerPath %@ was resolved to %@"), *(_QWORD *)(a1 + 48), v5);
    ErrorWithDescription = (void *)MRMediaRemoteCreateErrorWithDescription(v16, (uint64_t)v17);
    (*(void (**)(uint64_t, uint64_t, id, _QWORD, void *))(v14 + 16))(v14, v15, v5, 0, ErrorWithDescription);

  }
}

uint64_t __MRMediaRemotePlaybackSessionRequestSupportedType_block_invoke_5(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t, uint64_t))(a1[6] + 16))(a1[6], a1[4], a1[5], a2, a3);
}

@end
