@implementation NTPBAppConfigurationResource

- (void)dealloc
{
  objc_super v3;

  -[NTPBAppConfigurationResource setGzippedConfigurationData:](self, "setGzippedConfigurationData:", 0);
  -[NTPBAppConfigurationResource setSourceURL:](self, "setSourceURL:", 0);
  -[NTPBAppConfigurationResource setEtag:](self, "setEtag:", 0);
  -[NTPBAppConfigurationResource setLastFetchedDate:](self, "setLastFetchedDate:", 0);
  -[NTPBAppConfigurationResource setLastModifiedDate:](self, "setLastModifiedDate:", 0);
  -[NTPBAppConfigurationResource setLastModifiedString:](self, "setLastModifiedString:", 0);
  -[NTPBAppConfigurationResource setResourceID:](self, "setResourceID:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBAppConfigurationResource;
  -[NTPBAppConfigurationResource dealloc](&v3, sel_dealloc);
}

- (BOOL)hasGzippedConfigurationData
{
  return self->_gzippedConfigurationData != 0;
}

- (BOOL)hasSourceURL
{
  return self->_sourceURL != 0;
}

- (BOOL)hasEtag
{
  return self->_etag != 0;
}

- (BOOL)hasLastFetchedDate
{
  return self->_lastFetchedDate != 0;
}

- (BOOL)hasLastModifiedDate
{
  return self->_lastModifiedDate != 0;
}

- (BOOL)hasLastModifiedString
{
  return self->_lastModifiedString != 0;
}

- (void)setMaxAge:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_maxAge = a3;
}

- (void)setHasMaxAge:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMaxAge
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasResourceID
{
  return self->_resourceID != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBAppConfigurationResource;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBAppConfigurationResource description](&v3, sel_description), -[NTPBAppConfigurationResource dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *gzippedConfigurationData;
  NSString *sourceURL;
  NSString *etag;
  NTPBDate *lastFetchedDate;
  NTPBDate *lastModifiedDate;
  NSString *lastModifiedString;
  NSString *resourceID;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = v3;
  gzippedConfigurationData = self->_gzippedConfigurationData;
  if (gzippedConfigurationData)
    objc_msgSend(v3, "setObject:forKey:", gzippedConfigurationData, CFSTR("gzipped_configuration_data"));
  sourceURL = self->_sourceURL;
  if (sourceURL)
    objc_msgSend(v4, "setObject:forKey:", sourceURL, CFSTR("source_URL"));
  etag = self->_etag;
  if (etag)
    objc_msgSend(v4, "setObject:forKey:", etag, CFSTR("etag"));
  lastFetchedDate = self->_lastFetchedDate;
  if (lastFetchedDate)
    objc_msgSend(v4, "setObject:forKey:", -[NTPBDate dictionaryRepresentation](lastFetchedDate, "dictionaryRepresentation"), CFSTR("last_fetched_date"));
  lastModifiedDate = self->_lastModifiedDate;
  if (lastModifiedDate)
    objc_msgSend(v4, "setObject:forKey:", -[NTPBDate dictionaryRepresentation](lastModifiedDate, "dictionaryRepresentation"), CFSTR("last_modified_date"));
  lastModifiedString = self->_lastModifiedString;
  if (lastModifiedString)
    objc_msgSend(v4, "setObject:forKey:", lastModifiedString, CFSTR("last_modified_string"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_maxAge), CFSTR("max_age"));
  resourceID = self->_resourceID;
  if (resourceID)
    objc_msgSend(v4, "setObject:forKey:", resourceID, CFSTR("resource_ID"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBAppConfigurationResourceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_gzippedConfigurationData)
    PBDataWriterWriteDataField();
  if (self->_sourceURL)
    PBDataWriterWriteStringField();
  if (self->_etag)
    PBDataWriterWriteStringField();
  if (self->_lastFetchedDate)
    PBDataWriterWriteSubmessage();
  if (self->_lastModifiedDate)
    PBDataWriterWriteSubmessage();
  if (self->_lastModifiedString)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_resourceID)
    PBDataWriterWriteStringField();
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(_QWORD *)(v5 + 24) = -[NSData copyWithZone:](self->_gzippedConfigurationData, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 64) = -[NSString copyWithZone:](self->_sourceURL, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 16) = -[NSString copyWithZone:](self->_etag, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 32) = -[NTPBDate copyWithZone:](self->_lastFetchedDate, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 40) = -[NTPBDate copyWithZone:](self->_lastModifiedDate, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 48) = -[NSString copyWithZone:](self->_lastModifiedString, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_maxAge;
    *(_BYTE *)(v5 + 72) |= 1u;
  }

  *(_QWORD *)(v5 + 56) = -[NSString copyWithZone:](self->_resourceID, "copyWithZone:", a3);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSData *gzippedConfigurationData;
  NSString *sourceURL;
  NSString *etag;
  NTPBDate *lastFetchedDate;
  NTPBDate *lastModifiedDate;
  NSString *lastModifiedString;
  NSString *resourceID;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    gzippedConfigurationData = self->_gzippedConfigurationData;
    if (!((unint64_t)gzippedConfigurationData | *((_QWORD *)a3 + 3))
      || (v5 = -[NSData isEqual:](gzippedConfigurationData, "isEqual:")) != 0)
    {
      sourceURL = self->_sourceURL;
      if (!((unint64_t)sourceURL | *((_QWORD *)a3 + 8))
        || (v5 = -[NSString isEqual:](sourceURL, "isEqual:")) != 0)
      {
        etag = self->_etag;
        if (!((unint64_t)etag | *((_QWORD *)a3 + 2)) || (v5 = -[NSString isEqual:](etag, "isEqual:")) != 0)
        {
          lastFetchedDate = self->_lastFetchedDate;
          if (!((unint64_t)lastFetchedDate | *((_QWORD *)a3 + 4))
            || (v5 = -[NTPBDate isEqual:](lastFetchedDate, "isEqual:")) != 0)
          {
            lastModifiedDate = self->_lastModifiedDate;
            if (!((unint64_t)lastModifiedDate | *((_QWORD *)a3 + 5))
              || (v5 = -[NTPBDate isEqual:](lastModifiedDate, "isEqual:")) != 0)
            {
              lastModifiedString = self->_lastModifiedString;
              if (!((unint64_t)lastModifiedString | *((_QWORD *)a3 + 6))
                || (v5 = -[NSString isEqual:](lastModifiedString, "isEqual:")) != 0)
              {
                if ((*(_BYTE *)&self->_has & 1) != 0)
                {
                  if ((*((_BYTE *)a3 + 72) & 1) == 0 || self->_maxAge != *((_QWORD *)a3 + 1))
                    goto LABEL_21;
                }
                else if ((*((_BYTE *)a3 + 72) & 1) != 0)
                {
LABEL_21:
                  LOBYTE(v5) = 0;
                  return v5;
                }
                resourceID = self->_resourceID;
                if ((unint64_t)resourceID | *((_QWORD *)a3 + 7))
                  LOBYTE(v5) = -[NSString isEqual:](resourceID, "isEqual:");
                else
                  LOBYTE(v5) = 1;
              }
            }
          }
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  unint64_t v6;
  unint64_t v7;
  NSUInteger v8;
  uint64_t v9;

  v3 = -[NSData hash](self->_gzippedConfigurationData, "hash");
  v4 = -[NSString hash](self->_sourceURL, "hash");
  v5 = -[NSString hash](self->_etag, "hash");
  v6 = -[NTPBDate hash](self->_lastFetchedDate, "hash");
  v7 = -[NTPBDate hash](self->_lastModifiedDate, "hash");
  v8 = -[NSString hash](self->_lastModifiedString, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v9 = 2654435761 * self->_maxAge;
  else
    v9 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ -[NSString hash](self->_resourceID, "hash");
}

- (void)mergeFrom:(id)a3
{
  NTPBDate *lastFetchedDate;
  uint64_t v6;
  NTPBDate *lastModifiedDate;
  uint64_t v8;

  if (*((_QWORD *)a3 + 3))
    -[NTPBAppConfigurationResource setGzippedConfigurationData:](self, "setGzippedConfigurationData:");
  if (*((_QWORD *)a3 + 8))
    -[NTPBAppConfigurationResource setSourceURL:](self, "setSourceURL:");
  if (*((_QWORD *)a3 + 2))
    -[NTPBAppConfigurationResource setEtag:](self, "setEtag:");
  lastFetchedDate = self->_lastFetchedDate;
  v6 = *((_QWORD *)a3 + 4);
  if (lastFetchedDate)
  {
    if (v6)
      -[NTPBDate mergeFrom:](lastFetchedDate, "mergeFrom:");
  }
  else if (v6)
  {
    -[NTPBAppConfigurationResource setLastFetchedDate:](self, "setLastFetchedDate:");
  }
  lastModifiedDate = self->_lastModifiedDate;
  v8 = *((_QWORD *)a3 + 5);
  if (lastModifiedDate)
  {
    if (v8)
      -[NTPBDate mergeFrom:](lastModifiedDate, "mergeFrom:");
  }
  else if (v8)
  {
    -[NTPBAppConfigurationResource setLastModifiedDate:](self, "setLastModifiedDate:");
  }
  if (*((_QWORD *)a3 + 6))
    -[NTPBAppConfigurationResource setLastModifiedString:](self, "setLastModifiedString:");
  if ((*((_BYTE *)a3 + 72) & 1) != 0)
  {
    self->_maxAge = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)a3 + 7))
    -[NTPBAppConfigurationResource setResourceID:](self, "setResourceID:");
}

- (NSData)gzippedConfigurationData
{
  return self->_gzippedConfigurationData;
}

- (void)setGzippedConfigurationData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSString)sourceURL
{
  return self->_sourceURL;
}

- (void)setSourceURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (NSString)etag
{
  return self->_etag;
}

- (void)setEtag:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NTPBDate)lastFetchedDate
{
  return self->_lastFetchedDate;
}

- (void)setLastFetchedDate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NTPBDate)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (void)setLastModifiedDate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSString)lastModifiedString
{
  return self->_lastModifiedString;
}

- (void)setLastModifiedString:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (int64_t)maxAge
{
  return self->_maxAge;
}

- (NSString)resourceID
{
  return self->_resourceID;
}

- (void)setResourceID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

@end
