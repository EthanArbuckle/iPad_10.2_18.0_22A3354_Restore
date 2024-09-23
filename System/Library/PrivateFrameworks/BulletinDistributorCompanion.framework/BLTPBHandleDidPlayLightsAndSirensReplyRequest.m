@implementation BLTPBHandleDidPlayLightsAndSirensReplyRequest

- (void)setDidPlayLightsAndSirens:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_didPlayLightsAndSirens = a3;
}

- (void)setHasDidPlayLightsAndSirens:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDidPlayLightsAndSirens
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasPublisherMatchID
{
  return self->_publisherMatchID != 0;
}

- (BOOL)hasPhoneSectionID
{
  return self->_phoneSectionID != 0;
}

- (void)setDate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_date = a3;
}

- (void)setHasDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDate
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasReplyToken
{
  return self->_replyToken != 0;
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
  v8.super_class = (Class)BLTPBHandleDidPlayLightsAndSirensReplyRequest;
  -[BLTPBHandleDidPlayLightsAndSirensReplyRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBHandleDidPlayLightsAndSirensReplyRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *publisherMatchID;
  NSString *phoneSectionID;
  void *v7;
  NSString *replyToken;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_didPlayLightsAndSirens);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("didPlayLightsAndSirens"));

  }
  publisherMatchID = self->_publisherMatchID;
  if (publisherMatchID)
    objc_msgSend(v3, "setObject:forKey:", publisherMatchID, CFSTR("publisherMatchID"));
  phoneSectionID = self->_phoneSectionID;
  if (phoneSectionID)
    objc_msgSend(v3, "setObject:forKey:", phoneSectionID, CFSTR("phoneSectionID"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_date);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("date"));

  }
  replyToken = self->_replyToken;
  if (replyToken)
    objc_msgSend(v3, "setObject:forKey:", replyToken, CFSTR("replyToken"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BLTPBHandleDidPlayLightsAndSirensReplyRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_publisherMatchID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_phoneSectionID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_replyToken)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[40] = self->_didPlayLightsAndSirens;
    v4[44] |= 2u;
  }
  v5 = v4;
  if (self->_publisherMatchID)
  {
    objc_msgSend(v4, "setPublisherMatchID:");
    v4 = v5;
  }
  if (self->_phoneSectionID)
  {
    objc_msgSend(v5, "setPhoneSectionID:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_date;
    v4[44] |= 1u;
  }
  if (self->_replyToken)
  {
    objc_msgSend(v5, "setReplyToken:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_BYTE *)(v5 + 40) = self->_didPlayLightsAndSirens;
    *(_BYTE *)(v5 + 44) |= 2u;
  }
  v7 = -[NSString copyWithZone:](self->_publisherMatchID, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v7;

  v9 = -[NSString copyWithZone:](self->_phoneSectionID, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v9;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v6 + 8) = self->_date;
    *(_BYTE *)(v6 + 44) |= 1u;
  }
  v11 = -[NSString copyWithZone:](self->_replyToken, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v11;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *publisherMatchID;
  NSString *phoneSectionID;
  NSString *replyToken;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) != 0)
    {
      if (self->_didPlayLightsAndSirens)
      {
        if (!*((_BYTE *)v4 + 40))
          goto LABEL_21;
        goto LABEL_10;
      }
      if (!*((_BYTE *)v4 + 40))
        goto LABEL_10;
    }
LABEL_21:
    v8 = 0;
    goto LABEL_22;
  }
  if ((*((_BYTE *)v4 + 44) & 2) != 0)
    goto LABEL_21;
LABEL_10:
  publisherMatchID = self->_publisherMatchID;
  if ((unint64_t)publisherMatchID | *((_QWORD *)v4 + 3)
    && !-[NSString isEqual:](publisherMatchID, "isEqual:"))
  {
    goto LABEL_21;
  }
  phoneSectionID = self->_phoneSectionID;
  if ((unint64_t)phoneSectionID | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](phoneSectionID, "isEqual:"))
      goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_date != *((double *)v4 + 1))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_21;
  }
  replyToken = self->_replyToken;
  if ((unint64_t)replyToken | *((_QWORD *)v4 + 4))
    v8 = -[NSString isEqual:](replyToken, "isEqual:");
  else
    v8 = 1;
LABEL_22:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  unint64_t v6;
  double date;
  double v8;
  long double v9;
  double v10;

  if ((*(_BYTE *)&self->_has & 2) != 0)
    v3 = 2654435761 * self->_didPlayLightsAndSirens;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_publisherMatchID, "hash");
  v5 = -[NSString hash](self->_phoneSectionID, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    date = self->_date;
    v8 = -date;
    if (date >= 0.0)
      v8 = self->_date;
    v9 = floor(v8 + 0.5);
    v10 = (v8 - v9) * 1.84467441e19;
    v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0)
        v6 += (unint64_t)v10;
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ -[NSString hash](self->_replyToken, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
    self->_didPlayLightsAndSirens = *((_BYTE *)v4 + 40);
    *(_BYTE *)&self->_has |= 2u;
  }
  v5 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[BLTPBHandleDidPlayLightsAndSirensReplyRequest setPublisherMatchID:](self, "setPublisherMatchID:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[BLTPBHandleDidPlayLightsAndSirensReplyRequest setPhoneSectionID:](self, "setPhoneSectionID:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    self->_date = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[BLTPBHandleDidPlayLightsAndSirensReplyRequest setReplyToken:](self, "setReplyToken:");
    v4 = v5;
  }

}

- (BOOL)didPlayLightsAndSirens
{
  return self->_didPlayLightsAndSirens;
}

- (NSString)publisherMatchID
{
  return self->_publisherMatchID;
}

- (void)setPublisherMatchID:(id)a3
{
  objc_storeStrong((id *)&self->_publisherMatchID, a3);
}

- (NSString)phoneSectionID
{
  return self->_phoneSectionID;
}

- (void)setPhoneSectionID:(id)a3
{
  objc_storeStrong((id *)&self->_phoneSectionID, a3);
}

- (double)date
{
  return self->_date;
}

- (NSString)replyToken
{
  return self->_replyToken;
}

- (void)setReplyToken:(id)a3
{
  objc_storeStrong((id *)&self->_replyToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyToken, 0);
  objc_storeStrong((id *)&self->_publisherMatchID, 0);
  objc_storeStrong((id *)&self->_phoneSectionID, 0);
}

@end
