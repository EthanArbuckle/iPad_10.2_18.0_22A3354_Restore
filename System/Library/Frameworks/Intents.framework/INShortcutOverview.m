@implementation INShortcutOverview

- (id)_intents_cacheableObjects
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[INShortcutOverview icon](self, "icon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[INShortcutOverview icon](self, "icon");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  -[INShortcutOverview steps](self, "steps");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[INShortcutOverview steps](self, "steps");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v7);

  }
  if (objc_msgSend(v3, "count"))
    v8 = v3;
  else
    v8 = 0;
  v9 = v8;

  return v9;
}

- (void)_intents_updateContainerWithCache:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[INShortcutOverview icon](self, "icon");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[INShortcutOverview icon](self, "icon");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cacheableObjectForIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[INShortcutOverview icon](self, "icon");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "cacheableObjectForIdentifier:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[INShortcutOverview icon](self, "icon");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "_imageSize");
        objc_msgSend(v13, "_setImageSize:");

      }
    }
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[INShortcutOverview steps](self, "steps", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v19, "_identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "cacheableObjectForIdentifier:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          objc_msgSend(v19, "_identifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "cacheableObjectForIdentifier:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v23, "_imageSize");
            objc_msgSend(v19, "_setImageSize:");
          }

        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v16);
  }

}

- (INShortcutOverview)initWithName:(id)a3 voiceCommand:(id)a4 icon:(id)a5 descriptiveText:(id)a6 steps:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  INShortcutOverview *v17;
  uint64_t v18;
  INSpeakableString *name;
  uint64_t v20;
  INSpeakableString *voiceCommand;
  uint64_t v22;
  INImage *icon;
  uint64_t v24;
  INSpeakableString *descriptiveText;
  uint64_t v26;
  NSArray *steps;
  objc_super v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)INShortcutOverview;
  v17 = -[INShortcutOverview init](&v29, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    name = v17->_name;
    v17->_name = (INSpeakableString *)v18;

    v20 = objc_msgSend(v13, "copy");
    voiceCommand = v17->_voiceCommand;
    v17->_voiceCommand = (INSpeakableString *)v20;

    v22 = objc_msgSend(v14, "copy");
    icon = v17->_icon;
    v17->_icon = (INImage *)v22;

    v24 = objc_msgSend(v15, "copy");
    descriptiveText = v17->_descriptiveText;
    v17->_descriptiveText = (INSpeakableString *)v24;

    v26 = objc_msgSend(v16, "copy");
    steps = v17->_steps;
    v17->_steps = (NSArray *)v26;

  }
  return v17;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = -[INSpeakableString hash](self->_name, "hash");
  v4 = -[INSpeakableString hash](self->_voiceCommand, "hash") ^ v3;
  v5 = -[INImage hash](self->_icon, "hash");
  v6 = v4 ^ v5 ^ -[INSpeakableString hash](self->_descriptiveText, "hash");
  return v6 ^ -[NSArray hash](self->_steps, "hash");
}

- (BOOL)isEqual:(id)a3
{
  INShortcutOverview *v4;
  INShortcutOverview *v5;
  INSpeakableString *name;
  INSpeakableString *voiceCommand;
  INImage *icon;
  INSpeakableString *descriptiveText;
  NSArray *steps;
  BOOL v11;

  v4 = (INShortcutOverview *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      name = self->_name;
      v11 = 0;
      if (name == v5->_name || -[INSpeakableString isEqual:](name, "isEqual:"))
      {
        voiceCommand = self->_voiceCommand;
        if (voiceCommand == v5->_voiceCommand || -[INSpeakableString isEqual:](voiceCommand, "isEqual:"))
        {
          icon = self->_icon;
          if (icon == v5->_icon || -[INImage isEqual:](icon, "isEqual:"))
          {
            descriptiveText = self->_descriptiveText;
            if (descriptiveText == v5->_descriptiveText || -[INSpeakableString isEqual:](descriptiveText, "isEqual:"))
            {
              steps = self->_steps;
              if (steps == v5->_steps || -[NSArray isEqual:](steps, "isEqual:"))
                v11 = 1;
            }
          }
        }
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (INShortcutOverview)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  INShortcutOverview *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("voiceCommand"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("icon"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("descriptiveText"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0C99E60];
  v15[0] = objc_opt_class();
  v15[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("steps"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[INShortcutOverview initWithName:voiceCommand:icon:descriptiveText:steps:](self, "initWithName:voiceCommand:icon:descriptiveText:steps:", v5, v6, v7, v8, v12);
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  INSpeakableString *name;
  id v5;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_voiceCommand, CFSTR("voiceCommand"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_icon, CFSTR("icon"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_descriptiveText, CFSTR("descriptiveText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_steps, CFSTR("steps"));

}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:", self->_name);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("name"));

  objc_msgSend(v6, "encodeObject:", self->_voiceCommand);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, CFSTR("voiceCommand"));

  objc_msgSend(v6, "encodeObject:", self->_icon);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, CFSTR("icon"));

  objc_msgSend(v6, "encodeObject:", self->_descriptiveText);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, CFSTR("descriptiveText"));

  objc_msgSend(v6, "encodeObject:", self->_steps);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, CFSTR("steps"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INShortcutOverview descriptionAtIndent:](self, "descriptionAtIndent:", 0);
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)INShortcutOverview;
  -[INShortcutOverview description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INShortcutOverview _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  INSpeakableString *name;
  uint64_t v4;
  INSpeakableString *voiceCommand;
  void *v6;
  INImage *icon;
  void *v8;
  INSpeakableString *descriptiveText;
  void *v10;
  NSArray *steps;
  void *v12;
  void *v13;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  _QWORD v22[6];

  v22[5] = *MEMORY[0x1E0C80C00];
  v17 = CFSTR("name");
  name = self->_name;
  v4 = (uint64_t)name;
  if (!name)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v15 = v4;
  v22[0] = v4;
  v18 = CFSTR("voiceCommand");
  voiceCommand = self->_voiceCommand;
  v6 = voiceCommand;
  if (!voiceCommand)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v4, v17, v18);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[1] = v6;
  v19 = CFSTR("icon");
  icon = self->_icon;
  v8 = icon;
  if (!icon)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[2] = v8;
  v20 = CFSTR("descriptiveText");
  descriptiveText = self->_descriptiveText;
  v10 = descriptiveText;
  if (!descriptiveText)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[3] = v10;
  v21 = CFSTR("steps");
  steps = self->_steps;
  v12 = steps;
  if (!steps)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[4] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v17, 5, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (steps)
  {
    if (descriptiveText)
      goto LABEL_13;
  }
  else
  {

    if (descriptiveText)
    {
LABEL_13:
      if (icon)
        goto LABEL_14;
      goto LABEL_19;
    }
  }

  if (icon)
  {
LABEL_14:
    if (voiceCommand)
      goto LABEL_15;
LABEL_20:

    if (name)
      return v13;
LABEL_21:

    return v13;
  }
LABEL_19:

  if (!voiceCommand)
    goto LABEL_20;
LABEL_15:
  if (!name)
    goto LABEL_21;
  return v13;
}

- (INSpeakableString)name
{
  return self->_name;
}

- (INSpeakableString)voiceCommand
{
  return self->_voiceCommand;
}

- (INImage)icon
{
  return self->_icon;
}

- (INSpeakableString)descriptiveText
{
  return self->_descriptiveText;
}

- (NSArray)steps
{
  return self->_steps;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_steps, 0);
  objc_storeStrong((id *)&self->_descriptiveText, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_voiceCommand, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;

  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("name"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("voiceCommand"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("icon"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("descriptiveText"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("steps"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectsOfClass:from:", v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:voiceCommand:icon:descriptiveText:steps:", v11, v14, v17, v20, v23);
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

@end
