@implementation PSSpecifier(CNFRegSettings)

- (uint64_t)setCNFRegAlias:()CNFRegSettings
{
  return objc_msgSend(a1, "setProperty:forKey:", a3, CFSTR("cnfreg-alias"));
}

- (uint64_t)CNFRegAlias
{
  return objc_msgSend(a1, "propertyForKey:", CFSTR("cnfreg-alias"));
}

- (uint64_t)setCNFRegCallerIdAlias:()CNFRegSettings
{
  return objc_msgSend(a1, "setProperty:forKey:", a3, CFSTR("cnfreg-callerIdAlias"));
}

- (uint64_t)CNFRegCallerIdAlias
{
  return objc_msgSend(a1, "propertyForKey:", CFSTR("cnfreg-callerIdAlias"));
}

- (uint64_t)setCNFRegAccount:()CNFRegSettings
{
  if (a3)
    return objc_msgSend(a1, "setProperty:forKey:", a3, CFSTR("cnfreg-account"));
  else
    return objc_msgSend(a1, "removePropertyForKey:", CFSTR("cnfreg-account"));
}

- (uint64_t)CNFRegAccount
{
  return objc_msgSend(a1, "propertyForKey:", CFSTR("cnfreg-account"));
}

@end
