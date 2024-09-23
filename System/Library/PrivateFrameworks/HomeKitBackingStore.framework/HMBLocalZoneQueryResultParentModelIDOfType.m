@implementation HMBLocalZoneQueryResultParentModelIDOfType

- (HMBLocalZoneQueryResultParentModelIDOfType)initWithLocalZone:(id)a3 parentModelID:(id)a4 modelClassName:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  unint64_t v13;
  HMBLocalZoneQueryResultParentModelIDOfType *v14;
  uint64_t v15;
  NSUUID *parentModelID;
  void *v17;
  void *v18;
  uint64_t v19;
  NSString *modelClassName;
  void *v21;
  void *v22;
  HMBLocalZoneQueryResultParentModelIDOfType *v24;
  SEL v25;
  sqlite3_stmt *v26;
  id *v27;
  objc_super v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "sql");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "selectAllRecordParentModelIDTypeRows");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = +[HMBSQLQueryIterator maximumRowsPerSelect](HMBSQLQueryIterator, "maximumRowsPerSelect");
  v28.receiver = self;
  v28.super_class = (Class)HMBLocalZoneQueryResultParentModelIDOfType;
  v14 = -[HMBLocalZoneQueryResult initWithLocalZone:statement:initialSequence:arguments:maximumRowsPerSelect:](&v28, sel_initWithLocalZone_statement_initialSequence_arguments_maximumRowsPerSelect_, v8, v12, &unk_1E8947718, MEMORY[0x1E0C9AA70], v13);
  if (!v14)
    goto LABEL_5;
  v15 = objc_msgSend(v9, "copy");
  parentModelID = v14->_parentModelID;
  v14->_parentModelID = (NSUUID *)v15;

  objc_msgSend(v12, "arguments");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "hmf_numberForKey:", CFSTR("_parent_uuid"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v14->_parentModelIDOffset = objc_msgSend(v18, "intValue");
    v19 = objc_msgSend(v10, "copy");
    modelClassName = v14->_modelClassName;
    v14->_modelClassName = (NSString *)v19;

    objc_msgSend(v12, "arguments");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "hmf_numberForKey:", CFSTR("_type"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v14->_modelClassNameOffset = objc_msgSend(v22, "intValue");

LABEL_5:
      return v14;
    }
  }
  else
  {
    _HMFPreconditionFailure();
  }
  v24 = (HMBLocalZoneQueryResultParentModelIDOfType *)_HMFPreconditionFailure();
  return (HMBLocalZoneQueryResultParentModelIDOfType *)-[HMBLocalZoneQueryResultParentModelIDOfType bindPropertiesToStatement:error:](v24, v25, v26, v27);
}

- (BOOL)bindPropertiesToStatement:(sqlite3_stmt *)a3 error:(id *)a4
{
  int v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;

  v7 = -[HMBLocalZoneQueryResult zoneRowBindOffset](self, "zoneRowBindOffset");
  -[HMBLocalZoneQueryResult localZone](self, "localZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  hmbBindIntSQLite3(a3, v7, objc_msgSend(v8, "zoneRow"), a4);

  v9 = -[HMBLocalZoneQueryResultParentModelIDOfType parentModelIDOffset](self, "parentModelIDOffset");
  -[HMBLocalZoneQueryResultParentModelIDOfType parentModelID](self, "parentModelID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  hmbBindUUIDSQLite3(a3, v9, v10, a4);

  v11 = -[HMBLocalZoneQueryResultParentModelIDOfType modelClassNameOffset](self, "modelClassNameOffset");
  -[HMBLocalZoneQueryResultParentModelIDOfType modelClassName](self, "modelClassName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  hmbBindStringSQLite3(a3, v11, v12, a4);

  return 1;
}

- (int)parentModelIDOffset
{
  return self->_parentModelIDOffset;
}

- (NSUUID)parentModelID
{
  return self->_parentModelID;
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
  objc_storeStrong((id *)&self->_parentModelID, 0);
}

@end
