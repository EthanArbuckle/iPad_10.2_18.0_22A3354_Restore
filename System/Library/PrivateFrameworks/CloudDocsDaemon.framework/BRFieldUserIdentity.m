@implementation BRFieldUserIdentity

- (BOOL)hasSerializedNameComponents
{
  return self->_serializedNameComponents != 0;
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
  v8.super_class = (Class)BRFieldUserIdentity;
  -[BRFieldUserIdentity description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRFieldUserIdentity dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *serializedNameComponents;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  serializedNameComponents = self->_serializedNameComponents;
  if (serializedNameComponents)
    objc_msgSend(v3, "setObject:forKey:", serializedNameComponents, CFSTR("serializedNameComponents"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BRFieldUserIdentityReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_serializedNameComponents)
    PBDataWriterWriteDataField();
}

- (void)copyTo:(id)a3
{
  NSData *serializedNameComponents;

  serializedNameComponents = self->_serializedNameComponents;
  if (serializedNameComponents)
    objc_msgSend(a3, "setSerializedNameComponents:", serializedNameComponents);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_serializedNameComponents, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *serializedNameComponents;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    serializedNameComponents = self->_serializedNameComponents;
    if ((unint64_t)serializedNameComponents | v4[1])
      v6 = -[NSData isEqual:](serializedNameComponents, "isEqual:");
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
  return -[NSData hash](self->_serializedNameComponents, "hash");
}

- (void)mergeFrom:(id)a3
{
  if (*((_QWORD *)a3 + 1))
    -[BRFieldUserIdentity setSerializedNameComponents:](self, "setSerializedNameComponents:");
}

- (NSData)serializedNameComponents
{
  return self->_serializedNameComponents;
}

- (void)setSerializedNameComponents:(id)a3
{
  objc_storeStrong((id *)&self->_serializedNameComponents, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedNameComponents, 0);
}

- (BRFieldUserIdentity)initWithCKUserIdentity:(id)a3
{
  id v4;
  BRFieldUserIdentity *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BRFieldUserIdentity;
  v5 = -[BRFieldUserIdentity init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "nameComponents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRFieldUserIdentity setNameComponents:](v5, "setNameComponents:", v6);

  }
  return v5;
}

- (void)setNameComponents:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BRFieldUserIdentity setSerializedNameComponents:](self, "setSerializedNameComponents:", v4);

}

- (NSPersonNameComponents)nameComponents
{
  return (NSPersonNameComponents *)-[BRFieldUserIdentity nameComponentsAcceptUnknownUser:](self, "nameComponentsAcceptUnknownUser:", 0);
}

+ (id)unknownPersonNameComponents
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3850]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _BRLocalizedStringWithFormat();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setGivenName:", v4);

  return v2;
}

- (id)nameComponentsAcceptUnknownUser:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;

  v3 = a3;
  if (-[BRFieldUserIdentity hasSerializedNameComponents](self, "hasSerializedNameComponents"))
  {
    -[BRFieldUserIdentity serializedNameComponents](self, "serializedNameComponents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (v3)
  {
    +[BRFieldUserIdentity unknownPersonNameComponents](BRFieldUserIdentity, "unknownPersonNameComponents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

@end
