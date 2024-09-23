@implementation _MRKeyboardMessageProtobuf

- (int)state
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_state;
  else
    return 0;
}

- (void)setState:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_state = a3;
}

- (void)setHasState:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasState
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)stateAsString:(int)a3
{
  if (a3 < 7)
    return off_1E30CF878[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NotEditing")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DidBeginEditing")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Editing")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TextDidChange")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DidEndEditing")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Response")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasAttributes
{
  return self->_attributes != 0;
}

- (BOOL)hasEncryptedTextCyphertext
{
  return self->_encryptedTextCyphertext != 0;
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
  v8.super_class = (Class)_MRKeyboardMessageProtobuf;
  -[_MRKeyboardMessageProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRKeyboardMessageProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t state;
  __CFString *v5;
  _MRTextEditingAttributesProtobuf *attributes;
  void *v7;
  NSData *encryptedTextCyphertext;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    state = self->_state;
    if (state >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_state);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E30CF878[state];
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("state"));

  }
  attributes = self->_attributes;
  if (attributes)
  {
    -[_MRTextEditingAttributesProtobuf dictionaryRepresentation](attributes, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("attributes"));

  }
  encryptedTextCyphertext = self->_encryptedTextCyphertext;
  if (encryptedTextCyphertext)
    objc_msgSend(v3, "setObject:forKey:", encryptedTextCyphertext, CFSTR("encryptedTextCyphertext"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRKeyboardMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_attributes)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_encryptedTextCyphertext)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[6] = self->_state;
    *((_BYTE *)v4 + 28) |= 1u;
  }
  v5 = v4;
  if (self->_attributes)
  {
    objc_msgSend(v4, "setAttributes:");
    v4 = v5;
  }
  if (self->_encryptedTextCyphertext)
  {
    objc_msgSend(v5, "setEncryptedTextCyphertext:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_state;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  v7 = -[_MRTextEditingAttributesProtobuf copyWithZone:](self->_attributes, "copyWithZone:", a3);
  v8 = (void *)v6[1];
  v6[1] = v7;

  v9 = -[NSData copyWithZone:](self->_encryptedTextCyphertext, "copyWithZone:", a3);
  v10 = (void *)v6[2];
  v6[2] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _MRTextEditingAttributesProtobuf *attributes;
  NSData *encryptedTextCyphertext;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_state != *((_DWORD *)v4 + 6))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  attributes = self->_attributes;
  if ((unint64_t)attributes | *((_QWORD *)v4 + 1)
    && !-[_MRTextEditingAttributesProtobuf isEqual:](attributes, "isEqual:"))
  {
    goto LABEL_11;
  }
  encryptedTextCyphertext = self->_encryptedTextCyphertext;
  if ((unint64_t)encryptedTextCyphertext | *((_QWORD *)v4 + 2))
    v7 = -[NSData isEqual:](encryptedTextCyphertext, "isEqual:");
  else
    v7 = 1;
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_state;
  else
    v3 = 0;
  v4 = -[_MRTextEditingAttributesProtobuf hash](self->_attributes, "hash") ^ v3;
  return v4 ^ -[NSData hash](self->_encryptedTextCyphertext, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  _MRTextEditingAttributesProtobuf *attributes;
  uint64_t v7;
  _QWORD *v8;

  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    self->_state = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 1u;
  }
  attributes = self->_attributes;
  v7 = v5[1];
  v8 = v5;
  if (attributes)
  {
    if (!v7)
      goto LABEL_9;
    -[_MRTextEditingAttributesProtobuf mergeFrom:](attributes, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_9;
    -[_MRKeyboardMessageProtobuf setAttributes:](self, "setAttributes:");
  }
  v5 = v8;
LABEL_9:
  if (v5[2])
  {
    -[_MRKeyboardMessageProtobuf setEncryptedTextCyphertext:](self, "setEncryptedTextCyphertext:");
    v5 = v8;
  }

}

- (_MRTextEditingAttributesProtobuf)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_attributes, a3);
}

- (NSData)encryptedTextCyphertext
{
  return self->_encryptedTextCyphertext;
}

- (void)setEncryptedTextCyphertext:(id)a3
{
  objc_storeStrong((id *)&self->_encryptedTextCyphertext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptedTextCyphertext, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
}

@end
