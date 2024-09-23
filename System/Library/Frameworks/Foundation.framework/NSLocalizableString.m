@implementation NSLocalizableString

- (id)awakeAfterUsingCoder:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSString *developmentLanguageString;
  NSString *v9;

  v4 = objc_msgSend((id)objc_msgSend((id)+[NSBundle currentNibPath](NSBundle, "currentNibPath", a3), "lastPathComponent"), "stringByDeletingPathExtension");
  v5 = +[NSBundle currentNibLoadingBundle](NSBundle, "currentNibLoadingBundle");
  if (v4)
  {
    v6 = (void *)v5;
    v7 = (void *)MEMORY[0x186DA8F78]();
    objc_msgSend(v6, "localizedStringsForTable:localization:", v4, 0);
    objc_autoreleasePoolPop(v7);
    developmentLanguageString = (NSString *)objc_msgSend(v6, "localizedStringForKey:value:table:", self->_stringsFileKey, self->_developmentLanguageString, v4);
  }
  else
  {
    developmentLanguageString = self->_developmentLanguageString;
  }
  v9 = developmentLanguageString;

  return developmentLanguageString;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSLocalizableString;
  -[NSLocalizableString dealloc](&v3, sel_dealloc);
}

- (NSLocalizableString)initWithCoder:(id)a3
{
  NSLocalizableString *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)NSLocalizableString;
  v4 = -[NSString init](&v6, sel_init);
  if (v4)
  {
    v4->_stringsFileKey = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSKey")), "copy");
    v4->_developmentLanguageString = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSDev")), "copy");
  }
  return v4;
}

- (unint64_t)length
{
  return -[NSString length](self->_developmentLanguageString, "length");
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  return -[NSString characterAtIndex:](self->_developmentLanguageString, "characterAtIndex:", a3);
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)NSLocalizableString;
  -[NSString encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", self->_stringsFileKey, CFSTR("NSKey"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_developmentLanguageString, CFSTR("NSDev"));
}

- (NSLocalizableString)initWithStringsFileKey:(id)a3 developmentLanguageString:(id)a4
{
  NSLocalizableString *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)NSLocalizableString;
  v6 = -[NSString init](&v8, sel_init);
  if (v6)
  {
    v6->_stringsFileKey = (NSString *)objc_msgSend(a3, "copy");
    v6->_developmentLanguageString = (NSString *)objc_msgSend(a4, "copy");
  }
  return v6;
}

+ (id)localizableStringWithStringsFileKey:(id)a3 developmentLanguageString:(id)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithStringsFileKey:developmentLanguageString:", a3, a4);
}

- (NSString)stringsFileKey
{
  return self->_stringsFileKey;
}

- (void)setStringsFileKey:(id)a3
{
  NSString *stringsFileKey;

  stringsFileKey = self->_stringsFileKey;
  if (stringsFileKey != a3)
  {

    self->_stringsFileKey = (NSString *)objc_msgSend(a3, "copy");
  }
}

- (NSString)developmentLanguageString
{
  return self->_developmentLanguageString;
}

- (void)setDevelopmentLanguageString:(id)a3
{
  NSString *developmentLanguageString;

  developmentLanguageString = self->_developmentLanguageString;
  if (developmentLanguageString != a3)
  {

    self->_developmentLanguageString = (NSString *)objc_msgSend(a3, "copy");
  }
}

@end
