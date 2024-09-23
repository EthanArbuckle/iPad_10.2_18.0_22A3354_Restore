@implementation SUUIReleaseNote

- (SUUIReleaseNote)initWithReleaseNoteDictionary:(id)a3 dateFormatter:(id)a4
{
  id v6;
  id v7;
  SUUIReleaseNote *v8;
  void *v9;
  uint64_t v10;
  NSString *changeNotes;
  void *v12;
  uint64_t v13;
  NSString *versionString;
  void *v15;
  uint64_t v16;
  NSDate *date;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)SUUIReleaseNote;
  v8 = -[SUUIReleaseNote init](&v19, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("releaseNotes"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = objc_msgSend(v9, "copy");
      changeNotes = v8->_changeNotes;
      v8->_changeNotes = (NSString *)v10;

    }
    objc_msgSend(v6, "objectForKey:", CFSTR("versionString"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = objc_msgSend(v12, "copy");
      versionString = v8->_versionString;
      v8->_versionString = (NSString *)v13;

    }
    objc_msgSend(v6, "objectForKey:", CFSTR("releaseDate"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "dateFromString:", v15);
      v16 = objc_claimAutoreleasedReturnValue();
      date = v8->_date;
      v8->_date = (NSDate *)v16;

    }
  }

  return v8;
}

+ (id)dateFormatter
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v2, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ssZZZZZ"));
  return v2;
}

- (NSString)changeNotes
{
  return self->_changeNotes;
}

- (NSDate)date
{
  return self->_date;
}

- (NSString)versionString
{
  return self->_versionString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionString, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_changeNotes, 0);
}

@end
