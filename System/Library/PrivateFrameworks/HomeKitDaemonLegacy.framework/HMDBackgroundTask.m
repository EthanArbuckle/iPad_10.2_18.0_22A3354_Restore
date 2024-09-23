@implementation HMDBackgroundTask

- (HMDBackgroundTask)initWithIdentifier:(id)a3 expectedFireDate:(id)a4 scheduledDate:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDBackgroundTask *v12;
  HMDBackgroundTask *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDBackgroundTask;
  v12 = -[HMDBackgroundTask init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_expectedFireDate, a4);
    objc_storeStrong((id *)&v13->_scheduledDate, a5);
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
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDBackgroundTask identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("identifier"), v4);
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDBackgroundTask expectedFireDate](self, "expectedFireDate", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hmf_localTimeDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("expected fire date"), v8);
  v16[1] = v9;
  v10 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDBackgroundTask scheduledDate](self, "scheduledDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hmf_localTimeDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("scheduled date"), v12);
  v16[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (NSDate)expectedFireDate
{
  return self->_expectedFireDate;
}

- (NSDate)scheduledDate
{
  return self->_scheduledDate;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_scheduledDate, 0);
  objc_storeStrong((id *)&self->_expectedFireDate, 0);
}

@end
