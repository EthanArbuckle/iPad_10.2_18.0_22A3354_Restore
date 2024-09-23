@implementation CNCollationLanguage

- (CNCollationLanguage)initWithSections:(id)a3 lastCharacter:(id)a4 firstCharacterAfterLanguage:(id)a5
{
  id v8;
  id v9;
  id v10;
  CNCollationLanguage *v11;
  uint64_t v12;
  NSArray *sections;
  uint64_t v14;
  NSString *lastCharacter;
  uint64_t v16;
  NSString *firstCharacterAfterLanguage;
  CNCollationLanguage *v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)CNCollationLanguage;
  v11 = -[CNCollationLanguage init](&v20, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    sections = v11->_sections;
    v11->_sections = (NSArray *)v12;

    v14 = objc_msgSend(v9, "copy");
    lastCharacter = v11->_lastCharacter;
    v11->_lastCharacter = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    firstCharacterAfterLanguage = v11->_firstCharacterAfterLanguage;
    v11->_firstCharacterAfterLanguage = (NSString *)v16;

    v18 = v11;
  }

  return v11;
}

- (NSArray)sections
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)lastCharacter
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)firstCharacterAfterLanguage
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstCharacterAfterLanguage, 0);
  objc_storeStrong((id *)&self->_lastCharacter, 0);
  objc_storeStrong((id *)&self->_sections, 0);
}

@end
