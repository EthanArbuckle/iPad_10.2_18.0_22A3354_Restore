@implementation ATXSuggestedPagesFilter

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXSuggestedPagesFilter)initWithCoder:(id)a3
{
  id v4;
  ATXSuggestedPagesFilter *v5;
  uint64_t v6;
  NSString *modeUUID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXSuggestedPagesFilter;
  v5 = -[ATXSuggestedPagesFilter init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modeUUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    modeUUID = v5->_modeUUID;
    v5->_modeUUID = (NSString *)v6;

    v5->_pageType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("pageType"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *modeUUID;
  id v5;

  modeUUID = self->_modeUUID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", modeUUID, CFSTR("modeUUID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_pageType, CFSTR("pageType"));

}

- (int64_t)pageType
{
  return self->_pageType;
}

- (void)setPageType:(int64_t)a3
{
  self->_pageType = a3;
}

- (NSString)modeUUID
{
  return self->_modeUUID;
}

- (void)setModeUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeUUID, 0);
}

@end
