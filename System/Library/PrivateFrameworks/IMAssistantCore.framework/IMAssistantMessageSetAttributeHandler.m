@implementation IMAssistantMessageSetAttributeHandler

- (void)handleSetMessageAttribute:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  os_signpost_id_t v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  _IMAssistantCoreGeneralSignpostLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  _IMAssistantCoreGeneralSignpostLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "handleSetMessageAttributeIntent", (const char *)&unk_21EDC1733, buf, 2u);
  }

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v5;
      _os_log_impl(&dword_21ED90000, v11, OS_LOG_TYPE_INFO, "Handling SetMessageAttribute intent: %@", buf, 0xCu);
    }

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_21EDB41EC;
  block[3] = &unk_24E3962E8;
  v16 = v6;
  v17 = v8;
  v15 = v5;
  v12 = v6;
  v13 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

@end
