@implementation HMDUnpublishedResidentStatus

- (HMDUnpublishedResidentStatus)initWithVersion:(id)a3 generationID:(id)a4 preferredResidentsList:(id)a5 selectionInfo:(id)a6 connectionType:(unint64_t)a7 locationRawValue:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  HMDUnpublishedResidentStatus *v18;
  HMDUnpublishedResidentStatus *v19;
  id v22;
  objc_super v23;

  v22 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)HMDUnpublishedResidentStatus;
  v18 = -[HMDUnpublishedResidentStatus init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_swVersion, a3);
    objc_storeStrong((id *)&v19->_generationID, a4);
    objc_storeStrong((id *)&v19->_preferredResidentsList, a5);
    objc_storeStrong((id *)&v19->_selectionInfo, a6);
    v19->_networkConnectionType = a7;
    objc_storeStrong((id *)&v19->_locationRawValue, a8);
  }

  return v19;
}

- (NSDictionary)channelRecordPayload
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
  _QWORD v34[2];
  _QWORD v35[2];
  const __CFString *v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCED8];
  v36 = CFSTR("residentStatusSwVersionKey");
  -[HMDUnpublishedResidentStatus swVersion](self, "swVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "versionString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDUnpublishedResidentStatus generationID](self, "generationID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HMDUnpublishedResidentStatus generationID](self, "generationID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("residentStatusGenerationIDKey"));

  }
  -[HMDUnpublishedResidentStatus preferredResidentsList](self, "preferredResidentsList");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[HMDUnpublishedResidentStatus preferredResidentsList](self, "preferredResidentsList");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "residentIDSIdentifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "na_map:", &__block_literal_global_97125);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v34[0] = CFSTR("PRL.ck.rii");
    v34[1] = CFSTR("PRL.ck.mt");
    v35[0] = v14;
    -[HMDUnpublishedResidentStatus preferredResidentsList](self, "preferredResidentsList");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "modifiedTimestamp");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v16;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, CFSTR("RS.ck.prl"));

  }
  -[HMDUnpublishedResidentStatus selectionInfo](self, "selectionInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "currentModeType");

  if ((v19 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    -[HMDUnpublishedResidentStatus selectionInfo](self, "selectionInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "selectionTimestamp");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v21, CFSTR("RSI.ck.st"));

    v22 = (void *)MEMORY[0x24BDD16E0];
    -[HMDUnpublishedResidentStatus selectionInfo](self, "selectionInfo");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "numberWithUnsignedInteger:", objc_msgSend(v23, "currentModeType"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v24, CFSTR("RSI.ck.m"));

    -[HMDUnpublishedResidentStatus selectionInfo](self, "selectionInfo");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "preferredResidentIDSIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      -[HMDUnpublishedResidentStatus selectionInfo](self, "selectionInfo");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "preferredResidentIDSIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "hmf_bytesAsData");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v29, CFSTR("RSI.ck.prii"));

    }
  }
  -[HMDUnpublishedResidentStatus locationRawValue](self, "locationRawValue");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v30, CFSTR("RS.ck.rl"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDUnpublishedResidentStatus networkConnectionType](self, "networkConnectionType"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v31, CFSTR("RS.ck.nw"));

  v32 = (void *)objc_msgSend(v7, "copy");
  return (NSDictionary *)v32;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDUnpublishedResidentStatus swVersion](self, "swVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUnpublishedResidentStatus generationID](self, "generationID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDUnpublishedResidentStatus networkConnectionType](self, "networkConnectionType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUnpublishedResidentStatus locationRawValue](self, "locationRawValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUnpublishedResidentStatus preferredResidentsList](self, "preferredResidentsList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("swVer %@ generationID %@ connectionType %@ location %@ preferredResidentsList %@"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (HMDHomeKitVersion)swVersion
{
  return self->_swVersion;
}

- (NSUUID)generationID
{
  return self->_generationID;
}

- (HMDPreferredResidentsList)preferredResidentsList
{
  return self->_preferredResidentsList;
}

- (NSNumber)locationRawValue
{
  return self->_locationRawValue;
}

- (HMDResidentSelectionInfo)selectionInfo
{
  return self->_selectionInfo;
}

- (unint64_t)networkConnectionType
{
  return self->_networkConnectionType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionInfo, 0);
  objc_storeStrong((id *)&self->_locationRawValue, 0);
  objc_storeStrong((id *)&self->_preferredResidentsList, 0);
  objc_storeStrong((id *)&self->_generationID, 0);
  objc_storeStrong((id *)&self->_swVersion, 0);
}

uint64_t __52__HMDUnpublishedResidentStatus_channelRecordPayload__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hmf_bytesAsData");
}

@end
