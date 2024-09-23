@implementation LSContainerAddWithNode

void ___LSContainerAddWithNode_block_invoke(uint64_t a1)
{
  void *v2;
  _BOOL4 v3;
  id v4;
  BOOL v5;
  id v6;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  _BOOL4 v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  int v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  __int128 v37;
  void *v38;
  id v39;
  uint64_t v40;
  id v41;
  id v42;
  id v43;
  __int16 v44;
  void *v45;
  id v46;
  _QWORD v47[4];
  id v48;
  _BYTE buf[24];
  void *v50;
  id v51;
  id v52;
  id v53;
  __int128 v54;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v45 = 0;
  v46 = 0;
  v44 = 0;
  v2 = *(void **)(a1 + 32);
  v43 = 0;
  v3 = _LSCreateContainerNodesAndFlagsForNode(v2, &v46, &v45, &v44, &v43);
  v4 = v43;
  if (v46)
    v5 = v3;
  else
    v5 = 0;
  if (v5)
  {
    v42 = v4;
    objc_msgSend(v46, "bookmarkDataRelativeToNode:error:", 0, &v42);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v42;

    v3 = v38 != 0;
    v4 = v6;
  }
  else
  {
    v38 = 0;
  }
  if (!v3 || v45 == 0)
  {
    v8 = 0;
  }
  else
  {
    v41 = v4;
    objc_msgSend(v45, "bookmarkDataRelativeToNode:error:", 0, &v41);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v41;

    if (!v8)
    {
      _LSDefaultLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138478083;
        *(_QWORD *)&buf[4] = v11;
        *(_WORD *)&buf[12] = 2113;
        *(_QWORD *)&buf[14] = v45;
        _os_log_impl(&dword_182882000, v10, OS_LOG_TYPE_INFO, "_LSContainerAddWithNode(%{private}@, failed to get bookmarkData for diskImageNode %{private}@ but registering this container anyway.", buf, 0x16u);
      }

      v8 = 0;
    }
    v4 = v9;
  }
  v40 = 0;
  v12 = v46;
  if (v46)
    v13 = v3;
  else
    v13 = 0;
  if (v13)
  {
    v39 = v4;
    v14 = objc_msgSend(v46, "getVolumeIdentifier:error:", &v40, &v39);
    v36 = v39;

    if (v14)
    {
      v12 = v46;
      v15 = v40;
LABEL_26:
      v16 = v44;
      v17 = *(unsigned __int8 *)(a1 + 56);
      v37 = *(_OWORD *)(a1 + 40);
      v18 = v12;
      v19 = v38;
      v20 = v8;
      v35 = (id)v37;
      MEMORY[0x186DAF208](v35, v21, v22);
      v23 = MEMORY[0x1E0C809B0];
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = ___ZL15_LSContainerAddP9LSContextP6FSNodeP6NSDataS2_S4_tyhU13block_pointerFvjP7NSErrorE_block_invoke;
      v50 = &unk_1E1042590;
      v24 = v18;
      v56 = v16;
      v51 = v24;
      v55 = v15;
      v25 = v35;
      v54 = v37;
      v26 = v19;
      v52 = v26;
      v27 = v20;
      v53 = v27;
      v28 = MEMORY[0x186DAE9BC](buf);
      v29 = (void *)v28;
      if (v17)
      {
        (*(void (**)(uint64_t))(v28 + 16))(v28);
      }
      else
      {
        +[LSDBExecutionContext sharedServerInstance]();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v47[0] = v23;
        v47[1] = 3221225472;
        v47[2] = ___ZL15_LSContainerAddP9LSContextP6FSNodeP6NSDataS2_S4_tyhU13block_pointerFvjP7NSErrorE_block_invoke_30;
        v47[3] = &unk_1E1041740;
        v48 = v29;
        -[LSDBExecutionContext performAsyncWrite:]((uint64_t)v34, v47);

      }
      v4 = v36;
      goto LABEL_34;
    }
    v4 = v36;
  }
  else if (v3)
  {
    v15 = 0;
    v36 = v4;
    goto LABEL_26;
  }
  _LSDefaultLog();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    v31 = *(_QWORD *)(a1 + 32);
    v32 = *(unsigned __int8 *)(a1 + 56);
    *(_DWORD *)buf = 138478083;
    *(_QWORD *)&buf[4] = v31;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v32;
    _os_log_impl(&dword_182882000, v30, OS_LOG_TYPE_INFO, "_LSContainerAddWithNode(%{private}@ sync=%{BOOL}d) failed to add container.", buf, 0x12u);
  }

  v33 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_34:
  MEMORY[0x186DAF214](v33);

}

uint64_t ___LSContainerAddWithNode_block_invoke_18(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t ___LSContainerAddWithNode_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
