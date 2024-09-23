@implementation _MRTextEditingAttributesProtobuf

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasPrompt
{
  return self->_prompt != 0;
}

- (BOOL)hasInputTraits
{
  return self->_inputTraits != 0;
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
  v8.super_class = (Class)_MRTextEditingAttributesProtobuf;
  -[_MRTextEditingAttributesProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRTextEditingAttributesProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *title;
  NSString *prompt;
  _MRTextInputTraitsProtobuf *inputTraits;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  title = self->_title;
  if (title)
    objc_msgSend(v3, "setObject:forKey:", title, CFSTR("title"));
  prompt = self->_prompt;
  if (prompt)
    objc_msgSend(v4, "setObject:forKey:", prompt, CFSTR("prompt"));
  inputTraits = self->_inputTraits;
  if (inputTraits)
  {
    -[_MRTextInputTraitsProtobuf dictionaryRepresentation](inputTraits, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("inputTraits"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRTextEditingAttributesProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_title)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_prompt)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_inputTraits)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_title)
  {
    objc_msgSend(v4, "setTitle:");
    v4 = v5;
  }
  if (self->_prompt)
  {
    objc_msgSend(v5, "setPrompt:");
    v4 = v5;
  }
  if (self->_inputTraits)
  {
    objc_msgSend(v5, "setInputTraits:");
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
  id v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[NSString copyWithZone:](self->_prompt, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[_MRTextInputTraitsProtobuf copyWithZone:](self->_inputTraits, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *title;
  NSString *prompt;
  _MRTextInputTraitsProtobuf *inputTraits;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((title = self->_title, !((unint64_t)title | v4[3]))
     || -[NSString isEqual:](title, "isEqual:"))
    && ((prompt = self->_prompt, !((unint64_t)prompt | v4[2]))
     || -[NSString isEqual:](prompt, "isEqual:")))
  {
    inputTraits = self->_inputTraits;
    if ((unint64_t)inputTraits | v4[1])
      v8 = -[_MRTextInputTraitsProtobuf isEqual:](inputTraits, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_title, "hash");
  v4 = -[NSString hash](self->_prompt, "hash") ^ v3;
  return v4 ^ -[_MRTextInputTraitsProtobuf hash](self->_inputTraits, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _MRTextInputTraitsProtobuf *inputTraits;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  v7 = v4;
  if (v4[3])
  {
    -[_MRTextEditingAttributesProtobuf setTitle:](self, "setTitle:");
    v4 = v7;
  }
  if (v4[2])
  {
    -[_MRTextEditingAttributesProtobuf setPrompt:](self, "setPrompt:");
    v4 = v7;
  }
  inputTraits = self->_inputTraits;
  v6 = v4[1];
  if (inputTraits)
  {
    if (v6)
    {
      -[_MRTextInputTraitsProtobuf mergeFrom:](inputTraits, "mergeFrom:");
LABEL_10:
      v4 = v7;
    }
  }
  else if (v6)
  {
    -[_MRTextEditingAttributesProtobuf setInputTraits:](self, "setInputTraits:");
    goto LABEL_10;
  }

}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)prompt
{
  return self->_prompt;
}

- (void)setPrompt:(id)a3
{
  objc_storeStrong((id *)&self->_prompt, a3);
}

- (_MRTextInputTraitsProtobuf)inputTraits
{
  return self->_inputTraits;
}

- (void)setInputTraits:(id)a3
{
  objc_storeStrong((id *)&self->_inputTraits, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_prompt, 0);
  objc_storeStrong((id *)&self->_inputTraits, 0);
}

@end
