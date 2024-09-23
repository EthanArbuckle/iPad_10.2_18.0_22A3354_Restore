@implementation HMBLocalSQLContextRowRecord

- (HMBLocalSQLContextRowRecord)initWithRecordRow:(unint64_t)a3 externalID:(id)a4 externalData:(id)a5 modelID:(id)a6 modelEncoding:(unint64_t)a7 modelData:(id)a8 modelSchema:(id)a9 modelType:(id)a10 pushEncoding:(unint64_t)a11 pushData:(id)a12 pushBlockRow:(id)a13
{
  id v19;
  HMBLocalSQLContextRowRecord *v20;
  HMBLocalSQLContextRowRecord *v21;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  objc_super v31;

  v30 = a4;
  v29 = a5;
  v28 = a6;
  v27 = a8;
  v26 = a9;
  v25 = a10;
  v24 = a12;
  v19 = a13;
  v31.receiver = self;
  v31.super_class = (Class)HMBLocalSQLContextRowRecord;
  v20 = -[HMBLocalSQLContextRowRecord init](&v31, sel_init);
  v21 = v20;
  if (v20)
  {
    v20->_recordRow = a3;
    objc_storeStrong((id *)&v20->_externalID, a4);
    objc_storeStrong((id *)&v21->_externalData, a5);
    objc_storeStrong((id *)&v21->_modelID, a6);
    v21->_modelEncoding = a7;
    objc_storeStrong((id *)&v21->_modelData, a8);
    objc_storeStrong((id *)&v21->_modelSchema, a9);
    objc_storeStrong((id *)&v21->_modelType, a10);
    v21->_pushEncoding = a11;
    objc_storeStrong((id *)&v21->_pushData, a12);
    objc_storeStrong((id *)&v21->_pushBlockRow, a13);
  }

  return v21;
}

- (HMBLocalSQLContextRowRecord)initWithStatement:(sqlite3_stmt *)a3 returning:(unint64_t)a4
{
  char v4;
  void *v6;
  void *v7;
  sqlite3_int64 v8;
  void *v9;
  void *v10;
  void *v11;
  sqlite3_int64 v12;
  void *v13;
  void *v14;
  void *v15;
  HMBLocalSQLContextRowRecord *v16;
  sqlite3_int64 v18;

  v4 = a4;
  v18 = sqlite3_column_int64(a3, 0);
  if ((v4 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "hmbDataWithSQLite3Column:column:", a3, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D50], "hmbDataWithSQLite3Column:column:", a3, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  if ((v4 & 2) != 0)
  {
    v8 = sqlite3_column_int64(a3, 3);
    objc_msgSend(MEMORY[0x1E0C99D50], "hmbDataWithSQLite3Column:column:", a3, 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "hmbUUIDWithSQLite3Column:column:", a3, 5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "hmbStringWithSQLite3Column:column:", a3, 6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v4 & 4) != 0)
      goto LABEL_6;
LABEL_8:
    v12 = 0;
    v13 = 0;
    v14 = 0;
    goto LABEL_9;
  }
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  if ((v4 & 4) == 0)
    goto LABEL_8;
LABEL_6:
  v12 = sqlite3_column_int64(a3, 7);
  objc_msgSend(MEMORY[0x1E0C99D50], "hmbDataWithSQLite3Column:column:", a3, 8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "hmbNumberWithSQLite3Column:column:", a3, 9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3A28], "hmbUUIDWithSQLite3Column:column:", a3, 10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[HMBLocalSQLContextRowRecord initWithRecordRow:externalID:externalData:modelID:modelEncoding:modelData:modelSchema:modelType:pushEncoding:pushData:pushBlockRow:](self, "initWithRecordRow:externalID:externalData:modelID:modelEncoding:modelData:modelSchema:modelType:pushEncoding:pushData:pushBlockRow:", v18, v7, v6, v15, v8, v9, v10, v11, v12, v13, v14);

  return v16;
}

- (id)attributeDescriptions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMBLocalSQLContextRowRecord recordRow](self, "recordRow"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Record Row"), v5);
  objc_msgSend(v3, "addObject:", v6);

  -[HMBLocalSQLContextRowRecord externalID](self, "externalID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMBLocalSQLContextRowRecord externalID](self, "externalID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hmbDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v8, "initWithName:value:", CFSTR("External ID"), v10);
    objc_msgSend(v3, "addObject:", v11);

  }
  -[HMBLocalSQLContextRowRecord externalData](self, "externalData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMBLocalSQLContextRowRecord externalData](self, "externalData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "hmbDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v13, "initWithName:value:", CFSTR("External Data"), v15);
    objc_msgSend(v3, "addObject:", v16);

  }
  v17 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMBLocalSQLContextRowRecord modelEncoding](self, "modelEncoding"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithName:value:", CFSTR("Model Encoding"), v18);
  objc_msgSend(v3, "addObject:", v19);

  -[HMBLocalSQLContextRowRecord modelID](self, "modelID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v21 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMBLocalSQLContextRowRecord modelID](self, "modelID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v21, "initWithName:value:", CFSTR("Model ID"), v22);
    objc_msgSend(v3, "addObject:", v23);

  }
  -[HMBLocalSQLContextRowRecord modelData](self, "modelData");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    v25 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMBLocalSQLContextRowRecord modelData](self, "modelData");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "hmbDescription");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v25, "initWithName:value:", CFSTR("Model Data"), v27);
    objc_msgSend(v3, "addObject:", v28);

  }
  -[HMBLocalSQLContextRowRecord modelSchema](self, "modelSchema");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    v30 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMBLocalSQLContextRowRecord modelSchema](self, "modelSchema");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "UUIDString");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v30, "initWithName:value:", CFSTR("Model Schema"), v32);
    objc_msgSend(v3, "addObject:", v33);

  }
  -[HMBLocalSQLContextRowRecord modelType](self, "modelType");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    v35 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMBLocalSQLContextRowRecord modelType](self, "modelType");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)objc_msgSend(v35, "initWithName:value:", CFSTR("Model Type"), v36);
    objc_msgSend(v3, "addObject:", v37);

  }
  v38 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMBLocalSQLContextRowRecord pushEncoding](self, "pushEncoding"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_msgSend(v38, "initWithName:value:", CFSTR("Push Encoding"), v39);
  objc_msgSend(v3, "addObject:", v40);

  -[HMBLocalSQLContextRowRecord pushData](self, "pushData");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    v42 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMBLocalSQLContextRowRecord pushData](self, "pushData");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "hmbDescription");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (void *)objc_msgSend(v42, "initWithName:value:", CFSTR("Push Data"), v44);
    objc_msgSend(v3, "addObject:", v45);

  }
  -[HMBLocalSQLContextRowRecord pushBlockRow](self, "pushBlockRow");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    v47 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMBLocalSQLContextRowRecord pushBlockRow](self, "pushBlockRow");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (void *)objc_msgSend(v47, "initWithName:value:", CFSTR("Push Block Row"), v48);
    objc_msgSend(v3, "addObject:", v49);

  }
  v50 = (void *)objc_msgSend(v3, "copy");

  return v50;
}

- (unint64_t)recordRow
{
  return self->_recordRow;
}

- (NSData)externalData
{
  return self->_externalData;
}

- (NSData)externalID
{
  return self->_externalID;
}

- (NSUUID)modelID
{
  return self->_modelID;
}

- (unint64_t)modelEncoding
{
  return self->_modelEncoding;
}

- (NSData)modelData
{
  return self->_modelData;
}

- (NSUUID)modelSchema
{
  return self->_modelSchema;
}

- (unint64_t)pushEncoding
{
  return self->_pushEncoding;
}

- (NSData)pushData
{
  return self->_pushData;
}

- (NSNumber)pushBlockRow
{
  return self->_pushBlockRow;
}

- (NSString)modelType
{
  return self->_modelType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelType, 0);
  objc_storeStrong((id *)&self->_pushBlockRow, 0);
  objc_storeStrong((id *)&self->_pushData, 0);
  objc_storeStrong((id *)&self->_modelSchema, 0);
  objc_storeStrong((id *)&self->_modelData, 0);
  objc_storeStrong((id *)&self->_modelID, 0);
  objc_storeStrong((id *)&self->_externalID, 0);
  objc_storeStrong((id *)&self->_externalData, 0);
}

@end
