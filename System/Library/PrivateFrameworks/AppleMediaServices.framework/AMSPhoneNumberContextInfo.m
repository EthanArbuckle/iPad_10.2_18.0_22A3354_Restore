@implementation AMSPhoneNumberContextInfo

- (AMSPhoneNumberContextInfo)initWithPhoneNumber:(id)a3 simLabel:(id)a4 uuid:(id)a5 isVoicePreferred:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  AMSPhoneNumberContextInfo *v14;
  AMSPhoneNumberContextInfo *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)AMSPhoneNumberContextInfo;
  v14 = -[AMSPhoneNumberContextInfo init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_isVoicePreferred = a6;
    objc_storeStrong((id *)&v14->_phoneNumber, a3);
    objc_storeStrong((id *)&v15->_simLabel, a4);
    objc_storeStrong((id *)&v15->_uuid, a5);
  }

  return v15;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AMSPhoneNumberContextInfo isVoicePreferred](self, "isVoicePreferred"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v4, CFSTR("voicePreferred"));

  -[AMSPhoneNumberContextInfo phoneNumber](self, "phoneNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v5, CFSTR("phoneNumber"));

  -[AMSPhoneNumberContextInfo simLabel](self, "simLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v6, CFSTR("simLabel"));

  -[AMSPhoneNumberContextInfo uuid](self, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v7, CFSTR("uuid"));

  v8 = (void *)objc_msgSend(v3, "copy");
  -[NSObject ams_generateDescriptionWithSubObjects:](self, "ams_generateDescriptionWithSubObjects:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isVoicePreferred
{
  return self->_isVoicePreferred;
}

- (NSString)phoneNumber
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)simLabel
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_simLabel, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
}

@end
