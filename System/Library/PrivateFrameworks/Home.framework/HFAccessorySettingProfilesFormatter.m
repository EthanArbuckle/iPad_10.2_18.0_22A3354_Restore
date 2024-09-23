@implementation HFAccessorySettingProfilesFormatter

- (id)stringForObjectValue:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a3;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v6, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)numberOfProfiles
{
  return self->_numberOfProfiles;
}

- (void)setNumberOfProfiles:(unint64_t)a3
{
  self->_numberOfProfiles = a3;
}

@end
