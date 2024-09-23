@implementation HMBLocalZoneQueryResultAllOfTypeRaw

- (HMBLocalZoneQueryResultAllOfTypeRaw)initWithLocalZone:(id)a3 zoneRow:(unint64_t)a4 modelType:(id)a5 returning:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  HMBLocalZoneQueryResultAllOfTypeRaw *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMBLocalZoneQueryResultAllOfTypeRaw *v20;
  SEL v21;
  sqlite3_stmt *v22;
  id *v23;
  objc_super v24;

  v10 = a3;
  v11 = a5;
  objc_msgSend(v10, "sql");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "selectAllRecordTypeRows");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v24.receiver = self;
  v24.super_class = (Class)HMBLocalZoneQueryResultAllOfTypeRaw;
  v14 = -[HMBSQLQueryIterator initWithStatement:initialSequence:maximumRowsPerSelect:error:](&v24, sel_initWithStatement_initialSequence_maximumRowsPerSelect_error_, v13, &unk_1E89476B8, +[HMBSQLQueryIterator maximumRowsPerSelect](HMBSQLQueryIterator, "maximumRowsPerSelect"), 0);
  if (!v14)
    goto LABEL_5;
  objc_msgSend(v13, "arguments");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "hmf_numberForKey:", CFSTR("_store_id"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v13, "arguments");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "hmf_numberForKey:", CFSTR("_model_type"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v14->_zoneRowBindOffset = objc_msgSend(v16, "intValue");
      v14->_modelTypeBindOffset = objc_msgSend(v18, "intValue");
      objc_storeStrong((id *)&v14->_modelType, a5);
      v14->_zoneRow = a4;
      v14->_returning = a6;

LABEL_5:
      return v14;
    }
  }
  else
  {
    _HMFPreconditionFailure();
  }
  v20 = (HMBLocalZoneQueryResultAllOfTypeRaw *)_HMFPreconditionFailure();
  return (HMBLocalZoneQueryResultAllOfTypeRaw *)-[HMBLocalZoneQueryResultAllOfTypeRaw bindPropertiesToStatement:error:](v20, v21, v22, v23);
}

- (BOOL)bindPropertiesToStatement:(sqlite3_stmt *)a3 error:(id *)a4
{
  int v7;
  void *v8;

  hmbBindIntSQLite3(a3, -[HMBLocalZoneQueryResultAllOfTypeRaw zoneRowBindOffset](self, "zoneRowBindOffset"), -[HMBLocalZoneQueryResultAllOfTypeRaw zoneRow](self, "zoneRow"), a4);
  v7 = -[HMBLocalZoneQueryResultAllOfTypeRaw modelTypeBindOffset](self, "modelTypeBindOffset");
  -[HMBLocalZoneQueryResultAllOfTypeRaw modelType](self, "modelType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  hmbBindStringSQLite3(a3, v7, v8, a4);

  return 1;
}

- (id)fetchRowFromStatement:(sqlite3_stmt *)a3 skip:(BOOL *)a4 updatedSequence:(unint64_t *)a5 error:(id *)a6
{
  HMBLocalSQLContextRowRecord *v7;

  v7 = -[HMBLocalSQLContextRowRecord initWithStatement:returning:]([HMBLocalSQLContextRowRecord alloc], "initWithStatement:returning:", a3, -[HMBLocalZoneQueryResultAllOfTypeRaw returning](self, "returning"));
  *a5 = -[HMBLocalSQLContextRowRecord recordRow](v7, "recordRow");
  return v7;
}

- (unint64_t)returning
{
  return self->_returning;
}

- (unint64_t)zoneRow
{
  return self->_zoneRow;
}

- (int)zoneRowBindOffset
{
  return self->_zoneRowBindOffset;
}

- (NSString)modelType
{
  return self->_modelType;
}

- (int)modelTypeBindOffset
{
  return self->_modelTypeBindOffset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelType, 0);
}

@end
