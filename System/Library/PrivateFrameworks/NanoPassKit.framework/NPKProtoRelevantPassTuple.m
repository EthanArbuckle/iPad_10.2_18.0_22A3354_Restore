@implementation NPKProtoRelevantPassTuple

- (BOOL)hasRelevantText
{
  return self->_relevantText != 0;
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
  v8.super_class = (Class)NPKProtoRelevantPassTuple;
  -[NPKProtoRelevantPassTuple description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoRelevantPassTuple dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *passID;
  NSString *relevantText;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  passID = self->_passID;
  if (passID)
    objc_msgSend(v3, "setObject:forKey:", passID, CFSTR("passID"));
  relevantText = self->_relevantText;
  if (relevantText)
    objc_msgSend(v4, "setObject:forKey:", relevantText, CFSTR("relevantText"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoRelevantPassTupleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_passID)
    -[NPKProtoRelevantPassTuple writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteStringField();
  if (self->_relevantText)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setPassID:", self->_passID);
  if (self->_relevantText)
    objc_msgSend(v4, "setRelevantText:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_passID, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_relevantText, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *passID;
  NSString *relevantText;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((passID = self->_passID, !((unint64_t)passID | v4[1]))
     || -[NSString isEqual:](passID, "isEqual:")))
  {
    relevantText = self->_relevantText;
    if ((unint64_t)relevantText | v4[2])
      v7 = -[NSString isEqual:](relevantText, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_passID, "hash");
  return -[NSString hash](self->_relevantText, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  v5 = v4;
  if (v4[1])
  {
    -[NPKProtoRelevantPassTuple setPassID:](self, "setPassID:");
    v4 = v5;
  }
  if (v4[2])
  {
    -[NPKProtoRelevantPassTuple setRelevantText:](self, "setRelevantText:");
    v4 = v5;
  }

}

- (NSString)passID
{
  return self->_passID;
}

- (void)setPassID:(id)a3
{
  objc_storeStrong((id *)&self->_passID, a3);
}

- (NSString)relevantText
{
  return self->_relevantText;
}

- (void)setRelevantText:(id)a3
{
  objc_storeStrong((id *)&self->_relevantText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relevantText, 0);
  objc_storeStrong((id *)&self->_passID, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoRelevantPassTuple writeTo:]", "NPKProtoRelevantPassTuple.m", 87, "nil != self->_passID");
}

@end
