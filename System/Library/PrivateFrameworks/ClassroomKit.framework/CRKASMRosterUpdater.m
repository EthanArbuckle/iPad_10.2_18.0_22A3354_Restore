@implementation CRKASMRosterUpdater

- (CRKASMRosterUpdater)initWithRequirements:(id)a3
{
  id v5;
  CRKASMRosterUpdater *v6;
  CRKASMRosterUpdater *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKASMRosterUpdater;
  v6 = -[CRKASMRosterUpdater init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_requirements, a3);

  return v7;
}

- (void)createClassWithProperties:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  CRKCreateASMClassOperation *v10;
  void *v11;
  CRKCreateASMClassOperation *v12;
  void *v13;
  void *v14;
  id v15;

  v7 = a4;
  v8 = a3;
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMRosterUpdater errorWrappingCompletionForCompletion:selectorName:](self, "errorWrappingCompletionForCompletion:selectorName:", v7, v9);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  v10 = [CRKCreateASMClassOperation alloc];
  -[CRKASMRosterUpdater requirements](self, "requirements");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[CRKCreateASMClassOperation initWithProperties:requirements:](v10, "initWithProperties:requirements:", v8, v11);

  v13 = (void *)MEMORY[0x219A226E8](v15);
  -[CRKCreateASMClassOperation addTarget:selector:forOperationEvents:userInfo:](v12, "addTarget:selector:forOperationEvents:userInfo:", self, sel_createClassOperationDidFinish_completion_, 6, v13);

  objc_msgSend(MEMORY[0x24BE2C758], "crk_backgroundQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addOperation:", v12);

}

- (void)createClassOperationDidFinish:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "error");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);

}

- (void)updateCourseWithIdentifier:(id)a3 properties:(id)a4 roster:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD);
  void *v17;
  id v18;
  CRKUpdateASMClassOperation *v19;
  void *v20;
  CRKUpdateASMClassOperation *v21;
  void *v22;
  void *v23;
  id v24;

  v11 = a4;
  v12 = a6;
  v13 = a5;
  v14 = a3;
  NSStringFromSelector(a2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMRosterUpdater errorWrappingCompletionForCompletion:selectorName:](self, "errorWrappingCompletionForCompletion:selectorName:", v12, v15);
  v16 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  v24 = 0;
  -[CRKASMRosterUpdater objectIDForCourseWithIdentifier:inRoster:error:](self, "objectIDForCourseWithIdentifier:inRoster:error:", v14, v13, &v24);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = v24;
  if (v17)
  {
    v19 = [CRKUpdateASMClassOperation alloc];
    -[CRKASMRosterUpdater requirements](self, "requirements");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[CRKUpdateASMClassOperation initWithObjectID:properties:requirements:](v19, "initWithObjectID:properties:requirements:", v17, v11, v20);

    v22 = (void *)MEMORY[0x219A226E8](v16);
    -[CRKUpdateASMClassOperation addTarget:selector:forOperationEvents:userInfo:](v21, "addTarget:selector:forOperationEvents:userInfo:", self, sel_updateClassOperationDidFinish_completion_, 6, v22);

    objc_msgSend(MEMORY[0x24BE2C758], "crk_backgroundQueue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addOperation:", v21);

  }
  else
  {
    ((void (**)(_QWORD, id))v16)[2](v16, v18);
  }

}

- (void)updateClassOperationDidFinish:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "error");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);

}

- (void)removeCourseWithIdentifier:(id)a3 roster:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  CRKRemoveASMClassOperation *v14;
  void *v15;
  CRKRemoveASMClassOperation *v16;
  void *v17;
  void *v18;
  void (**v19)(id, _QWORD);

  v9 = a5;
  v10 = a4;
  v11 = a3;
  NSStringFromSelector(a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMRosterUpdater errorWrappingCompletionForCompletion:selectorName:](self, "errorWrappingCompletionForCompletion:selectorName:", v9, v12);
  v19 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();

  -[CRKASMRosterUpdater objectIDForCourseWithIdentifier:inRoster:error:](self, "objectIDForCourseWithIdentifier:inRoster:error:", v11, v10, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = [CRKRemoveASMClassOperation alloc];
    -[CRKASMRosterUpdater requirements](self, "requirements");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[CRKRemoveASMClassOperation initWithObjectID:requirements:](v14, "initWithObjectID:requirements:", v13, v15);

    v17 = (void *)MEMORY[0x219A226E8](v19);
    -[CRKRemoveASMClassOperation addTarget:selector:forOperationEvents:userInfo:](v16, "addTarget:selector:forOperationEvents:userInfo:", self, sel_removeOperationDidFinish_completion_, 6, v17);

    objc_msgSend(MEMORY[0x24BE2C758], "crk_backgroundQueue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addOperation:", v16);

  }
  else
  {
    v19[2](v19, 0);
  }

}

- (void)removeOperationDidFinish:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "error");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);

}

- (id)objectIDForCourseWithIdentifier:(id)a3 inRoster:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  -[CRKASMRosterUpdater courseWithIdentifier:inRoster:](self, "courseWithIdentifier:inRoster:", v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[CRKASMRosterUpdater objectIDForCourseWithIdentifier:inRoster:error:]");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("CRKASMRosterUpdater.m"), 140, CFSTR("expected %@, got %@"), v21, v23);

    }
    objc_msgSend(v11, "backingClassObjectID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (a5)
    {
      v24 = CFSTR("kCRKItemNameErrorKey");
      objc_msgSend(v8, "stringValue");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      v15 = CFSTR("courseIdentifier.stringValue");
      if (v13)
        v15 = (const __CFString *)v13;
      v25[0] = v15;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      CRKErrorWithCodeAndUserInfo(12, v16);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    v12 = 0;
  }

  return v12;
}

- (id)courseWithIdentifier:(id)a3 inRoster:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(a4, "courses", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", v5);

        if ((v12 & 1) != 0)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)errorWrappingCompletionForCompletion:(id)a3 selectorName:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __73__CRKASMRosterUpdater_errorWrappingCompletionForCompletion_selectorName___block_invoke;
  v12[3] = &unk_24D9C7E90;
  v13 = v7;
  v14 = v6;
  v12[4] = self;
  v8 = v7;
  v9 = v6;
  v10 = (void *)MEMORY[0x219A226E8](v12);

  return v10;
}

void __73__CRKASMRosterUpdater_errorWrappingCompletionForCompletion_selectorName___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void (*v9)(void);
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (!v3)
  {
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_10:
    v9();
    goto LABEL_11;
  }
  objc_msgSend(*(id *)(a1 + 32), "requirements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "ownsError:", v3);

  if ((v5 & 1) == 0)
  {
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    goto LABEL_10;
  }
  if (_CRKLogASM_onceToken_11 != -1)
    dispatch_once(&_CRKLogASM_onceToken_11, &__block_literal_global_26);
  v6 = (void *)_CRKLogASM_logObj_11;
  if (os_log_type_enabled((os_log_t)_CRKLogASM_logObj_11, OS_LOG_TYPE_ERROR))
    __73__CRKASMRosterUpdater_errorWrappingCompletionForCompletion_selectorName___block_invoke_cold_1(a1, v6, v3);
  v10 = *MEMORY[0x24BDD1398];
  v11[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CRKErrorWithCodeAndUserInfo(154, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_11:

}

- (CRKClassKitRosterRequirements)requirements
{
  return self->_requirements;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requirements, 0);
}

void __73__CRKASMRosterUpdater_errorWrappingCompletionForCompletion_selectorName___block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(a3, "verboseDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v4;
  v9 = 2114;
  v10 = v6;
  _os_log_error_impl(&dword_218C99000, v5, OS_LOG_TYPE_ERROR, "An error occurred in %{public}@, %{public}@", (uint8_t *)&v7, 0x16u);

}

@end
