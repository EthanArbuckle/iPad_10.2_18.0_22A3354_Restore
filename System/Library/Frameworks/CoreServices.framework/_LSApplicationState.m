@implementation _LSApplicationState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (BOOL)isInstalled
{
  return (LOBYTE(self->_stateFlags) >> 4) & 1;
}

- (BOOL)isDowngraded
{
  return self->_installType - 7 < 3;
}

- (_LSApplicationState)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _LSApplicationState *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_LSAppStateFlags"));
  v7 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("ratingRank"));
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("installType"));
  if (v5)
  {
    v9 = -[_LSApplicationState initWithBundleIdentifier:stateFlags:ratingRank:installType:](self, "initWithBundleIdentifier:stateFlags:ratingRank:installType:", v5, v6, v7, v8);
  }
  else
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB28A8], 4865, (uint64_t)"-[_LSApplicationState initWithCoder:]", 147, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v10);

    v9 = 0;
  }

  return v9;
}

- (_LSApplicationState)initWithBundleIdentifier:(id)a3 stateFlags:(unint64_t)a4 ratingRank:(int)a5 installType:(unint64_t)a6
{
  id v10;
  _LSApplicationState *v11;
  uint64_t v12;
  NSString *bundleIdentifier;
  objc_super v15;

  v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_LSApplicationState;
  v11 = -[_LSApplicationState init](&v15, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    bundleIdentifier = v11->_bundleIdentifier;
    v11->_bundleIdentifier = (NSString *)v12;

    v11->_stateFlags = a4;
    v11->_ratingRank = a5;
    v11->_installType = a6;
  }

  return v11;
}

- (BOOL)isValid
{
  return (LOBYTE(self->_stateFlags) >> 2) & 1;
}

- (BOOL)isRestricted
{
  id *v3;
  void *v4;

  +[LSApplicationRestrictionsManager sharedInstance]();
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  -[LSApplicationRestrictionsManager defaultStateProvider](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[_LSApplicationState isRestrictedWithStateProvider:](self, "isRestrictedWithStateProvider:", v4);

  return (char)self;
}

- (BOOL)isRestrictedWithStateProvider:(id)a3
{
  id v4;
  int ratingRank;
  void *v6;
  void *v7;
  char v8;
  void *v9;

  v4 = a3;
  if (-[_LSApplicationState isPlaceholder](self, "isPlaceholder") && (self->_stateFlags & 0x20) != 0)
  {
    v8 = 1;
  }
  else
  {
    ratingRank = self->_ratingRank;
    +[LSApplicationRestrictionsManager sharedInstance]();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LSApplicationRestrictionsManager maximumRating](v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (ratingRank <= (int)objc_msgSend(v7, "intValue"))
    {
      +[LSApplicationRestrictionsManager sharedInstance]();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[LSApplicationRestrictionsManager isApplicationRestricted:checkFlags:stateProvider:]((uint64_t)v9, self->_bundleIdentifier, self->_stateFlags, v4);

    }
    else
    {
      v8 = 1;
    }

  }
  return v8;
}

- (BOOL)isPlaceholder
{
  return (LOBYTE(self->_stateFlags) >> 3) & 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *bundleIdentifier;
  id v5;

  bundleIdentifier = self->_bundleIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", bundleIdentifier, CFSTR("bundleIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_stateFlags, CFSTR("_LSAppStateFlags"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_ratingRank, CFSTR("ratingRank"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_installType, CFSTR("installType"));

}

- (BOOL)isAlwaysAvailable
{
  return (LOBYTE(self->_stateFlags) >> 1) & 1;
}

- (BOOL)isRemovedSystemApp
{
  return 0;
}

- (BOOL)isBlocked
{
  return 0;
}

- (unint64_t)installType
{
  return self->_installType;
}

- (void)addStateFlag:(unint64_t)a3
{
  self->_stateFlags |= a3;
}

- (id)description
{
  void *v3;
  NSString *bundleIdentifier;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  _BOOL4 v10;
  const __CFString *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  bundleIdentifier = self->_bundleIdentifier;
  if (-[_LSApplicationState isValid](self, "isValid"))
    v5 = &stru_1E10473A0;
  else
    v5 = CFSTR("INVALID");
  if (-[_LSApplicationState isPlaceholder](self, "isPlaceholder"))
    v6 = CFSTR("placeholder");
  else
    v6 = &stru_1E10473A0;
  if (-[_LSApplicationState isInstalled](self, "isInstalled"))
    v7 = CFSTR("installed");
  else
    v7 = &stru_1E10473A0;
  if (-[_LSApplicationState isBlocked](self, "isBlocked"))
    v8 = CFSTR("(blocked)");
  else
    v8 = &stru_1E10473A0;
  if (-[_LSApplicationState isRemovedSystemApp](self, "isRemovedSystemApp"))
    v9 = CFSTR("(removedSystemApp)");
  else
    v9 = &stru_1E10473A0;
  v10 = -[_LSApplicationState isRestricted](self, "isRestricted");
  v11 = CFSTR("(restricted)");
  if (!v10)
    v11 = &stru_1E10473A0;
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ <%@%@%@ %@%@%@>"), bundleIdentifier, v5, v6, v7, v8, v9, v11);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

@end
