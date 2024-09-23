@implementation SAHASearchCriteriaFilter(HMLogging)

- (id)hm_shortDescription
{
  void *v2;
  void *v3;
  void *v4;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)*MEMORY[0x1E0D88AD8];
  objc_msgSend(a1, "homeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  appendToShortDescription(v2, v3, v4);

  v5 = (void *)*MEMORY[0x1E0D88AE0];
  objc_msgSend(a1, "homeName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  appendToShortDescription(v2, v5, v6);

  v7 = (void *)*MEMORY[0x1E0D88B30];
  objc_msgSend(a1, "zoneIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  appendToShortDescription(v2, v7, v8);

  v9 = (void *)*MEMORY[0x1E0D88B38];
  objc_msgSend(a1, "zoneName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  appendToShortDescription(v2, v9, v10);

  v11 = (void *)*MEMORY[0x1E0D88AE8];
  objc_msgSend(a1, "roomIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  appendToShortDescription(v2, v11, v12);

  v13 = (void *)*MEMORY[0x1E0D88AF0];
  objc_msgSend(a1, "roomName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  appendToShortDescription(v2, v13, v14);

  v15 = (void *)*MEMORY[0x1E0D88B10];
  objc_msgSend(a1, "serviceGroupIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  appendToShortDescription(v2, v15, v16);

  v17 = (void *)*MEMORY[0x1E0D88AD0];
  objc_msgSend(a1, "groupName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  appendToShortDescription(v2, v17, v18);

  v19 = (void *)*MEMORY[0x1E0D88B00];
  objc_msgSend(a1, "sceneName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  appendToShortDescription(v2, v19, v20);

  v21 = (void *)*MEMORY[0x1E0D88AC8];
  objc_msgSend(a1, "entityType");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  appendToShortDescription(v2, v21, v22);

  v23 = (void *)*MEMORY[0x1E0D88AB0];
  objc_msgSend(a1, "accessoryIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  appendToShortDescription(v2, v23, v24);

  v25 = (void *)*MEMORY[0x1E0D88AB8];
  objc_msgSend(a1, "accessoryName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  appendToShortDescription(v2, v25, v26);

  v27 = (void *)*MEMORY[0x1E0D88B28];
  objc_msgSend(a1, "serviceType");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  appendToShortDescription(v2, v27, v28);

  v29 = (void *)*MEMORY[0x1E0D88B18];
  objc_msgSend(a1, "serviceIdentifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  appendToShortDescription(v2, v29, v30);

  v31 = (void *)*MEMORY[0x1E0D88B20];
  objc_msgSend(a1, "serviceName");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  appendToShortDescription(v2, v31, v32);

  v33 = (void *)*MEMORY[0x1E0D88AF8];
  objc_msgSend(a1, "sceneIdentifier");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  appendToShortDescription(v2, v33, v34);

  v35 = (void *)*MEMORY[0x1E0D88B08];
  objc_msgSend(a1, "sceneType");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  appendToShortDescription(v2, v35, v36);

  v37 = (void *)*MEMORY[0x1E0D88AC0];
  objc_msgSend(a1, "attribute");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  appendToShortDescription(v2, v37, v38);

  objc_msgSend(v2, "appendString:", CFSTR("  "));
  objc_msgSend(a1, "attribute");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  appendToShortDescription(v2, v37, v39);

  return v2;
}

@end
