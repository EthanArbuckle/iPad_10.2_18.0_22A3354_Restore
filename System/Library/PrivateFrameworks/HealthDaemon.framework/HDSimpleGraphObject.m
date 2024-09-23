@implementation HDSimpleGraphObject

- (HDSimpleGraphObject)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDSimpleGraphObject)initWithRowID:(int64_t)a3 version:(int64_t)a4 slots:(unint64_t)a5 deleted:(BOOL)a6
{
  HDSimpleGraphObject *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HDSimpleGraphObject;
  result = -[HDSimpleGraphObject init](&v11, sel_init);
  if (result)
  {
    result->_rowID = a3;
    result->_version = a4;
    result->_slots = a5;
    result->_deleted = a6;
  }
  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  if (self->_deleted)
    v5 = CFSTR(": deleted");
  else
    v5 = &stru_1E6D11BB8;
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%p:%lld:%lld:%llX%@"), v4, self, *(_OWORD *)&self->_rowID, self->_slots, v5);
}

- (unint64_t)hash
{
  return self->_rowID ^ objc_msgSend((id)objc_opt_class(), "hash");
}

- (BOOL)isEqual:(id)a3
{
  HDSimpleGraphObject *v4;
  HDSimpleGraphObject *v5;
  int64_t v6;
  uint64_t v7;
  BOOL v8;

  v4 = (HDSimpleGraphObject *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[HDSimpleGraphObject rowID](self, "rowID");
      v7 = -[HDSimpleGraphObject rowID](v5, "rowID");

      v8 = v6 == v7;
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (int64_t)rowID
{
  return self->_rowID;
}

- (int64_t)version
{
  return self->_version;
}

- (unint64_t)slots
{
  return self->_slots;
}

- (BOOL)isDeleted
{
  return self->_deleted;
}

@end
