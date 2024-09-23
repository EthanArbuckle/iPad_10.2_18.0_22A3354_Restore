char **_os_feature_search_paths()
{
  return _os_feature_search_paths_paths;
}

const char *_os_feature_internal_search_path()
{
  return "/System/AppleInternal/Library/FeatureFlags";
}

uint64_t isBooleanYes(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("true")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("yes")) & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("1"));
  }

  return v2;
}

uint64_t isBooleanNo(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("false")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("no")) & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("0"));
  }

  return v2;
}

void ffConfigurationInitOnce()
{
  id v0;
  void *v1;

  v0 = -[FFConfiguration initPrivate]([FFConfiguration alloc], "initPrivate");
  v1 = (void *)instance;
  instance = (uint64_t)v0;

}

uint64_t FFConfigurationValidateProfilePayload(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t m;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  uint64_t n;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v55;
  uint64_t v56;
  id v57;
  id v58;
  uint64_t v59;
  void *v60;
  id v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  id v68;
  id v69;
  _QWORD *v70;
  _QWORD *v71;
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
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Features"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a2)
        *a2 = objc_retainAutorelease(v4);

      v53 = 0;
      goto LABEL_176;
    }
    v94 = 0u;
    v95 = 0u;
    v92 = 0u;
    v93 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v92, v101, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v93;
      v70 = a2;
      v59 = *(_QWORD *)v93;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v93 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (v70)
            {
              v53 = 0;
              *v70 = objc_retainAutorelease(v4);
              goto LABEL_175;
            }
LABEL_132:
            v53 = 0;
            goto LABEL_175;
          }
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Domain"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v12
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
            || !+[FFConfiguration isValidName:](FFConfiguration, "isValidName:", v12))
          {
            if (v70)
              *v70 = objc_retainAutorelease(v4);
            goto LABEL_131;
          }
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Features"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            if (v70)
              *v70 = objc_retainAutorelease(v4);

LABEL_131:
            goto LABEL_132;
          }
          v90 = 0u;
          v91 = 0u;
          v88 = 0u;
          v89 = 0u;
          v14 = v13;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v88, v100, 16);
          if (!v15)
            goto LABEL_27;
          v16 = v15;
          v17 = *(_QWORD *)v89;
          v61 = v4;
          v63 = v5;
          v67 = v6;
          do
          {
            v18 = v3;
            for (j = 0; j != v16; ++j)
            {
              if (*(_QWORD *)v89 != v17)
                objc_enumerationMutation(v14);
              v20 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v3 = v18;
                v4 = v61;
                v5 = v63;
                if (v70)
                  *v70 = objc_retainAutorelease(v61);
                goto LABEL_125;
              }
              objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("FeatureName"));
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v21 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
              {
                v3 = v18;
                v4 = v61;
                v5 = v63;
                if (v70)
                  *v70 = objc_retainAutorelease(v61);

                goto LABEL_125;
              }
              if (!+[FFConfiguration isValidName:](FFConfiguration, "isValidName:", v21))
              {
                v3 = v18;
                v4 = v61;
                if (v70)
                  *v70 = objc_retainAutorelease(v61);
LABEL_124:

                v5 = v63;
LABEL_125:

                v53 = 0;
                v6 = v67;
                goto LABEL_175;
              }
              objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("Enabled"));
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v22 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
              {
                v3 = v18;
                v4 = v61;
                if (v70)
                  *v70 = objc_retainAutorelease(v61);

                goto LABEL_124;
              }

            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v88, v100, 16);
            v3 = v18;
            v4 = v61;
            v5 = v63;
            v6 = v67;
          }
          while (v16);
LABEL_27:

          v9 = v59;
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v92, v101, 16);
        a2 = v70;
      }
      while (v8);
    }

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Disclosures"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_47;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a2)
    {
      v53 = 0;
      *a2 = objc_retainAutorelease(v4);
      goto LABEL_175;
    }
    goto LABEL_132;
  }
  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  v23 = v6;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v84, v99, 16);
  if (!v24)
    goto LABEL_46;
  v25 = v24;
  v26 = *(_QWORD *)v85;
  v64 = v5;
  v68 = v6;
  do
  {
    for (k = 0; k != v25; ++k)
    {
      if (*(_QWORD *)v85 != v26)
        objc_enumerationMutation(v23);
      v28 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * k);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a2)
        {
          v53 = 0;
          *a2 = objc_retainAutorelease(v4);
LABEL_143:
          v5 = v64;
          v6 = v68;
          goto LABEL_174;
        }
LABEL_142:
        v53 = 0;
        goto LABEL_143;
      }
      objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("DisclosureName"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v29 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        if (a2)
          *a2 = objc_retainAutorelease(v4);
LABEL_141:

        goto LABEL_142;
      }
      if (!+[FFConfiguration isValidDisclosureName:](FFConfiguration, "isValidDisclosureName:", v29))
      {
        v6 = v68;
        if (a2)
          *a2 = objc_retainAutorelease(v4);
        goto LABEL_137;
      }
      objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("Disclosed"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v30 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        v6 = v68;
        if (a2)
          *a2 = objc_retainAutorelease(v4);

LABEL_137:
        v53 = 0;
        v5 = v64;
        goto LABEL_174;
      }
      if ((objc_msgSend(v30, "BOOLValue") & 1) == 0)
      {
        if (a2)
          *a2 = objc_retainAutorelease(v4);

        goto LABEL_141;
      }

    }
    v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v84, v99, 16);
    v5 = v64;
    v6 = v68;
  }
  while (v25);
LABEL_46:

LABEL_47:
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("FeatureSets"));
  v23 = (id)objc_claimAutoreleasedReturnValue();
  if (!v23)
    goto LABEL_77;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v53 = 0;
    if (a2)
      *a2 = objc_retainAutorelease(v4);
    goto LABEL_174;
  }
  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v31 = v23;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v80, v98, 16);
  if (!v32)
    goto LABEL_76;
  v33 = *(_QWORD *)v81;
  v65 = v5;
  v69 = v6;
  v60 = v31;
  v55 = *(_QWORD *)v81;
  while (2)
  {
    v34 = 0;
    v56 = v32;
    while (2)
    {
      if (*(_QWORD *)v81 != v33)
        objc_enumerationMutation(v31);
      v35 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * v34);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_97;
      objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("FeatureSetGroupName"));
      v36 = (id)objc_claimAutoreleasedReturnValue();
      if (!v36
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
        || !+[FFConfiguration isValidName:](FFConfiguration, "isValidName:", v36))
      {
        if (a2)
          *a2 = objc_retainAutorelease(v4);
LABEL_171:

        goto LABEL_172;
      }
      objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("FeatureSets"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v37 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        if (a2)
          *a2 = objc_retainAutorelease(v4);
LABEL_170:

        goto LABEL_171;
      }
      v78 = 0u;
      v79 = 0u;
      v76 = 0u;
      v77 = 0u;
      v38 = v37;
      v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v76, v97, 16);
      if (v39)
      {
        v40 = v39;
        v41 = *(_QWORD *)v77;
        v71 = a2;
        v57 = v23;
        while (2)
        {
          for (m = 0; m != v40; ++m)
          {
            if (*(_QWORD *)v77 != v41)
              objc_enumerationMutation(v38);
            v43 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * m);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v5 = v65;
              v31 = v60;
              if (v71)
                *v71 = objc_retainAutorelease(v4);
              goto LABEL_148;
            }
            objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("FeatureSetName"));
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v44
              || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
              || !+[FFConfiguration isValidName:](FFConfiguration, "isValidName:", v44))
            {
              v5 = v65;
              v31 = v60;
              if (v71)
                *v71 = objc_retainAutorelease(v4);
LABEL_147:

LABEL_148:
              v53 = 0;
              v6 = v69;
              v23 = v57;
              goto LABEL_173;
            }
            objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("Enabled"));
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v45 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              v5 = v65;
              v31 = v60;
              if (v71)
                *v71 = objc_retainAutorelease(v4);

              goto LABEL_147;
            }
            if ((objc_msgSend(v45, "BOOLValue") & 1) == 0)
            {
              if (v71)
                *v71 = objc_retainAutorelease(v4);

              v5 = v65;
              v31 = v60;
              goto LABEL_148;
            }

          }
          v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v76, v97, 16);
          a2 = v71;
          v23 = v57;
          if (v40)
            continue;
          break;
        }
      }

      ++v34;
      v33 = v55;
      v5 = v65;
      v6 = v69;
      v31 = v60;
      if (v34 != v56)
        continue;
      break;
    }
    v32 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v80, v98, 16);
    if (v32)
      continue;
    break;
  }
LABEL_76:

LABEL_77:
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Subscriptions"), v55);
  v31 = (id)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v66 = v5;
      v74 = 0u;
      v75 = 0u;
      v72 = 0u;
      v73 = 0u;
      v36 = v31;
      v46 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v72, v96, 16);
      if (v46)
      {
        v47 = v46;
        v48 = *(_QWORD *)v73;
        v62 = v4;
        v58 = v23;
        while (2)
        {
          v49 = v3;
          for (n = 0; n != v47; ++n)
          {
            if (*(_QWORD *)v73 != v48)
              objc_enumerationMutation(v36);
            v51 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * n);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v3 = v49;
              v4 = v62;
              v5 = v66;
              v23 = v58;
              if (a2)
                *a2 = objc_retainAutorelease(v62);
              goto LABEL_171;
            }
            objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("SubscriptionClass"));
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v37 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              v3 = v49;
              v4 = v62;
              v5 = v66;
              v23 = v58;
              if (a2)
                *a2 = objc_retainAutorelease(v62);
              goto LABEL_170;
            }
            if ((objc_msgSend(v37, "isEqualToString:", CFSTR("FFMinimumPhaseInReleaseSubscription")) & 1) == 0)
            {
              v3 = v49;
              v4 = v62;
              v5 = v66;
              if (a2)
                *a2 = objc_retainAutorelease(v62);
              goto LABEL_167;
            }
            objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("SubscriptionContents"));
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v52 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              v3 = v49;
              v4 = v62;
              v5 = v66;
              if (a2)
                *a2 = objc_retainAutorelease(v62);

LABEL_167:
              v23 = v58;
              goto LABEL_171;
            }

          }
          v47 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v72, v96, 16);
          v3 = v49;
          v4 = v62;
          v23 = v58;
          if (v47)
            continue;
          break;
        }
      }

      v5 = v66;
      goto LABEL_93;
    }
LABEL_97:
    if (a2)
    {
      v53 = 0;
      *a2 = objc_retainAutorelease(v4);
    }
    else
    {
LABEL_172:
      v53 = 0;
    }
  }
  else
  {
LABEL_93:
    v53 = 1;
    if (!v5 && !v6 && !v23 && !v31)
      goto LABEL_97;
  }
LABEL_173:

LABEL_174:
LABEL_175:

LABEL_176:
  return v53;
}

uint64_t _os_feature_enabled_is_safe_mode()
{
  os_parse_boot_arg_int();
  return 0;
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1E0C80B50](*(_QWORD *)&a1, a2);
}

uint64_t _os_once()
{
  return MEMORY[0x1E0C810C0]();
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

uint64_t os_parse_boot_arg_int()
{
  return MEMORY[0x1E0C848F8]();
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84990](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

