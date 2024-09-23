@implementation _MPStoreSocialTransientState

- (_MPStoreSocialTransientState)initWithPerson:(id)a3
{
  id v4;
  _MPStoreSocialTransientState *v5;
  void *v6;
  uint64_t v7;
  MPModelSocialPerson *person;
  dispatch_queue_t v9;
  OS_dispatch_queue *accessQueue;
  dispatch_queue_t v11;
  OS_dispatch_queue *calloutQueue;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_MPStoreSocialTransientState;
  v5 = -[_MPStoreSocialTransientState init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "identifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "copyWithIdentifiers:block:", v6, &__block_literal_global_47108);
    person = v5->_person;
    v5->_person = (MPModelSocialPerson *)v7;

    v5->_followState = 0;
    v5->_followPendingRequestState = 0;
    v9 = dispatch_queue_create("com.apple.MediaPlayer._MPStoreSocialTransientState.accessQueue", MEMORY[0x1E0C80D50]);
    accessQueue = v5->_accessQueue;
    v5->_accessQueue = (OS_dispatch_queue *)v9;

    v11 = dispatch_queue_create("com.apple.MediaPlayer._MPStoreSocialTransientState.calloutQueue", 0);
    calloutQueue = v5->_calloutQueue;
    v5->_calloutQueue = (OS_dispatch_queue *)v11;

  }
  return v5;
}

- (int64_t)followState
{
  NSObject *accessQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43___MPStoreSocialTransientState_followState__block_invoke;
  v5[3] = &unk_1E3163580;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)newOperationForTransientFollowState:(int64_t)a3 completion:(id)a4
{
  id v6;
  __objc2_class *v7;
  MPStoreSocialPendingFollowRequestOperationDataSource *v8;
  MPStoreSocialPendingFollowRequestOperationDataSource *v9;
  NSObject *accessQueue;
  uint64_t v11;
  MPStoreSocialRequestOperation *v12;
  NSObject *v13;
  NSObject *v14;
  MPStoreSocialRequestOperation *v15;
  MPStoreSocialRequestOperation *v16;
  MPStoreSocialRequestOperation *v17;
  _QWORD v19[5];
  MPStoreSocialRequestOperation *v20;
  int64_t v21;
  _QWORD v22[6];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[5];
  id v33;
  _QWORD *v34;
  id v35;
  id v36[2];
  id from;
  id location;
  _QWORD block[6];
  _QWORD v40[5];

  v6 = a4;
  switch(a3)
  {
    case 1:
    case 3:
      v7 = MPStoreSocialFollowOperationDataSource;
      goto LABEL_7;
    case 2:
      v8 = -[MPStoreSocialPendingFollowRequestOperationDataSource initWithAction:]([MPStoreSocialPendingFollowRequestOperationDataSource alloc], "initWithAction:", 2);
      goto LABEL_8;
    case 4:
      v7 = MPStoreSocialUnfollowOperationDataSource;
      goto LABEL_7;
    case 5:
      v7 = MPStoreSocialBlockOperationDataSource;
      goto LABEL_7;
    case 6:
      v7 = MPStoreSocialUnblockOperationDataSource;
LABEL_7:
      v8 = (MPStoreSocialPendingFollowRequestOperationDataSource *)objc_alloc_init(v7);
LABEL_8:
      v9 = v8;
      if (!v8)
        goto LABEL_12;
      -[MPStoreSocialPendingFollowRequestOperationDataSource setPerson:](v8, "setPerson:", self->_person);
      v40[0] = 0;
      v40[1] = v40;
      v40[2] = 0x2020000000;
      v40[3] = 0;
      accessQueue = self->_accessQueue;
      v11 = MEMORY[0x1E0C809B0];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __79___MPStoreSocialTransientState_newOperationForTransientFollowState_completion___block_invoke;
      block[3] = &unk_1E3163580;
      block[4] = self;
      block[5] = v40;
      dispatch_sync(accessQueue, block);
      v12 = -[MPStoreSocialRequestOperation initWithDataSource:]([MPStoreSocialRequestOperation alloc], "initWithDataSource:", v9);
      objc_initWeak(&location, self);
      objc_initWeak(&from, v12);
      v32[0] = v11;
      v32[1] = 3221225472;
      v32[2] = __79___MPStoreSocialTransientState_newOperationForTransientFollowState_completion___block_invoke_2;
      v32[3] = &unk_1E3162640;
      objc_copyWeak(&v35, &location);
      objc_copyWeak(v36, &from);
      v34 = v40;
      v32[4] = self;
      v33 = v6;
      v36[1] = (id)a3;
      -[MPStoreSocialRequestOperation setResponseHandler:](v12, "setResponseHandler:", v32);
      v29[0] = v11;
      v29[1] = 3221225472;
      v29[2] = __79___MPStoreSocialTransientState_newOperationForTransientFollowState_completion___block_invoke_6;
      v29[3] = &unk_1E3162668;
      objc_copyWeak(&v30, &location);
      objc_copyWeak(&v31, &from);
      -[MPStoreSocialRequestOperation setCompletionBlock:](v12, "setCompletionBlock:", v29);
      v23 = 0;
      v24 = &v23;
      v25 = 0x3032000000;
      v26 = __Block_byref_object_copy__47057;
      v27 = __Block_byref_object_dispose__47058;
      v28 = 0;
      v13 = self->_accessQueue;
      v22[0] = v11;
      v22[1] = 3221225472;
      v22[2] = __79___MPStoreSocialTransientState_newOperationForTransientFollowState_completion___block_invoke_8;
      v22[3] = &unk_1E3163580;
      v22[4] = self;
      v22[5] = &v23;
      dispatch_sync(v13, v22);
      if (v24[5])
        -[MPStoreSocialRequestOperation addDependency:](v12, "addDependency:");
      v14 = self->_accessQueue;
      v19[0] = v11;
      v19[1] = 3221225472;
      v19[2] = __79___MPStoreSocialTransientState_newOperationForTransientFollowState_completion___block_invoke_9;
      v19[3] = &unk_1E3162690;
      v19[4] = self;
      v21 = a3;
      v15 = v12;
      v20 = v15;
      dispatch_barrier_async(v14, v19);
      v16 = v20;
      v17 = v15;

      _Block_object_dispose(&v23, 8);
      objc_destroyWeak(&v31);
      objc_destroyWeak(&v30);

      objc_destroyWeak(v36);
      objc_destroyWeak(&v35);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
      _Block_object_dispose(v40, 8);

      break;
    default:
LABEL_12:
      -[_MPStoreSocialTransientState _endIfNeeded](self, "_endIfNeeded");
      v17 = 0;
      break;
  }

  return v17;
}

- (int64_t)followPendingRequestState
{
  NSObject *accessQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57___MPStoreSocialTransientState_followPendingRequestState__block_invoke;
  v5[3] = &unk_1E3163580;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)newOperationForTransientFollowPendingRequestState:(int64_t)a3 completion:(id)a4
{
  id v6;
  int64_t v7;
  MPStoreSocialPendingFollowRequestOperationDataSource *v8;
  MPStoreSocialPendingFollowRequestOperationDataSource *v9;
  NSObject *accessQueue;
  uint64_t v11;
  MPStoreSocialRequestOperation *v12;
  NSObject *v13;
  NSObject *v14;
  MPStoreSocialRequestOperation *v15;
  MPStoreSocialRequestOperation *v16;
  MPStoreSocialRequestOperation *v17;
  _QWORD v19[5];
  MPStoreSocialRequestOperation *v20;
  int64_t v21;
  _QWORD v22[6];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[5];
  id v33;
  _QWORD *v34;
  id v35;
  id v36[2];
  id from;
  id location;
  _QWORD block[6];
  _QWORD v40[5];

  v6 = a4;
  v7 = a3;
  if (a3 != 1)
  {
    if (a3 != 2)
    {
LABEL_8:
      -[_MPStoreSocialTransientState _endIfNeeded](self, "_endIfNeeded");
      v17 = 0;
      goto LABEL_9;
    }
    v7 = 3;
  }
  v8 = -[MPStoreSocialPendingFollowRequestOperationDataSource initWithAction:]([MPStoreSocialPendingFollowRequestOperationDataSource alloc], "initWithAction:", v7);
  if (!v8)
    goto LABEL_8;
  v9 = v8;
  -[MPStoreSocialPendingFollowRequestOperationDataSource setPerson:](v8, "setPerson:", self->_person);
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  v40[3] = 0;
  accessQueue = self->_accessQueue;
  v11 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93___MPStoreSocialTransientState_newOperationForTransientFollowPendingRequestState_completion___block_invoke;
  block[3] = &unk_1E3163580;
  block[4] = self;
  block[5] = v40;
  dispatch_sync(accessQueue, block);
  v12 = -[MPStoreSocialRequestOperation initWithDataSource:]([MPStoreSocialRequestOperation alloc], "initWithDataSource:", v9);
  objc_initWeak(&location, self);
  objc_initWeak(&from, v12);
  v32[0] = v11;
  v32[1] = 3221225472;
  v32[2] = __93___MPStoreSocialTransientState_newOperationForTransientFollowPendingRequestState_completion___block_invoke_2;
  v32[3] = &unk_1E3162640;
  objc_copyWeak(&v35, &location);
  objc_copyWeak(v36, &from);
  v34 = v40;
  v32[4] = self;
  v33 = v6;
  v36[1] = (id)a3;
  -[MPStoreSocialRequestOperation setResponseHandler:](v12, "setResponseHandler:", v32);
  v29[0] = v11;
  v29[1] = 3221225472;
  v29[2] = __93___MPStoreSocialTransientState_newOperationForTransientFollowPendingRequestState_completion___block_invoke_6;
  v29[3] = &unk_1E3162668;
  objc_copyWeak(&v30, &location);
  objc_copyWeak(&v31, &from);
  -[MPStoreSocialRequestOperation setCompletionBlock:](v12, "setCompletionBlock:", v29);
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__47057;
  v27 = __Block_byref_object_dispose__47058;
  v28 = 0;
  v13 = self->_accessQueue;
  v22[0] = v11;
  v22[1] = 3221225472;
  v22[2] = __93___MPStoreSocialTransientState_newOperationForTransientFollowPendingRequestState_completion___block_invoke_8;
  v22[3] = &unk_1E3163580;
  v22[4] = self;
  v22[5] = &v23;
  dispatch_sync(v13, v22);
  if (v24[5])
    -[MPStoreSocialRequestOperation addDependency:](v12, "addDependency:");
  v14 = self->_accessQueue;
  v19[0] = v11;
  v19[1] = 3221225472;
  v19[2] = __93___MPStoreSocialTransientState_newOperationForTransientFollowPendingRequestState_completion___block_invoke_9;
  v19[3] = &unk_1E3162690;
  v19[4] = self;
  v21 = a3;
  v15 = v12;
  v20 = v15;
  dispatch_barrier_async(v14, v19);
  v16 = v20;
  v17 = v15;

  _Block_object_dispose(&v23, 8);
  objc_destroyWeak(&v31);
  objc_destroyWeak(&v30);

  objc_destroyWeak(v36);
  objc_destroyWeak(&v35);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
  _Block_object_dispose(v40, 8);

LABEL_9:
  return v17;
}

- (void)_endIfNeeded
{
  NSObject *accessQueue;
  uint64_t v4;
  _QWORD block[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__75;
  v14 = __Block_byref_object_dispose__76;
  v15 = 0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44___MPStoreSocialTransientState__endIfNeeded__block_invoke;
  block[3] = &unk_1E31626B8;
  block[4] = self;
  block[5] = &v10;
  block[6] = &v6;
  dispatch_sync(accessQueue, block);
  v4 = v11[5];
  if (v4 && *((_BYTE *)v7 + 24))
    (*(void (**)(uint64_t, _MPStoreSocialTransientState *))(v4 + 16))(v4, self);
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v10, 8);

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "person");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "universalStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "socialProfileID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPModelObject identifiers](self->_person, "identifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "universalStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "socialProfileID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v8, "isEqualToString:", v11);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;

  -[MPModelObject identifiers](self->_person, "identifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "universalStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "socialProfileID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");

  return v5;
}

- (MPModelSocialPerson)person
{
  return self->_person;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_latestFollowPendingRequestOperation, 0);
  objc_storeStrong((id *)&self->_latestFollowOperation, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
