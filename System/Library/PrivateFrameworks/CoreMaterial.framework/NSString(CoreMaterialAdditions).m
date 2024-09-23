@implementation NSString(CoreMaterialAdditions)

+ (const)mt_identityValueForMaterialSettingsProperty:()CoreMaterialAdditions
{
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("blurInputQuality")))
    return CFSTR("default");
  else
    return 0;
}

- (uint64_t)mt_isIdentityValueForMaterialSettingsProperty:()CoreMaterialAdditions
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "mt_identityValueForMaterialSettingsProperty:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(a1, "isEqual:", v5);
  return v6;
}

@end
