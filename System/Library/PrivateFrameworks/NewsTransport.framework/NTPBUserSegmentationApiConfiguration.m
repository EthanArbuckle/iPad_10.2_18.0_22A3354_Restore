@implementation NTPBUserSegmentationApiConfiguration

- (BOOL)hasUserSegmentationApiModThreshold
{
  return self->_userSegmentationApiModThreshold != 0;
}

- (BOOL)hasUserSegmentationApiModMax
{
  return self->_userSegmentationApiModMax != 0;
}

- (BOOL)hasUserSegmentationRefreshRate
{
  return self->_userSegmentationRefreshRate != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NTPBUserSegmentationApiConfiguration;
  -[NTPBUserSegmentationApiConfiguration description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBUserSegmentationApiConfiguration dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *userSegmentationApiModThreshold;
  NSString *userSegmentationApiModMax;
  NSString *userSegmentationRefreshRate;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  userSegmentationApiModThreshold = self->_userSegmentationApiModThreshold;
  if (userSegmentationApiModThreshold)
    objc_msgSend(v3, "setObject:forKey:", userSegmentationApiModThreshold, CFSTR("user_segmentation_api_mod_threshold"));
  userSegmentationApiModMax = self->_userSegmentationApiModMax;
  if (userSegmentationApiModMax)
    objc_msgSend(v4, "setObject:forKey:", userSegmentationApiModMax, CFSTR("user_segmentation_api_mod_max"));
  userSegmentationRefreshRate = self->_userSegmentationRefreshRate;
  if (userSegmentationRefreshRate)
    objc_msgSend(v4, "setObject:forKey:", userSegmentationRefreshRate, CFSTR("user_segmentation_refresh_rate"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBUserSegmentationApiConfigurationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_userSegmentationApiModThreshold)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_userSegmentationApiModMax)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_userSegmentationRefreshRate)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_userSegmentationApiModThreshold, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_userSegmentationApiModMax, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  v10 = -[NSString copyWithZone:](self->_userSegmentationRefreshRate, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *userSegmentationApiModThreshold;
  NSString *userSegmentationApiModMax;
  NSString *userSegmentationRefreshRate;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((userSegmentationApiModThreshold = self->_userSegmentationApiModThreshold,
         !((unint64_t)userSegmentationApiModThreshold | v4[2]))
     || -[NSString isEqual:](userSegmentationApiModThreshold, "isEqual:"))
    && ((userSegmentationApiModMax = self->_userSegmentationApiModMax,
         !((unint64_t)userSegmentationApiModMax | v4[1]))
     || -[NSString isEqual:](userSegmentationApiModMax, "isEqual:")))
  {
    userSegmentationRefreshRate = self->_userSegmentationRefreshRate;
    if ((unint64_t)userSegmentationRefreshRate | v4[3])
      v8 = -[NSString isEqual:](userSegmentationRefreshRate, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_userSegmentationApiModThreshold, "hash");
  v4 = -[NSString hash](self->_userSegmentationApiModMax, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_userSegmentationRefreshRate, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[2])
    -[NTPBUserSegmentationApiConfiguration setUserSegmentationApiModThreshold:](self, "setUserSegmentationApiModThreshold:");
  if (v4[1])
    -[NTPBUserSegmentationApiConfiguration setUserSegmentationApiModMax:](self, "setUserSegmentationApiModMax:");
  if (v4[3])
    -[NTPBUserSegmentationApiConfiguration setUserSegmentationRefreshRate:](self, "setUserSegmentationRefreshRate:");

}

- (NSString)userSegmentationApiModThreshold
{
  return self->_userSegmentationApiModThreshold;
}

- (void)setUserSegmentationApiModThreshold:(id)a3
{
  objc_storeStrong((id *)&self->_userSegmentationApiModThreshold, a3);
}

- (NSString)userSegmentationApiModMax
{
  return self->_userSegmentationApiModMax;
}

- (void)setUserSegmentationApiModMax:(id)a3
{
  objc_storeStrong((id *)&self->_userSegmentationApiModMax, a3);
}

- (NSString)userSegmentationRefreshRate
{
  return self->_userSegmentationRefreshRate;
}

- (void)setUserSegmentationRefreshRate:(id)a3
{
  objc_storeStrong((id *)&self->_userSegmentationRefreshRate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userSegmentationRefreshRate, 0);
  objc_storeStrong((id *)&self->_userSegmentationApiModThreshold, 0);
  objc_storeStrong((id *)&self->_userSegmentationApiModMax, 0);
}

@end
