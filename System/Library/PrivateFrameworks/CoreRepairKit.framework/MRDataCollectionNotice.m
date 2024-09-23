@implementation MRDataCollectionNotice

+ (BOOL)shouldShowDataCollectionNoticeForComponent:(unint64_t)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  char v11;
  char v12;

  v4 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v7 = (void *)objc_msgSend_initWithSuiteName_(v4, v5, (uint64_t)CFSTR("com.apple.mobilerepaird"), v6);
  v10 = v7;
  if (a3)
  {
    if (a3 == 10)
    {
      v11 = objc_msgSend_BOOLForKey_(v7, v8, (uint64_t)CFSTR("dataCollectionNoticePresentedForPartsAndService"), v9);
    }
    else
    {
      if (a3 != 1)
      {
        v12 = 0;
        goto LABEL_9;
      }
      v11 = objc_msgSend_BOOLForKey_(v7, v8, (uint64_t)CFSTR("dataCollectionNoticePresentedForDisplay"), v9);
    }
  }
  else
  {
    v11 = objc_msgSend_BOOLForKey_(v7, v8, (uint64_t)CFSTR("dataCollectionNoticePresentedForBattery"), v9);
  }
  v12 = v11 ^ 1;
LABEL_9:

  return v12;
}

+ (void)didShowDataCollectionNoticeForComponent:(unint64_t)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const __CFString *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v4 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v7 = (void *)objc_msgSend_initWithSuiteName_(v4, v5, (uint64_t)CFSTR("com.apple.mobilerepaird"), v6);
  switch(a3)
  {
    case 0uLL:
      v9 = CFSTR("dataCollectionNoticePresentedForBattery");
      goto LABEL_7;
    case 0xAuLL:
      v9 = CFSTR("dataCollectionNoticePresentedForPartsAndService");
      goto LABEL_7;
    case 1uLL:
      v9 = CFSTR("dataCollectionNoticePresentedForDisplay");
LABEL_7:
      v13 = v7;
      objc_msgSend_setBool_forKey_(v7, v8, 1, (uint64_t)v9);
      objc_msgSend_synchronize(v13, v10, v11, v12);
      v7 = v13;
      break;
  }

}

@end
