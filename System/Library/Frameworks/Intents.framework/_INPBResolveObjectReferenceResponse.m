@implementation _INPBResolveObjectReferenceResponse

- (void)setResolvedReference:(id)a3
{
  NSData *v4;
  NSData *resolvedReference;

  v4 = (NSData *)objc_msgSend(a3, "copy");
  resolvedReference = self->_resolvedReference;
  self->_resolvedReference = v4;

}

- (BOOL)hasResolvedReference
{
  return self->_resolvedReference != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBResolveObjectReferenceResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_INPBResolveObjectReferenceResponse resolvedReference](self, "resolvedReference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteDataField();

}

- (_INPBResolveObjectReferenceResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBResolveObjectReferenceResponse *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBResolveObjectReferenceResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBResolveObjectReferenceResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBResolveObjectReferenceResponse initWithData:](self, "initWithData:", v6);

    v6 = self;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_INPBResolveObjectReferenceResponse data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBResolveObjectReferenceResponse *v5;
  void *v6;

  v5 = -[_INPBResolveObjectReferenceResponse init](+[_INPBResolveObjectReferenceResponse allocWithZone:](_INPBResolveObjectReferenceResponse, "allocWithZone:"), "init");
  v6 = (void *)-[NSData copyWithZone:](self->_resolvedReference, "copyWithZone:", a3);
  -[_INPBResolveObjectReferenceResponse setResolvedReference:](v5, "setResolvedReference:", v6);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    -[_INPBResolveObjectReferenceResponse resolvedReference](self, "resolvedReference");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resolvedReference");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      -[_INPBResolveObjectReferenceResponse resolvedReference](self, "resolvedReference");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
      {

LABEL_10:
        v13 = 1;
        goto LABEL_8;
      }
      v9 = (void *)v8;
      -[_INPBResolveObjectReferenceResponse resolvedReference](self, "resolvedReference");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "resolvedReference");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if ((v12 & 1) != 0)
        goto LABEL_10;
    }
    else
    {

    }
  }
  v13 = 0;
LABEL_8:

  return v13;
}

- (unint64_t)hash
{
  return -[NSData hash](self->_resolvedReference, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_resolvedReference)
  {
    -[_INPBResolveObjectReferenceResponse resolvedReference](self, "resolvedReference");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("resolvedReference"));

  }
  return v3;
}

- (NSData)resolvedReference
{
  return self->_resolvedReference;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolvedReference, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
