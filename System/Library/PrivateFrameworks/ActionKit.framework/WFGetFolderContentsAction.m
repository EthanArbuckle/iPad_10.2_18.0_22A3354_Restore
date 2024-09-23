@implementation WFGetFolderContentsAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  char v6;
  _QWORD v7[5];
  _QWORD v8[5];
  char v9;

  v4 = a3;
  -[WFGetFolderContentsAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("Recursive"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  v7[4] = self;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __56__WFGetFolderContentsAction_runAsynchronouslyWithInput___block_invoke;
  v8[3] = &unk_24F8B8E38;
  v8[4] = self;
  v9 = v6;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__WFGetFolderContentsAction_runAsynchronouslyWithInput___block_invoke_2;
  v7[3] = &unk_24F8BB050;
  objc_msgSend(v4, "enumerateFileRepresentations:forType:completionHandler:", v8, 0, v7);

}

- (id)contentDestinationWithError:(id *)a3
{
  return 0;
}

void __56__WFGetFolderContentsAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void (**v5)(id, id);
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id v27;
  _BYTE v28[128];
  _QWORD v29[2];
  _QWORD v30[4];

  v30[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(a2, "fileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "wf_fileIsDirectory") & 1) != 0)
  {
    v7 = *(unsigned __int8 *)(a1 + 40);
    v27 = 0;
    +[WFGetFolderContentsAction contentsOfDirectory:includingSubfolders:error:](WFGetFolderContentsAction, "contentsOfDirectory:includingSubfolders:error:", v6, v7, &v27);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v27;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v24;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v14);
          objc_msgSend(*(id *)(a1 + 32), "output", (_QWORD)v23);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addFileWithOriginAttribution:", v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v12);
    }

    v5[2](v5, v9);
  }
  else
  {
    WFLocalizedString(CFSTR("File Is Not a Folder"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    WFLocalizedString(CFSTR("Please pass a folder to the Get Folder Contents action, instead of a regular file."));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v17 = *(void **)(a1 + 32);
    v18 = (void *)MEMORY[0x24BDD1540];
    v19 = *MEMORY[0x24BEC4270];
    v20 = *MEMORY[0x24BDD0FC8];
    v29[0] = *MEMORY[0x24BDD0FD8];
    v29[1] = v20;
    v30[0] = v9;
    v30[1] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 5, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "finishRunningWithError:", v22);

  }
}

uint64_t __56__WFGetFolderContentsAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
}

+ (id)contentsOfDirectory:(id)a3 includingSubfolders:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  BOOL v19;
  id obj;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a4;
  v7 = a3;
  if (v6)
    v8 = 4;
  else
    v8 = 5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__42046;
  v25 = __Block_byref_object_dispose__42047;
  v26 = 0;
  v9 = (void *)objc_opt_new();
  v10 = (void *)objc_opt_new();
  v11 = (id *)(v22 + 5);
  obj = (id)v22[5];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __75__WFGetFolderContentsAction_contentsOfDirectory_includingSubfolders_error___block_invoke;
  v15[3] = &unk_24F8B8E10;
  v17 = &v21;
  v18 = v8;
  v19 = v6;
  v12 = v9;
  v16 = v12;
  objc_msgSend(v10, "coordinateReadingItemAtURL:options:error:byAccessor:", v7, 0x20000, &obj, v15);
  objc_storeStrong(v11, obj);

  v13 = (void *)v22[5];
  if (v13)
    *a5 = objc_retainAutorelease(v13);

  _Block_object_dispose(&v21, 8);
  return v12;
}

void __75__WFGetFolderContentsAction_contentsOfDirectory_includingSubfolders_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[5];
  _BYTE v23[128];
  _QWORD v24[3];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BDBCC60];
  v24[0] = *MEMORY[0x24BDBCC60];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __75__WFGetFolderContentsAction_contentsOfDirectory_includingSubfolders_error___block_invoke_2;
  v22[3] = &unk_24F8B8DE8;
  v7 = *(_QWORD *)(a1 + 48);
  v22[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v4, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v3, v6, v7, v22);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v17 = 0;
        objc_msgSend(v14, "getResourceValue:forKey:error:", &v17, v5, 0);
        v15 = v17;
        if (!objc_msgSend(v15, "BOOLValue") || !*(_BYTE *)(a1 + 56))
        {
          objc_msgSend(MEMORY[0x24BE194F8], "fileWithURL:options:", v14, 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
            objc_msgSend(*(id *)(a1 + 32), "addObject:", v16);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v11);
  }

}

uint64_t __75__WFGetFolderContentsAction_contentsOfDirectory_includingSubfolders_error___block_invoke_2(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  return 0;
}

@end
