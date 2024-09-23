@implementation BuddyMultilingualLanguageData

+ (id)withLanguageMainDisplayText:(id)a3 secondaryDisplayText:(id)a4 identifier:(id)a5 isDefault:(BOOL)a6 editingOption:(unint64_t)a7
{
  id v11;
  id v12;
  id v13;
  id v15;
  unint64_t v16;
  BOOL v17;
  id v18;
  id v19;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v19 = 0;
  objc_storeStrong(&v19, a4);
  v18 = 0;
  objc_storeStrong(&v18, a5);
  v17 = a6;
  v16 = a7;
  v15 = objc_opt_new(BuddyMultilingualLanguageData);
  v11 = objc_msgSend(location[0], "copy");
  objc_msgSend(v15, "setDisplayText:", v11);

  v12 = objc_msgSend(v19, "copy");
  objc_msgSend(v15, "setSecondaryDisplayText:", v12);

  objc_msgSend(v15, "setIsDefault:", a6);
  objc_msgSend(v15, "setEditingOptions:", v16);
  objc_msgSend(v15, "set_identifier:", v18);
  objc_msgSend(v15, "setShowDetailText:", 1);
  v13 = v15;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
  return v13;
}

+ (id)withLanguage:(id)a3 isDefault:(BOOL)a4 editingOption:(unint64_t)a5
{
  id v7;
  id v9[2];
  BOOL v10;
  id location[2];
  id v12;

  v12 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = a4;
  v9[1] = (id)a5;
  v9[0] = objc_msgSend(v12, "withLanguage:defaults:editingOption:", location[0], &__NSArray0__struct, a5);
  objc_msgSend(v9[0], "setIsDefault:", a4);
  v7 = v9[0];
  objc_storeStrong(v9, 0);
  objc_storeStrong(location, 0);
  return v7;
}

+ (id)withLanguage:(id)a3 defaults:(id)a4 editingOption:(unint64_t)a5
{
  IPLanguage *v7;
  id v8;
  id v9;
  id v10;
  IPLanguage *v11;
  id v12;
  id v13;
  id v15;
  id v16;
  char v17;
  unint64_t v18;
  id v19;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v19 = 0;
  objc_storeStrong(&v19, a4);
  v18 = a5;
  v17 = objc_msgSend(v19, "containsObject:", location[0]) & 1;
  v16 = objc_opt_new(BuddyMultilingualLanguageData);
  v7 = +[IPLanguage languageWithIdentifier:](IPLanguage, "languageWithIdentifier:", location[0]);
  v15 = -[IPLanguage localizedStringForName](v7, "localizedStringForName");

  v8 = objc_msgSend(v15, "copy");
  objc_msgSend(v16, "setDisplayText:", v8);

  v9 = objc_msgSend(location[0], "copy");
  objc_msgSend(v16, "set_identifier:", v9);

  objc_msgSend(v16, "setIsDefault:", v17 & 1);
  objc_msgSend(v16, "setSecondaryDisplayText:", 0);
  v10 = +[BuddyMultilingualDataModelProvider selectedLanguage](BuddyMultilingualDataModelProvider, "selectedLanguage");
  LOBYTE(a4) = objc_msgSend(v10, "isEqualToString:", location[0]) ^ 1;

  if ((a4 & 1) != 0)
  {
    v11 = +[IPLanguage languageWithIdentifier:](IPLanguage, "languageWithIdentifier:", location[0]);
    v12 = -[IPLanguage name](v11, "name");
    objc_msgSend(v16, "setSecondaryDisplayText:", v12);

  }
  objc_msgSend(v16, "setEditingOptions:", v18, v15);
  objc_msgSend(v16, "setShowDetailText:", 1);
  v13 = v16;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
  return v13;
}

+ (id)languageShortFormat:(id)a3
{
  NSLocale *v3;
  id v4;
  id v6;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = +[NSLocale baseLanguageFromLanguage:](NSLocale, "baseLanguageFromLanguage:", location[0]);
  v3 = +[NSLocale currentLocale](NSLocale, "currentLocale");
  v4 = -[NSLocale localizedStringForLanguage:context:](v3, "localizedStringForLanguage:context:", v6, 3);

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  NSString *v3;
  id v4;
  id v5;
  id v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  unsigned __int8 v9;
  char v11;
  id v12;
  char v13;
  id v14;
  char v15;
  id v16;
  char v17;
  id v18;
  char v19;
  id v20;
  char v21;
  id v22;
  char v23;
  id v24;
  char v25;
  id v26;
  id v27;
  id v28;
  id location[2];
  BuddyMultilingualLanguageData *v30;
  char v31;

  v30 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v28 = objc_retainBlock(&stru_100282690);
  if ((objc_msgSend(location[0], "conformsToProtocol:", &OBJC_PROTOCOL___BuddyMultilingualDisplayableViewModel) & 1) != 0)
  {
    v27 = location[0];
    v3 = -[BuddyMultilingualLanguageData identifier](v30, "identifier");
    v4 = (id)(*((uint64_t (**)(id, NSString *))v28 + 2))(v28, v3);
    v5 = objc_msgSend(v27, "identifier");
    v6 = (id)(*((uint64_t (**)(id, id))v28 + 2))(v28, v5);
    v7 = objc_msgSend(v4, "isEqual:", v6);
    v25 = 0;
    v23 = 0;
    v21 = 0;
    v19 = 0;
    v17 = 0;
    v15 = 0;
    v13 = 0;
    v11 = 0;
    v8 = 0;
    if ((v7 & 1) != 0)
    {
      v26 = -[BuddyMultilingualLanguageData title](v30, "title");
      v25 = 1;
      v24 = (id)(*((uint64_t (**)(id))v28 + 2))(v28);
      v23 = 1;
      v22 = objc_msgSend(v27, "title");
      v21 = 1;
      v20 = (id)(*((uint64_t (**)(id))v28 + 2))(v28);
      v19 = 1;
      v9 = objc_msgSend(v24, "isEqual:");
      v8 = 0;
      if ((v9 & 1) != 0)
      {
        v18 = -[BuddyMultilingualLanguageData detailText](v30, "detailText");
        v17 = 1;
        v16 = (id)(*((uint64_t (**)(id))v28 + 2))(v28);
        v15 = 1;
        v14 = objc_msgSend(v27, "detailText");
        v13 = 1;
        v12 = (id)(*((uint64_t (**)(id))v28 + 2))(v28);
        v11 = 1;
        v8 = objc_msgSend(v16, "isEqual:");
      }
    }
    v31 = v8 & 1;
    if ((v11 & 1) != 0)

    if ((v13 & 1) != 0)
    if ((v15 & 1) != 0)

    if ((v17 & 1) != 0)
    if ((v19 & 1) != 0)

    if ((v21 & 1) != 0)
    if ((v23 & 1) != 0)

    if ((v25 & 1) != 0)
    objc_storeStrong(&v27, 0);
  }
  else
  {
    v31 = 0;
  }
  objc_storeStrong(&v28, 0);
  objc_storeStrong(location, 0);
  return v31 & 1;
}

- (unint64_t)hash
{
  NSString *v2;
  NSUInteger v3;
  id v4;
  unint64_t v5;
  id v6;
  unint64_t v7;

  v2 = -[BuddyMultilingualLanguageData identifier](self, "identifier", a2);
  v3 = -[NSString hash](v2, "hash");
  v4 = -[BuddyMultilingualLanguageData title](self, "title");
  v5 = v3 ^ (unint64_t)objc_msgSend(v4, "hash");
  v6 = -[BuddyMultilingualLanguageData detailText](self, "detailText");
  v7 = v5 ^ (unint64_t)objc_msgSend(v6, "hash");

  return v7;
}

- (id)title
{
  return -[BuddyMultilingualLanguageData displayText](self, "displayText", a2, self);
}

- (id)detailText
{
  NSString *v2;
  char v4;
  NSString *v5;
  NSString *v7;

  v4 = 0;
  if (-[BuddyMultilingualLanguageData showDetailText](self, "showDetailText"))
  {
    v2 = -[BuddyMultilingualLanguageData secondaryDisplayText](self, "secondaryDisplayText");
    v5 = v2;
    v4 = 1;
  }
  else
  {
    v2 = 0;
  }
  v7 = v2;
  if ((v4 & 1) != 0)

  return v7;
}

- (NSString)identifier
{
  return -[BuddyMultilingualLanguageData _identifier](self, "_identifier", a2, self);
}

- (unint64_t)editingOptions
{
  return self->_editingOptions;
}

- (NSString)description
{
  return -[BuddyMultilingualLanguageData identifier](self, "identifier", a2, self);
}

- (NSString)displayText
{
  return self->_displayText;
}

- (void)setDisplayText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)secondaryDisplayText
{
  return self->_secondaryDisplayText;
}

- (void)setSecondaryDisplayText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isDefault
{
  return self->_isDefault;
}

- (void)setIsDefault:(BOOL)a3
{
  self->_isDefault = a3;
}

- (BOOL)showDetailText
{
  return self->_showDetailText;
}

- (void)setShowDetailText:(BOOL)a3
{
  self->_showDetailText = a3;
}

- (NSString)_identifier
{
  return self->__identifier;
}

- (void)set_identifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setEditingOptions:(unint64_t)a3
{
  self->_editingOptions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__identifier, 0);
  objc_storeStrong((id *)&self->_secondaryDisplayText, 0);
  objc_storeStrong((id *)&self->_displayText, 0);
}

@end
