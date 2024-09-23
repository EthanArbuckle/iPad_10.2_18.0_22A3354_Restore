@implementation HFActionSetServiceSuggestionMetadata

+ (id)metadataForServiceType:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  id (*v11)(uint64_t);
  void *v12;
  id v13;
  id v14;

  v4 = a3;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __63__HFActionSetServiceSuggestionMetadata_metadataForServiceType___block_invoke;
  v12 = &unk_1EA73BB00;
  v13 = v4;
  v14 = a1;
  v5 = v4;
  __63__HFActionSetServiceSuggestionMetadata_metadataForServiceType___block_invoke((uint64_t)&v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5, v9, v10, v11, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __63__HFActionSetServiceSuggestionMetadata_metadataForServiceType___block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  id v3;
  __int128 v5;
  _QWORD block[4];
  __int128 v7;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__HFActionSetServiceSuggestionMetadata_metadataForServiceType___block_invoke_2;
  block[3] = &unk_1EA72B268;
  v5 = *(_OWORD *)(a1 + 32);
  v1 = (id)v5;
  v7 = v5;
  if (qword_1ED379AC0 == -1)
  {
    v2 = v1;
  }
  else
  {
    dispatch_once(&qword_1ED379AC0, block);
    v2 = (void *)v7;
  }
  v3 = (id)qword_1ED379AC8;

  return v3;
}

void __63__HFActionSetServiceSuggestionMetadata_metadataForServiceType___block_invoke_2(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  __int128 v4;
  _QWORD v5[4];
  id v6[2];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__HFActionSetServiceSuggestionMetadata_metadataForServiceType___block_invoke_3;
  v5[3] = &unk_1EA73BAD8;
  v4 = *(_OWORD *)(a1 + 32);
  v1 = (id)v4;
  *(_OWORD *)v6 = v4;
  __63__HFActionSetServiceSuggestionMetadata_metadataForServiceType___block_invoke_3((uint64_t)v5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED379AC8;
  qword_1ED379AC8 = v2;

}

id __63__HFActionSetServiceSuggestionMetadata_metadataForServiceType___block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[12];
  _QWORD v39[14];

  v39[12] = *MEMORY[0x1E0C80C00];
  v38[0] = *MEMORY[0x1E0CB9A70];
  v2 = objc_alloc(*(Class *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *MEMORY[0x1E0CB89C8];
  v37 = *MEMORY[0x1E0CB87C0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(v2, "initWithServiceType:primaryCharacteristicType:secondaryCharacteristicTypes:", v3, v4, v34);
  v39[0] = v33;
  v38[1] = *MEMORY[0x1E0CB9A10];
  v5 = objc_alloc(*(Class *)(a1 + 40));
  v6 = *(_QWORD *)(a1 + 32);
  v36 = *MEMORY[0x1E0CB89F0];
  v7 = v36;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v5, "initWithServiceType:primaryCharacteristicType:secondaryCharacteristicTypes:", v6, v4, v32);
  v39[1] = v31;
  v38[2] = *MEMORY[0x1E0CB9B10];
  v8 = objc_alloc(*(Class *)(a1 + 40));
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *MEMORY[0x1E0CB8790];
  v35 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v8, "initWithServiceType:primaryCharacteristicType:secondaryCharacteristicTypes:", v9, v10, v30);
  v39[2] = v29;
  v38[3] = *MEMORY[0x1E0CB9AD8];
  v11 = objc_alloc(*(Class *)(a1 + 40));
  v12 = MEMORY[0x1E0C9AA60];
  v28 = (void *)objc_msgSend(v11, "initWithServiceType:primaryCharacteristicType:secondaryCharacteristicTypes:", *(_QWORD *)(a1 + 32), v4, MEMORY[0x1E0C9AA60]);
  v39[3] = v28;
  v38[4] = *MEMORY[0x1E0CB9AA0];
  v13 = (void *)objc_msgSend(objc_alloc(*(Class *)(a1 + 40)), "initWithServiceType:primaryCharacteristicType:secondaryCharacteristicTypes:", *(_QWORD *)(a1 + 32), v4, v12);
  v39[4] = v13;
  v38[5] = *MEMORY[0x1E0CB9A80];
  v14 = objc_alloc(*(Class *)(a1 + 40));
  v15 = (void *)objc_msgSend(v14, "initWithServiceType:primaryCharacteristicType:secondaryCharacteristicTypes:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0CB8AE0], v12);
  v39[5] = v15;
  v38[6] = *MEMORY[0x1E0CB9A00];
  v16 = objc_alloc(*(Class *)(a1 + 40));
  v17 = *MEMORY[0x1E0CB8AF0];
  v18 = (void *)objc_msgSend(v16, "initWithServiceType:primaryCharacteristicType:secondaryCharacteristicTypes:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0CB8AF0], v12);
  v39[6] = v18;
  v38[7] = *MEMORY[0x1E0CB9B28];
  v19 = (void *)objc_msgSend(objc_alloc(*(Class *)(a1 + 40)), "initWithServiceType:primaryCharacteristicType:secondaryCharacteristicTypes:", *(_QWORD *)(a1 + 32), v17, v12);
  v39[7] = v19;
  v38[8] = *MEMORY[0x1E0CB9B30];
  v20 = (void *)objc_msgSend(objc_alloc(*(Class *)(a1 + 40)), "initWithServiceType:primaryCharacteristicType:secondaryCharacteristicTypes:", *(_QWORD *)(a1 + 32), v17, v12);
  v39[8] = v20;
  v38[9] = *MEMORY[0x1E0CB9AA8];
  v21 = objc_alloc(*(Class *)(a1 + 40));
  v22 = (void *)objc_msgSend(v21, "initWithServiceType:primaryCharacteristicType:secondaryCharacteristicTypes:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0CB8B00], v12);
  v39[9] = v22;
  v38[10] = *MEMORY[0x1E0CB9A28];
  v23 = objc_alloc(*(Class *)(a1 + 40));
  v24 = (void *)objc_msgSend(v23, "initWithServiceType:primaryCharacteristicType:secondaryCharacteristicTypes:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0CB8AA8], v12);
  v39[10] = v24;
  v38[11] = *MEMORY[0x1E0CB9AF0];
  v25 = (void *)objc_msgSend(objc_alloc(*(Class *)(a1 + 40)), "initWithServiceType:primaryCharacteristicType:secondaryCharacteristicTypes:", *(_QWORD *)(a1 + 32), v10, v12);
  v39[11] = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 12);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (HFActionSetServiceSuggestionMetadata)initWithServiceType:(id)a3 primaryCharacteristicType:(id)a4 secondaryCharacteristicTypes:(id)a5
{
  id v9;
  id v10;
  id v11;
  HFActionSetServiceSuggestionMetadata *v12;
  HFActionSetServiceSuggestionMetadata *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HFActionSetServiceSuggestionMetadata;
  v12 = -[HFActionSetServiceSuggestionMetadata init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_serviceType, a3);
    objc_storeStrong((id *)&v13->_primaryCharacteristicType, a4);
    objc_storeStrong((id *)&v13->_secondaryCharacteristicTypes, a5);
  }

  return v13;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (NSString)primaryCharacteristicType
{
  return self->_primaryCharacteristicType;
}

- (NSArray)secondaryCharacteristicTypes
{
  return self->_secondaryCharacteristicTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryCharacteristicTypes, 0);
  objc_storeStrong((id *)&self->_primaryCharacteristicType, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
}

@end
