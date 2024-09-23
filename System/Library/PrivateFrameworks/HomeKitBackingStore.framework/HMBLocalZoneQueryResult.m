@implementation HMBLocalZoneQueryResult

- (HMBLocalZoneQueryResult)initWithLocalZone:(id)a3 statement:(id)a4 initialSequence:(id)a5 arguments:(id)a6 maximumRowsPerSelect:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  HMBLocalZoneQueryResult *v16;
  HMBLocalZoneQueryResult *v17;
  void *v18;
  void *v19;
  HMBLocalZoneQueryResult *v21;
  SEL v22;
  sqlite3_stmt *v23;
  id *v24;
  objc_super v25;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v25.receiver = self;
  v25.super_class = (Class)HMBLocalZoneQueryResult;
  v16 = -[HMBSQLQueryIterator initWithStatement:initialSequence:maximumRowsPerSelect:error:](&v25, sel_initWithStatement_initialSequence_maximumRowsPerSelect_error_, v13, v14, a7, 0);
  v17 = v16;
  if (!v16)
    goto LABEL_4;
  objc_storeWeak((id *)&v16->_localZone, v12);
  v17->_zoneRow = objc_msgSend(v12, "zoneRow");
  objc_msgSend(v13, "arguments");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "hmf_numberForKey:", CFSTR("_store_id"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v17->_zoneRowBindOffset = objc_msgSend(v19, "intValue");
    objc_storeStrong((id *)&v17->_arguments, a6);

LABEL_4:
    return v17;
  }
  v21 = (HMBLocalZoneQueryResult *)_HMFPreconditionFailure();
  return (HMBLocalZoneQueryResult *)-[HMBLocalZoneQueryResult bindPropertiesToStatement:error:](v21, v22, v23, v24);
}

- (BOOL)bindPropertiesToStatement:(sqlite3_stmt *)a3 error:(id *)a4
{
  void *v7;
  int v8;
  sqlite3_int64 v9;
  _QWORD v11[5];

  -[HMBLocalZoneQueryResult arguments](self, "arguments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMBLocalZoneQueryResult zoneRowBindOffset](self, "zoneRowBindOffset");
  v9 = -[HMBLocalZoneQueryResult zoneRow](self, "zoneRow");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = ____bindProperties_block_invoke;
  v11[3] = &__block_descriptor_40_e25_v32__0__NSNumber_8_16_B24l;
  v11[4] = a3;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v11);
  hmbBindIntSQLite3(a3, v8, v9, a4);

  return 1;
}

- (HMBLocalZone)localZone
{
  return (HMBLocalZone *)objc_loadWeakRetained((id *)&self->_localZone);
}

- (unint64_t)zoneRow
{
  return self->_zoneRow;
}

- (int)zoneRowBindOffset
{
  return self->_zoneRowBindOffset;
}

- (NSDictionary)arguments
{
  return self->_arguments;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arguments, 0);
  objc_destroyWeak((id *)&self->_localZone);
}

+ (BOOL)bindPropertiesToStatement:(sqlite3_stmt *)a3 arguments:(id)a4 zoneBindRowOffset:(int)a5 zoneRow:(unint64_t)a6 error:(id *)a7
{
  _QWORD v12[5];

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = ____bindProperties_block_invoke;
  v12[3] = &__block_descriptor_40_e25_v32__0__NSNumber_8_16_B24l;
  v12[4] = a3;
  objc_msgSend(a4, "enumerateKeysAndObjectsUsingBlock:", v12);
  hmbBindIntSQLite3(a3, a5, a6, a7);
  return 1;
}

@end
