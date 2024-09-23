@implementation _INPBNote

- (void)setAccountIdentifier:(id)a3
{
  NSString *v4;
  NSString *accountIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  accountIdentifier = self->_accountIdentifier;
  self->_accountIdentifier = v4;

}

- (BOOL)hasAccountIdentifier
{
  return self->_accountIdentifier != 0;
}

- (void)setContents:(id)a3
{
  NSArray *v4;
  NSArray *contents;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  contents = self->_contents;
  self->_contents = v4;

}

- (void)clearContents
{
  -[NSArray removeAllObjects](self->_contents, "removeAllObjects");
}

- (void)addContent:(id)a3
{
  id v4;
  NSArray *contents;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  contents = self->_contents;
  v8 = v4;
  if (!contents)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_contents;
    self->_contents = v6;

    v4 = v8;
    contents = self->_contents;
  }
  -[NSArray addObject:](contents, "addObject:", v4);

}

- (unint64_t)contentsCount
{
  return -[NSArray count](self->_contents, "count");
}

- (id)contentAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_contents, "objectAtIndexedSubscript:", a3);
}

- (void)setCreatedDateTime:(id)a3
{
  objc_storeStrong((id *)&self->_createdDateTime, a3);
}

- (BOOL)hasCreatedDateTime
{
  return self->_createdDateTime != 0;
}

- (void)setGroupName:(id)a3
{
  objc_storeStrong((id *)&self->_groupName, a3);
}

- (BOOL)hasGroupName
{
  return self->_groupName != 0;
}

- (void)setIdentifier:(id)a3
{
  NSString *v4;
  NSString *identifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  identifier = self->_identifier;
  self->_identifier = v4;

}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)setModifiedDateTime:(id)a3
{
  objc_storeStrong((id *)&self->_modifiedDateTime, a3);
}

- (BOOL)hasModifiedDateTime
{
  return self->_modifiedDateTime != 0;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBNoteReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_INPBNote accountIdentifier](self, "accountIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = self->_contents;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }

  -[_INPBNote createdDateTime](self, "createdDateTime", v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[_INPBNote createdDateTime](self, "createdDateTime");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBNote groupName](self, "groupName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[_INPBNote groupName](self, "groupName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBNote identifier](self, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    PBDataWriterWriteStringField();
  -[_INPBNote modifiedDateTime](self, "modifiedDateTime");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[_INPBNote modifiedDateTime](self, "modifiedDateTime");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBNote title](self, "title");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[_INPBNote title](self, "title");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (_INPBNote)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBNote *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBNote *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBNote *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBNote initWithData:](self, "initWithData:", v6);

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
  -[_INPBNote data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBNote *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;

  v5 = -[_INPBNote init](+[_INPBNote allocWithZone:](_INPBNote, "allocWithZone:"), "init");
  v6 = (void *)-[NSString copyWithZone:](self->_accountIdentifier, "copyWithZone:", a3);
  -[_INPBNote setAccountIdentifier:](v5, "setAccountIdentifier:", v6);

  v7 = (void *)-[NSArray copyWithZone:](self->_contents, "copyWithZone:", a3);
  -[_INPBNote setContents:](v5, "setContents:", v7);

  v8 = -[_INPBDateTime copyWithZone:](self->_createdDateTime, "copyWithZone:", a3);
  -[_INPBNote setCreatedDateTime:](v5, "setCreatedDateTime:", v8);

  v9 = -[_INPBDataString copyWithZone:](self->_groupName, "copyWithZone:", a3);
  -[_INPBNote setGroupName:](v5, "setGroupName:", v9);

  v10 = (void *)-[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  -[_INPBNote setIdentifier:](v5, "setIdentifier:", v10);

  v11 = -[_INPBDateTime copyWithZone:](self->_modifiedDateTime, "copyWithZone:", a3);
  -[_INPBNote setModifiedDateTime:](v5, "setModifiedDateTime:", v11);

  v12 = -[_INPBDataString copyWithZone:](self->_title, "copyWithZone:", a3);
  -[_INPBNote setTitle:](v5, "setTitle:", v12);

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
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  BOOL v42;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_37;
  -[_INPBNote accountIdentifier](self, "accountIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[_INPBNote accountIdentifier](self, "accountIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBNote accountIdentifier](self, "accountIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accountIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_37;
  }
  else
  {

  }
  -[_INPBNote contents](self, "contents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[_INPBNote contents](self, "contents");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBNote contents](self, "contents");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contents");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_37;
  }
  else
  {

  }
  -[_INPBNote createdDateTime](self, "createdDateTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createdDateTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[_INPBNote createdDateTime](self, "createdDateTime");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBNote createdDateTime](self, "createdDateTime");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "createdDateTime");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_37;
  }
  else
  {

  }
  -[_INPBNote groupName](self, "groupName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[_INPBNote groupName](self, "groupName");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_INPBNote groupName](self, "groupName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "groupName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_37;
  }
  else
  {

  }
  -[_INPBNote identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[_INPBNote identifier](self, "identifier");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[_INPBNote identifier](self, "identifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_37;
  }
  else
  {

  }
  -[_INPBNote modifiedDateTime](self, "modifiedDateTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modifiedDateTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[_INPBNote modifiedDateTime](self, "modifiedDateTime");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[_INPBNote modifiedDateTime](self, "modifiedDateTime");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "modifiedDateTime");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_37;
  }
  else
  {

  }
  -[_INPBNote title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBNote title](self, "title");
    v37 = objc_claimAutoreleasedReturnValue();
    if (!v37)
    {

LABEL_40:
      v42 = 1;
      goto LABEL_38;
    }
    v38 = (void *)v37;
    -[_INPBNote title](self, "title");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v39, "isEqual:", v40);

    if ((v41 & 1) != 0)
      goto LABEL_40;
  }
  else
  {
LABEL_36:

  }
LABEL_37:
  v42 = 0;
LABEL_38:

  return v42;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  NSUInteger v7;
  unint64_t v8;

  v3 = -[NSString hash](self->_accountIdentifier, "hash");
  v4 = -[NSArray hash](self->_contents, "hash") ^ v3;
  v5 = -[_INPBDateTime hash](self->_createdDateTime, "hash");
  v6 = v4 ^ v5 ^ -[_INPBDataString hash](self->_groupName, "hash");
  v7 = -[NSString hash](self->_identifier, "hash");
  v8 = v7 ^ -[_INPBDateTime hash](self->_modifiedDateTime, "hash");
  return v6 ^ v8 ^ -[_INPBDataString hash](self->_title, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_accountIdentifier)
  {
    -[_INPBNote accountIdentifier](self, "accountIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("accountIdentifier"));

  }
  if (-[NSArray count](self->_contents, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v7 = self->_contents;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v25;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v25 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v11), "dictionaryRepresentation", (_QWORD)v24);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("content"));
  }
  -[_INPBNote createdDateTime](self, "createdDateTime", (_QWORD)v24);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dictionaryRepresentation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("createdDateTime"));

  -[_INPBNote groupName](self, "groupName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dictionaryRepresentation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("groupName"));

  if (self->_identifier)
  {
    -[_INPBNote identifier](self, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("identifier"));

  }
  -[_INPBNote modifiedDateTime](self, "modifiedDateTime");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "dictionaryRepresentation");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("modifiedDateTime"));

  -[_INPBNote title](self, "title");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "dictionaryRepresentation");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("title"));

  return v3;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (NSArray)contents
{
  return self->_contents;
}

- (_INPBDateTime)createdDateTime
{
  return self->_createdDateTime;
}

- (_INPBDataString)groupName
{
  return self->_groupName;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (_INPBDateTime)modifiedDateTime
{
  return self->_modifiedDateTime;
}

- (_INPBDataString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_modifiedDateTime, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_createdDateTime, 0);
  objc_storeStrong((id *)&self->_contents, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

+ (Class)contentType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
