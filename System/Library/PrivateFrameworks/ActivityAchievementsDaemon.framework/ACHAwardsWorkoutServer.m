@implementation ACHAwardsWorkoutServer

- (void)remote_numberOfFirstPartyWorkoutsWithDuration:(double)a3 containedInInterval:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  double v16;

  v8 = a4;
  v9 = a5;
  -[ACHAwardsWorkoutServer queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __103__ACHAwardsWorkoutServer_remote_numberOfFirstPartyWorkoutsWithDuration_containedInInterval_completion___block_invoke;
  v13[3] = &unk_24D13B2F0;
  v14 = v8;
  v15 = v9;
  v16 = a3;
  v13[4] = self;
  v11 = v8;
  v12 = v9;
  dispatch_async(v10, v13);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

void __103__ACHAwardsWorkoutServer_remote_numberOfFirstPartyWorkoutsWithDuration_containedInInterval_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  id *v10;
  _QWORD *v11;
  id v12;
  _QWORD v13[4];
  _QWORD v14[2];
  _QWORD block[5];
  id v16;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isProtectedDataAvailable");

  v6 = *(void **)(a1 + 32);
  if ((v5 & 1) != 0)
  {
    objc_msgSend(v6, "workoutUtility");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "numberOfFirstPartyWorkoutsWithDuration:containedInInterval:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));

    objc_msgSend(*(id *)(a1 + 32), "clientQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __103__ACHAwardsWorkoutServer_remote_numberOfFirstPartyWorkoutsWithDuration_containedInInterval_completion___block_invoke_3;
    v13[3] = &unk_24D13B2C8;
    v10 = (id *)v14;
    v14[0] = *(id *)(a1 + 48);
    v14[1] = v8;
    v11 = v13;
  }
  else
  {
    objc_msgSend(v6, "clientQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __103__ACHAwardsWorkoutServer_remote_numberOfFirstPartyWorkoutsWithDuration_containedInInterval_completion___block_invoke_2;
    block[3] = &unk_24D13B278;
    v10 = &v16;
    v12 = *(id *)(a1 + 48);
    block[4] = *(_QWORD *)(a1 + 32);
    v16 = v12;
    v11 = block;
  }
  dispatch_async(v9, v11);

}

- (ACHWorkoutUtility)workoutUtility
{
  return self->_workoutUtility;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

uint64_t __103__ACHAwardsWorkoutServer_remote_numberOfFirstPartyWorkoutsWithDuration_containedInInterval_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);
}

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x24BE01298];
}

- (ACHAwardsWorkoutServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10;
  ACHAwardsWorkoutServer *v11;
  ACHWorkoutUtility *v12;
  void *v13;
  uint64_t v14;
  ACHWorkoutUtility *workoutUtility;
  uint64_t v16;
  OS_dispatch_queue *queue;
  uint64_t v18;
  OS_dispatch_queue *clientQueue;
  objc_super v21;

  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)ACHAwardsWorkoutServer;
  v11 = -[HDStandardTaskServer initWithUUID:configuration:client:delegate:](&v21, sel_initWithUUID_configuration_client_delegate_, a3, a4, v10, a6);
  if (v11)
  {
    v12 = [ACHWorkoutUtility alloc];
    objc_msgSend(v10, "profile");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[ACHWorkoutUtility initWithProfile:](v12, "initWithProfile:", v13);
    workoutUtility = v11->_workoutUtility;
    v11->_workoutUtility = (ACHWorkoutUtility *)v14;

    HKCreateSerialDispatchQueue();
    v16 = objc_claimAutoreleasedReturnValue();
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v16;

    HKCreateSerialDispatchQueue();
    v18 = objc_claimAutoreleasedReturnValue();
    clientQueue = v11->_clientQueue;
    v11->_clientQueue = (OS_dispatch_queue *)v18;

  }
  return v11;
}

- (id)_protectedDataAvailabilityError
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD1540];
  v6 = *MEMORY[0x24BDD0FC8];
  v7[0] = CFSTR("Protected data unavailable");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ActivityAchievements"), -1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)remote_workoutsInDateInterval:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[ACHAwardsWorkoutServer queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__ACHAwardsWorkoutServer_remote_workoutsInDateInterval_completion___block_invoke;
  block[3] = &unk_24D13B2A0;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __67__ACHAwardsWorkoutServer_remote_workoutsInDateInterval_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD block[5];
  id v18;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isProtectedDataAvailable");

  v6 = *(void **)(a1 + 32);
  if ((v5 & 1) != 0)
  {
    objc_msgSend(v6, "workoutUtility");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "workoutsInDateInterval:", *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "clientQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __67__ACHAwardsWorkoutServer_remote_workoutsInDateInterval_completion___block_invoke_3;
    v14[3] = &unk_24D13B278;
    v10 = *(id *)(a1 + 48);
    v15 = v8;
    v16 = v10;
    v11 = v8;
    dispatch_async(v9, v14);

  }
  else
  {
    objc_msgSend(v6, "clientQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __67__ACHAwardsWorkoutServer_remote_workoutsInDateInterval_completion___block_invoke_2;
    block[3] = &unk_24D13B278;
    v13 = *(id *)(a1 + 48);
    block[4] = *(_QWORD *)(a1 + 32);
    v18 = v13;
    dispatch_async(v12, block);

    v11 = v18;
  }

}

void __67__ACHAwardsWorkoutServer_remote_workoutsInDateInterval_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_protectedDataAvailabilityError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, MEMORY[0x24BDBD1A8], v2);

}

uint64_t __67__ACHAwardsWorkoutServer_remote_workoutsInDateInterval_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (void)remote_numberOfWorkoutsWithDuration:(double)a3 containedInInterval:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  double v16;

  v8 = a4;
  v9 = a5;
  -[ACHAwardsWorkoutServer queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __93__ACHAwardsWorkoutServer_remote_numberOfWorkoutsWithDuration_containedInInterval_completion___block_invoke;
  v13[3] = &unk_24D13B2F0;
  v14 = v8;
  v15 = v9;
  v16 = a3;
  v13[4] = self;
  v11 = v8;
  v12 = v9;
  dispatch_async(v10, v13);

}

void __93__ACHAwardsWorkoutServer_remote_numberOfWorkoutsWithDuration_containedInInterval_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  id *v10;
  _QWORD *v11;
  id v12;
  _QWORD v13[4];
  _QWORD v14[2];
  _QWORD block[5];
  id v16;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isProtectedDataAvailable");

  v6 = *(void **)(a1 + 32);
  if ((v5 & 1) != 0)
  {
    objc_msgSend(v6, "workoutUtility");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "numberOfWorkoutsWithDuration:containedInInterval:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));

    objc_msgSend(*(id *)(a1 + 32), "clientQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __93__ACHAwardsWorkoutServer_remote_numberOfWorkoutsWithDuration_containedInInterval_completion___block_invoke_3;
    v13[3] = &unk_24D13B2C8;
    v10 = (id *)v14;
    v14[0] = *(id *)(a1 + 48);
    v14[1] = v8;
    v11 = v13;
  }
  else
  {
    objc_msgSend(v6, "clientQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __93__ACHAwardsWorkoutServer_remote_numberOfWorkoutsWithDuration_containedInInterval_completion___block_invoke_2;
    block[3] = &unk_24D13B278;
    v10 = &v16;
    v12 = *(id *)(a1 + 48);
    block[4] = *(_QWORD *)(a1 + 32);
    v16 = v12;
    v11 = block;
  }
  dispatch_async(v9, v11);

}

void __93__ACHAwardsWorkoutServer_remote_numberOfWorkoutsWithDuration_containedInInterval_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_protectedDataAvailabilityError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

uint64_t __93__ACHAwardsWorkoutServer_remote_numberOfWorkoutsWithDuration_containedInInterval_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);
}

- (void)remote_numberOfFirstPartyWorkoutsWithDuration:(double)a3 type:(unint64_t)a4 endingOnOrBeforeDate:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  double v18;
  unint64_t v19;

  v10 = a5;
  v11 = a6;
  -[ACHAwardsWorkoutServer queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __109__ACHAwardsWorkoutServer_remote_numberOfFirstPartyWorkoutsWithDuration_type_endingOnOrBeforeDate_completion___block_invoke;
  block[3] = &unk_24D13B318;
  v16 = v10;
  v17 = v11;
  v18 = a3;
  v19 = a4;
  block[4] = self;
  v13 = v10;
  v14 = v11;
  dispatch_async(v12, block);

}

void __109__ACHAwardsWorkoutServer_remote_numberOfFirstPartyWorkoutsWithDuration_type_endingOnOrBeforeDate_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  id *v10;
  _QWORD *v11;
  id v12;
  _QWORD v13[4];
  _QWORD v14[2];
  _QWORD block[5];
  id v16;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isProtectedDataAvailable");

  v6 = *(void **)(a1 + 32);
  if ((v5 & 1) != 0)
  {
    objc_msgSend(v6, "workoutUtility");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "numberOfFirstPartyWorkoutsWithDuration:withType:endingOnOrBeforeDate:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));

    objc_msgSend(*(id *)(a1 + 32), "clientQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __109__ACHAwardsWorkoutServer_remote_numberOfFirstPartyWorkoutsWithDuration_type_endingOnOrBeforeDate_completion___block_invoke_3;
    v13[3] = &unk_24D13B2C8;
    v10 = (id *)v14;
    v14[0] = *(id *)(a1 + 48);
    v14[1] = v8;
    v11 = v13;
  }
  else
  {
    objc_msgSend(v6, "clientQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __109__ACHAwardsWorkoutServer_remote_numberOfFirstPartyWorkoutsWithDuration_type_endingOnOrBeforeDate_completion___block_invoke_2;
    block[3] = &unk_24D13B278;
    v10 = &v16;
    v12 = *(id *)(a1 + 48);
    block[4] = *(_QWORD *)(a1 + 32);
    v16 = v12;
    v11 = block;
  }
  dispatch_async(v9, v11);

}

void __109__ACHAwardsWorkoutServer_remote_numberOfFirstPartyWorkoutsWithDuration_type_endingOnOrBeforeDate_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_protectedDataAvailabilityError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

uint64_t __109__ACHAwardsWorkoutServer_remote_numberOfFirstPartyWorkoutsWithDuration_type_endingOnOrBeforeDate_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);
}

void __103__ACHAwardsWorkoutServer_remote_numberOfFirstPartyWorkoutsWithDuration_containedInInterval_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_protectedDataAvailabilityError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (void)remote_numberOfFirstPartyWorkoutsWithDuration:(double)a3 type:(unint64_t)a4 andLocation:(unint64_t)a5 containedInInterval:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  double v20;
  unint64_t v21;
  unint64_t v22;

  v12 = a6;
  v13 = a7;
  -[ACHAwardsWorkoutServer queue](self, "queue");
  v14 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __120__ACHAwardsWorkoutServer_remote_numberOfFirstPartyWorkoutsWithDuration_type_andLocation_containedInInterval_completion___block_invoke;
  v17[3] = &unk_24D13B340;
  v18 = v12;
  v19 = v13;
  v20 = a3;
  v21 = a4;
  v22 = a5;
  v17[4] = self;
  v15 = v12;
  v16 = v13;
  dispatch_async(v14, v17);

}

void __120__ACHAwardsWorkoutServer_remote_numberOfFirstPartyWorkoutsWithDuration_type_andLocation_containedInInterval_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  id *v10;
  _QWORD *v11;
  id v12;
  _QWORD v13[4];
  _QWORD v14[2];
  _QWORD block[5];
  id v16;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isProtectedDataAvailable");

  v6 = *(void **)(a1 + 32);
  if ((v5 & 1) != 0)
  {
    objc_msgSend(v6, "workoutUtility");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "numberOfFirstPartyWorkoutsWithDuration:withType:andLocation:containedInInterval:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));

    objc_msgSend(*(id *)(a1 + 32), "clientQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __120__ACHAwardsWorkoutServer_remote_numberOfFirstPartyWorkoutsWithDuration_type_andLocation_containedInInterval_completion___block_invoke_3;
    v13[3] = &unk_24D13B2C8;
    v10 = (id *)v14;
    v14[0] = *(id *)(a1 + 48);
    v14[1] = v8;
    v11 = v13;
  }
  else
  {
    objc_msgSend(v6, "clientQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __120__ACHAwardsWorkoutServer_remote_numberOfFirstPartyWorkoutsWithDuration_type_andLocation_containedInInterval_completion___block_invoke_2;
    block[3] = &unk_24D13B278;
    v10 = &v16;
    v12 = *(id *)(a1 + 48);
    block[4] = *(_QWORD *)(a1 + 32);
    v16 = v12;
    v11 = block;
  }
  dispatch_async(v9, v11);

}

void __120__ACHAwardsWorkoutServer_remote_numberOfFirstPartyWorkoutsWithDuration_type_andLocation_containedInInterval_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_protectedDataAvailabilityError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

uint64_t __120__ACHAwardsWorkoutServer_remote_numberOfFirstPartyWorkoutsWithDuration_type_andLocation_containedInInterval_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);
}

- (void)remote_bestEnergyBurnedForFirstPartyWorkoutsWithType:(unint64_t)a3 endingBeforeDate:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a4;
  v9 = a5;
  -[ACHAwardsWorkoutServer queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __107__ACHAwardsWorkoutServer_remote_bestEnergyBurnedForFirstPartyWorkoutsWithType_endingBeforeDate_completion___block_invoke;
  v13[3] = &unk_24D13B2F0;
  v15 = v9;
  v16 = a3;
  v13[4] = self;
  v14 = v8;
  v11 = v8;
  v12 = v9;
  dispatch_async(v10, v13);

}

void __107__ACHAwardsWorkoutServer_remote_bestEnergyBurnedForFirstPartyWorkoutsWithType_endingBeforeDate_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD block[5];
  id v18;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isProtectedDataAvailable");

  v6 = *(void **)(a1 + 32);
  if ((v5 & 1) != 0)
  {
    objc_msgSend(v6, "workoutUtility");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bestEnergyBurnedForFirstPartyWorkoutsWithType:endingBeforeDate:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "clientQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __107__ACHAwardsWorkoutServer_remote_bestEnergyBurnedForFirstPartyWorkoutsWithType_endingBeforeDate_completion___block_invoke_3;
    v14[3] = &unk_24D13B278;
    v10 = *(id *)(a1 + 48);
    v15 = v8;
    v16 = v10;
    v11 = v8;
    dispatch_async(v9, v14);

  }
  else
  {
    objc_msgSend(v6, "clientQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __107__ACHAwardsWorkoutServer_remote_bestEnergyBurnedForFirstPartyWorkoutsWithType_endingBeforeDate_completion___block_invoke_2;
    block[3] = &unk_24D13B278;
    v13 = *(id *)(a1 + 48);
    block[4] = *(_QWORD *)(a1 + 32);
    v18 = v13;
    dispatch_async(v12, block);

    v11 = v18;
  }

}

void __107__ACHAwardsWorkoutServer_remote_bestEnergyBurnedForFirstPartyWorkoutsWithType_endingBeforeDate_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_protectedDataAvailabilityError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

uint64_t __107__ACHAwardsWorkoutServer_remote_bestEnergyBurnedForFirstPartyWorkoutsWithType_endingBeforeDate_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (void)remote_bestDistanceForFirstPartyWorkoutsWithType:(unint64_t)a3 endingBeforeDate:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a4;
  v9 = a5;
  -[ACHAwardsWorkoutServer queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __103__ACHAwardsWorkoutServer_remote_bestDistanceForFirstPartyWorkoutsWithType_endingBeforeDate_completion___block_invoke;
  v13[3] = &unk_24D13B2F0;
  v15 = v9;
  v16 = a3;
  v13[4] = self;
  v14 = v8;
  v11 = v8;
  v12 = v9;
  dispatch_async(v10, v13);

}

void __103__ACHAwardsWorkoutServer_remote_bestDistanceForFirstPartyWorkoutsWithType_endingBeforeDate_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD block[5];
  id v18;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isProtectedDataAvailable");

  v6 = *(void **)(a1 + 32);
  if ((v5 & 1) != 0)
  {
    objc_msgSend(v6, "workoutUtility");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bestDistanceForFirstPartyWorkoutsWithType:endingBeforeDate:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "clientQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __103__ACHAwardsWorkoutServer_remote_bestDistanceForFirstPartyWorkoutsWithType_endingBeforeDate_completion___block_invoke_3;
    v14[3] = &unk_24D13B278;
    v10 = *(id *)(a1 + 48);
    v15 = v8;
    v16 = v10;
    v11 = v8;
    dispatch_async(v9, v14);

  }
  else
  {
    objc_msgSend(v6, "clientQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __103__ACHAwardsWorkoutServer_remote_bestDistanceForFirstPartyWorkoutsWithType_endingBeforeDate_completion___block_invoke_2;
    block[3] = &unk_24D13B278;
    v13 = *(id *)(a1 + 48);
    block[4] = *(_QWORD *)(a1 + 32);
    v18 = v13;
    dispatch_async(v12, block);

    v11 = v18;
  }

}

void __103__ACHAwardsWorkoutServer_remote_bestDistanceForFirstPartyWorkoutsWithType_endingBeforeDate_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_protectedDataAvailabilityError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

uint64_t __103__ACHAwardsWorkoutServer_remote_bestDistanceForFirstPartyWorkoutsWithType_endingBeforeDate_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (void)remote_mindfulMinutesForForDateInterval:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[ACHAwardsWorkoutServer queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__ACHAwardsWorkoutServer_remote_mindfulMinutesForForDateInterval_completion___block_invoke;
  block[3] = &unk_24D13B2A0;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __77__ACHAwardsWorkoutServer_remote_mindfulMinutesForForDateInterval_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD block[5];
  id v18;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isProtectedDataAvailable");

  v6 = *(void **)(a1 + 32);
  if ((v5 & 1) != 0)
  {
    objc_msgSend(v6, "workoutUtility");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mindfulMinutesForForDateInterval:", *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "clientQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __77__ACHAwardsWorkoutServer_remote_mindfulMinutesForForDateInterval_completion___block_invoke_3;
    v14[3] = &unk_24D13B278;
    v10 = *(id *)(a1 + 48);
    v15 = v8;
    v16 = v10;
    v11 = v8;
    dispatch_async(v9, v14);

  }
  else
  {
    objc_msgSend(v6, "clientQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __77__ACHAwardsWorkoutServer_remote_mindfulMinutesForForDateInterval_completion___block_invoke_2;
    block[3] = &unk_24D13B278;
    v13 = *(id *)(a1 + 48);
    block[4] = *(_QWORD *)(a1 + 32);
    v18 = v13;
    dispatch_async(v12, block);

    v11 = v18;
  }

}

void __77__ACHAwardsWorkoutServer_remote_mindfulMinutesForForDateInterval_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_protectedDataAvailabilityError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

uint64_t __77__ACHAwardsWorkoutServer_remote_mindfulMinutesForForDateInterval_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (id)remoteInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D82AC8);
}

- (void)setWorkoutUtility:(id)a3
{
  objc_storeStrong((id *)&self->_workoutUtility, a3);
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void)setClientQueue:(id)a3
{
  objc_storeStrong((id *)&self->_clientQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_workoutUtility, 0);
}

@end
