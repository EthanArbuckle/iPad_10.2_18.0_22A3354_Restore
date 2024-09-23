@implementation _EARPeopleSuggesterConfig

- (_EARPeopleSuggesterConfig)initWithContactsCount:(unsigned int)a3 bestContactsCount:(unsigned int)a4 bestContactsBonus:(unsigned int)a5
{
  _EARPeopleSuggesterConfig *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_EARPeopleSuggesterConfig;
  result = -[_EARPeopleSuggesterConfig init](&v9, sel_init);
  result->_contactsCount = a3;
  result->_bestContactsCount = a4;
  result->_bestContactsBonus = a5;
  return result;
}

- (unsigned)contactsCount
{
  return self->_contactsCount;
}

- (unsigned)bestContactsCount
{
  return self->_bestContactsCount;
}

- (unsigned)bestContactsBonus
{
  return self->_bestContactsBonus;
}

@end
