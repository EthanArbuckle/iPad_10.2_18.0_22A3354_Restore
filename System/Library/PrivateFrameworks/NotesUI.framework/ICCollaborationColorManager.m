@implementation ICCollaborationColorManager

+ (id)participantColors
{
  if (participantColors_onceToken != -1)
    dispatch_once(&participantColors_onceToken, &__block_literal_global_80);
  return (id)participantColors_participantColors;
}

void __48__ICCollaborationColorManager_participantColors__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[17];

  v17[15] = *MEMORY[0x1E0C80C00];
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D63C08]), "initWithRed:green:blue:alpha:", 0.643137255, 0.466666667, 0.925490196, 1.0);
  v17[0] = v16;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D63C08]), "initWithRed:green:blue:alpha:", 0.984313725, 0.549019608, 0.11372549, 1.0);
  v17[1] = v15;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D63C08]), "initWithRed:green:blue:alpha:", 0.650980392, 0.741176471, 0.843137255, 1.0);
  v17[2] = v14;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D63C08]), "initWithRed:green:blue:alpha:", 0.360784314, 0.729411765, 0.180392157, 1.0);
  v17[3] = v13;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D63C08]), "initWithRed:green:blue:alpha:", 0.925490196, 0.474509804, 0.862745098, 1.0);
  v17[4] = v12;
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D63C08]), "initWithRed:green:blue:alpha:", 0.290196078, 0.760784314, 0.658823529, 1.0);
  v17[5] = v0;
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D63C08]), "initWithRed:green:blue:alpha:", 0.576470588, 0.666666667, 0.0, 1.0);
  v17[6] = v1;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D63C08]), "initWithRed:green:blue:alpha:", 0.0196078431, 0.576470588, 0.956862745, 1.0);
  v17[7] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D63C08]), "initWithRed:green:blue:alpha:", 0.325490196, 0.215686275, 0.478431373, 1.0);
  v17[8] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D63C08]), "initWithRed:green:blue:alpha:", 0.992156863, 0.137254902, 0.345098039, 1.0);
  v17[9] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D63C08]), "initWithRed:green:blue:alpha:", 1.0, 0.478431373, 0.360784314, 1.0);
  v17[10] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D63C08]), "initWithRed:green:blue:alpha:", 0.945098039, 0.22745098, 0.0745098039, 1.0);
  v17[11] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D63C08]), "initWithRed:green:blue:alpha:", 0.701960784, 0.156862745, 0.317647059, 1.0);
  v17[12] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D63C08]), "initWithRed:green:blue:alpha:", 0.670588235, 0.352941176, 0.301960784, 1.0);
  v17[13] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D63C08]), "initWithRed:green:blue:alpha:", 0.494117647, 0.611764706, 0.850980392, 1.0);
  v17[14] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 15);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)participantColors_participantColors;
  participantColors_participantColors = v10;

}

+ (UIColor)defaultColor
{
  if (defaultColor_onceToken != -1)
    dispatch_once(&defaultColor_onceToken, &__block_literal_global_7_0);
  return (UIColor *)(id)defaultColor_defaultColor;
}

void __43__ICCollaborationColorManager_defaultColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.917647059, 0.733333333, 0.0, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)defaultColor_defaultColor;
  defaultColor_defaultColor = v0;

}

- (ICCollaborationColorManager)init
{
  ICCollaborationColorManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *userIDToColorsDict;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableArray *colorUsageCounts;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ICCollaborationColorManager;
  v2 = -[ICCollaborationColorManager init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    userIDToColorsDict = v2->_userIDToColorsDict;
    v2->_userIDToColorsDict = v3;

    objc_msgSend((id)objc_opt_class(), "participantColors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v6);
    colorUsageCounts = v2->_colorUsageCounts;
    v2->_colorUsageCounts = (NSMutableArray *)v7;

    for (; v6; --v6)
      -[NSMutableArray addObject:](v2->_colorUsageCounts, "addObject:", &unk_1E5C72048);
    v2->_colorUsageCountMinimum = 0;
  }
  return v2;
}

- (id)highlightColorForUserID:(id)a3 note:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C94730]))
  {
    objc_msgSend(v7, "account");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCollaborationColorManager containerScopedUserRecordNameForAccount:](self, "containerScopedUserRecordNameForAccount:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v9;
  }
  if (v6
    && (objc_msgSend(MEMORY[0x1E0CB3A28], "CR_unknown"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "UUIDString"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v6, "isEqual:", v11),
        v11,
        v10,
        !v12))
  {
    if ((objc_msgSend(v7, "isSharedViaICloud") & 1) != 0)
    {
      -[ICCollaborationColorManager baseColorValuesForUserID:](self, "baseColorValuesForUserID:", v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x1E0DC3658];
      objc_msgSend(v16, "redValue");
      v19 = v18;
      objc_msgSend(v16, "greenValue");
      v21 = v20;
      objc_msgSend(v16, "blueValue");
      v23 = v22;
      objc_msgSend(v16, "alphaValue");
      objc_msgSend(v17, "colorWithRed:green:blue:alpha:", v19, v21, v23, v24);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    objc_msgSend((id)objc_opt_class(), "defaultColor");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v13;
LABEL_7:

  return v14;
}

- (id)baseColorValuesForUserID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;

  v4 = a3;
  -[ICCollaborationColorManager userIDToColorsDict](self, "userIDToColorsDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ICCollaborationColorManager userIDToColorsDict](self, "userIDToColorsDict");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "participantColors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCollaborationColorManager colorUsageCounts](self, "colorUsageCounts");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v4, "hash");
    v11 = v10 % objc_msgSend(v7, "count");
    objc_msgSend(v9, "count");
    v12 = 0;
    while (1)
    {
      if (v11 >= objc_msgSend(v9, "count"))
        v11 = 0;
      if (v12 >= objc_msgSend(v9, "count"))
        -[ICCollaborationColorManager setColorUsageCountMinimum:](self, "setColorUsageCountMinimum:", -[ICCollaborationColorManager colorUsageCountMinimum](self, "colorUsageCountMinimum") + 1);
      objc_msgSend(v9, "objectAtIndexedSubscript:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "unsignedIntegerValue");

      if (v14 <= -[ICCollaborationColorManager colorUsageCountMinimum](self, "colorUsageCountMinimum"))
        break;
      ++v11;
      if (++v12 > objc_msgSend(v9, "count"))
      {
        v8 = 0;
        goto LABEL_12;
      }
    }
    objc_msgSend(v7, "objectAtIndexedSubscript:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCollaborationColorManager userIDToColorsDict](self, "userIDToColorsDict");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v8, v4);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14 + 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:atIndexedSubscript:", v16, v11);

LABEL_12:
  }

  return v8;
}

- (id)containerScopedUserRecordNameForAccount:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  dispatch_semaphore_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  dispatch_time_t v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, void *);
  void *v16;
  NSObject *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v3 = a3;
  if (containerScopedUserRecordNameForAccount__onceToken != -1)
    dispatch_once(&containerScopedUserRecordNameForAccount__onceToken, &__block_literal_global_14);
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    os_unfair_lock_lock((os_unfair_lock_t)&containerScopedUserRecordNameForAccount__accountIDToRecordNameLock);
    objc_msgSend((id)containerScopedUserRecordNameForAccount__accountIDToRecordName, "objectForKeyedSubscript:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock((os_unfair_lock_t)&containerScopedUserRecordNameForAccount__accountIDToRecordNameLock);
    if (v5)
    {
      v5 = v5;
      v6 = v5;
    }
    else
    {
      v19 = 0;
      v20 = &v19;
      v21 = 0x3032000000;
      v22 = __Block_byref_object_copy__65;
      v23 = __Block_byref_object_dispose__65;
      v24 = 0;
      v7 = dispatch_semaphore_create(0);
      objc_msgSend(MEMORY[0x1E0D63A80], "sharedContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "containerForAccountID:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = MEMORY[0x1E0C809B0];
      v14 = 3221225472;
      v15 = __71__ICCollaborationColorManager_containerScopedUserRecordNameForAccount___block_invoke_18;
      v16 = &unk_1E5C237B8;
      v18 = &v19;
      v10 = v7;
      v17 = v10;
      objc_msgSend(v9, "fetchUserRecordIDWithCompletionHandler:", &v13);
      v11 = dispatch_time(0, 120000000000);
      dispatch_semaphore_wait(v10, v11);
      os_unfair_lock_lock((os_unfair_lock_t)&containerScopedUserRecordNameForAccount__accountIDToRecordNameLock);
      objc_msgSend((id)containerScopedUserRecordNameForAccount__accountIDToRecordName, "setObject:forKeyedSubscript:", v20[5], v4, v13, v14, v15, v16);
      os_unfair_lock_unlock((os_unfair_lock_t)&containerScopedUserRecordNameForAccount__accountIDToRecordNameLock);
      v6 = (id)v20[5];

      _Block_object_dispose(&v19, 8);
    }
  }
  else
  {
    v5 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[ICCollaborationColorManager containerScopedUserRecordNameForAccount:].cold.1(v5);
    v6 = 0;
  }

  return v6;
}

void __71__ICCollaborationColorManager_containerScopedUserRecordNameForAccount___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)containerScopedUserRecordNameForAccount__accountIDToRecordName;
  containerScopedUserRecordNameForAccount__accountIDToRecordName = v0;

}

void __71__ICCollaborationColorManager_containerScopedUserRecordNameForAccount___block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  if (v5)
  {
    v6 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __71__ICCollaborationColorManager_containerScopedUserRecordNameForAccount___block_invoke_18_cold_1((uint64_t)v5, v6);

  }
  else
  {
    objc_msgSend(a2, "recordName");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)participantAXDisplayNameForUserID:(id)a3 forNote:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C94730]) & 1) != 0
    || (objc_msgSend(v7, "account"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        -[ICCollaborationColorManager containerScopedUserRecordNameForAccount:](self, "containerScopedUserRecordNameForAccount:", v8), v9 = (void *)objc_claimAutoreleasedReturnValue(), v10 = objc_msgSend(v6, "isEqualToString:", v9), v9, v8, v10))
  {
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Me"), CFSTR("Me"), 0, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v7, "serverShare");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "participants");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v14 = v13;
    v11 = (void *)objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v11)
    {
      v25 = v7;
      v15 = *(_QWORD *)v27;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v15)
            objc_enumerationMutation(v14);
          v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v17, "userIdentity");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "userRecordID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "recordName");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "isEqualToString:", v6);

          if (v21)
          {
            objc_msgSend(v17, "userIdentity");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "nameComponents");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "ic_localizedNameWithDefaultFormattingStyle");
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_14;
          }
        }
        v11 = (void *)objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v11)
          continue;
        break;
      }
LABEL_14:
      v7 = v25;
    }

  }
  return v11;
}

- (NSMutableDictionary)userIDToColorsDict
{
  return self->_userIDToColorsDict;
}

- (void)setUserIDToColorsDict:(id)a3
{
  objc_storeStrong((id *)&self->_userIDToColorsDict, a3);
}

- (NSMutableArray)colorUsageCounts
{
  return self->_colorUsageCounts;
}

- (void)setColorUsageCounts:(id)a3
{
  objc_storeStrong((id *)&self->_colorUsageCounts, a3);
}

- (unint64_t)colorUsageCountMinimum
{
  return self->_colorUsageCountMinimum;
}

- (void)setColorUsageCountMinimum:(unint64_t)a3
{
  self->_colorUsageCountMinimum = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorUsageCounts, 0);
  objc_storeStrong((id *)&self->_userIDToColorsDict, 0);
}

- (void)containerScopedUserRecordNameForAccount:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AC7A1000, log, OS_LOG_TYPE_ERROR, "Trying to fetch containerScopedUserRecordNameForAccount with empty accountID", v1, 2u);
}

void __71__ICCollaborationColorManager_containerScopedUserRecordNameForAccount___block_invoke_18_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1AC7A1000, a2, OS_LOG_TYPE_ERROR, "Error fetching container scoped user recordID: %@", (uint8_t *)&v2, 0xCu);
}

@end
