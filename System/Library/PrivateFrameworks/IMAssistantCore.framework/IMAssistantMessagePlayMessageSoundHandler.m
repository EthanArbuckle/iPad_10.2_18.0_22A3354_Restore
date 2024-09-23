@implementation IMAssistantMessagePlayMessageSoundHandler

- (void)handlePlayMessageSound:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v14 = 138412290;
      v15 = v6;
      _os_log_impl(&dword_21ED90000, v8, OS_LOG_TYPE_INFO, "Handling INPlayMessageSoundIntent: %@", (uint8_t *)&v14, 0xCu);
    }

  }
  objc_msgSend(v6, "messageIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "soundType");
  if (!v10)
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDD9F80]), "initWithCode:userActivity:", 4, 0);
    goto LABEL_9;
  }
  if (v10 == 1)
  {
    -[IMAssistantMessagePlayMessageSoundHandler playSendSoundForMessageGUID:](self, "playSendSoundForMessageGUID:", v9);
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v12 = (void *)v11;
    goto LABEL_11;
  }
  v12 = 0;
LABEL_11:
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = 138412290;
      v15 = v12;
      _os_log_impl(&dword_21ED90000, v13, OS_LOG_TYPE_INFO, "Calling completion with INPlayMessageSoundIntentResponse: %@", (uint8_t *)&v14, 0xCu);
    }

  }
  v7[2](v7, v12);

}

- (id)playSendSoundForMessageGUID:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_21ED90000, v4, OS_LOG_TYPE_INFO, "Playing send sounds for messageGUID: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x24BE502D0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playSendSoundForMessageGUID:callerOrigin:", v3, 1);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9F80]), "initWithCode:userActivity:", 3, 0);
  return v6;
}

@end
