@implementation GEOFeatureInfo

- (GEOFeatureInfo)initWithName:(id)a3
{
  id v4;
  GEOFeatureInfo *v5;
  uint64_t v6;
  NSString *name;
  GEOFeatureInfo *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOFeatureInfo;
  v5 = -[GEOFeatureInfo init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (int64_t)state
{
  if (GEOIsFeatureActive(self->_name))
    return 1;
  else
    return 2;
}

- (void)setState:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  _getValue(GeoServicesConfig_ClientAuthFeatureFlagsStateInfo, (uint64_t)off_1EDF4DE08, 1, 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v10, "objectForKeyedSubscript:", self->_name);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  if (a3 == 1)
    v8 = MEMORY[0x1E0C9AAB0];
  else
    v8 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("active"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("userOn"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, self->_name);
  v9 = (void *)objc_msgSend(v10, "copy");
  _setValue(GeoServicesConfig_ClientAuthFeatureFlagsStateInfo, (uint64_t)off_1EDF4DE08, v9, 1, 0);

}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
