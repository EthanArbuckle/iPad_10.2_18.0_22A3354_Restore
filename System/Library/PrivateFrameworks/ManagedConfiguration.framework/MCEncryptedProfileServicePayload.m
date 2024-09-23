@implementation MCEncryptedProfileServicePayload

+ (id)typeStrings
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("com.apple.placeholder.encryptedprofileservice"));
}

+ (id)localizedSingularForm
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  return MCLocalizedFormat(CFSTR("DEVICE_ENROLLMENT_CHALLENGE_SINGULAR_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  return MCLocalizedFormat(CFSTR("DEVICE_ENROLLMENT_CHALLENGE_PLURAL_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCEncryptedProfileServicePayload)initWithURLString:(id)a3 profile:(id)a4
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  MCEncryptedProfileServicePayload *v14;
  objc_super v16;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v17[0] = CFSTR("PayloadVersion");
  v17[1] = CFSTR("PayloadType");
  v18[0] = &unk_1E4212A90;
  v18[1] = CFSTR("com.apple.placeholder.encryptedprofileservice");
  v17[2] = CFSTR("PayloadIdentifier");
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = a4;
  objc_msgSend(v8, "MCMakeUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v10;
  v17[3] = CFSTR("PayloadUUID");
  objc_msgSend(MEMORY[0x1E0CB3940], "MCMakeUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  v16.receiver = self;
  v16.super_class = (Class)MCEncryptedProfileServicePayload;
  v14 = -[MCPayload initWithDictionary:profile:outError:](&v16, sel_initWithDictionary_profile_outError_, v13, v9, 0);

  if (v14)
    objc_storeStrong((id *)&v14->_urlString, a3);

  return v14;
}

- (id)verboseDescription
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v7.receiver = self;
  v7.super_class = (Class)MCEncryptedProfileServicePayload;
  -[MCPayload verboseDescription](&v7, sel_verboseDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_urlString)
    objc_msgSend(v5, "appendFormat:", CFSTR("URL         : %@"), self->_urlString);
  return v5;
}

- (id)title
{
  return MCLocalizedString(CFSTR("DEVICE_ENROLLMENT_CHALLENGE_TITLE"));
}

- (id)subtitle1Label
{
  __CFString *v2;

  if (self->_urlString)
    v2 = CFSTR("DEVICE_ENROLLMENT_CHALLENGE_URL_COLON");
  else
    v2 = CFSTR("DEVICE_ENROLLMENT_CHALLENGE_URL_MISSING");
  MCLocalizedString(v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)subtitle1Description
{
  return self->_urlString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlString, 0);
}

@end
