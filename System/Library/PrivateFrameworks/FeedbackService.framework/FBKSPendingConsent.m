@implementation FBKSPendingConsent

- (FBKSPendingConsent)initWithDictionary:(id)a3
{
  id v4;
  FBKSPendingConsent *v5;
  uint64_t v6;
  NSNumber *ID;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSURL *learnMoreURL;
  void *v20;
  void *v21;
  void *v22;
  NSString *v23;
  void *title;
  uint64_t v25;
  NSString *v26;
  void *v27;
  void *v28;
  NSString *v29;
  void *bodyText;
  uint64_t v31;
  NSString *v32;
  void *v33;
  void *v34;
  NSString *v35;
  void *agreeButtonText;
  uint64_t v37;
  NSString *v38;
  void *v39;
  void *v40;
  NSString *v41;
  void *declineButtonText;
  uint64_t v43;
  NSString *v44;
  objc_super v46;

  v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)FBKSPendingConsent;
  v5 = -[FBKSPendingConsent init](&v46, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("id"));
    v6 = objc_claimAutoreleasedReturnValue();
    ID = v5->_ID;
    v5->_ID = (NSNumber *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _FBKSNilIfNSNull(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 && (objc_msgSend(v9, "isEqualToString:", &stru_250C613A8) & 1) == 0)
    {
      objc_msgSend(v10, "lowercaseString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_msgSend(v12, "isEqualToString:", CFSTR("confidentiality_agreement"));
      v10 = v12;
    }
    else
    {
      v11 = 0;
    }

    v5->_type = v11;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("icon"));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
      v15 = (__CFString *)v13;
    else
      v15 = CFSTR("person.crop.circle");
    objc_storeStrong((id *)&v5->_symbolImageName, v15);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("learn_more"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    _FBKSNilIfNSNull(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v17);
    v18 = objc_claimAutoreleasedReturnValue();
    learnMoreURL = v5->_learnMoreURL;
    v5->_learnMoreURL = (NSURL *)v18;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("properties"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isRequired = objc_msgSend(v20, "containsObject:", CFSTR("PARTICIPANT_REQUIRED"));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
    {
      v23 = v21;
      title = v5->_title;
      v5->_title = v23;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      title = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(title, "localizedStringForKey:value:table:", CFSTR("CONSENT_DEFAULT_TITLE"), CFSTR("Apple and Your Privacy"), 0);
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = v5->_title;
      v5->_title = (NSString *)v25;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v27)
    {
      v29 = v27;
      bodyText = v5->_bodyText;
      v5->_bodyText = v29;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      bodyText = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(bodyText, "localizedStringForKey:value:table:", CFSTR("CONSENT_DEFAULT_BODY"), CFSTR("Please read the following terms to continue."), 0);
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = v5->_bodyText;
      v5->_bodyText = (NSString *)v31;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("agree_text_button"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (v33)
    {
      v35 = v33;
      agreeButtonText = v5->_agreeButtonText;
      v5->_agreeButtonText = v35;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      agreeButtonText = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(agreeButtonText, "localizedStringForKey:value:table:", CFSTR("CONSENT_DEFAULT_ACCEPT"), CFSTR("Accept"), 0);
      v37 = objc_claimAutoreleasedReturnValue();
      v38 = v5->_agreeButtonText;
      v5->_agreeButtonText = (NSString *)v37;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("decline_text_button"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v39;
    if (v39)
    {
      v41 = v39;
      declineButtonText = v5->_declineButtonText;
      v5->_declineButtonText = v41;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      declineButtonText = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(declineButtonText, "localizedStringForKey:value:table:", CFSTR("CONSENT_DEFAULT_DECLINE"), CFSTR("Decline"), 0);
      v43 = objc_claimAutoreleasedReturnValue();
      v44 = v5->_declineButtonText;
      v5->_declineButtonText = (NSString *)v43;

    }
  }

  return v5;
}

- (NSString)consentTypeString
{
  if (-[FBKSPendingConsent type](self, "type") == 1)
    return (NSString *)CFSTR("confidentiality_agreement");
  else
    return 0;
}

- (NSNumber)ID
{
  return self->_ID;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)bodyText
{
  return self->_bodyText;
}

- (NSString)symbolImageName
{
  return self->_symbolImageName;
}

- (NSURL)learnMoreURL
{
  return self->_learnMoreURL;
}

- (NSString)agreeButtonText
{
  return self->_agreeButtonText;
}

- (NSString)declineButtonText
{
  return self->_declineButtonText;
}

- (BOOL)isRequired
{
  return self->_isRequired;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_declineButtonText, 0);
  objc_storeStrong((id *)&self->_agreeButtonText, 0);
  objc_storeStrong((id *)&self->_learnMoreURL, 0);
  objc_storeStrong((id *)&self->_symbolImageName, 0);
  objc_storeStrong((id *)&self->_bodyText, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_ID, 0);
}

@end
