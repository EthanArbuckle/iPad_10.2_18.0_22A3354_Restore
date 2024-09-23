@implementation _CHSSimpleWidgetRefreshStrategy

- (_CHSSimpleWidgetRefreshStrategy)initWithRateLimitIdentifier:(id)a3
{
  id v4;
  _CHSSimpleWidgetRefreshStrategy *v5;
  uint64_t v6;
  NSString *rateLimitIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_CHSSimpleWidgetRefreshStrategy;
  v5 = -[_CHSSimpleWidgetRefreshStrategy init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    rateLimitIdentifier = v5->_rateLimitIdentifier;
    v5->_rateLimitIdentifier = (NSString *)v6;

  }
  return v5;
}

- (_CHSSimpleWidgetRefreshStrategy)initWithDefaultStrategy
{
  _CHSSimpleWidgetRefreshStrategy *v2;
  _CHSSimpleWidgetRefreshStrategy *v3;
  NSString *rateLimitIdentifier;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_CHSSimpleWidgetRefreshStrategy;
  v2 = -[_CHSSimpleWidgetRefreshStrategy init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    rateLimitIdentifier = v2->_rateLimitIdentifier;
    v2->_rateLimitIdentifier = 0;

    v3->_isDefaultStrategy = 1;
  }
  return v3;
}

- (_CHSSimpleWidgetRefreshStrategy)initWithDisabledStrategy
{
  _CHSSimpleWidgetRefreshStrategy *v2;
  _CHSSimpleWidgetRefreshStrategy *v3;
  NSString *rateLimitIdentifier;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_CHSSimpleWidgetRefreshStrategy;
  v2 = -[_CHSSimpleWidgetRefreshStrategy init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    rateLimitIdentifier = v2->_rateLimitIdentifier;
    v2->_rateLimitIdentifier = 0;

    v3->_isDisabledStrategy = 1;
  }
  return v3;
}

- (unint64_t)hash
{
  return 17 * -[NSString hash](self->_rateLimitIdentifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  _CHSSimpleWidgetRefreshStrategy *v4;
  char v5;

  v4 = (_CHSSimpleWidgetRefreshStrategy *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = BSEqualObjects();
    else
      v5 = 0;
  }

  return v5;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64___CHSSimpleWidgetRefreshStrategy_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_1E2A5A290;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  objc_msgSend(v5, "appendProem:block:", 0, v6);

}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (BOOL)isRateLimited
{
  return self->_rateLimitIdentifier != 0;
}

- (NSString)rateLimitIdentifier
{
  return self->_rateLimitIdentifier;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_rateLimitIdentifier, CFSTR("rateLimitIdentifier"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isDefaultStrategy, CFSTR("isDefaultStrategy"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isDisabledStrategy, CFSTR("isDisabledStrategy"));

}

- (_CHSSimpleWidgetRefreshStrategy)initWithCoder:(id)a3
{
  id v4;
  _CHSSimpleWidgetRefreshStrategy *v5;
  uint64_t v6;
  NSString *rateLimitIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_CHSSimpleWidgetRefreshStrategy;
  v5 = -[_CHSSimpleWidgetRefreshStrategy init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rateLimitIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    rateLimitIdentifier = v5->_rateLimitIdentifier;
    v5->_rateLimitIdentifier = (NSString *)v6;

    v5->_isDefaultStrategy = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isDefaultStrategy"));
    v5->_isDisabledStrategy = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isDisabledStrategy"));
  }

  return v5;
}

- (BOOL)isDefaultStrategy
{
  return self->_isDefaultStrategy;
}

- (BOOL)isDisabledStrategy
{
  return self->_isDisabledStrategy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rateLimitIdentifier, 0);
}

@end
