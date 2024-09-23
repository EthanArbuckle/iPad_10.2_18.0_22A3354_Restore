@implementation HMIPersonsModel

- (HMIPersonsModel)initWithPersonsModel:(id)a3 homeUUID:(id)a4 sourceUUID:(id)a5 externalLibrary:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  HMIPersonsModel *v14;
  HMIPersonsModel *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HMIPersonsModel;
  v14 = -[HMIPersonsModel init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_visionPersonsModel, a3);
    objc_storeStrong((id *)&v15->_homeUUID, a4);
    objc_storeStrong((id *)&v15->_sourceUUID, a5);
    v15->_externalLibrary = a6;
  }

  return v15;
}

- (HMIPersonsModelSummary)summary
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  HMIPersonsModelSummary *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  HMIPersonsModelSummary *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  HMIPersonsModel *v17;
  id v18;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIPersonsModel visionPersonsModel](self, "visionPersonsModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "personUniqueIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __26__HMIPersonsModel_summary__block_invoke;
  v16 = &unk_24DBEC378;
  v17 = self;
  v18 = v3;
  v6 = v3;
  objc_msgSend(v5, "na_each:", &v13);

  v7 = [HMIPersonsModelSummary alloc];
  -[HMIPersonsModel sourceUUID](self, "sourceUUID", v13, v14, v15, v16, v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMIPersonsModel isExternalLibrary](self, "isExternalLibrary");
  v10 = (void *)objc_msgSend(v6, "copy");
  v11 = -[HMIPersonsModelSummary initWithSourceUUID:externalLibrary:faceCountsByPerson:](v7, "initWithSourceUUID:externalLibrary:faceCountsByPerson:", v8, v9, v10);

  return v11;
}

void __26__HMIPersonsModel_summary__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "visionPersonsModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v6, "faceCountForPersonWithUniqueIdentifier:", v5));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, v5);
}

- (VNPersonsModel)visionPersonsModel
{
  return (VNPersonsModel *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)homeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)sourceUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)isExternalLibrary
{
  return self->_externalLibrary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceUUID, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_storeStrong((id *)&self->_visionPersonsModel, 0);
}

@end
