@implementation SGReminderDueLocation

- (SGReminderDueLocation)initWithLocationType:(unsigned __int8)a3 trigger:(unsigned __int8)a4 name:(id)a5
{
  id v9;
  SGReminderDueLocation *v10;
  SGReminderDueLocation *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)SGReminderDueLocation;
  v10 = -[SGReminderDueLocation init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_locationType = a3;
    v10->_trigger = a4;
    objc_storeStrong((id *)&v10->_name, a5);
  }

  return v11;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0D19928], "describeReminderDueLocationType:", self->_locationType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D19928], "describeReminderDueLocationTrigger:", self->_trigger);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<SGReminderDueLocation type:'%@' trigger: %@ name: %@>"), v4, v5, self->_name);

  return v6;
}

- (unint64_t)hash
{
  unint64_t v2;

  v2 = self->_trigger - (unint64_t)self->_locationType + 32 * self->_locationType;
  return -[NSString hash](self->_name, "hash") - v2 + 32 * v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;

  objc_opt_class();
  v5 = objc_opt_new();
  v6 = (_QWORD *)v5;
  if (v5)
  {
    *(_BYTE *)(v5 + 8) = self->_locationType;
    *(_BYTE *)(v5 + 9) = self->_trigger;
    v7 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
    v8 = (void *)v6[2];
    v6[2] = v7;

  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  SGReminderDueLocation *v4;
  SGReminderDueLocation *v5;
  BOOL v6;

  v4 = (SGReminderDueLocation *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGReminderDueLocation isEqualToReminderDueLocation:](self, "isEqualToReminderDueLocation:", v5);

  return v6;
}

- (BOOL)isEqualToReminderDueLocation:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  int locationType;
  int trigger;
  NSString *v8;
  NSString *v9;
  char v10;

  v4 = a3;
  v5 = v4;
  if (v4
    && (locationType = self->_locationType, locationType == objc_msgSend(v4, "locationType"))
    && (trigger = self->_trigger, trigger == objc_msgSend(v5, "trigger")))
  {
    v8 = self->_name;
    v9 = v8;
    if (v8 == (NSString *)v5[2])
      v10 = 1;
    else
      v10 = -[NSString isEqual:](v8, "isEqual:");

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unsigned)locationType
{
  return self->_locationType;
}

- (unsigned)trigger
{
  return self->_trigger;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)mergeDueLocations:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  int v13;
  int v14;
  void *v15;
  void *v16;
  SGReminderDueLocation *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v3, "allObjects", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v4);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "locationType");
        if (v7)
        {
          if (v13 && objc_msgSend(v12, "locationType") != v7)
            goto LABEL_26;
        }
        else
        {
          v7 = v13;
        }
        v14 = objc_msgSend(v12, "trigger");
        if (v8)
        {
          if (v14 && objc_msgSend(v12, "trigger") != v8)
            goto LABEL_26;
        }
        else
        {
          v8 = v14;
        }
        objc_msgSend(v12, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v9)
        {
          if (v15 && (objc_msgSend(v9, "isEqualToString:", v15) & 1) == 0)
          {

LABEL_26:
            v17 = 0;
            goto LABEL_27;
          }
        }
        else
        {
          v9 = v15;
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
  }

  v17 = -[SGReminderDueLocation initWithLocationType:trigger:name:]([SGReminderDueLocation alloc], "initWithLocationType:trigger:name:", v7, v8, v9);
LABEL_27:

  return v17;
}

@end
