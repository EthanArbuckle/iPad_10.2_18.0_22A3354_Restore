@implementation CKDateUtilities

+ (id)relativeDateFormatterFromDate:(id)a3 toDate:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v6 = (void *)MEMORY[0x1E0C99D48];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "__ck_currentCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "__ck_unitOfDisambiguityFromDate:toDate:", v8, v7);

  if (v10 == 8)
  {
    objc_msgSend(a1, "thisYearDateFormatter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v10 == 4)
      objc_msgSend(a1, "thePastDateFormatter");
    else
      objc_msgSend(a1, "thisWeekRelativeDateFormatter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v11;
}

+ (id)relativeDateOnlyFormatterFromDate:(id)a3 toDate:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v6 = (void *)MEMORY[0x1E0C99D48];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "__ck_currentCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "__ck_unitOfDisambiguityFromDate:toDate:", v8, v7);

  if (v10 == 8)
  {
    objc_msgSend(a1, "thisYearDateFormatterNoTime");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v10 == 4)
      objc_msgSend(a1, "thePastDateFormatterNoTime");
    else
      objc_msgSend(a1, "thisWeekRelativeDateFormatterNoTime");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v11;
}

+ (id)relativeFullDateOnlyFormatterFromDate:(id)a3 toDate:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v6 = (void *)MEMORY[0x1E0C99D48];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "__ck_currentCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "__ck_unitOfDisambiguityFromDate:toDate:", v8, v7);

  if (v10 == 8)
  {
    objc_msgSend(a1, "thisYearFullDateFormatterNoTime");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v10 == 4)
      objc_msgSend(a1, "thePastFullDateFormatterNoTime");
    else
      objc_msgSend(a1, "thisWeekRelativeDateFormatterNoTime");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v11;
}

+ (id)thisWeekRelativeDateFormatter
{
  void *v2;
  void *v3;

  +[CKDateFormatterHelper sharedInstance](CKDateFormatterHelper, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getDateFormatterFor:", 7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)thisWeekRelativeDateFormatterNoTime
{
  void *v2;
  void *v3;

  +[CKDateFormatterHelper sharedInstance](CKDateFormatterHelper, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getDateFormatterFor:", 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)thisYearDateFormatterNoTime
{
  void *v2;
  void *v3;

  +[CKDateFormatterHelper sharedInstance](CKDateFormatterHelper, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getDateFormatterFor:", 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)thisYearFullDateFormatterNoTime
{
  void *v2;
  void *v3;

  +[CKDateFormatterHelper sharedInstance](CKDateFormatterHelper, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getDateFormatterFor:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)thisYearDateFormatter
{
  void *v2;
  void *v3;

  +[CKDateFormatterHelper sharedInstance](CKDateFormatterHelper, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getDateFormatterFor:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)thePastFullDateFormatterNoTime
{
  void *v2;
  void *v3;

  +[CKDateFormatterHelper sharedInstance](CKDateFormatterHelper, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getDateFormatterFor:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)thePastDateFormatterNoTime
{
  void *v2;
  void *v3;

  +[CKDateFormatterHelper sharedInstance](CKDateFormatterHelper, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getDateFormatterFor:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)thePastDateFormatter
{
  void *v2;
  void *v3;

  +[CKDateFormatterHelper sharedInstance](CKDateFormatterHelper, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getDateFormatterFor:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)theShortDateNoTimeInSentenceDateFormatter
{
  void *v2;
  void *v3;

  +[CKDateFormatterHelper sharedInstance](CKDateFormatterHelper, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getDateFormatterFor:", 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)timestampDateFormatter
{
  void *v2;
  void *v3;

  +[CKDateFormatterHelper sharedInstance](CKDateFormatterHelper, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getDateFormatterFor:", 9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)theRelativeStandaloneDateFormatter
{
  void *v2;
  void *v3;

  +[CKDateFormatterHelper sharedInstance](CKDateFormatterHelper, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getDateFormatterFor:", 10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
