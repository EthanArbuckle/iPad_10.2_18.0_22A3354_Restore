@implementation BSPluginBundle

+ (_QWORD)bundleWithPath:(void *)a3 availableSpecifications:
{
  id v4;
  objc_class *v5;
  void *v6;
  int v7;
  int v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  void *v41;
  int v42;
  int v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  uint64_t v61;
  void *v62;
  NSObject *v63;
  id obj;
  id obja;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  char v84;
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  objc_super v88;
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v71 = a3;
  v69 = v4;
  v5 = (objc_class *)objc_opt_self();
  v84 = 0;
  objc_msgSend(v4, "pathExtension");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v70, "length")
    && ((v7 = objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v4, &v84), v84) ? (v8 = v7) : (v8 = 0), v8 == 1))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v4);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
    {
      obj = (id)v9;
      v11 = [v5 alloc];
      v12 = v10;
      if (v11)
      {
        v88.receiver = v11;
        v88.super_class = (Class)BSPluginBundle;
        v13 = objc_msgSendSuper2(&v88, sel_init);
        v14 = v13;
        if (v13)
        {
          objc_storeStrong((id *)v13 + 1, obj);
          objc_msgSend(v12, "bundlePath");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "infoDictionary");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "bs_safeObjectForKey:ofType:", CFSTR("BSPluginSpecification"), objc_opt_class());
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "bs_safeObjectForKey:ofType:", CFSTR("BSPluginName"), objc_opt_class());
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v17)
          {
            objc_msgSend(v15, "lastPathComponent");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "stringByDeletingPathExtension");
            v17 = (void *)objc_claimAutoreleasedReturnValue();

          }
          objc_msgSend(v16, "bs_safeObjectForKey:ofType:", CFSTR("BSPluginType"), objc_opt_class());
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v19)
          {
            objc_msgSend(v15, "pathExtension");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v16, "bs_safeObjectForKey:ofType:", CFSTR("BSPluginControllerClass"), objc_opt_class());
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v20)
          {
            objc_msgSend(v67, "bs_safeObjectForKey:ofType:", CFSTR("NSPrincipalClass"), objc_opt_class());
            v20 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v12, "bundleIdentifier", obj);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "copy");
          v23 = (void *)v14[4];
          v14[4] = v22;

          v24 = objc_msgSend(v17, "copy");
          v25 = (void *)v14[5];
          v14[5] = v24;

          v26 = objc_msgSend(v19, "copy");
          v27 = (void *)v14[6];
          v14[6] = v26;

          v28 = objc_msgSend(v20, "copy");
          v29 = (void *)v14[2];
          v14[2] = v28;

        }
      }
      else
      {
        v14 = 0;
      }

      objc_msgSend(v12, "infoDictionary");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "bs_safeObjectForKey:ofType:", CFSTR("UIRequiredDeviceCapabilities"), objc_opt_class());
      v82 = 0u;
      v83 = 0u;
      v80 = 0u;
      v81 = 0u;
      v30 = (id)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v80, v87, 16);
      v32 = v30;
      if (v31)
      {
        v33 = *(_QWORD *)v81;
        v32 = v30;
        do
        {
          for (i = 0; i != v31; ++i)
          {
            if (*(_QWORD *)v81 != v33)
              objc_enumerationMutation(v30);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              v32 = 0;
            }
          }
          v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v80, v87, 16);
        }
        while (v31);
      }

      if (objc_msgSend(v32, "count"))
      {
        v35 = (void *)MGCopyMultipleAnswers();
        if (v35)
        {
          v78 = 0u;
          v79 = 0u;
          v76 = 0u;
          v77 = 0u;
          v36 = v32;
          v37 = -[NSObject countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v76, v86, 16);
          if (v37)
          {
            v38 = *(_QWORD *)v77;
            while (2)
            {
              for (j = 0; j != v37; ++j)
              {
                if (*(_QWORD *)v77 != v38)
                  objc_enumerationMutation(v36);
                objc_msgSend(v35, "bs_safeObjectForKey:ofType:", *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * j), objc_opt_class());
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                v41 = v40;
                if (v40)
                {
                  v42 = objc_msgSend(v40, "BOOLValue");

                  if (v42)
                    continue;
                }

                goto LABEL_41;
              }
              v37 = -[NSObject countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v76, v86, 16);
              if (v37)
                continue;
              break;
            }
          }
          v43 = 1;
        }
        else
        {
LABEL_41:
          BSLogCommon();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            LODWORD(v88.receiver) = 138543362;
            *(id *)((char *)&v88.receiver + 4) = v14;
            _os_log_error_impl(&dword_18A184000, v36, OS_LOG_TYPE_ERROR, "Ignoring plugin because this device lacks the required capabilities: %{public}@", (uint8_t *)&v88, 0xCu);
          }
          v43 = 0;
        }

      }
      else
      {
        v43 = 1;
      }
      objc_msgSend(v68, "objectForKey:", CFSTR("UIDeviceFamily"), obj);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (v44)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v44);
        else
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v44);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = (void *)MEMORY[0x1E0C99E60];
        v48 = (void *)MGCopyAnswer();
        objc_msgSend(v47, "setWithArray:", v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        v45 = objc_msgSend(v46, "intersectsSet:", v49);
        if ((v45 & 1) == 0)
        {
          BSLogCommon();
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            LODWORD(v88.receiver) = 138543362;
            *(id *)((char *)&v88.receiver + 4) = v14;
            _os_log_error_impl(&dword_18A184000, v50, OS_LOG_TYPE_ERROR, "Ignoring plugin because it does not support the current device type: %{public}@", (uint8_t *)&v88, 0xCu);
          }

        }
      }
      else
      {
        v45 = 1;
      }
      if ((v43 & v45) == 1)
      {
        v74 = 0u;
        v75 = 0u;
        v72 = 0u;
        v73 = 0u;
        v51 = v71;
        v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v72, v85, 16);
        if (v52)
        {
          v53 = *(_QWORD *)v73;
LABEL_58:
          v54 = 0;
          while (1)
          {
            if (*(_QWORD *)v73 != v53)
              objc_enumerationMutation(v51);
            v55 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * v54);
            if (-[BSPluginSpecification matchesPluginBundle:]((uint64_t)v55, v14))
              break;
            if (v52 == ++v54)
            {
              v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v72, v85, 16);
              if (v52)
                goto LABEL_58;
              goto LABEL_64;
            }
          }
          v56 = v55;
          v57 = v56;
          if (v56)
            v58 = (void *)*((_QWORD *)v56 + 3);
          else
            v58 = 0;
          v59 = v58;
          v60 = v59;
          if (v14)
          {
            v61 = objc_msgSend(v59, "copy");
            v62 = (void *)v14[3];
            v14[3] = v61;

          }
          if (v57)
            goto LABEL_73;
        }
        else
        {
LABEL_64:

        }
        BSLogCommon();
        v63 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        {
          LODWORD(v88.receiver) = 138543362;
          *(id *)((char *)&v88.receiver + 4) = v14;
          _os_log_error_impl(&dword_18A184000, v63, OS_LOG_TYPE_ERROR, "Ignoring plugin that does not match any specification: %{public}@", (uint8_t *)&v88, 0xCu);
        }

        v57 = 0;
        v14 = 0;
LABEL_73:

      }
      v10 = obja;
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)isValid
{
  return self->_name && self->_type && self->_specifiedClassName != 0;
}

- (BOOL)isLoaded
{
  return self->_principalClass != 0;
}

- (BOOL)loadPlugin
{
  return -[BSPluginBundle loadPlugin:](self, "loadPlugin:", 0);
}

- (BOOL)loadPlugin:(id)a3
{
  void (**v4)(id, Class);
  NSBundle *bundle;
  _BOOL4 v6;
  NSString *v7;
  void *v8;
  Class v9;
  NSString *requiredClassOrProtocolName;
  NSObject *v11;
  NSObject *v12;
  NSString *specifiedClassName;
  NSString *v14;
  const char *v15;
  NSObject *principalClass;
  void *v17;
  BOOL v18;
  Class v20;
  int v21;
  NSBundle *v22;
  objc_class *v23;
  NSString *v24;
  NSString *v25;
  NSString *v26;
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  NSBundle *v31;
  __int16 v32;
  NSString *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, Class))a3;
  bundle = self->_bundle;
  if (bundle)
  {
    v27 = 0;
    v6 = -[NSBundle loadAndReturnError:](bundle, "loadAndReturnError:", &v27);
    v7 = (NSString *)v27;
    if (!v6)
    {
      BSLogCommon();
      principalClass = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(principalClass, OS_LOG_TYPE_ERROR))
      {
        v22 = self->_bundle;
        *(_DWORD *)buf = 136315650;
        v29 = "-[BSPluginBundle loadPlugin:]";
        v30 = 2114;
        v31 = v22;
        v32 = 2114;
        v33 = v7;
        _os_log_error_impl(&dword_18A184000, principalClass, OS_LOG_TYPE_ERROR, "%s Error loading %{public}@: %{public}@", buf, 0x20u);
      }
LABEL_11:

      goto LABEL_12;
    }
    if (self->_principalClass)
    {
LABEL_12:

      goto LABEL_13;
    }
    v8 = (void *)MEMORY[0x18D769AE0]();
    v9 = NSClassFromString(self->_specifiedClassName);
    requiredClassOrProtocolName = self->_requiredClassOrProtocolName;
    if (!requiredClassOrProtocolName)
      goto LABEL_28;
    NSProtocolFromString(requiredClassOrProtocolName);
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      if ((-[objc_class conformsToProtocol:](v9, "conformsToProtocol:", v11) & 1) == 0)
      {
        BSLogCommon();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          specifiedClassName = self->_specifiedClassName;
          v14 = self->_requiredClassOrProtocolName;
          *(_DWORD *)buf = 136315650;
          v29 = "-[BSPluginBundle loadPlugin:]";
          v30 = 2114;
          v31 = (NSBundle *)specifiedClassName;
          v32 = 2114;
          v33 = v14;
          v15 = "%s Specified principal class \"%{public}@\" does not conform to expected protocol <%{public}@>. Ignoring.";
LABEL_32:
          _os_log_error_impl(&dword_18A184000, v12, OS_LOG_TYPE_ERROR, v15, buf, 0x20u);
          goto LABEL_26;
        }
        goto LABEL_26;
      }
    }
    else
    {
      v20 = NSClassFromString(self->_requiredClassOrProtocolName);
      if (!v20)
      {
LABEL_27:

LABEL_28:
        v21 = 0;
LABEL_29:
        objc_autoreleasePoolPop(v8);
        if (!v21)
          goto LABEL_12;
        v23 = v9;
        principalClass = self->_principalClass;
        self->_principalClass = v23;
        goto LABEL_11;
      }
      if ((-[objc_class isSubclassOfClass:](v9, "isSubclassOfClass:", v20) & 1) == 0)
      {
        BSLogCommon();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v25 = self->_specifiedClassName;
          v26 = self->_requiredClassOrProtocolName;
          *(_DWORD *)buf = 136315650;
          v29 = "-[BSPluginBundle loadPlugin:]";
          v30 = 2114;
          v31 = (NSBundle *)v25;
          v32 = 2114;
          v33 = v26;
          v15 = "%s Specified principal class \"%{public}@\" is not a subclass of %{public}@. Ignoring.";
          goto LABEL_32;
        }
LABEL_26:

        goto LABEL_27;
      }
    }

    if ((-[objc_class conformsToProtocol:](v9, "conformsToProtocol:", &unk_1EDF6B840) & 1) != 0)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[objc_class awakeFromBundle](v9, "awakeFromBundle");
      v21 = 1;
      goto LABEL_29;
    }
    BSLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v24 = self->_specifiedClassName;
      *(_DWORD *)buf = 136315394;
      v29 = "-[BSPluginBundle loadPlugin:]";
      v30 = 2114;
      v31 = (NSBundle *)v24;
      _os_log_error_impl(&dword_18A184000, v11, OS_LOG_TYPE_ERROR, "%s Specified principal class \"%{public}@\" does not conform to <BSPluginBundleController>. Ignoring.", buf, 0x16u);
    }
    goto LABEL_27;
  }
LABEL_13:
  if (v4)
  {
    v17 = (void *)MEMORY[0x18D769AE0]();
    v4[2](v4, self->_principalClass);
    objc_autoreleasePoolPop(v17);
  }
  v18 = -[BSPluginBundle isLoaded](self, "isLoaded");

  return v18;
}

- (NSString)description
{
  return (NSString *)-[BSPluginBundle descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[BSPluginBundle succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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
  id v6;
  id v7;
  id v8;
  id v9;

  +[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_identifier, CFSTR("ID"), 1);
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", self->_name, CFSTR("name"));
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", self->_type, CFSTR("type"));
  v7 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_specifiedClassName, CFSTR("principalClass"), 1);
  v8 = (id)objc_msgSend(v3, "appendBool:withName:", -[BSPluginBundle isValid](self, "isValid"), CFSTR("valid"));
  v9 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[BSPluginBundle isLoaded](self, "isLoaded"), CFSTR("loaded"), 1);
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[BSPluginBundle descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  -[BSPluginBundle succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)type
{
  return self->_type;
}

- (Class)principalClass
{
  return self->_principalClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_principalClass, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_requiredClassOrProtocolName, 0);
  objc_storeStrong((id *)&self->_specifiedClassName, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
}

@end
