@implementation LCFModelMetadata

- (id)init:(id)a3
{
  id v4;
  LCFModelMetadata *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSDate *dateCreated;
  void *v17;
  uint64_t v18;
  NSDate *dateTrained;
  void *v20;
  uint64_t v21;
  NSString *sha256;
  void *v23;
  uint64_t v24;
  NSDictionary *custom;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)LCFModelMetadata;
  v5 = -[LCFModelMetadata init](&v27, sel_init);
  if (v5)
  {
    LCFModelStoreLoggingUtilsInit();
    if (v4)
    {
      objc_msgSend(v4, "valueForKey:", CFSTR("isAvailable"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAvailable"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v5->_isAvailable = objc_msgSend(v7, "isEqual:", &unk_2510A3808) ^ 1;

      }
      objc_msgSend(v4, "valueForKey:", CFSTR("isOriginalEmptyModel"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isOriginalEmptyModel"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v5->_isOriginalEmptyModel = objc_msgSend(v9, "isEqual:", &unk_2510A3808) ^ 1;

      }
      objc_msgSend(v4, "valueForKey:", CFSTR("isImported"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isImported"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v5->_isImported = objc_msgSend(v11, "isEqual:", &unk_2510A3808) ^ 1;

      }
      objc_msgSend(v4, "valueForKey:", CFSTR("isLocal"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isLocal"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v5->_isLocal = objc_msgSend(v13, "isEqual:", &unk_2510A3808) ^ 1;

      }
      objc_msgSend(v4, "valueForKey:", CFSTR("dateCreated"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dateCreated"));
        v15 = objc_claimAutoreleasedReturnValue();
        dateCreated = v5->_dateCreated;
        v5->_dateCreated = (NSDate *)v15;

      }
      objc_msgSend(v4, "valueForKey:", CFSTR("dateTrained"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dateTrained"));
        v18 = objc_claimAutoreleasedReturnValue();
        dateTrained = v5->_dateTrained;
        v5->_dateTrained = (NSDate *)v18;

      }
      objc_msgSend(v4, "valueForKey:", CFSTR("sha256"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sha256"));
        v21 = objc_claimAutoreleasedReturnValue();
        sha256 = v5->_sha256;
        v5->_sha256 = (NSString *)v21;

      }
      objc_msgSend(v4, "valueForKey:", CFSTR("custom"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("custom"));
        v24 = objc_claimAutoreleasedReturnValue();
        custom = v5->_custom;
        v5->_custom = (NSDictionary *)v24;

      }
    }
  }

  return v5;
}

- (id)toDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSDate *dateCreated;
  NSDate *dateTrained;
  NSString *sha256;
  NSDictionary *custom;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v4 = v3;
  if (self->_isAvailable)
    v5 = &unk_2510A3820;
  else
    v5 = &unk_2510A3808;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("isAvailable"));
  if (self->_isOriginalEmptyModel)
    v6 = &unk_2510A3820;
  else
    v6 = &unk_2510A3808;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("isOriginalEmptyModel"));
  if (self->_isImported)
    v7 = &unk_2510A3820;
  else
    v7 = &unk_2510A3808;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("isImported"));
  if (self->_isLocal)
    v8 = &unk_2510A3820;
  else
    v8 = &unk_2510A3808;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("isLocal"));
  dateCreated = self->_dateCreated;
  if (dateCreated)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", dateCreated, CFSTR("dateCreated"));
  dateTrained = self->_dateTrained;
  if (dateTrained)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", dateTrained, CFSTR("dateTrained"));
  sha256 = self->_sha256;
  if (sha256)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", sha256, CFSTR("sha256"));
  custom = self->_custom;
  if (custom)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", custom, CFSTR("custom"));
  return v4;
}

- (BOOL)isAvailable
{
  return self->_isAvailable;
}

- (void)setIsAvailable:(BOOL)a3
{
  self->_isAvailable = a3;
}

- (BOOL)isOriginalEmptyModel
{
  return self->_isOriginalEmptyModel;
}

- (void)setIsOriginalEmptyModel:(BOOL)a3
{
  self->_isOriginalEmptyModel = a3;
}

- (BOOL)isImported
{
  return self->_isImported;
}

- (void)setIsImported:(BOOL)a3
{
  self->_isImported = a3;
}

- (BOOL)isLocal
{
  return self->_isLocal;
}

- (void)setIsLocal:(BOOL)a3
{
  self->_isLocal = a3;
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (void)setDateCreated:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)dateTrained
{
  return self->_dateTrained;
}

- (void)setDateTrained:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)sha256
{
  return self->_sha256;
}

- (void)setSha256:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDictionary)custom
{
  return self->_custom;
}

- (void)setCustom:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_custom, 0);
  objc_storeStrong((id *)&self->_sha256, 0);
  objc_storeStrong((id *)&self->_dateTrained, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
}

@end
