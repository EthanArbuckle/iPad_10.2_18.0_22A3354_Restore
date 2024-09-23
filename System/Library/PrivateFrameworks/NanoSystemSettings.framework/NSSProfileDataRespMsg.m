@implementation NSSProfileDataRespMsg

- (BOOL)hasProfileData
{
  return self->_profileData != 0;
}

- (BOOL)hasProfilePayloadsSummary
{
  return self->_profilePayloadsSummary != 0;
}

- (BOOL)hasRmConfigurationViewModels
{
  return self->_rmConfigurationViewModels != 0;
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
  v8.super_class = (Class)NSSProfileDataRespMsg;
  -[NSSProfileDataRespMsg description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSSProfileDataRespMsg dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *profileData;
  NSData *profilePayloadsSummary;
  NSData *rmConfigurationViewModels;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  profileData = self->_profileData;
  if (profileData)
    objc_msgSend(v3, "setObject:forKey:", profileData, CFSTR("profileData"));
  profilePayloadsSummary = self->_profilePayloadsSummary;
  if (profilePayloadsSummary)
    objc_msgSend(v4, "setObject:forKey:", profilePayloadsSummary, CFSTR("profilePayloadsSummary"));
  rmConfigurationViewModels = self->_rmConfigurationViewModels;
  if (rmConfigurationViewModels)
    objc_msgSend(v4, "setObject:forKey:", rmConfigurationViewModels, CFSTR("rmConfigurationViewModels"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NSSProfileDataRespMsgReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_profileData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_profilePayloadsSummary)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_rmConfigurationViewModels)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_profileData)
  {
    objc_msgSend(v4, "setProfileData:");
    v4 = v5;
  }
  if (self->_profilePayloadsSummary)
  {
    objc_msgSend(v5, "setProfilePayloadsSummary:");
    v4 = v5;
  }
  if (self->_rmConfigurationViewModels)
  {
    objc_msgSend(v5, "setRmConfigurationViewModels:");
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
  v6 = -[NSData copyWithZone:](self->_profileData, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSData copyWithZone:](self->_profilePayloadsSummary, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSData copyWithZone:](self->_rmConfigurationViewModels, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *profileData;
  NSData *profilePayloadsSummary;
  NSData *rmConfigurationViewModels;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((profileData = self->_profileData, !((unint64_t)profileData | v4[1]))
     || -[NSData isEqual:](profileData, "isEqual:"))
    && ((profilePayloadsSummary = self->_profilePayloadsSummary, !((unint64_t)profilePayloadsSummary | v4[2]))
     || -[NSData isEqual:](profilePayloadsSummary, "isEqual:")))
  {
    rmConfigurationViewModels = self->_rmConfigurationViewModels;
    if ((unint64_t)rmConfigurationViewModels | v4[3])
      v8 = -[NSData isEqual:](rmConfigurationViewModels, "isEqual:");
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
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSData hash](self->_profileData, "hash");
  v4 = -[NSData hash](self->_profilePayloadsSummary, "hash") ^ v3;
  return v4 ^ -[NSData hash](self->_rmConfigurationViewModels, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[1])
    -[NSSProfileDataRespMsg setProfileData:](self, "setProfileData:");
  if (v4[2])
    -[NSSProfileDataRespMsg setProfilePayloadsSummary:](self, "setProfilePayloadsSummary:");
  if (v4[3])
    -[NSSProfileDataRespMsg setRmConfigurationViewModels:](self, "setRmConfigurationViewModels:");

}

- (NSData)profileData
{
  return self->_profileData;
}

- (void)setProfileData:(id)a3
{
  objc_storeStrong((id *)&self->_profileData, a3);
}

- (NSData)profilePayloadsSummary
{
  return self->_profilePayloadsSummary;
}

- (void)setProfilePayloadsSummary:(id)a3
{
  objc_storeStrong((id *)&self->_profilePayloadsSummary, a3);
}

- (NSData)rmConfigurationViewModels
{
  return self->_rmConfigurationViewModels;
}

- (void)setRmConfigurationViewModels:(id)a3
{
  objc_storeStrong((id *)&self->_rmConfigurationViewModels, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rmConfigurationViewModels, 0);
  objc_storeStrong((id *)&self->_profilePayloadsSummary, 0);
  objc_storeStrong((id *)&self->_profileData, 0);
}

@end
