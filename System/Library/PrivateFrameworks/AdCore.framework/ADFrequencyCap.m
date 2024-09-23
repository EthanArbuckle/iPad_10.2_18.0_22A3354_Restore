@implementation ADFrequencyCap

- (ADFrequencyCap)initWithDictionary:(id)a3
{
  id v4;
  ADFrequencyCap *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *adMetadata;
  void *v10;
  void *v11;
  double v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ADFrequencyCap;
  v5 = -[ADFrequencyCap init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ADIdentifierKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ADAdMetadataKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    adMetadata = v5->_adMetadata;
    v5->_adMetadata = (NSString *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ADDownloadTypeKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_downloadType = (int)objc_msgSend(v10, "intValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ADSetTimeKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    v5->_setTime = v12;

  }
  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (double)setTime
{
  return self->_setTime;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *adMetadata;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_identifier, CFSTR("ADIdentifierKey"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_setTime);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("ADSetTimeKey"));

  adMetadata = self->_adMetadata;
  if (adMetadata)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", adMetadata, CFSTR("ADAdMetadataKey"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", LODWORD(self->_downloadType));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("ADDownloadTypeKey"));

  return v3;
}

- (ADFrequencyCap)initWithIdentifier:(id)a3
{
  id v4;
  ADFrequencyCap *v5;
  ADFrequencyCap *v6;
  void *v7;
  uint64_t v8;
  NSString *identifier;
  uint64_t v10;
  NSString *adMetadata;
  void *v12;
  double v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ADFrequencyCap;
  v5 = -[ADFrequencyCap init](&v15, sel_init);
  v6 = v5;
  if (v5)
  {
    -[ADFrequencyCap splitCapData:](v5, "splitCapData:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ADIdentifierKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v8;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ADAdMetadataKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    adMetadata = v6->_adMetadata;
    v6->_adMetadata = (NSString *)v10;

    v6->_downloadType = 0;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSince1970");
    v6->_setTime = v13;

  }
  return v6;
}

- (id)splitCapData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("|"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v5, "objectAtIndex:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("ADIdentifierKey"));

    if (v7 != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB37A0], "string");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      for (i = 1; i != v7; ++i)
      {
        if (i >= 2)
        {
          objc_msgSend(v9, "stringByAppendingString:", CFSTR("|"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "mutableCopy");

          v9 = (void *)v12;
        }
        v13 = v9;
        objc_msgSend(v5, "objectAtIndex:", i);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringByAppendingString:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)objc_msgSend(v15, "mutableCopy");

      }
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("ADAdMetadataKey"));

    }
  }
  v16 = (void *)objc_msgSend(v4, "copy");

  return v16;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[ADFrequencyCap dictionaryRepresentation](self, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)adMetadata
{
  return self->_adMetadata;
}

- (void)setAdMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_adMetadata, a3);
}

- (int64_t)downloadType
{
  return self->_downloadType;
}

- (void)setDownloadType:(int64_t)a3
{
  self->_downloadType = a3;
}

- (void)setSetTime:(double)a3
{
  self->_setTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adMetadata, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
