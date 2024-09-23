@implementation HUDropInBannerItem

- (HUDropInBannerItem)initWithHome:(id)a3 device:(id)a4 eventBulletin:(id)a5
{
  id v9;
  id v10;
  id v11;
  HUDropInBannerItem *v12;
  HUDropInBannerItem *v13;
  void *v15;
  void *v16;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUDropInBannerItem.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("home"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUDropInBannerItem.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)HUDropInBannerItem;
  v12 = -[HUBannerItem initWithHome:](&v17, sel_initWithHome_, v9);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_device, a4);
    objc_storeStrong((id *)&v13->_eventBulletin, a5);
  }

  return v13;
}

- (HUDropInBannerItem)initWithHome:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_device_eventBulletin_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUDropInBannerItem.m"), 37, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUDropInBannerItem initWithHome:]",
    v6);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[HUBannerItem home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDropInBannerItem device](self, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDropInBannerItem eventBulletin](self, "eventBulletin");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithHome:device:eventBulletin:", v5, v6, v7);

  objc_msgSend(v8, "copyLatestResultsFromItem:", self);
  return v8;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  id v42;
  double v43;
  double v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  __CFString *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  __CFString *v59;
  __CFString *v60;
  void *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  int v71;
  void *v72;
  void *v73;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  _QWORD v79[2];
  uint8_t buf[4];
  HUDropInBannerItem *v81;
  __int16 v82;
  void *v83;
  __int16 v84;
  _BYTE v85[14];
  __int16 v86;
  void *v87;
  __int16 v88;
  void *v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDropInBannerItem device](self, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v81 = self;
    v82 = 2112;
    v83 = v6;
    v84 = 2112;
    *(_QWORD *)v85 = v7;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@: %@ DropIn device: %@", buf, 0x20u);

  }
  -[HUDropInBannerItem device](self, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "state") == 2)
  {

  }
  else
  {
    -[HUDropInBannerItem device](self, "device");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "state");

    if (v10 != 3)
    {
      v14 = 0;
      goto LABEL_10;
    }
  }
  -[HUBannerItem home](self, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDropInBannerItem device](self, "device");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "homeKitIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hf_accessoryWithIdentifier:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v81 = self;
    v82 = 2112;
    v83 = v16;
    v84 = 2112;
    *(_QWORD *)v85 = v14;
    _os_log_impl(&dword_1B8E1E000, v15, OS_LOG_TYPE_DEFAULT, "%@: %@ Found accessory %@", buf, 0x20u);

  }
LABEL_10:
  v17 = (void *)objc_opt_new();
  v18 = 1;
  _HULocalizedStringWithDefaultValue(CFSTR("HUDropInBanner_Title_String"), CFSTR("HUDropInBanner_Title_String"), 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0D30D18]);

  objc_msgSend(v17, "setObject:forKeyedSubscript:", CFSTR("HUDropInBanner_Title_String"), *MEMORY[0x1E0D30D20]);
  if (v14)
  {
    HFLogForCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUDropInBannerItem eventBulletin](self, "eventBulletin");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v81 = self;
      v82 = 2112;
      v83 = v21;
      v84 = 2112;
      *(_QWORD *)v85 = v22;
      _os_log_impl(&dword_1B8E1E000, v20, OS_LOG_TYPE_DEFAULT, "%@: %@ Last Known Event Bulletin: %@", buf, 0x20u);

    }
    objc_msgSend(v17, "setObject:forKeyedSubscript:", CFSTR("Home.Banners.DropIn"), *MEMORY[0x1E0D30BA0]);
    -[HUDropInBannerItem eventBulletin](self, "eventBulletin");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      HFLogForCategory();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUDropInBannerItem eventBulletin](self, "eventBulletin");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v81 = self;
        v82 = 2112;
        v83 = v25;
        v84 = 2112;
        *(_QWORD *)v85 = v26;
        _os_log_impl(&dword_1B8E1E000, v24, OS_LOG_TYPE_DEFAULT, "%@: %@ Found last known event for accessory: %@", buf, 0x20u);

      }
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUDropInBannerItem eventBulletin](self, "eventBulletin");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "startDate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      -[HUDropInBannerItem eventBulletin](self, "eventBulletin");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "dateOfOccurrence");
      v78 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "hf_serviceNameComponents");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "composedString");
      v32 = objc_claimAutoreleasedReturnValue();

      -[HUDropInBannerItem eventBulletin](self, "eventBulletin");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "state");

      v77 = (void *)v32;
      if (v34)
      {
        -[HUDropInBannerItem eventBulletin](self, "eventBulletin");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "state");

        if (v36 != 1)
        {
          v18 = 1;
LABEL_34:
          HFLogForCategory();
          v62 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          {
            NSStringFromSelector(a2);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413570;
            v81 = self;
            v82 = 2112;
            v83 = v63;
            v84 = 1024;
            *(_DWORD *)v85 = v18;
            *(_WORD *)&v85[4] = 2112;
            *(_QWORD *)&v85[6] = v29;
            v86 = 2112;
            v87 = v78;
            v88 = 2112;
            v89 = v27;
            _os_log_impl(&dword_1B8E1E000, v62, OS_LOG_TYPE_DEFAULT, "%@: %@ Should hide banner?: %{BOOL}d Event start time: %@ end time: %@ vs Current time: %@", buf, 0x3Au);

          }
          v64 = (void *)MEMORY[0x1E0CEA650];
          objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v79[0] = v65;
          objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v79[1] = v66;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 2);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "configurationWithPaletteColors:", v67);
          v68 = (void *)objc_claimAutoreleasedReturnValue();

          v69 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31460]), "initWithSystemImageNamed:configuration:", CFSTR("waveform.badge.magnifyingglass.circle.fill"), v68);
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v69, *MEMORY[0x1E0D30C60]);

          goto LABEL_37;
        }
        objc_msgSend(v78, "dateByAddingTimeInterval:", 900.0);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = v27;
        objc_msgSend(v27, "timeIntervalSince1970");
        v39 = v38;
        objc_msgSend(v37, "timeIntervalSince1970");
        v18 = v39 > v40;
        objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", v29, 0, 1);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_alloc_init(MEMORY[0x1E0CB3570]);
        objc_msgSend(v42, "setUnitsStyle:", 3);
        objc_msgSend(v42, "setAllowedUnits:", 64);
        objc_msgSend(v42, "stringFromDate:toDate:", v29, v78);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "timeIntervalSinceDate:", v29);
        v44 = v43;
        v45 = objc_msgSend(v29, "hf_isSingularHour");
        if (v44 >= 60.0)
        {
          if (v45)
            v60 = CFSTR("HUDropIn_Description_Alarm_Ended_SingularHour_FormatString");
          else
            v60 = CFSTR("HUDropIn_Description_Alarm_Ended_PluralHour_FormatString");
          HULocalizedStringWithFormat(v60, CFSTR("%@%@%@"), v46, v47, v48, v49, v50, v51, (uint64_t)v77);
        }
        else
        {
          if (v45)
            v52 = CFSTR("HUDropIn_Description_Alarm_Ended_SingularHour_LessThanOneMin_FormatString");
          else
            v52 = CFSTR("HUDropIn_Description_Alarm_Ended_PluralHour_LessThanOneMin_FormatString");
          HULocalizedStringWithFormat(v52, CFSTR("%@%@"), v46, v47, v48, v49, v50, v51, (uint64_t)v77);
        }
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v61, *MEMORY[0x1E0D30BF8]);

      }
      else
      {
        v76 = v27;
        objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", v29, 0, 1);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v29, "hf_isSingularHour"))
          v59 = CFSTR("HUDropIn_Description_Alarm_Started_SingularHour_FormatString");
        else
          v59 = CFSTR("HUDropIn_Description_Alarm_Started_PluralHour_FormatString");
        HULocalizedStringWithFormat(v59, CFSTR("%@%@"), v53, v54, v55, v56, v57, v58, v32);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v41, *MEMORY[0x1E0D30BF8]);
        v18 = 0;
      }

      v27 = v76;
      goto LABEL_34;
    }
  }
LABEL_37:
  _HULocalizedStringWithDefaultValue(CFSTR("HUDropInBanner_ActionButton_Title_String"), CFSTR("HUDropInBanner_ActionButton_Title_String"), 1);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v70, *MEMORY[0x1E0D30BC0]);

  objc_msgSend(v17, "setObject:forKeyedSubscript:", &unk_1E7040C78, CFSTR("bannerItemCategory"));
  v71 = -[HUBannerItem forceShowBanner](self, "forceShowBanner");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v18 & ~v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v72, *MEMORY[0x1E0D30D70]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v17);
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  return v73;
}

- (DIDevice)device
{
  return self->_device;
}

- (HMAudioAnalysisEventBulletin)eventBulletin
{
  return self->_eventBulletin;
}

- (void)setEventBulletin:(id)a3
{
  objc_storeStrong((id *)&self->_eventBulletin, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventBulletin, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
