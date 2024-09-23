@implementation _INPBCustomObject

- (void)setAlternatives:(id)a3
{
  NSArray *v4;
  NSArray *alternatives;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  alternatives = self->_alternatives;
  self->_alternatives = v4;

}

- (void)clearAlternatives
{
  -[NSArray removeAllObjects](self->_alternatives, "removeAllObjects");
}

- (void)addAlternative:(id)a3
{
  id v4;
  NSArray *alternatives;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  alternatives = self->_alternatives;
  v8 = v4;
  if (!alternatives)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_alternatives;
    self->_alternatives = v6;

    v4 = v8;
    alternatives = self->_alternatives;
  }
  -[NSArray addObject:](alternatives, "addObject:", v4);

}

- (unint64_t)alternativesCount
{
  return -[NSArray count](self->_alternatives, "count");
}

- (id)alternativeAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_alternatives, "objectAtIndexedSubscript:", a3);
}

- (void)setDisplayImage:(id)a3
{
  objc_storeStrong((id *)&self->_displayImage, a3);
}

- (BOOL)hasDisplayImage
{
  return self->_displayImage != 0;
}

- (void)setDisplayString:(id)a3
{
  NSString *v4;
  NSString *displayString;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  displayString = self->_displayString;
  self->_displayString = v4;

}

- (BOOL)hasDisplayString
{
  return self->_displayString != 0;
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

- (void)setPronunciationHint:(id)a3
{
  NSString *v4;
  NSString *pronunciationHint;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  pronunciationHint = self->_pronunciationHint;
  self->_pronunciationHint = v4;

}

- (BOOL)hasPronunciationHint
{
  return self->_pronunciationHint != 0;
}

- (void)setSubtitleString:(id)a3
{
  NSString *v4;
  NSString *subtitleString;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  subtitleString = self->_subtitleString;
  self->_subtitleString = v4;

}

- (BOOL)hasSubtitleString
{
  return self->_subtitleString != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBCustomObjectReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = self->_alternatives;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  -[_INPBCustomObject displayImage](self, "displayImage", v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_INPBCustomObject displayImage](self, "displayImage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBCustomObject displayString](self, "displayString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    PBDataWriterWriteStringField();
  -[_INPBCustomObject identifier](self, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    PBDataWriterWriteStringField();
  -[_INPBCustomObject pronunciationHint](self, "pronunciationHint");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    PBDataWriterWriteStringField();
  -[_INPBCustomObject subtitleString](self, "subtitleString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    PBDataWriterWriteStringField();

}

- (_INPBCustomObject)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBCustomObject *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBCustomObject *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBCustomObject *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBCustomObject initWithData:](self, "initWithData:", v6);

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
  -[_INPBCustomObject data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBCustomObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = -[_INPBCustomObject init](+[_INPBCustomObject allocWithZone:](_INPBCustomObject, "allocWithZone:"), "init");
  v6 = (void *)-[NSArray copyWithZone:](self->_alternatives, "copyWithZone:", a3);
  -[_INPBCustomObject setAlternatives:](v5, "setAlternatives:", v6);

  v7 = -[_INPBImageValue copyWithZone:](self->_displayImage, "copyWithZone:", a3);
  -[_INPBCustomObject setDisplayImage:](v5, "setDisplayImage:", v7);

  v8 = (void *)-[NSString copyWithZone:](self->_displayString, "copyWithZone:", a3);
  -[_INPBCustomObject setDisplayString:](v5, "setDisplayString:", v8);

  v9 = (void *)-[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  -[_INPBCustomObject setIdentifier:](v5, "setIdentifier:", v9);

  v10 = (void *)-[NSString copyWithZone:](self->_pronunciationHint, "copyWithZone:", a3);
  -[_INPBCustomObject setPronunciationHint:](v5, "setPronunciationHint:", v10);

  v11 = (void *)-[NSString copyWithZone:](self->_subtitleString, "copyWithZone:", a3);
  -[_INPBCustomObject setSubtitleString:](v5, "setSubtitleString:", v11);

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
  char v36;
  BOOL v37;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_32;
  -[_INPBCustomObject alternatives](self, "alternatives");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alternatives");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_INPBCustomObject alternatives](self, "alternatives");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBCustomObject alternatives](self, "alternatives");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alternatives");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_32;
  }
  else
  {

  }
  -[_INPBCustomObject displayImage](self, "displayImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_INPBCustomObject displayImage](self, "displayImage");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBCustomObject displayImage](self, "displayImage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayImage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_32;
  }
  else
  {

  }
  -[_INPBCustomObject displayString](self, "displayString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_INPBCustomObject displayString](self, "displayString");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBCustomObject displayString](self, "displayString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_32;
  }
  else
  {

  }
  -[_INPBCustomObject identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_INPBCustomObject identifier](self, "identifier");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_INPBCustomObject identifier](self, "identifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_32;
  }
  else
  {

  }
  -[_INPBCustomObject pronunciationHint](self, "pronunciationHint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pronunciationHint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_INPBCustomObject pronunciationHint](self, "pronunciationHint");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[_INPBCustomObject pronunciationHint](self, "pronunciationHint");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pronunciationHint");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_32;
  }
  else
  {

  }
  -[_INPBCustomObject subtitleString](self, "subtitleString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subtitleString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBCustomObject subtitleString](self, "subtitleString");
    v32 = objc_claimAutoreleasedReturnValue();
    if (!v32)
    {

LABEL_35:
      v37 = 1;
      goto LABEL_33;
    }
    v33 = (void *)v32;
    -[_INPBCustomObject subtitleString](self, "subtitleString");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subtitleString");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if ((v36 & 1) != 0)
      goto LABEL_35;
  }
  else
  {
LABEL_31:

  }
LABEL_32:
  v37 = 0;
LABEL_33:

  return v37;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;

  v3 = -[NSArray hash](self->_alternatives, "hash");
  v4 = -[_INPBImageValue hash](self->_displayImage, "hash") ^ v3;
  v5 = -[NSString hash](self->_displayString, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_identifier, "hash");
  v7 = -[NSString hash](self->_pronunciationHint, "hash");
  return v6 ^ v7 ^ -[NSString hash](self->_subtitleString, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_alternatives, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v5 = self->_alternatives;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v23;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v23 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v9), "dictionaryRepresentation", (_QWORD)v22);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("alternative"));
  }
  -[_INPBCustomObject displayImage](self, "displayImage", (_QWORD)v22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dictionaryRepresentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("displayImage"));

  if (self->_displayString)
  {
    -[_INPBCustomObject displayString](self, "displayString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("displayString"));

  }
  if (self->_identifier)
  {
    -[_INPBCustomObject identifier](self, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("identifier"));

  }
  if (self->_pronunciationHint)
  {
    -[_INPBCustomObject pronunciationHint](self, "pronunciationHint");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("pronunciationHint"));

  }
  if (self->_subtitleString)
  {
    -[_INPBCustomObject subtitleString](self, "subtitleString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("subtitleString"));

  }
  return v3;
}

- (NSArray)alternatives
{
  return self->_alternatives;
}

- (_INPBImageValue)displayImage
{
  return self->_displayImage;
}

- (NSString)displayString
{
  return self->_displayString;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)pronunciationHint
{
  return self->_pronunciationHint;
}

- (NSString)subtitleString
{
  return self->_subtitleString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleString, 0);
  objc_storeStrong((id *)&self->_pronunciationHint, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_displayString, 0);
  objc_storeStrong((id *)&self->_displayImage, 0);
  objc_storeStrong((id *)&self->_alternatives, 0);
}

+ (Class)alternativeType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
