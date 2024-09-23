@implementation PageMemoryMeasurementController

- (PageMemoryMeasurementController)initWithPluginPageContextController:(id)a3 pagesNeedingMemoryWarningSent:(id)a4
{
  id v7;
  PageMemoryMeasurementController *v8;
  PageMemoryMeasurementController *v9;
  PageMemoryMeasurementController *v10;
  objc_super v12;

  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PageMemoryMeasurementController;
  v8 = -[MeasurementControllerBase initWithPluginPageContextController:](&v12, sel_initWithPluginPageContextController_, a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_pagesNeedingMemoryWarningSent, a4);
    v9->_currentPageIndex = -1;
    v10 = v9;
  }

  return v9;
}

- (id)_memoryUsage:(BOOL)a3
{
  _BOOL4 v3;
  const char *v4;
  uint64_t v5;
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[12];
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a3;
  task_info_outCnt = 93;
  if (task_info(*MEMORY[0x24BDAEC58], 0x16u, task_info_out, &task_info_outCnt))
  {
    objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], v4, 0, v5);
  }
  else if (v3)
  {
    objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], v4, v11, v5);
  }
  else
  {
    objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], v4, v10 + v9, v5);
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_doBeforePageLoad
{
  ++self->_currentPageIndex;
}

- (void)_postPageLoadEnd
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  NSTimer *v21;
  NSTimer *waitForMemoryPressureHandler;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;

  objc_msgSend_objectForKey_(self->super._loadData, a2, (uint64_t)CFSTR("PageMemoryBeforeWarning"), v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend_objectAtIndex_(self->_pagesNeedingMemoryWarningSent, v5, self->_currentPageIndex, v6);
    v31 = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend_BOOLValue(v31, v7, v8, v9);

    if ((v10 & 1) != 0)
    {
      objc_msgSend__memoryUsage_(self, v11, 1, v13);
      v32 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setValue_forKey_(self->super._loadData, v14, (uint64_t)v32, (uint64_t)CFSTR("PageMemoryBeforeWarning"));
      notify_post("org.WebKit.lowMemory");
      v15 = objc_alloc(MEMORY[0x24BDBCF40]);
      objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x24BDBCE60], v16, v17, v18, 2.0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (NSTimer *)objc_msgSend_initWithFireDate_interval_target_selector_userInfo_repeats_(v15, v20, (uint64_t)v19, (uint64_t)self, sel__waitForMemoryPressureHandlerTimerFired_, 0, 0, 0.0);
      waitForMemoryPressureHandler = self->_waitForMemoryPressureHandler;
      self->_waitForMemoryPressureHandler = v21;

      objc_msgSend_currentRunLoop(MEMORY[0x24BDBCF18], v23, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addTimer_forMode_(v26, v27, (uint64_t)self->_waitForMemoryPressureHandler, *MEMORY[0x24BDBCA90]);

    }
    else
    {
      objc_msgSend__sendPageLoadFinishedEvent(self, v11, v12, v13);
      objc_msgSend__clearPageLoadState(self, v28, v29, v30);
    }
  }
}

- (void)_waitForMemoryPressureHandlerTimerFired:(id)a3
{
  uint64_t v3;
  const char *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  objc_msgSend__memoryUsage_(self, a2, 0, v3);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(self->super._loadData, v5, (uint64_t)v12, (uint64_t)CFSTR("PageMemoryAfterWarning"));
  objc_msgSend__sendPageLoadFinishedEvent(self, v6, v7, v8);
  objc_msgSend__clearPageLoadState(self, v9, v10, v11);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pagesNeedingMemoryWarningSent, 0);
  objc_storeStrong((id *)&self->_waitForMemoryPressureHandler, 0);
}

@end
