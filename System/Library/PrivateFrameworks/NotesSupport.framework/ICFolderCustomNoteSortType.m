@implementation ICFolderCustomNoteSortType

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;

  v4 = a3;
  v5 = objc_opt_class();
  ICDynamicCast(v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && (v7 = objc_msgSend(v6, "order"), v7 == -[ICFolderCustomNoteSortType order](self, "order")))
  {
    v8 = objc_msgSend(v6, "direction");
    v9 = v8 == -[ICFolderCustomNoteSortType direction](self, "direction");
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (int64_t)direction
{
  return self->_direction;
}

- (int64_t)resolvedCustomSortTypeOrder
{
  int64_t result;

  result = -[ICFolderCustomNoteSortType order](self, "order");
  if (!result)
    return +[ICFolderCustomNoteSortType customOrderForCurrentNoteListSortType](ICFolderCustomNoteSortType, "customOrderForCurrentNoteListSortType");
  return result;
}

- (int64_t)order
{
  return self->_order;
}

+ (id)noteSortTypeDefaultAscending
{
  return +[ICFolderCustomNoteSortType folderNoteSortTypeWithOrder:direction:](ICFolderCustomNoteSortType, "folderNoteSortTypeWithOrder:direction:", 0, 0);
}

+ (id)folderNoteSortTypeWithOrder:(int64_t)a3 direction:(int64_t)a4
{
  int64_t v6;
  ICFolderCustomNoteSortType *v7;

  v6 = a3;
  if ((unint64_t)a3 >= 4)
  {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "+[ICFolderCustomNoteSortType folderNoteSortTypeWithOrder:direction:]", 1, 0, CFSTR("Incorrect value for folder note sort order %d, using default"), a3);
    v6 = 0;
  }
  if ((unint64_t)a4 >= 2)
  {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "+[ICFolderCustomNoteSortType folderNoteSortTypeWithOrder:direction:]", 1, 0, CFSTR("Incorrect value for folder note sort direction %d, using ascending"), a3);
    a4 = 0;
  }
  v7 = objc_alloc_init(ICFolderCustomNoteSortType);
  -[ICFolderCustomNoteSortType setOrder:](v7, "setOrder:", v6);
  -[ICFolderCustomNoteSortType setDirection:](v7, "setDirection:", a4);
  return v7;
}

- (void)setOrder:(int64_t)a3
{
  self->_order = a3;
}

- (void)setDirection:(int64_t)a3
{
  self->_direction = a3;
}

- (id)folderNoteSortTypeByChangingOrder:(int64_t)a3
{
  return (id)objc_msgSend((id)objc_opt_class(), "folderNoteSortTypeWithOrder:direction:", a3, -[ICFolderCustomNoteSortType direction](self, "direction"));
}

- (id)folderNoteSortTypeByChangingDirection
{
  uint64_t v3;

  v3 = -[ICFolderCustomNoteSortType order](self, "order");
  if (!v3)
    v3 = objc_msgSend((id)objc_opt_class(), "customOrderForGlobalSortType:", +[ICNoteListSortUtilities currentNoteListSortType](ICNoteListSortUtilities, "currentNoteListSortType"));
  return (id)objc_msgSend((id)objc_opt_class(), "folderNoteSortTypeWithOrder:direction:", v3, -[ICFolderCustomNoteSortType direction](self, "direction") == 0);
}

+ (id)folderNoteSortTypeFromValue:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v4 = objc_msgSend(a3, "integerValue");
  v5 = v4;
  if (v4 <= 0x1F)
  {
    if (((1 << v4) & 0xC00) != 0)
    {
      v6 = 1;
      goto LABEL_11;
    }
    if (((1 << v4) & 0x300000) != 0)
    {
      v6 = 2;
      goto LABEL_11;
    }
    if (((1 << v4) & 0xC0000000) != 0)
    {
      v6 = 3;
      goto LABEL_11;
    }
  }
  if (v4)
  {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "+[ICFolderCustomNoteSortType folderNoteSortTypeFromValue:]", 1, 0, CFSTR("Invalid value for cusotm sort type, using default"));
    v6 = 0;
LABEL_11:
    if (v5 <= 0x1F)
    {
      if (((1 << v5) & 0x40100401) != 0)
      {
LABEL_16:
        v5 = 0;
        return (id)objc_msgSend(a1, "folderNoteSortTypeWithOrder:direction:", v6, v5);
      }
      if (((1 << v5) & 0x80200800) != 0)
      {
        v5 = 1;
        return (id)objc_msgSend(a1, "folderNoteSortTypeWithOrder:direction:", v6, v5);
      }
    }
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "+[ICFolderCustomNoteSortType folderNoteSortTypeFromValue:]", 1, 0, CFSTR("Invalid value for cusotm sort type, using default"));
    goto LABEL_16;
  }
  v6 = 0;
  return (id)objc_msgSend(a1, "folderNoteSortTypeWithOrder:direction:", v6, v5);
}

- (NSNumber)valueRepresentation
{
  int64_t v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = -[ICFolderCustomNoteSortType order](self, "order");
  v4 = -[ICFolderCustomNoteSortType direction](self, "direction");
  v5 = 30;
  if (v4)
    v5 = 31;
  v6 = 20;
  if (v4)
    v6 = 21;
  v7 = 10;
  if (v4)
    v7 = 11;
  if (v3 != 1)
    v7 = 0;
  if (v3 != 2)
    v6 = v7;
  if (v3 == 3)
    v8 = v5;
  else
    v8 = v6;
  return (NSNumber *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[ICFolderCustomNoteSortType debugStringNameForOrder:](self, "debugStringNameForOrder:", -[ICFolderCustomNoteSortType order](self, "order"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "stringNameForDirection:order:", -[ICFolderCustomNoteSortType direction](self, "direction"), -[ICFolderCustomNoteSortType order](self, "order"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("SortType: %@, %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)debugStringNameForOrder:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return 0;
  else
    return off_1EA824140[a3];
}

- (BOOL)isDefault
{
  void *v3;

  objc_msgSend((id)objc_opt_class(), "noteSortTypeDefaultAscending");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[ICFolderCustomNoteSortType isEqual:](self, "isEqual:", v3);

  return (char)self;
}

- (BOOL)isAscending
{
  return -[ICFolderCustomNoteSortType direction](self, "direction") == 0;
}

+ (NSString)currentDefaultMenuItemString
{
  int64_t v2;
  const __CFString *v3;
  __CFString *v4;

  v2 = +[ICNoteListSortUtilities currentNoteListSortType](ICNoteListSortUtilities, "currentNoteListSortType");
  if (v2)
  {
    if (v2 == 1)
    {
      v3 = CFSTR("Default (Date Created)");
    }
    else
    {
      if (v2 != 2)
      {
        v4 = &stru_1EA825738;
        return (NSString *)v4;
      }
      v3 = CFSTR("Default (Title)");
    }
  }
  else
  {
    v3 = CFSTR("Default (Date Edited)");
  }
  +[ICLocalization localizedFrameworkStringForKey:value:table:allowSiri:](ICLocalization, "localizedFrameworkStringForKey:value:table:allowSiri:", v3, v3, 0, 1);
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  return (NSString *)v4;
}

+ (int64_t)customOrderForCurrentNoteListSortType
{
  return +[ICFolderCustomNoteSortType customOrderForGlobalSortType:](ICFolderCustomNoteSortType, "customOrderForGlobalSortType:", +[ICNoteListSortUtilities currentNoteListSortType](ICNoteListSortUtilities, "currentNoteListSortType"));
}

+ (int64_t)customOrderForGlobalSortType:(int64_t)a3
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

+ (int64_t)sortTypeOrderForTag:(unint64_t)a3
{
  if (a3 - 12114 >= 3)
    return 0;
  else
    return a3 - 12113;
}

+ (int64_t)sortTypeDirectionForTag:(unint64_t)a3
{
  return a3 == 12118;
}

+ (unint64_t)tagForSortTypeOrder:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3)
    return 12113;
  else
    return a3 + 12113;
}

+ (unint64_t)tagForSortTypeDirection:(int64_t)a3
{
  if (a3 == 1)
    return 12118;
  else
    return 12117;
}

+ (BOOL)isTagAnOrder:(int64_t)a3
{
  return (unint64_t)(a3 - 12113) < 4;
}

+ (BOOL)isTagADirection:(int64_t)a3
{
  return (unint64_t)(a3 - 12117) < 2;
}

+ (NSArray)sortTypeOrderValues
{
  if (sortTypeOrderValues_onceToken != -1)
    dispatch_once(&sortTypeOrderValues_onceToken, &__block_literal_global_8);
  return (NSArray *)(id)sortTypeOrderValues_sortTypeOrderValues;
}

void __49__ICFolderCustomNoteSortType_sortTypeOrderValues__block_invoke()
{
  void *v0;

  v0 = (void *)sortTypeOrderValues_sortTypeOrderValues;
  sortTypeOrderValues_sortTypeOrderValues = (uint64_t)&unk_1EA832528;

}

+ (id)stringNameForDirection:(int64_t)a3 order:(int64_t)a4
{
  const __CFString *v5;

  if (!a4)
    a4 = objc_msgSend((id)objc_opt_class(), "customOrderForGlobalSortType:", +[ICNoteListSortUtilities currentNoteListSortType](ICNoteListSortUtilities, "currentNoteListSortType"));
  if (a4 == 3)
  {
    if (a3)
      v5 = CFSTR("Descending");
    else
      v5 = CFSTR("Ascending");
  }
  else if (a3)
  {
    v5 = CFSTR("Oldest First");
  }
  else
  {
    v5 = CFSTR("Newest First");
  }
  +[ICLocalization localizedFrameworkStringForKey:value:table:allowSiri:](ICLocalization, "localizedFrameworkStringForKey:value:table:allowSiri:", v5, v5, 0, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)actionItemTitleForOrder:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  const __CFString *v6;
  const __CFString *v7;

  switch(a3)
  {
    case 0:
      objc_msgSend(a1, "currentDefaultMenuItemString", v3, v4);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      return a1;
    case 1:
      v6 = CFSTR("Date Edited");
      goto LABEL_6;
    case 2:
      v6 = CFSTR("Date Created");
LABEL_6:
      v7 = v6;
      goto LABEL_8;
    case 3:
      v6 = CFSTR("TITLE_SORT_BY");
      v7 = CFSTR("Title");
LABEL_8:
      +[ICLocalization localizedFrameworkStringForKey:value:table:allowSiri:](ICLocalization, "localizedFrameworkStringForKey:value:table:allowSiri:", v6, v7, 0, 1, v3, v4);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return a1;
  }
  return a1;
}

+ (ICFolderCustomNoteSortType)querySortType
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("QuerySortType"));

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICFolderCustomNoteSortType folderNoteSortTypeFromValue:](ICFolderCustomNoteSortType, "folderNoteSortTypeFromValue:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[ICFolderCustomNoteSortType noteSortTypeDefaultAscending](ICFolderCustomNoteSortType, "noteSortTypeDefaultAscending");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (ICFolderCustomNoteSortType *)v5;
}

+ (void)setQuerySortType:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(a3, "valueRepresentation");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("QuerySortType"));

}

- (NSString)summaryViewTitleDescription
{
  int64_t v2;
  const __CFString *v3;
  __CFString *v4;

  v2 = -[ICFolderCustomNoteSortType order](self, "order");
  switch(v2)
  {
    case 1:
      v3 = CFSTR("Sorted by Date Edited");
      break;
    case 2:
      v3 = CFSTR("Sorted by Date Created");
      break;
    case 3:
      v3 = CFSTR("Sorted by Title");
      break;
    default:
      v4 = &stru_1EA825738;
      return (NSString *)v4;
  }
  +[ICLocalization localizedFrameworkStringForKey:value:table:allowSiri:](ICLocalization, "localizedFrameworkStringForKey:value:table:allowSiri:", v3, v3, 0, 1);
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  return (NSString *)v4;
}

- (id)currentActionItemTitle
{
  int64_t v3;
  const __CFString *v4;
  __CFString *v5;

  v3 = +[ICNoteListSortUtilities currentNoteListSortType](ICNoteListSortUtilities, "currentNoteListSortType");
  switch(-[ICFolderCustomNoteSortType order](self, "order"))
  {
    case 0:
      if (v3)
      {
        if (v3 == 1)
        {
          v4 = CFSTR("Sort by Date Created (Default)");
        }
        else
        {
          if (v3 != 2)
            goto LABEL_6;
          v4 = CFSTR("Sort by Title (Default)");
        }
      }
      else
      {
        v4 = CFSTR("Sort by Date Edited (Default)");
      }
      goto LABEL_12;
    case 1:
      v4 = CFSTR("Sort by Date Edited");
      goto LABEL_12;
    case 2:
      v4 = CFSTR("Sort by Date Created");
      goto LABEL_12;
    case 3:
      v4 = CFSTR("Sort by Title");
LABEL_12:
      +[ICLocalization localizedFrameworkStringForKey:value:table:allowSiri:](ICLocalization, "localizedFrameworkStringForKey:value:table:allowSiri:", v4, v4, 0, 1);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
LABEL_6:
      v5 = &stru_1EA825738;
      break;
  }
  return v5;
}

+ (id)segmentItemTitleForOrder:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  const __CFString *v5;
  __CFString *v6;
  const __CFString *v7;

  switch(a3)
  {
    case 0:
      v5 = CFSTR("Default");
      goto LABEL_7;
    case 1:
      v5 = CFSTR("Edited");
      goto LABEL_7;
    case 2:
      v5 = CFSTR("Created");
LABEL_7:
      v7 = v5;
      goto LABEL_9;
    case 3:
      v5 = CFSTR("TITLE_SORT_BY");
      v7 = CFSTR("Title");
LABEL_9:
      +[ICLocalization localizedFrameworkStringForKey:value:table:allowSiri:](ICLocalization, "localizedFrameworkStringForKey:value:table:allowSiri:", v5, v7, 0, 1, v3, v4);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v6 = &stru_1EA825738;
      break;
  }
  return v6;
}

@end
