@implementation ATXInstalledSuggestedPage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  ATXInstalledSuggestedPage *v4;
  ATXInstalledSuggestedPage *v5;
  BOOL v6;

  v4 = (ATXInstalledSuggestedPage *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXInstalledSuggestedPage isEqualToATXInstalledSuggestedPage:](self, "isEqualToATXInstalledSuggestedPage:", v5);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_pageType, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_modeUUID, CFSTR("modeUUID"));

}

- (ATXInstalledSuggestedPage)initWithCoder:(id)a3
{
  id v4;
  ATXInstalledSuggestedPage *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *modeUUID;
  ATXInstalledSuggestedPage *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ATXInstalledSuggestedPage;
  v5 = -[ATXInstalledSuggestedPage init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_pageType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modeUUID"));
    v8 = objc_claimAutoreleasedReturnValue();
    modeUUID = v5->_modeUUID;
    v5->_modeUUID = (NSString *)v8;

    v10 = v5;
  }

  return v5;
}

- (unint64_t)hash
{
  return self->_pageType;
}

- (BOOL)isEqualToATXInstalledSuggestedPage:(id)a3
{
  int64_t pageType;

  pageType = self->_pageType;
  return pageType == objc_msgSend(a3, "pageType");
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[ATXInstalledSuggestedPage identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXInstalledSuggestedPage modeUUID](self, "modeUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<ATXInstalledSuggestedPage identifier=%@ modeUUID=%@ type=%ld>"), v4, v5, -[ATXInstalledSuggestedPage pageType](self, "pageType"));

  return v6;
}

- (int64_t)pageType
{
  return self->_pageType;
}

- (void)setPageType:(int64_t)a3
{
  self->_pageType = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)modeUUID
{
  return self->_modeUUID;
}

- (void)setModeUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeUUID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
