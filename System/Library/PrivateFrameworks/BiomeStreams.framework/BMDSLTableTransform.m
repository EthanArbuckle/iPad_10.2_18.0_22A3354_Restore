@implementation BMDSLTableTransform

- (BMDSLTableTransform)initWithRowTransform:(id)a3 schema:(id)a4 tableName:(id)a5 name:(id)a6 version:(unsigned int)a7
{
  uint64_t v7;
  id v13;
  id v14;
  id v15;
  BMDSLTableTransform *v16;
  BMDSLTableTransform *v17;
  uint64_t v18;
  NSString *tableName;
  objc_super v21;

  v7 = *(_QWORD *)&a7;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v21.receiver = self;
  v21.super_class = (Class)BMDSLTableTransform;
  v16 = -[BMDSLBaseCodable initWithName:version:](&v21, sel_initWithName_version_, a6, v7);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_rowTransform, a3);
    objc_storeStrong((id *)&v17->_schema, a4);
    v18 = objc_msgSend(v15, "copy");
    tableName = v17->_tableName;
    v17->_tableName = (NSString *)v18;

  }
  return v17;
}

- (BMDSLTableTransform)initWithRowTransform:(id)a3 schema:(id)a4 tableName:(id)a5
{
  return -[BMDSLTableTransform initWithRowTransform:schema:tableName:name:version:](self, "initWithRowTransform:schema:tableName:name:version:", a3, a4, a5, CFSTR("tableTransform"), 1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BMDSLTableTransform;
  v4 = a3;
  -[BMDSLBaseCodable encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[BMDSLTableTransform rowTransform](self, "rowTransform", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("rowTransform"));

  -[BMDSLTableTransform schema](self, "schema");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("schema"));

  -[BMDSLTableTransform tableName](self, "tableName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("tableName"));

}

- (BMDSLTableTransform)initWithCoder:(id)a3
{
  id v4;
  BMDSLTableTransform *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BMDSLTableTransform;
  v5 = -[BMDSLBaseCodable initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D01B90], "allowed");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("rowTransform"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("schema"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tableName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BMDSLBaseCodable name](v5, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[BMDSLTableTransform initWithRowTransform:schema:tableName:name:version:](v5, "initWithRowTransform:schema:tableName:name:version:", v7, v8, v9, v10, -[BMDSLBaseCodable version](v5, "version"));

  }
  return v5;
}

- (BMDSLRowTransform)rowTransform
{
  return self->_rowTransform;
}

- (void)setRowTransform:(id)a3
{
  objc_storeStrong((id *)&self->_rowTransform, a3);
}

- (BMTableSchema)schema
{
  return self->_schema;
}

- (void)setSchema:(id)a3
{
  objc_storeStrong((id *)&self->_schema, a3);
}

- (NSString)tableName
{
  return self->_tableName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_schema, 0);
  objc_storeStrong((id *)&self->_rowTransform, 0);
}

@end
