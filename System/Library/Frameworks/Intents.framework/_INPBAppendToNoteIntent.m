@implementation _INPBAppendToNoteIntent

- (void)setContent:(id)a3
{
  objc_storeStrong((id *)&self->_content, a3);
}

- (BOOL)hasContent
{
  return self->_content != 0;
}

- (void)setIntentMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_intentMetadata, a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setTargetNote:(id)a3
{
  objc_storeStrong((id *)&self->_targetNote, a3);
}

- (BOOL)hasTargetNote
{
  return self->_targetNote != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBAppendToNoteIntentReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[_INPBAppendToNoteIntent content](self, "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBAppendToNoteIntent content](self, "content");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBAppendToNoteIntent intentMetadata](self, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBAppendToNoteIntent intentMetadata](self, "intentMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBAppendToNoteIntent targetNote](self, "targetNote");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_INPBAppendToNoteIntent targetNote](self, "targetNote");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (_INPBAppendToNoteIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBAppendToNoteIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBAppendToNoteIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBAppendToNoteIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBAppendToNoteIntent initWithData:](self, "initWithData:", v6);

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
  -[_INPBAppendToNoteIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBAppendToNoteIntent *v5;
  id v6;
  id v7;
  id v8;

  v5 = -[_INPBAppendToNoteIntent init](+[_INPBAppendToNoteIntent allocWithZone:](_INPBAppendToNoteIntent, "allocWithZone:"), "init");
  v6 = -[_INPBNoteContent copyWithZone:](self->_content, "copyWithZone:", a3);
  -[_INPBAppendToNoteIntent setContent:](v5, "setContent:", v6);

  v7 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBAppendToNoteIntent setIntentMetadata:](v5, "setIntentMetadata:", v7);

  v8 = -[_INPBNote copyWithZone:](self->_targetNote, "copyWithZone:", a3);
  -[_INPBAppendToNoteIntent setTargetNote:](v5, "setTargetNote:", v8);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  BOOL v22;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[_INPBAppendToNoteIntent content](self, "content");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "content");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBAppendToNoteIntent content](self, "content");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBAppendToNoteIntent content](self, "content");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "content");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[_INPBAppendToNoteIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBAppendToNoteIntent intentMetadata](self, "intentMetadata");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBAppendToNoteIntent intentMetadata](self, "intentMetadata");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[_INPBAppendToNoteIntent targetNote](self, "targetNote");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "targetNote");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBAppendToNoteIntent targetNote](self, "targetNote");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[_INPBAppendToNoteIntent targetNote](self, "targetNote");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "targetNote");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if ((v21 & 1) != 0)
      goto LABEL_20;
  }
  else
  {
LABEL_16:

  }
LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[_INPBNoteContent hash](self->_content, "hash");
  v4 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash") ^ v3;
  return v4 ^ -[_INPBNote hash](self->_targetNote, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBAppendToNoteIntent content](self, "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("content"));

  -[_INPBAppendToNoteIntent intentMetadata](self, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("intentMetadata"));

  -[_INPBAppendToNoteIntent targetNote](self, "targetNote");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("targetNote"));

  return v3;
}

- (_INPBNoteContent)content
{
  return self->_content;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (_INPBNote)targetNote
{
  return self->_targetNote;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetNote, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_content, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
