@implementation CSVisualizationArchiver

uint64_t __51___CSVisualizationArchiver_writeAllUnitsWithBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _BYTE *a6)
{
  uint64_t result;
  unsigned __int8 v9;

  result = objc_msgSend(*(id *)(a1 + 32), "writeAllUnitsInTable:block:", a2, *(_QWORD *)(a1 + 40));
  v9 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 18));
  if ((v9 & 1) != 0)
    *a6 = 1;
  return result;
}

void __55___CSVisualizationArchiver_writeAllUnitsInTable_block___block_invoke(uint64_t a1, int a2)
{
  uint64_t v3;
  unint64_t v4;
  _DWORD *v5;
  _DWORD *v6;
  _DWORD *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  BOOL v11;
  unint64_t v12;
  uint64_t v13;
  _DWORD *v14;
  unint64_t v15;
  int v16;

  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(_DWORD **)(v3 + 8);
  v4 = *(_QWORD *)(v3 + 16);
  if ((unint64_t)v5 >= v4)
  {
    v7 = *(_DWORD **)v3;
    v8 = ((uint64_t)v5 - *(_QWORD *)v3) >> 2;
    v9 = v8 + 1;
    if ((unint64_t)(v8 + 1) >> 62)
      abort();
    v10 = v4 - (_QWORD)v7;
    if (v10 >> 1 > v9)
      v9 = v10 >> 1;
    v11 = (unint64_t)v10 >= 0x7FFFFFFFFFFFFFFCLL;
    v12 = 0x3FFFFFFFFFFFFFFFLL;
    if (!v11)
      v12 = v9;
    if (v12)
    {
      v12 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>(v12);
      v7 = *(_DWORD **)v3;
      v5 = *(_DWORD **)(v3 + 8);
    }
    else
    {
      v13 = 0;
    }
    v14 = (_DWORD *)(v12 + 4 * v8);
    v15 = v12 + 4 * v13;
    *v14 = a2;
    v6 = v14 + 1;
    while (v5 != v7)
    {
      v16 = *--v5;
      *--v14 = v16;
    }
    *(_QWORD *)v3 = v14;
    *(_QWORD *)(v3 + 8) = v6;
    *(_QWORD *)(v3 + 16) = v15;
    if (v7)
      operator delete(v7);
  }
  else
  {
    *v5 = a2;
    v6 = v5 + 1;
  }
  *(_QWORD *)(v3 + 8) = v6;
}

uint64_t __55___CSVisualizationArchiver_writeAllUnitsInTable_block___block_invoke_60(uint64_t result, uint64_t a2)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  char v6;

  v2 = atomic_load(*(unsigned __int8 **)(result + 32));
  if ((v2 & 1) == 0)
  {
    v3 = result;
    v4 = *(unsigned int *)(**(_QWORD **)(result + 40) + 4 * a2);
    objc_msgSend(**(id **)(result + 48), "writeUnit:inTable:state:", v4, **(unsigned int **)(v3 + 56), *(_QWORD *)(v3 + 64));
    result = **(_QWORD **)(v3 + 72);
    if (result)
    {
      v6 = 0;
      result = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, char *))(result + 16))(result, **(unsigned int **)(v3 + 56), v4, &v6);
      if (v6)
        atomic_store(1u, *(unsigned __int8 **)(v3 + 32));
    }
    v5 = atomic_load((unsigned __int8 *)(**(_QWORD **)(v3 + 48) + 18));
    if ((v5 & 1) != 0)
      atomic_store(1u, *(unsigned __int8 **)(v3 + 32));
  }
  return result;
}

id __55___CSVisualizationArchiver_getWriteUnitState_forTable___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  void *v9;

  v7 = a2;
  v8 = *(_QWORD *)(a1 + 32);
  if (!v8
    || ((*(void (**)(uint64_t, id, uint64_t, uint64_t))(v8 + 16))(v8, v7, a3, a4),
        (v9 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(v7, "summaryOfUnit:inTable:", a4, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

id __55___CSVisualizationArchiver_getWriteUnitState_forTable___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  void *v9;

  v7 = a2;
  v8 = *(_QWORD *)(a1 + 32);
  if (!v8
    || ((*(void (**)(uint64_t, id, uint64_t, uint64_t))(v8 + 16))(v8, v7, a3, a4),
        (v9 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(v7, "descriptionOfUnit:inTable:", a4, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

void __141___CSVisualizationArchiver_CSRemoteVisualization__beginProvidingVisualizationArchivesWithMachServiceName_queue_creatingVisualizersWithBlock___block_invoke(uint64_t a1, const void *a2, uint64_t a3)
{
  NSObject *v6;
  uint64_t v7;
  void *v8;
  FILE *v9;
  NSObject *v10;
  int v11;
  int *v12;
  char *v13;
  int v14;
  _BYTE v15[18];
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  CSStore2::GetLog((CSStore2 *)a1);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v14 = 138543874;
    *(_QWORD *)v15 = v7;
    *(_WORD *)&v15[8] = 2048;
    *(_QWORD *)&v15[10] = a2;
    v16 = 2112;
    v17 = a3;
    _os_log_impl(&dword_1A4E5A000, v6, OS_LOG_TYPE_DEFAULT, "Received request for service %{public}@ from connection %p: %@", (uint8_t *)&v14, 0x20u);
  }

  v8 = (void *)os_transaction_create();
  v9 = funopen(a2, (int (__cdecl *)(void *, char *, int))CSStore2::readFromLockdownConnection, (int (__cdecl *)(void *, const char *, int))CSStore2::writeToLockdownConnection, 0, 0);
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 48), "processCommandFromConnection:fileHandle:providerBlock:", a2, v9, *(_QWORD *)(a1 + 40));
    fclose(v9);
  }
  else
  {
    CSStore2::GetLog(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = *__error();
      v12 = __error();
      v13 = strerror(*v12);
      v14 = 67109378;
      *(_DWORD *)v15 = v11;
      *(_WORD *)&v15[4] = 2080;
      *(_QWORD *)&v15[6] = v13;
      _os_log_error_impl(&dword_1A4E5A000, v10, OS_LOG_TYPE_ERROR, "Failed to open file handle for streaming visualization data: %i (%s)", (uint8_t *)&v14, 0x12u);
    }

  }
  softLinklockdown_disconnect((uint64_t)a2);

}

void __106___CSVisualizationArchiver_CSRemoteVisualization__provideVisualizerToConnection_fileHandle_providerBlock___block_invoke(uint64_t a1)
{
  void *v2;
  _CSVisualizationArchiver *v3;
  uint64_t v4;
  _CSVisualizationArchiver *v5;
  CSStore2 *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  NSObject *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = [_CSVisualizationArchiver alloc];
    v4 = *(_QWORD *)(a1 + 48);
    v9 = 0;
    v5 = -[_CSVisualizationArchiver initWithVisualizer:fileHandle:closeWhenDone:allowCompression:error:](v3, "initWithVisualizer:fileHandle:closeWhenDone:allowCompression:error:", v2, v4, 0, 1, &v9);
    v6 = (CSStore2 *)v9;
    v7 = v6;
    if (v5)
    {
      -[_CSVisualizationArchiver writeAllUnitsWithBlock:](v5, "writeAllUnitsWithBlock:", 0);
      -[_CSVisualizationArchiver finishWriting](v5, "finishWriting");
    }
    else
    {
      CSStore2::GetLog(v6);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v11 = v7;
        _os_log_error_impl(&dword_1A4E5A000, v8, OS_LOG_TYPE_ERROR, "Failed to create _CSVisualizationArchiver for streaming visualization data: %{public}@", buf, 0xCu);
      }

    }
  }
  else
  {
    CSStore2::GetLog(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4E5A000, v7, OS_LOG_TYPE_INFO, "Callback block didn't vend a _CSVisualizer; no data will be returned to the Mac",
        buf,
        2u);
    }
  }

}

@end
