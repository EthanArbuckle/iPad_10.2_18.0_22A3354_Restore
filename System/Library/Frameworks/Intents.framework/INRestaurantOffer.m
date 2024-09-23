@implementation INRestaurantOffer

- (INRestaurantOffer)initWithCoder:(id)a3
{
  id v4;
  INRestaurantOffer *v5;
  uint64_t v6;
  NSString *offerTitleText;
  uint64_t v8;
  NSString *offerDetailText;
  uint64_t v10;
  NSString *offerIdentifier;
  INRestaurantOffer *v12;
  NSObject *v13;
  int v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[INRestaurantOffer init](self, "init");
  if (!v5)
    goto LABEL_6;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("offerTitleText"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v13 = INSiriLogContextIntents;
    if (!os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    v15 = 136315394;
    v16 = "-[INRestaurantOffer initWithCoder:]";
    v17 = 2080;
    v18 = "_offerTitleText";
LABEL_13:
    _os_log_error_impl(&dword_18BEBC000, v13, OS_LOG_TYPE_ERROR, "%s Null value for %s", (uint8_t *)&v15, 0x16u);
    goto LABEL_14;
  }
  offerTitleText = v5->_offerTitleText;
  v5->_offerTitleText = (NSString *)v6;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("offerDetailText"));
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v13 = INSiriLogContextIntents;
    if (!os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    v15 = 136315394;
    v16 = "-[INRestaurantOffer initWithCoder:]";
    v17 = 2080;
    v18 = "_offerDetailText";
    goto LABEL_13;
  }
  offerDetailText = v5->_offerDetailText;
  v5->_offerDetailText = (NSString *)v8;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("offerIdentifier"));
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v13 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      v15 = 136315394;
      v16 = "-[INRestaurantOffer initWithCoder:]";
      v17 = 2080;
      v18 = "_offerIdentifier";
      goto LABEL_13;
    }
LABEL_14:
    v12 = 0;
    goto LABEL_15;
  }
  offerIdentifier = v5->_offerIdentifier;
  v5->_offerIdentifier = (NSString *)v10;

LABEL_6:
  v12 = v5;
LABEL_15:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_opt_new();
  -[INRestaurantOffer offerTitleText](self, "offerTitleText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOfferTitleText:", v5);

  -[INRestaurantOffer offerDetailText](self, "offerDetailText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOfferDetailText:", v6);

  -[INRestaurantOffer offerIdentifier](self, "offerIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOfferIdentifier:", v7);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *offerTitleText;
  id v5;

  offerTitleText = self->_offerTitleText;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", offerTitleText, CFSTR("offerTitleText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_offerDetailText, CFSTR("offerDetailText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_offerIdentifier, CFSTR("offerIdentifier"));

}

- (BOOL)isEqual:(id)a3
{
  INRestaurantOffer *v4;
  char isKindOfClass;
  char v6;
  INRestaurantOffer *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = (INRestaurantOffer *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v6 = 0;
    if (v4 && (isKindOfClass & 1) != 0)
    {
      v7 = v4;
      -[INRestaurantOffer offerTitleText](self, "offerTitleText");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[INRestaurantOffer offerTitleText](v7, "offerTitleText");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToString:", v9))
      {
        -[INRestaurantOffer offerDetailText](self, "offerDetailText");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[INRestaurantOffer offerDetailText](v7, "offerDetailText");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isEqualToString:", v11))
        {
          -[INRestaurantOffer offerIdentifier](self, "offerIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[INRestaurantOffer offerIdentifier](v7, "offerIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = objc_msgSend(v12, "isEqualToString:", v13);

        }
        else
        {
          v6 = 0;
        }

      }
      else
      {
        v6 = 0;
      }

    }
  }

  return v6;
}

- (NSString)description
{
  return (NSString *)-[INRestaurantOffer descriptionAtIndent:](self, "descriptionAtIndent:", 0);
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)INRestaurantOffer;
  -[INRestaurantOffer description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INRestaurantOffer _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  NSString *offerTitleText;
  void *v4;
  NSString *offerDetailText;
  void *v6;
  NSString *offerIdentifier;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("offerTitleText");
  offerTitleText = self->_offerTitleText;
  v4 = offerTitleText;
  if (!offerTitleText)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = v4;
  v11[1] = CFSTR("offerDetailText");
  offerDetailText = self->_offerDetailText;
  v6 = offerDetailText;
  if (!offerDetailText)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = v6;
  v11[2] = CFSTR("offerIdentifier");
  offerIdentifier = self->_offerIdentifier;
  v8 = offerIdentifier;
  if (!offerIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (offerIdentifier)
  {
    if (offerDetailText)
      goto LABEL_9;
LABEL_12:

    if (offerTitleText)
      return v9;
LABEL_13:

    return v9;
  }

  if (!offerDetailText)
    goto LABEL_12;
LABEL_9:
  if (!offerTitleText)
    goto LABEL_13;
  return v9;
}

- (NSString)offerTitleText
{
  return self->_offerTitleText;
}

- (void)setOfferTitleText:(NSString *)offerTitleText
{
  objc_setProperty_nonatomic_copy(self, a2, offerTitleText, 8);
}

- (NSString)offerDetailText
{
  return self->_offerDetailText;
}

- (void)setOfferDetailText:(NSString *)offerDetailText
{
  objc_setProperty_nonatomic_copy(self, a2, offerDetailText, 16);
}

- (NSString)offerIdentifier
{
  return self->_offerIdentifier;
}

- (void)setOfferIdentifier:(NSString *)offerIdentifier
{
  objc_setProperty_nonatomic_copy(self, a2, offerIdentifier, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offerIdentifier, 0);
  objc_storeStrong((id *)&self->_offerDetailText, 0);
  objc_storeStrong((id *)&self->_offerTitleText, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
