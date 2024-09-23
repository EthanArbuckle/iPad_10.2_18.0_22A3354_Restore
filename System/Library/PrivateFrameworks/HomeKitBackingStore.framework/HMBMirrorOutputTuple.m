@implementation HMBMirrorOutputTuple

- (HMBMirrorOutputTuple)initWithOutputBlockRow:(unint64_t)a3 recordRow:(unint64_t)a4 model:(id)a5 queryTable:(id)a6 externalID:(id)a7 externalData:(id)a8
{
  id v15;
  id v16;
  id v17;
  HMBMirrorOutputTuple *v18;
  HMBMirrorOutputTuple *v19;
  id v21;
  objc_super v22;

  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v22.receiver = self;
  v22.super_class = (Class)HMBMirrorOutputTuple;
  v18 = -[HMBMirrorOutputTuple init](&v22, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_outputBlockRow = a3;
    v18->_recordRow = a4;
    objc_storeStrong((id *)&v18->_model, a5);
    objc_storeStrong((id *)&v19->_queryTable, a6);
    objc_storeStrong((id *)&v19->_externalID, a7);
    objc_storeStrong((id *)&v19->_externalData, a8);
  }

  return v19;
}

- (id)attributeDescriptions
{
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[7];

  v25[6] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMBMirrorOutputTuple outputBlockRow](self, "outputBlockRow"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Output Block Row"), v24);
  v25[0] = v23;
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMBMirrorOutputTuple recordRow](self, "recordRow"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Record Row"), v22);
  v25[1] = v21;
  v5 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMBMirrorOutputTuple model](self, "model");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("Model"), v20);
  v25[2] = v6;
  v7 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMBMirrorOutputTuple queryTable](self, "queryTable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("Query Table"), v8);
  v25[3] = v9;
  v10 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMBMirrorOutputTuple externalID](self, "externalID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hmbDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("External ID"), v12);
  v25[4] = v13;
  v14 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMBMirrorOutputTuple externalData](self, "externalData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "hmbDescription");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v14, "initWithName:value:", CFSTR("External Data"), v16);
  v25[5] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (HMBModel)model
{
  return self->_model;
}

- (NSData)externalID
{
  return self->_externalID;
}

- (void)setExternalID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)externalData
{
  return self->_externalData;
}

- (void)setExternalData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (HMBLocalSQLQueryTable)queryTable
{
  return self->_queryTable;
}

- (unint64_t)recordRow
{
  return self->_recordRow;
}

- (unint64_t)outputBlockRow
{
  return self->_outputBlockRow;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryTable, 0);
  objc_storeStrong((id *)&self->_externalData, 0);
  objc_storeStrong((id *)&self->_externalID, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end
