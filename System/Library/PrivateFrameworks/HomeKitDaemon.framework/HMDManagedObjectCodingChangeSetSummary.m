@implementation HMDManagedObjectCodingChangeSetSummary

- (HMDManagedObjectCodingChangeSetSummary)initWithShortDescriptionForChangeSet:(id)a3 insertedObjectNames:(id)a4 modifiedObjectPropertyNames:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDManagedObjectCodingChangeSetSummary *v12;
  HMDManagedObjectCodingChangeSetSummary *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDManagedObjectCodingChangeSetSummary;
  v12 = -[HMDManagedObjectCodingChangeSetSummary init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_shortDescriptionForChangeSet, a3);
    objc_storeStrong((id *)&v13->_insertedObjectNames, a4);
    objc_storeStrong((id *)&v13->_modifiedObjectPropertyNames, a5);
  }

  return v13;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDManagedObjectCodingChangeSetSummary insertedObjectNames](self, "insertedObjectNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("insertedObjectNames"), v4);
  v11[0] = v5;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDManagedObjectCodingChangeSetSummary modifiedObjectPropertyNames](self, "modifiedObjectPropertyNames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("modifiedObjectPropertyNames"), v7);
  v11[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)shortDescriptionForChangeSet
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSSet)insertedObjectNames
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (NSSet)modifiedObjectPropertyNames
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifiedObjectPropertyNames, 0);
  objc_storeStrong((id *)&self->_insertedObjectNames, 0);
  objc_storeStrong((id *)&self->_shortDescriptionForChangeSet, 0);
}

@end
