@implementation EKCalendarResourceChangeNotification(CUIKDescription)

- (BOOL)supportsDisplay
{
  return objc_msgSend(a1, "type") == 4
      || objc_msgSend(a1, "type") == 5
      || objc_msgSend(a1, "type") == 6
      || objc_msgSend(a1, "type") == 7
      || objc_msgSend(a1, "type") == 11;
}

- (id)_resourceChangeStringWithOptions:()CUIKDescription dict:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  id v15;
  void *v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  int v33;
  int v34;
  int v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  const __CFString *v47;
  void *v48;
  void *v49;
  const __CFString *v50;
  void *v51;
  void *v52;
  void *v53;
  const __CFString *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  const __CFString *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  const __CFString *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  const __CFString *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  const __CFString *v74;
  void *v75;
  void *v76;
  const __CFString *v77;
  void *v78;
  uint64_t v79;
  int v80;
  void *v81;
  void *v82;
  int v83;
  int v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  const __CFString *v88;
  void *v89;
  void *v90;
  id v91;
  BOOL v92;
  int v93;
  int v94;
  id v96;
  void *v97;
  const __CFString *v98;
  NSObject *v99;
  void *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  void *v107;

  v6 = a4;
  +[CUIKNotificationDescriptionGenerator sharedGenerator](CUIKNotificationDescriptionGenerator, "sharedGenerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "type") == 4)
  {
    CUIKBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Added to %@ by %@"), &stru_1E6EBAE30, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "calendarName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
    objc_msgSend(a1, "_identityStringWithOptions:", a3);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v17 = 1;
    goto LABEL_129;
  }
  if (objc_msgSend(a1, "type") != 5 && objc_msgSend(a1, "type") != 13)
  {
    if (objc_msgSend(a1, "type") == 6 || objc_msgSend(a1, "type") == 14)
    {
      v18 = objc_msgSend(a1, "dateChanged");
      v19 = objc_msgSend(a1, "timeChanged") + v18;
      v20 = objc_msgSend(a1, "titleChanged");
      v21 = v19 + v20 + objc_msgSend(a1, "locationChanged");
      objc_msgSend(a1, "_identityStringWithOptions:", a3);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(a1, "type") == 6 && v22 != 0;
      if (v21 == 1)
      {
        if (objc_msgSend(a1, "dateChanged"))
        {
          CUIKBundle();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v24;
          if (v17)
          {
            objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("Date changed to %@ by %@"), &stru_1E6EBAE30, 0);
            v9 = (void *)objc_claimAutoreleasedReturnValue();

            v15 = v22;
          }
          else
          {
            objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("Date changed to %@"), &stru_1E6EBAE30, 0);
            v9 = (void *)objc_claimAutoreleasedReturnValue();

            v15 = 0;
          }
          objc_msgSend(v7, "_sharedDateFormatter");
          v72 = objc_claimAutoreleasedReturnValue();
LABEL_121:
          v89 = (void *)v72;
          objc_msgSend(a1, "startDate");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "stringFromDate:", v90);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_128;
        }
        if (objc_msgSend(a1, "timeChanged"))
        {
          v42 = (void *)MEMORY[0x1E0D0C2B0];
          objc_msgSend(a1, "startDate");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v42, "requiresSingularLocalizationForDate:", v43);

          CUIKBundle();
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = v45;
          if (v17)
          {
            if (v44)
              v47 = CFSTR("Time changed to %@ by %@ (singular hour)");
            else
              v47 = CFSTR("Time changed to %@ by %@ (plural hour)");
            objc_msgSend(v45, "localizedStringForKey:value:table:", v47, CFSTR("Time changed to %@ by %@"), 0);
            v9 = (void *)objc_claimAutoreleasedReturnValue();

            v15 = v22;
          }
          else
          {
            if (v44)
              v77 = CFSTR("Time changed to %@ (singular hour)");
            else
              v77 = CFSTR("Time changed to %@ (plural hour)");
            objc_msgSend(v45, "localizedStringForKey:value:table:", v77, CFSTR("Time changed to %@"), 0);
            v9 = (void *)objc_claimAutoreleasedReturnValue();

            v15 = 0;
          }
          objc_msgSend(v7, "_sharedTimeFormatter");
          v72 = objc_claimAutoreleasedReturnValue();
          goto LABEL_121;
        }
        if (objc_msgSend(a1, "titleChanged"))
        {
          CUIKBundle();
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            v74 = CFSTR("Title changed by %@");
LABEL_125:
            objc_msgSend(v73, "localizedStringForKey:value:table:", v74, &stru_1E6EBAE30, 0);
            v9 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_126;
          }
          v88 = CFSTR("Title changed");
LABEL_116:
          objc_msgSend(v73, "localizedStringForKey:value:table:", v88, &stru_1E6EBAE30, 0);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_117:
          v15 = 0;
          v10 = 0;
          goto LABEL_128;
        }
        if (!objc_msgSend(a1, "locationChanged"))
        {
          v15 = 0;
          v10 = 0;
          v9 = 0;
          goto LABEL_128;
        }
        objc_msgSend(a1, "location");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = objc_msgSend(v78, "length");

        if (v79)
          v80 = v17;
        else
          v80 = 0;
        CUIKBundle();
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = v81;
        if (v80 != 1)
        {
          if (v17)
          {
            v74 = CFSTR("Location changed by %@");
            goto LABEL_125;
          }
          if (v79)
          {
            objc_msgSend(v81, "localizedStringForKey:value:table:", CFSTR("Location changed to %@"), &stru_1E6EBAE30, 0);
            v9 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(a1, "location");
            v91 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_127;
          }
          v88 = CFSTR("Location changed.");
          goto LABEL_116;
        }
        objc_msgSend(v81, "localizedStringForKey:value:table:", CFSTR("Location changed to %@ by %@"), &stru_1E6EBAE30, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = v22;
        objc_msgSend(a1, "location");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if ((v21 - 1) > 1)
        {
          CUIKBundle();
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = v48;
          if (v17)
            v50 = CFSTR("Updated in %@ by %@");
          else
            v50 = CFSTR("Updated in %@");
          if (v17)
            v51 = v22;
          else
            v51 = 0;
          objc_msgSend(v48, "localizedStringForKey:value:table:", v50, &stru_1E6EBAE30, 0);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(a1, "calendarName");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v51;
          goto LABEL_128;
        }
        if (objc_msgSend(a1, "dateChanged") && objc_msgSend(a1, "timeChanged"))
        {
          CUIKBundle();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v26;
          if (v17)
            v28 = CFSTR("Date and time changed by %@");
          else
            v28 = CFSTR("Date and time changed");
          objc_msgSend(v26, "localizedStringForKey:value:table:", v28, &stru_1E6EBAE30, 0);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v9 = 0;
        }
        if (objc_msgSend(a1, "dateChanged") && objc_msgSend(a1, "titleChanged"))
        {
          CUIKBundle();
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = v52;
          if (v17)
            v54 = CFSTR("Date and title changed by %@");
          else
            v54 = CFSTR("Date and title changed");
          objc_msgSend(v52, "localizedStringForKey:value:table:", v54, &stru_1E6EBAE30, 0);
          v55 = objc_claimAutoreleasedReturnValue();

          v9 = (void *)v55;
        }
        if (objc_msgSend(a1, "dateChanged") && objc_msgSend(a1, "locationChanged"))
        {
          CUIKBundle();
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = v56;
          if (v17)
            v58 = CFSTR("Date and location changed by %@");
          else
            v58 = CFSTR("Date and location changed");
          objc_msgSend(v56, "localizedStringForKey:value:table:", v58, &stru_1E6EBAE30, 0);
          v59 = objc_claimAutoreleasedReturnValue();

          v9 = (void *)v59;
        }
        if (objc_msgSend(a1, "timeChanged") && objc_msgSend(a1, "titleChanged"))
        {
          CUIKBundle();
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = v60;
          if (v17)
            v62 = CFSTR("Time and title changed by %@");
          else
            v62 = CFSTR("Time and title changed");
          objc_msgSend(v60, "localizedStringForKey:value:table:", v62, &stru_1E6EBAE30, 0);
          v63 = objc_claimAutoreleasedReturnValue();

          v9 = (void *)v63;
        }
        if (objc_msgSend(a1, "timeChanged") && objc_msgSend(a1, "locationChanged"))
        {
          CUIKBundle();
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = v64;
          if (v17)
            v66 = CFSTR("Time and location changed by %@");
          else
            v66 = CFSTR("Time and location changed");
          objc_msgSend(v64, "localizedStringForKey:value:table:", v66, &stru_1E6EBAE30, 0);
          v67 = objc_claimAutoreleasedReturnValue();

          v9 = (void *)v67;
        }
        if (!objc_msgSend(a1, "titleChanged") || !objc_msgSend(a1, "locationChanged"))
        {
          if (v17)
            goto LABEL_126;
          goto LABEL_117;
        }
        CUIKBundle();
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = v68;
        if (v17)
        {
          objc_msgSend(v68, "localizedStringForKey:value:table:", CFSTR("Location and title changed by %@"), &stru_1E6EBAE30, 0);
          v70 = objc_claimAutoreleasedReturnValue();

          v9 = (void *)v70;
LABEL_126:
          v91 = v22;
LABEL_127:
          v10 = v91;
          v15 = 0;
          goto LABEL_128;
        }
        objc_msgSend(v68, "localizedStringForKey:value:table:", CFSTR("Location and title changed"), &stru_1E6EBAE30, 0);
        v87 = objc_claimAutoreleasedReturnValue();

        v15 = 0;
        v10 = 0;
        v9 = (void *)v87;
      }
LABEL_128:

      v16 = 0;
      goto LABEL_129;
    }
    if (objc_msgSend(a1, "type") != 7)
    {
      if (objc_msgSend(a1, "type") == 11)
      {
        CUIKBundle();
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "localizedStringForKey:value:table:", CFSTR("This calendar is now public."), &stru_1E6EBAE30, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = 0;
        v16 = 0;
        v15 = 0;
        v10 = 0;
      }
      else
      {
        v17 = 0;
        v16 = 0;
        v15 = 0;
        v10 = 0;
        v9 = 0;
      }
      goto LABEL_129;
    }
    objc_msgSend(a1, "updateCount");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "createCount");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "deleteCount");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = v29;
    v32 = objc_msgSend(v29, "intValue");
    v33 = objc_msgSend(v30, "intValue");
    v34 = objc_msgSend(v31, "intValue");
    v35 = v34;
    if (v33 && !v34 && !v32)
    {
      objc_msgSend(a1, "name");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (v36 || (objc_msgSend(a1, "emailAddress"), (v36 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {

      }
      else
      {
        objc_msgSend(a1, "phoneNumber");
        v101 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v101)
        {
          CUIKBundle();
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("%@ events were added to %@."), &stru_1E6EBAE30, 0);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = 1;
          goto LABEL_38;
        }
      }
      CUIKBundle();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("%@ events were added to %@ by %@."), &stru_1E6EBAE30, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 0;
LABEL_38:

      objc_msgSend(v7, "_sharedNumberFormatter");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v39;
      v41 = v30;
LABEL_98:
      objc_msgSend(v39, "stringFromNumber:", v41);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_113:

      v17 = v38 ^ 1;
      objc_msgSend(a1, "calendarName");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_identityStringWithOptions:", a3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_129;
    }
    objc_msgSend(a1, "name");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35 && !v33 && !v32)
    {
      if (v75 || (objc_msgSend(a1, "emailAddress"), (v75 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {

      }
      else
      {
        objc_msgSend(a1, "phoneNumber");
        v102 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v102)
        {
          CUIKBundle();
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "localizedStringForKey:value:table:", CFSTR("%@ events were deleted from %@."), &stru_1E6EBAE30, 0);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = 1;
          goto LABEL_97;
        }
      }
      CUIKBundle();
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "localizedStringForKey:value:table:", CFSTR("%@ events were deleted from %@ by %@."), &stru_1E6EBAE30, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 0;
LABEL_97:

      objc_msgSend(v7, "_sharedNumberFormatter");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v39;
      v41 = v31;
      goto LABEL_98;
    }
    if (v75 || (objc_msgSend(a1, "emailAddress"), (v75 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {

    }
    else
    {
      objc_msgSend(a1, "phoneNumber");
      v103 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v103)
      {
        CUIKBundle();
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "localizedStringForKey:value:table:", CFSTR("%@ events were updated in %@."), &stru_1E6EBAE30, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 1;
        goto LABEL_112;
      }
    }
    CUIKBundle();
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "localizedStringForKey:value:table:", CFSTR("%@ events were updated in %@ by %@."), &stru_1E6EBAE30, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0;
LABEL_112:

    v83 = objc_msgSend(v107, "intValue");
    v106 = v30;
    v84 = objc_msgSend(v30, "intValue") + v83;
    v85 = v84 + objc_msgSend(v31, "intValue");
    objc_msgSend(v7, "_sharedNumberFormatter");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v85);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "stringFromNumber:", v86);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = v106;
    goto LABEL_113;
  }
  v11 = objc_msgSend(a1, "type");
  CUIKBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11 == 5)
    v14 = CFSTR("Deleted from %@ by %@");
  else
    v14 = CFSTR("Deleted from %@");
  objc_msgSend(v12, "localizedStringForKey:value:table:", v14, &stru_1E6EBAE30, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "calendarName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 == 5)
    goto LABEL_9;
  v17 = 0;
  v16 = 0;
  v15 = 0;
LABEL_129:
  if (v9)
    v92 = v10 == 0;
  else
    v92 = 1;
  v93 = !v92;
  if (v15)
    v94 = v93;
  else
    v94 = 0;
  if (v94 == 1 && v16 != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v9, CFSTR("%@%@%@"), 0, v10, v15, v16);
LABEL_147:
    v96 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_148;
  }
  if (v94)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v9, CFSTR("%@%@"), 0, v10, v15, v105);
    goto LABEL_147;
  }
  if (v93)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v9, CFSTR("%@"), 0, v10, v104, v105);
    goto LABEL_147;
  }
  if (v9)
  {
    v96 = v9;
LABEL_148:
    v97 = v96;
    if (!v6)
      goto LABEL_157;
    goto LABEL_149;
  }
  +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
  v99 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
    -[EKCalendarResourceChangeNotification(CUIKDescription) _resourceChangeStringWithOptions:dict:].cold.1();

  v97 = 0;
  if (!v6)
    goto LABEL_157;
LABEL_149:
  if (objc_msgSend(a1, "_changedPropertyCount") == 1 && objc_msgSend(a1, "dateChanged"))
  {
    v98 = CFSTR("Date");
    goto LABEL_160;
  }
LABEL_157:
  if (v17)
    v98 = CFSTR("Person");
  else
    v98 = CFSTR("Action");
LABEL_160:
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v97, v98);

  return v97;
}

- (id)_dateStringWithOptions:()CUIKDescription
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  if ((a3 & 0x40) != 0
    && (objc_msgSend(a1, "type") == 4
     || objc_msgSend(a1, "type") == 6
     && (objc_msgSend(a1, "_changedPropertyCount") != 1
      || (objc_msgSend(a1, "dateChanged") & 1) == 0 && (objc_msgSend(a1, "timeChanged") & 1) == 0)))
  {
    v5 = objc_msgSend(a1, "allDay");
    objc_msgSend(a1, "startDateForNextOccurrence");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend(a1, "startDate");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;

    +[CUIKDateDescriptionGenerator sharedGenerator](CUIKDateDescriptionGenerator, "sharedGenerator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dateStringForDate:allDay:shortFormat:", v9, v5, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)allDescriptionStringsWithOptions:()CUIKDescription
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_resourceChangeStringWithOptions:dict:", a3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_dateStringWithOptions:", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
  {
    v14 = v6;
    v15 = v5;
    v8 = (void *)MEMORY[0x1E0C99D20];
    v9 = &v14;
    v10 = 2;
  }
  else
  {
    v13 = v5;
    v8 = (void *)MEMORY[0x1E0C99D20];
    v9 = (uint64_t *)&v13;
    v10 = 1;
  }
  objc_msgSend(v8, "arrayWithObjects:count:", v9, v10, v13, v14, v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)descriptionStrings:()CUIKDescription
{
  void *v5;
  id v6;
  void *v7;

  v5 = (void *)objc_opt_new();
  v6 = (id)objc_msgSend(a1, "_resourceChangeStringWithOptions:dict:", a3, v5);
  objc_msgSend(a1, "_dateStringWithOptions:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("Date"));

  return v5;
}

- (uint64_t)_changedPropertyCount
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  LODWORD(v2) = objc_msgSend(a1, "dateChanged");
  v3 = objc_msgSend(a1, "timeChanged");
  v4 = 1;
  if ((_DWORD)v2)
    v4 = 2;
  if (v3)
    v2 = v4;
  else
    v2 = v2;
  v5 = v2 + objc_msgSend(a1, "titleChanged");
  return v5 + objc_msgSend(a1, "locationChanged");
}

- (void)_resourceChangeStringWithOptions:()CUIKDescription dict:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend((id)objc_opt_class(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0(&dword_1B8A6A000, v1, v2, "Unhandled type of %@. Can't generate human readable description.", v3, v4, v5, v6, 2u);

}

@end
