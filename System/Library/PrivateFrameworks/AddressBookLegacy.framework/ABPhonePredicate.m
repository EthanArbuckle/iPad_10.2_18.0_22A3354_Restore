@implementation ABPhonePredicate

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ABPhonePredicate;
  -[ABPredicate dealloc](&v3, sel_dealloc);
}

- (id)homeCountryCode
{
  id result;

  result = self->_homeCountryCode;
  if (!result)
  {
    result = (id)CPPhoneNumberCopyHomeCountryCode();
    self->_homeCountryCode = (NSString *)result;
  }
  return result;
}

- (BOOL)isValid
{
  return -[NSString length](-[ABPhonePredicate phoneNumber](self, "phoneNumber"), "length") != 0;
}

- (id)predicateFormat
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ABPredicate %p - Phone matching <%@> (%@)"), self, -[ABPhonePredicate phoneNumber](self, "phoneNumber"), -[ABPhonePredicate country](self, "country"));
}

- (id)queryJoinsInCompound:(BOOL)a3 predicateIdentifier:(int)a4
{
  return 0;
}

- (id)queryWhereStringForPredicateIdentifier:(int)a3
{
  return CFSTR("((SELECT COUNT() FROM ABMultiValue WHERE (abp.ROWID = record_id AND abPredicateEval(?, ?, value) AND property+0 = ?) LIMIT 1) > 0)");
}

- (BOOL)hasCallback
{
  return 1;
}

- (void)ab_bindWhereClauseComponentOfStatement:(CPSqliteStatement *)a3 withBindingOffset:(int *)a4 predicateIdentifier:(int)a5
{
  sqlite3_bind_int(a3->var1, *a4, a5);
  ++*a4;
  -[ABPredicate bindString:toStatement:withBindingOffset:](self, "bindString:toStatement:withBindingOffset:", self->_phoneNumber, a3, a4);
  sqlite3_bind_int(a3->var1, *a4, kABPersonPhoneProperty);
  ++*a4;
}

- (void)evaluateCallbackWithSqliteContext:(sqlite3_context *)a3 predicateContext:(id)a4 values:(sqlite3_value *)a5 count:(int)a6
{
  const unsigned __int8 *v9;
  const unsigned __int8 *v10;
  BOOL v11;
  int v12;

  if (a6 == 3)
  {
    v9 = sqlite3_value_text(a5[1]);
    v10 = sqlite3_value_text(a5[2]);
    if (v9)
      v11 = v10 == 0;
    else
      v11 = 1;
    if (v11)
    {
      v12 = 0;
    }
    else
    {
      if (-[ABPhonePredicate country](self, "country"))
        -[ABPhonePredicate country](self, "country");
      else
        -[ABPhonePredicate homeCountryCode](self, "homeCountryCode");
      -[ABPhonePredicate homeCountryCode](self, "homeCountryCode");
      v12 = CPPhoneNumbersEqualWithCountries();
    }
    sqlite3_result_int(a3, v12);
  }
  else
  {
    sqlite3_result_error(a3, "CPSqlitePhoneNumberContainsAlphaCharacters: wrong number of arguments", -1);
  }
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)country
{
  return self->_country;
}

- (void)setCountry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

@end
