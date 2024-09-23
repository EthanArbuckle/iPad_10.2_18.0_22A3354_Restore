@implementation NSURL(BRConflictWinner)

- (uint64_t)br_lastEditorDeviceName
{
  return objc_msgSend(a1, "_br_getAttributeValue:withSecondaryConnection:withError:", CFSTR("BRURLUbiquitousItemLastEditorDeviceNameKey"), 0, 0);
}

- (id)br_lastEditorName
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "br_lastEditorNameComponents");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "br_formattedName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)br_lastEditorNameComponents
{
  return objc_msgSend(a1, "_br_getAttributeValue:withSecondaryConnection:withError:", *MEMORY[0x1E0C99B60], 0, 0);
}

- (uint64_t)br_addFakeConflictLoserFromItemAtURL:()BRConflictWinner lastEditorDeviceName:lastEditorUserName:error:
{
  return objc_msgSend(a1, "br_addFakeConflictLoserFromItemAtURL:lastEditorDeviceName:error:", a3, a4, a6);
}

- (id)br_addFakeConflictLoserFromItemAtURL:()BRConflictWinner lastEditorDeviceName:error:
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  dispatch_semaphore_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  const char *v29;
  uint64_t v30;
  _QWORD v31[4];
  NSObject *v32;
  uint64_t *v33;
  _BYTE *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  _BYTE buf[24];
  uint64_t (*v42)(uint64_t, uint64_t);
  __int128 v43;
  _QWORD v44[3];
  _QWORD v45[3];
  const __CFString *v46;
  _QWORD v47[3];

  v47[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!BRIsFPFSEnabled(v9, v10))
  {
    objc_msgSend(MEMORY[0x1E0D25D48], "manager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "permanentStorageForItemAtURL:allocateIfNone:error:", a1, 1, a5);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v46 = CFSTR("BRConflictLosersLastEditorDeviceNameKey");
      v47[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *MEMORY[0x1E0D25CD8];
      v30 = *MEMORY[0x1E0D25D30];
      v45[0] = *MEMORY[0x1E0D25D30];
      v18 = *MEMORY[0x1E0D25CD0];
      v44[0] = v17;
      v44[1] = v18;
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "UUIDString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("fakeloser_"), "stringByAppendingString:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v45[1] = v21;
      v44[2] = *MEMORY[0x1E0D25CF8];
      v45[2] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 3);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "prepareAdditionCreationWithItemAtURL:byMoving:creationInfo:error:", v8, 1, v22, a5);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        v24 = dispatch_semaphore_create(0);
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v42 = __Block_byref_object_copy__7;
        *(_QWORD *)&v43 = __Block_byref_object_dispose__7;
        *((_QWORD *)&v43 + 1) = 0;
        v35 = 0;
        v36 = &v35;
        v37 = 0x3032000000;
        v38 = __Block_byref_object_copy__7;
        v39 = __Block_byref_object_dispose__7;
        v40 = 0;
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __91__NSURL_BRConflictWinner__br_addFakeConflictLoserFromItemAtURL_lastEditorDeviceName_error___block_invoke;
        v31[3] = &unk_1E3DA65B0;
        v33 = &v35;
        v34 = buf;
        v25 = v24;
        v32 = v25;
        objc_msgSend(v11, "createAdditionStagedAtURL:creationInfo:completionHandler:", v23, v22, v31);
        if (a5)
          *a5 = objc_retainAutorelease((id)v36[5]);
        dispatch_semaphore_wait(v25, 0xFFFFFFFFFFFFFFFFLL);
        v26 = (void *)MEMORY[0x1E0CB3600];
        objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "name");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "__itemAtURL:didGainVersionWithClientID:name:purposeID:", a1, v30, v27, 0);

        v14 = *(id *)(*(_QWORD *)&buf[8] + 40);
        _Block_object_dispose(&v35, 8);

        _Block_object_dispose(buf, 8);
        goto LABEL_14;
      }
    }
    else
    {
      v22 = 0;
      v16 = 0;
    }
    v14 = 0;
LABEL_14:

    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorMethodNotImplemented:", sel_br_addFakeConflictLoserFromItemAtURL_lastEditorDeviceName_error_);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    brc_bread_crumbs((uint64_t)"-[NSURL(BRConflictWinner) br_addFakeConflictLoserFromItemAtURL:lastEditorDeviceName:error:]", 162);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, (os_log_type_t)0x90u))
    {
      v29 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "-[NSURL(BRConflictWinner) br_addFakeConflictLoserFromItemAtURL:lastEditorDeviceName:error:]";
      *(_WORD *)&buf[12] = 2080;
      if (!a5)
        v29 = "(ignored by caller)";
      *(_QWORD *)&buf[14] = v29;
      *(_WORD *)&buf[22] = 2112;
      v42 = (uint64_t (*)(uint64_t, uint64_t))v11;
      LOWORD(v43) = 2112;
      *(_QWORD *)((char *)&v43 + 2) = v12;
      _os_log_error_impl(&dword_19CBF0000, v13, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }

  }
  if (a5)
  {
    v11 = objc_retainAutorelease(v11);
    v14 = 0;
    *a5 = v11;
  }
  else
  {
    v14 = 0;
  }
LABEL_16:

  return v14;
}

@end
