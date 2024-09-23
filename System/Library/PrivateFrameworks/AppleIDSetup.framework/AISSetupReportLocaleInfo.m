@implementation AISSetupReportLocaleInfo

- (NSString)preferredLanguage
{
  return (NSString *)-[NSArray firstObject](self->_languages, "firstObject");
}

- (NSString)localeID
{
  return self->_localeID;
}

- (void)setLocaleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)languages
{
  return self->_languages;
}

- (void)setLanguages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)keyboards
{
  return self->_keyboards;
}

- (void)setKeyboards:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboards, 0);
  objc_storeStrong((id *)&self->_languages, 0);
  objc_storeStrong((id *)&self->_localeID, 0);
}

@end
