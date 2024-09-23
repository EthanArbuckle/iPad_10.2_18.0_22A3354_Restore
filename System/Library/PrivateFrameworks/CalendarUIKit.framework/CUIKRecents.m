@implementation CUIKRecents

+ (id)logHandle
{
  if (logHandle_onceToken != -1)
    dispatch_once(&logHandle_onceToken, &__block_literal_global);
  return (id)logHandle_handle;
}

void __24__CUIKRecents_logHandle__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.calendar.caluikit", "CUIKRecents");
  v1 = (void *)logHandle_handle;
  logHandle_handle = (uint64_t)v0;

}

+ (id)mapKitHandleForRecent:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("mapKitHandle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)mapKitStyleAttributesForRecent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("mapItemStyleAttributes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v20[0] = objc_opt_class();
    v20[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v8, v5, &v19);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v19;
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_10;
    }
    else
    {
      objc_msgSend(a1, "logHandle");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        +[CUIKRecents mapKitStyleAttributesForRecent:].cold.1((uint64_t)v10, v11, v12, v13, v14, v15, v16, v17);

    }
    v9 = 0;
LABEL_10:

    goto LABEL_11;
  }
  v9 = 0;
LABEL_11:

  return v9;
}

+ (BOOL)recentMissingStyleAttributes:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("mapItemStyleAttributes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4 == 0;
}

+ (id)recentEventWithRecentContact:(id)a3 styleAttributes:(id)a4
{
  id v6;
  id v7;
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
  void *v19;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_archivedInstance:", v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      goto LABEL_4;
    goto LABEL_3;
  }
  objc_msgSend(a1, "_archivedInstance:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
LABEL_3:
    objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("mapItemStyleAttributes"));
LABEL_4:
  v11 = (void *)EKWeakLinkClass();
  objc_msgSend(v7, "address");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "kind");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mostRecentDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "weight");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "recentEventForAddress:displayName:kind:date:weight:metadata:options:", v12, v13, v14, v15, v16, v9, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)_archivedInstance:(id)a3
{
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v15;

  v15 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v15;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(a1, "logHandle");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[CUIKRecents _archivedInstance:].cold.1((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);

  }
  return v4;
}

+ (id)locationForRecent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double (*v8)(uint64_t, double, double);
  objc_class *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  v3 = a3;
  objc_msgSend(v3, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("locationType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "unsignedIntegerValue") == 1)
  {
    v7 = 0;
  }
  else
  {
    v8 = (double (*)(uint64_t, double, double))EKWeakLinkSymbol();
    v9 = (objc_class *)EKWeakLinkClass();
    objc_msgSend(v4, "objectForKey:", CFSTR("latitude"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    v12 = v11;
    objc_msgSend(v4, "objectForKey:", CFSTR("longitude"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "doubleValue");
    v16 = v8(v14, v12, v15);
    v18 = v17;

    v19 = [v9 alloc];
    objc_msgSend(v4, "objectForKey:", CFSTR("hAccuracy"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "doubleValue");
    v22 = v21;
    objc_msgSend(v4, "objectForKey:", CFSTR("vAccuracy"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "doubleValue");
    v25 = v24;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("referenceFrame"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v19, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:referenceFrame:", v26, objc_msgSend(v27, "integerValue"), v16, v18, 0.0, v22, v25);

    objc_msgSend(v4, "objectForKey:", CFSTR("radius"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "doubleValue");
    v31 = v30;

    v32 = (void *)MEMORY[0x1E0CAA158];
    objc_msgSend(v3, "displayName");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "locationWithTitle:", v33);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setGeoLocation:", v28);
    objc_msgSend(v3, "address");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAddress:", v34);

    objc_msgSend(v7, "setRadius:", v31);
    objc_msgSend(v4, "objectForKey:", CFSTR("mapKitHandle"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
      objc_msgSend(v7, "setMapKitHandle:", v35);
    objc_msgSend(v4, "objectForKey:", CFSTR("addressBookID"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36)
      objc_msgSend(v7, "setContactLabel:", v36);

  }
  return v7;
}

+ (id)recentForLocation:(id)a3 withAddressString:(id)a4 andTitle:(id)a5 mapItem:(id)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
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
  id v42;
  id v43;
  id v44;
  _QWORD v45[7];
  _QWORD v46[9];

  v46[7] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v44 = a6;
  v43 = a5;
  v42 = a4;
  objc_msgSend(v9, "geoLocation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = CFSTR("latitude");
  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v10, "coordinate");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v12;
  v45[1] = CFSTR("longitude");
  v13 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v10, "coordinate");
  objc_msgSend(v13, "numberWithDouble:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v46[1] = v15;
  v45[2] = CFSTR("hAccuracy");
  v16 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v10, "horizontalAccuracy");
  objc_msgSend(v16, "numberWithDouble:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v46[2] = v17;
  v45[3] = CFSTR("vAccuracy");
  v18 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v10, "verticalAccuracy");
  objc_msgSend(v18, "numberWithDouble:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v46[3] = v19;
  v45[4] = CFSTR("locationType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v46[4] = v20;
  v45[5] = CFSTR("radius");
  v21 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v9, "radius");
  objc_msgSend(v21, "numberWithDouble:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v46[5] = v22;
  v45[6] = CFSTR("referenceFrame");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v10, "referenceFrame"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v46[6] = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 7);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "mapKitHandle");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {

  }
  else
  {
    objc_msgSend(v9, "contactLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26)
    {
      v27 = v24;
      v29 = v44;
      goto LABEL_14;
    }
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v24);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "mapKitHandle");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = v44;
  if (v28)
  {
    objc_msgSend(v9, "mapKitHandle");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKey:", v30, CFSTR("mapKitHandle"));

    objc_msgSend(v44, "_styleAttributes");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
      objc_msgSend(v44, "_styleAttributes");
    else
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_archivedInstance:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
      objc_msgSend(v27, "setObject:forKey:", v33, CFSTR("mapItemStyleAttributes"));

  }
  objc_msgSend(v9, "contactLabel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    objc_msgSend(v9, "contactLabel");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKey:", v35, CFSTR("addressBookID"));

  }
LABEL_14:
  v36 = (void *)EKWeakLinkClass();
  EKWeakLinkStringConstant();
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "recentEventForAddress:displayName:kind:date:weight:metadata:options:", v42, v43, v37, v38, 0, v27, 1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  return v39;
}

+ (id)directoryLocationForRecent:(id)a3 onSource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  if (objc_msgSend(a1, "recentDirectoryLocation:matchesSource:", v6, a4))
  {
    v7 = objc_alloc_init(MEMORY[0x1E0CAA048]);
    objc_msgSend(v6, "displayName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDisplayName:", v8);

    objc_msgSend(v6, "address");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPreferredAddress:", v9);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)recentForDirectoryLocation:(id)a3 onSource:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  __CFString *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v19[0] = CFSTR("sourceExternalID");
  v5 = a3;
  objc_msgSend(a4, "externalID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = CFSTR("locationType");
  v20[0] = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)EKWeakLinkClass();
  EKWeakLinkStringConstant();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredAddress");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (const __CFString *)v11;
  else
    v13 = &stru_1E6EBAE30;
  objc_msgSend(v5, "displayName");
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v14)
    v15 = v14;
  else
    v15 = &stru_1E6EBAE30;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "recentEventForAddress:displayName:kind:date:weight:metadata:options:", v13, v15, v10, v16, 0, v8, 1, v19[0]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (BOOL)recentIsDirectoryLocation:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  objc_msgSend(a3, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("locationType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "unsignedIntegerValue") == 1;
  else
    v6 = 0;

  return v6;
}

+ (BOOL)recentDirectoryLocation:(id)a3 matchesSource:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;

  v5 = a4;
  objc_msgSend(a3, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("locationType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("sourceExternalID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  if (v7)
  {
    if (objc_msgSend(v7, "unsignedIntegerValue") == 1)
    {
      if (v8)
      {
        objc_msgSend(v5, "externalID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqualToString:", v9);

        if ((v10 & 1) != 0)
          v11 = 1;
      }
    }
  }

  return v11;
}

+ (void)mapKitStyleAttributesForRecent:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B8A6A000, a2, a3, "Unable to unarchive style attributes for recent: %@", a5, a6, a7, a8, 2u);
}

+ (void)_archivedInstance:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B8A6A000, a2, a3, "Unable to archive instance for recent: %@", a5, a6, a7, a8, 2u);
}

@end
