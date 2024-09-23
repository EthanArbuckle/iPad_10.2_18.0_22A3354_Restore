@implementation CADContactEventsPredicate

- (CADContactEventsPredicate)initWithCalendarIDs:(id)a3 startDate:(id)a4 endDate:(id)a5 contacts:(id)a6
{
  id v10;
  id v11;
  id v12;
  CADContactEventsPredicate *v13;
  void *v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  void *v21;
  objc_class *v22;
  CADContactEventsPredicate *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  CADContactEventsPredicate *v46;
  id v47;
  id v48;
  id v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id obj;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  objc_super v64;
  _BYTE v65[128];
  uint8_t v66[128];
  uint8_t buf[4];
  void *v68;
  __int16 v69;
  id v70;
  __int16 v71;
  id v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v64.receiver = self;
  v64.super_class = (Class)CADContactEventsPredicate;
  v13 = -[EKPredicate initWithCalendars:](&v64, sel_initWithCalendars_, a3);
  if (!v13)
    goto LABEL_31;
  if (v10 && v11)
  {
    if (objc_msgSend(v10, "CalIsAfterDate:", v11))
    {
      v14 = (void *)CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
      {
        v15 = v14;
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v68 = v17;
        v69 = 2112;
        v70 = v10;
        v71 = 2112;
        v72 = v11;
        v18 = "[%@] must be given a 'startDate' that occurs before the given 'endDate.'  startDate: [%@] endDate: [%@]";
        v19 = v15;
        v20 = 32;
LABEL_9:
        _os_log_impl(&dword_1B6A18000, v19, OS_LOG_TYPE_ERROR, v18, buf, v20);

        goto LABEL_10;
      }
      goto LABEL_10;
    }
    v49 = v10;
    -[EKPredicate setStartDate:](v13, "setStartDate:", v10);
    v46 = v13;
    v48 = v11;
    -[EKPredicate setEndDate:](v13, "setEndDate:", v11);
    v24 = (void *)objc_opt_new();
    v50 = (void *)objc_opt_new();
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v47 = v12;
    obj = v12;
    v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v61;
      v28 = *MEMORY[0x1E0C966A8];
      v55 = *MEMORY[0x1E0C966D0];
      v51 = *MEMORY[0x1E0C966C0];
      v52 = *MEMORY[0x1E0C966A8];
      do
      {
        v29 = 0;
        v53 = v26;
        do
        {
          if (*(_QWORD *)v61 != v27)
            objc_enumerationMutation(obj);
          v30 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v29);
          if (objc_msgSend(v30, "isKeyAvailable:", v28))
          {
            v31 = v27;
            objc_msgSend(v30, "emailAddresses");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "valueForKey:", CFSTR("value"));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = 0u;
            v57 = 0u;
            v58 = 0u;
            v59 = 0u;
            v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
            if (v34)
            {
              v35 = v34;
              v36 = *(_QWORD *)v57;
              do
              {
                for (i = 0; i != v35; ++i)
                {
                  if (*(_QWORD *)v57 != v36)
                    objc_enumerationMutation(v33);
                  objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * i), "lowercaseString");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "addObject:", v38);

                }
                v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
              }
              while (v35);
            }

            v27 = v31;
            v28 = v52;
            v26 = v53;
          }
          if (objc_msgSend(v30, "isKeyAvailable:", v55)
            && objc_msgSend(v30, "isKeyAvailable:", v51))
          {
            objc_msgSend(v30, "familyName");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "givenName");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "stringByAppendingString:", v40);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "addObject:", v41);

            objc_msgSend(v30, "givenName");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "familyName");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "stringByAppendingString:", v43);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "addObject:", v44);

          }
          ++v29;
        }
        while (v29 != v26);
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
      }
      while (v26);
    }

    v13 = v46;
    -[CADContactEventsPredicate setContactEmailAddresses:](v46, "setContactEmailAddresses:", v24);
    -[CADContactEventsPredicate setContactNameComponents:](v46, "setContactNameComponents:", v50);

    v11 = v48;
    v10 = v49;
    v12 = v47;
LABEL_31:
    v23 = v13;
    goto LABEL_32;
  }
  v21 = (void *)CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
  {
    v15 = v21;
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v68 = v17;
    v18 = "[%@] must be given non-nil 'startDate' and 'endDate'";
    v19 = v15;
    v20 = 12;
    goto LABEL_9;
  }
LABEL_10:
  v23 = 0;
LABEL_32:

  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CADContactEventsPredicate)initWithCoder:(id)a3
{
  id v4;
  CADContactEventsPredicate *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CADContactEventsPredicate;
  v5 = -[EKPredicate initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKPredicate setStartDate:](v5, "setStartDate:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKPredicate setEndDate:](v5, "setEndDate:", v7);

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("contactEmailAddresses"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADContactEventsPredicate setContactEmailAddresses:](v5, "setContactEmailAddresses:", v11);

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("contactNameComponents"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADContactEventsPredicate setContactNameComponents:](v5, "setContactNameComponents:", v12);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CADContactEventsPredicate;
  v4 = a3;
  -[EKPredicate encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  -[EKPredicate startDate](self, "startDate", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("startDate"));

  -[EKPredicate endDate](self, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("endDate"));

  -[CADContactEventsPredicate contactEmailAddresses](self, "contactEmailAddresses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("contactEmailAddresses"));

  -[CADContactEventsPredicate contactNameComponents](self, "contactNameComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("contactNameComponents"));

}

- (id)predicateFormat
{
  id v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v3, "setDateStyle:", 1);
  objc_msgSend(v3, "setTimeStyle:", 1);
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPredicate startDate](self, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPredicate endDate](self, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPredicate calendars](self, "calendars");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[CADPredicate conciseCalendarList:](CADPredicate, "conciseCalendarList:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("[%@] start:%@; end:%@; cals:%@"), v6, v8, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  CADContactEventsPredicate *v5;
  uint64_t v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;

  v5 = (CADContactEventsPredicate *)a3;
  if (v5 == self)
  {
    v7 = 1;
    goto LABEL_25;
  }
  v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    -[EKPredicate startDate](v5, "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKPredicate startDate](self, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "isEqual:", v9))
    {
      v7 = 0;
LABEL_24:

      goto LABEL_25;
    }
    -[EKPredicate endDate](v5, "endDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKPredicate endDate](self, "endDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v10, "isEqual:", v11))
    {
      v7 = 0;
LABEL_23:

      goto LABEL_24;
    }
    -[EKPredicate calendars](v5, "calendars");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKPredicate calendars](self, "calendars");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v12;
    if (v12 != v29)
    {
      -[EKPredicate calendars](v5, "calendars");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKPredicate calendars](self, "calendars");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v12, "isEqual:", v3))
      {
        v7 = 0;
        goto LABEL_21;
      }
    }
    -[CADContactEventsPredicate contactEmailAddresses](v5, "contactEmailAddresses");
    v13 = objc_claimAutoreleasedReturnValue();
    -[CADContactEventsPredicate contactEmailAddresses](self, "contactEmailAddresses");
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)v13;
    if (v13 == v27
      || (-[CADContactEventsPredicate contactEmailAddresses](v5, "contactEmailAddresses"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          -[CADContactEventsPredicate contactEmailAddresses](self, "contactEmailAddresses"),
          v25 = (void *)objc_claimAutoreleasedReturnValue(),
          v26 = v14,
          objc_msgSend(v14, "isEqual:")))
    {
      -[CADContactEventsPredicate contactNameComponents](v5, "contactNameComponents", v3, v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CADContactEventsPredicate contactNameComponents](self, "contactNameComponents");
      v16 = objc_claimAutoreleasedReturnValue();
      if (v15 == (void *)v16)
      {

        v7 = 1;
      }
      else
      {
        v17 = (void *)v16;
        -[CADContactEventsPredicate contactNameComponents](v5, "contactNameComponents");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[CADContactEventsPredicate contactNameComponents](self, "contactNameComponents");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v18, "isEqual:", v19);

      }
      v21 = (void *)v27;
      v20 = v28;
      v3 = v23;
      v12 = v24;
      if (v28 == (void *)v27)
      {
LABEL_20:

        if (v30 == v29)
        {
LABEL_22:

          goto LABEL_23;
        }
LABEL_21:

        goto LABEL_22;
      }
    }
    else
    {
      v7 = 0;
      v21 = (void *)v27;
      v20 = v28;
    }

    goto LABEL_20;
  }
  v7 = 0;
LABEL_25:

  return v7;
}

- (id)copyMatchingItemsWithDatabase:(CalDatabase *)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  const void *v8;
  uint64_t AuxilliaryDatabaseID;
  void *v10;
  void *v11;
  const void *FilterFromRowIDs;
  void *v13;
  NSObject *v14;
  CADContactEventsPredicate *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFArray *v20;
  CFIndex Count;
  NSObject *v22;
  CFIndex v23;
  uint64_t v24;
  const void *ValueAtIndex;
  void *v26;
  NSObject *v28;
  void *v29;
  void *v30;
  _QWORD v31[5];
  id v32;
  const void *v33;
  uint8_t buf[4];
  CADContactEventsPredicate *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  -[EKPredicate startDate](self, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPredicate endDate](self, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "CalIsAfterDate:", v5);

  if ((v6 & 1) != 0)
    return (id)MEMORY[0x1E0C9AA60];
  v8 = (const void *)CalDatabaseCopyEventOccurrenceCache();
  AuxilliaryDatabaseID = CalDatabaseGetAuxilliaryDatabaseID();
  -[EKPredicate calendarRowIDsForDatabaseID:](self, "calendarRowIDsForDatabaseID:", AuxilliaryDatabaseID);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPredicate restrictedCalendarRowIDsForDatabaseID:](self, "restrictedCalendarRowIDsForDatabaseID:", AuxilliaryDatabaseID);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  FilterFromRowIDs = (const void *)CreateFilterFromRowIDs(v10, v11);
  v13 = (void *)CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
  {
    v14 = v13;
    -[EKPredicate startDate](self, "startDate");
    v15 = (CADContactEventsPredicate *)objc_claimAutoreleasedReturnValue();
    -[EKPredicate endDate](self, "endDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v35 = v15;
    v36 = 2112;
    v37 = v16;
    v38 = 2112;
    v39 = v10;
    _os_log_impl(&dword_1B6A18000, v14, OS_LOG_TYPE_DEBUG, "Commencing contact event search with start date: [%@] end date: [%@] calendar object IDs: [%@]", buf, 0x20u);

  }
  -[EKPredicate startDate](self, "startDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPredicate endDate](self, "endDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (const __CFArray *)CalEventOccurrenceCacheCopyEventOccurrencesInDateRange();

  if (v20)
  {
    v29 = v11;
    v30 = v10;
    Count = CFArrayGetCount(v20);
    v22 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v35 = (CADContactEventsPredicate *)Count;
      _os_log_impl(&dword_1B6A18000, v22, OS_LOG_TYPE_DEBUG, "Found [%ld] contact event candidates.  Proceeding to filter.", buf, 0xCu);
    }
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", Count);
    if (Count >= 1)
    {
      v23 = 0;
      v24 = MEMORY[0x1E0C809B0];
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v20, v23);
        CalEventOccurrenceGetEvent();
        v26 = (void *)CalCalendarItemCopyAttendees();
        v31[0] = v24;
        v31[1] = 3221225472;
        v31[2] = __59__CADContactEventsPredicate_copyMatchingItemsWithDatabase___block_invoke;
        v31[3] = &unk_1E6A36B90;
        v31[4] = self;
        v32 = v7;
        v33 = ValueAtIndex;
        objc_msgSend(v26, "enumerateObjectsUsingBlock:", v31);

        ++v23;
      }
      while (Count != v23);
    }
    CFRelease(v20);
    v10 = v30;
    v11 = v29;
    if (!FilterFromRowIDs)
      goto LABEL_13;
  }
  else
  {
    v28 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v35 = self;
      _os_log_impl(&dword_1B6A18000, v28, OS_LOG_TYPE_DEBUG, "NULL occurrences array returned for [%@].", buf, 0xCu);
    }
    v7 = 0;
    if (!FilterFromRowIDs)
      goto LABEL_13;
  }
  CFRelease(FilterFromRowIDs);
LABEL_13:
  if (v8)
    CFRelease(v8);

  return v7;
}

void __59__CADContactEventsPredicate_copyMatchingItemsWithDatabase___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  id v20;

  v20 = a2;
  v6 = (void *)MEMORY[0x1BCC9B884]();
  objc_msgSend(*(id *)(a1 + 32), "contactEmailAddresses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v6);

  if (!v8)
  {
    v9 = (void *)MEMORY[0x1BCC9B890](v20);
    v10 = MEMORY[0x1BCC9B89C](v20);
    v11 = (void *)v10;
    if (!v9 || !v10)
    {
      if (!v9)
      {
        if (!v10)
          goto LABEL_10;
LABEL_9:
        CFRelease(v11);
        goto LABEL_10;
      }
LABEL_14:
      CFRelease(v9);
      if (!v11)
        goto LABEL_10;
      goto LABEL_9;
    }
    v12 = v9;
    v13 = v11;
    objc_msgSend(*(id *)(a1 + 32), "contactNameComponents");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByAppendingString:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "containsObject:", v15))
    {

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "contactNameComponents");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringByAppendingString:", v12);
      v19 = v12;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "containsObject:", v17);

      v12 = v19;
      if (!v18)
      {
LABEL_13:

        goto LABEL_14;
      }
    }
    objc_msgSend(*(id *)(a1 + 40), "addObject:", *(_QWORD *)(a1 + 48));
    *a4 = 1;
    goto LABEL_13;
  }
  objc_msgSend(*(id *)(a1 + 40), "addObject:", *(_QWORD *)(a1 + 48));
  *a4 = 1;
LABEL_10:

}

- (BOOL)_isCandidate:(void *)a3 allowAllDayEvent:(BOOL)a4
{
  uint64_t v5;
  const void *v6;
  int ParticipationStatus;
  uint64_t v8;
  const void *v9;
  uint64_t v10;
  const void *v11;
  char IsFoundInMailCalendar;

  if (!a3)
    return 0;
  if (!a4 && (CalEventIsAllDay() & 1) != 0 || CalCalendarItemGetStatus() == 3)
    return 0;
  if (CalCalendarItemHasAttendees())
  {
    v5 = CalCalendarItemCopyOrganizer();
    if (v5)
    {
      v6 = (const void *)v5;
      if ((CalOrganizerIsSelf() & 1) != 0)
      {
        CFRelease(v6);
      }
      else
      {
        ParticipationStatus = CalEventGetParticipationStatus();
        CFRelease(v6);
        if (ParticipationStatus == 2)
          return 0;
      }
    }
  }
  v8 = CalEventCopyStore();
  if (v8)
  {
    v9 = (const void *)v8;
    if (CalStoreGetType() == 5)
    {
      v10 = CalCalendarItemCopyCalendar();
      if (v10)
      {
        v11 = (const void *)v10;
        IsFoundInMailCalendar = CalCalendarIsFoundInMailCalendar();
        CFRelease(v11);
        CFRelease(v9);
        return (IsFoundInMailCalendar & 1) != 0;
      }
    }
    CFRelease(v9);
  }
  return 1;
}

- (NSSet)contactEmailAddresses
{
  return (NSSet *)objc_getProperty(self, a2, 80, 1);
}

- (void)setContactEmailAddresses:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSSet)contactNameComponents
{
  return (NSSet *)objc_getProperty(self, a2, 88, 1);
}

- (void)setContactNameComponents:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactNameComponents, 0);
  objc_storeStrong((id *)&self->_contactEmailAddresses, 0);
}

@end
