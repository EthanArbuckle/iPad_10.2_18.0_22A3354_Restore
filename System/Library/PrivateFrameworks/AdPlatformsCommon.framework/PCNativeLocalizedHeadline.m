@implementation PCNativeLocalizedHeadline

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PCNativeLocalizedHeadline)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  PCNativeLocalizedHeadline *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  double v15;
  double v16;
  uint64_t v17;
  NSString *languageIdentifier;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  double v22;
  double v23;
  uint64_t v24;
  NSString *value;

  v4 = a3;
  v11 = (PCNativeLocalizedHeadline *)objc_msgSend_init(self, v5, v6, v7, v8, v9, v10);
  if (v11)
  {
    v12 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v12, (uint64_t)CFSTR("languageIdentifier"), v14, v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    languageIdentifier = v11->_languageIdentifier;
    v11->_languageIdentifier = (NSString *)v17;

    v19 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, (uint64_t)CFSTR("value"), v21, v22, v23);
    v24 = objc_claimAutoreleasedReturnValue();
    value = v11->_value;
    v11->_value = (NSString *)v24;

  }
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  double v14;
  double v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  const char *v22;
  uint64_t v23;
  double v24;
  double v25;
  id v26;

  v4 = a3;
  objc_msgSend_languageIdentifier(self, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)v11, (uint64_t)CFSTR("languageIdentifier"), v13, v14, v15);

  objc_msgSend_value(self, v16, v17, v18, v19, v20, v21);
  v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v22, (uint64_t)v26, (uint64_t)CFSTR("value"), v23, v24, v25);

}

- (NSString)languageIdentifier
{
  return self->_languageIdentifier;
}

- (void)setLanguageIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_languageIdentifier, a3);
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_languageIdentifier, 0);
}

@end
