@implementation AISSetupContextCandidateAccount

- (AISSetupContextCandidateAccount)initWithAltDSID:(id)a3 username:(id)a4 nameComponents:(id)a5
{
  id v9;
  id v10;
  id v11;
  AISSetupContextCandidateAccount *v12;
  AISSetupContextCandidateAccount *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AISSetupContextCandidateAccount;
  v12 = -[AISSetupContextCandidateAccount init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_altDSID, a3);
    objc_storeStrong((id *)&v13->_username, a4);
    objc_storeStrong((id *)&v13->_nameComponents, a5);
  }

  return v13;
}

- (NSString)formattedShortName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_class();
  -[AISSetupContextCandidateAccount nameComponents](self, "nameComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_defaultShortNameFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_stringFromPersonNameComponents:personNameComponentsFormatter:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

+ (id)_defaultShortNameFormatter
{
  if (_defaultShortNameFormatter_token != -1)
    dispatch_once(&_defaultShortNameFormatter_token, &__block_literal_global);
  return (id)_defaultShortNameFormatter_formatter;
}

uint64_t __61__AISSetupContextCandidateAccount__defaultShortNameFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1738]);
  v1 = (void *)_defaultShortNameFormatter_formatter;
  _defaultShortNameFormatter_formatter = (uint64_t)v0;

  return objc_msgSend((id)_defaultShortNameFormatter_formatter, "setStyle:", 1);
}

+ (id)_stringFromPersonNameComponents:(id)a3 personNameComponentsFormatter:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
    goto LABEL_4;
  objc_msgSend(v6, "stringFromPersonNameComponents:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "length"))
  {

LABEL_4:
    v8 = 0;
  }

  return v8;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSPersonNameComponents)nameComponents
{
  return self->_nameComponents;
}

- (void)setNameComponents:(id)a3
{
  objc_storeStrong((id *)&self->_nameComponents, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameComponents, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
}

@end
