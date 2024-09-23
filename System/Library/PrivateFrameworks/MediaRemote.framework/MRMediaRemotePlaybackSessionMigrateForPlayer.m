@implementation MRMediaRemotePlaybackSessionMigrateForPlayer

void ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  MRBlockGuard *v13;
  id v14;
  void *v15;
  void *v16;
  MRBlockGuard *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  MRBlockGuard *v22;
  _QWORD v23[4];
  MRBlockGuard *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v6, "startEvent:", CFSTR("endPlaybackSessionMigration"));
  v8 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_2;
  v26[3] = &unk_1E30C75E8;
  v27 = *(id *)(a1 + 32);
  v28 = v5;
  v9 = v5;
  v10 = (void *)MEMORY[0x194036C44](v26);
  objc_msgSend(*(id *)(a1 + 40), "origin");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isLocal"))
    v12 = 7.0;
  else
    v12 = 15.0;

  v13 = [MRBlockGuard alloc];
  v14 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "requestID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("endPlaybackSessionMigration<%@>"), v15);
  v17 = -[MRBlockGuard initWithTimeout:reason:handler:](v13, "initWithTimeout:reason:handler:", v16, v10, v12);

  objc_msgSend(*(id *)(a1 + 32), "playbackSessionRequest");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *(void **)(a1 + 40);
  v19 = *(void **)(a1 + 48);
  v23[0] = v8;
  v23[1] = 3221225472;
  v23[2] = ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_3;
  v23[3] = &unk_1E30C75E8;
  v24 = v17;
  v25 = v10;
  v21 = v10;
  v22 = v17;
  MRMediaRemoteSendPlaybackSessionMigrateEnd(v18, v7, v20, v19, v23);

}

void ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "endEvent:withError:", CFSTR("endPlaybackSessionMigration"), v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "disarm");
  if ((_DWORD)result)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return result;
}

void ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void (*v6)(uint64_t, id, _QWORD *);
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_5;
  v8[3] = &unk_1E30C6590;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v9 = v3;
  v10 = v5;
  v6 = *(void (**)(uint64_t, id, _QWORD *))(v4 + 16);
  v7 = v3;
  v6(v4, v7, v8);

}

uint64_t ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_5(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

void ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  MRBlockGuard *v9;
  id v10;
  void *v11;
  void *v12;
  MRBlockGuard *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  MRBlockGuard *v19;
  _QWORD v20[4];
  id v21;
  MRBlockGuard *v22;
  id v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  id v27;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "startEvent:", CFSTR("requestPlaybackSession"));
  v4 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_7;
  v25[3] = &unk_1E30C75E8;
  v26 = *(id *)(a1 + 32);
  v27 = v3;
  v5 = v3;
  v6 = (void *)MEMORY[0x194036C44](v25);
  objc_msgSend(*(id *)(a1 + 40), "origin");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isLocal"))
    v8 = 7.0;
  else
    v8 = 15.0;

  v9 = [MRBlockGuard alloc];
  v10 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "requestID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("requestPlaybackSession<%@>"), v11);
  v13 = -[MRBlockGuard initWithTimeout:reason:handler:](v9, "initWithTimeout:reason:handler:", v12, v6, v8);

  objc_msgSend(*(id *)(a1 + 32), "playbackSessionRequest");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v4;
  v20[1] = 3221225472;
  v20[2] = ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_8;
  v20[3] = &unk_1E30C92A0;
  v16 = *(void **)(a1 + 40);
  v15 = *(void **)(a1 + 48);
  v21 = *(id *)(a1 + 32);
  v22 = v13;
  v17 = *(_QWORD *)(a1 + 56);
  v23 = v6;
  v24 = v17;
  v18 = v6;
  v19 = v13;
  MRMediaRemotePlaybackSessionRequest(v14, v16, v15, v20);

}

void ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_7(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "endEvent:withError:", CFSTR("requestPlaybackSession"), v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_8(uint64_t a1, void *a2)
{
  id v4;

  v4 = (id)MRPlaybackSessionCopyPlaybackSessionData(a2);
  objc_msgSend(*(id *)(a1 + 32), "setPlaybackSessionSize:", objc_msgSend(v4, "length"));
  if (objc_msgSend(*(id *)(a1 + 40), "disarm"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  MRBlockGuard *v9;
  id v10;
  void *v11;
  void *v12;
  MRBlockGuard *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  MRBlockGuard *v18;
  _QWORD v19[4];
  MRBlockGuard *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "startEvent:", CFSTR("beginPlaybackSessionMigration"));
  v4 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_10;
  v22[3] = &unk_1E30C75E8;
  v23 = *(id *)(a1 + 32);
  v24 = v3;
  v5 = v3;
  v6 = (void *)MEMORY[0x194036C44](v22);
  objc_msgSend(*(id *)(a1 + 40), "origin");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isLocal"))
    v8 = 7.0;
  else
    v8 = 15.0;

  v9 = [MRBlockGuard alloc];
  v10 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "requestID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("beginPlaybackSessionMigration<%@>"), v11);
  v13 = -[MRBlockGuard initWithTimeout:reason:handler:](v9, "initWithTimeout:reason:handler:", v12, v6, v8);

  objc_msgSend(*(id *)(a1 + 32), "playbackSessionRequest");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *(void **)(a1 + 40);
  v15 = *(void **)(a1 + 48);
  v19[0] = v4;
  v19[1] = 3221225472;
  v19[2] = ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_11;
  v19[3] = &unk_1E30C75E8;
  v20 = v13;
  v21 = v6;
  v17 = v6;
  v18 = v13;
  MRMediaRemoteSendPlaybackSessionMigrateBegin(v14, v16, v15, v19);

}

void ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_10(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "endEvent:withError:", CFSTR("beginPlaybackSessionMigration"), v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_11(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "disarm");
  if ((_DWORD)result)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return result;
}

void ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_12(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  _QWORD v51[4];
  id v52;
  id v53;
  id v54;
  uint64_t v55;
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  id v60;
  uint64_t v61;
  _QWORD v62[4];
  int8x16_t v63;
  _QWORD v64[4];
  id v65;
  id v66;
  id v67;
  uint64_t v68;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v3 = MEMORY[0x1E0C809B0];
    v64[0] = MEMORY[0x1E0C809B0];
    v64[1] = 3221225472;
    v64[2] = ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_13;
    v64[3] = &unk_1E30C92C8;
    v65 = *(id *)(a1 + 32);
    v66 = *(id *)(a1 + 40);
    v4 = *(id *)(a1 + 48);
    v5 = *(_QWORD *)(a1 + 72);
    v67 = v4;
    v68 = v5;
    v6 = (void *)MEMORY[0x194036C44](v64);
    v62[0] = v3;
    v62[1] = 3221225472;
    v62[2] = ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_15;
    v62[3] = &unk_1E30C93B8;
    v63 = vextq_s8(*(int8x16_t *)(a1 + 72), *(int8x16_t *)(a1 + 72), 8uLL);
    v7 = (void *)MEMORY[0x194036C44](v62);
    v56[0] = v3;
    v56[1] = 3221225472;
    v56[2] = ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_20;
    v56[3] = &unk_1E30C9408;
    v57 = *(id *)(a1 + 32);
    v8 = v7;
    v60 = v8;
    v9 = *(id *)(a1 + 56);
    v10 = *(_QWORD *)(a1 + 88);
    v58 = v9;
    v61 = v10;
    v59 = *(id *)(a1 + 48);
    v11 = (void *)MEMORY[0x194036C44](v56);
    v51[0] = v3;
    v51[1] = 3221225472;
    v51[2] = ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_23;
    v51[3] = &unk_1E30C92C8;
    v52 = *(id *)(a1 + 32);
    v53 = *(id *)(a1 + 40);
    v12 = *(id *)(a1 + 48);
    v13 = *(_QWORD *)(a1 + 80);
    v54 = v12;
    v55 = v13;
    v14 = (void *)MEMORY[0x194036C44](v51);
    v47[0] = v3;
    v47[1] = 3221225472;
    v47[2] = ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_25;
    v47[3] = &unk_1E30C92F0;
    v48 = *(id *)(a1 + 32);
    v49 = *(id *)(a1 + 40);
    v50 = *(id *)(a1 + 48);
    v15 = (void *)MEMORY[0x194036C44](v47);
    v41[0] = v3;
    v41[1] = 3221225472;
    v41[2] = ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_27;
    v41[3] = &unk_1E30C94A8;
    v42 = *(id *)(a1 + 32);
    v43 = *(id *)(a1 + 40);
    v44 = *(id *)(a1 + 48);
    v16 = v15;
    v17 = *(_QWORD *)(a1 + 96);
    v45 = v16;
    v46 = v17;
    v18 = (void *)MEMORY[0x194036C44](v41);
    v35[0] = v3;
    v35[1] = 3221225472;
    v35[2] = ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_95;
    v35[3] = &unk_1E30C9520;
    v36 = *(id *)(a1 + 32);
    v39 = v8;
    v37 = *(id *)(a1 + 56);
    v38 = *(id *)(a1 + 48);
    v40 = v16;
    v19 = v16;
    v34 = v8;
    v20 = (void *)MEMORY[0x194036C44](v35);
    v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v22 = (void *)objc_msgSend(v6, "copy");
    v23 = (void *)MEMORY[0x194036C44]();
    objc_msgSend(v21, "addObject:", v23);

    v24 = (void *)objc_msgSend(v11, "copy");
    v25 = (void *)MEMORY[0x194036C44]();
    objc_msgSend(v21, "addObject:", v25);

    v26 = (void *)objc_msgSend(v6, "copy");
    v27 = (void *)MEMORY[0x194036C44]();
    objc_msgSend(v21, "addObject:", v27);

    v28 = (void *)objc_msgSend(v14, "copy");
    v29 = (void *)MEMORY[0x194036C44]();
    objc_msgSend(v21, "addObject:", v29);

    v30 = (void *)objc_msgSend(v18, "copy");
    v31 = (void *)MEMORY[0x194036C44]();
    objc_msgSend(v21, "addObject:", v31);

    v32 = (void *)objc_msgSend(v20, "copy");
    v33 = (void *)MEMORY[0x194036C44]();
    objc_msgSend(v21, "addObject:", v33);

    MRPerformAsyncOperationsUntilError(v21, *(void **)(a1 + 64));
  }
}

void ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_13(uint64_t a1, void *a2)
{
  id v3;
  MRPlaybackQueueRequest *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "startEvent:", CFSTR("getPlaybackQueue"));
  v4 = -[MRPlaybackQueueRequest initWithRange:]([MRPlaybackQueueRequest alloc], "initWithRange:", 0, 1);
  objc_msgSend(*(id *)(a1 + 32), "requestID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRPlaybackQueueRequest setRequestIdentifier:](v4, "setRequestIdentifier:", v5);

  -[MRPlaybackQueueRequest setIncludeMetadata:](v4, "setIncludeMetadata:", 1);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_14;
  v9[3] = &unk_1E30C9318;
  v6 = *(_QWORD *)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 40);
  v10 = *(id *)(a1 + 32);
  v11 = v3;
  v8 = v3;
  MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync(v4, v7, v6, v9);

}

uint64_t ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_14(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a2, "contentItemWithOffset:", 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(*(id *)(a1 + 32), "endEvent:withError:", CFSTR("getPlaybackQueue"), a3);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

id ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_15(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  unsigned int (**v8)(_QWORD);
  void *v9;
  int v10;
  int v11;
  id v12;
  uint64_t v13;
  unsigned int (**v14)(_QWORD);
  double CalculatedPlaybackPosition;
  id v16;
  uint64_t v17;
  unsigned int (**v18)(_QWORD);
  id v19;
  unsigned int (**v20)(_QWORD);
  void *v21;
  float v22;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  uint64_t v28;
  double v29;
  _QWORD v30[4];
  id v31;
  uint64_t v32;
  int v33;
  _QWORD v34[4];
  id v35;
  uint64_t v36;

  v3 = a2;
  v4 = (void *)objc_msgSend(v3, "copy");
  v5 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_16;
  v34[3] = &unk_1E30C9340;
  v6 = v3;
  v7 = *(_QWORD *)(a1 + 32);
  v35 = v6;
  v36 = v7;
  v8 = (unsigned int (**)(_QWORD))MEMORY[0x194036C44](v34);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "playbackRate");
  v11 = v10;

  v30[0] = v5;
  v30[1] = 3221225472;
  v30[2] = ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_17;
  v30[3] = &unk_1E30C9368;
  v12 = v6;
  v13 = *(_QWORD *)(a1 + 40);
  v31 = v12;
  v32 = v13;
  v33 = v11;
  v14 = (unsigned int (**)(_QWORD))MEMORY[0x194036C44](v30);
  CalculatedPlaybackPosition = MRContentItemGetCalculatedPlaybackPosition(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40)
                                                                                               + 8)
                                                                                   + 40));
  v26[0] = v5;
  v26[1] = 3221225472;
  v26[2] = ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_18;
  v26[3] = &unk_1E30C9390;
  v16 = v12;
  v17 = *(_QWORD *)(a1 + 40);
  v27 = v16;
  v28 = v17;
  v29 = CalculatedPlaybackPosition;
  v18 = (unsigned int (**)(_QWORD))MEMORY[0x194036C44](v26);
  v24[0] = v5;
  v24[1] = 3221225472;
  v24[2] = ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_19;
  v24[3] = &unk_1E30C82F8;
  v19 = v16;
  v25 = v19;
  v20 = (unsigned int (**)(_QWORD))MEMORY[0x194036C44](v24);
  objc_msgSend(v4, "setContentItem:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  if (v8[2](v8))
    objc_msgSend(v4, "setPlaybackState:", 1);
  if (v14[2](v14))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "metadata");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "playbackRate");
    objc_msgSend(v4, "setPlaybackRate:", v22);

  }
  if (v18[2](v18))
    objc_msgSend(v4, "setPlaybackPosition:", CalculatedPlaybackPosition);
  if (v20[2](v20))
    objc_msgSend(v4, "setAllowFadeTransition:", 1);

  return v4;
}

BOOL ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_16(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "playerOptions") & 4) != 0)
    return 1;
  if ((objc_msgSend(*(id *)(a1 + 32), "playerOptions") & 2) != 0)
    return MRMediaRemotePlaybackStateIsAdvancing(*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  return 0;
}

BOOL ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_17(uint64_t a1)
{
  void *v2;
  char v3;
  float v5;
  _BOOL4 v6;

  if ((objc_msgSend(*(id *)(a1 + 32), "playerOptions") & 0x20) == 0)
    return 0;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAlwaysLive");

  if ((v3 & 1) != 0)
    return 0;
  v5 = *(float *)(a1 + 48);
  v6 = fabsf(v5) >= 0.001;
  return fabsf(v5 + -1.0) >= 0.001 && v6;
}

BOOL ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_18(uint64_t a1)
{
  void *v2;
  char v3;

  if ((objc_msgSend(*(id *)(a1 + 32), "playerOptions") & 0x10) != 0
    && (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "metadata"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v3 = objc_msgSend(v2, "isAlwaysLive"),
        v2,
        (v3 & 1) == 0))
  {
    return fabs(*(double *)(a1 + 48)) >= 0.001;
  }
  else
  {
    return 0;
  }
}

unint64_t ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_19(uint64_t a1)
{
  return ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "playerOptions") >> 6) & 1;
}

void ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_20(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  MRBlockGuard *v10;
  id v11;
  void *v12;
  void *v13;
  MRBlockGuard *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  MRBlockGuard *v19;
  _QWORD v20[4];
  MRBlockGuard *v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "startEvent:", CFSTR("sendPlaybackSession"));
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlayerOptions:", 0);
  objc_msgSend(v4, "setEndpointOptions:", 0);
  v5 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_21;
  v24[3] = &unk_1E30C75E8;
  v25 = *(id *)(a1 + 32);
  v26 = v3;
  v6 = v3;
  v7 = (void *)MEMORY[0x194036C44](v24);
  objc_msgSend(*(id *)(a1 + 40), "origin");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isLocal"))
    v9 = 7.0;
  else
    v9 = 15.0;

  v10 = [MRBlockGuard alloc];
  v11 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "requestID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("sendPlaybackSession<%@>"), v12);
  v14 = -[MRBlockGuard initWithTimeout:reason:handler:](v10, "initWithTimeout:reason:handler:", v13, v7, v9);

  v15 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  v20[0] = v5;
  v20[1] = 3221225472;
  v20[2] = ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_22;
  v20[3] = &unk_1E30C93E0;
  v21 = v14;
  v17 = *(void **)(a1 + 40);
  v16 = *(void **)(a1 + 48);
  v22 = *(id *)(a1 + 32);
  v23 = v7;
  v18 = v7;
  v19 = v14;
  MRMediaRemoteSendPlaybackSession(v15, v4, v17, v16, v20);

}

void ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_21(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "endEvent:withError:", CFSTR("sendPlaybackSession"), v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_22(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "disarm"))
  {
    objc_msgSend(*(id *)(a1 + 40), "merge:", v6);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_23(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "startEvent:", CFSTR("getPlaybackState"));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_24;
  v7[3] = &unk_1E30C9430;
  v4 = *(void **)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 56);
  v5 = *(void **)(a1 + 40);
  v8 = *(id *)(a1 + 32);
  v9 = v3;
  v6 = v3;
  MRMediaRemoteGetPlaybackStateForPlayer(v5, v4, v7);

}

uint64_t ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_24(uint64_t a1, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  objc_msgSend(*(id *)(a1 + 32), "endEvent:", CFSTR("getPlaybackState"));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_25(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  MRPlayerPath *v10;
  void *v11;
  MRPlayerPath *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "playerOptions") & 8) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "startEvent:", CFSTR("pause"));
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(*(id *)(a1 + 32), "requestID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MRMediaRemotePlaybackSessionMigratePlayerOptionsCopyDescription(8);
    v8 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("migrationPlaybackSession<%@> for option %@"), v6, v7);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("kMRMediaRemoteOptionRemoteControlInterfaceIdentifier"));

    objc_msgSend(*(id *)(a1 + 32), "requestID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("kMRMediaRemoteOptionContextID"));

    v10 = [MRPlayerPath alloc];
    objc_msgSend(*(id *)(a1 + 40), "origin");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[MRPlayerPath initWithOrigin:client:player:](v10, "initWithOrigin:client:player:", v11, 0, 0);

    v13 = *(void **)(a1 + 48);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_26;
    v14[3] = &unk_1E30C9458;
    v15 = *(id *)(a1 + 32);
    v16 = v3;
    MRMediaRemoteSendCommandToPlayer(1, v4, v12, 0, v13, v14);

  }
  else
  {
    (*((void (**)(id, _QWORD))v3 + 2))(v3, 0);
  }

}

void ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_26(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  MRMediaRemoteErrorFromCommandStatuses(a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "endEvent:withError:", CFSTR("pause"), v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_27(uint64_t a1, void *a2)
{
  id v3;
  MRNowPlayingRequest *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  uint64_t v12;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "playerOptions") & 0x40) != 0
    && objc_msgSend(*(id *)(a1 + 32), "allowFadeTransition"))
  {
    objc_msgSend(*(id *)(a1 + 32), "startEvent:", CFSTR("fadeOutSource"));
    v4 = -[MRNowPlayingRequest initWithPlayerPath:]([MRNowPlayingRequest alloc], "initWithPlayerPath:", *(_QWORD *)(a1 + 40));
    v5 = *(_QWORD *)(a1 + 48);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_28;
    v8[3] = &unk_1E30C9480;
    v9 = *(id *)(a1 + 32);
    v10 = *(id *)(a1 + 56);
    v6 = v3;
    v7 = *(_QWORD *)(a1 + 64);
    v11 = v6;
    v12 = v7;
    -[MRNowPlayingRequest triggerAudioFadeOutForNowPlayingApplicationWithReplyQueue:completion:](v4, "triggerAudioFadeOutForNowPlayingApplicationWithReplyQueue:completion:", v5, v8);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_28(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void (*v7)(void);

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "endEvent:", CFSTR("fadeOutSource"));
  if (v5)
  {
    _MRLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_28_cold_1((uint64_t)v5, v6);

    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a2;
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v7();

}

void ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_95(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "startEvent:", CFSTR("coordinatePlayback"));
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_2_98;
  v10[3] = &unk_1E30C94F8;
  v11 = *(id *)(a1 + 32);
  v12 = v5;
  v13 = *(id *)(a1 + 48);
  v14 = *(id *)(a1 + 64);
  v15 = v3;
  v8 = v3;
  v9 = v5;
  MRMediaRemoteSendPlaybackSession(0, v4, v7, v6, v10);

}

void ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_2_98(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  dispatch_time_t v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "merge:", a2);
  objc_msgSend(*(id *)(a1 + 32), "endEvent:withError:", CFSTR("coordinatePlayback"), v5);
  if ((objc_msgSend(*(id *)(a1 + 32), "playerOptions") & 0x40) != 0
    && objc_msgSend(*(id *)(a1 + 32), "allowFadeTransition"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 40));
    v8 = v7;

    v9 = 0.0;
    if (1.0 - v8 >= 0.0)
      v9 = (1.0 - v8) * 1000000000.0;
    v10 = dispatch_time(0, (uint64_t)v9);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_3_99;
    block[3] = &unk_1E30C94D0;
    v11 = *(NSObject **)(a1 + 48);
    v14 = *(id *)(a1 + 56);
    v15 = *(id *)(a1 + 64);
    v13 = v5;
    dispatch_after(v10, v11, block);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

void ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_3_99(uint64_t a1)
{
  uint64_t v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_4_100;
  v3[3] = &unk_1E30C6590;
  v2 = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 32);
  (*(void (**)(uint64_t, _QWORD *))(v2 + 16))(v2, v3);

}

uint64_t ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_4_100(uint64_t a1, uint64_t a2)
{
  if (*(_QWORD *)(a1 + 32))
    a2 = *(_QWORD *)(a1 + 32);
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2);
}

void ___MRMediaRemotePlaybackSessionMigrateForPlayer_block_invoke_28_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_193827000, a2, OS_LOG_TYPE_ERROR, "[MRPlaybackSession] Fade out failed with error %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
