@implementation MCMAMFI

- (MCMAMFI)initWithAuditToken:(id *)a3
{
  MCMAMFI *v4;
  MCMAMFI *v5;
  __int128 v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)MCMAMFI;
  v4 = -[MCMAMFI init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v6 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)v4->_auditToken.val = *(_OWORD *)a3->var0;
    *(_OWORD *)&v4->_auditToken.val[4] = v6;
    v4->_lwcrClass = (Class)objc_opt_class();
  }
  return v5;
}

- (BOOL)signaturePassesStrictScrutinyForAppGroupEntitlementWithContainerConfig:(id)a3 teamID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  void *v17;
  int v18;
  NSObject *v19;
  const char *v20;
  void *v21;
  NSObject *v22;
  BOOL v23;
  void *context;
  id v26;
  id v27;
  int pid;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  __int16 v37;
  int *v38;
  uint8_t v39[4];
  int v40;
  _BYTE v41[128];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[MCMAMFI auditToken](self, "auditToken");
  pid = container_audit_token_get_pid();
  v8 = (void *)MEMORY[0x1D17D7010]();
  if (-[MCMAMFI lwcrClass](self, "lwcrClass"))
  {
    -[MCMAMFI _encodedQueriesWithContainerConfig:teamID:](self, "_encodedQueriesWithContainerConfig:teamID:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      context = v8;
      v26 = v7;
      v27 = v6;
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v10 = v9;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v41, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v43;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v43 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
            bzero(v39, 0x404uLL);
            -[MCMAMFI auditToken](self, "auditToken");
            objc_msgSend(v15, "encodedQuery");
            v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            objc_msgSend(v16, "bytes");
            objc_msgSend(v15, "encodedQuery");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "length");
            v18 = amfi_launch_constraint_matches_process();

            container_log_handle_for_category();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              if (v18)
                v20 = "passed";
              else
                v20 = "insufficient for";
              objc_msgSend(v15, "loggingName");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136316162;
              v30 = v20;
              v31 = 2112;
              v32 = v21;
              v33 = 1024;
              v34 = pid;
              v35 = 1024;
              v36 = *(_DWORD *)v39;
              v37 = 2080;
              v38 = &v40;
              _os_log_impl(&dword_1CF807000, v19, OS_LOG_TYPE_DEFAULT, "Signature %s strict scrutiny; test = %@, pid = %d, error = (%d) %s",
                buf,
                0x2Cu);

            }
            if ((v18 & 1) != 0)
            {

              objc_autoreleasePoolPop(context);
              v23 = 1;
              v7 = v26;
              v6 = v27;
              goto LABEL_21;
            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v41, 16);
          if (v12)
            continue;
          break;
        }
      }

      v7 = v26;
      v6 = v27;
      v8 = context;
    }
  }
  objc_autoreleasePoolPop(v8);
  container_log_handle_for_category();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v39 = 67109120;
    v40 = pid;
    _os_log_impl(&dword_1CF807000, v22, OS_LOG_TYPE_DEFAULT, "Requestor's signature did not pass strict scrutiny; pid = %d",
      v39,
      8u);
  }

  v23 = 0;
LABEL_21:

  return v23;
}

- (id)_requirementForTeamID:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  id v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v9 = a3;
  v10 = CFSTR("$optional");
  v8 = CFSTR("team-identifier");
  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_requirementForValidationCategory:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("validation-category");
  v8[0] = a3;
  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_requirementForiOSPlatform
{
  return &unk_1E8CD5498;
}

- (id)_requirementForProfileValidatedEntitlements
{
  return &unk_1E8CD54E8;
}

- (id)_encodeRequirement:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  MCMAMFIEncodedQuery *v11;
  NSObject *v12;
  MCMAMFIEncodedQuery *v13;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v15 = 0;
  -[objc_class withVersion:withConstraintCategory:withRequirements:withError:](-[MCMAMFI lwcrClass](self, "lwcrClass"), "withVersion:withConstraintCategory:withRequirements:withError:", 1, 0, v6, &v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v15;
  if (v8)
  {
    objc_msgSend(v8, "externalRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[MCMAMFIEncodedQuery initWithLoggingName:encodedQuery:]([MCMAMFIEncodedQuery alloc], "initWithLoggingName:encodedQuery:", v7, v10);
  }
  else
  {
    container_log_handle_for_category();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v17 = v6;
      v18 = 2112;
      v19 = v9;
      _os_log_error_impl(&dword_1CF807000, v12, OS_LOG_TYPE_ERROR, "Could not construct LWCR for requirement %@; error = %@",
        buf,
        0x16u);
    }

    v10 = 0;
    v11 = 0;
  }
  v13 = v11;

  return v13;
}

- (id)_encodedQueriesWithContainerConfig:(id)a3 teamID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "honorGroupContainerEntitlementForAppStoreSigned"))
  {
    -[MCMAMFI _requirementForValidationCategory:](self, "_requirementForValidationCategory:", &unk_1E8CD55E0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMAMFI _encodeRequirement:name:](self, "_encodeRequirement:name:", v9, CFSTR("MAS"));
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_20;
    v11 = (void *)v10;
    objc_msgSend(v8, "addObject:", v10);

  }
  if (objc_msgSend(v6, "honorGroupContainerEntitlementForPlatformBinary"))
  {
    -[MCMAMFI _requirementForValidationCategory:](self, "_requirementForValidationCategory:", &unk_1E8CD55F8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMAMFI _encodeRequirement:name:](self, "_encodeRequirement:name:", v9, CFSTR("platform binary"));
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
      goto LABEL_20;
    v13 = (void *)v12;
    objc_msgSend(v8, "addObject:", v12);

  }
  if (objc_msgSend(v6, "honorGroupContainerEntitlementForProfileValidatedEntitlements"))
  {
    -[MCMAMFI _requirementForProfileValidatedEntitlements](self, "_requirementForProfileValidatedEntitlements");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMAMFI _encodeRequirement:name:](self, "_encodeRequirement:name:", v9, CFSTR("profile validated entitlements"));
    v14 = objc_claimAutoreleasedReturnValue();
    if (!v14)
      goto LABEL_20;
    v15 = (void *)v14;
    objc_msgSend(v8, "addObject:", v14);

  }
  if (objc_msgSend(v6, "honorGroupContainerEntitlementForMatchingTeamIDPrefix"))
  {
    -[MCMAMFI _requirementForTeamID:](self, "_requirementForTeamID:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[MCMAMFI _encodeRequirement:name:](self, "_encodeRequirement:name:", v9, CFSTR("team ID prefix"));
      v16 = objc_claimAutoreleasedReturnValue();
      if (!v16)
        goto LABEL_20;
      v17 = (void *)v16;
      objc_msgSend(v8, "addObject:", v16);

    }
  }
  if (!objc_msgSend(v6, "honorGroupContainerEntitlementForiPadAppsOnMac"))
    goto LABEL_18;
  -[MCMAMFI _requirementForiOSPlatform](self, "_requirementForiOSPlatform");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMAMFI _encodeRequirement:name:](self, "_encodeRequirement:name:", v9, CFSTR("iPad app"));
  v18 = objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
LABEL_20:

    v8 = v9;
LABEL_21:

    v8 = 0;
    goto LABEL_22;
  }
  v19 = (void *)v18;
  objc_msgSend(v8, "addObject:", v18);

LABEL_18:
  if (!objc_msgSend(v8, "count"))
    goto LABEL_21;
LABEL_22:

  return v8;
}

- (Class)lwcrClass
{
  return self->_lwcrClass;
}

- (void)setLWCRClass:(Class)a3
{
  self->_lwcrClass = a3;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  __int128 v3;

  v3 = *(_OWORD *)self[1].var0;
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self->var0[4];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

@end
