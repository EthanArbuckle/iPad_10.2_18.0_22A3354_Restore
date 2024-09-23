@implementation ATStatus

- (ATStatus)initWithLibraryID:(id)a3 dataClass:(id)a4
{
  id v7;
  id v8;
  ATStatus *v9;
  ATStatus *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATStatus;
  v9 = -[ATStatus init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_libraryID, a3);
    objc_storeStrong((id *)&v10->_dataClass, a4);
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_dataClass, "hash");
  return -[NSString hash](self->_libraryID, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "dataClass");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", self->_dataClass))
    {
      objc_msgSend(v4, "libraryID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqualToString:", self->_libraryID);

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  NSString *libraryID;
  NSString *dataClass;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSString *localizedDescription;
  void *v15;

  v3 = (void *)objc_opt_new();
  v4 = v3;
  libraryID = self->_libraryID;
  if (libraryID)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", libraryID, CFSTR("libraryID"));
  dataClass = self->_dataClass;
  if (dataClass)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", dataClass, CFSTR("dataClass"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_syncStage);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("syncStage"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_syncType);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("syncType"));

  *(float *)&v9 = self->_progress;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("progress"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_totalAssetCount);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("totalAssetCount"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_totalItemCount);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("totalItemCount"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_completedAssetCount);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("completedAssetCount"));

  localizedDescription = self->_localizedDescription;
  if (localizedDescription)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", localizedDescription, CFSTR("localizedDescription"));
  objc_msgSend(v4, "description");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (ATStatus)initWithCoder:(id)a3
{
  id v4;
  ATStatus *v5;
  uint64_t v6;
  NSString *dataClass;
  uint64_t v8;
  NSString *libraryID;
  float v10;
  uint64_t v11;
  NSString *localizedDescription;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ATStatus;
  v5 = -[ATStatus init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dataClass"));
    v6 = objc_claimAutoreleasedReturnValue();
    dataClass = v5->_dataClass;
    v5->_dataClass = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("libraryID"));
    v8 = objc_claimAutoreleasedReturnValue();
    libraryID = v5->_libraryID;
    v5->_libraryID = (NSString *)v8;

    v5->_syncStage = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("syncStage"));
    v5->_syncType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("syncType"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("progress"));
    v5->_progress = v10;
    v5->_totalAssetCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("totalAssetCount"));
    v5->_totalItemCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("totalItemCount"));
    v5->_completedAssetCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("completedAssetCount"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedDescription"));
    v11 = objc_claimAutoreleasedReturnValue();
    localizedDescription = v5->_localizedDescription;
    v5->_localizedDescription = (NSString *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *dataClass;
  double v5;
  id v6;

  dataClass = self->_dataClass;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", dataClass, CFSTR("dataClass"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_libraryID, CFSTR("libraryID"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_syncStage, CFSTR("syncStage"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_syncType, CFSTR("syncType"));
  *(float *)&v5 = self->_progress;
  objc_msgSend(v6, "encodeFloat:forKey:", CFSTR("progress"), v5);
  objc_msgSend(v6, "encodeInteger:forKey:", self->_totalAssetCount, CFSTR("totalAssetCount"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_totalItemCount, CFSTR("totalItemCount"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_completedAssetCount, CFSTR("completedAssetCount"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_localizedDescription, CFSTR("localizedDescription"));

}

- (NSString)libraryID
{
  return self->_libraryID;
}

- (void)setLibraryID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)dataClass
{
  return self->_dataClass;
}

- (void)setDataClass:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unsigned)syncStage
{
  return self->_syncStage;
}

- (void)setSyncStage:(unsigned int)a3
{
  self->_syncStage = a3;
}

- (unsigned)syncType
{
  return self->_syncType;
}

- (void)setSyncType:(unsigned int)a3
{
  self->_syncType = a3;
}

- (float)progress
{
  return self->_progress;
}

- (void)setProgress:(float)a3
{
  self->_progress = a3;
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void)setLocalizedDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unint64_t)completedAssetCount
{
  return self->_completedAssetCount;
}

- (void)setCompletedAssetCount:(unint64_t)a3
{
  self->_completedAssetCount = a3;
}

- (unint64_t)totalAssetCount
{
  return self->_totalAssetCount;
}

- (void)setTotalAssetCount:(unint64_t)a3
{
  self->_totalAssetCount = a3;
}

- (unint64_t)totalItemCount
{
  return self->_totalItemCount;
}

- (void)setTotalItemCount:(unint64_t)a3
{
  self->_totalItemCount = a3;
}

- (BOOL)isWirelessSync
{
  return self->_wirelessSync;
}

- (void)setWirelessSync:(BOOL)a3
{
  self->_wirelessSync = a3;
}

- (BOOL)isAutomaticSync
{
  return self->_automaticSync;
}

- (void)setAutomaticSync:(BOOL)a3
{
  self->_automaticSync = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_dataClass, 0);
  objc_storeStrong((id *)&self->_libraryID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
