@implementation CPLLibraryState

- (CPLLibraryState)initWithCoder:(id)a3
{
  id v4;
  CPLLibraryState *v5;
  uint64_t v6;
  NSDate *disabledDate;
  uint64_t v8;
  NSDate *deleteDate;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CPLLibraryState;
  v5 = -[CPLLibraryState init](&v11, sel_init);
  if (v5)
  {
    v5->_disabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("dis"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("disDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    disabledDate = v5->_disabledDate;
    v5->_disabledDate = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("delDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    deleteDate = v5->_deleteDate;
    v5->_deleteDate = (NSDate *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 disabled;
  id v5;

  disabled = self->_disabled;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", disabled, CFSTR("dis"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_disabledDate, CFSTR("disDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deleteDate, CFSTR("delDate"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  CPLLibraryState *v4;
  uint64_t v5;
  NSDate *disabledDate;
  uint64_t v7;
  NSDate *deleteDate;

  v4 = objc_alloc_init(CPLLibraryState);
  v4->_disabled = self->_disabled;
  v5 = -[NSDate copy](self->_disabledDate, "copy");
  disabledDate = v4->_disabledDate;
  v4->_disabledDate = (NSDate *)v5;

  v7 = -[NSDate copy](self->_deleteDate, "copy");
  deleteDate = v4->_deleteDate;
  v4->_deleteDate = (NSDate *)v7;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  CPLLibraryState *v4;
  unint64_t v5;
  void *v6;
  NSDate *disabledDate;
  char v8;
  BOOL v9;
  unint64_t v11;
  unint64_t v12;
  NSDate *v13;
  unint64_t v14;

  v4 = (CPLLibraryState *)a3;
  if (self == v4)
  {
    v9 = 1;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || self->_disabled != v4->_disabled)
    goto LABEL_7;
  v5 = self->_disabledDate;
  v6 = (void *)v5;
  disabledDate = v4->_disabledDate;
  if (v5 && disabledDate)
  {
    v8 = objc_msgSend((id)v5, "isEqual:");

    if ((v8 & 1) == 0)
    {
LABEL_7:
      v9 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    v11 = v5 | (unint64_t)disabledDate;

    if (v11)
      goto LABEL_7;
  }
  v12 = self->_deleteDate;
  v13 = v4->_deleteDate;
  v14 = (unint64_t)v13;
  v9 = v12 && v13 && (objc_msgSend((id)v12, "isEqual:", v13) & 1) != 0 || (v12 | v14) == 0;

LABEL_9:
  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSDate hash](self->_disabledDate, "hash");
  return -[NSDate hash](self->_deleteDate, "hash") ^ v3 ^ self->_disabled;
}

- (id)description
{
  id v3;
  NSDate *disabledDate;
  __CFString *v5;
  __CFString *v6;
  void *v7;

  if (self->_disabled)
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3940]);
    disabledDate = self->_disabledDate;
    if (disabledDate)
    {
      +[CPLDateFormatter stringFromDate:](CPLDateFormatter, "stringFromDate:", self->_disabledDate);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = CFSTR("<no disabled date");
    }
    if (!self->_deleteDate)
    {
      v6 = (__CFString *)objc_msgSend(v3, "initWithFormat:", CFSTR("[disabled %@ %@]"), v5, CFSTR("<no delete date>"));
      if (!disabledDate)
        return v6;
      goto LABEL_8;
    }
    +[CPLDateFormatter stringFromDate:](CPLDateFormatter, "stringFromDate:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (__CFString *)objc_msgSend(v3, "initWithFormat:", CFSTR("[disabled %@ %@]"), v5, v7);

    if (disabledDate)
LABEL_8:

  }
  else
  {
    v6 = CFSTR("[enabled]");
  }
  return v6;
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (NSDate)disabledDate
{
  return self->_disabledDate;
}

- (void)setDisabledDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)deleteDate
{
  return self->_deleteDate;
}

- (void)setDeleteDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deleteDate, 0);
  objc_storeStrong((id *)&self->_disabledDate, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
