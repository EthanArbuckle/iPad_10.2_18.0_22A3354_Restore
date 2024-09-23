@implementation NSOperationQueue

uint64_t __64__NSOperationQueue_CloudKit__existingOperationToDeleteRecordID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "recordIDsToDelete");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "containsObject:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __63__NSOperationQueue_CloudKit__existingOperationToFetchRecordID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "recordIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "containsObject:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __62__NSOperationQueue_CloudKit__existingOperationToSaveRecordID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "recordsToSave");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __62__NSOperationQueue_CloudKit__existingOperationToSaveRecordID___block_invoke_2;
    v7[3] = &unk_1EA824FA8;
    v8 = *(id *)(a1 + 32);
    v5 = objc_msgSend(v4, "ic_containsObjectPassingTest:", v7);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __62__NSOperationQueue_CloudKit__existingOperationToSaveRecordID___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "recordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

@end
