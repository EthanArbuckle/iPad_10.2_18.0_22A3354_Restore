@implementation ACHAwardsWorkoutClient

void __91__ACHAwardsWorkoutClient_numberOfFirstPartyWorkoutsWithDuration_containedInInterval_error___block_invoke_2(uint64_t a1, uint64_t a2, id obj)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

uint64_t __91__ACHAwardsWorkoutClient_numberOfFirstPartyWorkoutsWithDuration_containedInInterval_error___block_invoke(uint64_t a1, void *a2)
{
  double v2;
  uint64_t v3;
  _QWORD v5[4];
  __int128 v6;

  v2 = *(double *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __91__ACHAwardsWorkoutClient_numberOfFirstPartyWorkoutsWithDuration_containedInInterval_error___block_invoke_2;
  v5[3] = &unk_24D127100;
  v6 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_numberOfFirstPartyWorkoutsWithDuration:containedInInterval:completion:", v3, v5, v2);
}

- (unint64_t)numberOfFirstPartyWorkoutsWithDuration:(double)a3 containedInInterval:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  unint64_t v14;
  _QWORD v16[5];
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  double v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  v8 = a4;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__1;
  v26 = __Block_byref_object_dispose__1;
  v27 = 0;
  -[ACHAwardsWorkoutClient proxyProvider](self, "proxyProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __91__ACHAwardsWorkoutClient_numberOfFirstPartyWorkoutsWithDuration_containedInInterval_error___block_invoke;
  v17[3] = &unk_24D1270B0;
  v21 = a3;
  v11 = v8;
  v18 = v11;
  v19 = &v28;
  v20 = &v22;
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __91__ACHAwardsWorkoutClient_numberOfFirstPartyWorkoutsWithDuration_containedInInterval_error___block_invoke_3;
  v16[3] = &unk_24D126CF8;
  v16[4] = &v22;
  objc_msgSend(v9, "getSynchronousProxyWithHandler:errorHandler:", v17, v16);

  v12 = (id)v23[5];
  v13 = v12;
  if (v12)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v12);
    else
      _HKLogDroppedError();
  }

  v14 = v29[3];
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  return v14;
}

- (HKTaskServerProxyProvider)proxyProvider
{
  return self->_proxyProvider;
}

- (ACHAwardsWorkoutClient)initWithHealthStore:(id)a3
{
  id v4;
  ACHAwardsWorkoutClient *v5;
  uint64_t v6;
  NSUUID *identifier;
  uint64_t v8;
  HKTaskServerProxyProvider *proxyProvider;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ACHAwardsWorkoutClient;
  v5 = -[ACHAwardsWorkoutClient init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDD4038]), "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v4, CFSTR("ActivityAchievementsWorkoutTaskServer"), v5, v5->_identifier);
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKTaskServerProxyProvider *)v8;

  }
  return v5;
}

- (id)workoutsInDateInterval:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v6 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__1;
  v29 = __Block_byref_object_dispose__1;
  v30 = (id)MEMORY[0x24BDBD1A8];
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__1;
  v23 = __Block_byref_object_dispose__1;
  v24 = 0;
  -[ACHAwardsWorkoutClient proxyProvider](self, "proxyProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __55__ACHAwardsWorkoutClient_workoutsInDateInterval_error___block_invoke;
  v15[3] = &unk_24D126D98;
  v9 = v6;
  v16 = v9;
  v17 = &v25;
  v18 = &v19;
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __55__ACHAwardsWorkoutClient_workoutsInDateInterval_error___block_invoke_3;
  v14[3] = &unk_24D126CF8;
  v14[4] = &v19;
  objc_msgSend(v7, "getSynchronousProxyWithHandler:errorHandler:", v15, v14);

  v10 = (id)v20[5];
  v11 = v10;
  if (v10)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v10);
    else
      _HKLogDroppedError();
  }

  v12 = (id)v26[5];
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v12;
}

uint64_t __55__ACHAwardsWorkoutClient_workoutsInDateInterval_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[4];
  __int128 v5;

  v2 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __55__ACHAwardsWorkoutClient_workoutsInDateInterval_error___block_invoke_2;
  v4[3] = &unk_24D1270D8;
  v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_workoutsInDateInterval:completion:", v2, v4);
}

void __55__ACHAwardsWorkoutClient_workoutsInDateInterval_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __55__ACHAwardsWorkoutClient_workoutsInDateInterval_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (unint64_t)numberOfWorkoutsWithDuration:(double)a3 containedInInterval:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  unint64_t v14;
  _QWORD v16[5];
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  double v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  v8 = a4;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__1;
  v26 = __Block_byref_object_dispose__1;
  v27 = 0;
  -[ACHAwardsWorkoutClient proxyProvider](self, "proxyProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __81__ACHAwardsWorkoutClient_numberOfWorkoutsWithDuration_containedInInterval_error___block_invoke;
  v17[3] = &unk_24D1270B0;
  v21 = a3;
  v11 = v8;
  v18 = v11;
  v19 = &v28;
  v20 = &v22;
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __81__ACHAwardsWorkoutClient_numberOfWorkoutsWithDuration_containedInInterval_error___block_invoke_3;
  v16[3] = &unk_24D126CF8;
  v16[4] = &v22;
  objc_msgSend(v9, "getSynchronousProxyWithHandler:errorHandler:", v17, v16);

  v12 = (id)v23[5];
  v13 = v12;
  if (v12)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v12);
    else
      _HKLogDroppedError();
  }

  v14 = v29[3];
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  return v14;
}

uint64_t __81__ACHAwardsWorkoutClient_numberOfWorkoutsWithDuration_containedInInterval_error___block_invoke(uint64_t a1, void *a2)
{
  double v2;
  uint64_t v3;
  _QWORD v5[4];
  __int128 v6;

  v2 = *(double *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __81__ACHAwardsWorkoutClient_numberOfWorkoutsWithDuration_containedInInterval_error___block_invoke_2;
  v5[3] = &unk_24D127100;
  v6 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_numberOfWorkoutsWithDuration:containedInInterval:completion:", v3, v5, v2);
}

void __81__ACHAwardsWorkoutClient_numberOfWorkoutsWithDuration_containedInInterval_error___block_invoke_2(uint64_t a1, uint64_t a2, id obj)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __81__ACHAwardsWorkoutClient_numberOfWorkoutsWithDuration_containedInInterval_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (unint64_t)numberOfFirstPartyWorkoutsWithDuration:(double)a3 withType:(unint64_t)a4 endingOnOrBeforeDate:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  unint64_t v16;
  _QWORD v18[5];
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  double v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;

  v10 = a5;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__1;
  v29 = __Block_byref_object_dispose__1;
  v30 = 0;
  -[ACHAwardsWorkoutClient proxyProvider](self, "proxyProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __101__ACHAwardsWorkoutClient_numberOfFirstPartyWorkoutsWithDuration_withType_endingOnOrBeforeDate_error___block_invoke;
  v19[3] = &unk_24D127128;
  v23 = a3;
  v24 = a4;
  v13 = v10;
  v20 = v13;
  v21 = &v31;
  v22 = &v25;
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __101__ACHAwardsWorkoutClient_numberOfFirstPartyWorkoutsWithDuration_withType_endingOnOrBeforeDate_error___block_invoke_3;
  v18[3] = &unk_24D126CF8;
  v18[4] = &v25;
  objc_msgSend(v11, "getSynchronousProxyWithHandler:errorHandler:", v19, v18);

  v14 = (id)v26[5];
  v15 = v14;
  if (v14)
  {
    if (a6)
      *a6 = objc_retainAutorelease(v14);
    else
      _HKLogDroppedError();
  }

  v16 = v32[3];
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
  return v16;
}

uint64_t __101__ACHAwardsWorkoutClient_numberOfFirstPartyWorkoutsWithDuration_withType_endingOnOrBeforeDate_error___block_invoke(uint64_t a1, void *a2)
{
  double v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[4];
  __int128 v7;

  v2 = *(double *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 64);
  v4 = *(_QWORD *)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __101__ACHAwardsWorkoutClient_numberOfFirstPartyWorkoutsWithDuration_withType_endingOnOrBeforeDate_error___block_invoke_2;
  v6[3] = &unk_24D127100;
  v7 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_numberOfFirstPartyWorkoutsWithDuration:type:endingOnOrBeforeDate:completion:", v3, v4, v6, v2);
}

void __101__ACHAwardsWorkoutClient_numberOfFirstPartyWorkoutsWithDuration_withType_endingOnOrBeforeDate_error___block_invoke_2(uint64_t a1, uint64_t a2, id obj)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __101__ACHAwardsWorkoutClient_numberOfFirstPartyWorkoutsWithDuration_withType_endingOnOrBeforeDate_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __91__ACHAwardsWorkoutClient_numberOfFirstPartyWorkoutsWithDuration_containedInInterval_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (unint64_t)numberOfFirstPartyWorkoutsWithDuration:(double)a3 withType:(unint64_t)a4 andLocation:(unint64_t)a5 containedInInterval:(id)a6 error:(id *)a7
{
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  unint64_t v18;
  _QWORD v20[5];
  _QWORD v21[4];
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  double v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;

  v12 = a6;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__1;
  v32 = __Block_byref_object_dispose__1;
  v33 = 0;
  -[ACHAwardsWorkoutClient proxyProvider](self, "proxyProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __112__ACHAwardsWorkoutClient_numberOfFirstPartyWorkoutsWithDuration_withType_andLocation_containedInInterval_error___block_invoke;
  v21[3] = &unk_24D127150;
  v25 = a3;
  v26 = a4;
  v27 = a5;
  v15 = v12;
  v22 = v15;
  v23 = &v34;
  v24 = &v28;
  v20[0] = v14;
  v20[1] = 3221225472;
  v20[2] = __112__ACHAwardsWorkoutClient_numberOfFirstPartyWorkoutsWithDuration_withType_andLocation_containedInInterval_error___block_invoke_3;
  v20[3] = &unk_24D126CF8;
  v20[4] = &v28;
  objc_msgSend(v13, "getSynchronousProxyWithHandler:errorHandler:", v21, v20);

  v16 = (id)v29[5];
  v17 = v16;
  if (v16)
  {
    if (a7)
      *a7 = objc_retainAutorelease(v16);
    else
      _HKLogDroppedError();
  }

  v18 = v35[3];
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  return v18;
}

uint64_t __112__ACHAwardsWorkoutClient_numberOfFirstPartyWorkoutsWithDuration_withType_andLocation_containedInInterval_error___block_invoke(uint64_t a1, void *a2)
{
  double v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[4];
  __int128 v8;

  v2 = *(double *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 64);
  v4 = *(_QWORD *)(a1 + 72);
  v5 = *(_QWORD *)(a1 + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __112__ACHAwardsWorkoutClient_numberOfFirstPartyWorkoutsWithDuration_withType_andLocation_containedInInterval_error___block_invoke_2;
  v7[3] = &unk_24D127100;
  v8 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_numberOfFirstPartyWorkoutsWithDuration:type:andLocation:containedInInterval:completion:", v3, v4, v5, v7, v2);
}

void __112__ACHAwardsWorkoutClient_numberOfFirstPartyWorkoutsWithDuration_withType_andLocation_containedInInterval_error___block_invoke_2(uint64_t a1, uint64_t a2, id obj)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __112__ACHAwardsWorkoutClient_numberOfFirstPartyWorkoutsWithDuration_withType_andLocation_containedInInterval_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)bestEnergyBurnedForFirstPartyWorkoutsWithType:(unint64_t)a3 endingBeforeDate:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v8 = a4;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__1;
  v32 = __Block_byref_object_dispose__1;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__1;
  v26 = __Block_byref_object_dispose__1;
  v27 = 0;
  -[ACHAwardsWorkoutClient proxyProvider](self, "proxyProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __95__ACHAwardsWorkoutClient_bestEnergyBurnedForFirstPartyWorkoutsWithType_endingBeforeDate_error___block_invoke;
  v17[3] = &unk_24D1270B0;
  v21 = a3;
  v11 = v8;
  v18 = v11;
  v19 = &v28;
  v20 = &v22;
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __95__ACHAwardsWorkoutClient_bestEnergyBurnedForFirstPartyWorkoutsWithType_endingBeforeDate_error___block_invoke_3;
  v16[3] = &unk_24D126CF8;
  v16[4] = &v22;
  objc_msgSend(v9, "getSynchronousProxyWithHandler:errorHandler:", v17, v16);

  v12 = (id)v23[5];
  v13 = v12;
  if (v12)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v12);
    else
      _HKLogDroppedError();
  }

  v14 = (id)v29[5];
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  return v14;
}

uint64_t __95__ACHAwardsWorkoutClient_bestEnergyBurnedForFirstPartyWorkoutsWithType_endingBeforeDate_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[4];
  __int128 v6;

  v2 = *(_QWORD *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __95__ACHAwardsWorkoutClient_bestEnergyBurnedForFirstPartyWorkoutsWithType_endingBeforeDate_error___block_invoke_2;
  v5[3] = &unk_24D127178;
  v6 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_bestEnergyBurnedForFirstPartyWorkoutsWithType:endingBeforeDate:completion:", v2, v3, v5);
}

void __95__ACHAwardsWorkoutClient_bestEnergyBurnedForFirstPartyWorkoutsWithType_endingBeforeDate_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __95__ACHAwardsWorkoutClient_bestEnergyBurnedForFirstPartyWorkoutsWithType_endingBeforeDate_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)bestDistanceForFirstPartyWorkoutsWithType:(unint64_t)a3 endingBeforeDate:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v8 = a4;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__1;
  v32 = __Block_byref_object_dispose__1;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__1;
  v26 = __Block_byref_object_dispose__1;
  v27 = 0;
  -[ACHAwardsWorkoutClient proxyProvider](self, "proxyProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __91__ACHAwardsWorkoutClient_bestDistanceForFirstPartyWorkoutsWithType_endingBeforeDate_error___block_invoke;
  v17[3] = &unk_24D1270B0;
  v21 = a3;
  v11 = v8;
  v18 = v11;
  v19 = &v28;
  v20 = &v22;
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __91__ACHAwardsWorkoutClient_bestDistanceForFirstPartyWorkoutsWithType_endingBeforeDate_error___block_invoke_3;
  v16[3] = &unk_24D126CF8;
  v16[4] = &v22;
  objc_msgSend(v9, "getSynchronousProxyWithHandler:errorHandler:", v17, v16);

  v12 = (id)v23[5];
  v13 = v12;
  if (v12)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v12);
    else
      _HKLogDroppedError();
  }

  v14 = (id)v29[5];
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  return v14;
}

uint64_t __91__ACHAwardsWorkoutClient_bestDistanceForFirstPartyWorkoutsWithType_endingBeforeDate_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[4];
  __int128 v6;

  v2 = *(_QWORD *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __91__ACHAwardsWorkoutClient_bestDistanceForFirstPartyWorkoutsWithType_endingBeforeDate_error___block_invoke_2;
  v5[3] = &unk_24D127178;
  v6 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_bestDistanceForFirstPartyWorkoutsWithType:endingBeforeDate:completion:", v2, v3, v5);
}

void __91__ACHAwardsWorkoutClient_bestDistanceForFirstPartyWorkoutsWithType_endingBeforeDate_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __91__ACHAwardsWorkoutClient_bestDistanceForFirstPartyWorkoutsWithType_endingBeforeDate_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)mindfulMinutesForForDateInterval:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v6 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__1;
  v29 = __Block_byref_object_dispose__1;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__1;
  v23 = __Block_byref_object_dispose__1;
  v24 = 0;
  -[ACHAwardsWorkoutClient proxyProvider](self, "proxyProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __65__ACHAwardsWorkoutClient_mindfulMinutesForForDateInterval_error___block_invoke;
  v15[3] = &unk_24D126D98;
  v9 = v6;
  v16 = v9;
  v17 = &v25;
  v18 = &v19;
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __65__ACHAwardsWorkoutClient_mindfulMinutesForForDateInterval_error___block_invoke_3;
  v14[3] = &unk_24D126CF8;
  v14[4] = &v19;
  objc_msgSend(v7, "getSynchronousProxyWithHandler:errorHandler:", v15, v14);

  v10 = (id)v20[5];
  v11 = v10;
  if (v10)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v10);
    else
      _HKLogDroppedError();
  }

  v12 = (id)v26[5];
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v12;
}

uint64_t __65__ACHAwardsWorkoutClient_mindfulMinutesForForDateInterval_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[4];
  __int128 v5;

  v2 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __65__ACHAwardsWorkoutClient_mindfulMinutesForForDateInterval_error___block_invoke_2;
  v4[3] = &unk_24D127178;
  v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_mindfulMinutesForForDateInterval:completion:", v2, v4);
}

void __65__ACHAwardsWorkoutClient_mindfulMinutesForForDateInterval_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __65__ACHAwardsWorkoutClient_mindfulMinutesForForDateInterval_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D6E7B0);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void)setProxyProvider:(id)a3
{
  objc_storeStrong((id *)&self->_proxyProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
