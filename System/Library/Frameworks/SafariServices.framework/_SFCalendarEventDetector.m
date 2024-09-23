@implementation _SFCalendarEventDetector

- (_SFCalendarEventDetector)initWithWebView:(id)a3
{
  id v4;
  _SFCalendarEventDetector *v5;
  _SFCalendarEventDetector *v6;
  _SFCalendarEventDetector *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SFCalendarEventDetector;
  v5 = -[_SFCalendarEventDetector init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_webView, v4);
    v7 = v6;
  }

  return v6;
}

- (void)containsCalendarEventForPageWithSchemaOrgMarkup:(BOOL)a3
{
  id WeakRetained;
  void *v6;
  dispatch_block_t v7;
  id checkForCalendarEventsBlock;
  dispatch_time_t v9;
  _QWORD block[4];
  id v11;
  BOOL v12;
  id location;

  -[_SFCalendarEventDetector cancelCheckForConfirmationPage](self, "cancelCheckForConfirmationPage");
  WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  objc_msgSend(WeakRetained, "_unreachableURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76___SFCalendarEventDetector_containsCalendarEventForPageWithSchemaOrgMarkup___block_invoke;
    block[3] = &unk_1E4AC3928;
    objc_copyWeak(&v11, &location);
    v12 = a3;
    v7 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, block);
    checkForCalendarEventsBlock = self->_checkForCalendarEventsBlock;
    self->_checkForCalendarEventsBlock = v7;

    v9 = dispatch_time(0, 2000000000);
    dispatch_after(v9, MEMORY[0x1E0C80D38], self->_checkForCalendarEventsBlock);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (void)cancelCheckForConfirmationPage
{
  id checkForCalendarEventsBlock;
  id v4;

  checkForCalendarEventsBlock = self->_checkForCalendarEventsBlock;
  if (checkForCalendarEventsBlock)
  {
    dispatch_block_cancel(checkForCalendarEventsBlock);
    v4 = self->_checkForCalendarEventsBlock;
    self->_checkForCalendarEventsBlock = 0;

  }
}

- (void)_containsCalendarEventForPageWithSchemaOrgMarkup:(BOOL)a3
{
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _SFCalendarEventDetector *v17;
  BOOL v18;

  WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = WBS_LOG_CHANNEL_PREFIXCalendarEventDetection();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[_SFCalendarEventDetector _containsCalendarEventForPageWithSchemaOrgMarkup:].cold.2(v9);
    v10 = WBS_LOG_CHANNEL_PREFIXCalendarEventDetection();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[_SFCalendarEventDetector _containsCalendarEventForPageWithSchemaOrgMarkup:].cold.1();
    dispatch_get_global_queue(9, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __77___SFCalendarEventDetector__containsCalendarEventForPageWithSchemaOrgMarkup___block_invoke;
    v14[3] = &unk_1E4AC3978;
    v15 = v7;
    v16 = v8;
    v18 = a3;
    v17 = self;
    v12 = v8;
    v13 = v7;
    dispatch_async(v11, v14);

  }
}

- (void)_service:(id)a3 didFindEventCandidateForURL:(id)a4 pageTitle:(id)a5
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  void *v12;
  void *v13;
  int v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  _SFCalendarEventDetector *v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  v12 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "URL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqual:", v9);

    if (v14)
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __75___SFCalendarEventDetector__service_didFindEventCandidateForURL_pageTitle___block_invoke;
      v15[3] = &unk_1E4AC39C8;
      v16 = v9;
      v17 = v8;
      v18 = v10;
      v19 = self;
      objc_msgSend(v12, "_getMainResourceDataWithCompletionHandler:", v15);

    }
  }

}

- (void)_foundCalendarEvents:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a3;
  v4 = WBS_LOG_CHANNEL_PREFIXCalendarEventDetection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1A3B2D000, v4, OS_LOG_TYPE_INFO, "Found calendar events", v6, 2u);
  }
  v5 = WBS_LOG_CHANNEL_PREFIXCalendarEventDetection();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[_SFCalendarEventDetector _foundCalendarEvents:].cold.1();

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_checkForCalendarEventsBlock, 0);
  objc_destroyWeak((id *)&self->_webView);
}

- (void)_containsCalendarEventForPageWithSchemaOrgMarkup:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  v3 = 2113;
  v4 = v0;
  OUTLINED_FUNCTION_2_3(&dword_1A3B2D000, v1, (uint64_t)v1, "Page URL: %{private}@ and title: '%{private}@'", v2);
  OUTLINED_FUNCTION_3_2();
}

- (void)_containsCalendarEventForPageWithSchemaOrgMarkup:(os_log_t)log .cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A3B2D000, log, OS_LOG_TYPE_DEBUG, "Beginning event detection on page", v1, 2u);
}

- (void)_foundCalendarEvents:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_1A3B2D000, v0, v1, "Calendar events: %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_2();
}

@end
