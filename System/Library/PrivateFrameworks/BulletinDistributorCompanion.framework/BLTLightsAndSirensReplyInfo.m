@implementation BLTLightsAndSirensReplyInfo

- (BLTLightsAndSirensReplyInfo)init
{
  BLTLightsAndSirensReplyInfo *v2;
  uint64_t v3;
  NSDate *creation;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BLTLightsAndSirensReplyInfo;
  v2 = -[BLTLightsAndSirensReplyInfo init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v3 = objc_claimAutoreleasedReturnValue();
    creation = v2->_creation;
    v2->_creation = (NSDate *)v3;

    v2->_didPlayLightsAndSirens = 0;
  }
  return v2;
}

- (BOOL)hasExpired
{
  void *v3;
  void *v4;
  double v5;
  BOOL v6;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTLightsAndSirensReplyInfo creation](self, "creation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5 >= 7200.0;

  return v6;
}

- (BOOL)sendReply
{
  void (**reply)(id, BOOL);
  unint64_t didPlayLightsAndSirens;

  if (self->_replySent)
  {
    LOBYTE(reply) = 1;
  }
  else
  {
    didPlayLightsAndSirens = self->_didPlayLightsAndSirens;
    if (didPlayLightsAndSirens)
    {
      reply = (void (**)(id, BOOL))self->_reply;
      if (reply)
      {
        reply[2](reply, didPlayLightsAndSirens == 1);
        LOBYTE(reply) = 1;
        self->_replySent = 1;
      }
    }
    else
    {
      LOBYTE(reply) = 0;
    }
  }
  return (char)reply;
}

- (BOOL)replySent
{
  return self->_replySent;
}

- (id)reply
{
  return self->_reply;
}

- (void)setReply:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)didPlayLightsAndSirens
{
  return self->_didPlayLightsAndSirens;
}

- (void)setDidPlayLightsAndSirens:(unint64_t)a3
{
  self->_didPlayLightsAndSirens = a3;
}

- (NSDate)bulletinPublicationDate
{
  return self->_bulletinPublicationDate;
}

- (void)setBulletinPublicationDate:(id)a3
{
  objc_storeStrong((id *)&self->_bulletinPublicationDate, a3);
}

- (BOOL)didLogAggd
{
  return self->_didLogAggd;
}

- (void)setDidLogAggd:(BOOL)a3
{
  self->_didLogAggd = a3;
}

- (NSDate)creation
{
  return self->_creation;
}

- (NSString)publisherMatchID
{
  return self->_publisherMatchID;
}

- (void)setPublisherMatchID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)sectionID
{
  return self->_sectionID;
}

- (void)setSectionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionID, 0);
  objc_storeStrong((id *)&self->_publisherMatchID, 0);
  objc_storeStrong((id *)&self->_creation, 0);
  objc_storeStrong((id *)&self->_bulletinPublicationDate, 0);
  objc_storeStrong(&self->_reply, 0);
}

@end
