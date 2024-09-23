@implementation ACUIDataclassActionPicker

- (ACUIDataclassActionPicker)initWithActions:(id)a3 affectingAccount:(id)a4
{
  ACUIDataclassActionPicker *v4;
  NSArray *v5;
  NSArray *actions;
  ACUIDataclassActionPicker *v8;
  objc_super v10;
  id v11;
  id location[2];
  ACUIDataclassActionPicker *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = 0;
  objc_storeStrong(&v11, a4);
  v4 = v13;
  v13 = 0;
  v10.receiver = v4;
  v10.super_class = (Class)ACUIDataclassActionPicker;
  v13 = -[ACUIDataclassActionPicker init](&v10, sel_init);
  objc_storeStrong((id *)&v13, v13);
  if (v13)
  {
    objc_storeStrong((id *)&v13->_affectedAccount, v11);
    v5 = (NSArray *)(id)objc_msgSend(location[0], "sortedArrayUsingComparator:", &__block_literal_global_2);
    actions = v13->_actions;
    v13->_actions = v5;

  }
  v8 = v13;
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v13, 0);
  return v8;
}

uint64_t __62__ACUIDataclassActionPicker_initWithActions_affectingAccount___block_invoke(void *a1, void *a2, void *a3)
{
  id v6;
  id v7[2];
  id v8;
  id location[2];
  uint64_t v10;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v8 = 0;
  objc_storeStrong(&v8, a3);
  v7[1] = a1;
  v7[0] = location[0];
  v6 = v8;
  if (objc_msgSend(v7[0], "type"))
  {
    if (objc_msgSend(v6, "type"))
    {
      if ((objc_msgSend(v7[0], "isDestructive") & 1) != 0 || (objc_msgSend(v6, "isDestructive") & 1) != 1)
        v10 = (objc_msgSend(v7[0], "isDestructive") & 1) == 1 && (objc_msgSend(v6, "isDestructive") & 1) == 0;
      else
        v10 = -1;
    }
    else
    {
      v10 = -1;
    }
  }
  else
  {
    v10 = 1;
  }
  objc_storeStrong(&v6, 0);
  objc_storeStrong(v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v10;
}

- (void)addAffectedDataclass:(id)a3
{
  NSMutableArray *v3;
  NSMutableArray *affectedDataclasses;
  id location[2];
  ACUIDataclassActionPicker *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (!v6->_affectedDataclasses)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    affectedDataclasses = v6->_affectedDataclasses;
    v6->_affectedDataclasses = v3;

  }
  if (location[0])
    -[NSMutableArray addObject:](v6->_affectedDataclasses, "addObject:", location[0]);
  objc_storeStrong(location, 0);
}

- (BOOL)hasDestructiveActions
{
  ACDataclassAction *v2;
  BOOL v4;

  v2 = -[ACUIDataclassActionPicker firstDestructiveAction](self, "firstDestructiveAction");
  v4 = v2 != 0;

  return v4;
}

- (ACDataclassAction)firstDestructiveAction
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  NSArray *obj;
  uint64_t v8;
  int v9;
  _QWORD __b[8];
  id v11;
  SEL v12;
  ACUIDataclassActionPicker *v13;
  id v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v13 = self;
  v12 = a2;
  memset(__b, 0, sizeof(__b));
  obj = -[ACUIDataclassActionPicker actions](v13, "actions");
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v15, 16);
  if (v8)
  {
    v4 = *(_QWORD *)__b[2];
    v5 = 0;
    v6 = v8;
    while (1)
    {
      v3 = v5;
      if (*(_QWORD *)__b[2] != v4)
        objc_enumerationMutation(obj);
      v11 = *(id *)(__b[1] + 8 * v5);
      if ((objc_msgSend(v11, "isDestructive") & 1) == 1)
        break;
      ++v5;
      if (v3 + 1 >= v6)
      {
        v5 = 0;
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v15, 16);
        if (!v6)
          goto LABEL_9;
      }
    }
    v14 = v11;
    v9 = 1;
  }
  else
  {
LABEL_9:
    v9 = 0;
  }

  if (!v9)
    v14 = 0;
  return (ACDataclassAction *)v14;
}

- (id)actionOfType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  NSArray *obj;
  uint64_t v10;
  int v11;
  _QWORD __b[8];
  id v13;
  int64_t v14;
  SEL v15;
  ACUIDataclassActionPicker *v16;
  id v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v16 = self;
  v15 = a2;
  v14 = a3;
  memset(__b, 0, sizeof(__b));
  obj = -[ACUIDataclassActionPicker actions](v16, "actions");
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v18, 16);
  if (v10)
  {
    v6 = *(_QWORD *)__b[2];
    v7 = 0;
    v8 = v10;
    while (1)
    {
      v5 = v7;
      if (*(_QWORD *)__b[2] != v6)
        objc_enumerationMutation(obj);
      v13 = *(id *)(__b[1] + 8 * v7);
      v3 = objc_msgSend(v13, "type");
      if (v3 == v14)
        break;
      ++v7;
      if (v5 + 1 >= v8)
      {
        v7 = 0;
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v18, 16);
        if (!v8)
          goto LABEL_9;
      }
    }
    v17 = v13;
    v11 = 1;
  }
  else
  {
LABEL_9:
    v11 = 0;
  }

  if (!v11)
    v17 = 0;
  return v17;
}

- (BOOL)hasActionOfType:(int64_t)a3
{
  id v3;
  BOOL v5;

  v3 = -[ACUIDataclassActionPicker actionOfType:](self, "actionOfType:", a3);
  v5 = v3 != 0;

  return v5;
}

- (int64_t)priorityIndex
{
  uint64_t v3;
  NSArray *v4;
  int64_t v5;

  v3 = 10 * -[ACUIDataclassActionPicker hasDestructiveActions](self, "hasDestructiveActions");
  v4 = -[ACUIDataclassActionPicker actions](self, "actions");
  v5 = v3 - -[NSArray count](v4, "count");

  return v5;
}

- (id)showInViewController:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  NSArray *obj;
  uint64_t v13;
  os_log_t v14;
  os_log_type_t type;
  os_log_t oslog;
  uint64_t v17;
  int v18;
  int v19;
  void (*v20)(uint64_t);
  void *v21;
  ACUIDataclassActionPicker *v22;
  id v23;
  id v24;
  id v25[2];
  uint64_t v26;
  uint64_t *v27;
  int v28;
  int v29;
  void (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  id v33;
  _QWORD __b[8];
  uint64_t v35;
  id v36;
  id location[2];
  ACUIDataclassActionPicker *v38;
  uint8_t v39[32];
  uint8_t v40[24];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v38 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v36 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  memset(__b, 0, sizeof(__b));
  obj = -[ACUIDataclassActionPicker actions](v38, "actions");
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v41, 16);
  if (v13)
  {
    v9 = *(_QWORD *)__b[2];
    v10 = 0;
    v11 = v13;
    while (1)
    {
      v8 = v10;
      if (*(_QWORD *)__b[2] != v9)
        objc_enumerationMutation(obj);
      v35 = *(_QWORD *)(__b[1] + 8 * v10);
      v7 = v36;
      v6 = -[ACUIDataclassActionPicker descriptionForDataclassAction:](v38, "descriptionForDataclassAction:", v35);
      objc_msgSend(v7, "addObject:");

      ++v10;
      if (v8 + 1 >= v11)
      {
        v10 = 0;
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v41, 16);
        if (!v11)
          break;
      }
    }
  }

  v33 = dispatch_semaphore_create(0);
  v26 = 0;
  v27 = &v26;
  v28 = 838860800;
  v29 = 48;
  v30 = __Block_byref_object_copy_;
  v31 = __Block_byref_object_dispose_;
  v32 = 0;
  queue = MEMORY[0x1E0C80D38];
  v17 = MEMORY[0x1E0C809B0];
  v18 = -1073741824;
  v19 = 0;
  v20 = __50__ACUIDataclassActionPicker_showInViewController___block_invoke;
  v21 = &unk_1E9A15360;
  v25[1] = &v26;
  v22 = v38;
  v23 = v33;
  v24 = location[0];
  v25[0] = v36;
  dispatch_async(queue, &v17);

  oslog = (os_log_t)_ACUILogSystem();
  type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_2_8_32_4_0((uint64_t)v40, (uint64_t)"-[ACUIDataclassActionPicker showInViewController:]", 117);
    _os_log_debug_impl(&dword_1D573D000, oslog, type, "%s (%d) \"ACUIDataclassActionPicker waiting on semaphore until confirmation view completes.\", v40, 0x12u);
  }
  objc_storeStrong((id *)&oslog, 0);
  dispatch_semaphore_wait((dispatch_semaphore_t)v33, 0xFFFFFFFFFFFFFFFFLL);
  v14 = (os_log_t)_ACUILogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_3_8_32_4_0_8_66((uint64_t)v39, (uint64_t)"-[ACUIDataclassActionPicker showInViewController:]", 120, v27[5]);
    _os_log_debug_impl(&dword_1D573D000, v14, OS_LOG_TYPE_DEBUG, "%s (%d) \"ACUIDataclassActionPicker completed with action %{public}@\", v39, 0x1Cu);
  }
  objc_storeStrong((id *)&v14, 0);
  v4 = (id)v27[5];
  objc_storeStrong(v25, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong((id *)&v22, 0);
  _Block_object_dispose(&v26, 8);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(location, 0);
  return v4;
}

void __50__ACUIDataclassActionPicker_showInViewController___block_invoke(uint64_t a1)
{
  char v1;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  int v8;
  int v9;
  intptr_t (*v10)(uint64_t, uint64_t);
  void *v11;
  id v12;
  id v13[2];
  id v14[3];

  v14[2] = (id)a1;
  v14[1] = (id)a1;
  v7 = MEMORY[0x1E0C809B0];
  v8 = -1073741824;
  v9 = 0;
  v10 = __50__ACUIDataclassActionPicker_showInViewController___block_invoke_2;
  v11 = &unk_1E9A15338;
  v13[1] = *(id *)(a1 + 64);
  v12 = *(id *)(a1 + 32);
  v13[0] = *(id *)(a1 + 40);
  v14[0] = (id)MEMORY[0x1D8277444]();
  v4 = *(void **)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 56);
  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "title");
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "message");
  v1 = objc_msgSend(*(id *)(a1 + 32), "hasDestructiveActions");
  objc_msgSend(v4, "showConfirmationWithButtons:title:message:destructive:completion:", v3, v6, v5, v1 & 1, v14[0]);

  objc_storeStrong(v14, 0);
  objc_storeStrong(v13, 0);
  objc_storeStrong(&v12, 0);
}

intptr_t __50__ACUIDataclassActionPicker_showInViewController___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v6;
  id v7;
  os_log_t oslog[2];
  uint64_t v10;
  uint64_t v11;
  uint8_t v12[40];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v11 = a1;
  v10 = a2;
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)_ACUILogSystem();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEBUG))
  {
    v7 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
    __os_log_helper_16_2_3_8_32_4_0_8_66((uint64_t)v12, (uint64_t)"-[ACUIDataclassActionPicker showInViewController:]_block_invoke_2", 105, (uint64_t)v7);
    _os_log_debug_impl(&dword_1D573D000, oslog[0], OS_LOG_TYPE_DEBUG, "%s (%d) \"Confirmation view reports completion with %{public}@\", v12, 0x1Cu);

  }
  objc_storeStrong((id *)oslog, 0);
  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "actions");
  v2 = (id)objc_msgSend(v6, "objectAtIndexedSubscript:", v10);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)title
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  NSArray *v22;
  NSArray *v23;
  BOOL v24;
  id v25;
  id v26;
  id location[2];
  ACUIDataclassActionPicker *v28;

  v28 = self;
  location[1] = (id)a2;
  location[0] = 0;
  v23 = -[ACUIDataclassActionPicker affectedDataclasses](self, "affectedDataclasses");
  v24 = -[NSArray count](v23, "count") != 1;

  if (v24)
  {
    v12 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v8 = (id)objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("DELETE_ACCOUNT"), &stru_1E9A15E98, CFSTR("Localizable"));
    v9 = location[0];
    location[0] = v8;

  }
  else
  {
    v22 = -[ACUIDataclassActionPicker affectedDataclasses](v28, "affectedDataclasses");
    v26 = -[NSArray lastObject](v22, "lastObject");

    v25 = +[ACUILocalization localizedTitleForDataclass:](ACUILocalization, "localizedTitleForDataclass:", v26);
    if (-[ACUIDataclassActionPicker hasActionOfType:](v28, "hasActionOfType:", 4)
      || -[ACUIDataclassActionPicker hasActionOfType:](v28, "hasActionOfType:", 5)
      || -[ACUIDataclassActionPicker hasActionOfType:](v28, "hasActionOfType:", 6))
    {
      v19 = (void *)MEMORY[0x1E0CB3940];
      v21 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v20 = (id)objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("ENABLE_OTA_WITH_EXISTING_DATA_WARNING_FORMAT_TITLE"), &stru_1E9A15E98, CFSTR("Localizable"));
      v2 = (id)objc_msgSend(v19, "stringWithFormat:", v25);
      v3 = location[0];
      location[0] = v2;

    }
    else if (-[ACUIDataclassActionPicker hasActionOfType:](v28, "hasActionOfType:", 3)
           || -[ACUIDataclassActionPicker hasActionOfType:](v28, "hasActionOfType:", 2))
    {
      if (-[ACUIDataclassActionPicker hasActionOfType:](v28, "hasActionOfType:", 3)
        && (objc_msgSend(v26, "isEqualToString:", *MEMORY[0x1E0C8F430]) & 1) != 0)
      {
        objc_storeStrong(location, 0);
      }
      else
      {
        v16 = (void *)MEMORY[0x1E0CB3940];
        v18 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v17 = (id)objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("DISABLE_DATACLASS_TITLE"), &stru_1E9A15E98, CFSTR("Localizable"));
        v4 = (id)objc_msgSend(v16, "stringWithFormat:", v25);
        v5 = location[0];
        location[0] = v4;

      }
    }
    else if (-[ACUIDataclassActionPicker hasActionOfType:](v28, "hasActionOfType:", 8)
           && (objc_msgSend(v26, "isEqualToString:", *MEMORY[0x1E0C8F430]) & 1) != 0)
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      v15 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v14 = (id)objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("CLOUD_DRIVE_LOSE_NON_UPLOADED_DATA_TITLE"), &stru_1E9A15E98, CFSTR("Localizable"));
      v6 = (id)objc_msgSend(v13, "stringWithFormat:");
      v7 = location[0];
      location[0] = v6;

    }
    objc_storeStrong(&v25, 0);
    objc_storeStrong(&v26, 0);
  }
  v11 = location[0];
  objc_storeStrong(location, 0);
  return v11;
}

- (id)message
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  NSArray *v31;
  char v32;
  id v33;
  id v34;
  NSArray *v35;
  char v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  unint64_t v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  NSArray *v52;
  char v53;
  NSArray *v54;
  BOOL v55;
  id v56;
  ACAccount *v57;
  NSArray *v58;
  ACAccountType *v59;
  ACAccount *v60;
  id location;
  id v62;
  id v63;
  id v64;
  id v65[2];
  ACUIDataclassActionPicker *v66;

  v66 = self;
  v65[1] = (id)a2;
  v65[0] = 0;
  v58 = -[ACUIDataclassActionPicker affectedDataclasses](self, "affectedDataclasses");
  v57 = -[ACUIDataclassActionPicker affectedAccount](v66, "affectedAccount");
  v64 = +[ACUILocalization localizedTextForDataclasses:usedAtBeginningOfSentence:forAccount:](ACUILocalization, "localizedTextForDataclasses:usedAtBeginningOfSentence:forAccount:", v58, 0);

  v60 = -[ACUIDataclassActionPicker affectedAccount](v66, "affectedAccount");
  v59 = -[ACAccount accountType](v60, "accountType");
  v63 = -[ACAccountType accountTypeDescription](v59, "accountTypeDescription");

  if (!objc_msgSend(v64, "length"))
  {
    v56 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v2 = (id)objc_msgSend(v56, "localizedStringForKey:value:table:", CFSTR("DATA"), &stru_1E9A15E98, CFSTR("Localizable"));
    v3 = v64;
    v64 = v2;

  }
  v54 = -[ACUIDataclassActionPicker affectedDataclasses](v66, "affectedDataclasses");
  v55 = -[NSArray count](v54, "count") != 1;

  if (v55)
  {
    if (-[ACUIDataclassActionPicker hasActionOfType:](v66, "hasActionOfType:", 2))
    {
      v18 = -[ACUIDataclassActionPicker _stringForMessage:withAccountType:dataclassDescription:](v66, "_stringForMessage:withAccountType:dataclassDescription:", CFSTR("DELETE_ACCOUNT_MERGE_WARNING"), v63, v64);
      v19 = v65[0];
      v65[0] = v18;

    }
    else
    {
      v26 = (void *)MEMORY[0x1E0CB3940];
      v28 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v27 = (id)objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("DELETE_ACCOUNT_WARNING_FORMAT"), &stru_1E9A15E98, CFSTR("Localizable"));
      v20 = (id)objc_msgSend(v26, "stringWithFormat:", v64);
      v21 = v65[0];
      v65[0] = v20;

    }
  }
  else
  {
    v62 = -[ACUIDataclassActionPicker actionOfType:](v66, "actionOfType:", 8);
    if (v62)
    {
      v52 = -[ACUIDataclassActionPicker affectedDataclasses](v66, "affectedDataclasses");
      v51 = -[NSArray firstObject](v52, "firstObject");
      v53 = objc_msgSend(v51, "isEqualToString:", *MEMORY[0x1E0C8F430]);

      if ((v53 & 1) != 0)
      {
        v48 = (void *)MEMORY[0x1E0CB3940];
        v50 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v49 = (id)objc_msgSend(v50, "localizedStringForKey:value:table:", CFSTR("CLOUD_DRIVE_LOSE_NON_UPLOADED_DATA_MESSAGE"), &stru_1E9A15E98, CFSTR("Localizable"));
        v4 = (id)objc_msgSend(v48, "stringWithFormat:");
        v5 = v65[0];
        v65[0] = v4;

      }
      else
      {
        location = (id)objc_msgSend(v62, "affectedContainers");
        v47 = objc_msgSend(location, "count");
        if (v47 <= 3)
          __asm { BR              X8 }
        v40 = (void *)MEMORY[0x1E0CB3940];
        v46 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v45 = (id)objc_msgSend(v46, "localizedStringForKey:value:table:", CFSTR("LOSE_NON_UPLOADED_DATA_IN_MORE_THAN_THREE_APPS_WARNING"), &stru_1E9A15E98, CFSTR("Localizable"));
        v44 = (id)objc_msgSend(location, "objectAtIndexedSubscript:", 0);
        v43 = (id)objc_msgSend(location, "objectAtIndexedSubscript:", 1);
        v42 = (id)objc_msgSend(location, "objectAtIndexedSubscript:", 2);
        v41 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(location, "count") - 3);
        v6 = (id)objc_msgSend(v40, "stringWithFormat:", v45, v64, v63, v44, v43, v42, v41);
        v7 = v65[0];
        v65[0] = v6;

        objc_storeStrong(&location, 0);
      }
    }
    else if (-[ACUIDataclassActionPicker hasActionOfType:](v66, "hasActionOfType:", 4)
           || -[ACUIDataclassActionPicker hasActionOfType:](v66, "hasActionOfType:", 5)
           || -[ACUIDataclassActionPicker hasActionOfType:](v66, "hasActionOfType:", 6))
    {
      v37 = (void *)MEMORY[0x1E0CB3940];
      v39 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v38 = (id)objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("ENABLE_OTA_WITH_EXISTING_DATA_WARNING_FORMAT"), &stru_1E9A15E98, CFSTR("Localizable"));
      v8 = (id)objc_msgSend(v37, "stringWithFormat:", v64);
      v9 = v65[0];
      v65[0] = v8;

    }
    else if (-[ACUIDataclassActionPicker hasActionOfType:](v66, "hasActionOfType:", 3)
           && -[ACUIDataclassActionPicker hasActionOfType:](v66, "hasActionOfType:", 2))
    {
      v10 = -[ACUIDataclassActionPicker _stringForMessage:withAccountType:dataclassDescription:](v66, "_stringForMessage:withAccountType:dataclassDescription:", CFSTR("DISABLE_OTA_WITH_MERGE_OPTION_WARNING"), v63, v64);
      v11 = v65[0];
      v65[0] = v10;

    }
    else if (-[ACUIDataclassActionPicker hasActionOfType:](v66, "hasActionOfType:", 3))
    {
      v35 = -[ACUIDataclassActionPicker affectedDataclasses](v66, "affectedDataclasses");
      v34 = -[NSArray firstObject](v35, "firstObject");
      v36 = objc_msgSend(v34, "isEqualToString:", *MEMORY[0x1E0C8F420]);

      if ((v36 & 1) != 0)
      {
        v33 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v12 = (id)objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("SIRI_DELETE_EXISTING_DATA_WARNING"), &stru_1E9A15E98, CFSTR("Localizable"));
        v13 = v65[0];
        v65[0] = v12;

      }
      else
      {
        v31 = -[ACUIDataclassActionPicker affectedDataclasses](v66, "affectedDataclasses");
        v30 = -[NSArray firstObject](v31, "firstObject");
        v32 = objc_msgSend(v30, "isEqualToString:", *MEMORY[0x1E0C8F430]);

        if ((v32 & 1) != 0)
        {
          v29 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v14 = (id)objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("DISABLE_ICLOUD_DRIVE_WARNING"), &stru_1E9A15E98, CFSTR("Localizable"));
          v15 = v65[0];
          v65[0] = v14;

        }
        else
        {
          v16 = -[ACUIDataclassActionPicker _stringForMessage:withAccountType:dataclassDescription:](v66, "_stringForMessage:withAccountType:dataclassDescription:", CFSTR("DELETE_EXISTING_DATA_WARNING"), v63, v64);
          v17 = v65[0];
          v65[0] = v16;

        }
      }
    }
    objc_storeStrong(&v62, 0);
  }
  if (!v65[0])
  {
    v22 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("What would you like to do with %@?"), v64);
    v23 = v65[0];
    v65[0] = v22;

  }
  v25 = v65[0];
  objc_storeStrong(&v63, 0);
  objc_storeStrong(&v64, 0);
  objc_storeStrong(v65, 0);
  return v25;
}

- (id)_stringForMessage:(id)a3 withAccountType:(id)a4 dataclassDescription:(id)a5
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  ACAccount *v19;
  ACAccountType *v20;
  NSString *v21;
  char v22;
  char v23;
  id v24;
  char v25;
  NSArray *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id location[2];
  ACUIDataclassActionPicker *v32;

  v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v30 = 0;
  objc_storeStrong(&v30, a4);
  v29 = 0;
  objc_storeStrong(&v29, a5);
  v28 = 0;
  v27 = (id)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  objc_msgSend(v27, "appendString:", location[0]);
  v19 = -[ACUIDataclassActionPicker affectedAccount](v32, "affectedAccount");
  v20 = -[ACAccount accountType](v19, "accountType");
  v21 = -[ACAccountType identifier](v20, "identifier");
  v25 = 0;
  v23 = 0;
  v22 = 0;
  if (-[NSString isEqualToString:](v21, "isEqualToString:", *MEMORY[0x1E0C8F030]))
  {
    v26 = -[ACUIDataclassActionPicker affectedDataclasses](v32, "affectedDataclasses");
    v25 = 1;
    v24 = -[NSArray firstObject](v26, "firstObject");
    v23 = 1;
    v22 = objc_msgSend(v24, "isEqualToString:", *MEMORY[0x1E0C8F430]);
  }
  if ((v23 & 1) != 0)

  if ((v25 & 1) != 0)
  if ((v22 & 1) == 0 && v30)
  {
    objc_msgSend(v27, "appendString:", CFSTR("_FORMAT"));
    v11 = (void *)MEMORY[0x1E0CB3940];
    v13 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v12 = (id)objc_msgSend(v13, "localizedStringForKey:value:table:", v27, &stru_1E9A15E98, CFSTR("Localizable"));
    v7 = (id)objc_msgSend(v11, "stringWithFormat:", v30, v29);
    v8 = v28;
    v28 = v7;

  }
  else
  {
    objc_msgSend(v27, "appendString:", CFSTR("_NO_ACCOUNT_TYPE_FORMAT"));
    v14 = (void *)MEMORY[0x1E0CB3940];
    v16 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v15 = (id)objc_msgSend(v16, "localizedStringForKey:value:table:", v27, &stru_1E9A15E98, CFSTR("Localizable"));
    v5 = (id)objc_msgSend(v14, "stringWithFormat:", v29);
    v6 = v28;
    v28 = v5;

  }
  v10 = v28;
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
  return v10;
}

- (id)descriptionForDataclassAction:(id)a3
{
  id v4;
  id v5;
  NSArray *v6;
  char v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  NSArray *v14;
  char v15;
  id v16;
  NSArray *v17;
  char v18;
  id v19;
  char v20;
  id v21;
  char v22;
  NSArray *v23;
  char v24;
  id v25;
  char v26;
  NSArray *v27;
  char v28;
  id v29;
  char v30;
  NSArray *v31;
  id location[2];
  ACUIDataclassActionPicker *v33;
  __CFString *v34;

  v33 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (objc_msgSend(location[0], "type"))
  {
    if (objc_msgSend(location[0], "type") == 3)
    {
      v17 = -[ACUIDataclassActionPicker affectedDataclasses](v33, "affectedDataclasses");
      v30 = 0;
      v28 = 0;
      v18 = 0;
      if (-[NSArray count](v17, "count") == 1)
      {
        v31 = -[ACUIDataclassActionPicker affectedDataclasses](v33, "affectedDataclasses");
        v30 = 1;
        v29 = -[NSArray firstObject](v31, "firstObject");
        v28 = 1;
        v18 = objc_msgSend(v29, "isEqualToString:", *MEMORY[0x1E0C8F420]);
      }
      if ((v28 & 1) != 0)

      if ((v30 & 1) != 0)
      if ((v18 & 1) != 0)
      {
        v16 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v34 = (__CFString *)(id)objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("SIRI_DELETE_EXISTING_DATA_ACTION_LABEL"), &stru_1E9A15E98, CFSTR("Localizable"));

      }
      else
      {
        v14 = -[ACUIDataclassActionPicker affectedDataclasses](v33, "affectedDataclasses");
        v26 = 0;
        v24 = 0;
        v15 = 0;
        if (-[NSArray count](v14, "count") == 1)
        {
          v27 = -[ACUIDataclassActionPicker affectedDataclasses](v33, "affectedDataclasses");
          v26 = 1;
          v25 = -[NSArray firstObject](v27, "firstObject");
          v24 = 1;
          v15 = objc_msgSend(v25, "isEqualToString:", *MEMORY[0x1E0C8F430]);
        }
        if ((v24 & 1) != 0)

        if ((v26 & 1) != 0)
        if ((v15 & 1) != 0)
        {
          v13 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v34 = (__CFString *)(id)objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("DELETE_ICLOUD_DRIVE_SYNC_DATA"), &stru_1E9A15E98, CFSTR("Localizable"));

        }
        else
        {
          v12 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v34 = (__CFString *)(id)objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("DELETE_SYNC_DATA"), &stru_1E9A15E98, CFSTR("Localizable"));

        }
      }
    }
    else if (objc_msgSend(location[0], "type") == 2)
    {
      v11 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v34 = (__CFString *)(id)objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("MERGE_SYNC_DATA"), &stru_1E9A15E98, CFSTR("Localizable"));

    }
    else if (objc_msgSend(location[0], "type") == 4)
    {
      v10 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v34 = (__CFString *)(id)objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("KEEP_LOCAL_DATA"), &stru_1E9A15E98, CFSTR("Localizable"));

    }
    else if (objc_msgSend(location[0], "type") == 6)
    {
      v9 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v34 = (__CFString *)(id)objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("DELETE_LOCAL_DATA"), &stru_1E9A15E98, CFSTR("Localizable"));

    }
    else if (objc_msgSend(location[0], "type") == 5)
    {
      v8 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v34 = (__CFString *)(id)objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("MERGE_LOCAL_DATA"), &stru_1E9A15E98, CFSTR("Localizable"));

    }
    else if (objc_msgSend(location[0], "type") == 8)
    {
      v6 = -[ACUIDataclassActionPicker affectedDataclasses](v33, "affectedDataclasses");
      v22 = 0;
      v20 = 0;
      v7 = 0;
      if (-[NSArray count](v6, "count") == 1)
      {
        v23 = -[ACUIDataclassActionPicker affectedDataclasses](v33, "affectedDataclasses");
        v22 = 1;
        v21 = -[NSArray firstObject](v23, "firstObject");
        v20 = 1;
        v7 = objc_msgSend(v21, "isEqualToString:", *MEMORY[0x1E0C8F430]);
      }
      if ((v20 & 1) != 0)

      if ((v22 & 1) != 0)
      if ((v7 & 1) != 0)
      {
        v5 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v34 = (__CFString *)(id)objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CLOUD_DRIVE_LOSE_NON_UPLOADED_DATA_DELETE_TITLE"), &stru_1E9A15E98, CFSTR("Localizable"));

      }
      else
      {
        v4 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v34 = (__CFString *)(id)objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("LOSE_NON_UPLOADED_DATA"), &stru_1E9A15E98, CFSTR("Localizable"));

      }
    }
    else
    {
      v34 = CFSTR("Unknown Action");
    }
  }
  else
  {
    v19 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v34 = (__CFString *)(id)objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E9A15E98, CFSTR("Localizable"));

  }
  objc_storeStrong(location, 0);
  return v34;
}

- (NSArray)actions
{
  return self->_actions;
}

- (NSArray)affectedDataclasses
{
  return &self->_affectedDataclasses->super;
}

- (void)setAffectedDataclasses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (ACAccount)affectedAccount
{
  return self->_affectedAccount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_affectedAccount, 0);
  objc_storeStrong((id *)&self->_affectedDataclasses, 0);
}

@end
