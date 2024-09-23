@implementation TKSmartCardUserInteractionForPINOperation

- (TKSmartCardUserInteractionForPINOperation)init
{
  TKSmartCardUserInteractionForPINOperation *v2;
  TKSmartCardUserInteractionForPINOperation *v3;
  NSArray *PINMessageIndices;
  NSLocale *locale;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TKSmartCardUserInteractionForPINOperation;
  v2 = -[TKSmartCardUserInteraction init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_PINCompletion = 2;
    PINMessageIndices = v2->_PINMessageIndices;
    v2->_PINMessageIndices = 0;

    locale = v3->_locale;
    v3->_locale = 0;

  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TKSmartCardUserInteractionForPINOperation)initWithCoder:(id)a3
{
  id v4;
  TKSmartCardUserInteractionForPINOperation *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSArray *PINMessageIndices;
  void *v13;
  uint64_t v14;
  NSLocale *locale;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)TKSmartCardUserInteractionForPINOperation;
  v5 = -[TKSmartCardUserInteraction initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PINCompletion"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_PINCompletion = objc_msgSend(v6, "unsignedIntegerValue");

    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("PINMessageIndices"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    PINMessageIndices = v5->_PINMessageIndices;
    v5->_PINMessageIndices = (NSArray *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("locale"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    locale = v5->_locale;
    v5->_locale = (NSLocale *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TKSmartCardUserInteractionForPINOperation;
  v4 = a3;
  -[TKSmartCardUserInteraction encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_PINCompletion, v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("PINCompletion"));

  objc_msgSend(v4, "encodeObject:forKey:", self->_PINMessageIndices, CFSTR("PINMessageIndices"));
  -[TKSmartCardUserInteractionForPINOperation locale](self, "locale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("locale"));

}

- (NSLocale)locale
{
  NSLocale *locale;

  locale = self->_locale;
  if (locale)
    return locale;
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  return (NSLocale *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setLocale:(NSLocale *)locale
{
  objc_storeStrong((id *)&self->_locale, locale);
}

- (unsigned)localeID
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99DC8];
  -[TKSmartCardUserInteractionForPINOperation locale](self, "locale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(v2) = objc_msgSend(v2, "windowsLocaleCodeFromLocaleIdentifier:", v4);

  return (unsigned __int16)v2;
}

- (TKSmartCardPINCompletion)PINCompletion
{
  return self->_PINCompletion;
}

- (void)setPINCompletion:(TKSmartCardPINCompletion)PINCompletion
{
  self->_PINCompletion = PINCompletion;
}

- (NSArray)PINMessageIndices
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPINMessageIndices:(NSArray *)PINMessageIndices
{
  objc_setProperty_atomic(self, a2, PINMessageIndices, 56);
}

- (UInt16)resultSW
{
  return self->_resultSW;
}

- (void)setResultSW:(UInt16)resultSW
{
  self->_resultSW = resultSW;
}

- (NSData)resultData
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (void)setResultData:(NSData *)resultData
{
  objc_setProperty_atomic(self, a2, resultData, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultData, 0);
  objc_storeStrong((id *)&self->_PINMessageIndices, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
