@implementation NTPBNetworkEventGroup

- (void)dealloc
{
  objc_super v3;

  -[NTPBNetworkEventGroup setVia:](self, "setVia:", 0);
  -[NTPBNetworkEventGroup setRespondingInstance:](self, "setRespondingInstance:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBNetworkEventGroup;
  -[NTPBNetworkEventGroup dealloc](&v3, sel_dealloc);
}

- (BOOL)hasVia
{
  return self->_via != 0;
}

- (BOOL)hasRespondingInstance
{
  return self->_respondingInstance != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBNetworkEventGroup;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBNetworkEventGroup description](&v3, sel_description), -[NTPBNetworkEventGroup dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *via;
  NSString *respondingInstance;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = v3;
  via = self->_via;
  if (via)
    objc_msgSend(v3, "setObject:forKey:", via, CFSTR("via"));
  respondingInstance = self->_respondingInstance;
  if (respondingInstance)
    objc_msgSend(v4, "setObject:forKey:", respondingInstance, CFSTR("responding_instance"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBNetworkEventGroupReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_via)
    PBDataWriterWriteStringField();
  if (self->_respondingInstance)
    PBDataWriterWriteStringField();
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;

  v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[2] = (id)-[NSString copyWithZone:](self->_via, "copyWithZone:", a3);
  v5[1] = (id)-[NSString copyWithZone:](self->_respondingInstance, "copyWithZone:", a3);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *via;
  NSString *respondingInstance;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    via = self->_via;
    if (!((unint64_t)via | *((_QWORD *)a3 + 2)) || (v5 = -[NSString isEqual:](via, "isEqual:")) != 0)
    {
      respondingInstance = self->_respondingInstance;
      if ((unint64_t)respondingInstance | *((_QWORD *)a3 + 1))
        LOBYTE(v5) = -[NSString isEqual:](respondingInstance, "isEqual:");
      else
        LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_via, "hash");
  return -[NSString hash](self->_respondingInstance, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  if (*((_QWORD *)a3 + 2))
    -[NTPBNetworkEventGroup setVia:](self, "setVia:");
  if (*((_QWORD *)a3 + 1))
    -[NTPBNetworkEventGroup setRespondingInstance:](self, "setRespondingInstance:");
}

- (NSString)via
{
  return self->_via;
}

- (void)setVia:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSString)respondingInstance
{
  return self->_respondingInstance;
}

- (void)setRespondingInstance:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
