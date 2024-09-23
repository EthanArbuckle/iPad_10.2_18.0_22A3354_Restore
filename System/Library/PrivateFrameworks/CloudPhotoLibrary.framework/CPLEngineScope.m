@implementation CPLEngineScope

- (CPLEngineScope)initWithScopeIdentifier:(id)a3 scopeType:(int64_t)a4
{
  id v6;
  CPLEngineScope *v7;
  uint64_t v8;
  NSString *scopeIdentifier;
  uint64_t v10;
  NSDate *creationDate;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CPLEngineScope;
  v7 = -[CPLEngineScope init](&v13, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    scopeIdentifier = v7->_scopeIdentifier;
    v7->_scopeIdentifier = (NSString *)v8;

    v7->_scopeType = a4;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = objc_claimAutoreleasedReturnValue();
    creationDate = v7->_creationDate;
    v7->_creationDate = (NSDate *)v10;

  }
  return v7;
}

- (CPLEngineScope)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  CPLEngineScope *v6;
  uint64_t v7;
  NSDate *creationDate;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("scopeIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CPLEngineScope initWithScopeIdentifier:scopeType:](self, "initWithScopeIdentifier:scopeType:", v5, objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("scopeType")));
  if (v6)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creationDate"));
    v7 = objc_claimAutoreleasedReturnValue();
    creationDate = v6->_creationDate;
    v6->_creationDate = (NSDate *)v7;

    v6->_localIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("localIndex"));
    v6->_cloudIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cloudIndex"));
    v6->_stableIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("stableIndex"));
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *scopeIdentifier;
  id v5;

  scopeIdentifier = self->_scopeIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", scopeIdentifier, CFSTR("scopeIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_scopeType, CFSTR("scopeType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_creationDate, CFSTR("creationDate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_localIndex, CFSTR("localIndex"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_cloudIndex, CFSTR("cloudIndex"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_stableIndex, CFSTR("stableIndex"));

}

- (id)statusDescription
{
  id v3;
  int64_t stableIndex;
  void *v5;
  void *v6;
  __int128 v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8 = *(_OWORD *)&self->_localIndex;
  stableIndex = self->_stableIndex;
  +[CPLDateFormatter stringFromDateAgo:now:](CPLDateFormatter, "stringFromDateAgo:now:", self->_creationDate, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%ld/%ld/%ld - creat: %@"), v8, stableIndex, v5);

  return v6;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<%@ %@ %ld/%ld/%ld>"), objc_opt_class(), self->_scopeIdentifier, self->_localIndex, self->_cloudIndex, self->_stableIndex);
}

- (unint64_t)hash
{
  return -[NSString hash](self->_scopeIdentifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  CPLEngineScope *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;

  v4 = (CPLEngineScope *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = self->_scopeIdentifier;
      -[CPLEngineScope scopeIdentifier](v4, "scopeIdentifier");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = v5 && v6 && (objc_msgSend((id)v5, "isEqual:", v6) & 1) != 0 || (v5 | v7) == 0;

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (NSString)scopeIdentifier
{
  return self->_scopeIdentifier;
}

- (int64_t)scopeType
{
  return self->_scopeType;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_creationDate, a3);
}

- (int64_t)localIndex
{
  return self->_localIndex;
}

- (void)setLocalIndex:(int64_t)a3
{
  self->_localIndex = a3;
}

- (int64_t)cloudIndex
{
  return self->_cloudIndex;
}

- (void)setCloudIndex:(int64_t)a3
{
  self->_cloudIndex = a3;
}

- (int64_t)stableIndex
{
  return self->_stableIndex;
}

- (void)setStableIndex:(int64_t)a3
{
  self->_stableIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_scopeIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)separatorForStatusKey:(id)a3
{
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("indexes")))
    return CFSTR("/");
  else
    return CFSTR(", ");
}

+ (void)formatStatusDictionary:(id)a3 forScopeWithIdentifier:(id)a4 appendString:(id)a5 appendTopLevelStatus:(id)a6 appendLineStatus:(id)a7
{
  id v11;
  id v12;
  void (**v13)(id, id);
  void (**v14)(id, const __CFString *, const __CFString *);
  void (**v15)(id, const __CFString *, _QWORD);
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  __CFString *v28;
  void *v29;
  void *v30;
  void (**v31)(id, const __CFString *, _QWORD);
  id v32;
  void (**v33)(id, _QWORD, id);
  void (**v34)(_QWORD, _QWORD);
  _CPLEngineScopeDatesStack *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void (**v45)(id, _QWORD, id);
  void *v46;
  void *v47;
  NSDate *v48;
  void *v49;
  id v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t i;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  const __CFString *v62;
  void *v63;
  _CPLEngineScopeDatesStack *v64;
  void *v65;
  uint64_t v66;
  NSObject *v67;
  NSObject *v68;
  id v69;
  _CPLEngineScopeDatesStack *v70;
  void (**v71)(id, id);
  id v72;
  NSDate *v73;
  void *v74;
  void *v75;
  void (**v76)(id, const __CFString *, const __CFString *);
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _QWORD v81[4];
  id v82;
  id v83;
  uint8_t buf[16];
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = (void (**)(id, id))a5;
  v14 = (void (**)(id, const __CFString *, const __CFString *))a6;
  v15 = (void (**)(id, const __CFString *, _QWORD))a7;
  v13[2](v13, v12);
  v13[2](v13, CFSTR(" ("));
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("scope type"));
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
    v18 = (const __CFString *)v16;
  else
    v18 = CFSTR("invalid");
  v14[2](v14, CFSTR("scope type"), v18);

  v13[2](v13, CFSTR(") "));
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("indexes"));
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (v19)
    v21 = (const __CFString *)v19;
  else
    v21 = (const __CFString *)&unk_1E611B6E8;
  v14[2](v14, CFSTR("indexes"), v21);

  v13[2](v13, CFSTR(" - creat: "));
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("creation date"));
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  if (v22)
    v24 = (const __CFString *)v22;
  else
    v24 = CFSTR("???");
  v14[2](v14, CFSTR("creation date"), v24);

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("flags"));
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v13[2](v13, CFSTR(" ("));
    v14[2](v14, CFSTR("flags"), (const __CFString *)v25);
    v13[2](v13, CFSTR(")"));
  }
  v75 = (void *)v25;
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("busyState"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "integerValue");

  if (v27)
  {
    v13[2](v13, CFSTR(" ["));
    +[CPLScopeChange descriptionForBusyState:](CPLScopeChange, "descriptionForBusyState:", v27);
    v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v14[2](v14, CFSTR("busyState"), v28);

    v13[2](v13, CFSTR("]"));
  }
  v76 = v14;
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("zone"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (v29 && (objc_msgSend(v29, "isEqualToString:", v12) & 1) == 0)
    ((void (**)(id, const __CFString *, void *))v15)[2](v15, CFSTR("zone"), v30);
  v74 = v30;
  v81[0] = MEMORY[0x1E0C809B0];
  v81[1] = 3221225472;
  v81[2] = __146__CPLEngineScope_CPLEngineScopeStatusFormatter__formatStatusDictionary_forScopeWithIdentifier_appendString_appendTopLevelStatus_appendLineStatus___block_invoke;
  v81[3] = &unk_1E60D8BC8;
  v82 = v11;
  v31 = v15;
  v32 = v82;
  v33 = (void (**)(id, _QWORD, id))v31;
  v83 = v31;
  v34 = (void (**)(_QWORD, _QWORD))MEMORY[0x1B5E08DC4](v81);
  ((void (**)(_QWORD, const __CFString *))v34)[2](v34, CFSTR("disabled date"));
  ((void (**)(_QWORD, const __CFString *))v34)[2](v34, CFSTR("delete date"));
  ((void (**)(_QWORD, const __CFString *))v34)[2](v34, CFSTR("todo"));
  ((void (**)(_QWORD, const __CFString *))v34)[2](v34, CFSTR("init. est. size"));
  ((void (**)(_QWORD, const __CFString *))v34)[2](v34, CFSTR("last supported feature version"));
  ((void (**)(_QWORD, const __CFString *))v34)[2](v34, CFSTR("scope info"));
  ((void (**)(_QWORD, const __CFString *))v34)[2](v34, CFSTR("anch"));
  ((void (**)(_QWORD, const __CFString *))v34)[2](v34, CFSTR("queries"));
  ((void (**)(_QWORD, const __CFString *))v34)[2](v34, CFSTR("transient"));
  ((void (**)(_QWORD, const __CFString *))v34)[2](v34, CFSTR("upload group"));
  ((void (**)(_QWORD, const __CFString *))v34)[2](v34, CFSTR("download group"));
  v35 = objc_alloc_init(_CPLEngineScopeDatesStack);
  objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("initial sync"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CPLEngineScopeDatesStack prependDate:forKey:]((uint64_t)v35, v36, CFSTR("initial sync"));

  objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("initial client download"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CPLEngineScopeDatesStack prependDate:forKey:]((uint64_t)v35, v37, CFSTR("initial client download"));

  objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("initial mingle"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CPLEngineScopeDatesStack prependDate:forKey:]((uint64_t)v35, v38, CFSTR("initial mingle"));

  objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("initial shared metadata download"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CPLEngineScopeDatesStack prependDate:forKey:]((uint64_t)v35, v39, CFSTR("initial shared metadata download"));

  objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("initial metadata download"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CPLEngineScopeDatesStack prependDate:forKey:]((uint64_t)v35, v40, CFSTR("initial metadata download"));

  objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("initial metadata queries"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CPLEngineScopeDatesStack prependDate:forKey:]((uint64_t)v35, v41, CFSTR("initial metadata queries"));

  objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("activation"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CPLEngineScopeDatesStack prependDate:forKey:]((uint64_t)v35, v42, CFSTR("activation"));

  if (!v35)
    goto LABEL_25;
  if (!-[NSMutableArray count](v35->_intermediateStatuses, "count"))
  {
    v48 = v35->_lastDate;
    if (v48)
      goto LABEL_23;
    goto LABEL_25;
  }
  if (!v35->_proposedKey)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v59 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v59, OS_LOG_TYPE_ERROR, "missing proposed key", buf, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineScope.m");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = CFSTR("missing proposed key");
    v63 = v60;
    v64 = v35;
    v65 = v61;
    v66 = 412;
LABEL_53:
    objc_msgSend(v63, "handleFailureInMethod:object:file:lineNumber:description:", sel_finalStatus, v64, v65, v66, v62);

    abort();
  }
  if (!v35->_lastDate)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v67 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v67, OS_LOG_TYPE_ERROR, "missing last date", buf, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineScope.m");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = CFSTR("missing last date");
    v63 = v60;
    v64 = v35;
    v65 = v61;
    v66 = 413;
    goto LABEL_53;
  }
  if (!v35->_now)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v68 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v68, OS_LOG_TYPE_ERROR, "missing now", buf, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineScope.m");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = CFSTR("missing now");
    v63 = v60;
    v64 = v35;
    v65 = v61;
    v66 = 414;
    goto LABEL_53;
  }
  v43 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[NSMutableArray componentsJoinedByString:](v35->_intermediateStatuses, "componentsJoinedByString:", CFSTR(" "));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  _displayableKey(v35->_proposedKey);
  v45 = v33;
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPLDateFormatter stringFromDateAgo:now:](CPLDateFormatter, "stringFromDateAgo:now:", v35->_lastDate, v35->_now);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (NSDate *)objc_msgSend(v43, "initWithFormat:", CFSTR("%@ %@ [%@]"), v44, v46, v47);

  v33 = v45;
  if (v48)
  {
LABEL_23:
    v73 = v48;
    ((void (**)(id, NSString *, id))v33)[2](v33, v35->_proposedKey, v48);
    goto LABEL_26;
  }
LABEL_25:
  v73 = 0;
LABEL_26:
  objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("storages"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (v49)
  {
    v69 = v32;
    v70 = v35;
    v71 = v13;
    v72 = v12;
    v50 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    +[CPLEngineStore storageNames](CPLEngineStore, "storageNames");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v77, v85, 16);
    if (v52)
    {
      v53 = v52;
      v54 = *(_QWORD *)v78;
      do
      {
        for (i = 0; i != v53; ++i)
        {
          if (*(_QWORD *)v78 != v54)
            objc_enumerationMutation(v51);
          v56 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * i);
          objc_msgSend(v49, "objectForKeyedSubscript:", v56);
          v57 = objc_claimAutoreleasedReturnValue();
          v58 = (void *)v57;
          if (v57)
            objc_msgSend(v50, "appendFormat:", CFSTR("\n%@: %@"), v56, v57);

        }
        v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v77, v85, 16);
      }
      while (v53);
    }

    ((void (**)(id, const __CFString *, id))v33)[2](v33, CFSTR("storages"), v50);
    v13 = v71;
    v12 = v72;
    v32 = v69;
    v35 = v70;
  }

}

void __146__CPLEngineScope_CPLEngineScopeStatusFormatter__formatStatusDictionary_forScopeWithIdentifier_appendString_appendTopLevelStatus_appendLineStatus___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
