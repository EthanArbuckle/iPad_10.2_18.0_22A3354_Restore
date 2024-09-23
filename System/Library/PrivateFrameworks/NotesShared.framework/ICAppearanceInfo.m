@implementation ICAppearanceInfo

- (unint64_t)type
{
  return self->_type;
}

+ (id)appearanceInfoWithType:(unint64_t)a3
{
  ICAppearanceInfo *v4;

  v4 = objc_alloc_init(ICAppearanceInfo);
  -[ICAppearanceInfo setType:](v4, "setType:", a3);
  return v4;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (BOOL)isDark
{
  return -[ICAppearanceInfo type](self, "type") == 1;
}

- (id)description
{
  if (-[ICAppearanceInfo type](self, "type"))
    return CFSTR("ICAppearanceTypeDark");
  else
    return CFSTR("ICAppearanceTypeDefault");
}

+ (void)enumerateAppearanceTypesUsingBlock:(id)a3
{
  uint64_t v4;
  char v5;
  char v6;
  char v7;

  v4 = 0;
  v7 = 0;
  v5 = 1;
  do
  {
    v6 = v5;
    (*((void (**)(id, uint64_t, char *))a3 + 2))(a3, v4, &v7);
    v5 = v7;
    if (v7)
      break;
    v4 = 1;
  }
  while ((v6 & 1) != 0);
}

- (unint64_t)hash
{
  unint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  result = self->_hash;
  if (!result)
  {
    v4 = -[ICAppearanceInfo type](self, "type");
    result = ICHashWithHashKeys(v4, v5, v6, v7, v8, v9, v10, v11, 0);
  }
  self->_hash = result;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = -[ICAppearanceInfo type](self, "type");
    v7 = v6 == objc_msgSend(v5, "type");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
