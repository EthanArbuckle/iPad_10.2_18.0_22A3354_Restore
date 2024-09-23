@implementation _INPBResolveObjectReferenceIntentResponse

- (void)setResolvedReferences:(id)a3
{
  NSData *v4;
  NSData *resolvedReferences;

  v4 = (NSData *)objc_msgSend(a3, "copy");
  resolvedReferences = self->_resolvedReferences;
  self->_resolvedReferences = v4;

}

- (BOOL)hasResolvedReferences
{
  return self->_resolvedReferences != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBResolveObjectReferenceIntentResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_INPBResolveObjectReferenceIntentResponse resolvedReferences](self, "resolvedReferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteDataField();

}

- (_INPBResolveObjectReferenceIntentResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBResolveObjectReferenceIntentResponse *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBResolveObjectReferenceIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBResolveObjectReferenceIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBResolveObjectReferenceIntentResponse initWithData:](self, "initWithData:", v6);

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
  -[_INPBResolveObjectReferenceIntentResponse data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBResolveObjectReferenceIntentResponse *v5;
  void *v6;

  v5 = -[_INPBResolveObjectReferenceIntentResponse init](+[_INPBResolveObjectReferenceIntentResponse allocWithZone:](_INPBResolveObjectReferenceIntentResponse, "allocWithZone:"), "init");
  v6 = (void *)-[NSData copyWithZone:](self->_resolvedReferences, "copyWithZone:", a3);
  -[_INPBResolveObjectReferenceIntentResponse setResolvedReferences:](v5, "setResolvedReferences:", v6);

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
    -[_INPBResolveObjectReferenceIntentResponse resolvedReferences](self, "resolvedReferences");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resolvedReferences");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      -[_INPBResolveObjectReferenceIntentResponse resolvedReferences](self, "resolvedReferences");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
      {

LABEL_10:
        v13 = 1;
        goto LABEL_8;
      }
      v9 = (void *)v8;
      -[_INPBResolveObjectReferenceIntentResponse resolvedReferences](self, "resolvedReferences");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "resolvedReferences");
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
  return -[NSData hash](self->_resolvedReferences, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_resolvedReferences)
  {
    -[_INPBResolveObjectReferenceIntentResponse resolvedReferences](self, "resolvedReferences");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("resolvedReferences"));

  }
  return v3;
}

- (NSData)resolvedReferences
{
  return self->_resolvedReferences;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolvedReferences, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
