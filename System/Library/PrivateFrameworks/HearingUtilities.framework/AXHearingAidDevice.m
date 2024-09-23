@implementation AXHearingAidDevice

+ (id)characteristicsUUIDs
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
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
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;

  v2 = (void *)characteristicsUUIDs_CharacteristicsUUIDs;
  if (!characteristicsUUIDs_CharacteristicsUUIDs)
  {
    v20 = objc_alloc(MEMORY[0x1E0C99D80]);
    objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("0x24E1DFF3-AE90-41BF-BFBD-2CF8DF42BF87"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 4);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("0x8D17AC2F-1D54-4742-A49A-EF4B20784EB3"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 8);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("0xC97D21D3-D79D-4DF8-9230-BB33FA805F4E"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 16);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("0x497EEB9E-B194-4F35-BC82-36FD300482A6"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 32);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("0xF3F594F9-E210-48F3-85E2-4B0CF235A9D3"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 64);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("0x6AC46200-24EA-46D8-A136-81133C65840A"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 128);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("0x21FF4275-C41D-4486-A0E3-DC11138BCDE6"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 256);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("0xA391C6F1-20BB-495A-ABBF-2017098FBC61"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 1024);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("0xA28B6BE1-2FA4-42F8-AEB2-B15A1DBD837A"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 4096);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("0x7BE94A55-8D91-4592-BC0F-EA3664CCD3A9"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0x2000);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("0x9C12A3DB-9CE8-4865-A217-D394B3BC9311"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0x4000);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("0xADC3023D-BFD2-43FD-86F6-7AE05A619092"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0x20000);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("0x16438C66-E95A-4C6F-8117-A6B745BD86FC"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0x10000000);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("0xAEA12A32-60ED-43BA-BE6F-BA6092000FDB"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0x40000000);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("0xEAF6FB18-090C-4EF7-AAB8-06518E16D502"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0x80000000);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("0x76B3DB1F-44C4-46CC-A7B5-E9CE7DFBEF50"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0x100000000);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("0x98924A39-6559-40A8-B302-3C8E40DBF834"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0x200000000);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("0x066E7E7F-93E9-4D26-89AC-AECCDBAFA825"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0x400000000);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("0x4656D3AC-C2DF-4096-96E7-713580B69CCD"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0x800000000);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("0xF6E6AC8D-248E-433F-BC2C-E51E47DF3ECA"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0x1000000000);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("0xC60E7C73-203B-4B7C-AFC5-2FE79C5F2F01"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0x2000000000);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("0x4603580D-3C15-4FEC-93BE-B86B243ADA64"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0x4000000000);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("0xE893C687-7C43-4999-8FD0-6CB11D0F88CD"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0x8000000000);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("0x61D1B37D-94D5-4281-A88F-9B67F8F96314"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0x10000000000);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("0xCE9CDC7E-7D7A-4135-9F3F-CA1E2EB2C8D5"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0x40000000000);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("0x8E750BB1-40C1-48DF-B450-97F245C57E0C"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0x80000000000);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v20, "initWithObjectsAndKeys:", v58, v57, v56, v55, v54, v53, v52, v51, v50, v49, v48, v47, v46, v45, v44, v43, v39,
           v41,
           v42,
           v40,
           v36,
           v38,
           v32,
           v37,
           v35,
           v30,
           v34,
           v19,
           v33,
           v31,
           v29,
           v18,
           v28,
           v17,
           v27,
           v16,
           v26,
           v25,
           v24,
           v23,
           v22,
           v21,
           v15,
           v14,
           v3,
           v13,
           v4,
           v12,
           v5,
           v6,
           v7,
           v8,
           0);
    v10 = (void *)characteristicsUUIDs_CharacteristicsUUIDs;
    characteristicsUUIDs_CharacteristicsUUIDs = v9;

    v2 = (void *)characteristicsUUIDs_CharacteristicsUUIDs;
  }
  return v2;
}

+ (id)deviceIDFromLeftID:(id)a3 andRightID:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length"))
  {
    if (objc_msgSend(v6, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v5, v6);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = v5;
    }
  }
  else
  {
    v7 = v6;
  }
  v8 = v7;

  return v8;
}

- (void)_init
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  AXDispatchTimer *v11;
  AXDispatchTimer *propertyWriteTimer;

  v3 = MEMORY[0x1E0C9AA60];
  -[AXHearingAidDevice setRightPrograms:](self, "setRightPrograms:", MEMORY[0x1E0C9AA60]);
  -[AXHearingAidDevice setLeftPrograms:](self, "setLeftPrograms:", v3);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXHearingAidDevice setLeftPropertiesLoadCount:](self, "setLeftPropertiesLoadCount:", v4);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXHearingAidDevice setRightPropertiesLoadCount:](self, "setRightPropertiesLoadCount:", v5);

  -[AXHearingAidDevice setCurrentLeftProgram:](self, "setCurrentLeftProgram:", 0);
  -[AXHearingAidDevice setCurrentRightProgram:](self, "setCurrentRightProgram:", 0);
  -[AXHearingAidDevice setCurrentLeftStreamingProgram:](self, "setCurrentLeftStreamingProgram:", 0);
  -[AXHearingAidDevice setCurrentRightStreamingProgram:](self, "setCurrentRightStreamingProgram:", 0);
  hearingLocString(CFSTR("HearingAidLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXHearingAidDevice setName:](self, "setName:", v6);

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", &stru_1EA8EC4E0, &stru_1EA8EC4E0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXHearingAidDevice setManufacturer:](self, "setManufacturer:", v7);

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", &stru_1EA8EC4E0, &stru_1EA8EC4E0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXHearingAidDevice setModel:](self, "setModel:", v8);

  -[AXHearingAidDevice setSupportsBinauralStreaming:](self, "setSupportsBinauralStreaming:", 1);
  -[AXHearingAidDevice setSupportsCombinedPresets:](self, "setSupportsCombinedPresets:", 1);
  -[AXHearingAidDevice setSupportsCombinedVolumes:](self, "setSupportsCombinedVolumes:", 1);
  -[AXHearingAidDevice setRequiresCombinedPresets:](self, "setRequiresCombinedPresets:", 0);
  -[AXHearingAidDevice setRequiresCombinedVolumes:](self, "setRequiresCombinedVolumes:", 0);
  -[AXHearingAidDevice setRequiresBinauralStreaming:](self, "setRequiresBinauralStreaming:", 0);
  -[AXHearingAidDevice setLeftMicrophoneVolumeSteps:](self, "setLeftMicrophoneVolumeSteps:", 1);
  -[AXHearingAidDevice setLeftSensitivitySteps:](self, "setLeftSensitivitySteps:", 1);
  -[AXHearingAidDevice setLeftStreamVolumeSteps:](self, "setLeftStreamVolumeSteps:", 1);
  -[AXHearingAidDevice setLeftMixedVolumeSteps:](self, "setLeftMixedVolumeSteps:", 1);
  -[AXHearingAidDevice setRightMicrophoneVolumeSteps:](self, "setRightMicrophoneVolumeSteps:", 1);
  -[AXHearingAidDevice setRightSensitivitySteps:](self, "setRightSensitivitySteps:", 1);
  -[AXHearingAidDevice setRightStreamVolumeSteps:](self, "setRightStreamVolumeSteps:", 1);
  -[AXHearingAidDevice setRightMixedVolumeSteps:](self, "setRightMixedVolumeSteps:", 1);
  -[AXHearingAidDevice setLeftLeaVersion:](self, "setLeftLeaVersion:", 1);
  -[AXHearingAidDevice setRightLeaVersion:](self, "setRightLeaVersion:", 1);
  +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXHearingAidDevice setAvailableInputEars:](self, "setAvailableInputEars:", objc_msgSend(v9, "availableInputEars"));

  if (objc_msgSend(MEMORY[0x1E0D2F990], "isInternalInstall"))
    v10 = 6;
  else
    v10 = 0;
  -[AXHearingAidDevice setEarsSupportingWatch:](self, "setEarsSupportingWatch:", v10);
  v11 = (AXDispatchTimer *)objc_alloc_init(MEMORY[0x1E0CF3978]);
  propertyWriteTimer = self->_propertyWriteTimer;
  self->_propertyWriteTimer = v11;

  -[AXDispatchTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:](self->_propertyWriteTimer, "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:", 1);
}

- (AXHearingAidDevice)initWithPeripheral:(id)a3
{
  id v4;
  AXHearingAidDevice *v5;
  AXHearingAidDevice *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  AXHearingAidDevice *v13;
  id v14;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AXHearingAidDevice;
  v5 = -[AXHearingAidDevice init](&v15, sel_init);
  v6 = v5;
  if (v5)
  {
    -[AXHearingAidDevice _init](v5, "_init");
    objc_msgSend(v4, "setDelegate:", v6);
    if (v4)
    {
      -[AXHearingAidDevice setLeftPeripheral:](v6, "setLeftPeripheral:", v4);
      objc_msgSend(v4, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(v4, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "UUIDString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        -[AXHearingAidDevice setLeftPeripheralUUID:](v6, "setLeftPeripheralUUID:", v9);
      }
    }
    -[AXHearingAidDevice updateName](v6, "updateName");
    objc_msgSend(v4, "services");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __41__AXHearingAidDevice_initWithPeripheral___block_invoke;
    v12[3] = &unk_1EA8E8B18;
    v13 = v6;
    v14 = v4;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v12);

  }
  return v6;
}

void __41__AXHearingAidDevice_initWithPeripheral___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  objc_msgSend(a2, "characteristics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__AXHearingAidDevice_initWithPeripheral___block_invoke_2;
  v4[3] = &unk_1EA8E8AF0;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

}

uint64_t __41__AXHearingAidDevice_initWithPeripheral___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "peripheral:didUpdateCharacteristic:", *(_QWORD *)(a1 + 40), a2);
}

- (AXHearingAidDevice)initWithPersistentRepresentation:(id)a3
{
  id v4;
  AXHearingAidDevice *v5;
  AXHearingAidDevice *v6;
  AXHearingAidDevice *v7;
  _QWORD v9[4];
  AXHearingAidDevice *v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AXHearingAidDevice;
  v5 = -[AXHearingAidDevice init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    -[AXHearingAidDevice _init](v5, "_init");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __55__AXHearingAidDevice_initWithPersistentRepresentation___block_invoke;
    v9[3] = &unk_1EA8E8708;
    v7 = v6;
    v10 = v7;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v9);
    -[AXHearingAidDevice setIsPersistent:](v7, "setIsPersistent:", 1);
    -[AXHearingAidDevice setIsPaired:](v7, "setIsPaired:", 1);

  }
  return v6;
}

void __55__AXHearingAidDevice_initWithPersistentRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  char v21;
  id v22;

  v22 = a2;
  v5 = a3;
  if (objc_msgSend(v22, "isEqualToString:", CFSTR("ax_hearing_device_man_key")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v5, "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "manufacturer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
      v7 = v6;
      objc_msgSend(v6, "replaceObjectAtIndex:withObject:", 0, v5);
LABEL_18:

      goto LABEL_19;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "manufacturer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:
      v7 = v8;
      objc_msgSend(v8, "setArray:", v5);
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  if (objc_msgSend(v22, "isEqualToString:", CFSTR("ax_hearing_device_model_key")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v5, "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "model");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "model");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    goto LABEL_19;
  }
  if (objc_msgSend(v22, "isEqualToString:", CFSTR("ax_hearing_device_man_model_key")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_19;
    v9 = *(void **)(a1 + 32);
    objc_msgSend(&unk_1EA8FFA40, "stringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setValue:forProperty:", v11, 0x80000);

    v12 = *(void **)(a1 + 32);
    objc_msgSend(&unk_1EA8FFA58, "stringValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setValue:forProperty:", v14, 0x100000);
LABEL_49:

    goto LABEL_19;
  }
  if (objc_msgSend(v22, "isEqualToString:", CFSTR("ax_hearing_device_name_key"))
    && objc_msgSend(v5, "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setName:", v5);
    goto LABEL_19;
  }
  if (objc_msgSend(v22, "isEqualToString:", CFSTR("ax_hearing_device_lr_key")))
  {
    v15 = objc_msgSend(v5, "intValue");
    if (v15 <= 6 && ((1 << v15) & 0x54) != 0)
      objc_msgSend(*(id *)(a1 + 32), "setAvailableEars:", v15);
    goto LABEL_19;
  }
  if ((objc_msgSend(v22, "isEqualToString:", CFSTR("ax_hearing_device_left_peripheral_key")) & 1) != 0
    || objc_msgSend(v22, "isEqualToString:", CFSTR("ax_hearing_device_right_peripheral_key")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "objectForKey:", CFSTR("ax_hearing_device_isleft_key"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "BOOLValue");

      objc_msgSend(v5, "objectForKey:", CFSTR("ax_hearing_device_hiid_key"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKey:", CFSTR("ax_hearing_device_hiidother_key"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKey:", CFSTR("ax_hearing_device_uuid_key"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKey:", CFSTR("ax_hearing_device_lea_version_key"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "intValue");

      if (objc_msgSend(v18, "length"))
      {
        v21 = objc_msgSend(v18, "hasPrefix:", *MEMORY[0x1E0D2F908]);
        if (v17)
        {
          if ((v21 & 1) == 0)
            objc_msgSend(*(id *)(a1 + 32), "setLeftPeripheralUUID:", v18);
          if (objc_msgSend(v13, "length"))
            objc_msgSend(*(id *)(a1 + 32), "setLeftUUID:", v13);
          if (objc_msgSend(v14, "length"))
            objc_msgSend(*(id *)(a1 + 32), "setRightUUID:", v14);
          if (v20)
            objc_msgSend(*(id *)(a1 + 32), "setLeftLeaVersion:", v20);
        }
        else
        {
          if ((v21 & 1) == 0)
            objc_msgSend(*(id *)(a1 + 32), "setRightPeripheralUUID:", v18);
          if (objc_msgSend(v14, "length"))
            objc_msgSend(*(id *)(a1 + 32), "setLeftUUID:", v14);
          if (objc_msgSend(v13, "length"))
            objc_msgSend(*(id *)(a1 + 32), "setRightUUID:", v13);
          if (v20)
            objc_msgSend(*(id *)(a1 + 32), "setRightLeaVersion:", v20);
        }
      }

      goto LABEL_49;
    }
  }
LABEL_19:

}

- (AXHearingAidDevice)initWithLeftDevice:(id)a3 andRightDevice:(id)a4
{
  id v6;
  id v7;
  AXHearingAidDevice *v8;
  AXHearingAidDevice *v9;
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
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
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  NSObject *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  NSObject *v59;
  uint64_t v60;
  unsigned int v61;
  uint64_t v62;
  uint64_t v63;
  int v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  char v77;
  objc_super v78;
  uint8_t buf[4];
  uint64_t v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v78.receiver = self;
  v78.super_class = (Class)AXHearingAidDevice;
  v8 = -[AXHearingAidDevice init](&v78, sel_init);
  v9 = v8;
  if (!v8)
    goto LABEL_57;
  -[AXHearingAidDevice _init](v8, "_init");
  objc_msgSend(v6, "leftUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXHearingAidDevice setLeftUUID:](v9, "setLeftUUID:", v10);

  objc_msgSend(v6, "leftPeripheral");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXHearingAidDevice setLeftPeripheral:](v9, "setLeftPeripheral:", v11);

  -[AXHearingAidDevice leftPeripheral](v9, "leftPeripheral");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDelegate:", v9);

  objc_msgSend(v6, "leftMicrophoneVolume");
  -[AXHearingAidDevice setLeftMicrophoneVolume:](v9, "setLeftMicrophoneVolume:");
  objc_msgSend(v6, "leftBatteryLevel");
  -[AXHearingAidDevice setLeftBatteryLevel:](v9, "setLeftBatteryLevel:");
  objc_msgSend(v6, "leftPrograms");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXHearingAidDevice setLeftPrograms:](v9, "setLeftPrograms:", v13);

  objc_msgSend(v6, "currentLeftProgram");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXHearingAidDevice setCurrentLeftProgram:](v9, "setCurrentLeftProgram:", v14);

  -[AXHearingAidDevice setLeftLoadedProperties:](v9, "setLeftLoadedProperties:", objc_msgSend(v6, "leftLoadedProperties"));
  -[AXHearingAidDevice setLeftStreamVolumeSteps:](v9, "setLeftStreamVolumeSteps:", objc_msgSend(v6, "leftStreamVolumeSteps"));
  -[AXHearingAidDevice setLeftSensitivitySteps:](v9, "setLeftSensitivitySteps:", objc_msgSend(v6, "leftSensitivitySteps"));
  objc_msgSend(v6, "leftSensitivity");
  -[AXHearingAidDevice setLeftSensitivity:](v9, "setLeftSensitivity:");
  -[AXHearingAidDevice setLeftMicrophoneVolumeSteps:](v9, "setLeftMicrophoneVolumeSteps:", objc_msgSend(v6, "leftMicrophoneVolumeSteps"));
  -[AXHearingAidDevice setLeftTreble:](v9, "setLeftTreble:", objc_msgSend(v6, "leftTreble"));
  -[AXHearingAidDevice setLeftBass:](v9, "setLeftBass:", objc_msgSend(v6, "leftBass"));
  objc_msgSend(v6, "leftMixedVolume");
  -[AXHearingAidDevice setLeftMixedVolume:](v9, "setLeftMixedVolume:");
  -[AXHearingAidDevice setLeftMixedVolumeSteps:](v9, "setLeftMixedVolumeSteps:", objc_msgSend(v6, "leftMixedVolumeSteps"));
  objc_msgSend(v6, "setLeftPeripheral:", 0);
  objc_msgSend(v6, "setLeftPeripheralUUID:", 0);
  objc_msgSend(v6, "setLeftUUID:", 0);
  objc_msgSend(v6, "setRightPeripheral:", 0);
  objc_msgSend(v6, "setRightPeripheralUUID:", 0);
  objc_msgSend(v6, "setRightUUID:", 0);
  -[AXHearingAidDevice setLeftLeaVersion:](v9, "setLeftLeaVersion:", objc_msgSend(v6, "leftLeaVersion"));
  objc_msgSend(v7, "rightUUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXHearingAidDevice setRightUUID:](v9, "setRightUUID:", v15);

  objc_msgSend(v7, "rightPeripheral");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXHearingAidDevice setRightPeripheral:](v9, "setRightPeripheral:", v16);

  -[AXHearingAidDevice rightPeripheral](v9, "rightPeripheral");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setDelegate:", v9);

  objc_msgSend(v7, "rightMicrophoneVolume");
  -[AXHearingAidDevice setRightMicrophoneVolume:](v9, "setRightMicrophoneVolume:");
  objc_msgSend(v7, "rightBatteryLevel");
  -[AXHearingAidDevice setRightBatteryLevel:](v9, "setRightBatteryLevel:");
  objc_msgSend(v7, "rightPrograms");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXHearingAidDevice setRightPrograms:](v9, "setRightPrograms:", v18);

  objc_msgSend(v7, "currentRightProgram");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXHearingAidDevice setCurrentRightProgram:](v9, "setCurrentRightProgram:", v19);

  -[AXHearingAidDevice setRightLoadedProperties:](v9, "setRightLoadedProperties:", objc_msgSend(v7, "rightLoadedProperties"));
  -[AXHearingAidDevice setRightStreamVolumeSteps:](v9, "setRightStreamVolumeSteps:", objc_msgSend(v7, "rightStreamVolumeSteps"));
  -[AXHearingAidDevice setRightSensitivitySteps:](v9, "setRightSensitivitySteps:", objc_msgSend(v7, "rightSensitivitySteps"));
  objc_msgSend(v7, "rightSensitivity");
  -[AXHearingAidDevice setRightSensitivity:](v9, "setRightSensitivity:");
  -[AXHearingAidDevice setRightMicrophoneVolumeSteps:](v9, "setRightMicrophoneVolumeSteps:", objc_msgSend(v7, "rightMicrophoneVolumeSteps"));
  -[AXHearingAidDevice setRightTreble:](v9, "setRightTreble:", objc_msgSend(v7, "rightTreble"));
  -[AXHearingAidDevice setRightBass:](v9, "setRightBass:", objc_msgSend(v7, "rightBass"));
  objc_msgSend(v7, "rightMixedVolume");
  -[AXHearingAidDevice setRightMixedVolume:](v9, "setRightMixedVolume:");
  -[AXHearingAidDevice setRightMixedVolumeSteps:](v9, "setRightMixedVolumeSteps:", objc_msgSend(v7, "rightMixedVolumeSteps"));
  objc_msgSend(v7, "setRightPeripheral:", 0);
  objc_msgSend(v7, "setRightPeripheralUUID:", 0);
  objc_msgSend(v7, "setRightUUID:", 0);
  objc_msgSend(v7, "setLeftPeripheral:", 0);
  objc_msgSend(v7, "setLeftPeripheralUUID:", 0);
  objc_msgSend(v7, "setLeftUUID:", 0);
  -[AXHearingAidDevice setRightLeaVersion:](v9, "setRightLeaVersion:", objc_msgSend(v7, "rightLeaVersion"));
  objc_msgSend(v7, "currentRightStreamingProgram");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXHearingAidDevice setCurrentRightStreamingProgram:](v9, "setCurrentRightStreamingProgram:", v20);

  objc_msgSend(v6, "currentLeftStreamingProgram");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXHearingAidDevice setCurrentLeftStreamingProgram:](v9, "setCurrentLeftStreamingProgram:", v21);

  -[AXHearingAidDevice setLeftLoadedProperties:](v9, "setLeftLoadedProperties:", objc_msgSend(v6, "leftLoadedProperties") | 0x20);
  -[AXHearingAidDevice setRightLoadedProperties:](v9, "setRightLoadedProperties:", objc_msgSend(v7, "rightLoadedProperties") | 0x20);
  if ((objc_msgSend(v6, "isPaired") & 1) != 0)
    v22 = 1;
  else
    v22 = objc_msgSend(v7, "isPaired");
  -[AXHearingAidDevice setIsPaired:](v9, "setIsPaired:", v22);
  if ((objc_msgSend(v6, "isPersistent") & 1) != 0)
    v23 = 1;
  else
    v23 = objc_msgSend(v7, "isPersistent");
  -[AXHearingAidDevice setIsPersistent:](v9, "setIsPersistent:", v23);
  if (objc_msgSend(v6, "supportsBinauralStreaming"))
    v24 = objc_msgSend(v7, "supportsBinauralStreaming");
  else
    v24 = 0;
  -[AXHearingAidDevice setSupportsBinauralStreaming:](v9, "setSupportsBinauralStreaming:", v24);
  if (objc_msgSend(v6, "supportsCombinedPresets"))
    v25 = objc_msgSend(v7, "supportsCombinedPresets");
  else
    v25 = 0;
  -[AXHearingAidDevice setSupportsCombinedPresets:](v9, "setSupportsCombinedPresets:", v25);
  if (objc_msgSend(v6, "supportsCombinedVolumes"))
    v26 = objc_msgSend(v7, "supportsCombinedVolumes");
  else
    v26 = 0;
  -[AXHearingAidDevice setSupportsCombinedVolumes:](v9, "setSupportsCombinedVolumes:", v26);
  if ((objc_msgSend(v6, "requiresBinauralStreaming") & 1) != 0)
    v27 = 1;
  else
    v27 = objc_msgSend(v7, "requiresBinauralStreaming");
  -[AXHearingAidDevice setRequiresBinauralStreaming:](v9, "setRequiresBinauralStreaming:", v27);
  if (objc_msgSend(v6, "requiresCombinedPresets"))
    v28 = objc_msgSend(v7, "requiresCombinedPresets");
  else
    v28 = 0;
  -[AXHearingAidDevice setRequiresCombinedPresets:](v9, "setRequiresCombinedPresets:", v28);
  if (objc_msgSend(v6, "requiresCombinedVolumes"))
    v29 = objc_msgSend(v7, "requiresCombinedVolumes");
  else
    v29 = 0;
  -[AXHearingAidDevice setRequiresCombinedVolumes:](v9, "setRequiresCombinedVolumes:", v29);
  v30 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v6, "manufacturer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "firstObject");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "manufacturer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "lastObject");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "arrayWithObjects:", v32, v34, 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXHearingAidDevice setManufacturer:](v9, "setManufacturer:", v35);

  v36 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v6, "model");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "firstObject");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "model");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "lastObject");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "arrayWithObjects:", v38, v40, 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXHearingAidDevice setModel:](v9, "setModel:", v41);

  objc_msgSend(v7, "name");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXHearingAidDevice setName:](v9, "setName:", v42);

  -[AXHearingAidDevice leftPeripheral](v9, "leftPeripheral");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "identifier");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "UUIDString");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXHearingAidDevice setLeftPeripheralUUID:](v9, "setLeftPeripheralUUID:", v45);
  if (!v45)
  {
    HAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing left peripheral UUID %@"), v9);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice initWithLeftDevice:andRightDevice:]", 530, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v49 = objc_retainAutorelease(v47);
      v50 = v48;
      v51 = objc_msgSend(v49, "UTF8String");
      *(_DWORD *)buf = 136446210;
      v80 = v51;
      _os_log_impl(&dword_1DE311000, v50, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
  }
  -[AXHearingAidDevice rightPeripheral](v9, "rightPeripheral");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "identifier");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "UUIDString");
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXHearingAidDevice setRightPeripheralUUID:](v9, "setRightPeripheralUUID:", v54);
  if (!v54)
  {
    HAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing right peripheral UUID %@"), v9);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice initWithLeftDevice:andRightDevice:]", 538, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v58 = objc_retainAutorelease(v56);
      v59 = v57;
      v60 = objc_msgSend(v58, "UTF8String");
      *(_DWORD *)buf = 136446210;
      v80 = v60;
      _os_log_impl(&dword_1DE311000, v59, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
  }
  -[AXHearingAidDevice setLeftLoadedProperties:](v9, "setLeftLoadedProperties:", objc_msgSend(v6, "leftLoadedProperties") | 0x100000000000);
  -[AXHearingAidDevice setRightLoadedProperties:](v9, "setRightLoadedProperties:", objc_msgSend(v7, "rightLoadedProperties") | 0x100000000000);
  if (-[AXHearingAidDevice leftAvailable](v9, "leftAvailable"))
    v61 = 2;
  else
    v61 = 0;
  if (-[AXHearingAidDevice rightAvailable](v9, "rightAvailable"))
    v62 = v61 | 4;
  else
    v62 = v61;
  -[AXHearingAidDevice setAvailableEars:](v9, "setAvailableEars:", v62);
  -[AXHearingAidDevice setAvailableInputEars:](v9, "setAvailableInputEars:", objc_msgSend(v7, "availableInputEars") | objc_msgSend(v6, "availableInputEars"));
  if ((objc_msgSend(MEMORY[0x1E0D2F990], "isInternalInstall") & 1) != 0)
  {
    v63 = 6;
  }
  else
  {
    v64 = objc_msgSend(v6, "earsSupportingWatch");
    v63 = objc_msgSend(v7, "earsSupportingWatch") | v64;
  }
  -[AXHearingAidDevice setEarsSupportingWatch:](v9, "setEarsSupportingWatch:", v63);
  +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setAvailableInputEars:", -[AXHearingAidDevice availableInputEars](v9, "availableInputEars"));

  +[HANanoSettings sharedInstance](HANanoSettings, "sharedInstance");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setAvailableInputEars:", -[AXHearingAidDevice availableInputEars](v9, "availableInputEars"));

  +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "setEarsSupportingWatch:", -[AXHearingAidDevice earsSupportingWatch](v9, "earsSupportingWatch"));

  +[HANanoSettings sharedInstance](HANanoSettings, "sharedInstance");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setEarsSupportingWatch:", -[AXHearingAidDevice earsSupportingWatch](v9, "earsSupportingWatch"));

  -[AXHearingAidDevice leftPeripheral](v9, "leftPeripheral");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXHearingAidDevice deviceUUID](v9, "deviceUUID");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "tag:", v70);

  -[AXHearingAidDevice leftPeripheral](v9, "leftPeripheral");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "tag:", CFSTR("Left HA"));

  -[AXHearingAidDevice rightPeripheral](v9, "rightPeripheral");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXHearingAidDevice deviceUUID](v9, "deviceUUID");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "tag:", v73);

  -[AXHearingAidDevice rightPeripheral](v9, "rightPeripheral");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "tag:", CFSTR("Right HA"));

  +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v75, "isiCloudPaired") & 1) != 0)
  {

LABEL_45:
    -[AXHearingAidDevice disconnectAndUnpair:](v9, "disconnectAndUnpair:", 0);
    goto LABEL_51;
  }
  if ((objc_msgSend(v6, "isConnected") & 1) != 0
    || (objc_msgSend(v6, "isPaired") & 1) != 0
    || (objc_msgSend(v7, "isConnected") & 1) != 0)
  {

  }
  else
  {
    v77 = objc_msgSend(v7, "isPaired");

    if ((v77 & 1) == 0)
      goto LABEL_45;
  }
  -[AXHearingAidDevice connect](v9, "connect");
LABEL_51:
  if (-[AXHearingAidDevice isPaired](v9, "isPaired")
    && -[AXHearingAidDevice isPersistent](v9, "isPersistent")
    && -[AXHearingAidDevice isConnected](v9, "isConnected")
    && !-[AXHearingAidDevice didLoadRequiredProperties](v9, "didLoadRequiredProperties"))
  {
    -[AXHearingAidDevice loadRequiredProperties](v9, "loadRequiredProperties");
  }
  objc_msgSend(v6, "setIsPersistent:", 0);
  objc_msgSend(v6, "setIsPaired:", 0);
  objc_msgSend(v7, "setIsPersistent:", 0);
  objc_msgSend(v7, "setIsPaired:", 0);

LABEL_57:
  return v9;
}

- (void)dealloc
{
  NSMutableDictionary *rightPowerSourceDictionary;
  NSMutableDictionary *leftPowerSouceDictionary;
  void *v5;
  void *v6;
  objc_super v7;

  if (self->_rightPowerSourceID)
  {
    IOPSReleasePowerSource();
    self->_rightPowerSourceID = 0;
  }
  if (self->_leftPowerSouceID)
  {
    IOPSReleasePowerSource();
    self->_leftPowerSouceID = 0;
  }
  rightPowerSourceDictionary = self->_rightPowerSourceDictionary;
  self->_rightPowerSourceDictionary = 0;

  leftPowerSouceDictionary = self->_leftPowerSouceDictionary;
  self->_leftPowerSouceDictionary = 0;

  -[AXHearingAidDevice disconnectAndUnpair:](self, "disconnectAndUnpair:", 0);
  -[AXHearingAidDevice setManufacturer:](self, "setManufacturer:", 0);
  -[AXHearingAidDevice setModel:](self, "setModel:", 0);
  -[AXHearingAidDevice setLeftFirmwareVersion:](self, "setLeftFirmwareVersion:", 0);
  -[AXHearingAidDevice setRightFirmwareVersion:](self, "setRightFirmwareVersion:", 0);
  -[AXHearingAidDevice setLeftHardwareVersion:](self, "setLeftHardwareVersion:", 0);
  -[AXHearingAidDevice setRightHardwareVersion:](self, "setRightHardwareVersion:", 0);
  -[AXHearingAidDevice setRightPrograms:](self, "setRightPrograms:", 0);
  -[AXHearingAidDevice setLeftPrograms:](self, "setLeftPrograms:", 0);
  -[AXHearingAidDevice leftPeripheral](self, "leftPeripheral");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", 0);

  -[AXHearingAidDevice rightPeripheral](self, "rightPeripheral");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", 0);

  -[AXHearingAidDevice setLeftPropertiesLoadCount:](self, "setLeftPropertiesLoadCount:", 0);
  -[AXHearingAidDevice setRightPropertiesLoadCount:](self, "setRightPropertiesLoadCount:", 0);
  -[AXHearingAidDevice setCurrentLeftProgram:](self, "setCurrentLeftProgram:", 0);
  -[AXHearingAidDevice setCurrentRightProgram:](self, "setCurrentRightProgram:", 0);
  -[AXHearingAidDevice setCurrentLeftStreamingProgram:](self, "setCurrentLeftStreamingProgram:", 0);
  -[AXHearingAidDevice setCurrentRightStreamingProgram:](self, "setCurrentRightStreamingProgram:", 0);
  -[AXHearingAidDevice setLeftBatteryLowDate:](self, "setLeftBatteryLowDate:", 0);
  -[AXHearingAidDevice setRightBatteryLowDate:](self, "setRightBatteryLowDate:", 0);
  v7.receiver = self;
  v7.super_class = (Class)AXHearingAidDevice;
  -[AXHearingAidDevice dealloc](&v7, sel_dealloc);
}

- (void)connect
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  HCLogHearingHandoff();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DE311000, v3, OS_LOG_TYPE_DEFAULT, "HearingAidDevice Connect", buf, 2u);
  }

  if (!-[AXHearingAidDevice isConnected](self, "isConnected"))
  {
    -[AXHearingAidDevice setIsConnecting:](self, "setIsConnecting:", 1);
    +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "shouldStreamToLeftAid"))
    {
      +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "shouldStreamToRightAid")
        && -[AXHearingAidDevice leftAvailable](self, "leftAvailable")
        && -[AXHearingAidDevice rightAvailable](self, "rightAvailable"))
      {
        v7 = supportsBinauralStreamingForHearingAid(self);

        if ((v7 & 1) != 0)
        {
LABEL_17:
          +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[AXHearingAidDevice leftPeripheral](self, "leftPeripheral");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "connectToPeripheral:", v9);

          +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[AXHearingAidDevice rightPeripheral](self, "rightPeripheral");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "connectToPeripheral:", v11);

          return;
        }
        +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setShouldStreamToLeftAid:", 0);
      }
      else
      {

      }
    }

    goto LABEL_17;
  }
  if (!-[AXHearingAidDevice isPaired](self, "isPaired"))
  {
    HCLogHearingHandoff();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1DE311000, v4, OS_LOG_TYPE_DEFAULT, "Set isPaired to YES", v12, 2u);
    }

  }
  -[AXHearingAidDevice setIsPaired:](self, "setIsPaired:", 1);
}

- (void)disconnectAndUnpair:(BOOL)a3
{
  _BOOL4 v3;
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
  id v20;

  v3 = a3;
  if (!-[AXHearingAidDevice isFakeDevice](self, "isFakeDevice") && !v3)
  {
    +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXHearingAidDevice leftPeripheral](self, "leftPeripheral");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "disconnectFromPeripheral:", v6);

    +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXHearingAidDevice rightPeripheral](self, "rightPeripheral");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "disconnectFromPeripheral:", v8);

  }
  if (v3)
  {
    if (!-[AXHearingAidDevice isFakeDevice](self, "isFakeDevice"))
    {
      +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXHearingAidDevice leftPeripheralUUID](self, "leftPeripheralUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "unpairPeripheralWithUUID:", v10);

      +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXHearingAidDevice rightPeripheralUUID](self, "rightPeripheralUUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "unpairPeripheralWithUUID:", v12);

    }
    -[AXHearingAidDevice setIsPaired:](self, "setIsPaired:", 0);
    if (-[AXHearingAidDevice isPaired](self, "isPaired"))
    {
      +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setPairedHearingAids:", 0);

    }
    -[AXHearingAidDevice setLeftPresetBitmask:](self, "setLeftPresetBitmask:", 0);
    -[AXHearingAidDevice setRightPresetBitmask:](self, "setRightPresetBitmask:", 0);
  }
  +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "device:didUpdateProperty:", self, 606076928);

  -[AXHearingAidDevice setIsConnecting:](self, "setIsConnecting:", 0);
  -[AXHearingAidDevice setIsPersistent:](self, "setIsPersistent:", 0);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXHearingAidDevice setRightPrograms:](self, "setRightPrograms:", v15);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXHearingAidDevice setLeftPrograms:](self, "setLeftPrograms:", v16);

  -[AXHearingAidDevice setCurrentRightProgram:](self, "setCurrentRightProgram:", 0);
  -[AXHearingAidDevice setCurrentLeftProgram:](self, "setCurrentLeftProgram:", 0);
  -[AXHearingAidDevice setCurrentRightStreamingProgram:](self, "setCurrentRightStreamingProgram:", 0);
  -[AXHearingAidDevice setCurrentLeftStreamingProgram:](self, "setCurrentLeftStreamingProgram:", 0);
  -[AXHearingAidDevice setRightLoadedProperties:](self, "setRightLoadedProperties:", -[AXHearingAidDevice rightLoadedProperties](self, "rightLoadedProperties") & 0xFFFFFFFFFFFFFEFFLL);
  -[AXHearingAidDevice setLeftLoadedProperties:](self, "setLeftLoadedProperties:", -[AXHearingAidDevice leftLoadedProperties](self, "leftLoadedProperties") & 0xFFFFFFFFFFFFFEFFLL);
  -[AXHearingAidDevice rightPropertiesLoadCount](self, "rightPropertiesLoadCount");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 256);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "removeObjectForKey:", v18);

  -[AXHearingAidDevice leftPropertiesLoadCount](self, "leftPropertiesLoadCount");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 256);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "removeObjectForKey:", v19);

}

- (void)connectionDidChange
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[5];
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id buf;
  __int16 v18;
  _BOOL4 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  HCLogHearingHandoff();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109376;
    HIDWORD(buf) = -[AXHearingAidDevice isConnecting](self, "isConnecting");
    v18 = 1024;
    v19 = -[AXHearingAidDevice isConnected](self, "isConnected");
    _os_log_impl(&dword_1DE311000, v3, OS_LOG_TYPE_DEFAULT, "HearingAidDevice connectionDidChange connecting: %d connected: %d", (uint8_t *)&buf, 0xEu);
  }

  +[HUUtilities sharedUtilities](HUUtilities, "sharedUtilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearAudioRoutes");

  if (-[AXHearingAidDevice isConnecting](self, "isConnecting"))
  {
    -[AXHearingAidDevice setIsConnecting:](self, "setIsConnecting:", 0);
    -[AXHearingAidDevice setIsPaired:](self, "setIsPaired:", 1);
    -[AXHearingAidDevice setIsPersistent:](self, "setIsPersistent:", 1);
    -[AXHearingAidDevice leftPropertiesLoadCount](self, "leftPropertiesLoadCount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeAllObjects");

    -[AXHearingAidDevice rightPropertiesLoadCount](self, "rightPropertiesLoadCount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeAllObjects");

    +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "device:didUpdateProperty:", self, 0x100024200038);

  }
  if (-[AXHearingAidDevice isConnected](self, "isConnected"))
  {
    +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "device:didUpdateProperty:", self, 0x200000);

    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __41__AXHearingAidDevice_connectionDidChange__block_invoke;
    v16[3] = &unk_1EA8E8B40;
    v16[4] = self;
    -[AXHearingAidDevice checkPairingStatusWithCompletion:](self, "checkPairingStatusWithCompletion:", v16);
  }
  else
  {
    self->_leftWriteResponseProperties = 0;
    self->_rightWriteResponseProperties = 0;
  }
  if (!self->_isListeningForStreamingChanges)
  {
    +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&buf, self);
    objc_msgSend(v9, "shouldStreamToLeftAid");
    v10 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __41__AXHearingAidDevice_connectionDidChange__block_invoke_113;
    v14[3] = &unk_1EA8E8B68;
    v14[4] = self;
    objc_copyWeak(&v15, &buf);
    objc_msgSend(v9, "registerUpdateBlock:forRetrieveSelector:withListener:", v14, sel_shouldStreamToLeftAid, self);
    objc_msgSend(v9, "shouldStreamToRightAid");
    v12[0] = v10;
    v12[1] = 3221225472;
    v12[2] = __41__AXHearingAidDevice_connectionDidChange__block_invoke_119;
    v12[3] = &unk_1EA8E8B68;
    v12[4] = self;
    objc_copyWeak(&v13, &buf);
    objc_msgSend(v9, "registerUpdateBlock:forRetrieveSelector:withListener:", v12, sel_shouldStreamToRightAid, self);
    -[AXHearingAidDevice updateInputTagsAndReset:](self, "updateInputTagsAndReset:", 0);
    v11[0] = v10;
    v11[1] = 3221225472;
    v11[2] = __41__AXHearingAidDevice_connectionDidChange__block_invoke_122;
    v11[3] = &unk_1EA8E8220;
    v11[4] = self;
    objc_msgSend(v9, "registerUpdateBlock:forRetrieveSelector:withListener:", v11, sel_preferredInputEar, self);
    self->_isListeningForStreamingChanges = 1;
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&buf);

  }
}

uint64_t __41__AXHearingAidDevice_connectionDidChange__block_invoke(uint64_t a1, int a2)
{
  BOOL v4;
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
  NSObject *v23;
  void *v24;
  void *v25;
  _BYTE *v26;
  void *v27;
  unsigned __int8 *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t result;
  uint8_t buf[4];
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isPaired"))
    v4 = a2 == 0;
  else
    v4 = 1;
  if (!v4)
  {
    +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pairedHearingAids");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      if (objc_msgSend(*(id *)(a1 + 32), "leftAvailable"))
      {
        objc_msgSend(*(id *)(a1 + 32), "leftPeripheral");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          objc_msgSend(*(id *)(a1 + 32), "leftPeripheral");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "identifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "UUIDString");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(a1 + 32), "setLeftPeripheralUUID:", v11);
        }
      }
      if (objc_msgSend(*(id *)(a1 + 32), "rightAvailable"))
      {
        objc_msgSend(*(id *)(a1 + 32), "rightPeripheral");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(*(id *)(a1 + 32), "rightPeripheral");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "UUIDString");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(a1 + 32), "setRightPeripheralUUID:", v16);
        }
      }
      HAInitializeLogging();
      v17 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(a1 + 32), "persistentRepresentation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", CFSTR("Paired: %@ - %@"), v18, *(_QWORD *)(a1 + 32));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice connectionDidChange]_block_invoke", 774, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)*MEMORY[0x1E0D2F928];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
      {
        v22 = objc_retainAutorelease(v20);
        v23 = v21;
        *(_DWORD *)buf = 136446210;
        v37 = objc_msgSend(v22, "UTF8String");
        _os_log_impl(&dword_1DE311000, v23, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

      }
      +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "persistentRepresentation");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setPairedHearingAids:", v25);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "updateName");
  v26 = *(_BYTE **)(a1 + 32);
  if (v26[60])
  {
    objc_msgSend(*(id *)(a1 + 32), "leftPeripheral");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setNotify:forPeripheral:", 1, v27);

    v28 = *(unsigned __int8 **)(a1 + 32);
    v29 = v28[60];
    objc_msgSend(v28, "rightPeripheral");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setNotify:forPeripheral:", v29, v30);

    objc_msgSend(*(id *)(a1 + 32), "setLeftLoadedProperties:", objc_msgSend(*(id *)(a1 + 32), "leftLoadedProperties") & 0xFFFFFF007FFEFA3BLL);
    objc_msgSend(*(id *)(a1 + 32), "setRightLoadedProperties:", objc_msgSend(*(id *)(a1 + 32), "rightLoadedProperties") & 0xFFFFFF007FFEFA3BLL);
    v31 = *(void **)(a1 + 32);
    objc_msgSend(v31, "leftPeripheral");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "loadProperties:forPeripheral:withRetryPeriod:", 0xFF800105C4, v32, 0.0);

    v33 = *(void **)(a1 + 32);
    objc_msgSend(v33, "rightPeripheral");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "loadProperties:forPeripheral:withRetryPeriod:", 0xFF800105C4, v34, 0.0);

    v26 = *(_BYTE **)(a1 + 32);
  }
  if ((objc_msgSend(v26, "didLoadBasicProperties") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "loadBasicProperties");
  result = objc_msgSend(*(id *)(a1 + 32), "isPaired");
  if ((_DWORD)result)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "didLoadRequiredProperties");
    if ((result & 1) == 0)
      return objc_msgSend(*(id *)(a1 + 32), "loadRequiredProperties");
  }
  return result;
}

void __41__AXHearingAidDevice_connectionDidChange__block_invoke_113(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isPaired")
    && (+[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v2, "pairedHearingAids"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v2,
        v3))
  {
    +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "preferredInputEar");

    if (v5 == 2)
    {
      +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setPreferredInputEar:", 6);

    }
    +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "leftPeripheral");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "resetConnectionToPeripheral:", v8);

  }
  else
  {
    HAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Hearing aid isn't paired, but we're changing streaming prefs %@"), *(_QWORD *)(a1 + 32));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice connectionDidChange]_block_invoke", 828, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_retainAutorelease(v10);
      v13 = v11;
      *(_DWORD *)buf = 136446210;
      v16 = objc_msgSend(v12, "UTF8String");
      _os_log_impl(&dword_1DE311000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
  }
}

void __41__AXHearingAidDevice_connectionDidChange__block_invoke_119(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isPaired")
    && (+[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v2, "pairedHearingAids"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v2,
        v3))
  {
    +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "preferredInputEar");

    if (v5 == 4)
    {
      +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setPreferredInputEar:", 6);

    }
    +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "rightPeripheral");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "resetConnectionToPeripheral:", v8);

  }
  else
  {
    HAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Hearing aid isn't paired, but we're changing streaming prefs %@"), *(_QWORD *)(a1 + 32));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice connectionDidChange]_block_invoke", 847, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_retainAutorelease(v10);
      v13 = v11;
      *(_DWORD *)buf = 136446210;
      v16 = objc_msgSend(v12, "UTF8String");
      _os_log_impl(&dword_1DE311000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
  }
}

uint64_t __41__AXHearingAidDevice_connectionDidChange__block_invoke_122(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateInputTagsAndReset:", 1);
}

- (BOOL)containsPeripheralWithUUID:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (v4)
  {
    -[AXHearingAidDevice leftPeripheralUUID](self, "leftPeripheralUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", v4) & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      -[AXHearingAidDevice rightPeripheralUUID](self, "rightPeripheralUUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "isEqualToString:", v4) & 1) != 0)
      {
        v6 = 1;
      }
      else
      {
        -[AXHearingAidDevice deviceUUID](self, "deviceUUID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v8, "isEqualToString:", v4);

      }
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)deviceUUID
{
  void *v3;
  void *v4;
  void *v5;

  -[AXHearingAidDevice leftUUID](self, "leftUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXHearingAidDevice rightUUID](self, "rightUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[AXHearingAidDevice deviceIDFromLeftID:andRightID:](AXHearingAidDevice, "deviceIDFromLeftID:andRightID:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (BOOL)peripheral:(id)a3 didLoadProperty:(unint64_t)a4
{
  id v6;
  id v7;
  unint64_t v8;
  unint64_t v9;

  v6 = a3;
  -[AXHearingAidDevice leftPeripheral](self, "leftPeripheral");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
    v8 = -[AXHearingAidDevice leftLoadedProperties](self, "leftLoadedProperties");
  else
    v8 = -[AXHearingAidDevice rightLoadedProperties](self, "rightLoadedProperties");
  v9 = v8;

  return (a4 & ~v9) == 0;
}

- (BOOL)didLoadPersistentProperties
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  -[AXHearingAidDevice name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (!v4)
    return 0;
  -[AXHearingAidDevice deviceUUID](self, "deviceUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (!v6)
    return 0;
  -[AXHearingAidDevice manufacturer](self, "manufacturer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {

  }
  else
  {
    -[AXHearingAidDevice manufacturer](self, "manufacturer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");

    if (!v11)
      return 0;
  }
  -[AXHearingAidDevice model](self, "model");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "length"))
  {

    return -[AXHearingAidDevice availableEars](self, "availableEars") != 0;
  }
  -[AXHearingAidDevice model](self, "model");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lastObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "length");

  if (v16)
    return -[AXHearingAidDevice availableEars](self, "availableEars") != 0;
  return 0;
}

- (BOOL)didLoadOptionalBasicProperties
{
  uint64_t v3;
  void *v4;
  _BOOL4 v5;
  id *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  _BOOL8 v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  _QWORD v23[7];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t buf[4];
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  if (objc_msgSend(MEMORY[0x1E0D2F990], "supportsLEA2"))
    v3 = 0x50000000002;
  else
    v3 = 2;
  subPropertiesOfProperty(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __52__AXHearingAidDevice_didLoadOptionalBasicProperties__block_invoke;
  v23[3] = &unk_1EA8E8B90;
  v23[4] = self;
  v23[5] = &v28;
  v23[6] = &v24;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v23);

  v5 = -[AXHearingAidDevice leftAvailable](self, "leftAvailable");
  v6 = (id *)MEMORY[0x1E0D2F928];
  if (v5 && v29[3])
  {
    -[AXHearingAidDevice leftPeripheral](self, "leftPeripheral");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[AXHearingAidDevice peripheral:didLoadProperty:](self, "peripheral:didLoadProperty:", v7, v29[3]);
  }
  else
  {
    HAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No optional properties on left"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice didLoadOptionalBasicProperties]", 929, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *v6;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
      *(_DWORD *)buf = 136446210;
      v33 = v11;
      _os_log_impl(&dword_1DE311000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }

    v8 = 1;
  }

  if (-[AXHearingAidDevice rightAvailable](self, "rightAvailable") && v25[3])
  {
    -[AXHearingAidDevice rightPeripheral](self, "rightPeripheral");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[AXHearingAidDevice peripheral:didLoadProperty:](self, "peripheral:didLoadProperty:", v12, v25[3]);
  }
  else
  {
    HAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No optional properties on right"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice didLoadOptionalBasicProperties]", 939, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *v6;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
      *(_DWORD *)buf = 136446210;
      v33 = v16;
      _os_log_impl(&dword_1DE311000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }

    v13 = 1;
  }

  if (-[AXHearingAidDevice leftAvailable](self, "leftAvailable")
    || -[AXHearingAidDevice rightAvailable](self, "rightAvailable"))
  {
    v17 = v8 & v13;
  }
  else
  {
    v17 = 0;
  }
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%d} LEFT [%d, %d] RIGHT [%d, %d]"), v17, -[AXHearingAidDevice leftAvailable](self, "leftAvailable"), v8, -[AXHearingAidDevice rightAvailable](self, "rightAvailable"), v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice didLoadOptionalBasicProperties]", 946, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *v6;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
    *(_DWORD *)buf = 136446210;
    v33 = v21;
    _os_log_impl(&dword_1DE311000, v20, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  return v17;
}

void __52__AXHearingAidDevice_didLoadOptionalBasicProperties__block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  os_log_t *v8;
  void *v9;
  id v10;
  NSObject *v11;
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
  os_log_t v22;
  id v23;
  NSObject *v24;
  uint64_t v25;
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
  os_log_t v36;
  id v37;
  NSObject *v38;
  uint64_t v39;
  uint8_t buf[4];
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(a2, "unsignedLongLongValue");
  HAInitializeLogging();
  v4 = (void *)MEMORY[0x1E0CB3940];
  hearingPropertyDescription(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Checking %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice didLoadOptionalBasicProperties]_block_invoke", 909, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (os_log_t *)MEMORY[0x1E0D2F928];
  v9 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_retainAutorelease(v7);
    v11 = v9;
    *(_DWORD *)buf = 136446210;
    v41 = objc_msgSend(v10, "UTF8String");
    _os_log_impl(&dword_1DE311000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  v12 = (void *)a1[4];
  objc_msgSend(v12, "leftPeripheral");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "peripheral:characteristicForProperty:", v13, v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) |= v3;
    HAInitializeLogging();
    v15 = (void *)MEMORY[0x1E0CB3940];
    hearingPropertyDescription(v3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)a1[4];
    objc_msgSend(v17, "leftPeripheral");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "peripheral:characteristicForProperty:", v18, v3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("Adding available %@ - %@"), v16, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice didLoadOptionalBasicProperties]_block_invoke", 913, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      v23 = objc_retainAutorelease(v21);
      v24 = v22;
      v25 = objc_msgSend(v23, "UTF8String");
      *(_DWORD *)buf = 136446210;
      v41 = v25;
      _os_log_impl(&dword_1DE311000, v24, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
  }
  v26 = (void *)a1[4];
  objc_msgSend(v26, "rightPeripheral");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "peripheral:characteristicForProperty:", v27, v3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) |= v3;
    HAInitializeLogging();
    v29 = (void *)MEMORY[0x1E0CB3940];
    hearingPropertyDescription(v3);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)a1[4];
    objc_msgSend(v31, "rightPeripheral");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "peripheral:characteristicForProperty:", v32, v3);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringWithFormat:", CFSTR("Adding available %@ - %@"), v30, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice didLoadOptionalBasicProperties]_block_invoke", 918, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      v37 = objc_retainAutorelease(v35);
      v38 = v36;
      v39 = objc_msgSend(v37, "UTF8String");
      *(_DWORD *)buf = 136446210;
      v41 = v39;
      _os_log_impl(&dword_1DE311000, v38, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
  }
}

- (BOOL)didLoadBasicProperties
{
  _BOOL4 v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  _BOOL4 v23;
  _BOOL4 v24;
  void *v25;
  _BOOL4 v26;
  void *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  uint8_t buf[4];
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (-[AXHearingAidDevice leftAvailable](self, "leftAvailable")
    || -[AXHearingAidDevice rightAvailable](self, "rightAvailable"))
  {
    v3 = -[AXHearingAidDevice leftAvailable](self, "leftAvailable");
    -[AXHearingAidDevice leftPeripheral](self, "leftPeripheral");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 == -[AXHearingAidDevice peripheral:didLoadProperty:](self, "peripheral:didLoadProperty:", v4, 56))
    {
      v5 = -[AXHearingAidDevice rightAvailable](self, "rightAvailable");
      -[AXHearingAidDevice rightPeripheral](self, "rightPeripheral");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v5 == -[AXHearingAidDevice peripheral:didLoadProperty:](self, "peripheral:didLoadProperty:", v6, 56)
        && -[AXHearingAidDevice didLoadOptionalBasicProperties](self, "didLoadOptionalBasicProperties");
      v32 = v7;

    }
    else
    {
      v32 = 0;
    }

  }
  else
  {
    v32 = 0;
  }
  HAInitializeLogging();
  v29 = (void *)MEMORY[0x1E0CB3940];
  v28 = -[AXHearingAidDevice leftAvailable](self, "leftAvailable");
  -[AXHearingAidDevice leftPeripheral](self, "leftPeripheral");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[AXHearingAidDevice peripheral:didLoadProperty:](self, "peripheral:didLoadProperty:", v31, 8);
  -[AXHearingAidDevice leftPeripheral](self, "leftPeripheral");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[AXHearingAidDevice peripheral:didLoadProperty:](self, "peripheral:didLoadProperty:", v30, 16);
  -[AXHearingAidDevice leftPeripheral](self, "leftPeripheral");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[AXHearingAidDevice peripheral:didLoadProperty:](self, "peripheral:didLoadProperty:", v27, 32);
  -[AXHearingAidDevice leftPeripheral](self, "leftPeripheral");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AXHearingAidDevice peripheral:didLoadProperty:](self, "peripheral:didLoadProperty:", v25, 0x100000000000);
  v9 = -[AXHearingAidDevice rightAvailable](self, "rightAvailable");
  -[AXHearingAidDevice rightPeripheral](self, "rightPeripheral");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[AXHearingAidDevice peripheral:didLoadProperty:](self, "peripheral:didLoadProperty:", v10, 8);
  -[AXHearingAidDevice rightPeripheral](self, "rightPeripheral");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[AXHearingAidDevice peripheral:didLoadProperty:](self, "peripheral:didLoadProperty:", v12, 16);
  -[AXHearingAidDevice rightPeripheral](self, "rightPeripheral");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[AXHearingAidDevice peripheral:didLoadProperty:](self, "peripheral:didLoadProperty:", v14, 32);
  -[AXHearingAidDevice rightPeripheral](self, "rightPeripheral");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "stringWithFormat:", CFSTR("{%d} LEFT [%d]: (%d, %d, %d, %d) RIGHT [%d]: (%d, %d, %d, %d)"), v32, v28, v26, v24, v23, v8, v9, v11, v13, v15, -[AXHearingAidDevice peripheral:didLoadProperty:](self, "peripheral:didLoadProperty:", v16, 0x100000000000));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice didLoadBasicProperties]", 969, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v20 = objc_retainAutorelease(v18);
    v21 = v19;
    *(_DWORD *)buf = 136446210;
    v34 = objc_msgSend(v20, "UTF8String");
    _os_log_impl(&dword_1DE311000, v21, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  return v32;
}

- (BOOL)didLoadRequiredProperties
{
  _BOOL4 v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  BOOL v21;
  void *v22;
  _BOOL8 v24;
  _BOOL8 v25;
  _BOOL8 v26;
  _BOOL8 v27;
  _BOOL8 v28;
  _BOOL8 v29;
  _BOOL8 v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[6];
  __int128 buf;
  uint64_t v40;
  char v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (-[AXHearingAidDevice leftAvailable](self, "leftAvailable")
    || -[AXHearingAidDevice rightAvailable](self, "rightAvailable"))
  {
    v3 = -[AXHearingAidDevice leftAvailable](self, "leftAvailable");
    -[AXHearingAidDevice leftPeripheral](self, "leftPeripheral");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 == -[AXHearingAidDevice peripheral:didLoadProperty:](self, "peripheral:didLoadProperty:", v4, -[AXHearingAidDevice requiredProperties](self, "requiredProperties")))
    {
      v5 = -[AXHearingAidDevice rightAvailable](self, "rightAvailable");
      -[AXHearingAidDevice rightPeripheral](self, "rightPeripheral");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v5 ^ -[AXHearingAidDevice peripheral:didLoadProperty:](self, "peripheral:didLoadProperty:", v6, -[AXHearingAidDevice requiredProperties](self, "requiredProperties")) ^ 1;

    }
    else
    {
      v32 = 0;
    }

  }
  else
  {
    v32 = 0;
  }
  HAInitializeLogging();
  v31 = (void *)MEMORY[0x1E0CB3940];
  v30 = -[AXHearingAidDevice leftAvailable](self, "leftAvailable");
  -[AXHearingAidDevice leftPeripheral](self, "leftPeripheral");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[AXHearingAidDevice peripheral:didLoadProperty:](self, "peripheral:didLoadProperty:", v37, 56);
  -[AXHearingAidDevice leftPeripheral](self, "leftPeripheral");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[AXHearingAidDevice peripheral:didLoadProperty:](self, "peripheral:didLoadProperty:", v36, 4);
  -[AXHearingAidDevice leftPeripheral](self, "leftPeripheral");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[AXHearingAidDevice peripheral:didLoadProperty:](self, "peripheral:didLoadProperty:", v35, 64);
  -[AXHearingAidDevice leftPeripheral](self, "leftPeripheral");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[AXHearingAidDevice peripheral:didLoadProperty:](self, "peripheral:didLoadProperty:", v34, 256);
  -[AXHearingAidDevice leftPeripheral](self, "leftPeripheral");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[AXHearingAidDevice peripheral:didLoadProperty:](self, "peripheral:didLoadProperty:", v33, 1024);
  v24 = -[AXHearingAidDevice rightAvailable](self, "rightAvailable");
  -[AXHearingAidDevice rightPeripheral](self, "rightPeripheral");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AXHearingAidDevice peripheral:didLoadProperty:](self, "peripheral:didLoadProperty:", v7, 56);
  -[AXHearingAidDevice rightPeripheral](self, "rightPeripheral");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[AXHearingAidDevice peripheral:didLoadProperty:](self, "peripheral:didLoadProperty:", v9, 4);
  -[AXHearingAidDevice rightPeripheral](self, "rightPeripheral");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[AXHearingAidDevice peripheral:didLoadProperty:](self, "peripheral:didLoadProperty:", v11, 64);
  -[AXHearingAidDevice rightPeripheral](self, "rightPeripheral");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[AXHearingAidDevice peripheral:didLoadProperty:](self, "peripheral:didLoadProperty:", v13, 256);
  -[AXHearingAidDevice rightPeripheral](self, "rightPeripheral");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "stringWithFormat:", CFSTR("{%d} LEFT [%d]: (%d, %d, %d, %d, %d) RIGHT [%d]: (%d, %d, %d, %d, %d)"), v32, v30, v29, v28, v27, v26, v25, v24, v8, v10, v12, v14, -[AXHearingAidDevice peripheral:didLoadProperty:](self, "peripheral:didLoadProperty:", v15, 1024));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice didLoadRequiredProperties]", 980, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v19 = objc_retainAutorelease(v17);
    v20 = v18;
    LODWORD(buf) = 136446210;
    *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v19, "UTF8String");
    _os_log_impl(&dword_1DE311000, v20, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v40 = 0x2020000000;
  v21 = 1;
  v41 = 1;
  if ((v32 & 1) == 0)
  {
    objc_msgSend((id)objc_opt_class(), "characteristicsUUIDs");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __47__AXHearingAidDevice_didLoadRequiredProperties__block_invoke;
    v38[3] = &unk_1EA8E8BB8;
    v38[4] = self;
    v38[5] = &buf;
    objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", v38);

    v21 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) != 0;
  }
  _Block_object_dispose(&buf, 8);
  return v21;
}

void __47__AXHearingAidDevice_didLoadRequiredProperties__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;

  v17 = a2;
  v6 = objc_msgSend(v17, "unsignedLongLongValue");
  if ((v6 & ~objc_msgSend(*(id *)(a1 + 32), "requiredProperties")) == 0)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "leftAvailable"))
    {
      v7 = *(void **)(a1 + 32);
      objc_msgSend(v7, "leftPeripheral");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "peripheral:didLoadProperty:", v8, v6))
      {

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "leftPropertiesLoadCount");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", v17);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "intValue");

        if (v11 <= 2)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
          *a4 = 1;
        }
      }
    }
    if (objc_msgSend(*(id *)(a1 + 32), "rightAvailable"))
    {
      v12 = *(void **)(a1 + 32);
      objc_msgSend(v12, "rightPeripheral");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "peripheral:didLoadProperty:", v13, v6))
      {

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "rightPropertiesLoadCount");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKey:", v17);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "intValue");

        if (v16 <= 2)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
          *a4 = 1;
        }
      }
    }
  }

}

- (void)mateWithDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  int v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MATE: self: %@ other %@"), self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice mateWithDevice:]", 1009, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_retainAutorelease(v6);
    v9 = v7;
    *(_DWORD *)buf = 136446210;
    v19 = objc_msgSend(v8, "UTF8String");
    _os_log_impl(&dword_1DE311000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  if (!v4)
    goto LABEL_10;
  -[AXHearingAidDevice leftUUID](self, "leftUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leftUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "isEqualToString:", v11))
    goto LABEL_9;
  -[AXHearingAidDevice rightUUID](self, "rightUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "isEqualToString:", v13))
  {

LABEL_9:
    goto LABEL_10;
  }
  v14 = -[AXHearingAidDevice leftAvailable](self, "leftAvailable");
  if (v14 != objc_msgSend(v4, "leftAvailable"))
  {

LABEL_13:
    +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "mergeDevice:withDevice:", self, v4);
    goto LABEL_11;
  }
  v16 = -[AXHearingAidDevice rightAvailable](self, "rightAvailable");
  v17 = objc_msgSend(v4, "rightAvailable");

  if (v16 != v17)
    goto LABEL_13;
LABEL_10:
  +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "replaceDevice:withDevice:", v4, self);
LABEL_11:

}

- (BOOL)leftAvailable
{
  void *v2;
  BOOL v3;

  -[AXHearingAidDevice leftPeripheral](self, "leftPeripheral");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)rightAvailable
{
  void *v2;
  BOOL v3;

  -[AXHearingAidDevice rightPeripheral](self, "rightPeripheral");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isLeftConnected
{
  void *v2;
  BOOL v3;

  -[AXHearingAidDevice leftPeripheral](self, "leftPeripheral");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "state") == 2;

  return v3;
}

- (BOOL)isRightConnected
{
  void *v2;
  BOOL v3;

  -[AXHearingAidDevice rightPeripheral](self, "rightPeripheral");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "state") == 2;

  return v3;
}

- (BOOL)isConnected
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _BOOL4 v7;

  -[AXHearingAidDevice leftPeripheral](self, "leftPeripheral");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "state");

  -[AXHearingAidDevice rightPeripheral](self, "rightPeripheral");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "state");

  if (-[AXHearingAidDevice leftAvailable](self, "leftAvailable")
    || (v7 = -[AXHearingAidDevice rightAvailable](self, "rightAvailable")))
  {
    if ((v4 != 2) == -[AXHearingAidDevice leftAvailable](self, "leftAvailable"))
      LOBYTE(v7) = 0;
    else
      LOBYTE(v7) = (v6 != 2) ^ -[AXHearingAidDevice rightAvailable](self, "rightAvailable");
  }
  return v7;
}

- (BOOL)hasConnection
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  -[AXHearingAidDevice leftPeripheral](self, "leftPeripheral");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "state");

  -[AXHearingAidDevice rightPeripheral](self, "rightPeripheral");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "state");

  return v4 == 2 || v6 == 2;
}

- (BOOL)isAnyPeripheralInConnectingState
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  -[AXHearingAidDevice leftPeripheral](self, "leftPeripheral");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "state");

  -[AXHearingAidDevice rightPeripheral](self, "rightPeripheral");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "state");

  return v4 == 1 || v6 == 1;
}

- (int)connectedEars
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  uint64_t v6;

  -[AXHearingAidDevice leftPeripheral](self, "leftPeripheral");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "state") == 2;

  -[AXHearingAidDevice rightPeripheral](self, "rightPeripheral");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "state");

  if (v6 == 2)
    return (2 * v4) | 4;
  else
    return 2 * v4;
}

- (id)programs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[AXHearingAidDevice leftPrograms](self, "leftPrograms");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXHearingAidDevice rightPrograms](self, "rightPrograms");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __30__AXHearingAidDevice_programs__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unsigned int v6;
  unsigned int v7;
  BOOL v8;
  uint64_t v9;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "index");
  v7 = objc_msgSend(v5, "index");
  v8 = v6 == v7;
  if (v6 < v7)
    v9 = -1;
  else
    v9 = 1;
  if (v8)
  {
    objc_msgSend(v4, "setEar:", 6);
    objc_msgSend(v5, "setEar:", 6);
    v9 = 0;
  }

  return v9;
}

- (unint64_t)peripheral:(id)a3 propertyForCharacteristic:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  unint64_t v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a3;
  v6 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 2;
  objc_msgSend((id)objc_opt_class(), "characteristicsUUIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__AXHearingAidDevice_peripheral_propertyForCharacteristic___block_invoke;
  v11[3] = &unk_1EA8E8BB8;
  v8 = v6;
  v12 = v8;
  v13 = &v14;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v11);

  v9 = v15[3];
  _Block_object_dispose(&v14, 8);

  return v9;
}

void __59__AXHearingAidDevice_peripheral_propertyForCharacteristic___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v7;
  id v8;
  void *v9;
  int v10;
  id v11;

  v11 = a2;
  v7 = *(void **)(a1 + 32);
  v8 = a3;
  objc_msgSend(v7, "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if (v10)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v11, "unsignedLongLongValue");
    *a4 = 1;
  }

}

- (id)peripheral:(id)a3 characteristicForProperty:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "characteristicsUUIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__0;
  v20 = __Block_byref_object_dispose__0;
  v21 = 0;
  objc_msgSend(v5, "services");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __59__AXHearingAidDevice_peripheral_characteristicForProperty___block_invoke;
  v13[3] = &unk_1EA8E8C48;
  v10 = v8;
  v14 = v10;
  v15 = &v16;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v13);

  v11 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v11;
}

void __59__AXHearingAidDevice_peripheral_characteristicForProperty___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  uint64_t v12;

  objc_msgSend(a2, "characteristics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__AXHearingAidDevice_peripheral_characteristicForProperty___block_invoke_2;
  v9[3] = &unk_1EA8E8C20;
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v10 = v7;
  v11 = v8;
  v12 = a4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

}

void __59__AXHearingAidDevice_peripheral_characteristicForProperty___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
    **(_BYTE **)(a1 + 48) = 1;
  }

}

- (unint64_t)availablePropertiesForPeripheral:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v5 = 2;
  v14 = 2;
  if (v4)
  {
    objc_msgSend((id)objc_opt_class(), "characteristicsUUIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __55__AXHearingAidDevice_availablePropertiesForPeripheral___block_invoke;
    v8[3] = &unk_1EA8E8C70;
    v8[4] = self;
    v9 = v4;
    v10 = &v11;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v8);

    v5 = v12[3];
  }
  _Block_object_dispose(&v11, 8);

  return v5;
}

void __55__AXHearingAidDevice_availablePropertiesForPeripheral___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;

  v3 = objc_msgSend(a2, "unsignedLongLongValue");
  objc_msgSend(*(id *)(a1 + 32), "peripheral:characteristicForProperty:", *(_QWORD *)(a1 + 40), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) |= v3;
}

- (id)peripheral:(id)a3 characteristicForUUID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v5 = a3;
  v6 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__0;
  v18 = __Block_byref_object_dispose__0;
  v19 = 0;
  objc_msgSend(v5, "services");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__AXHearingAidDevice_peripheral_characteristicForUUID___block_invoke;
  v11[3] = &unk_1EA8E8C48;
  v8 = v6;
  v12 = v8;
  v13 = &v14;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);

  v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

void __55__AXHearingAidDevice_peripheral_characteristicForUUID___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  uint64_t v12;

  objc_msgSend(a2, "characteristics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__AXHearingAidDevice_peripheral_characteristicForUUID___block_invoke_2;
  v9[3] = &unk_1EA8E8C20;
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v10 = v7;
  v11 = v8;
  v12 = a4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

}

void __55__AXHearingAidDevice_peripheral_characteristicForUUID___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
    **(_BYTE **)(a1 + 48) = 1;
  }

}

- (void)setNotify:(BOOL)a3 forPeripheral:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  BOOL v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v4 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v6)
  {
    HAInitializeLogging();
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "services");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("Setting notify %d for peripheral: %@ - %@"), v4, v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice setNotify:forPeripheral:]", 1166, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_retainAutorelease(v10);
      v13 = v11;
      *(_DWORD *)buf = 136446210;
      v19 = objc_msgSend(v12, "UTF8String");
      _os_log_impl(&dword_1DE311000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    objc_msgSend(v6, "services");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __46__AXHearingAidDevice_setNotify_forPeripheral___block_invoke;
    v15[3] = &unk_1EA8E8CC0;
    v15[4] = self;
    v16 = v6;
    v17 = v4;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v15);

  }
}

void __46__AXHearingAidDevice_setNotify_forPeripheral___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  char v7;

  objc_msgSend(a2, "characteristics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__AXHearingAidDevice_setNotify_forPeripheral___block_invoke_2;
  v5[3] = &unk_1EA8E8C98;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  v7 = *(_BYTE *)(a1 + 48);
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v5);

}

void __46__AXHearingAidDevice_setNotify_forPeripheral___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "peripheral:propertyForCharacteristic:", *(_QWORD *)(a1 + 40)) & 0xFFFFFE007FFDFB3BLL) == 0)
    objc_msgSend(*(id *)(a1 + 40), "setNotifyValue:forCharacteristic:", *(unsigned __int8 *)(a1 + 48), v3);

}

- (void)setKeepInSync:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _BOOL8 keepInSync;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_keepInSync != a3)
  {
    v3 = a3;
    self->_keepInSync = a3;
    -[AXHearingAidDevice leftPeripheral](self, "leftPeripheral");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXHearingAidDevice setNotify:forPeripheral:](self, "setNotify:forPeripheral:", v3, v5);

    keepInSync = self->_keepInSync;
    -[AXHearingAidDevice rightPeripheral](self, "rightPeripheral");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXHearingAidDevice setNotify:forPeripheral:](self, "setNotify:forPeripheral:", keepInSync, v7);

    if (self->_keepInSync)
    {
      -[AXHearingAidDevice loadFailedProperties](self, "loadFailedProperties");
      if (!-[AXHearingAidDevice didLoadRequiredProperties](self, "didLoadRequiredProperties"))
      {
        HAInitializeLogging();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Not completely loaded, trying again"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice setKeepInSync:]", 1195, v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)*MEMORY[0x1E0D2F928];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
        {
          v11 = objc_retainAutorelease(v9);
          v12 = v10;
          *(_DWORD *)buf = 136446210;
          v14 = objc_msgSend(v11, "UTF8String");
          _os_log_impl(&dword_1DE311000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

        }
        -[AXHearingAidDevice loadRequiredProperties](self, "loadRequiredProperties");
      }
    }
  }
}

- (void)loadProperties:(unint64_t)a3 forPeripheral:(id)a4 withRetryPeriod:(double)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  dispatch_time_t v23;
  NSObject *v24;
  _QWORD block[5];
  id v26;
  unint64_t v27;
  double v28;
  _QWORD v29[4];
  id v30;
  AXHearingAidDevice *v31;
  id v32;
  __int128 *p_buf;
  unint64_t v34;
  __int128 buf;
  uint64_t v36;
  char v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = v8;
  if (a3 != 2 && v8)
  {
    HAInitializeLogging();
    v10 = (void *)MEMORY[0x1E0CB3940];
    hearingPropertyDescription(a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("Loading %@ for %@"), v11, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice loadProperties:forPeripheral:withRetryPeriod:]", 1206, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_retainAutorelease(v13);
      v16 = v14;
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v15, "UTF8String");
      _os_log_impl(&dword_1DE311000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);

    }
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v36 = 0x2020000000;
    v37 = 0;
    -[AXHearingAidDevice leftPeripheral](self, "leftPeripheral");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17 == v9)
      -[AXHearingAidDevice leftPropertiesLoadCount](self, "leftPropertiesLoadCount");
    else
      -[AXHearingAidDevice rightPropertiesLoadCount](self, "rightPropertiesLoadCount");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "services");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __67__AXHearingAidDevice_loadProperties_forPeripheral_withRetryPeriod___block_invoke;
    v29[3] = &unk_1EA8E8D10;
    v21 = v9;
    v30 = v21;
    v31 = self;
    v22 = v18;
    v32 = v22;
    p_buf = &buf;
    v34 = a3;
    objc_msgSend(v19, "enumerateObjectsUsingBlock:", v29);

    if (a5 > 0.0 && *(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
    {
      v23 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
      dispatch_get_global_queue(-32768, 0);
      v24 = objc_claimAutoreleasedReturnValue();
      block[0] = v20;
      block[1] = 3221225472;
      block[2] = __67__AXHearingAidDevice_loadProperties_forPeripheral_withRetryPeriod___block_invoke_153;
      block[3] = &unk_1EA8E8D38;
      block[4] = self;
      v27 = a3;
      v26 = v21;
      v28 = a5;
      dispatch_after(v23, v24, block);

    }
    _Block_object_dispose(&buf, 8);
  }

}

void __67__AXHearingAidDevice_loadProperties_forPeripheral_withRetryPeriod___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;

  objc_msgSend(a2, "characteristics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__AXHearingAidDevice_loadProperties_forPeripheral_withRetryPeriod___block_invoke_2;
  v9[3] = &unk_1EA8E8CE8;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v10 = v4;
  v11 = v5;
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 64);
  v13 = *(_QWORD *)(a1 + 56);
  v14 = v8;
  v12 = v7;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v9);

}

void __67__AXHearingAidDevice_loadProperties_forPeripheral_withRetryPeriod___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "leftPeripheral");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 40);
  if (v4 == v5)
    v7 = objc_msgSend(v6, "leftLoadedProperties");
  else
    v7 = objc_msgSend(v6, "rightLoadedProperties");
  v8 = v7;

  v9 = objc_msgSend(*(id *)(a1 + 40), "peripheral:propertyForCharacteristic:", *(_QWORD *)(a1 + 32), v3);
  v10 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "intValue");

  if (v9 == 2
    || (v9 & ~*(_QWORD *)(a1 + 64)) != 0
    || (objc_msgSend(*(id *)(a1 + 40), "peripheral:didLoadProperty:", *(_QWORD *)(a1 + 32), v9) & 1) != 0)
  {
    HAInitializeLogging();
    v14 = (void *)MEMORY[0x1E0CB3940];
    hearingPropertyDescription(v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(*(id *)(a1 + 40), "peripheral:didLoadProperty:", *(_QWORD *)(a1 + 32), v9);
    hearingPropertyDescription(v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("Not loading %@, %d, %d - %@ = %@"), v15, v13, v16, v3, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice loadProperties:forPeripheral:withRetryPeriod:]_block_invoke_2", 1224, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_retainAutorelease(v19);
      v22 = v20;
      *(_DWORD *)buf = 136446210;
      v27 = objc_msgSend(v21, "UTF8String");
      _os_log_impl(&dword_1DE311000, v22, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
  }
  else
  {
    v23 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v13 + 1));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v9);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKey:", v24, v25);

    objc_msgSend(*(id *)(a1 + 40), "readValueForCharacteristic:fromPeripheral:", v3, *(_QWORD *)(a1 + 32));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = (v9 & 0xFFFFFF007FFEFA3BLL) != 0;
  }

}

uint64_t __67__AXHearingAidDevice_loadProperties_forPeripheral_withRetryPeriod___block_invoke_153(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "loadProperties:forPeripheral:withRetryPeriod:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));
}

- (void)loadBasicProperties
{
  void *v3;
  id v4;

  if (!self->_finishedLoading)
  {
    -[AXHearingAidDevice leftPeripheral](self, "leftPeripheral");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXHearingAidDevice loadProperties:forPeripheral:withRetryPeriod:](self, "loadProperties:forPeripheral:withRetryPeriod:", 0x5000000003ALL, v3, 0.0);

    -[AXHearingAidDevice rightPeripheral](self, "rightPeripheral");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[AXHearingAidDevice loadProperties:forPeripheral:withRetryPeriod:](self, "loadProperties:forPeripheral:withRetryPeriod:", 0x5000000003ALL, v4, 0.0);

  }
}

- (void)loadRequiredProperties
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];

  +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXHearingAidDevice leftPeripheral](self, "leftPeripheral");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__AXHearingAidDevice_loadRequiredProperties__block_invoke;
  v9[3] = &unk_1EA8E82F0;
  v9[4] = self;
  objc_msgSend(v3, "checkPeripheralPaired:withCompletion:", v4, v9);

  +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXHearingAidDevice rightPeripheral](self, "rightPeripheral");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __44__AXHearingAidDevice_loadRequiredProperties__block_invoke_157;
  v8[3] = &unk_1EA8E82F0;
  v8[4] = self;
  objc_msgSend(v6, "checkPeripheralPaired:withCompletion:", v7, v8);

}

void __44__AXHearingAidDevice_loadRequiredProperties__block_invoke(uint64_t a1, int a2)
{
  char v4;
  void *v5;
  uint64_t v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  unsigned int v29;
  unsigned int v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  uint8_t buf[4];
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(*(id *)(a1 + 32), "isPaired");
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v5, "leftPeripheral");
  v6 = objc_claimAutoreleasedReturnValue();
  v33 = (id)v6;
  if ((v4 & 1) != 0 || a2)
  {
    v7 = objc_msgSend(v5, "peripheral:didLoadProperty:", v6, objc_msgSend(*(id *)(a1 + 32), "requiredProperties"));

    if ((v7 & 1) == 0)
    {
      HAInitializeLogging();
      v32 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(a1 + 32), "leftPeripheral");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(void **)(a1 + 32);
      objc_msgSend(v8, "leftPeripheral");
      v34 = (id)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v8, "peripheral:didLoadProperty:", v34, 56);
      v9 = *(void **)(a1 + 32);
      objc_msgSend(v9, "leftPeripheral");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v9, "peripheral:didLoadProperty:", v10, 4);
      v11 = *(void **)(a1 + 32);
      objc_msgSend(v11, "leftPeripheral");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "peripheral:didLoadProperty:", v12, 64);
      v14 = *(void **)(a1 + 32);
      objc_msgSend(v14, "leftPeripheral");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "peripheral:didLoadProperty:", v15, 128);
      v17 = *(void **)(a1 + 32);
      objc_msgSend(v17, "leftPeripheral");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v17) = objc_msgSend(v17, "peripheral:didLoadProperty:", v18, 256);
      v19 = *(void **)(a1 + 32);
      objc_msgSend(v19, "leftPeripheral");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "stringWithFormat:", CFSTR("Loading required properties for %@ - (%d, %d, %d, %d, %d, %d)"), v31, v30, v29, v13, v16, v17, objc_msgSend(v19, "peripheral:didLoadProperty:", v20, 1024));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice loadRequiredProperties]_block_invoke", 1262, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)*MEMORY[0x1E0D2F928];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
      {
        v24 = objc_retainAutorelease(v22);
        v25 = v23;
        *(_DWORD *)buf = 136446210;
        v36 = objc_msgSend(v24, "UTF8String");
        _os_log_impl(&dword_1DE311000, v25, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

      }
      v26 = *(void **)(a1 + 32);
      v27 = objc_msgSend(v26, "requiredProperties");
      objc_msgSend(*(id *)(a1 + 32), "leftPeripheral");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "loadProperties:forPeripheral:withRetryPeriod:", v27, v28, 10.0);

    }
  }
  else
  {
    objc_msgSend(v5, "loadProperties:forPeripheral:withRetryPeriod:", 64, v6, 0.0);

  }
}

void __44__AXHearingAidDevice_loadRequiredProperties__block_invoke_157(uint64_t a1, int a2)
{
  char v4;
  void *v5;
  uint64_t v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  unsigned int v29;
  unsigned int v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  uint8_t buf[4];
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(*(id *)(a1 + 32), "isPaired");
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v5, "rightPeripheral");
  v6 = objc_claimAutoreleasedReturnValue();
  v33 = (id)v6;
  if ((v4 & 1) != 0 || a2)
  {
    v7 = objc_msgSend(v5, "peripheral:didLoadProperty:", v6, objc_msgSend(*(id *)(a1 + 32), "requiredProperties"));

    if ((v7 & 1) == 0)
    {
      HAInitializeLogging();
      v32 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(a1 + 32), "rightPeripheral");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(void **)(a1 + 32);
      objc_msgSend(v8, "rightPeripheral");
      v34 = (id)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v8, "peripheral:didLoadProperty:", v34, 56);
      v9 = *(void **)(a1 + 32);
      objc_msgSend(v9, "rightPeripheral");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v9, "peripheral:didLoadProperty:", v10, 4);
      v11 = *(void **)(a1 + 32);
      objc_msgSend(v11, "rightPeripheral");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "peripheral:didLoadProperty:", v12, 64);
      v14 = *(void **)(a1 + 32);
      objc_msgSend(v14, "rightPeripheral");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "peripheral:didLoadProperty:", v15, 128);
      v17 = *(void **)(a1 + 32);
      objc_msgSend(v17, "rightPeripheral");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v17) = objc_msgSend(v17, "peripheral:didLoadProperty:", v18, 256);
      v19 = *(void **)(a1 + 32);
      objc_msgSend(v19, "rightPeripheral");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "stringWithFormat:", CFSTR("Loading required properties for %@ - (%d, %d, %d, %d, %d, %d)"), v31, v30, v29, v13, v16, v17, objc_msgSend(v19, "peripheral:didLoadProperty:", v20, 1024));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice loadRequiredProperties]_block_invoke", 1278, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)*MEMORY[0x1E0D2F928];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
      {
        v24 = objc_retainAutorelease(v22);
        v25 = v23;
        *(_DWORD *)buf = 136446210;
        v36 = objc_msgSend(v24, "UTF8String");
        _os_log_impl(&dword_1DE311000, v25, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

      }
      v26 = *(void **)(a1 + 32);
      v27 = objc_msgSend(v26, "requiredProperties");
      objc_msgSend(*(id *)(a1 + 32), "rightPeripheral");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "loadProperties:forPeripheral:withRetryPeriod:", v27, v28, 10.0);

    }
  }
  else
  {
    objc_msgSend(v5, "loadProperties:forPeripheral:withRetryPeriod:", 64, v6, 0.0);

  }
}

- (void)loadFailedProperties
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[6];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t buf[4];
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (-[AXHearingAidDevice isPaired](self, "isPaired"))
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v26 = 2;
    -[AXHearingAidDevice leftPropertiesLoadCount](self, "leftPropertiesLoadCount");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __42__AXHearingAidDevice_loadFailedProperties__block_invoke;
    v22[3] = &unk_1EA8E8BB8;
    v22[4] = self;
    v22[5] = &v23;
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v22);

    v5 = v24[3];
    -[AXHearingAidDevice leftPeripheral](self, "leftPeripheral");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXHearingAidDevice loadProperties:forPeripheral:withRetryPeriod:](self, "loadProperties:forPeripheral:withRetryPeriod:", v5, v6, 0.0);

    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 2;
    -[AXHearingAidDevice rightPropertiesLoadCount](self, "rightPropertiesLoadCount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v4;
    v17[1] = 3221225472;
    v17[2] = __42__AXHearingAidDevice_loadFailedProperties__block_invoke_2;
    v17[3] = &unk_1EA8E8BB8;
    v17[4] = self;
    v17[5] = &v18;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v17);

    v8 = v19[3];
    -[AXHearingAidDevice rightPeripheral](self, "rightPeripheral");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXHearingAidDevice loadProperties:forPeripheral:withRetryPeriod:](self, "loadProperties:forPeripheral:withRetryPeriod:", v8, v9, 0.0);

    HAInitializeLogging();
    v10 = (void *)MEMORY[0x1E0CB3940];
    hearingPropertyDescription(v24[3]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    hearingPropertyDescription(v19[3]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("(%@ - %@)"), v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice loadFailedProperties]", 1316, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
      *(_DWORD *)buf = 136446210;
      v28 = v16;
      _os_log_impl(&dword_1DE311000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v23, 8);
  }
}

void __42__AXHearingAidDevice_loadFailedProperties__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  id v9;

  v9 = a3;
  v5 = objc_msgSend(a2, "unsignedLongLongValue");
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v6, "leftPeripheral");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "peripheral:didLoadProperty:", v7, v5) & 1) != 0)
  {

  }
  else
  {
    v8 = objc_msgSend(v9, "intValue");

    if (v8 >= 3)
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= v5;
  }

}

void __42__AXHearingAidDevice_loadFailedProperties__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  id v9;

  v9 = a3;
  v5 = objc_msgSend(a2, "unsignedLongLongValue");
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v6, "rightPeripheral");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "peripheral:didLoadProperty:", v7, v5) & 1) != 0)
  {

  }
  else
  {
    v8 = objc_msgSend(v9, "intValue");

    if (v8 >= 3)
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= v5;
  }

}

- (BOOL)deviceSupportsProperty:(unint64_t)a3
{
  void *v5;
  void *v6;
  _BOOL4 v7;
  BOOL v8;
  void *v9;
  void *v10;

  if (-[AXHearingAidDevice leftAvailable](self, "leftAvailable"))
  {
    -[AXHearingAidDevice leftPeripheral](self, "leftPeripheral");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXHearingAidDevice peripheral:characteristicForProperty:](self, "peripheral:characteristicForProperty:", v5, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = -[AXHearingAidDevice rightAvailable](self, "rightAvailable");
    if (v6)
      v8 = 1;
    else
      v8 = v7;
    if (v7 && !v6)
    {
      -[AXHearingAidDevice rightPeripheral](self, "rightPeripheral");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXHearingAidDevice peripheral:characteristicForProperty:](self, "peripheral:characteristicForProperty:", v9, a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v10 != 0;

    }
  }
  else
  {
    -[AXHearingAidDevice rightAvailable](self, "rightAvailable");
    return 1;
  }
  return v8;
}

- (void)updateName
{
  -[AXHearingAidDevice updateNameWithAdvertisingData:](self, "updateNameWithAdvertisingData:", 0);
}

- (void)updateNameWithAdvertisingData:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[AXHearingAidDevice rightPeripheral](self, "rightPeripheral", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[AXHearingAidDevice rightAvailable](self, "rightAvailable")
    && -[AXHearingAidDevice leftAvailable](self, "leftAvailable"))
  {
    -[AXHearingAidDevice leftPeripheral](self, "leftPeripheral");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    -[AXHearingAidDevice setName:](self, "setName:", v9);
    +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "device:didUpdateProperty:", self, 0x40000);

    v5 = (void *)v9;
  }
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("New name: %@"), v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice updateNameWithAdvertisingData:]", 1355, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v14 = objc_retainAutorelease(v12);
    v15 = v13;
    *(_DWORD *)buf = 136446210;
    v17 = objc_msgSend(v14, "UTF8String");
    _os_log_impl(&dword_1DE311000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
}

- (void)updateBatteryServiceForPeripheral:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  OpaqueIOPSPowerSourceID *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  objc_class *v16;
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
  double v27;
  const __CFString *v28;
  void *v29;
  id v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  _QWORD v40[11];
  _QWORD v41[11];
  uint8_t buf[4];
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[AXHearingAidDevice rightPeripheral](self, "rightPeripheral");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    v6 = 88;
    if (v5 == v4)
      v6 = 96;
    v7 = *(OpaqueIOPSPowerSourceID **)((char *)&self->super.isa + v6);
    if (objc_msgSend(v4, "state") == 2)
    {
      if (!v7)
      {
        v8 = IOPSCreatePowerSource();
        if ((_DWORD)v8)
        {
          v9 = v8;
          HAInitializeLogging();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to initialize the power source for peripheral \"%@\": 0x%X"), v4, v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice updateBatteryServiceForPeripheral:]", 1373, v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (void *)*MEMORY[0x1E0D2F928];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
          {
            v13 = objc_retainAutorelease(v11);
            v14 = v12;
            *(_DWORD *)buf = 136446210;
            v43 = objc_msgSend(v13, "UTF8String");
            _os_log_impl(&dword_1DE311000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

          }
        }
        else if (v5 == v4)
        {
          self->_rightPowerSourceID = v7;
        }
        else
        {
          self->_leftPowerSouceID = v7;
        }
      }
      if (v5 == v4)
        v15 = 112;
      else
        v15 = 104;
      v16 = (objc_class *)*(id *)((char *)&self->super.isa + v15);
      if (!v16)
      {
        v16 = (objc_class *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        v17 = *(Class *)((char *)&self->super.isa + v15);
        *(Class *)((char *)&self->super.isa + v15) = v16;

      }
      -[AXHearingAidDevice name](self, "name");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "length"))
        -[AXHearingAidDevice name](self, "name");
      else
        hearingLocString(CFSTR("HearingAidLabel"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = (void *)MEMORY[0x1E0CB3940];
      if (v5 == v4)
      {
        hearingLocString(CFSTR("RightHearingAidLabel"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringWithFormat:", CFSTR("%@ %@"), v19, v23);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        -[AXHearingAidDevice rightPeripheralUUID](self, "rightPeripheralUUID");
      }
      else
      {
        hearingLocString(CFSTR("LeftHearingAidLabel"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringWithFormat:", CFSTR("%@ %@"), v19, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        -[AXHearingAidDevice leftPeripheralUUID](self, "leftPeripheralUUID");
      }
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXHearingAidDevice deviceUUID](self, "deviceUUID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v24, "length") && objc_msgSend(v25, "length"))
      {
        v40[0] = CFSTR("Type");
        v40[1] = CFSTR("Transport Type");
        v41[0] = CFSTR("Accessory Source");
        v41[1] = CFSTR("Bluetooth LE");
        v40[2] = CFSTR("Accessory Identifier");
        v40[3] = CFSTR("Max Capacity");
        v41[2] = v24;
        v41[3] = &unk_1EA8FFA70;
        v40[4] = CFSTR("Part Name");
        v40[5] = CFSTR("Name");
        v41[4] = v22;
        v41[5] = v19;
        v41[6] = v25;
        v40[6] = CFSTR("Group Identifier");
        v40[7] = CFSTR("Current Capacity");
        v26 = (void *)MEMORY[0x1E0CB37E8];
        if (v5 == v4)
        {
          -[AXHearingAidDevice rightBatteryLevel](self, "rightBatteryLevel");
          v28 = CFSTR("Right");
        }
        else
        {
          -[AXHearingAidDevice leftBatteryLevel](self, "leftBatteryLevel");
          v28 = CFSTR("Left");
        }
        objc_msgSend(v26, "numberWithDouble:", v27 * 10.0);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v41[7] = v34;
        v41[8] = CFSTR("Battery Power");
        v40[8] = CFSTR("Power Source State");
        v40[9] = CFSTR("Accessory Category");
        v40[10] = CFSTR("Part Identifier");
        v41[9] = CFSTR("HearingAid");
        v41[10] = v28;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 11);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[objc_class setDictionary:](v16, "setDictionary:", v35);

        v36 = IOPSSetPowerSourceDetails();
        if (!(_DWORD)v36)
          goto LABEL_40;
        v37 = v36;
        HAInitializeLogging();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to update the power source for peripheral \"%@\": 0x%X - %@"), v4, v37, v16);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice updateBatteryServiceForPeripheral:]", 1424, v29);
        v30 = (id)objc_claimAutoreleasedReturnValue();
        v38 = (void *)*MEMORY[0x1E0D2F928];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
        {
          v30 = objc_retainAutorelease(v30);
          v32 = v38;
          v39 = objc_msgSend(v30, "UTF8String");
          *(_DWORD *)buf = 136446210;
          v43 = v39;
          goto LABEL_38;
        }
      }
      else
      {
        HAInitializeLogging();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to update the power source with periperalUUID %@ and deviceUUID %@"), v24, v25);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice updateBatteryServiceForPeripheral:]", 1429, v29);
        v30 = (id)objc_claimAutoreleasedReturnValue();
        v31 = (void *)*MEMORY[0x1E0D2F928];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
        {
          v30 = objc_retainAutorelease(v30);
          v32 = v31;
          v33 = objc_msgSend(v30, "UTF8String");
          *(_DWORD *)buf = 136446210;
          v43 = v33;
LABEL_38:
          _os_log_impl(&dword_1DE311000, v32, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

        }
      }

LABEL_40:
      goto LABEL_41;
    }
    if (v7)
    {
      IOPSReleasePowerSource();
      if (v5 == v4)
        self->_rightPowerSourceID = 0;
      else
        self->_leftPowerSouceID = 0;
    }
  }
LABEL_41:

}

- (void)watchWristOrientationDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Wrist orientation changed %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice watchWristOrientationDidChange:]", 1453, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_retainAutorelease(v6);
    v9 = v7;
    *(_DWORD *)buf = 136446210;
    v11 = objc_msgSend(v8, "UTF8String");
    _os_log_impl(&dword_1DE311000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  -[AXHearingAidDevice updateInputTagsAndReset:](self, "updateInputTagsAndReset:", 1);
}

- (void)updateInputTagsAndReset:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  int v7;
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
  id v18;

  v3 = a3;
  if (-[AXHearingAidDevice isPaired](self, "isPaired")
    && objc_msgSend(MEMORY[0x1E0D2F990], "supportsLEA2"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "preferredInputEar");

    switch(v7)
    {
      case 0:
LABEL_4:
        -[AXHearingAidDevice leftPeripheral](self, "leftPeripheral");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v18;
        goto LABEL_8;
      case 2:
LABEL_7:
        -[AXHearingAidDevice leftPeripheral](self, "leftPeripheral");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v5;
LABEL_8:
        objc_msgSend(v9, "hcSafeAddObject:", v8);

        -[AXHearingAidDevice rightPeripheral](self, "rightPeripheral");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v18;
        goto LABEL_11;
      case 4:
LABEL_9:
        -[AXHearingAidDevice leftPeripheral](self, "leftPeripheral");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v18;
LABEL_10:
        objc_msgSend(v13, "hcSafeAddObject:", v12);

        -[AXHearingAidDevice rightPeripheral](self, "rightPeripheral");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v5;
LABEL_11:
        objc_msgSend(v11, "hcSafeAddObject:", v10);

        break;
      case 6:
        switch(-[AXHearingAidDevice availableInputEars](self, "availableInputEars"))
        {
          case 0:
            goto LABEL_4;
          case 2:
            goto LABEL_7;
          case 4:
            goto LABEL_9;
          case 6:
            -[AXHearingAidDevice leftPeripheral](self, "leftPeripheral");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = v5;
            goto LABEL_10;
          default:
            goto LABEL_12;
        }
      default:
        break;
    }
LABEL_12:
    objc_msgSend(v18, "enumerateObjectsUsingBlock:", &__block_literal_global_214);
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", &__block_literal_global_222);
    if (v3)
    {
      +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXHearingAidDevice leftPeripheral](self, "leftPeripheral");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "resetConnectionToPeripheral:", v15);

      +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXHearingAidDevice rightPeripheral](self, "rightPeripheral");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "resetConnectionToPeripheral:", v17);

    }
  }
}

void __46__AXHearingAidDevice_updateInputTagsAndReset___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Disabling input for %@"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice updateInputTagsAndReset:]_block_invoke", 1537, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_retainAutorelease(v4);
    v7 = v5;
    *(_DWORD *)buf = 136446210;
    v9 = objc_msgSend(v6, "UTF8String");
    _os_log_impl(&dword_1DE311000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  objc_msgSend(v2, "axTag:", CFSTR("Disable Input"));
  objc_msgSend(v2, "axUntag:", CFSTR("Enable Input"));

}

void __46__AXHearingAidDevice_updateInputTagsAndReset___block_invoke_221(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Enabling input for %@"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice updateInputTagsAndReset:]_block_invoke", 1543, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_retainAutorelease(v4);
    v7 = v5;
    *(_DWORD *)buf = 136446210;
    v9 = objc_msgSend(v6, "UTF8String");
    _os_log_impl(&dword_1DE311000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  objc_msgSend(v2, "axUntag:", CFSTR("Disable Input"));
  objc_msgSend(v2, "axTag:", CFSTR("Enable Input"));

}

- (void)writeValueForProperty:(unint64_t)a3
{
  unint64_t *p_leftWriteResponseProperties;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  unint64_t *p_rightWriteResponseProperties;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  uint8_t buf[4];
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if ((a3 & ~self->leftWriteRequestProperties) == 0)
  {
    if ((self->_leftWriteResponseProperties & a3) != 0)
    {
      p_leftWriteResponseProperties = &self->_leftWriteResponseProperties;
      HAInitializeLogging();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FAILED left write response check %lld"), *p_leftWriteResponseProperties);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice writeValueForProperty:]", 1591, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)*MEMORY[0x1E0D2F928];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
      {
        v9 = objc_retainAutorelease(v7);
        v10 = v8;
        *(_DWORD *)buf = 136446210;
        v38 = objc_msgSend(v9, "UTF8String");
        _os_log_impl(&dword_1DE311000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

      }
    }
    else
    {
      p_leftWriteResponseProperties = &self->leftWriteRequestProperties;
      if ((a3 & 0xFFFFFFBF7FFFFF3FLL) == 0)
      {
        -[AXHearingAidDevice leftPeripheral](self, "leftPeripheral");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = -[AXHearingAidDevice volumeValueForProperty:andPeripheral:](self, "volumeValueForProperty:andPeripheral:", a3, v22);

        -[AXHearingAidDevice writeInt:toEar:forProperty:](self, "writeInt:toEar:forProperty:", v23, 2, a3);
        goto LABEL_7;
      }
      if ((a3 & 0xFFFFFFFFFFFFFBFFLL) != 0)
      {
        if ((a3 & 0xFFFFFFF7FFFFFFFFLL) != 0)
        {
          -[AXHearingAidDevice leftPeripheral](self, "leftPeripheral");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = -[AXHearingAidDevice signedValueForProperty:andPeripheral:](self, "signedValueForProperty:andPeripheral:", a3, v18);

          -[AXHearingAidDevice writeSignedInt:toEar:forProperty:](self, "writeSignedInt:toEar:forProperty:", v19, 2, a3);
        }
        else
        {
          -[AXHearingAidDevice leftSelectedStreamingProgram](self, "leftSelectedStreamingProgram");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[AXHearingAidDevice leftSelectedProgram](self, "leftSelectedProgram");
          v28 = objc_claimAutoreleasedReturnValue();
          v29 = (void *)v28;
          if (v27)
            v30 = v27;
          else
            v30 = (void *)v28;
          v31 = v30;

          -[AXHearingAidDevice writeInt:toEar:forProperty:](self, "writeInt:toEar:forProperty:", objc_msgSend(v31, "index"), 2, 0x800000000);
        }
        goto LABEL_7;
      }
      -[AXHearingAidDevice leftSelectedProgram](self, "leftSelectedProgram");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXHearingAidDevice writeInt:toEar:forProperty:](self, "writeInt:toEar:forProperty:", objc_msgSend(v6, "index"), 2, 1024);
    }

LABEL_7:
    *p_leftWriteResponseProperties &= ~a3;
  }
  if ((a3 & ~self->rightWriteRequestProperties) == 0)
  {
    if ((self->_rightWriteResponseProperties & a3) != 0)
    {
      p_rightWriteResponseProperties = &self->_rightWriteResponseProperties;
      HAInitializeLogging();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FAILED right write response check %lld"), self->_rightWriteResponseProperties);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice writeValueForProperty:]", 1625, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)*MEMORY[0x1E0D2F928];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
      {
        v15 = objc_retainAutorelease(v13);
        v16 = v14;
        v17 = objc_msgSend(v15, "UTF8String");
        *(_DWORD *)buf = 136446210;
        v38 = v17;
        _os_log_impl(&dword_1DE311000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

      }
    }
    else
    {
      p_rightWriteResponseProperties = &self->rightWriteRequestProperties;
      if ((a3 & 0xFFFFFFBF7FFFFF3FLL) != 0)
      {
        if ((a3 & 0xFFFFFFFFFFFFFBFFLL) != 0)
        {
          if ((a3 & 0xFFFFFFF7FFFFFFFFLL) != 0)
          {
            -[AXHearingAidDevice rightPeripheral](self, "rightPeripheral");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = -[AXHearingAidDevice signedValueForProperty:andPeripheral:](self, "signedValueForProperty:andPeripheral:", a3, v20);

            -[AXHearingAidDevice writeSignedInt:toEar:forProperty:](self, "writeSignedInt:toEar:forProperty:", v21, 4, a3);
          }
          else
          {
            -[AXHearingAidDevice rightSelectedStreamingProgram](self, "rightSelectedStreamingProgram");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[AXHearingAidDevice rightSelectedProgram](self, "rightSelectedProgram");
            v33 = objc_claimAutoreleasedReturnValue();
            v34 = (void *)v33;
            if (v32)
              v35 = v32;
            else
              v35 = (void *)v33;
            v36 = v35;

            -[AXHearingAidDevice writeInt:toEar:forProperty:](self, "writeInt:toEar:forProperty:", objc_msgSend(v36, "index"), 4, 0x800000000);
          }
        }
        else
        {
          -[AXHearingAidDevice rightSelectedProgram](self, "rightSelectedProgram");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AXHearingAidDevice writeInt:toEar:forProperty:](self, "writeInt:toEar:forProperty:", objc_msgSend(v26, "index"), 4, 1024);

        }
      }
      else
      {
        -[AXHearingAidDevice rightPeripheral](self, "rightPeripheral");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = -[AXHearingAidDevice volumeValueForProperty:andPeripheral:](self, "volumeValueForProperty:andPeripheral:", a3, v24);

        -[AXHearingAidDevice writeInt:toEar:forProperty:](self, "writeInt:toEar:forProperty:", v25, 4, a3);
      }
    }
    *p_rightWriteResponseProperties &= ~a3;
  }
}

- (void)_sendDelayedWrites
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  AXDispatchTimer *propertyWriteTimer;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[5];
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = -[AXHearingAidDevice isPaired](self, "isPaired");
  HAInitializeLogging();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Left %lld - Right %lld"), self->leftWriteRequestProperties, self->rightWriteRequestProperties);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice _sendDelayedWrites]", 1634, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_retainAutorelease(v5);
      v8 = v6;
      *(_DWORD *)buf = 136446210;
      v21 = objc_msgSend(v7, "UTF8String");
      _os_log_impl(&dword_1DE311000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    objc_msgSend((id)objc_opt_class(), "characteristicsUUIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __40__AXHearingAidDevice__sendDelayedWrites__block_invoke;
    v19[3] = &unk_1EA8E8708;
    v19[4] = self;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v19);

    if (-[AXHearingAidDevice keepInSync](self, "keepInSync")
      && (self->leftWriteRequestProperties || self->rightWriteRequestProperties))
    {
      -[AXDispatchTimer cancel](self->_propertyWriteTimer, "cancel");
      objc_initWeak((id *)buf, self);
      propertyWriteTimer = self->_propertyWriteTimer;
      v17[0] = v10;
      v17[1] = 3221225472;
      v17[2] = __40__AXHearingAidDevice__sendDelayedWrites__block_invoke_2;
      v17[3] = &unk_1EA8E81D0;
      objc_copyWeak(&v18, (id *)buf);
      -[AXDispatchTimer afterDelay:processBlock:](propertyWriteTimer, "afterDelay:processBlock:", v17, 0.1);
      objc_destroyWeak(&v18);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Not paired"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice _sendDelayedWrites]", 1652, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_retainAutorelease(v13);
      v16 = v14;
      *(_DWORD *)buf = 136446210;
      v21 = objc_msgSend(v15, "UTF8String");
      _os_log_impl(&dword_1DE311000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
  }
}

uint64_t __40__AXHearingAidDevice__sendDelayedWrites__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeValueForProperty:", objc_msgSend(a2, "unsignedLongLongValue"));
}

void __40__AXHearingAidDevice__sendDelayedWrites__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_sendDelayedWrites");

}

- (void)delayWriteProperty:(unint64_t)a3 forPeripheral:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__AXHearingAidDevice_delayWriteProperty_forPeripheral___block_invoke;
  v9[3] = &unk_1EA8E8DC0;
  v9[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  objc_msgSend(v7, "checkPeripheralPaired:withCompletion:", v8, v9);

}

void __55__AXHearingAidDevice_delayWriteProperty_forPeripheral___block_invoke(uint64_t a1, char a2)
{
  os_log_t *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  void *v13;
  void *v14;
  os_log_t v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  os_log_t v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = (os_log_t *)MEMORY[0x1E0D2F928];
  if ((a2 & 1) != 0 || (objc_msgSend(*(id *)(a1 + 32), "isFakeDevice") & 1) != 0)
  {
    v4 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "leftPeripheral");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqual:", v5) && objc_msgSend(*(id *)(a1 + 32), "leftAvailable"))
    {
      v6 = *(_QWORD *)(a1 + 48) & *(_QWORD *)(*(_QWORD *)(a1 + 32) + 456);

      if (!v6)
      {
        v7 = 0;
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 456) |= *(_QWORD *)(a1 + 48);
LABEL_9:
        v8 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 32), "rightPeripheral");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isEqual:", v9)
          && objc_msgSend(*(id *)(a1 + 32), "rightAvailable"))
        {
          v10 = *(_QWORD *)(a1 + 48) & *(_QWORD *)(*(_QWORD *)(a1 + 32) + 464);

          if (!v10)
          {
            *(_QWORD *)(*(_QWORD *)(a1 + 32) + 464) |= *(_QWORD *)(a1 + 48);
            v11 = *(_QWORD *)(a1 + 32);
            goto LABEL_17;
          }
        }
        else
        {

        }
        v11 = *(_QWORD *)(a1 + 32);
        if (v7)
        {
          if (*(_QWORD *)(v11 + 456))
          {
            v12 = 0;
          }
          else
          {
            v12 = 0;
            if (!*(_QWORD *)(v11 + 464))
              goto LABEL_23;
          }
          goto LABEL_18;
        }
LABEL_17:
        v12 = 1;
LABEL_18:
        if ((objc_msgSend(*(id *)(v11 + 72), "isPending") & 1) == 0)
          objc_msgSend(*(id *)(a1 + 32), "_sendDelayedWrites");
        goto LABEL_23;
      }
    }
    else
    {

    }
    v7 = 1;
    goto LABEL_9;
  }
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Not writing because peripheral isn't paired"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice delayWriteProperty:forPeripheral:]_block_invoke", 1662, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    v16 = objc_retainAutorelease(v14);
    v17 = v15;
    *(_DWORD *)buf = 136446210;
    v25 = objc_msgSend(v16, "UTF8String");
    _os_log_impl(&dword_1DE311000, v17, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  v12 = 0;
LABEL_23:
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%d] %lld - %@"), v12, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice delayWriteProperty:forPeripheral:]_block_invoke", 1683, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    v21 = objc_retainAutorelease(v19);
    v22 = v20;
    v23 = objc_msgSend(v21, "UTF8String");
    *(_DWORD *)buf = 136446210;
    v25 = v23;
    _os_log_impl(&dword_1DE311000, v22, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
}

- (void)writeInt:(unsigned __int8)a3 toEar:(int)a4 forProperty:(unint64_t)a5
{
  unsigned int v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  unint64_t v21;
  void *v22;
  int v23;
  unint64_t v24;
  unint64_t v25;
  unsigned __int8 v26;
  uint8_t buf[4];
  uint64_t v28;
  uint64_t v29;

  v6 = a3;
  v29 = *MEMORY[0x1E0C80C00];
  v26 = a3;
  if (a4 == 2)
    -[AXHearingAidDevice leftPeripheral](self, "leftPeripheral");
  else
    -[AXHearingAidDevice rightPeripheral](self, "rightPeripheral");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[AXHearingAidDevice peripheral:characteristicForProperty:](self, "peripheral:characteristicForProperty:", v8, a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HAInitializeLogging();
    v10 = (void *)MEMORY[0x1E0CB3940];
    hearingPropertyDescription(a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("Writing %d for %@ - %@"), v6, v11, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice writeInt:toEar:forProperty:]", 1694, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_retainAutorelease(v13);
      v16 = v14;
      *(_DWORD *)buf = 136446210;
      v28 = objc_msgSend(v15, "UTF8String");
      _os_log_impl(&dword_1DE311000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v26, 1);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v9 && v17)
    {
      objc_msgSend(v8, "writeValue:forCharacteristic:type:", v17, v9, 0);
      -[AXHearingAidDevice leftPeripheral](self, "leftPeripheral");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v8, "isEqual:", v19);

      if (v20)
      {
        v21 = -[AXHearingAidDevice leftWriteResponseProperties](self, "leftWriteResponseProperties") | a5;
LABEL_13:
        -[AXHearingAidDevice setLeftWriteResponseProperties:](self, "setLeftWriteResponseProperties:", v21);
LABEL_17:

        goto LABEL_18;
      }
      v25 = -[AXHearingAidDevice rightWriteResponseProperties](self, "rightWriteResponseProperties") | a5;
    }
    else
    {
      -[AXHearingAidDevice leftPeripheral](self, "leftPeripheral");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v8, "isEqual:", v22);

      v24 = ~a5;
      if (v23)
      {
        v21 = -[AXHearingAidDevice leftWriteResponseProperties](self, "leftWriteResponseProperties") & v24;
        goto LABEL_13;
      }
      v25 = -[AXHearingAidDevice rightWriteResponseProperties](self, "rightWriteResponseProperties") & v24;
    }
    -[AXHearingAidDevice setRightWriteResponseProperties:](self, "setRightWriteResponseProperties:", v25);
    goto LABEL_17;
  }
LABEL_18:

}

- (void)writeSignedInt:(char)a3 toEar:(int)a4 forProperty:(unint64_t)a5
{
  int v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  unint64_t v21;
  void *v22;
  int v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  uint8_t buf[4];
  uint64_t v28;
  uint64_t v29;

  v6 = a3;
  v29 = *MEMORY[0x1E0C80C00];
  v26 = a3;
  if (a4 == 2)
    -[AXHearingAidDevice leftPeripheral](self, "leftPeripheral");
  else
    -[AXHearingAidDevice rightPeripheral](self, "rightPeripheral");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[AXHearingAidDevice peripheral:characteristicForProperty:](self, "peripheral:characteristicForProperty:", v8, a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HAInitializeLogging();
    v10 = (void *)MEMORY[0x1E0CB3940];
    hearingPropertyDescription(a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("Writing %d for %@ - %@"), v6, v11, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice writeSignedInt:toEar:forProperty:]", 1730, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_retainAutorelease(v13);
      v16 = v14;
      *(_DWORD *)buf = 136446210;
      v28 = objc_msgSend(v15, "UTF8String");
      _os_log_impl(&dword_1DE311000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v26, 1);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v9 && v17)
    {
      objc_msgSend(v8, "writeValue:forCharacteristic:type:", v17, v9, 0);
      -[AXHearingAidDevice leftPeripheral](self, "leftPeripheral");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v8, "isEqual:", v19);

      if (v20)
      {
        v21 = -[AXHearingAidDevice leftWriteResponseProperties](self, "leftWriteResponseProperties") | a5;
LABEL_13:
        -[AXHearingAidDevice setLeftWriteResponseProperties:](self, "setLeftWriteResponseProperties:", v21);
LABEL_17:

        goto LABEL_18;
      }
      v25 = -[AXHearingAidDevice rightWriteResponseProperties](self, "rightWriteResponseProperties") | a5;
    }
    else
    {
      -[AXHearingAidDevice leftPeripheral](self, "leftPeripheral");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v8, "isEqual:", v22);

      v24 = ~a5;
      if (v23)
      {
        v21 = -[AXHearingAidDevice leftWriteResponseProperties](self, "leftWriteResponseProperties") & v24;
        goto LABEL_13;
      }
      v25 = -[AXHearingAidDevice rightWriteResponseProperties](self, "rightWriteResponseProperties") & v24;
    }
    -[AXHearingAidDevice setRightWriteResponseProperties:](self, "setRightWriteResponseProperties:", v25);
    goto LABEL_17;
  }
LABEL_18:

}

- (void)readValueForCharacteristic:(id)a3 fromPeripheral:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  HAInitializeLogging();
  v7 = (void *)MEMORY[0x1E0CB3940];
  if (v5)
  {
    objc_msgSend(v5, "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("Reading %@ from %@"), v8, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice readValueForCharacteristic:fromPeripheral:]", 1766, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_retainAutorelease(v10);
      v13 = v11;
      *(_DWORD *)buf = 136446210;
      v20 = objc_msgSend(v12, "UTF8String");
      _os_log_impl(&dword_1DE311000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    objc_msgSend(v6, "readValueForCharacteristic:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Reading nil characteristic"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice readValueForCharacteristic:fromPeripheral:]", 1771, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_retainAutorelease(v15);
      v18 = v16;
      *(_DWORD *)buf = 136446210;
      v20 = objc_msgSend(v17, "UTF8String");
      _os_log_impl(&dword_1DE311000, v18, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
  }

}

- (void)readProperty:(unint64_t)a3 fromPeripheral:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[AXHearingAidDevice peripheral:characteristicForProperty:](self, "peripheral:characteristicForProperty:", v6, a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[AXHearingAidDevice readValueForCharacteristic:fromPeripheral:](self, "readValueForCharacteristic:fromPeripheral:", v7, v6);

}

- (void)selectProgram:(id)a3 forEar:(int)a4
{
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  _QWORD v10[5];

  v8 = a3;
  if ((a4 & objc_msgSend(v8, "ear") & 2) != 0)
  {
    if (objc_msgSend(v8, "isStreamOrMixingStream"))
      -[AXHearingAidDevice setLeftSelectedStreamingProgram:](self, "setLeftSelectedStreamingProgram:", v8);
    else
      -[AXHearingAidDevice setLeftSelectedProgram:](self, "setLeftSelectedProgram:", v8);
  }
  else
  {
    -[AXHearingAidDevice leftPrograms](self, "leftPrograms");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __43__AXHearingAidDevice_selectProgram_forEar___block_invoke;
    v10[3] = &unk_1EA8E8DE8;
    v10[4] = self;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);

  }
  if ((a4 & objc_msgSend(v8, "ear") & 4) != 0)
  {
    if (objc_msgSend(v8, "isStreamOrMixingStream"))
      -[AXHearingAidDevice setRightSelectedStreamingProgram:](self, "setRightSelectedStreamingProgram:", v8);
    else
      -[AXHearingAidDevice setRightSelectedProgram:](self, "setRightSelectedProgram:", v8);
  }
  else
  {
    -[AXHearingAidDevice rightPrograms](self, "rightPrograms");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __43__AXHearingAidDevice_selectProgram_forEar___block_invoke_2;
    v9[3] = &unk_1EA8E8DE8;
    v9[4] = self;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v9);

  }
}

void __43__AXHearingAidDevice_selectProgram_forEar___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "category") == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "setLeftSelectedProgram:", v6);
    *a4 = 1;
  }

}

void __43__AXHearingAidDevice_selectProgram_forEar___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "category") == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "setRightSelectedProgram:", v6);
    *a4 = 1;
  }

}

- (id)selectedPrograms
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXHearingAidDevice programs](self, "programs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__AXHearingAidDevice_selectedPrograms__block_invoke;
  v8[3] = &unk_1EA8E8DE8;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __38__AXHearingAidDevice_selectedPrograms__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "isSelected"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (id)selectedProgramIndexes
{
  void *v2;
  void *v3;

  -[AXHearingAidDevice programs](self, "programs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "indexesOfObjectsPassingTest:", &__block_literal_global_246);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __44__AXHearingAidDevice_selectedProgramIndexes__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSelected");
}

- (char)signedValueForProperty:(unint64_t)a3 andPeripheral:(id)a4
{
  id v6;
  void *v7;
  int v8;
  BOOL v9;
  uint64_t v10;
  int v11;

  v6 = a4;
  -[AXHearingAidDevice leftPeripheral](self, "leftPeripheral");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (a3 == 0x1000000000)
  {
    v9 = v8 == 0;
    v10 = 58;
  }
  else
  {
    if (a3 != 0x2000000000)
    {
      LOBYTE(v11) = 0;
      return v11;
    }
    v9 = v8 == 0;
    v10 = 56;
  }
  if (v9)
    ++v10;
  v11 = *((char *)&self->super.isa + v10);
  if (v11 <= -127)
    LOBYTE(v11) = -127;
  return v11;
}

- (unsigned)volumeValueForProperty:(unint64_t)a3 andPeripheral:(id)a4
{
  id v6;
  void *v7;
  int v8;
  int v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;

  v6 = a4;
  -[AXHearingAidDevice leftPeripheral](self, "leftPeripheral");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  LOBYTE(v9) = 0;
  if ((uint64_t)a3 > 0x7FFFFFFF)
  {
    if (a3 == 0x80000000)
    {
      v10 = v8 == 0;
      v11 = 384;
      v12 = 376;
    }
    else
    {
      if (a3 != 0x4000000000)
        return v9;
      v10 = v8 == 0;
      v11 = 400;
      v12 = 392;
    }
  }
  else if (a3 == 64)
  {
    v10 = v8 == 0;
    v11 = 32;
    v12 = 24;
  }
  else
  {
    if (a3 != 128)
      return v9;
    v10 = v8 == 0;
    v11 = 48;
    v12 = 40;
  }
  if (!v10)
    v11 = v12;
  return (int)(*(double *)((char *)&self->super.isa + v11) * 255.0);
}

- (void)setLeftMicrophoneVolume:(double)a3
{
  double v4;
  double v5;
  id v6;

  if (self->_leftMicrophoneVolume != -1.0)
  {
    v4 = 0.0;
    if (a3 >= 0.0)
      v4 = a3;
    if (a3 <= 1.0)
      v5 = v4;
    else
      v5 = 1.0;
    self->_leftMicrophoneVolume = v5;
  }
  -[AXHearingAidDevice leftPeripheral](self, "leftPeripheral");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[AXHearingAidDevice delayWriteProperty:forPeripheral:](self, "delayWriteProperty:forPeripheral:", 64, v6);

}

- (void)setRightMicrophoneVolume:(double)a3
{
  double v4;
  double v5;
  id v6;

  if (self->_rightMicrophoneVolume != -1.0)
  {
    v4 = 0.0;
    if (a3 >= 0.0)
      v4 = a3;
    if (a3 <= 1.0)
      v5 = v4;
    else
      v5 = 1.0;
    self->_rightMicrophoneVolume = v5;
  }
  -[AXHearingAidDevice rightPeripheral](self, "rightPeripheral");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[AXHearingAidDevice delayWriteProperty:forPeripheral:](self, "delayWriteProperty:forPeripheral:", 64, v6);

}

- (void)setLeftStreamVolume:(double)a3
{
  double v4;
  double v5;
  id v6;

  if (self->_leftStreamVolume != -1.0)
  {
    v4 = 0.0;
    if (a3 >= 0.0)
      v4 = a3;
    if (a3 <= 1.0)
      v5 = v4;
    else
      v5 = 1.0;
    self->_leftStreamVolume = v5;
  }
  -[AXHearingAidDevice leftPeripheral](self, "leftPeripheral");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[AXHearingAidDevice delayWriteProperty:forPeripheral:](self, "delayWriteProperty:forPeripheral:", 128, v6);

}

- (void)setRightStreamVolume:(double)a3
{
  double v4;
  double v5;
  id v6;

  if (self->_rightStreamVolume != -1.0)
  {
    v4 = 0.0;
    if (a3 >= 0.0)
      v4 = a3;
    if (a3 <= 1.0)
      v5 = v4;
    else
      v5 = 1.0;
    self->_rightStreamVolume = v5;
  }
  -[AXHearingAidDevice rightPeripheral](self, "rightPeripheral");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[AXHearingAidDevice delayWriteProperty:forPeripheral:](self, "delayWriteProperty:forPeripheral:", 128, v6);

}

- (void)setLeftSensitivity:(double)a3
{
  double v4;
  double v5;
  id v6;

  if (self->_leftSensitivity != -1.0)
  {
    v4 = 0.0;
    if (a3 >= 0.0)
      v4 = a3;
    if (a3 <= 1.0)
      v5 = v4;
    else
      v5 = 1.0;
    self->_leftSensitivity = v5;
  }
  -[AXHearingAidDevice leftPeripheral](self, "leftPeripheral");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[AXHearingAidDevice delayWriteProperty:forPeripheral:](self, "delayWriteProperty:forPeripheral:", 0x80000000, v6);

}

- (void)setRightSensitivity:(double)a3
{
  double v4;
  double v5;
  id v6;

  if (self->_rightSensitivity != -1.0)
  {
    v4 = 0.0;
    if (a3 >= 0.0)
      v4 = a3;
    if (a3 <= 1.0)
      v5 = v4;
    else
      v5 = 1.0;
    self->_rightSensitivity = v5;
  }
  -[AXHearingAidDevice rightPeripheral](self, "rightPeripheral");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[AXHearingAidDevice delayWriteProperty:forPeripheral:](self, "delayWriteProperty:forPeripheral:", 0x80000000, v6);

}

- (void)setTreble:(char)a3 forLeft:(BOOL)a4
{
  id v5;

  if (a4)
  {
    self->_leftTreble = a3;
    -[AXHearingAidDevice leftPeripheral](self, "leftPeripheral");
  }
  else
  {
    self->_rightTreble = a3;
    -[AXHearingAidDevice rightPeripheral](self, "rightPeripheral");
  }
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AXHearingAidDevice delayWriteProperty:forPeripheral:](self, "delayWriteProperty:forPeripheral:", 0x2000000000, v5);

}

- (void)setBass:(char)a3 forLeft:(BOOL)a4
{
  id v5;

  if (a4)
  {
    self->_leftBass = a3;
    -[AXHearingAidDevice leftPeripheral](self, "leftPeripheral");
  }
  else
  {
    self->_rightBass = a3;
    -[AXHearingAidDevice rightPeripheral](self, "rightPeripheral");
  }
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AXHearingAidDevice delayWriteProperty:forPeripheral:](self, "delayWriteProperty:forPeripheral:", 0x1000000000, v5);

}

- (void)setMixedVolume:(double)a3 forLeft:(BOOL)a4
{
  double v5;
  double v6;
  id v7;

  v5 = 0.0;
  if (a3 >= 0.0)
    v5 = a3;
  if (a3 <= 1.0)
    v6 = v5;
  else
    v6 = 1.0;
  if (a4)
  {
    self->_leftMixedVolume = v6;
    -[AXHearingAidDevice leftPeripheral](self, "leftPeripheral");
  }
  else
  {
    self->_rightMixedVolume = v6;
    -[AXHearingAidDevice rightPeripheral](self, "rightPeripheral");
  }
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[AXHearingAidDevice delayWriteProperty:forPeripheral:](self, "delayWriteProperty:forPeripheral:", 0x4000000000, v7);

}

- (void)setValue:(id)a3 forProperty:(unint64_t)a4
{
  id v6;
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
  int v21;
  void *v22;
  uint64_t v23;
  void *v24;
  int v25;
  void *v26;
  _QWORD *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  uint64_t v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  AXHearingAidMode *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t j;
  AXHearingAidMode *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  id v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  _QWORD v62[5];
  int v63;
  _QWORD v64[5];
  int v65;
  _QWORD v66[5];
  int v67;
  _QWORD v68[5];
  int v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint8_t buf[4];
  uint64_t v79;
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((uint64_t)a4 < 0x800000)
  {
    if ((uint64_t)a4 <= 1023)
    {
      if ((uint64_t)a4 > 127)
      {
        switch(a4)
        {
          case 0x80uLL:
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "count") == 2)
            {
              objc_msgSend(v6, "firstObject");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "doubleValue");
              -[AXHearingAidDevice setLeftStreamVolume:](self, "setLeftStreamVolume:");

              objc_msgSend(v6, "lastObject");
              v8 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "doubleValue");
              -[AXHearingAidDevice setRightStreamVolume:](self, "setRightStreamVolume:");
              goto LABEL_120;
            }
            goto LABEL_125;
          case 0x100uLL:
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "count") == 2)
            {
              objc_msgSend(v6, "firstObject");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "lastObject");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v60 = v37;
                objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                v74 = 0u;
                v75 = 0u;
                v76 = 0u;
                v77 = 0u;
                v61 = v36;
                v39 = v36;
                v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v74, v81, 16);
                if (v40)
                {
                  v41 = v40;
                  v42 = *(_QWORD *)v75;
                  do
                  {
                    for (i = 0; i != v41; ++i)
                    {
                      if (*(_QWORD *)v75 != v42)
                        objc_enumerationMutation(v39);
                      v44 = -[AXHearingAidMode initWithRepresentation:]([AXHearingAidMode alloc], "initWithRepresentation:", *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * i));
                      if (v44)
                        objc_msgSend(v38, "addObject:", v44);

                    }
                    v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v74, v81, 16);
                  }
                  while (v41);
                }

                -[AXHearingAidDevice setLeftPrograms:](self, "setLeftPrograms:", v38);
                v37 = v60;
                v36 = v61;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v45 = v37;
                objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                v70 = 0u;
                v71 = 0u;
                v72 = 0u;
                v73 = 0u;
                v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
                if (v47)
                {
                  v48 = v47;
                  v49 = *(_QWORD *)v71;
                  do
                  {
                    for (j = 0; j != v48; ++j)
                    {
                      if (*(_QWORD *)v71 != v49)
                        objc_enumerationMutation(v46);
                      v51 = -[AXHearingAidMode initWithRepresentation:]([AXHearingAidMode alloc], "initWithRepresentation:", *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * j));
                      if (v51)
                        objc_msgSend(v46, "addObject:", v51);

                    }
                    v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
                  }
                  while (v48);
                }
                -[AXHearingAidDevice setRightPrograms:](self, "setRightPrograms:", v46);

                v37 = v45;
              }

            }
            goto LABEL_125;
          case 0x200uLL:
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v6, "objectForKey:", &unk_1EA8FFA40);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              -[AXHearingAidDevice setValue:forProperty:](self, "setValue:forProperty:", v14, 0x80000);

              objc_msgSend(v6, "objectForKey:", &unk_1EA8FFA58);
              v8 = (void *)objc_claimAutoreleasedReturnValue();
              -[AXHearingAidDevice setValue:forProperty:](self, "setValue:forProperty:", v8, 0x100000);
              goto LABEL_120;
            }
            goto LABEL_125;
        }
        goto LABEL_121;
      }
      if (a4 == 4)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "count") == 2)
        {
          objc_msgSend(v6, "firstObject");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "doubleValue");
          -[AXHearingAidDevice setLeftBatteryLevel:](self, "setLeftBatteryLevel:");

          objc_msgSend(v6, "lastObject");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "doubleValue");
          -[AXHearingAidDevice setRightBatteryLevel:](self, "setRightBatteryLevel:");
          goto LABEL_120;
        }
        goto LABEL_125;
      }
      if (a4 != 8)
      {
        if (a4 == 64)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "count") == 2)
          {
            objc_msgSend(v6, "firstObject");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "doubleValue");
            -[AXHearingAidDevice setLeftMicrophoneVolume:](self, "setLeftMicrophoneVolume:");

            objc_msgSend(v6, "lastObject");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "doubleValue");
            -[AXHearingAidDevice setRightMicrophoneVolume:](self, "setRightMicrophoneVolume:");
LABEL_120:

            goto LABEL_125;
          }
          goto LABEL_125;
        }
LABEL_121:
        HAInitializeLogging();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown property: %ld"), a4);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice setValue:forProperty:]", 2361, v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)*MEMORY[0x1E0D2F928];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
        {
LABEL_122:
          v57 = objc_retainAutorelease(v10);
          v58 = v11;
          *(_DWORD *)buf = 136446210;
          v79 = objc_msgSend(v57, "UTF8String");
          _os_log_impl(&dword_1DE311000, v58, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

        }
LABEL_123:

        goto LABEL_124;
      }
LABEL_15:
      HAInitializeLogging();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Attempting to set readonly property: %ld"), a4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice setValue:forProperty:]", 2357, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)*MEMORY[0x1E0D2F928];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
        goto LABEL_122;
      goto LABEL_123;
    }
    if ((uint64_t)a4 >= 0x100000)
    {
      if (a4 != 0x100000)
      {
        if (a4 == 0x200000)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v54 = objc_msgSend(v6, "integerValue");
            if (v54)
            {
              if (v54 == 2)
                -[AXHearingAidDevice connect](self, "connect");
            }
            else
            {
              -[AXHearingAidDevice disconnectAndUnpair:](self, "disconnectAndUnpair:", 0);
            }
          }
          goto LABEL_125;
        }
        if (a4 == 0x400000)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "count") == 2)
          {
            objc_msgSend(v6, "firstObject");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[AXHearingAidDevice setLeftFirmwareVersion:](self, "setLeftFirmwareVersion:", v16);

            objc_msgSend(v6, "lastObject");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            -[AXHearingAidDevice setRightFirmwareVersion:](self, "setRightFirmwareVersion:", v8);
            goto LABEL_120;
          }
          goto LABEL_125;
        }
        goto LABEL_121;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "count") == 2)
      {
        -[AXHearingAidDevice model](self, "model");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_109;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_125;
      -[AXHearingAidDevice model](self, "model");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_130:
      v9 = v59;
      objc_msgSend(v59, "replaceObjectAtIndex:withObject:", 0, v6);
      goto LABEL_124;
    }
    if (a4 != 1024)
    {
      if (a4 == 0x40000)
      {
        -[AXHearingAidDevice setName:](self, "setName:", v6);
        goto LABEL_125;
      }
      if (a4 != 0x80000)
        goto LABEL_121;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "count") == 2)
      {
        -[AXHearingAidDevice manufacturer](self, "manufacturer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_109:
        v9 = v12;
        objc_msgSend(v12, "setArray:", v6);
LABEL_124:

        goto LABEL_125;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_125;
      -[AXHearingAidDevice manufacturer](self, "manufacturer");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_130;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v6, "count") != 2)
      goto LABEL_125;
    objc_msgSend(v6, "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "intValue");

    -[AXHearingAidDevice leftPrograms](self, "leftPrograms");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = MEMORY[0x1E0C809B0];
    v68[0] = MEMORY[0x1E0C809B0];
    v68[1] = 3221225472;
    v68[2] = __43__AXHearingAidDevice_setValue_forProperty___block_invoke;
    v68[3] = &unk_1EA8E8E50;
    v69 = v21;
    v68[4] = self;
    objc_msgSend(v22, "enumerateObjectsUsingBlock:", v68);

    objc_msgSend(v6, "lastObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "intValue");

    -[AXHearingAidDevice rightPrograms](self, "rightPrograms");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v26;
    v66[0] = v23;
    v66[1] = 3221225472;
    v66[2] = __43__AXHearingAidDevice_setValue_forProperty___block_invoke_2;
    v66[3] = &unk_1EA8E8E50;
    v67 = v25;
    v66[4] = self;
    v27 = v66;
LABEL_71:
    objc_msgSend(v26, "enumerateObjectsUsingBlock:", v27);
    goto LABEL_120;
  }
  if ((uint64_t)a4 <= 0x3FFFFFFFFLL)
  {
    if ((uint64_t)a4 > 0x7FFFFFFF)
    {
      switch(a4)
      {
        case 0x80000000uLL:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "count") == 2)
          {
            objc_msgSend(v6, "firstObject");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "doubleValue");
            -[AXHearingAidDevice setLeftSensitivity:](self, "setLeftSensitivity:");

            objc_msgSend(v6, "lastObject");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "doubleValue");
            -[AXHearingAidDevice setRightSensitivity:](self, "setRightSensitivity:");
            goto LABEL_120;
          }
          goto LABEL_125;
        case 0x100000000uLL:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "count") == 2)
          {
            objc_msgSend(v6, "firstObject");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            -[AXHearingAidDevice setLeftMicrophoneVolumeSteps:](self, "setLeftMicrophoneVolumeSteps:", objc_msgSend(v53, "shortValue"));

            objc_msgSend(v6, "lastObject");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            -[AXHearingAidDevice setRightMicrophoneVolumeSteps:](self, "setRightMicrophoneVolumeSteps:", objc_msgSend(v8, "shortValue"));
            goto LABEL_120;
          }
          goto LABEL_125;
        case 0x200000000uLL:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "count") == 2)
          {
            objc_msgSend(v6, "firstObject");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[AXHearingAidDevice setLeftStreamVolumeSteps:](self, "setLeftStreamVolumeSteps:", objc_msgSend(v15, "shortValue"));

            objc_msgSend(v6, "lastObject");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            -[AXHearingAidDevice setRightStreamVolumeSteps:](self, "setRightStreamVolumeSteps:", objc_msgSend(v8, "shortValue"));
            goto LABEL_120;
          }
          goto LABEL_125;
      }
      goto LABEL_121;
    }
    if (a4 == 0x800000)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "count") == 2)
      {
        objc_msgSend(v6, "firstObject");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXHearingAidDevice setLeftHardwareVersion:](self, "setLeftHardwareVersion:", v19);

        objc_msgSend(v6, "lastObject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXHearingAidDevice setRightHardwareVersion:](self, "setRightHardwareVersion:", v8);
        goto LABEL_120;
      }
      goto LABEL_125;
    }
    if (a4 != 0x1000000 && a4 != 0x20000000)
      goto LABEL_121;
    goto LABEL_15;
  }
  if ((uint64_t)a4 > 0x1FFFFFFFFFLL)
  {
    switch(a4)
    {
      case 0x2000000000uLL:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "count") == 2)
        {
          objc_msgSend(v6, "firstObject");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          -[AXHearingAidDevice setTreble:forLeft:](self, "setTreble:forLeft:", objc_msgSend(v55, "charValue"), 1);

          objc_msgSend(v6, "lastObject");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[AXHearingAidDevice setTreble:forLeft:](self, "setTreble:forLeft:", objc_msgSend(v8, "charValue"), 0);
          goto LABEL_120;
        }
        goto LABEL_125;
      case 0x4000000000uLL:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "count") == 2)
        {
          objc_msgSend(v6, "firstObject");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "doubleValue");
          -[AXHearingAidDevice setMixedVolume:forLeft:](self, "setMixedVolume:forLeft:", 1);

          objc_msgSend(v6, "lastObject");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "doubleValue");
          -[AXHearingAidDevice setMixedVolume:forLeft:](self, "setMixedVolume:forLeft:", 0);
          goto LABEL_120;
        }
        goto LABEL_125;
      case 0x8000000000uLL:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "count") == 2)
        {
          objc_msgSend(v6, "firstObject");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[AXHearingAidDevice setLeftMixedVolumeSteps:](self, "setLeftMixedVolumeSteps:", objc_msgSend(v17, "shortValue"));

          objc_msgSend(v6, "lastObject");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[AXHearingAidDevice setRightMixedVolumeSteps:](self, "setRightMixedVolumeSteps:", objc_msgSend(v8, "shortValue"));
          goto LABEL_120;
        }
        goto LABEL_125;
    }
    goto LABEL_121;
  }
  if (a4 == 0x400000000)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "count") == 2)
    {
      objc_msgSend(v6, "firstObject");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXHearingAidDevice setLeftSensitivitySteps:](self, "setLeftSensitivitySteps:", objc_msgSend(v28, "shortValue"));

      objc_msgSend(v6, "lastObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXHearingAidDevice setRightSensitivitySteps:](self, "setRightSensitivitySteps:", objc_msgSend(v8, "shortValue"));
      goto LABEL_120;
    }
    goto LABEL_125;
  }
  if (a4 == 0x800000000)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || objc_msgSend(v6, "count") != 2
      || !-[AXHearingAidDevice deviceSupportsProperty:](self, "deviceSupportsProperty:", 0x800000000))
    {
      goto LABEL_125;
    }
    objc_msgSend(v6, "firstObject");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "intValue");

    -[AXHearingAidDevice leftPrograms](self, "leftPrograms");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = MEMORY[0x1E0C809B0];
    v64[0] = MEMORY[0x1E0C809B0];
    v64[1] = 3221225472;
    v64[2] = __43__AXHearingAidDevice_setValue_forProperty___block_invoke_3;
    v64[3] = &unk_1EA8E8E50;
    v65 = v30;
    v64[4] = self;
    objc_msgSend(v31, "enumerateObjectsUsingBlock:", v64);

    objc_msgSend(v6, "lastObject");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "intValue");

    -[AXHearingAidDevice rightPrograms](self, "rightPrograms");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v26;
    v62[0] = v32;
    v62[1] = 3221225472;
    v62[2] = __43__AXHearingAidDevice_setValue_forProperty___block_invoke_4;
    v62[3] = &unk_1EA8E8E50;
    v63 = v34;
    v62[4] = self;
    v27 = v62;
    goto LABEL_71;
  }
  if (a4 != 0x1000000000)
    goto LABEL_121;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "count") == 2)
  {
    objc_msgSend(v6, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXHearingAidDevice setBass:forLeft:](self, "setBass:forLeft:", objc_msgSend(v13, "charValue"), 1);

    objc_msgSend(v6, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXHearingAidDevice setBass:forLeft:](self, "setBass:forLeft:", objc_msgSend(v8, "charValue"), 0);
    goto LABEL_120;
  }
LABEL_125:

}

void __43__AXHearingAidDevice_setValue_forProperty___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2;
  v4 = *(_DWORD *)(a1 + 40);
  v9 = v3;
  if (v4 == objc_msgSend(v3, "index"))
  {
    objc_msgSend(v9, "setIsSelected:", 1);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "leftSelectedStreamingProgram");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setIsSelected:", objc_msgSend(v5, "index") == objc_msgSend(v9, "index"));

  }
  v6 = *(_DWORD *)(a1 + 40);
  if (v6 == objc_msgSend(v9, "index"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setLeftSelectedProgram:", v9);
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v7, "leftPeripheral");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "delayWriteProperty:forPeripheral:", 1024, v8);

  }
}

void __43__AXHearingAidDevice_setValue_forProperty___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2;
  v4 = *(_DWORD *)(a1 + 40);
  v9 = v3;
  if (v4 == objc_msgSend(v3, "index"))
  {
    objc_msgSend(v9, "setIsSelected:", 1);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "rightSelectedStreamingProgram");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setIsSelected:", objc_msgSend(v5, "index") == objc_msgSend(v9, "index"));

  }
  v6 = *(_DWORD *)(a1 + 40);
  if (v6 == objc_msgSend(v9, "index"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setRightSelectedProgram:", v9);
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v7, "rightPeripheral");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "delayWriteProperty:forPeripheral:", 1024, v8);

  }
}

void __43__AXHearingAidDevice_setValue_forProperty___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2;
  v4 = *(_DWORD *)(a1 + 40);
  v9 = v3;
  if (v4 == objc_msgSend(v3, "index"))
  {
    objc_msgSend(v9, "setIsSelected:", 1);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "leftSelectedProgram");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setIsSelected:", objc_msgSend(v5, "index") == objc_msgSend(v9, "index"));

  }
  v6 = *(_DWORD *)(a1 + 40);
  if (v6 == objc_msgSend(v9, "index"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setLeftSelectedStreamingProgram:", v9);
    if (objc_msgSend(*(id *)(a1 + 32), "deviceSupportsProperty:", 0x800000000))
    {
      v7 = *(void **)(a1 + 32);
      objc_msgSend(v7, "leftPeripheral");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "delayWriteProperty:forPeripheral:", 0x800000000, v8);

    }
  }

}

void __43__AXHearingAidDevice_setValue_forProperty___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2;
  v4 = *(_DWORD *)(a1 + 40);
  v9 = v3;
  if (v4 == objc_msgSend(v3, "index"))
  {
    objc_msgSend(v9, "setIsSelected:", 1);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "rightSelectedProgram");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setIsSelected:", objc_msgSend(v5, "index") == objc_msgSend(v9, "index"));

  }
  v6 = *(_DWORD *)(a1 + 40);
  if (v6 == objc_msgSend(v9, "index"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setRightSelectedStreamingProgram:", v9);
    if (objc_msgSend(*(id *)(a1 + 32), "deviceSupportsProperty:", 0x800000000))
    {
      v7 = *(void **)(a1 + 32);
      objc_msgSend(v7, "rightPeripheral");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "delayWriteProperty:forPeripheral:", 0x800000000, v8);

    }
  }

}

- (id)valueForProperty:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
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
  id v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  _BOOL8 v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  _BOOL4 leftPeripheralPaired;
  _BOOL4 rightPeripheralPaired;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  NSObject *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  NSObject *v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  id v100;
  NSObject *v101;
  uint64_t v102;
  _QWORD v103[4];
  id v104;
  _QWORD v105[4];
  id v106;
  uint8_t buf[4];
  uint64_t v108;
  _QWORD v109[4];
  _QWORD v110[2];
  _QWORD v111[2];
  _QWORD v112[2];
  _QWORD v113[4];
  _QWORD v114[2];
  _QWORD v115[4];

  v115[2] = *MEMORY[0x1E0C80C00];
  if ((uint64_t)a3 >= 0x800000)
  {
    if ((uint64_t)a3 > 0x3FFFFFFFFLL)
    {
      if ((uint64_t)a3 > 0x7FFFFFFFFFLL)
      {
        if ((uint64_t)a3 <= 0x3FFFFFFFFFFLL)
        {
          if (a3 != 0x8000000000)
          {
            if (a3 != 0x10000000000)
            {
              if (a3 == 0x20000000000)
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[AXHearingAidDevice deviceType](self, "deviceType"));
                v6 = objc_claimAutoreleasedReturnValue();
                goto LABEL_134;
              }
              goto LABEL_113;
            }
            v45 = (void *)MEMORY[0x1E0CB37E8];
            v46 = -[AXHearingAidDevice availableInputEars](self, "availableInputEars");
            goto LABEL_98;
          }
          v18 = (void *)MEMORY[0x1E0C99D20];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", -[AXHearingAidDevice leftMixedVolumeSteps](self, "leftMixedVolumeSteps"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (void *)MEMORY[0x1E0CB37E8];
          v26 = -[AXHearingAidDevice rightMixedVolumeSteps](self, "rightMixedVolumeSteps");
          goto LABEL_105;
        }
        if (a3 == 0x40000000000)
        {
          v45 = (void *)MEMORY[0x1E0CB37E8];
          v46 = -[AXHearingAidDevice earsSupportingWatch](self, "earsSupportingWatch");
          goto LABEL_98;
        }
        if (a3 != 0x80000000000)
        {
          if (a3 == 0x100000000000)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v7 = (id)objc_claimAutoreleasedReturnValue();
            -[AXHearingAidDevice leftPeripheralUUID](self, "leftPeripheralUUID");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            if (v29)
            {
              -[AXHearingAidDevice leftPeripheralUUID](self, "leftPeripheralUUID");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "addObject:", v30);

            }
            else
            {
              objc_msgSend(v7, "addObject:", &stru_1EA8EC4E0);
            }

            -[AXHearingAidDevice rightPeripheralUUID](self, "rightPeripheralUUID");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            if (v87)
            {
              -[AXHearingAidDevice rightPeripheralUUID](self, "rightPeripheralUUID");
              v88 = objc_claimAutoreleasedReturnValue();
              goto LABEL_154;
            }
            goto LABEL_155;
          }
          goto LABEL_113;
        }
        v109[0] = &unk_1EA8FFA88;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AXHearingAidDevice requiresCombinedPresets](self, "requiresCombinedPresets"));
        v7 = (id)objc_claimAutoreleasedReturnValue();
        v109[1] = v7;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AXHearingAidDevice requiresCombinedVolumes](self, "requiresCombinedVolumes"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v109[2] = v15;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AXHearingAidDevice requiresBinauralStreaming](self, "requiresBinauralStreaming"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v109[3] = v42;
        v43 = (void *)MEMORY[0x1E0C99D20];
        v44 = v109;
LABEL_100:
        objc_msgSend(v43, "arrayWithObjects:count:", v44, 4);
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

        goto LABEL_101;
      }
      if ((uint64_t)a3 > 0xFFFFFFFFFLL)
      {
        if (a3 == 0x1000000000)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", self->_leftBass);
          v7 = (id)objc_claimAutoreleasedReturnValue();
          v110[0] = v7;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", self->_rightBass);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v110[1] = v15;
          v16 = (void *)MEMORY[0x1E0C99D20];
          v17 = v110;
          goto LABEL_88;
        }
        if (a3 == 0x2000000000)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", self->_leftTreble);
          v7 = (id)objc_claimAutoreleasedReturnValue();
          v111[0] = v7;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", self->_rightTreble);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v111[1] = v15;
          v16 = (void *)MEMORY[0x1E0C99D20];
          v17 = v111;
          goto LABEL_88;
        }
        if (a3 != 0x4000000000)
          goto LABEL_113;
        v18 = (void *)MEMORY[0x1E0C99D20];
        v19 = (void *)MEMORY[0x1E0CB37E8];
        -[AXHearingAidDevice leftMixedVolume](self, "leftMixedVolume");
        objc_msgSend(v19, "numberWithDouble:");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)MEMORY[0x1E0CB37E8];
        -[AXHearingAidDevice rightMixedVolume](self, "rightMixedVolume");
        goto LABEL_107;
      }
      if (a3 != 0x400000000)
      {
        if (a3 != 0x800000000)
          goto LABEL_113;
        -[AXHearingAidDevice leftSelectedStreamingProgram](self, "leftSelectedStreamingProgram");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (v39)
        {
          -[AXHearingAidDevice leftSelectedStreamingProgram](self, "leftSelectedStreamingProgram");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v40, "index");

        }
        else
        {
          v24 = 0xFFFFFFFFLL;
        }

        -[AXHearingAidDevice rightSelectedStreamingProgram](self, "rightSelectedStreamingProgram");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        if (v89)
        {
          -[AXHearingAidDevice rightSelectedStreamingProgram](self, "rightSelectedStreamingProgram");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_147;
        }
LABEL_148:
        v92 = 0xFFFFFFFFLL;
        goto LABEL_149;
      }
      v18 = (void *)MEMORY[0x1E0C99D20];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", -[AXHearingAidDevice leftSensitivitySteps](self, "leftSensitivitySteps"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)MEMORY[0x1E0CB37E8];
      v26 = -[AXHearingAidDevice rightSensitivitySteps](self, "rightSensitivitySteps");
LABEL_105:
      objc_msgSend(v25, "numberWithShort:", v26);
      v67 = objc_claimAutoreleasedReturnValue();
LABEL_108:
      v69 = (void *)v67;
      objc_msgSend(v18, "arrayWithObjects:", v20, v67, 0);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

      return v10;
    }
    if ((uint64_t)a3 > 0x1FFFFFFF)
    {
      if ((uint64_t)a3 > 0x7FFFFFFF)
      {
        switch(a3)
        {
          case 0x80000000uLL:
            v18 = (void *)MEMORY[0x1E0C99D20];
            v57 = (void *)MEMORY[0x1E0CB37E8];
            -[AXHearingAidDevice leftSensitivity](self, "leftSensitivity");
            objc_msgSend(v57, "numberWithDouble:");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = (void *)MEMORY[0x1E0CB37E8];
            -[AXHearingAidDevice rightSensitivity](self, "rightSensitivity");
            goto LABEL_107;
          case 0x100000000uLL:
            v18 = (void *)MEMORY[0x1E0C99D20];
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", -[AXHearingAidDevice leftMicrophoneVolumeSteps](self, "leftMicrophoneVolumeSteps"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = (void *)MEMORY[0x1E0CB37E8];
            v26 = -[AXHearingAidDevice rightMicrophoneVolumeSteps](self, "rightMicrophoneVolumeSteps");
            break;
          case 0x200000000uLL:
            v18 = (void *)MEMORY[0x1E0C99D20];
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", -[AXHearingAidDevice leftStreamVolumeSteps](self, "leftStreamVolumeSteps"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = (void *)MEMORY[0x1E0CB37E8];
            v26 = -[AXHearingAidDevice rightStreamVolumeSteps](self, "rightStreamVolumeSteps");
            break;
          default:
            goto LABEL_113;
        }
        goto LABEL_105;
      }
      if (a3 != 0x20000000)
      {
        if (a3 != 0x40000000)
          goto LABEL_113;
        v113[0] = &unk_1EA8FFA88;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AXHearingAidDevice supportsCombinedPresets](self, "supportsCombinedPresets"));
        v7 = (id)objc_claimAutoreleasedReturnValue();
        v113[1] = v7;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AXHearingAidDevice supportsCombinedVolumes](self, "supportsCombinedVolumes"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v113[2] = v15;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AXHearingAidDevice supportsBinauralStreaming](self, "supportsBinauralStreaming"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v113[3] = v42;
        v43 = (void *)MEMORY[0x1E0C99D20];
        v44 = v113;
        goto LABEL_100;
      }
      if ((-[AXHearingAidDevice leftAvailable](self, "leftAvailable")
         || -[AXHearingAidDevice rightAvailable](self, "rightAvailable"))
        && (leftPeripheralPaired = self->_leftPeripheralPaired,
            leftPeripheralPaired == -[AXHearingAidDevice leftAvailable](self, "leftAvailable")))
      {
        rightPeripheralPaired = self->_rightPeripheralPaired;
        v48 = rightPeripheralPaired == -[AXHearingAidDevice rightAvailable](self, "rightAvailable");
      }
      else
      {
        v48 = 0;
      }
      v49 = (void *)MEMORY[0x1E0CB37E8];
    }
    else
    {
      if ((uint64_t)a3 <= 0x1FFFFFF)
      {
        if (a3 == 0x800000)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v7 = (id)objc_claimAutoreleasedReturnValue();
          -[AXHearingAidDevice leftHardwareVersion](self, "leftHardwareVersion");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          if (v65)
          {
            -[AXHearingAidDevice leftHardwareVersion](self, "leftHardwareVersion");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v66);

          }
          else
          {
            objc_msgSend(v7, "addObject:", &stru_1EA8EC4E0);
          }

          -[AXHearingAidDevice rightHardwareVersion](self, "rightHardwareVersion");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          if (v87)
          {
            -[AXHearingAidDevice rightHardwareVersion](self, "rightHardwareVersion");
            v88 = objc_claimAutoreleasedReturnValue();
            goto LABEL_154;
          }
          goto LABEL_155;
        }
        if (a3 == 0x1000000)
        {
          -[AXHearingAidDevice deviceUUID](self, "deviceUUID");
          v6 = objc_claimAutoreleasedReturnValue();
          goto LABEL_134;
        }
        goto LABEL_113;
      }
      if (a3 == 0x2000000)
        goto LABEL_68;
      if (a3 != 0x4000000)
      {
        if (a3 == 0x10000000)
        {
          v10 = (__CFString *)MEMORY[0x1E0C9AAB0];
          return v10;
        }
        goto LABEL_113;
      }
      v47 = (void *)MEMORY[0x1E0CB37E8];
      v48 = -[AXHearingAidDevice isPaired](self, "isPaired");
      v49 = v47;
    }
    objc_msgSend(v49, "numberWithBool:", v48);
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_134;
  }
  if ((uint64_t)a3 <= 4095)
  {
    if ((uint64_t)a3 <= 63)
    {
      if ((uint64_t)a3 > 7)
      {
        if (a3 != 8)
        {
          if (a3 == 16 || a3 == 32)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v7 = (id)objc_claimAutoreleasedReturnValue();
            -[AXHearingAidDevice leftUUID](self, "leftUUID");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            if (v8)
            {
              -[AXHearingAidDevice leftUUID](self, "leftUUID");
              v9 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "addObject:", v9);

            }
            else
            {
              objc_msgSend(v7, "addObject:", &stru_1EA8EC4E0);
            }

            -[AXHearingAidDevice rightUUID](self, "rightUUID");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            if (v87)
            {
              -[AXHearingAidDevice rightUUID](self, "rightUUID");
              v88 = objc_claimAutoreleasedReturnValue();
LABEL_154:
              v94 = (void *)v88;
              objc_msgSend(v7, "addObject:", v88);

LABEL_156:
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v7);
              v58 = objc_claimAutoreleasedReturnValue();
              goto LABEL_157;
            }
LABEL_155:
            objc_msgSend(v7, "addObject:", &stru_1EA8EC4E0);
            goto LABEL_156;
          }
          goto LABEL_113;
        }
        v45 = (void *)MEMORY[0x1E0CB37E8];
        v46 = -[AXHearingAidDevice availableEars](self, "availableEars");
LABEL_98:
        objc_msgSend(v45, "numberWithUnsignedInt:", v46);
        v6 = objc_claimAutoreleasedReturnValue();
        goto LABEL_134;
      }
      if (a3 == 2)
        goto LABEL_68;
      if (a3 != 4)
        goto LABEL_113;
      v18 = (void *)MEMORY[0x1E0C99D20];
      v31 = (void *)MEMORY[0x1E0CB37E8];
      -[AXHearingAidDevice leftBatteryLevel](self, "leftBatteryLevel");
      objc_msgSend(v31, "numberWithDouble:");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x1E0CB37E8];
      -[AXHearingAidDevice rightBatteryLevel](self, "rightBatteryLevel");
      goto LABEL_107;
    }
    if ((uint64_t)a3 > 255)
    {
      if (a3 == 256)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXHearingAidDevice leftPrograms](self, "leftPrograms");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = MEMORY[0x1E0C809B0];
        v105[0] = MEMORY[0x1E0C809B0];
        v105[1] = 3221225472;
        v105[2] = __39__AXHearingAidDevice_valueForProperty___block_invoke;
        v105[3] = &unk_1EA8E8DE8;
        v106 = v51;
        v7 = v51;
        objc_msgSend(v52, "enumerateObjectsUsingBlock:", v105);

        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXHearingAidDevice rightPrograms](self, "rightPrograms");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v103[0] = v53;
        v103[1] = 3221225472;
        v103[2] = __39__AXHearingAidDevice_valueForProperty___block_invoke_2;
        v103[3] = &unk_1EA8E8DE8;
        v104 = v54;
        v56 = v54;
        objc_msgSend(v55, "enumerateObjectsUsingBlock:", v103);

        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v7, v56, 0);
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_158:
        return v10;
      }
      if (a3 == 512)
      {
        v114[0] = &unk_1EA8FFA40;
        -[AXHearingAidDevice manufacturer](self, "manufacturer");
        v7 = (id)objc_claimAutoreleasedReturnValue();
        v114[1] = &unk_1EA8FFA58;
        v115[0] = v7;
        -[AXHearingAidDevice model](self, "model");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v115[1] = v15;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v115, v114, 2);
        v50 = objc_claimAutoreleasedReturnValue();
        goto LABEL_91;
      }
      if (a3 != 1024)
        goto LABEL_113;
      -[AXHearingAidDevice leftSelectedProgram](self, "leftSelectedProgram");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        -[AXHearingAidDevice leftSelectedProgram](self, "leftSelectedProgram");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "index");

      }
      else
      {
        v24 = 0xFFFFFFFFLL;
      }

      -[AXHearingAidDevice rightSelectedProgram](self, "rightSelectedProgram");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      if (v89)
      {
        -[AXHearingAidDevice rightSelectedProgram](self, "rightSelectedProgram");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_147:
        v91 = v90;
        v92 = objc_msgSend(v90, "index");

LABEL_149:
        v93 = (void *)MEMORY[0x1E0C99D20];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v24);
        v7 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v92);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "arrayWithObjects:", v7, v61, 0);
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_150:

        goto LABEL_158;
      }
      goto LABEL_148;
    }
    if (a3 == 64)
    {
      v18 = (void *)MEMORY[0x1E0C99D20];
      v68 = (void *)MEMORY[0x1E0CB37E8];
      -[AXHearingAidDevice leftMicrophoneVolume](self, "leftMicrophoneVolume");
      objc_msgSend(v68, "numberWithDouble:");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x1E0CB37E8];
      -[AXHearingAidDevice rightMicrophoneVolume](self, "rightMicrophoneVolume");
    }
    else
    {
      if (a3 != 128)
        goto LABEL_113;
      v18 = (void *)MEMORY[0x1E0C99D20];
      v41 = (void *)MEMORY[0x1E0CB37E8];
      -[AXHearingAidDevice leftStreamVolume](self, "leftStreamVolume");
      objc_msgSend(v41, "numberWithDouble:");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x1E0CB37E8];
      -[AXHearingAidDevice rightStreamVolume](self, "rightStreamVolume");
    }
LABEL_107:
    objc_msgSend(v21, "numberWithDouble:");
    v67 = objc_claimAutoreleasedReturnValue();
    goto LABEL_108;
  }
  if ((uint64_t)a3 >= 0x20000)
  {
    if ((uint64_t)a3 < 0x100000)
    {
      if (a3 != 0x20000)
      {
        if (a3 != 0x40000)
        {
          if (a3 == 0x80000)
          {
            -[AXHearingAidDevice manufacturer](self, "manufacturer");
            v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_95:
            v7 = v5;
            objc_msgSend(v5, "firstObject");
            v58 = objc_claimAutoreleasedReturnValue();
LABEL_157:
            v10 = (__CFString *)v58;
            goto LABEL_158;
          }
          goto LABEL_113;
        }
        -[AXHearingAidDevice name](self, "name");
        v6 = objc_claimAutoreleasedReturnValue();
LABEL_134:
        v10 = (__CFString *)v6;
        return v10;
      }
LABEL_68:
      HAInitializeLogging();
      v32 = (void *)MEMORY[0x1E0CB3940];
      hearingPropertyDescription(a3);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "stringWithFormat:", CFSTR("Reading component property %@"), v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice valueForProperty:]", 2602, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)*MEMORY[0x1E0D2F928];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
      {
        v37 = objc_retainAutorelease(v35);
        v38 = v36;
        *(_DWORD *)buf = 136446210;
        v108 = objc_msgSend(v37, "UTF8String");
        _os_log_impl(&dword_1DE311000, v38, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

      }
      v10 = &stru_1EA8EC4E0;
      return v10;
    }
    if (a3 == 0x100000)
    {
      -[AXHearingAidDevice model](self, "model");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_95;
    }
    if (a3 != 0x200000)
    {
      if (a3 == 0x400000)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v7 = (id)objc_claimAutoreleasedReturnValue();
        -[AXHearingAidDevice leftFirmwareVersion](self, "leftFirmwareVersion");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          -[AXHearingAidDevice leftFirmwareVersion](self, "leftFirmwareVersion");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v28);

        }
        else
        {
          objc_msgSend(v7, "addObject:", &stru_1EA8EC4E0);
        }

        -[AXHearingAidDevice rightFirmwareVersion](self, "rightFirmwareVersion");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        if (v87)
        {
          -[AXHearingAidDevice rightFirmwareVersion](self, "rightFirmwareVersion");
          v88 = objc_claimAutoreleasedReturnValue();
          goto LABEL_154;
        }
        goto LABEL_155;
      }
      goto LABEL_113;
    }
    v59 = (void *)MEMORY[0x1E0C99D20];
    v60 = (void *)MEMORY[0x1E0CB37E8];
    -[AXHearingAidDevice leftPeripheral](self, "leftPeripheral");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "numberWithInteger:", objc_msgSend(v7, "state"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = (void *)MEMORY[0x1E0CB37E8];
    -[AXHearingAidDevice rightPeripheral](self, "rightPeripheral");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "numberWithInteger:", objc_msgSend(v63, "state"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "arrayWithObjects:", v61, v64, 0);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_150;
  }
  if ((uint64_t)a3 < 0x4000)
  {
    if (a3 == 4096 || a3 == 0x2000)
      goto LABEL_68;
    goto LABEL_113;
  }
  if (a3 == 0x4000 || a3 == 0x8000)
    goto LABEL_68;
  if (a3 == 0x10000)
  {
    -[AXHearingAidDevice leftPeripheral](self, "leftPeripheral");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[AXHearingAidDevice availablePropertiesForPeripheral:](self, "availablePropertiesForPeripheral:", v11);

    -[AXHearingAidDevice rightPeripheral](self, "rightPeripheral");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[AXHearingAidDevice availablePropertiesForPeripheral:](self, "availablePropertiesForPeripheral:", v13);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v12);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v112[0] = v7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v112[1] = v15;
    v16 = (void *)MEMORY[0x1E0C99D20];
    v17 = v112;
LABEL_88:
    objc_msgSend(v16, "arrayWithObjects:count:", v17, 2);
    v50 = objc_claimAutoreleasedReturnValue();
LABEL_91:
    v10 = (__CFString *)v50;
LABEL_101:

    goto LABEL_158;
  }
LABEL_113:
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Compound property: %ld"), a3);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice valueForProperty:]", 2607, v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v75 = objc_retainAutorelease(v73);
    v76 = v74;
    *(_DWORD *)buf = 136446210;
    v108 = objc_msgSend(v75, "UTF8String");
    _os_log_impl(&dword_1DE311000, v76, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = 0;
  while (((1 << v78) & a3) == 0)
  {
LABEL_126:
    if (++v78 == 64)
      goto LABEL_162;
  }
  objc_msgSend((id)objc_opt_class(), "characteristicsUUIDs");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 1 << v78);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "objectForKey:", v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();

  if (v78 != 16 && !v81)
  {
    HAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Ignored property without characteristic: %ld"), a3);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice valueForProperty:]", 2636, v82);
    v83 = (id)objc_claimAutoreleasedReturnValue();
    v84 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v83 = objc_retainAutorelease(v83);
      v85 = v84;
      v86 = objc_msgSend(v83, "UTF8String");
      *(_DWORD *)buf = 136446210;
      v108 = v86;
      _os_log_impl(&dword_1DE311000, v85, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    goto LABEL_124;
  }
  if (1 << v78 != a3)
  {
    -[AXHearingAidDevice valueForProperty:](self, "valueForProperty:", 1 << v78);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v82)
    {
LABEL_125:

      goto LABEL_126;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 1 << v78);
    v83 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "setObject:forKey:", v82, v83);
LABEL_124:

    goto LABEL_125;
  }
  v96 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_FAULT))
    -[AXHearingAidDevice valueForProperty:].cold.1(v96, a3);
LABEL_162:
  if (objc_msgSend(v77, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v77);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    HAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown property: %ld"), a3);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice valueForProperty:]", 2647, v97);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v100 = objc_retainAutorelease(v98);
      v101 = v99;
      v102 = objc_msgSend(v100, "UTF8String");
      *(_DWORD *)buf = 136446210;
      v108 = v102;
      _os_log_impl(&dword_1DE311000, v101, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    v10 = &stru_1EA8EC4E0;
  }

  return v10;
}

void __39__AXHearingAidDevice_valueForProperty___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "transportRepresentation");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __39__AXHearingAidDevice_valueForProperty___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "transportRepresentation");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (id)deviceDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[AXHearingAidDevice deviceUUID](self, "deviceUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __39__AXHearingAidDevice_deviceDescription__block_invoke;
    v16[3] = &unk_1EA8E8E78;
    v16[4] = self;
    v17 = v5;
    v6 = v5;
    objc_msgSend(&unk_1EA900580, "enumerateObjectsUsingBlock:", v16);
    v7 = (void *)MEMORY[0x1E0C99D80];
    -[AXHearingAidDevice deviceUUID](self, "deviceUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryWithObject:forKey:", v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    return v9;
  }
  else
  {
    HAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DeviceUUID NULL %@"), self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice deviceDescription]", 2660, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_retainAutorelease(v12);
      v15 = v13;
      *(_DWORD *)buf = 136446210;
      v19 = objc_msgSend(v14, "UTF8String");
      _os_log_impl(&dword_1DE311000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    return 0;
  }
}

void __39__AXHearingAidDevice_deviceDescription__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "valueForProperty:", objc_msgSend(v4, "integerValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v3, v4);

}

- (void)peripheralDidUpdateName:(id)a3
{
  void *v4;

  objc_msgSend(a3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[AXHearingAidDevice updateName](self, "updateName");
}

- (void)peripheral:(id)a3 didModifyServices:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Reloading services %@, %@"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice peripheral:didModifyServices:]", 2692, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_retainAutorelease(v9);
    v12 = v10;
    *(_DWORD *)buf = 136446210;
    v19 = objc_msgSend(v11, "UTF8String");
    _os_log_impl(&dword_1DE311000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  v13 = (void *)MEMORY[0x1E0C99D20];
  -[AXHearingAidDevice serviceUUID](self, "serviceUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("180a"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("8341F2B4-C013-4F04-8197-C4CDB42E26DC"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "arrayWithObjects:", v14, v15, v16, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "discoverServices:", v17);

}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  AXHearingAidDevice *v31;
  uint8_t buf[4];
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    HAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error discovering services (%@): %@"), v6, v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice peripheral:didDiscoverServices:]", 2747, v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
LABEL_3:
      v9 = objc_retainAutorelease(v9);
      v11 = v10;
      *(_DWORD *)buf = 136446210;
      v33 = objc_msgSend(v9, "UTF8String");
      _os_log_impl(&dword_1DE311000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
  }
  else
  {
    objc_msgSend(v6, "services");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    HAInitializeLogging();
    v14 = (void *)MEMORY[0x1E0CB3940];
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("EMPTY SERVICES"));
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice peripheral:didDiscoverServices:]", 2705, v8);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = (void *)*MEMORY[0x1E0D2F928];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
        goto LABEL_9;
      goto LABEL_3;
    }
    objc_msgSend(v6, "services");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%@ - %@"), v6, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice peripheral:didDiscoverServices:]", 2709, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_retainAutorelease(v17);
      v20 = v18;
      *(_DWORD *)buf = 136446210;
      v33 = objc_msgSend(v19, "UTF8String");
      _os_log_impl(&dword_1DE311000, v20, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    -[AXHearingAidDevice serviceUUID](self, "serviceUUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("180a"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("8341F2B4-C013-4F04-8197-C4CDB42E26DC"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "services");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __53__AXHearingAidDevice_peripheral_didDiscoverServices___block_invoke;
    v26[3] = &unk_1EA8E8EC8;
    v27 = v22;
    v28 = v23;
    v29 = v6;
    v30 = v21;
    v31 = self;
    v25 = v21;
    v9 = v23;
    v8 = v22;
    objc_msgSend(v24, "enumerateObjectsUsingBlock:", v26);

  }
LABEL_9:

}

void __53__AXHearingAidDevice_peripheral_didDiscoverServices___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_msgSend(v4, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 32));
  if ((v6 & 1) != 0
    || (objc_msgSend(v4, "UUID"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        (objc_msgSend(v2, "isEqual:", *(_QWORD *)(a1 + 40)) & 1) != 0))
  {
    objc_msgSend(v4, "characteristics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if ((v6 & 1) == 0)
    if (!v8)
      goto LABEL_13;
  }
  else
  {

  }
  objc_msgSend(v4, "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqual:", *(_QWORD *)(a1 + 56)) & 1) != 0)
  {
    objc_msgSend(v4, "characteristics");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (!v11)
    {
      objc_msgSend(*(id *)(a1 + 64), "setLeftLoadedProperties:", objc_msgSend(*(id *)(a1 + 64), "leftLoadedProperties") | 0x8000);
      objc_msgSend(*(id *)(a1 + 64), "setRightLoadedProperties:", objc_msgSend(*(id *)(a1 + 64), "rightLoadedProperties") | 0x8000);
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "characteristicsUUIDs");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __53__AXHearingAidDevice_peripheral_didDiscoverServices___block_invoke_2;
      v26[3] = &unk_1EA8E8EA0;
      v27 = v12;
      v14 = v12;
      objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v26);

      objc_msgSend(*(id *)(a1 + 48), "discoverCharacteristics:forService:", v14, v4);
      goto LABEL_19;
    }
  }
  else
  {

  }
  objc_msgSend(v4, "UUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqual:", *(_QWORD *)(a1 + 40));

  if (v16)
  {
LABEL_13:
    objc_msgSend(*(id *)(a1 + 48), "discoverCharacteristics:forService:", 0, v4);
    goto LABEL_19;
  }
  objc_msgSend(v4, "characteristics");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v18)
  {
    objc_msgSend(*(id *)(a1 + 64), "loadBasicProperties");
  }
  else
  {
    HAInitializeLogging();
    v19 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v4, "UUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("Unknown service: %@ - %@"), v4, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice peripheral:didDiscoverServices:]_block_invoke", 2736, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v24 = objc_retainAutorelease(v22);
      v25 = v23;
      *(_DWORD *)buf = 136446210;
      v29 = objc_msgSend(v24, "UTF8String");
      _os_log_impl(&dword_1DE311000, v25, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
  }
LABEL_19:

}

uint64_t __53__AXHearingAidDevice_peripheral_didDiscoverServices___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  id v36;
  void *v37;
  unsigned int v38;
  void *v39;
  id v40;
  NSObject *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  uint64_t v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  _BOOL8 keepInSync;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  _QWORD v58[5];
  id v59;
  uint8_t buf[4];
  uint64_t v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v10)
  {
    objc_msgSend(v9, "characteristics");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    HAInitializeLogging();
    v17 = (void *)MEMORY[0x1E0CB3940];
    if (!v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("EMPTY CHARACTERISTICS %@"), v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice peripheral:didDiscoverCharacteristicsForService:error:]", 2759, v11);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v13 = (void *)*MEMORY[0x1E0D2F928];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
        goto LABEL_5;
      goto LABEL_3;
    }
    objc_msgSend(v9, "characteristics");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("%@ - %@"), v8, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice peripheral:didDiscoverCharacteristicsForService:error:]", 2763, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v22 = objc_retainAutorelease(v20);
      v23 = v21;
      *(_DWORD *)buf = 136446210;
      v61 = objc_msgSend(v22, "UTF8String");
      _os_log_impl(&dword_1DE311000, v23, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    -[AXHearingAidDevice serviceUUID](self, "serviceUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("180a"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("8341F2B4-C013-4F04-8197-C4CDB42E26DC"));
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "isEqual:", v12);

    if (v25)
    {
      objc_msgSend(v9, "characteristics");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "count");

      if (v27)
      {
        objc_msgSend(v9, "characteristics");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v58[0] = MEMORY[0x1E0C809B0];
        v58[1] = 3221225472;
        v58[2] = __76__AXHearingAidDevice_peripheral_didDiscoverCharacteristicsForService_error___block_invoke;
        v58[3] = &unk_1EA8E8EF0;
        v58[4] = self;
        v59 = v8;
        objc_msgSend(v28, "enumerateObjectsUsingBlock:", v58);

      }
      else
      {
        objc_msgSend(v8, "discoverCharacteristics:forService:", 0, v9);
      }
      goto LABEL_4;
    }
    objc_msgSend(v9, "UUID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "isEqual:", v14);

    if (v30)
    {
      HAInitializeLogging();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Loaded auth service characteristics"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice peripheral:didDiscoverCharacteristicsForService:error:]", 2783, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)*MEMORY[0x1E0D2F928];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
      {
LABEL_25:
        v40 = objc_retainAutorelease(v32);
        v41 = v33;
        v42 = objc_msgSend(v40, "UTF8String");
        *(_DWORD *)buf = 136446210;
        v61 = v42;
        _os_log_impl(&dword_1DE311000, v41, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

      }
    }
    else
    {
      objc_msgSend(v9, "UUID");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "isEqual:", v11);

      if (v35)
      {
        -[AXHearingAidDevice setLeftLoadedProperties:](self, "setLeftLoadedProperties:", -[AXHearingAidDevice leftLoadedProperties](self, "leftLoadedProperties") | 0x10000);
        -[AXHearingAidDevice setRightLoadedProperties:](self, "setRightLoadedProperties:", -[AXHearingAidDevice rightLoadedProperties](self, "rightLoadedProperties") | 0x10000);
        if (-[AXHearingAidDevice isPaired](self, "isPaired")
          || -[AXHearingAidDevice peripheral:didLoadProperty:](self, "peripheral:didLoadProperty:", v8, 56))
        {
          if (!-[AXHearingAidDevice isPaired](self, "isPaired"))
            goto LABEL_4;
          -[AXHearingAidDevice rightPeripheral](self, "rightPeripheral");
          v36 = (id)objc_claimAutoreleasedReturnValue();

          if (v36 == v8)
          {
            -[AXHearingAidDevice setRightMicrophoneVolumeSteps:](self, "setRightMicrophoneVolumeSteps:", 1);
            -[AXHearingAidDevice setRightSensitivitySteps:](self, "setRightSensitivitySteps:", 1);
            -[AXHearingAidDevice setRightStreamVolumeSteps:](self, "setRightStreamVolumeSteps:", 1);
            -[AXHearingAidDevice setRightMixedVolumeSteps:](self, "setRightMixedVolumeSteps:", 1);
          }
          else
          {
            -[AXHearingAidDevice setLeftMicrophoneVolumeSteps:](self, "setLeftMicrophoneVolumeSteps:", 1);
            -[AXHearingAidDevice setLeftSensitivitySteps:](self, "setLeftSensitivitySteps:", 1);
            -[AXHearingAidDevice setLeftStreamVolumeSteps:](self, "setLeftStreamVolumeSteps:", 1);
            -[AXHearingAidDevice setLeftMixedVolumeSteps:](self, "setLeftMixedVolumeSteps:", 1);
          }
          +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "device:didUpdateProperty:", self, 0x5F7800000C0);

          -[AXHearingAidDevice loadRequiredProperties](self, "loadRequiredProperties");
          if (!self->_keepInSync)
            goto LABEL_4;
          -[AXHearingAidDevice leftPeripheral](self, "leftPeripheral");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          -[AXHearingAidDevice setNotify:forPeripheral:](self, "setNotify:forPeripheral:", 1, v51);

          keepInSync = self->_keepInSync;
          -[AXHearingAidDevice rightPeripheral](self, "rightPeripheral");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          -[AXHearingAidDevice setNotify:forPeripheral:](self, "setNotify:forPeripheral:", keepInSync, v53);

          -[AXHearingAidDevice setLeftLoadedProperties:](self, "setLeftLoadedProperties:", -[AXHearingAidDevice leftLoadedProperties](self, "leftLoadedProperties") & 0xFFFFFF007FFEFA3BLL);
          -[AXHearingAidDevice setRightLoadedProperties:](self, "setRightLoadedProperties:", -[AXHearingAidDevice rightLoadedProperties](self, "rightLoadedProperties") & 0xFFFFFF007FFEFA3BLL);
          -[AXHearingAidDevice leftPeripheral](self, "leftPeripheral");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          -[AXHearingAidDevice loadProperties:forPeripheral:withRetryPeriod:](self, "loadProperties:forPeripheral:withRetryPeriod:", 0xFF800105C4, v54, 0.0);

          -[AXHearingAidDevice rightPeripheral](self, "rightPeripheral");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          -[AXHearingAidDevice loadProperties:forPeripheral:withRetryPeriod:](self, "loadProperties:forPeripheral:withRetryPeriod:", 0xFF800105C4, v43, 0.0);
        }
        else
        {
          -[AXHearingAidDevice peripheral:characteristicForProperty:](self, "peripheral:characteristicForProperty:", v8, 8);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          if (v43)
            -[AXHearingAidDevice readValueForCharacteristic:fromPeripheral:](self, "readValueForCharacteristic:fromPeripheral:", v43, v8);
          -[AXHearingAidDevice peripheral:characteristicForProperty:](self, "peripheral:characteristicForProperty:", v8, 0x10000000000);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v44)
          {
            HAInitializeLogging();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The characteristic for input availability is nil"));
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice peripheral:didDiscoverCharacteristicsForService:error:]", 2802, v56);
            v57 = (id)objc_claimAutoreleasedReturnValue();
            v45 = (void *)*MEMORY[0x1E0D2F928];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
            {
              v55 = objc_retainAutorelease(v57);
              v46 = v45;
              v47 = objc_msgSend(v55, "UTF8String");
              *(_DWORD *)buf = 136446210;
              v61 = v47;
              _os_log_impl(&dword_1DE311000, v46, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

            }
            +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "setAvailableInputEars:", 0);

            -[AXHearingAidDevice setAvailableInputEars:](self, "setAvailableInputEars:", 0);
            -[AXHearingAidDevice rightPeripheral](self, "rightPeripheral");
            v49 = (id)objc_claimAutoreleasedReturnValue();

            if (v49 == v8)
              -[AXHearingAidDevice setRightLeaVersion:](self, "setRightLeaVersion:", 1);
            else
              -[AXHearingAidDevice setLeftLeaVersion:](self, "setLeftLeaVersion:", 1);
          }
          -[AXHearingAidDevice updateName](self, "updateName");

        }
LABEL_4:

        goto LABEL_5;
      }
      HAInitializeLogging();
      v37 = (void *)MEMORY[0x1E0CB3940];
      v38 = objc_msgSend(v8, "hasTag:", CFSTR("IsMFiAuthenticated_CertClass0B"));
      objc_msgSend(v9, "UUID");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "stringWithFormat:", CFSTR("Unknown service: (%d) %@ - %@"), v38, v9, v39);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice peripheral:didDiscoverCharacteristicsForService:error:]", 2851, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)*MEMORY[0x1E0D2F928];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
        goto LABEL_25;
    }

    goto LABEL_4;
  }
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error discovering characteristics (%@): %@"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice peripheral:didDiscoverCharacteristicsForService:error:]", 2857, v11);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
LABEL_3:
    v12 = objc_retainAutorelease(v12);
    v14 = v13;
    *(_DWORD *)buf = 136446210;
    v61 = objc_msgSend(v12, "UTF8String");
    _os_log_impl(&dword_1DE311000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    goto LABEL_4;
  }
LABEL_5:

}

uint64_t __76__AXHearingAidDevice_peripheral_didDiscoverCharacteristicsForService_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "readValueForCharacteristic:fromPeripheral:", a2, *(_QWORD *)(a1 + 40));
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  if (v8)
  {
    HAInitializeLogging();
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v9, "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("Error reading characteristic value (%@)(%@): %@"), v9, v11, v8);
    v12 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice peripheral:didUpdateValueForCharacteristic:error:]", 2871, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_retainAutorelease(v13);
      v16 = v14;
      *(_DWORD *)buf = 136446210;
      v18 = objc_msgSend(v15, "UTF8String");
      _os_log_impl(&dword_1DE311000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    v9 = (id)v12;
  }
  else
  {
    -[AXHearingAidDevice peripheral:didUpdateCharacteristic:](self, "peripheral:didUpdateCharacteristic:", a3, v9);
  }

}

- (void)peripheral:(id)a3 didUpdateCharacteristic:(id)a4
{
  unint64_t v4;
  id v7;
  id v8;
  _BOOL4 v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  void *v44;
  os_log_t *v45;
  void *v46;
  id v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  int v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  int v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  NSObject *v66;
  void *v67;
  char v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  _BOOL4 v80;
  void *v81;
  float v82;
  int v83;
  __int16 v84;
  void *v85;
  _BOOL4 v86;
  void *v87;
  _BOOL4 v88;
  void *v89;
  int v90;
  void *v91;
  void *v92;
  void *v93;
  id v94;
  NSObject *v95;
  void *v96;
  void *v97;
  void *v98;
  double v99;
  void *v100;
  void *v101;
  double v102;
  void *v103;
  id v104;
  uint64_t v105;
  void *v106;
  void *v107;
  int v108;
  void *v109;
  void *v110;
  void *v111;
  id v112;
  NSObject *v113;
  void *v114;
  void *v115;
  void *v116;
  os_log_t v117;
  id v118;
  NSObject *v119;
  uint64_t v120;
  void *v121;
  void *v122;
  BOOL v123;
  id v124;
  _DWORD *v125;
  void *v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  void *v130;
  uint64_t v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  float v136;
  int v137;
  __int16 v138;
  void *v139;
  _BOOL4 v140;
  void *v141;
  _BOOL4 v142;
  void *v143;
  _BOOL4 v144;
  void *v145;
  _BOOL4 v146;
  void *v147;
  BOOL v148;
  void *v149;
  id v150;
  _DWORD *v151;
  void *v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  void *v156;
  int v157;
  void *v158;
  void *v159;
  double v160;
  void *v161;
  unsigned int *v162;
  __int16 v163;
  unsigned int v164;
  id v165;
  uint64_t v166;
  void *v167;
  void *v168;
  _BOOL4 v169;
  void *v170;
  _BOOL4 v171;
  int v172;
  AXHearingAidDevice *v173;
  void *v174;
  _BOOL4 v175;
  void *v176;
  _BOOL4 v177;
  int v178;
  AXHearingAidDevice *v179;
  id v180;
  void *v181;
  id v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  BOOL v189;
  void *v190;
  void *v191;
  double v192;
  void *v193;
  float v194;
  int v195;
  __int16 v196;
  void *v197;
  _BOOL4 v198;
  void *v199;
  _BOOL4 v200;
  float v201;
  int v202;
  __int16 v203;
  void *v204;
  _BOOL4 v205;
  void *v206;
  _BOOL4 v207;
  void *v208;
  _BOOL4 v209;
  int v210;
  void *v211;
  void *v212;
  void *v213;
  uint64_t v214;
  void *v215;
  int v216;
  int v217;
  uint64_t v218;
  void *v219;
  void *v220;
  void *v221;
  _BOOL4 v222;
  void *v223;
  _BOOL4 v224;
  void *v225;
  uint64_t v226;
  void *v227;
  id v228;
  os_log_t v229;
  NSObject *v230;
  uint64_t v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  id v237;
  uint64_t v238;
  id v239;
  void *v240;
  uint64_t v241;
  void *v242;
  void *v243;
  void *v244;
  uint64_t v245;
  void *v246;
  void *v247;
  void *v248;
  uint64_t v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  uint64_t v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  _BOOL4 v261;
  void *v262;
  void *v263;
  void *v264;
  _BOOL4 v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  BOOL v275;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  void *v280;
  void *v281;
  void *v282;
  void *v283;
  void *v284;
  void *v285;
  _BOOL4 v286;
  void *v287;
  _BOOL4 v288;
  void *v289;
  void *v290;
  void *v291;
  void *v292;
  os_log_t v293;
  id v294;
  NSObject *v295;
  uint64_t v296;
  void *v297;
  void *v298;
  _BOOL4 v299;
  void *v300;
  _BOOL4 v301;
  void *v302;
  _BOOL4 v303;
  _BOOL4 v304;
  _BOOL4 v305;
  double leftMicrophoneVolume;
  void *v307;
  void *v308;
  void *v309;
  void *v310;
  BOOL v311;
  void *v312;
  int v313;
  AXHearingAidDevice *v314;
  void *v315;
  int v316;
  AXHearingAidDevice *v317;
  void *v318;
  void *v319;
  void *v320;
  void *v321;
  os_log_t v322;
  id v323;
  NSObject *v324;
  uint64_t v325;
  _BOOL4 v326;
  void *v327;
  _BOOL4 v328;
  void *v329;
  _BOOL4 v330;
  void *v331;
  double rightMicrophoneVolume;
  void *v333;
  void *v334;
  void *v335;
  void *v336;
  BOOL v337;
  void *v338;
  void *v339;
  void *v340;
  uint64_t v341;
  uint64_t v342;
  uint64_t v343;
  void *v344;
  uint64_t v345;
  uint64_t v346;
  void *v347;
  uint64_t v348;
  int v349;
  AXHearingAidMode *v350;
  uint64_t v351;
  void *v352;
  void *v353;
  void *v354;
  void *v355;
  void *v356;
  void *v357;
  void *v358;
  void *v359;
  void *v360;
  void *v361;
  void *v362;
  _BOOL4 v363;
  void *v364;
  _BOOL4 v365;
  void *v366;
  BOOL v367;
  void *v368;
  void *v369;
  void *v370;
  _BOOL4 v371;
  uint64_t v372;
  void *v373;
  _BOOL4 v374;
  void *v375;
  void *v376;
  void *v377;
  void *v378;
  void *v379;
  unsigned int v380;
  uint64_t v381;
  void *v382;
  void *v383;
  unsigned int v384;
  void *v385;
  id v386;
  void *v387;
  void *v388;
  void *v389;
  void *v390;
  void *v391;
  void *v392;
  AXHearingAidDevice *v393;
  void *v394;
  _QWORD v395[6];
  _QWORD v396[6];
  uint64_t v397;
  uint64_t *v398;
  uint64_t v399;
  uint64_t (*v400)(uint64_t, uint64_t);
  void (*v401)(uint64_t);
  id v402;
  _QWORD v403[6];
  char v404;
  uint64_t v405;
  uint64_t *v406;
  uint64_t v407;
  uint64_t (*v408)(uint64_t, uint64_t);
  void (*v409)(uint64_t);
  id v410;
  char v411;
  _QWORD v412[4];
  char v413;
  _QWORD v414[6];
  BOOL v415;
  _QWORD v416[7];
  BOOL v417;
  _QWORD v418[4];
  int v419;
  _QWORD v420[6];
  _QWORD v421[6];
  _QWORD v422[6];
  __int128 buf;
  uint64_t v424;
  uint64_t (*v425)(uint64_t, uint64_t);
  void (*v426)(uint64_t);
  id v427;
  uint64_t v428;

  v428 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v393 = self;
  v9 = -[AXHearingAidDevice isFakeDevice](self, "isFakeDevice");
  v392 = v7;
  if (v7)
    v10 = 1;
  else
    v10 = v9;
  v394 = v8;
  if (v8 && v10)
  {
    -[AXHearingAidDevice serviceUUID](self, "serviceUUID");
    v389 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("180a"));
    v390 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "service");
    v391 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v391, "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqual:", v390);

    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("2a29"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("2a24"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("2a26"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("2a27"));
      v387 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v394, "value");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v16, "length"))
      {
LABEL_244:

        goto LABEL_470;
      }
      -[AXHearingAidDevice rightPeripheral](v393, "rightPeripheral");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v394, "value");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v18, "initWithData:encoding:", v19, 4);

      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringByTrimmingCharactersInSet:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v22, "length"))
      {
        objc_msgSend(v394, "UUID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "isEqual:", v13);

        if (v24)
        {
          HAInitializeLogging();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Manufacturer found: |%@|"), v22);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice peripheral:didUpdateCharacteristic:]", 2903, v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = (void *)*MEMORY[0x1E0D2F928];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
          {
            v28 = objc_retainAutorelease(v26);
            v29 = v27;
            LODWORD(buf) = 136446210;
            *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v28, "UTF8String");
            _os_log_impl(&dword_1DE311000, v29, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);

          }
          NSLog(CFSTR("Hearing aid Manufacturer found: %@"), v22);
          -[AXHearingAidDevice manufacturer](v393, "manufacturer");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "containsObject:", v22);

          if ((v31 & 1) != 0)
            goto LABEL_243;
          -[AXHearingAidDevice manufacturer](v393, "manufacturer");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[AXHearingAidDevice leftPeripheral](v393, "leftPeripheral");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "replaceObjectAtIndex:withObject:", v33 != v392, v22);

          +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "device:didUpdateProperty:", v393, 0x80000);
          goto LABEL_242;
        }
        objc_msgSend(v394, "UUID");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = objc_msgSend(v60, "isEqual:", v14);

        if (v61)
        {
          HAInitializeLogging();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Model Number found: |%@|"), v22);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice peripheral:didUpdateCharacteristic:]", 2914, v62);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = (void *)*MEMORY[0x1E0D2F928];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
          {
            v65 = objc_retainAutorelease(v63);
            v66 = v64;
            LODWORD(buf) = 136446210;
            *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v65, "UTF8String");
            _os_log_impl(&dword_1DE311000, v66, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);

          }
          NSLog(CFSTR("Hearing aid Model Number found: %@"), v22);
          -[AXHearingAidDevice model](v393, "model");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = objc_msgSend(v67, "containsObject:", v22);

          if ((v68 & 1) != 0)
            goto LABEL_243;
          -[AXHearingAidDevice model](v393, "model");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          -[AXHearingAidDevice leftPeripheral](v393, "leftPeripheral");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "replaceObjectAtIndex:withObject:", v70 != v392, v22);

          +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "device:didUpdateProperty:", v393, 0x100000);
          goto LABEL_242;
        }
        objc_msgSend(v394, "UUID");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v90 = objc_msgSend(v89, "isEqual:", v15);

        if (v90)
        {
          HAInitializeLogging();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Firmware version found: %@"), v22);
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice peripheral:didUpdateCharacteristic:]", 2925, v91);
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          v93 = (void *)*MEMORY[0x1E0D2F928];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
          {
            v94 = objc_retainAutorelease(v92);
            v95 = v93;
            LODWORD(buf) = 136446210;
            *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v94, "UTF8String");
            _os_log_impl(&dword_1DE311000, v95, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);

          }
          if (v17 == v392)
          {
            NSLog(CFSTR("Hearing aid right firmware version found: %@"), v22);
            -[AXHearingAidDevice setRightFirmwareVersion:](v393, "setRightFirmwareVersion:", v22);
          }
          else
          {
            NSLog(CFSTR("Hearing aid left firmware version found: %@"), v22);
            -[AXHearingAidDevice setLeftFirmwareVersion:](v393, "setLeftFirmwareVersion:", v22);
          }
          +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "device:didUpdateProperty:", v393, 0x400000);
LABEL_242:

          goto LABEL_243;
        }
        objc_msgSend(v394, "UUID");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        v108 = objc_msgSend(v107, "isEqual:", v387);

        if (v108)
        {
          HAInitializeLogging();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Hardware version found: %@"), v22);
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice peripheral:didUpdateCharacteristic:]", 2941, v109);
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          v111 = (void *)*MEMORY[0x1E0D2F928];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
          {
            v112 = objc_retainAutorelease(v110);
            v113 = v111;
            LODWORD(buf) = 136446210;
            *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v112, "UTF8String");
            _os_log_impl(&dword_1DE311000, v113, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);

          }
          if (v17 == v392)
          {
            NSLog(CFSTR("Hearing aid right hardware version found: %@"), v22);
            -[AXHearingAidDevice setRightHardwareVersion:](v393, "setRightHardwareVersion:", v22);
          }
          else
          {
            NSLog(CFSTR("Hearing aid left hardware version found: %@"), v22);
            -[AXHearingAidDevice setLeftHardwareVersion:](v393, "setLeftHardwareVersion:", v22);
          }
          +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "device:didUpdateProperty:", v393, 0x800000);
          goto LABEL_242;
        }
      }
LABEL_243:

      goto LABEL_244;
    }
    objc_msgSend(v391, "UUID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "isEqual:", v389);

    if (!v36)
    {
LABEL_470:

      goto LABEL_471;
    }
    v37 = -[AXHearingAidDevice peripheral:propertyForCharacteristic:](v393, "peripheral:propertyForCharacteristic:", v392, v394);
    HAInitializeLogging();
    v38 = (void *)MEMORY[0x1E0CB3940];
    hearingPropertyDescription(v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v394, "value");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXHearingAidDevice leftPeripheral](v393, "leftPeripheral");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = CFSTR("Right");
    if (v41 == v392)
      v42 = CFSTR("Left");
    objc_msgSend(v38, "stringWithFormat:", CFSTR("Getting property: %@ (%@) for %@ - %@"), v39, v40, v42, v392);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice peripheral:didUpdateCharacteristic:]", 2961, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (os_log_t *)MEMORY[0x1E0D2F928];
    v46 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v47 = objc_retainAutorelease(v44);
      v48 = v46;
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v47, "UTF8String");
      _os_log_impl(&dword_1DE311000, v48, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);

    }
    v422[0] = MEMORY[0x1E0C809B0];
    v422[1] = 3221225472;
    v422[2] = __57__AXHearingAidDevice_peripheral_didUpdateCharacteristic___block_invoke;
    v422[3] = &unk_1EA8E8F18;
    v422[4] = v393;
    v422[5] = v37;
    -[AXHearingAidDevice checkPairingStatusWithCompletion:](v393, "checkPairingStatusWithCompletion:", v422);
    if (v37 <= 0x3FFFFFFF)
    {
      if (v37 > 255)
      {
        if (v37 >= 0x2000)
        {
          if (v37 < 0x20000)
          {
            if (v37 == 0x2000)
            {
              -[AXHearingAidDevice rightPeripheral](v393, "rightPeripheral");
              v132 = (void *)objc_claimAutoreleasedReturnValue();

              v411 = 0;
              -[AXHearingAidDevice peripheral:characteristicForProperty:](v393, "peripheral:characteristicForProperty:", v392, 4096);
              v133 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v133, "value");
              v134 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v134, "getBytes:length:", &v411, 1);

              if (v132 == v392)
              {
                -[AXHearingAidDevice rightPrograms](v393, "rightPrograms");
                v135 = (void *)objc_claimAutoreleasedReturnValue();
                -[AXHearingAidDevice rightSelectedProgram](v393, "rightSelectedProgram");
              }
              else
              {
                -[AXHearingAidDevice leftPrograms](v393, "leftPrograms");
                v135 = (void *)objc_claimAutoreleasedReturnValue();
                -[AXHearingAidDevice leftSelectedProgram](v393, "leftSelectedProgram");
              }
              v235 = (void *)objc_claimAutoreleasedReturnValue();
              *(_QWORD *)&buf = 0;
              *((_QWORD *)&buf + 1) = &buf;
              v424 = 0x3032000000;
              v425 = __Block_byref_object_copy__0;
              v426 = __Block_byref_object_dispose__0;
              v427 = 0;
              v405 = 0;
              v406 = &v405;
              v407 = 0x3032000000;
              v408 = __Block_byref_object_copy__0;
              v409 = __Block_byref_object_dispose__0;
              v410 = 0;
              v403[0] = MEMORY[0x1E0C809B0];
              v403[1] = 3221225472;
              v403[2] = __57__AXHearingAidDevice_peripheral_didUpdateCharacteristic___block_invoke_331;
              v403[3] = &unk_1EA8E8FF8;
              v404 = v411;
              v403[4] = &buf;
              v403[5] = &v405;
              objc_msgSend(v135, "enumerateObjectsUsingBlock:", v403);
              v236 = v392;
              if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
              {
                v397 = 0;
                v398 = &v397;
                v399 = 0x3032000000;
                v400 = __Block_byref_object_copy__0;
                v401 = __Block_byref_object_dispose__0;
                v402 = 0;
                objc_msgSend(v394, "value");
                v237 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                v238 = objc_msgSend(v237, "bytes");

                if (v238)
                {
                  v239 = objc_alloc(MEMORY[0x1E0CB3940]);
                  objc_msgSend(v394, "value");
                  v240 = (void *)objc_claimAutoreleasedReturnValue();
                  v241 = objc_msgSend(v239, "initWithBytes:length:encoding:", v238, objc_msgSend(v240, "length"), 4);
                  v242 = (void *)v398[5];
                  v398[5] = v241;

                  v243 = (void *)v398[5];
                  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
                  v244 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v243, "stringByTrimmingCharactersInSet:", v244);
                  v245 = objc_claimAutoreleasedReturnValue();
                  v246 = (void *)v398[5];
                  v398[5] = v245;

                  v247 = (void *)v398[5];
                  objc_msgSend(MEMORY[0x1E0CB3500], "controlCharacterSet");
                  v248 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v247, "stringByTrimmingCharactersInSet:", v248);
                  v249 = objc_claimAutoreleasedReturnValue();
                  v250 = (void *)v398[5];
                  v398[5] = v249;

                }
                if (!objc_msgSend((id)v398[5], "length"))
                {
                  v251 = (void *)MEMORY[0x1E0CB3940];
                  hearingLocString(CFSTR("DefaultProgramName"));
                  v252 = (void *)objc_claimAutoreleasedReturnValue();
                  v253 = (void *)MEMORY[0x1E0CB37F0];
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "index"));
                  v254 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v253, "localizedStringFromNumber:numberStyle:", v254, 1);
                  v255 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v251, "stringWithFormat:", v252, v255);
                  v256 = objc_claimAutoreleasedReturnValue();
                  v257 = (void *)v398[5];
                  v398[5] = v256;

                  if (v132 == v392)
                    -[AXHearingAidDevice leftPrograms](v393, "leftPrograms");
                  else
                    -[AXHearingAidDevice rightPrograms](v393, "rightPrograms");
                  v338 = (void *)objc_claimAutoreleasedReturnValue();
                  v396[0] = MEMORY[0x1E0C809B0];
                  v396[1] = 3221225472;
                  v396[2] = __57__AXHearingAidDevice_peripheral_didUpdateCharacteristic___block_invoke_2_332;
                  v396[3] = &unk_1EA8E9020;
                  v396[4] = &buf;
                  v396[5] = &v397;
                  objc_msgSend(v338, "enumerateObjectsUsingBlock:", v396);

                }
                objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "setName:", v398[5]);
                +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
                v339 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v339, "device:didUpdateProperty:", v393, 1280);

                _Block_object_dispose(&v397, 8);
                v236 = v392;
              }
              v340 = (void *)v406[5];
              if (v340)
              {
                objc_msgSend(v340, "setSyncAttempts:", objc_msgSend((id)v406[5], "syncAttempts") + 1);
                v341 = v406[5];
                if (v132 == v236)
                  -[AXHearingAidDevice setCurrentRightProgram:](v393, "setCurrentRightProgram:", v341);
                else
                  -[AXHearingAidDevice setCurrentLeftProgram:](v393, "setCurrentLeftProgram:", v341);
                v342 = objc_msgSend((id)v406[5], "index");
                if (v132 == v236)
                  v343 = 4;
                else
                  v343 = 2;
                -[AXHearingAidDevice writeInt:toEar:forProperty:](v393, "writeInt:toEar:forProperty:", v342, v343, 4096);
              }
              else if (!v235)
              {
                -[AXHearingAidDevice readProperty:fromPeripheral:](v393, "readProperty:fromPeripheral:", 1024, v236);
              }
              _Block_object_dispose(&v405, 8);

              _Block_object_dispose(&buf, 8);
            }
            else if (v37 == 0x4000)
            {
              LOBYTE(v405) = 0;
              -[AXHearingAidDevice peripheral:characteristicForProperty:](v393, "peripheral:characteristicForProperty:", v392, 4096);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "value");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "getBytes:length:", &v405, 1);

              -[AXHearingAidDevice rightPeripheral](v393, "rightPeripheral");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              if (v51 == v392)
                -[AXHearingAidDevice rightPrograms](v393, "rightPrograms");
              else
                -[AXHearingAidDevice leftPrograms](v393, "leftPrograms");
              v225 = (void *)objc_claimAutoreleasedReturnValue();

              v412[0] = MEMORY[0x1E0C809B0];
              v412[1] = 3221225472;
              v412[2] = __57__AXHearingAidDevice_peripheral_didUpdateCharacteristic___block_invoke_3_327;
              v412[3] = &__block_descriptor_33_e33_B32__0__AXHearingAidMode_8Q16_B24l;
              v413 = v405;
              v226 = objc_msgSend(v225, "indexOfObjectPassingTest:", v412);
              if (v226 == 0x7FFFFFFFFFFFFFFFLL)
              {
                HAInitializeLogging();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Not setting category"));
                v227 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice peripheral:didUpdateCharacteristic:]", 3478, v227);
                v228 = (id)objc_claimAutoreleasedReturnValue();
                v229 = *v45;
                if (os_log_type_enabled(*v45, OS_LOG_TYPE_DEFAULT))
                {
                  v228 = objc_retainAutorelease(v228);
                  v230 = v229;
                  v231 = objc_msgSend(v228, "UTF8String");
                  LODWORD(buf) = 136446210;
                  *(_QWORD *)((char *)&buf + 4) = v231;
                  _os_log_impl(&dword_1DE311000, v230, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);

                }
              }
              else
              {
                objc_msgSend(v225, "objectAtIndex:", v226);
                v227 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v394, "value");
                v228 = (id)objc_claimAutoreleasedReturnValue();
                LODWORD(buf) = 0;
                objc_msgSend(v228, "getBytes:length:", &buf, 4);
                objc_msgSend(v227, "setCategory:", buf);
                +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
                v232 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v232, "device:didUpdateProperty:", v393, 256);

              }
            }
            goto LABEL_450;
          }
          if (v37 != 0x20000)
          {
            if (v37 == 0x10000000)
            {
              objc_msgSend(v394, "value");
              v114 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v114, "length"))
              {
                LODWORD(v405) = 0;
                objc_msgSend(v114, "getBytes:length:", &v405, 4);
                if ((v405 - 257) <= 0xFFFFFEFF)
                {
                  HAInitializeLogging();
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Hearing aid out of spec: %d"), v405);
                  v115 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice peripheral:didUpdateCharacteristic:]", 3622, v115);
                  v116 = (void *)objc_claimAutoreleasedReturnValue();
                  v117 = *v45;
                  if (os_log_type_enabled(*v45, OS_LOG_TYPE_DEFAULT))
                  {
                    v118 = objc_retainAutorelease(v116);
                    v119 = v117;
                    v120 = objc_msgSend(v118, "UTF8String");
                    LODWORD(buf) = 136446210;
                    *(_QWORD *)((char *)&buf + 4) = v120;
                    _os_log_impl(&dword_1DE311000, v119, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);

                  }
                  +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
                  v121 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v121, "setPairedHearingAids:", 0);

                  -[AXHearingAidDevice disconnectAndUnpair:](v393, "disconnectAndUnpair:", 1);
                }
                -[AXHearingAidDevice leftPeripheral](v393, "leftPeripheral");
                v122 = (void *)objc_claimAutoreleasedReturnValue();
                v123 = v122 == v392;

                if (v123)
                  -[AXHearingAidDevice setLeftLoadedProperties:](v393, "setLeftLoadedProperties:", -[AXHearingAidDevice leftLoadedProperties](v393, "leftLoadedProperties") | 0x10000000);
                else
                  -[AXHearingAidDevice setRightLoadedProperties:](v393, "setRightLoadedProperties:", -[AXHearingAidDevice rightLoadedProperties](v393, "rightLoadedProperties") | 0x10000000);
                +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
                v319 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v319, "device:didUpdateProperty:", v393, 0x10000000);

              }
            }
            goto LABEL_450;
          }
          -[AXHearingAidDevice rightPeripheral](v393, "rightPeripheral");
          v208 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v394, "value");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v52, "length"))
            goto LABEL_436;
          v209 = v208 == v392;
          LODWORD(buf) = 0;
          objc_msgSend(v52, "getBytes:length:", &buf, 4);
          v210 = buf;
          if (v209)
          {
            if (v210 != -[AXHearingAidDevice rightProgramVersion](v393, "rightProgramVersion"))
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v307 = (void *)objc_claimAutoreleasedReturnValue();
              -[AXHearingAidDevice setRightPrograms:](v393, "setRightPrograms:", v307);

              -[AXHearingAidDevice setCurrentRightProgram:](v393, "setCurrentRightProgram:", 0);
              -[AXHearingAidDevice setRightLoadedProperties:](v393, "setRightLoadedProperties:", -[AXHearingAidDevice rightLoadedProperties](v393, "rightLoadedProperties") & 0xFFFFFFFFFFFFFEFFLL);
              -[AXHearingAidDevice rightPropertiesLoadCount](v393, "rightPropertiesLoadCount");
              v308 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 256);
              v309 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v308, "removeObjectForKey:", v309);

              -[AXHearingAidDevice rightPeripheral](v393, "rightPeripheral");
              v214 = objc_claimAutoreleasedReturnValue();
              goto LABEL_326;
            }
          }
          else if (v210 != -[AXHearingAidDevice leftProgramVersion](v393, "leftProgramVersion"))
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v211 = (void *)objc_claimAutoreleasedReturnValue();
            -[AXHearingAidDevice setLeftPrograms:](v393, "setLeftPrograms:", v211);

            -[AXHearingAidDevice setCurrentLeftProgram:](v393, "setCurrentLeftProgram:", 0);
            -[AXHearingAidDevice setLeftLoadedProperties:](v393, "setLeftLoadedProperties:", -[AXHearingAidDevice leftLoadedProperties](v393, "leftLoadedProperties") & 0xFFFFFFFFFFFFFEFFLL);
            -[AXHearingAidDevice leftPropertiesLoadCount](v393, "leftPropertiesLoadCount");
            v212 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 256);
            v213 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v212, "removeObjectForKey:", v213);

            -[AXHearingAidDevice leftPeripheral](v393, "leftPeripheral");
            v214 = objc_claimAutoreleasedReturnValue();
LABEL_326:
            v310 = (void *)v214;
            -[AXHearingAidDevice loadProperties:forPeripheral:withRetryPeriod:](v393, "loadProperties:forPeripheral:withRetryPeriod:", 256, v214, 3.0);

          }
LABEL_436:

          goto LABEL_450;
        }
        if (v37 != 256)
        {
          if (v37 != 1024)
          {
            if (v37 == 4096)
            {
              LOBYTE(buf) = 0;
              -[AXHearingAidDevice peripheral:characteristicForProperty:](v393, "peripheral:characteristicForProperty:", v392, 4096);
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v96, "value");
              v97 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v97, "getBytes:length:", &buf, 1);

            }
            goto LABEL_450;
          }
          *(_QWORD *)&buf = 0;
          *((_QWORD *)&buf + 1) = &buf;
          v424 = 0x2020000000;
          LOBYTE(v425) = 0;
          objc_msgSend(v394, "value");
          v165 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v166 = objc_msgSend(v165, "bytes");

          -[AXHearingAidDevice rightPeripheral](v393, "rightPeripheral");
          v167 = (void *)objc_claimAutoreleasedReturnValue();

          if (v167 == v392)
            -[AXHearingAidDevice rightPrograms](v393, "rightPrograms");
          else
            -[AXHearingAidDevice leftPrograms](v393, "leftPrograms");
          v234 = (void *)objc_claimAutoreleasedReturnValue();
          v416[0] = MEMORY[0x1E0C809B0];
          v416[1] = 3221225472;
          v416[2] = __57__AXHearingAidDevice_peripheral_didUpdateCharacteristic___block_invoke_325;
          v416[3] = &unk_1EA8E8F88;
          v416[6] = v166;
          v417 = v167 == v392;
          v416[4] = v393;
          v416[5] = &buf;
          objc_msgSend(v234, "enumerateObjectsUsingBlock:", v416);
          if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
          {
            if (v167 == v392)
              -[AXHearingAidDevice setRightLoadedProperties:](v393, "setRightLoadedProperties:", -[AXHearingAidDevice rightLoadedProperties](v393, "rightLoadedProperties") | 0x400);
            else
              -[AXHearingAidDevice setLeftLoadedProperties:](v393, "setLeftLoadedProperties:", -[AXHearingAidDevice leftLoadedProperties](v393, "leftLoadedProperties") | 0x400);
            +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
            v266 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v266, "device:didUpdateProperty:", v393, 1024);
          }
          else
          {
            -[AXHearingAidDevice leftSelectedProgram](v393, "leftSelectedProgram");
            v259 = (void *)objc_claimAutoreleasedReturnValue();
            if (v259)
            {
              -[AXHearingAidDevice leftPeripheral](v393, "leftPeripheral");
              v260 = (void *)objc_claimAutoreleasedReturnValue();
              v261 = v260 == v392;

              if (v261)
              {
                -[AXHearingAidDevice leftSelectedProgram](v393, "leftSelectedProgram");
                v262 = (void *)objc_claimAutoreleasedReturnValue();
                -[AXHearingAidDevice setLeftSelectedProgram:](v393, "setLeftSelectedProgram:", v262);

              }
            }
            -[AXHearingAidDevice rightSelectedProgram](v393, "rightSelectedProgram");
            v263 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v263)
              goto LABEL_356;
            -[AXHearingAidDevice rightPeripheral](v393, "rightPeripheral");
            v264 = (void *)objc_claimAutoreleasedReturnValue();
            v265 = v264 == v392;

            if (!v265)
              goto LABEL_356;
            -[AXHearingAidDevice rightSelectedProgram](v393, "rightSelectedProgram");
            v266 = (void *)objc_claimAutoreleasedReturnValue();
            -[AXHearingAidDevice setRightSelectedProgram:](v393, "setRightSelectedProgram:", v266);
          }

LABEL_356:
          _Block_object_dispose(&buf, 8);
          goto LABEL_450;
        }
        objc_msgSend(v394, "value");
        v386 = (id)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v386, "length"))
        {
LABEL_449:

          goto LABEL_450;
        }
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v388 = (void *)objc_claimAutoreleasedReturnValue();
        v162 = (unsigned int *)objc_msgSend(objc_retainAutorelease(v386), "bytes");
        -[AXHearingAidDevice rightPeripheral](v393, "rightPeripheral");
        v383 = (void *)objc_claimAutoreleasedReturnValue();

        if (v383 == v392)
        {
          v163 = -[AXHearingAidDevice rightLoadedProperties](v393, "rightLoadedProperties");
          v164 = -[AXHearingAidDevice rightPresetBitmask](v393, "rightPresetBitmask");
          -[AXHearingAidDevice rightPrograms](v393, "rightPrograms");
        }
        else
        {
          v163 = -[AXHearingAidDevice leftLoadedProperties](v393, "leftLoadedProperties");
          v164 = -[AXHearingAidDevice leftPresetBitmask](v393, "leftPresetBitmask");
          -[AXHearingAidDevice leftPrograms](v393, "leftPrograms");
        }
        v382 = (void *)objc_claimAutoreleasedReturnValue();
        if (v164 == *v162 && objc_msgSend(v382, "count"))
        {
          if (v383 == v392)
            -[AXHearingAidDevice setRightLoadedProperties:](v393, "setRightLoadedProperties:", -[AXHearingAidDevice rightLoadedProperties](v393, "rightLoadedProperties") | 0x100);
          else
            -[AXHearingAidDevice setLeftLoadedProperties:](v393, "setLeftLoadedProperties:", -[AXHearingAidDevice leftLoadedProperties](v393, "leftLoadedProperties") | 0x100);
LABEL_448:

          goto LABEL_449;
        }
        if ((v163 & 0x100) != 0)
        {
          HAInitializeLogging();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Not reading presets, already reading"));
          v320 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice peripheral:didUpdateCharacteristic:]", 3349, v320);
          v321 = (void *)objc_claimAutoreleasedReturnValue();
          v322 = *v45;
          if (os_log_type_enabled(*v45, OS_LOG_TYPE_DEFAULT))
          {
            v323 = objc_retainAutorelease(v321);
            v324 = v322;
            v325 = objc_msgSend(v323, "UTF8String");
            LODWORD(buf) = 136446210;
            *(_QWORD *)((char *)&buf + 4) = v325;
            _os_log_impl(&dword_1DE311000, v324, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);

          }
          goto LABEL_448;
        }
        if (v383 == v392)
          -[AXHearingAidDevice rightPrograms](v393, "rightPrograms");
        else
          -[AXHearingAidDevice leftPrograms](v393, "leftPrograms");
        v385 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v394, "value");
        v344 = (void *)objc_claimAutoreleasedReturnValue();
        v345 = objc_msgSend(v344, "length");

        v346 = 8 * v345;
        v347 = v392;
        if (8 * v345 >= 1)
        {
          LODWORD(v348) = 0;
          if (v383 == v392)
            v349 = 4;
          else
            v349 = 2;
          v384 = v349;
          do
          {
            if (((*v162 >> v348) & 1) != 0)
            {
              v350 = objc_alloc_init(AXHearingAidMode);
              -[AXHearingAidMode setIndex:](v350, "setIndex:", v348);
              v418[0] = MEMORY[0x1E0C809B0];
              v418[1] = 3221225472;
              v418[2] = __57__AXHearingAidDevice_peripheral_didUpdateCharacteristic___block_invoke_4;
              v418[3] = &__block_descriptor_36_e33_B32__0__AXHearingAidMode_8Q16_B24l;
              v419 = v348;
              if (objc_msgSend(v385, "indexOfObjectPassingTest:", v418) == 0x7FFFFFFFFFFFFFFFLL)
                v351 = v384;
              else
                v351 = 6;
              -[AXHearingAidMode setEar:](v350, "setEar:", v351);
              v352 = (void *)MEMORY[0x1E0CB3940];
              hearingLocString(CFSTR("DefaultProgramName"));
              v353 = (void *)objc_claimAutoreleasedReturnValue();
              v354 = (void *)MEMORY[0x1E0CB37F0];
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[AXHearingAidMode index](v350, "index"));
              v355 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v354, "localizedStringFromNumber:numberStyle:", v355, 1);
              v356 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v352, "stringWithFormat:", v353, v356);
              v357 = (void *)objc_claimAutoreleasedReturnValue();
              -[AXHearingAidMode setName:](v350, "setName:", v357);

              objc_msgSend(v388, "addObject:", v350);
              v347 = v392;
            }
            v348 = (v348 + 1);
          }
          while (v346 > v348);
        }
        if (v383 == v347)
        {
          -[AXHearingAidDevice setRightPrograms:](v393, "setRightPrograms:", v388);
          -[AXHearingAidDevice setRightPresetBitmask:](v393, "setRightPresetBitmask:", *v162);
          -[AXHearingAidDevice setRightLoadedProperties:](v393, "setRightLoadedProperties:", -[AXHearingAidDevice rightLoadedProperties](v393, "rightLoadedProperties") | 0x100);
          if (objc_msgSend(v388, "count") == 1)
          {
            objc_msgSend(v388, "firstObject");
            v360 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v360, "setIsSelected:", 1);

            objc_msgSend(v388, "firstObject");
            v361 = (void *)objc_claimAutoreleasedReturnValue();
            -[AXHearingAidDevice setCurrentRightProgram:](v393, "setCurrentRightProgram:", v361);

            goto LABEL_438;
          }
        }
        else
        {
          -[AXHearingAidDevice setLeftPrograms:](v393, "setLeftPrograms:", v388);
          -[AXHearingAidDevice setLeftPresetBitmask:](v393, "setLeftPresetBitmask:", *v162);
          -[AXHearingAidDevice setLeftLoadedProperties:](v393, "setLeftLoadedProperties:", -[AXHearingAidDevice leftLoadedProperties](v393, "leftLoadedProperties") | 0x100);
          if (objc_msgSend(v388, "count") == 1)
          {
            objc_msgSend(v388, "firstObject");
            v358 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v358, "setIsSelected:", 1);

            objc_msgSend(v388, "firstObject");
            v359 = (void *)objc_claimAutoreleasedReturnValue();
            -[AXHearingAidDevice setCurrentLeftProgram:](v393, "setCurrentLeftProgram:", v359);

LABEL_438:
            if (objc_msgSend(v388, "count"))
            {
              objc_msgSend(v388, "firstObject");
              v369 = (void *)objc_claimAutoreleasedReturnValue();
              if (v383 == v392)
              {
                -[AXHearingAidDevice currentRightProgram](v393, "currentRightProgram");
                v373 = (void *)objc_claimAutoreleasedReturnValue();
                v374 = v373 == 0;

                if (v374)
                  -[AXHearingAidDevice setCurrentRightProgram:](v393, "setCurrentRightProgram:", v369);
                v372 = 4;
              }
              else
              {
                -[AXHearingAidDevice currentLeftProgram](v393, "currentLeftProgram");
                v370 = (void *)objc_claimAutoreleasedReturnValue();
                v371 = v370 == 0;

                if (v371)
                  -[AXHearingAidDevice setCurrentLeftProgram:](v393, "setCurrentLeftProgram:", v369);
                v372 = 2;
              }
              -[AXHearingAidDevice writeInt:toEar:forProperty:](v393, "writeInt:toEar:forProperty:", objc_msgSend(v369, "index"), v372, 4096);
              +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
              v375 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v375, "device:didUpdateProperty:", v393, 256);

            }
            goto LABEL_448;
          }
        }
        -[AXHearingAidDevice readProperty:fromPeripheral:](v393, "readProperty:fromPeripheral:", 1024, v392);
        goto LABEL_438;
      }
      if (v37 <= 31)
      {
        if (v37 != 4)
        {
          if (v37 != 8)
          {
            if (v37 == 16)
            {
              objc_msgSend(v394, "value");
              v71 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v72 = (void *)objc_msgSend(v71, "bytes");

              if (v72)
              {
                v73 = objc_alloc(MEMORY[0x1E0CB3940]);
                objc_msgSend(v394, "value");
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                v75 = (void *)objc_msgSend(v73, "initWithData:encoding:", v74, 4);

                objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v75, "stringByTrimmingCharactersInSet:", v76);
                v77 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(MEMORY[0x1E0CB3500], "controlCharacterSet");
                v78 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v77, "stringByTrimmingCharactersInSet:", v78);
                v72 = (void *)objc_claimAutoreleasedReturnValue();

              }
              -[AXHearingAidDevice leftPeripheral](v393, "leftPeripheral");
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              v80 = v79 == v392;

              if (v80)
              {
                -[AXHearingAidDevice setLeftUUID:](v393, "setLeftUUID:", v72);
                -[AXHearingAidDevice rightUUID](v393, "rightUUID");
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                -[AXHearingAidDevice setLeftLoadedProperties:](v393, "setLeftLoadedProperties:", -[AXHearingAidDevice leftLoadedProperties](v393, "leftLoadedProperties") | 0x10);
              }
              else
              {
                -[AXHearingAidDevice setRightUUID:](v393, "setRightUUID:", v72);
                -[AXHearingAidDevice leftUUID](v393, "leftUUID");
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                -[AXHearingAidDevice setRightLoadedProperties:](v393, "setRightLoadedProperties:", -[AXHearingAidDevice rightLoadedProperties](v393, "rightLoadedProperties") | 0x10);
              }
              if (objc_msgSend(v72, "length") && objc_msgSend(v81, "length"))
              {
                *(_QWORD *)&buf = 0;
                *((_QWORD *)&buf + 1) = &buf;
                v424 = 0x3032000000;
                v425 = __Block_byref_object_copy__0;
                v426 = __Block_byref_object_dispose__0;
                v427 = 0;
                +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
                v267 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v267, "hearingAidsForUUID:", v72);
                v268 = (void *)objc_claimAutoreleasedReturnValue();
                v421[0] = MEMORY[0x1E0C809B0];
                v421[1] = 3221225472;
                v421[2] = __57__AXHearingAidDevice_peripheral_didUpdateCharacteristic___block_invoke_2;
                v421[3] = &unk_1EA8E8F40;
                v421[4] = v393;
                v421[5] = &buf;
                objc_msgSend(v268, "enumerateObjectsUsingBlock:", v421);

                if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40)
                  && -[AXHearingAidDevice didLoadBasicProperties](v393, "didLoadBasicProperties"))
                {
                  -[AXHearingAidDevice mateWithDevice:](v393, "mateWithDevice:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
                }
                _Block_object_dispose(&buf, 8);

              }
              +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
              v269 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v269, "device:didUpdateProperty:", v393, 16);

            }
            goto LABEL_450;
          }
          objc_msgSend(v394, "value");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v52, "length"))
          {
            LOBYTE(buf) = 0;
            objc_msgSend(v52, "getBytes:length:", &buf, 1);
            if (buf == 1)
            {
              -[AXHearingAidDevice rightPeripheral](v393, "rightPeripheral");
              v147 = (void *)objc_claimAutoreleasedReturnValue();
              v148 = v147 == v392;

              if (!v148)
              {
                -[AXHearingAidDevice rightPeripheral](v393, "rightPeripheral");
                v149 = (void *)objc_claimAutoreleasedReturnValue();
                -[AXHearingAidDevice setRightPeripheral:](v393, "setRightPeripheral:", v392);
                -[AXHearingAidDevice setLeftPeripheral:](v393, "setLeftPeripheral:", v149);

              }
              -[AXHearingAidDevice setRightLoadedProperties:](v393, "setRightLoadedProperties:", -[AXHearingAidDevice rightLoadedProperties](v393, "rightLoadedProperties") | 8);
            }
            else
            {
              -[AXHearingAidDevice leftPeripheral](v393, "leftPeripheral");
              v274 = (void *)objc_claimAutoreleasedReturnValue();
              v275 = v274 == v392;

              if (!v275)
              {
                -[AXHearingAidDevice leftPeripheral](v393, "leftPeripheral");
                v276 = (void *)objc_claimAutoreleasedReturnValue();
                -[AXHearingAidDevice setLeftPeripheral:](v393, "setLeftPeripheral:", v392);
                -[AXHearingAidDevice setRightPeripheral:](v393, "setRightPeripheral:", v276);

              }
              -[AXHearingAidDevice setLeftLoadedProperties:](v393, "setLeftLoadedProperties:", -[AXHearingAidDevice leftLoadedProperties](v393, "leftLoadedProperties") | 8);
            }
            -[AXHearingAidDevice leftPeripheral](v393, "leftPeripheral");
            v277 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v277, "identifier");
            v278 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v278, "UUIDString");
            v279 = (void *)objc_claimAutoreleasedReturnValue();

            -[AXHearingAidDevice setLeftPeripheralUUID:](v393, "setLeftPeripheralUUID:", v279);
            -[AXHearingAidDevice rightPeripheral](v393, "rightPeripheral");
            v280 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v280, "identifier");
            v281 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v281, "UUIDString");
            v282 = (void *)objc_claimAutoreleasedReturnValue();

            -[AXHearingAidDevice setRightPeripheralUUID:](v393, "setRightPeripheralUUID:", v282);
            if (!-[AXHearingAidDevice didLoadBasicProperties](v393, "didLoadBasicProperties"))
              -[AXHearingAidDevice loadBasicProperties](v393, "loadBasicProperties");

          }
          goto LABEL_436;
        }
        objc_msgSend(v394, "value");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v52, "length"))
          goto LABEL_436;
        LOBYTE(buf) = 0;
        objc_msgSend(v52, "getBytes:length:", &buf, 1);
        LOBYTE(v4) = buf;
        -[AXHearingAidDevice leftPeripheral](v393, "leftPeripheral");
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        v144 = v143 == v392;

        if (v144)
        {
          -[AXHearingAidDevice setLeftBatteryLevel:](v393, "setLeftBatteryLevel:");
          -[AXHearingAidDevice setLeftLoadedProperties:](v393, "setLeftLoadedProperties:", -[AXHearingAidDevice leftLoadedProperties](v393, "leftLoadedProperties") | 4);
          -[AXHearingAidDevice leftBatteryLowDate](v393, "leftBatteryLowDate");
          v145 = (void *)objc_claimAutoreleasedReturnValue();
          if (v145)
            v311 = 0;
          else
            v311 = (double)v4 / 10.0 < 0.2;
          if (!v311)
            goto LABEL_333;
        }
        else
        {
          -[AXHearingAidDevice setRightBatteryLevel:](v393, "setRightBatteryLevel:");
          -[AXHearingAidDevice setRightLoadedProperties:](v393, "setRightLoadedProperties:", -[AXHearingAidDevice rightLoadedProperties](v393, "rightLoadedProperties") | 4);
          -[AXHearingAidDevice rightBatteryLowDate](v393, "rightBatteryLowDate");
          v145 = (void *)objc_claimAutoreleasedReturnValue();
          if (v145)
            v146 = 0;
          else
            v146 = (double)v4 / 10.0 < 0.2;
          if (!v146)
            goto LABEL_333;
        }
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -60.0);

LABEL_333:
        +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
        v312 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v312, "device:didUpdateProperty:", v393, 4);

        -[AXHearingAidDevice updateBatteryServiceForPeripheral:](v393, "updateBatteryServiceForPeripheral:", v392);
        goto LABEL_436;
      }
      if (v37 == 32)
      {
        objc_msgSend(v394, "value");
        v180 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v181 = (void *)objc_msgSend(v180, "bytes");

        if (v181)
        {
          v182 = objc_alloc(MEMORY[0x1E0CB3940]);
          objc_msgSend(v394, "value");
          v183 = (void *)objc_claimAutoreleasedReturnValue();
          v184 = (void *)objc_msgSend(v182, "initWithData:encoding:", v183, 4);

          objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
          v185 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v184, "stringByTrimmingCharactersInSet:", v185);
          v186 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3500], "controlCharacterSet");
          v187 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v186, "stringByTrimmingCharactersInSet:", v187);
          v181 = (void *)objc_claimAutoreleasedReturnValue();

        }
        -[AXHearingAidDevice leftPeripheral](v393, "leftPeripheral");
        v188 = (void *)objc_claimAutoreleasedReturnValue();
        v189 = v188 == v392;

        if (v189)
        {
          -[AXHearingAidDevice setRightUUID:](v393, "setRightUUID:", v181);
          -[AXHearingAidDevice leftUUID](v393, "leftUUID");
          v190 = (void *)objc_claimAutoreleasedReturnValue();
          -[AXHearingAidDevice setLeftLoadedProperties:](v393, "setLeftLoadedProperties:", -[AXHearingAidDevice leftLoadedProperties](v393, "leftLoadedProperties") | 0x20);
        }
        else
        {
          -[AXHearingAidDevice setLeftUUID:](v393, "setLeftUUID:", v181);
          -[AXHearingAidDevice rightUUID](v393, "rightUUID");
          v190 = (void *)objc_claimAutoreleasedReturnValue();
          -[AXHearingAidDevice setRightLoadedProperties:](v393, "setRightLoadedProperties:", -[AXHearingAidDevice rightLoadedProperties](v393, "rightLoadedProperties") | 0x20);
        }
        if (objc_msgSend(v181, "length") && objc_msgSend(v190, "length"))
        {
          *(_QWORD *)&buf = 0;
          *((_QWORD *)&buf + 1) = &buf;
          v424 = 0x3032000000;
          v425 = __Block_byref_object_copy__0;
          v426 = __Block_byref_object_dispose__0;
          v427 = 0;
          +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
          v270 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v270, "hearingAidsForUUID:", v181);
          v271 = (void *)objc_claimAutoreleasedReturnValue();
          v420[0] = MEMORY[0x1E0C809B0];
          v420[1] = 3221225472;
          v420[2] = __57__AXHearingAidDevice_peripheral_didUpdateCharacteristic___block_invoke_3;
          v420[3] = &unk_1EA8E8F40;
          v420[4] = v393;
          v420[5] = &buf;
          objc_msgSend(v271, "enumerateObjectsUsingBlock:", v420);

          if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40)
            && -[AXHearingAidDevice didLoadBasicProperties](v393, "didLoadBasicProperties"))
          {
            -[AXHearingAidDevice mateWithDevice:](v393, "mateWithDevice:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
          }
          _Block_object_dispose(&buf, 8);

        }
        +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
        v272 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v272, "device:didUpdateProperty:", v393, 32);

        goto LABEL_450;
      }
      if (v37 != 64)
      {
        if (v37 == 128)
        {
          objc_msgSend(v394, "value");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v52, "length"))
            goto LABEL_436;
          LOBYTE(buf) = 0;
          objc_msgSend(v52, "getBytes:length:", &buf, 1);
          LOBYTE(v4) = buf;
          -[AXHearingAidDevice leftPeripheral](v393, "leftPeripheral");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          v102 = (double)v4 / 255.0;
          if (v101 == v392)
          {
            v304 = v393->_leftStreamVolume != v102;

            if (v304)
            {
              v393->_leftStreamVolume = v102;
              -[AXHearingAidDevice setLeftLoadedProperties:](v393, "setLeftLoadedProperties:", -[AXHearingAidDevice leftLoadedProperties](v393, "leftLoadedProperties") | 0x80);
LABEL_370:
              +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
              v329 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v329, "device:didUpdateProperty:", v393, 128);

              goto LABEL_436;
            }
          }
          else
          {

          }
          -[AXHearingAidDevice rightPeripheral](v393, "rightPeripheral");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          if (v103 == v392)
          {
            v328 = v393->_rightStreamVolume != v102;

            if (v328)
            {
              v393->_rightStreamVolume = v102;
              -[AXHearingAidDevice setRightLoadedProperties:](v393, "setRightLoadedProperties:", -[AXHearingAidDevice rightLoadedProperties](v393, "rightLoadedProperties") | 0x80);
            }
          }
          else
          {

          }
          goto LABEL_370;
        }
LABEL_450:
        if (!v393->_finishedLoading
          && -[AXHearingAidDevice didLoadBasicProperties](v393, "didLoadBasicProperties")
          && (-[AXHearingAidDevice leftAvailable](v393, "leftAvailable")
           || -[AXHearingAidDevice rightAvailable](v393, "rightAvailable")))
        {
          v393->_finishedLoading = 1;
          if (!-[AXHearingAidDevice leftAvailable](v393, "leftAvailable")
            || !-[AXHearingAidDevice rightAvailable](v393, "rightAvailable"))
          {
            *(_QWORD *)&buf = 0;
            *((_QWORD *)&buf + 1) = &buf;
            v424 = 0x3032000000;
            v425 = __Block_byref_object_copy__0;
            v426 = __Block_byref_object_dispose__0;
            v427 = 0;
            if (-[AXHearingAidDevice leftAvailable](v393, "leftAvailable"))
              -[AXHearingAidDevice leftUUID](v393, "leftUUID");
            else
              -[AXHearingAidDevice rightUUID](v393, "rightUUID");
            v376 = (void *)objc_claimAutoreleasedReturnValue();
            +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
            v377 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v377, "hearingAidsForUUID:", v376);
            v378 = (void *)objc_claimAutoreleasedReturnValue();
            v395[0] = MEMORY[0x1E0C809B0];
            v395[1] = 3221225472;
            v395[2] = __57__AXHearingAidDevice_peripheral_didUpdateCharacteristic___block_invoke_339;
            v395[3] = &unk_1EA8E8F40;
            v395[4] = v393;
            v395[5] = &buf;
            objc_msgSend(v378, "enumerateObjectsUsingBlock:", v395);

            if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40)
              && -[AXHearingAidDevice didLoadBasicProperties](v393, "didLoadBasicProperties"))
            {
              -[AXHearingAidDevice mateWithDevice:](v393, "mateWithDevice:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
            }

            _Block_object_dispose(&buf, 8);
          }
          +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
          v379 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v379, "deviceDidFinishLoading:", v393);

          if (-[AXHearingAidDevice leftAvailable](v393, "leftAvailable"))
            v380 = 2;
          else
            v380 = 0;
          if (-[AXHearingAidDevice rightAvailable](v393, "rightAvailable"))
            v381 = v380 | 4;
          else
            v381 = v380;
          -[AXHearingAidDevice setAvailableEars:](v393, "setAvailableEars:", v381);
        }
        goto LABEL_470;
      }
      objc_msgSend(v394, "value");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v52, "length"))
        goto LABEL_436;
      LOBYTE(buf) = 0;
      objc_msgSend(v52, "getBytes:length:", &buf, 1);
      LOBYTE(v4) = buf;
      -[AXHearingAidDevice leftPeripheral](v393, "leftPeripheral");
      v191 = (void *)objc_claimAutoreleasedReturnValue();
      v192 = (double)v4 / 255.0;
      if (v191 != v392)
      {

LABEL_199:
        -[AXHearingAidDevice rightPeripheral](v393, "rightPeripheral");
        v193 = (void *)objc_claimAutoreleasedReturnValue();
        if (v193 == v392)
        {
          rightMicrophoneVolume = v393->_rightMicrophoneVolume;
          if (rightMicrophoneVolume == v192)
          {
            v367 = rightMicrophoneVolume == 0.0;

            if (!v367)
              goto LABEL_435;
          }
          else
          {

          }
          v393->_rightMicrophoneVolume = v192;
          -[AXHearingAidDevice setRightLoadedProperties:](v393, "setRightLoadedProperties:", -[AXHearingAidDevice rightLoadedProperties](v393, "rightLoadedProperties") | 0x40);
          goto LABEL_435;
        }

LABEL_435:
        +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
        v368 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v368, "device:didUpdateProperty:", v393, 64);

        goto LABEL_436;
      }
      leftMicrophoneVolume = v393->_leftMicrophoneVolume;
      if (leftMicrophoneVolume == v192)
      {
        v337 = leftMicrophoneVolume == 0.0;

        if (!v337)
          goto LABEL_199;
      }
      else
      {

      }
      v393->_leftMicrophoneVolume = v192;
      -[AXHearingAidDevice setLeftLoadedProperties:](v393, "setLeftLoadedProperties:", -[AXHearingAidDevice leftLoadedProperties](v393, "leftLoadedProperties") | 0x40);
      goto LABEL_435;
    }
    if (v37 > 0xFFFFFFFFFLL)
    {
      if (v37 > 0x7FFFFFFFFFLL)
      {
        if (v37 > 0x3FFFFFFFFFFLL)
        {
          if (v37 != 0x40000000000)
          {
            if (v37 == 0x80000000000)
            {
              objc_msgSend(v394, "value");
              v124 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v125 = (_DWORD *)objc_msgSend(v124, "bytes");

              objc_msgSend(v394, "value");
              v126 = (void *)objc_claimAutoreleasedReturnValue();
              v127 = objc_msgSend(v126, "length");

              if (8 * v127 >= 1)
              {
                LODWORD(v128) = 0;
                do
                {
                  if (((*v125 >> v128) & 1) != 0)
                  {
                    switch((_DWORD)v128)
                    {
                      case 3:
                        -[AXHearingAidDevice setRequiresBinauralStreaming:](v393, "setRequiresBinauralStreaming:", 1);
                        break;
                      case 2:
                        -[AXHearingAidDevice setRequiresCombinedVolumes:](v393, "setRequiresCombinedVolumes:", 1);
                        break;
                      case 1:
                        -[AXHearingAidDevice setRequiresCombinedPresets:](v393, "setRequiresCombinedPresets:", 1);
                        break;
                    }
                  }
                  v128 = (v128 + 1);
                }
                while (8 * v127 > v128);
              }
              if (-[AXHearingAidDevice requiresBinauralStreaming](v393, "requiresBinauralStreaming"))
              {
                +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
                v129 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v129, "shouldStreamToLeftAid"))
                {
                  +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
                  v130 = (void *)objc_claimAutoreleasedReturnValue();
                  v131 = objc_msgSend(v130, "shouldStreamToRightAid");

                }
                else
                {
                  v131 = 0;
                }

                +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
                v283 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v283, "setShouldStreamToLeftAid:", v131);

                +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
                v284 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v284, "setShouldStreamToRightAid:", v131);

              }
              -[AXHearingAidDevice leftPeripheral](v393, "leftPeripheral");
              v285 = (void *)objc_claimAutoreleasedReturnValue();
              v286 = v285 == v392;

              if (v286)
              {
                -[AXHearingAidDevice setLeftLoadedProperties:](v393, "setLeftLoadedProperties:", -[AXHearingAidDevice leftLoadedProperties](v393, "leftLoadedProperties") | 0x80000000000);
              }
              else
              {
                -[AXHearingAidDevice rightPeripheral](v393, "rightPeripheral");
                v287 = (void *)objc_claimAutoreleasedReturnValue();
                v288 = v287 == v392;

                if (v288)
                  -[AXHearingAidDevice setRightLoadedProperties:](v393, "setRightLoadedProperties:", -[AXHearingAidDevice rightLoadedProperties](v393, "rightLoadedProperties") | 0x80000000000);
              }
              +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
              v289 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v289, "device:didUpdateProperty:", v393, 0x80000000000);

            }
            goto LABEL_450;
          }
          if (objc_msgSend(MEMORY[0x1E0D2F990], "supportsLEA2")
            && -[AXHearingAidDevice readsWatchSupportCharacteristic](v393, "readsWatchSupportCharacteristic"))
          {
            objc_msgSend(v394, "value");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v52, "length"))
              goto LABEL_436;
            -[AXHearingAidDevice rightPeripheral](v393, "rightPeripheral");
            v215 = (void *)objc_claimAutoreleasedReturnValue();
            if (v215 == v392)
              v216 = 4;
            else
              v216 = 2;

            v217 = -[AXHearingAidDevice earsSupportingWatch](v393, "earsSupportingWatch");
            LODWORD(buf) = 0;
            objc_msgSend(v52, "getBytes:length:", &buf, 4);
            if ((_DWORD)buf)
              v218 = v217 | v216;
            else
              v218 = v217 & ~v216;
            -[AXHearingAidDevice setEarsSupportingWatch:](v393, "setEarsSupportingWatch:", v218);
            +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
            v219 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v219, "setEarsSupportingWatch:", -[AXHearingAidDevice earsSupportingWatch](v393, "earsSupportingWatch"));

            +[HANanoSettings sharedInstance](HANanoSettings, "sharedInstance");
            v220 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v220, "setEarsSupportingWatch:", -[AXHearingAidDevice earsSupportingWatch](v393, "earsSupportingWatch"));

          }
          -[AXHearingAidDevice leftPeripheral](v393, "leftPeripheral");
          v221 = (void *)objc_claimAutoreleasedReturnValue();
          v222 = v221 == v392;

          if (v222)
          {
            -[AXHearingAidDevice setLeftLoadedProperties:](v393, "setLeftLoadedProperties:", -[AXHearingAidDevice leftLoadedProperties](v393, "leftLoadedProperties") | 0x40000000000);
          }
          else
          {
            -[AXHearingAidDevice rightPeripheral](v393, "rightPeripheral");
            v223 = (void *)objc_claimAutoreleasedReturnValue();
            v224 = v223 == v392;

            if (v224)
              -[AXHearingAidDevice setRightLoadedProperties:](v393, "setRightLoadedProperties:", -[AXHearingAidDevice rightLoadedProperties](v393, "rightLoadedProperties") | 0x40000000000);
          }
          +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
          v273 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v273, "device:didUpdateProperty:", v393, 0x40000000000);

          goto LABEL_450;
        }
        if (v37 == 0x8000000000)
        {
          objc_msgSend(v394, "value");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v52, "length"))
          {
            LOBYTE(buf) = 0;
            objc_msgSend(v52, "getBytes:length:", &buf, 1);
            if ((_BYTE)buf)
            {
              v136 = 255.0 / (double)buf;
              v137 = (__int16)llroundf(v136);
              if (v137 <= 1)
                v137 = 1;
              if (v137 >= 0x14)
                v138 = 20;
              else
                v138 = v137;
              -[AXHearingAidDevice leftPeripheral](v393, "leftPeripheral");
              v139 = (void *)objc_claimAutoreleasedReturnValue();
              v140 = v139 == v392;

              if (v140)
              {
                -[AXHearingAidDevice setLeftMixedVolumeSteps:](v393, "setLeftMixedVolumeSteps:", v138);
                -[AXHearingAidDevice setLeftLoadedProperties:](v393, "setLeftLoadedProperties:", -[AXHearingAidDevice leftLoadedProperties](v393, "leftLoadedProperties") | 0x8000000000);
              }
              else
              {
                -[AXHearingAidDevice rightPeripheral](v393, "rightPeripheral");
                v141 = (void *)objc_claimAutoreleasedReturnValue();
                v142 = v141 == v392;

                if (v142)
                {
                  -[AXHearingAidDevice setRightMixedVolumeSteps:](v393, "setRightMixedVolumeSteps:", v138);
                  -[AXHearingAidDevice setRightLoadedProperties:](v393, "setRightLoadedProperties:", -[AXHearingAidDevice rightLoadedProperties](v393, "rightLoadedProperties") | 0x8000000000);
                }
              }
            }
            +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
            v334 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v334, "device:didUpdateProperty:", v393, 0x8000000000);

          }
          goto LABEL_436;
        }
        if (v37 == 0x10000000000)
        {
          if (objc_msgSend(MEMORY[0x1E0D2F990], "supportsLEA2"))
          {
            objc_msgSend(v394, "value");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v52, "length"))
              goto LABEL_436;
            -[AXHearingAidDevice rightPeripheral](v393, "rightPeripheral");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            if (v53 == v392)
              v54 = 4;
            else
              v54 = 2;

            v55 = -[AXHearingAidDevice availableInputEars](v393, "availableInputEars");
            LODWORD(buf) = 0;
            objc_msgSend(v52, "getBytes:length:", &buf, 4);
            if ((_DWORD)buf)
              v56 = v55 | v54;
            else
              v56 = v55 & ~v54;
            -[AXHearingAidDevice setAvailableInputEars:](v393, "setAvailableInputEars:", v56);
            +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "setAvailableInputEars:", -[AXHearingAidDevice availableInputEars](v393, "availableInputEars"));

            +[HANanoSettings sharedInstance](HANanoSettings, "sharedInstance");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "setAvailableInputEars:", -[AXHearingAidDevice availableInputEars](v393, "availableInputEars"));

            if ((_DWORD)buf)
            {
              -[AXHearingAidDevice rightPeripheral](v393, "rightPeripheral");
              v59 = (void *)objc_claimAutoreleasedReturnValue();

              if (v59)
                -[AXHearingAidDevice setRightLeaVersion:](v393, "setRightLeaVersion:", 2);
              else
                -[AXHearingAidDevice setLeftLeaVersion:](v393, "setLeftLeaVersion:", 2);
            }

          }
          -[AXHearingAidDevice leftPeripheral](v393, "leftPeripheral");
          v362 = (void *)objc_claimAutoreleasedReturnValue();
          v363 = v362 == v392;

          if (v363)
          {
            -[AXHearingAidDevice setLeftLoadedProperties:](v393, "setLeftLoadedProperties:", -[AXHearingAidDevice leftLoadedProperties](v393, "leftLoadedProperties") | 0x10000000000);
          }
          else
          {
            -[AXHearingAidDevice rightPeripheral](v393, "rightPeripheral");
            v364 = (void *)objc_claimAutoreleasedReturnValue();
            v365 = v364 == v392;

            if (v365)
              -[AXHearingAidDevice setRightLoadedProperties:](v393, "setRightLoadedProperties:", -[AXHearingAidDevice rightLoadedProperties](v393, "rightLoadedProperties") | 0x10000000000);
          }
          +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
          v366 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v366, "device:didUpdateProperty:", v393, 0x10000000000);

          goto LABEL_450;
        }
        goto LABEL_450;
      }
      if (v37 == 0x1000000000)
      {
        objc_msgSend(v394, "value");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v52, "length"))
        {
          LOBYTE(buf) = 0;
          objc_msgSend(v52, "getBytes:length:", &buf, 1);
          -[AXHearingAidDevice leftPeripheral](v393, "leftPeripheral");
          v168 = (void *)objc_claimAutoreleasedReturnValue();
          v169 = v168 == v392;

          if (v169)
          {
            v313 = buf;
            v314 = v393;
            v393->_leftBass = buf;
            if (v393->_rightBass != v313)
            {
              -[AXHearingAidDevice setRightBass:](v393, "setRightBass:", (char)v313);
              v314 = v393;
            }
            -[AXHearingAidDevice setLeftLoadedProperties:](v393, "setLeftLoadedProperties:", -[AXHearingAidDevice leftLoadedProperties](v314, "leftLoadedProperties") | 0x1000000000);
          }
          else
          {
            -[AXHearingAidDevice rightPeripheral](v393, "rightPeripheral");
            v170 = (void *)objc_claimAutoreleasedReturnValue();
            v171 = v170 == v392;

            if (v171)
            {
              v172 = buf;
              v173 = v393;
              v393->_rightBass = buf;
              if (v393->_leftBass != v172)
              {
                -[AXHearingAidDevice setLeftBass:](v393, "setLeftBass:", (char)v172);
                v173 = v393;
              }
              -[AXHearingAidDevice setRightLoadedProperties:](v393, "setRightLoadedProperties:", -[AXHearingAidDevice rightLoadedProperties](v173, "rightLoadedProperties") | 0x1000000000);
            }
          }
          +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
          v315 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v315, "device:didUpdateProperty:", v393, 0x1000000000);

        }
        goto LABEL_436;
      }
      if (v37 == 0x2000000000)
      {
        objc_msgSend(v394, "value");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v52, "length"))
        {
          LOBYTE(buf) = 0;
          objc_msgSend(v52, "getBytes:length:", &buf, 1);
          -[AXHearingAidDevice leftPeripheral](v393, "leftPeripheral");
          v174 = (void *)objc_claimAutoreleasedReturnValue();
          v175 = v174 == v392;

          if (v175)
          {
            v316 = buf;
            v317 = v393;
            v393->_leftTreble = buf;
            if (v393->_rightTreble != v316)
            {
              -[AXHearingAidDevice setRightTreble:](v393, "setRightTreble:", (char)v316);
              v317 = v393;
            }
            -[AXHearingAidDevice setLeftLoadedProperties:](v393, "setLeftLoadedProperties:", -[AXHearingAidDevice leftLoadedProperties](v317, "leftLoadedProperties") | 0x2000000000);
          }
          else
          {
            -[AXHearingAidDevice rightPeripheral](v393, "rightPeripheral");
            v176 = (void *)objc_claimAutoreleasedReturnValue();
            v177 = v176 == v392;

            if (v177)
            {
              v178 = buf;
              v179 = v393;
              v393->_rightTreble = buf;
              if (v393->_leftTreble != v178)
              {
                -[AXHearingAidDevice setLeftTreble:](v393, "setLeftTreble:", (char)v178);
                v179 = v393;
              }
              -[AXHearingAidDevice setRightLoadedProperties:](v393, "setRightLoadedProperties:", -[AXHearingAidDevice rightLoadedProperties](v179, "rightLoadedProperties") | 0x2000000000);
            }
          }
          +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
          v318 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v318, "device:didUpdateProperty:", v393, 0x2000000000);

        }
        goto LABEL_436;
      }
      if (v37 != 0x4000000000)
        goto LABEL_450;
      objc_msgSend(v394, "value");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v52, "length"))
        goto LABEL_436;
      LOBYTE(buf) = 0;
      objc_msgSend(v52, "getBytes:length:", &buf, 1);
      LOBYTE(v4) = buf;
      -[AXHearingAidDevice leftPeripheral](v393, "leftPeripheral");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      v99 = (double)v4 / 255.0;
      if (v98 == v392)
      {
        v303 = v393->_leftMixedVolume != v99;

        if (v303)
        {
          v393->_leftMixedVolume = v99;
          -[AXHearingAidDevice setLeftLoadedProperties:](v393, "setLeftLoadedProperties:", -[AXHearingAidDevice leftLoadedProperties](v393, "leftLoadedProperties") | 0x4000000000);
LABEL_366:
          +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
          v327 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v327, "device:didUpdateProperty:", v393, 0x4000000000);

          goto LABEL_436;
        }
      }
      else
      {

      }
      -[AXHearingAidDevice rightPeripheral](v393, "rightPeripheral");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      if (v100 == v392)
      {
        v326 = v393->_rightMixedVolume != v99;

        if (v326)
        {
          v393->_rightMixedVolume = v99;
          -[AXHearingAidDevice setRightLoadedProperties:](v393, "setRightLoadedProperties:", -[AXHearingAidDevice rightLoadedProperties](v393, "rightLoadedProperties") | 0x4000000000);
        }
      }
      else
      {

      }
      goto LABEL_366;
    }
    if (v37 > 0x1FFFFFFFFLL)
    {
      if (v37 == 0x200000000)
      {
        objc_msgSend(v394, "value");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v52, "length"))
        {
          LOBYTE(buf) = 0;
          objc_msgSend(v52, "getBytes:length:", &buf, 1);
          if ((_BYTE)buf)
          {
            v194 = 255.0 / (double)buf;
            v195 = (__int16)llroundf(v194);
            if (v195 <= 1)
              v195 = 1;
            if (v195 >= 0x14)
              v196 = 20;
            else
              v196 = v195;
            -[AXHearingAidDevice leftPeripheral](v393, "leftPeripheral");
            v197 = (void *)objc_claimAutoreleasedReturnValue();
            v198 = v197 == v392;

            if (v198)
            {
              -[AXHearingAidDevice setLeftStreamVolumeSteps:](v393, "setLeftStreamVolumeSteps:", v196);
              -[AXHearingAidDevice setLeftLoadedProperties:](v393, "setLeftLoadedProperties:", -[AXHearingAidDevice leftLoadedProperties](v393, "leftLoadedProperties") | 0x200000000);
            }
            else
            {
              -[AXHearingAidDevice rightPeripheral](v393, "rightPeripheral");
              v199 = (void *)objc_claimAutoreleasedReturnValue();
              v200 = v199 == v392;

              if (v200)
              {
                -[AXHearingAidDevice setRightStreamVolumeSteps:](v393, "setRightStreamVolumeSteps:", v196);
                -[AXHearingAidDevice setRightLoadedProperties:](v393, "setRightLoadedProperties:", -[AXHearingAidDevice rightLoadedProperties](v393, "rightLoadedProperties") | 0x200000000);
              }
            }
          }
          +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
          v335 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v335, "device:didUpdateProperty:", v393, 0x200000000);

        }
      }
      else
      {
        if (v37 != 0x400000000)
        {
          if (v37 == 0x800000000)
          {
            objc_msgSend(v394, "value");
            v104 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v105 = objc_msgSend(v104, "bytes");

            -[AXHearingAidDevice rightPeripheral](v393, "rightPeripheral");
            v106 = (void *)objc_claimAutoreleasedReturnValue();

            if (v106 == v392)
              -[AXHearingAidDevice rightPrograms](v393, "rightPrograms");
            else
              -[AXHearingAidDevice leftPrograms](v393, "leftPrograms");
            v233 = (void *)objc_claimAutoreleasedReturnValue();
            v414[0] = MEMORY[0x1E0C809B0];
            v414[1] = 3221225472;
            v414[2] = __57__AXHearingAidDevice_peripheral_didUpdateCharacteristic___block_invoke_2_326;
            v414[3] = &unk_1EA8E8FB0;
            v415 = v106 == v392;
            v414[4] = v393;
            v414[5] = v105;
            objc_msgSend(v233, "enumerateObjectsUsingBlock:", v414);
            if (v106 == v392)
              -[AXHearingAidDevice setRightLoadedProperties:](v393, "setRightLoadedProperties:", -[AXHearingAidDevice rightLoadedProperties](v393, "rightLoadedProperties") | 0x800000000);
            else
              -[AXHearingAidDevice setLeftLoadedProperties:](v393, "setLeftLoadedProperties:", -[AXHearingAidDevice leftLoadedProperties](v393, "leftLoadedProperties") | 0x800000000);
            +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
            v258 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v258, "device:didUpdateProperty:", v393, 0x800000000);

          }
          goto LABEL_450;
        }
        objc_msgSend(v394, "value");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v52, "length"))
        {
          LOBYTE(buf) = 0;
          objc_msgSend(v52, "getBytes:length:", &buf, 1);
          if ((_BYTE)buf)
          {
            v201 = 255.0 / (double)buf;
            v202 = (__int16)llroundf(v201);
            if (v202 <= 1)
              v202 = 1;
            if (v202 >= 0x14)
              v203 = 20;
            else
              v203 = v202;
            -[AXHearingAidDevice leftPeripheral](v393, "leftPeripheral");
            v204 = (void *)objc_claimAutoreleasedReturnValue();
            v205 = v204 == v392;

            if (v205)
            {
              -[AXHearingAidDevice setLeftSensitivitySteps:](v393, "setLeftSensitivitySteps:", v203);
              -[AXHearingAidDevice setLeftLoadedProperties:](v393, "setLeftLoadedProperties:", -[AXHearingAidDevice leftLoadedProperties](v393, "leftLoadedProperties") | 0x400000000);
            }
            else
            {
              -[AXHearingAidDevice rightPeripheral](v393, "rightPeripheral");
              v206 = (void *)objc_claimAutoreleasedReturnValue();
              v207 = v206 == v392;

              if (v207)
              {
                -[AXHearingAidDevice setRightSensitivitySteps:](v393, "setRightSensitivitySteps:", v203);
                -[AXHearingAidDevice setRightLoadedProperties:](v393, "setRightLoadedProperties:", -[AXHearingAidDevice rightLoadedProperties](v393, "rightLoadedProperties") | 0x400000000);
              }
            }
          }
          +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
          v336 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v336, "device:didUpdateProperty:", v393, 0x400000000);

        }
      }
      goto LABEL_436;
    }
    if (v37 != 0x40000000)
    {
      if (v37 != 0x80000000)
      {
        if (v37 == 0x100000000)
        {
          objc_msgSend(v394, "value");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v52, "length"))
          {
            LOBYTE(buf) = 0;
            objc_msgSend(v52, "getBytes:length:", &buf, 1);
            if ((_BYTE)buf)
            {
              v82 = 255.0 / (double)buf;
              v83 = (__int16)llroundf(v82);
              if (v83 <= 1)
                v83 = 1;
              if (v83 >= 0x14)
                v84 = 20;
              else
                v84 = v83;
              -[AXHearingAidDevice leftPeripheral](v393, "leftPeripheral");
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              v86 = v85 == v392;

              if (v86)
              {
                -[AXHearingAidDevice setLeftMicrophoneVolumeSteps:](v393, "setLeftMicrophoneVolumeSteps:", v84);
                -[AXHearingAidDevice setLeftLoadedProperties:](v393, "setLeftLoadedProperties:", -[AXHearingAidDevice leftLoadedProperties](v393, "leftLoadedProperties") | 0x100000000);
              }
              else
              {
                -[AXHearingAidDevice rightPeripheral](v393, "rightPeripheral");
                v87 = (void *)objc_claimAutoreleasedReturnValue();
                v88 = v87 == v392;

                if (v88)
                {
                  -[AXHearingAidDevice setRightMicrophoneVolumeSteps:](v393, "setRightMicrophoneVolumeSteps:", v84);
                  -[AXHearingAidDevice setRightLoadedProperties:](v393, "setRightLoadedProperties:", -[AXHearingAidDevice rightLoadedProperties](v393, "rightLoadedProperties") | 0x100000000);
                }
              }
            }
            +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
            v333 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v333, "device:didUpdateProperty:", v393, 0x100000000);

          }
          goto LABEL_436;
        }
        goto LABEL_450;
      }
      objc_msgSend(v394, "value");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v52, "length"))
        goto LABEL_436;
      LOBYTE(buf) = 0;
      objc_msgSend(v52, "getBytes:length:", &buf, 1);
      LOBYTE(v4) = buf;
      -[AXHearingAidDevice leftPeripheral](v393, "leftPeripheral");
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      v160 = (double)v4 / 255.0;
      if (v159 == v392)
      {
        v305 = v393->_leftSensitivity != v160;

        if (v305)
        {
          v393->_leftSensitivity = v160;
          -[AXHearingAidDevice setLeftLoadedProperties:](v393, "setLeftLoadedProperties:", -[AXHearingAidDevice leftLoadedProperties](v393, "leftLoadedProperties") | 0x80000000);
LABEL_374:
          +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
          v331 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v331, "device:didUpdateProperty:", v393, 0x80000000);

          goto LABEL_436;
        }
      }
      else
      {

      }
      -[AXHearingAidDevice rightPeripheral](v393, "rightPeripheral");
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      if (v161 == v392)
      {
        v330 = v393->_rightSensitivity != v160;

        if (v330)
        {
          v393->_rightSensitivity = v160;
          -[AXHearingAidDevice setRightLoadedProperties:](v393, "setRightLoadedProperties:", -[AXHearingAidDevice rightLoadedProperties](v393, "rightLoadedProperties") | 0x80000000);
        }
      }
      else
      {

      }
      goto LABEL_374;
    }
    objc_msgSend(v394, "value");
    v150 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v151 = (_DWORD *)objc_msgSend(v150, "bytes");

    objc_msgSend(v394, "value");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    v153 = objc_msgSend(v152, "length");

    if (8 * v153 >= 1)
    {
      LODWORD(v154) = 0;
      do
      {
        if (((*v151 >> v154) & 1) != 0)
        {
          switch((_DWORD)v154)
          {
            case 3:
              -[AXHearingAidDevice setSupportsBinauralStreaming:](v393, "setSupportsBinauralStreaming:", 0);
              break;
            case 2:
              -[AXHearingAidDevice setSupportsCombinedVolumes:](v393, "setSupportsCombinedVolumes:", 0);
              break;
            case 1:
              -[AXHearingAidDevice setSupportsCombinedPresets:](v393, "setSupportsCombinedPresets:", 0);
              break;
          }
        }
        v154 = (v154 + 1);
      }
      while (8 * v153 > v154);
    }
    if (-[AXHearingAidDevice supportsBinauralStreaming](v393, "supportsBinauralStreaming"))
    {
LABEL_311:
      -[AXHearingAidDevice leftPeripheral](v393, "leftPeripheral");
      v298 = (void *)objc_claimAutoreleasedReturnValue();
      v299 = v298 == v392;

      if (v299)
      {
        -[AXHearingAidDevice setLeftLoadedProperties:](v393, "setLeftLoadedProperties:", -[AXHearingAidDevice leftLoadedProperties](v393, "leftLoadedProperties") | 0x40000000);
      }
      else
      {
        -[AXHearingAidDevice rightPeripheral](v393, "rightPeripheral");
        v300 = (void *)objc_claimAutoreleasedReturnValue();
        v301 = v300 == v392;

        if (v301)
          -[AXHearingAidDevice setRightLoadedProperties:](v393, "setRightLoadedProperties:", -[AXHearingAidDevice rightLoadedProperties](v393, "rightLoadedProperties") | 0x40000000);
      }
      +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
      v302 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v302, "device:didUpdateProperty:", v393, 0x40000000);

      goto LABEL_450;
    }
    +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v155, "shouldStreamToLeftAid"))
    {
      +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      v157 = objc_msgSend(v156, "shouldStreamToRightAid");

      if (!v157)
      {
LABEL_168:
        +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
        v158 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v158, "shouldStreamToLeftAid") & 1) != 0)
          -[AXHearingAidDevice rightPeripheral](v393, "rightPeripheral");
        else
          -[AXHearingAidDevice leftPeripheral](v393, "leftPeripheral");
        v290 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v290, "hasTag:", CFSTR("DisableLEA")) & 1) == 0)
        {
          HAInitializeLogging();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Resetting connection to disable streaming %@"), v290);
          v291 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice peripheral:didUpdateCharacteristic:]", 3685, v291);
          v292 = (void *)objc_claimAutoreleasedReturnValue();
          v293 = *v45;
          if (os_log_type_enabled(*v45, OS_LOG_TYPE_DEFAULT))
          {
            v294 = objc_retainAutorelease(v292);
            v295 = v293;
            v296 = objc_msgSend(v294, "UTF8String");
            LODWORD(buf) = 136446210;
            *(_QWORD *)((char *)&buf + 4) = v296;
            _os_log_impl(&dword_1DE311000, v295, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);

          }
          +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
          v297 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v297, "resetConnectionToPeripheral:", v290);

        }
        goto LABEL_311;
      }
      +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v155, "setShouldStreamToLeftAid:", 0);
    }

    goto LABEL_168;
  }
LABEL_471:

}

void __57__AXHearingAidDevice_peripheral_didUpdateCharacteristic___block_invoke(uint64_t a1, int a2)
{
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
  id v15;

  if (propertyContainsProperty(0xFF800105C4, *(_QWORD *)(a1 + 40))
    && (objc_msgSend(*(id *)(a1 + 32), "isPaired") & 1) == 0
    && a2)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "leftAvailable"))
    {
      objc_msgSend(*(id *)(a1 + 32), "leftPeripheral");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        objc_msgSend(*(id *)(a1 + 32), "leftPeripheral");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "identifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "UUIDString");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 32), "setLeftPeripheralUUID:", v8);
      }
    }
    if (objc_msgSend(*(id *)(a1 + 32), "rightAvailable"))
    {
      objc_msgSend(*(id *)(a1 + 32), "rightPeripheral");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(*(id *)(a1 + 32), "rightPeripheral");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "UUIDString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 32), "setRightPeripheralUUID:", v13);
      }
    }
    +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "persistentRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setPairedHearingAids:", v14);

  }
}

void __57__AXHearingAidDevice_peripheral_didUpdateCharacteristic___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  id v8;

  v7 = a2;
  if (*(id *)(a1 + 32) != v7)
  {
    v8 = v7;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v7 = v8;
    *a4 = 1;
  }

}

void __57__AXHearingAidDevice_peripheral_didUpdateCharacteristic___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  id v8;

  v7 = a2;
  if (*(id *)(a1 + 32) != v7)
  {
    v8 = v7;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v7 = v8;
    *a4 = 1;
  }

}

BOOL __57__AXHearingAidDevice_peripheral_didUpdateCharacteristic___block_invoke_4(uint64_t a1, void *a2)
{
  return *(_DWORD *)(a1 + 32) == objc_msgSend(a2, "index");
}

void __57__AXHearingAidDevice_peripheral_didUpdateCharacteristic___block_invoke_325(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (**(_DWORD **)(a1 + 48) == objc_msgSend(v4, "index"))
  {
    objc_msgSend(v4, "setIsSelected:", 1);
    v3 = *(void **)(a1 + 32);
    if (*(_BYTE *)(a1 + 56))
      objc_msgSend(v3, "setRightSelectedProgram:", v4);
    else
      objc_msgSend(v3, "setLeftSelectedProgram:", v4);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else if ((objc_msgSend(v4, "isStreamOrMixingStream") & 1) == 0)
  {
    objc_msgSend(v4, "setIsSelected:", 0);
  }

}

void __57__AXHearingAidDevice_peripheral_didUpdateCharacteristic___block_invoke_2_326(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (**(_DWORD **)(a1 + 40) == objc_msgSend(v4, "index"))
  {
    objc_msgSend(v4, "setIsSelected:", 1);
    v3 = *(void **)(a1 + 32);
    if (*(_BYTE *)(a1 + 48))
      objc_msgSend(v3, "setRightSelectedStreamingProgram:", v4);
    else
      objc_msgSend(v3, "setLeftSelectedStreamingProgram:", v4);
  }
  else if (objc_msgSend(v4, "isStreamOrMixingStream"))
  {
    objc_msgSend(v4, "setIsSelected:", 0);
  }

}

BOOL __57__AXHearingAidDevice_peripheral_didUpdateCharacteristic___block_invoke_3_327(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "index") == *(unsigned __int8 *)(a1 + 32);
}

void __57__AXHearingAidDevice_peripheral_didUpdateCharacteristic___block_invoke_331(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  uint64_t v14;
  id v15;
  id v16;

  v16 = a2;
  v3 = (void *)MEMORY[0x1E0CB3940];
  hearingLocString(CFSTR("DefaultProgramName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB37F0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", objc_msgSend(v16, "index"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringFromNumber:numberStyle:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40)
    && objc_msgSend(v16, "index") == *(unsigned __int8 *)(a1 + 48))
  {
    v9 = *(_QWORD *)(a1 + 32);
LABEL_12:
    v14 = *(_QWORD *)(v9 + 8);
    v15 = v16;
    v10 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v15;
    goto LABEL_13;
  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(v16, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqualToString:", v8) & 1) != 0)
    {
      v11 = objc_msgSend(v16, "syncAttempts");

      if (v11 >= 3)
        goto LABEL_14;
LABEL_11:
      v9 = *(_QWORD *)(a1 + 40);
      goto LABEL_12;
    }
    objc_msgSend(v16, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "length"))
    {

LABEL_13:
      goto LABEL_14;
    }
    v13 = objc_msgSend(v16, "syncAttempts");

    if (v13 <= 2)
      goto LABEL_11;
  }
LABEL_14:

}

void __57__AXHearingAidDevice_peripheral_didUpdateCharacteristic___block_invoke_2_332(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  v6 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "index");
  if (v6 == objc_msgSend(v10, "index"))
  {
    objc_msgSend(v10, "name");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    *a4 = 1;
  }

}

void __57__AXHearingAidDevice_peripheral_didUpdateCharacteristic___block_invoke_339(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  id v8;

  v7 = a2;
  if (*(id *)(a1 + 32) != v7)
  {
    v8 = v7;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v7 = v8;
    *a4 = 1;
  }

}

- (BOOL)readsWatchSupportCharacteristic
{
  return objc_msgSend(MEMORY[0x1E0D2F990], "isInternalInstall") ^ 1;
}

- (void)peripheral:(id)a3 didInvalidateServices:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ peripheral %@, services %@"), self, v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice peripheral:didInvalidateServices:]", 4160, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_retainAutorelease(v9);
    v12 = v10;
    *(_DWORD *)buf = 136446210;
    v14 = objc_msgSend(v11, "UTF8String");
    _os_log_impl(&dword_1DE311000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
}

- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  int v26;
  uint64_t v27;
  uint8_t buf[4];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = -[AXHearingAidDevice peripheral:propertyForCharacteristic:](self, "peripheral:propertyForCharacteristic:", v8, v10);
  if (v9)
  {
    -[AXHearingAidDevice readValueForCharacteristic:fromPeripheral:](self, "readValueForCharacteristic:fromPeripheral:", v10, v8);
    HAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error writing characteristic value (%@): %@"), v10, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice peripheral:didWriteValueForCharacteristic:error:]", 4187, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_retainAutorelease(v13);
      v16 = v14;
      *(_DWORD *)buf = 136446210;
      v29 = objc_msgSend(v15, "UTF8String");
      _os_log_impl(&dword_1DE311000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
  }
  else
  {
    HAInitializeLogging();
    v17 = (void *)MEMORY[0x1E0CB3940];
    hearingPropertyDescription(v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "value");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "stringWithFormat:", CFSTR("%@ - %@"), v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice peripheral:didWriteValueForCharacteristic:error:]", 4168, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v23 = objc_retainAutorelease(v21);
      v24 = v22;
      *(_DWORD *)buf = 136446210;
      v29 = objc_msgSend(v23, "UTF8String");
      _os_log_impl(&dword_1DE311000, v24, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    if (v11 == 4096)
    {
      -[AXHearingAidDevice readProperty:fromPeripheral:](self, "readProperty:fromPeripheral:", 4096, v8);
      -[AXHearingAidDevice readProperty:fromPeripheral:](self, "readProperty:fromPeripheral:", 0x2000, v8);
      -[AXHearingAidDevice readProperty:fromPeripheral:](self, "readProperty:fromPeripheral:", 0x4000, v8);
    }
  }
  -[AXHearingAidDevice leftPeripheral](self, "leftPeripheral");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v8, "isEqual:", v25);

  v27 = 480;
  if (v26)
    v27 = 472;
  *(Class *)((char *)&self->super.isa + v27) = (Class)(*(uint64_t *)((char *)&self->super.isa + v27) & ~v11);

}

- (void)pairingDidCompleteForPeripheral:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  AXHearingAidDevice *v9;

  v4 = a3;
  +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__AXHearingAidDevice_pairingDidCompleteForPeripheral___block_invoke;
  v7[3] = &unk_1EA8E8510;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v5, "checkPeripheralPaired:withCompletion:", v6, v7);

}

void __54__AXHearingAidDevice_pairingDidCompleteForPeripheral___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  os_log_t *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
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
  uint8_t buf[4];
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Did pair with result %d - %@"), a2, *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice pairingDidCompleteForPeripheral:]_block_invoke", 4206, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (os_log_t *)MEMORY[0x1E0D2F928];
  v7 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_retainAutorelease(v5);
    v9 = v7;
    *(_DWORD *)buf = 136446210;
    v36 = objc_msgSend(v8, "UTF8String");
    _os_log_impl(&dword_1DE311000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  v10 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v10) = objc_msgSend(v10, "containsPeripheralWithUUID:", v12);

  if ((v10 & 1) == 0)
  {
    v13 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_FAULT))
      __54__AXHearingAidDevice_pairingDidCompleteForPeripheral___block_invoke_cold_1((uint64_t *)(a1 + 32), v13);
  }
  v14 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "leftPeripheral");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14 != v15)
  {
    v16 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "rightPeripheral");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16 == v17)
      objc_msgSend(*(id *)(a1 + 40), "setRightPeripheralPaired:", a2);
    if ((_DWORD)a2)
      goto LABEL_10;
LABEL_22:
    objc_msgSend(*(id *)(a1 + 40), "disconnectAndUnpair:", 0);
    +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setPairedHearingAids:", 0);
    goto LABEL_23;
  }
  objc_msgSend(*(id *)(a1 + 40), "setLeftPeripheralPaired:", a2);
  if (!(_DWORD)a2)
    goto LABEL_22;
LABEL_10:
  if ((objc_msgSend(*(id *)(a1 + 32), "hasTag:", CFSTR("IsMFiAuthenticated_CertClass0B")) & 1) == 0)
  {
    v19 = *(_QWORD *)(a1 + 32);
    v18 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("9FBF120D-6301-42D9-8C58-25E699A21DBD"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "peripheral:characteristicForUUID:", v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
      objc_msgSend(*(id *)(a1 + 40), "readValueForCharacteristic:fromPeripheral:", v21, *(_QWORD *)(a1 + 32));

  }
  objc_msgSend(*(id *)(a1 + 40), "loadProperties:forPeripheral:withRetryPeriod:", objc_msgSend(*(id *)(a1 + 40), "requiredProperties"), *(_QWORD *)(a1 + 32), 0.0);
  if (objc_msgSend(*(id *)(a1 + 40), "leftAvailable"))
  {
    objc_msgSend(*(id *)(a1 + 40), "leftPeripheral");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(*(id *)(a1 + 40), "leftPeripheral");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "identifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "UUIDString");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 40), "setLeftPeripheralUUID:", v26);
    }
  }
  if (objc_msgSend(*(id *)(a1 + 40), "rightAvailable"))
  {
    objc_msgSend(*(id *)(a1 + 40), "rightPeripheral");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "identifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(*(id *)(a1 + 40), "rightPeripheral");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "identifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "UUIDString");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 40), "setRightPeripheralUUID:", v31);
    }
  }
  +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "persistentRepresentation");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setPairedHearingAids:", v33);

LABEL_23:
  +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "device:didUpdateProperty:", *(_QWORD *)(a1 + 40), 603979776);

}

- (void)peripheralDidUnpair:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Did Unpair: %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice peripheralDidUnpair:]", 4262, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_retainAutorelease(v6);
    v9 = v7;
    *(_DWORD *)buf = 136446210;
    v11 = objc_msgSend(v8, "UTF8String");
    _os_log_impl(&dword_1DE311000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  -[AXHearingAidDevice disconnectAndUnpair:](self, "disconnectAndUnpair:", 1);
}

- (void)checkPairingStatusWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (v4)
  {
    +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXHearingAidDevice leftPeripheral](self, "leftPeripheral");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __55__AXHearingAidDevice_checkPairingStatusWithCompletion___block_invoke;
    v7[3] = &unk_1EA8E9070;
    v7[4] = self;
    v8 = v4;
    objc_msgSend(v5, "checkPeripheralPaired:withCompletion:", v6, v7);

  }
}

void __55__AXHearingAidDevice_checkPairingStatusWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  char v2;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  char v9;

  v2 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setLeftPeripheralPaired:", a2);
  +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "rightPeripheral");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__AXHearingAidDevice_checkPairingStatusWithCompletion___block_invoke_2;
  v7[3] = &unk_1EA8E9048;
  v6 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v9 = v2;
  v8 = v6;
  objc_msgSend(v4, "checkPeripheralPaired:withCompletion:", v5, v7);

}

uint64_t __55__AXHearingAidDevice_checkPairingStatusWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  int v5;

  objc_msgSend(*(id *)(a1 + 32), "setRightPeripheralPaired:", a2);
  objc_msgSend(*(id *)(a1 + 32), "leftUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "rightUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "length");

  }
  if ((objc_msgSend(*(id *)(a1 + 32), "leftAvailable") & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "rightAvailable"))
  {
    v5 = *(unsigned __int8 *)(a1 + 48);
    if (v5 == objc_msgSend(*(id *)(a1 + 32), "leftAvailable"))
      objc_msgSend(*(id *)(a1 + 32), "rightAvailable");
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (NSString)description
{
  _BOOL4 v3;
  const __CFString *v4;
  _BOOL4 v5;
  const __CFString *v6;
  _BOOL4 v7;
  const __CFString *v8;
  const __CFString *v9;
  _BOOL4 v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  void *v23;
  void *v24;

  v24 = (void *)MEMORY[0x1E0CB3940];
  -[AXHearingAidDevice model](self, "model");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[AXHearingAidDevice didLoadBasicProperties](self, "didLoadBasicProperties");
  v4 = CFSTR("NOT LOADED");
  if (v3)
    v4 = CFSTR("LOADED");
  v22 = v4;
  v5 = -[AXHearingAidDevice isPaired](self, "isPaired");
  v6 = CFSTR("NOT PAIRED");
  if (v5)
    v6 = CFSTR("PAIRED");
  v21 = v6;
  v7 = -[AXHearingAidDevice isPersistent](self, "isPersistent");
  v8 = CFSTR("NOT PERSISTENT");
  if (v7)
    v8 = CFSTR("PERSISTENT");
  v20 = v8;
  if (-[AXHearingAidDevice isConnected](self, "isConnected"))
    v9 = CFSTR("Available");
  else
    v9 = CFSTR("NOT Available");
  v10 = -[AXHearingAidDevice leftAvailable](self, "leftAvailable");
  v11 = -[AXHearingAidDevice rightAvailable](self, "rightAvailable");
  -[AXHearingAidDevice leftUUID](self, "leftUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXHearingAidDevice rightUUID](self, "rightUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXHearingAidDevice leftPeripheralUUID](self, "leftPeripheralUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXHearingAidDevice rightPeripheralUUID](self, "rightPeripheralUUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXHearingAidDevice leftPeripheral](self, "leftPeripheral");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXHearingAidDevice rightPeripheral](self, "rightPeripheral");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringWithFormat:", CFSTR("AXHearingAidDevice:%p:[%@] [%@, %@, %@, %@] L:%d R:%d,  l-uuid: %@ r-uuid: %@ - [%@, %@] [%@, %@]"), self, v23, v22, v21, v20, v9, v10, v11, v12, v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v18;
}

- (id)descriptionForCBPeripheralState:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return CFSTR("Unknown");
  else
    return off_1EA8E9090[a3];
}

- (BOOL)addPeripheral:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  BOOL v15;
  void *v16;
  int v17;
  void *v18;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Adding periperal %@ - %@"), v4, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice addPeripheral:]", 4317, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_retainAutorelease(v6);
    v9 = v7;
    *(_DWORD *)buf = 136446210;
    v21 = objc_msgSend(v8, "UTF8String");
    _os_log_impl(&dword_1DE311000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  objc_msgSend(v4, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v15 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v4, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXHearingAidDevice leftPeripheralUUID](self, "leftPeripheralUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqualToString:", v13);

  if (v14)
  {
    -[AXHearingAidDevice setLeftPeripheral:](self, "setLeftPeripheral:", v4);
    -[AXHearingAidDevice setLeftPeripheralUUID:](self, "setLeftPeripheralUUID:", v12);
  }
  else
  {
    -[AXHearingAidDevice rightPeripheralUUID](self, "rightPeripheralUUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v12, "isEqualToString:", v16);

    if (!v17)
    {
      v15 = 0;
      goto LABEL_11;
    }
    -[AXHearingAidDevice setRightPeripheral:](self, "setRightPeripheral:", v4);
    -[AXHearingAidDevice setRightPeripheralUUID:](self, "setRightPeripheralUUID:", v12);
  }
  objc_msgSend(v4, "setDelegate:", self);
  v15 = 1;
LABEL_11:
  objc_msgSend(v4, "name");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "length"))
    -[AXHearingAidDevice setName:](self, "setName:", v18);

LABEL_14:
  return v15;
}

- (BOOL)addPeripheral:(id)a3 asLeft:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Adding periperal %@ - %@"), v6, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHearingAidDevice addPeripheral:asLeft:]", 4350, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_retainAutorelease(v8);
    v11 = v9;
    *(_DWORD *)buf = 136446210;
    v18 = objc_msgSend(v10, "UTF8String");
    _os_log_impl(&dword_1DE311000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  objc_msgSend(v6, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v6, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[AXHearingAidDevice setLeftPeripheral:](self, "setLeftPeripheral:", v6);
      -[AXHearingAidDevice setLeftPeripheralUUID:](self, "setLeftPeripheralUUID:", v14);
    }
    else
    {
      -[AXHearingAidDevice setRightPeripheral:](self, "setRightPeripheral:", v6);
      -[AXHearingAidDevice setRightPeripheralUUID:](self, "setRightPeripheralUUID:", v14);
    }
    objc_msgSend(v6, "setDelegate:", self);
    objc_msgSend(v6, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "length"))
      -[AXHearingAidDevice setName:](self, "setName:", v15);

  }
  return v12 != 0;
}

- (id)persistentRepresentation
{
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
  id v38;
  _QWORD v40[2];
  _QWORD v41[3];

  v41[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E08];
  -[AXHearingAidDevice name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_1EA8FFA40, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v5;
  -[AXHearingAidDevice manufacturer](self, "manufacturer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v6;
  objc_msgSend(&unk_1EA8FFA58, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v7;
  -[AXHearingAidDevice model](self, "model");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[AXHearingAidDevice availableEars](self, "availableEars"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v4, CFSTR("ax_hearing_device_name_key"), v9, CFSTR("ax_hearing_device_man_model_key"), v10, CFSTR("ax_hearing_device_lr_key"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[AXHearingAidDevice leftAvailable](self, "leftAvailable"))
  {
    -[AXHearingAidDevice leftPeripheral](self, "leftPeripheral");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[AXHearingAidDevice leftPeripheral](self, "leftPeripheral");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "UUIDString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = (void *)MEMORY[0x1E0C99E08];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "dictionaryWithObjectsAndKeys:", v18, CFSTR("ax_hearing_device_isleft_key"), 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      -[AXHearingAidDevice leftUUID](self, "leftUUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        -[AXHearingAidDevice leftUUID](self, "leftUUID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKey:", v21, CFSTR("ax_hearing_device_hiid_key"));

      }
      -[AXHearingAidDevice rightUUID](self, "rightUUID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        -[AXHearingAidDevice rightUUID](self, "rightUUID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKey:", v23, CFSTR("ax_hearing_device_hiidother_key"));

      }
      if (v16)
        objc_msgSend(v19, "setObject:forKey:", v16, CFSTR("ax_hearing_device_uuid_key"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[AXHearingAidDevice leftLeaVersion](self, "leftLeaVersion"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKey:", v24, CFSTR("ax_hearing_device_lea_version_key"));

      objc_msgSend(v11, "setObject:forKey:", v19, CFSTR("ax_hearing_device_left_peripheral_key"));
    }
  }
  if (-[AXHearingAidDevice rightAvailable](self, "rightAvailable"))
  {
    -[AXHearingAidDevice rightPeripheral](self, "rightPeripheral");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "identifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      -[AXHearingAidDevice rightPeripheral](self, "rightPeripheral");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "identifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "UUIDString");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = (void *)MEMORY[0x1E0C99E08];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "dictionaryWithObjectsAndKeys:", v31, CFSTR("ax_hearing_device_isleft_key"), 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      -[AXHearingAidDevice rightUUID](self, "rightUUID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
      {
        -[AXHearingAidDevice rightUUID](self, "rightUUID");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setObject:forKey:", v34, CFSTR("ax_hearing_device_hiid_key"));

      }
      -[AXHearingAidDevice leftUUID](self, "leftUUID");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v35)
      {
        -[AXHearingAidDevice leftUUID](self, "leftUUID");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setObject:forKey:", v36, CFSTR("ax_hearing_device_hiidother_key"));

      }
      if (v29)
        objc_msgSend(v32, "setObject:forKey:", v29, CFSTR("ax_hearing_device_uuid_key"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[AXHearingAidDevice rightLeaVersion](self, "rightLeaVersion"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setObject:forKey:", v37, CFSTR("ax_hearing_device_lea_version_key"));

      objc_msgSend(v11, "setObject:forKey:", v32, CFSTR("ax_hearing_device_right_peripheral_key"));
    }
  }
  if ((unint64_t)objc_msgSend(v11, "count") >= 4)
    v38 = v11;
  else
    v38 = 0;

  return v38;
}

- (BOOL)isFakeDevice
{
  return 0;
}

- (id)serviceUUID
{
  return (id)objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("7D74F4BD-C74A-4431-862C-CCE884371592"));
}

- (unint64_t)requiredProperties
{
  return 0xD07D42105FCLL;
}

- (unint64_t)deviceType
{
  return 1;
}

- (NSString)leftUUID
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (void)setLeftUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (NSString)rightUUID
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

- (void)setRightUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (NSMutableArray)manufacturer
{
  return (NSMutableArray *)objc_getProperty(self, a2, 200, 1);
}

- (void)setManufacturer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (NSMutableArray)model
{
  return (NSMutableArray *)objc_getProperty(self, a2, 208, 1);
}

- (void)setModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (NSString)leftFirmwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 216, 1);
}

- (void)setLeftFirmwareVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (NSString)rightFirmwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 224, 1);
}

- (void)setRightFirmwareVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (NSString)leftHardwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (void)setLeftHardwareVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (NSString)rightHardwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (void)setRightHardwareVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (double)rightBatteryLevel
{
  return self->rightBatteryLevel;
}

- (void)setRightBatteryLevel:(double)a3
{
  self->rightBatteryLevel = a3;
}

- (double)leftBatteryLevel
{
  return self->leftBatteryLevel;
}

- (void)setLeftBatteryLevel:(double)a3
{
  self->leftBatteryLevel = a3;
}

- (NSArray)rightPrograms
{
  return (NSArray *)objc_getProperty(self, a2, 264, 1);
}

- (void)setRightPrograms:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 264);
}

- (NSArray)leftPrograms
{
  return (NSArray *)objc_getProperty(self, a2, 272, 1);
}

- (void)setLeftPrograms:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 272);
}

- (AXHearingAidMode)currentRightProgram
{
  return (AXHearingAidMode *)objc_getProperty(self, a2, 280, 1);
}

- (void)setCurrentRightProgram:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 280);
}

- (AXHearingAidMode)currentLeftProgram
{
  return (AXHearingAidMode *)objc_getProperty(self, a2, 288, 1);
}

- (void)setCurrentLeftProgram:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 288);
}

- (AXHearingAidMode)currentLeftStreamingProgram
{
  return (AXHearingAidMode *)objc_getProperty(self, a2, 296, 1);
}

- (void)setCurrentLeftStreamingProgram:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 296);
}

- (AXHearingAidMode)currentRightStreamingProgram
{
  return (AXHearingAidMode *)objc_getProperty(self, a2, 304, 1);
}

- (void)setCurrentRightStreamingProgram:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 304);
}

- (CBPeripheral)leftPeripheral
{
  return (CBPeripheral *)objc_getProperty(self, a2, 312, 1);
}

- (void)setLeftPeripheral:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 312);
}

- (CBPeripheral)rightPeripheral
{
  return (CBPeripheral *)objc_getProperty(self, a2, 320, 1);
}

- (void)setRightPeripheral:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 320);
}

- (BOOL)isPaired
{
  return self->isPaired;
}

- (void)setIsPaired:(BOOL)a3
{
  self->isPaired = a3;
}

- (BOOL)isConnecting
{
  return self->isConnecting;
}

- (void)setIsConnecting:(BOOL)a3
{
  self->isConnecting = a3;
}

- (BOOL)isPersistent
{
  return self->isPersistent;
}

- (void)setIsPersistent:(BOOL)a3
{
  self->isPersistent = a3;
}

- (int)availableEars
{
  return self->_availableEars;
}

- (void)setAvailableEars:(int)a3
{
  self->_availableEars = a3;
}

- (unint64_t)leftLeaVersion
{
  return self->leftLeaVersion;
}

- (void)setLeftLeaVersion:(unint64_t)a3
{
  self->leftLeaVersion = a3;
}

- (unint64_t)rightLeaVersion
{
  return self->rightLeaVersion;
}

- (void)setRightLeaVersion:(unint64_t)a3
{
  self->rightLeaVersion = a3;
}

- (AXHearingAidMode)leftSelectedProgram
{
  return self->_leftSelectedProgram;
}

- (void)setLeftSelectedProgram:(id)a3
{
  objc_storeStrong((id *)&self->_leftSelectedProgram, a3);
}

- (AXHearingAidMode)rightSelectedProgram
{
  return self->_rightSelectedProgram;
}

- (void)setRightSelectedProgram:(id)a3
{
  objc_storeStrong((id *)&self->_rightSelectedProgram, a3);
}

- (AXHearingAidMode)leftSelectedStreamingProgram
{
  return self->_leftSelectedStreamingProgram;
}

- (void)setLeftSelectedStreamingProgram:(id)a3
{
  objc_storeStrong((id *)&self->_leftSelectedStreamingProgram, a3);
}

- (AXHearingAidMode)rightSelectedStreamingProgram
{
  return self->_rightSelectedStreamingProgram;
}

- (void)setRightSelectedStreamingProgram:(id)a3
{
  objc_storeStrong((id *)&self->_rightSelectedStreamingProgram, a3);
}

- (double)rightMicrophoneVolume
{
  return self->_rightMicrophoneVolume;
}

- (double)leftMicrophoneVolume
{
  return self->_leftMicrophoneVolume;
}

- (double)rightStreamVolume
{
  return self->_rightStreamVolume;
}

- (double)leftStreamVolume
{
  return self->_leftStreamVolume;
}

- (double)leftSensitivity
{
  return self->_leftSensitivity;
}

- (double)rightSensitivity
{
  return self->_rightSensitivity;
}

- (char)leftTreble
{
  return self->_leftTreble;
}

- (void)setLeftTreble:(char)a3
{
  self->_leftTreble = a3;
}

- (char)rightTreble
{
  return self->_rightTreble;
}

- (void)setRightTreble:(char)a3
{
  self->_rightTreble = a3;
}

- (char)leftBass
{
  return self->_leftBass;
}

- (void)setLeftBass:(char)a3
{
  self->_leftBass = a3;
}

- (char)rightBass
{
  return self->_rightBass;
}

- (void)setRightBass:(char)a3
{
  self->_rightBass = a3;
}

- (double)leftMixedVolume
{
  return self->_leftMixedVolume;
}

- (void)setLeftMixedVolume:(double)a3
{
  self->_leftMixedVolume = a3;
}

- (double)rightMixedVolume
{
  return self->_rightMixedVolume;
}

- (void)setRightMixedVolume:(double)a3
{
  self->_rightMixedVolume = a3;
}

- (BOOL)keepInSync
{
  return self->_keepInSync;
}

- (unint64_t)leftLoadedProperties
{
  return self->leftLoadedProperties;
}

- (void)setLeftLoadedProperties:(unint64_t)a3
{
  self->leftLoadedProperties = a3;
}

- (unint64_t)rightLoadedProperties
{
  return self->rightLoadedProperties;
}

- (void)setRightLoadedProperties:(unint64_t)a3
{
  self->rightLoadedProperties = a3;
}

- (NSMutableDictionary)leftPropertiesLoadCount
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 424, 1);
}

- (void)setLeftPropertiesLoadCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 424);
}

- (NSMutableDictionary)rightPropertiesLoadCount
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 432, 1);
}

- (void)setRightPropertiesLoadCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 432);
}

- (NSString)leftPeripheralUUID
{
  return (NSString *)objc_getProperty(self, a2, 440, 1);
}

- (void)setLeftPeripheralUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 440);
}

- (NSString)rightPeripheralUUID
{
  return (NSString *)objc_getProperty(self, a2, 448, 1);
}

- (void)setRightPeripheralUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 448);
}

- (unint64_t)leftWriteRequestProperties
{
  return self->leftWriteRequestProperties;
}

- (void)setLeftWriteRequestProperties:(unint64_t)a3
{
  self->leftWriteRequestProperties = a3;
}

- (unint64_t)rightWriteRequestProperties
{
  return self->rightWriteRequestProperties;
}

- (void)setRightWriteRequestProperties:(unint64_t)a3
{
  self->rightWriteRequestProperties = a3;
}

- (unsigned)leftProgramVersion
{
  return self->leftProgramVersion;
}

- (void)setLeftProgramVersion:(unsigned int)a3
{
  self->leftProgramVersion = a3;
}

- (unsigned)rightProgramVersion
{
  return self->rightProgramVersion;
}

- (void)setRightProgramVersion:(unsigned int)a3
{
  self->rightProgramVersion = a3;
}

- (unsigned)leftPresetBitmask
{
  return self->_leftPresetBitmask;
}

- (void)setLeftPresetBitmask:(unsigned int)a3
{
  self->_leftPresetBitmask = a3;
}

- (unsigned)rightPresetBitmask
{
  return self->_rightPresetBitmask;
}

- (void)setRightPresetBitmask:(unsigned int)a3
{
  self->_rightPresetBitmask = a3;
}

- (signed)leftMicrophoneVolumeSteps
{
  return self->_leftMicrophoneVolumeSteps;
}

- (void)setLeftMicrophoneVolumeSteps:(signed __int16)a3
{
  self->_leftMicrophoneVolumeSteps = a3;
}

- (signed)rightMicrophoneVolumeSteps
{
  return self->_rightMicrophoneVolumeSteps;
}

- (void)setRightMicrophoneVolumeSteps:(signed __int16)a3
{
  self->_rightMicrophoneVolumeSteps = a3;
}

- (signed)leftStreamVolumeSteps
{
  return self->_leftStreamVolumeSteps;
}

- (void)setLeftStreamVolumeSteps:(signed __int16)a3
{
  self->_leftStreamVolumeSteps = a3;
}

- (signed)rightStreamVolumeSteps
{
  return self->_rightStreamVolumeSteps;
}

- (void)setRightStreamVolumeSteps:(signed __int16)a3
{
  self->_rightStreamVolumeSteps = a3;
}

- (signed)leftSensitivitySteps
{
  return self->_leftSensitivitySteps;
}

- (void)setLeftSensitivitySteps:(signed __int16)a3
{
  self->_leftSensitivitySteps = a3;
}

- (signed)rightSensitivitySteps
{
  return self->_rightSensitivitySteps;
}

- (void)setRightSensitivitySteps:(signed __int16)a3
{
  self->_rightSensitivitySteps = a3;
}

- (signed)leftMixedVolumeSteps
{
  return self->_leftMixedVolumeSteps;
}

- (void)setLeftMixedVolumeSteps:(signed __int16)a3
{
  self->_leftMixedVolumeSteps = a3;
}

- (signed)rightMixedVolumeSteps
{
  return self->_rightMixedVolumeSteps;
}

- (void)setRightMixedVolumeSteps:(signed __int16)a3
{
  self->_rightMixedVolumeSteps = a3;
}

- (BOOL)supportsBinauralStreaming
{
  return self->_supportsBinauralStreaming;
}

- (void)setSupportsBinauralStreaming:(BOOL)a3
{
  self->_supportsBinauralStreaming = a3;
}

- (BOOL)supportsCombinedPresets
{
  return self->_supportsCombinedPresets;
}

- (void)setSupportsCombinedPresets:(BOOL)a3
{
  self->_supportsCombinedPresets = a3;
}

- (BOOL)supportsCombinedVolumes
{
  return self->_supportsCombinedVolumes;
}

- (void)setSupportsCombinedVolumes:(BOOL)a3
{
  self->_supportsCombinedVolumes = a3;
}

- (BOOL)requiresBinauralStreaming
{
  return self->_requiresBinauralStreaming;
}

- (void)setRequiresBinauralStreaming:(BOOL)a3
{
  self->_requiresBinauralStreaming = a3;
}

- (BOOL)requiresCombinedPresets
{
  return self->_requiresCombinedPresets;
}

- (void)setRequiresCombinedPresets:(BOOL)a3
{
  self->_requiresCombinedPresets = a3;
}

- (BOOL)requiresCombinedVolumes
{
  return self->_requiresCombinedVolumes;
}

- (void)setRequiresCombinedVolumes:(BOOL)a3
{
  self->_requiresCombinedVolumes = a3;
}

- (unint64_t)leftWriteResponseProperties
{
  return self->_leftWriteResponseProperties;
}

- (void)setLeftWriteResponseProperties:(unint64_t)a3
{
  self->_leftWriteResponseProperties = a3;
}

- (unint64_t)rightWriteResponseProperties
{
  return self->_rightWriteResponseProperties;
}

- (void)setRightWriteResponseProperties:(unint64_t)a3
{
  self->_rightWriteResponseProperties = a3;
}

- (NSDate)leftBatteryLowDate
{
  return (NSDate *)objc_getProperty(self, a2, 488, 1);
}

- (void)setLeftBatteryLowDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 488);
}

- (NSDate)rightBatteryLowDate
{
  return (NSDate *)objc_getProperty(self, a2, 496, 1);
}

- (void)setRightBatteryLowDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 496);
}

- (int)availableInputEars
{
  return self->_availableInputEars;
}

- (void)setAvailableInputEars:(int)a3
{
  self->_availableInputEars = a3;
}

- (int)earsSupportingWatch
{
  return self->_earsSupportingWatch;
}

- (void)setEarsSupportingWatch:(int)a3
{
  self->_earsSupportingWatch = a3;
}

- (BOOL)leftPeripheralPaired
{
  return self->_leftPeripheralPaired;
}

- (void)setLeftPeripheralPaired:(BOOL)a3
{
  self->_leftPeripheralPaired = a3;
}

- (BOOL)rightPeripheralPaired
{
  return self->_rightPeripheralPaired;
}

- (void)setRightPeripheralPaired:(BOOL)a3
{
  self->_rightPeripheralPaired = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightBatteryLowDate, 0);
  objc_storeStrong((id *)&self->_leftBatteryLowDate, 0);
  objc_storeStrong((id *)&self->rightPeripheralUUID, 0);
  objc_storeStrong((id *)&self->leftPeripheralUUID, 0);
  objc_storeStrong((id *)&self->rightPropertiesLoadCount, 0);
  objc_storeStrong((id *)&self->leftPropertiesLoadCount, 0);
  objc_storeStrong((id *)&self->_rightSelectedStreamingProgram, 0);
  objc_storeStrong((id *)&self->_leftSelectedStreamingProgram, 0);
  objc_storeStrong((id *)&self->_rightSelectedProgram, 0);
  objc_storeStrong((id *)&self->_leftSelectedProgram, 0);
  objc_storeStrong((id *)&self->rightPeripheral, 0);
  objc_storeStrong((id *)&self->leftPeripheral, 0);
  objc_storeStrong((id *)&self->currentRightStreamingProgram, 0);
  objc_storeStrong((id *)&self->currentLeftStreamingProgram, 0);
  objc_storeStrong((id *)&self->currentLeftProgram, 0);
  objc_storeStrong((id *)&self->currentRightProgram, 0);
  objc_storeStrong((id *)&self->leftPrograms, 0);
  objc_storeStrong((id *)&self->rightPrograms, 0);
  objc_storeStrong((id *)&self->rightHardwareVersion, 0);
  objc_storeStrong((id *)&self->leftHardwareVersion, 0);
  objc_storeStrong((id *)&self->rightFirmwareVersion, 0);
  objc_storeStrong((id *)&self->leftFirmwareVersion, 0);
  objc_storeStrong((id *)&self->model, 0);
  objc_storeStrong((id *)&self->manufacturer, 0);
  objc_storeStrong((id *)&self->name, 0);
  objc_storeStrong((id *)&self->rightUUID, 0);
  objc_storeStrong((id *)&self->leftUUID, 0);
  objc_storeStrong((id *)&self->_rightPowerSourceDictionary, 0);
  objc_storeStrong((id *)&self->_leftPowerSouceDictionary, 0);
  objc_storeStrong((id *)&self->_propertyWriteTimer, 0);
}

- (void)valueForProperty:(void *)a1 .cold.1(void *a1, uint64_t a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  hearingPropertyDescription(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543618;
  v6 = v4;
  v7 = 2048;
  v8 = a2;
  _os_log_fault_impl(&dword_1DE311000, v3, OS_LOG_TYPE_FAULT, "%{public}@ (%ld) is unhandled resulting in infinite recursion.", (uint8_t *)&v5, 0x16u);

}

void __54__AXHearingAidDevice_pairingDidCompleteForPeripheral___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_fault_impl(&dword_1DE311000, a2, OS_LOG_TYPE_FAULT, "Device paired but doesn't contain peripheral %@", (uint8_t *)&v3, 0xCu);
}

@end
