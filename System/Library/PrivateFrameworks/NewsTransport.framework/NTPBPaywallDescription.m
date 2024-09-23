@implementation NTPBPaywallDescription

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;

  v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[1] = (id)-[NSString copyWithZone:](self->_channelPaywall, "copyWithZone:", a3);
  v5[3] = (id)-[NSString copyWithZone:](self->_leakyPaywall, "copyWithZone:", a3);

  v5[4] = (id)-[NSString copyWithZone:](self->_promotionalPaywall, "copyWithZone:", a3);
  v5[2] = (id)-[NSString copyWithZone:](self->_hardPaywall, "copyWithZone:", a3);
  return v5;
}

- (void)setPromotionalPaywall:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (void)setLeakyPaywall:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (void)setHardPaywall:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (void)setChannelPaywall:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (void)dealloc
{
  objc_super v3;

  -[NTPBPaywallDescription setChannelPaywall:](self, "setChannelPaywall:", 0);
  -[NTPBPaywallDescription setLeakyPaywall:](self, "setLeakyPaywall:", 0);
  -[NTPBPaywallDescription setPromotionalPaywall:](self, "setPromotionalPaywall:", 0);
  -[NTPBPaywallDescription setHardPaywall:](self, "setHardPaywall:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBPaywallDescription;
  -[NTPBPaywallDescription dealloc](&v3, sel_dealloc);
}

- (BOOL)hasChannelPaywall
{
  return self->_channelPaywall != 0;
}

- (BOOL)hasLeakyPaywall
{
  return self->_leakyPaywall != 0;
}

- (BOOL)hasPromotionalPaywall
{
  return self->_promotionalPaywall != 0;
}

- (BOOL)hasHardPaywall
{
  return self->_hardPaywall != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBPaywallDescription;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBPaywallDescription description](&v3, sel_description), -[NTPBPaywallDescription dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *channelPaywall;
  NSString *leakyPaywall;
  NSString *promotionalPaywall;
  NSString *hardPaywall;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = v3;
  channelPaywall = self->_channelPaywall;
  if (channelPaywall)
    objc_msgSend(v3, "setObject:forKey:", channelPaywall, CFSTR("channelPaywall"));
  leakyPaywall = self->_leakyPaywall;
  if (leakyPaywall)
    objc_msgSend(v4, "setObject:forKey:", leakyPaywall, CFSTR("leakyPaywall"));
  promotionalPaywall = self->_promotionalPaywall;
  if (promotionalPaywall)
    objc_msgSend(v4, "setObject:forKey:", promotionalPaywall, CFSTR("promotionalPaywall"));
  hardPaywall = self->_hardPaywall;
  if (hardPaywall)
    objc_msgSend(v4, "setObject:forKey:", hardPaywall, CFSTR("hardPaywall"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBPaywallDescriptionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_channelPaywall)
    PBDataWriterWriteStringField();
  if (self->_leakyPaywall)
    PBDataWriterWriteStringField();
  if (self->_promotionalPaywall)
    PBDataWriterWriteStringField();
  if (self->_hardPaywall)
    PBDataWriterWriteStringField();
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *channelPaywall;
  NSString *leakyPaywall;
  NSString *promotionalPaywall;
  NSString *hardPaywall;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    channelPaywall = self->_channelPaywall;
    if (!((unint64_t)channelPaywall | *((_QWORD *)a3 + 1))
      || (v5 = -[NSString isEqual:](channelPaywall, "isEqual:")) != 0)
    {
      leakyPaywall = self->_leakyPaywall;
      if (!((unint64_t)leakyPaywall | *((_QWORD *)a3 + 3))
        || (v5 = -[NSString isEqual:](leakyPaywall, "isEqual:")) != 0)
      {
        promotionalPaywall = self->_promotionalPaywall;
        if (!((unint64_t)promotionalPaywall | *((_QWORD *)a3 + 4))
          || (v5 = -[NSString isEqual:](promotionalPaywall, "isEqual:")) != 0)
        {
          hardPaywall = self->_hardPaywall;
          if ((unint64_t)hardPaywall | *((_QWORD *)a3 + 2))
            LOBYTE(v5) = -[NSString isEqual:](hardPaywall, "isEqual:");
          else
            LOBYTE(v5) = 1;
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

  v3 = -[NSString hash](self->_channelPaywall, "hash");
  v4 = -[NSString hash](self->_leakyPaywall, "hash") ^ v3;
  v5 = -[NSString hash](self->_promotionalPaywall, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_hardPaywall, "hash");
}

- (void)mergeFrom:(id)a3
{
  if (*((_QWORD *)a3 + 1))
    -[NTPBPaywallDescription setChannelPaywall:](self, "setChannelPaywall:");
  if (*((_QWORD *)a3 + 3))
    -[NTPBPaywallDescription setLeakyPaywall:](self, "setLeakyPaywall:");
  if (*((_QWORD *)a3 + 4))
    -[NTPBPaywallDescription setPromotionalPaywall:](self, "setPromotionalPaywall:");
  if (*((_QWORD *)a3 + 2))
    -[NTPBPaywallDescription setHardPaywall:](self, "setHardPaywall:");
}

- (NSString)channelPaywall
{
  return self->_channelPaywall;
}

- (NSString)leakyPaywall
{
  return self->_leakyPaywall;
}

- (NSString)promotionalPaywall
{
  return self->_promotionalPaywall;
}

- (NSString)hardPaywall
{
  return self->_hardPaywall;
}

@end
