@implementation BMSQLProtoColumn

+ (id)extractValueFromProtoData:(id)a3 fieldNumber:(int64_t)a4 type:(int64_t)a5 error:(id *)a6
{
  return +[BMPoirotSchematizerShim searchValueIn:withFieldNumber:typeRawValue:error:](_TtC12BiomeStreams23BMPoirotSchematizerShim, "searchValueIn:withFieldNumber:typeRawValue:error:", a3, a4, a5, a6);
}

- (BMSQLProtoColumn)initWithName:(id)a3 dataType:(int64_t)a4 requestOnly:(BOOL)a5 fieldNumber:(int64_t)a6 protoDataType:(int64_t)a7 convertedType:(int64_t)a8
{
  _BOOL8 v11;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  BMSQLProtoColumn *v18;
  _QWORD v20[2];

  v11 = a5;
  v20[1] = *MEMORY[0x1E0C80C00];
  v14 = (void *)MEMORY[0x1E0CB37E8];
  v15 = a3;
  objc_msgSend(v14, "numberWithInteger:", a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[BMSQLProtoColumn initWithName:dataType:requestOnly:fieldPath:protoDataType:convertedType:](self, "initWithName:dataType:requestOnly:fieldPath:protoDataType:convertedType:", v15, a4, v11, v17, a7, a8);

  return v18;
}

- (BMSQLProtoColumn)initWithName:(id)a3 dataType:(int64_t)a4 requestOnly:(BOOL)a5 fieldPath:(id)a6 protoDataType:(int64_t)a7 convertedType:(int64_t)a8
{
  _BOOL8 v11;
  id v15;
  id v16;
  BMSQLProtoColumn *v17;
  BMSQLProtoColumn *v18;
  objc_super v20;
  _QWORD v21[4];
  id v22;
  int64_t v23;
  int64_t v24;

  v11 = a5;
  v15 = a6;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __92__BMSQLProtoColumn_initWithName_dataType_requestOnly_fieldPath_protoDataType_convertedType___block_invoke;
  v21[3] = &unk_1E2648588;
  v16 = v15;
  v22 = v16;
  v23 = a7;
  v24 = a8;
  v20.receiver = self;
  v20.super_class = (Class)BMSQLProtoColumn;
  v17 = -[BMSQLColumn initWithName:dataType:requestOnly:extractBlock:](&v20, sel_initWithName_dataType_requestOnly_extractBlock_, a3, a4, v11, v21);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_fieldPath, a6);
    v18->_protoDataType = a7;
    v18->_convertedType = a8;
  }

  return v18;
}

id __92__BMSQLProtoColumn_initWithName_dataType_requestOnly_fieldPath_protoDataType_convertedType___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a2, "eventBodyData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMSQLProtoColumn extractValueFromProtoData:fieldPath:type:error:](BMSQLProtoColumn, "extractValueFromProtoData:fieldPath:type:error:", v5, a1[4], a1[5], a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[BMEventBase convertValue:toType:](BMEventBase, "convertValue:toType:", v6, a1[6]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)description
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *fieldPath;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[BMSQLColumn name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BMSQLDataTypeToString(-[BMSQLColumn dataType](self, "dataType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSQLColumn requestOnly](self, "requestOnly"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fieldPath = self->_fieldPath;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_protoDataType);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_convertedType);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p> name: %@, datatype: %@, request only: %@, fieldPath: %@, protoDataType: %@, convertedType: %@"), v4, self, v5, v6, v7, fieldPath, v9, v10);

  return v11;
}

+ (id)extractValueFromProtoData:(id)a3 fieldPath:(id)a4 type:(int64_t)a5 error:(id *)a6
{
  return +[BMPoirotSchematizerShim searchValueIn:withFieldPath:typeRawValue:error:](_TtC12BiomeStreams23BMPoirotSchematizerShim, "searchValueIn:withFieldPath:typeRawValue:error:", a3, a4, a5, a6);
}

+ (id)extractValuesFromProtoData:(id)a3 fieldNumber:(int64_t)a4 type:(int64_t)a5 error:(id *)a6
{
  return +[BMPoirotSchematizerShim searchValuesIn:withFieldNumber:typeRawValue:error:](_TtC12BiomeStreams23BMPoirotSchematizerShim, "searchValuesIn:withFieldNumber:typeRawValue:error:", a3, a4, a5, a6);
}

- (NSArray)fieldPath
{
  return self->_fieldPath;
}

- (int64_t)protoDataType
{
  return self->_protoDataType;
}

- (int64_t)convertedType
{
  return self->_convertedType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldPath, 0);
}

@end
