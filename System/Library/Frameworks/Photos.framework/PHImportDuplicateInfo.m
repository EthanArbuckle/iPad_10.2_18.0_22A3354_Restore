@implementation PHImportDuplicateInfo

- (PHImportDuplicateInfo)initWithAssetInfo:(id)a3
{
  id v4;
  PHImportDuplicateInfo *v5;
  PHImportDuplicateInfo *v6;
  PHImportDuplicateInfo *v7;

  v4 = a3;
  if (v4)
  {
    v5 = -[PHImportDuplicateInfo init](self, "init");
    v6 = v5;
    if (v5)
      -[PHImportDuplicateInfo setInfo:](v5, "setInfo:", v4);
    self = v6;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isLegacy
{
  void *v2;
  BOOL v3;

  -[PHImportDuplicateInfo alternateImportImageDate](self, "alternateImportImageDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PHImportDuplicateInfo uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHImportDuplicateInfo fileSize](self, "fileSize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHImportDuplicateInfo fileName](self, "fileName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHImportDuplicateInfo imageDate](self, "imageDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHImportDuplicateInfo alternateImportImageDate](self, "alternateImportImageDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    -[PHImportDuplicateInfo alternateImportImageDate](self, "alternateImportImageDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR(" (alt: %@)"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("uuid: %@, size: %@, name: %@, date: %@%@"), v4, v5, v6, v7, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "stringWithFormat:", CFSTR("uuid: %@, size: %@, name: %@, date: %@%@"), v4, v5, v6, v7, &stru_1E35DFFF8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)objectID
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_info, "objectForKeyedSubscript:", CFSTR("asset"));
}

- (NSString)uuid
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->_info, "objectForKeyedSubscript:", CFSTR("asset.uuid"));
}

- (NSString)fileName
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->_info, "objectForKeyedSubscript:", CFSTR("originalFilename"));
}

- (NSDate)imageDate
{
  return (NSDate *)-[NSMutableDictionary objectForKeyedSubscript:](self->_info, "objectForKeyedSubscript:", CFSTR("asset.dateCreated"));
}

- (NSDate)alternateImportImageDate
{
  return (NSDate *)-[NSMutableDictionary objectForKeyedSubscript:](self->_info, "objectForKeyedSubscript:", CFSTR("alternateImportImageDate"));
}

- (void)setAlternateImportImageDate:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_info, "setObject:forKeyedSubscript:", a3, CFSTR("alternateImportImageDate"));
}

- (NSNumber)fileSize
{
  return (NSNumber *)-[NSMutableDictionary objectForKeyedSubscript:](self->_info, "objectForKeyedSubscript:", CFSTR("originalFilesize"));
}

- (BOOL)hasVideoComplement
{
  void *v2;
  char v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_info, "objectForKeyedSubscript:", CFSTR("hasVideoComplement"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isInTrash
{
  void *v2;
  char v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_info, "objectForKeyedSubscript:", CFSTR("asset.trashedState"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (NSString)fingerprint
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->_info, "objectForKeyedSubscript:", CFSTR("originalStableHash"));
}

- (NSString)avchdFingerprint
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->_info, "objectForKeyedSubscript:", CFSTR("avchdFingerprint"));
}

- (id)originatingAssetIdentifier
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_info, "objectForKeyedSubscript:", CFSTR("originatingAssetIdentifier"));
}

- (double)timezoneOffset
{
  void *v2;
  double v3;
  double v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_info, "objectForKeyedSubscript:", CFSTR("timeZoneOffset"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (NSMutableDictionary)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
  objc_storeStrong((id *)&self->_info, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);
}

@end
