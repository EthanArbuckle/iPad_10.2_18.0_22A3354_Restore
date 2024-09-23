@implementation CUIKCalendarListSorter

+ (id)ekSourceComparator
{
  return &__block_literal_global_17;
}

uint64_t __44__CUIKCalendarListSorter_ekSourceComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v4 = a2;
  v5 = a3;
  if (!objc_msgSend(v4, "sourceType") && objc_msgSend(v5, "sourceType"))
    goto LABEL_10;
  if (!objc_msgSend(v5, "sourceType") && objc_msgSend(v4, "sourceType"))
    goto LABEL_12;
  if ((objc_msgSend(v4, "isNestedLocalSource") & 1) == 0 && (objc_msgSend(v5, "isNestedLocalSource") & 1) != 0)
  {
LABEL_10:
    v11 = -1;
    goto LABEL_17;
  }
  if ((objc_msgSend(v5, "isNestedLocalSource") & 1) == 0 && (objc_msgSend(v4, "isNestedLocalSource") & 1) != 0)
  {
LABEL_12:
    v11 = 1;
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0CAA010], "calendarPreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "displayOrderForAccountWithSourceIdentifier:", v7);

  objc_msgSend(v5, "sourceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "displayOrderForAccountWithSourceIdentifier:", v9);

  if (v8 >= v10)
  {
    if (v8 > v10)
    {
      v11 = 1;
    }
    else
    {
      objc_msgSend(v4, "title");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "title");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v12, "compare:", v13);

    }
  }
  else
  {
    v11 = -1;
  }

LABEL_17:
  return v11;
}

+ (id)ekCalendarComparator
{
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__CUIKCalendarListSorter_ekCalendarComparator__block_invoke;
  aBlock[3] = &__block_descriptor_40_e35_q24__0__EKCalendar_8__EKCalendar_16l;
  aBlock[4] = a1;
  return _Block_copy(aBlock);
}

uint64_t __46__CUIKCalendarListSorter_ekCalendarComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  int v14;
  void *v15;
  void *v16;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "source");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "source");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqual:", v8))
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "ekSourceComparator");
    v9 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "source");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "source");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = ((uint64_t (**)(_QWORD, void *, void *))v9)[2](v9, v10, v11);

    if (v12)
      goto LABEL_9;
  }
  v13 = objc_msgSend(v5, "displayOrder");
  if (v13 >= (int)objc_msgSend(v6, "displayOrder"))
  {
    v14 = objc_msgSend(v5, "displayOrder");
    if (v14 <= (int)objc_msgSend(v6, "displayOrder"))
    {
      objc_msgSend(v5, "title");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "title");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v15, "compare:", v16);

    }
    else
    {
      v12 = 1;
    }
  }
  else
  {
    v12 = -1;
  }
LABEL_9:

  return v12;
}

+ (id)ekOtherCalendarComparator
{
  return &__block_literal_global_7_1;
}

uint64_t __51__CUIKCalendarListSorter_ekOtherCalendarComparator__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  int64_t v5;
  int64_t v6;

  v4 = a3;
  v5 = +[CUIKCalendarListSorter orderForOtherCalendar:](CUIKCalendarListSorter, "orderForOtherCalendar:", a2);
  v6 = +[CUIKCalendarListSorter orderForOtherCalendar:](CUIKCalendarListSorter, "orderForOtherCalendar:", v4);

  if (v5 < v6)
    return -1;
  else
    return 1;
}

+ (int64_t)orderForOtherCalendar:(id)a3
{
  id v3;
  int64_t v4;
  NSObject *v6;

  v3 = a3;
  if (objc_msgSend(v3, "type") == 4 || objc_msgSend(v3, "type") == 6)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isSubscribedHolidayCalendar") & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isSuggestedEventCalendar") & 1) != 0)
  {
    v4 = 2;
  }
  else
  {
    +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[CUIKCalendarListSorter orderForOtherCalendar:].cold.1(v3, v6);

    v4 = -1;
  }

  return v4;
}

+ (void)orderForOtherCalendar:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_1B8A6A000, a2, OS_LOG_TYPE_ERROR, "problem with 'other' calendar uid %{public}@", (uint8_t *)&v4, 0xCu);

}

@end
