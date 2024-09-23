@implementation ATXMinimalSlotResolutionParameters

- (ATXMinimalSlotResolutionParameters)initWithParameterHash:(unint64_t)a3 slotHash:(unint64_t)a4 uuid:(id)a5 paramCount:(unint64_t)a6
{
  id v12;
  ATXMinimalSlotResolutionParameters *v13;
  ATXMinimalSlotResolutionParameters *v14;
  void *v16;
  objc_super v17;

  v12 = a5;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXMinimalSlotResolutionParameters.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uuid"));

  }
  v17.receiver = self;
  v17.super_class = (Class)ATXMinimalSlotResolutionParameters;
  v13 = -[ATXMinimalSlotResolutionParameters init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_paramHash = a3;
    v13->_slotHash = a4;
    objc_storeStrong((id *)&v13->_slotSetUuid, a5);
    v14->_paramCount = a6;
  }

  return v14;
}

- (ATXMinimalSlotResolutionParameters)initWithAction:(id)a3 slots:(id)a4
{
  id v6;
  id v7;
  ATXMinimalSlotResolutionParameters *v8;
  ATXMinimalSlotResolutionParameters *v9;
  void *v10;
  uint64_t v11;
  NSUUID *slotSetUuid;
  void *v13;
  void *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ATXMinimalSlotResolutionParameters;
  v8 = -[ATXMinimalSlotResolutionParameters init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    if (v6 && v7)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF90E0]), "initWithAction:slots:", v6, v7);
      v9->_paramHash = objc_msgSend(v10, "hash");

    }
    else
    {
      v8->_paramHash = 0;
    }
    v9->_slotHash = objc_msgSend(v7, "hash");
    objc_msgSend(v7, "uuid");
    v11 = objc_claimAutoreleasedReturnValue();
    slotSetUuid = v9->_slotSetUuid;
    v9->_slotSetUuid = (NSUUID *)v11;

    objc_msgSend(v7, "parameters");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v7, "parameters");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v9->_paramCount = objc_msgSend(v14, "count");

    }
    else
    {
      v9->_paramCount = 0;
    }

  }
  return v9;
}

- (id)actionAndSlotSet
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  +[_ATXDataStore sharedInstance](_ATXDataStore, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionForSlotUUID:", self->_slotSetUuid);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "first");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "second");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v11, "uuid", (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", self->_slotSetUuid);

        if (v13)
        {
          v14 = v11;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_11:

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81638]), "initWithFirst:second:", v5, v14);
  return v15;
}

- (unint64_t)hash
{
  return self->_paramHash;
}

- (BOOL)isEqual:(id)a3
{
  ATXMinimalSlotResolutionParameters *v4;
  ATXMinimalSlotResolutionParameters *v5;
  unint64_t paramHash;
  unint64_t slotHash;
  BOOL v8;

  v4 = (ATXMinimalSlotResolutionParameters *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      paramHash = self->_paramHash;
      if (paramHash == -[ATXMinimalSlotResolutionParameters hash](v5, "hash"))
      {
        slotHash = self->_slotHash;
        v8 = slotHash == -[ATXMinimalSlotResolutionParameters slotHash](v5, "slotHash");
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)slotHash
{
  return self->_slotHash;
}

- (unint64_t)paramCount
{
  return self->_paramCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slotSetUuid, 0);
}

@end
