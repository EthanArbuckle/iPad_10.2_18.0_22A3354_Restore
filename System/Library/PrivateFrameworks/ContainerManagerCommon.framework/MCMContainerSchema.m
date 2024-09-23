@implementation MCMContainerSchema

+ (BOOL)schemaIsUpToDateForIdentifier:(id)a3 containerClass:(unint64_t)a4 currentSchemaVersion:(id)a5 latestSchemaVersion:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  BOOL v14;
  int v16;
  id v17;
  __int16 v18;
  unint64_t v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  MCMContainerSchemaDefinitionForClass(a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "compare:", v12))
  {
    if (objc_msgSend(v10, "compare:", v12) != 1)
    {
      v14 = 0;
      if (!a6)
        goto LABEL_8;
      goto LABEL_7;
    }
    container_log_handle_for_category();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v16 = 138413058;
      v17 = v9;
      v18 = 2048;
      v19 = a4;
      v20 = 2112;
      v21 = v10;
      v22 = 2112;
      v23 = v12;
      _os_log_error_impl(&dword_1CF807000, v13, OS_LOG_TYPE_ERROR, "[%@(%llu)] Current schema version (%@) is newer than the latest (%@), ignoring.", (uint8_t *)&v16, 0x2Au);
    }

  }
  v14 = 1;
  if (a6)
LABEL_7:
    *a6 = objc_retainAutorelease(v12);
LABEL_8:

  return v14;
}

- (MCMContainerSchema)initWithMetadata:(id)a3 finalContainerPath:(id)a4 dataProtectionClass:(int)a5 libraryRepair:(id)a6
{
  id v11;
  id v12;
  id v13;
  MCMContainerSchema *v14;
  MCMContainerSchema *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  MCMContainerSchemaContext *context;
  uint64_t v25;
  unsigned int v26;
  uint64_t v27;
  void *v28;
  objc_super v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v29.receiver = self;
  v29.super_class = (Class)MCMContainerSchema;
  v14 = -[MCMContainerSchema init](&v29, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_metadata, a3);
    objc_msgSend(v11, "containerPath");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v11, "containerClass");
    objc_msgSend(v11, "containerPath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v16, "schemaPOSIXMode");

    objc_msgSend(v11, "containerPath");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "schemaPOSIXOwner");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCMPOSIXUser currentPOSIXUser](MCMPOSIXUser, "currentPOSIXUser");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "homeDirectoryURL");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v25) = a5;
    +[MCMContainerSchemaContext contextWithHomeDirectoryURL:containerPath:finalContainerPath:POSIXMode:POSIXOwner:containerClass:dataProtectionClass:libraryRepair:identifier:](MCMContainerSchemaContext, "contextWithHomeDirectoryURL:containerPath:finalContainerPath:POSIXMode:POSIXOwner:containerClass:dataProtectionClass:libraryRepair:identifier:", v21, v28, v12, v26, v18, v27, v25, v13, v19);
    v22 = objc_claimAutoreleasedReturnValue();
    context = v15->_context;
    v15->_context = (MCMContainerSchemaContext *)v22;

  }
  return v15;
}

- (BOOL)writeSchemaFromVersion:(id)a3 toTargetVersion:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  unint64_t v18;
  id v19;
  void *v20;
  _BOOL4 v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  void *v34;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  id *v49;
  id *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  os_signpost_id_t spid;
  void *spida;
  id v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  uint64_t v66;
  __int16 v67;
  uint64_t v68;
  __int16 v69;
  id v70;
  __int16 v71;
  id v72;
  __int16 v73;
  uint64_t v74;
  __int16 v75;
  id v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[MCMContainerSchema metadata](self, "metadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerSchema context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerSchema _actionsFromVersion:toTargetVersion:context:](self, "_actionsFromVersion:toTargetVersion:context:", v8, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    v15 = os_signpost_id_make_with_pointer(v13, self);

    container_log_handle_for_category();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    spid = v15;
    v18 = v15 - 1;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      objc_msgSend(v10, "identifier");
      v19 = v8;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138477827;
      v60 = v20;
      _os_signpost_emit_with_name_impl(&dword_1CF807000, v17, OS_SIGNPOST_INTERVAL_BEGIN, spid, "SchemaUpdate", " identifier=%{private, signpost.description:attribute}@ ", buf, 0xCu);

      v8 = v19;
    }

    v58 = 0;
    v21 = -[MCMContainerSchema _executeActions:error:](self, "_executeActions:error:", v12, &v58);
    v22 = v58;
    container_log_handle_for_category();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v21)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v49 = a5;
        v55 = v8;
        objc_msgSend(v10, "uuid");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "containerPath");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "containerPathIdentifier");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "identifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v10, "containerClass");
        v26 = objc_msgSend(v10, "conformsToProtocol:", &unk_1EFBC2D68);
        if (v26)
        {
          objc_msgSend(v10, "fsNode");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v44, "inode");
        }
        else
        {
          v27 = 0;
        }
        v31 = objc_msgSend(v12, "count");
        *(_DWORD *)buf = 138545154;
        v60 = v53;
        v61 = 2114;
        v62 = v51;
        v63 = 2112;
        v64 = v25;
        v65 = 2050;
        v66 = v45;
        v67 = 2048;
        v68 = v27;
        v69 = 2114;
        v70 = v55;
        v71 = 2114;
        v72 = v9;
        v73 = 2050;
        v74 = v31;
        _os_log_impl(&dword_1CF807000, v24, OS_LOG_TYPE_DEFAULT, "[u %{public}@:p %{public}@:c %@(%{public}llu):i%llu] Successfully updated schema from (%{public}@) → (%{public}@), actions count = %{public}lu", buf, 0x52u);
        if (v26)

        v32 = v47;
LABEL_18:

        v8 = v55;
        a5 = v49;
      }
    }
    else if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v49 = a5;
      v55 = v8;
      objc_msgSend(v10, "uuid");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "containerPath");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "containerPathIdentifier");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "identifier");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v10, "containerClass");
      v29 = objc_msgSend(v10, "conformsToProtocol:", &unk_1EFBC2D68);
      if (v29)
      {
        objc_msgSend(v10, "fsNode");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v44, "inode");
      }
      else
      {
        v30 = 0;
      }
      v43 = objc_msgSend(v12, "count");
      *(_DWORD *)buf = 138545410;
      v60 = v53;
      v61 = 2114;
      v62 = v52;
      v63 = 2112;
      v64 = v48;
      v65 = 2050;
      v66 = v28;
      v67 = 2048;
      v68 = v30;
      v69 = 2114;
      v70 = v55;
      v71 = 2114;
      v72 = v9;
      v73 = 2050;
      v74 = v43;
      v75 = 2114;
      v76 = v22;
      _os_log_error_impl(&dword_1CF807000, v24, OS_LOG_TYPE_ERROR, "[u %{public}@:p %{public}@:c %@(%{public}llu):i%llu] Could not update schema from (%{public}@) → (%{public}@), actions count = %{public}lu, error = %{public}@", buf, 0x5Cu);
      if (v29)

      v32 = v46;
      goto LABEL_18;
    }

    container_log_handle_for_category();
    v33 = objc_claimAutoreleasedReturnValue();
    v14 = v33;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
    {
      objc_msgSend(v10, "identifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138477827;
      v60 = v34;
      _os_signpost_emit_with_name_impl(&dword_1CF807000, v14, OS_SIGNPOST_INTERVAL_END, spid, "SchemaUpdate", " identifier=%{private, signpost.description:attribute}@ ", buf, 0xCu);

    }
    goto LABEL_22;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v50 = a5;
    v36 = v8;
    objc_msgSend(v10, "uuid");
    spida = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "containerPath");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "containerPathIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v10, "containerClass");
    v41 = objc_msgSend(v10, "conformsToProtocol:", &unk_1EFBC2D68);
    if (v41)
    {
      objc_msgSend(v10, "fsNode");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v54, "inode");
    }
    else
    {
      v42 = 0;
    }
    *(_DWORD *)buf = 138544898;
    v60 = spida;
    v61 = 2114;
    v62 = v38;
    v63 = 2112;
    v64 = v39;
    v65 = 2050;
    v66 = v40;
    v67 = 2048;
    v68 = v42;
    v69 = 2114;
    v70 = v36;
    v71 = 2114;
    v72 = v9;
    _os_log_error_impl(&dword_1CF807000, v14, OS_LOG_TYPE_ERROR, "[u %{public}@:p %{public}@:c %@(%{public}llu):i%llu] Could not update schema from (%{public}@) → (%{public}@), no actions available", buf, 0x48u);
    if (v41)

    LOBYTE(v21) = 0;
    v22 = 0;
    v8 = v36;
    a5 = v50;
  }
  else
  {
    LOBYTE(v21) = 0;
    v22 = 0;
  }
LABEL_22:

  if (a5 && !v21)
    *a5 = objc_retainAutorelease(v22);

  return v21;
}

- (BOOL)writeSchemaToTargetVersion:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[MCMContainerSchema metadata](self, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "schemaVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[MCMContainerSchema writeSchemaFromVersion:toTargetVersion:error:](self, "writeSchemaFromVersion:toTargetVersion:error:", v8, v6, a4);

  return (char)a4;
}

- (id)_actionArgsAfterInterpolationOnActionArgs:(id)a3 replacements:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  uint64_t v30;
  _BYTE v31[128];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v29 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, v36, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v38;
    v27 = *(_QWORD *)v38;
    v28 = v6;
    do
    {
      v10 = 0;
      v30 = v8;
      do
      {
        if (*(_QWORD *)v38 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v10);
        objc_msgSend(v11, "string");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "pathComponents");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v13, "count") && (objc_msgSend(v13, "containsObject:", CFSTR("..")) & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            objc_msgSend(v11, "string");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = 0u;
            v33 = 0u;
            v34 = 0u;
            v35 = 0u;
            v15 = v29;
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v31, 16);
            if (v16)
            {
              v17 = v16;
              v18 = *(_QWORD *)v33;
              do
              {
                v19 = 0;
                v20 = v14;
                do
                {
                  if (*(_QWORD *)v33 != v18)
                    objc_enumerationMutation(v15);
                  v21 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v19);
                  objc_msgSend(v15, "objectForKeyedSubscript:", v21);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v20, "stringByReplacingOccurrencesOfString:withString:options:range:", v21, v22, 1, 0, objc_msgSend(v20, "length"));
                  v14 = (void *)objc_claimAutoreleasedReturnValue();

                  ++v19;
                  v20 = v14;
                }
                while (v17 != v19);
                v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v31, 16);
              }
              while (v17);
            }

            v23 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithString:", v14);
            if (v23)
              objc_msgSend(v26, "addObject:", v23);

            v9 = v27;
            v6 = v28;
            v8 = v30;
          }
          else
          {
            objc_msgSend(v26, "addObject:", v11);
          }
        }

        ++v10;
      }
      while (v10 != v8);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, v36, 16);
    }
    while (v8);
  }

  v24 = (void *)objc_msgSend(v26, "copy");
  return v24;
}

- (id)_interpolationReplacements
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  -[MCMContainerSchema metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containerPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "destinationContainerPath");
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  objc_msgSend(v3, "containerPathIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = CFSTR("${RealHome}");
  +[MCMPOSIXUser currentPOSIXUser](MCMPOSIXUser, "currentPOSIXUser");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "homeDirectoryURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v13[1] = CFSTR("${BundleId}");
  objc_msgSend(v2, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v9;
  v13[2] = CFSTR("${SigningId}");
  objc_msgSend(v2, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = CFSTR("${ContainerId}");
  v14[2] = v10;
  v14[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_actionsFromVersion:(id)a3 toTargetVersion:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v38;
  void *v39;
  void *v40;
  MCMContainerSchema *v41;
  uint64_t v42;
  void *v43;
  int v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  int v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  unint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *context;
  void *contexta;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  MCMContainerSchema *v76;
  void *v77;
  id v78;
  uint8_t buf[4];
  void *v80;
  __int16 v81;
  void *v82;
  __int16 v83;
  void *v84;
  __int16 v85;
  uint64_t v86;
  __int16 v87;
  uint64_t v88;
  __int16 v89;
  id v90;
  __int16 v91;
  uint64_t v92;
  __int16 v93;
  id v94;
  _BYTE v95[128];
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1D17D7010]();
  v77 = v10;
  MCMContainerSchemaDefinitionForClass(objc_msgSend(v10, "containerClass"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v9, "unsignedIntegerValue");
  v76 = self;
  if (v14 > objc_msgSend(v13, "count"))
  {
    container_log_handle_for_category();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      contexta = v12;
      v71 = v13;
      v75 = v11;
      -[MCMContainerSchema metadata](self, "metadata");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "uuid");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMContainerSchema metadata](self, "metadata");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "containerPath");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "containerPathIdentifier");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMContainerSchema metadata](self, "metadata");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "identifier");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMContainerSchema metadata](self, "metadata");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = self;
      v42 = objc_msgSend(v40, "containerClass");
      -[MCMContainerSchema metadata](v41, "metadata");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "conformsToProtocol:", &unk_1EFBC2D68);
      if (v44)
      {
        -[MCMContainerSchema metadata](v41, "metadata");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "fsNode");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v56, "inode");
      }
      else
      {
        v45 = 0;
      }
      *(_DWORD *)buf = 138544898;
      v80 = v73;
      v81 = 2114;
      v82 = v66;
      v83 = 2112;
      v84 = v39;
      v85 = 2050;
      v86 = v42;
      v87 = 2048;
      v88 = v45;
      v89 = 2112;
      v90 = v9;
      v91 = 2048;
      v92 = objc_msgSend(v71, "count");
      _os_log_error_impl(&dword_1CF807000, v15, OS_LOG_TYPE_ERROR, "[u %{public}@:p %{public}@:c %@(%{public}llu):i%llu] Trying to target a version [%@] higher than available [%lu], capping to max", buf, 0x48u);
      if (v44)
      {

      }
      v11 = v75;
      self = v76;
      v12 = contexta;
      v13 = v71;
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
    v16 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v16;
  }
  -[MCMContainerSchema _interpolationReplacements](self, "_interpolationReplacements");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v8, "unsignedIntegerValue");
  if (v18 < objc_msgSend(v9, "unsignedIntegerValue"))
  {
    v19 = objc_msgSend(v8, "unsignedIntegerValue");
    if (v19 < objc_msgSend(v9, "unsignedIntegerValue"))
    {
      v65 = v9;
      v67 = v8;
      v74 = v11;
      context = v12;
      v70 = v13;
      do
      {
        v63 = v19;
        objc_msgSend(v13, "objectAtIndexedSubscript:", v19);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "objectForKeyedSubscript:", CFSTR("script"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v96 = 0u;
        v97 = 0u;
        v98 = 0u;
        v99 = 0u;
        v21 = v20;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v96, v95, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v97;
          do
          {
            v25 = 0;
            do
            {
              if (*(_QWORD *)v97 != v24)
                objc_enumerationMutation(v21);
              v26 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * v25);
              objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "string");
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v26, "subarrayWithRange:", 1, objc_msgSend(v26, "count") - 1);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              -[MCMContainerSchema _actionArgsAfterInterpolationOnActionArgs:replacements:](self, "_actionArgsAfterInterpolationOnActionArgs:replacements:", v29, v17);
              v30 = (void *)objc_claimAutoreleasedReturnValue();

              v78 = 0;
              +[MCMContainerSchemaActionBase actionWithName:arguments:context:error:](MCMContainerSchemaActionBase, "actionWithName:arguments:context:error:", v28, v30, v77, &v78);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = v78;
              if (v31)
              {
                objc_msgSend(v74, "addObject:", v31);
              }
              else
              {
                container_log_handle_for_category();
                v33 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
                {
                  -[MCMContainerSchema metadata](v76, "metadata");
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v55, "uuid");
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  -[MCMContainerSchema metadata](v76, "metadata");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v54, "containerPath");
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "containerPathIdentifier");
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  -[MCMContainerSchema metadata](v76, "metadata");
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v52, "identifier");
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  -[MCMContainerSchema metadata](v76, "metadata");
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  v48 = objc_msgSend(v51, "containerClass");
                  -[MCMContainerSchema metadata](v76, "metadata");
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  v49 = objc_msgSend(v50, "conformsToProtocol:", &unk_1EFBC2D68);
                  if (v49)
                  {
                    -[MCMContainerSchema metadata](v76, "metadata");
                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v47, "fsNode");
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    v34 = objc_msgSend(v46, "inode");
                  }
                  else
                  {
                    v34 = 0;
                  }
                  *(_DWORD *)buf = 138545154;
                  v80 = v61;
                  v81 = 2114;
                  v82 = v59;
                  v83 = 2112;
                  v84 = v58;
                  v85 = 2050;
                  v86 = v48;
                  v87 = 2048;
                  v88 = v34;
                  v89 = 2112;
                  v90 = v28;
                  v91 = 2112;
                  v92 = (uint64_t)v30;
                  v93 = 2112;
                  v94 = v32;
                  _os_log_fault_impl(&dword_1CF807000, v33, OS_LOG_TYPE_FAULT, "[u %{public}@:p %{public}@:c %@(%{public}llu):i%llu] Could not form action [%@] with args: %@, error = %@", buf, 0x52u);
                  if (v49)
                  {

                  }
                }

              }
              if (!v31)
              {

                objc_autoreleasePoolPop(context);
                v36 = 0;
                v9 = v65;
                v8 = v67;
                v11 = v74;
                goto LABEL_29;
              }
              ++v25;
              self = v76;
            }
            while (v23 != v25);
            v35 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v96, v95, 16);
            v23 = v35;
          }
          while (v35);
        }

        v9 = v65;
        v19 = v63 + 1;
        v8 = v67;
        v12 = context;
        v11 = v74;
        v13 = v70;
      }
      while (v63 + 1 < objc_msgSend(v65, "unsignedIntegerValue"));
    }
  }

  objc_autoreleasePoolPop(v12);
  v36 = (void *)objc_msgSend(v11, "copy");
LABEL_29:

  return v36;
}

- (BOOL)_executeActions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  MCMContainerSchema *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  NSObject *v18;
  BOOL v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id *v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  id v50;
  _BYTE v51[128];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17D7010]();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v52, v51, 16);
  if (v9)
  {
    v10 = v9;
    v35 = a4;
    v11 = self;
    v12 = 0;
    v13 = *(_QWORD *)v53;
    while (2)
    {
      v14 = 0;
      v15 = v12;
      do
      {
        if (*(_QWORD *)v53 != v13)
          objc_enumerationMutation(v8);
        v16 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v14);
        v36 = v15;
        v17 = objc_msgSend(v16, "performWithError:", &v36);
        v12 = v36;

        if ((v17 & 1) == 0)
        {
          container_log_handle_for_category();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            v21 = v11;
            -[MCMContainerSchema metadata](v11, "metadata");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "uuid");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "metadata");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "containerPath");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "containerPathIdentifier");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "metadata");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "identifier");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "metadata");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v23, "containerClass");
            objc_msgSend(v21, "metadata");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "conformsToProtocol:", &unk_1EFBC2D68);
            if (v25)
            {
              objc_msgSend(v21, "metadata");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "fsNode");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_msgSend(v21, "inode");
            }
            else
            {
              v26 = 0;
            }
            *(_DWORD *)buf = 138544898;
            v38 = v34;
            v39 = 2114;
            v40 = v33;
            v41 = 2112;
            v42 = v32;
            v43 = 2050;
            v44 = v28;
            v45 = 2048;
            v46 = v26;
            v47 = 2112;
            v48 = v16;
            v49 = 2112;
            v50 = v12;
            _os_log_error_impl(&dword_1CF807000, v18, OS_LOG_TYPE_ERROR, "[u %{public}@:p %{public}@:c %@(%{public}llu):i%llu] Action [%@] failed; error = %@",
              buf,
              0x48u);
            if (v25)
            {

            }
          }

          objc_autoreleasePoolPop(v7);
          if (v35)
          {
            v12 = objc_retainAutorelease(v12);
            v19 = 0;
            *v35 = v12;
          }
          else
          {
            v19 = 0;
          }
          goto LABEL_16;
        }
        ++v14;
        v15 = v12;
      }
      while (v10 != v14);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v52, v51, 16);
      if (v10)
        continue;
      break;
    }
  }
  else
  {
    v12 = 0;
  }

  objc_autoreleasePoolPop(v7);
  v19 = 1;
LABEL_16:

  return v19;
}

- (MCMMetadataMinimal)metadata
{
  return self->_metadata;
}

- (MCMContainerSchemaContext)context
{
  return self->_context;
}

- (NSNumber)latestSchemaVersion
{
  return self->_latestSchemaVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestSchemaVersion, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

+ (id)containerSchemaWithMetadata:(id)a3 finalContainerPath:(id)a4 dataProtectionClass:(int)a5 libraryRepair:(id)a6
{
  uint64_t v6;
  id v10;
  id v11;
  id v12;
  void *v13;

  v6 = *(_QWORD *)&a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMetadata:finalContainerPath:dataProtectionClass:libraryRepair:", v12, v11, v6, v10);

  return v13;
}

@end
