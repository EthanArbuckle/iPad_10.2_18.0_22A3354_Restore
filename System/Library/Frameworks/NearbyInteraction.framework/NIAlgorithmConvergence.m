@implementation NIAlgorithmConvergence

- (NIAlgorithmConvergence)initWithStatus:(int64_t)a3 andReasons:(id)a4
{
  id v7;
  NIAlgorithmConvergence *v8;
  NIAlgorithmConvergence *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)NIAlgorithmConvergence;
  v8 = -[NIAlgorithmConvergence init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_status = a3;
    objc_storeStrong((id *)&v8->_reasons, a4);
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  NIAlgorithmConvergence *v5;

  if (self->_reasons)
    v4 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "allocWithZone:", a3), "initWithArray:copyItems:", self->_reasons, 1);
  else
    v4 = 0;
  v5 = -[NIAlgorithmConvergence initWithStatus:andReasons:]([NIAlgorithmConvergence alloc], "initWithStatus:andReasons:", self->_status, v4);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *reasons;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", self->_status, CFSTR("status"));
  reasons = self->_reasons;
  if (reasons)
    objc_msgSend(v5, "encodeObject:forKey:", reasons, CFSTR("reasons"));

}

- (NIAlgorithmConvergence)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NIAlgorithmConvergence *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("status"));
  if (!objc_msgSend(v4, "containsValueForKey:", CFSTR("reasons")))
  {
    v9 = 0;
    goto LABEL_5;
  }
  v6 = (void *)MEMORY[0x1E0C99E60];
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("reasons"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
LABEL_5:
    v10 = -[NIAlgorithmConvergence initWithStatus:andReasons:]([NIAlgorithmConvergence alloc], "initWithStatus:andReasons:", v5, v9);
    goto LABEL_6;
  }
  v10 = 0;
LABEL_6:

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  int64_t status;
  void *v8;
  BOOL v9;
  char v10;
  void *v11;
  char v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = objc_msgSend(v5, "status");
    status = self->_status;
    objc_msgSend(v5, "reasons");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v9 = 0;
    else
      v9 = self->_reasons == 0;

    objc_msgSend(v5, "reasons");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToArray:", self->_reasons);

    if (v6 == status)
      v10 = v9 | v12;
    else
      v10 = 0;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_status);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSArray hash](self->_reasons, "hash") ^ v4;

  return v5;
}

- (id)reasonsPrivate
{
  return self->_reasons;
}

- (NIAlgorithmConvergenceStatus)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (NSArray)reasons
{
  return self->_reasons;
}

- (void)setReasons:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reasons, 0);
}

@end
