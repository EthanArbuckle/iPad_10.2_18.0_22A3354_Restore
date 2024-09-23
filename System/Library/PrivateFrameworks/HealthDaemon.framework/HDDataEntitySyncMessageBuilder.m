@implementation HDDataEntitySyncMessageBuilder

uint64_t __68___HDDataEntitySyncMessageBuilder__addEntity_row_anchor_provenance___block_invoke(_QWORD *a1, void *a2, unint64_t a3, uint64_t a4, _QWORD *a5)
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL4 v11;
  int v12;
  BOOL v13;
  uint64_t v14;
  char v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  int v30;
  id v31;
  NSObject *v32;
  id v33;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  _QWORD *v38;
  id v39;
  id v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a1[4];
  if ((int64_t)(*(_QWORD *)(v9 + 80) + a3) > *(_QWORD *)(v9 + 64))
  {
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    v9 = a1[4];
    if (!*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
    {
      if (*(_BYTE *)(v9 + 112))
      {
        v22 = 1;
        goto LABEL_47;
      }
    }
  }
  v10 = *(_QWORD *)(v9 + 88);
  v11 = *(uint64_t *)(v9 + 104) >= 1 && a1[8] != *(_QWORD *)(v9 + 96);
  v12 = (int64_t)(v10 + a3) > *(_QWORD *)(v9 + 72) || v11;
  v13 = v12 != 1 || v10 < 1;
  v38 = a5;
  if (v13)
  {
    v14 = 0;
  }
  else
  {
    v40 = 0;
    v15 = -[_HDDataEntitySyncMessageBuilder _sendCurrentCollectionIsFinal:error:](v9, 0, (uint64_t)&v40);
    v16 = v40;
    v17 = v16;
    v18 = 0;
    v19 = a1[4];
    if (a1[8] == *(_QWORD *)(v19 + 96))
      v18 = *(_QWORD *)(v19 + 104) + 1;
    *(_QWORD *)(v19 + 104) = v18;
    if ((v15 & 1) != 0)
    {
      v14 = 0;
    }
    else
    {
      _HKInitializeLogging();
      v20 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        v37 = a1[4];
        *(_DWORD *)buf = 138543618;
        v42 = v37;
        v43 = 2114;
        v44 = v17;
        _os_log_error_impl(&dword_1B7802000, v20, OS_LOG_TYPE_ERROR, "%{public}@: failed to send current collection: %{public}@", buf, 0x16u);
      }
      v21 = v17;
      if (v21)
      {
        if (a5)
          *a5 = objc_retainAutorelease(v21);
        else
          _HKLogDroppedError();
      }

      v14 = 2;
    }

    v9 = a1[4];
  }
  v23 = a1[8];
  v24 = (void *)a1[5];
  v39 = 0;
  v25 = v8;
  v26 = v24;
  if (v9)
  {
    v27 = *(void **)(v9 + 16);
    objc_msgSend(*(id *)(v9 + 32), "codableObjectCollectionForProvenance:profile:", v26, *(_QWORD *)(v9 + 8));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v27) = objc_msgSend(v27, "addCodableObject:toCollection:", v25, v28);

    if ((v27 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", &v39, 100, CFSTR("Failed to add codable representation to object collection"));
      v30 = 0;
      v29 = 2;
      goto LABEL_34;
    }
    v29 = 0;
    *(int64x2_t *)(v9 + 80) = vaddq_s64(*(int64x2_t *)(v9 + 80), vdupq_n_s64(a3));
    *(_QWORD *)(v9 + 96) = v23;
  }
  else
  {
    v29 = 0;
  }
  v30 = 1;
LABEL_34:

  v31 = v39;
  if (v30)
  {
    *(_BYTE *)(a1[4] + 112) = 1;
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
  }
  else
  {
    _HKInitializeLogging();
    v32 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v35 = a1[4];
      v36 = (void *)a1[8];
      *(_DWORD *)buf = 138543874;
      v42 = v35;
      v43 = 2048;
      v44 = v36;
      v45 = 2114;
      v46 = v31;
      _os_log_error_impl(&dword_1B7802000, v32, OS_LOG_TYPE_ERROR, "%{public}@: failed to add codable representation for anchor %lld: %{public}@", buf, 0x20u);
    }
    v33 = v31;
    if (v33)
    {
      if (v38)
        *v38 = objc_retainAutorelease(v33);
      else
        _HKLogDroppedError();
    }

  }
  if (v14)
    v22 = v14;
  else
    v22 = v29;

LABEL_47:
  return v22;
}

@end
