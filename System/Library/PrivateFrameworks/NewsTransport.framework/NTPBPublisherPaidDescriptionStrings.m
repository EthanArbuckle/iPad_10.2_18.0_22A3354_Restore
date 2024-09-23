@implementation NTPBPublisherPaidDescriptionStrings

- (void)setPaywallDescription:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (void)dealloc
{
  objc_super v3;

  -[NTPBPublisherPaidDescriptionStrings setPaywallDescription:](self, "setPaywallDescription:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBPublisherPaidDescriptionStrings;
  -[NTPBPublisherPaidDescriptionStrings dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;

  v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[1] = -[NTPBPaywallDescription copyWithZone:](self->_paywallDescription, "copyWithZone:", a3);
  return v5;
}

- (BOOL)hasPaywallDescription
{
  return self->_paywallDescription != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBPublisherPaidDescriptionStrings;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBPublisherPaidDescriptionStrings description](&v3, sel_description), -[NTPBPublisherPaidDescriptionStrings dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NTPBPaywallDescription *paywallDescription;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  paywallDescription = self->_paywallDescription;
  if (paywallDescription)
    objc_msgSend(v3, "setObject:forKey:", -[NTPBPaywallDescription dictionaryRepresentation](paywallDescription, "dictionaryRepresentation"), CFSTR("paywallDescription"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBPublisherPaidDescriptionStringsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_paywallDescription)
    PBDataWriterWriteSubmessage();
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NTPBPaywallDescription *paywallDescription;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    paywallDescription = self->_paywallDescription;
    if ((unint64_t)paywallDescription | *((_QWORD *)a3 + 1))
      LOBYTE(v5) = -[NTPBPaywallDescription isEqual:](paywallDescription, "isEqual:");
    else
      LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  return -[NTPBPaywallDescription hash](self->_paywallDescription, "hash");
}

- (void)mergeFrom:(id)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)a3 + 1);
  if (self->_paywallDescription)
  {
    if (v3)
      -[NTPBPaywallDescription mergeFrom:](self->_paywallDescription, "mergeFrom:");
  }
  else if (v3)
  {
    -[NTPBPublisherPaidDescriptionStrings setPaywallDescription:](self, "setPaywallDescription:");
  }
}

- (NTPBPaywallDescription)paywallDescription
{
  return self->_paywallDescription;
}

@end
