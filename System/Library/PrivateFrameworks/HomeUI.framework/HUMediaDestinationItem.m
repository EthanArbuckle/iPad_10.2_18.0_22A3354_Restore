@implementation HUMediaDestinationItem

- (HUMediaDestinationItem)initWithDestination:(id)a3 withModule:(id)a4
{
  id v7;
  id v8;
  HUMediaDestinationItem *v9;
  HUMediaDestinationItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HUMediaDestinationItem;
  v9 = -[HUMediaDestinationItem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_homeTheaterAudioItemModule, a4);
    objc_storeStrong((id *)&v10->_thisDestination, a3);
  }

  return v10;
}

- (HUMediaDestinationItem)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithDestination_withModule_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUMediaDestinationItem.m"), 37, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUMediaDestinationItem init]",
    v5);

  return 0;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10[2];
  id location;

  v5 = a3;
  objc_initWeak(&location, self);
  v6 = (void *)MEMORY[0x1E0D519C0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__HUMediaDestinationItem__subclass_updateWithOptions___block_invoke;
  v9[3] = &unk_1E6F572A0;
  objc_copyWeak(v10, &location);
  v10[1] = (id)a2;
  objc_msgSend(v6, "futureWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(v10);
  objc_destroyWeak(&location);

  return v7;
}

void __54__HUMediaDestinationItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id *v3;
  id v4;
  id WeakRetained;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  int v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  uint8_t buf[4];
  id v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  int v65;
  __int16 v66;
  int v67;
  uint64_t v68;

  v2 = a1;
  v68 = *MEMORY[0x1E0C80C00];
  v3 = (id *)(a1 + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v6 = objc_alloc_init(MEMORY[0x1E0D31578]);
  objc_msgSend(WeakRetained, "homeTheaterAudioItemModule");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mediaProfileContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hf_backingAccessory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "audioDestinationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "destination");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "thisDestination");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(WeakRetained, "homeTheaterAudioItemModule");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "selectedUncommittedItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(WeakRetained, "homeTheaterAudioItemModule");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "selectedUncommittedItem");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqual:", WeakRetained);
    }
    else
    {
      objc_msgSend(v11, "audioDestinationIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "thisDestination");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "audioDestinationIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "isEqualToString:", v18);

    }
  }
  else
  {
    v17 = v11 == 0;
  }
  objc_msgSend(WeakRetained, "homeTheaterAudioItemModule");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "tappedDestinationIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(WeakRetained, "thisDestination");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "homeTheaterAudioItemModule");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "tappedDestinationIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v21)
    {
      objc_msgSend(WeakRetained, "thisDestination");
      v52 = v4;
      v25 = v11;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "audioDestinationIdentifier");
      v27 = v6;
      v28 = v17;
      v17 = v2;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v24, "isEqualToString:", v29);

      v2 = v17;
      LODWORD(v17) = v28;
      v6 = v27;

      v11 = v25;
      v4 = v52;
    }
    else
    {
      v30 = objc_msgSend(v23, "isEqualToString:", CFSTR("kIdentifierStringForBuiltIn"));
    }

    v17 = v17 & ~(_DWORD)v30;
  }
  else
  {
    v30 = 0;
  }
  HFLogForCategory();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(v2 + 40));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "thisDestination");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "audioDestinationIdentifier");
    v53 = v11;
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "homeTheaterAudioItemModule");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "tappedDestinationIdentifier");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "audioDestinationIdentifier");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413826;
    v55 = WeakRetained;
    v56 = 2112;
    v57 = v46;
    v58 = 2112;
    v59 = v47;
    v60 = 2112;
    v61 = v48;
    v62 = 2112;
    v63 = v49;
    v64 = 1024;
    v65 = v17;
    v66 = 1024;
    v67 = v30;
    _os_log_debug_impl(&dword_1B8E1E000, v31, OS_LOG_TYPE_DEBUG, "%@:%@: self.thisDestination: %@ tappedDestinationIdentifier: %@ selectedDestination: %@... isSelected = %{BOOL}d, showSpinner = %{BOOL}d", buf, 0x40u);

    v11 = v53;
  }

  objc_msgSend(WeakRetained, "thisDestination");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    objc_msgSend(WeakRetained, "thisDestination");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "audioDestinationName");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v34, *MEMORY[0x1E0D30D18]);

    objc_msgSend(WeakRetained, "thisDestination");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "audioDestinationIdentifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v36, *MEMORY[0x1E0D30DB0]);

  }
  else
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUHomeTheaterSettings_DefaultOutput"), CFSTR("HUHomeTheaterSettings_DefaultOutput"), 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v37, *MEMORY[0x1E0D30D18]);

    objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("kIdentifierStringForBuiltIn"), *MEMORY[0x1E0D30DB0]);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v17);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v38, *MEMORY[0x1E0D30DA0]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v30);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v39, *MEMORY[0x1E0D30EA8]);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v40, *MEMORY[0x1E0D30B78]);

  objc_msgSend(WeakRetained, "thisDestination");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    objc_msgSend(WeakRetained, "thisDestination");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "iconForAudioDestination:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (v43)
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v43, *MEMORY[0x1E0D30C60]);
  }
  else
  {
    v44 = objc_alloc(MEMORY[0x1E0D31460]);
    objc_msgSend(MEMORY[0x1E0CEA638], "hu_standardSymbolConfiguration");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (void *)objc_msgSend(v44, "initWithSystemImageNamed:configuration:", CFSTR("tv.and.hifispeaker.fill"), v43);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v45, *MEMORY[0x1E0D30C60]);

  }
  objc_msgSend(v4, "finishWithResult:", v6);

}

- (id)iconForAudioDestination:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  const __CFString *v16;
  void *v17;

  v3 = a3;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_opt_class();
  v7 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
  {
    objc_msgSend(v9, "components");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mediaProfile");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "accessory");
    v13 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v13;
  }
  if (objc_msgSend(v7, "audioDestinationType") != 1)
  {
    if (objc_msgSend(v7, "audioDestinationType") == 2)
    {
      if (objc_msgSend(v6, "homePodVariant") == 2)
      {
        v14 = objc_alloc(MEMORY[0x1E0D31460]);
        objc_msgSend(MEMORY[0x1E0CEA638], "hu_standardSymbolConfiguration");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = CFSTR("homepodmini.2.fill");
        goto LABEL_21;
      }
      if (objc_msgSend(v6, "homePodVariant") == 1 || objc_msgSend(v6, "homePodVariant") == 3)
      {
        v14 = objc_alloc(MEMORY[0x1E0D31460]);
        objc_msgSend(MEMORY[0x1E0CEA638], "hu_standardSymbolConfiguration");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = CFSTR("homepod.2.fill");
        goto LABEL_21;
      }
    }
LABEL_22:
    v17 = 0;
    goto LABEL_23;
  }
  if (objc_msgSend(v6, "homePodVariant") != 2)
  {
    if (objc_msgSend(v6, "homePodVariant") == 1 || objc_msgSend(v6, "homePodVariant") == 3)
    {
      v14 = objc_alloc(MEMORY[0x1E0D31460]);
      objc_msgSend(MEMORY[0x1E0CEA638], "hu_standardSymbolConfiguration");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("homepod.fill");
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  v14 = objc_alloc(MEMORY[0x1E0D31460]);
  objc_msgSend(MEMORY[0x1E0CEA638], "hu_standardSymbolConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = CFSTR("homepodmini.fill");
LABEL_21:
  v17 = (void *)objc_msgSend(v14, "initWithSystemImageNamed:configuration:", v16, v15);

LABEL_23:
  return v17;
}

- (HUHomeTheaterAudioItemModule)homeTheaterAudioItemModule
{
  return (HUHomeTheaterAudioItemModule *)objc_getProperty(self, a2, 56, 1);
}

- (HMMediaDestination)thisDestination
{
  return (HMMediaDestination *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thisDestination, 0);
  objc_storeStrong((id *)&self->_homeTheaterAudioItemModule, 0);
}

@end
