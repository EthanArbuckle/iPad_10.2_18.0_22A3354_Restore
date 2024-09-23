@implementation ASCodableShareLocations

- (BOOL)hasActivityShareURL
{
  return self->_activityShareURL != 0;
}

- (BOOL)hasRelationshipShareURL
{
  return self->_relationshipShareURL != 0;
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
  v8.super_class = (Class)ASCodableShareLocations;
  -[ASCodableShareLocations description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableShareLocations dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *activityShareURL;
  NSString *relationshipShareURL;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  activityShareURL = self->_activityShareURL;
  if (activityShareURL)
    objc_msgSend(v3, "setObject:forKey:", activityShareURL, CFSTR("activityShareURL"));
  relationshipShareURL = self->_relationshipShareURL;
  if (relationshipShareURL)
    objc_msgSend(v4, "setObject:forKey:", relationshipShareURL, CFSTR("relationshipShareURL"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ASCodableShareLocationsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_activityShareURL)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_relationshipShareURL)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_activityShareURL)
  {
    objc_msgSend(v4, "setActivityShareURL:");
    v4 = v5;
  }
  if (self->_relationshipShareURL)
  {
    objc_msgSend(v5, "setRelationshipShareURL:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_activityShareURL, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_relationshipShareURL, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *activityShareURL;
  NSString *relationshipShareURL;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((activityShareURL = self->_activityShareURL, !((unint64_t)activityShareURL | v4[1]))
     || -[NSString isEqual:](activityShareURL, "isEqual:")))
  {
    relationshipShareURL = self->_relationshipShareURL;
    if ((unint64_t)relationshipShareURL | v4[2])
      v7 = -[NSString isEqual:](relationshipShareURL, "isEqual:");
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

  v3 = -[NSString hash](self->_activityShareURL, "hash");
  return -[NSString hash](self->_relationshipShareURL, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  v5 = v4;
  if (v4[1])
  {
    -[ASCodableShareLocations setActivityShareURL:](self, "setActivityShareURL:");
    v4 = v5;
  }
  if (v4[2])
  {
    -[ASCodableShareLocations setRelationshipShareURL:](self, "setRelationshipShareURL:");
    v4 = v5;
  }

}

- (NSString)activityShareURL
{
  return self->_activityShareURL;
}

- (void)setActivityShareURL:(id)a3
{
  objc_storeStrong((id *)&self->_activityShareURL, a3);
}

- (NSString)relationshipShareURL
{
  return self->_relationshipShareURL;
}

- (void)setRelationshipShareURL:(id)a3
{
  objc_storeStrong((id *)&self->_relationshipShareURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relationshipShareURL, 0);
  objc_storeStrong((id *)&self->_activityShareURL, 0);
}

@end
