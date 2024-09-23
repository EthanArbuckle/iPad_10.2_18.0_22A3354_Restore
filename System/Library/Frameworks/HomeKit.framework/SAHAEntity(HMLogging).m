@implementation SAHAEntity(HMLogging)

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
  void *v40;
  void *v41;
  void *v42;
  void *v43;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)*MEMORY[0x1E0D88980];
  objc_msgSend(a1, "entityType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  appendToShortDescription(v2, v3, v4);

  v5 = (void *)*MEMORY[0x1E0D889A0];
  objc_msgSend(a1, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  appendToShortDescription(v2, v5, v6);

  objc_msgSend(a1, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  appendToShortDescription(v2, 0, v7);

  v8 = (void *)*MEMORY[0x1E0D88998];
  objc_msgSend(a1, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  appendToShortDescription(v2, v8, v9);

  v10 = (void *)*MEMORY[0x1E0D88990];
  objc_msgSend(a1, "homeIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  appendToShortDescription(v2, v10, v11);

  v12 = (void *)*MEMORY[0x1E0D889B0];
  objc_msgSend(a1, "room");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  appendToShortDescription(v2, v12, v13);

  v14 = (void *)*MEMORY[0x1E0D889A8];
  objc_msgSend(a1, "roomIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  appendToShortDescription(v2, v14, v15);

  v16 = (void *)*MEMORY[0x1E0D88A50];
  objc_msgSend(a1, "zone");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  appendToShortDescription(v2, v16, v17);

  v18 = (void *)*MEMORY[0x1E0D88A48];
  objc_msgSend(a1, "zoneIdentifiers");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  appendToShortDescription(v2, v18, v19);

  v20 = (void *)*MEMORY[0x1E0D889C8];
  objc_msgSend(a1, "serviceGroup");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  appendToShortDescription(v2, v20, v21);

  v22 = (void *)*MEMORY[0x1E0D889C0];
  objc_msgSend(a1, "serviceGroupIdentifiers");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  appendToShortDescription(v2, v22, v23);

  v24 = (void *)*MEMORY[0x1E0D88968];
  objc_msgSend(a1, "accessory");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  appendToShortDescription(v2, v24, v25);

  v26 = (void *)*MEMORY[0x1E0D88960];
  objc_msgSend(a1, "accessoryIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  appendToShortDescription(v2, v26, v27);

  v28 = (void *)*MEMORY[0x1E0D889D8];
  objc_msgSend(a1, "serviceType");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  appendToShortDescription(v2, v28, v29);

  v30 = (void *)*MEMORY[0x1E0D889D0];
  objc_msgSend(a1, "serviceSubType");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  appendToShortDescription(v2, v30, v31);

  v32 = (void *)*MEMORY[0x1E0D88988];
  objc_msgSend(a1, "hashedRouteUID");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  appendToShortDescription(v2, v32, v33);

  v34 = (void *)*MEMORY[0x1E0D88970];
  objc_msgSend(a1, "attributes");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  appendToShortDescription(v2, v34, v35);

  v36 = (void *)*MEMORY[0x1E0D88A08];
  objc_msgSend(a1, "targetAttributes");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  appendToShortDescription(v2, v36, v37);

  v38 = (void *)*MEMORY[0x1E0D88978];
  objc_msgSend(a1, "currentDevice");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  appendToShortDescription(v2, v38, v39);

  v40 = (void *)*MEMORY[0x1E0D889B8];
  objc_msgSend(a1, "sceneType");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  appendToShortDescription(v2, v40, v41);

  v42 = (void *)*MEMORY[0x1E0D889E0];
  objc_msgSend(a1, "status");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  appendToShortDescription(v2, v42, v43);

  return v2;
}

@end
