@implementation PageLoadTestMeasurementController

- (void)_doBeforePageLoad
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  id v14;

  v5 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend_date(MEMORY[0x24BDBCE60], a2, v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeIntervalSinceReferenceDate(v6, v7, v8, v9);
  objc_msgSend_numberWithDouble_(v5, v10, v11, v12);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setValue_forKey_(self->super._loadData, v13, (uint64_t)v14, (uint64_t)CFSTR("PageLoadStartTime"));
}

- (void)_doAfterPageLoad
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  id v14;

  v5 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend_date(MEMORY[0x24BDBCE60], a2, v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeIntervalSinceReferenceDate(v6, v7, v8, v9);
  objc_msgSend_numberWithDouble_(v5, v10, v11, v12);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setValue_forKey_(self->super._loadData, v13, (uint64_t)v14, (uint64_t)CFSTR("PageLoadEndTime"));
}

@end
