@implementation MFDAFolderChangeConsumer

- (MFDAFolderChangeConsumer)init
{
  MFDAFolderChangeConsumer *v2;
  uint64_t v3;
  MFConditionLock *conditionLock;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFDAFolderChangeConsumer;
  v2 = -[MFDAFolderChangeConsumer init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D46070]), "initWithName:condition:andDelegate:", CFSTR("_MFDAFolderChangeConsumer_Lock"), 0, 0);
    conditionLock = v2->_conditionLock;
    v2->_conditionLock = (MFConditionLock *)v3;

  }
  return v2;
}

- (void)folderChange:(id)a3 finishedWithStatus:(int64_t)a4 error:(id)a5
{
  id v9;
  id v10;
  id v11;
  MFDAFolderChangeResult *v12;
  int64_t v13;
  void *v14;
  void *v15;
  MFDAFolderChangeResult *v16;
  MFDAFolderChangeResult *result;
  void *v18;
  void *v19;
  id v20;
  int64_t v21;

  v9 = a3;
  v21 = a4;
  v10 = a5;
  v20 = v10;
  MFWalkUpDAErrorChain(&v20, &v21);
  v11 = v20;

  -[MFConditionLock lock](self->_conditionLock, "lock");
  if (self->_result)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFDAFolderChangeConsumer.m"), 55, CFSTR("%@ should not be called twice"), v19);

  }
  v12 = [MFDAFolderChangeResult alloc];
  v13 = v21;
  objc_msgSend(v9, "folderId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[MFDAFolderChangeResult initWithStatusCode:error:folderID:folderName:](v12, "initWithStatusCode:error:folderID:folderName:", v13, v11, v14, v15);
  result = self->_result;
  self->_result = v16;

  -[MFConditionLock unlockWithCondition:](self->_conditionLock, "unlockWithCondition:", 1);
}

- (id)waitForResult
{
  MFDAFolderChangeResult *v3;

  -[MFConditionLock lockWhenCondition:](self->_conditionLock, "lockWhenCondition:", 1);
  v3 = self->_result;
  -[MFConditionLock unlock](self->_conditionLock, "unlock");
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_conditionLock, 0);
}

@end
