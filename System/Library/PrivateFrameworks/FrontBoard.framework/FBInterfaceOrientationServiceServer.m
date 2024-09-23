@implementation FBInterfaceOrientationServiceServer

- (id)_prerequisiteMilestones
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0D22E88]);
}

- (void)noteDidReceiveMessage:(id)a3 withType:(int64_t)a4 fromClient:(id)a5
{
  id v8;
  id v9;

  v9 = a3;
  v8 = a5;
  if (a4 == 1)
  {
    -[FBInterfaceOrientationServiceServer _queue_handleRequestActiveOrientation:fromClient:](self, "_queue_handleRequestActiveOrientation:fromClient:", v9, v8);
  }
  else if (!a4)
  {
    -[FBInterfaceOrientationServiceServer _queue_handleRegisterOrientationInterest:fromClient:](self, "_queue_handleRegisterOrientationInterest:fromClient:", v9, v8);
  }

}

- (void)_queue_handleRequestActiveOrientation:(id)a3 fromClient:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __88__FBInterfaceOrientationServiceServer__queue_handleRequestActiveOrientation_fromClient___block_invoke;
  v4[3] = &unk_1E4A11FF8;
  v4[4] = self;
  objc_msgSend(a3, "sendReplyMessageWithPacker:", v4, a4);
}

- (void)_queue_handleRegisterOrientationInterest:(id)a3 fromClient:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "payload");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[FBInterfaceOrientationServiceServer _queue_updateInterest:forClient:withMessage:](self, "_queue_updateInterest:forClient:withMessage:", xpc_dictionary_get_uint64(v8, (const char *)*MEMORY[0x1E0D22DD8]), v6, v7);

}

- (void)noteClientDidConnect:(id)a3 withMessage:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "payload");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[FBInterfaceOrientationServiceServer _queue_updateInterest:forClient:withMessage:](self, "_queue_updateInterest:forClient:withMessage:", xpc_dictionary_get_uint64(v8, (const char *)*MEMORY[0x1E0D22DD8]), v7, v6);

}

- (void)_queue_updateInterest:(unsigned int)a3 forClient:(id)a4 withMessage:(id)a5
{
  id v8;
  NSMutableSet *interestedClients;
  id v10;

  v10 = a4;
  v8 = a5;
  interestedClients = self->_interestedClients;
  if (a3)
  {
    -[NSMutableSet addObject:](interestedClients, "addObject:", v10);
    if (a3 == 1)
      -[FBInterfaceOrientationServiceServer _queue_handleRequestActiveOrientation:fromClient:](self, "_queue_handleRequestActiveOrientation:fromClient:", v8, v10);
  }
  else
  {
    -[NSMutableSet removeObject:](interestedClients, "removeObject:", v10);
  }

}

void __88__FBInterfaceOrientationServiceServer__queue_handleRequestActiveOrientation_fromClient___block_invoke(uint64_t a1, void *a2)
{
  const char *v3;
  int64_t v4;
  xpc_object_t xdict;

  v3 = (const char *)*MEMORY[0x1E0D22DF0];
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
  xdict = a2;
  xpc_dictionary_set_int64(xdict, v3, v4);
  xpc_dictionary_set_uint64(xdict, (const char *)*MEMORY[0x1E0D22DE8], *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));

}

void __99__FBInterfaceOrientationServiceServer_noteInterfaceOrientationChanged_animationSettings_direction___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = a1[4];
  if (*(_QWORD *)(v2 + 72) != a1[7])
  {
    ++*(_QWORD *)(v2 + 80);
    *(_QWORD *)(a1[4] + 72) = a1[7];
    v3 = objc_msgSend(*(id *)(a1[4] + 64), "copy");
    v4 = *(_QWORD *)(a1[5] + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v2 = a1[4];
  }
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_QWORD *)(v2 + 80);
}

void __99__FBInterfaceOrientationServiceServer_noteInterfaceOrientationChanged_animationSettings_direction___block_invoke_5(uint64_t a1, void *a2)
{
  const char *v3;
  int64_t v4;
  xpc_object_t xdict;

  v3 = (const char *)*MEMORY[0x1E0D22DF0];
  v4 = *(_QWORD *)(a1 + 40);
  xdict = a2;
  xpc_dictionary_set_int64(xdict, v3, v4);
  xpc_dictionary_set_double(xdict, (const char *)*MEMORY[0x1E0D22DD0], *(double *)(a1 + 48));
  xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x1E0D22DE0], *(_QWORD *)(a1 + 56));
  xpc_dictionary_set_uint64(xdict, (const char *)*MEMORY[0x1E0D22DE8], *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));

}

- (void)noteInterfaceOrientationChanged:(int64_t)a3 animationSettings:(id)a4 direction:(int64_t)a5
{
  id v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t (*v10)(uint64_t, uint64_t);
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *queue;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[8];
  _QWORD block[8];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t v26[4];
  void *v27;
  __int16 v28;
  uint64_t v29;
  _BYTE buf[24];
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  objc_msgSend(v8, "duration");
  v10 = v9;
  FBLogInterfaceOrientationObserver();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    BSInterfaceOrientationDescription();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    BSInterfaceOrientationDescription();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 2048;
    v31 = v10;
    _os_log_impl(&dword_1A359A000, v11, OS_LOG_TYPE_DEFAULT, "Received active interface orientation did change from %{public}@ to %{public}@ with duration %.1f", buf, 0x20u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v31 = __Block_byref_object_copy__0;
  v32 = __Block_byref_object_dispose__0;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  queue = self->_queue;
  v15 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __99__FBInterfaceOrientationServiceServer_noteInterfaceOrientationChanged_animationSettings_direction___block_invoke;
  block[3] = &unk_1E4A12258;
  block[4] = self;
  block[5] = buf;
  block[6] = &v22;
  block[7] = a3;
  dispatch_sync(queue, block);
  if (objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count"))
  {
    FBLogInterfaceOrientationObserver();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      BSInterfaceOrientationDescription();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v23[3];
      *(_DWORD *)v26 = 138543618;
      v27 = v17;
      v28 = 2048;
      v29 = v18;
      _os_log_impl(&dword_1A359A000, v16, OS_LOG_TYPE_DEFAULT, "Broadcasting active interface orientation (%{public}@) change to registered clients with sequence #: %lu.", v26, 0x16u);

    }
    v20[0] = v15;
    v20[1] = 3221225472;
    v20[2] = __99__FBInterfaceOrientationServiceServer_noteInterfaceOrientationChanged_animationSettings_direction___block_invoke_5;
    v20[3] = &unk_1E4A12280;
    v20[6] = v10;
    v20[7] = a5;
    v20[4] = &v22;
    v20[5] = a3;
    objc_msgSend(MEMORY[0x1E0D232D0], "messageWithPacker:", v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBSServiceFacility sendMessage:withType:toClients:](self, "sendMessage:withType:toClients:", v19, 0, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));

  }
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(buf, 8);

}

- (FBInterfaceOrientationServiceServer)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  FBInterfaceOrientationServiceServer *v8;
  FBInterfaceOrientationServiceServer *v9;
  NSMutableSet *v10;
  NSMutableSet *interestedClients;
  objc_super v13;

  objc_msgSend(MEMORY[0x1E0D22FB0], "serial");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serviceClass:", 25);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)BSDispatchQueueCreate();

  objc_msgSend(MEMORY[0x1E0D23258], "_queueWithSerialDispatchQueue:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0D22DF8];
  v13.receiver = self;
  v13.super_class = (Class)FBInterfaceOrientationServiceServer;
  v8 = -[FBSServiceFacility initWithIdentifier:queue:](&v13, sel_initWithIdentifier_queue_, v7, v6);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_queue, v5);
    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    interestedClients = v9->_interestedClients;
    v9->_interestedClients = v10;

    v9->_interfaceOrientation = 0;
    v9->_sequenceNumber = 0;
  }

  return v9;
}

- (void)noteClientDidDisconnect:(id)a3
{
  -[FBInterfaceOrientationServiceServer _queue_updateInterest:forClient:withMessage:](self, "_queue_updateInterest:forClient:withMessage:", 0, a3, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interestedClients, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
