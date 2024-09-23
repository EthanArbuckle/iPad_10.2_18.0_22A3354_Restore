@implementation HUServiceDetailsSeparateTileItem

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  const char *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  NSObject *v35;
  void *v36;
  void *v37;
  uint8_t v39[24];
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  -[HUServiceDetailsAbstractItem home](self, "home", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsAbstractItem sourceServiceItem](self, "sourceServiceItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "latestResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E48]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_roomWithIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUServiceDetailsAbstractItem home](self, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v9, "hf_currentUserIsAdministrator");

  if ((_DWORD)v5 && v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    -[HUServiceDetailsAbstractItem sourceServiceItem](self, "sourceServiceItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
    v13 = v12;

    objc_opt_class();
    -[HUServiceDetailsAbstractItem sourceServiceItem](self, "sourceServiceItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
    v16 = v15;

    objc_opt_class();
    -[HUServiceDetailsAbstractItem sourceServiceItem](self, "sourceServiceItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;
    v19 = v18;

    if (v13)
    {
      v20 = v13;
      goto LABEL_14;
    }
    if (v16)
    {
      objc_msgSend(v16, "service");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "accessory");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
        goto LABEL_21;
    }
    else
    {
      if (v19)
      {
        v20 = v19;
LABEL_14:
        objc_msgSend(v20, "accessory");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v21)
          goto LABEL_33;
LABEL_21:
        if (objc_msgSend(v21, "hf_showAsIndividualServices"))
        {
          _HULocalizedStringWithDefaultValue(CFSTR("HUServiceDetailsUnifyTileButton"), CFSTR("HUServiceDetailsUnifyTileButton"), 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          _HULocalizedStringWithDefaultValue(CFSTR("HUServiceDetailsUnifyTileFooter"), CFSTR("HUServiceDetailsUnifyTileFooter"), 1);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          HFLogForCategory();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v39 = 138412290;
            *(_QWORD *)&v39[4] = v21;
            v30 = "Separate tile item's sourceAccessory %@. Present option to show as single tile to user.";
LABEL_26:
            _os_log_impl(&dword_1B8E1E000, v29, OS_LOG_TYPE_DEFAULT, v30, v39, 0xCu);
          }
        }
        else
        {
          _HULocalizedStringWithDefaultValue(CFSTR("HUServiceDetailsSeparateTileButton"), CFSTR("HUServiceDetailsSeparateTileButton"), 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          _HULocalizedStringWithDefaultValue(CFSTR("HUServiceDetailsSeparateTileFooter"), CFSTR("HUServiceDetailsSeparateTileFooter"), 1);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          HFLogForCategory();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v39 = 138412290;
            *(_QWORD *)&v39[4] = v21;
            v30 = "Separate tile item's sourceAccessory %@. Present option to show as separate tiles to user.";
            goto LABEL_26;
          }
        }

        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v21);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v31, *MEMORY[0x1E0D30B80]);

        objc_msgSend(v21, "hf_isMultiServiceAccessory");
        if (objc_msgSend(v21, "hf_isCamera"))
        {
          objc_msgSend(v21, "hf_visibleServices");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "count");

        }
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v27, *MEMORY[0x1E0D30D18], *(_OWORD *)v39);
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v28, CFSTR("HUServiceDetailsSeparateTileSectionFooterResultKey"));
        goto LABEL_34;
      }
      v21 = 0;
    }
LABEL_33:
    v28 = 0;
    v27 = 0;
LABEL_34:
    if (!objc_msgSend(v21, "hf_canShowAsIndividualServices")
      || (objc_msgSend(v16, "service"),
          v33 = (void *)objc_claimAutoreleasedReturnValue(),
          v34 = objc_msgSend(v33, "hf_isSensorService"),
          v33,
          v34))
    {
      HFLogForCategory();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v39 = 138412290;
        *(_QWORD *)&v39[4] = v21;
        _os_log_impl(&dword_1B8E1E000, v35, OS_LOG_TYPE_DEFAULT, "Item is not separable into multiple tiles for sourceAccessory %@", v39, 0xCu);
      }

      objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D70]);
    }
    v36 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0D314B8], "outcomeWithResults:", v10);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "futureWithResult:", v37);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_40;
  }
  HFLogForCategory();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v39 = 0;
    _os_log_impl(&dword_1B8E1E000, v22, OS_LOG_TYPE_DEFAULT, "Not authorized to separate tiles", v39, 2u);
  }

  v23 = (void *)MEMORY[0x1E0D519C0];
  v24 = (void *)MEMORY[0x1E0D314B8];
  v40 = *MEMORY[0x1E0D30D70];
  v41[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "outcomeWithResults:", v10);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "futureWithResult:", v13);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_40:

  return v25;
}

@end
