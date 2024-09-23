@implementation NTKDCreateFaceFromData

void __NTKDCreateFaceFromData_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _NTKLoggingObjectForDomain(1, (uint64_t)"NTKLoggingDomainDaemon");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __NTKDCreateFaceFromData_block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __NTKDCreateFaceFromData_block_invoke_35(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  NTKArgonKeyDescriptor *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  void (**v33)(_QWORD);
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD aBlock[4];
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  char v44;
  id v45[2];

  if ((_DWORD)a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "stringByAppendingPathComponent:", CFSTR("face.json"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(*(id *)(a1 + 40), "fileExistsAtPath:", v3))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
LABEL_31:

      return;
    }
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v3, 1, 0);
    if (!v4)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
LABEL_30:

      goto LABEL_31;
    }
    v45[0] = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v4, 0, v45);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v45[0];
    v7 = v6;
    if (v5)
    {
      v30 = v6;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __NTKDCreateFaceFromData_block_invoke_2;
      aBlock[3] = &unk_1E6BD3070;
      v8 = v5;
      v38 = v8;
      v39 = *(id *)(a1 + 48);
      v44 = *(_BYTE *)(a1 + 80);
      v40 = *(id *)(a1 + 32);
      v41 = *(id *)(a1 + 40);
      v42 = *(id *)(a1 + 64);
      v43 = *(id *)(a1 + 72);
      v9 = (void (**)(_QWORD))_Block_copy(aBlock);
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("argon"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = [NTKArgonKeyDescriptor alloc];
        -[NTKArgonKeyDescriptor argon_initWithJSONRepresentation:](v11, "argon_initWithJSONRepresentation:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v12 = 0;
      }
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("bundle id"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v28 = v8;
        +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "faceBundleForBundleIdentifier:onDevice:", v20, *(_QWORD *)(a1 + 48));
        v22 = objc_claimAutoreleasedReturnValue();

        v29 = (void *)v22;
        if (v22)
        {
          v9[2](v9);
          v23 = 1;
        }
        else
        {
          +[NTKFaceSupportUnlockAttemptEventRecorder sharedRecorder](NTKFaceSupportUnlockAttemptEventRecorder, "sharedRecorder");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "fileName");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v35[0] = MEMORY[0x1E0C809B0];
          v35[1] = 3221225472;
          v35[2] = __NTKDCreateFaceFromData_block_invoke_3;
          v35[3] = &unk_1E6BCE728;
          v36 = v25;
          v27 = v25;
          objc_msgSend(v24, "beginRecordingForIdentifier:method:completion:", v27, 3, v35);
          +[NTKDArgonService sharedService](NTKDArgonService, "sharedService");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v31[0] = MEMORY[0x1E0C809B0];
          v31[1] = 3221225472;
          v31[2] = __NTKDCreateFaceFromData_block_invoke_52;
          v31[3] = &unk_1E6BD3098;
          v33 = v9;
          v34 = *(id *)(a1 + 72);
          v32 = v12;
          objc_msgSend(v26, "ingestKeyDescriptor:withMethod:completion:", v32, 3, v31);

          v23 = 0;
        }
        v7 = v30;

        v8 = v28;
      }
      else
      {
        v9[2](v9);
        v23 = 1;
        v7 = v30;
      }

      if (v23)
      {

LABEL_29:
        goto LABEL_30;
      }
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    }

    goto LABEL_29;
  }
  if (NTKInternalBuild(a1, a2))
  {
    NTKHomeDirectory();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByAppendingPathComponent:", CFSTR("tmp"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByAppendingPathComponent:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v17, 1, 0, 0);
    objc_msgSend(v17, "stringByAppendingPathComponent:", CFSTR("data"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 56), "writeToFile:atomically:", v18, 1))
    {
      _NTKLoggingObjectForDomain(1, (uint64_t)"NTKLoggingDomainDaemon");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        __NTKDCreateFaceFromData_block_invoke_35_cold_1();

      if (NTKFaceSupportUnlockAttemptEventRecorderErrorDomain_block_invoke_onceToken != -1)
        dispatch_once(&NTKFaceSupportUnlockAttemptEventRecorderErrorDomain_block_invoke_onceToken, &__block_literal_global_67);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
}

void __NTKDCreateFaceFromData_block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  +[NTKFace faceWithJSONObjectRepresentation:forDevice:forMigration:allowFallbackFromInvalidFaceStyle:](NTKFace, "faceWithJSONObjectRepresentation:forDevice:forMigration:allowFallbackFromInvalidFaceStyle:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 80), 1);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 48), "stringByAppendingPathComponent:", CFSTR("Resources"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 56), "fileExistsAtPath:", v2))
      objc_msgSend(v3, "setResourceDirectory:", v2);
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }

}

void __NTKDCreateFaceFromData_block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138412546;
      v7 = v5;
      v8 = 2112;
      v9 = v3;
      _os_log_impl(&dword_1B72A3000, v4, OS_LOG_TYPE_DEFAULT, "Couldn't record being for %@ - %@", (uint8_t *)&v6, 0x16u);
    }

  }
}

void __NTKDCreateFaceFromData_block_invoke_52(uint64_t a1, int a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v2 = *(_QWORD *)(a1 + 48);
    v3 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 32), "fileName");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("couldn't decrypt face JSON from key descriptor %@"), v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);

  }
}

void __NTKDCreateFaceFromData_block_invoke_66()
{
  NSObject *v0;

  _NTKLoggingObjectForDomain(1, (uint64_t)"NTKLoggingDomainDaemon");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __NTKDCreateFaceFromData_block_invoke_66_cold_1(v0);

  NTKDPromptToRaiseRadarWithAdditionalFiles(CFSTR("Clock Face Sync Error"), CFSTR("A rare error has occurred while syncing clock faces between your watch and phone. Please tap 'OK' to open Tap-to-Radar and file a bug. (Internal alert only.)"), CFSTR("Sync: New Face Failed to Unzip After Syncing from Gizmo (via Prompt)"), 1, MEMORY[0x1E0C9AA60], 1);
}

void __NTKDCreateFaceFromData_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1B72A3000, v0, v1, "Failed to create face from data: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __NTKDCreateFaceFromData_block_invoke_35_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1B72A3000, v0, v1, "unzip failed, data written to disk for analysis: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __NTKDCreateFaceFromData_block_invoke_66_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B72A3000, log, OS_LOG_TYPE_ERROR, "prompting to raise a radar re: unzip failure", v1, 2u);
}

@end
