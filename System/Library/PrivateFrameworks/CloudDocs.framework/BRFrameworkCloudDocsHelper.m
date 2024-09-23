@implementation BRFrameworkCloudDocsHelper

- (id)queryPathsForPersona:(id)a3 withError:(id *)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  if (!BRIsFPFSEnabled(v6, v7)
    || (-[BRFrameworkCloudDocsHelper _queryFastPathsForPrimaryPersona:](self, "_queryFastPathsForPrimaryPersona:", v6),
        (v8 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "newSyncProxy");

    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__1;
    v23 = __Block_byref_object_dispose__1;
    v24 = 0;
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__1;
    v17 = __Block_byref_object_dispose__1;
    v18 = 0;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __61__BRFrameworkCloudDocsHelper_queryPathsForPersona_withError___block_invoke;
    v12[3] = &unk_1E3DA4BD0;
    v12[4] = &v19;
    v12[5] = &v13;
    objc_msgSend(v10, "queryPathsForPersona:reply:", v6, v12);
    if (a4)
      *a4 = objc_retainAutorelease((id)v14[5]);
    v8 = (id)v20[5];
    _Block_object_dispose(&v13, 8);

    _Block_object_dispose(&v19, 8);
  }

  return v8;
}

- (id)_queryFastPathsForPrimaryPersona:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentPersona");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("__defaultPersonaID__")) & 1) != 0
    || (objc_msgSend(v5, "isDataSeparatedPersona") & 1) == 0
    && (objc_msgSend(v5, "userPersonaUniqueString"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isEqualToString:", v3),
        v6,
        v7))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fp_homeDirectory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "br_realpathURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fp_lmdURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "br_realpathURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = 0;
      v12 = 0;
      if (objc_msgSend(MEMORY[0x1E0C99E98], "br_isURL:syncRootOwnedByICloudDrive:withError:", v11, &v14, 0))
      {
        if (v11 && v14)
        {
          v12 = (void *)objc_opt_new();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, CFSTR("home"));
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, CFSTR("Mobile Documents"));
        }
        else
        {
          v15 = CFSTR("home");
          v16[0] = v9;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __61__BRFrameworkCloudDocsHelper_queryPathsForPersona_withError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

@end
