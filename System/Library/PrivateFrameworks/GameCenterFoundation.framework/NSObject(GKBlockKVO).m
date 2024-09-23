@implementation NSObject(GKBlockKVO)

- (id)_gkAddObserverForKeyPath:()GKBlockKVO options:withBlock:
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v8 = a3;
  v9 = a5;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__16;
  v35 = __Block_byref_object_dispose__16;
  v36 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__16;
  v29 = __Block_byref_object_dispose__16;
  v30 = 0;
  GKObserverMutationQueueCreatingIfNecessary();
  v10 = objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __67__NSObject_GKBlockKVO___gkAddObserverForKeyPath_options_withBlock___block_invoke;
  v18 = &unk_1E75B7C10;
  v19 = a1;
  v22 = &v25;
  v11 = v8;
  v20 = v11;
  v24 = a4;
  v12 = v9;
  v21 = v12;
  v23 = &v31;
  dispatch_sync(v10, &v15);

  objc_msgSend((id)v26[5], "startObserving", v15, v16, v17, v18, v19);
  v13 = (id)v32[5];

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v13;
}

- (void)_gkRemoveObserverWithBlockToken:()GKBlockKVO
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  GKObserverMutationQueueCreatingIfNecessary();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__NSObject_GKBlockKVO___gkRemoveObserverWithBlockToken___block_invoke;
  block[3] = &unk_1E75B1A28;
  block[4] = a1;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

@end
