@implementation PHBatchPerformChanges

- (PHBatchPerformChanges)initWithPhotoLibrary:(id)a3 itemCount:(unint64_t)a4 batchSize:(unint64_t)a5 batchBlock:(id)a6
{
  id v11;
  id v12;
  PHBatchPerformChanges *v13;
  PHBatchPerformChanges *v14;
  uint64_t v15;
  id batchBlock;
  PHBatchPerformChanges *v17;
  objc_super v19;

  v11 = a3;
  v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)PHBatchPerformChanges;
  v13 = -[PHBatchPerformChanges init](&v19, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_library, a3);
    v14->_itemCount = a4;
    v14->_batchSize = a5;
    v15 = objc_msgSend(v12, "copy");
    batchBlock = v14->_batchBlock;
    v14->_batchBlock = (id)v15;

    v17 = v14;
  }

  return v14;
}

- (BOOL)performChangesAndWait:(id *)a3
{
  BOOL v4;
  id v5;
  void *v6;
  id v8;

  v8 = 0;
  v4 = -[PHBatchPerformChanges _performChangesAndWaitStartingAtIndex:error:](self, "_performChangesAndWaitStartingAtIndex:error:", 0, &v8);
  v5 = v8;
  v6 = v5;
  if (a3)
    *a3 = objc_retainAutorelease(v5);

  return v4;
}

- (BOOL)_performChangesAndWaitStartingAtIndex:(unint64_t)a3 error:(id *)a4
{
  unint64_t v7;

  if (!-[PHBatchPerformChanges _hasMoreBatchesAtIndex:](self, "_hasMoreBatchesAtIndex:"))
    return 1;
  v7 = -[PHBatchPerformChanges _performBatchAtIndexAndWait:error:](self, "_performBatchAtIndexAndWait:error:", a3, a4);
  if (v7)
    return -[PHBatchPerformChanges _performChangesAndWaitStartingAtIndex:error:](self, "_performChangesAndWaitStartingAtIndex:error:", v7 + a3, a4);
  -[PHBatchPerformChanges _addBatchRangeAtIndex:toOutError:](self, "_addBatchRangeAtIndex:toOutError:", a3, a4);
  return 0;
}

- (unint64_t)_performBatchAtIndexAndWait:(unint64_t)a3 error:(id *)a4
{
  PHPhotoLibrary *library;
  unint64_t v5;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  library = self->_library;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__PHBatchPerformChanges__performBatchAtIndexAndWait_error___block_invoke;
  v7[3] = &unk_1E35DE840;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = a3;
  if (-[PHPhotoLibrary performChangesAndWait:error:](library, "performChangesAndWait:error:", v7, a4))
    v5 = v9[3];
  else
    v5 = 0;
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (PHBatchPerformChanges)performChangesWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  PHBatchPerformChanges *result;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__PHBatchPerformChanges_performChangesWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E35DF058;
  v8 = v4;
  v5 = v4;
  -[PHBatchPerformChanges _performChangesStartingAtIndex:withCompletionHandler:](self, "_performChangesStartingAtIndex:withCompletionHandler:", 0, v7);

  return result;
}

- (void)_performChangesStartingAtIndex:(unint64_t)a3 withCompletionHandler:(id)a4
{
  id v6;
  _QWORD v7[5];
  id v8;
  unint64_t v9;

  v6 = a4;
  if (-[PHBatchPerformChanges _hasMoreBatchesAtIndex:](self, "_hasMoreBatchesAtIndex:", a3))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __78__PHBatchPerformChanges__performChangesStartingAtIndex_withCompletionHandler___block_invoke;
    v7[3] = &unk_1E35DE868;
    v7[4] = self;
    v8 = v6;
    v9 = a3;
    -[PHBatchPerformChanges _performNextBatchAtIndex:withCompletionHandler:](self, "_performNextBatchAtIndex:withCompletionHandler:", a3, v7);

  }
  else
  {
    (*((void (**)(id, uint64_t, _QWORD))v6 + 2))(v6, 1, 0);
  }

}

- (void)_performNextBatchAtIndex:(unint64_t)a3 withCompletionHandler:(id)a4
{
  id v6;
  PHPhotoLibrary *library;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD *v11;
  _QWORD v12[7];
  _QWORD v13[4];

  v6 = a4;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 0;
  library = self->_library;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __72__PHBatchPerformChanges__performNextBatchAtIndex_withCompletionHandler___block_invoke;
  v12[3] = &unk_1E35DE840;
  v12[4] = self;
  v12[5] = v13;
  v12[6] = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__PHBatchPerformChanges__performNextBatchAtIndex_withCompletionHandler___block_invoke_2;
  v9[3] = &unk_1E35DE890;
  v8 = v6;
  v10 = v8;
  v11 = v13;
  -[PHPhotoLibrary performChanges:completionHandler:](library, "performChanges:completionHandler:", v12, v9);

  _Block_object_dispose(v13, 8);
}

- (BOOL)_hasMoreBatchesAtIndex:(unint64_t)a3
{
  return self->_itemCount > a3;
}

- (_NSRange)_batchRangeAtIndex:(unint64_t)a3
{
  unint64_t itemCount;
  unint64_t v6;
  NSUInteger batchSize;
  NSUInteger v8;
  void *v10;
  _NSRange result;

  itemCount = self->_itemCount;
  if (itemCount <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHBatchPerformChanges.m"), 136, CFSTR("Batch index %tu must be less than item count %tu"), a3, self->_itemCount);

    itemCount = self->_itemCount;
  }
  v6 = itemCount - a3;
  if (self->_batchSize >= v6)
    batchSize = v6;
  else
    batchSize = self->_batchSize;
  v8 = a3;
  result.length = batchSize;
  result.location = v8;
  return result;
}

- (unint64_t)_performBatchAtIndex:(unint64_t)a3
{
  unint64_t v4;
  unint64_t v5;
  void *v6;

  -[PHBatchPerformChanges _batchRangeAtIndex:](self, "_batchRangeAtIndex:", a3);
  v5 = v4;
  v6 = (void *)MEMORY[0x19AEBEADC]();
  (*((void (**)(void))self->_batchBlock + 2))();
  objc_autoreleasePoolPop(v6);
  return v5;
}

- (BOOL)_addBatchRangeAtIndex:(unint64_t)a3 toOutError:(id *)a4
{
  id v5;

  if (a4)
  {
    -[PHBatchPerformChanges _errorByAddingBatchRangeAtIndex:tofError:](self, "_errorByAddingBatchRangeAtIndex:tofError:", a3, *a4);
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *a4 = v5;

  }
  return 0;
}

- (id)_errorByAddingBatchRangeAtIndex:(unint64_t)a3 tofError:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a4;
  if (v6)
  {
    v7 = -[PHBatchPerformChanges _batchRangeAtIndex:](self, "_batchRangeAtIndex:", a3);
    v9 = v8;
    objc_msgSend(v6, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = v13;

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v7, v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, CFSTR("PHBatchPerformChangesRangeErrorKey"));

    v17 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v6, "domain");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, objc_msgSend(v6, "code"), v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_batchBlock, 0);
  objc_storeStrong((id *)&self->_library, 0);
}

uint64_t __72__PHBatchPerformChanges__performNextBatchAtIndex_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_performBatchAtIndex:", *(_QWORD *)(a1 + 48));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __72__PHBatchPerformChanges__performNextBatchAtIndex_withCompletionHandler___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  if (a2)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), 0);
  else
    return (*(uint64_t (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
}

void __78__PHBatchPerformChanges__performChangesStartingAtIndex_withCompletionHandler___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  id v6;

  v4 = (void *)a1[4];
  if (a2)
  {
    objc_msgSend(v4, "_performChangesStartingAtIndex:withCompletionHandler:", a1[6] + a2, a1[5]);
  }
  else
  {
    v5 = a1[5];
    objc_msgSend(v4, "_errorByAddingBatchRangeAtIndex:tofError:", a1[6], a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v6);

  }
}

uint64_t __61__PHBatchPerformChanges_performChangesWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __59__PHBatchPerformChanges__performBatchAtIndexAndWait_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_performBatchAtIndex:", *(_QWORD *)(a1 + 48));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end
