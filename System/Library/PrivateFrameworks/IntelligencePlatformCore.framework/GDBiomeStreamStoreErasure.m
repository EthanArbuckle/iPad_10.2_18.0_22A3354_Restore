@implementation GDBiomeStreamStoreErasure

+ (id)_streamWithIdentifier:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  const char *v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void (*v14)(void);
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  __CFString *v24;
  __CFString *v25;
  void *v26;
  const char *v27;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  char *v33;
  const char *v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  void *v40;
  _QWORD v41[2];
  _QWORD v42[2];
  __int128 v43;
  void *(*v44)(_QWORD *, const char *, uint64_t, uint64_t);
  void *v45;
  uint64_t *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  BiomeLibrary();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  objc_msgSend_streamWithIdentifier_error_(v6, v7, (uint64_t)v5, (uint64_t)&v36);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v36;

  if (v8)
  {
    v13 = 0;
    goto LABEL_24;
  }
  if (!qword_1EF6D0C30)
  {
    v43 = xmmword_1E7A49698;
    v44 = 0;
    qword_1EF6D0C30 = _sl_dlopen();
  }
  if (!qword_1EF6D0C30)
  {
    v13 = 0;
    v8 = 0;
    if (!a4)
      goto LABEL_24;
    goto LABEL_12;
  }
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v14 = (void (*)(void))off_1EF6D0C38;
  v40 = off_1EF6D0C38;
  if (!off_1EF6D0C38)
  {
    *(_QWORD *)&v43 = MEMORY[0x1E0C809B0];
    *((_QWORD *)&v43 + 1) = 3221225472;
    v44 = sub_1C1065990;
    v45 = &unk_1E7A49900;
    v46 = &v37;
    sub_1C1065990(&v43, v10, v11, v12);
    v14 = (void (*)(void))v38[3];
  }
  _Block_object_dispose(&v37, 8);
  if (!v14)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v15, v16, v17);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v30, (uint64_t)"id<BMIRootLibrary> _GDBiomeLibraryInternal(void)", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = dlerror();
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v29, v34, (uint64_t)v32, (uint64_t)CFSTR("GDBiomeStreamStoreErasure.m"), 30, CFSTR("%s"), v33);

    __break(1u);
  }
  v14();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  objc_msgSend_streamWithIdentifier_error_(v18, v19, (uint64_t)v5, (uint64_t)&v35);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v35;

  if (a4)
  {
LABEL_12:
    if (!v8)
    {
      v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v41[0] = CFSTR("libraryError");
      if (v9)
      {
        objc_msgSend_localizedDescription(v9, v20, v21, v22);
        v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v24 = &stru_1E7A49B98;
      }
      v41[1] = CFSTR("internalError");
      v42[0] = v24;
      if (v13)
      {
        objc_msgSend_localizedDescription(v13, v20, v21, v22);
        v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v25 = &stru_1E7A49B98;
      }
      v42[1] = v25;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v20, (uint64_t)v42, (uint64_t)v41, 2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *a4 = (id)objc_msgSend_initWithDomain_code_userInfo_(v23, v27, *MEMORY[0x1E0D3DF50], 1, v26);

      if (v13)
      if (v9)

      v8 = 0;
    }
  }
LABEL_24:

  return v8;
}

+ (id)publisherForStream:(id)a3 device:(id)a4 account:(id)a5 startTime:(id)a6 endTime:(id)a7 maxEvents:(id)a8 lastN:(id)a9 reversed:(BOOL)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  void *started;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *context;
  id v59;
  id v60;
  id v61;

  v61 = a3;
  v59 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v60 = a9;
  context = (void *)MEMORY[0x1C3BA7BEC]();
  if (v16)
  {
    v19 = objc_alloc(MEMORY[0x1E0C99D68]);
    objc_msgSend_doubleValue(v16, v20, v21, v22);
    v26 = (void *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v19, v23, v24, v25);
    if (v17)
    {
LABEL_3:
      v27 = objc_alloc(MEMORY[0x1E0C99D68]);
      objc_msgSend_doubleValue(v17, v28, v29, v30);
      v34 = (void *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v27, v31, v32, v33);
      goto LABEL_6;
    }
  }
  else
  {
    v26 = 0;
    if (v17)
      goto LABEL_3;
  }
  v34 = 0;
LABEL_6:
  v35 = objc_alloc(MEMORY[0x1E0D026F0]);
  v36 = v18;
  v40 = objc_msgSend_unsignedIntegerValue(v18, v37, v38, v39);
  v44 = objc_msgSend_unsignedIntegerValue(v60, v41, v42, v43);
  started = (void *)objc_msgSend_initWithStartDate_endDate_maxEvents_lastN_reversed_(v35, v45, (uint64_t)v26, (uint64_t)v34, v40, v44, a10);
  objc_msgSend__createOrLookupStreamWithIdentifier_(a1, v47, (uint64_t)v61, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v49;
  if (v15)
  {
    v53 = v59;
    objc_msgSend_publisherForAccount_device_withUseCase_options_(v49, v50, (uint64_t)v15, (uint64_t)v59, *MEMORY[0x1E0D01C98], started);
    v54 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v53 = v59;
    if (v59)
      objc_msgSend_publisherForDevice_withUseCase_options_(v49, v50, (uint64_t)v59, *MEMORY[0x1E0D01C98], started);
    else
      objc_msgSend_publisherWithOptions_(v49, v50, (uint64_t)started, v51);
    v54 = objc_claimAutoreleasedReturnValue();
  }
  v55 = (void *)v54;

  objc_autoreleasePoolPop(context);
  return v55;
}

+ (id)_createOrLookupStreamWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  const char *v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  sub_1C1065AC4();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend_getLibraryStreamWithIdentifier_error_(v4, v5, (uint64_t)v3, (uint64_t)&v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;

  if (v6)
  {
    v8 = v6;
  }
  else
  {
    GDDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v13 = v3;
      v14 = 2112;
      v15 = v7;
      _os_log_error_impl(&dword_1C0771000, v9, OS_LOG_TYPE_ERROR, "GDBiomeStreamStoreErasure: _streamWithIdentifier: failed to retrieve stream %@. Error: %@", buf, 0x16u);
    }

  }
  return v6;
}

+ (id)iterateStream:(id)a3 device:(id)a4 account:(id)a5 bookmark:(id)a6 startTime:(id)a7 endTime:(id)a8 maxEvents:(id)a9 lastN:(id)a10 reversed:(BOOL)a11 body:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  void *v31;
  id v32;
  const char *v33;
  id v34;
  id v35;
  void *v38;
  void *v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[5];
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  v24 = a10;
  v25 = a12;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = sub_1C1065BFC;
  v48 = sub_1C1065C0C;
  v49 = 0;
  v26 = (void *)MEMORY[0x1C3BA7BEC]();
  v27 = a1;
  v38 = v21;
  v40 = v18;
  v28 = (uint64_t)v18;
  v29 = v19;
  objc_msgSend_publisherForStream_device_account_startTime_endTime_maxEvents_lastN_reversed_(v27, v30, (uint64_t)v17, v28, v19, v21, v22, v23, v24, a11);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = sub_1C1065C14;
  v43[3] = &unk_1E7A49548;
  v43[4] = &v44;
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = sub_1C1065C28;
  v41[3] = &unk_1E7A49570;
  v32 = v25;
  v42 = v32;
  v34 = (id)objc_msgSend_sinkWithBookmark_completion_receiveInput_(v31, v33, (uint64_t)v20, (uint64_t)v43, v41);

  objc_autoreleasePoolPop(v26);
  v35 = (id)v45[5];
  _Block_object_dispose(&v44, 8);

  return v35;
}

+ (void)pruneStream:(id)a3 withReason:(unint64_t)a4
{
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  objc_msgSend__createOrLookupStreamWithIdentifier_(a1, v5, (uint64_t)v15, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1C3BA7BEC]();
  objc_msgSend_pruner(v7, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deleteEventsPassingTest_(v12, v13, (uint64_t)&unk_1E7A495B0, v14);

  objc_autoreleasePoolPop(v8);
}

+ (BOOL)validateBookmark:(id)a3 publisher:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_validateBookmarkNode_(v8, v9, (uint64_t)v7, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (a5 && v11)
      *a5 = objc_retainAutorelease(v11);
    LOBYTE(a5) = v12 == 0;

  }
  else if (a5)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0D3DF50];
    v24 = *MEMORY[0x1E0CB2D50];
    v15 = objc_alloc(MEMORY[0x1E0CB3940]);
    v16 = objc_opt_class();
    v19 = (void *)objc_msgSend_initWithFormat_(v15, v17, (uint64_t)CFSTR("Bookmark of unexpected type: %@"), v18, v16, v24);
    v25[0] = v19;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v20, (uint64_t)v25, (uint64_t)&v24, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v13, v22, v14, 15, v21);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a5) = 0;
  }

  return (char)a5;
}

+ (id)deletedEventTimestampsForStream:(id)a3 account:(id)a4 device:(id)a5 from:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  const char *v25;
  const char *v26;
  void *started;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  const char *v32;
  id v33;
  _QWORD v35[4];
  id v36;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = (void *)objc_opt_new();
  v16 = (void *)MEMORY[0x1C3BA7BEC]();
  objc_msgSend__createOrLookupStreamWithIdentifier_(a1, v17, (uint64_t)v11, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dateByAddingTimeInterval_(v14, v20, v21, v22, -3600.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = objc_alloc(MEMORY[0x1E0D026F0]);
  started = (void *)objc_msgSend_initWithStartDate_endDate_maxEvents_lastN_reversed_(v24, v25, (uint64_t)v23, 0, 0, 0, 0);
  v28 = *MEMORY[0x1E0D01C90];
  if (v12)
  {
    objc_msgSend_tombstonePublisherWithUseCase_account_device_options_(v19, v26, v28, (uint64_t)v12, v13, started);
    v29 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v13)
      objc_msgSend_tombstonePublisherWithUseCase_device_options_(v19, v26, v28, (uint64_t)v13, started);
    else
      objc_msgSend_tombstonePublisherWithUseCase_options_(v19, v26, v28, (uint64_t)started);
    v29 = objc_claimAutoreleasedReturnValue();
  }
  v30 = (void *)v29;
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = sub_1C1065B64;
  v35[3] = &unk_1E7A495F8;
  v31 = v15;
  v36 = v31;
  v33 = (id)objc_msgSend_sinkWithCompletion_receiveInput_(v30, v32, (uint64_t)&unk_1E7A495D0, (uint64_t)v35);

  objc_autoreleasePoolPop(v16);
  return v31;
}

+ (void)clearCache
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  sub_1C1065AC4();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clearCache(v5, v2, v3, v4);

}

@end
