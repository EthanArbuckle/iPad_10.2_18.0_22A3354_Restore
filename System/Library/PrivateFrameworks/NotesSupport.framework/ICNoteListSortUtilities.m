@implementation ICNoteListSortUtilities

+ (id)sortDescriptorsForCurrentTypeIncludingPinnedNotes:(BOOL)a3 folderNoteSortType:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "order"))
  {
    objc_msgSend(a1, "sortDescriptorsForType:ascending:", objc_msgSend(a1, "sortTypeForFolderNoteOrder:", objc_msgSend(v6, "order")), objc_msgSend(v6, "direction") == 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(a1, "sortDescriptorsForPinnedNotes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "ic_arrayByAddingObjectsFromNonNilArray:", v7);
      v9 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v9;
    }
  }
  else
  {
    objc_msgSend(a1, "sortDescriptorsForCurrentTypeIncludingPinnedNotes:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (id)sortDescriptorsForCurrentTypeIncludingPinnedNotes:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a3;
  objc_msgSend(a1, "sortDescriptorsForType:", objc_msgSend(a1, "currentNoteListSortType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(a1, "sortDescriptorsForPinnedNotes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v5);
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  return v5;
}

+ (id)dateForCurrentSortTypeForNote:(id)a3 folderNoteSortType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "order");
    if (v9 < 2 || v9 == 3)
      goto LABEL_9;
    if (v9 == 2)
    {
LABEL_8:
      objc_msgSend(v6, "creationDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
      a1 = v11;
      goto LABEL_11;
    }
  }
  v10 = objc_msgSend(a1, "currentNoteListSortType");
  if (!v10 || v10 == 2)
  {
LABEL_9:
    objc_msgSend(v6, "modificationDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (v10 == 1)
    goto LABEL_8;
LABEL_11:

  return a1;
}

+ (int64_t)currentNoteListSortType
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int64_t result;

  v2 = (void *)cachedNoteListSortType;
  if (cachedNoteListSortType)
    goto LABEL_3;
  v3 = objc_opt_class();
  +[ICSettingsUtilities objectForKey:](ICSettingsUtilities, "objectForKey:", CFSTR("kICSettingsNoteListSortTypeKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast(v3, (uint64_t)v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)cachedNoteListSortType;
  cachedNoteListSortType = v5;

  v2 = (void *)cachedNoteListSortType;
  if (cachedNoteListSortType)
  {
LABEL_3:
    result = objc_msgSend(v2, "integerValue");
    if ((unint64_t)result < 3)
      return result;
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "+[ICNoteListSortUtilities currentNoteListSortType]", 1, 0, CFSTR("Unexpected Note List Sort Type"));
  }
  else
  {
    cachedNoteListSortType = (uint64_t)&unk_1EA832298;

  }
  return 0;
}

+ (id)sortDescriptorsForType:(int64_t)a3
{
  return (id)objc_msgSend(a1, "sortDescriptorsForType:ascending:", a3, 1);
}

+ (id)sortDescriptorsForPinnedNotes
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("isPinned"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)sortDescriptorsForType:(int64_t)a3 ascending:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[3];

  v4 = a4;
  v14[2] = *MEMORY[0x1E0C80C00];
  v5 = !a4;
  if (a3)
  {
    if (a3 == 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:selector:", CFSTR("title"), a4, sel_localizedStandardCompare_);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = v6;
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("modificationDate"), v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v13[1] = v7;
      v8 = v13;
    }
    else if (a3 == 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), !a4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v6;
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:selector:", CFSTR("title"), v4, sel_localizedStandardCompare_);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v14[1] = v7;
      v8 = v14;
    }
    else
    {
      +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "+[ICNoteListSortUtilities sortDescriptorsForType:ascending:]", 1, 0, CFSTR("Unexpected sort type for sort descriptors"));
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("modificationDate"), v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = v6;
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:selector:", CFSTR("title"), v4, sel_localizedStandardCompare_);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11[1] = v7;
      v8 = v11;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("modificationDate"), !a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v6;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:selector:", CFSTR("title"), v4, sel_localizedStandardCompare_);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v7;
    v8 = v12;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (int64_t)sortTypeForFolderNoteOrder:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  int64_t result;

  result = 2;
  switch(a3)
  {
    case 0:
      result = objc_msgSend(a1, "currentNoteListSortType");
      break;
    case 1:
      result = 0;
      break;
    case 2:
      result = 1;
      break;
    case 3:
      return result;
    default:
      +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "+[ICNoteListSortUtilities sortTypeForFolderNoteOrder:]", 1, 0, CFSTR("invalid note list sort type folder note order, defaulting to date modified"), v3, v4);
      result = 0;
      break;
  }
  return result;
}

+ (void)clearCache
{
  void *v2;

  v2 = (void *)cachedNoteListSortType;
  cachedNoteListSortType = 0;

}

+ (int64_t)folderSortOrderForNoteListSortType:(int64_t)a3
{
  int64_t v3;

  v3 = 1;
  if (a3 == 1)
    v3 = 2;
  if (a3 == 2)
    return 3;
  else
    return v3;
}

+ (void)setCurrentNoteListSortType:(int64_t)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  if (objc_msgSend(a1, "currentNoteListSortType") != a3)
  {
    if ((unint64_t)a3 >= 3)
    {
      +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "+[ICNoteListSortUtilities setCurrentNoteListSortType:]", 1, 0, CFSTR("Unexpected Note List Sort Type"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)cachedNoteListSortType;
      cachedNoteListSortType = v4;

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[ICSettingsUtilities setObject:forKey:](ICSettingsUtilities, "setObject:forKey:", v6, CFSTR("kICSettingsNoteListSortTypeKey"));

      +[ICWidget sharedWidget](ICWidget, "sharedWidget");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "reloadTimelinesWithReason:", CFSTR("Default note list sort type has changed"));

    }
  }
}

+ (id)legacySortDescriptorsForType:(int64_t)a3
{
  return (id)objc_msgSend(a1, "legacySortDescriptorsForType:ascending:", a3, 1);
}

+ (id)sortDescriptorsForCurrentType
{
  return (id)objc_msgSend(a1, "sortDescriptorsForCurrentTypeIncludingPinnedNotes:", 0);
}

+ (id)descriptionForNoteListSortType:(int64_t)a3
{
  const __CFString *v3;
  const __CFString *v4;
  void *v5;

  if (a3 == 2)
  {
    v3 = CFSTR("SORT_BY_TITLE_TITLE");
    v4 = CFSTR("Title");
  }
  else if (a3 == 1)
  {
    v3 = CFSTR("SORT_BY_DATE_CREATED_TITLE");
    v4 = CFSTR("Date Created");
  }
  else
  {
    if (a3)
    {
      v5 = 0;
      return v5;
    }
    v3 = CFSTR("SORT_BY_DATE_EDITED_TITLE");
    v4 = CFSTR("Date Edited");
  }
  +[ICLocalization localizedFrameworkStringForKey:value:table:allowSiri:](ICLocalization, "localizedFrameworkStringForKey:value:table:allowSiri:", v3, v4, 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return v5;
}

+ (void)setCurrentNoteListSortTypeByTag:(int64_t)a3
{
  objc_msgSend(a1, "setCurrentNoteListSortType:", objc_msgSend(a1, "sortTypeForTag:", a3));
}

+ (BOOL)isMenuItemCurrentSortTypeForTag:(int64_t)a3
{
  uint64_t v5;

  v5 = objc_msgSend(a1, "currentNoteListSortType");
  return v5 == objc_msgSend(a1, "sortTypeForTag:", a3);
}

+ (int64_t)sortTypeForTag:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  int64_t result;

  result = a3 - 200;
  if ((unint64_t)(a3 - 200) >= 3)
  {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "+[ICNoteListSortUtilities sortTypeForTag:]", 1, 0, CFSTR("Unexpected tag for sort type"), v3, v4);
    return 0;
  }
  return result;
}

+ (int64_t)tagForSortType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((unint64_t)a3 < 3)
    return a3 + 200;
  +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "+[ICNoteListSortUtilities tagForSortType:]", 1, 0, CFSTR("Unexpected sort type for tag."), v3, v4);
  return 0;
}

+ (id)dateForCurrentSortTypeAccessibilityStringForNote:(id)a3 folderNoteSortType:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(a1, "dateForCurrentSortTypeForNote:folderNoteSortType:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_msgSend(a1, "currentNoteListSortType");
    v7 = (void *)MEMORY[0x1E0CB3940];
    if (v6 == 1)
      v8 = CFSTR("created %@");
    else
      v8 = CFSTR("modified %@");
    +[ICLocalization localizedFrameworkStringForKey:value:table:allowSiri:](ICLocalization, "localizedFrameworkStringForKey:value:table:allowSiri:", v8, v8, 0, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ic_briefFormattedDateForAccessibility");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v10, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
