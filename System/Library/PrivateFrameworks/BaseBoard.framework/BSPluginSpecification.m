@implementation BSPluginSpecification

+ (id)specificationsFromHostBundle:(uint64_t)a1
{
  objc_class *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  id v11;
  _QWORD *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v26;
  id v27;
  id v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v27 = a2;
  v2 = (objc_class *)objc_opt_self();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "URLForResource:withExtension:", CFSTR("PluginSpecification"), CFSTR("plist"));
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithContentsOfURL:", v3, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v27, "infoDictionary", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bs_safeArrayForKey:", CFSTR("BSPluginSpecification"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v31 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = [v2 alloc];
          v11 = v9;
          if (v10
            && (v34.receiver = v10,
                v34.super_class = (Class)BSPluginSpecification,
                (v12 = objc_msgSendSuper2(&v34, sel_init)) != 0))
          {
            objc_msgSend(v11, "bs_safeObjectForKey:ofType:", CFSTR("BSPluginType"), objc_opt_class());
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "copy");
            v15 = (void *)v12[2];
            v12[2] = v14;

            objc_msgSend(v11, "bs_safeObjectForKey:ofType:", CFSTR("BSPluginBundleController"), objc_opt_class());
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "copy");
            v18 = (void *)v12[3];
            v12[3] = v17;

            objc_msgSend(v11, "bs_safeObjectForKey:ofType:", CFSTR("BSPluginAllowList"), objc_opt_class());
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "copy");
            v21 = (void *)v12[1];
            v12[1] = v20;

            if (!v12[1])
            {
              objc_msgSend(v11, "bs_safeObjectForKey:ofType:", CFSTR("BSPluginWhitelist"), objc_opt_class());
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = objc_msgSend(v22, "copy");
              v24 = (void *)v12[1];
              v12[1] = v23;

            }
            if (v12[2] && v12[3])
              objc_msgSend(v28, "addObject:", v12);
          }
          else
          {

            v12 = 0;
          }

        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v6);
  }

  return v28;
}

- (uint64_t)matchesPluginBundle:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = *(void **)(a1 + 16);
    objc_msgSend(v3, "type");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = objc_msgSend(v5, "isEqualToString:", v6);

    a1 = (_DWORD)v5
      && ((v7 = *(void **)(a1 + 8)) == 0
       || (objc_msgSend(v4, "name"),
           v8 = (void *)objc_claimAutoreleasedReturnValue(),
           v9 = objc_msgSend(v7, "containsObject:", v8),
           v8,
           (v9 & 1) != 0));
  }

  return a1;
}

- (NSString)description
{
  return (NSString *)-[BSPluginSpecification descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[BSPluginSpecification succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;

  +[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_type, CFSTR("type"));
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", self->_classOrProtocolName, CFSTR("classOrProtocol"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[BSPluginSpecification descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  -[BSPluginSpecification succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classOrProtocolName, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_allowListedNames, 0);
}

@end
