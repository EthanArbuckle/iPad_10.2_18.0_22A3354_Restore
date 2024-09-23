@implementation _LSOpenConfiguration

- (_LSOpenConfiguration)init
{
  _LSOpenConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_LSOpenConfiguration;
  result = -[_LSOpenConfiguration init](&v3, sel_init);
  if (result)
    result->_allowURLOverrides = 1;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    v5 = -[NSDictionary copy](self->_frontBoardOptions, "copy");
    v6 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = v5;

    v7 = -[BSServiceConnectionEndpoint copy](self->_targetConnectionEndpoint, "copy");
    v8 = *(void **)(v4 + 32);
    *(_QWORD *)(v4 + 32) = v7;

    v9 = -[UISClickAttribution copy](self->_clickAttribution, "copy");
    v10 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v9;

    v11 = -[UISPasteSharingToken copy](self->_pasteSharingToken, "copy");
    v12 = *(void **)(v4 + 48);
    *(_QWORD *)(v4 + 48) = v11;

    *(_BYTE *)(v4 + 8) = self->_ignoreAppLinkEnabledProperty;
    v13 = -[NSURL copy](self->_referrerURL, "copy");
    v14 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = v13;

    *(_BYTE *)(v4 + 9) = self->_sensitive;
    *(_BYTE *)(v4 + 10) = self->_allowURLOverrides;
  }
  return (id)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_frontBoardOptions, CFSTR("frontBoardOptions"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_targetConnectionEndpoint, CFSTR("targetConnectionEndpoint"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_clickAttribution, CFSTR("clickAttribution"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_pasteSharingToken, CFSTR("pasteSharingToken"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_ignoreAppLinkEnabledProperty, CFSTR("ignoreAppLinkEnabledProperty"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_referrerURL, CFSTR("referrerURL"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_sensitive, CFSTR("sensitive"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_allowURLOverrides, CFSTR("allowURLOverrides"));

}

- (_LSOpenConfiguration)initWithCoder:(id)a3
{
  id v4;
  _LSOpenConfiguration *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSDictionary *frontBoardOptions;
  uint64_t BSServiceConnectionEndpointClass;
  uint64_t v11;
  BSServiceConnectionEndpoint *targetConnectionEndpoint;
  uint64_t UISClickAttributionClass;
  uint64_t v14;
  UISClickAttribution *clickAttribution;
  uint64_t UISPasteSharingTokenClass;
  uint64_t v17;
  UISPasteSharingToken *pasteSharingToken;
  uint64_t v19;
  NSURL *referrerURL;

  v4 = a3;
  v5 = -[_LSOpenConfiguration init](self, "init");
  if (v5)
  {
    v6 = objc_opt_class();
    _LSGetFrontBoardOptionsDictionaryClasses();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ls_decodeDictionaryWithKeysOfClass:valuesOfClasses:forKey:", v6, v7, CFSTR("frontBoardOptions"));
    v8 = objc_claimAutoreleasedReturnValue();
    frontBoardOptions = v5->_frontBoardOptions;
    v5->_frontBoardOptions = (NSDictionary *)v8;

    BSServiceConnectionEndpointClass = getBSServiceConnectionEndpointClass();
    if (BSServiceConnectionEndpointClass)
    {
      objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", BSServiceConnectionEndpointClass, CFSTR("targetConnectionEndpoint"));
      v11 = objc_claimAutoreleasedReturnValue();
      targetConnectionEndpoint = v5->_targetConnectionEndpoint;
      v5->_targetConnectionEndpoint = (BSServiceConnectionEndpoint *)v11;

    }
    UISClickAttributionClass = getUISClickAttributionClass();
    if (UISClickAttributionClass)
    {
      objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", UISClickAttributionClass, CFSTR("clickAttribution"));
      v14 = objc_claimAutoreleasedReturnValue();
      clickAttribution = v5->_clickAttribution;
      v5->_clickAttribution = (UISClickAttribution *)v14;

    }
    UISPasteSharingTokenClass = getUISPasteSharingTokenClass();
    if (UISPasteSharingTokenClass)
    {
      objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", UISPasteSharingTokenClass, CFSTR("pasteSharingToken"));
      v17 = objc_claimAutoreleasedReturnValue();
      pasteSharingToken = v5->_pasteSharingToken;
      v5->_pasteSharingToken = (UISPasteSharingToken *)v17;

    }
    v5->_ignoreAppLinkEnabledProperty = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ignoreAppLinkEnabledProperty"));
    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("referrerURL"));
    v19 = objc_claimAutoreleasedReturnValue();
    referrerURL = v5->_referrerURL;
    v5->_referrerURL = (NSURL *)v19;

    v5->_sensitive = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("sensitive"));
    v5->_allowURLOverrides = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowURLOverrides"));
  }

  return v5;
}

- (NSDictionary)frontBoardOptions
{
  return self->_frontBoardOptions;
}

- (void)setFrontBoardOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)ignoreAppLinkEnabledProperty
{
  return self->_ignoreAppLinkEnabledProperty;
}

- (void)setIgnoreAppLinkEnabledProperty:(BOOL)a3
{
  self->_ignoreAppLinkEnabledProperty = a3;
}

- (NSURL)referrerURL
{
  return self->_referrerURL;
}

- (void)setReferrerURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isSensitive
{
  return self->_sensitive;
}

- (void)setSensitive:(BOOL)a3
{
  self->_sensitive = a3;
}

- (BOOL)allowURLOverrides
{
  return self->_allowURLOverrides;
}

- (void)setAllowURLOverrides:(BOOL)a3
{
  self->_allowURLOverrides = a3;
}

- (BSServiceConnectionEndpoint)targetConnectionEndpoint
{
  return self->_targetConnectionEndpoint;
}

- (void)setTargetConnectionEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_targetConnectionEndpoint, a3);
}

- (UISClickAttribution)clickAttribution
{
  return self->_clickAttribution;
}

- (void)setClickAttribution:(id)a3
{
  objc_storeStrong((id *)&self->_clickAttribution, a3);
}

- (UISPasteSharingToken)pasteSharingToken
{
  return self->_pasteSharingToken;
}

- (void)setPasteSharingToken:(id)a3
{
  objc_storeStrong((id *)&self->_pasteSharingToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pasteSharingToken, 0);
  objc_storeStrong((id *)&self->_clickAttribution, 0);
  objc_storeStrong((id *)&self->_targetConnectionEndpoint, 0);
  objc_storeStrong((id *)&self->_referrerURL, 0);
  objc_storeStrong((id *)&self->_frontBoardOptions, 0);
}

@end
