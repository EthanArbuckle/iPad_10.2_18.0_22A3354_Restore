@implementation MDMDeclarativeManagementCommand

+ (BOOL)processRequestTypeWithProfileIdentifier:(id)a3 request:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  _QWORD v11[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v8 = a3;
  v9 = a4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 1;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__1;
  v22 = __Block_byref_object_dispose__1;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  v17 = 0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __89__MDMDeclarativeManagementCommand_processRequestTypeWithProfileIdentifier_request_error___block_invoke;
  v11[3] = &unk_24EB68140;
  v11[4] = &v24;
  v11[5] = &v18;
  v11[6] = &v12;
  objc_msgSend(a1, "_enrollmentTypeWithProfileIdentifier:completionHandler:", v8, v11);
  LOBYTE(a5) = objc_msgSend(MEMORY[0x24BE7EB28], "processDeclarativeManagementCommandWithProfileIdentifier:enrollmentType:scope:username:personaID:request:error:", v8, v25[3], 1, v19[5], v13[5], v9, a5);
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return (char)a5;
}

void __89__MDMDeclarativeManagementCommand_processRequestTypeWithProfileIdentifier_request_error___block_invoke(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v7 = a3;
  v8 = a4;
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
  v9 = *(_QWORD *)(a1[5] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v7;
  v13 = v7;

  v11 = *(_QWORD *)(a1[6] + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v8;

}

+ (BOOL)processMultiUserDeviceUserChannelRequestTypeWithProfileIdentifier:(id)a3 request:(id)a4 error:(id *)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = (void *)MEMORY[0x24BDB4398];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "defaultStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dmc_primaryiCloudAccount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "username");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a5) = objc_msgSend(MEMORY[0x24BE7EB28], "processDeclarativeManagementCommandWithProfileIdentifier:enrollmentType:scope:username:personaID:request:error:", v9, 3, 0, v12, 0, v8, a5);
  return (char)a5;
}

+ (BOOL)unenrollWithProfileIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  _QWORD v8[7];
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v6 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 1;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__1;
  v11[4] = __Block_byref_object_dispose__1;
  v12 = 0;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy__1;
  v9[4] = __Block_byref_object_dispose__1;
  v10 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __71__MDMDeclarativeManagementCommand_unenrollWithProfileIdentifier_error___block_invoke;
  v8[3] = &unk_24EB68140;
  v8[4] = &v13;
  v8[5] = v11;
  v8[6] = v9;
  objc_msgSend(a1, "_enrollmentTypeWithProfileIdentifier:completionHandler:", v6, v8);
  LOBYTE(a4) = objc_msgSend(MEMORY[0x24BE7EB28], "unenrollWithProfileIdentifier:enrollmentType:scope:error:", v6, v14[3], 1, a4);
  _Block_object_dispose(v9, 8);

  _Block_object_dispose(v11, 8);
  _Block_object_dispose(&v13, 8);

  return (char)a4;
}

void __71__MDMDeclarativeManagementCommand_unenrollWithProfileIdentifier_error___block_invoke(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v7 = a3;
  v8 = a4;
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
  v9 = *(_QWORD *)(a1[5] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v7;
  v13 = v7;

  v11 = *(_QWORD *)(a1[6] + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v8;

}

+ (void)_enrollmentTypeWithProfileIdentifier:(id)a3 completionHandler:(id)a4
{
  int v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (**v12)(id, _QWORD, void *, void *);

  v12 = (void (**)(id, _QWORD, void *, void *))a4;
  v5 = objc_msgSend(a1, "_isSupervised");
  objc_msgSend(MEMORY[0x24BE60D70], "sharedConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "refreshDetailsFromDisk");
  v7 = objc_msgSend(v6, "isUserEnrollment");
  objc_msgSend(v6, "personaID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BE2A7A0], "managedAppleIDNameWithPersonaID:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  v10 = 3;
  if (!v5)
    v10 = 1;
  if (v7)
    v11 = 0;
  else
    v11 = v10;
  v12[2](v12, v11, v9, v8);

}

+ (BOOL)_isSupervised
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE60D68], "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "refreshDetailsFromDisk");
  v3 = objc_msgSend(v2, "isSupervised");

  return v3;
}

+ (id)declarativeManagementFatalError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BE2A728];
  DMCErrorArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 12097, v4, *MEMORY[0x24BE2A588], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
