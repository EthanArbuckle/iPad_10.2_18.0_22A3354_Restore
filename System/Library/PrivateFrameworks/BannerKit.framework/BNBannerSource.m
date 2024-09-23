@implementation BNBannerSource

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    BNRegisterBannerKitLogging();
}

- (BNBannerSource)initWithMachName:(id)a3 andRequesterIdentifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  BNBannerSource *v10;
  uint64_t v11;
  NSString *machName;
  uint64_t Serial;
  OS_dispatch_queue *connectionQueue;
  void *v16;
  void *v17;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BNBannerSource.m"), 201, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("machName"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BNBannerSource.m"), 202, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("requesterIdentifier"));

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)BNBannerSource;
  v10 = -[BNBannerSource init](&v18, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v7, "copy");
    machName = v10->_machName;
    v10->_machName = (NSString *)v11;

    objc_storeStrong((id *)&v10->_requesterIdentifier, a4);
    Serial = BSDispatchQueueCreateSerial();
    connectionQueue = v10->_connectionQueue;
    v10->_connectionQueue = (OS_dispatch_queue *)Serial;

  }
  return v10;
}

- (BNBannerSource)initWithDestination:(int64_t)a3 andRequesterIdentifier:(id)a4
{
  id v7;
  void *v8;
  BNBannerSource *v9;
  BNBannerSource *v10;
  void *v12;

  v7 = a4;
  _MachNameForDestination(a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BNBannerSource.m"), 213, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("requesterIdentifier"));

  }
  v9 = -[BNBannerSource initWithMachName:andRequesterIdentifier:](self, "initWithMachName:andRequesterIdentifier:", v8, v7);
  v10 = v9;
  if (v9)
    v9->_destination = a3;

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[BNBannerSource invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)BNBannerSource;
  -[BNBannerSource dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  int64_t destination;
  NSString *requesterIdentifier;
  NSString *machName;
  __CFString *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = CFSTR("[INVALID]");
  destination = self->_destination;
  requesterIdentifier = self->_requesterIdentifier;
  if (destination == 1)
    v5 = CFSTR("CarPlay");
  if (!destination)
    v5 = CFSTR("Default system shell");
  machName = self->_machName;
  v9 = v5;
  NSStringFromBOOL();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; destination: %@; machName: %@; requesterIdentifier: %@; isValid: %@>"),
    v4,
    self,
    v9,
    machName,
    requesterIdentifier,
    v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

+ (id)bannerSourceForDestination:(int64_t)a3 forRequesterIdentifier:(id)a4
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  BNBannerSource *v11;
  void *v13;
  void *v14;
  void *v15;

  v7 = a4;
  v8 = v7;
  if ((unint64_t)a3 >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[BNBannerSource bannerSourceForDestination:forRequesterIdentifier:]");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("BNBannerSource.m"), 233, CFSTR("Invalid destination: %@"), CFSTR("[INVALID]"));

    if (v8)
      goto LABEL_3;
  }
  else if (v7)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("BNBannerSource.m"), 234, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("requesterIdentifier"));

LABEL_3:
  if (bannerSourceForDestination_forRequesterIdentifier__onceToken != -1)
    dispatch_once(&bannerSourceForDestination_forRequesterIdentifier__onceToken, &__block_literal_global_0);
  objc_msgSend((id)__requesterIDsToMachNamesToSources, "objectForKeyedSubscript:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend((id)__requesterIDsToMachNamesToSources, "setObject:forKeyedSubscript:", v9, v8);
  }
  _MachNameForDestination(a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (BNBannerSource *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v11 = -[BNBannerSource initWithDestination:andRequesterIdentifier:]([BNBannerSource alloc], "initWithDestination:andRequesterIdentifier:", a3, v8);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, v10);
    v11->_valid = 1;
  }

  return v11;
}

void __68__BNBannerSource_bannerSourceForDestination_forRequesterIdentifier___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)__requesterIDsToMachNamesToSources;
  __requesterIDsToMachNamesToSources = (uint64_t)v0;

}

- (id)layoutDescriptionWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[6];
  id obj;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  obj = 0;
  -[BNBannerSource _activeConnectionWithError:](self, "_activeConnectionWithError:", &obj);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&v20, obj);
  objc_msgSend(v4, "bn_remoteTargetEnforceLaunching");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __45__BNBannerSource_layoutDescriptionWithError___block_invoke;
    v13[3] = &unk_1E7044248;
    v13[4] = &v21;
    v13[5] = &v15;
    objc_msgSend(v5, "__layoutDescriptionWithReply:", v13);
  }
  else if (!v16[5])
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v27 = *MEMORY[0x1E0CB2D50];
    v28[0] = CFSTR("Failed to obtain remote target from connection");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("BNBannerSourceErrorDomain"), 1, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v16[5];
    v16[5] = v8;

  }
  if (a3)
  {
    v10 = (void *)v16[5];
    if (v10)
      *a3 = objc_retainAutorelease(v10);
  }
  v11 = (id)v22[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v11;
}

void __45__BNBannerSource_layoutDescriptionWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (BOOL)postPresentable:(id)a3 options:(unint64_t)a4 userInfo:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _BOOL4 v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  _BNPresentableContext *v20;
  char v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  char v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  id v55;
  void *v56;
  objc_class *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  BOOL v62;
  char v64;
  void *v65;
  _QWORD v68[4];
  _BNPresentableContext *v69;
  id v70;
  uint64_t *v71;
  __int128 *p_buf;
  id v73;
  char v74;
  id obj;
  id v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  char v80;
  id location[4];
  uint64_t v82;
  const __CFString *v83;
  uint64_t v84;
  id v85;
  uint64_t v86;
  _BNPresentableContext *v87;
  uint64_t v88;
  const __CFString *v89;
  __int128 buf;
  uint64_t v91;
  uint64_t (*v92)(uint64_t, uint64_t);
  void (*v93)(uint64_t);
  id v94;
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = (void *)BNLogHostingService;
  if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    BNEffectivePresentableDescription(v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v12;
    _os_log_impl(&dword_1B9628000, v11, OS_LOG_TYPE_DEFAULT, "Asked to post presentable: %{public}@", (uint8_t *)&buf, 0xCu);

  }
  v77 = 0;
  v78 = &v77;
  v79 = 0x2020000000;
  v80 = 0;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v91 = 0x3032000000;
  v92 = __Block_byref_object_copy_;
  v93 = __Block_byref_object_dispose_;
  v94 = 0;
  if (v8)
  {
    v76 = 0;
    v13 = -[BNBannerSource _isValidPresentable:errorDescription:](self, "_isValidPresentable:errorDescription:", v8, &v76);
    v14 = v76;
    v15 = v14;
    if (v13)
    {
      objc_msgSend(v8, "requesterIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", self->_requesterIdentifier);

      if (v17)
      {
        objc_msgSend(v8, "ensurePresentableIsUniquelyIdentifiable");
        objc_msgSend(v8, "uniquePresentableIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[BNBannerSource _presentableContextForPresentableWithUniqueIdentifier:](self, "_presentableContextForPresentableWithUniqueIdentifier:", v18);
        v19 = objc_claimAutoreleasedReturnValue();

        v20 = (_BNPresentableContext *)v19;
        if (!v19)
        {
          v20 = -[_BNPresentableContext initWithMachName:presentable:]([_BNPresentableContext alloc], "initWithMachName:presentable:", self->_machName, v8);
          -[BNBannerSource _addPresentableContext:](self, "_addPresentableContext:", v20);
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v21 = 1;
        else
          v21 = objc_opt_respondsToSelector();
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v32 = objc_msgSend(v8, "providesTemplateContent");
        else
          v32 = 0;
        v64 = v32 | ~v21;
        if (v32 & 1 | ((v21 & 1) == 0))
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v8, "setPresentableContext:", v20);
        }
        else if (!v19)
        {
          objc_msgSend(v8, "uniquePresentableIdentifier");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          +[BNBannerSceneComponentProvider registerDelegate:forSceneForPresentableWithUniqueIdentifier:](BNBannerSceneComponentProvider, "registerDelegate:forSceneForPresentableWithUniqueIdentifier:", self, v33);

        }
        v34 = *((_QWORD *)&buf + 1);
        obj = 0;
        -[BNBannerSource _activeConnectionWithError:](self, "_activeConnectionWithError:", &obj);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong((id *)(v34 + 40), obj);
        objc_msgSend(v35, "bn_remoteTargetEnforceLaunching");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          objc_initWeak(location, self);
          v36 = v8;
          if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v36, "providesTemplateContent"))
          {
            v37 = v36;
            objc_msgSend(v37, "requesterIdentifier");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "requestIdentifier");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "uniquePresentableIdentifier");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            +[BNPresentableIdentification identificationWithRequesterIdentifier:requestIdentifier:uniqueIdentifier:](BNBannerSourceTemplatePresentableSpecification, "identificationWithRequesterIdentifier:requestIdentifier:uniqueIdentifier:", v38, v39, v40);
            v65 = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(v37, "leadingTemplateViewProvider");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v65, "setLeadingTemplateViewProvider:", v41);

            }
            else
            {
              objc_msgSend(v65, "setLeadingTemplateViewProvider:", 0);
            }
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(v37, "trailingTemplateViewProvider");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v65, "setTrailingTemplateViewProvider:", v51);

            }
            else
            {
              objc_msgSend(v65, "setTrailingTemplateViewProvider:", 0);
            }
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(v37, "primaryTemplateItemProvider");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v65, "setPrimaryTemplateItemProvider:", v52);

            }
            else
            {
              objc_msgSend(v65, "setPrimaryTemplateItemProvider:", 0);
            }
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(v37, "secondaryTemplateItemProvider");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v65, "setSecondaryTemplateItemProvider:", v53);

            }
            else
            {
              objc_msgSend(v65, "setSecondaryTemplateItemProvider:", 0);
            }
            objc_msgSend(v65, "setContentBehavior:", 1);
          }
          else
          {
            objc_msgSend(v36, "requesterIdentifier");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "requestIdentifier");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "uniquePresentableIdentifier");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            +[BNPresentableIdentification identificationWithRequesterIdentifier:requestIdentifier:uniqueIdentifier:](BNBannerSourcePresentableSpecification, "identificationWithRequesterIdentifier:requestIdentifier:uniqueIdentifier:", v42, v43, v44);
            v65 = (void *)objc_claimAutoreleasedReturnValue();

            UIViewControllerFromPresentable(v36);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = v45;
            if (v45)
            {
              objc_msgSend(v45, "preferredContentSize");
              objc_msgSend(v65, "setPreferredContentSize:");
              objc_msgSend(v46, "bannerContentOutsets");
              objc_msgSend(v65, "setContentOutsets:");
            }
            else
            {
              objc_msgSend(v65, "setContentBehavior:", 2);
            }

            v37 = 0;
          }
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v54 = objc_msgSend(v36, "presentableBehavior");
          else
            v54 = (objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v36, "presentableType") == 1;
          objc_msgSend(v65, "setPresentableBehavior:", v54);

          if (v9)
            v55 = (id)objc_msgSend(v9, "mutableCopy");
          else
            v55 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v56 = v55;
          v57 = (objc_class *)objc_opt_class();
          NSStringFromClass(v57);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "setObject:forKeyedSubscript:", v58, CFSTR("BNBannerSourcePresentableClassName"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v68[0] = MEMORY[0x1E0C809B0];
          v68[1] = 3221225472;
          v68[2] = __57__BNBannerSource_postPresentable_options_userInfo_error___block_invoke;
          v68[3] = &unk_1E7044270;
          v71 = &v77;
          p_buf = &buf;
          v74 = v64 & 1;
          v20 = v20;
          v69 = v20;
          objc_copyWeak(&v73, location);
          v70 = v36;
          objc_msgSend(v26, "__postPresentableWithSpecification:options:userInfo:reply:", v65, v59, v56, v68);

          objc_destroyWeak(&v73);
          objc_destroyWeak(location);
        }
        else
        {
          -[BNBannerSource _removePresentable:reason:](self, "_removePresentable:reason:", v8, CFSTR("failed to obtain remote target from connection"));
          if (!*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
          {
            v47 = (void *)MEMORY[0x1E0CB35C8];
            v88 = *MEMORY[0x1E0CB2D50];
            v89 = CFSTR("Failed to obtain remote target from connection");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v89, &v88, 1);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "errorWithDomain:code:userInfo:", CFSTR("BNBannerSourceErrorDomain"), 1, v48);
            v49 = objc_claimAutoreleasedReturnValue();
            v50 = *(void **)(*((_QWORD *)&buf + 1) + 40);
            *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v49;

          }
        }
      }
      else
      {
        v27 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v8, "requesterIdentifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "stringWithFormat:", CFSTR("Presentable requesterID (%@) doesn't match source (%@)"), v28, self->_requesterIdentifier);
        v20 = (_BNPresentableContext *)objc_claimAutoreleasedReturnValue();

        v29 = (void *)MEMORY[0x1E0CB35C8];
        v86 = *MEMORY[0x1E0CB2D50];
        v87 = v20;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v87, &v86, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("BNBannerSourceErrorDomain"), 2, v26);
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = *(void **)(*((_QWORD *)&buf + 1) + 40);
        *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v30;

      }
    }
    else
    {
      v24 = (void *)MEMORY[0x1E0CB35C8];
      v84 = *MEMORY[0x1E0CB2D50];
      v85 = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v85, &v84, 1);
      v20 = (_BNPresentableContext *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("BNBannerSourceErrorDomain"), 2, v20);
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v25;
    }

  }
  else
  {
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v82 = *MEMORY[0x1E0CB2D50];
    v83 = CFSTR("Missing presentable");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("BNBannerSourceErrorDomain"), 2, v15);
    v23 = objc_claimAutoreleasedReturnValue();
    v20 = *(_BNPresentableContext **)(*((_QWORD *)&buf + 1) + 40);
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v23;
  }

  if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
  {
    v60 = (id)BNLogHostingService;
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      BNEffectivePresentableDescription(v8);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[BNBannerSource postPresentable:options:userInfo:error:].cold.1(v61, (uint64_t)&buf + 8, (uint64_t)location, v60);
    }

    if (a6)
      *a6 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
  }
  v62 = *((_BYTE *)v78 + 24) != 0;
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v77, 8);
  return v62;
}

void __57__BNBannerSource_postPresentable_options_userInfo_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;

  v7 = a2;
  v5 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v7, "BOOLValue");
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    if (*(_BYTE *)(a1 + 72))
      objc_msgSend(*(id *)(a1 + 32), "setHostNeedsUpdate");
  }
  else
  {
    v6 = objc_loadWeakRetained((id *)(a1 + 64));
    objc_sync_enter(v6);
    objc_msgSend(v6, "_removePresentable:reason:", *(_QWORD *)(a1 + 40), CFSTR("error encountered posting to remote target"));
    objc_sync_exit(v6);

  }
}

- (id)revokePresentableWithRequestIdentifier:(id)a3 reason:(id)a4 animated:(BOOL)a5 userInfo:(id)a6 error:(id *)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  void *v15;
  NSString *requesterIdentifier;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v23;
  id v24;
  __int16 v25;
  NSString *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v9 = a5;
  v31 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = (void *)BNLogHostingService;
  if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_DEFAULT))
  {
    requesterIdentifier = self->_requesterIdentifier;
    v17 = v15;
    NSStringFromBOOL();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138544130;
    v24 = v12;
    v25 = 2114;
    v26 = requesterIdentifier;
    v27 = 2114;
    v28 = v13;
    v29 = 2114;
    v30 = v18;
    _os_log_impl(&dword_1B9628000, v17, OS_LOG_TYPE_DEFAULT, "Asked to revoke presentable with requestID %{public}@ and requesterID %{public}@ with reason '%{public}@' (animated=%{public}@)", (uint8_t *)&v23, 0x2Au);

  }
  +[BNPresentableIdentification identificationWithRequesterIdentifier:requestIdentifier:](BNPresentableIdentification, "identificationWithRequesterIdentifier:requestIdentifier:", self->_requesterIdentifier, v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[BNBannerSource _revokePresentableWithIdentification:reason:animated:userInfo:error:](self, "_revokePresentableWithIdentification:reason:animated:userInfo:error:", v19, v13, v20, v14, a7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)revokeAllPresentablesWithReason:(id)a3 userInfo:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSString *requesterIdentifier;
  void *v12;
  void *v13;
  int v15;
  NSString *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = BNLogHostingService;
  if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_DEFAULT))
  {
    requesterIdentifier = self->_requesterIdentifier;
    v15 = 138543618;
    v16 = requesterIdentifier;
    v17 = 2114;
    v18 = v8;
    _os_log_impl(&dword_1B9628000, v10, OS_LOG_TYPE_DEFAULT, "Asked to revoke all presentables with requester ID %{public}@ with reason '%{public}@'", (uint8_t *)&v15, 0x16u);
  }
  +[BNPresentableIdentification identificationWithRequesterIdentifier:](BNPresentableIdentification, "identificationWithRequesterIdentifier:", self->_requesterIdentifier);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BNBannerSource _revokePresentableWithIdentification:reason:animated:userInfo:error:](self, "_revokePresentableWithIdentification:reason:animated:userInfo:error:", v12, v8, 0, v9, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)revokePresentableWithRequestIdentifier:(id)a3 animated:(BOOL)a4 reason:(id)a5 userInfo:(id)a6 error:(id *)a7
{
  void *v7;
  BOOL v8;

  -[BNBannerSource revokePresentableWithRequestIdentifier:reason:animated:userInfo:error:](self, "revokePresentableWithRequestIdentifier:reason:animated:userInfo:error:", a3, a5, a4, a6, a7);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 != 0;

  return v8;
}

- (id)revokePresentableWithIdentification:(id)a3 reason:(id)a4 animated:(BOOL)a5 userInfo:(id)a6 error:(id *)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id *v20;
  void *v21;
  void *v22;
  void *v23;
  BNBannerSource *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v9 = a5;
  v36 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = (void *)BNLogHostingService;
  if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_DEFAULT))
  {
    v16 = v15;
    objc_msgSend(v12, "requestIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "requesterIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uniquePresentableIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v25 = self;
    v20 = a7;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v27 = v17;
    v28 = 2114;
    v29 = v18;
    v30 = 2114;
    v31 = v19;
    v32 = 2114;
    v33 = v13;
    v34 = 2114;
    v35 = v21;
    _os_log_impl(&dword_1B9628000, v16, OS_LOG_TYPE_DEFAULT, "Asked to revoke presentable with requestID %{public}@, requesterID %{public}@, and uniqueID %{public}@ with reason '%{public}@' (animated=%{public}@)", buf, 0x34u);

    a7 = v20;
    self = v25;

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[BNBannerSource _revokePresentableWithIdentification:reason:animated:userInfo:error:](self, "_revokePresentableWithIdentification:reason:animated:userInfo:error:", v12, v13, v22, v14, a7);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)keyWindowForScreen:(id)a3
{
  id v4;
  BNBannerClientContainer **p_bannerClientContainerDeferringFocus;
  id WeakRetained;
  id v7;
  void *v8;

  v4 = a3;
  p_bannerClientContainerDeferringFocus = &self->_bannerClientContainerDeferringFocus;
  WeakRetained = objc_loadWeakRetained((id *)&self->_bannerClientContainerDeferringFocus);
  if (objc_msgSend(WeakRetained, "isDeferringFocus"))
  {
    v7 = objc_loadWeakRetained((id *)p_bannerClientContainerDeferringFocus);
    objc_msgSend(v7, "keyWindowForScreen:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)setSuspended:(BOOL)a3 forReason:(id)a4 revokingCurrent:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  void *v20;
  uint64_t v21;
  _QWORD v22[6];
  id obj;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  const __CFString *v35;
  uint64_t v36;
  _QWORD v37[2];

  v7 = a5;
  v8 = a3;
  v37[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  v29 = 0;
  if (v10)
  {
    obj = 0;
    -[BNBannerSource _activeConnectionWithError:](self, "_activeConnectionWithError:", &obj);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(&v29, obj);
    objc_msgSend(v11, "bn_remoteTargetEnforceLaunching");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __63__BNBannerSource_setSuspended_forReason_revokingCurrent_error___block_invoke;
      v22[3] = &unk_1E7044298;
      v22[4] = &v30;
      v22[5] = &v24;
      objc_msgSend(v12, "__recommendSuspension:forReason:revokingCurrent:reply:", v13, v10, v14, v22);
    }
    else
    {
      if (v25[5])
        goto LABEL_7;
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v36 = *MEMORY[0x1E0CB2D50];
      v37[0] = CFSTR("Failed to obtain remote target from connection");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("BNBannerSourceErrorDomain"), 1, v13);
      v21 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v25[5];
      v25[5] = v21;
    }

  }
  else
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v34 = *MEMORY[0x1E0CB2D50];
    v35 = CFSTR("Missing 'reason'");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("BNBannerSourceErrorDomain"), 2, v12);
    v16 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v25[5];
    v25[5] = v16;
  }

LABEL_7:
  if (a6)
  {
    v17 = (void *)v25[5];
    if (v17)
      *a6 = objc_retainAutorelease(v17);
  }
  v18 = *((_BYTE *)v31 + 24) != 0;
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v18;
}

void __63__BNBannerSource_setSuspended_forReason_revokingCurrent_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;

  v5 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "BOOLValue");
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (void)invalidate
{
  NSObject *v3;
  id WeakRetained;
  int v5;
  BNBannerSource *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (-[BNBannerSource isValid](self, "isValid"))
  {
    v3 = BNLogHostingService;
    if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138543362;
      v6 = self;
      _os_log_impl(&dword_1B9628000, v3, OS_LOG_TYPE_DEFAULT, "BNBannerSource invalidated: %{public}@", (uint8_t *)&v5, 0xCu);
    }
    -[BNBannerSource _invalidateConnection](self, "_invalidateConnection");
    objc_msgSend((id)objc_opt_class(), "_invalidateBannerSource:", self);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "bannerSourceDidInvalidate:", self);

  }
}

- (id)containerViewControllerForBannerSceneComponentProvider:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;

  objc_msgSend(a3, "_scene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_FBSScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  v9 = v7;
  if (v8)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;

  objc_msgSend(v5, "bn_presentableUniqueIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BNBannerSource _presentableForUniqueIdentifier:](self, "_presentableForUniqueIdentifier:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_FBSScene");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BNBannerSource.m"), 424, CFSTR("No presentable for scene with ID '%@'"), v21);

  }
  v14 = (objc_class *)objc_msgSend(v11, "clientContainerViewControllerClass");
  if (!v14)
    v14 = (objc_class *)objc_opt_class();
  objc_msgSend(v13, "uniquePresentableIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[BNBannerSource _presentableContextForPresentableWithUniqueIdentifier:](self, "_presentableContextForPresentableWithUniqueIdentifier:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_msgSend([v14 alloc], "initWithScene:presentable:context:", v5, v13, v16);
  objc_msgSend(v17, "setDelegate:", self);

  return v17;
}

- (void)sceneWillInvalidateForBannerSceneComponentProvider:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "_scene");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bn_presentableUniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BNBannerSource _removePresentableWithUniqueIdentifier:reason:](self, "_removePresentableWithUniqueIdentifier:reason:", v4, CFSTR("scene will invalidate"));

}

- (BOOL)bannerClientContainerShouldDeferFocus:(id)a3
{
  int64_t destination;

  destination = self->_destination;
  if (destination == 1)
    objc_storeWeak((id *)&self->_bannerClientContainerDeferringFocus, a3);
  return destination == 1;
}

- (void)bannerClientContainerStoppedDeferringFocus:(id)a3
{
  BNBannerClientContainer **p_bannerClientContainerDeferringFocus;
  id v4;
  id WeakRetained;

  p_bannerClientContainerDeferringFocus = &self->_bannerClientContainerDeferringFocus;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_bannerClientContainerDeferringFocus);

  if (WeakRetained == v4)
    objc_storeWeak((id *)p_bannerClientContainerDeferringFocus, 0);
}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v10, "providesTemplateContent"))
  {
    objc_msgSend(v10, "uniquePresentableIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BNBannerSource _presentableContextForPresentableWithUniqueIdentifier:](self, "_presentableContextForPresentableWithUniqueIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removePresentableObserver:", self);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("template presentable did disappear as banner (%@)"), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BNBannerSource _removePresentable:reason:](self, "_removePresentable:reason:", v10, v9);

  }
}

+ (void)_invalidateBannerSource:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = BNLogHostingService;
    if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543362;
      v9 = v3;
      _os_log_impl(&dword_1B9628000, v4, OS_LOG_TYPE_DEFAULT, "Removing reference to invalidated banner source: %{public}@", (uint8_t *)&v8, 0xCu);
    }
    v5 = (void *)__requesterIDsToMachNamesToSources;
    objc_msgSend(v3, "requesterIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, *((_QWORD *)v3 + 1));

    *((_BYTE *)v3 + 48) = 0;
  }

}

- (id)_activeConnectionWithError:(id *)a3
{
  BNBannerSource *v4;
  void *v5;
  NSString *machName;
  void *v7;
  void *v8;
  uint64_t v9;
  BSServiceConnection *connection;
  BSServiceConnection *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v4 = self;
  objc_sync_enter(v4);
  if (v4->_valid)
  {
    if (!v4->_connection)
    {
      v5 = (void *)MEMORY[0x1E0D228C0];
      machName = v4->_machName;
      +[BNBannerSourceSessionSpecification identifier](BNBannerSourceSessionSpecification, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "endpointForMachName:service:instance:", machName, v7, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D228B8], "connectionWithEndpoint:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
      connection = v4->_connection;
      v4->_connection = (BSServiceConnection *)v9;

      v11 = v4->_connection;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __45__BNBannerSource__activeConnectionWithError___block_invoke;
      v15[3] = &unk_1E70442E8;
      v15[4] = v4;
      -[BSServiceConnection configureConnection:](v11, "configureConnection:", v15);
      -[BSServiceConnection activate](v4->_connection, "activate");

    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_ERROR))
      -[BNBannerSource _activeConnectionWithError:].cold.1();
    if (a3)
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0CB2D50];
      v17[0] = CFSTR("Attempt to establish connection with an invalidated BNBannerSource");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("BNBannerSourceErrorDomain"), 0, v13);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  objc_sync_exit(v4);

  return v4->_connection;
}

void __45__BNBannerSource__activeConnectionWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  v3 = a2;
  +[BNBannerSourceSessionSpecification serviceQuality](BNBannerSourceSessionSpecification, "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  +[BNBannerSourceSessionSpecification interface](BNBannerSourceSessionSpecification, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  objc_initWeak(&location, *(id *)(a1 + 32));
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __45__BNBannerSource__activeConnectionWithError___block_invoke_2;
  v11[3] = &unk_1E70442C0;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v3, "setActivationHandler:", v11);
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __45__BNBannerSource__activeConnectionWithError___block_invoke_75;
  v9[3] = &unk_1E70442C0;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v3, "setInterruptionHandler:", v9);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __45__BNBannerSource__activeConnectionWithError___block_invoke_76;
  v7[3] = &unk_1E70442C0;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "setInvalidationHandler:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __45__BNBannerSource__activeConnectionWithError___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id WeakRetained;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = (void *)BNLogHostingService;
  if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v5 = 138543362;
    v6 = WeakRetained;
    _os_log_impl(&dword_1B9628000, v3, OS_LOG_TYPE_DEFAULT, "BNBannerSource (service-side) connection activated: %{public}@", (uint8_t *)&v5, 0xCu);

  }
}

void __45__BNBannerSource__activeConnectionWithError___block_invoke_75(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id WeakRetained;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)BNLogHostingService;
  if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v7 = 138543362;
    v8 = WeakRetained;
    _os_log_impl(&dword_1B9628000, v5, OS_LOG_TYPE_DEFAULT, "BNBannerSource (service-side) connection interrupted: %{public}@", (uint8_t *)&v7, 0xCu);

  }
  objc_msgSend(v3, "activate");

}

void __45__BNBannerSource__activeConnectionWithError___block_invoke_76(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  _QWORD *v3;
  NSObject *v4;
  void *v5;
  int v6;
  _QWORD *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_sync_enter(v3);
    v4 = BNLogHostingService;
    if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138543362;
      v7 = v3;
      _os_log_impl(&dword_1B9628000, v4, OS_LOG_TYPE_DEFAULT, "BNBannerSource (service-side) connection invalidated: %{public}@", (uint8_t *)&v6, 0xCu);
    }
    v5 = (void *)v3[3];
    v3[3] = 0;

    objc_sync_exit(v3);
  }

}

- (void)_invalidateConnection
{
  BNBannerSource *v2;
  NSObject *v3;
  BSServiceConnection *connection;
  int v5;
  BNBannerSource *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_connection)
  {
    v3 = BNLogHostingService;
    if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138543362;
      v6 = v2;
      _os_log_impl(&dword_1B9628000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating connection: %{public}@", (uint8_t *)&v5, 0xCu);
    }
    -[BSServiceConnection invalidate](v2->_connection, "invalidate");
    connection = v2->_connection;
    v2->_connection = 0;

  }
  objc_sync_exit(v2);

}

- (BOOL)_isValidPresentable:(id)a3 errorDescription:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "requestIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (!v7)
  {
    v15 = (void *)MEMORY[0x1E0CB3940];
    BNEffectivePresentableDescription(v5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("Presentable missing requestID: %@"), v16);
LABEL_11:
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    v14 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v5, "requesterIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (!v9)
  {
    v17 = (void *)MEMORY[0x1E0CB3940];
    BNEffectivePresentableDescription(v5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("Presentable missing requesterID: %@"), v16);
    goto LABEL_11;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_msgSend(v5, "providesTemplateContent") & 1) == 0)
  {
    UIViewControllerFromPresentable(v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v11 = (void *)BNLogHostingService;
      if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_DEFAULT))
      {
        v12 = v11;
        BNEffectivePresentableDescription(v5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v27 = v13;
        _os_log_impl(&dword_1B9628000, v12, OS_LOG_TYPE_DEFAULT, "Presentable provides neither template content nor a view controller – deferring to listener to manage UI: %{public}@", buf, 0xCu);

      }
    }
  }
  v14 = 1;
LABEL_12:
  objc_msgSend(v5, "requesterIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "hasPrefix:", CFSTR("com."));

  if ((v19 & 1) == 0)
  {
    v20 = (void *)BNLogHostingService;
    if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_ERROR))
      -[BNBannerSource _isValidPresentable:errorDescription:].cold.2(v20, v5);
  }
  objc_msgSend(v5, "requesterIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requestIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = BSEqualStrings();

  if (v23)
  {
    v24 = (void *)BNLogHostingService;
    if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_ERROR))
      -[BNBannerSource _isValidPresentable:errorDescription:].cold.1(v24, v5);
  }

  return v14;
}

- (void)_addPresentableContext:(id)a3
{
  id v4;
  BNBannerSource *v5;
  NSMutableDictionary *uniqueIDsToContexts;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    uniqueIDsToContexts = v5->_uniqueIDsToContexts;
    if (!uniqueIDsToContexts)
    {
      v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v8 = v5->_uniqueIDsToContexts;
      v5->_uniqueIDsToContexts = v7;

      uniqueIDsToContexts = v5->_uniqueIDsToContexts;
    }
    objc_msgSend(v4, "presentable");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uniquePresentableIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](uniqueIDsToContexts, "setObject:forKey:", v4, v10);

    objc_msgSend(v4, "addPresentableObserver:", v5);
    v11 = BNLogHostingService;
    if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138543362;
      v13 = v4;
      _os_log_impl(&dword_1B9628000, v11, OS_LOG_TYPE_DEFAULT, "Added presentable context: %{public}@", (uint8_t *)&v12, 0xCu);
    }
    objc_sync_exit(v5);

  }
}

- (id)_presentableContextForPresentableWithUniqueIdentifier:(id)a3
{
  id v4;
  BNBannerSource *v5;
  void *v6;

  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    -[NSMutableDictionary objectForKey:](v5->_uniqueIDsToContexts, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_presentableForUniqueIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[BNBannerSource _presentableContextForPresentableWithUniqueIdentifier:](self, "_presentableContextForPresentableWithUniqueIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_removePresentableContextForPresentableWithUniqueIdentifier:(id)a3 reason:(id)a4
{
  id v7;
  id v8;
  BNBannerSource *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v8, "length"))
  {
    if (!v7)
      goto LABEL_10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BNBannerSource.m"), 577, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[reason length] > 0"));

    if (!v7)
      goto LABEL_10;
  }
  v9 = self;
  objc_sync_enter(v9);
  -[BNBannerSource _presentableContextForPresentableWithUniqueIdentifier:](v9, "_presentableContextForPresentableWithUniqueIdentifier:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[NSMutableDictionary removeObjectForKey:](v9->_uniqueIDsToContexts, "removeObjectForKey:", v7);
    v11 = BNLogHostingService;
    if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v14 = v8;
      v15 = 2114;
      v16 = v10;
      _os_log_impl(&dword_1B9628000, v11, OS_LOG_TYPE_DEFAULT, "Removed presentable context for reason '%{public}@': %{public}@", buf, 0x16u);
    }
    objc_msgSend(v10, "invalidate");
  }
  else if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_ERROR))
  {
    -[BNBannerSource _removePresentableContextForPresentableWithUniqueIdentifier:reason:].cold.1();
  }

  objc_sync_exit(v9);
LABEL_10:

}

- (void)_removePresentable:(id)a3 reason:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v7)
  {
    objc_msgSend(v7, "uniquePresentableIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BNBannerSource.m"), 599, CFSTR("Presentable has no unique identifier: %@"), v7);

    }
    -[BNBannerSource _presentableForUniqueIdentifier:](self, "_presentableForUniqueIdentifier:", v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10 == v7)
    {
      -[BNBannerSource _removePresentableWithUniqueIdentifier:reason:](self, "_removePresentableWithUniqueIdentifier:reason:", v9, v8);
    }
    else
    {
      v11 = (void *)BNLogHostingService;
      if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_ERROR))
      {
        v12 = v11;
        BNEffectivePresentableDescription(v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        BNEffectivePresentableDescription(v7);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v17 = v8;
        v18 = 2114;
        v19 = v13;
        v20 = 2114;
        v21 = v14;
        _os_log_error_impl(&dword_1B9628000, v12, OS_LOG_TYPE_ERROR, "Retrieved different presentable to remove for reason '%{public}@': argument: %{public}@; retrieved presentable: %{public}@",
          buf,
          0x20u);

      }
    }

  }
}

- (id)_revokePresentableWithIdentification:(id)a3 reason:(id)a4 animated:(id)a5 userInfo:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  int v17;
  id *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  id v31;
  void *v33;
  id v34;
  void *v35;
  id v36;
  _QWORD v37[6];
  id obj;
  uint64_t v39;
  id *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint8_t buf[4];
  id v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  id v56;
  __int16 v57;
  id v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  _QWORD v64[4];

  v64[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy_;
  v49 = __Block_byref_object_dispose_;
  v50 = 0;
  v39 = 0;
  v40 = (id *)&v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy_;
  v43 = __Block_byref_object_dispose_;
  v44 = 0;
  if (!v12 || !v13)
  {
    v25 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v12, "requesterIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringWithFormat:", CFSTR("Requester identifier in identification (%@) doesn't match banner source (%@)"), v26, self->_requesterIdentifier);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = (void *)MEMORY[0x1E0CB35C8];
    v59 = *MEMORY[0x1E0CB2D50];
    v60 = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("BNBannerSourceErrorDomain"), 2, v21);
    v28 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v22 = v40[5];
    v40[5] = (id)v28;
    goto LABEL_9;
  }
  objc_msgSend(v12, "requesterIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", self->_requesterIdentifier);

  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing %@%@"), CFSTR("identification"), &stru_1E7045820);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)MEMORY[0x1E0CB35C8];
    v61 = *MEMORY[0x1E0CB2D50];
    v62 = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("BNBannerSourceErrorDomain"), 2, v21);
    v28 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v18 = v40;
  obj = 0;
  -[BNBannerSource _activeConnectionWithError:](self, "_activeConnectionWithError:", &obj);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v18 + 5, obj);
  objc_msgSend(v19, "bn_remoteTargetEnforceLaunching");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v12, "requesterIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "requestIdentifier");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uniquePresentableIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[BNPresentableIdentification identificationWithRequesterIdentifier:requestIdentifier:uniqueIdentifier:](BNPresentableIdentification, "identificationWithRequesterIdentifier:requestIdentifier:uniqueIdentifier:", v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __86__BNBannerSource__revokePresentableWithIdentification_reason_animated_userInfo_error___block_invoke;
    v37[3] = &unk_1E7044310;
    v37[4] = &v45;
    v37[5] = &v39;
    objc_msgSend(v20, "__revokePresentablesWithIdentification:withAnimation:reason:userInfo:reply:", v24, v14, v13, v15, v37);

LABEL_9:
    goto LABEL_10;
  }
  if (!v40[5])
  {
    v33 = (void *)MEMORY[0x1E0CB35C8];
    v63 = *MEMORY[0x1E0CB2D50];
    v64[0] = CFSTR("Failed to obtain remote target from connection");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, &v63, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "errorWithDomain:code:userInfo:", CFSTR("BNBannerSourceErrorDomain"), 1, v21);
    v28 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
LABEL_10:

  if (v40[5])
  {
    v30 = (id)BNLogHostingService;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v12, "requestIdentifier");
      v34 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "requesterIdentifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v40[5];
      *(_DWORD *)buf = 138544130;
      v52 = v34;
      v53 = 2114;
      v54 = v35;
      v55 = 2114;
      v56 = v13;
      v57 = 2114;
      v58 = v36;
      _os_log_error_impl(&dword_1B9628000, v30, OS_LOG_TYPE_ERROR, "Error encountered attempting to revoke presentable with requestID %{public}@ and requesterID %{public}@ for reason '%{public}@': %{public}@", buf, 0x2Au);

    }
    if (a7)
      *a7 = objc_retainAutorelease(v40[5]);
  }
  v31 = (id)v46[5];
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(&v45, 8);
  return v31;
}

void __86__BNBannerSource__revokePresentableWithIdentification_reason_animated_userInfo_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (int64_t)destination
{
  return self->_destination;
}

- (NSString)requesterIdentifier
{
  return self->_requesterIdentifier;
}

- (BNBannerSourceDelegate)delegate
{
  return (BNBannerSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isValid
{
  return self->_valid;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_requesterIdentifier, 0);
  objc_destroyWeak((id *)&self->_bannerClientContainerDeferringFocus);
  objc_storeStrong((id *)&self->_uniqueIDsToContexts, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_machName, 0);
}

- (void)postPresentable:(void *)a1 options:(uint64_t)a2 userInfo:(uint64_t)a3 error:(NSObject *)a4 .cold.1(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)a2 + 40);
  *(_DWORD *)a3 = 138543618;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = v5;
  OUTLINED_FUNCTION_0(&dword_1B9628000, a4, a3, "Error encountered attempting to post: presentable: %{public}@; error: %{public}@",
    (uint8_t *)a3);

}

- (void)_activeConnectionWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1B9628000, v0, v1, "Attempt to establish connection with an invalidated BNBannerSource: %{public}@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)_isValidPresentable:(void *)a1 errorDescription:(void *)a2 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  BNEffectivePresentableDescription(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();

  OUTLINED_FUNCTION_5();
}

- (void)_isValidPresentable:(void *)a1 errorDescription:(void *)a2 .cold.2(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  BNEffectivePresentableDescription(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();

  OUTLINED_FUNCTION_5();
}

- (void)_removePresentableContextForPresentableWithUniqueIdentifier:reason:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1B9628000, v0, (uint64_t)v0, "No presentable context to remove for reason '%{public}@' with unique identifier: %{public}@", v1);
  OUTLINED_FUNCTION_2();
}

@end
