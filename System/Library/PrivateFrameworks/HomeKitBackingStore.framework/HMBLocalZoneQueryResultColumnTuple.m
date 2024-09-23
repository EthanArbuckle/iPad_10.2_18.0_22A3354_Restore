@implementation HMBLocalZoneQueryResultColumnTuple

- (HMBLocalZoneQueryResultColumnTuple)initWithName:(id)a3 offset:(int)a4 modelField:(id)a5
{
  id v9;
  id v10;
  HMBLocalZoneQueryResultColumnTuple *v11;
  HMBLocalZoneQueryResultColumnTuple *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HMBLocalZoneQueryResultColumnTuple;
  v11 = -[HMBLocalZoneQueryResultColumnTuple init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_name, a3);
    v12->_offset = a4;
    objc_storeStrong((id *)&v12->_modelField, a5);
  }

  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMBLocalZoneQueryResultColumnTuple name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HMBLocalZoneQueryResultColumnTuple offset](self, "offset");
  -[HMBLocalZoneQueryResultColumnTuple modelField](self, "modelField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HMBQueryEncoder: %@ / %lu %@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (int)offset
{
  return self->_offset;
}

- (HMBModelField)modelField
{
  return self->_modelField;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelField, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
