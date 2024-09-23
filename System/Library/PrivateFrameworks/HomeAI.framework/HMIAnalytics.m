@implementation HMIAnalytics

+ (BOOL)upload
{
  void *v2;
  char v3;

  +[HMIPreference sharedInstance](HMIPreference, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLPreferenceForKey:defaultValue:", CFSTR("uploadVideoAnalysisEvent"), 1);

  return v3;
}

+ (BOOL)lazyPayloads
{
  return 1;
}

+ (BOOL)sendEventWithName:(id)a3 payloadBuilder:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  char v8;
  void *v9;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (objc_msgSend(a1, "upload"))
  {
    if (objc_msgSend(a1, "lazyPayloads"))
    {
      v8 = AnalyticsSendEventLazy();
    }
    else
    {
      v7[2](v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      AnalyticsSendEvent();

      v8 = 1;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)payloadWithCamera:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "manufacturer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "manufacturer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("cameraManufacturer"));

  }
  objc_msgSend(v3, "model");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v3, "model");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("cameraModel"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v3, "hasBattery"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("cameraHasBattery"));

  v10 = (void *)objc_msgSend(v4, "copy");
  return v10;
}

+ (void)sendEventForPersonRecognitionType:(int64_t)a3 camera:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    +[HMIAnalytics payloadWithCamera:](HMIAnalytics, "payloadWithCamera:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addEntriesFromDictionary:", v8);

  }
  if (!a3)
  {
    v9 = CFSTR("face");
    goto LABEL_7;
  }
  if (a3 == 1)
  {
    v9 = CFSTR("torso");
LABEL_7:
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("recognitionType"));
  }
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __57__HMIAnalytics_sendEventForPersonRecognitionType_camera___block_invoke;
  v11[3] = &unk_24DBEC848;
  v12 = v7;
  v10 = v7;
  objc_msgSend(a1, "sendEventWithName:payloadBuilder:", CFSTR("com.apple.HomeAI.PersonRecognitionEvent"), v11);

}

id __57__HMIAnalytics_sendEventForPersonRecognitionType_camera___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (void)videoAnalyzerDidFindFaceEvent:(id)a3 homePersonManagerUUID:(id)a4 camera:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  id v15;

  v15 = a3;
  v7 = a4;
  v8 = a5;
  objc_msgSend(v15, "faceRecognition");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "classifications");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "na_any:", &__block_literal_global_24);

  objc_msgSend(v15, "faceRecognition");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "classifications");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "na_any:", &__block_literal_global_18);

  if (v11)
    +[HMIAnalytics sendEventForPersonRecognitionType:camera:](HMIAnalytics, "sendEventForPersonRecognitionType:camera:", 0, v8);
  if (v14)
    +[HMIAnalytics sendEventForPersonRecognitionType:camera:](HMIAnalytics, "sendEventForPersonRecognitionType:camera:", 1, v8);
  else
    +[HMIAnalytics sendEventForFaceEvent:homePersonManagerUUID:camera:](HMIAnalytics, "sendEventForFaceEvent:homePersonManagerUUID:camera:", v15, v7, v8);

}

BOOL __75__HMIAnalytics_videoAnalyzerDidFindFaceEvent_homePersonManagerUUID_camera___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = (objc_msgSend(v2, "fromTorsoClassification") & 1) == 0 && objc_msgSend(v2, "familiarity") == 2;

  return v3;
}

BOOL __75__HMIAnalytics_videoAnalyzerDidFindFaceEvent_homePersonManagerUUID_camera___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  if (objc_msgSend(v2, "fromTorsoClassification"))
    v3 = objc_msgSend(v2, "familiarity") == 2;
  else
    v3 = 0;

  return v3;
}

+ (void)sendEventForFaceEvent:(id)a3 homePersonManagerUUID:(id)a4 camera:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    +[HMIAnalytics payloadWithCamera:](HMIAnalytics, "payloadWithCamera:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addEntriesFromDictionary:", v12);

  }
  v13 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v8, "confidence");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "value");
  objc_msgSend(v13, "numberWithDouble:", ceil(v15 * 10.0));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, CFSTR("detectionScore"));

  objc_msgSend(v8, "userInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("FaceFilteredState"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, CFSTR("faceFilteredState"));
  objc_msgSend(v8, "faceRecognition");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = MEMORY[0x24BDAC760];
  if (v19)
  {
    v33 = a1;
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "faceRecognition");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "classifications");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v20;
    v36[1] = 3221225472;
    v36[2] = __67__HMIAnalytics_sendEventForFaceEvent_homePersonManagerUUID_camera___block_invoke;
    v36[3] = &unk_24DBEC8B0;
    v37 = v9;
    v24 = v11;
    v38 = v24;
    v25 = v21;
    v39 = v25;
    objc_msgSend(v23, "na_each:", v36);

    if (objc_msgSend(v25, "count"))
    {
      objc_msgSend(v25, "allObjects");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "sortedArrayUsingComparator:", &__block_literal_global_28);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v27, "firstObject");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      HMIFaceFamiliarityAsString(objc_msgSend(v28, "integerValue"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v29, CFSTR("externalFamiliarity"));

    }
    objc_msgSend(v8, "faceRecognition");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    HMISessionEntityAssignmentAsString(objc_msgSend(v30, "sessionEntityAssignment"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v31, CFSTR("sessionEntityAssignment"));

    a1 = v33;
    v20 = MEMORY[0x24BDAC760];
  }
  v34[0] = v20;
  v34[1] = 3221225472;
  v34[2] = __67__HMIAnalytics_sendEventForFaceEvent_homePersonManagerUUID_camera___block_invoke_3;
  v34[3] = &unk_24DBEC848;
  v35 = v11;
  v32 = v11;
  objc_msgSend(a1, "sendEventWithName:payloadBuilder:", CFSTR("com.apple.HomeAI.FaceEvent"), v34);

}

void __67__HMIAnalytics_sendEventForFaceEvent_homePersonManagerUUID_camera___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  objc_msgSend(v3, "sourceUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v5)
  {
    v6 = objc_msgSend(v3, "familiarity");

    HMIFaceFamiliarityAsString(v6);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:");
  }
  else
  {
    v7 = *(void **)(a1 + 48);
    v8 = (void *)MEMORY[0x24BDD16E0];
    v9 = objc_msgSend(v3, "familiarity");

    objc_msgSend(v8, "numberWithInteger:", v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:");
  }

}

BOOL __67__HMIAnalytics_sendEventForFaceEvent_homePersonManagerUUID_camera___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(a2, "integerValue");
  v6 = objc_msgSend(v4, "integerValue");

  return v5 > v6;
}

id __67__HMIAnalytics_sendEventForFaceEvent_homePersonManagerUUID_camera___block_invoke_3(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (void)sendEventForClusteringTask:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "numberOfFaceprintsClustered"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("faceprintsClustered"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "numberOfClusters"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("clusters"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "numberOfPersonsCreated"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("personsCreated"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "numberOfUnknownFaceprintsAssociated"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("faceprintsAssociated"));

  v10 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "faceprintingDuration");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("faceprintingDuration"));

  v12 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "clusteringDuration");
  objc_msgSend(v12, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("clusteringDuration"));

  v14 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "totalDuration");
  objc_msgSend(v14, "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("totalDuration"));

  objc_msgSend(v4, "error");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v4, "error");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "numberWithInteger:", objc_msgSend(v18, "code"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("errorCode"));

    objc_msgSend(v4, "error");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "description");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v21, CFSTR("errorDescription"));

  }
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __43__HMIAnalytics_sendEventForClusteringTask___block_invoke;
  v23[3] = &unk_24DBEC848;
  v24 = v5;
  v22 = v5;
  objc_msgSend(a1, "sendEventWithName:payloadBuilder:", CFSTR("com.apple.HomeAI.FaceClustering"), v23);

}

id __43__HMIAnalytics_sendEventForClusteringTask___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (void)sendEventForPersonsModels:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[7];
  _QWORD v36[9];

  v36[7] = *MEMORY[0x24BDAC8D0];
  v24 = a3;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = a1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "modelSummaries");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __42__HMIAnalytics_sendEventForPersonsModels___block_invoke;
  v27[3] = &unk_24DBEC940;
  v7 = v4;
  v28 = v7;
  v30 = &v31;
  v8 = v5;
  v29 = v8;
  objc_msgSend(v6, "na_each:", v27);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", +[HMIAnalytics bucketForValue:usingBuckets:](HMIAnalytics, "bucketForValue:usingBuckets:", objc_msgSend(v7, "count"), &unk_24DC151A0));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKeyPath:", CFSTR("@avg.self"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", +[HMIAnalytics bucketForValue:usingBuckets:](HMIAnalytics, "bucketForValue:usingBuckets:", objc_msgSend(v9, "integerValue"), &unk_24DC151B8));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32[3])
  {
    v11 = (void *)MEMORY[0x24BDD16E0];
    v12 = objc_msgSend(v8, "count");
    objc_msgSend(v11, "numberWithUnsignedInteger:", v12 / v32[3]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = &unk_24DC14738;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", +[HMIAnalytics bucketForValue:usingBuckets:](HMIAnalytics, "bucketForValue:usingBuckets:", objc_msgSend(v13, "integerValue"), &unk_24DC151D0));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "valueForKeyPath:", CFSTR("@avg.self"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", +[HMIAnalytics bucketForValue:usingBuckets:](HMIAnalytics, "bucketForValue:usingBuckets:", objc_msgSend(v15, "integerValue"), &unk_24DC151E8));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", +[HMIAnalytics bucketForValue:usingBuckets:](HMIAnalytics, "bucketForValue:usingBuckets:", objc_msgSend(v24, "homeToExternalEquivalencies"), &unk_24DC15200));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", +[HMIAnalytics bucketForValue:usingBuckets:](HMIAnalytics, "bucketForValue:usingBuckets:", objc_msgSend(v24, "externalToExternalEquivalencies"), &unk_24DC15218));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = CFSTR("externalLibraries");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v32[3]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v19;
  v36[1] = v23;
  v35[1] = CFSTR("homeIdentities");
  v35[2] = CFSTR("averageExternalIdentities");
  v36[2] = v14;
  v36[3] = v10;
  v35[3] = CFSTR("averageHomeFaceCrops");
  v35[4] = CFSTR("averageExternalFaceCrops");
  v36[4] = v16;
  v36[5] = v17;
  v35[5] = CFSTR("homeToExternal");
  v35[6] = CFSTR("externalToExternal");
  v36[6] = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __42__HMIAnalytics_sendEventForPersonsModels___block_invoke_94;
  v25[3] = &unk_24DBEC968;
  v21 = v20;
  v26 = v21;
  objc_msgSend(v22, "sendEventWithName:payloadBuilder:", CFSTR("com.apple.HomeAI.PersonsModels"), v25);

  _Block_object_dispose(&v31, 8);
}

void __42__HMIAnalytics_sendEventForPersonsModels___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  id v16;

  v3 = a2;
  if ((objc_msgSend(v3, "isExternalLibrary") & 1) != 0)
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    objc_msgSend(v3, "faceCountsByPerson");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = MEMORY[0x24BDAC760];
    v8 = 3221225472;
    v9 = __42__HMIAnalytics_sendEventForPersonsModels___block_invoke_3;
    v10 = &unk_24DBEC918;
    v5 = &v11;
    v11 = *(id *)(a1 + 40);
    v6 = &v7;
  }
  else
  {
    objc_msgSend(v3, "faceCountsByPerson");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = __42__HMIAnalytics_sendEventForPersonsModels___block_invoke_2;
    v15 = &unk_24DBEC918;
    v5 = &v16;
    v16 = *(id *)(a1 + 32);
    v6 = &v12;
  }
  objc_msgSend(v4, "na_each:", v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16);

}

uint64_t __42__HMIAnalytics_sendEventForPersonsModels___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

uint64_t __42__HMIAnalytics_sendEventForPersonsModels___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

id __42__HMIAnalytics_sendEventForPersonsModels___block_invoke_94(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (int64_t)bucketForValue:(int64_t)a3 usingBuckets:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  int64_t v10;
  _QWORD v12[5];

  v5 = a4;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __44__HMIAnalytics_bucketForValue_usingBuckets___block_invoke;
  v12[3] = &__block_descriptor_40_e18_B16__0__NSNumber_8l;
  v12[4] = a3;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(v5, "lastObject");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  v10 = objc_msgSend(v9, "integerValue");
  return v10;
}

BOOL __44__HMIAnalytics_bucketForValue_usingBuckets___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  return v2 <= objc_msgSend(a2, "integerValue");
}

+ (void)sendEventsForFragmentResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  __CFString *v13;
  _QWORD *v14;
  uint64_t *v15;
  _QWORD v16[6];
  uint64_t v17;
  int *v18;
  uint64_t v19;
  int v20;
  _QWORD v21[3];
  int v22;

  v4 = a3;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v22 = 0;
  v17 = 0;
  v18 = (int *)&v17;
  v19 = 0x2020000000;
  v20 = 0;
  objc_msgSend(v4, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activityZones");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isInclusion");

    if (v8)
      v9 = CFSTR("inclusion");
    else
      v9 = CFSTR("exclusion");
  }
  else
  {
    v9 = CFSTR("None");
  }
  objc_msgSend(v4, "frameResults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __44__HMIAnalytics_sendEventsForFragmentResult___block_invoke;
  v16[3] = &unk_24DBEC9D8;
  v16[4] = v21;
  v16[5] = &v17;
  objc_msgSend(v10, "na_each:", v16);

  if (v18[6] >= 1)
  {
    v12[0] = v11;
    v12[1] = 3221225472;
    v12[2] = __44__HMIAnalytics_sendEventsForFragmentResult___block_invoke_3;
    v12[3] = &unk_24DBECA00;
    v14 = v21;
    v15 = &v17;
    v13 = (__CFString *)v9;
    objc_msgSend(a1, "sendEventWithName:payloadBuilder:", CFSTR("com.apple.HomeAI.MotionScore"), v12);

  }
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(v21, 8);

}

void __44__HMIAnalytics_sendEventsForFragmentResult___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  __int128 v5;

  objc_msgSend(a2, "events");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __44__HMIAnalytics_sendEventsForFragmentResult___block_invoke_2;
  v4[3] = &unk_24DBEC9B0;
  v5 = *(_OWORD *)(a1 + 32);
  objc_msgSend(v3, "na_each:", v4);

}

void __44__HMIAnalytics_sendEventsForFragmentResult___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  float v4;
  id v5;

  v5 = a2;
  v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    objc_msgSend(v5, "motionScore");
    *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4
                                                               + *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 24);
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }

}

id __44__HMIAnalytics_sendEventsForFragmentResult___block_invoke_3(_QWORD *a1, double a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v2 = a1[4];
  *(float *)&a2 = *(float *)(*(_QWORD *)(a1[5] + 8) + 24) / (float)*(int *)(*(_QWORD *)(a1[6] + 8) + 24);
  v6[0] = CFSTR("zoneType");
  v6[1] = CFSTR("motionScore");
  v7[0] = v2;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)videoAnalyzerDidTerminateWithError:(id)a3 state:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __57__HMIAnalytics_videoAnalyzerDidTerminateWithError_state___block_invoke;
  v10[3] = &unk_24DBECA28;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  objc_msgSend(a1, "sendEventWithName:payloadBuilder:", CFSTR("com.apple.HomeAI.VideoAnalyzer.DidTerminate_v0"), v10);

}

id __57__HMIAnalytics_videoAnalyzerDidTerminateWithError_state___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "camera");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    +[HMIAnalytics payloadWithCamera:](HMIAnalytics, "payloadWithCamera:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addEntriesFromDictionary:", v5);

  }
  if (*(_QWORD *)(a1 + 40))
    v6 = CFSTR("Success");
  else
    v6 = CFSTR("Fail");
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("status"));
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    HMIErrorCodeName(objc_msgSend(v7, "code"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("error"));

    objc_msgSend(*(id *)(a1 + 40), "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDD1398]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v10, "code"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v11, CFSTR("underlyingError"));

    }
  }
  v12 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 32), "timeSinceAnalyzerStarted");
  objc_msgSend(v12, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v13, CFSTR("timeSinceAnalyzerStarted"));

  return v2;
}

+ (void)videoAnalyzerDidCreateTimelapseFragment:(id)a3 state:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __62__HMIAnalytics_videoAnalyzerDidCreateTimelapseFragment_state___block_invoke;
  v10[3] = &unk_24DBECA28;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  objc_msgSend(a1, "sendEventWithName:payloadBuilder:", CFSTR("com.apple.HomeAI.VideoAnalyzer.DidCreateTimelapseFragment_v0"), v10);

}

id __62__HMIAnalytics_videoAnalyzerDidCreateTimelapseFragment_state___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t Seconds;
  void *v8;
  unint64_t v9;
  void *v10;
  CMTime time;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "camera");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    +[HMIAnalytics payloadWithCamera:](HMIAnalytics, "payloadWithCamera:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addEntriesFromDictionary:", v5);

  }
  v6 = *(void **)(a1 + 40);
  if (v6)
    objc_msgSend(v6, "duration");
  else
    memset(&time, 0, sizeof(time));
  Seconds = (unint64_t)CMTimeGetSeconds(&time);
  if (Seconds)
  {
    objc_msgSend(*(id *)(a1 + 40), "separableSegment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 8 * objc_msgSend(v8, "length") / Seconds;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, CFSTR("bitrate"));

  }
  return v2;
}

+ (void)videoAnalyzerDidAnalyzeFragmentWithResult:(id)a3 state:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __64__HMIAnalytics_videoAnalyzerDidAnalyzeFragmentWithResult_state___block_invoke;
  v10[3] = &unk_24DBECA28;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  objc_msgSend(a1, "sendEventWithName:payloadBuilder:", CFSTR("com.apple.HomeAI.VideoAnalyzer.DidAnalyzeFragment_v5"), v10);

}

id __64__HMIAnalytics_videoAnalyzerDidAnalyzeFragmentWithResult_state___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void (**v12)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v28[4];
  id v29;
  id v30;
  uint64_t v31;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "camera");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    +[HMIAnalytics payloadWithCamera:](HMIAnalytics, "payloadWithCamera:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addEntriesFromDictionary:", v5);

  }
  v6 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 32), "dynamicConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithBool:", objc_msgSend(v7, "recognizeFaces"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("recognizeFaces"));

  objc_msgSend(*(id *)(a1 + 32), "dynamicConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "eventTriggers");

  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __64__HMIAnalytics_videoAnalyzerDidAnalyzeFragmentWithResult_state___block_invoke_2;
  v28[3] = &unk_24DBECA50;
  v11 = v2;
  v29 = v11;
  v31 = v10;
  v30 = *(id *)(a1 + 40);
  v12 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x220735744](v28);
  v13 = objc_opt_class();
  ((void (**)(_QWORD, const __CFString *, uint64_t, uint64_t))v12)[2](v12, CFSTR("motion"), 1, v13);
  v14 = objc_opt_class();
  ((void (**)(_QWORD, const __CFString *, uint64_t, uint64_t))v12)[2](v12, CFSTR("pet"), 4, v14);
  v15 = objc_opt_class();
  ((void (**)(_QWORD, const __CFString *, uint64_t, uint64_t))v12)[2](v12, CFSTR("person"), 2, v15);
  v16 = objc_opt_class();
  ((void (**)(_QWORD, const __CFString *, uint64_t, uint64_t))v12)[2](v12, CFSTR("vehicle"), 8, v16);
  v17 = objc_opt_class();
  ((void (**)(_QWORD, const __CFString *, uint64_t, uint64_t))v12)[2](v12, CFSTR("package"), 16, v17);
  v18 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "numberWithBool:", objc_msgSend(v19, "transcode"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v20, CFSTR("transcode"));

  v21 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 32), "analysisFPS");
  objc_msgSend(v21, "numberWithDouble:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v22, CFSTR("analysisQuality"));

  v23 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 40), "fragment");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "numberWithInteger:", +[HMIAnalytics bucketForValue:usingBuckets:](HMIAnalytics, "bucketForValue:usingBuckets:", objc_msgSend(v24, "sequenceNumber"), &unk_24DC15230));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v25, CFSTR("sequenceNumber"));

  v26 = v11;
  return v26;
}

void __64__HMIAnalytics_videoAnalyzerDidAnalyzeFragmentWithResult_state___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  if ((*(_QWORD *)(a1 + 48) & a3) != 0)
    v6 = &unk_24DC147E0;
  else
    v6 = &unk_24DC14738;
  v7 = *(void **)(a1 + 32);
  v8 = (void *)MEMORY[0x24BDD17C8];
  v9 = a2;
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@Trigger"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v10);

  v11 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 40), "maxConfidenceEventForEventClass:", a4);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithInt:", v15 != 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@Found"), v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v14);
}

+ (void)videoPackageAnalyzerDidClassifyCandidateAsPackage:(BOOL)a3 camera:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  BOOL v10;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __73__HMIAnalytics_videoPackageAnalyzerDidClassifyCandidateAsPackage_camera___block_invoke;
  v8[3] = &unk_24DBECA78;
  v9 = v6;
  v10 = a3;
  v7 = v6;
  objc_msgSend(a1, "sendEventWithName:payloadBuilder:", CFSTR("com.apple.HomeAI.VideoPackageAnalyzer.DidClassify_v0"), v8);

}

id __73__HMIAnalytics_videoPackageAnalyzerDidClassifyCandidateAsPackage_camera___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 32))
  {
    +[HMIAnalytics payloadWithCamera:](HMIAnalytics, "payloadWithCamera:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addEntriesFromDictionary:", v3);

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("package"));

  return v2;
}

+ (void)videoPackageAnalyzerDidResetReferenceImageWithInterval:(double)a3 camera:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  double v10;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __78__HMIAnalytics_videoPackageAnalyzerDidResetReferenceImageWithInterval_camera___block_invoke;
  v8[3] = &unk_24DBECAA0;
  v9 = v6;
  v10 = a3;
  v7 = v6;
  objc_msgSend(a1, "sendEventWithName:payloadBuilder:", CFSTR("com.apple.HomeAI.VideoPackageAnalyzer.DidReset_v0"), v8);

}

id __78__HMIAnalytics_videoPackageAnalyzerDidResetReferenceImageWithInterval_camera___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 32))
  {
    +[HMIAnalytics payloadWithCamera:](HMIAnalytics, "payloadWithCamera:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addEntriesFromDictionary:", v3);

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("interval"));

  return v2;
}

@end
