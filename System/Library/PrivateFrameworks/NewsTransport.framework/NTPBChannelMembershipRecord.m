@implementation NTPBChannelMembershipRecord

- (void)dealloc
{
  objc_super v3;

  -[NTPBChannelMembershipRecord setBase:](self, "setBase:", 0);
  -[NTPBChannelMembershipRecord setChannelID:](self, "setChannelID:", 0);
  -[NTPBChannelMembershipRecord setDraftArticleListID:](self, "setDraftArticleListID:", 0);
  -[NTPBChannelMembershipRecord setDraftIssueListID:](self, "setDraftIssueListID:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBChannelMembershipRecord;
  -[NTPBChannelMembershipRecord dealloc](&v3, sel_dealloc);
}

- (BOOL)hasBase
{
  return self->_base != 0;
}

- (BOOL)hasChannelID
{
  return self->_channelID != 0;
}

- (void)setCanAccessDrafts:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_canAccessDrafts = a3;
}

- (void)setHasCanAccessDrafts:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCanAccessDrafts
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasDraftArticleListID
{
  return self->_draftArticleListID != 0;
}

- (BOOL)hasDraftIssueListID
{
  return self->_draftIssueListID != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBChannelMembershipRecord;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBChannelMembershipRecord description](&v3, sel_description), -[NTPBChannelMembershipRecord dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NTPBRecordBase *base;
  NSString *channelID;
  NSString *draftArticleListID;
  NSString *draftIssueListID;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  base = self->_base;
  if (base)
    objc_msgSend(v3, "setObject:forKey:", -[NTPBRecordBase dictionaryRepresentation](base, "dictionaryRepresentation"), CFSTR("base"));
  channelID = self->_channelID;
  if (channelID)
    objc_msgSend(v3, "setObject:forKey:", channelID, CFSTR("channel_ID"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_canAccessDrafts), CFSTR("can_access_drafts"));
  draftArticleListID = self->_draftArticleListID;
  if (draftArticleListID)
    objc_msgSend(v3, "setObject:forKey:", draftArticleListID, CFSTR("draft_article_list_ID"));
  draftIssueListID = self->_draftIssueListID;
  if (draftIssueListID)
    objc_msgSend(v3, "setObject:forKey:", draftIssueListID, CFSTR("draft_issue_list_ID"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBChannelMembershipRecordReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_base)
    PBDataWriterWriteSubmessage();
  if (self->_channelID)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_draftArticleListID)
    PBDataWriterWriteStringField();
  if (self->_draftIssueListID)
    PBDataWriterWriteStringField();
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(_QWORD *)(v5 + 8) = -[NTPBRecordBase copyWithZone:](self->_base, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 16) = -[NSString copyWithZone:](self->_channelID, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 40) = self->_canAccessDrafts;
    *(_BYTE *)(v5 + 44) |= 1u;
  }

  *(_QWORD *)(v5 + 24) = -[NSString copyWithZone:](self->_draftArticleListID, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 32) = -[NSString copyWithZone:](self->_draftIssueListID, "copyWithZone:", a3);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NTPBRecordBase *base;
  NSString *channelID;
  NSString *draftArticleListID;
  NSString *draftIssueListID;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    base = self->_base;
    if (!((unint64_t)base | *((_QWORD *)a3 + 1)) || (v5 = -[NTPBRecordBase isEqual:](base, "isEqual:")) != 0)
    {
      channelID = self->_channelID;
      if (!((unint64_t)channelID | *((_QWORD *)a3 + 2))
        || (v5 = -[NSString isEqual:](channelID, "isEqual:")) != 0)
      {
        if ((*(_BYTE *)&self->_has & 1) != 0)
        {
          if ((*((_BYTE *)a3 + 44) & 1) != 0)
          {
            if (self->_canAccessDrafts)
            {
              if (!*((_BYTE *)a3 + 40))
                goto LABEL_10;
            }
            else if (*((_BYTE *)a3 + 40))
            {
              goto LABEL_10;
            }
LABEL_16:
            draftArticleListID = self->_draftArticleListID;
            if (!((unint64_t)draftArticleListID | *((_QWORD *)a3 + 3))
              || (v5 = -[NSString isEqual:](draftArticleListID, "isEqual:")) != 0)
            {
              draftIssueListID = self->_draftIssueListID;
              if ((unint64_t)draftIssueListID | *((_QWORD *)a3 + 4))
                LOBYTE(v5) = -[NSString isEqual:](draftIssueListID, "isEqual:");
              else
                LOBYTE(v5) = 1;
            }
            return v5;
          }
        }
        else if ((*((_BYTE *)a3 + 44) & 1) == 0)
        {
          goto LABEL_16;
        }
LABEL_10:
        LOBYTE(v5) = 0;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  NSUInteger v6;

  v3 = -[NTPBRecordBase hash](self->_base, "hash");
  v4 = -[NSString hash](self->_channelID, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_canAccessDrafts;
  else
    v5 = 0;
  v6 = v4 ^ v3 ^ v5 ^ -[NSString hash](self->_draftArticleListID, "hash");
  return v6 ^ -[NSString hash](self->_draftIssueListID, "hash");
}

- (void)mergeFrom:(id)a3
{
  NTPBRecordBase *base;
  uint64_t v6;

  base = self->_base;
  v6 = *((_QWORD *)a3 + 1);
  if (base)
  {
    if (v6)
      -[NTPBRecordBase mergeFrom:](base, "mergeFrom:");
  }
  else if (v6)
  {
    -[NTPBChannelMembershipRecord setBase:](self, "setBase:");
  }
  if (*((_QWORD *)a3 + 2))
    -[NTPBChannelMembershipRecord setChannelID:](self, "setChannelID:");
  if ((*((_BYTE *)a3 + 44) & 1) != 0)
  {
    self->_canAccessDrafts = *((_BYTE *)a3 + 40);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)a3 + 3))
    -[NTPBChannelMembershipRecord setDraftArticleListID:](self, "setDraftArticleListID:");
  if (*((_QWORD *)a3 + 4))
    -[NTPBChannelMembershipRecord setDraftIssueListID:](self, "setDraftIssueListID:");
}

- (NTPBRecordBase)base
{
  return self->_base;
}

- (void)setBase:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSString)channelID
{
  return self->_channelID;
}

- (void)setChannelID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (BOOL)canAccessDrafts
{
  return self->_canAccessDrafts;
}

- (NSString)draftArticleListID
{
  return self->_draftArticleListID;
}

- (void)setDraftArticleListID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSString)draftIssueListID
{
  return self->_draftIssueListID;
}

- (void)setDraftIssueListID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

@end
