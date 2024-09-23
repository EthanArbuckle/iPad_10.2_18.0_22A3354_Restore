@implementation HMIHomePersonDataSourceDisk

- (void)fetchSettingsWithCompletion:(id)a3
{
  void (**v3)(id, void *, _QWORD);
  void *v4;
  HMIMutableHomePersonManagerSettings *v5;

  v3 = (void (**)(id, void *, _QWORD))a3;
  v5 = objc_alloc_init(HMIMutableHomePersonManagerSettings);
  -[HMIHomePersonManagerSettings setFaceClassificationEnabled:](v5, "setFaceClassificationEnabled:", 1);
  v4 = (void *)-[HMIMutableHomePersonManagerSettings copy](v5, "copy");
  v3[2](v3, v4, 0);

}

- (void)addFaceCrops:(id)a3 completion:(id)a4
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x24BDD1540];
  v6 = a4;
  objc_msgSend(v5, "hmfErrorWithCode:", 5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);

}

- (void)addPersonFaceCrops:(id)a3 completion:(id)a4
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x24BDD1540];
  v6 = a4;
  objc_msgSend(v5, "hmfErrorWithCode:", 5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);

}

- (void)addPersons:(id)a3 completion:(id)a4
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x24BDD1540];
  v6 = a4;
  objc_msgSend(v5, "hmfErrorWithCode:", 5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);

}

- (void)fetchAllUnassociatedFaceCropsWithCompletion:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x24BDD1540];
  v5 = a3;
  objc_msgSend(v4, "hmfErrorWithCode:", 5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a3 + 2))(v5, 0, v6);

}

- (void)removeFaceCropsWithUUIDs:(id)a3 completion:(id)a4
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x24BDD1540];
  v6 = a4;
  objc_msgSend(v5, "hmfErrorWithCode:", 5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);

}

- (void)removeFaceprintsWithUUIDs:(id)a3 completion:(id)a4
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x24BDD1540];
  v6 = a4;
  objc_msgSend(v5, "hmfErrorWithCode:", 5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);

}

- (void)removePersonsWithUUIDs:(id)a3 completion:(id)a4
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x24BDD1540];
  v6 = a4;
  objc_msgSend(v5, "hmfErrorWithCode:", 5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);

}

@end
