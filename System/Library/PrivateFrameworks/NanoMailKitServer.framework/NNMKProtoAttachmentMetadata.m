@implementation NNMKProtoAttachmentMetadata

- (BOOL)hasContentId
{
  return self->_contentId != 0;
}

- (BOOL)hasFileName
{
  return self->_fileName != 0;
}

- (void)setFileSize:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_fileSize = a3;
}

- (void)setHasFileSize:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFileSize
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setType:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setRenderOnClient:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_renderOnClient = a3;
}

- (void)setHasRenderOnClient:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasRenderOnClient
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setImageWidth:(float)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_imageWidth = a3;
}

- (void)setHasImageWidth:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasImageWidth
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setImageHeight:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_imageHeight = a3;
}

- (void)setHasImageHeight:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasImageHeight
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasMimePartNumber
{
  return self->_mimePartNumber != 0;
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
  v8.super_class = (Class)NNMKProtoAttachmentMetadata;
  -[NNMKProtoAttachmentMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKProtoAttachmentMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  void *v5;
  NSString *contentId;
  NSString *fileName;
  char has;
  void *v9;
  NSString *mimePartNumber;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  contentId = self->_contentId;
  if (contentId)
    objc_msgSend(v3, "setObject:forKey:", contentId, CFSTR("contentId"));
  fileName = self->_fileName;
  if (fileName)
    objc_msgSend(v5, "setObject:forKey:", fileName, CFSTR("fileName"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_fileSize);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v12, CFSTR("fileSize"));

    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_7:
      if ((has & 0x10) == 0)
        goto LABEL_8;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_type);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v13, CFSTR("type"));

  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 4) == 0)
      goto LABEL_9;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_renderOnClient);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v14, CFSTR("renderOnClient"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 2) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_17:
  *(float *)&v4 = self->_imageWidth;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v15, CFSTR("imageWidth"));

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_10:
    *(float *)&v4 = self->_imageHeight;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v9, CFSTR("imageHeight"));

  }
LABEL_11:
  mimePartNumber = self->_mimePartNumber;
  if (mimePartNumber)
    objc_msgSend(v5, "setObject:forKey:", mimePartNumber, CFSTR("mimePartNumber"));
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return NNMKProtoAttachmentMetadataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_contentId)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_fileName)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_7:
      if ((has & 0x10) == 0)
        goto LABEL_8;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 4) == 0)
      goto LABEL_9;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 2) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_17:
  PBDataWriterWriteFloatField();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_10:
    PBDataWriterWriteFloatField();
    v4 = v6;
  }
LABEL_11:
  if (self->_mimePartNumber)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_contentId)
  {
    objc_msgSend(v4, "setContentId:");
    v4 = v6;
  }
  if (self->_fileName)
  {
    objc_msgSend(v6, "setFileName:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_fileSize;
    *((_BYTE *)v4 + 56) |= 1u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_7:
      if ((has & 0x10) == 0)
        goto LABEL_8;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)v4 + 12) = self->_type;
  *((_BYTE *)v4 + 56) |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 4) == 0)
      goto LABEL_9;
    goto LABEL_17;
  }
LABEL_16:
  *((_BYTE *)v4 + 52) = self->_renderOnClient;
  *((_BYTE *)v4 + 56) |= 0x10u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 2) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_17:
  *((_DWORD *)v4 + 8) = LODWORD(self->_imageWidth);
  *((_BYTE *)v4 + 56) |= 4u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_10:
    *((_DWORD *)v4 + 7) = LODWORD(self->_imageHeight);
    *((_BYTE *)v4 + 56) |= 2u;
  }
LABEL_11:
  if (self->_mimePartNumber)
  {
    objc_msgSend(v6, "setMimePartNumber:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char has;
  uint64_t v11;
  void *v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_contentId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  v8 = -[NSString copyWithZone:](self->_fileName, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_fileSize;
    *(_BYTE *)(v5 + 56) |= 1u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 48) = self->_type;
  *(_BYTE *)(v5 + 56) |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
LABEL_11:
    *(float *)(v5 + 32) = self->_imageWidth;
    *(_BYTE *)(v5 + 56) |= 4u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  *(_BYTE *)(v5 + 52) = self->_renderOnClient;
  *(_BYTE *)(v5 + 56) |= 0x10u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    *(float *)(v5 + 28) = self->_imageHeight;
    *(_BYTE *)(v5 + 56) |= 2u;
  }
LABEL_7:
  v11 = -[NSString copyWithZone:](self->_mimePartNumber, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v11;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *contentId;
  NSString *fileName;
  NSString *mimePartNumber;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_36;
  contentId = self->_contentId;
  if ((unint64_t)contentId | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](contentId, "isEqual:"))
      goto LABEL_36;
  }
  fileName = self->_fileName;
  if ((unint64_t)fileName | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](fileName, "isEqual:"))
      goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_fileSize != *((_DWORD *)v4 + 6))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 8) == 0 || self->_type != *((_DWORD *)v4 + 12))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 56) & 8) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 0x10) != 0)
    {
      if (self->_renderOnClient)
      {
        if (!*((_BYTE *)v4 + 52))
          goto LABEL_36;
        goto LABEL_24;
      }
      if (!*((_BYTE *)v4 + 52))
        goto LABEL_24;
    }
LABEL_36:
    v8 = 0;
    goto LABEL_37;
  }
  if ((*((_BYTE *)v4 + 56) & 0x10) != 0)
    goto LABEL_36;
LABEL_24:
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 4) == 0 || self->_imageWidth != *((float *)v4 + 8))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 56) & 4) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_imageHeight != *((float *)v4 + 7))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
    goto LABEL_36;
  }
  mimePartNumber = self->_mimePartNumber;
  if ((unint64_t)mimePartNumber | *((_QWORD *)v4 + 5))
    v8 = -[NSString isEqual:](mimePartNumber, "isEqual:");
  else
    v8 = 1;
LABEL_37:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  char has;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  float imageWidth;
  float v10;
  float v11;
  float v12;
  unint64_t v13;
  unint64_t v14;
  float imageHeight;
  float v16;
  float v17;
  float v18;

  v3 = -[NSString hash](self->_contentId, "hash");
  v4 = -[NSString hash](self->_fileName, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v6 = 2654435761 * self->_fileSize;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_3:
      v7 = 2654435761 * self->_type;
      if ((*(_BYTE *)&self->_has & 0x10) != 0)
        goto LABEL_4;
LABEL_11:
      v8 = 0;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_5;
LABEL_12:
      v13 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_3;
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_11;
LABEL_4:
  v8 = 2654435761 * self->_renderOnClient;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_12;
LABEL_5:
  imageWidth = self->_imageWidth;
  v10 = -imageWidth;
  if (imageWidth >= 0.0)
    v10 = self->_imageWidth;
  v11 = floorf(v10 + 0.5);
  v12 = (float)(v10 - v11) * 1.8447e19;
  v13 = 2654435761u * (unint64_t)fmodf(v11, 1.8447e19);
  if (v12 >= 0.0)
  {
    if (v12 > 0.0)
      v13 += (unint64_t)v12;
  }
  else
  {
    v13 -= (unint64_t)fabsf(v12);
  }
LABEL_15:
  if ((has & 2) != 0)
  {
    imageHeight = self->_imageHeight;
    v16 = -imageHeight;
    if (imageHeight >= 0.0)
      v16 = self->_imageHeight;
    v17 = floorf(v16 + 0.5);
    v18 = (float)(v16 - v17) * 1.8447e19;
    v14 = 2654435761u * (unint64_t)fmodf(v17, 1.8447e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabsf(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v13 ^ v14 ^ -[NSString hash](self->_mimePartNumber, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 1))
  {
    -[NNMKProtoAttachmentMetadata setContentId:](self, "setContentId:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[NNMKProtoAttachmentMetadata setFileName:](self, "setFileName:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 56);
  if ((v5 & 1) != 0)
  {
    self->_fileSize = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 56);
    if ((v5 & 8) == 0)
    {
LABEL_7:
      if ((v5 & 0x10) == 0)
        goto LABEL_8;
      goto LABEL_16;
    }
  }
  else if ((*((_BYTE *)v4 + 56) & 8) == 0)
  {
    goto LABEL_7;
  }
  self->_type = *((_DWORD *)v4 + 12);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 56);
  if ((v5 & 0x10) == 0)
  {
LABEL_8:
    if ((v5 & 4) == 0)
      goto LABEL_9;
    goto LABEL_17;
  }
LABEL_16:
  self->_renderOnClient = *((_BYTE *)v4 + 52);
  *(_BYTE *)&self->_has |= 0x10u;
  v5 = *((_BYTE *)v4 + 56);
  if ((v5 & 4) == 0)
  {
LABEL_9:
    if ((v5 & 2) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_17:
  self->_imageWidth = *((float *)v4 + 8);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
LABEL_10:
    self->_imageHeight = *((float *)v4 + 7);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_11:
  if (*((_QWORD *)v4 + 5))
  {
    -[NNMKProtoAttachmentMetadata setMimePartNumber:](self, "setMimePartNumber:");
    v4 = v6;
  }

}

- (NSString)contentId
{
  return self->_contentId;
}

- (void)setContentId:(id)a3
{
  objc_storeStrong((id *)&self->_contentId, a3);
}

- (NSString)fileName
{
  return self->_fileName;
}

- (void)setFileName:(id)a3
{
  objc_storeStrong((id *)&self->_fileName, a3);
}

- (unsigned)fileSize
{
  return self->_fileSize;
}

- (unsigned)type
{
  return self->_type;
}

- (BOOL)renderOnClient
{
  return self->_renderOnClient;
}

- (float)imageWidth
{
  return self->_imageWidth;
}

- (float)imageHeight
{
  return self->_imageHeight;
}

- (NSString)mimePartNumber
{
  return self->_mimePartNumber;
}

- (void)setMimePartNumber:(id)a3
{
  objc_storeStrong((id *)&self->_mimePartNumber, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mimePartNumber, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_contentId, 0);
}

@end
