@implementation _INPBShortcutOverview

- (void)setDescriptiveText:(id)a3
{
  objc_storeStrong((id *)&self->_descriptiveText, a3);
}

- (BOOL)hasDescriptiveText
{
  return self->_descriptiveText != 0;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (BOOL)hasIcon
{
  return self->_icon != 0;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (void)setSteps:(id)a3
{
  NSArray *v4;
  NSArray *steps;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  steps = self->_steps;
  self->_steps = v4;

}

- (void)clearSteps
{
  -[NSArray removeAllObjects](self->_steps, "removeAllObjects");
}

- (void)addSteps:(id)a3
{
  id v4;
  NSArray *steps;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  steps = self->_steps;
  v8 = v4;
  if (!steps)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_steps;
    self->_steps = v6;

    v4 = v8;
    steps = self->_steps;
  }
  -[NSArray addObject:](steps, "addObject:", v4);

}

- (unint64_t)stepsCount
{
  return -[NSArray count](self->_steps, "count");
}

- (id)stepsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_steps, "objectAtIndexedSubscript:", a3);
}

- (void)setVoiceCommand:(id)a3
{
  objc_storeStrong((id *)&self->_voiceCommand, a3);
}

- (BOOL)hasVoiceCommand
{
  return self->_voiceCommand != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBShortcutOverviewReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_INPBShortcutOverview descriptiveText](self, "descriptiveText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBShortcutOverview descriptiveText](self, "descriptiveText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBShortcutOverview icon](self, "icon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_INPBShortcutOverview icon](self, "icon");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBShortcutOverview name](self, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[_INPBShortcutOverview name](self, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = self->_steps;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteSubmessage();
        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

  -[_INPBShortcutOverview voiceCommand](self, "voiceCommand", v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[_INPBShortcutOverview voiceCommand](self, "voiceCommand");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (_INPBShortcutOverview)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBShortcutOverview *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBShortcutOverview *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBShortcutOverview *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBShortcutOverview initWithData:](self, "initWithData:", v6);

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
  -[_INPBShortcutOverview data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBShortcutOverview *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v5 = -[_INPBShortcutOverview init](+[_INPBShortcutOverview allocWithZone:](_INPBShortcutOverview, "allocWithZone:"), "init");
  v6 = -[_INPBDataString copyWithZone:](self->_descriptiveText, "copyWithZone:", a3);
  -[_INPBShortcutOverview setDescriptiveText:](v5, "setDescriptiveText:", v6);

  v7 = -[_INPBImageValue copyWithZone:](self->_icon, "copyWithZone:", a3);
  -[_INPBShortcutOverview setIcon:](v5, "setIcon:", v7);

  v8 = -[_INPBDataString copyWithZone:](self->_name, "copyWithZone:", a3);
  -[_INPBShortcutOverview setName:](v5, "setName:", v8);

  v9 = (void *)-[NSArray copyWithZone:](self->_steps, "copyWithZone:", a3);
  -[_INPBShortcutOverview setSteps:](v5, "setSteps:", v9);

  v10 = -[_INPBDataString copyWithZone:](self->_voiceCommand, "copyWithZone:", a3);
  -[_INPBShortcutOverview setVoiceCommand:](v5, "setVoiceCommand:", v10);

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
  char v31;
  BOOL v32;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  -[_INPBShortcutOverview descriptiveText](self, "descriptiveText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "descriptiveText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_INPBShortcutOverview descriptiveText](self, "descriptiveText");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBShortcutOverview descriptiveText](self, "descriptiveText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "descriptiveText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_27;
  }
  else
  {

  }
  -[_INPBShortcutOverview icon](self, "icon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "icon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_INPBShortcutOverview icon](self, "icon");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBShortcutOverview icon](self, "icon");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "icon");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_27;
  }
  else
  {

  }
  -[_INPBShortcutOverview name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_INPBShortcutOverview name](self, "name");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBShortcutOverview name](self, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_27;
  }
  else
  {

  }
  -[_INPBShortcutOverview steps](self, "steps");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "steps");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_INPBShortcutOverview steps](self, "steps");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_INPBShortcutOverview steps](self, "steps");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "steps");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_27;
  }
  else
  {

  }
  -[_INPBShortcutOverview voiceCommand](self, "voiceCommand");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "voiceCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBShortcutOverview voiceCommand](self, "voiceCommand");
    v27 = objc_claimAutoreleasedReturnValue();
    if (!v27)
    {

LABEL_30:
      v32 = 1;
      goto LABEL_28;
    }
    v28 = (void *)v27;
    -[_INPBShortcutOverview voiceCommand](self, "voiceCommand");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "voiceCommand");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if ((v31 & 1) != 0)
      goto LABEL_30;
  }
  else
  {
LABEL_26:

  }
LABEL_27:
  v32 = 0;
LABEL_28:

  return v32;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v3 = -[_INPBDataString hash](self->_descriptiveText, "hash");
  v4 = -[_INPBImageValue hash](self->_icon, "hash") ^ v3;
  v5 = -[_INPBDataString hash](self->_name, "hash");
  v6 = v4 ^ v5 ^ -[NSArray hash](self->_steps, "hash");
  return v6 ^ -[_INPBDataString hash](self->_voiceCommand, "hash");
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
  void *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBShortcutOverview descriptiveText](self, "descriptiveText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("descriptiveText"));

  -[_INPBShortcutOverview icon](self, "icon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("icon"));

  -[_INPBShortcutOverview name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("name"));

  if (-[NSArray count](self->_steps, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v11 = self->_steps;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v15), "dictionaryRepresentation", (_QWORD)v20);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v16);

          ++v15;
        }
        while (v13 != v15);
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v13);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("steps"));
  }
  -[_INPBShortcutOverview voiceCommand](self, "voiceCommand", (_QWORD)v20);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "dictionaryRepresentation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("voiceCommand"));

  return v3;
}

- (_INPBDataString)descriptiveText
{
  return self->_descriptiveText;
}

- (_INPBImageValue)icon
{
  return self->_icon;
}

- (_INPBDataString)name
{
  return self->_name;
}

- (NSArray)steps
{
  return self->_steps;
}

- (_INPBDataString)voiceCommand
{
  return self->_voiceCommand;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceCommand, 0);
  objc_storeStrong((id *)&self->_steps, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_descriptiveText, 0);
}

+ (Class)stepsType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
