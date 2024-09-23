@implementation SYRejectedVersion

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)SYRejectedVersion;
  -[SYRejectedVersion dealloc](&v3, sel_dealloc);
}

- (unint64_t)supportedVersionsCount
{
  return self->_supportedVersions.count;
}

- (unsigned)supportedVersions
{
  return self->_supportedVersions.list;
}

- (void)clearSupportedVersions
{
  PBRepeatedUInt32Clear();
}

- (void)addSupportedVersions:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)supportedVersionsAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_supportedVersions;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_supportedVersions = &self->_supportedVersions;
  count = self->_supportedVersions.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x24BDBCE88];
    v7 = *MEMORY[0x24BDBCB78];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_supportedVersions->list[a3];
}

- (void)setSupportedVersions:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
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
  v8.super_class = (Class)SYRejectedVersion;
  -[SYRejectedVersion description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYRejectedVersion dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  SYMessageHeader *header;
  void *v5;
  NSString *inReplyTo;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  header = self->_header;
  if (header)
  {
    -[SYMessageHeader dictionaryRepresentation](header, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("header"));

  }
  inReplyTo = self->_inReplyTo;
  if (inReplyTo)
    objc_msgSend(v3, "setObject:forKey:", inReplyTo, CFSTR("inReplyTo"));
  PBRepeatedUInt32NSArray();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("supportedVersions"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SYRejectedVersionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_supportedVersions;
  unint64_t v6;
  id v7;

  v4 = a3;
  if (!self->_header)
    -[SYRejectedVersion writeTo:].cold.1();
  v7 = v4;
  PBDataWriterWriteSubmessage();
  if (!self->_inReplyTo)
    -[SYRejectedVersion writeTo:].cold.2();
  PBDataWriterWriteStringField();
  p_supportedVersions = &self->_supportedVersions;
  if (p_supportedVersions->count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v6;
    }
    while (v6 < p_supportedVersions->count);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "setHeader:", self->_header);
  objc_msgSend(v7, "setInReplyTo:", self->_inReplyTo);
  if (-[SYRejectedVersion supportedVersionsCount](self, "supportedVersionsCount"))
  {
    objc_msgSend(v7, "clearSupportedVersions");
    v4 = -[SYRejectedVersion supportedVersionsCount](self, "supportedVersionsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v7, "addSupportedVersions:", -[SYRejectedVersion supportedVersionsAtIndex:](self, "supportedVersionsAtIndex:", i));
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SYMessageHeader copyWithZone:](self->_header, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  v8 = -[NSString copyWithZone:](self->_inReplyTo, "copyWithZone:", a3);
  v9 = (void *)v5[5];
  v5[5] = v8;

  PBRepeatedUInt32Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  SYMessageHeader *header;
  NSString *inReplyTo;
  char IsEqual;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((header = self->_header, !((unint64_t)header | v4[4])) || -[SYMessageHeader isEqual:](header, "isEqual:"))
    && ((inReplyTo = self->_inReplyTo, !((unint64_t)inReplyTo | v4[5]))
     || -[NSString isEqual:](inReplyTo, "isEqual:")))
  {
    IsEqual = PBRepeatedUInt32IsEqual();
  }
  else
  {
    IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;

  v3 = -[SYMessageHeader hash](self->_header, "hash");
  v4 = -[NSString hash](self->_inReplyTo, "hash") ^ v3;
  return v4 ^ PBRepeatedUInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  SYMessageHeader *header;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  _QWORD *v10;

  v4 = a3;
  header = self->_header;
  v6 = v4[4];
  v10 = v4;
  if (header)
  {
    if (!v6)
      goto LABEL_7;
    -[SYMessageHeader mergeFrom:](header, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[SYRejectedVersion setHeader:](self, "setHeader:");
  }
  v4 = v10;
LABEL_7:
  if (v4[5])
  {
    -[SYRejectedVersion setInReplyTo:](self, "setInReplyTo:");
    v4 = v10;
  }
  v7 = objc_msgSend(v4, "supportedVersionsCount");
  if (v7)
  {
    v8 = v7;
    for (i = 0; i != v8; ++i)
      -[SYRejectedVersion addSupportedVersions:](self, "addSupportedVersions:", objc_msgSend(v10, "supportedVersionsAtIndex:", i));
  }

}

- (SYMessageHeader)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
  objc_storeStrong((id *)&self->_header, a3);
}

- (NSString)inReplyTo
{
  return self->_inReplyTo;
}

- (void)setInReplyTo:(id)a3
{
  objc_storeStrong((id *)&self->_inReplyTo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inReplyTo, 0);
  objc_storeStrong((id *)&self->_header, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[SYRejectedVersion writeTo:]", "SYRejectedVersion.m", 154, "self->_header != nil");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[SYRejectedVersion writeTo:]", "SYRejectedVersion.m", 159, "nil != self->_inReplyTo");
}

@end
