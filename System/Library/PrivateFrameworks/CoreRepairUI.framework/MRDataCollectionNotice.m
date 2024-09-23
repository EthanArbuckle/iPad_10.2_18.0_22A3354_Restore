@implementation MRDataCollectionNotice

+ (BOOL)shouldShowDataCollectionNoticeForComponent:(unint64_t)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  int v7;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.mobilerepaird"));
  v5 = v4;
  if (a3)
  {
    if (a3 == 10)
    {
      v6 = CFSTR("dataCollectionNoticePresentedForPartsAndService");
    }
    else
    {
      if (a3 != 1)
      {
        LOBYTE(v7) = 0;
        goto LABEL_9;
      }
      v6 = CFSTR("dataCollectionNoticePresentedForDisplay");
    }
  }
  else
  {
    v6 = CFSTR("dataCollectionNoticePresentedForBattery");
  }
  v7 = objc_msgSend(v4, "BOOLForKey:", v6) ^ 1;
LABEL_9:

  return v7;
}

+ (void)didShowDataCollectionNoticeForComponent:(unint64_t)a3
{
  void *v4;
  const __CFString *v5;
  id v6;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.mobilerepaird"));
  switch(a3)
  {
    case 0uLL:
      v5 = CFSTR("dataCollectionNoticePresentedForBattery");
      goto LABEL_7;
    case 0xAuLL:
      v5 = CFSTR("dataCollectionNoticePresentedForPartsAndService");
      goto LABEL_7;
    case 1uLL:
      v5 = CFSTR("dataCollectionNoticePresentedForDisplay");
LABEL_7:
      v6 = v4;
      objc_msgSend(v4, "setBool:forKey:", 1, v5);
      objc_msgSend(v6, "synchronize");
      v4 = v6;
      break;
  }

}

@end
