@implementation ISPersona

- (ISPersona)initWithRecord:(id)a3
{
  id v5;
  ISPersona *v6;
  ISPersona *v7;
  void *v8;
  char isKindOfClass;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)ISPersona;
  v6 = -[ISPersona init](&v21, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_16;
  objc_storeStrong((id *)&v6->_record, a3);
  v7->_personaType = 0;
  +[ISDefaults sharedInstance](ISDefaults, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "enableInstanceIDBasedTwoAppModel"))
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      goto LABEL_14;
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v5, "identities", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v8);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v13), "personaType") == 2)
            v7->_personaType = 1;
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v11);
    }
  }

LABEL_14:
  +[ISDefaults sharedInstance](ISDefaults, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "enableBadgeOverhang");

  if (v15)
    v7->_personaType = 1;
LABEL_16:

  return v7;
}

- (BOOL)isEnterprisePersona
{
  return -[ISPersona personaType](self, "personaType") == 1;
}

- (id)resourceBadge
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (!-[ISPersona isEnterprisePersona](self, "isEnterprisePersona"))
    return 0;
  v2 = (void *)objc_opt_new();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7A0]), "initWithSystemColor:", 11);
  v10[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSymbolColors:", v4);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7A0]), "initWithSystemColor:", 4);
  v9 = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEnclosureColors:", v6);

  objc_msgSend(v2, "setRenderingMode:", 2);
  +[ISGraphicSymbolResource graphicSymbolResourceWithConfiguration:symbolName:url:](ISGraphicSymbolResource, "graphicSymbolResourceWithConfiguration:symbolName:url:", v2, CFSTR("frying.pan.fill"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (LSBundleRecord)record
{
  return self->_record;
}

- (int64_t)personaType
{
  return self->_personaType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_record, 0);
}

@end
