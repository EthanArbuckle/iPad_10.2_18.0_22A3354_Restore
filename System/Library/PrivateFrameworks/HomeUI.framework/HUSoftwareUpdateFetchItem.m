@implementation HUSoftwareUpdateFetchItem

+ (id)_dateFormatter
{
  if (qword_1EF226B70 != -1)
    dispatch_once(&qword_1EF226B70, &__block_literal_global_174);
  return (id)_MergedGlobals_3_9;
}

void __43__HUSoftwareUpdateFetchItem__dateFormatter__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0D313F0], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeFormatter");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_3_9;
  _MergedGlobals_3_9 = v0;

}

- (HUSoftwareUpdateFetchItem)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_softwareUpdateFetchFuture_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUSoftwareUpdateFetchItem.m"), 39, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUSoftwareUpdateFetchItem init]",
    v5);

  return 0;
}

- (HUSoftwareUpdateFetchItem)initWithHome:(id)a3 softwareUpdateFetchFuture:(id)a4
{
  id v7;
  id v8;
  HUSoftwareUpdateFetchItem *v9;
  HUSoftwareUpdateFetchItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HUSoftwareUpdateFetchItem;
  v9 = -[HUSoftwareUpdateFetchItem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a3);
    objc_storeStrong((id *)&v10->_softwareUpdateFetchFuture, a4);
  }

  return v10;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  int v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;

  v4 = objc_alloc_init(MEMORY[0x1E0D31578]);
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D30B78]);

  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D60]);
  v9 = objc_alloc(MEMORY[0x1E0D31830]);
  -[HUSoftwareUpdateFetchItem home](self, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "accessories");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithAccessories:", v11);

  if (objc_msgSend(v12, "softwareUpdatesRequested"))
  {
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:", 22.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31460]), "initWithSystemImageNamed:configuration:", CFSTR("clock"), v13);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0D30C60]);

    objc_msgSend(v12, "accessoriesWithRequestedSoftwareUpdates");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");
    objc_msgSend(v12, "accessoriesDownloadingSoftwareUpdates");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "count") + v16 == 1)
      v18 = CFSTR("HUSoftwareUpdateFetchMessageRequested_One");
    else
      v18 = CFSTR("HUSoftwareUpdateFetchMessageRequested_Multiple");
    _HULocalizedStringWithDefaultValue(v18, v18, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0D30D18]);

    goto LABEL_11;
  }
  if (objc_msgSend(v12, "updatesReadyToInstall")
    || objc_msgSend(v12, "softwareUpdatesInProgress")
    || (-[HUSoftwareUpdateFetchItem home](self, "home"),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        v21 = objc_msgSend(v20, "hf_canUpdateToHH2"),
        v20,
        v21))
  {
    v22 = (const __CFString *)*MEMORY[0x1E0D30D70];
    v23 = (void *)MEMORY[0x1E0C9AAB0];
LABEL_10:
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, v22);
    goto LABEL_11;
  }
  -[HUSoftwareUpdateFetchItem softwareUpdateFetchFuture](self, "softwareUpdateFetchFuture");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "isFinished");

  if (!v27)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdateFetchMessageCheckingForUpdate"), CFSTR("HUSoftwareUpdateFetchMessageCheckingForUpdate"), 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v42, *MEMORY[0x1E0D30D18]);

    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30EA8]);
    v22 = CFSTR("instructionsStyle");
    v23 = &unk_1E7041320;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:", 22.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31460]), "initWithSystemImageNamed:configuration:", CFSTR("checkmark.circle"), v28);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v29, *MEMORY[0x1E0D30C60]);

  _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdateFetchMessageUpToDate"), CFSTR("HUSoftwareUpdateFetchMessageUpToDate"), 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "homeManager");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v32, "hasOptedToHH2") & 1) != 0)
  {
    -[HUSoftwareUpdateFetchItem home](self, "home");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "hf_displayName");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    HULocalizedStringWithFormat(CFSTR("HUSoftwareUpdateFetchMessageUpToDateWithHH2"), CFSTR("%@"), v35, v36, v37, v38, v39, v40, (uint64_t)v34);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = v33;
  }
  else
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdateFetchMessageUpToDate"), CFSTR("HUSoftwareUpdateFetchMessageUpToDate"), 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v41, *MEMORY[0x1E0D30D18]);
  objc_msgSend((id)objc_opt_class(), "_dateFormatter");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "stringFromDate:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  HULocalizedStringWithFormat(CFSTR("HUSoftwareUpdateFetchLastChecked"), CFSTR("%@"), v46, v47, v48, v49, v50, v51, (uint64_t)v45);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v52, *MEMORY[0x1E0D30BF8]);

LABEL_11:
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSoftwareUpdateFetchItem latestResults](self, "latestResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D70]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", objc_msgSend(v5, "BOOLValue"), CFSTR("hidden"), 1);

  -[HUSoftwareUpdateFetchItem latestResults](self, "latestResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v8, CFSTR("title"), 1);

  objc_msgSend(v3, "build");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (HMHome)home
{
  return self->_home;
}

- (NAFuture)softwareUpdateFetchFuture
{
  return self->_softwareUpdateFetchFuture;
}

- (void)setSoftwareUpdateFetchFuture:(id)a3
{
  objc_storeStrong((id *)&self->_softwareUpdateFetchFuture, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_softwareUpdateFetchFuture, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
