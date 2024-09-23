@implementation BMSegmentManager

- (id)nextSegmentAfterFrameStore:(id)a3 segmentNames:(id)a4 segmentFileHandles:(id)a5 direction:(unint64_t)a6
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v30 = a5;
  if (a6)
    v11 = -1;
  else
    v11 = 1;
  v28 = v9;
  if (v9
    && (objc_msgSend(v9, "segmentName"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v10, "indexOfObject:", v12),
        v12,
        v13 != 0x7FFFFFFFFFFFFFFFLL))
  {
    v14 = v13 + v11;
  }
  else if (a6)
  {
    v14 = objc_msgSend(v10, "count") - 1;
  }
  else
  {
    v14 = 0;
  }
  if (a6 == 1)
    v15 = -1;
  else
    v15 = 0;
  do
  {
    v16 = objc_msgSend(v10, "count", v24);
    v17 = 0;
    if ((v14 & 0x8000000000000000) != 0 || v14 >= v16)
      break;
    v18 = (void *)MEMORY[0x1AF4163D4]();
    objc_msgSend(v10, "objectAtIndexedSubscript:", v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    -[BMSegmentManager segmentWithFilename:segmentNames:segmentFileHandles:error:](self, "segmentWithFilename:segmentNames:segmentFileHandles:error:", v19, v10, v30, &v31);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v31;
    if (a6 || (objc_msgSend(v10, "containsObject:", v19) & 1) == 0)
    {
      v21 = v15;
      if (v20)
      {
LABEL_20:
        __biome_log_for_category();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v28, "segmentName");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (void *)MEMORY[0x1E0D01D10];
          -[BMSegmentManager path](self, "path");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "privacyPathname:", v26);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v33 = v19;
          v34 = 2112;
          v35 = v27;
          v36 = 2112;
          v37 = v24;
          v38 = 2112;
          v39 = v20;
          _os_log_error_impl(&dword_1A95BD000, v22, OS_LOG_TYPE_ERROR, "Unable to getNextSegment (%@) for prevFrameStore:%@ in:%@. Error: %@", buf, 0x2Au);

        }
      }
    }
    else
    {
      v21 = 1;
      if (v20)
        goto LABEL_20;
    }
    v14 += v21;

    objc_autoreleasePoolPop(v18);
  }
  while (!v17);

  return v17;
}

- (id)segmentAfterFrameStore:(id)a3 direction:(unint64_t)a4
{
  return -[BMSegmentManager _segmentAfterFrameStore:orCreateSegmentWithTimestamp:direction:](self, "_segmentAfterFrameStore:orCreateSegmentWithTimestamp:direction:", a3, 0, a4);
}

- (id)_segmentAfterFrameStore:(id)a3 orCreateSegmentWithTimestamp:(id)a4 direction:(unint64_t)a5
{
  id v8;
  id v9;
  _PASLock *protectedState;
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  BMSegmentManager *v17;
  id v18;
  uint64_t *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v8 = a3;
  v9 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__3;
  v25 = __Block_byref_object_dispose__3;
  v26 = 0;
  protectedState = self->_protectedState;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __83__BMSegmentManager__segmentAfterFrameStore_orCreateSegmentWithTimestamp_direction___block_invoke;
  v15[3] = &unk_1E55662D8;
  v11 = v8;
  v16 = v11;
  v17 = self;
  v19 = &v21;
  v20 = a5;
  v12 = v9;
  v18 = v12;
  -[_PASLock runWithLockAcquired:](protectedState, "runWithLockAcquired:", v15);
  v13 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v13;
}

- (BOOL)isDataAccessible
{
  _PASLock *protectedState;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  protectedState = self->_protectedState;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__BMSegmentManager_isDataAccessible__block_invoke;
  v5[3] = &unk_1E55661A8;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](protectedState, "runWithLockAcquired:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __36__BMSegmentManager_isDataAccessible__block_invoke(uint64_t result, uint64_t a2)
{
  BOOL v2;

  if (a2)
    v2 = *(_BYTE *)(a2 + 8) != 0;
  else
    v2 = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = v2;
  return result;
}

uint64_t __67__BMSegmentManager_indexOfSegmentContainingEventTime_fromSegments___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  objc_msgSend(v6, "timestampFromSegmentName:", a2);
  objc_msgSend(v5, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "timestampFromSegmentName:", v7);
  v11 = v10;

  objc_msgSend(v9, "numberWithDouble:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v8, "compare:", v12);

  return v13;
}

+ (double)timestampFromSegmentName:(id)a3
{
  return (double)objc_msgSend(a3, "longLongValue") / 1000000.0;
}

void __32__BMSegmentManager_segmentNames__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  if (a2)
    v3 = *(void **)(a2 + 16);
  else
    v3 = 0;
  v7 = v3;
  v4 = objc_msgSend(v7, "copy");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (NSOrderedSet)segmentNames
{
  _PASLock *protectedState;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__3;
  v10 = __Block_byref_object_dispose__3;
  v11 = 0;
  protectedState = self->_protectedState;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__BMSegmentManager_segmentNames__block_invoke;
  v5[3] = &unk_1E55661A8;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](protectedState, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSOrderedSet *)v3;
}

- (id)segmentWithFilename:(id)a3 error:(id *)a4
{
  id v6;
  _PASLock *protectedState;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v6 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__3;
  v26 = __Block_byref_object_dispose__3;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__3;
  v20 = __Block_byref_object_dispose__3;
  v21 = 0;
  protectedState = self->_protectedState;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __46__BMSegmentManager_segmentWithFilename_error___block_invoke;
  v12[3] = &unk_1E5566300;
  v14 = &v16;
  v12[4] = self;
  v8 = v6;
  v13 = v8;
  v15 = &v22;
  -[_PASLock runWithLockAcquired:](protectedState, "runWithLockAcquired:", v12);
  if (a4)
  {
    v9 = (void *)v23[5];
    if (v9)
      *a4 = objc_retainAutorelease(v9);
  }
  v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

uint64_t __35__BMSegmentManager__updateSegments__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateSegmentsWithGuardedDeviceLockStateData:", a2);
}

- (BMFrameStore)currentFrameStore
{
  return self->_currentFrameStore;
}

void __47__BMSegmentManager_segmentContainingTimestamp___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  void *v4;
  void *v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;

  v3 = a2;
  v4 = (void *)MEMORY[0x1AF4163D4]();
  if (v3)
    v5 = (void *)v3[2];
  else
    v5 = 0;
  v6 = v5;
  v7 = objc_msgSend((id)objc_opt_class(), "indexOfSegmentContainingEventTime:fromSegments:", v6, *(double *)(a1 + 48));
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (*(double *)(a1 + 48) == 0.0)
    {
      objc_msgSend(*(id *)(a1 + 32), "segmentAfterFrameStore:direction:", 0, 0);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

    }
  }
  else
  {
    v11 = v7;
    if (v7 >= objc_msgSend(v6, "count"))
    {
      __biome_log_for_category();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        __47__BMSegmentManager_segmentContainingTimestamp___block_invoke_cold_1();

    }
    else
    {
      v12 = *(void **)(a1 + 32);
      objc_msgSend(v6, "objectAtIndexedSubscript:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3)
        v14 = (void *)v3[3];
      else
        v14 = 0;
      v15 = v14;
      objc_msgSend(v12, "segmentWithFilename:segmentNames:segmentFileHandles:error:", v13, v6, v15, 0);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v18 = *(void **)(v17 + 40);
      *(_QWORD *)(v17 + 40) = v16;

    }
  }

  objc_autoreleasePoolPop(v4);
}

void __83__BMSegmentManager__segmentAfterFrameStore_orCreateSegmentWithTimestamp_direction___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  id *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  id v40;
  id v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  _QWORD v47[5];
  id *v48;
  id v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint8_t buf[4];
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  __biome_log_for_category();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "segmentName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v54 = v5;
    _os_log_impl(&dword_1A95BD000, v4, OS_LOG_TYPE_INFO, "_segmentAfterFrameStore: %@", buf, 0xCu);

  }
  v7 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  if (v3)
  {
    v8 = v3[2];
    v9 = v3[3];
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }
  v10 = *(_QWORD *)(a1 + 64);
  v11 = v9;
  objc_msgSend(v6, "nextSegmentAfterFrameStore:segmentNames:segmentFileHandles:direction:", v7, v8, v11, v10);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

  v15 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (!v15)
  {
    if (*(_QWORD *)(a1 + 64) || *(_QWORD *)(a1 + 48))
      goto LABEL_29;
    objc_msgSend(*(id *)(a1 + 40), "updateSegmentsWithGuardedDeviceLockStateData:", v3);
    v39 = *(_QWORD *)(a1 + 32);
    v38 = *(void **)(a1 + 40);
    if (v3)
    {
      v40 = v3[2];
      v41 = v3[3];
    }
    else
    {
      v40 = 0;
      v41 = 0;
    }
    v42 = *(_QWORD *)(a1 + 64);
    v43 = v41;
    objc_msgSend(v38, "nextSegmentAfterFrameStore:segmentNames:segmentFileHandles:direction:", v39, v40, v43, v42);
    v44 = objc_claimAutoreleasedReturnValue();
    v45 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v46 = *(void **)(v45 + 40);
    *(_QWORD *)(v45 + 40) = v44;

    v15 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    if (!v15)
    {
LABEL_29:
      if (*(_QWORD *)(a1 + 48))
      {
        __biome_log_for_category();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A95BD000, v16, OS_LOG_TYPE_INFO, "_segmentAfterFrameStore: Attempting to create new frame store", buf, 2u);
        }

        v17 = *(_QWORD *)(a1 + 40);
        v18 = *(void **)(v17 + 64);
        objc_msgSend(*(id *)(v17 + 40), "datastorePath");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v18) = objc_msgSend(v18, "hasPrefix:", v19);

        if ((v18 & 1) == 0)
        {
          __biome_log_for_category();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
            __83__BMSegmentManager__segmentAfterFrameStore_orCreateSegmentWithTimestamp_direction___block_invoke_cold_1();

        }
        v21 = *(_QWORD *)(a1 + 40);
        v22 = *(void **)(v21 + 64);
        objc_msgSend(*(id *)(v21 + 40), "datastorePath");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "substringFromIndex:", objc_msgSend(v23, "length"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v24, "hasPrefix:", CFSTR("/")))
        {
          objc_msgSend(v24, "substringFromIndex:", 1);
          v25 = objc_claimAutoreleasedReturnValue();

          v24 = (void *)v25;
        }
        objc_msgSend(v24, "substringToIndex:", objc_msgSend(v24, "rangeOfString:", CFSTR("/")));
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "datastorePath");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "stringByAppendingPathComponent:", v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D01D38], "lock");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "stringByAppendingPathComponent:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        __biome_log_for_category();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v54 = v30;
          _os_log_impl(&dword_1A95BD000, v31, OS_LOG_TYPE_INFO, "_segmentAfterFrameStore: Attempting to acquire lockfile: %@", buf, 0xCu);
        }

        v32 = *(_QWORD *)(a1 + 40);
        v33 = *(void **)(v32 + 8);
        v47[0] = MEMORY[0x1E0C809B0];
        v47[1] = 3221225472;
        v47[2] = __83__BMSegmentManager__segmentAfterFrameStore_orCreateSegmentWithTimestamp_direction___block_invoke_47;
        v47[3] = &unk_1E55662B0;
        v47[4] = v32;
        v34 = v3;
        v35 = *(_QWORD *)(a1 + 56);
        v48 = v34;
        v51 = v35;
        v36 = *(id *)(a1 + 32);
        v37 = *(_QWORD *)(a1 + 64);
        v49 = v36;
        v52 = v37;
        v50 = *(id *)(a1 + 48);
        objc_msgSend(v33, "acquireLockfile:andRunBlock:", v30, v47);

        v15 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      }
      else
      {
        v15 = 0;
      }
    }
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 72), v15);

}

void __46__BMSegmentManager_segmentWithFilename_error___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id obj;

  v3 = (void *)a1[4];
  v4 = a1[5];
  if (a2)
  {
    v6 = *(id *)(a2 + 16);
    v7 = *(void **)(a2 + 24);
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  v8 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v8 + 40);
  v9 = v7;
  objc_msgSend(v3, "segmentWithFilename:segmentNames:segmentFileHandles:error:", v4, v6, v9, &obj);
  v10 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v8 + 40), obj);
  v11 = *(_QWORD *)(a1[6] + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

}

- (id)segmentWithFilename:(id)a3 segmentNames:(id)a4 segmentFileHandles:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  BMFrameStore *v15;
  BMFrameStore *v16;
  BMFrameStore *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v26;
  uint64_t v27;
  const __CFString *v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (!v10)
  {
    if (a6)
    {
      v18 = (void *)MEMORY[0x1E0CB35C8];
      v29 = *MEMORY[0x1E0CB2D50];
      v30[0] = CFSTR("Failed to create new framestore with nil filename");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("com.apple.biome.BiomeStorage"), -1, v19);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
    __biome_log_for_category();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[BMSegmentManager fileHandleForFile:error:].cold.1();
    goto LABEL_13;
  }
  objc_msgSend(v12, "objectForKeyedSubscript:", v10);
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    v26 = 0;
    -[BMSegmentManager fileHandleForFile:error:](self, "fileHandleForFile:error:", v10, &v26);
    v14 = objc_claimAutoreleasedReturnValue();
    v20 = v26;
    if (!v20)
    {
      if (-[BMSegmentManager shouldCacheFileDescriptors](self, "shouldCacheFileDescriptors"))
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, v10);
      goto LABEL_3;
    }
    v21 = v20;
    if (a6)
      *a6 = objc_retainAutorelease(v20);
    objc_msgSend(v11, "removeObject:", v10);

LABEL_13:
    v16 = 0;
    goto LABEL_20;
  }
LABEL_3:
  objc_msgSend(v11, "addObject:", v10);
  v15 = -[BMFrameStore initWithFileHandle:permission:datastoreVersion:]([BMFrameStore alloc], "initWithFileHandle:permission:datastoreVersion:", v14, self->_permission, -[BMStoreConfig configDatastoreVersion](self->_config, "configDatastoreVersion"));
  v16 = v15;
  if (v15)
  {
    v17 = v15;
  }
  else
  {
    if (a6)
    {
      v22 = (void *)MEMORY[0x1E0CB35C8];
      v27 = *MEMORY[0x1E0CB2D50];
      v28 = CFSTR("Failed to instantiate framestore with path");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("com.apple.biome.BiomeStorage"), 2, v23);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
    __biome_log_for_category();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[BMSegmentManager segmentWithFilename:segmentNames:segmentFileHandles:error:].cold.2(v14, v24);

  }
LABEL_20:

  return v16;
}

- (void)updateSegmentsWithGuardedDeviceLockStateData:(id)a3
{
  _QWORD *v4;
  void *v5;
  NSString *path;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;

  v4 = a3;
  v5 = (void *)MEMORY[0x1AF4163D4]();
  path = self->_path;
  v22 = 0;
  -[BMSegmentManager orderedSegmentsInDirectory:error:](self, "orderedSegmentsInDirectory:error:", path, &v22);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v22;
  -[BMSegmentManagerProtectedState setSegmentNames:]((uint64_t)v4, v7);

  -[BMSegmentManagerProtectedState setError:]((uint64_t)v4, v8);
  if (-[BMSegmentManager shouldCacheFileDescriptors](self, "shouldCacheFileDescriptors"))
  {
    v9 = (void *)MEMORY[0x1E0C99E40];
    if (v4)
      v10 = (void *)v4[3];
    else
      v10 = 0;
    objc_msgSend(v10, "allKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "orderedSetWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)objc_msgSend(v12, "mutableCopy");
    v14 = v13;
    if (v4)
    {
      objc_msgSend(v13, "minusOrderedSet:", v4[2]);
      v15 = (void *)v4[3];
    }
    else
    {
      objc_msgSend(v13, "minusOrderedSet:", 0);
      v15 = 0;
    }
    v16 = v15;
    objc_msgSend(v14, "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeObjectsForKeys:", v17);

    if (v4)
      v18 = (void *)v4[2];
    else
      v18 = 0;
    v19 = (void *)objc_msgSend(v18, "mutableCopy");
    objc_msgSend(v19, "minusOrderedSet:", v12);
    objc_msgSend(v19, "set");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v21 = v4[3];
    else
      v21 = 0;
    -[BMSegmentManager openFiles:saveToOpenFiles:](self, "openFiles:saveToOpenFiles:", v20, v21);

  }
  objc_autoreleasePoolPop(v5);

}

- (id)fileHandleForFile:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    -[NSString stringByAppendingPathComponent:](self->_path, "stringByAppendingPathComponent:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_permission)
      v8 = 2;
    else
      v8 = 0x20000000;
    -[BMFileManager fileHandleForFileAtPath:flags:protection:error:](self->_fileManager, "fileHandleForFileAtPath:flags:protection:error:", v7, v8, objc_msgSend(MEMORY[0x1E0D01CF0], "biomeProtectionClassToOSProtectionClass:", -[BMStoreConfig protectionClass](self->_config, "protectionClass")), a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (a4)
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v14 = *MEMORY[0x1E0CB2D50];
      v15[0] = CFSTR("Failed to create new framestore with nil filename");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("com.apple.biome.BiomeStorage"), -1, v11);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    __biome_log_for_category();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[BMSegmentManager fileHandleForFile:error:].cold.1();

    v9 = 0;
  }

  return v9;
}

- (BOOL)shouldCacheFileDescriptors
{
  return -[BMStoreConfig protectionClass](self->_config, "protectionClass") == 2;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BMSegmentManager)initWithDirectory:(id)a3 fileManager:(id)a4 permission:(unint64_t)a5 config:(id)a6
{
  id v10;
  id v11;
  id v12;
  BMSegmentManager *v13;
  uint64_t v14;
  NSString *path;
  void *v16;
  BMStoreConfig *v17;
  BMStoreConfig *config;
  uint64_t v19;
  id v20;
  BMSegmentManagerProtectedState *v21;
  uint64_t v22;
  _PASLock *protectedState;
  _PASLock *v24;
  uint64_t v25;
  BMSegmentManager *v26;
  _PASLock *v27;
  void *v28;
  _QWORD v30[4];
  id v31;
  id location;
  _QWORD v33[4];
  id v34;
  BMSegmentManager *v35;
  unint64_t v36;
  _QWORD v37[4];
  BMSegmentManager *v38;
  objc_super v39;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v39.receiver = self;
  v39.super_class = (Class)BMSegmentManager;
  v13 = -[BMSegmentManager init](&v39, sel_init);
  if (!v13)
    goto LABEL_10;
  v14 = objc_msgSend(v10, "copy");
  path = v13->_path;
  v13->_path = (NSString *)v14;

  objc_storeStrong((id *)&v13->_fileManager, a4);
  -[BMFileManager delegate](v13->_fileManager, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    -[BMFileManager setDelegate:](v13->_fileManager, "setDelegate:", v13);
    if (v12)
      goto LABEL_4;
LABEL_6:
    v17 = +[BMStoreConfig newStreamDefaultConfigurationForPublicStream:](BMStoreConfig, "newStreamDefaultConfigurationForPublicStream:", 0);
    goto LABEL_7;
  }
  if (!v12)
    goto LABEL_6;
LABEL_4:
  v17 = (BMStoreConfig *)v12;
LABEL_7:
  config = v13->_config;
  v13->_config = v17;

  v13->_permission = a5;
  v19 = objc_msgSend(MEMORY[0x1E0D81590], "isUnlocked");
  v20 = objc_alloc(MEMORY[0x1E0D815F0]);
  v21 = -[BMSegmentManagerProtectedState initWithDeviceStateIsUnlocked:]([BMSegmentManagerProtectedState alloc], "initWithDeviceStateIsUnlocked:", v19);
  v22 = objc_msgSend(v20, "initWithGuardedData:", v21);
  protectedState = v13->_protectedState;
  v13->_protectedState = (_PASLock *)v22;

  v24 = v13->_protectedState;
  v25 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __68__BMSegmentManager_initWithDirectory_fileManager_permission_config___block_invoke;
  v37[3] = &unk_1E5566130;
  v26 = v13;
  v38 = v26;
  -[_PASLock runWithLockAcquired:](v24, "runWithLockAcquired:", v37);
  if (objc_msgSend(MEMORY[0x1E0D01CF0], "canOpenFilesForProtectionClass:", -[BMStoreConfig protectionClass](v13->_config, "protectionClass")))
  {
    v27 = v13->_protectedState;
    v33[0] = v25;
    v33[1] = 3221225472;
    v33[2] = __68__BMSegmentManager_initWithDirectory_fileManager_permission_config___block_invoke_20;
    v33[3] = &unk_1E5566158;
    v36 = a5;
    v34 = v12;
    v35 = v26;
    -[_PASLock runWithLockAcquired:](v27, "runWithLockAcquired:", v33);

  }
  objc_initWeak(&location, v26);
  v28 = (void *)MEMORY[0x1E0D81590];
  v30[0] = v25;
  v30[1] = 3221225472;
  v30[2] = __68__BMSegmentManager_initWithDirectory_fileManager_permission_config___block_invoke_22;
  v30[3] = &unk_1E5566180;
  objc_copyWeak(&v31, &location);
  v26->_deviceLockStateRegistration = (void *)objc_msgSend(v28, "registerForAKSEventsNotifications:", v30);
  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);

LABEL_10:
  return v13;
}

- (id)segmentContainingTimestamp:(double)a3
{
  _PASLock *protectedState;
  id v4;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  v12 = 0;
  protectedState = self->_protectedState;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__BMSegmentManager_segmentContainingTimestamp___block_invoke;
  v6[3] = &unk_1E5566328;
  *(double *)&v6[6] = a3;
  v6[4] = self;
  v6[5] = &v7;
  -[_PASLock runWithLockAcquired:](protectedState, "runWithLockAcquired:", v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

+ (unint64_t)indexOfSegmentContainingEventTime:(double)a3 fromSegments:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  unint64_t v16;
  _QWORD v18[5];

  v6 = a4;
  if (objc_msgSend(v6, "count"))
  {
    if (a3 <= 0.0)
    {
      v16 = 0;
    }
    else
    {
      objc_msgSend(a1, "segmentNameFromTimestamp:", a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "count");
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __67__BMSegmentManager_indexOfSegmentContainingEventTime_fromSegments___block_invoke;
      v18[3] = &__block_descriptor_40_e31_q24__0__NSString_8__NSString_16l;
      v18[4] = a1;
      v9 = objc_msgSend(v6, "indexOfObject:inSortedRange:options:usingComparator:", v7, 0, v8, 1024, v18);
      if (v9 && v9 < objc_msgSend(v6, "count"))
      {
        v10 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v6, "objectAtIndexedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "timestampFromSegmentName:", v11);
        objc_msgSend(v10, "numberWithDouble:");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(a1, "timestampFromSegmentName:", v7);
        objc_msgSend(v13, "numberWithDouble:");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v12, "compare:", v14) != 0;

      }
      else
      {
        v15 = v9 == objc_msgSend(v6, "count");
      }
      v16 = v9 - v15;

    }
  }
  else
  {
    v16 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v16;
}

+ (id)segmentNameFromTimestamp:(double)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%llu"), vcvtmd_u64_f64(a3 * 1000000.0));
}

void __68__BMSegmentManager_initWithDirectory_fileManager_permission_config___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  char v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;

  v2 = a1 + 32;
  v1 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v1 + 8);
  v4 = *(_QWORD *)(v1 + 64);
  v9 = 0;
  v5 = objc_msgSend(v3, "createDirectoryAtPath:error:", v4, &v9);
  v6 = v9;
  v7 = v6;
  if ((v5 & 1) == 0 && v6)
  {
    __biome_log_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __68__BMSegmentManager_initWithDirectory_fileManager_permission_config___block_invoke_cold_1(v2, (uint64_t)v7, v8);

  }
}

- (void)dealloc
{
  objc_super v3;

  if (self->_deviceLockStateRegistration)
  {
    objc_msgSend(MEMORY[0x1E0D81590], "unregisterForAKSEventsNotifications:");
    self->_deviceLockStateRegistration = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)BMSegmentManager;
  -[BMSegmentManager dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentFrameStore, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_protectedState, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
}

- (void)_updateSegments
{
  _PASLock *protectedState;
  _QWORD v3[5];

  protectedState = self->_protectedState;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35__BMSegmentManager__updateSegments__block_invoke;
  v3[3] = &unk_1E5566130;
  v3[4] = self;
  -[_PASLock runWithLockAcquired:](protectedState, "runWithLockAcquired:", v3);
}

- (void)enumerateSegmentsFrom:(double)a3 to:(double)a4 withBlock:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__BMSegmentManager_enumerateSegmentsFrom_to_withBlock___block_invoke;
  v10[3] = &unk_1E5566378;
  v10[4] = self;
  v11 = v8;
  v9 = v8;
  -[BMSegmentManager enumerateSegmentsNamesFrom:to:withBlock:](self, "enumerateSegmentsNamesFrom:to:withBlock:", v10, a3, a4);

}

- (void)enumerateSegmentsNamesFrom:(double)a3 to:(double)a4 withBlock:(id)a5
{
  void (**v8)(id, void *, _BYTE *);
  unint64_t v10;
  NSObject *v11;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  BOOL v19;
  _BYTE v20[24];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(id, void *, _BYTE *))a5;
  if (a3 > a4 && a4 != -1.0)
  {
    __biome_log_for_category();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[BMSegmentManager enumerateSegmentsNamesFrom:to:withBlock:].cold.1();
    goto LABEL_29;
  }
  -[BMSegmentManager segmentNames](self, "segmentNames");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!-[NSObject count](v11, "count"))
  {
    __biome_log_for_category();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = (void *)MEMORY[0x1E0D01D10];
      -[BMSegmentManager path](self, "path");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "privacyPathname:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v20 = 138412290;
      *(_QWORD *)&v20[4] = v16;
      _os_log_impl(&dword_1A95BD000, v13, OS_LOG_TYPE_INFO, "No segments to enumerate: %@", v20, 0xCu);

    }
    goto LABEL_28;
  }
  if (a3 == 0.0)
    v10 = 0;
  else
    v10 = objc_msgSend((id)objc_opt_class(), "indexOfSegmentContainingEventTime:fromSegments:", v11, a3);
  if (a4 == -1.0)
    v17 = -[NSObject count](v11, "count") - 1;
  else
    v17 = objc_msgSend((id)objc_opt_class(), "indexOfSegmentContainingEventTime:fromSegments:", v11, a4);
  if (v10 >= -[NSObject count](v11, "count") || v17 >= -[NSObject count](v11, "count"))
  {
    __biome_log_for_category();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[BMSegmentManager enumerateSegmentsNamesFrom:to:withBlock:].cold.2();
LABEL_28:

    goto LABEL_29;
  }
  if (v10 <= v17)
  {
    do
    {
      v20[0] = 0;
      -[NSObject objectAtIndexedSubscript:](v11, "objectAtIndexedSubscript:", v10, *(_QWORD *)v20);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, v18, v20);

      ++v10;
      if (v20[0])
        v19 = 1;
      else
        v19 = v10 > v17;
    }
    while (!v19);
  }
LABEL_29:

}

- (NSString)path
{
  return self->_path;
}

void __55__BMSegmentManager_enumerateSegmentsFrom_to_withBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v11 = 0;
  objc_msgSend(v4, "segmentWithFilename:error:", v3, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;
  if (v6)
  {
    __biome_log_for_category();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = (void *)MEMORY[0x1E0D01D10];
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "stringByAppendingPathComponent:", v3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "privacyPathname:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v13 = v10;
      v14 = 2114;
      v15 = v6;
      _os_log_error_impl(&dword_1A95BD000, v7, OS_LOG_TYPE_ERROR, "Failed to open frame store %{public}@ during enumeration, error: %{public}@", buf, 0x16u);

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __68__BMSegmentManager_initWithDirectory_fileManager_permission_config___block_invoke_20(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unint64_t v5;
  char v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!*(_QWORD *)(a1 + 48))
    goto LABEL_14;
  objc_msgSend(*(id *)(a1 + 32), "pruningPolicy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "maxStreamSize");

  v6 = objc_msgSend(*(id *)(a1 + 32), "storeLocationOption");
  v7 = *(void **)(a1 + 32);
  if ((v6 & 2) != 0)
  {
    objc_msgSend(v7, "pruningPolicy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = BMTombstoneSegmentMaxStreamSize(v8);

    if (!v5)
      goto LABEL_14;
    goto LABEL_8;
  }
  if ((objc_msgSend(v7, "storeLocationOption") & 4) != 0)
    v5 = 0x100000;
  if (v5)
  {
LABEL_8:
    if (v5 != -1)
    {
      v9 = *(_QWORD **)(a1 + 40);
      v10 = v9[8];
      v34 = 0;
      objc_msgSend(v9, "orderedSegmentsInDirectory:error:", v10, &v34);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v34;
      -[BMSegmentManagerProtectedState setSegmentNames:]((uint64_t)v3, v11);

      -[BMSegmentManagerProtectedState setError:]((uint64_t)v3, v12);
      if (v3)
        v13 = (void *)*((_QWORD *)v3 + 2);
      else
        v13 = 0;
      v14 = v13;
      v15 = objc_msgSend(v14, "count");
      v16 = objc_msgSend(*(id *)(a1 + 32), "segmentSize");

      if (v15 > v5 / v16)
        objc_msgSend(*(id *)(a1 + 40), "pruneSegmentsToMaxSizeInBytes:", v5);

    }
  }
LABEL_14:
  objc_msgSend(*(id *)(a1 + 40), "updateSegmentsWithGuardedDeviceLockStateData:", v3);
  if (v3)
  {
    *((_BYTE *)v3 + 8) = 1;
    v17 = *(_QWORD *)(a1 + 48);
    v18 = (void *)*((_QWORD *)v3 + 2);
  }
  else
  {
    v18 = 0;
    v17 = *(_QWORD *)(a1 + 48);
  }
  if (v17 == 1)
  {
    v19 = v18;
    objc_msgSend(v19, "lastObject");
  }
  else
  {
    v19 = v18;
    objc_msgSend(v19, "firstObject");
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v21 = *(void **)(a1 + 40);
    if (v3)
    {
      v22 = *((id *)v3 + 2);
      v23 = (void *)*((_QWORD *)v3 + 3);
    }
    else
    {
      v22 = 0;
      v23 = 0;
    }
    v33 = 0;
    v24 = v23;
    objc_msgSend(v21, "segmentWithFilename:segmentNames:segmentFileHandles:error:", v20, v22, v24, &v33);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = v33;
    v27 = *(_QWORD *)(a1 + 40);
    v28 = *(void **)(v27 + 72);
    *(_QWORD *)(v27 + 72) = v25;

    if (v26)
    {
      __biome_log_for_category();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0D01D10], "privacyPathname:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v36 = v20;
        v37 = 2112;
        v38 = v32;
        v39 = 2112;
        v40 = v26;
        _os_log_error_impl(&dword_1A95BD000, v29, OS_LOG_TYPE_ERROR, "Unable to open framestore: %@ in %@ with error: %@", buf, 0x20u);

      }
      v30 = *(_QWORD *)(a1 + 40);
      v31 = *(void **)(v30 + 72);
      *(_QWORD *)(v30 + 72) = 0;

    }
  }

}

void __68__BMSegmentManager_initWithDirectory_fileManager_permission_config___block_invoke_22(uint64_t a1, int a2)
{
  id WeakRetained;
  id v3;
  id v4;

  switch(a2)
  {
    case 0:
    case 3:
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      objc_msgSend(WeakRetained, "handleDeviceUnlock");

      break;
    case 2:
      v3 = objc_loadWeakRetained((id *)(a1 + 32));
      objc_msgSend(v3, "handleDeviceLocking");

      break;
    case 5:
      v4 = objc_loadWeakRetained((id *)(a1 + 32));
      objc_msgSend(v4, "handleDeviceLockingCX");

      break;
    default:
      return;
  }
}

- (NSString)lastSegmentName
{
  _PASLock *protectedState;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__3;
  v10 = __Block_byref_object_dispose__3;
  v11 = 0;
  protectedState = self->_protectedState;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__BMSegmentManager_lastSegmentName__block_invoke;
  v5[3] = &unk_1E55661A8;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](protectedState, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __35__BMSegmentManager_lastSegmentName__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  if (a2)
    v3 = *(void **)(a2 + 16);
  else
    v3 = 0;
  v7 = v3;
  objc_msgSend(v7, "lastObject");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void)pruneSegmentsToMaxSizeInBytes:(unint64_t)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _QWORD v13[8];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  _QWORD v20[4];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a3 && a3 != -1)
  {
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x2020000000;
    v20[3] = 0;
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__3;
    v18 = __Block_byref_object_dispose__3;
    v19 = (id)objc_opt_new();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __50__BMSegmentManager_pruneSegmentsToMaxSizeInBytes___block_invoke;
    v13[3] = &unk_1E55661D0;
    v13[4] = self;
    v13[5] = v20;
    v13[6] = &v14;
    v13[7] = a3;
    -[BMSegmentManager reverseEnumerateSegmentsNamesFrom:to:withBlock:](self, "reverseEnumerateSegmentsNamesFrom:to:withBlock:", v13, 0.0, -1.0);
    if (objc_msgSend((id)v15[5], "count"))
    {
      v11 = 0u;
      v12 = 0u;
      v9 = 0u;
      v10 = 0u;
      v5 = (id)v15[5];
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v21, 16);
      if (v6)
      {
        v7 = *(_QWORD *)v10;
        do
        {
          v8 = 0;
          do
          {
            if (*(_QWORD *)v10 != v7)
              objc_enumerationMutation(v5);
            -[BMSegmentManager removeSegmentNamed:](self, "removeSegmentNamed:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), (_QWORD)v9);
          }
          while (v6 != v8);
          v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v21, 16);
        }
        while (v6);
      }

      -[BMSegmentManager _updateSegments](self, "_updateSegments");
    }
    _Block_object_dispose(&v14, 8);

    _Block_object_dispose(v20, 8);
  }
}

void __50__BMSegmentManager_pruneSegmentsToMaxSizeInBytes___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;

  v3 = a2;
  v4 = (void *)MEMORY[0x1AF4163D4]();
  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) >= a1[7])
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "addObject:", v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1[4] + 64), "stringByAppendingPathComponent:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1[4] + 8);
    v11 = 0;
    v7 = objc_msgSend(v6, "sizeOfFileAtPath:error:", v5, &v11);
    v8 = v11;
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) += v7;
    if (v8)
    {
      __biome_log_for_category();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __50__BMSegmentManager_pruneSegmentsToMaxSizeInBytes___block_invoke_cold_2((uint64_t)v8, (uint64_t)v5, v9);

    }
    else if (!v7)
    {
      __biome_log_for_category();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        __50__BMSegmentManager_pruneSegmentsToMaxSizeInBytes___block_invoke_cold_1((uint64_t)v5);

      objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "addObject:", v3);
    }

  }
  objc_autoreleasePoolPop(v4);

}

- (void)pruneSegmentsToMaxAge:(double)a3
{
  double Current;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a3 != 0.0 && a3 != -1.0)
  {
    Current = CFAbsoluteTimeGetCurrent();
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__3;
    v20 = __Block_byref_object_dispose__3;
    v21 = (id)objc_opt_new();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __42__BMSegmentManager_pruneSegmentsToMaxAge___block_invoke;
    v15[3] = &unk_1E55661F8;
    *(double *)&v15[5] = Current - a3;
    v15[4] = &v16;
    -[BMSegmentManager enumerateSegmentsFrom:to:withBlock:](self, "enumerateSegmentsFrom:to:withBlock:", v15, 0.0);
    objc_msgSend((id)v17[5], "removeLastObject");
    if (objc_msgSend((id)v17[5], "count"))
    {
      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      v7 = (id)v17[5];
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v22, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v12;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v12 != v9)
              objc_enumerationMutation(v7);
            -[BMSegmentManager removeSegmentNamed:](self, "removeSegmentNamed:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
          }
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v22, 16);
        }
        while (v8);
      }

      -[BMSegmentManager _updateSegments](self, "_updateSegments");
    }
    _Block_object_dispose(&v16, 8);

  }
}

void __42__BMSegmentManager_pruneSegmentsToMaxAge___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  double v6;
  id v7;

  v7 = a3;
  +[BMSegmentManager timestampFromSegmentName:](BMSegmentManager, "timestampFromSegmentName:");
  if (v6 >= *(double *)(a1 + 40))
    *a4 = 1;
  else
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v7);

}

- (void)openFiles:(id)a3 saveToOpenFiles:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12);
        v14 = (void *)MEMORY[0x1AF4163D4](v9);
        -[BMSegmentManager fileHandleForFile:error:](self, "fileHandleForFile:error:", v13, 0, (_QWORD)v16);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, v13);

        objc_autoreleasePoolPop(v14);
        ++v12;
      }
      while (v10 != v12);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v10 = v9;
    }
    while (v9);
  }

}

- (id)orderedSegmentsInDirectory:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  BMFileManager *fileManager;
  void *v10;
  id v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_opt_new();
  v8 = (void *)MEMORY[0x1AF4163D4]();
  fileManager = self->_fileManager;
  v27 = 0;
  -[BMFileManager contentsOfDirectoryAtPath:error:](fileManager, "contentsOfDirectoryAtPath:error:", v6, &v27);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v27;
  v12 = v11;
  if (v10)
    v13 = v11 == 0;
  else
    v13 = 0;
  if (v13)
  {
    v22 = v8;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v15 = v10;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v24 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          if (objc_msgSend(v20, "characterAtIndex:", 0) - 48 <= 9)
            objc_msgSend(v7, "addObject:", v20);
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v17);
    }

    objc_msgSend(v7, "sortUsingComparator:", &__block_literal_global_0);
    v8 = v22;
  }
  else
  {
    __biome_log_for_category();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[BMSegmentManager orderedSegmentsInDirectory:error:].cold.1((uint64_t)v6, (uint64_t)v12, v14);

  }
  objc_autoreleasePoolPop(v8);
  if (a4 && v12)
    *a4 = objc_retainAutorelease(v12);

  return v7;
}

uint64_t __53__BMSegmentManager_orderedSegmentsInDirectory_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a3;
  v5 = a2;
  v6 = objc_msgSend(v5, "length");
  if (v6 == objc_msgSend(v4, "length"))
  {
    v7 = objc_msgSend(v5, "compare:", v4);

  }
  else
  {
    v8 = objc_msgSend(v5, "length");

    if (v8 < objc_msgSend(v4, "length"))
      v7 = -1;
    else
      v7 = 1;
  }

  return v7;
}

- (id)lastFrameStoreOrCreateWithTimestamp:(double)a3
{
  _PASLock *protectedState;
  id v4;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  v12 = 0;
  protectedState = self->_protectedState;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__BMSegmentManager_lastFrameStoreOrCreateWithTimestamp___block_invoke;
  v6[3] = &unk_1E5566288;
  v6[4] = self;
  v6[5] = &v7;
  *(double *)&v6[6] = a3;
  -[_PASLock runWithLockAcquired:](protectedState, "runWithLockAcquired:", v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __56__BMSegmentManager_lastFrameStoreOrCreateWithTimestamp___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  _QWORD *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  _QWORD *v35;
  uint64_t v36;
  id v37;
  void *v38;
  int ShouldTryAgainLater;
  _QWORD v40[5];
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint8_t buf[4];
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
    v3 = (_QWORD *)v3[2];
  if (objc_msgSend(v3, "count"))
  {
    if (v4)
    {
      v5 = (id)v4[2];
      v6 = (void *)v4[2];
    }
    else
    {
      v5 = 0;
      v6 = 0;
    }
    v7 = v6;
    objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v7, "count") - 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = *(void **)(a1 + 32);
    if (v4)
    {
      v10 = (id)v4[2];
      v11 = (void *)v4[3];
    }
    else
    {
      v10 = 0;
      v11 = 0;
    }
    v12 = v11;
    objc_msgSend(v9, "segmentWithFilename:segmentNames:segmentFileHandles:error:", v8, v10, v12, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

  }
  else if (v4)
  {
    v37 = (id)v4[4];
    if (v37)
    {
      v38 = v37;
      ShouldTryAgainLater = BMStorageErrorShouldTryAgainLater();

      if (ShouldTryAgainLater)
      {
        objc_msgSend(*(id *)(a1 + 32), "updateSegmentsWithGuardedDeviceLockStateData:", v4);
        if (v4[4])
          goto LABEL_22;
      }
    }
  }
  v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (!v16)
  {
    __biome_log_for_category();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A95BD000, v17, OS_LOG_TYPE_INFO, "lastFrameStoreOrCreateWithTimestamp: Attempting to create new frame store", buf, 2u);
    }

    v18 = *(_QWORD *)(a1 + 32);
    v19 = *(void **)(v18 + 64);
    objc_msgSend(*(id *)(v18 + 40), "datastorePath");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v19) = objc_msgSend(v19, "hasPrefix:", v20);

    if ((v19 & 1) == 0)
    {
      __biome_log_for_category();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        __56__BMSegmentManager_lastFrameStoreOrCreateWithTimestamp___block_invoke_cold_1();

    }
    v22 = *(_QWORD *)(a1 + 32);
    v23 = *(void **)(v22 + 64);
    objc_msgSend(*(id *)(v22 + 40), "datastorePath");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "substringFromIndex:", objc_msgSend(v24, "length"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v25, "hasPrefix:", CFSTR("/")))
    {
      objc_msgSend(v25, "substringFromIndex:", 1);
      v26 = objc_claimAutoreleasedReturnValue();

      v25 = (void *)v26;
    }
    objc_msgSend(v25, "substringToIndex:", objc_msgSend(v25, "rangeOfString:", CFSTR("/")));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "datastorePath");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringByAppendingPathComponent:", v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D01D38], "lock");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringByAppendingPathComponent:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    __biome_log_for_category();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v45 = v31;
      _os_log_impl(&dword_1A95BD000, v32, OS_LOG_TYPE_INFO, "lastFrameStoreOrCreateWithTimestamp: Attempting to acquire lockfile: %@", buf, 0xCu);
    }

    v33 = *(_QWORD *)(a1 + 32);
    v34 = *(void **)(v33 + 8);
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __56__BMSegmentManager_lastFrameStoreOrCreateWithTimestamp___block_invoke_45;
    v40[3] = &unk_1E5566260;
    v40[4] = v33;
    v35 = v4;
    v36 = *(_QWORD *)(a1 + 40);
    v41 = v35;
    v42 = v36;
    v43 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v34, "acquireLockfile:andRunBlock:", v31, v40);

    v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 72), v16);
LABEL_22:

}

void __56__BMSegmentManager_lastFrameStoreOrCreateWithTimestamp___block_invoke_45(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  _QWORD *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  _QWORD *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  double v23;
  _QWORD *v24;
  _QWORD *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;

  v2 = a1 + 32;
  objc_msgSend(*(id *)(a1 + 32), "updateSegmentsWithGuardedDeviceLockStateData:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(v2 + 8);
  if (v3)
    v4 = *(void **)(v3 + 16);
  else
    v4 = 0;
  if (objc_msgSend(v4, "count"))
  {
    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
      v6 = *(void **)(v5 + 16);
    else
      v6 = 0;
    v7 = *(_QWORD **)(a1 + 40);
    if (v7)
      v7 = (_QWORD *)v7[2];
    v8 = v7;
    v9 = v6;
    objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v8, "count") - 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = *(void **)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    if (v11)
      v13 = *(void **)(v11 + 16);
    else
      v13 = 0;
    v14 = *(_QWORD **)(a1 + 40);
    if (v14)
      v14 = (_QWORD *)v14[3];
    v15 = v14;
    v16 = v13;
    objc_msgSend(v12, "segmentWithFilename:segmentNames:segmentFileHandles:error:", v10, v16, v15, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v17;

  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v21 = *(void **)(a1 + 32);
    v20 = *(_QWORD *)(a1 + 40);
    if (v20)
      v22 = *(void **)(v20 + 16);
    else
      v22 = 0;
    v23 = *(double *)(a1 + 56);
    v24 = *(_QWORD **)(a1 + 40);
    if (v24)
      v24 = (_QWORD *)v24[3];
    v25 = v24;
    v26 = v22;
    v27 = objc_msgSend(v21, "newFramestoreWithTimestamp:segmentNames:segmentFileHandles:", v26, v25, v23);
    v28 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v29 = *(void **)(v28 + 40);
    *(_QWORD *)(v28 + 40) = v27;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      __biome_log_for_category();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
        __56__BMSegmentManager_lastFrameStoreOrCreateWithTimestamp___block_invoke_45_cold_1((id *)v2);

    }
  }
}

- (id)segmentAfterFrameStore:(id)a3 orCreateSegmentWithTimestamp:(double)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithDouble:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSegmentManager _segmentAfterFrameStore:orCreateSegmentWithTimestamp:direction:](self, "_segmentAfterFrameStore:orCreateSegmentWithTimestamp:direction:", v7, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __83__BMSegmentManager__segmentAfterFrameStore_orCreateSegmentWithTimestamp_direction___block_invoke_47(uint64_t a1)
{
  id *v2;
  id v3;
  uint64_t v4;
  void *v5;
  id *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  uint64_t v18;
  void *v19;
  _QWORD *v20;
  _QWORD *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;

  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "updateSegmentsWithGuardedDeviceLockStateData:", *(_QWORD *)(a1 + 40));
  v3 = *v2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    v5 = *(void **)(v4 + 16);
  else
    v5 = 0;
  v6 = (id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 48);
  v8 = *(_QWORD **)(a1 + 40);
  if (v8)
    v8 = (_QWORD *)v8[3];
  v9 = *(_QWORD *)(a1 + 72);
  v10 = v8;
  v11 = v5;
  objc_msgSend(v3, "nextSegmentAfterFrameStore:segmentNames:segmentFileHandles:direction:", v7, v11, v10, v9);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    v15 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 56), "doubleValue");
    v17 = v16;
    v18 = *(_QWORD *)(a1 + 40);
    if (v18)
      v19 = *(void **)(v18 + 16);
    else
      v19 = 0;
    v20 = *(_QWORD **)(a1 + 40);
    if (v20)
      v20 = (_QWORD *)v20[3];
    v21 = v20;
    v22 = v19;
    v23 = objc_msgSend(v15, "newFramestoreWithTimestamp:segmentNames:segmentFileHandles:", v22, v21, v17);
    v24 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v25 = *(void **)(v24 + 40);
    *(_QWORD *)(v24 + 40) = v23;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    {
      __biome_log_for_category();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
        __83__BMSegmentManager__segmentAfterFrameStore_orCreateSegmentWithTimestamp_direction___block_invoke_47_cold_1(v6, v2, v26);

    }
  }
}

+ (unint64_t)sizeOfNewFrameStoreInBytesFromNonPagedSize:(unint64_t)a3 storeLocationOptions:(int64_t)a4
{
  unint64_t v4;
  unint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;

  if (a3 > 0x100000 && (a4 & 2) != 0)
    v4 = 0x100000;
  else
    v4 = a3;
  if (((v4 > 0x100000) & (a4 >> 2)) != 0)
    v5 = 0x100000;
  else
    v5 = v4;
  v6 = NSPageSize();
  v7 = NSPageSize();
  v8 = v5 / v7;
  if (v7 > v5)
    v8 = 1;
  return v8 * v6;
}

- (id)newFramestoreWithTimestamp:(double)a3 segmentNames:(id)a4 segmentFileHandles:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  BMFileManager *fileManager;
  NSObject *v17;
  uint64_t v18;
  BMFileManager *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  _BOOL4 v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  void *v31;
  char v32;
  id v33[2];
  id v34;

  v8 = a4;
  v9 = a5;
  objc_msgSend((id)objc_opt_class(), "segmentNameFromTimestamp:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11 || (v12 = objc_msgSend(v10, "longLongValue"), v12 >= objc_msgSend(v11, "longLongValue")))
  {
    v15 = objc_msgSend(MEMORY[0x1E0D01CF0], "biomeProtectionClassToOSProtectionClass:", -[BMStoreConfig protectionClass](self->_config, "protectionClass"));
    fileManager = self->_fileManager;
    v34 = 0;
    -[BMFileManager temporaryFileHandleWithProtection:error:](fileManager, "temporaryFileHandleWithProtection:error:", v15, &v34);
    v13 = objc_claimAutoreleasedReturnValue();
    v17 = v34;
    if (v13)
    {
      v32 = -[BMStoreConfig storeLocationOption](self->_config, "storeLocationOption");
      if (+[BMFrameStore writeEmptyFrameStoreWithFileHandle:fileSize:datastoreVersion:](BMFrameStore, "writeEmptyFrameStoreWithFileHandle:fileSize:datastoreVersion:", v13, objc_msgSend((id)objc_opt_class(), "sizeOfNewFrameStoreInBytesFromNonPagedSize:storeLocationOptions:", -[BMStoreConfig segmentSize](self->_config, "segmentSize"), -[BMStoreConfig storeLocationOption](self->_config, "storeLocationOption")), -[BMStoreConfig configDatastoreVersion](self->_config, "configDatastoreVersion")))
      {
        -[NSString stringByAppendingPathComponent:](self->_path, "stringByAppendingPathComponent:", v10);
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = self->_fileManager;
        v33[1] = v17;
        v31 = (void *)v18;
        -[BMFileManager replaceFileAtPath:withFileHandle:protection:error:](v19, "replaceFileAtPath:withFileHandle:protection:error:");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v17;

        if (v20)
        {
          v22 = v20;
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v20, v10);
          v33[0] = v21;
          -[BMSegmentManager segmentWithFilename:segmentNames:segmentFileHandles:error:](self, "segmentWithFilename:segmentNames:segmentFileHandles:error:", v10, v8, v9, v33);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v33[0];

        }
        else
        {
          v22 = 0;
          v17 = v21;
        }
        -[BMStoreConfig pruningPolicy](self->_config, "pruningPolicy");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v26;
        if ((v32 & 2) != 0)
        {
          v28 = BMTombstoneSegmentMaxStreamSize(v26);
        }
        else
        {
          if (!objc_msgSend(v26, "pruneOnAccess"))
            goto LABEL_27;
          v28 = objc_msgSend(v27, "maxStreamSize");
        }
        -[BMSegmentManager pruneSegmentsToMaxSizeInBytes:](self, "pruneSegmentsToMaxSizeInBytes:", v28);
LABEL_27:
        if (objc_msgSend(v27, "pruneOnAccess"))
        {
          objc_msgSend(v27, "maxAge");
          -[BMSegmentManager pruneSegmentsToMaxAge:](self, "pruneSegmentsToMaxAge:");
        }
        if (!v22 || v17)
        {
          __biome_log_for_category();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            -[BMSegmentManager newFramestoreWithTimestamp:segmentNames:segmentFileHandles:].cold.3((uint64_t)v31, (uint64_t)v17, v29);
        }
        else
        {
          if (v20)
          {
            v14 = v20;
LABEL_38:

            goto LABEL_39;
          }
          __biome_log_for_category();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            -[BMSegmentManager newFramestoreWithTimestamp:segmentNames:segmentFileHandles:].cold.4((uint64_t)v31, v29);
        }

        v14 = 0;
        goto LABEL_38;
      }
      __biome_log_for_category();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[BMSegmentManager newFramestoreWithTimestamp:segmentNames:segmentFileHandles:].cold.5();

    }
    else
    {
      __biome_log_for_category();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
      if (!v17)
      {
        if (v24)
          -[BMSegmentManager newFramestoreWithTimestamp:segmentNames:segmentFileHandles:].cold.1();
        v14 = 0;
        v17 = v23;
        goto LABEL_39;
      }
      if (v24)
        -[BMSegmentManager newFramestoreWithTimestamp:segmentNames:segmentFileHandles:].cold.2();

    }
    v14 = 0;
LABEL_39:

    goto LABEL_40;
  }
  __biome_log_for_category();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    -[BMSegmentManager newFramestoreWithTimestamp:segmentNames:segmentFileHandles:].cold.6();
  v14 = 0;
LABEL_40:

  return v14;
}

- (BOOL)removeSegmentNamed:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  _PASLock *protectedState;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _PASLock *v13;
  id v14;
  BMFileManager *fileManager;
  char v16;
  id v17;
  NSObject *v18;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[5];
  id v24;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[BMSegmentManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__3;
    v29 = __Block_byref_object_dispose__3;
    v30 = 0;
    protectedState = self->_protectedState;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __39__BMSegmentManager_removeSegmentNamed___block_invoke;
    v23[3] = &unk_1E5566350;
    p_buf = &buf;
    v23[4] = self;
    v8 = v4;
    v24 = v8;
    -[_PASLock runWithLockAcquired:](protectedState, "runWithLockAcquired:", v23);
    if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
    {
      -[BMSegmentManager delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "segmentManager:willDeleteSegmentName:frameStore:", self, v8, *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));

    }
    _Block_object_dispose(&buf, 8);

  }
  -[NSString stringByAppendingPathComponent:](self->_path, "stringByAppendingPathComponent:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __biome_log_for_category();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0D01D10], "privacyPathname:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v12;
    _os_log_impl(&dword_1A95BD000, v11, OS_LOG_TYPE_DEFAULT, "Removing frame store: %{public}@", (uint8_t *)&buf, 0xCu);

  }
  v13 = self->_protectedState;
  v21[0] = v6;
  v21[1] = 3221225472;
  v21[2] = __39__BMSegmentManager_removeSegmentNamed___block_invoke_51;
  v21[3] = &unk_1E5566130;
  v14 = v4;
  v22 = v14;
  -[_PASLock runWithLockAcquired:](v13, "runWithLockAcquired:", v21);
  fileManager = self->_fileManager;
  v20 = 0;
  v16 = -[BMFileManager removeFileAtPath:error:](fileManager, "removeFileAtPath:error:", v10, &v20);
  v17 = v20;
  if (!v17)
    v16 = 1;
  if ((v16 & 1) == 0)
  {
    __biome_log_for_category();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[BMSegmentManager removeSegmentNamed:].cold.1((uint64_t)v10, v18);

  }
  return v16;
}

void __39__BMSegmentManager_removeSegmentNamed___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v3 = (void *)a1[4];
  v4 = a1[5];
  if (a2)
  {
    v11 = *(id *)(a2 + 16);
    v6 = *(void **)(a2 + 24);
  }
  else
  {
    v11 = 0;
    v6 = 0;
  }
  v7 = v6;
  objc_msgSend(v3, "segmentWithFilename:segmentNames:segmentFileHandles:error:", v4, v11, v7, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1[6] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

void __39__BMSegmentManager_removeSegmentNamed___block_invoke_51(uint64_t a1, void *a2)
{
  _QWORD *v3;
  void *v4;
  _QWORD *v5;

  v3 = a2;
  v5 = v3;
  if (v3)
    v3 = (_QWORD *)v3[2];
  objc_msgSend(v3, "removeObject:", *(_QWORD *)(a1 + 32));
  v4 = v5;
  if (v5)
    v4 = (void *)v5[3];
  objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 32));

}

- (void)reverseEnumerateSegmentsFrom:(double)a3 to:(double)a4 withBlock:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__BMSegmentManager_reverseEnumerateSegmentsFrom_to_withBlock___block_invoke;
  v10[3] = &unk_1E5566378;
  v10[4] = self;
  v11 = v8;
  v9 = v8;
  -[BMSegmentManager reverseEnumerateSegmentsNamesFrom:to:withBlock:](self, "reverseEnumerateSegmentsNamesFrom:to:withBlock:", v10, a3, a4);

}

void __62__BMSegmentManager_reverseEnumerateSegmentsFrom_to_withBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v11 = 0;
  objc_msgSend(v4, "segmentWithFilename:error:", v3, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;
  if (v6)
  {
    __biome_log_for_category();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = (void *)MEMORY[0x1E0D01D10];
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "stringByAppendingPathComponent:", v3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "privacyPathname:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v13 = v10;
      v14 = 2114;
      v15 = v6;
      _os_log_error_impl(&dword_1A95BD000, v7, OS_LOG_TYPE_ERROR, "Failed to open frame store %{public}@ during reverse enumeration, error: %{public}@", buf, 0x16u);

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)reverseEnumerateSegmentsNamesFrom:(double)a3 to:(double)a4 withBlock:(id)a5
{
  void (**v8)(id, void *, _BYTE *);
  unint64_t v10;
  NSObject *v11;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  BOOL v19;
  _BYTE v20[24];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(id, void *, _BYTE *))a5;
  if (a3 > a4 && a4 != -1.0)
  {
    __biome_log_for_category();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[BMSegmentManager enumerateSegmentsNamesFrom:to:withBlock:].cold.1();
    goto LABEL_28;
  }
  -[BMSegmentManager segmentNames](self, "segmentNames");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!-[NSObject count](v11, "count"))
  {
    __biome_log_for_category();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = (void *)MEMORY[0x1E0D01D10];
      -[BMSegmentManager path](self, "path");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "privacyPathname:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v20 = 138412290;
      *(_QWORD *)&v20[4] = v16;
      _os_log_impl(&dword_1A95BD000, v13, OS_LOG_TYPE_INFO, "No segments to enumerate: %@", v20, 0xCu);

    }
    goto LABEL_27;
  }
  if (a3 == 0.0)
    v10 = 0;
  else
    v10 = objc_msgSend((id)objc_opt_class(), "indexOfSegmentContainingEventTime:fromSegments:", v11, a3);
  if (a4 == -1.0)
    v17 = -[NSObject count](v11, "count") - 1;
  else
    v17 = objc_msgSend((id)objc_opt_class(), "indexOfSegmentContainingEventTime:fromSegments:", v11, a4);
  if (v10 >= -[NSObject count](v11, "count") || v17 >= -[NSObject count](v11, "count"))
  {
    __biome_log_for_category();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[BMSegmentManager reverseEnumerateSegmentsNamesFrom:to:withBlock:].cold.2();
LABEL_27:

    goto LABEL_28;
  }
  do
  {
    v20[0] = 0;
    -[NSObject objectAtIndexedSubscript:](v11, "objectAtIndexedSubscript:", v17, *(_QWORD *)v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v18, v20);

    if (v20[0])
      v19 = 1;
    else
      v19 = v10 == v17;
    --v17;
  }
  while (!v19);
LABEL_28:

}

- (void)handleDeviceUnlock
{
  _PASLock *protectedState;
  _QWORD v3[5];

  protectedState = self->_protectedState;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__BMSegmentManager_handleDeviceUnlock__block_invoke;
  v3[3] = &unk_1E5566130;
  v3[4] = self;
  -[_PASLock runWithLockAcquired:](protectedState, "runWithLockAcquired:", v3);
}

uint64_t __38__BMSegmentManager_handleDeviceUnlock__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    *(_BYTE *)(a2 + 8) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "updateSegmentsWithGuardedDeviceLockStateData:", a2);
}

- (void)handleDeviceLockingCX
{
  _PASLock *protectedState;
  _QWORD v3[5];

  protectedState = self->_protectedState;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__BMSegmentManager_handleDeviceLockingCX__block_invoke;
  v3[3] = &unk_1E5566130;
  v3[4] = self;
  -[_PASLock runWithLockAcquired:](protectedState, "runWithLockAcquired:", v3);
}

void __41__BMSegmentManager_handleDeviceLockingCX__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  _BYTE *v4;

  v4 = a2;
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "protectionClass");
  if (v4 && v3 == 5)
    v4[8] = 0;

}

- (void)handleDeviceLocking
{
  _PASLock *protectedState;
  _QWORD v3[5];

  protectedState = self->_protectedState;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39__BMSegmentManager_handleDeviceLocking__block_invoke;
  v3[3] = &unk_1E5566130;
  v3[4] = self;
  -[_PASLock runWithLockAcquired:](protectedState, "runWithLockAcquired:", v3);
}

void __39__BMSegmentManager_handleDeviceLocking__block_invoke(uint64_t a1, void *a2)
{
  _BYTE *v3;
  char v4;
  int v5;
  _BYTE *v6;

  v6 = a2;
  if (objc_msgSend(MEMORY[0x1E0D01CF0], "losesReadAccessOnLock:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "protectionClass")))
  {
    v3 = v6;
    if (v6)
    {
      v4 = 0;
LABEL_7:
      v3[8] = v4;
    }
  }
  else
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "shouldCacheFileDescriptors");
    v3 = v6;
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "updateSegmentsWithGuardedDeviceLockStateData:", v6);
      v3 = v6;
      if (v6)
      {
        v4 = 1;
        goto LABEL_7;
      }
    }
  }

}

- (int64_t)cachingOptionsForFileHandleWithAttributes:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;

  v3 = a3;
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D01D38], "localDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqual:", v6) & 1) != 0)
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0D01D38], "remoteDevices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", v7))
  {
LABEL_5:

LABEL_6:
    v9 = 1;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0D01D38], "lock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", v8))
  {

    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0D01D38], "tmp");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v5, "isEqual:", v11);

  if ((v12 & 1) != 0)
  {
    v9 = 1;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0D01D38], "metadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v5, "isEqual:", v13);

  if ((v14 & 1) != 0)
  {
    v9 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v3, "path");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "componentsSeparatedByString:", CFSTR("/"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v6, "count") < 2)
  {
    v9 = 2;
  }
  else
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v6, "count") - 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D01D38], "remoteDevices");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if (v18)
      v9 = 1;
    else
      v9 = 2;
  }
LABEL_7:

LABEL_8:
  return v9;
}

- (BMSegmentManagerDelegate)delegate
{
  return (BMSegmentManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

void __68__BMSegmentManager_initWithDirectory_fileManager_permission_config___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5;
  unint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(*(_QWORD *)a1 + 64);
  v6 = objc_msgSend(*(id *)(*(_QWORD *)a1 + 40), "protectionClass");
  if (v6 > 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BMDataProtectionClassUnknown(%lu)"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = *(&off_1E5566398 + v6);
  }
  *(_DWORD *)buf = 138413058;
  v9 = v5;
  v10 = 2112;
  v11 = a2;
  v12 = 2112;
  v13 = v7;
  v14 = 1024;
  v15 = objc_msgSend(MEMORY[0x1E0D81590], "isUnlocked");
  _os_log_error_impl(&dword_1A95BD000, a3, OS_LOG_TYPE_ERROR, "Can't create stream folder at %@ with error %@, protectionClass: %@ isUnlocked: %hhd", buf, 0x26u);

}

void __50__BMSegmentManager_pruneSegmentsToMaxSizeInBytes___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x1E0D01D10], "privacyPathname:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_8_1(&dword_1A95BD000, v2, v3, "Segment %@ is getting removed. Invalid file size of 0 bytes", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_20();
}

void __50__BMSegmentManager_pruneSegmentsToMaxSizeInBytes___block_invoke_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D01D10], "privacyPathname:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = a1;
  v9 = 2112;
  v10 = v5;
  OUTLINED_FUNCTION_6_0(&dword_1A95BD000, a3, v6, "Failed to get size of file error=%{public}@ for segment %@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_2_0();
}

- (void)fileHandleForFile:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_0(&dword_1A95BD000, v0, v1, "Failed to create new framestore with nil filename", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)orderedSegmentsInDirectory:(NSObject *)a3 error:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D01D10], "privacyPathname:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_6_0(&dword_1A95BD000, a3, v5, "Failed to get contents of directory: %{public}@, error: %{error}@", v6);

  OUTLINED_FUNCTION_2_0();
}

void __56__BMSegmentManager_lastFrameStoreOrCreateWithTimestamp___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_0_1(&dword_1A95BD000, v0, v1, "lastFrameStoreOrCreateWithTimestamp: Assertion Failed: [_path hasPrefix:_config.datastorePath]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __56__BMSegmentManager_lastFrameStoreOrCreateWithTimestamp___block_invoke_45_cold_1(id *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v1 = (void *)MEMORY[0x1E0D01D10];
  objc_msgSend(*a1, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "privacyPathname:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_8_1(&dword_1A95BD000, v4, v5, "Unable to lastFrameStoreOrCreateWithTimestamp and   creation also failed for %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

void __83__BMSegmentManager__segmentAfterFrameStore_orCreateSegmentWithTimestamp_direction___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_0_1(&dword_1A95BD000, v0, v1, "_segmentAfterFrameStore: Assertion Failed: [_path hasPrefix:_config.datastorePath]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __83__BMSegmentManager__segmentAfterFrameStore_orCreateSegmentWithTimestamp_direction___block_invoke_47_cold_1(id *a1, id *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "segmentName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D01D10];
  objc_msgSend(*a2, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "privacyPathname:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412546;
  v10 = v5;
  v11 = 2112;
  v12 = v8;
  _os_log_fault_impl(&dword_1A95BD000, a3, OS_LOG_TYPE_FAULT, "Unable to _segmentAfterFrameStore and creation also failed for prevStore:%@ in %@", (uint8_t *)&v9, 0x16u);

  OUTLINED_FUNCTION_2_0();
}

- (void)newFramestoreWithTimestamp:segmentNames:segmentFileHandles:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_0(&dword_1A95BD000, v0, v1, "Failed to create new file handle, no error reported", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)newFramestoreWithTimestamp:segmentNames:segmentFileHandles:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_1(&dword_1A95BD000, v0, v1, "Failed to create new file handle with error, %@", v2);
  OUTLINED_FUNCTION_17();
}

- (void)newFramestoreWithTimestamp:(uint64_t)a1 segmentNames:(uint64_t)a2 segmentFileHandles:(NSObject *)a3 .cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D01D10], "privacyPathname:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_6_0(&dword_1A95BD000, a3, v5, "Failed to move temporary segment: %@ into segment list with error, %@", v6);

  OUTLINED_FUNCTION_2_0();
}

- (void)newFramestoreWithTimestamp:(uint64_t)a1 segmentNames:(NSObject *)a2 segmentFileHandles:.cold.4(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D01D10], "privacyPathname:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_1(&dword_1A95BD000, a2, v4, "Failed to create new segment file %@ without error code", v5);

  OUTLINED_FUNCTION_20();
}

- (void)newFramestoreWithTimestamp:segmentNames:segmentFileHandles:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_0(&dword_1A95BD000, v0, v1, "Failed to create new segment", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)newFramestoreWithTimestamp:segmentNames:segmentFileHandles:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_0(&dword_1A95BD000, v0, v1, "Time traveling is not allowed. The last segment in the directory has a greater timestamp than the current timestamp.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)segmentWithFilename:(void *)a1 segmentNames:(NSObject *)a2 segmentFileHandles:error:.cold.2(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D01D10];
  objc_msgSend(a1, "attributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "privacyPathname:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_1(&dword_1A95BD000, a2, v7, "Failed to instantiate framestore with path: %{public}@.", v8);

  OUTLINED_FUNCTION_2_0();
}

void __47__BMSegmentManager_segmentContainingTimestamp___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_0_1(&dword_1A95BD000, v0, v1, "Received an index beyond _segmentNames in newEnumeratorFromStartTime:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)removeSegmentNamed:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  int v4;
  int v5;
  void *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D01D10], "privacyPathname:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *__error();
  v5 = 138543618;
  v6 = v3;
  v7 = 1026;
  v8 = v4;
  _os_log_error_impl(&dword_1A95BD000, a2, OS_LOG_TYPE_ERROR, "Unable to delete frame store (%{public}@). Error: %{public, darwin.errno}d", (uint8_t *)&v5, 0x12u);

  OUTLINED_FUNCTION_20();
}

- (void)enumerateSegmentsNamesFrom:to:withBlock:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_6_0(&dword_1A95BD000, v0, v1, "Start date (%lf) is greater than end date (%lf)", v2);
  OUTLINED_FUNCTION_17();
}

- (void)enumerateSegmentsNamesFrom:to:withBlock:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_0(&dword_1A95BD000, v0, v1, "Received an index beyond _segmentNames in enumerateSegmentsNamesFrom:to:withBlock:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)reverseEnumerateSegmentsNamesFrom:to:withBlock:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_0(&dword_1A95BD000, v0, v1, "Received an index beyond _segmentNames in reverseEnumerateSegmentsNamesFrom:to:withBlock:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
