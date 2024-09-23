@implementation CalDatabaseGetChangedEKObjectsForClient

void __CalDatabaseGetChangedEKObjectsForClient_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4, void *a5, int a6)
{
  id v11;
  const __CFSet *v13;
  int v14;
  id *v15;
  id v16;
  int v17;
  void *v18;
  uint64_t RecordStore;
  id v20;
  id v21;
  void *v22;
  void *v23;
  int *v24;
  int v25;
  CFTypeRef *v26;
  uint64_t v27;
  const char *v28;
  NSObject *v29;
  uint32_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  const os_unfair_lock *Context;
  const __CFArray *v35;
  const __CFArray *v36;
  void *v37;
  uint64_t v38;
  id v39;
  CFIndex v40;
  void *v41;
  const void *ValueAtIndex;
  const void *v43;
  const void *v44;
  CADObjectID *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  const __CFArray *v51;
  int v52;
  void *v54;
  void *v55;
  NSObject *v56;
  uint64_t v57;
  CFTypeRef *v58;
  uint64_t v59;
  CFTypeRef *v60;
  uint64_t v61;
  id v62;
  id v63;
  id v64;
  id v65;
  void *v66;
  const __CFArray *v67;
  CFIndex Count;
  int v69;
  uint64_t v70;
  const __CFArray *theArray;
  const __CFArray *v72;
  const __CFArray *v73;
  id v74;
  unsigned int v75;
  _QWORD v76[4];
  id v77;
  int v78;
  int v79;
  const __CFArray *v80;
  const __CFArray *v81;
  const __CFArray *v82;
  const __CFArray *v83;
  uint8_t buf[4];
  _QWORD v85[5];

  *(_QWORD *)((char *)&v85[3] + 4) = *MEMORY[0x1E0C80C00];
  v11 = a5;
  if ((char **)a2 != &kCalStoreClass || *(_QWORD *)(a1 + 32) == 0)
  {
    v13 = *(const __CFSet **)(a1 + 80);
    if (v13 && CFSetGetCount(v13))
    {
      v14 = CFSetContainsValue(*(CFSetRef *)(a1 + 80), (const void *)(int)a3);
      if (a4)
      {
        if (!(v14 | CFSetContainsValue(*(CFSetRef *)(a1 + 80), (const void *)*(int *)(a2 + 64))))
          goto LABEL_82;
      }
      else if (!v14)
      {
        goto LABEL_82;
      }
      if ((_DWORD)a3 == 26)
      {
        v15 = (id *)(a1 + 48);
        goto LABEL_22;
      }
      if ((_DWORD)a3 == 6)
      {
LABEL_17:
        v15 = (id *)(a1 + 40);
LABEL_22:
        v16 = *v15;
        if (*(_DWORD *)(a1 + 96) == -1)
        {
          v18 = (void *)MEMORY[0x1A85B52F0](v11);
        }
        else
        {
          v76[0] = MEMORY[0x1E0C809B0];
          v76[1] = 3221225472;
          v76[2] = __CalDatabaseGetChangedEKObjectsForClient_block_invoke_2;
          v76[3] = &unk_1E4F905A0;
          v77 = v11;
          v17 = *(_DWORD *)(a1 + 96);
          v78 = a6;
          v79 = v17;
          v18 = (void *)MEMORY[0x1A85B52F0](v76);

        }
        RecordStore = _CalDatabaseGetRecordStore(*(_QWORD *)(a1 + 88));
        v75 = *(_DWORD *)(*(_QWORD *)(a1 + 88) + 172);
        v20 = *(id *)(a1 + 72);
        v21 = v18;
        if (_buildDictionariesWithChangeTablePropertiesForEntityType_onceToken != -1)
          dispatch_once(&_buildDictionariesWithChangeTablePropertiesForEntityType_onceToken, &__block_literal_global_25);
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", a2);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)_buildDictionariesWithChangeTablePropertiesForEntityType_changePropertiesByRecord, "objectForKeyedSubscript:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (int *)objc_msgSend(v23, "pointerValue");

        if (!v24)
        {
          v31 = CDBLogHandle;
          if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
          {
            v32 = *(char **)a2;
            *(_DWORD *)buf = 136315138;
            v85[0] = v32;
            v28 = "Unsupported record descriptor %s";
            v29 = v31;
            v30 = 12;
            goto LABEL_34;
          }
LABEL_81:

          goto LABEL_82;
        }
        v66 = v22;
        v25 = *v24;
        if (*v24 < 1)
        {
          v26 = 0;
        }
        else
        {
          v26 = (CFTypeRef *)malloc_type_calloc(*v24, 8uLL, 0x6004044C4A2DFuLL);
          if (!v26)
          {
            v27 = CDBLogHandle;
            v22 = v66;
            if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              v28 = "Failed to allocate property values array";
              v29 = v27;
              v30 = 2;
LABEL_34:
              _os_log_impl(&dword_1A5CCB000, v29, OS_LOG_TYPE_ERROR, v28, buf, v30);
              goto LABEL_81;
            }
            goto LABEL_81;
          }
        }
        v69 = v25;
        v70 = a3;
        v65 = v11;
        v82 = 0;
        v83 = 0;
        v33 = v25;
        v80 = 0;
        v81 = 0;
        if (RecordStore)
        {
          if (CDBLockingAssertionsEnabled)
          {
            Context = (const os_unfair_lock *)CPRecordStoreGetContext();
            if (Context)
              os_unfair_lock_assert_owner(Context + 20);
          }
        }
        LODWORD(v61) = v25;
        v59 = *((_QWORD *)v24 + 1);
        v60 = v26;
        v63 = v21;
        v64 = v16;
        CPRecordStoreGetChangesAndChangeIndicesAndSequenceNumbersForClassWithBindBlockAndPropertiesA();
        v35 = v83;
        v36 = v80;
        v72 = v81;
        v73 = v82;
        v37 = (void *)*((_QWORD *)v24 + 2);
        v38 = *((_QWORD *)v24 + 3);
        v62 = v20;
        v74 = v20;
        v39 = v37;
        theArray = v35;
        if (!v35 || !v73 || !v72 || (Count = CFArrayGetCount(v35), Count < 1))
        {
LABEL_65:

          if (v83)
            CFRelease(v83);
          v16 = v64;
          v11 = v65;
          v21 = v63;
          if (v82)
            CFRelease(v82);
          if (v81)
            CFRelease(v81);
          v20 = v62;
          if (v80)
            CFRelease(v80);
          if (v26)
          {
            if ((int)v33 >= 1)
            {
              v57 = v33;
              v58 = v26;
              do
              {
                if (*v58)
                  CFRelease(*v58);
                ++v58;
                --v57;
              }
              while (v57);
            }
            free(v26);
          }
          v22 = v66;
          goto LABEL_81;
        }
        v40 = 0;
        v67 = v36;
        while (1)
        {
          v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v33 + 4, v59, v60, v61);
          ValueAtIndex = CFArrayGetValueAtIndex(theArray, v40);
          v43 = CFArrayGetValueAtIndex(v73, v40);
          v44 = CFArrayGetValueAtIndex(v72, v40);
          v45 = -[CADObjectID initWithEntityType:entityID:databaseID:]([CADObjectID alloc], "initWithEntityType:entityID:databaseID:", v70, ValueAtIndex, v75);
          objc_msgSend(v41, "setObject:forKeyedSubscript:", v45, CFSTR("record"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v43);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "setObject:forKeyedSubscript:", v46, CFSTR("type"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v44);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "setObject:forKeyedSubscript:", v47, CFSTR("ROWID"));

          if (v36)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", CFArrayGetValueAtIndex(v36, v40));
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "setObject:forKeyedSubscript:", v48, CFSTR("sequence_number"));

          }
          if (v69 >= 1)
            break;
LABEL_64:
          objc_msgSend(v74, "addObject:", v41);

          ++v40;
          v36 = v67;
          if (v40 == Count)
            goto LABEL_65;
        }
        v49 = 0;
        while (1)
        {
          objc_msgSend(v39, "objectAtIndexedSubscript:", v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = (const __CFArray *)v26[v49];
          v52 = *(_DWORD *)(v38 + 4 * v49);
          if ((v52 - 2) < 2 || v52 == 7)
          {
            CFArrayGetValueAtIndex(v51, v40);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v55 = (void *)objc_claimAutoreleasedReturnValue();

            if (v54 == v55)
              goto LABEL_59;
          }
          else
          {
            if (v52 != 1)
            {
              v56 = CDBLogHandle;
              if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67109378;
                LODWORD(v85[0]) = v52;
                WORD2(v85[0]) = 2112;
                *(_QWORD *)((char *)v85 + 6) = v50;
                _os_log_impl(&dword_1A5CCB000, v56, OS_LOG_TYPE_ERROR, "Unsupported type %i for key %@", buf, 0x12u);
              }
              goto LABEL_60;
            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", CFArrayGetValueAtIndex(v51, v40));
            v54 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v41, "setObject:forKeyedSubscript:", v54, v50);
LABEL_59:

LABEL_60:
          if (v33 == ++v49)
            goto LABEL_64;
        }
      }
    }
    else
    {
      if ((_DWORD)a3 == 6)
        goto LABEL_17;
      if ((_DWORD)a3 == 26)
        goto LABEL_82;
    }
    v15 = (id *)(a1 + 64);
    if (a4)
      v15 = (id *)(a1 + 56);
    goto LABEL_22;
  }
LABEL_82:

}

uint64_t __CalDatabaseGetChangedEKObjectsForClient_block_invoke_2(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return sqlite3_bind_int(*(sqlite3_stmt **)(a2 + 8), *(_DWORD *)(a1 + 40), *(_DWORD *)(a1 + 44));
}

@end
