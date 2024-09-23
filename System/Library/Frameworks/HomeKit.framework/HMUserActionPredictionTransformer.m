@implementation HMUserActionPredictionTransformer

- (id)predictionsWithDuetPredictions:(id)a3 forHome:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  HMUserActionPredictionTransformer *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  const char *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  void *v32;
  void *v34;
  id obj;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
LABEL_33:
    _HMFPreconditionFailure();
  }
  if (!v7)
    goto LABEL_33;
  v36 = v7;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
  if (!v8)
    goto LABEL_31;
  v9 = v8;
  v10 = *(_QWORD *)v38;
  v11 = 0x1E0CB3000uLL;
  do
  {
    v12 = 0;
    do
    {
      if (*(_QWORD *)v38 != v10)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v12);
      v14 = objc_alloc(*(Class *)(v11 + 2600));
      objc_msgSend(v13, "targetIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v14, "initWithUUIDString:", v15);

      if (!v16)
      {
        v19 = (void *)MEMORY[0x1A1AC1AAC]();
        v20 = self;
        HMFGetOSLogHandle();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v42 = v22;
          v43 = 2112;
          v44 = v36;
          v45 = 2112;
          v46 = v13;
          v23 = v21;
          v24 = "%{public}@Bad prediction for home %@ from duet, missing targetIdentifier (%@)";
          goto LABEL_19;
        }
LABEL_20:

        objc_autoreleasePoolPop(v19);
        goto LABEL_21;
      }
      if ((objc_msgSend(v13, "hasPredictionType") & 1) == 0)
      {
        v19 = (void *)MEMORY[0x1A1AC1AAC]();
        v20 = self;
        HMFGetOSLogHandle();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v42 = v22;
          v43 = 2112;
          v44 = v36;
          v45 = 2112;
          v46 = v13;
          v23 = v21;
          v24 = "%{public}@Bad prediction for home %@ from duet, missing prediction type (%@)";
LABEL_19:
          _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_ERROR, v24, buf, 0x20u);

          v11 = 0x1E0CB3000;
        }
        goto LABEL_20;
      }
      v17 = objc_msgSend(v13, "predictionType");
      if (v17 == 2)
      {
        -[HMUserActionPredictionTransformer predictionForDuetAccessoryPrediction:home:](self, "predictionForDuetAccessoryPrediction:home:", v13, v36);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          -[HMUserActionPredictionTransformer predictionWithSameTargetGroupAsPrediction:inPredictions:](self, "predictionWithSameTargetGroupAsPrediction:inPredictions:", v25, v34);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v26;
          if (!v26)
            goto LABEL_27;
          objc_msgSend(v26, "predictionScore");
          v29 = v28;
          objc_msgSend(v25, "predictionScore");
          if (v29 <= v30)
          {
            objc_msgSend(v34, "removeObject:", v27);
LABEL_27:
            objc_msgSend(v34, "addObject:", v25);
          }

          v11 = 0x1E0CB3000;
        }

        goto LABEL_21;
      }
      if (v17 == 1)
      {
        -[HMUserActionPredictionTransformer predictionForDuetScenePrediction:home:](self, "predictionForDuetScenePrediction:home:", v13, v36);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
          objc_msgSend(v34, "addObject:", v18);

      }
LABEL_21:

      ++v12;
    }
    while (v9 != v12);
    v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    v9 = v31;
  }
  while (v31);
LABEL_31:

  v32 = (void *)objc_msgSend(v34, "copy");
  return v32;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t5_16354 != -1)
    dispatch_once(&logCategory__hmf_once_t5_16354, &__block_literal_global_16355);
  return (id)logCategory__hmf_once_v6_16356;
}

void __48__HMUserActionPredictionTransformer_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v6_16356;
  logCategory__hmf_once_v6_16356 = v0;

}

- (id)predictionWithSameTargetGroupAsPrediction:(id)a3 inPredictions:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, void *);
  uint64_t *v10;
  void *v11;
  HMUserActionPredictionTransformer *v13;
  SEL v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v7 = v6;
    if (v6)
    {
      v8 = objc_msgSend(v5, "predictionType");
      if (v8 == 3)
      {
        v17 = MEMORY[0x1E0C809B0];
        v9 = __93__HMUserActionPredictionTransformer_predictionWithSameTargetGroupAsPrediction_inPredictions___block_invoke_2;
        v10 = &v17;
      }
      else
      {
        if (v8 != 4)
        {
          v11 = 0;
          goto LABEL_9;
        }
        v18 = MEMORY[0x1E0C809B0];
        v9 = __93__HMUserActionPredictionTransformer_predictionWithSameTargetGroupAsPrediction_inPredictions___block_invoke;
        v10 = &v18;
      }
      v10[1] = 3221225472;
      v10[2] = (uint64_t)v9;
      v10[3] = (uint64_t)&unk_1E3AAF9B8;
      v10[4] = (uint64_t)v5;
      objc_msgSend(v7, "na_firstObjectPassingTest:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
      return v11;
    }
  }
  else
  {
    _HMFPreconditionFailure();
  }
  v13 = (HMUserActionPredictionTransformer *)_HMFPreconditionFailure();
  return -[HMUserActionPredictionTransformer predictionForDuetScenePrediction:home:](v13, v14, v15, v16);
}

- (id)predictionForDuetScenePrediction:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  HMUserActionPrediction *v14;
  void *v15;
  HMUserActionPrediction *v16;
  void *v17;
  HMUserActionPredictionTransformer *v18;
  NSObject *v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "predictionType") != 1)
  {
    _HMFPreconditionFailure();
LABEL_10:
    _HMFPreconditionFailure();
  }
  if (!v7)
    goto LABEL_10;
  v8 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v6, "targetIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithUUIDString:", v9);

  objc_msgSend(v7, "actionSets");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __75__HMUserActionPredictionTransformer_predictionForDuetScenePrediction_home___block_invoke;
  v22[3] = &unk_1E3AAF9E0;
  v12 = v10;
  v23 = v12;
  objc_msgSend(v11, "na_firstObjectPassingTest:", v22);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = [HMUserActionPrediction alloc];
    objc_msgSend(v13, "uniqueIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "score");
    v16 = -[HMUserActionPrediction initWithPredictionTargetUUID:predictionType:predictionScore:](v14, "initWithPredictionTargetUUID:predictionType:predictionScore:", v15, 1);

  }
  else
  {
    v17 = (void *)MEMORY[0x1A1AC1AAC]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v20;
      v26 = 2112;
      v27 = v6;
      _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Bad scene prediction from duet, missing predicted action set in home (%@)", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    v16 = 0;
  }

  return v16;
}

- (id)predictionForDuetAccessoryPrediction:(id)a3 home:(id)a4
{
  id *v4;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  HMUserActionPrediction *v15;
  HMUserActionPrediction *v16;
  void *v17;
  HMUserActionPredictionTransformer *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  HMUserActionPrediction *v25;
  void *v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, void *);
  void *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "predictionType") != 2)
  {
    _HMFPreconditionFailure();
LABEL_18:
    _HMFPreconditionFailure();
  }
  if (!v8)
    goto LABEL_18;
  -[HMUserActionPredictionTransformer matchingAccessoryForDuetAccessoryPrediction:home:](self, "matchingAccessoryForDuetAccessoryPrediction:home:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[HMUserActionPredictionTransformer matchingServiceForDuetAccessoryPrediction:onAccessory:home:](self, "matchingServiceForDuetAccessoryPrediction:onAccessory:home:", v7, v9, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    if (!v10)
      goto LABEL_10;
    objc_msgSend(v8, "serviceGroups");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v11;
    v34[1] = 3221225472;
    v34[2] = __79__HMUserActionPredictionTransformer_predictionForDuetAccessoryPrediction_home___block_invoke;
    v34[3] = &unk_1E3AAFA30;
    v4 = &v35;
    v35 = v10;
    objc_msgSend(v12, "na_firstObjectPassingTest:", v34);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "uniqueIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = [HMUserActionPrediction alloc];
      objc_msgSend(v7, "score");
      v16 = -[HMUserActionPrediction initWithPredictionTargetUUID:predictionType:predictionScore:](v15, "initWithPredictionTargetUUID:predictionType:predictionScore:", v14, 3);

    }
    else
    {
LABEL_10:
      objc_msgSend(v8, "mediaSystems");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v11;
      v30 = 3221225472;
      v31 = __79__HMUserActionPredictionTransformer_predictionForDuetAccessoryPrediction_home___block_invoke_3;
      v32 = &unk_1E3AAFA80;
      v22 = v9;
      v33 = v22;
      objc_msgSend(v21, "na_firstObjectPassingTest:", &v29);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "uniqueIdentifier", v29, v30, v31, v32);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = [HMUserActionPrediction alloc];
      if (v24)
      {
        objc_msgSend(v7, "score");
        v16 = -[HMUserActionPrediction initWithPredictionTargetUUID:predictionType:predictionScore:](v25, "initWithPredictionTargetUUID:predictionType:predictionScore:", v24, 4);
      }
      else
      {
        objc_msgSend(v22, "uniqueIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "uniqueIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "score");
        v16 = -[HMUserActionPrediction initWithPredictionTargetUUID:targetServiceUUID:predictionType:predictionScore:](v25, "initWithPredictionTargetUUID:targetServiceUUID:predictionType:predictionScore:", v26, v27, 2);

      }
      if (!v10)
        goto LABEL_15;
    }

LABEL_15:
    goto LABEL_16;
  }
  v17 = (void *)MEMORY[0x1A1AC1AAC]();
  v18 = self;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v37 = v20;
    v38 = 2112;
    v39 = v7;
    _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Bad service prediction retrieved from duet, missing predicted service in home (%@)", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v17);
  v16 = 0;
LABEL_16:

  return v16;
}

- (id)matchingAccessoryForDuetAccessoryPrediction:(id)a3 home:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  id v31;
  int v32;
  void *v33;
  HMUserActionPredictionTransformer *v34;
  NSObject *v35;
  void *v36;
  id v38;
  id v39;
  void *v40;
  id obj;
  void *v43;
  _QWORD v44[4];
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  id v59;
  __int16 v60;
  id v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "predictionType") != 2)
  {
    _HMFPreconditionFailure();
LABEL_40:
    _HMFPreconditionFailure();
  }
  if (!v6)
    goto LABEL_40;
  v7 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v5, "targetIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "initWithUUIDString:", v8);

  objc_msgSend(v5, "targetAccessoryServiceIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v5, "targetAccessoryServiceIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void *)objc_msgSend(v11, "initWithUUIDString:", v12);

  }
  else
  {
    v43 = 0;
  }

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  objc_msgSend(v6, "accessories");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
  v40 = (void *)v9;
  if (v14)
  {
    v15 = v14;
    v38 = v5;
    v39 = v6;
    v16 = *(_QWORD *)v51;
LABEL_8:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v51 != v16)
        objc_enumerationMutation(v13);
      v18 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v17);
      objc_msgSend(v18, "uniqueIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "hmf_isEqualToUUID:", v9);

      objc_msgSend(v18, "uniqueIdentifiersForBridgedAccessories");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "count");

      if (v22 && v20 != 0)
        break;
      if (v20
        && -[HMUserActionPredictionTransformer isValidPredictionForAccessory:targetServiceIdentifier:](self, "isValidPredictionForAccessory:targetServiceIdentifier:", v18, v43))
      {
        v24 = v18;
LABEL_37:
        v5 = v38;
        v6 = v39;
        goto LABEL_38;
      }
      if (v15 == ++v17)
      {
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
        if (v15)
          goto LABEL_8;
        v24 = 0;
        goto LABEL_37;
      }
    }
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    objc_msgSend(v18, "bridgedAccessories");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v62, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v47;
      while (2)
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v47 != v27)
            objc_enumerationMutation(obj);
          v29 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
          objc_msgSend(v29, "services");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v44[0] = MEMORY[0x1E0C809B0];
          v44[1] = 3221225472;
          v44[2] = __86__HMUserActionPredictionTransformer_matchingAccessoryForDuetAccessoryPrediction_home___block_invoke;
          v44[3] = &unk_1E3AAFA08;
          v31 = v43;
          v45 = v31;
          v32 = objc_msgSend(v30, "na_any:", v44);

          if (v32
            && -[HMUserActionPredictionTransformer isValidPredictionForAccessory:targetServiceIdentifier:](self, "isValidPredictionForAccessory:targetServiceIdentifier:", v29, v31))
          {
            v24 = v29;

            v5 = v38;
            goto LABEL_35;
          }

        }
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v62, 16);
        if (v26)
          continue;
        break;
      }
    }

    v33 = (void *)MEMORY[0x1A1AC1AAC]();
    v34 = self;
    HMFGetOSLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    v5 = v38;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v55 = v36;
      v56 = 2112;
      v57 = v18;
      v58 = 2112;
      v59 = v39;
      v60 = 2112;
      v61 = v38;
      _os_log_impl(&dword_19B1B0000, v35, OS_LOG_TYPE_ERROR, "%{public}@Bad accessory prediction from duet, found bridge: %@ but couldn't find accessory in home (%@) for prediction: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v33);
    v24 = 0;
LABEL_35:
    v6 = v39;
  }
  else
  {
    v24 = 0;
  }
LABEL_38:

  return v24;
}

- (id)matchingServiceForDuetAccessoryPrediction:(id)a3 onAccessory:(id)a4 home:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  HMUserActionPredictionTransformer *v18;
  SEL v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v7, "predictionType") != 2)
  {
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v8)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!v9)
  {
LABEL_11:
    v18 = (HMUserActionPredictionTransformer *)_HMFPreconditionFailure();
    return (id)-[HMUserActionPredictionTransformer isValidPredictionForAccessory:targetServiceIdentifier:](v18, v19, v20, v21);
  }
  objc_msgSend(v7, "targetAccessoryServiceIdentifier");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    v12 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v7, "targetAccessoryServiceIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithUUIDString:", v13);

    if (v14)
    {
      objc_msgSend(v8, "services");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __96__HMUserActionPredictionTransformer_matchingServiceForDuetAccessoryPrediction_onAccessory_home___block_invoke;
      v22[3] = &unk_1E3AAFA08;
      v23 = v14;
      v16 = v14;
      objc_msgSend(v15, "na_firstObjectPassingTest:", v22);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)isValidPredictionForAccessory:(id)a3 targetServiceIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;
  BOOL v12;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v7 = v6;
    objc_msgSend(v5, "mediaProfile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v5, "services");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __91__HMUserActionPredictionTransformer_isValidPredictionForAccessory_targetServiceIdentifier___block_invoke;
      v16[3] = &unk_1E3AAFA08;
      v17 = v7;
      v10 = objc_msgSend(v9, "na_any:", v16);

    }
    else
    {
      v10 = 0;
    }
    if (v7)
      v11 = 1;
    else
      v11 = v8 == 0;
    if (v11)
      v12 = v10;
    else
      v12 = 1;

    return v12;
  }
  else
  {
    v14 = _HMFPreconditionFailure();
    return __91__HMUserActionPredictionTransformer_isValidPredictionForAccessory_targetServiceIdentifier___block_invoke(v14, v15);
  }
}

uint64_t __91__HMUserActionPredictionTransformer_isValidPredictionForAccessory_targetServiceIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __96__HMUserActionPredictionTransformer_matchingServiceForDuetAccessoryPrediction_onAccessory_home___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __86__HMUserActionPredictionTransformer_matchingAccessoryForDuetAccessoryPrediction_home___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __79__HMUserActionPredictionTransformer_predictionForDuetAccessoryPrediction_home___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(a2, "services");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __79__HMUserActionPredictionTransformer_predictionForDuetAccessoryPrediction_home___block_invoke_2;
  v6[3] = &unk_1E3AAFA08;
  v7 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __79__HMUserActionPredictionTransformer_predictionForDuetAccessoryPrediction_home___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(a2, "components");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __79__HMUserActionPredictionTransformer_predictionForDuetAccessoryPrediction_home___block_invoke_4;
  v6[3] = &unk_1E3AAFA58;
  v7 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __79__HMUserActionPredictionTransformer_predictionForDuetAccessoryPrediction_home___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "hmf_isEqualToUUID:", v5);

  return v6;
}

uint64_t __79__HMUserActionPredictionTransformer_predictionForDuetAccessoryPrediction_home___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "hmf_isEqualToUUID:", v4);

  return v5;
}

uint64_t __75__HMUserActionPredictionTransformer_predictionForDuetScenePrediction_home___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hmf_isEqualToUUID:", *(_QWORD *)(a1 + 32));

  if ((_DWORD)v5)
  {
    objc_msgSend(v3, "actions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "count") != 0;

  }
  return v5;
}

uint64_t __93__HMUserActionPredictionTransformer_predictionWithSameTargetGroupAsPrediction_inPredictions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  if (objc_msgSend(v3, "predictionType") == 4)
  {
    objc_msgSend(*(id *)(a1 + 32), "predictionTargetUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "predictionTargetUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "hmf_isEqualToUUID:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __93__HMUserActionPredictionTransformer_predictionWithSameTargetGroupAsPrediction_inPredictions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  if (objc_msgSend(v3, "predictionType") == 3)
  {
    objc_msgSend(*(id *)(a1 + 32), "predictionTargetUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "predictionTargetUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "hmf_isEqualToUUID:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
