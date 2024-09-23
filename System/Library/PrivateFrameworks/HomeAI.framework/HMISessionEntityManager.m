@implementation HMISessionEntityManager

- (HMISessionEntityManager)init
{
  HMISessionEntityManager *v2;
  uint64_t v3;
  NSMutableDictionary *sessionEntities;
  uint64_t v5;
  NSMutableDictionary *sessionUUIDToPreviousFaceprints;
  uint64_t v7;
  NSMutableDictionary *sessionUUIDToPreviousTorsoprints;
  HMIPersonTracker *v9;
  HMIPersonTracker *personTracker;
  void *v11;
  void *v12;
  double v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HMISessionEntityManager;
  v2 = -[HMISessionEntityManager init](&v15, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    sessionEntities = v2->_sessionEntities;
    v2->_sessionEntities = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    sessionUUIDToPreviousFaceprints = v2->_sessionUUIDToPreviousFaceprints;
    v2->_sessionUUIDToPreviousFaceprints = (NSMutableDictionary *)v5;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    sessionUUIDToPreviousTorsoprints = v2->_sessionUUIDToPreviousTorsoprints;
    v2->_sessionUUIDToPreviousTorsoprints = (NSMutableDictionary *)v7;

    v9 = objc_alloc_init(HMIPersonTracker);
    personTracker = v2->_personTracker;
    v2->_personTracker = v9;

    +[HMIPreference sharedInstance](HMIPreference, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "numberPreferenceForKey:defaultValue:", CFSTR("faceVIPThresholdForTorsoAnnotation"), &unk_24DC154B0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v2->_faceVIPThresholdForTorsoAnnotation = v13;

  }
  return v2;
}

- (void)submitTorsoprintsToModelManagerForHome:(id)a3 withTorsoAnnotations:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMISessionEntityManager *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "count"))
  {
    +[HMIPersonsModelManager sharedInstance](HMIPersonsModelManager, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    objc_msgSend(v8, "updateTorsoModelForHome:torsoAnnotations:error:", v6, v7, &v13);

  }
  else
  {
    v9 = (void *)MEMORY[0x220735570]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v15 = v12;
      _os_log_impl(&dword_219D45000, v11, OS_LOG_TYPE_INFO, "%{public}@No torso annotations -- skipping torso model update", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
  }

}

- (id)assignSessionEntitiesToPersonEvents:(id)a3 regionOfInterest:(CGRect)a4 timeStamp:(id *)a5 homeUUID:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  HMIPersonTracker *personTracker;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  _QWORD v29[5];
  _QWORD v30[4];
  id v31;
  HMISessionEntityManager *v32;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v33;
  _QWORD v34[4];
  id v35;
  HMISessionEntityManager *v36;
  id v37;
  id v38;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = (void *)MEMORY[0x24BDBCEF0];
  v13 = a3;
  -[HMISessionEntityManager sessionEntities](self, "sessionEntities");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "allKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x24BDAC760];
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __99__HMISessionEntityManager_assignSessionEntitiesToPersonEvents_regionOfInterest_timeStamp_homeUUID___block_invoke;
  v34[3] = &unk_24DBEC0C0;
  v35 = v18;
  v36 = self;
  v37 = v16;
  v20 = v17;
  v38 = v20;
  v21 = v16;
  v22 = v18;
  objc_msgSend(v13, "na_each:", v34);

  personTracker = self->_personTracker;
  v24 = (void *)objc_msgSend(v22, "copy");
  objc_msgSend(v20, "allObjects");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = *a5;
  -[HMIPersonTracker trackNewPersons:knownPersons:regionOfInterest:timeStamp:](personTracker, "trackNewPersons:knownPersons:regionOfInterest:timeStamp:", v24, v25, &v33, x, y, width, height);

  v30[0] = v19;
  v30[1] = 3221225472;
  v30[2] = __99__HMISessionEntityManager_assignSessionEntitiesToPersonEvents_regionOfInterest_timeStamp_homeUUID___block_invoke_32;
  v30[3] = &unk_24DBEC0E8;
  v31 = v20;
  v32 = self;
  v26 = v20;
  objc_msgSend(v22, "enumerateObjectsUsingBlock:", v30);
  v29[0] = v19;
  v29[1] = 3221225472;
  v29[2] = __99__HMISessionEntityManager_assignSessionEntitiesToPersonEvents_regionOfInterest_timeStamp_homeUUID___block_invoke_2;
  v29[3] = &unk_24DBEC110;
  v29[4] = self;
  objc_msgSend(v26, "na_each:", v29);
  v27 = (void *)objc_msgSend(v26, "copy");

  return v27;
}

void __99__HMISessionEntityManager_assignSessionEntitiesToPersonEvents_regionOfInterest_timeStamp_homeUUID___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "face");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "face");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "faceRecognition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v3, "face");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "faceRecognition");
      v8 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  objc_msgSend(v3, "torso");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "torsoRecognition");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "torsoprint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "unrecognizable") & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(v3, "torso");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "torsoRecognition");
    v12 = objc_claimAutoreleasedReturnValue();

  }
  if (v8 | v12)
  {
    v41 = 0;
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend((id)v8, "predictedLinkedEntityUUIDs");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend((id)v8, "predictedLinkedEntityUUIDs");
        v16 = objc_claimAutoreleasedReturnValue();

        v14 = (void *)v16;
      }
      objc_msgSend(a1[5], "assignSessionEntityToFaceRecognition:torsoRecognition:predictedLinkedEntityUUIDs:availableSessionEntityUUIDs:sessionEntityAssignment:", v8, 0, v14, a1[6], &v41);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        objc_msgSend(a1[5], "clusterSessionEntityToFaceRecognition:torsoRecognition:predictedLinkedEntityUUIDs:availableSessionEntityUUIDs:sessionEntityAssignment:", v8, 0, v14, a1[6], &v41);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (v17 && v12)
      {
        v18 = (void *)MEMORY[0x220735570]();
        v19 = a1[5];
        HMFGetOSLogHandle();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v45 = v21;
          v46 = 2112;
          v47 = v17;
          _os_log_impl(&dword_219D45000, v20, OS_LOG_TYPE_INFO, "%{public}@Adding torso to existing sessionEntityUUID: %@ (face)", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v18);
        objc_msgSend(a1[5], "sessionEntities");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKeyedSubscript:", v17);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v12, "torsoprint");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v24;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v43, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addTorsoprints:", v25);

      }
      objc_msgSend((id)v8, "predictedLinkedEntityUUIDs");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "hmf_isEmpty") ^ 1;

      if (!v17 && v27 && v12)
      {
        objc_msgSend(a1[5], "clusterSessionEntityToFaceRecognition:torsoRecognition:predictedLinkedEntityUUIDs:availableSessionEntityUUIDs:sessionEntityAssignment:", 0, v12, v14, a1[6], &v41);
        v28 = objc_claimAutoreleasedReturnValue();
        if (v28)
        {
          v17 = (void *)v28;
          v29 = (void *)MEMORY[0x220735570]();
          v30 = a1[5];
          HMFGetOSLogHandle();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v45 = v32;
            v46 = 2112;
            v47 = v17;
            _os_log_impl(&dword_219D45000, v31, OS_LOG_TYPE_INFO, "%{public}@Adding face to existing sessionEntityUUID: %@ (torso)", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v29);
          objc_msgSend(a1[5], "sessionEntities");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "objectForKeyedSubscript:", v17);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v8, "faceprint");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = v35;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v42, 1);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "addFaceprints:", v36);

          goto LABEL_39;
        }
LABEL_40:
        objc_msgSend(a1[4], "addObject:", v3);
        goto LABEL_41;
      }
    }
    else
    {
      LOBYTE(v27) = 0;
      v17 = 0;
    }
    if ((v27 & 1) == 0 && v12 && !v17)
    {
      objc_msgSend((id)v12, "predictedLinkedEntityUUIDs");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (v37)
      {
        objc_msgSend((id)v12, "predictedLinkedEntityUUIDs");
        v38 = objc_claimAutoreleasedReturnValue();

        v14 = (void *)v38;
      }
      objc_msgSend(a1[5], "assignSessionEntityToFaceRecognition:torsoRecognition:predictedLinkedEntityUUIDs:availableSessionEntityUUIDs:sessionEntityAssignment:", 0, v12, v14, a1[6], &v41);
      v39 = objc_claimAutoreleasedReturnValue();
      if (v39)
      {
        v17 = (void *)v39;
        goto LABEL_39;
      }
      objc_msgSend(a1[5], "clusterSessionEntityToFaceRecognition:torsoRecognition:predictedLinkedEntityUUIDs:availableSessionEntityUUIDs:sessionEntityAssignment:", 0, v12, v14, a1[6], &v41);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (!v17)
      goto LABEL_40;
LABEL_39:
    objc_msgSend(a1[6], "removeObject:", v17);
    +[HMISessionEntityManager updatePersonEventWithPersonEvent:sessionEntityUUID:predictedLinkedEntityUUIDs:sessionEntityAssignment:](HMISessionEntityManager, "updatePersonEventWithPersonEvent:sessionEntityUUID:predictedLinkedEntityUUIDs:sessionEntityAssignment:", v3, v17, v14, v41);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[7], "addObject:", v40);

LABEL_41:
    goto LABEL_42;
  }
  objc_msgSend(a1[4], "addObject:", v3);
LABEL_42:

}

void __99__HMISessionEntityManager_assignSessionEntitiesToPersonEvents_regionOfInterest_timeStamp_homeUUID___block_invoke_32(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;

  v5 = a2;
  objc_msgSend(v5, "sessionEntityUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    goto LABEL_17;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "getBlobIDAtIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "torso");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "torsoRecognition");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "torsoprint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "unrecognizable") & 1) != 0)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(v5, "torso");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "torsoRecognition");
    v11 = objc_claimAutoreleasedReturnValue();

  }
  v31 = 0;
  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "face");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "faceRecognition");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "predictedLinkedEntityUUIDs");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "hmf_isEmpty");

  if ((v17 & 1) == 0)
  {
    objc_msgSend(v5, "face");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "faceRecognition");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "predictedLinkedEntityUUIDs");
    v20 = objc_claimAutoreleasedReturnValue();

    v13 = v21;
    goto LABEL_10;
  }
  objc_msgSend((id)v11, "predictedLinkedEntityUUIDs");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "hmf_isEmpty");

  if ((v19 & 1) == 0)
  {
    objc_msgSend((id)v11, "predictedLinkedEntityUUIDs");
    v20 = objc_claimAutoreleasedReturnValue();
LABEL_10:

    v13 = (void *)v20;
  }
  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "face");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "faceRecognition");
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = v24 | v11;

  if (v25)
  {
    v26 = *(void **)(a1 + 40);
    objc_msgSend(v5, "face");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "faceRecognition");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "createSessionEntityWithUUID:faceRecognition:torsoRecognition:predictedLinkedEntityUUIDs:sessionEntityAssignment:", v7, v28, v11, v13, &v31);

    v29 = v31;
  }
  else
  {
    v29 = 0;
  }
  +[HMISessionEntityManager updatePersonEventWithPersonEvent:sessionEntityUUID:predictedLinkedEntityUUIDs:sessionEntityAssignment:](HMISessionEntityManager, "updatePersonEventWithPersonEvent:sessionEntityUUID:predictedLinkedEntityUUIDs:sessionEntityAssignment:", v5, v7, v13, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v30);

LABEL_17:
}

void __99__HMISessionEntityManager_assignSessionEntitiesToPersonEvents_regionOfInterest_timeStamp_homeUUID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  _QWORD v36[5];
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "sessionEntityUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v3, "face");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "faceRecognition");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "torso");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "torsoRecognition");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updatePreviousPrintsForSessionEntityUUID:faceRecognition:torsoRecognition:", v4, v7, v9);

    objc_msgSend(v3, "face");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "faceRecognition");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v11, "predictedLinkedEntityUUIDs");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "hmf_isEmpty") ^ 1;

    }
    else
    {
      v13 = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "sessionEntities");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v15, "faceRecognition");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        v17 = (void *)MEMORY[0x220735570]();
        v18 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v38 = v20;
          v39 = 2112;
          v40 = v4;
          _os_log_impl(&dword_219D45000, v19, OS_LOG_TYPE_INFO, "%{public}@Session entity %@ already has a face recognition, skipping subsequent match", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v17);
        v21 = (void *)MEMORY[0x220735570]();
        v22 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "faceRecognition");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v38 = v24;
          v39 = 2112;
          v40 = v25;
          _os_log_impl(&dword_219D45000, v23, OS_LOG_TYPE_DEBUG, "%{public}@Existing face classification: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v21);
        v26 = (void *)MEMORY[0x220735570]();
        v27 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v38 = v29;
          v39 = 2112;
          v40 = v11;
          _os_log_impl(&dword_219D45000, v28, OS_LOG_TYPE_DEBUG, "%{public}@New face classification: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v26);
      }
      else
      {
        objc_msgSend(v11, "classifications");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v36[0] = MEMORY[0x24BDAC760];
        v36[1] = 3221225472;
        v36[2] = __99__HMISessionEntityManager_assignSessionEntitiesToPersonEvents_regionOfInterest_timeStamp_homeUUID___block_invoke_34;
        v36[3] = &unk_24DBE9FB8;
        v36[4] = *(_QWORD *)(a1 + 32);
        v31 = objc_msgSend(v30, "na_any:", v36);

        if (v31)
        {
          v32 = (void *)MEMORY[0x220735570]();
          v33 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v38 = v35;
            v39 = 2112;
            v40 = v4;
            v41 = 2112;
            v42 = v11;
            _os_log_impl(&dword_219D45000, v34, OS_LOG_TYPE_INFO, "%{public}@Assigning session entity %@ the face classification: %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v32);
          objc_msgSend(v15, "setFaceRecognition:", v11);
        }
      }
    }

  }
}

BOOL __99__HMISessionEntityManager_assignSessionEntitiesToPersonEvents_regionOfInterest_timeStamp_homeUUID___block_invoke_34(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  _BOOL8 v7;

  v3 = a2;
  objc_msgSend(v3, "confidence");
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "faceVIPThresholdForTorsoAnnotation");
  v7 = v5 >= v6 && objc_msgSend(v3, "familiarity") == 2;

  return v7;
}

- (id)updateTorsoModelAndGetTorsoAnnotationsForHome:(id)a3
{
  id v4;
  void *v5;
  HMISessionEntityManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, void *);
  void *v18;
  HMISessionEntityManager *v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x220735570]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v8;
    v23 = 2112;
    v24 = v4;
    _os_log_impl(&dword_219D45000, v7, OS_LOG_TYPE_DEBUG, "%{public}@updateTorsoModelAndGetTorsoAnnotationsForHome: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMISessionEntityManager sessionEntities](v6, "sessionEntities");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __73__HMISessionEntityManager_updateTorsoModelAndGetTorsoAnnotationsForHome___block_invoke;
  v18 = &unk_24DBEC138;
  v19 = v6;
  v11 = v9;
  v20 = v11;
  objc_msgSend(v10, "na_each:", &v15);

  if ((objc_msgSend(v11, "hmf_isEmpty", v15, v16, v17, v18, v19) & 1) == 0)
  {
    v12 = (void *)objc_msgSend(v11, "copy");
    -[HMISessionEntityManager submitTorsoprintsToModelManagerForHome:withTorsoAnnotations:](v6, "submitTorsoprintsToModelManagerForHome:withTorsoAnnotations:", v4, v12);

  }
  v13 = (void *)objc_msgSend(v11, "copy");

  return v13;
}

void __73__HMISessionEntityManager_updateTorsoModelAndGetTorsoAnnotationsForHome___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  HMITorsoAnnotation *v16;
  void *v17;
  void *v18;
  HMITorsoAnnotation *v19;
  int v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "faceRecognition");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    objc_msgSend(v6, "torsoprints");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "hmf_isEmpty");

    if ((v10 & 1) == 0)
    {
      v11 = (void *)MEMORY[0x220735570]();
      v12 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "torsoprints");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543618;
        v21 = v14;
        v22 = 2048;
        v23 = objc_msgSend(v15, "count");
        _os_log_impl(&dword_219D45000, v13, OS_LOG_TYPE_INFO, "%{public}@Creating torso annotation with %lu torsoprints", (uint8_t *)&v20, 0x16u);

      }
      objc_autoreleasePoolPop(v11);
      v16 = [HMITorsoAnnotation alloc];
      objc_msgSend(v6, "faceRecognition");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "torsoprints");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[HMITorsoAnnotation initWithFaceRecognition:torsoprints:](v16, "initWithFaceRecognition:torsoprints:", v17, v18);

      objc_msgSend(*(id *)(a1 + 40), "addObject:", v19);
      objc_msgSend(v6, "flushTorsoprints");

    }
  }

}

- (id)assignSessionEntityToFaceRecognition:(id)a3 torsoRecognition:(id)a4 predictedLinkedEntityUUIDs:(id)a5 availableSessionEntityUUIDs:(id)a6 sessionEntityAssignment:(int64_t *)a7
{
  unint64_t v12;
  unint64_t v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  int *v22;
  void *v23;
  HMISessionEntityManager *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  HMISessionEntityManager *v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  unint64_t v43;
  int64_t *v44;
  _QWORD v45[5];
  id v46;
  id v47;
  id v48;
  uint64_t *v49;
  uint64_t *v50;
  uint64_t *v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  float *v58;
  uint64_t v59;
  int v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;
  void *v73;
  void *v74;
  uint8_t buf[4];
  void *v76;
  __int16 v77;
  uint64_t v78;
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v12 = (unint64_t)a3;
  v13 = (unint64_t)a4;
  v14 = a5;
  v15 = a6;
  if (!(v12 | v13))
    _HMFPreconditionFailure();
  v44 = a7;
  v67 = 0;
  v68 = &v67;
  v69 = 0x3032000000;
  v70 = __Block_byref_object_copy__5;
  v71 = __Block_byref_object_dispose__5;
  v72 = 0;
  v61 = 0;
  v62 = &v61;
  v63 = 0x3032000000;
  v64 = __Block_byref_object_copy__5;
  v65 = __Block_byref_object_dispose__5;
  v66 = 0;
  v57 = 0;
  v58 = (float *)&v57;
  v59 = 0x2020000000;
  v60 = 2139095039;
  v16 = v15;
  v53 = 0;
  v54 = &v53;
  v55 = 0x2020000000;
  v56 = 1;
  v45[0] = MEMORY[0x24BDAC760];
  v45[1] = 3221225472;
  v45[2] = __160__HMISessionEntityManager_assignSessionEntityToFaceRecognition_torsoRecognition_predictedLinkedEntityUUIDs_availableSessionEntityUUIDs_sessionEntityAssignment___block_invoke;
  v45[3] = &unk_24DBEC160;
  v45[4] = self;
  v17 = v14;
  v46 = v17;
  v18 = (id)v12;
  v47 = v18;
  v43 = v13;
  v19 = (id)v13;
  v48 = v19;
  v49 = &v57;
  v50 = &v53;
  v51 = &v67;
  v52 = &v61;
  v20 = objc_msgSend(v16, "na_each:", v45);
  v21 = (void *)v68[5];
  if (v21)
  {
    if (*((_BYTE *)v54 + 24))
      v22 = &kHMIPersonTrackerFaceDistanceMinThreshold;
    else
      v22 = &kHMIPersonTrackerTorsoDistanceMinThreshold;
    if (v58[6] < *(float *)v22)
    {
      if (v12)
      {
        v23 = (void *)MEMORY[0x220735570](v20);
        v24 = self;
        HMFGetOSLogHandle();
        v25 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v68[5];
          *(_DWORD *)buf = 138543618;
          v76 = v26;
          v77 = 2112;
          v78 = v27;
          _os_log_impl(&dword_219D45000, v25, OS_LOG_TYPE_INFO, "%{public}@Adding face to existing sessionEntityUUID: %@ (VIP)", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v23);
        v28 = (void *)v62[5];
        objc_msgSend(v18, "faceprint");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = v29;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v74, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "addFaceprints:", v30);

      }
      if (v43)
      {
        v31 = (void *)MEMORY[0x220735570](v20);
        v32 = self;
        HMFGetOSLogHandle();
        v33 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v68[5];
          *(_DWORD *)buf = 138543618;
          v76 = v34;
          v77 = 2112;
          v78 = v35;
          _os_log_impl(&dword_219D45000, v33, OS_LOG_TYPE_INFO, "%{public}@Adding torso to existing sessionEntityUUID: %@ (VIP)", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v31);
        v36 = (void *)v62[5];
        objc_msgSend(v19, "torsoprint");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = v37;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v73, 1);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "addTorsoprints:", v38);

      }
    }
    v39 = (void *)v62[5];
    objc_msgSend(v17, "allObjects", v43);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addLinkedEntityUUIDs:", v40);

    *v44 = 1;
    v21 = (void *)v68[5];
  }
  v41 = v21;

  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v61, 8);

  _Block_object_dispose(&v67, 8);
  return v41;
}

void __160__HMISessionEntityManager_assignSessionEntityToFaceRecognition_torsoRecognition_predictedLinkedEntityUUIDs_availableSessionEntityUUIDs_sessionEntityAssignment___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  float v12;
  float v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  float v18;
  float v19;
  float v20;
  id v21;

  v21 = a2;
  objc_msgSend(*(id *)(a1 + 32), "sessionEntities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v21);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(void **)(a1 + 40);
  objc_msgSend(v5, "linkedEntityUUIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v6, "intersectsSet:", v7);

  if ((_DWORD)v6)
  {
    if (*(_QWORD *)(a1 + 48) && objc_msgSend(v5, "faceCount"))
    {
      objc_msgSend(*(id *)(a1 + 48), "faceprint");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "data");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "faceCentroid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "data");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMIGreedyClustering faceDistanceFromDescriptor:toDescriptor:](HMIGreedyClustering, "faceDistanceFromDescriptor:toDescriptor:", v9, v11);
      v13 = v12;

    }
    else
    {
      v13 = 3.4028e38;
    }
    if (*(_QWORD *)(a1 + 56) && objc_msgSend(v5, "torsoCount"))
    {
      objc_msgSend(*(id *)(a1 + 56), "torsoprint");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "data");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "torsoCentroid");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "data");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMIGreedyClustering faceDistanceFromDescriptor:toDescriptor:](HMIGreedyClustering, "faceDistanceFromDescriptor:toDescriptor:", v15, v17);
      v19 = v18;

    }
    else
    {
      v19 = 3.4028e38;
    }
    if (v13 >= v19)
      v20 = v19;
    else
      v20 = v13;
    if (v20 < *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v13 <= v19;
      *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v20;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), a2);
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), v5);
    }
  }

}

- (id)clusterSessionEntityToFaceRecognition:(id)a3 torsoRecognition:(id)a4 predictedLinkedEntityUUIDs:(id)a5 availableSessionEntityUUIDs:(id)a6 sessionEntityAssignment:(int64_t *)a7
{
  unint64_t v12;
  unint64_t v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  uint64_t *v18;
  id v19;
  void *v20;
  void *v21;
  HMISessionEntityManager *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  HMISessionEntityManager *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *context;
  id v36;
  _QWORD v37[4];
  id v38;
  HMISessionEntityManager *v39;
  id v40;
  uint64_t *v41;
  uint64_t *v42;
  uint64_t *v43;
  uint64_t *v44;
  uint64_t v45;
  float *v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  float *v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  void *v65;
  void *v66;
  uint8_t buf[4];
  void *v68;
  __int16 v69;
  id v70;
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v12 = (unint64_t)a3;
  v13 = (unint64_t)a4;
  v36 = a5;
  v14 = a6;
  if (!(v12 | v13))
    _HMFPreconditionFailure();
  v15 = v14;
  v59 = 0;
  v60 = &v59;
  v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__5;
  v63 = __Block_byref_object_dispose__5;
  v64 = 0;
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__5;
  v57 = __Block_byref_object_dispose__5;
  v58 = 0;
  v49 = 0;
  v50 = (float *)&v49;
  v51 = 0x2020000000;
  v52 = 2139095039;
  v45 = 0;
  v46 = (float *)&v45;
  v47 = 0x2020000000;
  v48 = 2139095039;
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3221225472;
  v37[2] = __161__HMISessionEntityManager_clusterSessionEntityToFaceRecognition_torsoRecognition_predictedLinkedEntityUUIDs_availableSessionEntityUUIDs_sessionEntityAssignment___block_invoke;
  v37[3] = &unk_24DBEC1D8;
  v16 = (id)v12;
  v38 = v16;
  v39 = self;
  v41 = &v49;
  v42 = &v59;
  v17 = (id)v13;
  v40 = v17;
  v43 = &v45;
  v44 = &v53;
  objc_msgSend(v15, "na_each:", v37);
  if (v50[6] >= 0.17)
  {
    if (v46[6] >= 0.15)
    {
      v19 = 0;
      goto LABEL_17;
    }
    *a7 = 3;
    v18 = v54;
  }
  else
  {
    *a7 = 3;
    v18 = v60;
  }
  v19 = (id)v18[5];
  if (v19)
  {
    -[HMISessionEntityManager sessionEntities](self, "sessionEntities");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      context = (void *)MEMORY[0x220735570]();
      v22 = self;
      HMFGetOSLogHandle();
      v23 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v68 = v24;
        v69 = 2112;
        v70 = v19;
        _os_log_impl(&dword_219D45000, v23, OS_LOG_TYPE_INFO, "%{public}@Adding face to existing sessionEntityUUID: %@ (NN)", buf, 0x16u);

      }
      objc_autoreleasePoolPop(context);
      objc_msgSend(v16, "faceprint");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = v25;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v66, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addFaceprints:", v26);

    }
    if (v13)
    {
      v27 = (void *)MEMORY[0x220735570]();
      v28 = self;
      HMFGetOSLogHandle();
      v29 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v68 = v30;
        v69 = 2112;
        v70 = v19;
        _os_log_impl(&dword_219D45000, v29, OS_LOG_TYPE_INFO, "%{public}@Adding torso to existing sessionEntityUUID: %@ (NN)", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v27);
      objc_msgSend(v17, "torsoprint");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = v31;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v65, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addTorsoprints:", v32);

    }
    objc_msgSend(v36, "allObjects");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addLinkedEntityUUIDs:", v33);

  }
LABEL_17:

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);

  _Block_object_dispose(&v59, 8);
  return v19;
}

void __161__HMISessionEntityManager_clusterSessionEntityToFaceRecognition_torsoRecognition_predictedLinkedEntityUUIDs_availableSessionEntityUUIDs_sessionEntityAssignment___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  __int128 v11;
  _QWORD v12[4];
  id v13;
  id v14;
  __int128 v15;

  v3 = a2;
  v4 = MEMORY[0x24BDAC760];
  v7 = v3;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "objectForKeyedSubscript:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v4;
    v12[1] = 3221225472;
    v12[2] = __161__HMISessionEntityManager_clusterSessionEntityToFaceRecognition_torsoRecognition_predictedLinkedEntityUUIDs_availableSessionEntityUUIDs_sessionEntityAssignment___block_invoke_2;
    v12[3] = &unk_24DBEC188;
    v13 = *(id *)(a1 + 32);
    v15 = *(_OWORD *)(a1 + 56);
    v14 = v7;
    objc_msgSend(v5, "na_each:", v12);

    v3 = v7;
  }
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "objectForKeyedSubscript:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v4;
    v8[1] = 3221225472;
    v8[2] = __161__HMISessionEntityManager_clusterSessionEntityToFaceRecognition_torsoRecognition_predictedLinkedEntityUUIDs_availableSessionEntityUUIDs_sessionEntityAssignment___block_invoke_3;
    v8[3] = &unk_24DBEC1B0;
    v9 = *(id *)(a1 + 48);
    v11 = *(_OWORD *)(a1 + 72);
    v10 = v7;
    objc_msgSend(v6, "na_each:", v8);

    v3 = v7;
  }

}

void __161__HMISessionEntityManager_clusterSessionEntityToFaceRecognition_torsoRecognition_predictedLinkedEntityUUIDs_availableSessionEntityUUIDs_sessionEntityAssignment___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  float v8;
  float v9;
  uint64_t v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "faceprint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[HMIGreedyClustering faceDistanceFromDescriptor:toDescriptor:](HMIGreedyClustering, "faceDistanceFromDescriptor:toDescriptor:", v6, v7);
  v9 = v8;

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (v9 < *(float *)(v10 + 24))
  {
    *(float *)(v10 + 24) = v9;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(a1 + 40));
  }
}

void __161__HMISessionEntityManager_clusterSessionEntityToFaceRecognition_torsoRecognition_predictedLinkedEntityUUIDs_availableSessionEntityUUIDs_sessionEntityAssignment___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  float v8;
  float v9;
  uint64_t v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "torsoprint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[HMIGreedyClustering faceDistanceFromDescriptor:toDescriptor:](HMIGreedyClustering, "faceDistanceFromDescriptor:toDescriptor:", v6, v7);
  v9 = v8;

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (v9 < *(float *)(v10 + 24))
  {
    *(float *)(v10 + 24) = v9;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(a1 + 40));
  }
}

- (void)createSessionEntityWithUUID:(id)a3 faceRecognition:(id)a4 torsoRecognition:(id)a5 predictedLinkedEntityUUIDs:(id)a6 sessionEntityAssignment:(int64_t *)a7
{
  id v12;
  unint64_t v13;
  unint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HMISessionEntityManager *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HMISessionEntityManager *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  unint64_t v33;
  void *v34;
  HMISessionEntityManager *v35;
  NSObject *v36;
  void *v37;
  HMIMutableCluster *v38;
  void *v39;
  HMIMutableCluster *v40;
  void *v41;
  HMISessionEntityManager *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  HMISessionEntityManager *v48;
  NSObject *v49;
  void *v50;
  HMIMutableCluster *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  id v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = (unint64_t)a4;
  v14 = (unint64_t)a5;
  v15 = a6;
  if (!(v13 | v14))
    _HMFPreconditionFailure();
  v16 = v15;
  -[HMISessionEntityManager sessionEntities](self, "sessionEntities");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    *a7 = 5;
    -[HMISessionEntityManager sessionEntities](self, "sessionEntities");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "count");

    if (v33 > 0x3B)
      goto LABEL_26;
    if (v13)
    {
      v34 = (void *)MEMORY[0x220735570]();
      v35 = self;
      HMFGetOSLogHandle();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v60 = v37;
        v61 = 2112;
        v62 = v12;
        _os_log_impl(&dword_219D45000, v36, OS_LOG_TYPE_INFO, "%{public}@Adding new face sessionEntityUUID: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v34);
      v38 = [HMIMutableCluster alloc];
      objc_msgSend((id)v13, "faceprint");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = -[HMIMutableCluster initWithFaceprint:](v38, "initWithFaceprint:", v39);

      if (!v14)
        goto LABEL_25;
      v55 = v16;
      v41 = (void *)MEMORY[0x220735570]();
      v42 = v35;
      HMFGetOSLogHandle();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v60 = v44;
        v61 = 2112;
        v62 = v12;
        _os_log_impl(&dword_219D45000, v43, OS_LOG_TYPE_INFO, "%{public}@Adding new torso sessionEntityUUID: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v41);
      objc_msgSend((id)v14, "torsoprint");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = v45;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v56, 1);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMIMutableCluster addTorsoprints:](v40, "addTorsoprints:", v46);

      v16 = v55;
    }
    else
    {
      if (!v14)
      {
        v40 = 0;
        goto LABEL_25;
      }
      v47 = (void *)MEMORY[0x220735570]();
      v48 = self;
      HMFGetOSLogHandle();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v60 = v50;
        v61 = 2112;
        v62 = v12;
        _os_log_impl(&dword_219D45000, v49, OS_LOG_TYPE_INFO, "%{public}@Adding new torso sessionEntityUUID: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v47);
      v51 = [HMIMutableCluster alloc];
      objc_msgSend((id)v14, "torsoprint");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = -[HMIMutableCluster initWithTorsoprint:](v51, "initWithTorsoprint:", v45);
    }

LABEL_25:
    objc_msgSend(v16, "allObjects");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMIMutableCluster addLinkedEntityUUIDs:](v40, "addLinkedEntityUUIDs:", v52);

    -[HMISessionEntityManager sessionEntities](self, "sessionEntities");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setObject:forKeyedSubscript:", v40, v12);

    goto LABEL_26;
  }
  if (v13)
  {
    v54 = v16;
    v19 = (void *)MEMORY[0x220735570]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v60 = v22;
      v61 = 2112;
      v62 = v12;
      _os_log_impl(&dword_219D45000, v21, OS_LOG_TYPE_INFO, "%{public}@Adding face to existing sessionEntityUUID: %@ (track)", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend((id)v13, "faceprint");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v23;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v58, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addFaceprints:", v24);

    v16 = v54;
  }
  if (v14)
  {
    v25 = (void *)MEMORY[0x220735570]();
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v60 = v28;
      v61 = 2112;
      v62 = v12;
      _os_log_impl(&dword_219D45000, v27, OS_LOG_TYPE_INFO, "%{public}@Adding torso to existing sessionEntityUUID: %@ (track)", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v25);
    objc_msgSend((id)v14, "torsoprint");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v29;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v57, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addTorsoprints:", v30);

  }
  objc_msgSend(v16, "allObjects");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addLinkedEntityUUIDs:", v31);

  *a7 = 2;
LABEL_26:

}

- (void)updatePreviousPrintsForSessionEntityUUID:(id)a3 faceRecognition:(id)a4 torsoRecognition:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v8 = a4;
  v9 = a5;
  if (v8)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_sessionUUIDToPreviousFaceprints, "objectForKeyedSubscript:", v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = v10;
      if (objc_msgSend(v10, "count") == 5)
        objc_msgSend(v11, "removeObjectAtIndex:", 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sessionUUIDToPreviousFaceprints, "setObject:forKeyedSubscript:", v11, v16);
    }
    objc_msgSend(v8, "faceprint");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v12);

  }
  if (v9)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_sessionUUIDToPreviousTorsoprints, "objectForKeyedSubscript:", v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = v13;
      if (objc_msgSend(v13, "count") == 5)
        objc_msgSend(v14, "removeObjectAtIndex:", 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sessionUUIDToPreviousTorsoprints, "setObject:forKeyedSubscript:", v14, v16);
    }
    objc_msgSend(v9, "torsoprint");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v15);

  }
}

+ (id)updatePersonEventWithPersonEvent:(id)a3 sessionEntityUUID:(id)a4 predictedLinkedEntityUUIDs:(id)a5 sessionEntityAssignment:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  HMIFaceRecognition *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  int64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  char v49;
  HMITorsoRecognition *v50;
  void *v51;
  void *v52;
  HMITorsoClassification *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  HMITorsoClassification *v59;
  HMITorsoRecognition *v60;
  void *v61;
  HMIVideoAnalyzerEventTorso *v62;
  void *v63;
  void *v64;
  void *v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v79;
  HMIVideoAnalyzerEventFace *v80;
  uint64_t v81;
  HMIFaceRecognition *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  int64_t v87;
  id v88;
  id v89;
  void *v90;
  void *v91;
  _QWORD v92[4];
  id v93;
  id v94;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v10, "face");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "face");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    objc_msgSend(v10, "face");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "faceRecognition");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v10, "face");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "faceRecognition");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "classifications");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v92[0] = MEMORY[0x24BDAC760];
      v92[1] = 3221225472;
      v92[2] = __129__HMISessionEntityManager_updatePersonEventWithPersonEvent_sessionEntityUUID_predictedLinkedEntityUUIDs_sessionEntityAssignment___block_invoke;
      v92[3] = &unk_24DBEC200;
      v21 = v11;
      v93 = v21;
      v94 = a1;
      objc_msgSend(v20, "na_map:", v92);
      v85 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = [HMIFaceRecognition alloc];
      v86 = v19;
      objc_msgSend(v19, "faceCrop");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "faceprint");
      v90 = v13;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "faceQualityScore");
      v82 = -[HMIFaceRecognition initWithFaceCrop:faceprint:classifications:predictedLinkedEntityUUIDs:faceQualityScore:sessionEntityAssignment:sessionEntityUUID:](v22, "initWithFaceCrop:faceprint:classifications:predictedLinkedEntityUUIDs:faceQualityScore:sessionEntityAssignment:sessionEntityUUID:", v23, v24, v85, v12, a6, v21);

      v80 = [HMIVideoAnalyzerEventFace alloc];
      objc_msgSend(v10, "face");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "confidence");
      v88 = v11;
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "face");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "boundingBox");
      v26 = v25;
      v28 = v27;
      v30 = v29;
      v32 = v31;
      objc_msgSend(v10, "face");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "yaw");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "face");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "roll");
      v36 = v12;
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "face");
      v38 = a6;
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "userInfo");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = -[HMIVideoAnalyzerEventFace initWithConfidence:boundingBox:yaw:roll:faceRecognition:torsoAnnotation:userInfo:](v80, "initWithConfidence:boundingBox:yaw:roll:faceRecognition:torsoAnnotation:userInfo:", v79, v34, v37, v82, 0, v40, v26, v28, v30, v32);

      a6 = v38;
      v12 = v36;

      v11 = v88;
      v13 = (void *)v81;
    }
  }
  objc_msgSend(v10, "torso");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "torso");
  v42 = objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    v43 = (void *)v42;
    objc_msgSend(v10, "torso");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "torsoRecognition");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (v45)
    {
      v89 = v12;
      v91 = v13;
      objc_msgSend(v10, "torso");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "torsoRecognition");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "torsoprint");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v48, "unrecognizable");

      if ((v49 & 1) != 0)
      {
        v50 = 0;
      }
      else
      {
        objc_msgSend(v10, "torso");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "torsoRecognition");
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        v53 = [HMITorsoClassification alloc];
        objc_msgSend(v52, "classification");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "personUUID");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "classification");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "sourceUUID");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "classification");
        v87 = a6;
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "confidence");
        v59 = -[HMITorsoClassification initWithPersonUUID:sourceUUID:confidence:](v53, "initWithPersonUUID:sourceUUID:confidence:", v55, v57);

        v60 = [HMITorsoRecognition alloc];
        objc_msgSend(v52, "torsoprint");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = -[HMITorsoRecognition initWithTorsoprint:classification:predictedLinkedEntityUUIDs:sessionEntityAssignment:sessionEntityUUID:](v60, "initWithTorsoprint:classification:predictedLinkedEntityUUIDs:sessionEntityAssignment:sessionEntityUUID:", v61, v59, v89, v87, v11);

      }
      v62 = [HMIVideoAnalyzerEventTorso alloc];
      objc_msgSend(v10, "torso");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "confidence");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "torso");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "boundingBox");
      v67 = v66;
      v69 = v68;
      v71 = v70;
      v73 = v72;
      objc_msgSend(v10, "torso");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "roll");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = -[HMIVideoAnalyzerEventTorso initWithConfidence:boundingBox:roll:torsoRecognition:](v62, "initWithConfidence:boundingBox:roll:torsoRecognition:", v64, v75, v50, v67, v69, v71, v73);

      v41 = (void *)v76;
      v12 = v89;
      v13 = v91;
    }
  }
  v77 = (void *)objc_msgSend(v10, "copyWithFaceEvent:torso:", v13, v41);

  return v77;
}

HMIFaceClassification *__129__HMISessionEntityManager_updatePersonEventWithPersonEvent_sessionEntityUUID_predictedLinkedEntityUUIDs_sessionEntityAssignment___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HMIFaceClassification *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  HMIFaceClassification *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  HMIFaceClassification *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = [HMIFaceClassification alloc];
  objc_msgSend(v3, "personUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sourceUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "faceCrop");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "faceprint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "confidence");
  v11 = -[HMIFaceClassification initWithUUID:sourceUUID:sessionEntityUUID:faceCrop:faceprint:confidence:fromTorsoClassification:familiarity:](v4, "initWithUUID:sourceUUID:sessionEntityUUID:faceCrop:faceprint:confidence:fromTorsoClassification:familiarity:", v5, v6, v7, v8, v9, objc_msgSend(v3, "fromTorsoClassification"), v10, objc_msgSend(v3, "familiarity"));

  v12 = (void *)MEMORY[0x220735570]();
  v13 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = v15;
    v19 = 2112;
    v20 = v11;
    _os_log_impl(&dword_219D45000, v14, OS_LOG_TYPE_INFO, "%{public}@%@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v12);

  return v11;
}

- (NSMutableDictionary)sessionEntities
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (double)faceVIPThresholdForTorsoAnnotation
{
  return self->_faceVIPThresholdForTorsoAnnotation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionEntities, 0);
  objc_storeStrong((id *)&self->_personTracker, 0);
  objc_storeStrong((id *)&self->_sessionUUIDToPreviousTorsoprints, 0);
  objc_storeStrong((id *)&self->_sessionUUIDToPreviousFaceprints, 0);
}

@end
