@implementation _INPBDeleteEventIntent

- (void)setDeleteAllOccurrences:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_deleteAllOccurrences = a3;
}

- (BOOL)hasDeleteAllOccurrences
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasDeleteAllOccurrences:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)setIntentMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_intentMetadata, a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setTargetEventIdentifier:(id)a3
{
  NSString *v4;
  NSString *targetEventIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  targetEventIdentifier = self->_targetEventIdentifier;
  self->_targetEventIdentifier = v4;

}

- (BOOL)hasTargetEventIdentifier
{
  return self->_targetEventIdentifier != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBDeleteEventIntentReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (-[_INPBDeleteEventIntent hasDeleteAllOccurrences](self, "hasDeleteAllOccurrences"))
    PBDataWriterWriteBOOLField();
  -[_INPBDeleteEventIntent intentMetadata](self, "intentMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBDeleteEventIntent intentMetadata](self, "intentMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBDeleteEventIntent targetEventIdentifier](self, "targetEventIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v8;
  if (v6)
  {
    PBDataWriterWriteStringField();
    v7 = v8;
  }

}

- (_INPBDeleteEventIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBDeleteEventIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBDeleteEventIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBDeleteEventIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBDeleteEventIntent initWithData:](self, "initWithData:", v6);

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
  -[_INPBDeleteEventIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBDeleteEventIntent *v5;
  id v6;
  void *v7;

  v5 = -[_INPBDeleteEventIntent init](+[_INPBDeleteEventIntent allocWithZone:](_INPBDeleteEventIntent, "allocWithZone:"), "init");
  if (-[_INPBDeleteEventIntent hasDeleteAllOccurrences](self, "hasDeleteAllOccurrences"))
    -[_INPBDeleteEventIntent setDeleteAllOccurrences:](v5, "setDeleteAllOccurrences:", -[_INPBDeleteEventIntent deleteAllOccurrences](self, "deleteAllOccurrences"));
  v6 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBDeleteEventIntent setIntentMetadata:](v5, "setIntentMetadata:", v6);

  v7 = (void *)-[NSString copyWithZone:](self->_targetEventIdentifier, "copyWithZone:", a3);
  -[_INPBDeleteEventIntent setTargetEventIdentifier:](v5, "setTargetEventIdentifier:", v7);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int deleteAllOccurrences;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  BOOL v19;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  v5 = -[_INPBDeleteEventIntent hasDeleteAllOccurrences](self, "hasDeleteAllOccurrences");
  if (v5 != objc_msgSend(v4, "hasDeleteAllOccurrences"))
    goto LABEL_16;
  if (-[_INPBDeleteEventIntent hasDeleteAllOccurrences](self, "hasDeleteAllOccurrences"))
  {
    if (objc_msgSend(v4, "hasDeleteAllOccurrences"))
    {
      deleteAllOccurrences = self->_deleteAllOccurrences;
      if (deleteAllOccurrences != objc_msgSend(v4, "deleteAllOccurrences"))
        goto LABEL_16;
    }
  }
  -[_INPBDeleteEventIntent intentMetadata](self, "intentMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_15;
  -[_INPBDeleteEventIntent intentMetadata](self, "intentMetadata");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[_INPBDeleteEventIntent intentMetadata](self, "intentMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (!v13)
      goto LABEL_16;
  }
  else
  {

  }
  -[_INPBDeleteEventIntent targetEventIdentifier](self, "targetEventIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "targetEventIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) != (v8 != 0))
  {
    -[_INPBDeleteEventIntent targetEventIdentifier](self, "targetEventIdentifier");
    v14 = objc_claimAutoreleasedReturnValue();
    if (!v14)
    {

LABEL_19:
      v19 = 1;
      goto LABEL_17;
    }
    v15 = (void *)v14;
    -[_INPBDeleteEventIntent targetEventIdentifier](self, "targetEventIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "targetEventIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if ((v18 & 1) != 0)
      goto LABEL_19;
  }
  else
  {
LABEL_15:

  }
LABEL_16:
  v19 = 0;
LABEL_17:

  return v19;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;

  if (-[_INPBDeleteEventIntent hasDeleteAllOccurrences](self, "hasDeleteAllOccurrences"))
    v3 = 2654435761 * self->_deleteAllOccurrences;
  else
    v3 = 0;
  v4 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_targetEventIdentifier, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBDeleteEventIntent hasDeleteAllOccurrences](self, "hasDeleteAllOccurrences"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBDeleteEventIntent deleteAllOccurrences](self, "deleteAllOccurrences"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("deleteAllOccurrences"));

  }
  -[_INPBDeleteEventIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("intentMetadata"));

  if (self->_targetEventIdentifier)
  {
    -[_INPBDeleteEventIntent targetEventIdentifier](self, "targetEventIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("targetEventIdentifier"));

  }
  return v3;
}

- (BOOL)deleteAllOccurrences
{
  return self->_deleteAllOccurrences;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (NSString)targetEventIdentifier
{
  return self->_targetEventIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetEventIdentifier, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
