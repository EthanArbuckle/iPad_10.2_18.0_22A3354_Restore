void sub_1BEC3F9CC(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  id v7;

  objc_msgSend_acceptCompletionBlock(*(void **)(a1 + 32), a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend_acceptCompletionBlock(*(void **)(a1 + 32), v5, v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v7 + 2))(v7, *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));

  }
}

void sub_1BEC3FA3C(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  id v7;

  objc_msgSend_acceptCompletionBlock(*(void **)(a1 + 32), a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend_acceptCompletionBlock(*(void **)(a1 + 32), v5, v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v7 + 2))(v7, *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));

  }
}

void sub_1BEC3FAAC(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  id v7;

  objc_msgSend_acceptCompletionBlock(*(void **)(a1 + 32), a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend_acceptCompletionBlock(*(void **)(a1 + 32), v5, v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v7 + 2))(v7, *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));

  }
}

void sub_1BEC3FB1C(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  const char *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  uint64_t v14;
  id v15;
  _QWORD v16[5];
  id location;

  v3 = a2;
  objc_initWeak(&location, v3);
  v4 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1BEC3FC44;
  v16[3] = &unk_1E782E4B8;
  v16[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend_setShareMetadataFetchedBlock_(v3, v5, (uint64_t)v16);
  v10 = v4;
  v11 = 3221225472;
  v12 = sub_1BEC3FD88;
  v13 = &unk_1E782E4E0;
  objc_copyWeak(&v15, &location);
  v14 = *(_QWORD *)(a1 + 32);
  objc_msgSend_setCompletionBlock_(v3, v6, (uint64_t)&v10);
  objc_msgSend_stateTransitionGroup(*(void **)(a1 + 32), v7, v8, v10, v11, v12, v13);
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v9);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void sub_1BEC3FC1C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1BEC3FC44(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  NSObject *v14;
  uint8_t buf[16];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v12 = v9;
  if (v7)
  {
    if (!v8 || v9)
    {
      if (!v9)
      {
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v10, *MEMORY[0x1E0C94B20], 2003, CFSTR("Couldn't get metadata for the share with url %@"), v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend__performCallbackForURL_withShare_error_(*(void **)(a1 + 32), v10, (uint64_t)v7, 0, v12);
    }
    else
    {
      objc_msgSend_shareMetadatasToAcceptByURL(*(void **)(a1 + 32), v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v12, v13, (uint64_t)v8, v7);
    }
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v14 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BE990000, v14, OS_LOG_TYPE_ERROR, "Missing shareURL in shareMetadataFetchedBlock", buf, 2u);
    }
  }

}

void sub_1BEC3FD88(uint64_t a1)
{
  id WeakRetained;
  const char *v3;
  uint64_t v4;
  __CFString *v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  NSObject *v12;
  int v13;
  const __CFString *v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend_error(WeakRetained, v3, v4);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v6 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    v9 = CFSTR(" with error ");
    v10 = &stru_1E7838F48;
    if (v5)
      v10 = v5;
    else
      v9 = &stru_1E7838F48;
    v13 = 138543618;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_1BE990000, v6, OS_LOG_TYPE_INFO, "Done fetching all share metadata%{public}@%@", (uint8_t *)&v13, 0x16u);
  }
  if (v5)
  {
    objc_msgSend_error(*(void **)(a1 + 32), v7, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      objc_msgSend_setError_(*(void **)(a1 + 32), v7, (uint64_t)v5);
  }
  objc_msgSend_stateTransitionGroup(*(void **)(a1 + 32), v7, v8);
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_group_leave(v12);

}

void sub_1BEC3FFF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BEC4001C(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  const char *v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v4 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v3;
      _os_log_error_impl(&dword_1BE990000, v4, OS_LOG_TYPE_ERROR, "Failing to accept anonymous share. %@", (uint8_t *)&v9, 0xCu);
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend_stateTransitionGroup(WeakRetained, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_group_leave(v8);

}

void sub_1BEC40408()
{
  void *v0;

  v0 = (void *)qword_1ED702C80;
  qword_1ED702C80 = (uint64_t)&unk_1E78AFED8;

}

uint64_t sub_1BEC4051C(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  void *v18;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v17;

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

id sub_1BEC40CA8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  uint64_t v39;
  void *v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  const char *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  const char *v60;
  uint64_t v61;
  uint64_t AssetContent;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  id v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v7 = objc_msgSend_operationType(v4, v5, v6);
  objc_msgSend_operationRequestWithType_(v4, v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_opt_new();
  objc_msgSend_setRecordRetrieveVersionsRequest_(v9, v11, (uint64_t)v10);

  objc_msgSend_translator(*(void **)(a1 + 32), v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pRecordIdentifierFromRecordID_(v14, v15, (uint64_t)v3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordRetrieveVersionsRequest(v9, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordIdentifier_(v19, v20, (uint64_t)v16);

  objc_msgSend_desiredKeys(*(void **)(a1 + 32), v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v81 = v3;
    v26 = (void *)objc_opt_new();
    objc_msgSend_recordRetrieveVersionsRequest(v9, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRequestedFields_(v29, v30, (uint64_t)v26);

    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    objc_msgSend_desiredKeys(*(void **)(a1 + 32), v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v82, v86, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v83;
      do
      {
        for (i = 0; i != v36; ++i)
        {
          if (*(_QWORD *)v83 != v37)
            objc_enumerationMutation(v33);
          v39 = *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * i);
          v40 = (void *)objc_opt_new();
          objc_msgSend_setName_(v40, v41, v39);
          objc_msgSend_recordRetrieveVersionsRequest(v9, v42, v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_requestedFields(v44, v45, v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addFields_(v47, v48, (uint64_t)v40);

        }
        v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v49, (uint64_t)&v82, v86, 16);
      }
      while (v36);
    }

    v3 = v81;
  }
  objc_msgSend_minimumVersionETag(*(void **)(a1 + 32), v24, v25);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordRetrieveVersionsRequest(v9, v51, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMinimumVersionEtag_(v53, v54, (uint64_t)v50);

  v55 = (void *)objc_opt_new();
  objc_msgSend_recordRetrieveVersionsRequest(v9, v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAssetsToDownload_(v58, v59, (uint64_t)v55);

  AssetContent = objc_msgSend_shouldFetchAssetContent(*(void **)(a1 + 32), v60, v61);
  objc_msgSend_recordRetrieveVersionsRequest(v9, v63, v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_assetsToDownload(v65, v66, v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAllAssets_(v68, v69, AssetContent);

  objc_msgSend_recordIDByRequestID(*(void **)(a1 + 32), v70, v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_request(v9, v73, v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationUUID(v75, v76, v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v72, v79, (uint64_t)v3, v78);

  return v9;
}

void sub_1BEC411AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1BEC411CC(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  NSObject *v11;
  uint64_t v13;
  id obj;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend_translator(v3, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v8 + 40);
  objc_msgSend_recordFromPRecord_error_(v7, v9, (uint64_t)v4, &obj);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_storeStrong((id *)(v8 + 40), obj);
  if (!v10)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v11 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      v16 = v13;
      _os_log_error_impl(&dword_1BE990000, v11, OS_LOG_TYPE_ERROR, "Invalid data from server: %@", buf, 0xCu);
    }
  }
  return v10;
}

void sub_1BEC41AD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;
  id *v16;
  uint64_t v17;

  objc_destroyWeak(v16);
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v17 - 40));
  _Unwind_Resume(a1);
}

void sub_1BEC41B00(uint64_t a1)
{
  id v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend_error(v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_finishWithError_(WeakRetained, v6, (uint64_t)v5);

}

uint64_t sub_1BEC42BCC(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend_sourceRecordID(a2, (const char *)a2, a3);
}

uint64_t sub_1BEC42BD4(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend_destinationRecord(a2, (const char *)a2, a3);
}

uint64_t sub_1BEC42BDC(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend_recordID(a2, (const char *)a2, a3);
}

id sub_1BEC42C58(uint64_t a1, void *a2)
{
  id v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend_sourceRecordID(v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneID(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v8;
  objc_msgSend_destinationRecord(v2, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_recordID(v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneID(v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v17;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v18, (uint64_t)v21, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

uint64_t sub_1BEC444E8(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  void *v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadData();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 16;
          goto LABEL_23;
        case 2u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 24;
LABEL_23:
          v20 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          continue;
        case 3u:
          v21 = 0;
          v22 = 0;
          v23 = 0;
          *(_BYTE *)(a1 + 36) |= 1u;
          while (2)
          {
            v24 = *v3;
            v25 = *(_QWORD *)(a2 + v24);
            if (v25 == -1 || v25 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
              *(_QWORD *)(a2 + v24) = v25 + 1;
              v23 |= (unint64_t)(v26 & 0x7F) << v21;
              if (v26 < 0)
              {
                v21 += 7;
                v14 = v22++ >= 9;
                if (v14)
                {
                  v23 = 0;
                  goto LABEL_41;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v23 = 0;
LABEL_41:
          *(_QWORD *)(a1 + 8) = v23;
          continue;
        case 4u:
          v27 = 0;
          v28 = 0;
          v29 = 0;
          *(_BYTE *)(a1 + 36) |= 2u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v30 = *v3;
        v31 = *(_QWORD *)(a2 + v30);
        if (v31 == -1 || v31 >= *(_QWORD *)(a2 + *v4))
          break;
        v32 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v31);
        *(_QWORD *)(a2 + v30) = v31 + 1;
        v29 |= (unint64_t)(v32 & 0x7F) << v27;
        if ((v32 & 0x80) == 0)
          goto LABEL_43;
        v27 += 7;
        v14 = v28++ >= 9;
        if (v14)
        {
          LODWORD(v29) = 0;
          goto LABEL_45;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_43:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v29) = 0;
LABEL_45:
      *(_DWORD *)(a1 + 32) = v29;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1BEC44F30(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEC4505C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEC48234(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,__int128 buf)
{
  id v37;
  NSObject *v38;

  if (a2 == 1)
  {
    v37 = objc_begin_catch(a1);
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v38 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v37;
      _os_log_impl(&dword_1BE990000, v38, OS_LOG_TYPE_INFO, "Warn: Caught an exception when trying to encode record: %@", (uint8_t *)&buf, 0xCu);
    }

    objc_end_catch();
    JUMPOUT(0x1BEC481ECLL);
  }
  _Unwind_Resume(a1);
}

void sub_1BEC4831C(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  id v31;

  v31 = a1;
  v5 = a2;
  v6 = a3;
  objc_msgSend_actions(v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_count(v9, v10, v11);

  if (v12)
  {
    objc_msgSend_identifier(v5, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_objectForKeyedSubscript_(v6, v19, (uint64_t)v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend_objectForKeyedSubscript_(v6, v21, (uint64_t)v18);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_actions(v22, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_actions(v5, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObjectsFromArray_(v25, v29, (uint64_t)v28);

    }
    else
    {
      objc_msgSend_setObject_forKeyedSubscript_(v6, v21, (uint64_t)v5, v18);
      objc_msgSend_addFields_(v31, v30, (uint64_t)v5);
    }

  }
  else
  {
    objc_msgSend_addFields_(v31, v13, (uint64_t)v5);
  }

}

void sub_1BEC48A6C(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,__int128 buf)
{
  id v39;
  NSObject *v40;

  if (a2 == 1)
  {
    v39 = objc_begin_catch(a1);
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v40 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v39;
      _os_log_impl(&dword_1BE990000, v40, OS_LOG_TYPE_INFO, "Warn: Caught an exception when trying to encode record: %@", (uint8_t *)&buf, 0xCu);
    }

    objc_end_catch();
    JUMPOUT(0x1BEC489B0);
  }
  _Unwind_Resume(a1);
}

BOOL sub_1BEC510F8(uint64_t a1, uint64_t a2, void *a3)
{
  char *v4;
  char *v5;
  uint64_t v6;
  _BOOL8 v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;

  v4 = a3;
  v5 = v4;
  v6 = (int)*MEMORY[0x1E0C95248];
  v7 = (*(_BYTE *)(a1 + v6) & 1) == 0
    || (v4[v6] & 1) == 0
    || *(_DWORD *)(a1 + (int)*MEMORY[0x1E0C95240]) == *(_DWORD *)&v4[*MEMORY[0x1E0C95240]];
  v8 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v5, v9, v8)
    || (v11 = (int)*MEMORY[0x1E0C95258], v12 = *(_QWORD *)(a1 + v11), v13 = *(_QWORD *)&v5[v11], v12 | v13)
    && !objc_msgSend_isEqual_((void *)v12, v10, v13)
    || (v14 = (int)*MEMORY[0x1E0C95250], v15 = *(_QWORD *)(a1 + v14), v16 = *(_QWORD *)&v5[v14], v15 | v16)
    && !objc_msgSend_isEqual_((void *)v15, v10, v16))
  {
    v7 = 0;
  }

  return v7;
}

uint64_t sub_1BEC511D8(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4;
  const char *v5;
  uint64_t v6;

  v4 = objc_msgSend_hash(*(void **)(a1 + (int)*MEMORY[0x1E0C95258]), a2, a3);
  return objc_msgSend_hash(*(void **)(a1 + (int)*MEMORY[0x1E0C95250]), v5, v6) ^ v4;
}

void sub_1BEC512C4()
{
  CKDRequiredFeaturesCache *v0;
  void *v1;

  v0 = objc_alloc_init(CKDRequiredFeaturesCache);
  v1 = (void *)qword_1ED702C98;
  qword_1ED702C98 = (uint64_t)v0;

}

void sub_1BEC5135C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEC513F0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEC52260(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  id v11;

  v3 = *(void **)(a1 + 32);
  v4 = a3;
  objc_msgSend_recordRetrieveRequest(v3, v5, v6);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requestedFields(v11, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addListField_(v9, v10, (uint64_t)v4);

}

BOOL sub_1BEC5363C(id *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  CKDPProtectionInfo *v19;
  const char *v20;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      if (v9++ >= 9)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 2;
        goto LABEL_30;
      case 2u:
        v19 = objc_alloc_init(CKDPProtectionInfo);
        objc_storeStrong(a1 + 3, v19);
        if (!PBReaderPlaceMark() || !sub_1BEA1BDA4((uint64_t)v19, a2))
          goto LABEL_38;
        goto LABEL_28;
      case 3u:
        PBReaderReadData();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 1;
        goto LABEL_30;
      case 4u:
        v19 = (CKDPProtectionInfo *)objc_alloc_init(MEMORY[0x1E0C94C68]);
        objc_storeStrong(a1 + 5, v19);
        if (PBReaderPlaceMark() && (CKDPDistributedTimestampsReadFrom() & 1) != 0)
        {
LABEL_28:
          PBReaderRecallMark();
LABEL_31:

LABEL_32:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_38:

        return 0;
      case 5u:
        PBReaderReadData();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 6;
LABEL_30:
        v19 = (CKDPProtectionInfo *)a1[v18];
        a1[v18] = (id)v17;
        goto LABEL_31;
      case 6u:
        PBReaderReadString();
        v19 = (CKDPProtectionInfo *)objc_claimAutoreleasedReturnValue();
        if (v19)
          objc_msgSend_addReplacedDeltaIdentifiers_(a1, v20, (uint64_t)v19);
        goto LABEL_31;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0)
          return 0;
        goto LABEL_32;
    }
  }
}

void sub_1BEC547C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_1BEC547EC(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend_replacementDeltas(a2, (const char *)a2, a3);
}

void sub_1BEC547F4(uint64_t a1, void *a2)
{
  const char *v3;
  uint64_t v4;
  id WeakRetained;
  NSObject *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v7)
      objc_msgSend_setError_(WeakRetained, v3, (uint64_t)v7);
    objc_msgSend_stateTransitionGroup(WeakRetained, v3, v4);
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_group_leave(v6);

  }
}

void sub_1BEC54AC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location,id a21)
{
  id *v21;
  id *v22;
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a21);
  _Unwind_Resume(a1);
}

void sub_1BEC54B0C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  const char *v8;
  void *v9;
  NSObject *v10;
  uint8_t v11[16];

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend_handleReplaceDeltasRequest_result_(WeakRetained, v8, (uint64_t)v5, v6);
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v10 = *MEMORY[0x1E0C952C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952C0], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1BE990000, v10, OS_LOG_TYPE_INFO, "Replace deltas operation deallocated before per request block", v11, 2u);
    }
  }

}

void sub_1BEC54BF0(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  objc_class *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = (void *)*MEMORY[0x1E0C952F8];
  if (WeakRetained)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v3);
    v4 = (void *)*MEMORY[0x1E0C952C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952C0], OS_LOG_TYPE_DEBUG))
    {
      v17 = v4;
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_ckShortDescription(WeakRetained, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543874;
      v24 = v19;
      v25 = 2048;
      v26 = WeakRetained;
      v27 = 2114;
      v28 = v22;
      _os_log_debug_impl(&dword_1BE990000, v17, OS_LOG_TYPE_DEBUG, "Replace deltas URL request completed for operation <%{public}@: %p; %{public}@>",
        (uint8_t *)&v23,
        0x20u);

    }
    objc_msgSend_error(WeakRetained, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v10 = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend_error(v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setError_(WeakRetained, v14, (uint64_t)v13);

    }
    objc_msgSend_stateTransitionGroup(WeakRetained, v8, v9);
    v15 = objc_claimAutoreleasedReturnValue();
    dispatch_group_leave(v15);

  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v3);
    v16 = *MEMORY[0x1E0C952C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952C0], OS_LOG_TYPE_INFO))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_1BE990000, v16, OS_LOG_TYPE_INFO, "Replace deltas operation deallocated before request completion block", (uint8_t *)&v23, 2u);
    }
  }

}

void sub_1BEC551FC()
{
  void *v0;

  v0 = (void *)qword_1ED702CA0;
  qword_1ED702CA0 = (uint64_t)&unk_1E78AFF00;

}

void sub_1BEC554D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1BEC561F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1BEC570C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1BEC57B54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1BEC57BE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1BEC57C7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

uint64_t sub_1BEC58768(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 12) |= 1u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_29;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            v19 = 0;
            goto LABEL_31;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_29:
        if (*(_BYTE *)(a2 + *v5))
          v19 = 0;
LABEL_31:
        *(_BYTE *)(a1 + 8) = v19 != 0;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t sub_1BEC593A8(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  CKDPRecord *v17;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(CKDPRecord);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || (CKDPRecordReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t sub_1BEC59D3C(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v16;
  const char *v18;
  unsigned int v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  int v23;
  uint64_t v25;
  void *v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      v16 = v10 & 7;
      if (v15 || (_DWORD)v16 == 4)
        break;
      v18 = (const char *)(v10 >> 3);
      if ((v10 >> 3) == 2)
      {
        objc_msgSend_clearOneofValuesForIdentifier((void *)a1, v18, v16);
        *(_BYTE *)(a1 + 32) |= 2u;
        *(_DWORD *)(a1 + 16) = 2;
        PBReaderReadString();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = *(void **)(a1 + 24);
        *(_QWORD *)(a1 + 24) = v25;

      }
      else if ((_DWORD)v18 == 1)
      {
        objc_msgSend_clearOneofValuesForIdentifier((void *)a1, v18, v16);
        v27 = 0;
        v28 = 0;
        v29 = 0;
        *(_BYTE *)(a1 + 32) |= 2u;
        *(_DWORD *)(a1 + 16) = 1;
        *(_BYTE *)(a1 + 32) |= 1u;
        while (1)
        {
          v30 = *v3;
          v31 = *(_QWORD *)(a2 + v30);
          if (v31 == -1 || v31 >= *(_QWORD *)(a2 + *v4))
            break;
          v32 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v31);
          *(_QWORD *)(a2 + v30) = v31 + 1;
          v29 |= (unint64_t)(v32 & 0x7F) << v27;
          if ((v32 & 0x80) == 0)
            goto LABEL_40;
          v27 += 7;
          v14 = v28++ >= 9;
          if (v14)
          {
            v29 = 0;
            goto LABEL_42;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_40:
        if (*(_BYTE *)(a2 + *v5))
          v29 = 0;
LABEL_42:
        *(_QWORD *)(a1 + 8) = v29;
      }
      else if ((_DWORD)v18)
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
      else
      {
        v19 = 0;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = v21 + 1;
          v23 = *(char *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v22;
          if (v23 < 0 && v19++ <= 8)
            continue;
          goto LABEL_43;
        }
        *(_BYTE *)(a2 + *v5) = 1;
      }
LABEL_43:
      ;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL CKDPRequestOperationHeaderAssetAuthorizeGetRequestOptionsHeaderInfoReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 8;
LABEL_22:
        v19 = *(void **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_24:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadString();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = 16;
    goto LABEL_22;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t sub_1BEC5AD44(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  CKCDPCodeServiceRequestServiceClientConfig *v23;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 2)
      {
        v23 = objc_alloc_init(CKCDPCodeServiceRequestServiceClientConfig);
        objc_storeStrong((id *)(a1 + 8), v23);
        if (!PBReaderPlaceMark() || (sub_1BEBC8110((uint64_t)v23, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 20) |= 1u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_33;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_35;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_33:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_35:
        *(_DWORD *)(a1 + 16) = v19;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1BEC5B53C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;
  id *v16;
  uint64_t v17;

  objc_destroyWeak(v16);
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v17 - 40));
  _Unwind_Resume(a1);
}

void sub_1BEC5B574(uint64_t a1)
{
  id v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend_error(v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend_error(v2, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_finishWithError_(WeakRetained, v9, (uint64_t)v8);

  }
  else
  {
    objc_msgSend_finishWithError_(WeakRetained, v6, 0);
  }

}

uint64_t sub_1BEC5BA08(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  unint64_t v18;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v15 = v9++ >= 9;
        if (v15)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        break;
      v18 = v10 >> 3;
      if ((v10 >> 3) == 4)
      {
        *(_BYTE *)(a1 + 28) |= 2u;
        v26 = *v3;
        v27 = *(_QWORD *)(a2 + v26);
        if (v27 <= 0xFFFFFFFFFFFFFFF7 && v27 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v28 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v27);
          *(_QWORD *)(a2 + v26) = v27 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v28 = 0;
        }
        *(_QWORD *)(a1 + 16) = v28;
      }
      else if ((_DWORD)v18 == 2)
      {
        v29 = 0;
        v30 = 0;
        v31 = 0;
        *(_BYTE *)(a1 + 28) |= 1u;
        while (1)
        {
          v32 = *v3;
          v33 = *(_QWORD *)(a2 + v32);
          v34 = v33 + 1;
          if (v33 == -1 || v34 > *(_QWORD *)(a2 + *v4))
            break;
          v35 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v33);
          *(_QWORD *)(a2 + v32) = v34;
          v31 |= (unint64_t)(v35 & 0x7F) << v29;
          if ((v35 & 0x80) == 0)
            goto LABEL_45;
          v29 += 7;
          v15 = v30++ >= 9;
          if (v15)
          {
            v31 = 0;
            goto LABEL_47;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_45:
        if (*(_BYTE *)(a2 + *v5))
          v31 = 0;
LABEL_47:
        *(_QWORD *)(a1 + 8) = v31;
      }
      else if ((_DWORD)v18 == 1)
      {
        v19 = 0;
        v20 = 0;
        v21 = 0;
        *(_BYTE *)(a1 + 28) |= 4u;
        while (1)
        {
          v22 = *v3;
          v23 = *(_QWORD *)(a2 + v22);
          v24 = v23 + 1;
          if (v23 == -1 || v24 > *(_QWORD *)(a2 + *v4))
            break;
          v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v23);
          *(_QWORD *)(a2 + v22) = v24;
          v21 |= (unint64_t)(v25 & 0x7F) << v19;
          if ((v25 & 0x80) == 0)
            goto LABEL_41;
          v19 += 7;
          v15 = v20++ >= 9;
          if (v15)
          {
            LODWORD(v21) = 0;
            goto LABEL_43;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_41:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v21) = 0;
LABEL_43:
        *(_DWORD *)(a1 + 24) = v21;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1BEC5C1F8()
{
  void *v0;

  v0 = (void *)qword_1ED702CB0;
  qword_1ED702CB0 = (uint64_t)&unk_1E78AFF28;

}

uint64_t sub_1BEC5DB88(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  CKDPUser *v17;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(CKDPUser);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || (sub_1BEB367B8((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL CKDPShareIdentifierReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  id v17;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(MEMORY[0x1E0C94C70]);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || (CKDPIdentifierReadFrom() & 1) == 0)
          goto LABEL_30;
LABEL_25:
        PBReaderRecallMark();

        goto LABEL_27;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_27:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v17 = objc_alloc_init(MEMORY[0x1E0C94C98]);
    objc_storeStrong((id *)(a1 + 16), v17);
    if (!PBReaderPlaceMark() || (CKDPRecordZoneIdentifierReadFrom() & 1) == 0)
    {
LABEL_30:

      return 0;
    }
    goto LABEL_25;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1BEC5E9CC(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 80));
  objc_destroyWeak((id *)(v4 - 72));
  _Unwind_Resume(a1);
}

void sub_1BEC5EA14(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  id v13;

  v13 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend_anonymousShareSavedBlock(WeakRetained, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend_anonymousShareSavedBlock(WeakRetained, v10, v11);
    v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v12)[2](v12, v13, v5);

  }
}

void sub_1BEC5EAA4(uint64_t a1)
{
  id WeakRetained;
  id v3;
  _QWORD *v4;
  os_log_t *v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  os_log_t v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const char *v20;
  NSObject *v21;
  int v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = (_QWORD *)MEMORY[0x1E0C95300];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v5 = (os_log_t *)MEMORY[0x1E0C952B0];
  v6 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    LOWORD(v22) = 0;
    _os_log_impl(&dword_1BE990000, v6, OS_LOG_TYPE_INFO, "Completed CKDAnonymousShareAddURLRequest", (uint8_t *)&v22, 2u);
  }
  objc_msgSend_error(v3, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (*v4 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v12 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
    {
      v15 = v12;
      objc_msgSend_error(v3, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138412290;
      v23 = v18;
      _os_log_impl(&dword_1BE990000, v15, OS_LOG_TYPE_INFO, "Error CKDAnonymousShareAddURLRequest: %@", (uint8_t *)&v22, 0xCu);

    }
    objc_msgSend_error(v3, v13, v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setError_(WeakRetained, v20, (uint64_t)v19);

  }
  objc_msgSend_stateTransitionGroup(WeakRetained, v10, v11);
  v21 = objc_claimAutoreleasedReturnValue();
  dispatch_group_leave(v21);

}

uint64_t sub_1BEC5EEE4(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend_containsMergeableValues(a2, (const char *)a2, a3);
}

uint64_t sub_1BEC5F0AC(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend_recordID(a2, (const char *)a2, a3);
}

uint64_t sub_1BEC63044(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  void *v18;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 2)
      {
        v19 = 0;
        v20 = 0;
        v21 = 0;
        *(_BYTE *)(a1 + 20) |= 1u;
        while (1)
        {
          v22 = *v3;
          v23 = *(_QWORD *)(a2 + v22);
          if (v23 == -1 || v23 >= *(_QWORD *)(a2 + *v4))
            break;
          v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v23);
          *(_QWORD *)(a2 + v22) = v23 + 1;
          v21 |= (unint64_t)(v24 & 0x7F) << v19;
          if ((v24 & 0x80) == 0)
            goto LABEL_31;
          v19 += 7;
          v14 = v20++ >= 9;
          if (v14)
          {
            LODWORD(v21) = 0;
            goto LABEL_33;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_31:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v21) = 0;
LABEL_33:
        *(_DWORD *)(a1 + 16) = v21;
      }
      else if ((v10 >> 3) == 1)
      {
        PBReaderReadData();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v17;

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1BEC6654C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEC665C0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEC66634(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEC666A8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1BEC67284(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        PBReaderReadData();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 8;
      }
      else
      {
        if ((_DWORD)v17 != 2)
        {
          if ((_DWORD)v17 == 1)
          {
            v18 = 0;
            v19 = 0;
            v20 = 0;
            *(_BYTE *)(a1 + 28) |= 1u;
            while (1)
            {
              v21 = *v3;
              v22 = *(_QWORD *)(a2 + v21);
              if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
                break;
              v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
              *(_QWORD *)(a2 + v21) = v22 + 1;
              v20 |= (unint64_t)(v23 & 0x7F) << v18;
              if ((v23 & 0x80) == 0)
                goto LABEL_34;
              v18 += 7;
              v14 = v19++ >= 9;
              if (v14)
              {
                LODWORD(v20) = 0;
                goto LABEL_36;
              }
            }
            *(_BYTE *)(a2 + *v5) = 1;
LABEL_34:
            if (*(_BYTE *)(a2 + *v5))
              LODWORD(v20) = 0;
LABEL_36:
            *(_DWORD *)(a1 + 24) = v20;
          }
          else
          {
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
          }
          continue;
        }
        PBReaderReadData();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 16;
      }
      v26 = *(void **)(a1 + v25);
      *(_QWORD *)(a1 + v25) = v24;

    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t sub_1BEC67BD4(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 12) |= 1u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_29;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_31;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_29:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_31:
        *(_DWORD *)(a1 + 8) = v19;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t sub_1BEC68150(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  CKDPRecord *v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 2)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 20) |= 1u;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
            break;
          v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0)
            goto LABEL_33;
          v18 += 7;
          v14 = v19++ >= 9;
          if (v14)
          {
            v20 = 0;
            goto LABEL_35;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_33:
        if (*(_BYTE *)(a2 + *v5))
          v20 = 0;
LABEL_35:
        *(_BYTE *)(a1 + 16) = v20 != 0;
      }
      else if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(CKDPRecord);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || (CKDPRecordReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t sub_1BEC69AA4(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  char v30;
  unsigned int v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  uint64_t result;
  void *v36;
  uint64_t v37;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 24;
          goto LABEL_48;
        case 2u:
          v19 = 0;
          v20 = 0;
          v21 = 0;
          *(_BYTE *)(a1 + 80) |= 1u;
          while (2)
          {
            v22 = *v3;
            v23 = *(_QWORD *)(a2 + v22);
            if (v23 == -1 || v23 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v23);
              *(_QWORD *)(a2 + v22) = v23 + 1;
              v21 |= (unint64_t)(v24 & 0x7F) << v19;
              if (v24 < 0)
              {
                v19 += 7;
                v14 = v20++ >= 9;
                if (v14)
                {
                  LODWORD(v21) = 0;
                  goto LABEL_52;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v21) = 0;
LABEL_52:
          v37 = 16;
          goto LABEL_61;
        case 3u:
          v25 = 0;
          v26 = 0;
          v21 = 0;
          *(_BYTE *)(a1 + 80) |= 4u;
          while (2)
          {
            v27 = *v3;
            v28 = *(_QWORD *)(a2 + v27);
            if (v28 == -1 || v28 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
              *(_QWORD *)(a2 + v27) = v28 + 1;
              v21 |= (unint64_t)(v29 & 0x7F) << v25;
              if (v29 < 0)
              {
                v25 += 7;
                v14 = v26++ >= 9;
                if (v14)
                {
                  LODWORD(v21) = 0;
                  goto LABEL_56;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v21) = 0;
LABEL_56:
          v37 = 64;
          goto LABEL_61;
        case 4u:
          v30 = 0;
          v31 = 0;
          v21 = 0;
          *(_BYTE *)(a1 + 80) |= 2u;
          break;
        case 5u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 72;
          goto LABEL_48;
        case 6u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 56;
          goto LABEL_48;
        case 0xAu:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 48;
          goto LABEL_48;
        case 0xBu:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 40;
          goto LABEL_48;
        case 0xCu:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 8;
LABEL_48:
          v36 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v32 = *v3;
        v33 = *(_QWORD *)(a2 + v32);
        if (v33 == -1 || v33 >= *(_QWORD *)(a2 + *v4))
          break;
        v34 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v33);
        *(_QWORD *)(a2 + v32) = v33 + 1;
        v21 |= (unint64_t)(v34 & 0x7F) << v30;
        if ((v34 & 0x80) == 0)
          goto LABEL_58;
        v30 += 7;
        v14 = v31++ >= 9;
        if (v14)
        {
          LODWORD(v21) = 0;
          goto LABEL_60;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_58:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v21) = 0;
LABEL_60:
      v37 = 32;
LABEL_61:
      *(_DWORD *)(a1 + v37) = v21;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t sub_1BEC6AEF8(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend_allMMCSItems(a2, (const char *)a2, a3);
}

uint64_t sub_1BEC6AF10(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend_allRereferenceMMCSPackageItems(a2, (const char *)a2, a3);
}

uint64_t sub_1BEC6AF28(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend_allMMCSSectionItems(a2, (const char *)a2, a3);
}

uint64_t sub_1BEC6AF40(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend_allMMCSAndSectionItems(a2, (const char *)a2, a3);
}

void sub_1BEC6B260(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BEC6B278(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_firstMMCSItemError(a2, (const char *)a2, a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  *a4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) != 0;
}

void sub_1BEC6B35C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BEC6B374(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  const char *v7;
  uint64_t v8;

  objc_msgSend_allMMCSSectionItems(a2, (const char *)a2, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend_count(v6, v7, v8) != 0;

  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

void sub_1BEC6B4A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1BEC6B4B8(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;
  uint64_t v7;
  char v8;

  result = objc_msgSend_isEmpty(a2, (const char *)a2, a3);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_BYTE *)(v7 + 24))
    v8 = result;
  else
    v8 = 0;
  *(_BYTE *)(v7 + 24) = v8;
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) ^ 1;
  return result;
}

void sub_1BEC6B59C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1BEC6B5B4(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;
  uint64_t v7;
  char v8;

  result = objc_msgSend_isEmpty(a2, (const char *)a2, a3);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_BYTE *)(v7 + 24))
    v8 = result;
  else
    v8 = 0;
  *(_BYTE *)(v7 + 24) = v8;
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) ^ 1;
  return result;
}

void sub_1BEC6BF98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BEC6BFC4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  const char *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void **);
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[4];
  __int128 v16;
  id v17;
  id v18[2];
  id from;
  id location;

  v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_initWeak(&from, v3);
  v4 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1BEC6C170;
  v15[3] = &unk_1E78387B0;
  objc_copyWeak(&v17, &from);
  objc_copyWeak(v18, &location);
  v18[1] = *(id *)(a1 + 48);
  v16 = *(_OWORD *)(a1 + 32);
  objc_msgSend_setRecordFetchCompletionBlock_(v3, v5, (uint64_t)v15);
  v8 = v4;
  v9 = 3221225472;
  v10 = sub_1BEC6C3EC;
  v11 = &unk_1E7831E10;
  objc_copyWeak(&v13, &location);
  objc_copyWeak(&v14, &from);
  v12 = *(_QWORD *)(a1 + 32);
  objc_msgSend_setCompletionBlock_(v3, v6, (uint64_t)&v8);
  objc_msgSend_setFetchOperation_(*(void **)(a1 + 32), v7, (uint64_t)v3, v8, v9, v10, v11);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v13);
  objc_destroyWeak(v18);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void sub_1BEC6C128(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  id *v4;
  uint64_t v5;

  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 80));
  objc_destroyWeak((id *)(v5 - 72));
  _Unwind_Resume(a1);
}

void sub_1BEC6C170(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  id v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const char *v21;
  NSObject *v22;
  objc_class *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  objc_class *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  const char *v34;
  int v35;
  void *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v11 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend_removePackages(v7, v12, v13);
  if (v9)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v15 = (void *)*MEMORY[0x1E0C952B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B8], OS_LOG_TYPE_ERROR))
    {
      v22 = v15;
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_ckShortDescription(WeakRetained, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (objc_class *)objc_opt_class();
      NSStringFromClass(v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_ckShortDescription(v11, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 138544898;
      v36 = v24;
      v37 = 2048;
      v38 = WeakRetained;
      v39 = 2114;
      v40 = v27;
      v41 = 2114;
      v42 = v29;
      v43 = 2048;
      v44 = v11;
      v45 = 2114;
      v46 = v32;
      v47 = 2112;
      v48 = v9;
      _os_log_error_impl(&dword_1BE990000, v22, OS_LOG_TYPE_ERROR, "Repair records operation <%{public}@: %p; %{public}@> for operation <%{public}@: %p; %{public}@> could not fetch"
        " original record with error %@",
        (uint8_t *)&v35,
        0x48u);

    }
    objc_msgSend_setError_(v11, v16, (uint64_t)v9);
  }
  else
  {
    objc_msgSend_objectForKeyedSubscript_(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v14, (uint64_t)v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v17, v18);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v33, v34, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("CKDRepairAssetsOperation.m"), 166, CFSTR("recordIDToUUID can never produce a nil value here"));

    }
    objc_msgSend_assetOrPackageUUIDToOriginalRecord(v11, v17, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v20, v21, (uint64_t)v7, v19);

  }
}

void sub_1BEC6C3EC(void **a1)
{
  id WeakRetained;
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  objc_class *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  objc_class *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  objc_class *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  int v42;
  void *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained(a1 + 5);
  v3 = objc_loadWeakRetained(a1 + 6);
  objc_msgSend_error(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)*MEMORY[0x1E0C952F8];
  if (v6)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v7);
    v8 = (void *)*MEMORY[0x1E0C952B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B8], OS_LOG_TYPE_ERROR))
    {
      v18 = v8;
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_ckShortDescription(v3, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_ckShortDescription(WeakRetained, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_error(v3, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 138544898;
      v43 = v20;
      v44 = 2048;
      v45 = v3;
      v46 = 2114;
      v47 = v23;
      v48 = 2114;
      v49 = v25;
      v50 = 2048;
      v51 = WeakRetained;
      v52 = 2114;
      v53 = v28;
      v54 = 2112;
      v55 = v31;
      _os_log_error_impl(&dword_1BE990000, v18, OS_LOG_TYPE_ERROR, "Repair records sub-operation <%{public}@: %p; %{public}@> for operation <%{public}@: %p; %{public}@> completed f"
        "etch original records with error %@",
        (uint8_t *)&v42,
        0x48u);

    }
    objc_msgSend_error(v3, v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_setError_(WeakRetained, v12, (uint64_t)v11);
    goto LABEL_7;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], v7);
  v14 = (void *)*MEMORY[0x1E0C952B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B8], OS_LOG_TYPE_DEBUG))
  {
    v11 = v14;
    v32 = (objc_class *)objc_opt_class();
    NSStringFromClass(v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ckShortDescription(v3, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (objc_class *)objc_opt_class();
    NSStringFromClass(v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ckShortDescription(WeakRetained, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 138544642;
    v43 = v33;
    v44 = 2048;
    v45 = v3;
    v46 = 2114;
    v47 = v36;
    v48 = 2114;
    v49 = v38;
    v50 = 2048;
    v51 = WeakRetained;
    v52 = 2114;
    v53 = v41;
    _os_log_debug_impl(&dword_1BE990000, v11, OS_LOG_TYPE_DEBUG, "Repair records sub-operation <%{public}@: %p; %{public}@> for operation <%{public}@: %p; %{public}@> completed fet"
      "ch original records",
      (uint8_t *)&v42,
      0x3Eu);

LABEL_7:
  }
  objc_msgSend_setFetchOperation_(WeakRetained, v13, 0);
  objc_msgSend_stateTransitionGroup(a1[4], v15, v16);
  v17 = objc_claimAutoreleasedReturnValue();
  dispatch_group_leave(v17);

}

void sub_1BEC6CE80(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  const char *v5;
  void *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  id v17;
  id v18;
  _QWORD v19[7];
  id v20;
  id v21[2];
  _QWORD v22[4];
  id v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[5];
  id v27;
  id from;
  id location;

  v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_initWeak(&from, v3);
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = sub_1BE9BB220;
  v26[4] = sub_1BE9BAEB8;
  v27 = (id)objc_opt_new();
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = sub_1BE9BB220;
  v24[4] = sub_1BE9BAEB8;
  v25 = (id)objc_opt_new();
  v4 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = sub_1BEC6D144;
  v22[3] = &unk_1E782F948;
  objc_copyWeak(&v23, &location);
  objc_msgSend_setSaveProgressBlock_(v3, v5, (uint64_t)v22);
  v19[0] = v4;
  v19[1] = 3221225472;
  v19[2] = sub_1BEC6D290;
  v19[3] = &unk_1E7838800;
  objc_copyWeak(&v20, &location);
  objc_copyWeak(v21, &from);
  v6 = *(void **)(a1 + 40);
  v19[4] = *(_QWORD *)(a1 + 32);
  v19[5] = v24;
  v21[1] = v6;
  v19[6] = v26;
  objc_msgSend_setSaveCompletionBlock_(v3, v7, (uint64_t)v19);
  v10 = v4;
  v11 = 3221225472;
  v12 = sub_1BEC6D6DC;
  v13 = &unk_1E7838828;
  objc_copyWeak(&v17, &location);
  objc_copyWeak(&v18, &from);
  v15 = v24;
  v16 = v26;
  v14 = *(_QWORD *)(a1 + 32);
  objc_msgSend_setCompletionBlock_(v3, v8, (uint64_t)&v10);
  objc_msgSend_setUploadOperation_(*(void **)(a1 + 32), v9, (uint64_t)v3, v10, v11, v12, v13);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v17);
  objc_destroyWeak(v21);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v23);
  _Block_object_dispose(v24, 8);

  _Block_object_dispose(v26, 8);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void sub_1BEC6D0C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  id *v33;
  id *v34;
  id *v35;
  id *v36;
  id *v37;
  uint64_t v38;

  objc_destroyWeak(v37);
  objc_destroyWeak(v36);
  objc_destroyWeak(v35);
  objc_destroyWeak(v34);
  objc_destroyWeak(v33);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v38 - 160), 8);
  objc_destroyWeak((id *)(v38 - 112));
  objc_destroyWeak((id *)(v38 - 104));
  _Unwind_Resume(a1);
}

void sub_1BEC6D13C()
{
  JUMPOUT(0x1BEC6D124);
}

void sub_1BEC6D144(uint64_t a1, void *a2, double a3)
{
  id *v4;
  id v5;
  id WeakRetained;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  NSObject *v15;
  int v16;
  void *v17;
  __int16 v18;
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (id *)(a1 + 32);
  v5 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend_recordName(v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_UUIDToAssetOrPackage(WeakRetained, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v12, v13, (uint64_t)v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v15 = *MEMORY[0x1E0C952B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B8], OS_LOG_TYPE_DEBUG))
  {
    v16 = 138412546;
    v17 = v14;
    v18 = 2048;
    v19 = a3;
    _os_log_debug_impl(&dword_1BE990000, v15, OS_LOG_TYPE_DEBUG, "Progress for upload of repaired asset %@: %.2f", (uint8_t *)&v16, 0x16u);
  }

}

void sub_1BEC6D290(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id WeakRetained;
  id v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  const char *v32;
  NSObject *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  NSObject *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  const char *v45;
  void *v46;
  const char *v47;
  NSObject *log;
  id v49;
  _QWORD block[5];
  id v51;
  id v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v49 = a3;
  v10 = a4;
  v11 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v13 = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend_recordName(v9, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUIDToAssetOrPackage(WeakRetained, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v19, v20, (uint64_t)v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v22, v23);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v44, v45, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32), CFSTR("CKDRepairAssetsOperation.m"), 282, CFSTR("Expected non-nil asset or package in %@"), v13);

  }
  objc_msgSend_assetOrPackageUUIDToMetadata(WeakRetained, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v24, v25, (uint64_t)v16);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v26)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v27, v28);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v46, v47, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32), CFSTR("CKDRepairAssetsOperation.m"), 284, CFSTR("Expected non-nil metadata for asset or package %@ in %@"), v21, v13);

  }
  v29 = (void *)*MEMORY[0x1E0C952F8];
  if (v11)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v29);
    v30 = (void *)*MEMORY[0x1E0C952B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B8], OS_LOG_TYPE_ERROR))
    {
      log = v30;
      objc_msgSend_operationID(WeakRetained, v41, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v54 = v21;
      v55 = 2114;
      v56 = v43;
      v57 = 2112;
      v58 = v11;
      _os_log_error_impl(&dword_1BE990000, log, OS_LOG_TYPE_ERROR, "Failed to upload asset or package %@ with operation %{public}@: %@", buf, 0x20u);

    }
    v31 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_sync_enter(v31);
    objc_msgSend_setObject_forKeyedSubscript_(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v32, (uint64_t)v11, v16);
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v29);
    v33 = *MEMORY[0x1E0C952B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B8], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v54 = v21;
      _os_log_debug_impl(&dword_1BE990000, v33, OS_LOG_TYPE_DEBUG, "Successfully uploaded asset or package %@", buf, 0xCu);
    }
    v31 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    objc_sync_enter(v31);
    objc_msgSend_addObject_(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v34, (uint64_t)v16);
  }
  objc_sync_exit(v31);

  objc_msgSend_assetOrPackageRepairedBlock(WeakRetained, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    objc_msgSend_callbackQueue(WeakRetained, v38, v39);
    v40 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1BEC6D698;
    block[3] = &unk_1E782E418;
    block[4] = WeakRetained;
    v51 = v26;
    v52 = v11;
    dispatch_async(v40, block);

  }
}

void sub_1BEC6D678(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEC6D698(uint64_t a1, const char *a2, uint64_t a3)
{
  id v4;

  objc_msgSend_assetOrPackageRepairedBlock(*(void **)(a1 + 32), a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void sub_1BEC6D6DC(uint64_t a1)
{
  id WeakRetained;
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  const char *v13;
  void *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  objc_class *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  objc_class *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  objc_class *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  int v44;
  void *v45;
  __int16 v46;
  id v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  id v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend_error(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)*MEMORY[0x1E0C952F8];
  if (v6)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v7);
    v8 = (void *)*MEMORY[0x1E0C952B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B8], OS_LOG_TYPE_ERROR))
    {
      v20 = v8;
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_ckShortDescription(v3, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_ckShortDescription(WeakRetained, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_error(v3, v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 138544898;
      v45 = v22;
      v46 = 2048;
      v47 = v3;
      v48 = 2114;
      v49 = v25;
      v50 = 2114;
      v51 = v27;
      v52 = 2048;
      v53 = WeakRetained;
      v54 = 2114;
      v55 = v30;
      v56 = 2112;
      v57 = v33;
      _os_log_error_impl(&dword_1BE990000, v20, OS_LOG_TYPE_ERROR, "Repair records sub-operation <%{public}@: %p; %{public}@> for operation <%{public}@: %p; %{public}@> finished with error %@",
        (uint8_t *)&v44,
        0x48u);

    }
    objc_msgSend_error(v3, v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_setError_(WeakRetained, v12, (uint64_t)v11);
    goto LABEL_7;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], v7);
  v14 = (void *)*MEMORY[0x1E0C952B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B8], OS_LOG_TYPE_DEBUG))
  {
    v11 = v14;
    v34 = (objc_class *)objc_opt_class();
    NSStringFromClass(v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ckShortDescription(v3, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (objc_class *)objc_opt_class();
    NSStringFromClass(v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ckShortDescription(WeakRetained, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 138544642;
    v45 = v35;
    v46 = 2048;
    v47 = v3;
    v48 = 2114;
    v49 = v38;
    v50 = 2114;
    v51 = v40;
    v52 = 2048;
    v53 = WeakRetained;
    v54 = 2114;
    v55 = v43;
    _os_log_debug_impl(&dword_1BE990000, v11, OS_LOG_TYPE_DEBUG, "Repair records sub-operation <%{public}@: %p; %{public}@> for operation <%{public}@: %p; %{public}@> succeeded",
      (uint8_t *)&v44,
      0x3Eu);

LABEL_7:
  }
  objc_msgSend_setAssetOrPackageUUIDToUploadError_(WeakRetained, v13, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  objc_msgSend_setUploadedAssetOrPackageUUIDs_(WeakRetained, v15, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  objc_msgSend_setUploadOperation_(WeakRetained, v16, 0);
  objc_msgSend_stateTransitionGroup(*(void **)(a1 + 32), v17, v18);
  v19 = objc_claimAutoreleasedReturnValue();
  dispatch_group_leave(v19);

}

void sub_1BEC6E3F0(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  const char *v5;
  const char *v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id from;
  id location;

  v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_initWeak(&from, v3);
  objc_msgSend_setUseEncryption_(v3, v4, 0);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1BEC6E51C;
  v7[3] = &unk_1E7831E10;
  objc_copyWeak(&v8, &location);
  objc_copyWeak(&v9, &from);
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend_setCompletionBlock_(v3, v5, (uint64_t)v7);
  objc_msgSend_setUpdateOperation_(*(void **)(a1 + 32), v6, (uint64_t)v3);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void sub_1BEC6E4E4(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 48));
  objc_destroyWeak((id *)(v3 - 40));
  _Unwind_Resume(a1);
}

void sub_1BEC6E51C(void **a1)
{
  id WeakRetained;
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  objc_class *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  objc_class *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  objc_class *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  int v42;
  void *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained(a1 + 5);
  v3 = objc_loadWeakRetained(a1 + 6);
  objc_msgSend_error(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)*MEMORY[0x1E0C952F8];
  if (v6)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v7);
    v8 = (void *)*MEMORY[0x1E0C952B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B8], OS_LOG_TYPE_ERROR))
    {
      v18 = v8;
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_ckShortDescription(v3, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_ckShortDescription(WeakRetained, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_error(v3, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 138544898;
      v43 = v20;
      v44 = 2048;
      v45 = v3;
      v46 = 2114;
      v47 = v23;
      v48 = 2114;
      v49 = v25;
      v50 = 2048;
      v51 = WeakRetained;
      v52 = 2114;
      v53 = v28;
      v54 = 2112;
      v55 = v31;
      _os_log_error_impl(&dword_1BE990000, v18, OS_LOG_TYPE_ERROR, "Repair asset sub-operation <%{public}@: %p; %{public}@> for operation <%{public}@: %p; %{public}@> completed rep"
        "air record update with error %@",
        (uint8_t *)&v42,
        0x48u);

    }
    objc_msgSend_error(v3, v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_setError_(WeakRetained, v12, (uint64_t)v11);
    goto LABEL_7;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], v7);
  v14 = (void *)*MEMORY[0x1E0C952B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B8], OS_LOG_TYPE_DEBUG))
  {
    v11 = v14;
    v32 = (objc_class *)objc_opt_class();
    NSStringFromClass(v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ckShortDescription(v3, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (objc_class *)objc_opt_class();
    NSStringFromClass(v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ckShortDescription(WeakRetained, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 138544642;
    v43 = v33;
    v44 = 2048;
    v45 = v3;
    v46 = 2114;
    v47 = v36;
    v48 = 2114;
    v49 = v38;
    v50 = 2048;
    v51 = WeakRetained;
    v52 = 2114;
    v53 = v41;
    _os_log_debug_impl(&dword_1BE990000, v11, OS_LOG_TYPE_DEBUG, "Repair asset sub-operation <%{public}@: %p; %{public}@> for operaiton <%{public}@: %p; %{public}@> completed repair record update",
      (uint8_t *)&v42,
      0x3Eu);

LABEL_7:
  }
  objc_msgSend_setUpdateOperation_(WeakRetained, v13, 0);
  objc_msgSend_stateTransitionGroup(a1[4], v15, v16);
  v17 = objc_claimAutoreleasedReturnValue();
  dispatch_group_leave(v17);

}

void sub_1BEC6F314(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEC6F4FC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEC6F7D0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEC6FA68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BEC6FA8C(uint64_t a1, uint64_t a2, void *a3)
{
  void (**v4)(_QWORD);
  id WeakRetained;
  const char *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  void (**v12)(_QWORD);

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend_opQueue(WeakRetained, v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1BEC6FB54;
    v10[3] = &unk_1E782F4D0;
    v11 = v8;
    v12 = v4;
    dispatch_async(v9, v10);

  }
  else
  {
    v4[2](v4);
  }

}

uint64_t sub_1BEC6FB54(uint64_t a1, const char *a2, uint64_t a3)
{
  objc_msgSend__lockedFetchesAreReady(*(void **)(a1 + 32), a2, a3);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_1BEC70698(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BEC706C4(uint64_t a1)
{
  const char *v1;
  uint64_t v2;
  void *v3;
  const char *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend_fetchCoalescer(WeakRetained, v1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_coalesce_(v3, v4, 0);

}

void sub_1BEC70B20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BEC70B48(uint64_t a1)
{
  const char *v1;
  uint64_t v2;
  void *v3;
  const char *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend_fetchCoalescer(WeakRetained, v1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_coalesce_(v3, v4, 0);

}

void sub_1BEC70CE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1BEC70D08(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  char v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  int isEqualToString;
  const char *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  const char *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  objc_msgSend_queuedFetches(*(void **)(a1 + 32), a2, a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v37, v41, 16);
  if (v6)
  {
    v9 = v6;
    v10 = *(_QWORD *)v38;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v38 != v10)
        objc_enumerationMutation(v4);
      v12 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v11);
      objc_msgSend_operationID(*(void **)(a1 + 40), v7, v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend_dependentOperationListContainsOperationID_(v12, v14, (uint64_t)v13);

      if ((v15 & 1) != 0)
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v37, v41, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    objc_msgSend_equivalentRunningFetch(v12, v7, v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_runningOperationID(v17, v18, v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
      return;
    v22 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    while (1)
    {
      objc_msgSend_operationID(v22, v20, v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v16, v24, (uint64_t)v23);

      if (isEqualToString)
        break;
      v28 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      objc_msgSend_parentOperation(v28, v26, v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28 == v29)
      {
        objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v30, v31);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v35, v36, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("CKDPCSFetchAggregator.m"), 233, CFSTR("I am my parent?"));

      }
      objc_msgSend_parentOperation(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v30, v31);
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v34 = *(void **)(v33 + 40);
      *(_QWORD *)(v33 + 40) = v32;

      v22 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      if (!v22)
        goto LABEL_18;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
  else
  {
LABEL_9:
    v16 = v4;
  }
LABEL_18:

}

void sub_1BEC71028(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  os_signpost_id_t v12;
  uint64_t v13;
  _QWORD *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  int v34;
  NSObject *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  dispatch_time_t v40;
  const char *v41;
  uint64_t v42;
  NSObject *v43;
  void *v44;
  const char *v45;
  _QWORD block[5];
  _QWORD v47[4];
  id v48;
  id v49;
  uint8_t buf[4];
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  objc_msgSend_signpost(MEMORY[0x1E0C95140], a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  if (v4)
  {
    objc_msgSend_log(v4, v5, v6);
    v8 = objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend_identifier(v7, v9, v10);
    if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v12 = v11;
      if (os_signpost_enabled(v8))
      {
        v13 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v51 = v13;
        _os_signpost_emit_with_name_impl(&dword_1BE990000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PCSFetchAggregator", "Enqueuing fetch of record %@", buf, 0xCu);
      }
    }

  }
  v14 = (_QWORD *)MEMORY[0x1E0C95300];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v15 = *MEMORY[0x1E0C952D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
  {
    v16 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v51 = v16;
    _os_log_impl(&dword_1BE990000, v15, OS_LOG_TYPE_INFO, "Enqueuing fetch of record %@", buf, 0xCu);
  }
  v17 = *(void **)(a1 + 40);
  v18 = *(_QWORD *)(a1 + 48);
  v19 = objc_opt_class();
  objc_msgSend__lockedGetQueuedFetchForOperation_ofClass_(v17, v20, v18, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *(_QWORD *)(a1 + 32);
  v23 = *(_QWORD *)(a1 + 48);
  v24 = MEMORY[0x1E0C809B0];
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = sub_1BEC713A8;
  v47[3] = &unk_1E7838890;
  v25 = v7;
  v48 = v25;
  v49 = *(id *)(a1 + 56);
  objc_msgSend_addRequestForRecordID_forOperation_withCompletionHandler_(v21, v26, v22, v23, v47);
  if (*MEMORY[0x1E0C95280]
    && (objc_msgSend_unitTestOverrides(*(void **)(a1 + 48), v27, v28),
        v29 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend_objectForKeyedSubscript_(v29, v30, (uint64_t)CFSTR("DelayPCSRecordFetch")),
        v31 = (void *)objc_claimAutoreleasedReturnValue(),
        v34 = objc_msgSend_BOOLValue(v31, v32, v33),
        v31,
        v29,
        v34))
  {
    if (*v14 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v35 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE990000, v35, OS_LOG_TYPE_INFO, "Posting notification now", buf, 2u);
    }
    objc_msgSend_defaultCenter(MEMORY[0x1E0CB35B0], v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_postNotificationName_object_(v38, v39, (uint64_t)CFSTR("com.apple.cloudkit.DelayPCSRecordFetch"), 0);

    v40 = dispatch_time(0, 1000000000);
    objc_msgSend_opQueue(*(void **)(a1 + 40), v41, v42);
    v43 = objc_claimAutoreleasedReturnValue();
    block[0] = v24;
    block[1] = 3221225472;
    block[2] = sub_1BEC71490;
    block[3] = &unk_1E782EA40;
    block[4] = *(_QWORD *)(a1 + 40);
    dispatch_after(v40, v43, block);

  }
  else
  {
    objc_msgSend_fetchCoalescer(*(void **)(a1 + 40), v27, v28);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_coalesce_(v44, v45, 0);

  }
}

void sub_1BEC713A8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  os_signpost_id_t v17;
  uint8_t v18[16];

  v7 = a2;
  v8 = a3;
  v11 = a4;
  v12 = *(void **)(a1 + 32);
  if (v12)
  {
    objc_msgSend_log(v12, v9, v10);
    v13 = objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend_identifier(*(void **)(a1 + 32), v14, v15);
    if ((unint64_t)(v16 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v17 = v16;
      if (os_signpost_enabled(v13))
      {
        *(_WORD *)v18 = 0;
        _os_signpost_emit_with_name_impl(&dword_1BE990000, v13, OS_SIGNPOST_INTERVAL_END, v17, "PCSFetchAggregator", "", v18, 2u);
      }
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_1BEC71490(uint64_t a1, const char *a2, uint64_t a3)
{
  const char *v3;
  id v4;

  objc_msgSend_fetchCoalescer(*(void **)(a1 + 32), a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_coalesce_(v4, v3, 0);

}

void sub_1BEC715A8(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  os_signpost_id_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend_signpost(MEMORY[0x1E0C95140], a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  if (v4)
  {
    objc_msgSend_log(v4, v5, v6);
    v8 = objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend_identifier(v7, v9, v10);
    if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v12 = v11;
      if (os_signpost_enabled(v8))
      {
        v13 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v34 = v13;
        _os_signpost_emit_with_name_impl(&dword_1BE990000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PCSFetchAggregator", "Enqueuing fetch of share %@", buf, 0xCu);
      }
    }

  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v14 = *MEMORY[0x1E0C952D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
  {
    v15 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v34 = v15;
    _os_log_impl(&dword_1BE990000, v14, OS_LOG_TYPE_INFO, "Enqueuing fetch of share %@", buf, 0xCu);
  }
  v16 = *(void **)(a1 + 40);
  v17 = *(_QWORD *)(a1 + 48);
  v18 = objc_opt_class();
  objc_msgSend__lockedGetQueuedFetchForOperation_ofClass_(v16, v19, v17, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = *(void **)(a1 + 32);
  v22 = *(_QWORD *)(a1 + 48);
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = sub_1BEC717F0;
  v29[3] = &unk_1E78388B8;
  v30 = v7;
  v31 = v21;
  v32 = *(id *)(a1 + 56);
  v23 = v7;
  objc_msgSend_addRequestForRecordID_forOperation_withCompletionHandler_(v20, v24, (uint64_t)v31, v22, v29);
  objc_msgSend_fetchCoalescer(*(void **)(a1 + 40), v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_coalesce_(v27, v28, 0);

}

void sub_1BEC717F0(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  os_signpost_id_t v17;
  const char *v18;
  uint64_t v19;
  uint8_t buf[16];

  v7 = a2;
  v8 = a3;
  v11 = a4;
  v12 = *(void **)(a1 + 32);
  if (v12)
  {
    objc_msgSend_log(v12, v9, v10);
    v13 = objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend_identifier(*(void **)(a1 + 32), v14, v15);
    if ((unint64_t)(v16 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v17 = v16;
      if (os_signpost_enabled(v13))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BE990000, v13, OS_SIGNPOST_INTERVAL_END, v17, "PCSFetchAggregator", "", buf, 2u);
      }
    }

  }
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v18, *MEMORY[0x1E0C94B20], 2003, CFSTR("Record with ID %@ is not a share"), *(_QWORD *)(a1 + 40));
      v19 = objc_claimAutoreleasedReturnValue();

      v7 = 0;
      v11 = (id)v19;
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void sub_1BEC71A20(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  os_signpost_id_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *, void *, void *);
  void *v32;
  id v33;
  id v34;
  uint8_t buf[4];
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  objc_msgSend_signpost(MEMORY[0x1E0C95140], a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  if (v4)
  {
    objc_msgSend_log(v4, v5, v6);
    v8 = objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend_identifier(v7, v9, v10);
    if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v12 = v11;
      if (os_signpost_enabled(v8))
      {
        v13 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v36 = v13;
        _os_signpost_emit_with_name_impl(&dword_1BE990000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PCSFetchAggregator", "Enqueuing fetch of zone %@", buf, 0xCu);
      }
    }

  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v14 = *MEMORY[0x1E0C952D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
  {
    v15 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v36 = v15;
    _os_log_impl(&dword_1BE990000, v14, OS_LOG_TYPE_INFO, "Enqueuing fetch of zone %@", buf, 0xCu);
  }
  v16 = *(void **)(a1 + 40);
  v17 = *(_QWORD *)(a1 + 48);
  v18 = objc_opt_class();
  objc_msgSend__lockedGetQueuedFetchForOperation_ofClass_(v16, v19, v17, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = *(_QWORD *)(a1 + 32);
  v29 = MEMORY[0x1E0C809B0];
  v30 = 3221225472;
  v31 = sub_1BEC71C50;
  v32 = &unk_1E78388E0;
  v33 = v7;
  v22 = *(_QWORD *)(a1 + 48);
  v34 = *(id *)(a1 + 56);
  v23 = v7;
  objc_msgSend_addRequestForZoneID_forOperation_withCompletionHandler_(v20, v24, v21, v22, &v29);
  objc_msgSend_fetchCoalescer(*(void **)(a1 + 40), v25, v26, v29, v30, v31, v32);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_coalesce_(v27, v28, 0);

}

void sub_1BEC71C50(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  os_signpost_id_t v17;
  uint8_t v18[16];

  v7 = a2;
  v8 = a3;
  v11 = a4;
  v12 = *(void **)(a1 + 32);
  if (v12)
  {
    objc_msgSend_log(v12, v9, v10);
    v13 = objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend_identifier(*(void **)(a1 + 32), v14, v15);
    if ((unint64_t)(v16 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v17 = v16;
      if (os_signpost_enabled(v13))
      {
        *(_WORD *)v18 = 0;
        _os_signpost_emit_with_name_impl(&dword_1BE990000, v13, OS_SIGNPOST_INTERVAL_END, v17, "PCSFetchAggregator", "", v18, 2u);
      }
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_1BEC71DA4(uint64_t a1)
{
  NSObject *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint8_t v33[128];
  uint8_t buf[4];
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v2 = *MEMORY[0x1E0C952D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134217984;
    v35 = v5;
    _os_log_impl(&dword_1BE990000, v2, OS_LOG_TYPE_INFO, "PCSFetchAggregator %p was cancelled", buf, 0xCu);
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend_queuedFetches(*(void **)(a1 + 32), v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v28, v33, 16);
  if (v8)
  {
    v11 = v8;
    v12 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(v6);
        objc_msgSend_cancelFetchOperation(*(void **)(*((_QWORD *)&v28 + 1) + 8 * i), v9, v10);
      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v28, v33, 16);
    }
    while (v11);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend_runningFetches(*(void **)(a1 + 32), v14, v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v24, v32, 16);
  if (v18)
  {
    v21 = v18;
    v22 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v25 != v22)
          objc_enumerationMutation(v16);
        objc_msgSend_cancelFetchOperation(*(void **)(*((_QWORD *)&v24 + 1) + 8 * j), v19, v20);
      }
      v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v24, v32, 16);
    }
    while (v21);
  }

}

void sub_1BEC720BC()
{
  void *v0;

  v0 = (void *)qword_1ED700AB8;
  qword_1ED700AB8 = (uint64_t)&unk_1E78AFF50;

}

uint64_t sub_1BEC7226C(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  void *v18;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 2)
      {
        v19 = 0;
        v20 = 0;
        v21 = 0;
        *(_BYTE *)(a1 + 24) |= 1u;
        while (1)
        {
          v22 = *v3;
          v23 = *(_QWORD *)(a2 + v22);
          if (v23 == -1 || v23 >= *(_QWORD *)(a2 + *v4))
            break;
          v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v23);
          *(_QWORD *)(a2 + v22) = v23 + 1;
          v21 |= (unint64_t)(v24 & 0x7F) << v19;
          if ((v24 & 0x80) == 0)
            goto LABEL_31;
          v19 += 7;
          v14 = v20++ >= 9;
          if (v14)
          {
            LODWORD(v21) = 0;
            goto LABEL_33;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_31:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v21) = 0;
LABEL_33:
        *(_DWORD *)(a1 + 8) = v21;
      }
      else if ((v10 >> 3) == 1)
      {
        PBReaderReadData();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 16);
        *(_QWORD *)(a1 + 16) = v17;

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1BEC72C98(void **a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  id v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  void (**v35)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  NSObject *v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[5];
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  objc_msgSend_error(a1[4], a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

    goto LABEL_3;
  }
  objc_msgSend_serverChangeTokenUpdatedBlock(a1[4], v5, v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
LABEL_3:
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v7 = a1[5];
    v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v43, v53, 16);
    if (v9)
    {
      v12 = v9;
      v13 = *(_QWORD *)v44;
      while (1)
      {
        if (*(_QWORD *)v44 != v13)
          objc_enumerationMutation(v7);
        objc_msgSend_perRequestGroup(a1[8], v10, v11);
        v14 = objc_claimAutoreleasedReturnValue();
        dispatch_group_leave(v14);

        if (!--v12)
        {
          v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v43, v53, 16);
          if (!v12)
            break;
        }
      }
    }
    goto LABEL_20;
  }
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v7 = a1[5];
  v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v16, (uint64_t)&v49, v54, 16);
  if (v17)
  {
    v19 = v17;
    v42 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v50 != v42)
          objc_enumerationMutation(v7);
        v21 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
        objc_msgSend_objectForKeyedSubscript_(a1[6], v18, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(a1[7], v23, v21);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_resultServerChangeTokenData(v22, v25, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
        {
          v30 = objc_alloc(MEMORY[0x1E0C95100]);
          objc_msgSend_resultServerChangeTokenData(v22, v31, v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = (void *)objc_msgSend_initWithData_(v30, v34, (uint64_t)v33);

        }
        objc_msgSend_serverChangeTokenUpdatedBlock(a1[4], v28, v29);
        v35 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend_status(v22, v36, v37);
        v47[0] = MEMORY[0x1E0C809B0];
        v47[1] = 3221225472;
        v47[2] = sub_1BEC72F7C;
        v47[3] = &unk_1E782EB38;
        v47[4] = a1[4];
        v48 = a1[8];
        ((void (**)(_QWORD, uint64_t, void *, uint64_t, void *, _QWORD *))v35)[2](v35, v21, v27, v38, v24, v47);

      }
      v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v18, (uint64_t)&v49, v54, 16);
    }
    while (v19);
  }
LABEL_20:

  objc_msgSend_fetchRecordsGroup(a1[4], v39, v40);
  v41 = objc_claimAutoreleasedReturnValue();
  dispatch_group_leave(v41);

}

void sub_1BEC72F7C(uint64_t a1, void *a2)
{
  const char *v3;
  uint64_t v4;
  id v5;
  void *v6;
  const char *v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (v5)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v6 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      v8 = *(void **)(a1 + 32);
      v9 = v6;
      objc_msgSend_operationID(v8, v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v12;
      v16 = 2112;
      v17 = v5;
      _os_log_impl(&dword_1BE990000, v9, OS_LOG_TYPE_INFO, "Finishing daemon operation %{public}@ due to client-returned error %@", (uint8_t *)&v14, 0x16u);

    }
    objc_msgSend_finishWithError_(*(void **)(a1 + 32), v7, (uint64_t)v5);
  }
  objc_msgSend_perRequestGroup(*(void **)(a1 + 40), v3, v4);
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_group_leave(v13);

}

void sub_1BEC73360(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  id v16;
  const char *v17;
  void *v18;
  const char *v19;
  id v20;

  v20 = a2;
  v5 = a3;
  if (objc_msgSend_status(v5, v6, v7))
  {
    objc_msgSend_objectForKeyedSubscript_(*(void **)(a1 + 32), v8, (uint64_t)v20);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v10 = objc_alloc(MEMORY[0x1E0C95100]);
      objc_msgSend_resultServerChangeTokenData(v5, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend_initWithData_(v10, v14, (uint64_t)v13);

      v16 = objc_alloc(MEMORY[0x1E0C94DA8]);
      v18 = (void *)objc_msgSend_initWithPreviousServerChangeToken_(v16, v17, (uint64_t)v15);
      objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1 + 40), v19, (uint64_t)v18, v20);

    }
  }

}

void sub_1BEC736A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, id a17)
{
  id *v17;
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a17);
  _Unwind_Resume(a1);
}

void sub_1BEC736EC(uint64_t a1, void *a2)
{
  id v3;
  CKDRecordResponse *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  id WeakRetained;
  const char *v14;
  void *v15;
  id v16;
  const char *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = [CKDRecordResponse alloc];
  objc_msgSend_recordID(v3, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_etag(v3, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_initWithRecordID_record_etag_(v4, v11, (uint64_t)v7, v3, v10);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v18[0] = v12;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v14, (uint64_t)v18, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend__handleChangedRecords_perRequestSchedulerInfo_(WeakRetained, v17, (uint64_t)v15, v16);

}

void sub_1BEC74BF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a43, 8);
  _Unwind_Resume(a1);
}

void sub_1BEC74C44(uint64_t a1, void *a2)
{
  void *v4;
  id v5;
  const char *v6;
  const char *v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v4)
  {
    v5 = a2;
    objc_msgSend_appendString_(v4, v6, (uint64_t)CFSTR(", "));
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CB37A0];
    v9 = a2;
    objc_msgSend_string(v8, v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

  }
  objc_msgSend_appendString_(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v7, (uint64_t)a2);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
}

uint64_t sub_1BEC757D0(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  uint64_t result;
  char v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  void *v37;
  CKCDPCodeServiceRequestOperationGroup *v38;
  uint64_t v39;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 88;
        goto LABEL_48;
      case 2u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 32;
        goto LABEL_48;
      case 3u:
        v19 = 0;
        v20 = 0;
        v21 = 0;
        *(_BYTE *)(a1 + 96) |= 2u;
        while (2)
        {
          v22 = *v3;
          v23 = *(_QWORD *)(a2 + v22);
          if (v23 == -1 || v23 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v23);
            *(_QWORD *)(a2 + v22) = v23 + 1;
            v21 |= (unint64_t)(v24 & 0x7F) << v19;
            if (v24 < 0)
            {
              v19 += 7;
              v14 = v20++ >= 9;
              if (v14)
              {
                LODWORD(v21) = 0;
                goto LABEL_58;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v21) = 0;
LABEL_58:
        v39 = 40;
        goto LABEL_63;
      case 4u:
        v25 = 0;
        v26 = 0;
        v21 = 0;
        *(_BYTE *)(a1 + 96) |= 4u;
        while (2)
        {
          v27 = *v3;
          v28 = *(_QWORD *)(a2 + v27);
          if (v28 == -1 || v28 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
            *(_QWORD *)(a2 + v27) = v28 + 1;
            v21 |= (unint64_t)(v29 & 0x7F) << v25;
            if (v29 < 0)
            {
              v25 += 7;
              v14 = v26++ >= 9;
              if (v14)
              {
                LODWORD(v21) = 0;
                goto LABEL_62;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v21) = 0;
LABEL_62:
        v39 = 56;
LABEL_63:
        *(_DWORD *)(a1 + v39) = v21;
        goto LABEL_68;
      case 5u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 64;
        goto LABEL_48;
      case 6u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 16;
        goto LABEL_48;
      case 8u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 24;
        goto LABEL_48;
      case 9u:
        v31 = 0;
        v32 = 0;
        v33 = 0;
        *(_BYTE *)(a1 + 96) |= 1u;
        while (2)
        {
          v34 = *v3;
          v35 = *(_QWORD *)(a2 + v34);
          if (v35 == -1 || v35 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v36 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v35);
            *(_QWORD *)(a2 + v34) = v35 + 1;
            v33 |= (unint64_t)(v36 & 0x7F) << v31;
            if (v36 < 0)
            {
              v31 += 7;
              v14 = v32++ >= 9;
              if (v14)
              {
                v33 = 0;
                goto LABEL_67;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v33 = 0;
LABEL_67:
        *(_QWORD *)(a1 + 8) = v33;
        goto LABEL_68;
      case 0xAu:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 80;
LABEL_48:
        v37 = *(void **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;

        goto LABEL_68;
      case 0xBu:
        v38 = objc_alloc_init(CKCDPCodeServiceRequestOperationGroup);
        objc_storeStrong((id *)(a1 + 72), v38);
        if (!PBReaderPlaceMark() || (sub_1BEB6AEB4((uint64_t)v38, a2) & 1) == 0)
          goto LABEL_70;
        goto LABEL_54;
      case 0xCu:
        v38 = objc_alloc_init(CKCDPCodeServiceRequestDatabaseOwner);
        objc_storeStrong((id *)(a1 + 48), v38);
        if (PBReaderPlaceMark() && (sub_1BEC59D3C((uint64_t)v38, a2) & 1) != 0)
        {
LABEL_54:
          PBReaderRecallMark();

LABEL_68:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_70:

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_68;
    }
  }
}

void sub_1BEC76874()
{
  CKDProcessScopedStateManager *v0;
  const char *v1;
  uint64_t v2;
  uint64_t inited;
  void *v4;

  v0 = [CKDProcessScopedStateManager alloc];
  inited = objc_msgSend_initInternal(v0, v1, v2);
  v4 = (void *)qword_1ED702CC0;
  qword_1ED702CC0 = inited;

}

void sub_1BEC76BFC(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  _BOOL4 v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  id obj;
  void *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  objc_msgSend_defaultContext(CKDLogicalDeviceContext, a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_metadataCache(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_knownAppContainerAccountTuples(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  obj = v10;
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v67, v71, 16);
  if (v12)
  {
    v15 = v12;
    v16 = *(_QWORD *)v68;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v68 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
        objc_msgSend_appContainerTuple(v18, v13, v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_applicationID(v19, v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_applicationBundleIdentifierOverrideForPushTopicGeneration(v22, v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v25;
        if (v25)
        {
          v29 = v25;
        }
        else
        {
          objc_msgSend_appContainerTuple(v18, v26, v27);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_applicationID(v30, v31, v32);
          v66 = v18;
          v33 = a1;
          v34 = v15;
          v35 = v16;
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_applicationBundleIdentifier(v36, v37, v38);
          v29 = (id)objc_claimAutoreleasedReturnValue();

          v16 = v35;
          v15 = v34;
          a1 = v33;
          v18 = v66;

        }
        if (objc_msgSend_isEqualToString_(v29, v39, *(_QWORD *)(a1 + 32)))
        {
          v42 = *(void **)(a1 + 40);
          objc_msgSend_appContainerTuple(v18, v40, v41);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_containerID(v43, v44, v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_containerIdentifier(v46, v47, v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v42) = objc_msgSend_containsObject_(v42, v50, (uint64_t)v49);

          if ((_DWORD)v42)
          {
            objc_msgSend_appContainerTuple(v18, v51, v52);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_personaID(v53, v54, v55);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = CKAdoptPersonaID(v56);

            if (v57)
            {
              objc_msgSend_defaultContext(CKDLogicalDeviceContext, v58, v59);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_tokenRegistrationScheduler(v60, v61, v62);
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_unregisterTokenForAppContainerAccountTuple_(v63, v64, (uint64_t)v18);

            }
          }
        }

      }
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v67, v71, 16);
    }
    while (v15);
  }

}

void sub_1BEC77070(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a2;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v4 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1BE990000, v4, OS_LOG_TYPE_INFO, "Resetting TCC access", v5, 2u);
  }
  TCCAccessReset();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_1BEC774CC(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v3;
  const char *v4;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  int v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const char *v26;
  int v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dataContainerURL(*(void **)(a1 + 32), a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  if (v3)
  {
    objc_msgSend_URLByAppendingPathComponent_isDirectory_(v3, v4, (uint64_t)CFSTR("Library/Caches/CloudKit"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_absoluteString(v6, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend_fileExistsAtPath_(v9, v13, (uint64_t)v12);

    if (v14)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v15 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
      {
        v18 = v15;
        objc_msgSend_absoluteString(v6, v19, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_CKSanitizedPath(v21, v22, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138412290;
        v28 = v24;
        _os_log_impl(&dword_1BE990000, v18, OS_LOG_TYPE_INFO, "Removing cache at %@", (uint8_t *)&v27, 0xCu);

      }
      objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v16, v17);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_removeItemAtURL_error_(v25, v26, (uint64_t)v6, 0);

    }
  }

}

uint64_t sub_1BEC77670(uint64_t a1)
{
  uint64_t result;

  result = CKAdoptPersonaID(*(void **)(a1 + 32));
  if ((_DWORD)result)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return result;
}

void sub_1BEC77B6C(uint64_t a1)
{
  void *v2;
  const char *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1BEC77BEC;
  v4[3] = &unk_1E7838A58;
  v2 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v2, v3, (uint64_t)v4);

}

void sub_1BEC77BEC(uint64_t a1, void *a2, void *a3)
{
  id v4;
  const char *v5;
  uint64_t v6;
  _QWORD *v7;
  dispatch_block_t *v8;
  os_log_t *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  int isOperationAllowedIndependentlyInSyncBubble;
  dispatch_block_t v22;
  os_log_t v23;
  const char *v24;
  uint64_t v25;
  NSObject *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  os_log_t v36;
  const char *v37;
  uint64_t v38;
  NSObject *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  os_log_t *v51;
  _QWORD *v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  NSString *v56;
  void *v57;
  const char *v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  int v80;
  const char *v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  void *v92;
  os_log_t v93;
  const __CFString *v94;
  NSObject *v95;
  const char *v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  NSString *v101;
  os_log_t v102;
  void *v103;
  void *v104;
  const char *v105;
  os_log_t v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  os_log_t *v111;
  _QWORD *v112;
  dispatch_block_t *v113;
  const __CFString *v114;
  NSObject *v115;
  const char *v116;
  uint64_t v117;
  void *v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  void *v122;
  const char *v123;
  void *v124;
  os_log_t v125;
  const char *v126;
  uint64_t v127;
  NSObject *v128;
  const char *v129;
  uint64_t v130;
  void *v131;
  void *v132;
  const char *v133;
  void *v134;
  const char *v135;
  NSString *v136;
  SEL v137;
  const char *v138;
  void *v139;
  void *v140;
  const char *v141;
  void *v142;
  const char *v143;
  uint64_t v144;
  const char *v145;
  const char *v146;
  const char *v147;
  const char *v148;
  const char *v149;
  uint64_t v150;
  os_log_t v151;
  const char *v152;
  uint64_t v153;
  void *v154;
  void *v155;
  const char *v156;
  NSObject *v157;
  const char *v158;
  uint64_t v159;
  void *v160;
  const char *v161;
  uint64_t v162;
  void *v163;
  NSObject *v164;
  const char *v165;
  uint64_t v166;
  void *v167;
  id v169;
  void *v170;
  id v171;
  _BYTE buf[12];
  __int16 v173;
  void *v174;
  __int16 v175;
  NSString *v176;
  __int16 v177;
  uint64_t v178;
  uint64_t v179;

  v179 = *MEMORY[0x1E0C80C00];
  v169 = a2;
  v4 = a3;
  objc_msgSend_operationInfo(v4, v5, v6);
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  v171 = v170;
  v7 = (_QWORD *)MEMORY[0x1E0C95300];
  v8 = (dispatch_block_t *)MEMORY[0x1E0C952F8];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v9 = (os_log_t *)MEMORY[0x1E0C952B0];
  v10 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    v13 = v10;
    objc_msgSend_operationID(v170, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v16;
    _os_log_impl(&dword_1BE990000, v13, OS_LOG_TYPE_INFO, "Found outstanding operation ID %{public}@", buf, 0xCu);

  }
  objc_msgSend_appContainerTuple(v169, v11, v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_personaID(v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  isOperationAllowedIndependentlyInSyncBubble = CKAdoptPersonaID(v20);

  v22 = *v8;
  if ((isOperationAllowedIndependentlyInSyncBubble & 1) == 0)
  {
    if (*v7 != -1)
      dispatch_once(MEMORY[0x1E0C95300], v22);
    v36 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
    {
      v39 = v36;
      objc_msgSend_appContainerTuple(v169, v40, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_personaID(v42, v43, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_operationID(v170, v46, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sharedManager(MEMORY[0x1E0DC5EE8], v49, v50);
      v51 = v9;
      v52 = v7;
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_currentPersona(v53, v54, v55);
      v56 = (NSString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v45;
      v173 = 2112;
      v174 = v48;
      v175 = 2112;
      v176 = v56;
      _os_log_impl(&dword_1BE990000, v39, OS_LOG_TYPE_INFO, "Could not adopt persona ID %@ for long-lived operation %@. Current persona is %@", buf, 0x20u);

      v7 = v52;
      v9 = v51;

      v8 = (dispatch_block_t *)MEMORY[0x1E0C952F8];
    }
    v57 = *(void **)(a1 + 32);
    objc_msgSend_operationID(v170, v37, v38);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v57, v58, (uint64_t)v29);
    goto LABEL_15;
  }
  if (*v7 != -1)
    dispatch_once(MEMORY[0x1E0C95300], v22);
  v23 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
  {
    v26 = v23;
    objc_msgSend_appContainerTuple(v169, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_personaID(v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationID(v170, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v32;
    v173 = 2112;
    v174 = v35;
    _os_log_impl(&dword_1BE990000, v26, OS_LOG_TYPE_INFO, "Adopted persona with ID %@ successfully for long-lived operation %@.", buf, 0x16u);

LABEL_15:
  }
  objc_msgSend_retryNumber(v4, v24, v25);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend_integerValue(v59, v60, v61);

  objc_msgSend_lastAttemptDate(v4, v63, v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  v68 = -1;
  if (v65 && v62 >= 1)
  {
    objc_msgSend_currentCalendar(MEMORY[0x1E0C99D48], v66, v67);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_date(MEMORY[0x1E0C99D68], v70, v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_components_fromDate_toDate_options_(v69, v73, 128, v65, v72, 0);
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    v68 = objc_msgSend_second(v74, v75, v76);
  }
  if (!isOperationAllowedIndependentlyInSyncBubble)
    goto LABEL_35;
  objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v66, v67);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = objc_msgSend_longlivedOperationMaxRetryCount(v77, v78, v79);

  if (v62 > v80)
    goto LABEL_34;
  objc_msgSend_ckOperationClassName(v170, v81, v82);
  v83 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v83)
  {
    if (*v7 != -1)
      dispatch_once(MEMORY[0x1E0C95300], *v8);
    v102 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_FAULT))
    {
      v164 = v102;
      objc_msgSend_operationID(v170, v165, v166);
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v167;
      _os_log_fault_impl(&dword_1BE990000, v164, OS_LOG_TYPE_FAULT, "Error preparing for long-lived operation %@. Operation class name missing.", buf, 0xCu);

    }
LABEL_34:
    v103 = *(void **)(a1 + 32);
    objc_msgSend_operationID(v170, v81, v82);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v103, v105, (uint64_t)v104);

    isOperationAllowedIndependentlyInSyncBubble = 0;
    goto LABEL_35;
  }
  if (CKIsRunningInSyncBubble())
  {
    objc_msgSend_ckOperationClassName(v170, v84, v85);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appContainerTuple(v169, v87, v88);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_containerID(v89, v90, v91);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    isOperationAllowedIndependentlyInSyncBubble = _isOperationAllowedIndependentlyInSyncBubble(v86, v92);

    if (*v7 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v93 = *v9;
    if (!os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
    {
      v8 = (dispatch_block_t *)MEMORY[0x1E0C952F8];
      v7 = (_QWORD *)MEMORY[0x1E0C95300];
      goto LABEL_37;
    }
    if (isOperationAllowedIndependentlyInSyncBubble)
      v94 = CFSTR("Allowing");
    else
      v94 = CFSTR("Denying");
    v95 = v93;
    objc_msgSend_operationID(v170, v96, v97);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ckOperationClassName(v170, v99, v100);
    v101 = (NSString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v94;
    v173 = 2114;
    v174 = v98;
    v175 = 2114;
    v176 = v101;
    _os_log_impl(&dword_1BE990000, v95, OS_LOG_TYPE_INFO, "%@ operation %{public}@ of class %{public}@ from running in sync bubble", buf, 0x20u);

    v8 = (dispatch_block_t *)MEMORY[0x1E0C952F8];
    v7 = (_QWORD *)MEMORY[0x1E0C95300];
  }
  else
  {
    isOperationAllowedIndependentlyInSyncBubble = 1;
  }
LABEL_35:
  if (*v7 != -1)
    dispatch_once(MEMORY[0x1E0C95300], *v8);
LABEL_37:
  v106 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
  {
    v109 = v68;
    v110 = v65;
    v111 = v9;
    v112 = v7;
    v113 = v8;
    if (isOperationAllowedIndependentlyInSyncBubble)
      v114 = &stru_1E7838F48;
    else
      v114 = CFSTR(" not");
    v115 = v106;
    objc_msgSend_operationID(v170, v116, v117);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v114;
    v8 = v113;
    v7 = v112;
    v9 = v111;
    v65 = v110;
    v173 = 2114;
    v174 = v118;
    v175 = 2048;
    v176 = (NSString *)(v62 + 1);
    v177 = 2048;
    v178 = v109;
    _os_log_impl(&dword_1BE990000, v115, OS_LOG_TYPE_INFO, "Will%@ enqueue outstanding operation ID %{public}@ for retry number %ld. Seconds since last retry:%ld", buf, 0x2Au);

  }
  if (isOperationAllowedIndependentlyInSyncBubble)
  {
    objc_msgSend_defaultContext(CKDLogicalDeviceContext, v107, v108);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sharedDetachedContainers(CKDContainer, v120, v121);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_containerWithAppContainerAccountTuple_deviceContext_sharedContainerTable_(CKDContainer, v123, (uint64_t)v169, v119, v122);
    v124 = (void *)objc_claimAutoreleasedReturnValue();

    if (*v7 != -1)
      dispatch_once(MEMORY[0x1E0C95300], *v8);
    v125 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
    {
      v128 = v125;
      objc_msgSend_operationID(v170, v129, v130);
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v131;
      v173 = 2112;
      v174 = v124;
      _os_log_impl(&dword_1BE990000, v128, OS_LOG_TYPE_INFO, "Starting outstanding operation ID %{public}@ for container %@", buf, 0x16u);

    }
    objc_msgSend_ckOperationClassName(v170, v126, v127);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_substringFromIndex_(v132, v133, 2);
    v134 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v135, (uint64_t)CFSTR("perform%@:withBlock:"), v134);
    v136 = (NSString *)objc_claimAutoreleasedReturnValue();
    v137 = NSSelectorFromString(v136);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      *(_QWORD *)buf = &unk_1E7838A30;
      v139 = (void *)MEMORY[0x1E0C99DB8];
      objc_msgSend_methodSignatureForSelector_(v124, v138, (uint64_t)v137);
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_invocationWithMethodSignature_(v139, v141, (uint64_t)v140);
      v142 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_retainArguments(v142, v143, v144);
      objc_msgSend_setTarget_(v142, v145, (uint64_t)v124);
      objc_msgSend_setSelector_(v142, v146, (uint64_t)v137);
      objc_msgSend_setArgument_atIndex_(v142, v147, (uint64_t)&v171, 2);
      objc_msgSend_setArgument_atIndex_(v142, v148, (uint64_t)buf, 3);
      objc_msgSend_invoke(v142, v149, v150);

    }
    else
    {
      if (*v7 != -1)
        dispatch_once(MEMORY[0x1E0C95300], *v8);
      v151 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
      {
        v157 = v151;
        objc_msgSend_operationID(v170, v158, v159);
        v160 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_ckOperationClassName(v170, v161, v162);
        v163 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v160;
        v173 = 2114;
        v174 = v163;
        v175 = 2114;
        v176 = v136;
        _os_log_error_impl(&dword_1BE990000, v157, OS_LOG_TYPE_ERROR, "Operation %{public}@ with ckOperationClassName %{public}@ doesn't respond to selector %{public}@. Dropping from long lived cache.", buf, 0x20u);

      }
      v154 = *(void **)(a1 + 40);
      objc_msgSend_operationID(v170, v152, v153);
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_deleteAllInfoForOperationWithID_(v154, v156, (uint64_t)v155);

    }
  }

}

uint64_t sub_1BEC79108(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend_zoneID(a2, (const char *)a2, a3);
}

void sub_1BEC7C518(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

id sub_1BEC7C560(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v3 = a2;
  if (objc_msgSend_needsEncryption(v3, v4, v5))
  {
    objc_msgSend_valueID(v3, v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10 && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    {
      objc_msgSend_errorWithDomain_code_userInfo_format_(MEMORY[0x1E0C94FF8], v8, *MEMORY[0x1E0C94B20], 1017, 0, CFSTR("Unable to upload mergeable delta without a value ID"));
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;

    }
    objc_msgSend_recordID(v10, v8, v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15 && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    {
      objc_msgSend_errorWithDomain_code_userInfo_format_(MEMORY[0x1E0C94FF8], v14, *MEMORY[0x1E0C94B20], 1017, 0, CFSTR("Unable to upload mergeable delta without a record ID"));
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v18 = *(void **)(v17 + 40);
      *(_QWORD *)(v17 + 40) = v16;

    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void sub_1BEC7C670(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  const char *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t v19;
  id v20;

  v5 = a2;
  v6 = a3;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  objc_msgSend_container(*(void **)(a1 + 40), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pcsCache(v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(a1 + 40);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1BEC7C79C;
  v16[3] = &unk_1E7838AE8;
  objc_copyWeak(&v20, (id *)(a1 + 56));
  v19 = *(_QWORD *)(a1 + 48);
  v14 = v6;
  v17 = v14;
  v18 = *(id *)(a1 + 32);
  objc_msgSend_fetchPCSForRecordWithID_forOperation_options_withCompletionHandler_(v12, v15, (uint64_t)v5, v13, 0, v16);

  objc_destroyWeak(&v20);
}

void sub_1BEC7C788(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1BEC7C79C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  CKDKeyEnvelopeContext *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  id v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  uint64_t v30;
  const char *v31;
  const char *v32;
  char v33;
  id v34;
  void *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t buf[4];
  id v61;
  __int16 v62;
  void *v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v5)
    {
      v53 = v6;
      v8 = objc_alloc_init(CKDKeyEnvelopeContext);
      v54 = v5;
      v11 = objc_msgSend_pcs(v5, v9, v10);
      objc_msgSend_setShareProtection_(v8, v12, v11);
      v52 = WeakRetained;
      objc_msgSend_container(WeakRetained, v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_options(v15, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_encryptMergeableValueMetadata(v18, v19, v20);

      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v21 = *(id *)(a1 + 32);
      v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v56, v64, 16);
      if (v23)
      {
        v26 = v23;
        v27 = *(_QWORD *)v57;
        while (2)
        {
          for (i = 0; i != v26; ++i)
          {
            if (*(_QWORD *)v57 != v27)
              objc_enumerationMutation(v21);
            v29 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
            objc_msgSend_encryptMetadataTernary(v29, v24, v25);
            v30 = CKBoolFromCKTernaryWithDefault();
            objc_msgSend_setEncryptMergeableValueMetadata_(v8, v31, v30);
            v55 = 0;
            v33 = objc_msgSend_encryptWithContext_error_(v29, v32, (uint64_t)v8, &v55);
            v34 = v55;
            v35 = v34;
            if ((v33 & 1) == 0)
            {
              if (*MEMORY[0x1E0C95300] != -1)
                dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
              v36 = (void *)*MEMORY[0x1E0C952C0];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952C0], OS_LOG_TYPE_ERROR))
              {
                v45 = v36;
                objc_msgSend_metadata(v29, v46, v47);
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_identifier(v48, v49, v50);
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v61 = v51;
                v62 = 2112;
                v63 = v35;
                _os_log_error_impl(&dword_1BE990000, v45, OS_LOG_TYPE_ERROR, "Failed to encrypt delta, %@, with error: %@", buf, 0x16u);

              }
              if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
              {
                objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v37, *MEMORY[0x1E0C94B20], 5004, v35, CFSTR("Failed to encrypt mergeable delta"));
                v38 = objc_claimAutoreleasedReturnValue();
                v39 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
                v40 = *(void **)(v39 + 40);
                *(_QWORD *)(v39 + 40) = v38;

              }
              goto LABEL_19;
            }

          }
          v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v56, v64, 16);
          if (v26)
            continue;
          break;
        }
      }
LABEL_19:

      v6 = v53;
      v5 = v54;
      WeakRetained = v52;
      goto LABEL_20;
    }
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v41 = *MEMORY[0x1E0C952C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952C0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v61 = v6;
      _os_log_error_impl(&dword_1BE990000, v41, OS_LOG_TYPE_ERROR, "Error fetching PCS to encrypt deltas: %@", buf, 0xCu);
    }
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v42, *MEMORY[0x1E0C94B20], 5001, v6, CFSTR("Failed to fetch PCS to encrypt mergeable delta"));
      v43 = objc_claimAutoreleasedReturnValue();
      v44 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v8 = *(CKDKeyEnvelopeContext **)(v44 + 40);
      *(_QWORD *)(v44 + 40) = v43;
LABEL_20:

    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

uint64_t sub_1BEC7CB70(_QWORD *a1)
{
  void *v2;
  uint64_t result;
  void *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v2 = (void *)*MEMORY[0x1E0C952C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952C0], OS_LOG_TYPE_DEBUG))
  {
    v4 = (void *)a1[4];
    v5 = v2;
    objc_msgSend_operationID(v4, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_debug_impl(&dword_1BE990000, v5, OS_LOG_TYPE_DEBUG, "Did encrypt mergeable deltas for operation %{public}@", (uint8_t *)&v9, 0xCu);

  }
  result = a1[5];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
  return result;
}

uint64_t sub_1BEC7CD9C(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  CKDPShareIdentifier *v17;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(CKDPShareIdentifier);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || !CKDPShareIdentifierReadFrom((uint64_t)v17, a2))
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1BEC7D180()
{
  void *v0;

  v0 = (void *)qword_1ED700AC8;
  qword_1ED700AC8 = (uint64_t)&unk_1E78AFF78;

}

BOOL sub_1BEC7D358(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  CKDPShareIdentifier *v17;
  uint64_t v18;
  uint64_t v19;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      switch((v10 >> 3))
      {
        case 1u:
          v17 = objc_alloc_init(CKDPShareIdentifier);
          objc_storeStrong((id *)(a1 + 32), v17);
          if (PBReaderPlaceMark() && CKDPShareIdentifierReadFrom((uint64_t)v17, a2))
          {
            PBReaderRecallMark();
            goto LABEL_28;
          }

          return 0;
        case 2u:
          PBReaderReadData();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 16;
          goto LABEL_27;
        case 3u:
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 24;
          goto LABEL_27;
        case 4u:
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 8;
LABEL_27:
          v17 = *(CKDPShareIdentifier **)(a1 + v19);
          *(_QWORD *)(a1 + v19) = v18;
LABEL_28:

          goto LABEL_29;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0)
            return 0;
LABEL_29:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          break;
      }
    }
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t CKDPNotificationSyncResponsePushMessageReadFrom(_BYTE *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  const char *v37;
  void *v38;
  void *v39;
  const char *v40;
  uint64_t v41;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v17 = 0;
          v18 = 0;
          v19 = 0;
          a1[116] |= 4u;
          while (1)
          {
            v20 = *v3;
            v21 = *(_QWORD *)(a2 + v20);
            if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
              break;
            v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
            *(_QWORD *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0)
              goto LABEL_60;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              v19 = 0;
              goto LABEL_62;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_60:
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_62:
          a1[112] = v19 != 0;
          continue;
        case 2u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 104;
          goto LABEL_53;
        case 3u:
          v26 = 0;
          v27 = 0;
          v28 = 0;
          a1[116] |= 2u;
          while (2)
          {
            v29 = *v3;
            v30 = *(_QWORD *)(a2 + v29);
            if (v30 == -1 || v30 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v30);
              *(_QWORD *)(a2 + v29) = v30 + 1;
              v28 |= (unint64_t)(v31 & 0x7F) << v26;
              if (v31 < 0)
              {
                v26 += 7;
                v14 = v27++ >= 9;
                if (v14)
                {
                  LODWORD(v28) = 0;
                  goto LABEL_66;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v28) = 0;
LABEL_66:
          v41 = 48;
          goto LABEL_71;
        case 4u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 24;
          goto LABEL_53;
        case 5u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 40;
          goto LABEL_53;
        case 6u:
          v32 = 0;
          v33 = 0;
          v28 = 0;
          a1[116] |= 1u;
          break;
        case 7u:
          PBReaderReadData();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 32;
          goto LABEL_53;
        case 8u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 16;
          goto LABEL_53;
        case 9u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 80;
          goto LABEL_53;
        case 0xAu:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 96;
          goto LABEL_53;
        case 0xBu:
          PBReaderReadString();
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          if (v38)
            objc_msgSend_addTitleLocalizedArguments_(a1, v37, (uint64_t)v38);
          goto LABEL_58;
        case 0xCu:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 56;
          goto LABEL_53;
        case 0xDu:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 72;
LABEL_53:
          v39 = *(void **)&a1[v25];
          *(_QWORD *)&a1[v25] = v24;

          continue;
        case 0xEu:
          PBReaderReadString();
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          if (v38)
            objc_msgSend_addSubtitleLocalizedArguments_(a1, v40, (uint64_t)v38);
LABEL_58:

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v34 = *v3;
        v35 = *(_QWORD *)(a2 + v34);
        if (v35 == -1 || v35 >= *(_QWORD *)(a2 + *v4))
          break;
        v36 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v35);
        *(_QWORD *)(a2 + v34) = v35 + 1;
        v28 |= (unint64_t)(v36 & 0x7F) << v32;
        if ((v36 & 0x80) == 0)
          goto LABEL_68;
        v32 += 7;
        v14 = v33++ >= 9;
        if (v14)
        {
          LODWORD(v28) = 0;
          goto LABEL_70;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_68:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v28) = 0;
LABEL_70:
      v41 = 8;
LABEL_71:
      *(_DWORD *)&a1[v41] = v28;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL sub_1BEC7FC90(_QWORD *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  CKDPProtectionInfoKeysToRemoveProtectionInfoKey *v17;
  const char *v18;
  uint64_t v19;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(CKDPProtectionInfoKeysToRemoveProtectionInfoKey);
        objc_msgSend_addKeysToRemove_(a1, v18, (uint64_t)v17);
        if (!PBReaderPlaceMark() || (sub_1BEC63044((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_26:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadString();
    v19 = objc_claimAutoreleasedReturnValue();
    v17 = (CKDPProtectionInfoKeysToRemoveProtectionInfoKey *)a1[2];
    a1[2] = v19;
LABEL_24:

    goto LABEL_26;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1BEC80B90(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEC80C14(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEC80C80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1BEC80DC0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_1BEC8120C(uint64_t a1, const char *a2)
{
  void *v2;
  _QWORD v4[5];

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1BEC81268;
  v4[3] = &unk_1E78364E8;
  v4[4] = v2;
  return (id)objc_msgSend_performDatabaseOperation_(v2, a2, (uint64_t)v4);
}

void sub_1BEC81268(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  const char *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[8];
  _QWORD v22[6];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v7 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE990000, v7, OS_LOG_TYPE_INFO, "Removing all container metadata cached info", buf, 2u);
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v22[0] = CFSTR("PushTokens");
  v22[1] = CFSTR("AppContainerAccount");
  v22[2] = CFSTR("ContainerServerInfo");
  v22[3] = CFSTR("ServerConfiguration");
  v22[4] = CFSTR("VerifiedPublicKey");
  v22[5] = CFSTR("DSIDMap");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v8, (uint64_t)v22, 6, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v17, v23, 16);
  if (v11)
  {
    v13 = v11;
    v14 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v9);
        objc_msgSend_deleteFrom_where_bindings_(v5, v12, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), CFSTR("1"), 0);
      }
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v17, v23, 16);
    }
    while (v13);
  }

  objc_msgSend_inlock_setDateOfLastTokenUpdate_(*(void **)(a1 + 32), v16, 0);
}

id sub_1BEC814CC(uint64_t a1, const char *a2)
{
  return (id)objc_msgSend_performDatabaseOperation_(*(void **)(a1 + 32), a2, (uint64_t)&unk_1E7838B98);
}

void sub_1BEC814F4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  const char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = a2;
  objc_msgSend_stringWithFormat_(v2, v4, (uint64_t)CFSTR("%@ < ?"), CFSTR("expirationDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_date(MEMORY[0x1E0C99D68], v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v9, (uint64_t)v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deleteFrom_where_bindings_(v3, v11, (uint64_t)CFSTR("PushTokens"), v5, v10);

}

void sub_1BEC81660(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  const char *v10;
  void *v11;
  const char *v12;
  const char *v13;
  void *v14;
  const char *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a2;
  objc_msgSend_stringWithFormat_(v3, v5, (uint64_t)CFSTR("%@ = ?"), CFSTR("accountID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v7, (uint64_t)v22, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deleteFrom_where_bindings_(v4, v9, (uint64_t)CFSTR("ContainerServerInfo"), v6, v8);

  v21 = *(_QWORD *)(a1 + 32);
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v10, (uint64_t)&v21, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deleteFrom_where_bindings_(v4, v12, (uint64_t)CFSTR("PushTokens"), v6, v11);

  v20 = *(_QWORD *)(a1 + 32);
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v13, (uint64_t)&v20, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deleteFrom_where_bindings_(v4, v15, (uint64_t)CFSTR("AppContainerAccount"), v6, v14);

  v19 = *(_QWORD *)(a1 + 32);
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v16, (uint64_t)&v19, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deleteFrom_where_bindings_(v4, v18, (uint64_t)CFSTR("DSIDMap"), v6, v17);

}

uint64_t sub_1BEC817F0()
{
  return 0;
}

uint64_t sub_1BEC81890(uint64_t a1)
{
  NSObject *v2;
  const char *v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v2 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1BE990000, v2, OS_LOG_TYPE_INFO, "Removing container metadata cached info for accountID %@", (uint8_t *)&v6, 0xCu);
  }
  return objc_msgSend_inlock_expungeDataForAccountID_(*(void **)(a1 + 40), v3, *(_QWORD *)(a1 + 32));
}

void sub_1BEC819D8(uint64_t a1, const char *a2)
{
  void *v3;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  void *v26;
  os_log_t *v27;
  void *v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  id v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  const char *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t v55[128];
  uint8_t buf[4];
  uint64_t v57;
  __int16 v58;
  void *v59;
  _QWORD v60[4];

  v60[1] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v60[0] = CFSTR("accountID");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], a2, (uint64_t)v60, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_select_from_(v3, v5, (uint64_t)v4, CFSTR("ContainerServerInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_valueForKey_(v6, v7, (uint64_t)CFSTR("accountID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v8, v9, v10))
  {
    objc_msgSend_setWithArray_(MEMORY[0x1E0C99E60], v11, (uint64_t)v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sharedAccountStore(CKDAccountStore, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_accountStore(v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v48 = v18;
    objc_msgSend_aa_appleAccounts(v18, v19, v20);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_valueForKeyPath_(v47, v21, (uint64_t)CFSTR("identifier"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_count(v22, v23, v24))
    {
      objc_msgSend_setWithArray_(MEMORY[0x1E0C99E60], v25, (uint64_t)v22);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = 0;
    }
    v49 = v8;
    v50 = v6;
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v46 = v22;
    v27 = (os_log_t *)MEMORY[0x1E0C952B0];
    v28 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      v29 = v28;
      objc_msgSend_allObjects(v26, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_allObjects(v12, v33, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v57 = (uint64_t)v32;
      v58 = 2112;
      v59 = v35;
      _os_log_impl(&dword_1BE990000, v29, OS_LOG_TYPE_INFO, "Got the following Apple account identifiers from Accounts:\n%@\nCached account identifiers:\n%@", buf, 0x16u);

    }
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v36 = v12;
    v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v37, (uint64_t)&v51, v55, 16);
    if (v38)
    {
      v40 = v38;
      v41 = *(_QWORD *)v52;
      do
      {
        v42 = 0;
        do
        {
          if (*(_QWORD *)v52 != v41)
            objc_enumerationMutation(v36);
          v43 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * v42);
          if ((objc_msgSend_containsObject_(v26, v39, v43) & 1) == 0)
          {
            if (*MEMORY[0x1E0C95300] != -1)
              dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v44 = *v27;
            if (os_log_type_enabled(*v27, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v57 = v43;
              _os_log_impl(&dword_1BE990000, v44, OS_LOG_TYPE_INFO, "Removing container metadata cached info for stale accountID %@", buf, 0xCu);
            }
            objc_msgSend_inlock_expungeDataForAccountID_(*(void **)(a1 + 32), v45, v43);
          }
          ++v42;
        }
        while (v40 != v42);
        v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v39, (uint64_t)&v51, v55, 16);
      }
      while (v40);
    }

    v8 = v49;
    v6 = v50;
  }

}

void sub_1BEC81E58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BEC81E70(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  void *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  const char *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  void *v45;
  const char *v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  id v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  CKDPushToken *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  _QWORD v63[2];
  _QWORD v64[4];
  _QWORD v65[5];

  v65[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend_appContainerTuple(*(void **)(a1 + 32), a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = CFSTR("applicationID");
  objc_msgSend_applicationID(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v65[0] = v7;
  v64[1] = CFSTR("containerID");
  objc_msgSend_containerID(v4, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v65[1] = v10;
  v64[2] = CFSTR("personaID");
  objc_msgSend_personaID(v4, v11, v12);
  v13 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v13;
  if (v13)
    v17 = (const __CFString *)v13;
  else
    v17 = &stru_1E7838F48;
  v65[2] = v17;
  v64[3] = CFSTR("accountID");
  objc_msgSend_accountID(*(void **)(a1 + 32), v14, v15);
  v18 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v18;
  if (v18)
    v21 = (const __CFString *)v18;
  else
    v21 = &stru_1E7838F48;
  v65[3] = v21;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v19, (uint64_t)v65, v64, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_equalityClauseAndBindingsForDict_(MEMORY[0x1E0C950E0], v23, (uint64_t)v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_v1(v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_v2(v24, v28, v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend_stringByAppendingFormat_(v27, v30, (uint64_t)CFSTR("AND %@ > ?"), CFSTR("expirationDate"));
    v32 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_date(MEMORY[0x1E0C99D68], v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_arrayByAddingObject_(v31, v36, (uint64_t)v35);
    v37 = objc_claimAutoreleasedReturnValue();

    v31 = (void *)v37;
    v27 = (void *)v32;
  }
  v38 = *(void **)(a1 + 40);
  v63[0] = CFSTR("apsToken");
  v63[1] = CFSTR("apsEnvironment");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v30, (uint64_t)v63, 2);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_select_from_where_bindings_(v38, v40, (uint64_t)v39, CFSTR("PushTokens"), v27, v31);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_count(v41, v42, v43))
  {
    v62 = v22;
    objc_msgSend_objectAtIndexedSubscript_(v41, v44, 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v45, v46, (uint64_t)CFSTR("apsEnvironment"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lowercaseString(v47, v48, v49);
    v50 = objc_claimAutoreleasedReturnValue();
    v51 = (void *)v50;
    v52 = (void *)*MEMORY[0x1E0CFE130];
    if (v50)
      v52 = (void *)v50;
    v53 = v52;

    objc_msgSend_objectForKeyedSubscript_(v45, v54, (uint64_t)CFSTR("apsToken"));
    v55 = objc_claimAutoreleasedReturnValue();
    v56 = (void *)v55;
    if (v53 && v55)
    {
      v57 = [CKDPushToken alloc];
      v59 = objc_msgSend_initWithAPSEnvironmentString_apsToken_(v57, v58, (uint64_t)v53, v56);
      v60 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v61 = *(void **)(v60 + 40);
      *(_QWORD *)(v60 + 40) = v59;

    }
    v22 = v62;
  }

}

void sub_1BEC82244(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  id v24;
  const char *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  _QWORD v30[4];
  _QWORD v31[5];

  v31[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend_appContainerTuple(*(void **)(a1 + 32), a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = CFSTR("applicationID");
  objc_msgSend_applicationID(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v7;
  v30[1] = CFSTR("containerID");
  objc_msgSend_containerID(v4, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v10;
  v30[2] = CFSTR("personaID");
  objc_msgSend_personaID(v4, v11, v12);
  v13 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v13;
  if (v13)
    v17 = (const __CFString *)v13;
  else
    v17 = &stru_1E7838F48;
  v31[2] = v17;
  v30[3] = CFSTR("accountID");
  objc_msgSend_accountID(*(void **)(a1 + 32), v14, v15);
  v18 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v18;
  if (v18)
    v21 = (const __CFString *)v18;
  else
    v21 = &stru_1E7838F48;
  v31[3] = v21;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v19, (uint64_t)v31, v30, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = sub_1BEC823EC;
  v27[3] = &unk_1E7838C28;
  v23 = *(void **)(a1 + 40);
  v28 = *(id *)(a1 + 48);
  v29 = v22;
  v24 = v22;
  v26 = (id)objc_msgSend_performDatabaseOperation_(v23, v25, (uint64_t)v27);

}

void sub_1BEC823EC(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  const char *v20;
  void *v21;
  uint64_t v22;
  id v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  id v32;
  _QWORD v33[3];
  _QWORD v34[4];

  v34[3] = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v3 = (void *)MEMORY[0x1E0C99D68];
    v4 = a2;
    objc_msgSend_dateWithTimeIntervalSinceNow_(v3, v5, v6, 604800.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend_mutableCopy(*(void **)(a1 + 40), v8, v9);
    v33[0] = CFSTR("apsToken");
    objc_msgSend_apsToken(*(void **)(a1 + 32), v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v13;
    v33[1] = CFSTR("apsEnvironment");
    objc_msgSend_apsEnvironmentString(*(void **)(a1 + 32), v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v33[2] = CFSTR("expirationDate");
    v34[1] = v16;
    v34[2] = v7;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v17, (uint64_t)v34, v33, 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addEntriesFromDictionary_(v10, v19, (uint64_t)v18);

    objc_msgSend_insertOrReplaceInto_values_(v4, v20, (uint64_t)CFSTR("PushTokens"), v10);
  }
  else
  {
    v21 = (void *)MEMORY[0x1E0C950E0];
    v22 = *(_QWORD *)(a1 + 40);
    v23 = a2;
    objc_msgSend_equalityClauseAndBindingsForDict_(v21, v24, v22);
    v32 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_v1(v32, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_v2(v32, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deleteFrom_where_bindings_(v23, v31, (uint64_t)CFSTR("PushTokens"), v27, v30);

  }
}

void sub_1BEC826B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BEC826D0(uint64_t a1, const char *a2)
{
  void *v3;
  void *v4;
  const char *v5;
  const char *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  const __CFString *v18;
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v19[0] = CFSTR("applicationID");
  v19[1] = CFSTR("containerID");
  v19[2] = CFSTR("personaID");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], a2, (uint64_t)v19, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v5, (uint64_t)CFSTR("%@ = ?"), CFSTR("accountID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(const __CFString **)(a1 + 40);
  if (!v8)
    v8 = &stru_1E7838F48;
  v18 = v8;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v6, (uint64_t)&v18, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_select_from_where_bindings_(v3, v10, (uint64_t)v4, CFSTR("AppContainerAccount"), v7, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1BEC82860;
  v16[3] = &unk_1E7834510;
  v17 = *(id *)(a1 + 40);
  objc_msgSend_CKCompactMap_(v11, v12, (uint64_t)v16);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

}

id sub_1BEC82860(uint64_t a1, void *a2)
{
  id v3;
  CKDApplicationID *v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  id v9;
  const char *v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  CKDAppContainerTuple *v20;
  const char *v21;
  void *v22;
  CKDAppContainerAccountTuple *v23;
  const char *v24;

  v3 = a2;
  v4 = [CKDApplicationID alloc];
  objc_msgSend_objectForKeyedSubscript_(v3, v5, (uint64_t)CFSTR("applicationID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend_initWithSqliteRepresentation_(v4, v7, (uint64_t)v6);

  v9 = objc_alloc(MEMORY[0x1E0C94C40]);
  objc_msgSend_objectForKeyedSubscript_(v3, v10, (uint64_t)CFSTR("containerID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend_initWithSqliteRepresentation_(v9, v12, (uint64_t)v11);

  objc_msgSend_objectForKeyedSubscript_(v3, v14, (uint64_t)CFSTR("personaID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_CKNilIfLengthZero(v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0;
  if (v8 && v13)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      v20 = [CKDAppContainerTuple alloc];
      v22 = (void *)objc_msgSend_initWithApplicationID_containerID_personaID_(v20, v21, (uint64_t)v8, v13, v18);
      v23 = [CKDAppContainerAccountTuple alloc];
      v19 = (void *)objc_msgSend_initWithAppContainerTuple_accountID_(v23, v24, (uint64_t)v22, *(_QWORD *)(a1 + 32));

    }
    else
    {
      v19 = 0;
    }
  }

  return v19;
}

void sub_1BEC82A74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BEC82A8C(uint64_t a1, const char *a2)
{
  void *v3;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v16[0] = CFSTR("applicationID");
  v16[1] = CFSTR("containerID");
  v16[2] = CFSTR("personaID");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], a2, (uint64_t)v16, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_select_from_(v3, v5, (uint64_t)v4, CFSTR("AppContainerAccount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_CKCompactMap_(v6, v7, (uint64_t)&unk_1E7838C48);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(MEMORY[0x1E0C99E60], v9, (uint64_t)v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allObjects(v10, v11, v12);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

}

id sub_1BEC82B9C(uint64_t a1, void *a2)
{
  id v2;
  CKDApplicationID *v3;
  const char *v4;
  void *v5;
  const char *v6;
  void *v7;
  id v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  CKDAppContainerTuple *v19;
  const char *v20;

  v2 = a2;
  v3 = [CKDApplicationID alloc];
  objc_msgSend_objectForKeyedSubscript_(v2, v4, (uint64_t)CFSTR("applicationID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend_initWithSqliteRepresentation_(v3, v6, (uint64_t)v5);

  v8 = objc_alloc(MEMORY[0x1E0C94C40]);
  objc_msgSend_objectForKeyedSubscript_(v2, v9, (uint64_t)CFSTR("containerID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_initWithSqliteRepresentation_(v8, v11, (uint64_t)v10);

  objc_msgSend_objectForKeyedSubscript_(v2, v13, (uint64_t)CFSTR("personaID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_CKNilIfLengthZero(v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0;
  if (v7 && v12)
  {
    v19 = [CKDAppContainerTuple alloc];
    v18 = (void *)objc_msgSend_initWithApplicationID_containerID_personaID_(v19, v20, (uint64_t)v7, v12, v17);
  }

  return v18;
}

void sub_1BEC82D74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BEC82D8C(uint64_t a1, const char *a2)
{
  void *v3;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v11[0] = CFSTR("applicationID");
  v11[1] = CFSTR("containerID");
  v11[2] = CFSTR("personaID");
  v11[3] = CFSTR("accountID");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], a2, (uint64_t)v11, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_select_from_(v3, v5, (uint64_t)v4, CFSTR("AppContainerAccount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_CKCompactMap_(v6, v7, (uint64_t)&unk_1E7838C68);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

id sub_1BEC82E78(uint64_t a1, void *a2)
{
  id v2;
  CKDApplicationID *v3;
  const char *v4;
  void *v5;
  const char *v6;
  void *v7;
  id v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  CKDAppContainerTuple *v24;
  const char *v25;
  void *v26;
  CKDAppContainerAccountTuple *v27;
  const char *v28;

  v2 = a2;
  v3 = [CKDApplicationID alloc];
  objc_msgSend_objectForKeyedSubscript_(v2, v4, (uint64_t)CFSTR("applicationID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend_initWithSqliteRepresentation_(v3, v6, (uint64_t)v5);

  v8 = objc_alloc(MEMORY[0x1E0C94C40]);
  objc_msgSend_objectForKeyedSubscript_(v2, v9, (uint64_t)CFSTR("containerID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_initWithSqliteRepresentation_(v8, v11, (uint64_t)v10);

  objc_msgSend_objectForKeyedSubscript_(v2, v13, (uint64_t)CFSTR("personaID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKNilIfLengthZero(v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectForKeyedSubscript_(v2, v18, (uint64_t)CFSTR("accountID"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_CKNilIfLengthZero(v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0;
  if (v7 && v12 && v22)
  {
    v24 = [CKDAppContainerTuple alloc];
    v26 = (void *)objc_msgSend_initWithApplicationID_containerID_personaID_(v24, v25, (uint64_t)v7, v12, v17);
    v27 = [CKDAppContainerAccountTuple alloc];
    v23 = (void *)objc_msgSend_initWithAppContainerTuple_accountID_(v27, v28, (uint64_t)v26, v22);

  }
  return v23;
}

void sub_1BEC830A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BEC830C0(uint64_t a1, const char *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend_datePropertyForKey_(*(void **)(a1 + 32), a2, (uint64_t)CFSTR("lastTokenUpdate"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t sub_1BEC831A4(uint64_t a1, const char *a2)
{
  return objc_msgSend_inlock_setDateOfLastTokenUpdate_(*(void **)(a1 + 32), a2, *(_QWORD *)(a1 + 40));
}

void sub_1BEC832A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BEC832B8(uint64_t a1, const char *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend_inlock_applicationMetadataForApplicationID_(*(void **)(a1 + 32), a2, *(_QWORD *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void sub_1BEC832F4(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  const __CFString *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend_insertOrReplaceInto_values_(v4, v5, (uint64_t)CFSTR("AppBundle"), v3);
  v6 = *(_QWORD *)(a1 + 40);
  v27 = CFSTR("applicationID");
  v28[0] = v6;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v7, (uint64_t)v28, &v27, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_equalityClauseAndBindingsForDict_(MEMORY[0x1E0C950E0], v9, (uint64_t)v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v11, (uint64_t)CFSTR("%@ = %@"), CFSTR("tokenRegistered"), &unk_1E78B0A18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_v1(v10, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_v2(v10, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_update_set_where_bindings_limit_(v4, v19, (uint64_t)CFSTR("AppContainerAccount"), v12, v15, v18, 0);

  objc_msgSend_v1(v10, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_v2(v10, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deleteFrom_where_bindings_(v4, v26, (uint64_t)CFSTR("PushTokens"), v22, v25);

}

void sub_1BEC83548(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BEC83560(uint64_t a1, const char *a2)
{
  void *v3;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v11[0] = CFSTR("applicationID");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], a2, (uint64_t)v11, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_select_from_(v3, v5, (uint64_t)v4, CFSTR("AppBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_CKCompactMap_(v6, v7, (uint64_t)&unk_1E7838C88);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

id sub_1BEC83630(uint64_t a1, void *a2)
{
  id v2;
  CKDApplicationID *v3;
  const char *v4;
  void *v5;
  const char *v6;
  void *v7;

  v2 = a2;
  v3 = [CKDApplicationID alloc];
  objc_msgSend_objectForKeyedSubscript_(v2, v4, (uint64_t)CFSTR("applicationID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend_initWithSqliteRepresentation_(v3, v6, (uint64_t)v5);
  return v7;
}

void sub_1BEC83768(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BEC83780(uint64_t a1, const char *a2)
{
  void *v3;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("%@ IS NOT NULL AND %@ != \"\""), CFSTR("applicationContainerPath"), CFSTR("applicationContainerPath"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v13[0] = CFSTR("applicationID");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v5, (uint64_t)v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_select_from_where_bindings_(v4, v7, (uint64_t)v6, CFSTR("AppBundle"), v3, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_CKCompactMap_(v8, v9, (uint64_t)&unk_1E7838CA8);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

}

id sub_1BEC83884(uint64_t a1, void *a2)
{
  id v2;
  CKDApplicationID *v3;
  const char *v4;
  void *v5;
  const char *v6;
  void *v7;

  v2 = a2;
  v3 = [CKDApplicationID alloc];
  objc_msgSend_objectForKeyedSubscript_(v2, v4, (uint64_t)CFSTR("applicationID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend_initWithSqliteRepresentation_(v3, v6, (uint64_t)v5);
  return v7;
}

void sub_1BEC8398C(uint64_t a1)
{
  void *v1;
  const char *v2;
  id v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1BEC83A00;
  v4[3] = &unk_1E78364E8;
  v1 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v3 = (id)objc_msgSend_performDatabaseOperation_(v1, v2, (uint64_t)v4);

}

void sub_1BEC83A00(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v16 = CFSTR("applicationID");
  v17[0] = v2;
  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = a2;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(v3, v5, (uint64_t)v17, &v16, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_equalityClauseAndBindingsForDict_(MEMORY[0x1E0C950E0], v7, (uint64_t)v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_v1(v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_v2(v8, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deleteFrom_where_bindings_(v4, v15, (uint64_t)CFSTR("AppBundle"), v11, v14);

}

void sub_1BEC83BC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BEC83BD8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  const char *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v2 = *(void **)(a1 + 32);
  v3 = objc_opt_class();
  objc_msgSend_selectAllObjectsOfClass_(v2, v4, v3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastObject(v10, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

void sub_1BEC83D00(uint64_t a1)
{
  void *v1;
  const char *v2;
  id v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1BEC83D74;
  v4[3] = &unk_1E78364E8;
  v1 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v3 = (id)objc_msgSend_performDatabaseOperation_(v1, v2, (uint64_t)v4);

}

void sub_1BEC83D74(uint64_t a1, void *a2)
{
  const char *v3;
  const char *v4;
  const char *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  objc_msgSend_deleteFrom_where_bindings_(v7, v3, (uint64_t)CFSTR("ServerConfiguration"), CFSTR("1"), 0);
  objc_msgSend_deleteFrom_where_bindings_(v7, v4, (uint64_t)CFSTR("VerifiedPublicKey"), CFSTR("1"), 0);
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    objc_msgSend_insertOrReplaceObject_(v7, v5, v6);

}

void sub_1BEC83F4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BEC83F64(_QWORD *a1, const char *a2)
{
  uint64_t v3;
  void *v4;
  const char *v5;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  double v26;
  const char *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  id v32;
  const char *v33;
  const char *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  void *v43;
  void *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  const char *v51;
  void *v52;
  id v53;
  void *v54;
  _QWORD v55[2];
  _QWORD v56[3];

  v56[2] = *MEMORY[0x1E0C80C00];
  v55[0] = CFSTR("keyType");
  v55[1] = CFSTR("keyID");
  v3 = a1[5];
  v56[0] = a1[4];
  v56[1] = v3;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v56, v55, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_equalityClauseAndBindingsForDict_(MEMORY[0x1E0C950E0], v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)a1[6];
  objc_msgSend_v1(v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_v2(v6, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_selectAllFrom_where_bindings_(v7, v14, (uint64_t)CFSTR("VerifiedPublicKey"), v10, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend_count(v15, v16, v17) >= 2)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v18, v19);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v50, v51, a1[8], a1[6], CFSTR("CKDMetadataCache.m"), 702, CFSTR("Unique constraint violation in public key table"));

  }
  objc_msgSend_firstObject(v15, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v20;
  if (v20)
  {
    objc_msgSend_objectForKeyedSubscript_(v20, v21, (uint64_t)CFSTR("keyExpiration"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (double)objc_msgSend_integerValue(v23, v24, v25);

    objc_msgSend_objectForKeyedSubscript_(v22, v27, (uint64_t)CFSTR("protectionSource"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_length(v28, v29, v30))
      v31 = v28;
    else
      v31 = 0;
    v32 = v31;

    v53 = objc_alloc(MEMORY[0x1E0C95000]);
    objc_msgSend_objectForKeyedSubscript_(v22, v33, (uint64_t)CFSTR("publicKey"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v22, v34, (uint64_t)CFSTR("keyVersion"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend_integerValue(v35, v36, v37);
    objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x1E0C99D68], v39, v40, v26);
    v54 = v4;
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v22, v42, (uint64_t)CFSTR("keyCert"));
    v43 = v15;
    v44 = v6;
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend_initWithPublicKey_version_expiration_certificateData_protectionSource_(v53, v46, (uint64_t)v52, v38, v41, v45, v32);

    v48 = *(_QWORD *)(a1[7] + 8);
    v49 = *(void **)(v48 + 40);
    *(_QWORD *)(v48 + 40) = v47;

    v6 = v44;
    v15 = v43;

    v4 = v54;
  }

}

void sub_1BEC84348(uint64_t a1)
{
  void *v2;
  const char *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1BEC843E8;
  v5[3] = &unk_1E7836550;
  v2 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  v4 = (id)objc_msgSend_performDatabaseOperation_(v2, v3, (uint64_t)v5);

}

void sub_1BEC843E8(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  id v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  const char *v34;
  void *v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  _QWORD v46[2];
  _QWORD v47[2];
  const __CFString *v48;
  uint64_t v49;
  _QWORD v50[7];
  _QWORD v51[8];

  v51[7] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    v50[0] = CFSTR("keyType");
    v50[1] = CFSTR("keyID");
    v4 = *(_QWORD *)(a1 + 48);
    v51[0] = *(_QWORD *)(a1 + 40);
    v51[1] = v4;
    v50[2] = CFSTR("publicKey");
    v5 = a2;
    objc_msgSend_publicKey(v3, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v51[2] = v8;
    v50[3] = CFSTR("keyVersion");
    v9 = (void *)MEMORY[0x1E0CB37E8];
    v12 = objc_msgSend_version(*(void **)(a1 + 32), v10, v11);
    objc_msgSend_numberWithInteger_(v9, v13, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v51[3] = v14;
    v50[4] = CFSTR("keyExpiration");
    v15 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend_expiration(*(void **)(a1 + 32), v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSince1970(v18, v19, v20);
    objc_msgSend_numberWithDouble_(v15, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v51[4] = v23;
    v50[5] = CFSTR("keyCert");
    objc_msgSend_certData(*(void **)(a1 + 32), v24, v25);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    v51[5] = v26;
    v50[6] = CFSTR("protectionSource");
    objc_msgSend_protectionSource(*(void **)(a1 + 32), v27, v28);
    v29 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)v29;
    v32 = &stru_1E7838F48;
    if (v29)
      v32 = (const __CFString *)v29;
    v51[6] = v32;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v30, (uint64_t)v51, v50, 7);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_insertOrReplaceInto_values_(v5, v34, (uint64_t)CFSTR("VerifiedPublicKey"), v33);

  }
  else
  {
    v35 = *(void **)(a1 + 48);
    v26 = a2;
    if (objc_msgSend_isEqualToString_(v35, v36, (uint64_t)CFSTR("*"))
      && CKIsRunningInTestHost())
    {
      v38 = *(_QWORD *)(a1 + 40);
      v48 = CFSTR("keyType");
      v49 = v38;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v37, (uint64_t)&v49, &v48, 1);
    }
    else
    {
      v46[0] = CFSTR("keyType");
      v46[1] = CFSTR("keyID");
      v39 = *(_QWORD *)(a1 + 48);
      v47[0] = *(_QWORD *)(a1 + 40);
      v47[1] = v39;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v37, (uint64_t)v47, v46, 2);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_equalityClauseAndBindingsForDict_(MEMORY[0x1E0C950E0], v40, (uint64_t)v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_v1(v14, v41, v42);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_v2(v14, v43, v44);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deleteFrom_where_bindings_(v26, v45, (uint64_t)CFSTR("VerifiedPublicKey"), v18, v23);
  }

}

void sub_1BEC84BB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BEC84BCC(uint64_t a1, const char *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend_inlock_containerServerInfoForContainerID_accountID_(*(void **)(a1 + 32), a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void sub_1BEC84D30(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  const char *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;
  id v11;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1BEC84DD4;
  v7[3] = &unk_1E7838CF8;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v4;
  v10 = *(id *)(a1 + 48);
  v11 = *(id *)(a1 + 56);
  v6 = (id)objc_msgSend_performDatabaseOperation_(v2, v5, (uint64_t)v7);

}

void sub_1BEC84DD4(uint64_t a1, void *a2)
{
  const char *v3;
  id v4;
  void *v5;
  void *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  const __CFString *v106;
  _QWORD v107[2];

  v107[1] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend_inlock_containerServerInfoForContainerID_accountID_(*(void **)(a1 + 40), v3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_opt_new();
    objc_msgSend_setObject_forKeyedSubscript_(v6, v7, *(_QWORD *)(a1 + 48), CFSTR("containerID"));
    objc_msgSend_setObject_forKeyedSubscript_(v6, v8, *(_QWORD *)(a1 + 56), CFSTR("accountID"));
    objc_msgSend_publicCloudDBURL(*(void **)(a1 + 32), v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend_publicCloudDBURL(*(void **)(a1 + 32), v12, v13);
    }
    else
    {
      objc_msgSend_publicCloudDBURL(v5, v12, v13);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_absoluteString(v23, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v26)
        goto LABEL_8;
      objc_msgSend_publicCloudDBURL(v5, v27, v28);
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_absoluteString(v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v6, v33, (uint64_t)v32, CFSTR("publicCloudDBURL"));

LABEL_8:
    objc_msgSend_publicShareServiceURL(*(void **)(a1 + 32), v27, v28);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      objc_msgSend_publicShareServiceURL(*(void **)(a1 + 32), v35, v36);
    }
    else
    {
      objc_msgSend_publicShareServiceURL(v5, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_absoluteString(v37, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v40)
        goto LABEL_13;
      objc_msgSend_publicShareServiceURL(v5, v41, v42);
    }
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_absoluteString(v43, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v6, v47, (uint64_t)v46, CFSTR("publicShareServiceURL"));

LABEL_13:
    objc_msgSend_publicDeviceServiceURL(*(void **)(a1 + 32), v41, v42);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
    {
      objc_msgSend_publicDeviceServiceURL(*(void **)(a1 + 32), v49, v50);
    }
    else
    {
      objc_msgSend_publicDeviceServiceURL(v5, v49, v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_absoluteString(v51, v52, v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v54)
        goto LABEL_18;
      objc_msgSend_publicDeviceServiceURL(v5, v55, v56);
    }
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_absoluteString(v57, v58, v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v6, v61, (uint64_t)v60, CFSTR("publicDeviceServiceURL"));

LABEL_18:
    objc_msgSend_publicCodeServiceURL(*(void **)(a1 + 32), v55, v56);
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    if (v62)
    {
      objc_msgSend_publicCodeServiceURL(*(void **)(a1 + 32), v63, v64);
    }
    else
    {
      objc_msgSend_publicCodeServiceURL(v5, v63, v64);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_absoluteString(v65, v66, v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v68)
        goto LABEL_23;
      objc_msgSend_publicCodeServiceURL(v5, v69, v70);
    }
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_absoluteString(v71, v72, v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v6, v75, (uint64_t)v74, CFSTR("publicCodeServiceURL"));

LABEL_23:
    objc_msgSend_publicMetricsServiceURL(*(void **)(a1 + 32), v69, v70);
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    if (v76)
    {
      objc_msgSend_publicMetricsServiceURL(*(void **)(a1 + 32), v77, v78);
    }
    else
    {
      objc_msgSend_publicMetricsServiceURL(v5, v77, v78);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_absoluteString(v79, v80, v81);
      v82 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v82)
        goto LABEL_28;
      objc_msgSend_publicMetricsServiceURL(v5, v83, v84);
    }
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_absoluteString(v85, v86, v87);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v6, v89, (uint64_t)v88, CFSTR("publicMetricsServiceURL"));

LABEL_28:
    objc_msgSend_containerScopedUserID(*(void **)(a1 + 32), v83, v84);
    v90 = (void *)objc_claimAutoreleasedReturnValue();

    if (v90)
    {
      objc_msgSend_containerScopedUserID(*(void **)(a1 + 32), v91, v92);
    }
    else
    {
      objc_msgSend_containerScopedUserID(v5, v91, v92);
      v93 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v93)
        goto LABEL_33;
      objc_msgSend_containerScopedUserID(v5, v94, v95);
    }
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v6, v97, (uint64_t)v96, CFSTR("scopedUserID"));

LABEL_33:
    objc_msgSend_orgAdminUserID(*(void **)(a1 + 32), v94, v95);
    v98 = (void *)objc_claimAutoreleasedReturnValue();

    if (v98)
    {
      objc_msgSend_orgAdminUserID(*(void **)(a1 + 32), v99, v100);
    }
    else
    {
      objc_msgSend_orgAdminUserID(v5, v99, v100);
      v101 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v101)
      {
LABEL_38:
        objc_msgSend_insertOrReplaceInto_values_(v4, v102, (uint64_t)CFSTR("ContainerServerInfo"), v6);
        goto LABEL_39;
      }
      objc_msgSend_orgAdminUserID(v5, v102, v103);
    }
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v6, v105, (uint64_t)v104, CFSTR("orgAdminUserID"));

    goto LABEL_38;
  }
  v14 = *(_QWORD *)(a1 + 48);
  v106 = CFSTR("containerID");
  v107[0] = v14;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v3, (uint64_t)v107, &v106, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_equalityClauseAndBindingsForDict_(MEMORY[0x1E0C950E0], v15, (uint64_t)v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_v1(v6, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_v2(v6, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deleteFrom_where_bindings_(v4, v22, (uint64_t)CFSTR("ContainerServerInfo"), v18, v21);

LABEL_39:
}

void sub_1BEC8530C(uint64_t a1)
{
  void *v1;
  const char *v2;
  id v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1BEC85380;
  v4[3] = &unk_1E78364E8;
  v1 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v3 = (id)objc_msgSend_performDatabaseOperation_(v1, v2, (uint64_t)v4);

}

void sub_1BEC85380(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const __CFString *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v30 = CFSTR("containerID");
  v31[0] = v2;
  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = a2;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(v3, v5, (uint64_t)v31, &v30, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_equalityClauseAndBindingsForDict_(MEMORY[0x1E0C950E0], v7, (uint64_t)v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_v1(v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_v2(v8, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deleteFrom_where_bindings_(v4, v15, (uint64_t)CFSTR("ContainerServerInfo"), v11, v14);

  objc_msgSend_v1(v8, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_v2(v8, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deleteFrom_where_bindings_(v4, v22, (uint64_t)CFSTR("AppContainerAccount"), v18, v21);

  objc_msgSend_v1(v8, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_v2(v8, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deleteFrom_where_bindings_(v4, v29, (uint64_t)CFSTR("PushTokens"), v25, v28);

}

BOOL sub_1BEC85588(void *a1, uint64_t a2, void *a3, void *a4, uint64_t a5, void *a6, int a7, int a8, char a9, _QWORD *a10)
{
  id v17;
  id v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  BOOL v31;
  NSObject *v32;
  const char *v33;
  id v34;
  NSObject *v35;
  const char *v36;
  void *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  int v46;
  const char *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  CKDWrappingContext *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  const char *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  void *v72;
  const char *v73;
  const char *v74;
  void *v75;
  void *v76;
  const char *v77;
  const char *v78;
  void *v79;
  const char *v80;
  const char *v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  NSObject *v87;
  NSObject *v88;
  NSObject *v89;
  void *v90;
  const char *v91;
  void *v92;
  const char *v93;
  void *v94;
  const char *v95;
  const char *v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  NSObject *v100;
  uint64_t v102;
  void *v103;
  void *v104;
  id v105;
  id v106;
  _QWORD v107[2];
  _QWORD v108[2];
  const __CFString *v109;
  uint64_t v110;
  _QWORD v111[2];
  _QWORD v112[2];
  uint8_t buf[4];
  id v114;
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  v105 = a3;
  v17 = a4;
  v18 = a6;
  objc_msgSend_downloadBaseURL(a1, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_downloadURLExpiration(a1, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_constructedAssetDownloadURLTemplate(a1, v25, v26);
  v27 = objc_claimAutoreleasedReturnValue();
  v30 = (void *)v27;
  if (v24)
    v31 = v21 == 0;
  else
    v31 = 1;
  if (v31 && !v27)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v32 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v114 = a1;
      _os_log_error_impl(&dword_1BE990000, v32, OS_LOG_TYPE_ERROR, "Missing required info on %@", buf, 0xCu);
    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v33, *MEMORY[0x1E0C94B20], 1000, CFSTR("Missing required info on %@"), a1);
    v34 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_69;
  }
  if ((a7 & 1) == 0 && !a8)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v35 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v114 = a1;
      _os_log_debug_impl(&dword_1BE990000, v35, OS_LOG_TYPE_DEBUG, "Not using encryption keys for the asset %@", buf, 0xCu);
      if (v17)
        goto LABEL_18;
    }
    else if (v17)
    {
LABEL_18:
      v107[0] = CFSTR("f");
      v107[1] = CFSTR("uk");
      v108[0] = v17;
      v108[1] = CFSTR("1234");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v36, (uint64_t)v108, v107, 2);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_57:
      if (v21)
      {
        objc_msgSend__expandTemplateURL_fieldValues_(MEMORY[0x1E0C94BB8], v36, (uint64_t)v21, v37);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setDownloadURLTemplate_(a1, v91, (uint64_t)v90);

      }
      if (v30)
      {
        objc_msgSend__expandTemplateURL_fieldValues_(MEMORY[0x1E0C94BB8], v36, (uint64_t)v30, v37);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_URLWithString_(MEMORY[0x1E0C99E98], v93, (uint64_t)v92);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setConstructedAssetDownloadURL_(a1, v95, (uint64_t)v94);

        objc_msgSend_constructedAssetDownloadURL(a1, v96, v97);
        v98 = (void *)objc_claimAutoreleasedReturnValue();

        if (v98)
        {
          v34 = 0;
        }
        else
        {
          objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v99, *MEMORY[0x1E0C94B20], 1, CFSTR("Couldn't create url from template"));
          v34 = (id)objc_claimAutoreleasedReturnValue();
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v100 = *MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v114 = v30;
            _os_log_error_impl(&dword_1BE990000, v100, OS_LOG_TYPE_ERROR, "Couldn't create url from template %{public}@", buf, 0xCu);
          }
        }

      }
      else
      {
        v34 = 0;
      }
LABEL_68:

      goto LABEL_69;
    }
    v37 = &unk_1E78AFFA0;
    goto LABEL_57;
  }
  if (!a7)
  {
    if (!a8)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v28, v29);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v72, v73, a2, a1, CFSTR("CKDAssetExtensions.m"), 70, CFSTR("Unhandled code path."));

      v34 = 0;
      goto LABEL_72;
    }
    objc_msgSend_clearAssetKey(a1, v28, v29);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v48)
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v49, *MEMORY[0x1E0C94B20], 1, CFSTR("Couldn't find clear asset key for publishing"));
      v34 = (id)objc_claimAutoreleasedReturnValue();
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v88 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v114 = v34;
        _os_log_error_impl(&dword_1BE990000, v88, OS_LOG_TYPE_ERROR, "Error find clear asset key: %@", buf, 0xCu);
      }
      goto LABEL_69;
    }
    v37 = v48;
    v34 = 0;
    objc_msgSend_CKBase64URLSafeString(v48, v49, v50);
    goto LABEL_28;
  }
  v103 = v18;
  if ((a9 & 1) != 0)
    goto LABEL_26;
  objc_msgSend_deviceContext(v18, v28, v29);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountDataSecurityObserver(v38, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_account(v18, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend_isWalrusEnabledForAccount_allowBlockingFetch_(v41, v45, (uint64_t)v44, 1);

  if (!v46)
  {
LABEL_26:
    v51 = [CKDWrappingContext alloc];
    objc_msgSend_recordID(a1, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_signature(a1, v55, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_referenceSignature(a1, v58, v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = (void *)objc_msgSend_initWithRecordID_fieldName_mergeableDeltaID_fileSignature_referenceSignature_(v51, v61, (uint64_t)v54, v105, 0, v57, v60);

    objc_msgSend_wrappedAssetKey(a1, v63, v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = 0;
    objc_msgSend_unwrapAssetKey_withRecordPCS_inContext_withError_(v103, v66, (uint64_t)v65, a5, v62, &v106);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v106;

    if (!v37)
    {
      if (!v34)
      {
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v67, *MEMORY[0x1E0C94B20], 5004, CFSTR("Couldn't unwrap asset key for publishing"));
        v34 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v87 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v114 = v34;
        _os_log_error_impl(&dword_1BE990000, v87, OS_LOG_TYPE_ERROR, "Error unwrapping asset key: %@", buf, 0xCu);
      }

      goto LABEL_44;
    }

    v18 = v103;
    objc_msgSend_CKBase64URLSafeString(v37, v68, v69);
LABEL_28:
    v70 = objc_claimAutoreleasedReturnValue();
    v104 = (void *)v70;
    if (v17)
    {
      v111[0] = CFSTR("f");
      v111[1] = CFSTR("uk");
      v112[0] = v17;
      v112[1] = v70;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v71, (uint64_t)v112, v111, 2);
    }
    else
    {
      v109 = CFSTR("uk");
      v110 = v70;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v71, (uint64_t)&v110, &v109, 1);
    }
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_msgSend__expandTemplateURL_fieldValues_(MEMORY[0x1E0C94BB8], v74, (uint64_t)v21, v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDownloadURLTemplate_(a1, v77, (uint64_t)v76);

    }
    if (v30)
    {
      objc_msgSend__expandTemplateURL_fieldValues_(MEMORY[0x1E0C94BB8], v74, (uint64_t)v30, v75);
      v102 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_URLWithString_(MEMORY[0x1E0C99E98], v78, v102);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setConstructedAssetDownloadURL_(a1, v80, (uint64_t)v79);

      objc_msgSend_constructedAssetDownloadURL(a1, v81, v82);
      v83 = (void *)objc_claimAutoreleasedReturnValue();

      if (v83)
      {
        v85 = (uint64_t)v34;
        v86 = (void *)v102;
      }
      else
      {
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v84, *MEMORY[0x1E0C94B20], 1, CFSTR("Couldn't create url from template"));
        v85 = objc_claimAutoreleasedReturnValue();

        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v86 = (void *)v102;
        v89 = *MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v114 = v30;
          _os_log_error_impl(&dword_1BE990000, v89, OS_LOG_TYPE_ERROR, "Couldn't create url from template %@", buf, 0xCu);
        }
      }

      v34 = (id)v85;
    }

    goto LABEL_68;
  }
  objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v47, *MEMORY[0x1E0C94B20], 5013, CFSTR("Cannot fill in derivative template due to walrus enabled"));
  v34 = (id)objc_claimAutoreleasedReturnValue();
LABEL_44:
  v18 = v103;
LABEL_69:
  if (a10 && v34)
  {
    v34 = objc_retainAutorelease(v34);
    *a10 = v34;
  }
LABEL_72:

  return v34 == 0;
}

uint64_t sub_1BEC85E94(void *a1, const char *a2)
{
  const char *v3;
  const char *v4;
  const char *v5;

  objc_msgSend_setAssetKey_(a1, a2, 0);
  objc_msgSend_setReferenceSignature_(a1, v3, 0);
  objc_msgSend_setDownloadToken_(a1, v4, 0);
  return objc_msgSend_setDownloadTokenExpiration_(a1, v5, 0);
}

uint64_t sub_1BEC85ED8(void *a1, uint64_t a2, void *a3)
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  BOOL v30;
  int v34;
  void *v35;
  void *v36;
  const char *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  const char *v42;
  const char *v43;
  const char *v44;
  const char *v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  const char *v56;
  void *v58;
  id v59;
  uint64_t v60;

  v4 = a3;
  objc_msgSend_contentBaseURL(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_owner(v4, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requestor(v4, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_signature(v4, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_referenceSignature(v4, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_authToken(v4, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_assetKey(v4, v23, v24);
  v25 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_clearAssetKey(v4, v26, v27);
  v60 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v35 = v16;
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v28, *MEMORY[0x1E0C94B20], 3011, CFSTR("Re-referenced asset not found"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setError_(a1, v37, (uint64_t)v36);

    goto LABEL_31;
  }
  if (v7)
    v30 = v10 == 0;
  else
    v30 = 1;
  v34 = !v30 && v13 != 0 && v16 != 0 && v22 != 0;
  if (!v19)
  {
    if ((v34 & 1) != 0)
      goto LABEL_26;
    goto LABEL_23;
  }
  if (!v34 || !(v25 | v60))
  {
LABEL_23:
    objc_msgSend_zeroSizeFileSignature(CKDMMCS, v28, v29);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_size(v4, v39, v40) && objc_msgSend_isEqualToData_(v16, v41, (uint64_t)v38))
    {

      goto LABEL_26;
    }
    v58 = v38;
    v35 = v16;
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v41, *MEMORY[0x1E0C94B20], 3011, CFSTR("Re-referenced asset missing expected values"), v58);
    v52 = v13;
    v53 = v10;
    v54 = v7;
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setError_(a1, v56, (uint64_t)v55);

    v7 = v54;
    v10 = v53;
    v13 = v52;

LABEL_31:
    v51 = 0;
    goto LABEL_32;
  }
LABEL_26:
  v35 = v16;
  objc_msgSend_setContentBaseURL_(a1, v28, (uint64_t)v7);
  objc_msgSend_setOwner_(a1, v42, (uint64_t)v10);
  objc_msgSend_setRequestor_(a1, v43, (uint64_t)v13);
  if (v25)
    objc_msgSend_setAssetKey_(a1, v44, v25);
  else
    objc_msgSend_setAssetKey_(a1, v44, v60);
  objc_msgSend_setReferenceSignature_(a1, v45, (uint64_t)v19);
  objc_msgSend_setDownloadToken_(a1, v46, (uint64_t)v22);
  v49 = objc_msgSend_downloadTokenExpiration(v4, v47, v48);
  objc_msgSend_setDownloadTokenExpiration_(a1, v50, v49);
  v51 = 1;
LABEL_32:

  return v51;
}

uint64_t sub_1BEC86548(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  CKDPSubscriptionNotificationAlert *v17;
  uint64_t result;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  const char *v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  uint64_t v38;
  void *v39;
  BOOL v40;
  uint64_t v41;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v17 = objc_alloc_init(CKDPSubscriptionNotificationAlert);
          objc_storeStrong((id *)(a1 + 16), v17);
          if (PBReaderPlaceMark() && sub_1BEB33010((char *)v17, a2))
          {
            PBReaderRecallMark();
            goto LABEL_33;
          }

          return 0;
        case 2u:
          v19 = 0;
          v20 = 0;
          v21 = 0;
          *(_BYTE *)(a1 + 36) |= 1u;
          while (1)
          {
            v22 = *v3;
            v23 = *(_QWORD *)(a2 + v22);
            if (v23 == -1 || v23 >= *(_QWORD *)(a2 + *v4))
              break;
            v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v23);
            *(_QWORD *)(a2 + v22) = v23 + 1;
            v21 |= (unint64_t)(v24 & 0x7F) << v19;
            if ((v24 & 0x80) == 0)
              goto LABEL_50;
            v19 += 7;
            v14 = v20++ >= 9;
            if (v14)
            {
              v21 = 0;
              goto LABEL_52;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_50:
          if (*(_BYTE *)(a2 + *v5))
            v21 = 0;
LABEL_52:
          v40 = v21 != 0;
          v41 = 32;
          goto LABEL_61;
        case 3u:
          PBReaderReadString();
          v17 = (CKDPSubscriptionNotificationAlert *)objc_claimAutoreleasedReturnValue();
          if (v17)
            objc_msgSend_addAdditionalFields_((void *)a1, v25, (uint64_t)v17);
LABEL_33:

          continue;
        case 4u:
          v26 = 0;
          v27 = 0;
          v28 = 0;
          *(_BYTE *)(a1 + 36) |= 2u;
          while (2)
          {
            v29 = *v3;
            v30 = *(_QWORD *)(a2 + v29);
            if (v30 == -1 || v30 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v30);
              *(_QWORD *)(a2 + v29) = v30 + 1;
              v28 |= (unint64_t)(v31 & 0x7F) << v26;
              if (v31 < 0)
              {
                v26 += 7;
                v14 = v27++ >= 9;
                if (v14)
                {
                  v28 = 0;
                  goto LABEL_56;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v28 = 0;
LABEL_56:
          v40 = v28 != 0;
          v41 = 33;
          goto LABEL_61;
        case 5u:
          v32 = 0;
          v33 = 0;
          v34 = 0;
          *(_BYTE *)(a1 + 36) |= 4u;
          break;
        case 6u:
          PBReaderReadString();
          v38 = objc_claimAutoreleasedReturnValue();
          v39 = *(void **)(a1 + 24);
          *(_QWORD *)(a1 + 24) = v38;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v35 = *v3;
        v36 = *(_QWORD *)(a2 + v35);
        if (v36 == -1 || v36 >= *(_QWORD *)(a2 + *v4))
          break;
        v37 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v36);
        *(_QWORD *)(a2 + v35) = v36 + 1;
        v34 |= (unint64_t)(v37 & 0x7F) << v32;
        if ((v37 & 0x80) == 0)
          goto LABEL_58;
        v32 += 7;
        v14 = v33++ >= 9;
        if (v14)
        {
          v34 = 0;
          goto LABEL_60;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_58:
      if (*(_BYTE *)(a2 + *v5))
        v34 = 0;
LABEL_60:
      v40 = v34 != 0;
      v41 = 34;
LABEL_61:
      *(_BYTE *)(a1 + v41) = v40;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1BEC87580(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1BEC875A0(uint64_t a1)
{
  id WeakRetained;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  id v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  int v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend_error(WeakRetained, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v8 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      v27 = v8;
      objc_msgSend_error(WeakRetained, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 138412290;
      v37 = v30;
      _os_log_error_impl(&dword_1BE990000, v27, OS_LOG_TYPE_ERROR, "Error fetching server certificates: %@", (uint8_t *)&v36, 0xCu);

    }
    objc_msgSend_error(WeakRetained, v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_setError_(*(void **)(a1 + 32), v12, (uint64_t)v11);
  }
  else
  {
    objc_msgSend_validatedTrusts(WeakRetained, v6, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend_count(v13, v14, v15);

    if (v16)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v19 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        v31 = *(void **)(a1 + 32);
        v32 = v19;
        objc_msgSend_validatedTrusts(v31, v33, v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 138412290;
        v37 = v35;
        _os_log_debug_impl(&dword_1BE990000, v32, OS_LOG_TYPE_DEBUG, "Fetched validated trusts: %@", (uint8_t *)&v36, 0xCu);

      }
      v20 = objc_alloc(MEMORY[0x1E0C99D20]);
      objc_msgSend_validatedTrusts(WeakRetained, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend_initWithArray_(v20, v24, (uint64_t)v23);
      objc_msgSend_setValidatedTrusts_(*(void **)(a1 + 32), v26, (uint64_t)v25);

    }
    objc_msgSend_stateTransitionGroup(*(void **)(a1 + 32), v17, v18);
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_group_leave(v11);
  }

}

BOOL CKDPRecordStableUrlReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 32;
          goto LABEL_24;
        case 2u:
          PBReaderReadData();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 40;
          goto LABEL_24;
        case 3u:
          PBReaderReadData();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 24;
          goto LABEL_24;
        case 4u:
          PBReaderReadData();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 16;
          goto LABEL_24;
        case 5u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 8;
LABEL_24:
          v19 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          goto LABEL_25;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0)
            return 0;
LABEL_25:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          break;
      }
    }
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1BEC883B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_1BEC883D8(uint64_t a1, void *a2)
{
  NSObject *v3;
  const char *v4;
  uint8_t v6[16];

  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v3 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_debug_impl(&dword_1BE990000, v3, OS_LOG_TYPE_DEBUG, "Manatee state may have changed. Fetching new state from CoreCDP", v6, 2u);
  }
  return objc_msgSend_handleManateeStatusUpdateNotificationWithAvailability_(a2, v4, 0);
}

void sub_1BEC88480(uint64_t a1)
{
  id WeakRetained;
  const char *v2;
  uint64_t v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend_handleWalrusStateChanged(WeakRetained, v2, v3);
    WeakRetained = v4;
  }

}

void sub_1BEC88764(uint64_t a1, const char *a2)
{
  const char *v3;
  int isEqualToNumber;
  void *v5;
  const char *v6;
  uint64_t ManateeAvailability;
  id v8;
  const char *v9;
  const char *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const __CFString *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  id v26;
  uint8_t buf[4];
  const __CFString *v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  const __CFString *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  isEqualToNumber = objc_msgSend_isEqualToNumber_(*(void **)(a1 + 32), a2, (uint64_t)&unk_1E78B0A30);
  v5 = *(void **)(a1 + 40);
  if (isEqualToNumber)
  {
    objc_msgSend__lockedSetManateeAvailableForLoggedInAccount_(v5, v3, 1);
    objc_msgSend_setLastCDPErrorForManateeStatus_(*(void **)(a1 + 40), v6, 0);
  }
  else
  {
    v26 = 0;
    ManateeAvailability = objc_msgSend__fetchManateeAvailability_(v5, v3, (uint64_t)&v26);
    v8 = v26;
    objc_msgSend__lockedSetManateeAvailableForLoggedInAccount_(*(void **)(a1 + 40), v9, ManateeAvailability);
    objc_msgSend_setLastCDPErrorForManateeStatus_(*(void **)(a1 + 40), v10, (uint64_t)v8);

  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v11 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v12 = *(void **)(a1 + 40);
    v13 = v11;
    if (objc_msgSend_manateeAvailableForLoggedInAccount(v12, v14, v15) == 1)
      v18 = &stru_1E7838F48;
    else
      v18 = CFSTR(" not");
    objc_msgSend_lastCDPErrorForManateeStatus(*(void **)(a1 + 40), v16, v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
      v22 = CFSTR("Error: ");
    else
      v22 = &stru_1E7838F48;
    objc_msgSend_lastCDPErrorForManateeStatus(*(void **)(a1 + 40), v19, v20);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v23;
    *(_DWORD *)buf = 138543874;
    if (v23)
      v25 = (const __CFString *)v23;
    else
      v25 = &stru_1E7838F48;
    v28 = v18;
    v29 = 2114;
    v30 = v22;
    v31 = 2112;
    v32 = v25;
    _os_log_debug_impl(&dword_1BE990000, v13, OS_LOG_TYPE_DEBUG, "CoreCDP is now reporting that manatee is%{public}@ available for the logged in account.%{public}@%@", buf, 0x20u);

  }
}

void sub_1BEC89098(uint64_t a1, const char *a2, uint64_t a3)
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL8 v7;
  const char *v8;
  uint64_t v9;
  id v10;

  objc_msgSend__lockedFetchAndUpdateManateeAvailability(*(void **)(a1 + 32), a2, a3);
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    v7 = objc_msgSend_manateeAvailableForLoggedInAccount(*(void **)(a1 + 32), v4, v5) == 1;
    objc_msgSend_lastCDPErrorForManateeStatus(*(void **)(a1 + 32), v8, v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _BOOL8, id))(v6 + 16))(v6, v7, v10);

  }
}

void sub_1BEC89274(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1BEC89298(uint64_t a1, char a2, id obj)
{
  id v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_1BEC89420(uint64_t a1, const char *a2, uint64_t a3)
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend_contextForPrimaryAccount(MEMORY[0x1E0D15768], a2, a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0D15788]);
  v5 = objc_msgSend_initWithContext_(v3, v4, (uint64_t)v7);
  v6 = (void *)qword_1ED702CD0;
  qword_1ED702CD0 = v5;

}

void sub_1BEC89AA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BEC89AD4(uint64_t a1, uint64_t a2, void *a3)
{
  __CFString *v5;
  int v6;
  const char *v7;
  uint64_t v8;
  id WeakRetained;
  _QWORD *v10;
  os_log_t *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  os_log_t *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  int v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  char v27;
  const char *v28;
  os_log_t v29;
  const char *v30;
  uint64_t v31;
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  unint64_t v35;
  const __CFString *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  os_log_t v40;
  const __CFString *v41;
  const __CFString *v42;
  const __CFString *v43;
  NSObject *v44;
  uint64_t v45;
  int v46;
  const __CFString *v47;
  __int16 v48;
  const __CFString *v49;
  __int16 v50;
  const __CFString *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  switch(a2)
  {
    case 0:
      goto LABEL_4;
    case 1:
      v6 = 1;
      break;
    case 2:
LABEL_4:
      v6 = 0;
      break;
    default:
      v6 = 0;
      a2 = 0;
      break;
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v10 = (_QWORD *)MEMORY[0x1E0C95300];
  v11 = (os_log_t *)MEMORY[0x1E0C952B0];
  if (!WeakRetained)
    goto LABEL_26;
  objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v7, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isAppleInternalInstall(v12, v13, v14) & 1) == 0)
  {

LABEL_13:
    if (!v6)
    {
LABEL_24:
      objc_msgSend_setCachedWalrusStatusForLoggedInAccount_(WeakRetained, v22, a2);
      goto LABEL_25;
    }
LABEL_14:
    if (objc_msgSend_cachedWalrusStatusForLoggedInAccount(WeakRetained, v22, v23) != 1)
    {
      if (*v10 != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v29 = *v11;
      if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
      {
        v32 = v29;
        v35 = objc_msgSend_cachedWalrusStatusForLoggedInAccount(WeakRetained, v33, v34);
        if (v35 > 2)
          v36 = CFSTR("unknown");
        else
          v36 = *(&off_1E7838DD0 + v35);
        v46 = 138543362;
        v47 = v36;
        _os_log_impl(&dword_1BE990000, v32, OS_LOG_TYPE_INFO, "CoreCDP reports that walrus is changing from %{public}@ to enabled. Clearing out PCS memory caches.", (uint8_t *)&v46, 0xCu);

      }
      objc_msgSend_deviceContext(*(void **)(a1 + 32), v30, v31);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_clearPCSMemoryCaches(v37, v38, v39);

    }
    a2 = 1;
    goto LABEL_24;
  }
  objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v15, v16);
  v17 = v11;
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_CDPWalrusOverride(v18, v19, v20);

  v11 = v17;
  v10 = (_QWORD *)MEMORY[0x1E0C95300];

  if (!v21)
    goto LABEL_13;
  objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend_CDPWalrusEnabled(v24, v25, v26);

  if ((v27 & 1) != 0)
    goto LABEL_14;
  a2 = 2;
  objc_msgSend_setCachedWalrusStatusForLoggedInAccount_(WeakRetained, v22, 2);
LABEL_25:
  objc_msgSend_setLastCDPErrorForWalrusStatus_(WeakRetained, v28, (uint64_t)v5);
LABEL_26:
  if (*v10 != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v40 = *v11;
  if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
  {
    v41 = *(&off_1E7838DD0 + a2);
    v46 = 138543874;
    v47 = v41;
    if (v5)
      v42 = CFSTR(" Error: ");
    else
      v42 = &stru_1E7838F48;
    if (v5)
      v43 = v5;
    else
      v43 = &stru_1E7838F48;
    v48 = 2114;
    v49 = v42;
    v50 = 2112;
    v51 = v43;
    v44 = v40;
    _os_log_impl(&dword_1BE990000, v44, OS_LOG_TYPE_INFO, "CoreCDP reports that walrus is %{public}@ for the logged in account.%{public}@%@", (uint8_t *)&v46, 0x20u);

  }
  v45 = *(_QWORD *)(a1 + 40);
  if (v45)
    (*(void (**)(uint64_t, uint64_t, __CFString *))(v45 + 16))(v45, a2, v5);

}

void sub_1BEC89FF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1BEC8A014(uint64_t a1, uint64_t a2, id obj)
{
  id v5;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

uint64_t sub_1BEC8A350(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  CKDPZoneCapabilities *v18;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 4)
      {
        v18 = (CKDPZoneCapabilities *)objc_alloc_init(MEMORY[0x1E0C94C60]);
        objc_storeStrong((id *)(a1 + 16), v18);
        if (!PBReaderPlaceMark() || (CKDPDateReadFrom() & 1) == 0)
        {
LABEL_42:

          return 0;
        }
      }
      else
      {
        if ((_DWORD)v17 == 3)
        {
          v19 = 0;
          v20 = 0;
          v21 = 0;
          *(_BYTE *)(a1 + 28) |= 1u;
          while (1)
          {
            v22 = *v3;
            v23 = *(_QWORD *)(a2 + v22);
            if (v23 == -1 || v23 >= *(_QWORD *)(a2 + *v4))
              break;
            v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v23);
            *(_QWORD *)(a2 + v22) = v23 + 1;
            v21 |= (unint64_t)(v24 & 0x7F) << v19;
            if ((v24 & 0x80) == 0)
              goto LABEL_37;
            v19 += 7;
            v14 = v20++ >= 9;
            if (v14)
            {
              v21 = 0;
              goto LABEL_39;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_37:
          if (*(_BYTE *)(a2 + *v5))
            v21 = 0;
LABEL_39:
          *(_BYTE *)(a1 + 24) = v21 != 0;
          continue;
        }
        if ((_DWORD)v17 != 1)
        {
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
        }
        v18 = objc_alloc_init(CKDPZoneCapabilities);
        objc_storeStrong((id *)(a1 + 8), v18);
        if (!PBReaderPlaceMark() || (sub_1BEBD7050((uint64_t)v18, a2) & 1) == 0)
          goto LABEL_42;
      }
      PBReaderRecallMark();

    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void *sub_1BEC8AAC4()
{
  uint64_t v0;
  unsigned int (**v1)(_QWORD, uint64_t, void *);
  void *v2;

  v0 = ccrng();
  if (!v0)
    return 0;
  v1 = (unsigned int (**)(_QWORD, uint64_t, void *))v0;
  v2 = malloc_type_malloc(0x20uLL, 0x1000040E0EAB150uLL);
  if (v2 && (*v1)(v1, 32, v2))
  {
    free(v2);
    return 0;
  }
  return v2;
}

void *sub_1BEC8AB34()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  void *v3;

  v0 = ccecies_encrypt_gcm_ciphertext_size();
  if (!v0)
    return 0;
  v1 = v0;
  v2 = malloc_type_malloc(v0 + 16, 0x5D7E4D2DuLL);
  v3 = v2;
  if (v2)
  {
    v2[1] = v1;
    *v2 = v2 + 2;
    if (ccecies_encrypt_gcm())
    {
      free(v3);
      return 0;
    }
  }
  return v3;
}

__n128 sub_1BEC8ABE0(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  if (ccrng() && !sub_1BEC8ACA4(a1, (_QWORD *)(a2 + 40)))
  {
    ccsha256_di();
    ccaes_gcm_encrypt_mode();
    if (ccecies_encrypt_gcm_setup())
    {
      sub_1BEC8AD7C(*(void **)(a2 + 40));
      cc_clear();
    }
    else
    {
      v5 = *(_OWORD *)(a1 + 48);
      *(_OWORD *)(a2 + 48) = *(_OWORD *)(a1 + 32);
      *(_OWORD *)(a2 + 64) = v5;
      v7 = *(_OWORD *)(a1 + 96);
      v6 = *(_OWORD *)(a1 + 112);
      v8 = *(_OWORD *)(a1 + 80);
      *(_BYTE *)(a2 + 144) = *(_BYTE *)(a1 + 128);
      *(_OWORD *)(a2 + 112) = v7;
      *(_OWORD *)(a2 + 128) = v6;
      *(_OWORD *)(a2 + 96) = v8;
      result = *(__n128 *)(a1 + 64);
      *(__n128 *)(a2 + 80) = result;
    }
  }
  return result;
}

uint64_t sub_1BEC8ACA4(uint64_t a1, _QWORD *a2)
{
  size_t v3;
  uint64_t result;
  void *v5;
  void *v6;

  v3 = 24 * *(_QWORD *)MEMORY[0x1C3B83944]() + 16;
  if (v3 < 0x20)
    return 0xFFFFFFFFLL;
  v5 = malloc_type_calloc(1uLL, v3, 0xCEF84BE1uLL);
  if (!v5)
    return 4294967294;
  v6 = v5;
  if (ccec_compact_import_pub())
  {
    free(v6);
    return 4294967290;
  }
  else if ((ccec_validate_pub() & 1) != 0)
  {
    result = 0;
    *a2 = v6;
  }
  else
  {
    cc_clear();
    free(v6);
    return 4294967289;
  }
  return result;
}

void sub_1BEC8AD7C(void *a1)
{
  MEMORY[0x1C3B83944]();
  cc_clear();
  free(a1);
}

uint64_t sub_1BEC8ADB8(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 40))
  {
    MEMORY[0x1C3B83944]();
    cc_clear();
  }
  cc_clear();
  cc_clear();
  return cc_clear();
}

void sub_1BEC8AE18(uint64_t a1)
{
  void *v2;

  sub_1BEC8ADB8(a1);
  v2 = *(void **)(a1 + 40);
  if (v2)
    sub_1BEC8AD7C(v2);
}

uint64_t sub_1BEC8AE4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v8;
  uint64_t result;
  unsigned int (**v10)(_QWORD, uint64_t, uint64_t);

  v8 = ccaes_gcm_encrypt_mode();
  MEMORY[0x1E0C80A78](v8);
  if (*a5 < (unint64_t)(a3 + 32))
    return 0xFFFFFFFFLL;
  v10 = (unsigned int (**)(_QWORD, uint64_t, uint64_t))ccrng();
  if (!v10)
    return 4294967291;
  if ((*v10)(v10, 16, a4))
    return 4294967293;
  ccgcm_init();
  ccgcm_set_iv();
  ccgcm_update();
  ccgcm_finalize();
  ccgcm_context_size();
  cc_clear();
  result = 0;
  *a5 = a3 + 32;
  return result;
}

uint64_t sub_1BEC8AFAC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t *a5)
{
  uint64_t v7;
  unint64_t v8;
  uint64_t result;
  int v10;

  v7 = ccaes_gcm_decrypt_mode();
  if (a3 >= 0x20)
    v8 = a3 - 32;
  else
    v8 = 0;
  MEMORY[0x1E0C80A78](v7);
  if (a3 < 0x21 || *a5 < v8)
    return 0xFFFFFFFFLL;
  ccgcm_init();
  ccgcm_set_iv();
  ccgcm_update();
  ccgcm_finalize();
  v10 = cc_cmp_safe();
  ccgcm_context_size();
  cc_clear();
  if (v10)
    return 4294967292;
  result = 0;
  *a5 = v8;
  return result;
}

__n128 sub_1BEC8B10C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  __n128 result;
  void *v8;
  __int128 v9;
  __int128 v10;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v3 = *a1;
    if (*a1)
    {
      v4 = a1[2];
      if (v4)
      {
        if (a2)
        {
          if (a3)
          {
            if (a1[1] == 472 && *(_QWORD *)(v3 + 384) <= 0x49uLL && a1[3] == 472 && *(_QWORD *)(v4 + 384) <= 0x49uLL)
            {
              memset(v11, 0, 24);
              if (!sub_1BEC8ACA4(v4 + 320, v11))
              {
                if (*(_QWORD *)(v3 + 384) >= 0x4AuLL)
                  __assert_rtn("pcc_opaque_quote_get_signature", "CProtectedCloudComputeQuote.c", 226, "*signature_len <= MAX_SIGNATURE_LEN");
                v8 = (void *)v11[0];
                ccsha256_di();
                if (ccec_verify_msg() || cc_cmp_safe())
                {
                  free(v8);
                }
                else
                {
                  free(v8);
                  if (!sub_1BEC8B2B8(v3, v4, a2))
                  {
                    v9 = *(_OWORD *)(v4 + 336);
                    *(_OWORD *)(a3 + 32) = *(_OWORD *)(v4 + 320);
                    *(_OWORD *)(a3 + 48) = v9;
                    *(_OWORD *)(a3 + 64) = 0u;
                    *(_OWORD *)(a3 + 80) = 0u;
                    *(_OWORD *)(a3 + 96) = 0u;
                    *(_OWORD *)(a3 + 112) = 0u;
                    *(_BYTE *)(a3 + 128) = 0;
                    result = *(__n128 *)(v3 + 320);
                    v10 = *(_OWORD *)(v3 + 336);
                    *(__n128 *)a3 = result;
                    *(_OWORD *)(a3 + 16) = v10;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_1BEC8B2B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a1)
    __assert_rtn("authorise_quote", "CProtectedCloudComputeCore.c", 417, "app_quote != NULL");
  if (!a2)
    __assert_rtn("authorise_quote", "CProtectedCloudComputeCore.c", 418, "aqe_quote != NULL");
  if (!*(_BYTE *)(a3 + 43) && (*(_BYTE *)(a1 + 48) & 2) != 0)
    return 4294967281;
  if (*(_QWORD *)a3 != *(_QWORD *)(a1 + 64)
    || *(_QWORD *)(a3 + 8) != *(_QWORD *)(a1 + 72)
    || *(_QWORD *)(a3 + 16) != *(_QWORD *)(a1 + 80)
    || *(_QWORD *)(a3 + 24) != *(_QWORD *)(a1 + 88))
  {
    return 4294967286;
  }
  if (*(_BYTE *)(a3 + 42))
    return 0;
  if (sub_1BEC8B37C(a2, a3))
    return 0;
  return 4294967284;
}

BOOL sub_1BEC8B37C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  unint64_t v6;
  _QWORD *v7;
  _QWORD *v11;
  uint64_t v12;
  unint64_t v13;
  BOOL v14;
  BOOL v15;
  BOOL v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = ccsha256_di();
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v18 - v4;
  ccdigest_init();
  ccdigest_update();
  (*(void (**)(uint64_t, char *, uint64_t *))(v3 + 56))(v3, v5, &v19);
  v6 = *(unsigned __int16 *)(a2 + 40);
  if (!*(_WORD *)(a2 + 40))
    return 0;
  v7 = *(_QWORD **)(a2 + 32);
  if (*v7 == v19 && v7[1] == v20 && v7[2] == v21 && v7[3] == v22)
    return 1;
  v11 = v7 + 4;
  v12 = 1;
  do
  {
    v13 = v12;
    if (v6 == v12)
      break;
    v14 = *v11 == v19 && v11[1] == v20;
    v15 = v14 && v11[2] == v21;
    v16 = v15 && v11[3] == v22;
    ++v12;
    v11 += 4;
  }
  while (!v16);
  return v13 < v6;
}

uint64_t URLRequest.allHTTPHeaderFields.getter()
{
  return MEMORY[0x1E0CADEF0]();
}

uint64_t static URLRequest._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1E0CADF08]();
}

uint64_t type metadata accessor for URLRequest()
{
  return MEMORY[0x1E0CADF50]();
}

uint64_t dispatch thunk of JSONDecoder.decode<A>(_:from:)()
{
  return MEMORY[0x1E0CAE070]();
}

uint64_t JSONDecoder.init()()
{
  return MEMORY[0x1E0CAE0A8]();
}

uint64_t type metadata accessor for JSONDecoder()
{
  return MEMORY[0x1E0CAE0B8]();
}

uint64_t dispatch thunk of PropertyListDecoder.decode<A>(_:from:)()
{
  return MEMORY[0x1E0CAF5C8]();
}

uint64_t PropertyListDecoder.init()()
{
  return MEMORY[0x1E0CAF5F8]();
}

uint64_t type metadata accessor for PropertyListDecoder()
{
  return MEMORY[0x1E0CAF608]();
}

uint64_t dispatch thunk of PropertyListEncoder.outputFormat.setter()
{
  return MEMORY[0x1E0CAF628]();
}

uint64_t dispatch thunk of PropertyListEncoder.encode<A>(_:)()
{
  return MEMORY[0x1E0CAF638]();
}

uint64_t PropertyListEncoder.init()()
{
  return MEMORY[0x1E0CAF668]();
}

uint64_t type metadata accessor for PropertyListEncoder()
{
  return MEMORY[0x1E0CAF670]();
}

uint64_t _BridgedStoredNSError._getEmbeddedNSError()()
{
  return MEMORY[0x1E0CAF8D8]();
}

uint64_t _BridgedStoredNSError.init(_bridgedNSError:)()
{
  return MEMORY[0x1E0CAF8E8]();
}

uint64_t _BridgedStoredNSError.errorUserInfo.getter()
{
  return MEMORY[0x1E0CAF8F8]();
}

uint64_t static _BridgedStoredNSError.== infix(_:_:)()
{
  return MEMORY[0x1E0CAF900]();
}

uint64_t _BridgedStoredNSError.hash(into:)()
{
  return MEMORY[0x1E0CAF920]();
}

uint64_t _BridgedStoredNSError.errorCode.getter()
{
  return MEMORY[0x1E0CAF930]();
}

uint64_t _BridgedStoredNSError.init(_:userInfo:)()
{
  return MEMORY[0x1E0CAF940]();
}

uint64_t _convertErrorToNSError(_:)()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x1E0CAF990]();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
  MEMORY[0x1E0CAFE38](retstr);
}

uint64_t static URL.== infix(_:_:)()
{
  return MEMORY[0x1E0CAFED8]();
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t Data._Representation.subscript.getter()
{
  return MEMORY[0x1E0CB01B0]();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)MEMORY[0x1E0CB01F0]();
}

uint64_t static Data.== infix(_:_:)()
{
  return MEMORY[0x1E0CB0218]();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t Data.count.getter()
{
  return MEMORY[0x1E0CB0260]();
}

uint64_t static Date.distantPast.getter()
{
  return MEMORY[0x1E0CB0588]();
}

uint64_t Date.timeIntervalSince(_:)()
{
  return MEMORY[0x1E0CB05D8]();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)MEMORY[0x1E0CB06B8]();
}

uint64_t static Date.< infix(_:_:)()
{
  return MEMORY[0x1E0CB06D8]();
}

uint64_t static Date.== infix(_:_:)()
{
  return MEMORY[0x1E0CB07C8]();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1E0CB07E8]();
}

uint64_t Date.init()()
{
  return MEMORY[0x1E0CB0860]();
}

uint64_t type metadata accessor for Date()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t UUID.uuidString.getter()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t UUID.init()()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t type metadata accessor for UUID()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t static TimeZone.== infix(_:_:)()
{
  return MEMORY[0x1E0CB1450]();
}

uint64_t static TimeZone._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1E0CB1458]();
}

uint64_t static TimeZone.current.getter()
{
  return MEMORY[0x1E0CB1460]();
}

uint64_t type metadata accessor for TimeZone()
{
  return MEMORY[0x1E0CB1470]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t static __CKLogSubsystem.name.getter()
{
  return MEMORY[0x1E0C945A0]();
}

uint64_t CKLogTrafficCompressed.getter()
{
  return MEMORY[0x1E0C945B0]();
}

uint64_t CKCheckedUnsafeObjectTransfer.extractValue()()
{
  return MEMORY[0x1E0C945C8]();
}

uint64_t CKCheckedUnsafeObjectTransfer.init(_:)()
{
  return MEMORY[0x1E0C945D8]();
}

uint64_t CKLog.getter()
{
  return MEMORY[0x1E0C945E0]();
}

uint64_t type metadata accessor for DispatchTimeInterval()
{
  return MEMORY[0x1E0DEF4A8]();
}

uint64_t static DispatchTimeoutResult.== infix(_:_:)()
{
  return MEMORY[0x1E0DEF4B8]();
}

uint64_t type metadata accessor for DispatchQoS.QoSClass()
{
  return MEMORY[0x1E0DEF560]();
}

uint64_t static DispatchTime.distantFuture.getter()
{
  return MEMORY[0x1E0DEF678]();
}

uint64_t static DispatchTime.now()()
{
  return MEMORY[0x1E0DEF698]();
}

uint64_t type metadata accessor for DispatchTime()
{
  return MEMORY[0x1E0DEF6B8]();
}

uint64_t + infix(_:_:)()
{
  return MEMORY[0x1E0DEF750]();
}

uint64_t related decl 'e' for CKErrorCode.init(_:description:)()
{
  return MEMORY[0x1E0C945F0]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x1E0CB17D8]();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t Dictionary.description.getter()
{
  return MEMORY[0x1E0DE9E38]();
}

uint64_t Dictionary.init(dictionaryLiteral:)()
{
  return MEMORY[0x1E0DE9E78]();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return MEMORY[0x1E0DEA1C0]();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x1E0DEA568]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x1E0CB1940]();
}

uint64_t static String._forceBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x1E0CB1960]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t String.data(using:allowLossyConversion:)()
{
  return MEMORY[0x1E0CB1988]();
}

uint64_t String.init(data:encoding:)()
{
  return MEMORY[0x1E0CB1990]();
}

uint64_t static String.Encoding.utf8.getter()
{
  return MEMORY[0x1E0CB19E8]();
}

uint64_t type metadata accessor for String.Encoding()
{
  return MEMORY[0x1E0CB1A18]();
}

uint64_t String.init<A>(describing:)()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t static String._fromSubstring(_:)()
{
  return MEMORY[0x1E0DEA658]();
}

uint64_t static String._uncheckedFromUTF8(_:)()
{
  return MEMORY[0x1E0DEA6F8]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t String.count.getter()
{
  return MEMORY[0x1E0DEA7B8]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
  MEMORY[0x1E0DEA800](a1._countAndFlagsBits, a1._object);
}

Swift::String_optional __swiftcall String.Iterator.next()()
{
  uint64_t v0;
  void *v1;
  Swift::String_optional result;

  v0 = MEMORY[0x1E0DEA840]();
  result.value._object = v1;
  result.value._countAndFlagsBits = v0;
  return result;
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t String.UTF8View._foreignIndex(after:)()
{
  return MEMORY[0x1E0DEA858]();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:)()
{
  return MEMORY[0x1E0DEA870]();
}

uint64_t String.UTF8View._foreignDistance(from:to:)()
{
  return MEMORY[0x1E0DEA878]();
}

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return MEMORY[0x1E0DEA880]();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return MEMORY[0x1E0DEA908]();
}

uint64_t String.init<A>(_:)()
{
  return MEMORY[0x1E0DEAA40]();
}

uint64_t String.subscript.getter()
{
  return MEMORY[0x1E0DEAA50]();
}

uint64_t RawRepresentable<>.encode(to:)()
{
  return MEMORY[0x1E0DEACB8]();
}

uint64_t RawRepresentable<>.init(from:)()
{
  return MEMORY[0x1E0DEAD30]();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x1E0DEADA0]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x1E0CB1AC0]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t specialized Array._endMutation()()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return MEMORY[0x1E0DEAE28]();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return MEMORY[0x1E0DF05D0]();
}

uint64_t static TaskPriority.utility.getter()
{
  return MEMORY[0x1E0DF0738]();
}

uint64_t TaskPriority.rawValue.getter()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t type metadata accessor for TaskPriority()
{
  return MEMORY[0x1E0DF0750]();
}

Swift::Void __swiftcall Task.cancel()()
{
  MEMORY[0x1E0DF0870]();
}

uint64_t Task<>.value.getter()
{
  return MEMORY[0x1E0DF08A8]();
}

uint64_t static Task<>.isCancelled.getter()
{
  return MEMORY[0x1E0DF08B8]();
}

uint64_t Collection<>.split<A>(separator:maxSplits:omittingEmptySubsequences:)()
{
  return MEMORY[0x1E0DF1FC0]();
}

uint64_t Range<>.init(_:in:)()
{
  return MEMORY[0x1E0CB1C58]();
}

uint64_t NSPredicate.init(format:_:)()
{
  return MEMORY[0x1E0CB1C90]();
}

uint64_t static os_log_type_t.info.getter()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t static os_log_type_t.debug.getter()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t OS_dispatch_group.wait(timeout:)()
{
  return MEMORY[0x1E0DEF7D8]();
}

uint64_t static OS_dispatch_queue.global(qos:)()
{
  return MEMORY[0x1E0DEF920]();
}

uint64_t OS_dispatch_semaphore.wait(timeout:)()
{
  return MEMORY[0x1E0DEFA60]();
}

Swift::Int __swiftcall OS_dispatch_semaphore.signal()()
{
  return MEMORY[0x1E0DEFA70]();
}

uint64_t NSData.startIndex.getter()
{
  return MEMORY[0x1E0CB1FC0]();
}

uint64_t NSData.endIndex.getter()
{
  return MEMORY[0x1E0CB1FC8]();
}

uint64_t NSCoder.decodeObject<A>(of:forKey:)()
{
  return MEMORY[0x1E0CB2020]();
}

uint64_t NSCoder.decodeDictionary<A, B>(withKeyClass:objectClass:forKey:)()
{
  return MEMORY[0x1E0CB2038]();
}

uint64_t NSObject.hashValue.getter()
{
  return MEMORY[0x1E0DEFCF0]();
}

uint64_t OS_os_log.init(subsystem:category:)()
{
  return MEMORY[0x1E0DF22E0]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t StringProtocol.caseInsensitiveCompare<A>(_:)()
{
  return MEMORY[0x1E0CB24B8]();
}

uint64_t StringProtocol.contains<A>(_:)()
{
  return MEMORY[0x1E0CB2588]();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t _HashTable.occupiedBucket(after:)()
{
  return MEMORY[0x1E0DEC070]();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return MEMORY[0x1E0DEC168](seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return MEMORY[0x1E0DEC178]();
}

uint64_t AnyHashable.init<A>(_:)()
{
  return MEMORY[0x1E0DEC1B0]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
  MEMORY[0x1E0DEC2A8](a1);
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t DecodingError.Context.init(codingPath:debugDescription:underlyingError:)()
{
  return MEMORY[0x1E0DEC470]();
}

uint64_t type metadata accessor for DecodingError()
{
  return MEMORY[0x1E0DEC498]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t type metadata accessor for ContinuousClock.Instant()
{
  return MEMORY[0x1E0DF0B60]();
}

uint64_t ContinuousClock.init()()
{
  return MEMORY[0x1E0DF0B98]();
}

uint64_t type metadata accessor for ContinuousClock()
{
  return MEMORY[0x1E0DF0BA0]();
}

uint64_t dispatch thunk of InstantProtocol.advanced(by:)()
{
  return MEMORY[0x1E0DEC7D0]();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x1E0DEC8E0]();
}

Swift::Bool __swiftcall _NativeDictionary.ensureUnique(isUnique:capacity:)(Swift::Bool isUnique, Swift::Int capacity)
{
  return MEMORY[0x1E0DECAE0](isUnique, capacity);
}

Swift::Void __swiftcall _NativeDictionary.copy()()
{
  MEMORY[0x1E0DECAF8]();
}

uint64_t _NativeDictionary._delete(at:)()
{
  return MEMORY[0x1E0DECB00]();
}

uint64_t __CocoaDictionary.makeIterator()()
{
  return MEMORY[0x1E0DECB40]();
}

uint64_t __CocoaDictionary.count.getter()
{
  return MEMORY[0x1E0DECB80]();
}

uint64_t __CocoaDictionary.Iterator.next()()
{
  return MEMORY[0x1E0DECBB8]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x1E0DECBE0]();
}

{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t _bridgeCocoaArray<A>(_:)()
{
  return MEMORY[0x1E0DECBF8]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return MEMORY[0x1E0DECF38]();
}

uint64_t KeyedDecodingContainer.codingPath.getter()
{
  return MEMORY[0x1E0DECF40]();
}

uint64_t KeyedDecodingContainer.decodeIfPresent(_:forKey:)()
{
  return MEMORY[0x1E0DECF58]();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return MEMORY[0x1E0DECFC0]();
}

{
  return MEMORY[0x1E0DECFC8]();
}

{
  return MEMORY[0x1E0DECFE0]();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return MEMORY[0x1E0DECFF0]();
}

uint64_t KeyedDecodingContainer.allKeys.getter()
{
  return MEMORY[0x1E0DED038]();
}

uint64_t KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return MEMORY[0x1E0DED070]();
}

uint64_t KeyedEncodingContainer.encodeIfPresent(_:forKey:)()
{
  return MEMORY[0x1E0DED090]();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return MEMORY[0x1E0DED0F0]();
}

{
  return MEMORY[0x1E0DED0F8]();
}

{
  return MEMORY[0x1E0DED110]();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return MEMORY[0x1E0DED120]();
}

uint64_t specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x1E0DED1A0]();
}

Swift::Int __swiftcall _minimumMergeRunLength(_:)(Swift::Int a1)
{
  return MEMORY[0x1E0DED1B0](a1);
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t withCheckedContinuation<A>(isolation:function:_:)()
{
  return MEMORY[0x1E0DF0DD0]();
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(_:)()
{
  return MEMORY[0x1E0DED548]();
}

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter()
{
  return MEMORY[0x1E0DED768]();
}

uint64_t _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)()
{
  return MEMORY[0x1E0DED9C8]();
}

uint64_t _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)()
{
  return MEMORY[0x1E0DED9F8]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t dispatch thunk of Clock.now.getter()
{
  return MEMORY[0x1E0DF0EE8]();
}

uint64_t dispatch thunk of Clock.sleep(until:tolerance:)()
{
  return MEMORY[0x1E0DF0EF0]();
}

uint64_t Error<>._code.getter()
{
  return MEMORY[0x1E0CB2628]();
}

uint64_t Error<>._domain.getter()
{
  return MEMORY[0x1E0CB2640]();
}

uint64_t Error._userInfo.getter()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t print(_:separator:terminator:)()
{
  return MEMORY[0x1E0DEDED8]();
}

uint64_t static Hasher._hash(seed:_:)()
{
  return MEMORY[0x1E0DEDEF0]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x1E0DEDEF8]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
  MEMORY[0x1E0DEDF10](a1);
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt8 a1)
{
  MEMORY[0x1E0DEDF18](a1);
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt32 a1)
{
  MEMORY[0x1E0DEDF28](*(_QWORD *)&a1);
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t CodingKey.description.getter()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t CodingKey.debugDescription.getter()
{
  return MEMORY[0x1E0DEE8E8]();
}

uint64_t _typeName(_:qualified:)()
{
  return MEMORY[0x1E0DEE978]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1E0D15420]();
}

uint64_t BYSetupAssistantNeedsToRun()
{
  return MEMORY[0x1E0D8D6F8]();
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80328](data, *(_QWORD *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80368](data, *(_QWORD *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x1E0C98080](bundle, resourceName, resourceType, subDirName);
}

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1E0C98180](bundle, key);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98500](theDict, key, value);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x1E0C985C8](theDict, key, value);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x1E0C985E8](theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFDictionaryRef CFErrorCopyUserInfo(CFErrorRef err)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98648](err);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x1E0C98650](allocator, domain, code, userInfo);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x1E0C98660](err);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x1E0C989D0](number);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFStreamCreateBoundPair(CFAllocatorRef alloc, CFReadStreamRef *readStream, CFWriteStreamRef *writeStream, CFIndex transferBufferSize)
{
  MEMORY[0x1E0C98EC0](alloc, readStream, writeStream, transferBufferSize);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1E0C995A8](allocator, flags, error, dictionary, timeout);
}

void CFWriteStreamSetDispatchQueue(CFWriteStreamRef stream, dispatch_queue_t q)
{
  MEMORY[0x1E0C99668](stream, q);
}

uint64_t CKAddResponseHeaderValuesToUserInfoDictionary()
{
  return MEMORY[0x1E0C94698]();
}

uint64_t CKApplicationBundleIDForPush()
{
  return MEMORY[0x1E0C946A8]();
}

uint64_t CKBoolFromCKTernary()
{
  return MEMORY[0x1E0C946B8]();
}

uint64_t CKBoolFromCKTernaryWithDefault()
{
  return MEMORY[0x1E0C946C0]();
}

uint64_t CKBuildVersion()
{
  return MEMORY[0x1E0C946C8]();
}

uint64_t CKCFArrayForEach()
{
  return MEMORY[0x1E0C946D0]();
}

uint64_t CKCanRetryForError()
{
  return MEMORY[0x1E0C946D8]();
}

uint64_t CKCodeRecordTransportReadFrom()
{
  return MEMORY[0x1E0C946E0]();
}

uint64_t CKContainerEnvironmentString()
{
  return MEMORY[0x1E0C946F0]();
}

uint64_t CKCreateDirectoryAtPath()
{
  return MEMORY[0x1E0C94700]();
}

uint64_t CKCreateDirectoryAtPathWithAttributes()
{
  return MEMORY[0x1E0C94708]();
}

uint64_t CKCreateDirectoryAtURL()
{
  return MEMORY[0x1E0C94710]();
}

uint64_t CKCreateGUID()
{
  return MEMORY[0x1E0C94718]();
}

uint64_t CKCurrentThreadQualityOfService()
{
  return MEMORY[0x1E0C94720]();
}

uint64_t CKDPDateReadFrom()
{
  return MEMORY[0x1E0C94740]();
}

uint64_t CKDPDistributedTimestampsReadFrom()
{
  return MEMORY[0x1E0C94748]();
}

uint64_t CKDPIdentifierReadFrom()
{
  return MEMORY[0x1E0C94750]();
}

uint64_t CKDPLocationCoordinateReadFrom()
{
  return MEMORY[0x1E0C94758]();
}

uint64_t CKDPRecordIdentifierReadFrom()
{
  return MEMORY[0x1E0C94760]();
}

uint64_t CKDPRecordReferenceReadFrom()
{
  return MEMORY[0x1E0C94768]();
}

uint64_t CKDPRecordZoneIdentifierReadFrom()
{
  return MEMORY[0x1E0C94770]();
}

uint64_t CKDatabaseScopeString()
{
  return MEMORY[0x1E0C94778]();
}

uint64_t CKDescriptionForTimeInterval()
{
  return MEMORY[0x1E0C94780]();
}

uint64_t CKDeviceClass()
{
  return MEMORY[0x1E0C94788]();
}

uint64_t CKDeviceSerialNumber()
{
  return MEMORY[0x1E0C94790]();
}

uint64_t CKDeviceUDID()
{
  return MEMORY[0x1E0C94798]();
}

uint64_t CKErrorChainStringFromError()
{
  return MEMORY[0x1E0C947B0]();
}

uint64_t CKErrorFromHTTPResponse()
{
  return MEMORY[0x1E0C947E0]();
}

uint64_t CKExtendedMethodSignatureForProtocolSelector()
{
  return MEMORY[0x1E0C94828]();
}

uint64_t CKGetGlobalQueue()
{
  return MEMORY[0x1E0C94838]();
}

uint64_t CKGetHomeDir()
{
  return MEMORY[0x1E0C94840]();
}

uint64_t CKGetRealPath()
{
  return MEMORY[0x1E0C94848]();
}

uint64_t CKHandleSignificantIssueBehavior()
{
  return MEMORY[0x1E0C94858]();
}

uint64_t CKHexCharFromBytes()
{
  return MEMORY[0x1E0C94860]();
}

uint64_t CKIsIndexedArrayKey()
{
  return MEMORY[0x1E0C94888]();
}

uint64_t CKIsPCSError()
{
  return MEMORY[0x1E0C94890]();
}

uint64_t CKIsRunningInSyncBubble()
{
  return MEMORY[0x1E0C94898]();
}

uint64_t CKIsRunningInTestHost()
{
  return MEMORY[0x1E0C948A0]();
}

uint64_t CKLinkCheck32f5805a68adfc1b65f94a0de69aa32177c7cd24()
{
  return MEMORY[0x1E0C948A8]();
}

uint64_t CKLinkCheck48d9728e8c354416a38f82379cbb35e3()
{
  return MEMORY[0x1E0C948B0]();
}

uint64_t CKLinkCheckc809671068f5f334951d6b3e996f193c()
{
  return MEMORY[0x1E0C948B8]();
}

uint64_t CKLocalizedString()
{
  return MEMORY[0x1E0C948C0]();
}

uint64_t CKMainBundleIsAppleExecutable()
{
  return MEMORY[0x1E0C948C8]();
}

uint64_t CKNSIndexSet_enumerateInverseRangesInRange_options_usingBlock()
{
  return MEMORY[0x1E0C948D8]();
}

uint64_t CKObjectsAreBothNilOrEqual()
{
  return MEMORY[0x1E0C948E0]();
}

uint64_t CKOncePerBoot()
{
  return MEMORY[0x1E0C948E8]();
}

uint64_t CKOperationExecutionStateIsExecuting()
{
  return MEMORY[0x1E0C948F0]();
}

uint64_t CKOperationExecutionStateIsFinished()
{
  return MEMORY[0x1E0C948F8]();
}

uint64_t CKOperationExecutionStateTransitionToExecuting()
{
  return MEMORY[0x1E0C94900]();
}

uint64_t CKOperationExecutionStateTransitionToFinished()
{
  return MEMORY[0x1E0C94908]();
}

uint64_t CKOperationProgressCallbackClasses()
{
  return MEMORY[0x1E0C94918]();
}

uint64_t CKPIDForProcessNamed()
{
  return MEMORY[0x1E0C94930]();
}

uint64_t CKPIDIsStillAlive()
{
  return MEMORY[0x1E0C94938]();
}

uint64_t CKProcessIndexedArrayKey()
{
  return MEMORY[0x1E0C94950]();
}

uint64_t CKProductType()
{
  return MEMORY[0x1E0C94958]();
}

uint64_t CKProductVersion()
{
  return MEMORY[0x1E0C94960]();
}

uint64_t CKPushTopicForPushBehavior()
{
  return MEMORY[0x1E0C94970]();
}

uint64_t CKQoSClassFromNSQualityOfService()
{
  return MEMORY[0x1E0C94978]();
}

uint64_t CKQualityOfServiceOrdering()
{
  return MEMORY[0x1E0C94980]();
}

uint64_t CKRandomDataWithLength()
{
  return MEMORY[0x1E0C94990]();
}

uint64_t CKRunningInClientProcess()
{
  return MEMORY[0x1E0C94A58]();
}

uint64_t CKShortRandomID()
{
  return MEMORY[0x1E0C94A90]();
}

uint64_t CKShouldWrapErrorFetchingRecords()
{
  return MEMORY[0x1E0C94A98]();
}

uint64_t CKStringForDiscretionaryNetworkBehavior()
{
  return MEMORY[0x1E0C94AA0]();
}

uint64_t CKStringForDuetPreClearedMode()
{
  return MEMORY[0x1E0C94AA8]();
}

uint64_t CKStringForNetworkServiceType()
{
  return MEMORY[0x1E0C94AB0]();
}

uint64_t CKStringForQOS()
{
  return MEMORY[0x1E0C94AB8]();
}

uint64_t CKStringFromAccountChangeType()
{
  return MEMORY[0x1E0C94AC0]();
}

uint64_t CKStringFromAccountStatus()
{
  return MEMORY[0x1E0C94AC8]();
}

uint64_t CKStringFromParticipantPermission()
{
  return MEMORY[0x1E0C94AD8]();
}

uint64_t CKStringFromParticipantRole()
{
  return MEMORY[0x1E0C94AE0]();
}

uint64_t CKStringFromServerEnvironment()
{
  return MEMORY[0x1E0C94AF0]();
}

uint64_t CKStringWithData()
{
  return MEMORY[0x1E0C94B00]();
}

uint64_t CKTabIndentAtDepth()
{
  return MEMORY[0x1E0C94B08]();
}

uint64_t CKTernaryFromBOOL()
{
  return MEMORY[0x1E0C94B10]();
}

uint64_t CKTestNotificationPrefix()
{
  return MEMORY[0x1E0C94B18]();
}

uint64_t CKValidateKeyName()
{
  return MEMORY[0x1E0C94B38]();
}

uint64_t CKValueIsAcceptablePredicateClass()
{
  return MEMORY[0x1E0C94B40]();
}

uint64_t IDSCopyIDForPhoneNumber()
{
  return MEMORY[0x1E0D33DF8]();
}

uint64_t MGCancelNotifications()
{
  return MEMORY[0x1E0DE2B18]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGRegisterForUpdates()
{
  return MEMORY[0x1E0DE2BA8]();
}

uint64_t MKBBackupClose()
{
  return MEMORY[0x1E0D4E440]();
}

uint64_t MKBBackupCreateFromFileDescriptors()
{
  return MEMORY[0x1E0D4E448]();
}

uint64_t MKBBackupPread()
{
  return MEMORY[0x1E0D4E460]();
}

uint64_t MKBBackupSize()
{
  return MEMORY[0x1E0D4E468]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1E0D4E4A0]();
}

uint64_t MMCSDuplicateRegisteredfile()
{
  return MEMORY[0x1E0D46598]();
}

uint64_t MMCSEngineCancelRequests()
{
  return MEMORY[0x1E0D465A0]();
}

uint64_t MMCSEngineCopyStatusReport()
{
  return MEMORY[0x1E0D465A8]();
}

uint64_t MMCSEngineCreateWithTargetDispatchQueue()
{
  return MEMORY[0x1E0D465B8]();
}

uint64_t MMCSEngineDestroy()
{
  return MEMORY[0x1E0D465C0]();
}

uint64_t MMCSEngineSetMetricsEnabled()
{
  return MEMORY[0x1E0D465D8]();
}

uint64_t MMCSGetChunks()
{
  return MEMORY[0x1E0D465E0]();
}

uint64_t MMCSGetItems()
{
  return MEMORY[0x1E0D465E8]();
}

uint64_t MMCSGetItemsWithSection()
{
  return MEMORY[0x1E0D465F0]();
}

uint64_t MMCSGetMaxChunkCountForSection()
{
  return MEMORY[0x1E0D465F8]();
}

uint64_t MMCSGetRegisteredItems()
{
  return MEMORY[0x1E0D46600]();
}

uint64_t MMCSICloudAuthGetRequestOptions()
{
  return MEMORY[0x1E0D46608]();
}

uint64_t MMCSICloudRequestHeadersCopy()
{
  return MEMORY[0x1E0D46610]();
}

uint64_t MMCSItemReaderWriterCreate()
{
  return MEMORY[0x1E0D46618]();
}

uint64_t MMCSItemReaderWriterCreateWithData()
{
  return MEMORY[0x1E0D46620]();
}

uint64_t MMCSItemReaderWriterCreateWithMutableData()
{
  return MEMORY[0x1E0D46628]();
}

uint64_t MMCSOperationMetricCombineMetrics()
{
  return MEMORY[0x1E0D46638]();
}

uint64_t MMCSPackageSectionSignatureGeneratorCreate()
{
  return MEMORY[0x1E0D46640]();
}

uint64_t MMCSPackageSectionSignatureGeneratorCreateWithBoundaryKey()
{
  return MEMORY[0x1E0D46648]();
}

uint64_t MMCSPackageSectionSignatureGeneratorFinishWithResults()
{
  return MEMORY[0x1E0D46650]();
}

uint64_t MMCSPackageSectionSignatureGeneratorUpdate()
{
  return MEMORY[0x1E0D46658]();
}

uint64_t MMCSPutItems()
{
  return MEMORY[0x1E0D46660]();
}

uint64_t MMCSPutSection()
{
  return MEMORY[0x1E0D46668]();
}

uint64_t MMCSReferenceObjectCreateWithType()
{
  return MEMORY[0x1E0D46670]();
}

uint64_t MMCSReferenceSignatureCreateWithReferenceObject()
{
  return MEMORY[0x1E0D46678]();
}

uint64_t MMCSRegisterItems()
{
  return MEMORY[0x1E0D46688]();
}

uint64_t MMCSRegisteredItemCount()
{
  return MEMORY[0x1E0D46690]();
}

uint64_t MMCSSignatureAndSchemeSize()
{
  return MEMORY[0x1E0D46698]();
}

uint64_t MMCSSignatureGeneratorCreate()
{
  return MEMORY[0x1E0D466B0]();
}

uint64_t MMCSSignatureGeneratorFinish()
{
  return MEMORY[0x1E0D466C8]();
}

uint64_t MMCSSignatureGeneratorUpdate()
{
  return MEMORY[0x1E0D466E0]();
}

uint64_t MMCSUnregisterFiles()
{
  return MEMORY[0x1E0D46700]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSUInteger NSPageSize(void)
{
  return MEMORY[0x1E0CB2FE8]();
}

Protocol *__cdecl NSProtocolFromString(NSString *namestr)
{
  return (Protocol *)MEMORY[0x1E0CB3118](namestr);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x1E0CB3218](proto);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1E0CB3220](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

uint64_t NSTimeIntervalToClosestXPCActivityInterval()
{
  return MEMORY[0x1E0C94B70]();
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1E0D82C10]();
}

uint64_t PBDataWriterWriteBareVarint()
{
  return MEMORY[0x1E0D82C18]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1E0D82C28]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x1E0D82C38]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1E0D82C58]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x1E0D82C68]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1E0D82C98]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x1E0D82CB0]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x1E0D82CB8]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x1E0D82CC0]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1E0D82CE0]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1E0D82CF0]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1E0D82D00]();
}

uint64_t PBReaderReadVarIntBuf()
{
  return MEMORY[0x1E0D82D08]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1E0D82D10]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1E0D82D28]();
}

uint64_t PBRepeatedInt32Add()
{
  return MEMORY[0x1E0D82DD8]();
}

uint64_t PBRepeatedInt32Clear()
{
  return MEMORY[0x1E0D82DE0]();
}

uint64_t PBRepeatedInt32Copy()
{
  return MEMORY[0x1E0D82DE8]();
}

uint64_t PBRepeatedInt32Hash()
{
  return MEMORY[0x1E0D82DF0]();
}

uint64_t PBRepeatedInt32IsEqual()
{
  return MEMORY[0x1E0D82DF8]();
}

uint64_t PBRepeatedInt32NSArray()
{
  return MEMORY[0x1E0D82E00]();
}

uint64_t PBRepeatedInt32Set()
{
  return MEMORY[0x1E0D82E08]();
}

uint64_t PBRepeatedInt64Add()
{
  return MEMORY[0x1E0D82E10]();
}

uint64_t PBRepeatedInt64Clear()
{
  return MEMORY[0x1E0D82E18]();
}

uint64_t PBRepeatedInt64Copy()
{
  return MEMORY[0x1E0D82E20]();
}

uint64_t PBRepeatedInt64Hash()
{
  return MEMORY[0x1E0D82E28]();
}

uint64_t PBRepeatedInt64IsEqual()
{
  return MEMORY[0x1E0D82E30]();
}

uint64_t PBRepeatedInt64NSArray()
{
  return MEMORY[0x1E0D82E38]();
}

uint64_t PBRepeatedInt64Set()
{
  return MEMORY[0x1E0D82E40]();
}

uint64_t PCSDeriveIdentity()
{
  return MEMORY[0x1E0D82638]();
}

uint64_t PCSFPAddEncryptedSharePCS()
{
  return MEMORY[0x1E0D82640]();
}

uint64_t PCSFPAddPrivateKey()
{
  return MEMORY[0x1E0D82648]();
}

uint64_t PCSFPAddPublicIdentity()
{
  return MEMORY[0x1E0D82650]();
}

uint64_t PCSFPAddPublicIdentityWithShareFlags()
{
  return MEMORY[0x1E0D82658]();
}

uint64_t PCSFPAddSharePCS()
{
  return MEMORY[0x1E0D82660]();
}

uint64_t PCSFPCopyAvailableMasterKeyIDs()
{
  return MEMORY[0x1E0D82668]();
}

uint64_t PCSFPCopyCurrentPrivateKey()
{
  return MEMORY[0x1E0D82670]();
}

uint64_t PCSFPCopyDecryptedData()
{
  return MEMORY[0x1E0D82678]();
}

uint64_t PCSFPCopyDiagnostic()
{
  return MEMORY[0x1E0D82680]();
}

uint64_t PCSFPCopyEncryptedData()
{
  return MEMORY[0x1E0D82688]();
}

uint64_t PCSFPCopyExported()
{
  return MEMORY[0x1E0D82690]();
}

uint64_t PCSFPCopyKeyIDs()
{
  return MEMORY[0x1E0D82698]();
}

uint64_t PCSFPCopyObject()
{
  return MEMORY[0x1E0D826A0]();
}

uint64_t PCSFPCopyPrivateKey()
{
  return MEMORY[0x1E0D826A8]();
}

uint64_t PCSFPCopyPublicIdentities()
{
  return MEMORY[0x1E0D826B0]();
}

uint64_t PCSFPCopyRecoverPCS()
{
  return MEMORY[0x1E0D826B8]();
}

uint64_t PCSFPCopyTruncatedKeyIDFromEncryptedData()
{
  return MEMORY[0x1E0D826C0]();
}

uint64_t PCSFPCopyUnwrappedKey()
{
  return MEMORY[0x1E0D826C8]();
}

uint64_t PCSFPCopyWrappedKey()
{
  return MEMORY[0x1E0D826D0]();
}

uint64_t PCSFPCreate()
{
  return MEMORY[0x1E0D826D8]();
}

uint64_t PCSFPCreateDerivedDataFromMasterKey()
{
  return MEMORY[0x1E0D826E0]();
}

uint64_t PCSFPCreatePEMData()
{
  return MEMORY[0x1E0D826E8]();
}

uint64_t PCSFPCreatePrivateKey()
{
  return MEMORY[0x1E0D826F0]();
}

uint64_t PCSFPCreateUniqueID()
{
  return MEMORY[0x1E0D826F8]();
}

uint64_t PCSFPCreateWithExported()
{
  return MEMORY[0x1E0D82700]();
}

uint64_t PCSFPGetAuthorshipIdentity()
{
  return MEMORY[0x1E0D82708]();
}

uint64_t PCSFPGetCurrentMasterKey()
{
  return MEMORY[0x1E0D82710]();
}

uint64_t PCSFPGetCurrentMasterKeyID()
{
  return MEMORY[0x1E0D82718]();
}

uint64_t PCSFPGetOwnerIdentity()
{
  return MEMORY[0x1E0D82720]();
}

uint64_t PCSFPGetUnwrapPublicIdentity()
{
  return MEMORY[0x1E0D82728]();
}

uint64_t PCSFPRemoveMasterKey()
{
  return MEMORY[0x1E0D82730]();
}

uint64_t PCSFPRemovePrivateKey()
{
  return MEMORY[0x1E0D82738]();
}

uint64_t PCSFPRemovePublicIdentity()
{
  return MEMORY[0x1E0D82740]();
}

uint64_t PCSFPRemoveSharePCS()
{
  return MEMORY[0x1E0D82748]();
}

uint64_t PCSFPRollMasterKey()
{
  return MEMORY[0x1E0D82750]();
}

uint64_t PCSFPSetAuthorshipIdentity()
{
  return MEMORY[0x1E0D82758]();
}

uint64_t PCSFPSetCurrentPrivateKey()
{
  return MEMORY[0x1E0D82760]();
}

uint64_t PCSFPSetOwnerIdentity()
{
  return MEMORY[0x1E0D82768]();
}

uint64_t PCSFPShouldRoll()
{
  return MEMORY[0x1E0D82770]();
}

uint64_t PCSFPSupportFeature()
{
  return MEMORY[0x1E0D82778]();
}

uint64_t PCSFPUpdateIdentityAndRollZoneKey()
{
  return MEMORY[0x1E0D82780]();
}

uint64_t PCSFPUpdateZoneKey()
{
  return MEMORY[0x1E0D82788]();
}

uint64_t PCSGetBoundaryKey()
{
  return MEMORY[0x1E0D82790]();
}

uint64_t PCSGetPublicIdentitites()
{
  return MEMORY[0x1E0D82798]();
}

uint64_t PCSIdentityCopyCurrentKeyFingerprint()
{
  return MEMORY[0x1E0D827A0]();
}

uint64_t PCSIdentityCopyExportedPrivateKey()
{
  return MEMORY[0x1E0D827A8]();
}

uint64_t PCSIdentityCopyExportedPublicKey()
{
  return MEMORY[0x1E0D827B0]();
}

uint64_t PCSIdentityCopyExternalForm()
{
  return MEMORY[0x1E0D827B8]();
}

uint64_t PCSIdentityCopyPublicIdentity()
{
  return MEMORY[0x1E0D827C0]();
}

uint64_t PCSIdentityCreateDiversifiedIdentityOptions()
{
  return MEMORY[0x1E0D827C8]();
}

uint64_t PCSIdentityCreateExportedRawCompact()
{
  return MEMORY[0x1E0D827D0]();
}

uint64_t PCSIdentityCreateFromRaw()
{
  return MEMORY[0x1E0D827D8]();
}

uint64_t PCSIdentityCreateMaster()
{
  return MEMORY[0x1E0D827E0]();
}

uint64_t PCSIdentityCreateRandomCompactRaw()
{
  return MEMORY[0x1E0D827E8]();
}

uint64_t PCSIdentityCreateService()
{
  return MEMORY[0x1E0D827F0]();
}

uint64_t PCSIdentityCreateSignature()
{
  return MEMORY[0x1E0D827F8]();
}

uint64_t PCSIdentityGetKeyID()
{
  return MEMORY[0x1E0D82800]();
}

uint64_t PCSIdentityGetPublicKey()
{
  return MEMORY[0x1E0D82808]();
}

uint64_t PCSIdentityGetServiceName()
{
  return MEMORY[0x1E0D82810]();
}

uint64_t PCSIdentityIsFullManatee()
{
  return MEMORY[0x1E0D82818]();
}

uint64_t PCSIdentityRecoverFDE()
{
  return MEMORY[0x1E0D82820]();
}

uint64_t PCSIdentityRollIdentity()
{
  return MEMORY[0x1E0D82828]();
}

uint64_t PCSIdentitySetAddIdentity()
{
  return MEMORY[0x1E0D82830]();
}

uint64_t PCSIdentitySetAddIdentityWithError()
{
  return MEMORY[0x1E0D82838]();
}

uint64_t PCSIdentitySetCopyCurrentIdentityWithError()
{
  return MEMORY[0x1E0D82840]();
}

uint64_t PCSIdentitySetCopyCurrentPublicIdentityWithError()
{
  return MEMORY[0x1E0D82848]();
}

uint64_t PCSIdentitySetCopyIdentities()
{
  return MEMORY[0x1E0D82850]();
}

uint64_t PCSIdentitySetCopyIdentity()
{
  return MEMORY[0x1E0D82858]();
}

uint64_t PCSIdentitySetCopyService()
{
  return MEMORY[0x1E0D82860]();
}

uint64_t PCSIdentitySetCopySet()
{
  return MEMORY[0x1E0D82868]();
}

uint64_t PCSIdentitySetCreate()
{
  return MEMORY[0x1E0D82870]();
}

uint64_t PCSIdentitySetCreateExternalForm()
{
  return MEMORY[0x1E0D82878]();
}

uint64_t PCSIdentitySetCreateFromExternalForm()
{
  return MEMORY[0x1E0D82880]();
}

uint64_t PCSIdentitySetCreateMutable()
{
  return MEMORY[0x1E0D82888]();
}

uint64_t PCSIdentitySetCreateNamed()
{
  return MEMORY[0x1E0D82890]();
}

uint64_t PCSIdentitySetEnumeratePublicKeys()
{
  return MEMORY[0x1E0D82898]();
}

uint64_t PCSIdentitySetSetCurrentIdentity()
{
  return MEMORY[0x1E0D828A0]();
}

uint64_t PCSIdentitySetup()
{
  return MEMORY[0x1E0D828A8]();
}

uint64_t PCSKeyEnvelopeAuthenticate()
{
  return MEMORY[0x1E0D828B0]();
}

uint64_t PCSKeyEnvelopeCreate()
{
  return MEMORY[0x1E0D828B8]();
}

uint64_t PCSKeyEnvelopeCreateWithValues()
{
  return MEMORY[0x1E0D828C0]();
}

uint64_t PCSKeyEnvelopeDecrypt()
{
  return MEMORY[0x1E0D828C8]();
}

uint64_t PCSKeyEnvelopeEncrypt()
{
  return MEMORY[0x1E0D828D0]();
}

uint64_t PCSKeyEnvelopeGetEnvelope()
{
  return MEMORY[0x1E0D828D8]();
}

uint64_t PCSKeyEnvelopeVerify()
{
  return MEMORY[0x1E0D828E0]();
}

uint64_t PCSObjectCreateFromExportedWithIdentitiesAndOptions()
{
  return MEMORY[0x1E0D828F8]();
}

uint64_t PCSObjectCreateFromExportedWithIdentitiesAndOptionsAsync()
{
  return MEMORY[0x1E0D82900]();
}

uint64_t PCSObjectCreateFromExportedWithKeyedPCSAndOptions()
{
  return MEMORY[0x1E0D82908]();
}

uint64_t PCSPublicIdentityCopyCurrentKeyFingerprint()
{
  return MEMORY[0x1E0D82910]();
}

uint64_t PCSPublicIdentityCopyPublicKey()
{
  return MEMORY[0x1E0D82918]();
}

uint64_t PCSPublicIdentityCreateFromKeyData()
{
  return MEMORY[0x1E0D82920]();
}

uint64_t PCSPublicIdentityGetPublicID()
{
  return MEMORY[0x1E0D82928]();
}

uint64_t PCSPublicIdentityGetServiceName()
{
  return MEMORY[0x1E0D82930]();
}

uint64_t PCSServiceItemGetNameByIndex()
{
  return MEMORY[0x1E0D82940]();
}

uint64_t PCSServiceItemGetNumberByName()
{
  return MEMORY[0x1E0D82948]();
}

uint64_t PCSServiceItemTypeIsManatee()
{
  return MEMORY[0x1E0D82950]();
}

uint64_t PCSShareProtectionCopyPublicKeys()
{
  return MEMORY[0x1E0D82958]();
}

uint64_t PCSSyncKeyRegistryWithOptions()
{
  return MEMORY[0x1E0D82960]();
}

uint64_t PCSValidateSignature()
{
  return MEMORY[0x1E0D82968]();
}

uint64_t PCSValidateSignatureWithSet()
{
  return MEMORY[0x1E0D82970]();
}

uint64_t PLLogRegisteredEvent()
{
  return MEMORY[0x1E0D7FE28]();
}

uint64_t PLShouldLogRegisteredEvent()
{
  return MEMORY[0x1E0D7FE40]();
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x1E0CD5F60](certificate);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x1E0CD6010](allocator, data);
}

uint64_t SecCertificateNotValidAfter()
{
  return MEMORY[0x1E0CD6070]();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x1E0CD6290](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1E0CD6298](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x1E0CD62A0](query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x1E0CD62D8](query, attributesToUpdate);
}

uint64_t SecKeyCreateEncryptedDataWithParameters()
{
  return MEMORY[0x1E0CD6360]();
}

SecKeyRef SecKeyCreateWithData(CFDataRef keyData, CFDictionaryRef attributes, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x1E0CD63A0](keyData, attributes, error);
}

Boolean SecKeyVerifySignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef signedData, CFDataRef signature, CFErrorRef *error)
{
  return MEMORY[0x1E0CD6418](key, algorithm, signedData, signature, error);
}

uint64_t SecPolicyCreateApplePinned()
{
  return MEMORY[0x1E0CD64B8]();
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1E0CD6620](allocator, token);
}

uint64_t SecTaskEntitlementsValidated()
{
  return MEMORY[0x1E0CD6630]();
}

uint32_t SecTaskGetCodeSignStatus(SecTaskRef task)
{
  return MEMORY[0x1E0CD6638](task);
}

CFArrayRef SecTrustCopyCertificateChain(SecTrustRef trust)
{
  return (CFArrayRef)MEMORY[0x1E0CD6648](trust);
}

SecKeyRef SecTrustCopyKey(SecTrustRef trust)
{
  return (SecKeyRef)MEMORY[0x1E0CD6670](trust);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x1E0CD6698](certificates, policies, trust);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x1E0CD66C8](trust, error);
}

uint64_t TCCAccessCopyInformationForBundleId()
{
  return MEMORY[0x1E0DB0FC8]();
}

uint64_t TCCAccessReset()
{
  return MEMORY[0x1E0DB1020]();
}

uint64_t TCCAccessSetForBundleId()
{
  return MEMORY[0x1E0DB1070]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

const char *__cdecl _Block_signature(void *aBlock)
{
  return (const char *)MEMORY[0x1E0C80960](aBlock);
}

uint64_t _CFBundleCreateUnique()
{
  return MEMORY[0x1E0C99FF0]();
}

uint64_t _CFCopyServerVersionDictionary()
{
  return MEMORY[0x1E0C9A0C0]();
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x1E0C9A0D0]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x1E0C9A818]();
}

uint64_t _CKCheckArgument()
{
  return MEMORY[0x1E0C95260]();
}

uint64_t _CKUseSystemInstalledBinaries()
{
  return MEMORY[0x1E0C95278]();
}

uint64_t _PCSFPSetShouldRoll()
{
  return MEMORY[0x1E0D82978]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t __NSMakeSpecialForwardingCaptureBlock()
{
  return MEMORY[0x1E0C9AA78]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1E0C80C78](*(_QWORD *)&a1);
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1E0C80FC0](dso, description, activity, *(_QWORD *)&flags);
}

uint64_t _os_crash()
{
  return MEMORY[0x1E0C81000]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1E0DEEA28]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

uint64_t ba_is_process_extension()
{
  return MEMORY[0x1E0DDF120]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

uint64_t cc_clear()
{
  return MEMORY[0x1E0C81868]();
}

uint64_t cc_cmp_safe()
{
  return MEMORY[0x1E0C81870]();
}

uint64_t ccaes_gcm_decrypt_mode()
{
  return MEMORY[0x1E0C818B0]();
}

uint64_t ccaes_gcm_encrypt_mode()
{
  return MEMORY[0x1E0C818B8]();
}

uint64_t ccdigest_init()
{
  return MEMORY[0x1E0C81BD8]();
}

uint64_t ccdigest_update()
{
  return MEMORY[0x1E0C81BE0]();
}

uint64_t ccec_compact_import_pub()
{
  return MEMORY[0x1E0C81C18]();
}

uint64_t ccec_cp_256()
{
  return MEMORY[0x1E0C81C60]();
}

uint64_t ccec_validate_pub()
{
  return MEMORY[0x1E0C81DC0]();
}

uint64_t ccec_verify_msg()
{
  return MEMORY[0x1E0C81DD8]();
}

uint64_t ccecies_encrypt_gcm()
{
  return MEMORY[0x1E0C81E48]();
}

uint64_t ccecies_encrypt_gcm_ciphertext_size()
{
  return MEMORY[0x1E0C81E50]();
}

uint64_t ccecies_encrypt_gcm_setup()
{
  return MEMORY[0x1E0C81E60]();
}

uint64_t ccgcm_context_size()
{
  return MEMORY[0x1E0C81EC8]();
}

uint64_t ccgcm_finalize()
{
  return MEMORY[0x1E0C81ED0]();
}

uint64_t ccgcm_init()
{
  return MEMORY[0x1E0C81EE8]();
}

uint64_t ccgcm_set_iv()
{
  return MEMORY[0x1E0C81F08]();
}

uint64_t ccgcm_update()
{
  return MEMORY[0x1E0C81F10]();
}

uint64_t ccrng()
{
  return MEMORY[0x1E0C822A8]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x1E0C823E0]();
}

uint64_t ck_call_or_dispatch_async_if_not_key()
{
  return MEMORY[0x1E0C95298]();
}

uint64_t ck_call_or_dispatch_sync_if_not_key()
{
  return MEMORY[0x1E0C952A0]();
}

Ivar *__cdecl class_copyIvarList(Class cls, unsigned int *outCount)
{
  return (Ivar *)MEMORY[0x1E0DE7A70](cls, outCount);
}

IMP class_getMethodImplementation(Class cls, SEL name)
{
  return (IMP)MEMORY[0x1E0DE7AC0](cls, name);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x1E0DE7AD8](cls);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

uint64_t container_copy_sandbox_token()
{
  return MEMORY[0x1E0C827E8]();
}

uint64_t container_error_copy_unlocalized_description()
{
  return MEMORY[0x1E0C82868]();
}

uint64_t container_get_path()
{
  return MEMORY[0x1E0C828E8]();
}

uint64_t container_query_create()
{
  return MEMORY[0x1E0C829B8]();
}

uint64_t container_query_free()
{
  return MEMORY[0x1E0C829C8]();
}

uint64_t container_query_get_last_error()
{
  return MEMORY[0x1E0C829D0]();
}

uint64_t container_query_get_single_result()
{
  return MEMORY[0x1E0C829D8]();
}

uint64_t container_query_operation_set_flags()
{
  return MEMORY[0x1E0C829E8]();
}

uint64_t container_query_set_class()
{
  return MEMORY[0x1E0C829F8]();
}

uint64_t container_query_set_identifiers()
{
  return MEMORY[0x1E0C82A08]();
}

uint64_t container_query_set_persona_unique_string()
{
  return MEMORY[0x1E0C82A18]();
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x1E0DE92C0](strm, *(_QWORD *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x1E0DE92D0](strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x1E0DE92D8](strm, *(_QWORD *)&level, *(_QWORD *)&method, *(_QWORD *)&windowBits, *(_QWORD *)&memLevel, *(_QWORD *)&strategy, version, *(_QWORD *)&stream_size);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_assert_queue_barrier(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BF0](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BF8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C28](queue, block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C60](flags, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x1E0C82D08](key);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D10](group, queue, block);
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E20](attr);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
  MEMORY[0x1E0C82E80](queue, key, context, destructor);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x1E0C82F08](object, queue);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x1E0C82F28](source);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
  MEMORY[0x1E0C82F40](source, value);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return MEMORY[0x1E0C82F80](source);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x1E0C82F88](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

dispatch_workloop_t dispatch_workloop_create(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1E0C82FD8](label);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

int dup(int a1)
{
  return MEMORY[0x1E0C83078](*(_QWORD *)&a1);
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

int fclonefileat(int a1, int a2, const char *a3, uint32_t a4)
{
  return MEMORY[0x1E0C832F0](*(_QWORD *)&a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1E0C83610](a1, a2, a3, a4, *(_QWORD *)&a5);
}

int getmntinfo_r_np(statfs **a1, int a2)
{
  return MEMORY[0x1E0C83700](a1, *(_QWORD *)&a2);
}

int getopt_long_only(int a1, char *const *a2, const char *a3, const option *a4, int *a5)
{
  return MEMORY[0x1E0C83738](*(_QWORD *)&a1, a2, a3, a4, a5);
}

const char *__cdecl ivar_getName(Ivar v)
{
  return (const char *)MEMORY[0x1E0DE7B28](v);
}

ptrdiff_t ivar_getOffset(Ivar v)
{
  return MEMORY[0x1E0DE7B30](v);
}

const char *__cdecl ivar_getTypeEncoding(Ivar v)
{
  return (const char *)MEMORY[0x1E0DE7B38](v);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

uint64_t net_qos_guideline()
{
  return MEMORY[0x1E0C84390]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1E0C84400](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1E0C84428](*(_QWORD *)&token, state64);
}

uint64_t nw_endpoint_copy_dictionary()
{
  return MEMORY[0x1E0CCF350]();
}

nw_endpoint_t nw_endpoint_create_host(const char *hostname, const char *port)
{
  return (nw_endpoint_t)MEMORY[0x1E0CCF3B0](hostname, port);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)((uint64_t (*)(id, SEL))MEMORY[0x1E0DE7D20])(a1, a2);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

id object_getIvar(id a1, Ivar a2)
{
  return (id)MEMORY[0x1E0DE8018](a1, a2);
}

Class object_setClass(id a1, Class a2)
{
  return (Class)MEMORY[0x1E0DE8030](a1, a2);
}

void os_activity_apply(os_activity_t activity, os_block_t block)
{
  MEMORY[0x1E0C844F8](activity, block);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84510](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84518](state);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x1E0C84940]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x1E0C84948]();
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  return MEMORY[0x1E0C849A8](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1E0C849B8]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1E0C849D0]();
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1E0C84BC8](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1E0C84BD0](a1);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C20](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

objc_method_description protocol_getMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  const char *v4;
  char *v5;
  objc_method_description result;

  v4 = (const char *)MEMORY[0x1E0DE80A8](p, aSel, isRequiredMethod, isInstanceMethod);
  result.types = v5;
  result.name = v4;
  return result;
}

const char *__cdecl protocol_getName(Protocol *p)
{
  return (const char *)MEMORY[0x1E0DE80B0](p);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

int pthread_rwlock_destroy(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84E90](a1);
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  return MEMORY[0x1E0C84E98](a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84EA0](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84EB8](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84EC0](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1E0C84ED8]();
}

int puts(const char *a1)
{
  return MEMORY[0x1E0C84F60](a1);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1E0C84F68](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x1E0C85100](__from, __to, __ec);
}

uint64_t sandbox_check_by_audit_token()
{
  return MEMORY[0x1E0C85180]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1E0C851A0]();
}

uint64_t sandbox_extension_issue_file_to_process()
{
  return MEMORY[0x1E0C851B0]();
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1E0DE80C8](sel);
}

BOOL sel_isEqual(SEL lhs, SEL rhs)
{
  return MEMORY[0x1E0DE80D8](lhs, rhs);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1E0C85438](*(_QWORD *)&a1);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1E0DEEAE8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1E0DEEAF0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1E0DEEB20]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x1E0DF0F88]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1E0DF0F90]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x1E0DF0FA0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x1E0DF0FA8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x1E0DF0FB0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1E0DF0FB8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1E0DF0FC0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1E0DEEC40]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1E0DEEC50]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1E0DEED60]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1E0DEEE38]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1E0DEEE50]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1E0DEEE88]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1E0DEEE98]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1E0DF1008]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1E0DEEEB8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1E0DEEF20]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1E0DEEF38]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1E0DEEF40]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1E0DEEF48]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x1E0DEEFC8]();
}

uint64_t tcc_authorization_record_get_authorization_right()
{
  return MEMORY[0x1E0DB1208]();
}

uint64_t tcc_events_filter_create_with_criteria()
{
  return MEMORY[0x1E0DB1270]();
}

uint64_t tcc_events_subscribe()
{
  return MEMORY[0x1E0DB1278]();
}

uint64_t tcc_events_unsubscribe()
{
  return MEMORY[0x1E0DB1280]();
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1E0C859E0](*(_QWORD *)&a1);
}

uint64_t voucher_adopt()
{
  return MEMORY[0x1E0C85B10]();
}

uint64_t voucher_copy()
{
  return MEMORY[0x1E0C85B18]();
}

uint64_t voucher_copy_without_importance()
{
  return MEMORY[0x1E0C85B28]();
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return (xpc_object_t)MEMORY[0x1E0C85D80](activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x1E0C85D90](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
  MEMORY[0x1E0C85D98](identifier, criteria, handler);
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
  MEMORY[0x1E0C85DB0](activity, criteria);
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x1E0C85DB8](activity, state);
}

void xpc_activity_unregister(const char *identifier)
{
  MEMORY[0x1E0C85DD0](identifier);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x1E0C85DE0](xarray, value);
}

xpc_object_t xpc_array_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1E0C85E10]();
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1E0C86218]();
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x1E0C86420](object1, object2);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1E0C86720](string);
}

