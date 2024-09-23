@implementation NTPBIssueDownload

- (BOOL)hasIssueData
{
  return self->_issueData != 0;
}

- (int)downloadLocation
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_downloadLocation;
  else
    return 0;
}

- (void)setDownloadLocation:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_downloadLocation = a3;
}

- (void)setHasDownloadLocation:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDownloadLocation
{
  return *(_BYTE *)&self->_has & 1;
}

- (int)downloadState
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_downloadState;
  else
    return 0;
}

- (void)setDownloadState:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_downloadState = a3;
}

- (void)setHasDownloadState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDownloadState
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (int)downloadType
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_downloadType;
  else
    return 0;
}

- (void)setDownloadType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_downloadType = a3;
}

- (void)setHasDownloadType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDownloadType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasSourceChannelId
{
  return self->_sourceChannelId != 0;
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
  v8.super_class = (Class)NTPBIssueDownload;
  -[NTPBIssueDownload description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBIssueDownload dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  NTPBIssueData *issueData;
  void *v5;
  char has;
  void *v7;
  NSString *sourceChannelId;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  issueData = self->_issueData;
  if (issueData)
  {
    -[NTPBIssueData dictionaryRepresentation](issueData, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("issue_data"));

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_downloadLocation);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("download_location"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_downloadState);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("download_state"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_downloadType);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("download_type"));

  }
LABEL_7:
  sourceChannelId = self->_sourceChannelId;
  if (sourceChannelId)
    objc_msgSend(v3, "setObject:forKey:", sourceChannelId, CFSTR("source_channel_id"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBIssueDownloadReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_issueData)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_6:
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
LABEL_7:
  if (self->_sourceChannelId)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  char has;
  uint64_t v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NTPBIssueData copyWithZone:](self->_issueData, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    *(_DWORD *)(v5 + 12) = self->_downloadState;
    *(_BYTE *)(v5 + 40) |= 2u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *(_DWORD *)(v5 + 8) = self->_downloadLocation;
  *(_BYTE *)(v5 + 40) |= 1u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 16) = self->_downloadType;
    *(_BYTE *)(v5 + 40) |= 4u;
  }
LABEL_5:
  v9 = -[NSString copyWithZone:](self->_sourceChannelId, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v9;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NTPBIssueData *issueData;
  NSString *sourceChannelId;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  issueData = self->_issueData;
  if ((unint64_t)issueData | *((_QWORD *)v4 + 3))
  {
    if (!-[NTPBIssueData isEqual:](issueData, "isEqual:"))
      goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_downloadLocation != *((_DWORD *)v4 + 2))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_21:
    v7 = 0;
    goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_downloadState != *((_DWORD *)v4 + 3))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 4) == 0 || self->_downloadType != *((_DWORD *)v4 + 4))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 40) & 4) != 0)
  {
    goto LABEL_21;
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((_QWORD *)v4 + 4))
    v7 = -[NSString isEqual:](sourceChannelId, "isEqual:");
  else
    v7 = 1;
LABEL_22:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[NTPBIssueData hash](self->_issueData, "hash");
  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ -[NSString hash](self->_sourceChannelId, "hash");
  }
  v4 = 2654435761 * self->_downloadLocation;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v5 = 2654435761 * self->_downloadState;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v6 = 2654435761 * self->_downloadType;
  return v4 ^ v3 ^ v5 ^ v6 ^ -[NSString hash](self->_sourceChannelId, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  NTPBIssueData *issueData;
  uint64_t v6;
  char v7;
  id v8;

  v4 = a3;
  issueData = self->_issueData;
  v6 = *((_QWORD *)v4 + 3);
  v8 = v4;
  if (issueData)
  {
    if (!v6)
      goto LABEL_7;
    -[NTPBIssueData mergeFrom:](issueData, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[NTPBIssueDownload setIssueData:](self, "setIssueData:");
  }
  v4 = v8;
LABEL_7:
  v7 = *((_BYTE *)v4 + 40);
  if ((v7 & 1) != 0)
  {
    self->_downloadLocation = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
    v7 = *((_BYTE *)v4 + 40);
    if ((v7 & 2) == 0)
    {
LABEL_9:
      if ((v7 & 4) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*((_BYTE *)v4 + 40) & 2) == 0)
  {
    goto LABEL_9;
  }
  self->_downloadState = *((_DWORD *)v4 + 3);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)v4 + 40) & 4) != 0)
  {
LABEL_10:
    self->_downloadType = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_11:
  if (*((_QWORD *)v4 + 4))
  {
    -[NTPBIssueDownload setSourceChannelId:](self, "setSourceChannelId:");
    v4 = v8;
  }

}

- (NTPBIssueData)issueData
{
  return self->_issueData;
}

- (void)setIssueData:(id)a3
{
  objc_storeStrong((id *)&self->_issueData, a3);
}

- (NSString)sourceChannelId
{
  return self->_sourceChannelId;
}

- (void)setSourceChannelId:(id)a3
{
  objc_storeStrong((id *)&self->_sourceChannelId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceChannelId, 0);
  objc_storeStrong((id *)&self->_issueData, 0);
}

@end
