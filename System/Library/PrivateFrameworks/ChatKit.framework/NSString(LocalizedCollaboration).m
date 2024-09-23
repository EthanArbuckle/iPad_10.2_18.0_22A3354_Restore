@implementation NSString(LocalizedCollaboration)

+ (id)ck_localizedEditStringWithNumberOfPeople:()LocalizedCollaboration UTType:numberOfFiles:
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  __CFString *v22;
  void *v23;
  void *v25;

  v7 = a4;
  v8 = v7;
  if ((id)*MEMORY[0x1E0CEC5F0] == v7)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = CFSTR("N_PEOPLE_MADE_EDITS_TO_N_SPREADSHEETS");
LABEL_11:
    objc_msgSend(v15, "localizedStringForKey:value:table:", v17, &stru_1E276D870, CFSTR("ChatKitFormats-Collaboration"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringWithFormat:", v18, a3, a5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  if ((id)*MEMORY[0x1E0CEC5A0] == v7)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = CFSTR("N_PEOPLE_MADE_EDITS_TO_N_PRESENTATIONS");
    goto LABEL_11;
  }
  if ((id)*MEMORY[0x1E0CEC610] == v7)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = CFSTR("N_PEOPLE_MADE_EDITS_TO_N_DOCUMENTS");
    goto LABEL_11;
  }
  if ((id)*MEMORY[0x1E0CEC618] == v7)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = CFSTR("N_PEOPLE_MADE_EDITS_TO_N_COLLABORATIONS");
    goto LABEL_11;
  }
  v9 = (void *)*MEMORY[0x1E0CEC4F0];
  v10 = (void *)MEMORY[0x1E0CB3940];
  CKFrameworkBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v9 == v8)
    v13 = CFSTR("N_PEOPLE_MADE_EDITS_TO_N_FOLDERS");
  else
    v13 = CFSTR("N_PEOPLE_MADE_EDITS_TO_N_COLLABORATIONS");
  objc_msgSend(v11, "localizedStringForKey:value:table:", v13, &stru_1E276D870, CFSTR("ChatKitFormats-Collaboration"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringWithFormat:", v25, a3, a5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "userInterfaceLayoutDirection");

  if (v21 == 1)
    v22 = CFSTR("\u200F");
  else
    v22 = CFSTR("\u200E");
  -[__CFString stringByAppendingString:](v22, "stringByAppendingString:", v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

+ (id)ck_localizedUpdateStringWithNumberOfPeople:()LocalizedCollaboration UTType:numberOfFiles:
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  __CFString *v22;
  void *v23;
  void *v25;

  v7 = a4;
  v8 = v7;
  if ((id)*MEMORY[0x1E0CEC5F0] == v7)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = CFSTR("N_PEOPLE_MADE_UPDATES_TO_N_SPREADSHEETS");
LABEL_11:
    objc_msgSend(v15, "localizedStringForKey:value:table:", v17, &stru_1E276D870, CFSTR("ChatKitFormats-Collaboration"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringWithFormat:", v18, a3, a5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  if ((id)*MEMORY[0x1E0CEC5A0] == v7)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = CFSTR("N_PEOPLE_MADE_UPDATES_TO_N_PRESENTATIONS");
    goto LABEL_11;
  }
  if ((id)*MEMORY[0x1E0CEC610] == v7)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = CFSTR("N_PEOPLE_MADE_UPDATES_TO_N_DOCUMENTS");
    goto LABEL_11;
  }
  if ((id)*MEMORY[0x1E0CEC618] == v7)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = CFSTR("N_PEOPLE_MADE_UPDATES_TO_N_COLLABORATIONS");
    goto LABEL_11;
  }
  v9 = (void *)*MEMORY[0x1E0CEC4F0];
  v10 = (void *)MEMORY[0x1E0CB3940];
  CKFrameworkBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v9 == v8)
    v13 = CFSTR("N_PEOPLE_MADE_UPDATES_TO_N_FOLDERS");
  else
    v13 = CFSTR("N_PEOPLE_MADE_UPDATES_TO_N_COLLABORATIONS");
  objc_msgSend(v11, "localizedStringForKey:value:table:", v13, &stru_1E276D870, CFSTR("ChatKitFormats-Collaboration"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringWithFormat:", v25, a3, a5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "userInterfaceLayoutDirection");

  if (v21 == 1)
    v22 = CFSTR("\u200F");
  else
    v22 = CFSTR("\u200E");
  -[__CFString stringByAppendingString:](v22, "stringByAppendingString:", v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

+ (id)ck_localizedCreatedStringWithNumberOfPeople:()LocalizedCollaboration UTType:numberOfFiles:
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  __CFString *v22;
  void *v23;
  void *v25;

  v7 = a4;
  v8 = v7;
  if ((id)*MEMORY[0x1E0CEC5F0] == v7)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = CFSTR("N_PEOPLE_CREATED_N_SPREADSHEETS");
LABEL_11:
    objc_msgSend(v15, "localizedStringForKey:value:table:", v17, &stru_1E276D870, CFSTR("ChatKitFormats-Collaboration"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringWithFormat:", v18, a3, a5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  if ((id)*MEMORY[0x1E0CEC5A0] == v7)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = CFSTR("N_PEOPLE_CREATED_N_PRESENTATIONS");
    goto LABEL_11;
  }
  if ((id)*MEMORY[0x1E0CEC610] == v7)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = CFSTR("N_PEOPLE_CREATED_N_DOCUMENTS");
    goto LABEL_11;
  }
  if ((id)*MEMORY[0x1E0CEC618] == v7)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = CFSTR("N_PEOPLE_CREATED_N_COLLABORATIONS");
    goto LABEL_11;
  }
  v9 = (void *)*MEMORY[0x1E0CEC4F0];
  v10 = (void *)MEMORY[0x1E0CB3940];
  CKFrameworkBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v9 == v8)
    v13 = CFSTR("N_PEOPLE_CREATED_N_FOLDERS");
  else
    v13 = CFSTR("N_PEOPLE_CREATED_N_COLLABORATIONS");
  objc_msgSend(v11, "localizedStringForKey:value:table:", v13, &stru_1E276D870, CFSTR("ChatKitFormats-Collaboration"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringWithFormat:", v25, a3, a5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "userInterfaceLayoutDirection");

  if (v21 == 1)
    v22 = CFSTR("\u200F");
  else
    v22 = CFSTR("\u200E");
  -[__CFString stringByAppendingString:](v22, "stringByAppendingString:", v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

+ (id)ck_localizedDeletedStringWithNumberOfPeople:()LocalizedCollaboration UTType:numberOfFiles:
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  __CFString *v22;
  void *v23;
  void *v25;

  v7 = a4;
  v8 = v7;
  if ((id)*MEMORY[0x1E0CEC5F0] == v7)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = CFSTR("N_PEOPLE_DELETED_N_SPREADSHEETS");
LABEL_11:
    objc_msgSend(v15, "localizedStringForKey:value:table:", v17, &stru_1E276D870, CFSTR("ChatKitFormats-Collaboration"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringWithFormat:", v18, a3, a5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  if ((id)*MEMORY[0x1E0CEC5A0] == v7)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = CFSTR("N_PEOPLE_DELETED_N_PRESENTATIONS");
    goto LABEL_11;
  }
  if ((id)*MEMORY[0x1E0CEC610] == v7)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = CFSTR("N_PEOPLE_DELETED_N_DOCUMENTS");
    goto LABEL_11;
  }
  if ((id)*MEMORY[0x1E0CEC618] == v7)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = CFSTR("N_PEOPLE_DELETED_N_COLLABORATIONS");
    goto LABEL_11;
  }
  v9 = (void *)*MEMORY[0x1E0CEC4F0];
  v10 = (void *)MEMORY[0x1E0CB3940];
  CKFrameworkBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v9 == v8)
    v13 = CFSTR("N_PEOPLE_DELETED_N_FOLDERS");
  else
    v13 = CFSTR("N_PEOPLE_DELETED_N_COLLABORATIONS");
  objc_msgSend(v11, "localizedStringForKey:value:table:", v13, &stru_1E276D870, CFSTR("ChatKitFormats-Collaboration"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringWithFormat:", v25, a3, a5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "userInterfaceLayoutDirection");

  if (v21 == 1)
    v22 = CFSTR("\u200F");
  else
    v22 = CFSTR("\u200E");
  -[__CFString stringByAppendingString:](v22, "stringByAppendingString:", v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

+ (id)ck_localizedRenamedStringWithNumberOfPeople:()LocalizedCollaboration UTType:numberOfFiles:
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  __CFString *v22;
  void *v23;
  void *v25;

  v7 = a4;
  v8 = v7;
  if ((id)*MEMORY[0x1E0CEC5F0] == v7)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = CFSTR("N_PEOPLE_RENAMED_N_SPREADSHEETS");
LABEL_11:
    objc_msgSend(v15, "localizedStringForKey:value:table:", v17, &stru_1E276D870, CFSTR("ChatKitFormats-Collaboration"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringWithFormat:", v18, a3, a5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  if ((id)*MEMORY[0x1E0CEC5A0] == v7)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = CFSTR("N_PEOPLE_RENAMED_N_PRESENTATIONS");
    goto LABEL_11;
  }
  if ((id)*MEMORY[0x1E0CEC610] == v7)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = CFSTR("N_PEOPLE_RENAMED_N_DOCUMENTS");
    goto LABEL_11;
  }
  if ((id)*MEMORY[0x1E0CEC618] == v7)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = CFSTR("N_PEOPLE_RENAMED_N_COLLABORATIONS");
    goto LABEL_11;
  }
  v9 = (void *)*MEMORY[0x1E0CEC4F0];
  v10 = (void *)MEMORY[0x1E0CB3940];
  CKFrameworkBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v9 == v8)
    v13 = CFSTR("N_PEOPLE_RENAMED_N_FOLDERS");
  else
    v13 = CFSTR("N_PEOPLE_RENAMED_N_COLLABORATIONS");
  objc_msgSend(v11, "localizedStringForKey:value:table:", v13, &stru_1E276D870, CFSTR("ChatKitFormats-Collaboration"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringWithFormat:", v25, a3, a5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "userInterfaceLayoutDirection");

  if (v21 == 1)
    v22 = CFSTR("\u200F");
  else
    v22 = CFSTR("\u200E");
  -[__CFString stringByAppendingString:](v22, "stringByAppendingString:", v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

+ (id)ck_localizedMovedStringWithNumberOfPeople:()LocalizedCollaboration UTType:numberOfFiles:
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  __CFString *v22;
  void *v23;
  void *v25;

  v7 = a4;
  v8 = v7;
  if ((id)*MEMORY[0x1E0CEC5F0] == v7)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = CFSTR("N_PEOPLE_MOVED_N_SPREADSHEETS");
LABEL_11:
    objc_msgSend(v15, "localizedStringForKey:value:table:", v17, &stru_1E276D870, CFSTR("ChatKitFormats-Collaboration"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringWithFormat:", v18, a3, a5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  if ((id)*MEMORY[0x1E0CEC5A0] == v7)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = CFSTR("N_PEOPLE_MOVED_N_PRESENTATIONS");
    goto LABEL_11;
  }
  if ((id)*MEMORY[0x1E0CEC610] == v7)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = CFSTR("N_PEOPLE_MOVED_N_DOCUMENTS");
    goto LABEL_11;
  }
  if ((id)*MEMORY[0x1E0CEC618] == v7)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = CFSTR("N_PEOPLE_MOVED_N_COLLABORATIONS");
    goto LABEL_11;
  }
  v9 = (void *)*MEMORY[0x1E0CEC4F0];
  v10 = (void *)MEMORY[0x1E0CB3940];
  CKFrameworkBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v9 == v8)
    v13 = CFSTR("N_PEOPLE_MOVED_N_FOLDERS");
  else
    v13 = CFSTR("N_PEOPLE_MOVED_N_COLLABORATIONS");
  objc_msgSend(v11, "localizedStringForKey:value:table:", v13, &stru_1E276D870, CFSTR("ChatKitFormats-Collaboration"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringWithFormat:", v25, a3, a5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "userInterfaceLayoutDirection");

  if (v21 == 1)
    v22 = CFSTR("\u200F");
  else
    v22 = CFSTR("\u200E");
  -[__CFString stringByAppendingString:](v22, "stringByAppendingString:", v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

+ (id)ck_localizedAddPeopleStringWithNumberOfPeople:()LocalizedCollaboration UTType:numberOfFiles:
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  __CFString *v22;
  void *v23;
  void *v25;

  v7 = a4;
  v8 = v7;
  if ((id)*MEMORY[0x1E0CEC5F0] == v7)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = CFSTR("ADD_PEOPLE_TO_N_SPREADSHEETS");
LABEL_11:
    objc_msgSend(v15, "localizedStringForKey:value:table:", v17, &stru_1E276D870, CFSTR("ChatKitFormats-Collaboration"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringWithFormat:", v18, a3, a5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  if ((id)*MEMORY[0x1E0CEC5A0] == v7)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = CFSTR("ADD_PEOPLE_TO_N_PRESENTATIONS");
    goto LABEL_11;
  }
  if ((id)*MEMORY[0x1E0CEC610] == v7)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = CFSTR("ADD_PEOPLE_TO_N_DOCUMENTS");
    goto LABEL_11;
  }
  if ((id)*MEMORY[0x1E0CEC618] == v7)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = CFSTR("ADD_PEOPLE_TO_N_COLLABORATIONS");
    goto LABEL_11;
  }
  v9 = (void *)*MEMORY[0x1E0CEC4F0];
  v10 = (void *)MEMORY[0x1E0CB3940];
  CKFrameworkBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v9 == v8)
    v13 = CFSTR("ADD_PEOPLE_TO_N_FOLDERS");
  else
    v13 = CFSTR("ADD_PEOPLE_TO_N_COLLABORATIONS");
  objc_msgSend(v11, "localizedStringForKey:value:table:", v13, &stru_1E276D870, CFSTR("ChatKitFormats-Collaboration"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringWithFormat:", v25, a3, a5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "userInterfaceLayoutDirection");

  if (v21 == 1)
    v22 = CFSTR("\u200F");
  else
    v22 = CFSTR("\u200E");
  -[__CFString stringByAppendingString:](v22, "stringByAppendingString:", v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

+ (id)ck_localizedRemovePeopleStringWithNumberOfPeople:()LocalizedCollaboration UTType:numberOfFiles:
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  __CFString *v22;
  void *v23;
  void *v25;

  v7 = a4;
  v8 = v7;
  if ((id)*MEMORY[0x1E0CEC5F0] == v7)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = CFSTR("REMOVE_N_PEOPLE_FROM_N_SPREADSHEETS");
LABEL_11:
    objc_msgSend(v15, "localizedStringForKey:value:table:", v17, &stru_1E276D870, CFSTR("ChatKitFormats-Collaboration"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringWithFormat:", v18, a3, a5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  if ((id)*MEMORY[0x1E0CEC5A0] == v7)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = CFSTR("REMOVE_N_PEOPLE_FROM_N_PRESENTATIONS");
    goto LABEL_11;
  }
  if ((id)*MEMORY[0x1E0CEC610] == v7)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = CFSTR("REMOVE_N_PEOPLE_FROM_N_DOCUMENTS");
    goto LABEL_11;
  }
  if ((id)*MEMORY[0x1E0CEC618] == v7)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = CFSTR("REMOVE_N_PEOPLE_FROM_N_COLLABORATIONS");
    goto LABEL_11;
  }
  v9 = (void *)*MEMORY[0x1E0CEC4F0];
  v10 = (void *)MEMORY[0x1E0CB3940];
  CKFrameworkBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v9 == v8)
    v13 = CFSTR("REMOVE_N_PEOPLE_FROM_N_FOLDERS");
  else
    v13 = CFSTR("REMOVE_N_PEOPLE_FROM_N_COLLABORATIONS");
  objc_msgSend(v11, "localizedStringForKey:value:table:", v13, &stru_1E276D870, CFSTR("ChatKitFormats-Collaboration"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringWithFormat:", v25, a3, a5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "userInterfaceLayoutDirection");

  if (v21 == 1)
    v22 = CFSTR("\u200F");
  else
    v22 = CFSTR("\u200E");
  -[__CFString stringByAppendingString:](v22, "stringByAppendingString:", v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

+ (id)ck_localizedCommentedPeopleStringWithNumberOfPeople:()LocalizedCollaboration UTType:numberOfFiles:
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  __CFString *v22;
  void *v23;
  void *v25;

  v7 = a4;
  v8 = v7;
  if ((id)*MEMORY[0x1E0CEC5F0] == v7)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = CFSTR("N_PEOPLE_LEFT_COMMENTS_ON_N_SPREADSHEETS");
LABEL_11:
    objc_msgSend(v15, "localizedStringForKey:value:table:", v17, &stru_1E276D870, CFSTR("ChatKitFormats-Collaboration"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringWithFormat:", v18, a3, a5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  if ((id)*MEMORY[0x1E0CEC5A0] == v7)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = CFSTR("N_PEOPLE_LEFT_COMMENTS_ON_N_PRESENTATIONS");
    goto LABEL_11;
  }
  if ((id)*MEMORY[0x1E0CEC610] == v7)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = CFSTR("N_PEOPLE_LEFT_COMMENTS_ON_N_DOCUMENTS");
    goto LABEL_11;
  }
  if ((id)*MEMORY[0x1E0CEC618] == v7)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = CFSTR("N_PEOPLE_LEFT_COMMENTS_ON_N_COLLABORATIONS");
    goto LABEL_11;
  }
  v9 = (void *)*MEMORY[0x1E0CEC4F0];
  v10 = (void *)MEMORY[0x1E0CB3940];
  CKFrameworkBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v9 == v8)
    v13 = CFSTR("N_PEOPLE_LEFT_COMMENTS_ON_N_FOLDERS");
  else
    v13 = CFSTR("N_PEOPLE_LEFT_COMMENTS_ON_N_COLLABORATIONS");
  objc_msgSend(v11, "localizedStringForKey:value:table:", v13, &stru_1E276D870, CFSTR("ChatKitFormats-Collaboration"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringWithFormat:", v25, a3, a5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "userInterfaceLayoutDirection");

  if (v21 == 1)
    v22 = CFSTR("\u200F");
  else
    v22 = CFSTR("\u200E");
  -[__CFString stringByAppendingString:](v22, "stringByAppendingString:", v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

+ (id)ck_suggestionCategoryTitleWithNumberOfSenders:()LocalizedCollaboration documentTitle:numberOfFiles:numberOfItems:aggregateContentType:aggregateNoticeType:
{
  id v14;
  id v15;
  _BOOL4 v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  __CFString *v31;
  void *v32;
  id v34;

  v14 = a4;
  v15 = a7;
  v16 = a5 == 1 && objc_msgSend(v14, "length") != 0;
  switch(a8)
  {
    case 0:
      if (v16)
        goto LABEL_21;
      v17 = a1;
      v18 = a3;
      v19 = v15;
      v20 = a5;
      goto LABEL_8;
    case 1:
      if (v16)
      {
        v22 = (void *)MEMORY[0x1E0CB3940];
        CKFrameworkBundle();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23;
        v25 = CFSTR("N_PEOPLE_MADE_EDITS_TO_%@");
        goto LABEL_26;
      }
      objc_msgSend(a1, "ck_localizedEditStringWithNumberOfPeople:UTType:numberOfFiles:", a3, v15, a5);
      v21 = objc_claimAutoreleasedReturnValue();
      goto LABEL_37;
    case 2:
      if (v16)
      {
        v22 = (void *)MEMORY[0x1E0CB3940];
        CKFrameworkBundle();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23;
        v25 = CFSTR("N_PEOPLE_LEFT_COMMENTS_ON_%@");
        goto LABEL_26;
      }
      objc_msgSend(a1, "ck_localizedCommentedPeopleStringWithNumberOfPeople:UTType:numberOfFiles:", a3, v15, a5);
      v21 = objc_claimAutoreleasedReturnValue();
      goto LABEL_37;
    case 3:
      v22 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("N_PEOPLE_MENTIONED_YOU"), &stru_1E276D870, CFSTR("ChatKitFormats-Collaboration"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
    case 4:
      if (v16)
        goto LABEL_21;
      objc_msgSend(a1, "ck_localizedCreatedStringWithNumberOfPeople:UTType:numberOfFiles:", a3, v15, a5);
      v21 = objc_claimAutoreleasedReturnValue();
      goto LABEL_37;
    case 5:
      if (v16)
        goto LABEL_21;
      objc_msgSend(a1, "ck_localizedDeletedStringWithNumberOfPeople:UTType:numberOfFiles:", a3, v15, a5);
      v21 = objc_claimAutoreleasedReturnValue();
      goto LABEL_37;
    case 6:
      if (v16)
        goto LABEL_21;
      objc_msgSend(a1, "ck_localizedRenamedStringWithNumberOfPeople:UTType:numberOfFiles:", a3, v15, a5);
      v21 = objc_claimAutoreleasedReturnValue();
      goto LABEL_37;
    case 7:
      if (v16)
      {
LABEL_21:
        v27 = (void *)MEMORY[0x1E0CB3940];
        CKFrameworkBundle();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("N_COLLABORATION_UPDATES_TO_%@"), &stru_1E276D870, CFSTR("ChatKitFormats-Collaboration"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "localizedStringWithFormat:", v26, a6, v14);
        goto LABEL_28;
      }
      objc_msgSend(a1, "ck_localizedMovedStringWithNumberOfPeople:UTType:numberOfFiles:", a3, v15, a5);
      v21 = objc_claimAutoreleasedReturnValue();
      goto LABEL_37;
    case 8:
      if (v16)
      {
        v22 = (void *)MEMORY[0x1E0CB3940];
        CKFrameworkBundle();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23;
        v25 = CFSTR("ADD_N_PEOPLE_TO_%@");
        goto LABEL_26;
      }
      objc_msgSend(a1, "ck_localizedAddPeopleStringWithNumberOfPeople:UTType:numberOfFiles:", a3, v15, a5);
      v21 = objc_claimAutoreleasedReturnValue();
      goto LABEL_37;
    case 9:
      if (v16)
      {
        v22 = (void *)MEMORY[0x1E0CB3940];
        CKFrameworkBundle();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23;
        v25 = CFSTR("REMOVE_N_PEOPLE_FROM_%@");
LABEL_26:
        objc_msgSend(v23, "localizedStringForKey:value:table:", v25, &stru_1E276D870, CFSTR("ChatKitFormats-Collaboration"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v14;
LABEL_27:
        objc_msgSend(v22, "localizedStringWithFormat:", v26, a3, v34);
LABEL_28:
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "userInterfaceLayoutDirection");

        if (v30 == 1)
          v31 = CFSTR("\u200F");
        else
          v31 = CFSTR("\u200E");
        -[__CFString stringByAppendingString:](v31, "stringByAppendingString:", v28);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(a1, "ck_localizedRemovePeopleStringWithNumberOfPeople:UTType:numberOfFiles:", a3, v15, a5);
        v21 = objc_claimAutoreleasedReturnValue();
LABEL_37:
        v32 = (void *)v21;
      }

      return v32;
    default:
      v17 = a1;
      v18 = a3;
      v19 = v15;
      v20 = a6;
LABEL_8:
      objc_msgSend(v17, "ck_localizedUpdateStringWithNumberOfPeople:UTType:numberOfFiles:", v18, v19, v20);
      v21 = objc_claimAutoreleasedReturnValue();
      goto LABEL_37;
  }
}

@end
