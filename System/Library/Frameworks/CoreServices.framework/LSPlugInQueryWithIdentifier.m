@implementation LSPlugInQueryWithIdentifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bindingMap, 0);
}

void __65__LSPlugInQueryWithIdentifier__enumerateWithXPCConnection_block___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v2);

}

- (void)_enumerateWithXPCConnection:(id)a3 block:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  int inited;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  if (*(_QWORD *)&self->_bindingMap && -[LSPlugInQueryWithIdentifier isBindingMapValid](self, "isBindingMapValid"))
  {
    v14 = 0;
    v15 = 0;
    inited = _LSContextInitReturningError(&v15, &v14);
    v9 = v14;
    if (inited)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      _LSDatabaseGetStringForCFString(v15, *(const __CFString **)&self->_bindingMap, 0);
      v12 = MEMORY[0x1E0C809B0];
      v13 = v10;
      _LSDatabaseEnumeratingBindingMap();
      -[LSPlugInQuery sort:pluginIDs:andYield:context:](self, "sort:pluginIDs:andYield:context:", 1, v13, v7, &v15, v12, 3221225472, __65__LSPlugInQueryWithIdentifier__enumerateWithXPCConnection_block___block_invoke, &unk_1E10449B0);
      _LSContextDestroy(&v15);

    }
    else
    {
      v7[2](v7, 0, v9);
    }

  }
  else
  {
    v16 = *MEMORY[0x1E0CB2938];
    v17[0] = CFSTR("invalid bundleIdentifier");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[LSPlugInQueryWithIdentifier _enumerateWithXPCConnection:block:]", 52, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v11);

  }
}

- (BOOL)isBindingMapValid
{
  return (*((_DWORD *)&self->super.super._legacy + 1) - 9) < 3;
}

- (id)_initWithIdentifier:(id)a3 inMap:(int)a4
{
  id v6;
  _DWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)LSPlugInQueryWithIdentifier;
  v7 = -[LSPlugInQuery _init](&v12, sel__init);
  v8 = v7;
  if (v7)
  {
    v7[3] = a4;
    v9 = objc_msgSend(v6, "copy");
    v10 = (void *)v8[2];
    v8[2] = v9;

  }
  if (!_LSCurrentProcessMayMapDatabase() && pluginQueryFault_onceToken_0 != -1)
    dispatch_once(&pluginQueryFault_onceToken_0, &__block_literal_global_58);

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LSPlugInQueryWithIdentifier)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  LSPlugInQueryWithIdentifier *v7;

  v4 = a3;
  objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("bindingMap"));

  v7 = -[LSPlugInQueryWithIdentifier _initWithIdentifier:inMap:](self, "_initWithIdentifier:inMap:", v5, v6);
  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  objc_super v5;

  v3 = objc_msgSend(*(id *)&self->_bindingMap, "hash");
  v5.receiver = self;
  v5.super_class = (Class)LSPlugInQueryWithIdentifier;
  return -[LSPlugInQuery hash](&v5, sel_hash) ^ v3;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)&self->_bindingMap;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("identifier"));
  objc_msgSend(v5, "encodeInt32:forKey:", *((unsigned int *)&self->super.super._legacy + 1), CFSTR("bindingMap"));

}

- (id)_identifier
{
  return *(id *)&self->_bindingMap;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LSPlugInQueryWithIdentifier;
  if (-[LSPlugInQuery isEqual:](&v9, sel_isEqual_, v4) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = *(void **)&self->_bindingMap;
    objc_msgSend(v4, "_identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
