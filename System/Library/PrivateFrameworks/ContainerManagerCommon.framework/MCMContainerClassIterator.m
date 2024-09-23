@implementation MCMContainerClassIterator

- (MCMContainerClassIterator)initWithStaticConfig:(id)a3
{
  return -[MCMContainerClassIterator initWithStaticConfig:userIdentityCache:](self, "initWithStaticConfig:userIdentityCache:", a3, 0);
}

- (void)selectWithFlags:(unint64_t)a3 iterator:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__MCMContainerClassIterator_selectWithFlags_iterator___block_invoke;
  v8[3] = &unk_1E8CB5AC0;
  v9 = v6;
  v7 = v6;
  -[MCMContainerClassIterator _selectWithFlags:includeUserIdentities:iterator:](self, "_selectWithFlags:includeUserIdentities:iterator:", a3, 0, v8);

}

- (void)selectWithIterator:(id)a3
{
  -[MCMContainerClassIterator selectWithFlags:iterator:](self, "selectWithFlags:iterator:", 0, a3);
}

- (void)selectUserDataWithIterator:(id)a3
{
  -[MCMContainerClassIterator selectWithFlags:iterator:](self, "selectWithFlags:iterator:", 0x400000000, a3);
}

- (void)selectRemoteWithIterator:(id)a3
{
  -[MCMContainerClassIterator selectWithFlags:iterator:](self, "selectWithFlags:iterator:", 0x200000000, a3);
}

- (void)selectUserWithIterator:(id)a3
{
  -[MCMContainerClassIterator selectWithFlags:iterator:](self, "selectWithFlags:iterator:", 0x800000000, a3);
}

- (void)selectSystemWithIterator:(id)a3
{
  -[MCMContainerClassIterator selectWithFlags:iterator:](self, "selectWithFlags:iterator:", 0x1000000000, a3);
}

- (void)selectBundleWithIterator:(id)a3
{
  -[MCMContainerClassIterator selectWithFlags:iterator:](self, "selectWithFlags:iterator:", 0x2000000000, a3);
}

- (void)selectGlobalWithIterator:(id)a3
{
  -[MCMContainerClassIterator selectWithFlags:iterator:](self, "selectWithFlags:iterator:", 0x20000000000, a3);
}

- (void)selectDataProtectedWithIterator:(id)a3
{
  -[MCMContainerClassIterator selectWithFlags:iterator:](self, "selectWithFlags:iterator:", 0x4000000000, a3);
}

- (void)selectAutorollingWithIterator:(id)a3
{
  -[MCMContainerClassIterator selectWithFlags:iterator:](self, "selectWithFlags:iterator:", 0x8000000000, a3);
}

- (void)_selectWithFlags:(unint64_t)a3 includeUserIdentities:(BOOL)a4 iterator:(id)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  void (**v24)(_QWORD, _QWORD, _QWORD);
  MCMContainerClassIterator *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  MCMContainerClassIterator *v29;
  void *v30;
  MCMContainerClassIterator *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  MCMContainerClassIterator *v38;
  id v39;
  _BOOL4 v40;
  id obj;
  _QWORD v42[4];
  id v43;
  unint64_t v44;
  _BYTE v45[128];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;

  v5 = a4;
  v55 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (!v5
    || (-[MCMContainerClassIterator userIdentityCache](self, "userIdentityCache"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    -[MCMContainerClassIterator staticConfig](self, "staticConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "containerConfigMap");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v11;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v51, v50, 16);
    if (!v12)
      goto LABEL_63;
    v13 = v12;
    v14 = *(_QWORD *)v52;
    v40 = v5;
    v38 = self;
    v39 = v8;
    while (1)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v52 != v14)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
        -[MCMContainerClassIterator staticConfig](self, "staticConfig", v38, v39);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "containerConfigMap");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", v16);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if ((a3 & 0x10000) != 0 || objc_msgSend(v19, "supportedOnPlatform"))
        {
          v20 = objc_msgSend(v19, "containerClass");
          if ((a3 & 0x20000) != 0 || (v21 = objc_msgSend(v19, "containerClass"), v21 == container_class_normalized()))
          {
            if ((a3 & 0xB0000) != 0
              || (objc_msgSend(v19, "handledDirectly") & 1) != 0
              || objc_msgSend(v19, "handledByProxy"))
            {
              if ((a3 & 0x200040000) != 0)
              {
                if ((a3 & 0x200000000) != 0 && !objc_msgSend(v19, "handledByProxy"))
                  goto LABEL_61;
              }
              else if ((objc_msgSend(v19, "handledByProxy") & 1) != 0)
              {
                goto LABEL_61;
              }
              if (((a3 & 0x400000000) == 0 || v20 <= 0xB && ((1 << v20) & 0xED4) != 0)
                && ((a3 & 0x800000000) == 0 || v20 <= 0xE && ((1 << v20) & 0x4ED4) != 0))
              {
                v22 = v20 & 0xFFFFFFFFFFFFFFFELL;
                if (((a3 & 0x1000000000) == 0 || v22 == 12)
                  && ((a3 & 0x2000000000) == 0 || v20 <= 0xE && ((1 << v20) & 0x412A) != 0)
                  && ((a3 & 0x4000000000) == 0 || v20 == 4 || v20 == 2)
                  && ((a3 & 0x20000000000) == 0 || v22 == 12 || v20 <= 8 && ((1 << v20) & 0x12A) != 0)
                  && ((a3 & 0x8000000000) == 0 || objc_msgSend(v19, "autoRollsPathOnBuildUpdate"))
                  && ((a3 & 0x10000000000) == 0
                   || objc_msgSend(v19, "migrateCodeSignInfoFromMetadataToDB")))
                {
                  v42[0] = MEMORY[0x1E0C809B0];
                  v42[1] = 3221225472;
                  v42[2] = __77__MCMContainerClassIterator__selectWithFlags_includeUserIdentities_iterator___block_invoke;
                  v42[3] = &unk_1E8CB5AE8;
                  v44 = a3;
                  v43 = v8;
                  v23 = MEMORY[0x1D17D71B4](v42);
                  v24 = (void (**)(_QWORD, _QWORD, _QWORD))v23;
                  if (v5)
                  {
                    if (objc_msgSend(v19, "usesGlobalSystemUserIdentity"))
                    {
                      v25 = self;
                      v26 = (void *)MEMORY[0x1E0C99E60];
                      -[MCMContainerClassIterator userIdentityCache](v25, "userIdentityCache");
                      v27 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v27, "globalSystemUserIdentity");
                      v28 = objc_claimAutoreleasedReturnValue();
                      goto LABEL_51;
                    }
                    if (objc_msgSend(v19, "usesGlobalBundleUserIdentity"))
                    {
                      v29 = self;
                      v26 = (void *)MEMORY[0x1E0C99E60];
                      -[MCMContainerClassIterator userIdentityCache](v29, "userIdentityCache");
                      v27 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v27, "globalBundleUserIdentity");
                      v28 = objc_claimAutoreleasedReturnValue();
                      goto LABEL_51;
                    }
                    if (objc_msgSend(v19, "personaAndUserSpecific"))
                    {
                      -[MCMContainerClassIterator userIdentityCache](self, "userIdentityCache");
                      v27 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v27, "allAccessibleUserIdentities");
                      v30 = (void *)objc_claimAutoreleasedReturnValue();
                    }
                    else
                    {
                      v31 = self;
                      v26 = (void *)MEMORY[0x1E0C99E60];
                      -[MCMContainerClassIterator userIdentityCache](v31, "userIdentityCache");
                      v27 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v27, "defaultUserIdentity");
                      v28 = objc_claimAutoreleasedReturnValue();
LABEL_51:
                      v32 = (void *)v28;
                      objc_msgSend(v26, "setWithObject:", v28);
                      v30 = (void *)objc_claimAutoreleasedReturnValue();

                    }
                    v48 = 0u;
                    v49 = 0u;
                    v46 = 0u;
                    v47 = 0u;
                    v33 = v30;
                    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v46, v45, 16);
                    if (v34)
                    {
                      v35 = v34;
                      v36 = *(_QWORD *)v47;
                      do
                      {
                        for (j = 0; j != v35; ++j)
                        {
                          if (*(_QWORD *)v47 != v36)
                            objc_enumerationMutation(v33);
                          ((void (**)(_QWORD, void *, _QWORD))v24)[2](v24, v19, *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j));
                        }
                        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v46, v45, 16);
                      }
                      while (v35);
                    }

                    v5 = v40;
                    self = v38;
                    v8 = v39;
                  }
                  else
                  {
                    (*(void (**)(uint64_t, void *, _QWORD))(v23 + 16))(v23, v19, 0);
                  }

                }
              }
            }
          }
        }
LABEL_61:

      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v50, 16);
      if (!v13)
      {
LABEL_63:

        return;
      }
    }
  }
  _os_crash();
  __break(1u);
}

- (MCMStaticConfiguration)staticConfig
{
  return self->_staticConfig;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticConfig, 0);
  objc_storeStrong((id *)&self->_userIdentityCache, 0);
}

void __77__MCMContainerClassIterator__selectWithFlags_includeUserIdentities_iterator___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if ((*(_BYTE *)(a1 + 40) & 1) != 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v6 = (void *)MEMORY[0x1D17D7010]();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    objc_autoreleasePoolPop(v6);
  }

}

uint64_t __54__MCMContainerClassIterator_selectWithFlags_iterator___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (MCMContainerClassIterator)initWithStaticConfig:(id)a3 userIdentityCache:(id)a4
{
  id v7;
  id v8;
  MCMContainerClassIterator *v9;
  MCMContainerClassIterator *v10;
  objc_super v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MCMContainerClassIterator;
  v9 = -[MCMContainerClassIterator init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_staticConfig, a3);
    objc_storeStrong((id *)&v10->_userIdentityCache, a4);
  }

  return v10;
}

- (MCMUserIdentityCache)userIdentityCache
{
  return self->_userIdentityCache;
}

- (void)selectWithFlags:(unint64_t)a3 userIdentityIterator:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __80__MCMContainerClassIterator_UserIdentity__selectWithFlags_userIdentityIterator___block_invoke;
  v8[3] = &unk_1E8CB5AC0;
  v9 = v6;
  v7 = v6;
  -[MCMContainerClassIterator _selectWithFlags:includeUserIdentities:iterator:](self, "_selectWithFlags:includeUserIdentities:iterator:", a3, 1, v8);

}

- (void)selectUserDataWithUserIdentityIterator:(id)a3
{
  -[MCMContainerClassIterator selectWithFlags:userIdentityIterator:](self, "selectWithFlags:userIdentityIterator:", 0x20000000000, a3);
}

- (void)selectRemoteWithUserIdentityIterator:(id)a3
{
  -[MCMContainerClassIterator selectWithFlags:userIdentityIterator:](self, "selectWithFlags:userIdentityIterator:", 0x200000000, a3);
}

- (void)selectUserWithUserIdentityIterator:(id)a3
{
  -[MCMContainerClassIterator selectWithFlags:userIdentityIterator:](self, "selectWithFlags:userIdentityIterator:", 0x800000000, a3);
}

- (void)selectSystemWithUserIdentityIterator:(id)a3
{
  -[MCMContainerClassIterator selectWithFlags:userIdentityIterator:](self, "selectWithFlags:userIdentityIterator:", 0x1000000000, a3);
}

- (void)selectBundleWithUserIdentityIterator:(id)a3
{
  -[MCMContainerClassIterator selectWithFlags:userIdentityIterator:](self, "selectWithFlags:userIdentityIterator:", 0x2000000000, a3);
}

- (void)selectGlobalWithUserIdentityIterator:(id)a3
{
  -[MCMContainerClassIterator selectWithFlags:userIdentityIterator:](self, "selectWithFlags:userIdentityIterator:", 0x20000000000, a3);
}

- (void)selectDataProtectedWithUserIdentityIterator:(id)a3
{
  -[MCMContainerClassIterator selectWithFlags:userIdentityIterator:](self, "selectWithFlags:userIdentityIterator:", 0x4000000000, a3);
}

- (void)selectAutorollingWithUserIdentityIterator:(id)a3
{
  -[MCMContainerClassIterator selectWithFlags:userIdentityIterator:](self, "selectWithFlags:userIdentityIterator:", 0x8000000000, a3);
}

uint64_t __80__MCMContainerClassIterator_UserIdentity__selectWithFlags_userIdentityIterator___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

@end
