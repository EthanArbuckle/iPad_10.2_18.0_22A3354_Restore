@implementation CHPhoneNumber

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isoCountryCode, 0);
  objc_storeStrong((id *)&self->_digits, 0);
  objc_storeStrong((id *)&self->_normalizedRepresentation, 0);
  objc_storeStrong((id *)&self->_formattedRepresentation, 0);
}

- (CHPhoneNumber)initWithDigits:(id)a3 isoCountryCode:(id)a4
{
  id v6;
  id v7;
  CHPhoneNumber *v8;
  uint64_t v9;
  NSString *digits;
  uint64_t v11;
  NSString *isoCountryCode;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CHPhoneNumber;
  v8 = -[CHLogger initWithDomain:](&v14, sel_initWithDomain_, "CHPhoneNumber");
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    digits = v8->_digits;
    v8->_digits = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    isoCountryCode = v8->_isoCountryCode;
    v8->_isoCountryCode = (NSString *)v11;

  }
  return v8;
}

- (NSString)formattedRepresentation
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const void *v8;
  NSString *String;
  NSString *formattedRepresentation;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!-[CHPhoneNumber formattedRepresentationAttempted](self, "formattedRepresentationAttempted"))
  {
    -[CHLogger logHandle](self, "logHandle");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      -[CHPhoneNumber digits](self, "digits");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[CHPhoneNumber isoCountryCode](self, "isoCountryCode");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v4;
      v14 = 2114;
      v15 = v5;
      _os_log_impl(&dword_1B3FA4000, v3, OS_LOG_TYPE_DEFAULT, "Not formatted. So let's create a CFPhoneNumberRef. Num: %@, iso: %{public}@", (uint8_t *)&v12, 0x16u);

    }
    -[CHPhoneNumber digits](self, "digits");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CHPhoneNumber isoCountryCode](self, "isoCountryCode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (const void *)CFPhoneNumberCreate();

    if (v8)
    {
      String = (NSString *)CFPhoneNumberCreateString();
      formattedRepresentation = self->_formattedRepresentation;
      self->_formattedRepresentation = String;

      CFRelease(v8);
    }
    -[CHPhoneNumber setFormattedRepresentationAttempted:](self, "setFormattedRepresentationAttempted:", 1);
  }
  return self->_formattedRepresentation;
}

- (NSString)isoCountryCode
{
  return self->_isoCountryCode;
}

- (NSString)digits
{
  return self->_digits;
}

- (void)setFormattedRepresentationAttempted:(BOOL)a3
{
  self->_formattedRepresentationAttempted = a3;
}

- (BOOL)formattedRepresentationAttempted
{
  return self->_formattedRepresentationAttempted;
}

- (NSString)normalizedRepresentation
{
  void *v3;
  void *v4;
  const void *v5;
  NSString *String;
  NSString *normalizedRepresentation;

  if (!-[CHPhoneNumber normalizedRepresentationAttempted](self, "normalizedRepresentationAttempted"))
  {
    -[CHPhoneNumber digits](self, "digits");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CHPhoneNumber isoCountryCode](self, "isoCountryCode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (const void *)CFPhoneNumberCreate();

    if (v5)
    {
      String = (NSString *)CFPhoneNumberCreateString();
      normalizedRepresentation = self->_normalizedRepresentation;
      self->_normalizedRepresentation = String;

      CFRelease(v5);
    }
    -[CHPhoneNumber setNormalizedRepresentationAttempted:](self, "setNormalizedRepresentationAttempted:", 1);
  }
  return self->_normalizedRepresentation;
}

- (void)setIsoCountryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)normalizedRepresentationAttempted
{
  return self->_normalizedRepresentationAttempted;
}

- (void)setNormalizedRepresentationAttempted:(BOOL)a3
{
  self->_normalizedRepresentationAttempted = a3;
}

@end
