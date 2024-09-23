@implementation ABAnyValuePredicate

- (ABAnyValuePredicate)init
{
  ABAnyValuePredicate *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ABAnyValuePredicate;
  result = -[ABPredicate init](&v3, sel_init);
  if (result)
    result->_property = -1;
  return result;
}

- (BOOL)isValid
{
  return self->_property != -1;
}

- (id)queryJoinsInCompound:(BOOL)a3 predicateIdentifier:(int)a4
{
  if ((ABPersonGetTypeOfProperty(self->_property) & 0x100) != 0)
    return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("JOIN ABMultiValue abv ON abp.ROWID = abv.record_id"));
  else
    return 0;
}

- (id)queryGroupByProperties
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("abp.ROWID"));
}

- (id)queryWhereStringForPredicateIdentifier:(int)a3
{
  if ((ABPersonGetTypeOfProperty(self->_property) & 0x100) != 0)
    return CFSTR("abv.property = ?");
  else
    return (id)-[__CFString stringByAppendingString:]((id)ABPersonNameForProperty(self->_property), "stringByAppendingString:", CFSTR(" is not NULL"));
}

- (void)ab_bindWhereClauseComponentOfStatement:(CPSqliteStatement *)a3 withBindingOffset:(int *)a4 predicateIdentifier:(int)a5
{
  if ((ABPersonGetTypeOfProperty(self->_property) & 0x100) != 0)
  {
    sqlite3_bind_int(a3->var1, *a4, self->_property);
    ++*a4;
  }
}

- (int)property
{
  return self->_property;
}

- (void)setProperty:(int)a3
{
  self->_property = a3;
}

@end
