@implementation MUPlaceEnrichmentAction

- (MUPlaceEnrichmentAction)initWithActionType:(unint64_t)a3 isValidated:(BOOL)a4 mkActionType:(unint64_t)a5
{
  _BOOL8 v6;
  MUPlaceEnrichmentAction *result;
  objc_super v9;

  v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)MUPlaceEnrichmentAction;
  result = -[MUPlaceEnrichmentAction init](&v9, sel_init);
  if (result)
    return -[MUPlaceEnrichmentAction initWithActionType:isValidated:mkActionType:metadata:](result, "initWithActionType:isValidated:mkActionType:metadata:", a3, v6, a5, 0);
  return result;
}

- (MUPlaceEnrichmentAction)initWithActionType:(unint64_t)a3 isValidated:(BOOL)a4 mkActionType:(unint64_t)a5 metadata:(id)a6
{
  id v9;
  MUPlaceEnrichmentAction *v10;
  void *v11;
  id v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSDictionary *enrichmentAction;
  void *v24;
  NSObject *v25;
  void *v26;
  objc_super v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v9 = a6;
  v28.receiver = self;
  v28.super_class = (Class)MUPlaceEnrichmentAction;
  v10 = -[MUPlaceEnrichmentAction init](&v28, sel_init);
  if (!v10)
    goto LABEL_17;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", CFSTR("actionType"), CFSTR("isValidated"), 0);
  v12 = objc_alloc(MEMORY[0x1E0C99DE8]);
  if (a3 - 1 > 0xD)
    v13 = CFSTR("Unknown");
  else
    v13 = off_1E2E021C0[a3 - 1];
  NSStringFromBOOL();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "initWithObjects:", v13, v14, 0);

  if (a3 != 12)
  {
    if (a3 != 13 || !v9)
      goto LABEL_12;
    v17 = CFSTR("subActions");
    goto LABEL_11;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("appCategory"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = CFSTR("appCategory");
LABEL_11:
    objc_msgSend(v11, "addObject:", v17);
    objc_msgSend(v9, "objectForKeyedSubscript:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v18);

  }
LABEL_12:
  v10->_actionType = a3;
  v19 = (void *)MEMORY[0x1E0C99D80];
  v20 = (void *)objc_msgSend(v15, "copy");
  v21 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v19, "dictionaryWithObjects:forKeys:", v20, v21);
  v22 = objc_claimAutoreleasedReturnValue();
  enrichmentAction = v10->_enrichmentAction;
  v10->_enrichmentAction = (NSDictionary *)v22;

  v10->_mkActionType = a5;
  if (qword_1ED01B568 != -1)
    dispatch_once(&qword_1ED01B568, &__block_literal_global_10);
  v24 = (void *)_MergedGlobals_118;
  if (os_log_type_enabled((os_log_t)_MergedGlobals_118, OS_LOG_TYPE_DEBUG))
  {
    v25 = v24;
    -[MUPlaceEnrichmentAction description](v10, "description");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v30 = v26;
    _os_log_impl(&dword_191DB8000, v25, OS_LOG_TYPE_DEBUG, "Initialized action: %@", buf, 0xCu);

  }
LABEL_17:

  return v10;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  const __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MUPlaceEnrichmentAction enrichmentAction](self, "enrichmentAction");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = self->_actionType - 1;
  if (v6 > 0xD)
    v7 = CFSTR("Unknown");
  else
    v7 = off_1E2E021C0[v6];
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, Type: %@"), v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  MUPlaceEnrichmentAction *v5;

  v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = self;
  objc_sync_enter(v5);
  objc_storeStrong(v4 + 1, v5->_enrichmentAction);
  objc_sync_exit(v5);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  MUPlaceEnrichmentAction *v4;
  MUPlaceEnrichmentAction *v5;
  MUPlaceEnrichmentAction *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (MUPlaceEnrichmentAction *)a3;
  v5 = v4;
  if (self == v4)
  {
    v10 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v7 = -[MUPlaceEnrichmentAction actionType](v6, "actionType");
    if (v7 == -[MUPlaceEnrichmentAction actionType](self, "actionType"))
    {
      -[MUPlaceEnrichmentAction enrichmentAction](v6, "enrichmentAction");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUPlaceEnrichmentAction enrichmentAction](self, "enrichmentAction");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToDictionary:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSDictionary)enrichmentAction
{
  return self->_enrichmentAction;
}

- (unint64_t)actionType
{
  return self->_actionType;
}

- (unint64_t)mkActionType
{
  return self->_mkActionType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enrichmentAction, 0);
}

@end
