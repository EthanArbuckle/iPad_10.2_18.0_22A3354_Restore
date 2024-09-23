@implementation GEOETATrafficUpdateErrorInfo

- (GEOETATrafficUpdateErrorInfo)initWithResponse:(id)a3
{
  id v4;
  GEOETATrafficUpdateErrorInfo *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSArray *internalErrors;
  GEOETATrafficUpdateErrorInfo *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GEOETATrafficUpdateErrorInfo;
  v5 = -[GEOETATrafficUpdateErrorInfo init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "internalErrors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      v8 = objc_alloc(MEMORY[0x1E0C99D20]);
      objc_msgSend(v4, "internalErrors");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "initWithArray:copyItems:", v9, 1);
      internalErrors = v5->_internalErrors;
      v5->_internalErrors = (NSArray *)v10;

    }
    v12 = v5;
  }

  return v5;
}

+ (NSString)key
{
  return (NSString *)CFSTR("ETATrafficUpdateErrorInfo");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_internalErrors, CFSTR("_internalErrors"));
}

- (GEOETATrafficUpdateErrorInfo)initWithCoder:(id)a3
{
  id v4;
  GEOETATrafficUpdateErrorInfo *v5;
  uint64_t v6;
  NSArray *internalErrors;
  GEOETATrafficUpdateErrorInfo *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOETATrafficUpdateErrorInfo;
  v5 = -[GEOETATrafficUpdateErrorInfo init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_internalErrors"));
    v6 = objc_claimAutoreleasedReturnValue();
    internalErrors = v5->_internalErrors;
    v5->_internalErrors = (NSArray *)v6;

    v8 = v5;
  }

  return v5;
}

- (NSArray)internalErrors
{
  return self->_internalErrors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalErrors, 0);
}

@end
