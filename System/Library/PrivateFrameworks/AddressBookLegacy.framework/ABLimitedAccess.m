@implementation ABLimitedAccess

+ (BOOL)isLimitedAccessFF_Enabled
{
  return _os_feature_enabled_impl();
}

+ (void)appendLimitedAccessLeftJoinToQueryString:(id)a3
{
  objc_msgSend(a3, "appendString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" INNER JOIN LimitedAccess la ON la.guid IN (abp.guid, abplink.guid) WHERE la.BundleID = ? AND la.IsActive = %i"), 1));
}

@end
