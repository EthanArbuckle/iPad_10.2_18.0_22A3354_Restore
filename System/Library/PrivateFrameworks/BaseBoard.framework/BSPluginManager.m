@implementation BSPluginManager

+ (id)mainManager
{
  void *v2;
  void *v3;

  +[BSPluginManagerCoordinator sharedInstance](BSPluginManagerCoordinator, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mainPluginManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)managerForBundle:(uint64_t)a1
{
  id v2;
  id v3;
  id *v4;

  v2 = a2;
  v3 = objc_alloc((Class)objc_opt_self());
  v4 = -[BSPluginManager initWithBundle:](v3, v2);

  return v4;
}

- (id)initWithBundle:(void *)a1
{
  id v4;
  id v5;
  id *v6;
  id *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  int v19;
  int v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  id v34;
  void *v36;
  id v37;
  objc_class *v38;
  void *v39;
  void *v40;
  id v41;
  objc_class *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  id obj;
  void *v49;
  void *v50;
  id *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  objc_super v60;
  _BYTE v61[128];
  _BYTE v62[128];
  _QWORD v63[2];
  void *v64;
  uint8_t buf[4];
  id v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  const __CFString *v72;
  __int16 v73;
  int v74;
  __int16 v75;
  void *v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v47 = v4;
  if (!a1)
    goto LABEL_7;
  v5 = v4;
  NSClassFromString(CFSTR("NSBundle"));
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_initWithBundle_);
      v37 = (id)objc_claimAutoreleasedReturnValue();
      v38 = (objc_class *)objc_opt_class();
      NSStringFromClass(v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v66 = v37;
      v67 = 2114;
      v68 = v39;
      v69 = 2048;
      v70 = a1;
      v71 = 2114;
      v72 = CFSTR("BSPluginManager.m");
      v73 = 1024;
      v74 = 32;
      v75 = 2114;
      v76 = v36;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v36), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1E9918);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSBundleClass]"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_initWithBundle_);
      v41 = (id)objc_claimAutoreleasedReturnValue();
      v42 = (objc_class *)objc_opt_class();
      NSStringFromClass(v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v66 = v41;
      v67 = 2114;
      v68 = v43;
      v69 = 2048;
      v70 = a1;
      v71 = 2114;
      v72 = CFSTR("BSPluginManager.m");
      v73 = 1024;
      v74 = 32;
      v75 = 2114;
      v76 = v40;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v40), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1E9A24);
  }

  v60.receiver = a1;
  v60.super_class = (Class)BSPluginManager;
  v6 = (id *)objc_msgSendSuper2(&v60, sel_init);
  if (v6)
  {
    v44 = v5;
    v51 = v6;
    v7 = v6 + 1;
    objc_storeStrong(v6 + 1, a2);
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    _BSSearchPathForDirectoryInDomain(NSLibraryDirectory, 8uLL);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v7, "infoDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bs_safeStringForKey:", CFSTR("BSPluginDirectoryName"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
    {
      objc_msgSend(v45, "stringByAppendingPathComponent:");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v64, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v5, "executablePath");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "stringByAppendingPathComponent:", v12);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("Plugins"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v63[0] = v13;
      objc_msgSend(v9, "stringByAppendingString:", CFSTR("Plugins"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v63[1] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    obj = v10;
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v57;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v57 != v16)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
          buf[0] = 0;
          v19 = objc_msgSend(v49, "fileExistsAtPath:isDirectory:", v18, buf);
          if (buf[0])
            v20 = v19;
          else
            v20 = 0;
          if (v20 == 1)
          {
            v21 = objc_msgSend(v18, "copy");
            v22 = v51[2];
            v51[2] = (id)v21;

            goto LABEL_22;
          }
        }
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
        if (v15)
          continue;
        break;
      }
    }
LABEL_22:

    if (v51[2])
    {
      +[BSPluginSpecification specificationsFromHostBundle:]((uint64_t)BSPluginSpecification, *v7);
      v23 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      objc_msgSend(v49, "contentsOfDirectoryAtPath:error:", v51[2], 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
      if (v25)
      {
        v26 = *(_QWORD *)v53;
        do
        {
          for (j = 0; j != v25; ++j)
          {
            if (*(_QWORD *)v53 != v26)
              objc_enumerationMutation(v24);
            v28 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * j);
            v29 = (void *)MEMORY[0x18D769AE0]();
            objc_msgSend(v51[2], "stringByAppendingPathComponent:", v28);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            +[BSPluginBundle bundleWithPath:availableSpecifications:]((uint64_t)BSPluginBundle, v30, v23);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v31, "isValid"))
            {
              objc_msgSend(v50, "addObject:", v31);
            }
            else
            {
              BSLogCommon();
              v32 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                v66 = v30;
                _os_log_error_impl(&dword_18A184000, v32, OS_LOG_TYPE_ERROR, "Ignoring invalid plugin found at %{public}@", buf, 0xCu);
              }

            }
            objc_autoreleasePoolPop(v29);
          }
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
        }
        while (v25);
      }

      v33 = objc_msgSend(v50, "copy");
      v34 = v51[3];
      v51[3] = (id)v33;

    }
    else
    {
      BSLogCommon();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v66 = v44;
        _os_log_error_impl(&dword_18A184000, v23, OS_LOG_TYPE_ERROR, "No plugin directory found for %{public}@", buf, 0xCu);
      }
    }

  }
  else
  {
LABEL_7:
    v51 = 0;
  }

  return v51;
}

- (id)pluginBundleForName:(id)a3 type:(id)a4
{
  id v6;
  id v7;
  BSPluginManager *v8;
  void *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  int v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  objc_msgSend(v6, "stringByDeletingPathExtension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = v8->_pluginBundles;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v14, "name", (_QWORD)v20);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v15, "isEqualToString:", v6) & 1) != 0
          || objc_msgSend(v15, "isEqualToString:", v9))
        {
          if (v7
            && (objc_msgSend(v14, "type"),
                v17 = (void *)objc_claimAutoreleasedReturnValue(),
                v18 = objc_msgSend(v7, "isEqualToString:", v17),
                v17,
                !v18))
          {
            v16 = 0;
          }
          else
          {
            v16 = v14;
          }

          goto LABEL_17;
        }

      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      v16 = 0;
      if (v11)
        continue;
      break;
    }
  }
  else
  {
    v16 = 0;
  }
LABEL_17:

  objc_sync_exit(v8);
  return v16;
}

- (id)pluginBundleForIdentifier:(id)a3
{
  id v4;
  BSPluginManager *v5;
  NSArray *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v5->_pluginBundles;
  v7 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "identifier", (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqualToString:", v4))
        {
          v7 = v10;

          goto LABEL_11;
        }

      }
      v7 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v5);
  return v7;
}

- (id)pluginBundlesForType:(id)a3
{
  id v4;
  void *v5;
  BSPluginManager *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self;
  objc_sync_enter(v6);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v6->_pluginBundles;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v11, "type", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v4);

        if (v13)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  objc_sync_exit(v6);
  return v5;
}

- (id)description
{
  id *p_isa;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  id v13;
  id *v14;

  p_isa = (id *)&self->super.isa;
  if (self)
  {
    +[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa[1], "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, 0);

    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __57__BSPluginManager_descriptionBuilderWithMultilinePrefix___block_invoke;
    v12 = &unk_1E1EBE700;
    v6 = v3;
    v13 = v6;
    v14 = p_isa;
    objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, 0, &v9);
    v7 = v6;

    objc_msgSend(v7, "build", v9, v10, v11, v12);
    p_isa = (id *)objc_claimAutoreleasedReturnValue();

  }
  return p_isa;
}

uint64_t __57__BSPluginManager_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("directory"));
  return objc_msgSend(*(id *)(a1 + 32), "appendArraySection:withName:skipIfEmpty:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("bundles"), 1);
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (NSString)pluginDirectory
{
  return self->_pluginDirectory;
}

- (NSArray)pluginBundles
{
  return self->_pluginBundles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluginBundles, 0);
  objc_storeStrong((id *)&self->_pluginDirectory, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
}

@end
