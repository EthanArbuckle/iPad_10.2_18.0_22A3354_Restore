@implementation AMDModelInputMetadata

- (AMDModelInputMetadata)initWithDictionary:(id)a3
{
  AMDModelInputMetadata *v3;
  int64_t v4;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  AMDModelInputMetadata *v14;
  objc_super v15;
  id location[2];
  AMDModelInputMetadata *v17;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v17;
  v17 = 0;
  v15.receiver = v3;
  v15.super_class = (Class)AMDModelInputMetadata;
  v17 = -[AMDModelInputMetadata init](&v15, sel_init);
  objc_storeStrong((id *)&v17, v17);
  v6 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("data_type"));
  v4 = +[AMDModelInputMetadata getDataTypeFromString:](AMDModelInputMetadata, "getDataTypeFromString:");
  -[AMDModelInputMetadata setDataType:](v17, "setDataType:", v4);

  v7 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("shape"));
  -[AMDModelInputMetadata setShape:](v17, "setShape:");

  v8 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("size"));
  -[AMDModelInputMetadata setSize:](v17, "setSize:");

  v9 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("padding_value"));
  -[AMDModelInputMetadata setPaddingValue:](v17, "setPaddingValue:");

  v10 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("post_remap_operation"));
  -[AMDModelInputMetadata setPostRemapOperation:](v17, "setPostRemapOperation:");

  v11 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("hash_op_mod_value"));
  -[AMDModelInputMetadata setHashOpModValue:](v17, "setHashOpModValue:");

  v12 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("truncate_op_min_value"));
  -[AMDModelInputMetadata setTruncateOpMinValue:](v17, "setTruncateOpMinValue:");

  v13 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("truncate_op_max_value"));
  -[AMDModelInputMetadata setTruncateOpMaxValue:](v17, "setTruncateOpMaxValue:");

  v14 = v17;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v17, 0);
  return v14;
}

- (BOOL)isValid
{
  BOOL v3;
  BOOL v4;
  char v5;
  NSArray *v6;
  char v7;
  NSNumber *v8;

  v7 = 0;
  v5 = 0;
  v4 = 0;
  if (-[AMDModelInputMetadata dataType](self, "dataType"))
  {
    v8 = -[AMDModelInputMetadata size](self, "size");
    v7 = 1;
    v3 = 1;
    if (!v8)
    {
      v6 = -[AMDModelInputMetadata shape](self, "shape");
      v5 = 1;
      v3 = v6 != 0;
    }
    v4 = v3;
  }
  if ((v5 & 1) != 0)

  if ((v7 & 1) != 0)
  return v4;
}

- (int64_t)getDataType
{
  return -[AMDModelInputMetadata dataType](self, "dataType", a2, self);
}

- (id)getShape
{
  return -[AMDModelInputMetadata shape](self, "shape", a2, self);
}

- (id)getSize
{
  return -[AMDModelInputMetadata size](self, "size", a2, self);
}

- (id)getPaddingValue
{
  return -[AMDModelInputMetadata paddingValue](self, "paddingValue", a2, self);
}

- (id)getPostRemapOperationName
{
  return -[AMDModelInputMetadata postRemapOperation](self, "postRemapOperation", a2, self);
}

- (id)getHashOpModValue
{
  return -[AMDModelInputMetadata hashOpModValue](self, "hashOpModValue", a2, self);
}

- (id)getTruncateOpMinValue
{
  return -[AMDModelInputMetadata truncateOpMinValue](self, "truncateOpMinValue", a2, self);
}

- (id)getTruncateOpMaxValue
{
  return -[AMDModelInputMetadata truncateOpMaxValue](self, "truncateOpMaxValue", a2, self);
}

+ (int64_t)getDataTypeFromString:(id)a3
{
  id location[3];
  int64_t v5;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("int32")) & 1) != 0)
    {
      v5 = 131104;
    }
    else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("double")) & 1) != 0)
    {
      v5 = 65600;
    }
    else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("float32")) & 1) != 0)
    {
      v5 = 65568;
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  objc_storeStrong(location, 0);
  return v5;
}

- (int64_t)dataType
{
  return self->_dataType;
}

- (void)setDataType:(int64_t)a3
{
  self->_dataType = a3;
}

- (NSArray)shape
{
  return self->_shape;
}

- (void)setShape:(id)a3
{
  objc_storeStrong((id *)&self->_shape, a3);
}

- (NSNumber)size
{
  return self->_size;
}

- (void)setSize:(id)a3
{
  objc_storeStrong((id *)&self->_size, a3);
}

- (NSNumber)paddingValue
{
  return self->_paddingValue;
}

- (void)setPaddingValue:(id)a3
{
  objc_storeStrong((id *)&self->_paddingValue, a3);
}

- (NSString)postRemapOperation
{
  return self->_postRemapOperation;
}

- (void)setPostRemapOperation:(id)a3
{
  objc_storeStrong((id *)&self->_postRemapOperation, a3);
}

- (NSNumber)hashOpModValue
{
  return self->_hashOpModValue;
}

- (void)setHashOpModValue:(id)a3
{
  objc_storeStrong((id *)&self->_hashOpModValue, a3);
}

- (NSNumber)truncateOpMinValue
{
  return self->_truncateOpMinValue;
}

- (void)setTruncateOpMinValue:(id)a3
{
  objc_storeStrong((id *)&self->_truncateOpMinValue, a3);
}

- (NSNumber)truncateOpMaxValue
{
  return self->_truncateOpMaxValue;
}

- (void)setTruncateOpMaxValue:(id)a3
{
  objc_storeStrong((id *)&self->_truncateOpMaxValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_truncateOpMaxValue, 0);
  objc_storeStrong((id *)&self->_truncateOpMinValue, 0);
  objc_storeStrong((id *)&self->_hashOpModValue, 0);
  objc_storeStrong((id *)&self->_postRemapOperation, 0);
  objc_storeStrong((id *)&self->_paddingValue, 0);
  objc_storeStrong((id *)&self->_size, 0);
  objc_storeStrong((id *)&self->_shape, 0);
}

@end
