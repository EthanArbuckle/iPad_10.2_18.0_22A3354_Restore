@implementation _SFTextSuggestion

- (_SFTextSuggestion)initWithTextSuggestionType:(int64_t)a3
{
  _SFTextSuggestion *v4;
  _SFTextSuggestion *v5;
  NSString *generatedPassword;
  NSString *username;
  NSURLCredential *urlCredential;
  WBSSavedAccountMatch *savedAccountMatch;
  WBUAutoFillDisplayData *singleDisplayData;
  WBSCreditCardData *creditCardData;
  SFSingleCreditCardData *singleCreditCardData;
  SFCredentialIdentity *credentialIdentity;
  WBSHideMyEmailRecord *emailRecord;
  _SFTextSuggestion *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)_SFTextSuggestion;
  v4 = -[UITextSuggestion init](&v17, sel_init);
  v5 = v4;
  if (v4)
  {
    -[UITextSuggestion setDisplayStylePlain:](v4, "setDisplayStylePlain:", 1);
    v5->_textSuggestionType = a3;
    generatedPassword = v5->_generatedPassword;
    v5->_generatedPassword = 0;

    username = v5->_username;
    v5->_username = 0;

    urlCredential = v5->_urlCredential;
    v5->_urlCredential = 0;

    savedAccountMatch = v5->_savedAccountMatch;
    v5->_savedAccountMatch = 0;

    v5->_submitForm = 0;
    singleDisplayData = v5->_singleDisplayData;
    v5->_singleDisplayData = 0;

    creditCardData = v5->_creditCardData;
    v5->_creditCardData = 0;

    singleCreditCardData = v5->_singleCreditCardData;
    v5->_singleCreditCardData = 0;

    credentialIdentity = v5->_credentialIdentity;
    v5->_credentialIdentity = 0;

    emailRecord = v5->_emailRecord;
    v5->_emailRecord = 0;

    v15 = v5;
  }

  return v5;
}

+ (_SFTextSuggestion)textSuggestionWithOneTimeCode:(id)a3
{
  SFAutoFillOneTimeCode *v3;
  _SFTextSuggestion *v4;
  SFAutoFillOneTimeCode *oneTimeCode;

  v3 = (SFAutoFillOneTimeCode *)a3;
  v4 = -[_SFTextSuggestion initWithTextSuggestionType:]([_SFTextSuggestion alloc], "initWithTextSuggestionType:", 0);
  oneTimeCode = v4->_oneTimeCode;
  v4->_oneTimeCode = v3;

  return v4;
}

+ (_SFTextSuggestion)textSuggestionWithGeneratedPassword:(id)a3
{
  NSString *v3;
  _SFTextSuggestion *v4;
  NSString *generatedPassword;

  v3 = (NSString *)a3;
  v4 = -[_SFTextSuggestion initWithTextSuggestionType:]([_SFTextSuggestion alloc], "initWithTextSuggestionType:", 1);
  generatedPassword = v4->_generatedPassword;
  v4->_generatedPassword = v3;

  return v4;
}

+ (id)textSuggestionToCustomizeGeneratedPassword
{
  return -[_SFTextSuggestion initWithTextSuggestionType:]([_SFTextSuggestion alloc], "initWithTextSuggestionType:", 2);
}

+ (_SFTextSuggestion)textSuggestionWithUsername:(id)a3
{
  NSString *v3;
  _SFTextSuggestion *v4;
  NSString *username;

  v3 = (NSString *)a3;
  v4 = -[_SFTextSuggestion initWithTextSuggestionType:]([_SFTextSuggestion alloc], "initWithTextSuggestionType:", 3);
  username = v4->_username;
  v4->_username = v3;

  return v4;
}

+ (_SFTextSuggestion)textSuggestionWithSavedAccountMatch:(id)a3 submitForm:(BOOL)a4
{
  WBSSavedAccountMatch *v5;
  _SFTextSuggestion *v6;
  WBSSavedAccountMatch *savedAccountMatch;

  v5 = (WBSSavedAccountMatch *)a3;
  v6 = -[_SFTextSuggestion initWithTextSuggestionType:]([_SFTextSuggestion alloc], "initWithTextSuggestionType:", 4);
  savedAccountMatch = v6->_savedAccountMatch;
  v6->_savedAccountMatch = v5;

  v6->_submitForm = a4;
  return v6;
}

+ (_SFTextSuggestion)textSuggestionWithSingleDisplayData:(id)a3
{
  WBUAutoFillDisplayData *v3;
  _SFTextSuggestion *v4;
  WBUAutoFillDisplayData *singleDisplayData;

  v3 = (WBUAutoFillDisplayData *)a3;
  v4 = -[_SFTextSuggestion initWithTextSuggestionType:]([_SFTextSuggestion alloc], "initWithTextSuggestionType:", 5);
  singleDisplayData = v4->_singleDisplayData;
  v4->_singleDisplayData = v3;

  return v4;
}

+ (_SFTextSuggestion)textSuggestionWithCredentialIdentity:(id)a3 submitForm:(BOOL)a4
{
  SFCredentialIdentity *v5;
  _SFTextSuggestion *v6;
  SFCredentialIdentity *credentialIdentity;

  v5 = (SFCredentialIdentity *)a3;
  v6 = -[_SFTextSuggestion initWithTextSuggestionType:]([_SFTextSuggestion alloc], "initWithTextSuggestionType:", 6);
  credentialIdentity = v6->_credentialIdentity;
  v6->_credentialIdentity = v5;

  v6->_submitForm = a4;
  return v6;
}

+ (_SFTextSuggestion)textSuggestionWithCreditCardData:(id)a3
{
  WBSCreditCardData *v3;
  _SFTextSuggestion *v4;
  WBSCreditCardData *creditCardData;

  v3 = (WBSCreditCardData *)a3;
  v4 = -[_SFTextSuggestion initWithTextSuggestionType:]([_SFTextSuggestion alloc], "initWithTextSuggestionType:", 7);
  creditCardData = v4->_creditCardData;
  v4->_creditCardData = v3;

  return v4;
}

+ (_SFTextSuggestion)textSuggestionWithSingleCreditCardDataValue:(id)a3
{
  SFSingleCreditCardData *v3;
  _SFTextSuggestion *v4;
  SFSingleCreditCardData *singleCreditCardData;

  v3 = (SFSingleCreditCardData *)a3;
  v4 = -[_SFTextSuggestion initWithTextSuggestionType:]([_SFTextSuggestion alloc], "initWithTextSuggestionType:", 8);
  singleCreditCardData = v4->_singleCreditCardData;
  v4->_singleCreditCardData = v3;

  return v4;
}

+ (_SFTextSuggestion)textSuggestionWithHideMyEmailRecord:(id)a3
{
  WBSHideMyEmailRecord *v3;
  _SFTextSuggestion *v4;
  WBSHideMyEmailRecord *emailRecord;

  v3 = (WBSHideMyEmailRecord *)a3;
  v4 = -[_SFTextSuggestion initWithTextSuggestionType:]([_SFTextSuggestion alloc], "initWithTextSuggestionType:", 9);
  emailRecord = v4->_emailRecord;
  v4->_emailRecord = v3;

  return v4;
}

+ (id)textSuggestionToProvisionHideMyEmailRecord
{
  return -[_SFTextSuggestion initWithTextSuggestionType:]([_SFTextSuggestion alloc], "initWithTextSuggestionType:", 10);
}

+ (_SFTextSuggestion)textSuggestionWithESimDataType:(int64_t)a3
{
  _SFTextSuggestion *v4;

  v4 = -[_SFTextSuggestion initWithTextSuggestionType:]([_SFTextSuggestion alloc], "initWithTextSuggestionType:", 11);
  v4->_eSimDataType = a3;
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_SFTextSuggestion;
  v4 = a3;
  -[UITextSuggestion encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt:forKey:", LODWORD(self->_textSuggestionType), CFSTR("textSuggestionType"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_oneTimeCode, CFSTR("oneTimeCode"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_generatedPassword, CFSTR("generatedPassword"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_username, CFSTR("username"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_urlCredential, CFSTR("urlCredential"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_submitForm, CFSTR("submitForm"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_singleDisplayData, CFSTR("singleDisplayData"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_creditCardData, CFSTR("creditCardData"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_singleCreditCardData, CFSTR("singleCreditCardData"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_credentialIdentity, CFSTR("credentialIdentity"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_emailRecord, CFSTR("emailRecord"));

}

- (_SFTextSuggestion)initWithCoder:(id)a3
{
  id v4;
  _SFTextSuggestion *v5;
  _SFTextSuggestion *v6;
  uint64_t v7;
  SFAutoFillOneTimeCode *oneTimeCode;
  uint64_t v9;
  NSString *generatedPassword;
  uint64_t v11;
  NSString *username;
  uint64_t v13;
  NSURLCredential *urlCredential;
  uint64_t v15;
  WBUAutoFillDisplayData *singleDisplayData;
  uint64_t v17;
  WBSCreditCardData *creditCardData;
  uint64_t v19;
  SFSingleCreditCardData *singleCreditCardData;
  uint64_t v21;
  SFCredentialIdentity *credentialIdentity;
  uint64_t v23;
  WBSHideMyEmailRecord *emailRecord;
  _SFTextSuggestion *v25;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)_SFTextSuggestion;
  v5 = -[UITextSuggestion initWithCoder:](&v27, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    -[UITextSuggestion setDisplayStylePlain:](v5, "setDisplayStylePlain:", 1);
    v6->_textSuggestionType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("textSuggestionType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("oneTimeCode"));
    v7 = objc_claimAutoreleasedReturnValue();
    oneTimeCode = v6->_oneTimeCode;
    v6->_oneTimeCode = (SFAutoFillOneTimeCode *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("generatedPassword"));
    v9 = objc_claimAutoreleasedReturnValue();
    generatedPassword = v6->_generatedPassword;
    v6->_generatedPassword = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("username"));
    v11 = objc_claimAutoreleasedReturnValue();
    username = v6->_username;
    v6->_username = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("urlCredential"));
    v13 = objc_claimAutoreleasedReturnValue();
    urlCredential = v6->_urlCredential;
    v6->_urlCredential = (NSURLCredential *)v13;

    v6->_submitForm = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("submitForm"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("singleDisplayData"));
    v15 = objc_claimAutoreleasedReturnValue();
    singleDisplayData = v6->_singleDisplayData;
    v6->_singleDisplayData = (WBUAutoFillDisplayData *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creditCardData"));
    v17 = objc_claimAutoreleasedReturnValue();
    creditCardData = v6->_creditCardData;
    v6->_creditCardData = (WBSCreditCardData *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("singleCreditCardData"));
    v19 = objc_claimAutoreleasedReturnValue();
    singleCreditCardData = v6->_singleCreditCardData;
    v6->_singleCreditCardData = (SFSingleCreditCardData *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("credentialIdentity"));
    v21 = objc_claimAutoreleasedReturnValue();
    credentialIdentity = v6->_credentialIdentity;
    v6->_credentialIdentity = (SFCredentialIdentity *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("emailRecord"));
    v23 = objc_claimAutoreleasedReturnValue();
    emailRecord = v6->_emailRecord;
    v6->_emailRecord = (WBSHideMyEmailRecord *)v23;

    v25 = v6;
  }

  return v6;
}

- (int64_t)textSuggestionType
{
  return self->_textSuggestionType;
}

- (SFAutoFillOneTimeCode)oneTimeCode
{
  return self->_oneTimeCode;
}

- (NSString)generatedPassword
{
  return self->_generatedPassword;
}

- (NSString)username
{
  return self->_username;
}

- (NSURLCredential)urlCredential
{
  return self->_urlCredential;
}

- (WBSSavedAccountMatch)savedAccountMatch
{
  return self->_savedAccountMatch;
}

- (BOOL)submitForm
{
  return self->_submitForm;
}

- (WBUAutoFillDisplayData)singleDisplayData
{
  return self->_singleDisplayData;
}

- (WBSCreditCardData)creditCardData
{
  return self->_creditCardData;
}

- (SFSingleCreditCardData)singleCreditCardData
{
  return self->_singleCreditCardData;
}

- (SFCredentialIdentity)credentialIdentity
{
  return self->_credentialIdentity;
}

- (WBSHideMyEmailRecord)emailRecord
{
  return self->_emailRecord;
}

- (int64_t)eSimDataType
{
  return self->_eSimDataType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emailRecord, 0);
  objc_storeStrong((id *)&self->_credentialIdentity, 0);
  objc_storeStrong((id *)&self->_singleCreditCardData, 0);
  objc_storeStrong((id *)&self->_creditCardData, 0);
  objc_storeStrong((id *)&self->_singleDisplayData, 0);
  objc_storeStrong((id *)&self->_savedAccountMatch, 0);
  objc_storeStrong((id *)&self->_urlCredential, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_generatedPassword, 0);
  objc_storeStrong((id *)&self->_oneTimeCode, 0);
}

@end
