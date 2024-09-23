@implementation IMSWHighlightCenterController

- (IMSWHighlightCenterController)initWithAppIdentifier:(id)a3
{
  id v4;
  IMSWHighlightCenterController *v5;
  NSObject *v6;
  uint64_t v7;
  SWHighlightCenter *highlightCenter;
  IMSyndicationUtilities *v9;
  IMSyndicationUtilities *utilities;
  objc_super v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IMSWHighlightCenterController;
  v5 = -[IMSWHighlightCenterController init](&v12, sel_init);
  if (v5)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v14 = "-[IMSWHighlightCenterController initWithAppIdentifier:]";
        _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
      }

    }
    if (objc_msgSend(MEMORY[0x1E0D397F8], "supportsSharedWithYou"))
    {
      v7 = objc_msgSend(objc_alloc((Class)MEMORY[0x1A858292C](CFSTR("SWHighlightCenter"), CFSTR("SharedWithYou"))), "initWithAppIdentifier:", v4);
      highlightCenter = v5->_highlightCenter;
      v5->_highlightCenter = (SWHighlightCenter *)v7;

      -[SWHighlightCenter setDelegate:](v5->_highlightCenter, "setDelegate:", v5);
      v9 = (IMSyndicationUtilities *)objc_alloc_init(MEMORY[0x1E0D39B30]);
      utilities = v5->_utilities;
      v5->_utilities = v9;

    }
  }

  return v5;
}

+ (id)sharedControllerWithAppIdentifier:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  _QWORD block[4];
  id v9;

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A200B9FC;
  block[3] = &unk_1E471E348;
  v9 = v3;
  v4 = qword_1EE65EB40;
  v5 = v3;
  if (v4 != -1)
    dispatch_once(&qword_1EE65EB40, block);
  v6 = (id)qword_1EE65EB48;

  return v6;
}

+ (id)sharedController
{
  return (id)MEMORY[0x1E0DE7D20](a1, sel_sharedControllerWithAppIdentifier_);
}

- (IMSWHighlightCenterController)init
{
  return -[IMSWHighlightCenterController initWithAppIdentifier:](self, "initWithAppIdentifier:", 0);
}

- (id)collaborationHighlightForURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[IMSWHighlightCenterController highlightCenter](self, "highlightCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "collaborationHighlightForURL:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)fetchAttributionsForHighlight:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  -[IMSWHighlightCenterController utilities](self, "utilities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMSWHighlightCenterController highlightCenter](self, "highlightCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1A202E19C;
  v11[3] = &unk_1E471E370;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v8, "fetchAttributionsForHighlight:highlight:completionBlock:", v9, v7, v11);

}

- (id)fetchAttributionsForHighlight:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[IMSWHighlightCenterController highlightCenter](self, "highlightCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchAttributionsForHighlight:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (IMSyndicationUtilities)utilities
{
  return self->_utilities;
}

- (SWHighlightCenter)highlightCenter
{
  return self->_highlightCenter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightCenter, 0);
  objc_storeStrong((id *)&self->_utilities, 0);
}

@end
