@implementation AFExperimentConfiguration

- (AFExperimentConfiguration)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFExperimentConfigurationMutation *);
  AFExperimentConfiguration *v5;
  AFExperimentConfiguration *v6;
  _AFExperimentConfigurationMutation *v7;
  void *v8;
  uint64_t v9;
  NSString *identifier;
  void *v11;
  uint64_t v12;
  NSString *version;
  void *v14;
  uint64_t v15;
  AFExperimentGroup *controlGroup;
  void *v17;
  uint64_t v18;
  NSArray *experimentGroups;
  void *v20;
  uint64_t v21;
  NSString *salt;
  objc_super v24;

  v4 = (void (**)(id, _AFExperimentConfigurationMutation *))a3;
  v24.receiver = self;
  v24.super_class = (Class)AFExperimentConfiguration;
  v5 = -[AFExperimentConfiguration init](&v24, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFExperimentConfigurationMutation initWithBase:]([_AFExperimentConfigurationMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFExperimentConfigurationMutation isDirty](v7, "isDirty"))
    {
      v6->_type = -[_AFExperimentConfigurationMutation getType](v7, "getType");
      -[_AFExperimentConfigurationMutation getIdentifier](v7, "getIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      identifier = v6->_identifier;
      v6->_identifier = (NSString *)v9;

      -[_AFExperimentConfigurationMutation getVersion](v7, "getVersion");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      version = v6->_version;
      v6->_version = (NSString *)v12;

      -[_AFExperimentConfigurationMutation getControlGroup](v7, "getControlGroup");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "copy");
      controlGroup = v6->_controlGroup;
      v6->_controlGroup = (AFExperimentGroup *)v15;

      -[_AFExperimentConfigurationMutation getExperimentGroups](v7, "getExperimentGroups");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "copy");
      experimentGroups = v6->_experimentGroups;
      v6->_experimentGroups = (NSArray *)v18;

      -[_AFExperimentConfigurationMutation getSalt](v7, "getSalt");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "copy");
      salt = v6->_salt;
      v6->_salt = (NSString *)v21;

    }
  }

  return v6;
}

- (AFExperimentConfiguration)init
{
  return -[AFExperimentConfiguration initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFExperimentConfiguration)initWithType:(int64_t)a3 identifier:(id)a4 version:(id)a5 controlGroup:(id)a6 experimentGroups:(id)a7 salt:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  AFExperimentConfiguration *v24;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  int64_t v32;

  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __96__AFExperimentConfiguration_initWithType_identifier_version_controlGroup_experimentGroups_salt___block_invoke;
  v26[3] = &unk_1E3A2CF30;
  v27 = v14;
  v28 = v15;
  v29 = v16;
  v30 = v17;
  v31 = v18;
  v32 = a3;
  v19 = v18;
  v20 = v17;
  v21 = v16;
  v22 = v15;
  v23 = v14;
  v24 = -[AFExperimentConfiguration initWithBuilder:](self, "initWithBuilder:", v26);

  return v24;
}

- (NSString)description
{
  return (NSString *)-[AFExperimentConfiguration _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  unint64_t type;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  objc_super v11;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v11.receiver = self;
  v11.super_class = (Class)AFExperimentConfiguration;
  -[AFExperimentConfiguration description](&v11, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  type = self->_type;
  if (type > 2)
    v7 = CFSTR("(unknown)");
  else
    v7 = off_1E3A2D940[type];
  v8 = v7;
  v9 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {type = %@, identifier = %@, version = %@, controlGroup = %@, experimentGroups = %@, salt = %@}"), v5, v8, self->_identifier, self->_version, self->_controlGroup, self->_experimentGroups, self->_salt);

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  unint64_t v7;
  uint64_t v8;
  NSUInteger v9;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_type);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSString hash](self->_identifier, "hash");
  v6 = v5 ^ -[NSString hash](self->_version, "hash");
  v7 = v6 ^ -[AFExperimentGroup hash](self->_controlGroup, "hash") ^ v4;
  v8 = -[NSArray hash](self->_experimentGroups, "hash");
  v9 = v7 ^ v8 ^ -[NSString hash](self->_salt, "hash");

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  AFExperimentConfiguration *v4;
  AFExperimentConfiguration *v5;
  int64_t type;
  NSString *v7;
  NSString *identifier;
  NSString *v9;
  NSString *version;
  AFExperimentGroup *v11;
  AFExperimentGroup *controlGroup;
  NSArray *v13;
  NSArray *experimentGroups;
  NSString *v15;
  NSString *salt;
  BOOL v17;

  v4 = (AFExperimentConfiguration *)a3;
  if (self == v4)
  {
    v17 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      type = self->_type;
      if (type == -[AFExperimentConfiguration type](v5, "type"))
      {
        -[AFExperimentConfiguration identifier](v5, "identifier");
        v7 = (NSString *)objc_claimAutoreleasedReturnValue();
        identifier = self->_identifier;
        if (identifier == v7 || -[NSString isEqual:](identifier, "isEqual:", v7))
        {
          -[AFExperimentConfiguration version](v5, "version");
          v9 = (NSString *)objc_claimAutoreleasedReturnValue();
          version = self->_version;
          if (version == v9 || -[NSString isEqual:](version, "isEqual:", v9))
          {
            -[AFExperimentConfiguration controlGroup](v5, "controlGroup");
            v11 = (AFExperimentGroup *)objc_claimAutoreleasedReturnValue();
            controlGroup = self->_controlGroup;
            if (controlGroup == v11 || -[AFExperimentGroup isEqual:](controlGroup, "isEqual:", v11))
            {
              -[AFExperimentConfiguration experimentGroups](v5, "experimentGroups");
              v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
              experimentGroups = self->_experimentGroups;
              if (experimentGroups == v13 || -[NSArray isEqual:](experimentGroups, "isEqual:", v13))
              {
                -[AFExperimentConfiguration salt](v5, "salt");
                v15 = (NSString *)objc_claimAutoreleasedReturnValue();
                salt = self->_salt;
                v17 = salt == v15 || -[NSString isEqual:](salt, "isEqual:", v15);

              }
              else
              {
                v17 = 0;
              }

            }
            else
            {
              v17 = 0;
            }

          }
          else
          {
            v17 = 0;
          }

        }
        else
        {
          v17 = 0;
        }

      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }
  }

  return v17;
}

- (AFExperimentConfiguration)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  AFExperimentConfiguration *v15;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFExperimentConfiguration::type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFExperimentConfiguration::identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFExperimentConfiguration::version"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFExperimentConfiguration::controlGroup"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("AFExperimentConfiguration::experimentGroups"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFExperimentConfiguration::salt"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[AFExperimentConfiguration initWithType:identifier:version:controlGroup:experimentGroups:salt:](self, "initWithType:identifier:version:controlGroup:experimentGroups:salt:", v6, v7, v8, v9, v13, v14);
  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  int64_t type;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  type = self->_type;
  v7 = a3;
  objc_msgSend(v4, "numberWithInteger:", type);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("AFExperimentConfiguration::type"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_identifier, CFSTR("AFExperimentConfiguration::identifier"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_version, CFSTR("AFExperimentConfiguration::version"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_controlGroup, CFSTR("AFExperimentConfiguration::controlGroup"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_experimentGroups, CFSTR("AFExperimentConfiguration::experimentGroups"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_salt, CFSTR("AFExperimentConfiguration::salt"));

}

- (AFExperimentConfiguration)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  AFExperimentConfiguration *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  id v21;
  AFExperimentGroup *v22;
  void *v23;
  void *v24;
  id v25;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  AFExperimentGroup *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = AFExperimentConfigurationTypeGetFromName(v6);
    else
      v7 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("identifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("version"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("controlGroup"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v31 = -[AFExperimentGroup initWithDictionaryRepresentation:]([AFExperimentGroup alloc], "initWithDictionaryRepresentation:", v13);
    else
      v31 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("experimentGroups"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = v12;
      v29 = v10;
      v30 = v7;
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v14, "count"));
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v27 = v14;
      v16 = v14;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v33 != v19)
              objc_enumerationMutation(v16);
            v21 = *(id *)(*((_QWORD *)&v32 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v22 = -[AFExperimentGroup initWithDictionaryRepresentation:]([AFExperimentGroup alloc], "initWithDictionaryRepresentation:", v21);

              if (v22)
                objc_msgSend(v15, "addObject:", v22);
            }
            else
            {

              v22 = 0;
            }

          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        }
        while (v18);
      }

      v23 = (void *)objc_msgSend(v15, "copy");
      v7 = v30;
      v12 = v28;
      v10 = v29;
      v14 = v27;
    }
    else
    {
      v23 = 0;
    }

    objc_msgSend(v5, "objectForKey:", CFSTR("salt"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v25 = v24;
    else
      v25 = 0;

    self = -[AFExperimentConfiguration initWithType:identifier:version:controlGroup:experimentGroups:salt:](self, "initWithType:identifier:version:controlGroup:experimentGroups:salt:", v7, v10, v12, v31, v23, v25);
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)buildDictionaryRepresentation
{
  id v3;
  unint64_t type;
  __CFString *v5;
  __CFString *v6;
  NSString *identifier;
  NSString *version;
  AFExperimentGroup *controlGroup;
  void *v10;
  void *v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSString *salt;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  type = self->_type;
  if (type > 2)
    v5 = CFSTR("(unknown)");
  else
    v5 = off_1E3A2D940[type];
  v6 = v5;
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("type"));

  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  version = self->_version;
  if (version)
    objc_msgSend(v3, "setObject:forKey:", version, CFSTR("version"));
  controlGroup = self->_controlGroup;
  if (controlGroup)
  {
    -[AFExperimentGroup buildDictionaryRepresentation](controlGroup, "buildDictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("controlGroup"));

  }
  if (self->_experimentGroups)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_experimentGroups, "count"));
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v12 = self->_experimentGroups;
    v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v23;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v23 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v16), "buildDictionaryRepresentation", (_QWORD)v22);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v14);
    }

    v18 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("experimentGroups"));

  }
  salt = self->_salt;
  if (salt)
    objc_msgSend(v3, "setObject:forKey:", salt, CFSTR("salt"));
  v20 = (void *)objc_msgSend(v3, "copy", (_QWORD)v22);

  return v20;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)version
{
  return self->_version;
}

- (AFExperimentGroup)controlGroup
{
  return self->_controlGroup;
}

- (NSArray)experimentGroups
{
  return self->_experimentGroups;
}

- (NSString)salt
{
  return self->_salt;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_salt, 0);
  objc_storeStrong((id *)&self->_experimentGroups, 0);
  objc_storeStrong((id *)&self->_controlGroup, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

void __96__AFExperimentConfiguration_initWithType_identifier_version_controlGroup_experimentGroups_salt___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[9];
  v4 = a2;
  objc_msgSend(v4, "setType:", v3);
  objc_msgSend(v4, "setIdentifier:", a1[4]);
  objc_msgSend(v4, "setVersion:", a1[5]);
  objc_msgSend(v4, "setControlGroup:", a1[6]);
  objc_msgSend(v4, "setExperimentGroups:", a1[7]);
  objc_msgSend(v4, "setSalt:", a1[8]);

}

+ (id)newWithBuilder:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBuilder:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _AFExperimentConfigurationMutation *);
  _AFExperimentConfigurationMutation *v5;
  AFExperimentConfiguration *v6;
  void *v7;
  uint64_t v8;
  NSString *identifier;
  void *v10;
  uint64_t v11;
  NSString *version;
  void *v13;
  uint64_t v14;
  AFExperimentGroup *controlGroup;
  void *v16;
  uint64_t v17;
  NSArray *experimentGroups;
  void *v19;
  uint64_t v20;
  NSString *salt;

  v4 = (void (**)(id, _AFExperimentConfigurationMutation *))a3;
  if (v4)
  {
    v5 = -[_AFExperimentConfigurationMutation initWithBase:]([_AFExperimentConfigurationMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFExperimentConfigurationMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFExperimentConfiguration);
      v6->_type = -[_AFExperimentConfigurationMutation getType](v5, "getType");
      -[_AFExperimentConfigurationMutation getIdentifier](v5, "getIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      identifier = v6->_identifier;
      v6->_identifier = (NSString *)v8;

      -[_AFExperimentConfigurationMutation getVersion](v5, "getVersion");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      version = v6->_version;
      v6->_version = (NSString *)v11;

      -[_AFExperimentConfigurationMutation getControlGroup](v5, "getControlGroup");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "copy");
      controlGroup = v6->_controlGroup;
      v6->_controlGroup = (AFExperimentGroup *)v14;

      -[_AFExperimentConfigurationMutation getExperimentGroups](v5, "getExperimentGroups");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "copy");
      experimentGroups = v6->_experimentGroups;
      v6->_experimentGroups = (NSArray *)v17;

      -[_AFExperimentConfigurationMutation getSalt](v5, "getSalt");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "copy");
      salt = v6->_salt;
      v6->_salt = (NSString *)v20;

    }
    else
    {
      v6 = (AFExperimentConfiguration *)-[AFExperimentConfiguration copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFExperimentConfiguration *)-[AFExperimentConfiguration copy](self, "copy");
  }

  return v6;
}

@end
