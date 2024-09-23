@implementation SYClock

+ (void)initialize
{
  objc_method *InstanceMethod;
  objc_method *v4;

  if ((id)objc_opt_class() == a1)
  {
    InstanceMethod = class_getInstanceMethod((Class)a1, sel_description);
    v4 = class_getInstanceMethod((Class)a1, sel__myDescription);
    method_exchangeImplementations(InstanceMethod, v4);
  }
}

- (unint64_t)increaseBy:(unint64_t)a3
{
  unint64_t v4;

  v4 = -[SYClock version](self, "version") + a3;
  -[SYClock setVersion:](self, "setVersion:", v4);
  return v4;
}

- (unint64_t)increment
{
  return -[SYClock increaseBy:](self, "increaseBy:", 1);
}

- (id)_myDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v9.receiver = self;
  v9.super_class = (Class)SYClock;
  -[SYClock description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYClock peer](self, "peer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "peerID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@::%qu"), v4, v6, -[SYClock version](self, "version"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
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
  v8.super_class = (Class)SYClock;
  -[SYClock description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYClock dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  SYPeer *peer;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  peer = self->_peer;
  if (peer)
  {
    -[SYPeer dictionaryRepresentation](peer, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("peer"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_version);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("version"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SYClockReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_peer)
    -[SYClock writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteUint64Field();

}

- (void)copyTo:(id)a3
{
  SYPeer *peer;
  _QWORD *v5;

  peer = self->_peer;
  v5 = a3;
  objc_msgSend(v5, "setPeer:", peer);
  v5[1] = self->_version;

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SYPeer copyWithZone:](self->_peer, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v5[1] = self->_version;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  SYPeer *peer;
  BOOL v6;

  v4 = a3;
  v6 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((peer = self->_peer, !((unint64_t)peer | v4[2])) || -[SYPeer isEqual:](peer, "isEqual:"))
    && self->_version == v4[1];

  return v6;
}

- (unint64_t)hash
{
  return (2654435761u * self->_version) ^ -[SYPeer hash](self->_peer, "hash");
}

- (void)mergeFrom:(id)a3
{
  unint64_t *v4;
  SYPeer *peer;
  unint64_t v6;
  unint64_t *v7;

  v4 = (unint64_t *)a3;
  peer = self->_peer;
  v6 = v4[2];
  if (peer)
  {
    if (v6)
    {
      v7 = v4;
      -[SYPeer mergeFrom:](peer, "mergeFrom:");
LABEL_6:
      v4 = v7;
    }
  }
  else if (v6)
  {
    v7 = v4;
    -[SYClock setPeer:](self, "setPeer:");
    goto LABEL_6;
  }
  self->_version = v4[1];

}

- (SYPeer)peer
{
  return self->_peer;
}

- (void)setPeer:(id)a3
{
  objc_storeStrong((id *)&self->_peer, a3);
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peer, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[SYClock writeTo:]", "SYClock.m", 93, "self->_peer != nil");
}

@end
