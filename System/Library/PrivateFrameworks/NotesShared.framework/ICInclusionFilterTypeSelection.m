@implementation ICInclusionFilterTypeSelection

- (ICInclusionFilterTypeSelection)initWithInclusionType:(unint64_t)a3
{
  ICInclusionFilterTypeSelection *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICInclusionFilterTypeSelection;
  result = -[ICInclusionFilterTypeSelection init](&v5, sel_init);
  if (result)
    result->_inclusionType = a3;
  return result;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  unint64_t v5;
  const __CFString *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromICFilterType(-[ICInclusionFilterTypeSelection filterType](self, "filterType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ICInclusionFilterTypeSelection inclusionType](self, "inclusionType");
  v6 = CFSTR("Excluded");
  if (!v5)
    v6 = CFSTR("Included");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[ICInclusionFilterTypeSelection initWithInclusionType:](+[ICInclusionFilterTypeSelection allocWithZone:](ICInclusionFilterTypeSelection, "allocWithZone:", a3), "initWithInclusionType:", -[ICInclusionFilterTypeSelection inclusionType](self, "inclusionType"));
}

- (BOOL)isEqual:(id)a3
{
  ICInclusionFilterTypeSelection *v4;
  ICInclusionFilterTypeSelection *v5;
  BOOL v6;

  v4 = (ICInclusionFilterTypeSelection *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ICInclusionFilterTypeSelection isEqualToInclusionFilterSelection:](self, "isEqualToInclusionFilterSelection:", v5);

  return v6;
}

- (unint64_t)hash
{
  unint64_t result;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  result = self->_hash;
  if (!result)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ICInclusionFilterTypeSelection inclusionType](self, "inclusionType"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hash");
    self->_hash = ICHashWithHashKeys(v5, v6, v7, v8, v9, v10, v11, v12, 0);

    return self->_hash;
  }
  return result;
}

- (int64_t)filterType
{
  return -1;
}

- (id)rawFilterValue
{
  if (-[ICInclusionFilterTypeSelection inclusionType](self, "inclusionType"))
    return CFSTR("Excluded");
  else
    return CFSTR("Included");
}

- (BOOL)isEqualToInclusionFilterSelection:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = -[ICInclusionFilterTypeSelection inclusionType](self, "inclusionType");
  v6 = objc_msgSend(v4, "inclusionType");

  return v5 == v6;
}

- (unint64_t)inclusionType
{
  return self->_inclusionType;
}

@end
