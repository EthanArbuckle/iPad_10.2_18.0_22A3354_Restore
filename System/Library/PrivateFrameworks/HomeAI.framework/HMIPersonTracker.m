@implementation HMIPersonTracker

- (HMIPersonTracker)init
{
  HMIPersonTracker *v2;
  uint64_t v3;
  NSMutableArray *previousPersons;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMIPersonTracker;
  v2 = -[HMIPersonTracker init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    previousPersons = v2->_previousPersons;
    v2->_previousPersons = (NSMutableArray *)v3;

  }
  return v2;
}

- (void)trackNewPersons:(id)a3 knownPersons:(id)a4 regionOfInterest:(CGRect)a5 timeStamp:(id *)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int64_t var3;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v50;
  id v51;
  id v52;
  _QWORD v53[4];
  id v54;
  id v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  _QWORD v60[4];
  id v61;
  id v62;
  id v63;
  id v64;
  _QWORD v65[4];
  id v66;
  id v67;
  _QWORD v68[4];
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  _QWORD v75[4];
  id v76;
  id v77;
  _QWORD v78[4];
  id v79;
  __int128 v80;
  int64_t v81;
  _QWORD v82[4];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v83;
  _QWORD v84[4];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v85;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v84[0] = MEMORY[0x24BDAC760];
  v13 = MEMORY[0x24BDAC760];
  v84[1] = 3221225472;
  v84[2] = __76__HMIPersonTracker_trackNewPersons_knownPersons_regionOfInterest_timeStamp___block_invoke;
  v84[3] = &__block_descriptor_56_e52___HMIPersonBlob_16__0__HMIVideoAnalyzerEventPerson_8l;
  v85 = *a6;
  v14 = a4;
  v15 = a3;
  objc_msgSend(v14, "na_map:", v84);
  v52 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "na_map:", &__block_literal_global_12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v82[0] = v13;
  v82[1] = 3221225472;
  v82[2] = __76__HMIPersonTracker_trackNewPersons_knownPersons_regionOfInterest_timeStamp___block_invoke_3;
  v82[3] = &__block_descriptor_56_e52___HMIPersonBlob_16__0__HMIVideoAnalyzerEventPerson_8l;
  v83 = *a6;
  objc_msgSend(v15, "na_map:", v82);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMIPersonTracker previousPersons](self, "previousPersons");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v78[0] = v13;
  v78[1] = 3221225472;
  v78[2] = __76__HMIPersonTracker_trackNewPersons_knownPersons_regionOfInterest_timeStamp___block_invoke_4;
  v78[3] = &unk_24DBEAB30;
  v80 = *(_OWORD *)&a6->var0;
  var3 = a6->var3;
  v79 = v17;
  v81 = var3;
  v51 = v17;
  objc_msgSend(v19, "na_map:", v78);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v75[0] = v13;
  v75[1] = 3221225472;
  v75[2] = __76__HMIPersonTracker_trackNewPersons_knownPersons_regionOfInterest_timeStamp___block_invoke_5;
  v75[3] = &unk_24DBEAB80;
  v23 = v18;
  v76 = v23;
  v77 = v22;
  v50 = v22;
  objc_msgSend(v21, "enumerateObjectsUsingBlock:", v75);
  objc_msgSend(MEMORY[0x24BDD1698], "indexSetWithIndexesInRange:", 0, objc_msgSend(v21, "count"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1698], "indexSetWithIndexesInRange:", 0, objc_msgSend(v23, "count"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = MEMORY[0x24BDAC760];
  v68[0] = MEMORY[0x24BDAC760];
  v68[1] = 3221225472;
  v68[2] = __76__HMIPersonTracker_trackNewPersons_knownPersons_regionOfInterest_timeStamp___block_invoke_7;
  v68[3] = &unk_24DBEABA8;
  v69 = v24;
  v70 = v25;
  v31 = v28;
  v71 = v31;
  v32 = v29;
  v72 = v32;
  v73 = v26;
  v74 = v27;
  v33 = v27;
  v34 = v26;
  v48 = v25;
  v35 = v24;
  objc_msgSend(v50, "na_each:", v68);
  v65[0] = v30;
  v65[1] = 3221225472;
  v65[2] = __76__HMIPersonTracker_trackNewPersons_knownPersons_regionOfInterest_timeStamp___block_invoke_8;
  v65[3] = &unk_24DBEABD0;
  v36 = v23;
  v66 = v36;
  v37 = v21;
  v67 = v37;
  objc_msgSend(v34, "na_each:", v65);
  v60[0] = v30;
  v60[1] = 3221225472;
  v60[2] = __76__HMIPersonTracker_trackNewPersons_knownPersons_regionOfInterest_timeStamp___block_invoke_9;
  v60[3] = &unk_24DBEABF8;
  v61 = v36;
  v38 = v37;
  v62 = v38;
  v63 = v32;
  v64 = v31;
  v39 = v31;
  v40 = v32;
  v41 = v36;
  objc_msgSend(v33, "na_each:", v60);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v53[0] = v30;
  v53[1] = 3221225472;
  v53[2] = __76__HMIPersonTracker_trackNewPersons_knownPersons_regionOfInterest_timeStamp___block_invoke_10;
  v53[3] = &unk_24DBEAC20;
  v56 = x;
  v57 = y;
  v58 = width;
  v59 = height;
  v54 = v38;
  v55 = (id)objc_claimAutoreleasedReturnValue();
  v42 = v55;
  v43 = v38;
  objc_msgSend(v35, "enumerateIndexesUsingBlock:", v53);
  -[HMIPersonTracker previousPersons](self, "previousPersons");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "removeAllObjects");

  -[HMIPersonTracker previousPersons](self, "previousPersons");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "addObjectsFromArray:", v41);

  -[HMIPersonTracker previousPersons](self, "previousPersons");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "addObjectsFromArray:", v52);

  -[HMIPersonTracker previousPersons](self, "previousPersons");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "addObjectsFromArray:", v42);

}

HMIPersonBlob *__76__HMIPersonTracker_trackNewPersons_knownPersons_regionOfInterest_timeStamp___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HMIPersonBlob *v4;
  HMIPersonBlob *v5;
  __int128 v7;
  uint64_t v8;

  v3 = a2;
  v4 = [HMIPersonBlob alloc];
  v7 = *(_OWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 48);
  v5 = -[HMIPersonBlob initWithNewPersonEvent:timeStamp:](v4, "initWithNewPersonEvent:timeStamp:", v3, &v7);

  return v5;
}

uint64_t __76__HMIPersonTracker_trackNewPersons_knownPersons_regionOfInterest_timeStamp___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sessionEntityUUID");
}

HMIPersonBlob *__76__HMIPersonTracker_trackNewPersons_knownPersons_regionOfInterest_timeStamp___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  HMIPersonBlob *v4;
  HMIPersonBlob *v5;
  __int128 v7;
  uint64_t v8;

  v3 = a2;
  v4 = [HMIPersonBlob alloc];
  v7 = *(_OWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 48);
  v5 = -[HMIPersonBlob initWithNewPersonEvent:timeStamp:](v4, "initWithNewPersonEvent:timeStamp:", v3, &v7);

  return v5;
}

id __76__HMIPersonTracker_trackNewPersons_knownPersons_regionOfInterest_timeStamp___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  __int128 v10;
  uint64_t v11;

  v3 = a2;
  objc_msgSend(v3, "personIndices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllIndexes");

  v5 = *(void **)(a1 + 32);
  objc_msgSend(v3, "blobID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsObject:", v6) & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v10 = *(_OWORD *)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 56);
    if (objc_msgSend(v3, "isExpiredAtTimeStamp:", &v10))
      v7 = 0;
    else
      v7 = v3;
  }
  v8 = v7;

  return v8;
}

void __76__HMIPersonTracker_trackNewPersons_knownPersons_regionOfInterest_timeStamp___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;

  v5 = a2;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __76__HMIPersonTracker_trackNewPersons_knownPersons_regionOfInterest_timeStamp___block_invoke_6;
  v8[3] = &unk_24DBEAB58;
  v9 = v5;
  v11 = a3;
  v6 = *(void **)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v7 = v5;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

}

void __76__HMIPersonTracker_trackNewPersons_knownPersons_regionOfInterest_timeStamp___block_invoke_6(uint64_t a1, void *a2, uint64_t a3)
{
  float v5;
  float v6;
  HMIPairwiseMatch *v7;
  double v8;
  HMIPairwiseMatch *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  _BOOL4 v22;
  void *v24;
  void *v25;
  id v26;
  CGRect v27;
  CGRect v28;

  v26 = a2;
  objc_msgSend(v26, "similarityToPersonBlob:", *(_QWORD *)(a1 + 32));
  v6 = v5;
  if (v5 > 0.0)
  {
    v7 = [HMIPairwiseMatch alloc];
    *(float *)&v8 = v6;
    v9 = -[HMIPairwiseMatch initWithFirstIndex:secondIndex:score:](v7, "initWithFirstIndex:secondIndex:score:", *(_QWORD *)(a1 + 48), a3, v8);
    objc_msgSend(*(id *)(a1 + 40), "insertObject:atIndex:", v9, objc_msgSend(*(id *)(a1 + 40), "indexOfObject:inSortedRange:options:usingComparator:", v9, 0, objc_msgSend(*(id *)(a1 + 40), "count"), 1024, &__block_literal_global_2));

  }
  objc_msgSend(*(id *)(a1 + 32), "boundingBox");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  objc_msgSend(v26, "boundingBox");
  v28.origin.x = v18;
  v28.origin.y = v19;
  v28.size.width = v20;
  v28.size.height = v21;
  v27.origin.x = v11;
  v27.origin.y = v13;
  v27.size.width = v15;
  v27.size.height = v17;
  v22 = CGRectIntersectsRect(v27, v28);
  if (v6 >= 0.0 && v22)
  {
    objc_msgSend(*(id *)(a1 + 32), "personIndices");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addIndex:", a3);

    objc_msgSend(v26, "personIndices");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addIndex:", *(_QWORD *)(a1 + 48));

  }
}

void __76__HMIPersonTracker_trackNewPersons_knownPersons_regionOfInterest_timeStamp___block_invoke_7(uint64_t a1, void *a2)
{
  float v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsIndex:", objc_msgSend(v7, "firstIndex"))
    && objc_msgSend(*(id *)(a1 + 40), "containsIndex:", objc_msgSend(v7, "secondIndex")))
  {
    objc_msgSend(*(id *)(a1 + 32), "removeIndex:", objc_msgSend(v7, "firstIndex"));
    objc_msgSend(*(id *)(a1 + 40), "removeIndex:", objc_msgSend(v7, "secondIndex"));
    objc_msgSend(v7, "score");
    if (v3 <= 1.0)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v7, "firstIndex"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = *(void **)(a1 + 72);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "addIndex:", objc_msgSend(v7, "firstIndex"));
      objc_msgSend(*(id *)(a1 + 56), "addIndex:", objc_msgSend(v7, "secondIndex"));
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v7, "firstIndex"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = *(void **)(a1 + 64);
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v7, "secondIndex"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, v6);

  }
}

void __76__HMIPersonTracker_trackNewPersons_knownPersons_regionOfInterest_timeStamp___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a1;
  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectAtIndexedSubscript:", (int)objc_msgSend(a2, "intValue"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(v4 + 40);
  LODWORD(v4) = objc_msgSend(v6, "intValue");

  objc_msgSend(v7, "objectAtIndexedSubscript:", (int)v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "trackPersonBlob:", v8);

}

void __76__HMIPersonTracker_trackNewPersons_knownPersons_regionOfInterest_timeStamp___block_invoke_9(_QWORD *a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  id v14;

  v5 = (void *)a1[4];
  v6 = a3;
  objc_msgSend(v5, "objectAtIndexedSubscript:", (int)objc_msgSend(a2, "intValue"));
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)a1[5];
  LODWORD(v5) = objc_msgSend(v6, "intValue");

  objc_msgSend(v7, "objectAtIndexedSubscript:", (int)v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "personIndices");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeIndexes:", a1[6]);

  objc_msgSend(v8, "personIndices");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeIndexes:", a1[7]);

  objc_msgSend(v14, "personIndices");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v11, "count") >= 2)
  {

  }
  else
  {
    objc_msgSend(v8, "personIndices");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13 <= 1)
      objc_msgSend(v14, "trackPersonBlob:", v8);
  }

}

void __76__HMIPersonTracker_trackNewPersons_knownPersons_regionOfInterest_timeStamp___block_invoke_10(uint64_t a1, uint64_t a2)
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  id v7;
  CGRect v8;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "boundingBox");
  v8.origin.x = v3;
  v8.origin.y = v4;
  v8.size.width = v5;
  v8.size.height = v6;
  if (!CGRectIntersectsRect(*(CGRect *)(a1 + 48), v8))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);

}

- (id)getBlobIDAtIndex:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  HMIPersonTracker *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  unint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  -[HMIPersonTracker previousPersons](self, "previousPersons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 <= a3)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x220735570]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMIPersonTracker previousPersons](v13, "previousPersons");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138544130;
      v18 = v15;
      v19 = 2112;
      v20 = v11;
      v21 = 2048;
      v22 = a3;
      v23 = 2048;
      v24 = objc_msgSend(v16, "count");
      _os_log_impl(&dword_219D45000, v14, OS_LOG_TYPE_ERROR, "%{public}@HMIPersonTracker: unable to get %@ at index %lu / %lu", (uint8_t *)&v17, 0x2Au);

    }
    objc_autoreleasePoolPop(v12);
    return v11;
  }
  else
  {
    -[HMIPersonTracker previousPersons](self, "previousPersons");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "blobID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    return v9;
  }
}

- (NSMutableArray)previousPersons
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousPersons, 0);
}

@end
