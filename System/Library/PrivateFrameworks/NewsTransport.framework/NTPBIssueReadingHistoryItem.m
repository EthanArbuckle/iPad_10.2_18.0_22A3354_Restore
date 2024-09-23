@implementation NTPBIssueReadingHistoryItem

- (void)dealloc
{
  objc_super v3;

  -[NTPBIssueReadingHistoryItem setIdentifier:](self, "setIdentifier:", 0);
  -[NTPBIssueReadingHistoryItem setIssueID:](self, "setIssueID:", 0);
  -[NTPBIssueReadingHistoryItem setLastVisitedPBDate:](self, "setLastVisitedPBDate:", 0);
  -[NTPBIssueReadingHistoryItem setLastVisitedArticleID:](self, "setLastVisitedArticleID:", 0);
  -[NTPBIssueReadingHistoryItem setLastVisitedPageID:](self, "setLastVisitedPageID:", 0);
  -[NTPBIssueReadingHistoryItem setLastBadgedPBDate:](self, "setLastBadgedPBDate:", 0);
  -[NTPBIssueReadingHistoryItem setLastEngagedPBDate:](self, "setLastEngagedPBDate:", 0);
  -[NTPBIssueReadingHistoryItem setLastRemovedFromMyMagazinesPBDate:](self, "setLastRemovedFromMyMagazinesPBDate:", 0);
  -[NTPBIssueReadingHistoryItem setLastSeenPBDate:](self, "setLastSeenPBDate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBIssueReadingHistoryItem;
  -[NTPBIssueReadingHistoryItem dealloc](&v3, sel_dealloc);
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasIssueID
{
  return self->_issueID != 0;
}

- (BOOL)hasLastVisitedPBDate
{
  return self->_lastVisitedPBDate != 0;
}

- (BOOL)hasLastVisitedArticleID
{
  return self->_lastVisitedArticleID != 0;
}

- (BOOL)hasLastVisitedPageID
{
  return self->_lastVisitedPageID != 0;
}

- (BOOL)hasLastBadgedPBDate
{
  return self->_lastBadgedPBDate != 0;
}

- (BOOL)hasLastEngagedPBDate
{
  return self->_lastEngagedPBDate != 0;
}

- (BOOL)hasLastRemovedFromMyMagazinesPBDate
{
  return self->_lastRemovedFromMyMagazinesPBDate != 0;
}

- (BOOL)hasLastSeenPBDate
{
  return self->_lastSeenPBDate != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBIssueReadingHistoryItem;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBIssueReadingHistoryItem description](&v3, sel_description), -[NTPBIssueReadingHistoryItem dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *identifier;
  NSString *issueID;
  NTPBDate *lastVisitedPBDate;
  NSString *lastVisitedArticleID;
  NSString *lastVisitedPageID;
  NTPBDate *lastBadgedPBDate;
  NTPBDate *lastEngagedPBDate;
  NTPBDate *lastRemovedFromMyMagazinesPBDate;
  NTPBDate *lastSeenPBDate;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  issueID = self->_issueID;
  if (issueID)
    objc_msgSend(v4, "setObject:forKey:", issueID, CFSTR("issue_ID"));
  lastVisitedPBDate = self->_lastVisitedPBDate;
  if (lastVisitedPBDate)
    objc_msgSend(v4, "setObject:forKey:", -[NTPBDate dictionaryRepresentation](lastVisitedPBDate, "dictionaryRepresentation"), CFSTR("last_visited_PB_date"));
  lastVisitedArticleID = self->_lastVisitedArticleID;
  if (lastVisitedArticleID)
    objc_msgSend(v4, "setObject:forKey:", lastVisitedArticleID, CFSTR("last_visited_article_ID"));
  lastVisitedPageID = self->_lastVisitedPageID;
  if (lastVisitedPageID)
    objc_msgSend(v4, "setObject:forKey:", lastVisitedPageID, CFSTR("last_visited_page_ID"));
  lastBadgedPBDate = self->_lastBadgedPBDate;
  if (lastBadgedPBDate)
    objc_msgSend(v4, "setObject:forKey:", -[NTPBDate dictionaryRepresentation](lastBadgedPBDate, "dictionaryRepresentation"), CFSTR("last_badged_PB_date"));
  lastEngagedPBDate = self->_lastEngagedPBDate;
  if (lastEngagedPBDate)
    objc_msgSend(v4, "setObject:forKey:", -[NTPBDate dictionaryRepresentation](lastEngagedPBDate, "dictionaryRepresentation"), CFSTR("last_engaged_PB_date"));
  lastRemovedFromMyMagazinesPBDate = self->_lastRemovedFromMyMagazinesPBDate;
  if (lastRemovedFromMyMagazinesPBDate)
    objc_msgSend(v4, "setObject:forKey:", -[NTPBDate dictionaryRepresentation](lastRemovedFromMyMagazinesPBDate, "dictionaryRepresentation"), CFSTR("last_removed_from_my_magazines_PB_date"));
  lastSeenPBDate = self->_lastSeenPBDate;
  if (lastSeenPBDate)
    objc_msgSend(v4, "setObject:forKey:", -[NTPBDate dictionaryRepresentation](lastSeenPBDate, "dictionaryRepresentation"), CFSTR("last_seen_PB_date"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBIssueReadingHistoryItemReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_identifier)
    PBDataWriterWriteStringField();
  if (self->_issueID)
    PBDataWriterWriteStringField();
  if (self->_lastVisitedPBDate)
    PBDataWriterWriteSubmessage();
  if (self->_lastVisitedArticleID)
    PBDataWriterWriteStringField();
  if (self->_lastVisitedPageID)
    PBDataWriterWriteStringField();
  if (self->_lastBadgedPBDate)
    PBDataWriterWriteSubmessage();
  if (self->_lastEngagedPBDate)
    PBDataWriterWriteSubmessage();
  if (self->_lastRemovedFromMyMagazinesPBDate)
    PBDataWriterWriteSubmessage();
  if (self->_lastSeenPBDate)
    PBDataWriterWriteSubmessage();
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;

  v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[1] = (id)-[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v5[2] = (id)-[NSString copyWithZone:](self->_issueID, "copyWithZone:", a3);

  v5[8] = -[NTPBDate copyWithZone:](self->_lastVisitedPBDate, "copyWithZone:", a3);
  v5[7] = (id)-[NSString copyWithZone:](self->_lastVisitedArticleID, "copyWithZone:", a3);

  v5[9] = (id)-[NSString copyWithZone:](self->_lastVisitedPageID, "copyWithZone:", a3);
  v5[3] = -[NTPBDate copyWithZone:](self->_lastBadgedPBDate, "copyWithZone:", a3);

  v5[4] = -[NTPBDate copyWithZone:](self->_lastEngagedPBDate, "copyWithZone:", a3);
  v5[5] = -[NTPBDate copyWithZone:](self->_lastRemovedFromMyMagazinesPBDate, "copyWithZone:", a3);

  v5[6] = -[NTPBDate copyWithZone:](self->_lastSeenPBDate, "copyWithZone:", a3);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *identifier;
  NSString *issueID;
  NTPBDate *lastVisitedPBDate;
  NSString *lastVisitedArticleID;
  NSString *lastVisitedPageID;
  NTPBDate *lastBadgedPBDate;
  NTPBDate *lastEngagedPBDate;
  NTPBDate *lastRemovedFromMyMagazinesPBDate;
  NTPBDate *lastSeenPBDate;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    identifier = self->_identifier;
    if (!((unint64_t)identifier | *((_QWORD *)a3 + 1))
      || (v5 = -[NSString isEqual:](identifier, "isEqual:")) != 0)
    {
      issueID = self->_issueID;
      if (!((unint64_t)issueID | *((_QWORD *)a3 + 2)) || (v5 = -[NSString isEqual:](issueID, "isEqual:")) != 0)
      {
        lastVisitedPBDate = self->_lastVisitedPBDate;
        if (!((unint64_t)lastVisitedPBDate | *((_QWORD *)a3 + 8))
          || (v5 = -[NTPBDate isEqual:](lastVisitedPBDate, "isEqual:")) != 0)
        {
          lastVisitedArticleID = self->_lastVisitedArticleID;
          if (!((unint64_t)lastVisitedArticleID | *((_QWORD *)a3 + 7))
            || (v5 = -[NSString isEqual:](lastVisitedArticleID, "isEqual:")) != 0)
          {
            lastVisitedPageID = self->_lastVisitedPageID;
            if (!((unint64_t)lastVisitedPageID | *((_QWORD *)a3 + 9))
              || (v5 = -[NSString isEqual:](lastVisitedPageID, "isEqual:")) != 0)
            {
              lastBadgedPBDate = self->_lastBadgedPBDate;
              if (!((unint64_t)lastBadgedPBDate | *((_QWORD *)a3 + 3))
                || (v5 = -[NTPBDate isEqual:](lastBadgedPBDate, "isEqual:")) != 0)
              {
                lastEngagedPBDate = self->_lastEngagedPBDate;
                if (!((unint64_t)lastEngagedPBDate | *((_QWORD *)a3 + 4))
                  || (v5 = -[NTPBDate isEqual:](lastEngagedPBDate, "isEqual:")) != 0)
                {
                  lastRemovedFromMyMagazinesPBDate = self->_lastRemovedFromMyMagazinesPBDate;
                  if (!((unint64_t)lastRemovedFromMyMagazinesPBDate | *((_QWORD *)a3 + 5))
                    || (v5 = -[NTPBDate isEqual:](lastRemovedFromMyMagazinesPBDate, "isEqual:")) != 0)
                  {
                    lastSeenPBDate = self->_lastSeenPBDate;
                    if ((unint64_t)lastSeenPBDate | *((_QWORD *)a3 + 6))
                      LOBYTE(v5) = -[NTPBDate isEqual:](lastSeenPBDate, "isEqual:");
                    else
                      LOBYTE(v5) = 1;
                  }
                }
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
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;

  v3 = -[NSString hash](self->_identifier, "hash");
  v4 = -[NSString hash](self->_issueID, "hash") ^ v3;
  v5 = -[NTPBDate hash](self->_lastVisitedPBDate, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_lastVisitedArticleID, "hash");
  v7 = -[NSString hash](self->_lastVisitedPageID, "hash");
  v8 = v7 ^ -[NTPBDate hash](self->_lastBadgedPBDate, "hash");
  v9 = v6 ^ v8 ^ -[NTPBDate hash](self->_lastEngagedPBDate, "hash");
  v10 = -[NTPBDate hash](self->_lastRemovedFromMyMagazinesPBDate, "hash");
  return v9 ^ v10 ^ -[NTPBDate hash](self->_lastSeenPBDate, "hash");
}

- (void)mergeFrom:(id)a3
{
  NTPBDate *lastVisitedPBDate;
  uint64_t v6;
  NTPBDate *lastBadgedPBDate;
  uint64_t v8;
  NTPBDate *lastEngagedPBDate;
  uint64_t v10;
  NTPBDate *lastRemovedFromMyMagazinesPBDate;
  uint64_t v12;
  NTPBDate *lastSeenPBDate;
  uint64_t v14;

  if (*((_QWORD *)a3 + 1))
    -[NTPBIssueReadingHistoryItem setIdentifier:](self, "setIdentifier:");
  if (*((_QWORD *)a3 + 2))
    -[NTPBIssueReadingHistoryItem setIssueID:](self, "setIssueID:");
  lastVisitedPBDate = self->_lastVisitedPBDate;
  v6 = *((_QWORD *)a3 + 8);
  if (lastVisitedPBDate)
  {
    if (v6)
      -[NTPBDate mergeFrom:](lastVisitedPBDate, "mergeFrom:");
  }
  else if (v6)
  {
    -[NTPBIssueReadingHistoryItem setLastVisitedPBDate:](self, "setLastVisitedPBDate:");
  }
  if (*((_QWORD *)a3 + 7))
    -[NTPBIssueReadingHistoryItem setLastVisitedArticleID:](self, "setLastVisitedArticleID:");
  if (*((_QWORD *)a3 + 9))
    -[NTPBIssueReadingHistoryItem setLastVisitedPageID:](self, "setLastVisitedPageID:");
  lastBadgedPBDate = self->_lastBadgedPBDate;
  v8 = *((_QWORD *)a3 + 3);
  if (lastBadgedPBDate)
  {
    if (v8)
      -[NTPBDate mergeFrom:](lastBadgedPBDate, "mergeFrom:");
  }
  else if (v8)
  {
    -[NTPBIssueReadingHistoryItem setLastBadgedPBDate:](self, "setLastBadgedPBDate:");
  }
  lastEngagedPBDate = self->_lastEngagedPBDate;
  v10 = *((_QWORD *)a3 + 4);
  if (lastEngagedPBDate)
  {
    if (v10)
      -[NTPBDate mergeFrom:](lastEngagedPBDate, "mergeFrom:");
  }
  else if (v10)
  {
    -[NTPBIssueReadingHistoryItem setLastEngagedPBDate:](self, "setLastEngagedPBDate:");
  }
  lastRemovedFromMyMagazinesPBDate = self->_lastRemovedFromMyMagazinesPBDate;
  v12 = *((_QWORD *)a3 + 5);
  if (lastRemovedFromMyMagazinesPBDate)
  {
    if (v12)
      -[NTPBDate mergeFrom:](lastRemovedFromMyMagazinesPBDate, "mergeFrom:");
  }
  else if (v12)
  {
    -[NTPBIssueReadingHistoryItem setLastRemovedFromMyMagazinesPBDate:](self, "setLastRemovedFromMyMagazinesPBDate:");
  }
  lastSeenPBDate = self->_lastSeenPBDate;
  v14 = *((_QWORD *)a3 + 6);
  if (lastSeenPBDate)
  {
    if (v14)
      -[NTPBDate mergeFrom:](lastSeenPBDate, "mergeFrom:");
  }
  else if (v14)
  {
    -[NTPBIssueReadingHistoryItem setLastSeenPBDate:](self, "setLastSeenPBDate:");
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSString)issueID
{
  return self->_issueID;
}

- (void)setIssueID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NTPBDate)lastVisitedPBDate
{
  return self->_lastVisitedPBDate;
}

- (void)setLastVisitedPBDate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (NSString)lastVisitedArticleID
{
  return self->_lastVisitedArticleID;
}

- (void)setLastVisitedArticleID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSString)lastVisitedPageID
{
  return self->_lastVisitedPageID;
}

- (void)setLastVisitedPageID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (NTPBDate)lastBadgedPBDate
{
  return self->_lastBadgedPBDate;
}

- (void)setLastBadgedPBDate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NTPBDate)lastEngagedPBDate
{
  return self->_lastEngagedPBDate;
}

- (void)setLastEngagedPBDate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NTPBDate)lastRemovedFromMyMagazinesPBDate
{
  return self->_lastRemovedFromMyMagazinesPBDate;
}

- (void)setLastRemovedFromMyMagazinesPBDate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NTPBDate)lastSeenPBDate
{
  return self->_lastSeenPBDate;
}

- (void)setLastSeenPBDate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

@end
