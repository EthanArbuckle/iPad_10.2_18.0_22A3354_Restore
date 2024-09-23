void sub_1D4CF97D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, os_activity_scope_state_s a9, char a10)
{
  os_activity_scope_leave(&a9);
  cut_arc_os_release();
  _Unwind_Resume(a1);
}

void sub_1D4CF98FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  cut_arc_os_release();
  _Unwind_Resume(a1);
}

void sub_1D4CF991C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  +[ENLog groupContext](ENLog, "groupContext");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      sub_1D4D05660();
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v5;
    _os_log_impl(&dword_1D4CF8000, v8, OS_LOG_TYPE_DEFAULT, "Loaded database -- Done {description: %{public}@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1D4CF9A7C;
  v12[3] = &unk_1E987B0F0;
  v10 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v10;
  v11 = v6;
  dispatch_async(v9, v12);

}

uint64_t sub_1D4CF9A7C(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_1D4CF9BBC(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1D4CF9C8C;
  v4[3] = &unk_1E987B140;
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 64);
  objc_msgSend(v5, "_participantsForCypher:completion:", v3, v4);

}

void sub_1D4CF9C8C(uint64_t a1, void *a2)
{
  id v3;
  _ENGroupInfo *v4;
  void *v5;
  ENGroup *v6;
  _ENGroupInfo *v7;

  v3 = a2;
  v4 = [_ENGroupInfo alloc];
  objc_msgSend(*(id *)(a1 + 32), "accountIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_ENGroupInfo initWithAccountIdentity:paricipants:sharedApplicationData:](v4, "initWithAccountIdentity:paricipants:sharedApplicationData:", v5, v3, *(_QWORD *)(a1 + 40));

  v6 = -[ENGroup initWithGroupInfo:groupID:cypher:]([ENGroup alloc], "initWithGroupInfo:groupID:cypher:", v7, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

void sub_1D4CF9E60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  cut_arc_os_release();
  _Unwind_Resume(a1);
}

void sub_1D4CF9E80(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD *v4;
  id v5;
  void *v6;
  int v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  +[ENCDGroup groupFromGroup:insertIntoManagedObjectContext:](ENCDGroup, "groupFromGroup:insertIntoManagedObjectContext:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v7 = objc_msgSend(v5, "save:", &v14);

  v8 = v14;
  +[ENLog groupContext](ENLog, "groupContext");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v16 = v6;
      _os_log_impl(&dword_1D4CF8000, v10, OS_LOG_TYPE_DEFAULT, "Saved group -- Done {group: %{public}@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    sub_1D4D056C0(v4, (uint64_t)v8, v10);
  }

  objc_msgSend(*(id *)(a1 + 40), "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1D4CFA01C;
  v12[3] = &unk_1E987B190;
  v13 = *(id *)(a1 + 48);
  dispatch_async(v11, v12);

}

uint64_t sub_1D4CFA01C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1D4CFA15C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  cut_arc_os_release();
  _Unwind_Resume(a1);
}

void sub_1D4CFA17C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  _QWORD block[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  uint8_t buf[4];
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[ENCDGroup fetchRequest](ENCDGroup, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENCDGroup predicateForGroupID:](ENCDGroup, "predicateForGroupID:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  +[ENLog groupContext](ENLog, "groupContext");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_1D4D05794(v4);

  v30 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v30);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v30;
  +[ENLog groupContext](ENLog, "groupContext");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = objc_msgSend(v7, "count");
    *(_DWORD *)buf = 134217984;
    v32 = v10;
    _os_log_impl(&dword_1D4CF8000, v9, OS_LOG_TYPE_INFO, "Fetched by groupIDs {cdGroups.count: %ld}", buf, 0xCu);
  }

  if (v7)
  {
    objc_msgSend(v7, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = *(void **)(a1 + 40);
      objc_msgSend(v11, "cypher");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "groupID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sharedApplicationData");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = sub_1D4CFA508;
      v28[3] = &unk_1E987B1E0;
      v17 = *(_QWORD *)(a1 + 48);
      v28[4] = *(_QWORD *)(a1 + 40);
      v29 = *(id *)(a1 + 56);
      objc_msgSend(v13, "_groupFromCypher:groupID:applicationData:context:completion:", v14, v15, v16, v17, v28);

      v18 = v29;
    }
    else
    {
      +[ENLog groupContext](ENLog, "groupContext");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v32 = v22;
        _os_log_impl(&dword_1D4CF8000, v21, OS_LOG_TYPE_DEFAULT, "Group not found -- Done {groupID: %{public}@}", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 40), "queue");
      v23 = objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = sub_1D4CFA564;
      v26[3] = &unk_1E987B190;
      v27 = *(id *)(a1 + 56);
      dispatch_async(v23, v26);

      v18 = v27;
    }

  }
  else
  {
    +[ENLog groupContext](ENLog, "groupContext");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      sub_1D4D05734();

    objc_msgSend(*(id *)(a1 + 40), "queue");
    v20 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1D4CFA574;
    block[3] = &unk_1E987B190;
    v25 = *(id *)(a1 + 56);
    dispatch_async(v20, block);

    v12 = v25;
  }

}

void sub_1D4CFA508(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t sub_1D4CFA564(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1D4CFA574(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1D4CFA6B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  cut_arc_os_release();
  _Unwind_Resume(a1);
}

void sub_1D4CFA6D8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  _QWORD block[4];
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[5];
  id v33;
  id v34;
  uint8_t buf[4];
  uint64_t v36;
  _QWORD v37[4];

  v37[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[ENCDGroup fetchRequest](ENCDGroup, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENCDGroup predicateForStableGroupID:](ENCDGroup, "predicateForStableGroupID:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  objc_msgSend(v4, "setFetchLimit:", 1);
  v6 = (void *)MEMORY[0x1E0CB3928];
  NSStringFromSelector(sel_groupIDGeneration);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortDescriptorWithKey:ascending:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSortDescriptors:", v9);

  +[ENLog groupContext](ENLog, "groupContext");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    sub_1D4D05794(v4);

  v34 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v34);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v34;
  +[ENLog groupContext](ENLog, "groupContext");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = objc_msgSend(v11, "count");
    *(_DWORD *)buf = 134217984;
    v36 = v14;
    _os_log_impl(&dword_1D4CF8000, v13, OS_LOG_TYPE_INFO, "Fetched by groupIDs {cdGroups.count: %ld}", buf, 0xCu);
  }

  if (v11)
  {
    objc_msgSend(v11, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v17 = *(void **)(a1 + 40);
      objc_msgSend(v15, "cypher");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "groupID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "sharedApplicationData");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = sub_1D4CFAADC;
      v32[3] = &unk_1E987B1E0;
      v21 = *(_QWORD *)(a1 + 48);
      v32[4] = *(_QWORD *)(a1 + 40);
      v33 = *(id *)(a1 + 56);
      objc_msgSend(v17, "_groupFromCypher:groupID:applicationData:context:completion:", v18, v19, v20, v21, v32);

      v22 = v33;
    }
    else
    {
      +[ENLog groupContext](ENLog, "groupContext");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v36 = v26;
        _os_log_impl(&dword_1D4CF8000, v25, OS_LOG_TYPE_DEFAULT, "Group not found -- Done {stableGroupID: %{public}@}", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 40), "queue");
      v27 = objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = sub_1D4CFABC0;
      v30[3] = &unk_1E987B190;
      v31 = *(id *)(a1 + 56);
      dispatch_async(v27, v30);

      v22 = v31;
    }

  }
  else
  {
    +[ENLog groupContext](ENLog, "groupContext");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      sub_1D4D05734();

    objc_msgSend(*(id *)(a1 + 40), "queue");
    v24 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1D4CFABD0;
    block[3] = &unk_1E987B190;
    v29 = *(id *)(a1 + 56);
    dispatch_async(v24, block);

    v16 = v29;
  }

}

void sub_1D4CFAADC(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  +[ENLog groupContext](ENLog, "groupContext");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138477827;
    v7 = v3;
    _os_log_impl(&dword_1D4CF8000, v5, OS_LOG_TYPE_INFO, "Group found -- Done {group: %{private}@}", (uint8_t *)&v6, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t sub_1D4CFABC0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1D4CFABD0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1D4CFACD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  cut_arc_os_release();
  _Unwind_Resume(a1);
}

void sub_1D4CFACF8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  uint8_t v26[128];
  uint8_t buf[4];
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[ENCDGroup fetchRequest](ENCDGroup, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFetchBatchSize:", 0);
  v25 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v25);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v25;
  +[ENLog groupContext](ENLog, "groupContext");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9 = objc_msgSend(v5, "count");
      *(_DWORD *)buf = 134217984;
      v28 = v9;
      _os_log_impl(&dword_1D4CF8000, v8, OS_LOG_TYPE_INFO, "Deleting fetched objects {count: %ld}", buf, 0xCu);
    }

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v10 = v5;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v22;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(v3, "deleteObject:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v14++));
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v12);
    }

    +[ENLog groupContext](ENLog, "groupContext");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D4CF8000, v15, OS_LOG_TYPE_INFO, "Saving", buf, 2u);
    }

    v20 = v6;
    v16 = objc_msgSend(v3, "save:", &v20);
    v17 = v20;

    +[ENLog groupContext](ENLog, "groupContext");
    v18 = objc_claimAutoreleasedReturnValue();
    v8 = v18;
    if (v16)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D4CF8000, v8, OS_LOG_TYPE_INFO, "Saved -- Done", buf, 2u);
      }
    }
    else if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      sub_1D4D0586C();
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      sub_1D4D0580C();
    v17 = v6;
  }

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v19 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v19, *(dispatch_block_t *)(a1 + 40));

}

void sub_1D4CFB170(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, os_activity_scope_state_s state, char a17)
{
  os_activity_scope_leave(&state);
  cut_arc_os_release();
  _Unwind_Resume(a1);
}

void sub_1D4CFB1A0(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  int v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id v27;
  uint8_t v28[128];
  uint8_t buf[4];
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[ENCDGroup fetchRequest](ENCDGroup, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFetchBatchSize:", 0);
  objc_msgSend(a1[4], "stableGroupID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENCDGroup predicateForStableGroupID:](ENCDGroup, "predicateForStableGroupID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v6);

  v27 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v27);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v27;
  +[ENLog groupContext](ENLog, "groupContext");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = objc_msgSend(v7, "count");
      *(_DWORD *)buf = 134217984;
      v30 = v11;
      _os_log_impl(&dword_1D4CF8000, v10, OS_LOG_TYPE_INFO, "Deleting fetched objects {count: %ld}", buf, 0xCu);
    }

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v12 = v7;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v24;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(v3, "deleteObject:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v16++));
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v14);
    }

    +[ENLog groupContext](ENLog, "groupContext");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D4CF8000, v17, OS_LOG_TYPE_INFO, "Saving", buf, 2u);
    }

    v22 = v8;
    v18 = objc_msgSend(v3, "save:", &v22);
    v19 = v22;

    +[ENLog groupContext](ENLog, "groupContext");
    v20 = objc_claimAutoreleasedReturnValue();
    v10 = v20;
    if (v18)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D4CF8000, v10, OS_LOG_TYPE_INFO, "Saved -- Done", buf, 2u);
      }
    }
    else if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      sub_1D4D0586C();
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      sub_1D4D0580C();
    v19 = v8;
  }

  objc_msgSend(a1[5], "queue");
  v21 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v21, a1[6]);

}

void sub_1D4CFB5BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  cut_arc_os_release();
  _Unwind_Resume(a1);
}

void sub_1D4CFB5DC(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  id obj;
  void *v31;
  _QWORD block[4];
  id v33;
  id v34;
  _QWORD v35[5];
  id v36;
  NSObject *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  id v43;
  NSObject *v44;
  id v45;
  uint8_t v46[128];
  uint8_t buf[4];
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[ENCDGroup fetchRequest](ENCDGroup, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v45);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v45;
  +[ENLog groupContext](ENLog, "groupContext");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    v26 = v6;
    v29 = v3;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9 = objc_msgSend(0, "count");
      *(_DWORD *)buf = 134217984;
      v48 = v9;
      _os_log_impl(&dword_1D4CF8000, v8, OS_LOG_TYPE_INFO, "Fetch finished {result.count: %ld}", buf, 0xCu);
    }
    v28 = v4;

    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(0, "count"));
    v10 = dispatch_group_create();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v27 = v5;
    obj = v5;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v39;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v39 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v14);
          dispatch_group_enter(v10);
          v16 = *(void **)(a1 + 32);
          objc_msgSend(v15, "cypher");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "groupID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "sharedApplicationData");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v35[0] = MEMORY[0x1E0C809B0];
          v35[1] = 3221225472;
          v35[2] = sub_1D4CFB9BC;
          v35[3] = &unk_1E987B258;
          v20 = *(_QWORD *)(a1 + 40);
          v35[4] = *(_QWORD *)(a1 + 32);
          v36 = v31;
          v37 = v10;
          objc_msgSend(v16, "_groupFromCypher:groupID:applicationData:context:completion:", v17, v18, v19, v20, v35);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
      }
      while (v12);
    }

    objc_msgSend(*(id *)(a1 + 32), "queue");
    v21 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1D4CFBA18;
    block[3] = &unk_1E987B0F0;
    v22 = *(id *)(a1 + 48);
    v33 = v31;
    v34 = v22;
    v23 = v31;
    dispatch_group_notify(v10, v21, block);

    v4 = v28;
    v3 = v29;
    v6 = v26;
    v5 = v27;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      sub_1D4D058CC();

    objc_msgSend(*(id *)(a1 + 32), "queue");
    v24 = objc_claimAutoreleasedReturnValue();
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = sub_1D4CFB9AC;
    v42[3] = &unk_1E987B0F0;
    v25 = *(id *)(a1 + 48);
    v43 = 0;
    v44 = v25;
    dispatch_async(v24, v42);

    v10 = v44;
  }

}

uint64_t sub_1D4CFB9AC(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_1D4CFB9BC(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  NSObject *v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t sub_1D4CFBA18(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_1D4CFBA80(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x16u);
}

void sub_1D4CFBA94(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_1D4CFBAD0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t sub_1D4CFBB5C(uint64_t a1)
{
  return objc_msgSend((id)qword_1EFEC8F88, "addObject:", *(_QWORD *)(a1 + 32));
}

void sub_1D4CFBC2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1D4CFBC44(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1D4CFBC54(uint64_t a1)
{

}

void sub_1D4CFBC5C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend((id)qword_1EFEC8F88, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void sub_1D4CFBCD4()
{
  dispatch_queue_t v0;
  void *v1;
  id v2;
  void *v3;

  v0 = dispatch_queue_create("com.apple.Engram.ENKey", MEMORY[0x1E0C80D50]);
  v1 = (void *)qword_1EFEC8F98;
  qword_1EFEC8F98 = (uint64_t)v0;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v3 = (void *)qword_1EFEC8F88;
  qword_1EFEC8F88 = (uint64_t)v2;

}

void sub_1D4CFDD0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  cut_arc_os_release();
  _Unwind_Resume(a1);
}

void sub_1D4CFDD3C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(v3, "currentItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1D4CFDDEC;
  v9[3] = &unk_1E987B258;
  v9[4] = v6;
  v10 = v4;
  v11 = v3;
  v7 = v3;
  v8 = v4;
  objc_msgSend(v8, "groupContext:latestCachedGroupWithStableID:completion:", v6, v5, v9);

}

void sub_1D4CFDDEC(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  +[ENLog groupContext](ENLog, "groupContext");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v6)
    {
      v7 = *(_QWORD *)(a1 + 40);
      v9 = 138543618;
      v10 = v3;
      v11 = 2114;
      v12 = v7;
      _os_log_impl(&dword_1D4CF8000, v5, OS_LOG_TYPE_INFO, "Found cached group -- Done {group: %{public}@, ware: %{public}@}", (uint8_t *)&v9, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 48), "stopWithResult:", v3);
  }
  else
  {
    if (v6)
    {
      v8 = *(void **)(a1 + 40);
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_1D4CF8000, v5, OS_LOG_TYPE_INFO, "Did not find group -- Continue {ware: %{public}@", (uint8_t *)&v9, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 48), "continueWithResult:", 0);
  }

}

void sub_1D4CFDF30(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "state");
  if (v4 == 1)
  {
    +[ENLog groupContext](ENLog, "groupContext");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "error");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v12;
      _os_log_impl(&dword_1D4CF8000, v11, OS_LOG_TYPE_DEFAULT, "Error featching group -- Fail {error: %{public}@", buf, 0xCu);

    }
    v13 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v13 + 16))(v13, 0, v10);
    goto LABEL_10;
  }
  if (!v4)
  {
    objc_msgSend(v3, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    +[ENLog groupContext](ENLog, "groupContext");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v3, "value");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v18 = v8;
        _os_log_impl(&dword_1D4CF8000, v7, OS_LOG_TYPE_INFO, "Found group -- Done {group: %{public}@}", buf, 0xCu);

      }
      v9 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v3, "value");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v9 + 16))(v9, v10, 0);
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D4CF8000, v7, OS_LOG_TYPE_DEFAULT, "Group not found -- Done", buf, 2u);
      }

      if (*(_QWORD *)(a1 + 32))
      {
        v16 = *(_QWORD *)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = (void *)MEMORY[0x1E0C9AA60];
      }
      v14 = *(_QWORD *)(a1 + 40);
      +[ENGroupContext _errorWithNotFoundItems:](ENGroupContext, "_errorWithNotFoundItems:", v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v14 + 16))(v14, 0, v15);

    }
LABEL_10:

  }
}

void sub_1D4CFE350(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, os_activity_scope_state_s state, char a17)
{
  os_activity_scope_leave(&state);
  cut_arc_os_release();
  _Unwind_Resume(a1);
}

void sub_1D4CFE380(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v5 = a3;
  v7 = *(void **)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  if (!a2 || v5)
  {
    objc_msgSend(v6, "groupID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1D4CFE778;
    v10[3] = &unk_1E987B3E8;
    v11 = v5;
    v12 = *(id *)(a1 + 48);
    objc_msgSend(v7, "_fetchGroupWithGroupID:skipCache:completion:", v9, 1, v10);

    v8 = v11;
  }
  else
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = sub_1D4CFE4B0;
    v13[3] = &unk_1E987B3C0;
    v13[4] = v7;
    v14 = v6;
    v15 = *(id *)(a1 + 48);
    objc_msgSend(v7, "_validateCachedGroup:isParentOfGroup:completion:", a2, v14, v13);

    v8 = v14;
  }

}

void sub_1D4CFE4B0(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  id *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v4 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  if (a2)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1D4CFE5B4;
    v10[3] = &unk_1E987B370;
    v5 = &v11;
    v6 = v3;
    v11 = v6;
    v12 = *(id *)(a1 + 48);
    objc_msgSend(v4, "_cacheGroup:completion:", v6, v10);
    v7 = v12;
  }
  else
  {
    objc_msgSend(v3, "groupID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1D4CFE690;
    v8[3] = &unk_1E987B398;
    v5 = &v9;
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v4, "_fetchGroupWithGroupID:skipCache:completion:", v7, 1, v8);
  }

}

void sub_1D4CFE5B4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[ENLog groupContext](ENLog, "groupContext");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543619;
    v7 = v3;
    v8 = 2113;
    v9 = v5;
    _os_log_impl(&dword_1D4CF8000, v4, OS_LOG_TYPE_DEFAULT, "Cached Incoming Group {error: %{public}@, group: %{private}@}", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_1D4CFE690(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  +[ENLog groupContext](ENLog, "groupContext");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543619;
    v9 = v6;
    v10 = 2113;
    v11 = v5;
    _os_log_impl(&dword_1D4CF8000, v7, OS_LOG_TYPE_DEFAULT, "Failed to validate Incoming Group, fetched from server instead {error: %{public}@, group: %{private}@}", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1D4CFE778(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  +[ENLog groupContext](ENLog, "groupContext");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 138543619;
    v10 = v8;
    v11 = 2113;
    v12 = v5;
    _os_log_impl(&dword_1D4CF8000, v7, OS_LOG_TYPE_DEFAULT, "Failed to fetch cached group, fetched from server instead {error: %{public}@, group: %{private}@}", (uint8_t *)&v9, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_1D4CFEEB0(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  objc_msgSend(v3, "currentItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1D4CFEF4C;
  v7[3] = &unk_1E987B438;
  v7[4] = v5;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v4, "groupContext:fetchAllKnownGroups:", v5, v7);

}

void sub_1D4CFEF4C(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(*(id *)(a1 + 40), "currentResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v4);

  v7 = *(void **)(a1 + 40);
  objc_msgSend(v7, "currentResult");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "continueWithResult:", v8);

}

void sub_1D4CFEFE0(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v3 = objc_msgSend(v7, "state");
  if (v3 == 1)
  {
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v7, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v5);
    goto LABEL_5;
  }
  if (!v3)
  {
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v7, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v4 + 16))(v4, v5, 0);
LABEL_5:

  }
}

void sub_1D4CFF184(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  objc_msgSend(v3, "currentItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1D4CFF220;
  v7[3] = &unk_1E987B4B0;
  v7[4] = v5;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v4, "deleteAllKnownGroupsForGroupContext:completion:", v5, v7);

}

uint64_t sub_1D4CFF220(uint64_t a1)
{
  NSObject *v2;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  return objc_msgSend(*(id *)(a1 + 40), "continueWithResult:", &stru_1E987B990);
}

uint64_t sub_1D4CFF260(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1D4CFF3A0(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v3 = a2;
  objc_msgSend(v3, "currentItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1D4CFF440;
  v8[3] = &unk_1E987B4B0;
  v8[4] = v6;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v4, "deleteCachedValueForForGroupContext:withGroupID:completion:", v6, v5, v8);

}

uint64_t sub_1D4CFF440(uint64_t a1)
{
  NSObject *v2;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  return objc_msgSend(*(id *)(a1 + 40), "continueWithResult:", &stru_1E987B990);
}

uint64_t sub_1D4CFF480(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1D4CFF554(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  NSObject *v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v8 = a2;
  objc_msgSend(v5, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_1D4CFF75C(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  NSObject *v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v8 = a2;
  objc_msgSend(v5, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_1D4CFFA60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  cut_arc_os_release();
  _Unwind_Resume(a1);
}

void sub_1D4CFFA98(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[5];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_1D4CFFB10;
  v3[3] = &unk_1E987B3E8;
  v3[4] = v1;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "_qFetchDataSourceGroupWithGroupID:completion:", v2, v3);

}

void sub_1D4CFFB10(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a2;
  v7 = a3;
  if (v5)
  {
    v8 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1D4CFFBDC;
    v9[3] = &unk_1E987B500;
    v10 = v5;
    v11 = v7;
    objc_msgSend(v8, "_cacheGroup:completion:", v10, v9);

  }
  (*(void (**)(_QWORD, id, id, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v5, v7, v6);

}

void sub_1D4CFFBDC(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  +[ENLog groupContext](ENLog, "groupContext");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 138412546;
    v6 = v3;
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_1D4CF8000, v2, OS_LOG_TYPE_INFO, "Finished caching group {group: %@, error: %@}", (uint8_t *)&v5, 0x16u);
  }

}

void sub_1D4CFFC94(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  +[ENLog groupContext](ENLog, "groupContext");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D4CF8000, v6, OS_LOG_TYPE_INFO, "Found cached group", buf, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D4CF8000, v6, OS_LOG_TYPE_DEFAULT, "Group not cached", v7, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void sub_1D4CFFE54(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_1D4D000F4(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  NSObject *v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v4, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_1D4D003C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a32, 8);
  _Unwind_Resume(a1);
}

void sub_1D4D003E8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "currentItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENLog groupContext](ENLog, "groupContext");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v12 = v4;
    _os_log_impl(&dword_1D4CF8000, v5, OS_LOG_TYPE_INFO, "Caching {cache: %{public}@}", buf, 0xCu);
  }

  v7 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1D4D0050C;
  v9[3] = &unk_1E987B4B0;
  v9[4] = v7;
  v10 = v3;
  v8 = v3;
  objc_msgSend(v4, "groupContext:cacheGroup:completion:", v7, v6, v9);

}

uint64_t sub_1D4D0050C(uint64_t a1)
{
  NSObject *v2;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  return objc_msgSend(*(id *)(a1 + 40), "continueWithResult:", &stru_1E987B990);
}

uint64_t sub_1D4D0054C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1D4D0055C(uint64_t a1)
{

}

void sub_1D4D00564(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v15 = 0;
  objc_msgSend(v3, "groupID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "groupID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v6 = objc_msgSend(v4, "compare:withResult:error:", v5, &v15, &v14);
  v7 = v14;

  if (v6)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v15 == -1;
  }
  else
  {
    +[ENLog groupContext](ENLog, "groupContext");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "groupID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "groupID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v17 = v7;
      v18 = 2114;
      v19 = v9;
      v20 = 2114;
      v21 = v10;
      _os_log_impl(&dword_1D4CF8000, v8, OS_LOG_TYPE_DEFAULT, "Failed to compare groupIDs {error: %{public}@, lastestGroup.groupID: %{public}@, group.groupID: %{public}@}", buf, 0x20u);

    }
  }
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v3;
  v13 = v3;

}

void sub_1D4D006F4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint8_t v9[16];

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  +[ENLog groupContext](ENLog, "groupContext");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1D4CF8000, v5, OS_LOG_TYPE_INFO, "Finished caching", v9, 2u);
  }

  v6 = objc_msgSend(v3, "state");
  if (v6 == 1)
  {
    v7 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v3, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

  }
  else if (!v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "_qDidCacheGroup:", *(_QWORD *)(a1 + 40));
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      objc_msgSend(*(id *)(a1 + 32), "_qDidUpdateGroup:withGroup:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(a1 + 40));
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t sub_1D4D0088C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  v7 = objc_msgSend(a2, "middlewareCacheCostForContext:", v5);
  v8 = objc_msgSend(v6, "middlewareCacheCostForContext:", *(_QWORD *)(a1 + 32));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "compare:", v10);

  return v11;
}

void sub_1D4D00F3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, os_activity_scope_state_s state, char a17)
{
  os_activity_scope_leave(&state);
  cut_arc_os_release();
  _Unwind_Resume(a1);
}

void sub_1D4D00F84(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  BOOL v9;
  BOOL v10;
  NSObject *v11;
  void (*v12)(void);
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend(v6, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("ENGroupContextErrorDomain")))
    v9 = objc_msgSend(v6, "code") == -2100;
  else
    v9 = 0;

  if (v6)
  {
    if (v5)
      v10 = v9;
    else
      v10 = 0;
    if (!v10)
    {
LABEL_9:
      +[ENLog groupContext](ENLog, "groupContext");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        sub_1D4D059A0((uint64_t)v5, (uint64_t)v6, v11);

      v12 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
      goto LABEL_20;
    }
  }
  else if (!v5)
  {
    goto LABEL_9;
  }
  +[ENLog groupContext](ENLog, "groupContext");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v16 = 138477827;
    v17 = v5;
    _os_log_impl(&dword_1D4CF8000, v13, OS_LOG_TYPE_INFO, "Created group {group: %{private}@}", (uint8_t *)&v16, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_qDidCreateGroup:", v5);
  v14 = *(_QWORD *)(a1 + 40);
  if (v14)
    objc_msgSend(*(id *)(a1 + 32), "_qDidUpdateGroup:withGroup:", v14, v5);
  +[ENLog groupContext](ENLog, "groupContext");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_1D4CF8000, v15, OS_LOG_TYPE_INFO, "Caching new group", (uint8_t *)&v16, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_cacheGroup:completion:", v5, &unk_1E987B068);
  v12 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_20:
  v12();

}

void sub_1D4D011A8(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  +[ENLog groupContext](ENLog, "groupContext");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1D4CF8000, v3, OS_LOG_TYPE_INFO, "Finished caching {error: %@}", (uint8_t *)&v4, 0xCu);
  }

}

void sub_1D4D013B8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(v3, "currentItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1D4D01468;
  v9[3] = &unk_1E987B258;
  v9[4] = v6;
  v10 = v4;
  v11 = v3;
  v7 = v3;
  v8 = v4;
  objc_msgSend(v8, "groupContext:cachedGroupWithID:completion:", v6, v5, v9);

}

void sub_1D4D01468(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  +[ENLog groupContext](ENLog, "groupContext");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v6)
    {
      v7 = *(_QWORD *)(a1 + 40);
      v11 = 138543618;
      v12 = v3;
      v13 = 2114;
      v14 = v7;
      _os_log_impl(&dword_1D4CF8000, v5, OS_LOG_TYPE_INFO, "Found cached group -- Done {group: %{public}@, ware: %{public}@}", (uint8_t *)&v11, 0x16u);
    }

    v8 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 48), "visitedItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_qCacheGroup:toMiddlewares:completion:", v3, v9, &unk_1E987B680);

    objc_msgSend(*(id *)(a1 + 48), "stopWithResult:", v3);
  }
  else
  {
    if (v6)
    {
      v10 = *(void **)(a1 + 40);
      v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_1D4CF8000, v5, OS_LOG_TYPE_INFO, "Did not find group -- Continue {ware: %{public}@", (uint8_t *)&v11, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 48), "continueWithResult:", 0);
  }

}

void sub_1D4D015E0(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = objc_msgSend(v6, "state");
  if (v3 == 1)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else if (!v3)
  {
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v6, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
}

void sub_1D4D01770(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (v6)
  {
    +[ENLog groupContext](ENLog, "groupContext");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      sub_1D4D05A24((uint64_t)v6, v8);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_1D4D027D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,os_activity_scope_state_s state,char a24)
{
  os_activity_scope_leave(&state);
  cut_arc_os_release();
  _Unwind_Resume(a1);
}

void sub_1D4D02B28()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ENLog", "groupContext");
  v1 = (void *)qword_1EFEC8FA0;
  qword_1EFEC8FA0 = (uint64_t)v0;

}

void sub_1D4D02B98()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ENLog", "groupContextCache");
  v1 = (void *)qword_1EFEC8FB0;
  qword_1EFEC8FB0 = (uint64_t)v0;

}

void sub_1D4D02C08()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ENLog", "groupContextDataSource");
  v1 = (void *)qword_1EFEC8FC0;
  qword_1EFEC8FC0 = (uint64_t)v0;

}

void sub_1D4D02C78()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ENLog", "utilities");
  v1 = (void *)qword_1EFEC8FD0;
  qword_1EFEC8FD0 = (uint64_t)v0;

}

void sub_1D4D02CE8()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ENLog", "groupID");
  v1 = (void *)qword_1EFEC8FE0;
  qword_1EFEC8FE0 = (uint64_t)v0;

}

void sub_1D4D02DE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

unint64_t sub_1D4D02DF8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  NSObject *v11;
  unint64_t v12;
  id v14;
  unint64_t v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v15 = 0xAAAAAAAAAAAAAAAALL;
  objc_msgSend(v5, "groupID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "groupID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v9 = objc_msgSend(v7, "compare:withResult:error:", v8, &v15, &v14);
  v10 = v14;

  if ((v9 & 1) == 0)
  {
    +[ENLog groupContext](ENLog, "groupContext");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138478339;
      v17 = v5;
      v18 = 2113;
      v19 = v6;
      v20 = 2114;
      v21 = v10;
      _os_log_impl(&dword_1D4CF8000, v11, OS_LOG_TYPE_DEFAULT, "Failed to compare groups {group1: %{private}@, group2: %{private}@, error: %{public}@}", buf, 0x20u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
  v12 = v15;

  return v12;
}

void sub_1D4D03BB0(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[ENLog utilities](ENLog, "utilities");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1D4CF8000, v4, OS_LOG_TYPE_INFO, "Reduce -- Finished {result: %{public}@}", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_completeWithResult:", v3);
}

void sub_1D4D03FB4(uint64_t a1, void *a2)
{
  uint64_t v2;
  objc_class *v3;
  id v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = (objc_class *)MEMORY[0x1E0D13220];
  v4 = a2;
  v5 = (id)objc_msgSend([v3 alloc], "initWithError:", v4);

  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v5);
}

void sub_1D4D0401C(uint64_t a1, void *a2)
{
  uint64_t v2;
  objc_class *v3;
  id v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = (objc_class *)MEMORY[0x1E0D13220];
  v4 = a2;
  v5 = (id)objc_msgSend([v3 alloc], "initWithSuccess:", v4);

  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v5);
}

void sub_1D4D04084(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  objc_class *v6;
  id v7;
  id v8;

  v3 = (void *)a1[4];
  v4 = a1[5];
  v5 = a1[6];
  v6 = (objc_class *)MEMORY[0x1E0D13220];
  v7 = a2;
  v8 = (id)objc_msgSend([v6 alloc], "initWithSuccess:", v7);

  objc_msgSend(v3, "_reduceWithPending:visited:currentResult:completion:", v4, v5, v8, a1[7]);
}

uint64_t sub_1D4D04C94(uint64_t a1)
{
  return objc_msgSend((id)qword_1EFEC8FF0, "addObject:", *(_QWORD *)(a1 + 32));
}

void sub_1D4D04D64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1D4D04D7C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1D4D04D8C(uint64_t a1)
{

}

void sub_1D4D04D94(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend((id)qword_1EFEC8FF0, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void sub_1D4D04E0C()
{
  dispatch_queue_t v0;
  void *v1;
  id v2;
  void *v3;

  v0 = dispatch_queue_create("com.apple.Engram.ENCypher", MEMORY[0x1E0C80D50]);
  v1 = (void *)qword_1EFEC9000;
  qword_1EFEC9000 = (uint64_t)v0;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v3 = (void *)qword_1EFEC8FF0;
  qword_1EFEC8FF0 = (uint64_t)v2;

}

void sub_1D4D05660()
{
  uint64_t v0;
  os_log_t v1;

  sub_1D4CFBAAC();
  sub_1D4CFBA80(&dword_1D4CF8000, v0, v1, "Failed to load database -- Fail {description: %{public}@, error: %{public}@}");
  sub_1D4CFBAA4();
}

void sub_1D4D056C0(_QWORD *a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138478083;
  *(_QWORD *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  sub_1D4CFBA80(&dword_1D4CF8000, a2, a3, "Failed to save group -- Fail {group: %{private}@, error: %{public}@}", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  sub_1D4CFBAA4();
}

void sub_1D4D05734()
{
  uint64_t v0;
  os_log_t v1;

  sub_1D4CFBAAC();
  sub_1D4CFBA80(&dword_1D4CF8000, v0, v1, "Failed to fetch coredataGroups -- Fail {error: %{public}@, request: %{public}@}");
  sub_1D4CFBAA4();
}

void sub_1D4D05794(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "predicate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1D4CFBAC4();
  sub_1D4CFBAD0(&dword_1D4CF8000, v2, v3, "Fetching by groupIDs {predicate: %@}", v4, v5, v6, v7, v8);

  sub_1D4CFBAE4();
}

void sub_1D4D0580C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1D4CFBAC4();
  sub_1D4CFBA94(&dword_1D4CF8000, v0, v1, "Failed to fetch objects to delete {error: %{public}@", v2, v3, v4, v5, v6);
  sub_1D4CFBAA4();
}

void sub_1D4D0586C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1D4CFBAC4();
  sub_1D4CFBA94(&dword_1D4CF8000, v0, v1, "Failed to save Context {error: %{public}@}", v2, v3, v4, v5, v6);
  sub_1D4CFBAA4();
}

void sub_1D4D058CC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1D4CFBAC4();
  sub_1D4CFBA94(&dword_1D4CF8000, v0, v1, "Failed to fetch {error: %{public}@", v2, v3, v4, v5, v6);
  sub_1D4CFBAA4();
}

void sub_1D4D0592C(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1D4CF8000, a2, OS_LOG_TYPE_ERROR, "ENGroupID initWithDataRepresentation - wrong data size -- Failed {data: %{public}@}", (uint8_t *)&v2, 0xCu);
}

void sub_1D4D059A0(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138478083;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_fault_impl(&dword_1D4CF8000, log, OS_LOG_TYPE_FAULT, "Failed to create group {groupInfo: %{private}@, error: %{public}@}", (uint8_t *)&v3, 0x16u);
}

void sub_1D4D05A24(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_fault_impl(&dword_1D4CF8000, a2, OS_LOG_TYPE_FAULT, "Failed to get group {error: %{public}@}", (uint8_t *)&v2, 0xCu);
}

void sub_1D4D05A98(uint64_t *a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = *a1;
  objc_msgSend(a2, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_fault_impl(&dword_1D4CF8000, a3, OS_LOG_TYPE_FAULT, "ENCypher_AES128 cypher mismatch {identifier: %@, expectedIdentifier: %@}", (uint8_t *)&v6, 0x16u);

}

CCCryptorStatus CCCrypt(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x1E0C80088](*(_QWORD *)&op, *(_QWORD *)&alg, *(_QWORD *)&options, key, keyLength, iv, dataIn, dataInLength);
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB2C00]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x1E0CD65A0](rnd, count, bytes);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1E0C80B68]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1E0C80FC0](dso, description, activity, *(_QWORD *)&flags);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t cut_arc_os_release()
{
  return MEMORY[0x1E0D13248]();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C28](queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84510](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84518](state);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

