@implementation CTXPCSimCommonArrayResultResponse

- (CTXPCSimCommonArrayResultResponse)initWithResult:(id)a3
{
  id v5;
  CTXPCSimCommonArrayResultResponse *v6;
  CTXPCSimCommonArrayResultResponse *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTXPCSimCommonArrayResultResponse;
  v6 = -[CTXPCMessage initWithNamedArguments:](&v9, sel_initWithNamedArguments_, MEMORY[0x1E0C9AA70]);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_result, a3);

  return v7;
}

- (CTXPCSimCommonArrayResultResponse)initWithCoder:(id)a3
{
  id v4;
  CTXPCSimCommonArrayResultResponse *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CTXPCSimCommonArrayResultResponse;
  v5 = -[CTXPCMessage initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("result"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v5->_result;
    v5->_result = (NSArray *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CTXPCSimCommonArrayResultResponse;
  -[CTXPCMessage encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_result, CFSTR("result"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
}

@end
