@implementation FIAPResult

- (FIAPResult)init
{
  return -[FIAPResult initWithHistoricalDataRequests:error:](self, "initWithHistoricalDataRequests:error:", 0, 0);
}

- (FIAPResult)initWithHistoricalDataRequests:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  FIAPResult *v9;
  FIAPResult *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FIAPResult;
  v9 = -[FIAPResult init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_historicalDataRequests, a3);
    objc_storeStrong((id *)&v10->_error, a4);
  }

  return v10;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<FIAPResult h:%@ e:%@>"), self->_historicalDataRequests, self->_error);
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSArray hash](self->_historicalDataRequests, "hash");
  return -[NSError hash](self->_error, "hash") - v3 + 32 * v3;
}

- (FIAPResult)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  FIAPResult *v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x1C3BD4F6C]();
  v6 = objc_alloc(MEMORY[0x1E0C99E60]);
  v7 = objc_opt_class();
  v8 = (void *)objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("hdr"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("err"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[FIAPResult initWithHistoricalDataRequests:error:](self, "initWithHistoricalDataRequests:error:", v9, v10);

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *historicalDataRequests;
  id v5;

  historicalDataRequests = self->_historicalDataRequests;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", historicalDataRequests, CFSTR("hdr"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_error, CFSTR("err"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = objc_alloc((Class)objc_opt_class());
  if (v5)
  {
    v6 = -[NSArray copyWithZone:](self->_historicalDataRequests, "copyWithZone:", a3);
    v7 = (void *)v5[1];
    v5[1] = v6;

    v8 = -[NSError copyWithZone:](self->_error, "copyWithZone:", a3);
    v9 = (void *)v5[2];
    v5[2] = v8;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  FIAPResult *v4;
  FIAPResult *v5;
  BOOL v6;

  v4 = (FIAPResult *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[FIAPResult isEqualToResult:](self, "isEqualToResult:", v5);

  return v6;
}

- (BOOL)isEqualToResult:(id)a3
{
  id v4;
  _QWORD *v5;
  NSArray *historicalDataRequests;
  NSArray *v7;
  NSArray *v8;
  NSArray *v9;
  char v10;
  char v11;
  NSError *v12;
  NSError *v13;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_4;
  historicalDataRequests = self->_historicalDataRequests;
  v7 = (NSArray *)*((id *)v4 + 1);
  if (historicalDataRequests == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = historicalDataRequests;
    v10 = -[NSArray isEqual:](v9, "isEqual:", v8);

    if ((v10 & 1) == 0)
    {
LABEL_4:
      v11 = 0;
      goto LABEL_10;
    }
  }
  v12 = self->_error;
  v13 = v12;
  if (v12 == (NSError *)v5[2])
    v11 = 1;
  else
    v11 = -[NSError isEqual:](v12, "isEqual:");

LABEL_10:
  return v11;
}

- (NSArray)historicalDataRequests
{
  return self->_historicalDataRequests;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_historicalDataRequests, 0);
}

+ (id)success
{
  return +[FIAPResult resultWithHistoricalDataRequests:error:](FIAPResult, "resultWithHistoricalDataRequests:error:", 0, 0);
}

+ (id)resultWithHistoricalDataRequests:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  FIAPResult *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[FIAPResult initWithHistoricalDataRequests:error:]([FIAPResult alloc], "initWithHistoricalDataRequests:error:", v6, v5);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
