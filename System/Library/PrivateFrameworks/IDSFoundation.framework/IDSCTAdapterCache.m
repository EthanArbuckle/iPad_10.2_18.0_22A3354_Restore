@implementation IDSCTAdapterCache

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;
  unint64_t dualSIMEnabled;
  unint64_t isAnySIMUsable;
  const __CFString *v8;
  __CFString *v9;
  const __CFString *v10;
  __CFString *v11;
  unint64_t isAnySIMInserted;
  unint64_t supportsIdentification;
  const __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  unint64_t doesAnySIMSupportsSimultaneousVoiceAndDataRightNow;
  NSArray *sims;
  const __CFString *v19;
  __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  __CFString *v23;
  const char *v24;
  double v25;
  void *v26;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = CFSTR("YES");
  dualSIMEnabled = self->_dualSIMEnabled;
  isAnySIMUsable = self->_isAnySIMUsable;
  if (dualSIMEnabled == 2)
    v8 = CFSTR("NO");
  else
    v8 = CFSTR("YES");
  if (dualSIMEnabled)
    v9 = (__CFString *)v8;
  else
    v9 = CFSTR("NotSet");
  if (isAnySIMUsable == 2)
    v10 = CFSTR("NO");
  else
    v10 = CFSTR("YES");
  if (isAnySIMUsable)
    v11 = (__CFString *)v10;
  else
    v11 = CFSTR("NotSet");
  isAnySIMInserted = self->_isAnySIMInserted;
  supportsIdentification = self->_supportsIdentification;
  if (isAnySIMInserted == 2)
    v14 = CFSTR("NO");
  else
    v14 = CFSTR("YES");
  if (isAnySIMInserted)
    v15 = (__CFString *)v14;
  else
    v15 = CFSTR("NotSet");
  if (supportsIdentification == 2)
    v16 = CFSTR("NO");
  else
    v16 = CFSTR("YES");
  if (!supportsIdentification)
    v16 = CFSTR("NotSet");
  doesAnySIMSupportsSimultaneousVoiceAndDataRightNow = self->_doesAnySIMSupportsSimultaneousVoiceAndDataRightNow;
  sims = self->_sims;
  if (doesAnySIMSupportsSimultaneousVoiceAndDataRightNow == 2)
    v5 = CFSTR("NO");
  if (doesAnySIMSupportsSimultaneousVoiceAndDataRightNow)
    v19 = v5;
  else
    v19 = CFSTR("NotSet");
  v20 = v16;
  v21 = v15;
  v22 = v11;
  v23 = v9;
  objc_msgSend_stringWithFormat_(v3, v24, (uint64_t)CFSTR("<%@: %p, dualSIM: %@, anyUsable: %@, anyInserted: %@, supportsID: %@, anySimul: %@, sims: %@>"), v25, v4, self, v23, v22, v21, v20, v19, sims);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (unint64_t)dualSIMEnabled
{
  return self->_dualSIMEnabled;
}

- (void)setDualSIMEnabled:(unint64_t)a3
{
  self->_dualSIMEnabled = a3;
}

- (unint64_t)isAnySIMUsable
{
  return self->_isAnySIMUsable;
}

- (void)setIsAnySIMUsable:(unint64_t)a3
{
  self->_isAnySIMUsable = a3;
}

- (unint64_t)isAnySIMInserted
{
  return self->_isAnySIMInserted;
}

- (void)setIsAnySIMInserted:(unint64_t)a3
{
  self->_isAnySIMInserted = a3;
}

- (unint64_t)supportsIdentification
{
  return self->_supportsIdentification;
}

- (void)setSupportsIdentification:(unint64_t)a3
{
  self->_supportsIdentification = a3;
}

- (unint64_t)doesAnySIMSupportsSimultaneousVoiceAndDataRightNow
{
  return self->_doesAnySIMSupportsSimultaneousVoiceAndDataRightNow;
}

- (void)setDoesAnySIMSupportsSimultaneousVoiceAndDataRightNow:(unint64_t)a3
{
  self->_doesAnySIMSupportsSimultaneousVoiceAndDataRightNow = a3;
}

- (NSArray)sims
{
  return self->_sims;
}

- (void)setSims:(id)a3
{
  objc_storeStrong((id *)&self->_sims, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sims, 0);
}

@end
