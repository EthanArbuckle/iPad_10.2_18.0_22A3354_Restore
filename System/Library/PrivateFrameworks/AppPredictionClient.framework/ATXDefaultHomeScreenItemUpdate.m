@implementation ATXDefaultHomeScreenItemUpdate

- (ATXDefaultHomeScreenItemUpdate)initWithDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  char v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  char v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  char v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  char v45;
  ATXDefaultHomeScreenItemUpdate *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  NSObject *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  NSObject *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  NSObject *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v100;
  NSObject *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  NSObject *v111;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("defaultWidgetStack"));
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5
    || (v6 = (void *)v5,
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("defaultWidgetStack")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v7,
        v6,
        (isKindOfClass & 1) == 0))
  {
    __atxlog_handle_home_screen();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ATXDefaultHomeScreenItemUpdate initWithDictionary:].cold.1(v9, v47, v48, v49, v50, v51, v52, v53);
    goto LABEL_38;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("defaultWidgetStack"));
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("defaultWidgetTodayStack"));
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10
    || (v11 = (void *)v10,
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("defaultWidgetTodayStack")),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        v13 = objc_opt_isKindOfClass(),
        v12,
        v11,
        (v13 & 1) == 0))
  {
    __atxlog_handle_home_screen();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[ATXDefaultHomeScreenItemUpdate initWithDictionary:].cold.2(v14, v54, v55, v56, v57, v58, v59, v60);
    goto LABEL_37;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("defaultWidgetTodayStack"));
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("defaultWidgetOnboardingStacks"));
  v15 = objc_claimAutoreleasedReturnValue();
  if (!v15
    || (v16 = (void *)v15,
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("defaultWidgetOnboardingStacks")),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        v18 = objc_opt_isKindOfClass(),
        v17,
        v16,
        (v18 & 1) == 0))
  {
    __atxlog_handle_home_screen();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[ATXDefaultHomeScreenItemUpdate initWithDictionary:].cold.3(v19, v61, v62, v63, v64, v65, v66, v67);
    goto LABEL_36;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("defaultWidgetOnboardingStacks"));
  v19 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("defaultWidgetsSmall"));
  v20 = objc_claimAutoreleasedReturnValue();
  if (!v20
    || (v21 = (void *)v20,
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("defaultWidgetsSmall")),
        v22 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        v23 = objc_opt_isKindOfClass(),
        v22,
        v21,
        (v23 & 1) == 0))
  {
    __atxlog_handle_home_screen();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[ATXDefaultHomeScreenItemUpdate initWithDictionary:].cold.4(v24, v68, v69, v70, v71, v72, v73, v74);
    goto LABEL_35;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("defaultWidgetsSmall"));
  v24 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("defaultWidgetsMedium"));
  v25 = objc_claimAutoreleasedReturnValue();
  if (!v25
    || (v26 = (void *)v25,
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("defaultWidgetsMedium")),
        v27 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        v28 = objc_opt_isKindOfClass(),
        v27,
        v26,
        (v28 & 1) == 0))
  {
    __atxlog_handle_home_screen();
    v75 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
      -[ATXDefaultHomeScreenItemUpdate initWithDictionary:].cold.5(v75, v76, v77, v78, v79, v80, v81, v82);
    goto LABEL_28;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("defaultWidgetsMedium"));
  v29 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("defaultWidgetsLarge"));
  v30 = objc_claimAutoreleasedReturnValue();
  if (!v30)
    goto LABEL_29;
  v31 = (void *)v30;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("defaultWidgetsLarge"));
  v111 = v29;
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v33 = objc_opt_isKindOfClass();

  v29 = v111;
  if ((v33 & 1) == 0)
  {
LABEL_29:
    __atxlog_handle_home_screen();
    v83 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
      -[ATXDefaultHomeScreenItemUpdate initWithDictionary:].cold.6(v83, v84, v85, v86, v87, v88, v89, v90);

    goto LABEL_35;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("defaultWidgetsLarge"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("defaultWidgetsExtraLarge"));
  v35 = objc_claimAutoreleasedReturnValue();
  if (!v35)
    goto LABEL_32;
  v36 = (void *)v35;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("defaultWidgetsExtraLarge"));
  v110 = v34;
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v38 = objc_opt_isKindOfClass();

  v34 = v110;
  if ((v38 & 1) == 0)
  {
LABEL_32:
    __atxlog_handle_home_screen();
    v91 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
      -[ATXDefaultHomeScreenItemUpdate initWithDictionary:].cold.7(v91, v92, v93, v94, v95, v96, v97, v98);

    goto LABEL_35;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("defaultWidgetsExtraLarge"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("shouldSuggestSmartStackInGallery"));
  v40 = objc_claimAutoreleasedReturnValue();
  if (!v40
    || (v41 = (void *)v40,
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("shouldSuggestSmartStackInGallery")),
        v42 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        v43 = objc_opt_isKindOfClass(),
        v42,
        v41,
        (v43 & 1) == 0))
  {
    v100 = v39;
    __atxlog_handle_home_screen();
    v101 = objc_claimAutoreleasedReturnValue();
    v75 = v111;
    if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
      -[ATXDefaultHomeScreenItemUpdate initWithDictionary:].cold.8(v101, v102, v103, v104, v105, v106, v107, v108);

LABEL_28:
LABEL_35:

LABEL_36:
LABEL_37:

LABEL_38:
    v46 = 0;
    goto LABEL_39;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("shouldSuggestSmartStackInGallery"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "BOOLValue");

  LOBYTE(v109) = v45;
  self = -[ATXDefaultHomeScreenItemUpdate initWithStack:todayStack:onboardingStacks:smallWidgets:mediumWidgets:largeWidgets:extraLargeWidgets:shouldSuggestStackInGallery:](self, "initWithStack:todayStack:onboardingStacks:smallWidgets:mediumWidgets:largeWidgets:extraLargeWidgets:shouldSuggestStackInGallery:", v9, v14, v19, v24, v111, v110, v39, v109);

  v46 = self;
LABEL_39:

  return v46;
}

- (ATXDefaultHomeScreenItemUpdate)initWithStack:(id)a3 todayStack:(id)a4 onboardingStacks:(id)a5 smallWidgets:(id)a6 mediumWidgets:(id)a7 largeWidgets:(id)a8 extraLargeWidgets:(id)a9 shouldSuggestStackInGallery:(BOOL)a10
{
  id v17;
  id v18;
  ATXDefaultHomeScreenItemUpdate *v19;
  ATXDefaultHomeScreenItemUpdate *v20;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  objc_super v27;

  v26 = a3;
  v25 = a4;
  v24 = a5;
  v23 = a6;
  v22 = a7;
  v17 = a8;
  v18 = a9;
  v27.receiver = self;
  v27.super_class = (Class)ATXDefaultHomeScreenItemUpdate;
  v19 = -[ATXDefaultHomeScreenItemUpdate init](&v27, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_stack, a3);
    objc_storeStrong((id *)&v20->_todayStack, a4);
    objc_storeStrong((id *)&v20->_onboardingStacks, a5);
    objc_storeStrong((id *)&v20->_smallWidgets, a6);
    objc_storeStrong((id *)&v20->_mediumWidgets, a7);
    objc_storeStrong((id *)&v20->_largeWidgets, a8);
    objc_storeStrong((id *)&v20->_extraLargeWidgets, a9);
    v20->_shouldSuggestStackInGallery = a10;
  }

  return v20;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_stack, CFSTR("defaultWidgetStack"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_todayStack, CFSTR("defaultWidgetTodayStack"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_onboardingStacks, CFSTR("defaultWidgetOnboardingStacks"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_smallWidgets, CFSTR("defaultWidgetsSmall"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_mediumWidgets, CFSTR("defaultWidgetsMedium"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_largeWidgets, CFSTR("defaultWidgetsLarge"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_extraLargeWidgets, CFSTR("defaultWidgetsExtraLarge"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldSuggestStackInGallery);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("shouldSuggestSmartStackInGallery"));

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  ATXDefaultHomeScreenItemUpdate *v4;
  id *v5;
  ATXDefaultWidgetStack *stack;
  ATXDefaultWidgetStack *v7;
  ATXDefaultWidgetStack *v8;
  ATXDefaultWidgetStack *v9;
  BOOL v10;
  BOOL v11;
  ATXDefaultWidgetStack *todayStack;
  ATXDefaultWidgetStack *v13;
  ATXDefaultWidgetStack *v14;
  ATXDefaultWidgetStack *v15;
  BOOL v16;
  NSArray *onboardingStacks;
  NSArray *v18;
  NSArray *v19;
  NSArray *v20;
  char v21;
  NSArray *smallWidgets;
  NSArray *v23;
  NSArray *v24;
  NSArray *v25;
  char v26;
  NSArray *mediumWidgets;
  NSArray *v28;
  NSArray *v29;
  NSArray *v30;
  char v31;
  NSArray *largeWidgets;
  NSArray *v33;
  NSArray *v34;
  NSArray *v35;
  char v36;
  NSArray *extraLargeWidgets;
  NSArray *v38;
  NSArray *v39;
  NSArray *v40;
  char v41;
  int shouldSuggestStackInGallery;

  v4 = (ATXDefaultHomeScreenItemUpdate *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      stack = self->_stack;
      v7 = (ATXDefaultWidgetStack *)v5[2];
      if (stack == v7)
      {

      }
      else
      {
        v8 = v7;
        v9 = stack;
        v10 = -[ATXDefaultWidgetStack isEqual:](v9, "isEqual:", v8);

        if (!v10)
          goto LABEL_31;
      }
      todayStack = self->_todayStack;
      v13 = (ATXDefaultWidgetStack *)v5[3];
      if (todayStack == v13)
      {

      }
      else
      {
        v14 = v13;
        v15 = todayStack;
        v16 = -[ATXDefaultWidgetStack isEqual:](v15, "isEqual:", v14);

        if (!v16)
          goto LABEL_31;
      }
      onboardingStacks = self->_onboardingStacks;
      v18 = (NSArray *)v5[4];
      if (onboardingStacks == v18)
      {

      }
      else
      {
        v19 = v18;
        v20 = onboardingStacks;
        v21 = -[NSArray isEqual:](v20, "isEqual:", v19);

        if ((v21 & 1) == 0)
          goto LABEL_31;
      }
      smallWidgets = self->_smallWidgets;
      v23 = (NSArray *)v5[5];
      if (smallWidgets == v23)
      {

      }
      else
      {
        v24 = v23;
        v25 = smallWidgets;
        v26 = -[NSArray isEqual:](v25, "isEqual:", v24);

        if ((v26 & 1) == 0)
          goto LABEL_31;
      }
      mediumWidgets = self->_mediumWidgets;
      v28 = (NSArray *)v5[6];
      if (mediumWidgets == v28)
      {

      }
      else
      {
        v29 = v28;
        v30 = mediumWidgets;
        v31 = -[NSArray isEqual:](v30, "isEqual:", v29);

        if ((v31 & 1) == 0)
          goto LABEL_31;
      }
      largeWidgets = self->_largeWidgets;
      v33 = (NSArray *)v5[7];
      if (largeWidgets == v33)
      {

      }
      else
      {
        v34 = v33;
        v35 = largeWidgets;
        v36 = -[NSArray isEqual:](v35, "isEqual:", v34);

        if ((v36 & 1) == 0)
          goto LABEL_31;
      }
      extraLargeWidgets = self->_extraLargeWidgets;
      v38 = (NSArray *)v5[8];
      if (extraLargeWidgets == v38)
      {

      }
      else
      {
        v39 = v38;
        v40 = extraLargeWidgets;
        v41 = -[NSArray isEqual:](v40, "isEqual:", v39);

        if ((v41 & 1) == 0)
        {
LABEL_31:
          v11 = 0;
LABEL_32:

          goto LABEL_33;
        }
      }
      shouldSuggestStackInGallery = self->_shouldSuggestStackInGallery;
      v11 = shouldSuggestStackInGallery == objc_msgSend(v5, "shouldSuggestStackInGallery");
      goto LABEL_32;
    }
    v11 = 0;
  }
LABEL_33:

  return v11;
}

- (ATXDefaultWidgetStack)stack
{
  return self->_stack;
}

- (ATXDefaultWidgetStack)todayStack
{
  return self->_todayStack;
}

- (NSArray)onboardingStacks
{
  return self->_onboardingStacks;
}

- (NSArray)smallWidgets
{
  return self->_smallWidgets;
}

- (NSArray)mediumWidgets
{
  return self->_mediumWidgets;
}

- (NSArray)largeWidgets
{
  return self->_largeWidgets;
}

- (NSArray)extraLargeWidgets
{
  return self->_extraLargeWidgets;
}

- (BOOL)shouldSuggestStackInGallery
{
  return self->_shouldSuggestStackInGallery;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraLargeWidgets, 0);
  objc_storeStrong((id *)&self->_largeWidgets, 0);
  objc_storeStrong((id *)&self->_mediumWidgets, 0);
  objc_storeStrong((id *)&self->_smallWidgets, 0);
  objc_storeStrong((id *)&self->_onboardingStacks, 0);
  objc_storeStrong((id *)&self->_todayStack, 0);
  objc_storeStrong((id *)&self->_stack, 0);
}

- (void)initWithDictionary:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a1, a3, "ATXDefaultHomeScreenItemUpdate dictionary was missing %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)initWithDictionary:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a1, a3, "ATXDefaultHomeScreenItemUpdate dictionary was missing %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)initWithDictionary:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a1, a3, "ATXDefaultHomeScreenItemUpdate dictionary was missing %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)initWithDictionary:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a1, a3, "ATXDefaultHomeScreenItemUpdate dictionary was missing %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)initWithDictionary:(uint64_t)a3 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a1, a3, "ATXDefaultHomeScreenItemUpdate dictionary was missing %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)initWithDictionary:(uint64_t)a3 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a1, a3, "ATXDefaultHomeScreenItemUpdate dictionary was missing %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)initWithDictionary:(uint64_t)a3 .cold.7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a1, a3, "ATXDefaultHomeScreenItemUpdate dictionary was missing %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)initWithDictionary:(uint64_t)a3 .cold.8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a1, a3, "ATXDefaultHomeScreenItemUpdate dictionary was missing %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
