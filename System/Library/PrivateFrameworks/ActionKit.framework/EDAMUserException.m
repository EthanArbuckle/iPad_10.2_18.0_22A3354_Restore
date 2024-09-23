@implementation EDAMUserException

+ (id)structName
{
  return CFSTR("EDAMUserException");
}

+ (id)structFields
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_31342;
  if (!structFields_structFields_31342)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 8, 0, CFSTR("errorCode"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v3;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 1, CFSTR("parameter"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[1] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 2);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)structFields_structFields_31342;
    structFields_structFields_31342 = v5;

    v2 = (void *)structFields_structFields_31342;
  }
  return v2;
}

- (NSNumber)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(id)a3
{
  objc_storeStrong((id *)&self->_errorCode, a3);
}

- (NSString)parameter
{
  return self->_parameter;
}

- (void)setParameter:(id)a3
{
  objc_storeStrong((id *)&self->_parameter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameter, 0);
  objc_storeStrong((id *)&self->_errorCode, 0);
}

@end
