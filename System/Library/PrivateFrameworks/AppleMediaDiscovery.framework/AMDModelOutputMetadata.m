@implementation AMDModelOutputMetadata

- (AMDModelOutputMetadata)initWithDictionary:(id)a3
{
  AMDModelOutputMetadata *v3;
  int64_t v4;
  id v6;
  AMDModelOutputMetadata *v7;
  objc_super v8;
  id location[2];
  AMDModelOutputMetadata *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v10;
  v10 = 0;
  v8.receiver = v3;
  v8.super_class = (Class)AMDModelOutputMetadata;
  v10 = -[AMDModelOutputMetadata init](&v8, sel_init);
  objc_storeStrong((id *)&v10, v10);
  v6 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("data_type"));
  v4 = +[AMDModelInputMetadata getDataTypeFromString:](AMDModelInputMetadata, "getDataTypeFromString:");
  -[AMDModelOutputMetadata setDataType:](v10, "setDataType:", v4);

  v7 = v10;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v10, 0);
  return v7;
}

- (BOOL)isValid
{
  return -[AMDModelOutputMetadata dataType](self, "dataType", a2, self) != 0;
}

- (int64_t)getDataType
{
  return -[AMDModelOutputMetadata dataType](self, "dataType", a2, self);
}

- (int64_t)dataType
{
  return self->_dataType;
}

- (void)setDataType:(int64_t)a3
{
  self->_dataType = a3;
}

@end
