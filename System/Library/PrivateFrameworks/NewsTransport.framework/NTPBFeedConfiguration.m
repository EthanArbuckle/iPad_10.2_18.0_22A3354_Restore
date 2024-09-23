@implementation NTPBFeedConfiguration

- (void)dealloc
{
  objc_super v3;

  -[NTPBFeedConfiguration setFreeAFeedID:](self, "setFreeAFeedID:", 0);
  -[NTPBFeedConfiguration setFreeBFeedID:](self, "setFreeBFeedID:", 0);
  -[NTPBFeedConfiguration setFreeCFeedID:](self, "setFreeCFeedID:", 0);
  -[NTPBFeedConfiguration setPaidAFeedID:](self, "setPaidAFeedID:", 0);
  -[NTPBFeedConfiguration setPaidBFeedID:](self, "setPaidBFeedID:", 0);
  -[NTPBFeedConfiguration setPaidCFeedID:](self, "setPaidCFeedID:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBFeedConfiguration;
  -[NTPBFeedConfiguration dealloc](&v3, sel_dealloc);
}

- (void)setPaidCFeedID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (void)setPaidBFeedID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (void)setPaidAFeedID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (void)setFreeAFeedID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (void)setFreeCFeedID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (void)setFreeBFeedID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;

  v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[1] = (id)-[NSString copyWithZone:](self->_freeAFeedID, "copyWithZone:", a3);
  v5[2] = (id)-[NSString copyWithZone:](self->_freeBFeedID, "copyWithZone:", a3);

  v5[3] = (id)-[NSString copyWithZone:](self->_freeCFeedID, "copyWithZone:", a3);
  v5[4] = (id)-[NSString copyWithZone:](self->_paidAFeedID, "copyWithZone:", a3);

  v5[5] = (id)-[NSString copyWithZone:](self->_paidBFeedID, "copyWithZone:", a3);
  v5[6] = (id)-[NSString copyWithZone:](self->_paidCFeedID, "copyWithZone:", a3);
  return v5;
}

- (BOOL)hasFreeAFeedID
{
  return self->_freeAFeedID != 0;
}

- (BOOL)hasFreeBFeedID
{
  return self->_freeBFeedID != 0;
}

- (BOOL)hasFreeCFeedID
{
  return self->_freeCFeedID != 0;
}

- (BOOL)hasPaidAFeedID
{
  return self->_paidAFeedID != 0;
}

- (BOOL)hasPaidBFeedID
{
  return self->_paidBFeedID != 0;
}

- (BOOL)hasPaidCFeedID
{
  return self->_paidCFeedID != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBFeedConfiguration;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBFeedConfiguration description](&v3, sel_description), -[NTPBFeedConfiguration dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *freeAFeedID;
  NSString *freeBFeedID;
  NSString *freeCFeedID;
  NSString *paidAFeedID;
  NSString *paidBFeedID;
  NSString *paidCFeedID;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = v3;
  freeAFeedID = self->_freeAFeedID;
  if (freeAFeedID)
    objc_msgSend(v3, "setObject:forKey:", freeAFeedID, CFSTR("free_a_feed_ID"));
  freeBFeedID = self->_freeBFeedID;
  if (freeBFeedID)
    objc_msgSend(v4, "setObject:forKey:", freeBFeedID, CFSTR("free_b_feed_ID"));
  freeCFeedID = self->_freeCFeedID;
  if (freeCFeedID)
    objc_msgSend(v4, "setObject:forKey:", freeCFeedID, CFSTR("free_c_feed_ID"));
  paidAFeedID = self->_paidAFeedID;
  if (paidAFeedID)
    objc_msgSend(v4, "setObject:forKey:", paidAFeedID, CFSTR("paid_a_feed_ID"));
  paidBFeedID = self->_paidBFeedID;
  if (paidBFeedID)
    objc_msgSend(v4, "setObject:forKey:", paidBFeedID, CFSTR("paid_b_feed_ID"));
  paidCFeedID = self->_paidCFeedID;
  if (paidCFeedID)
    objc_msgSend(v4, "setObject:forKey:", paidCFeedID, CFSTR("paid_c_feed_ID"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBFeedConfigurationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_freeAFeedID)
    PBDataWriterWriteStringField();
  if (self->_freeBFeedID)
    PBDataWriterWriteStringField();
  if (self->_freeCFeedID)
    PBDataWriterWriteStringField();
  if (self->_paidAFeedID)
    PBDataWriterWriteStringField();
  if (self->_paidBFeedID)
    PBDataWriterWriteStringField();
  if (self->_paidCFeedID)
    PBDataWriterWriteStringField();
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *freeAFeedID;
  NSString *freeBFeedID;
  NSString *freeCFeedID;
  NSString *paidAFeedID;
  NSString *paidBFeedID;
  NSString *paidCFeedID;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    freeAFeedID = self->_freeAFeedID;
    if (!((unint64_t)freeAFeedID | *((_QWORD *)a3 + 1))
      || (v5 = -[NSString isEqual:](freeAFeedID, "isEqual:")) != 0)
    {
      freeBFeedID = self->_freeBFeedID;
      if (!((unint64_t)freeBFeedID | *((_QWORD *)a3 + 2))
        || (v5 = -[NSString isEqual:](freeBFeedID, "isEqual:")) != 0)
      {
        freeCFeedID = self->_freeCFeedID;
        if (!((unint64_t)freeCFeedID | *((_QWORD *)a3 + 3))
          || (v5 = -[NSString isEqual:](freeCFeedID, "isEqual:")) != 0)
        {
          paidAFeedID = self->_paidAFeedID;
          if (!((unint64_t)paidAFeedID | *((_QWORD *)a3 + 4))
            || (v5 = -[NSString isEqual:](paidAFeedID, "isEqual:")) != 0)
          {
            paidBFeedID = self->_paidBFeedID;
            if (!((unint64_t)paidBFeedID | *((_QWORD *)a3 + 5))
              || (v5 = -[NSString isEqual:](paidBFeedID, "isEqual:")) != 0)
            {
              paidCFeedID = self->_paidCFeedID;
              if ((unint64_t)paidCFeedID | *((_QWORD *)a3 + 6))
                LOBYTE(v5) = -[NSString isEqual:](paidCFeedID, "isEqual:");
              else
                LOBYTE(v5) = 1;
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
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;

  v3 = -[NSString hash](self->_freeAFeedID, "hash");
  v4 = -[NSString hash](self->_freeBFeedID, "hash") ^ v3;
  v5 = -[NSString hash](self->_freeCFeedID, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_paidAFeedID, "hash");
  v7 = -[NSString hash](self->_paidBFeedID, "hash");
  return v6 ^ v7 ^ -[NSString hash](self->_paidCFeedID, "hash");
}

- (void)mergeFrom:(id)a3
{
  if (*((_QWORD *)a3 + 1))
    -[NTPBFeedConfiguration setFreeAFeedID:](self, "setFreeAFeedID:");
  if (*((_QWORD *)a3 + 2))
    -[NTPBFeedConfiguration setFreeBFeedID:](self, "setFreeBFeedID:");
  if (*((_QWORD *)a3 + 3))
    -[NTPBFeedConfiguration setFreeCFeedID:](self, "setFreeCFeedID:");
  if (*((_QWORD *)a3 + 4))
    -[NTPBFeedConfiguration setPaidAFeedID:](self, "setPaidAFeedID:");
  if (*((_QWORD *)a3 + 5))
    -[NTPBFeedConfiguration setPaidBFeedID:](self, "setPaidBFeedID:");
  if (*((_QWORD *)a3 + 6))
    -[NTPBFeedConfiguration setPaidCFeedID:](self, "setPaidCFeedID:");
}

- (NSString)freeAFeedID
{
  return self->_freeAFeedID;
}

- (NSString)freeBFeedID
{
  return self->_freeBFeedID;
}

- (NSString)freeCFeedID
{
  return self->_freeCFeedID;
}

- (NSString)paidAFeedID
{
  return self->_paidAFeedID;
}

- (NSString)paidBFeedID
{
  return self->_paidBFeedID;
}

- (NSString)paidCFeedID
{
  return self->_paidCFeedID;
}

@end
