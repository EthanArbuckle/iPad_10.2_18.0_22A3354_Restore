@implementation HMBLocalZoneQueryResultAllOfType

- (HMBLocalZoneQueryResultAllOfType)initWithLocalZone:(id)a3 modelClassName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  HMBLocalZoneQueryResultAllOfType *v11;
  HMBLocalZoneQueryResultAllOfType *v12;
  void *v13;
  void *v14;
  HMBLocalZoneQueryResultAllOfType *v16;
  SEL v17;
  sqlite3_stmt *v18;
  id *v19;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "sql");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectAllRecordTypeRows");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = +[HMBSQLQueryIterator maximumRowsPerSelect](HMBSQLQueryIterator, "maximumRowsPerSelect");
  v20.receiver = self;
  v20.super_class = (Class)HMBLocalZoneQueryResultAllOfType;
  v11 = -[HMBLocalZoneQueryResult initWithLocalZone:statement:initialSequence:arguments:maximumRowsPerSelect:](&v20, sel_initWithLocalZone_statement_initialSequence_arguments_maximumRowsPerSelect_, v6, v9, &unk_1E8947718, MEMORY[0x1E0C9AA70], v10);
  v12 = v11;
  if (!v11)
    goto LABEL_4;
  objc_storeStrong((id *)&v11->_modelClassName, a4);
  objc_msgSend(v9, "arguments");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "hmf_numberForKey:", CFSTR("_model_type"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v12->_modelClassNameOffset = objc_msgSend(v14, "intValue");

LABEL_4:
    return v12;
  }
  v16 = (HMBLocalZoneQueryResultAllOfType *)_HMFPreconditionFailure();
  return (HMBLocalZoneQueryResultAllOfType *)-[HMBLocalZoneQueryResultAllOfType bindPropertiesToStatement:error:](v16, v17, v18, v19);
}

- (BOOL)bindPropertiesToStatement:(sqlite3_stmt *)a3 error:(id *)a4
{
  int v7;
  void *v8;
  int v9;
  void *v10;

  v7 = -[HMBLocalZoneQueryResult zoneRowBindOffset](self, "zoneRowBindOffset");
  -[HMBLocalZoneQueryResult localZone](self, "localZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  hmbBindIntSQLite3(a3, v7, objc_msgSend(v8, "zoneRow"), a4);

  v9 = -[HMBLocalZoneQueryResultAllOfType modelClassNameOffset](self, "modelClassNameOffset");
  -[HMBLocalZoneQueryResultAllOfType modelClassName](self, "modelClassName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  hmbBindStringSQLite3(a3, v9, v10, a4);

  return 1;
}

- (int)modelClassNameOffset
{
  return self->_modelClassNameOffset;
}

- (NSString)modelClassName
{
  return self->_modelClassName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelClassName, 0);
}

@end
