@implementation ICChecklistsFilterTypeSelection

- (ICChecklistsFilterTypeSelection)initWithSelectionType:(unint64_t)a3
{
  ICChecklistsFilterTypeSelection *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICChecklistsFilterTypeSelection;
  result = -[ICChecklistsFilterTypeSelection init](&v5, sel_init);
  if (result)
    result->_selectionType = a3;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[ICChecklistsFilterTypeSelection initWithSelectionType:](+[ICChecklistsFilterTypeSelection allocWithZone:](ICChecklistsFilterTypeSelection, "allocWithZone:", a3), "initWithSelectionType:", -[ICChecklistsFilterTypeSelection selectionType](self, "selectionType"));
}

- (BOOL)isEqual:(id)a3
{
  ICChecklistsFilterTypeSelection *v4;
  ICChecklistsFilterTypeSelection *v5;
  BOOL v6;

  v4 = (ICChecklistsFilterTypeSelection *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ICChecklistsFilterTypeSelection isEqualToICChecklistsFilterTypeSelection:](self, "isEqualToICChecklistsFilterTypeSelection:", v5);

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
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ICChecklistsFilterTypeSelection selectionType](self, "selectionType"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hash");
    self->_hash = ICHashWithHashKeys(v5, v6, v7, v8, v9, v10, v11, v12, 0);

    return self->_hash;
  }
  return result;
}

- (int64_t)filterType
{
  return 5;
}

- (id)filterName
{
  return (id)objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Checklists"), CFSTR("Checklists"), 0, 1);
}

- (id)rawFilterValue
{
  unint64_t v2;

  v2 = -[ICChecklistsFilterTypeSelection selectionType](self, "selectionType");
  if (v2 - 1 > 2)
    return CFSTR("Any");
  else
    return off_1E76C98E0[v2 - 1];
}

- (BOOL)isEqualToICChecklistsFilterTypeSelection:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = -[ICChecklistsFilterTypeSelection selectionType](self, "selectionType");
  v6 = objc_msgSend(v4, "selectionType");

  return v5 == v6;
}

- (unint64_t)selectionType
{
  return self->_selectionType;
}

@end
