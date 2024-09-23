@implementation EDAMSystemException

+ (id)structName
{
  return CFSTR("EDAMSystemException");
}

+ (id)structFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_24_31370;
  if (!structFields_structFields_24_31370)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 8, 0, CFSTR("errorCode"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 1, CFSTR("message"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[1] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 8, 1, CFSTR("rateLimitDuration"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 3);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)structFields_structFields_24_31370;
    structFields_structFields_24_31370 = v6;

    v2 = (void *)structFields_structFields_24_31370;
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

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (NSNumber)rateLimitDuration
{
  return self->_rateLimitDuration;
}

- (void)setRateLimitDuration:(id)a3
{
  objc_storeStrong((id *)&self->_rateLimitDuration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rateLimitDuration, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_errorCode, 0);
}

@end
