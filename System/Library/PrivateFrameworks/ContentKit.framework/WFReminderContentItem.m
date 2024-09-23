@implementation WFReminderContentItem

- (BOOL)getListAltText:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void (**)(id, void *))a3;
  -[WFReminderContentItem reminder](self, "reminder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dueDateComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateFromComponents:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)objc_opt_new();
    objc_msgSend(v9, "setDateStyle:", 1);
    objc_msgSend(v9, "setTimeStyle:", 1);
    objc_msgSend(v9, "setDoesRelativeDateFormatting:", 1);
    if (v4)
    {
      objc_msgSend(v9, "stringFromDate:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v10);

    }
  }

  return v6 != 0;
}

- (id)changeTransaction
{
  return -[WFReminderContentItemChangeTransaction initWithContentItem:]([WFReminderContentItemChangeTransaction alloc], "initWithContentItem:", self);
}

- (id)parentReminder
{
  void *v2;
  void *v3;

  -[WFReminderContentItem reminder](self, "reminder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "parentReminder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)hasSubtasks
{
  void *v2;
  BOOL v3;

  -[WFReminderContentItem subtasks](self, "subtasks");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)subtasks
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[WFReminderContentItem reminder](self, "reminder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subtaskContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v3, "fetchRemindersWithError:", &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;

  if (!v4)
  {
    getWFContentGraphLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "-[WFReminderContentItem subtasks]";
      v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_20BBAD000, v6, OS_LOG_TYPE_ERROR, "%s Failed to fetch subtasks with error %@", buf, 0x16u);
    }

  }
  return v4;
}

- (BOOL)hasAlarms
{
  void *v2;
  void *v3;
  BOOL v4;

  -[WFReminderContentItem reminder](self, "reminder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alarms");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (BOOL)flagged
{
  void *v2;
  void *v3;
  BOOL v4;

  -[WFReminderContentItem reminder](self, "reminder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flaggedContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "flagged") > 0;

  return v4;
}

- (id)URL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[WFReminderContentItem reminder](self, "reminder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attachmentContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "urlAttachments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)imageAttachments
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[WFReminderContentItem reminder](self, "reminder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attachmentContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageAttachments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_map:", &__block_literal_global_155);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)copyStateToItem:(id)a3
{
  objc_storeStrong((id *)a3 + 6, self->_reminderStore);
}

- (id)generateFileRepresentationForType:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "conformsToString:", CFSTR("com.apple.ical.ics")))
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x2050000000;
    v9 = (void *)getREMExportingClass_softClass;
    v24 = getREMExportingClass_softClass;
    if (!getREMExportingClass_softClass)
    {
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __getREMExportingClass_block_invoke;
      v20[3] = &unk_24C4E3118;
      v20[4] = &v21;
      __getREMExportingClass_block_invoke((uint64_t)v20);
      v9 = (void *)v22[3];
    }
    v10 = objc_retainAutorelease(v9);
    _Block_object_dispose(&v21, 8);
    -[WFReminderContentItem reminder](self, "reminder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "exportICSCalendarFromReminders:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "ICSStringWithOptions:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dataUsingEncoding:", 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFContentItem name](self, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFFileRepresentation proposedFilenameForFile:ofType:](WFFileRepresentation, "proposedFilenameForFile:ofType:", v16, v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    +[WFFileRepresentation fileWithData:ofType:proposedFilename:](WFFileRepresentation, "fileWithData:ofType:proposedFilename:", v15, v7, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (REMReminder)reminder
{
  return (REMReminder *)-[WFContentItem objectForClass:](self, "objectForClass:", getREMReminderClass());
}

- (void)generateObjectRepresentations:(id)a3 options:(id)a4 forClass:(Class)a5
{
  void (**v7)(id, void *, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x24BDAC8D0];
  v7 = (void (**)(id, void *, _QWORD))a3;
  if ((Class)objc_opt_class() == a5)
  {
    v9 = (void *)objc_opt_new();
    -[WFReminderContentItem reminder](self, "reminder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "startDateComponents");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFReminderContentItem reminder](self, "reminder");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "startDateComponents");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dateFromComponents:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      WFLocalizedString(CFSTR("Reminder Start Date"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFObjectRepresentation object:named:](WFObjectRepresentation, "object:named:", v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v17);

    }
    -[WFReminderContentItem reminder](self, "reminder");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dueDateComponents");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFReminderContentItem reminder](self, "reminder");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "dueDateComponents");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "dateFromComponents:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      WFLocalizedString(CFSTR("Reminder Due Date"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFObjectRepresentation object:named:](WFObjectRepresentation, "object:named:", v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v25);

    }
    -[WFReminderContentItem reminder](self, "reminder");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "completionDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      -[WFReminderContentItem reminder](self, "reminder");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "completionDate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      WFLocalizedString(CFSTR("Reminder Completion Date"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFObjectRepresentation object:named:](WFObjectRepresentation, "object:named:", v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v31);

    }
    v7[2](v7, v9, 0);
    goto LABEL_18;
  }
  if ((Class)objc_opt_class() == a5)
  {
    -[WFReminderContentItem URL](self, "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    WFLocalizedStringWithKey(CFSTR("Show URL (Reminder Content Item)"), CFSTR("Show URL"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFObjectRepresentation object:named:](WFObjectRepresentation, "object:named:", v8, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v33;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v34, 0);

    goto LABEL_13;
  }
  if ((Class)objc_opt_class() == a5)
  {
    -[WFReminderContentItem reminder](self, "reminder");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "list");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "color");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(MEMORY[0x24BEC1398], "colorWithRemindersColor:", v9);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFObjectRepresentation object:](WFObjectRepresentation, "object:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v38;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v40, 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v39, 0);

    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "badCoercionErrorForObjectClass:", a5);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, void *))v7)[2](v7, 0, v37);
    }

LABEL_18:
    goto LABEL_19;
  }
  objc_msgSend((id)objc_opt_class(), "badCoercionErrorForObjectClass:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, void *, void *))v7)[2](v7, 0, v8);
LABEL_13:

LABEL_19:
}

- (BOOL)canGenerateRepresentationForType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToClass:", objc_opt_class()))
  {
    -[WFReminderContentItem reminder](self, "reminder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "list");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "color");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 != 0;

LABEL_13:
    goto LABEL_14;
  }
  if (objc_msgSend(v4, "isEqualToClass:", objc_opt_class()))
  {
    -[WFReminderContentItem reminder](self, "reminder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startDateComponents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v8 = 1;
    }
    else
    {
      -[WFReminderContentItem reminder](self, "reminder");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dueDateComponents");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v8 = 1;
      }
      else
      {
        -[WFReminderContentItem reminder](self, "reminder");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "completionDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v13 != 0;

      }
    }
    goto LABEL_13;
  }
  if (objc_msgSend(v4, "isEqualToClass:", objc_opt_class()))
  {
    -[WFReminderContentItem URL](self, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v9 != 0;

  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)WFReminderContentItem;
    v8 = -[WFGenericFileContentItem canGenerateRepresentationForType:](&v15, sel_canGenerateRepresentationForType_, v4);
  }
LABEL_14:

  return v8;
}

- (id)defaultSourceForRepresentation:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  objc_super v13;

  v4 = a3;
  objc_msgSend(v4, "wfType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "conformsToClass:", getREMReminderClass());

  if (v6)
  {
    objc_msgSend(v4, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "account");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContentItem cachingIdentifier](self, "cachingIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    WFMakeContentAttributionSetForRemindersAccount(v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    return v10;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)WFReminderContentItem;
    -[WFContentItem defaultSourceForRepresentation:](&v13, sel_defaultSourceForRepresentation_, v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    return v12;
  }
}

- (REMStore)reminderStore
{
  return self->_reminderStore;
}

- (void)setReminderStore:(id)a3
{
  objc_storeStrong((id *)&self->_reminderStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reminderStore, 0);
}

id __41__WFReminderContentItem_imageAttachments__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "fileURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFFileRepresentation fileWithURL:options:](WFFileRepresentation, "fileWithURL:options:", v2, 13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)itemWithReminder:(id)a3 fromReminderStore:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  objc_msgSend(a1, "itemWithObject:named:", a3, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setReminderStore:", v6);

  return v7;
}

+ (id)propertyBuilders
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v29;
  void *v30;
  void *v31;
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
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
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
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  id v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  _QWORD v127[5];
  _QWORD v128[5];
  _QWORD v129[4];
  id v130;
  _QWORD v131[4];
  id v132;
  _QWORD v133[20];
  _QWORD v134[4];
  _QWORD v135[4];
  _QWORD v136[6];

  v136[4] = *MEMORY[0x24BDAC8D0];
  WFLocalizedString(CFSTR("None"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v136[0] = v2;
  WFLocalizedString(CFSTR("Low"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v136[1] = v3;
  WFLocalizedString(CFSTR("Medium"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v136[2] = v4;
  WFLocalizedString(CFSTR("High"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v136[3] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v136, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v134[0] = v7;
  objc_msgSend(v6, "objectAtIndex:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v135[0] = v8;
  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", 1, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v134[1] = v9;
  objc_msgSend(v6, "objectAtIndex:", 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v135[1] = v10;
  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", 5, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v134[2] = v11;
  objc_msgSend(v6, "objectAtIndex:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v135[2] = v12;
  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", 6, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v134[3] = v13;
  v104 = v6;
  objc_msgSend(v6, "objectAtIndex:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v135[3] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v135, v134, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  WFLocalizedContentPropertyNameMarker(CFSTR("Title"));
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("reminder.title.string"), v126, objc_opt_class());
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "setterBlock:", &__block_literal_global_17544);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v133[0] = v124;
  WFLocalizedContentPropertyNameMarker(CFSTR("Notes"));
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("reminder.notes.string"), v123, objc_opt_class());
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "sortable:", 0);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "appendable:", 1);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "setterBlock:", &__block_literal_global_46_17547);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v133[1] = v119;
  WFLocalizedContentPropertyNameMarker(CFSTR("Last Modified Date"));
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("reminder.lastModifiedDate"), v118, objc_opt_class());
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "tense:", 1);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "timeUnits:", 8444);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "userInfo:", CFSTR("WFFileModificationDate"));
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v133[2] = v114;
  WFLocalizedContentPropertyNameMarker(CFSTR("Creation Date"));
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("reminder.creationDate"), v113, objc_opt_class());
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "tense:", 1);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "timeUnits:", 8444);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "userInfo:", CFSTR("WFFileCreationDate"));
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v133[3] = v109;
  WFLocalizedContentPropertyNameMarker(CFSTR("File Size"));
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_55, v108, objc_opt_class());
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "userInfo:", CFSTR("WFFileSizeProperty"));
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "filterable:", 0);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "sortable:", 0);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v133[4] = v103;
  WFLocalizedContentPropertyNameMarker(CFSTR("Due Date"));
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_60, v102, objc_opt_class());
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "timeUnits:", 8444);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "setterBlock:", &__block_literal_global_63);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "timeUnits:", 8316);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v133[5] = v98;
  v16 = MEMORY[0x24BDAC760];
  v131[0] = MEMORY[0x24BDAC760];
  v131[1] = 3221225472;
  v131[2] = __41__WFReminderContentItem_propertyBuilders__block_invoke_7;
  v131[3] = &unk_24C4E10A8;
  v17 = v15;
  v132 = v17;
  WFLocalizedContentPropertyNameMarker(CFSTR("Priority"));
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", v131, v97, objc_opt_class());
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "possibleValues:", v6);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v129[0] = v16;
  v129[1] = 3221225472;
  v129[2] = __41__WFReminderContentItem_propertyBuilders__block_invoke_8;
  v129[3] = &unk_24C4E10D0;
  v130 = v17;
  v95 = v17;
  objc_msgSend(v94, "setterBlock:", v129);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v133[6] = v93;
  WFLocalizedContentPropertyNameMarker(CFSTR("Is Completed"));
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("reminder.completed"), v91, objc_opt_class());
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedContentPropertyNameMarker(CFSTR("Is Not Completed"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "negativeName:", v89);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedString(CFSTR("Reminder"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "singularItemName:", v87);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "setterBlock:", &__block_literal_global_74_17561);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v133[7] = v85;
  WFLocalizedContentPropertyNameMarker(CFSTR("Is Flagged"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("flagged"), v83, objc_opt_class());
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedContentPropertyNameMarker(CFSTR("Is Not Flagged"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "negativeName:", v81);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedString(CFSTR("Reminder"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "singularItemName:", v79);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setterBlock:", &__block_literal_global_81);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v133[8] = v77;
  WFLocalizedContentPropertyNameMarker(CFSTR("Completion Date"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("reminder.completionDate"), v76, objc_opt_class());
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v133[9] = v75;
  WFLocalizedContentPropertyNameMarker(CFSTR("List"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("reminder.list.name"), v74, objc_opt_class());
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v128[0] = v16;
  v128[1] = 3221225472;
  v128[2] = __41__WFReminderContentItem_propertyBuilders__block_invoke_11;
  v128[3] = &__block_descriptor_40_e14___NSArray_8__0l;
  v128[4] = a1;
  objc_msgSend(v71, "possibleValuesGetter:", v128);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v127[0] = v16;
  v127[1] = 3221225472;
  v127[2] = __41__WFReminderContentItem_propertyBuilders__block_invoke_12;
  v127[3] = &__block_descriptor_40_e61_v24__0__WFReminderContentItemChangeTransaction_8__NSString_16l;
  v127[4] = a1;
  objc_msgSend(v70, "setterBlock:", v127);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v133[10] = v73;
  WFLocalizedContentPropertyNameMarker(CFSTR("Tags"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_93_17570, v69, objc_opt_class());
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "multipleValues:", 1);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "allowedOperators:", &unk_24C512470);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setterBlock:", &__block_literal_global_98_17572);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v133[11] = v65;
  WFLocalizedContentPropertyNameMarker(CFSTR("URL"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("URL"), v64, objc_opt_class());
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "sortable:", 0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setterBlock:", &__block_literal_global_104);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "canLowercaseName:", 0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v133[12] = v60;
  WFLocalizedContentPropertyNameMarker(CFSTR("Images"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("imageAttachments"), v59, objc_opt_class());
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "sortable:", 0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "removable:", 0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "multipleValues:", 1);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setterBlock:", &__block_literal_global_111_17576);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedContentPropertyNameMarker(CFSTR("Image"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "singularItemName:", v53);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v133[13] = v52;
  WFLocalizedContentPropertyNameMarker(CFSTR("Has Subtasks"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("hasSubtasks"), v50, objc_opt_class());
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedContentPropertyNameMarker(CFSTR("Has No Subtasks"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "negativeName:", v48);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedString(CFSTR("Reminder"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "singularItemName:", v46);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v133[14] = v45;
  WFLocalizedContentPropertyNameMarker(CFSTR("Subtasks"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  getREMReminderClass();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("subtasks"), v44, objc_opt_class());
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "multipleValues:", 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "sortable:", 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "filterable:", 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setterBlock:", &__block_literal_global_125_17583);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v133[15] = v39;
  WFLocalizedContentPropertyNameMarker(CFSTR("Parent Reminder"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  getREMReminderClass();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("parentReminder"), v38, objc_opt_class());
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "sortable:", 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "filterable:", 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setterBlock:", &__block_literal_global_132_17586);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v133[16] = v34;
  WFLocalizedContentPropertyNameMarker(CFSTR("Has Alarms"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("hasAlarms"), v32, objc_opt_class());
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedContentPropertyNameMarker(CFSTR("Has No Alarms"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "negativeName:", v30);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedString(CFSTR("Reminder"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "singularItemName:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v133[17] = v20;
  WFLocalizedContentPropertyNameMarker(CFSTR("Reminder Location"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_141, v21, getCLLocationClass_17591());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v133[18] = v22;
  WFLocalizedContentPropertyNameMarker(CFSTR("When Messaging Person"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_145_17594, v23, objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "gettable:", 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "filterable:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setterBlock:", &__block_literal_global_151_17595);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v133[19] = v27;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v133, 20);
  v29 = (id)objc_claimAutoreleasedReturnValue();

  return v29;
}

+ (id)stringConversionBehavior
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "propertyForName:", CFSTR("Title"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentItemStringConversionBehavior accessingProperty:](WFContentItemStringConversionBehavior, "accessingProperty:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)allLists
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  WFGetWorkflowReminderStore();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __33__WFReminderContentItem_allLists__block_invoke;
  v8[3] = &unk_24C4E1398;
  v4 = v3;
  v9 = v4;
  objc_msgSend(v2, "enumerateAllListsWithBlock:", v8);
  getWFContentGraphLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = objc_msgSend(v4, "count");
    *(_DWORD *)buf = 136315394;
    v11 = "+[WFReminderContentItem allLists]";
    v12 = 2048;
    v13 = v6;
    _os_log_impl(&dword_20BBAD000, v5, OS_LOG_TYPE_INFO, "%s Fetched %ld Reminders lists", buf, 0x16u);
  }

  return v4;
}

+ (id)defaultList
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WFGetWorkflowReminderStore();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v2, "fetchDefaultListWithError:", &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    getWFContentGraphLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "+[WFReminderContentItem defaultList]";
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_20BBAD000, v6, OS_LOG_TYPE_ERROR, "%s Failed to fetch default list with error %@", buf, 0x16u);
    }

  }
  return v3;
}

+ (BOOL)hasLibrary
{
  return 1;
}

+ (void)runQuery:(id)a3 withItems:(id)a4 permissionRequestor:(id)a5 completionHandler:(id)a6
{
  +[WFRemindersLibraryFiltering getItemsMatchingQuery:withInput:resultHandler:](WFRemindersLibraryFiltering, "getItemsMatchingQuery:withInput:resultHandler:", a3, a4, a6);
}

+ (BOOL)supportedTypeMustBeDeterminedByInstance:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToClass:", objc_opt_class()) & 1) != 0
    || (objc_msgSend(v4, "isEqualToClass:", objc_opt_class()) & 1) != 0
    || (objc_msgSend(v4, "isEqualToClass:", objc_opt_class()) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___WFReminderContentItem;
    v5 = objc_msgSendSuper2(&v7, sel_supportedTypeMustBeDeterminedByInstance_, v4);
  }

  return v5;
}

+ (id)ownedTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF00];
  +[WFObjectType typeWithClassName:frameworkName:location:](WFObjectType, "typeWithClassName:frameworkName:location:", CFSTR("REMReminder"), CFSTR("ReminderKit"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)outputTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x24BDBCF00];
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithString:", CFSTR("com.apple.ical.ics"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)contentCategories
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("Location");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Reminder (singular)"), CFSTR("Reminder"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Reminders"), CFSTR("Reminders"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Reminders"));
}

+ (id)contactRepresentationWithContact:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v3, "contact");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = v4;
      objc_msgSend(v4, "phoneNumbers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "if_map:", &__block_literal_global_199);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "emailAddresses");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "if_map:", &__block_literal_global_200);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = 0;
      v17 = &v16;
      v18 = 0x2050000000;
      v10 = (void *)getREMContactRepresentationClass_softClass;
      v19 = getREMContactRepresentationClass_softClass;
      if (!getREMContactRepresentationClass_softClass)
      {
        v15[0] = MEMORY[0x24BDAC760];
        v15[1] = 3221225472;
        v15[2] = __getREMContactRepresentationClass_block_invoke;
        v15[3] = &unk_24C4E3118;
        v15[4] = &v16;
        __getREMContactRepresentationClass_block_invoke((uint64_t)v15);
        v10 = (void *)v17[3];
      }
      v11 = objc_retainAutorelease(v10);
      _Block_object_dispose(&v16, 8);
      v12 = (void *)objc_msgSend([v11 alloc], "initWithPhones:emails:", v7, v9);

    }
    else
    {
      v12 = 0;
    }
    v13 = v3;
  }
  else
  {

    v13 = 0;
    v12 = 0;
  }

  return v12;
}

uint64_t __58__WFReminderContentItem_contactRepresentationWithContact___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "value");
}

id __58__WFReminderContentItem_contactRepresentationWithContact___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unformattedInternationalStringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __33__WFReminderContentItem_allLists__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __41__WFReminderContentItem_propertyBuilders__block_invoke_7(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "allKeys", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v12);
        objc_msgSend(v6, "reminder");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "containsIndex:", objc_msgSend(v14, "priority"));

        if (v15)
        {
          objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v13);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v7[2](v7, v16);

          goto LABEL_11;
        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v10)
        continue;
      break;
    }
  }

  v7[2](v7, 0);
LABEL_11:

}

void __41__WFReminderContentItem_propertyBuilders__block_invoke_8(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v11 = v5;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "allKeysForObject:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v6, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "firstIndex");
      objc_msgSend(v11, "mutableReminder");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setPriority:", v9);

    }
  }
  else
  {
    objc_msgSend(v5, "mutableReminder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPriority:", 0);
  }

}

id __41__WFReminderContentItem_propertyBuilders__block_invoke_11(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "allLists");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "valueForKey:", CFSTR("name"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void __41__WFReminderContentItem_propertyBuilders__block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "allLists");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectMatchingKey:value:", CFSTR("name"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v9, "updateList:", v8);

}

void __41__WFReminderContentItem_propertyBuilders__block_invoke_8_149(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(a2, "mutableReminder");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[WFReminderContentItem contactRepresentationWithContact:](WFReminderContentItem, "contactRepresentationWithContact:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setContactHandles:", v5);
}

void __41__WFReminderContentItem_propertyBuilders__block_invoke_6_139(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  char isKindOfClass;
  void *v17;
  void *v18;
  id v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  id v24;
  void (**v25)(id, void *);
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[5];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v24 = a3;
  v25 = a4;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v6, "reminder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "alarms");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v12, "trigger");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 0;
        v32 = &v31;
        v33 = 0x2050000000;
        v14 = (void *)getREMAlarmLocationTriggerClass_softClass;
        v34 = getREMAlarmLocationTriggerClass_softClass;
        if (!getREMAlarmLocationTriggerClass_softClass)
        {
          v30[0] = MEMORY[0x24BDAC760];
          v30[1] = 3221225472;
          v30[2] = __getREMAlarmLocationTriggerClass_block_invoke;
          v30[3] = &unk_24C4E3118;
          v30[4] = &v31;
          __getREMAlarmLocationTriggerClass_block_invoke((uint64_t)v30);
          v14 = (void *)v32[3];
        }
        v15 = objc_retainAutorelease(v14);
        _Block_object_dispose(&v31, 8);
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v12, "trigger");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "structuredLocation");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v19 = objc_alloc((Class)getCLLocationClass_17591());
          objc_msgSend(v18, "latitude");
          v21 = v20;
          objc_msgSend(v18, "longitude");
          v23 = (void *)objc_msgSend(v19, "initWithLatitude:longitude:", v21, v22);
          v25[2](v25, v23);

          goto LABEL_13;
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
      if (v9)
        continue;
      break;
    }
  }

  v25[2](v25, 0);
LABEL_13:

}

void __41__WFReminderContentItem_propertyBuilders__block_invoke_5_130(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "remObjectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v8, "mutableReminder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setParentReminderID:", v6);

  if (v5)
}

uint64_t __41__WFReminderContentItem_propertyBuilders__block_invoke_4_124(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateSubtasks:");
}

uint64_t __41__WFReminderContentItem_propertyBuilders__block_invoke_3_110(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateImageFiles:");
}

void __41__WFReminderContentItem_propertyBuilders__block_invoke_2_102(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v10 = a2;
  v4 = a3;
  objc_msgSend(v10, "mutableReminder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attachmentContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeURLAttachments");

  if (v4)
  {
    objc_msgSend(v10, "mutableReminder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attachmentContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v8, "addURLAttachmentWithURL:", v4);

  }
}

uint64_t __41__WFReminderContentItem_propertyBuilders__block_invoke_96(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateTags:");
}

void __41__WFReminderContentItem_propertyBuilders__block_invoke_13(uint64_t a1, void *a2, uint64_t a3, void (**a4)(_QWORD, _QWORD))
{
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  objc_msgSend(a2, "reminder");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hashtags");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForKey:", CFSTR("name"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))a4)[2](v6, v9);

}

void __41__WFReminderContentItem_propertyBuilders__block_invoke_10(uint64_t a1, void *a2, unint64_t a3)
{
  void *v4;
  id v5;

  v5 = a2;
  if (a3)
    a3 = objc_msgSend((id)a3, "BOOLValue");
  objc_msgSend(v5, "mutableReminder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFlagged:", a3);

}

void __41__WFReminderContentItem_propertyBuilders__block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;

  v5 = a2;
  if (a3)
    a3 = (void *)objc_msgSend(a3, "BOOLValue");
  objc_msgSend(v5, "mutableReminder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCompleted:", a3);

}

void __41__WFReminderContentItem_propertyBuilders__block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a2, "mutableReminder");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDueDateComponentsWithAlarmsIfNeeded:", v4);

}

void __41__WFReminderContentItem_propertyBuilders__block_invoke_5(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void (**v5)(id, void *);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a4;
  objc_msgSend(v12, "reminder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dueDateComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "reminder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dueDateComponents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dateFromComponents:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v11);

  }
  else
  {
    v5[2](v5, 0);
  }

}

void __41__WFReminderContentItem_propertyBuilders__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __41__WFReminderContentItem_propertyBuilders__block_invoke_4;
  v7[3] = &unk_24C4E2420;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a2, "getPreferredFileSize:", v7);

}

void __41__WFReminderContentItem_propertyBuilders__block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  WFFileSize *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = -[WFFileSize initWithByteCount:]([WFFileSize alloc], "initWithByteCount:", a2);
  (*(void (**)(uint64_t, WFFileSize *))(v2 + 16))(v2, v3);

}

void __41__WFReminderContentItem_propertyBuilders__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  __CFString *v4;
  id v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  id v16;

  v4 = a3;
  v5 = a2;
  objc_msgSend(v5, "mode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", CFSTR("Append"));

  v8 = objc_alloc(MEMORY[0x24BDD1458]);
  v9 = v8;
  if (v7)
  {
    objc_msgSend(v5, "mutableReminder");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "notes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "string");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByAppendingAsNewLine:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)objc_msgSend(v9, "initWithString:", v12);
    objc_msgSend(v5, "mutableReminder");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setNotes:", v13);
  }
  else
  {
    if (v4)
      v15 = v4;
    else
      v15 = &stru_24C4E3948;
    v16 = (id)objc_msgSend(v8, "initWithString:", v15);

    objc_msgSend(v5, "mutableReminder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setNotes:", v16);
  }

}

void __41__WFReminderContentItem_propertyBuilders__block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_class *v4;
  __CFString *v5;
  id v6;
  id v7;
  const __CFString *v8;
  void *v9;
  id v10;

  v4 = (objc_class *)MEMORY[0x24BDD1458];
  v5 = a3;
  v6 = a2;
  v7 = [v4 alloc];
  if (v5)
    v8 = v5;
  else
    v8 = &stru_24C4E3948;
  v10 = (id)objc_msgSend(v7, "initWithString:", v8);

  objc_msgSend(v6, "mutableReminder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setTitle:", v10);
}

@end
