@implementation CHTransaction

- (id)archivedDataWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, a3);
}

+ (id)unarchivedObjectClasses
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
}

+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0CB3710];
  v7 = a3;
  objc_msgSend(a1, "unarchivedObjectClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unarchivedObjectOfClasses:fromData:error:", v8, v7, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (CHTransaction)init
{
  -[CHTransaction doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (CHTransaction)initWithType:(unint64_t)a3 andRecord:(id)a4
{
  id v7;
  CHTransaction *v8;
  CHTransaction *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CHTransaction;
  v8 = -[CHTransaction init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_transactionType = a3;
    objc_storeStrong((id *)&v8->_record, a4);
  }

  return v9;
}

- (CHTransaction)initWithString:(id)a3 andRecord:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("Insert")) & 1) != 0)
  {
    v8 = 0;
LABEL_9:
    self = -[CHTransaction initWithType:andRecord:](self, "initWithType:andRecord:", v8, v7);
    goto LABEL_10;
  }
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("Update")) & 1) != 0)
  {
    v8 = 1;
    goto LABEL_9;
  }
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("Delete")) & 1) != 0)
  {
    v8 = 2;
    goto LABEL_9;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("BatchDeleteAll")))
  {
    v8 = 3;
    goto LABEL_9;
  }
LABEL_10:

  return self;
}

+ (id)toString:(unint64_t)a3
{
  if (a3 > 3)
    return 0;
  else
    return off_1E6746D00[a3];
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[CHTransaction transactionType](self, "transactionType"), CFSTR("type"));
  -[CHTransaction record](self, "record");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("record"));

}

- (CHTransaction)initWithCoder:(id)a3
{
  id v4;
  CHTransaction *v5;
  uint64_t v6;
  NSData *record;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHTransaction;
  v5 = -[CHTransaction init](&v9, sel_init);
  if (v5)
  {
    v5->_transactionType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("record"));
    v6 = objc_claimAutoreleasedReturnValue();
    record = v5->_record;
    v5->_record = (NSData *)v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p "), objc_opt_class(), self);
  NSStringFromSelector(sel_transactionType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "ch_stringWithCHTransactionType:", -[CHTransaction transactionType](self, "transactionType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v4, v5);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v6 = (void *)objc_msgSend(v3, "copy");

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[CHTransaction transactionType](self, "transactionType");
  -[CHTransaction record](self, "record");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  CHTransaction *v4;
  BOOL v5;

  v4 = (CHTransaction *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[CHTransaction isEqualToTransaction:](self, "isEqualToTransaction:", v4);
  }

  return v5;
}

- (BOOL)isEqualToTransaction:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v4 = a3;
  v5 = -[CHTransaction transactionType](self, "transactionType");
  if (v5 == objc_msgSend(v4, "transactionType"))
  {
    -[CHTransaction record](self, "record");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "record");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (v6 | v7) == 0;
    if (v7)
      v8 = objc_msgSend((id)v6, "isEqual:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)transactionType
{
  return self->_transactionType;
}

- (NSData)record
{
  return self->_record;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_record, 0);
}

@end
