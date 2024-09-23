@implementation _MRCreateHostedEndpointResponseProtobuf

- (BOOL)hasGroupUID
{
  return self->_groupUID != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)_MRCreateHostedEndpointResponseProtobuf;
  -[_MRCreateHostedEndpointResponseProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRCreateHostedEndpointResponseProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *groupUID;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  groupUID = self->_groupUID;
  if (groupUID)
    objc_msgSend(v3, "setObject:forKey:", groupUID, CFSTR("groupUID"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRCreateHostedEndpointResponseProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_groupUID)
    PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  NSString *groupUID;

  groupUID = self->_groupUID;
  if (groupUID)
    objc_msgSend(a3, "setGroupUID:", groupUID);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_groupUID, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *groupUID;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    groupUID = self->_groupUID;
    if ((unint64_t)groupUID | v4[1])
      v6 = -[NSString isEqual:](groupUID, "isEqual:");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_groupUID, "hash");
}

- (void)mergeFrom:(id)a3
{
  if (*((_QWORD *)a3 + 1))
    -[_MRCreateHostedEndpointResponseProtobuf setGroupUID:](self, "setGroupUID:");
}

- (NSString)groupUID
{
  return self->_groupUID;
}

- (void)setGroupUID:(id)a3
{
  objc_storeStrong((id *)&self->_groupUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupUID, 0);
}

@end
