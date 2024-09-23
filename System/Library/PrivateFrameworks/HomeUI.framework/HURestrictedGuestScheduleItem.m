@implementation HURestrictedGuestScheduleItem

- (HURestrictedGuestScheduleItem)initWithHome:(id)a3 user:(id)a4
{
  id v8;
  id v9;
  void *v10;
  HURestrictedGuestScheduleItem *v11;
  HURestrictedGuestScheduleItem *v12;
  void *v14;
  void *v15;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HURestrictedGuestScheduleItem.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("home"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HURestrictedGuestScheduleItem.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("user"));

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)HURestrictedGuestScheduleItem;
  v11 = -[HURestrictedGuestScheduleItem init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_home, a3);
    objc_storeStrong((id *)&v12->_user, a4);
  }

  return v12;
}

- (HURestrictedGuestScheduleItem)initWithSchedule:(id)a3
{
  id v6;
  HURestrictedGuestScheduleItem *v7;
  HURestrictedGuestScheduleItem *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HURestrictedGuestScheduleItem.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("schedule"));

  }
  v11.receiver = self;
  v11.super_class = (Class)HURestrictedGuestScheduleItem;
  v7 = -[HURestrictedGuestScheduleItem init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_schedule, a3);

  return v8;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  unint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint8_t buf[4];
  HURestrictedGuestScheduleItem *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  void *v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HURestrictedGuestScheduleItem schedule](self, "schedule");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HURestrictedGuestScheduleItem user](self, "user");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hf_prettyDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HURestrictedGuestScheduleItem home](self, "home");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v62 = self;
    v63 = 2112;
    v64 = v6;
    v65 = 2112;
    v66 = v7;
    v67 = 2112;
    v68 = v9;
    v69 = 2112;
    v70 = v10;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ Attempting to update HURestrictedGuestScheduleItem with schedule [%@], user [%@], home [%@].", buf, 0x34u);

  }
  v11 = (void *)objc_opt_new();
  -[HURestrictedGuestScheduleItem home](self, "home");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[HURestrictedGuestScheduleItem user](self, "user");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      -[HURestrictedGuestScheduleItem home](self, "home");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HURestrictedGuestScheduleItem user](self, "user");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "hf_userIsRestrictedGuest:", v17);

      if (v18)
      {
        -[HURestrictedGuestScheduleItem home](self, "home");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[HURestrictedGuestScheduleItem user](self, "user");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "homeAccessControlForUser:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v21, "restrictedGuestAccessSettings");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)MEMORY[0x1E0D31728];
        objc_msgSend(v22, "guestAccessSchedule");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "scheduleBuilderFromHomeAccessSchedule:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        HFLogForCategory();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          NSStringFromSelector(a2);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "guestAccessSchedule");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v62 = self;
          v63 = 2112;
          v64 = v27;
          v65 = 2112;
          v66 = v25;
          v67 = 2112;
          v68 = v28;
          _os_log_impl(&dword_1B8E1E000, v26, OS_LOG_TYPE_DEFAULT, "%@:%@ Constructed schedule builder [%@] from guest access schedule [%@].", buf, 0x2Au);

        }
        -[HURestrictedGuestScheduleItem home](self, "home");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "hf_currentUserIsRestrictedGuest");

        if ((v30 & 1) != 0)
        {
          v31 = 0;
        }
        else
        {
          _HULocalizedStringWithDefaultValue(CFSTR("HUEditButtonTitle"), CFSTR("HUEditButtonTitle"), 1);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v38 = (void *)MEMORY[0x1E0C99E60];
        -[HURestrictedGuestScheduleItem home](self, "home");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[HURestrictedGuestScheduleItem user](self, "user");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setWithObjects:", v39, v40, 0);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v41, *MEMORY[0x1E0D30B80]);

        goto LABEL_18;
      }
    }
    else
    {

    }
  }
  -[HURestrictedGuestScheduleItem schedule](self, "schedule");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v32 = (void *)MEMORY[0x1E0D31728];
    -[HURestrictedGuestScheduleItem schedule](self, "schedule");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "scheduleBuilderFromSchedule:", v33);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    HFLogForCategory();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[HURestrictedGuestScheduleItem schedule](self, "schedule");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v62 = self;
      v63 = 2112;
      v64 = v35;
      v65 = 2112;
      v66 = v25;
      v67 = 2112;
      v68 = v36;
      _os_log_impl(&dword_1B8E1E000, v34, OS_LOG_TYPE_DEFAULT, "%@:%@ Constructed schedule builder [%@] from schedule [%@].", buf, 0x2Au);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v25 == 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v37, *MEMORY[0x1E0D30D70]);

    _HULocalizedStringWithDefaultValue(CFSTR("HUEditButtonTitle"), CFSTR("HUEditButtonTitle"), 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D70]);
    v31 = 0;
  }
LABEL_18:
  v42 = objc_msgSend(v25, "estimatedScheduleType");
  objc_msgSend(MEMORY[0x1E0D31758], "localizedStringFromScheduleType:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v42 == 2)
  {
    objc_msgSend(v25, "rules");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "count");

    if (v50 < 2)
    {
      v52 = (void *)MEMORY[0x1E0D31758];
      objc_msgSend(v25, "rules");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "anyObject");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "localizedMainStringForRule:", v54);
      v48 = objc_claimAutoreleasedReturnValue();

      v55 = (void *)MEMORY[0x1E0D31758];
      objc_msgSend(v25, "rules");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "anyObject");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "localizedDetailedStringForRule:", v56);
      v51 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      HFLocalizedString();
      v48 = objc_claimAutoreleasedReturnValue();
      v51 = 0;
    }
LABEL_28:

    v43 = (void *)v48;
    goto LABEL_29;
  }
  if (v42 == 1)
  {
    objc_msgSend(v25, "rules");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v44, "count") > 1)
    {
      HFLocalizedString();
      v48 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v45 = (void *)MEMORY[0x1E0D31758];
      objc_msgSend(v25, "rules");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "anyObject");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "localizedMainStringForRule:", v47);
      v48 = objc_claimAutoreleasedReturnValue();

      v43 = v46;
    }

    v51 = 0;
    v43 = v44;
    goto LABEL_28;
  }
  v51 = 0;
LABEL_29:
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v43, *MEMORY[0x1E0D30D18]);
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v31, *MEMORY[0x1E0D30C08]);
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v51, *MEMORY[0x1E0D30BF8]);
  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithScale:", 0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31460]), "initWithSystemImageNamed:configuration:", CFSTR("calendar"), v57);
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v58, *MEMORY[0x1E0D30C60]);

  objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D30CE8]);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v11);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  return v59;
}

- (HMHome)home
{
  return self->_home;
}

- (HMUser)user
{
  return self->_user;
}

- (HFSchedule)schedule
{
  return self->_schedule;
}

- (void)setSchedule:(id)a3
{
  objc_storeStrong((id *)&self->_schedule, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schedule, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
