@implementation IMAssistantMessagePlayAudioHandler

- (void)handlePlayAudioMessage:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  _BYTE buf[24];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v6;
      _os_log_impl(&dword_21ED90000, v8, OS_LOG_TYPE_INFO, "Performing intent: %@", buf, 0xCu);
    }

  }
  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, self);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_21EDAAE98;
  v11[3] = &unk_24E396010;
  v11[4] = self;
  objc_copyWeak(&v14, (id *)buf);
  v9 = v6;
  v12 = v9;
  v10 = v7;
  v13 = v10;
  -[IMAssistantMessagePlayAudioHandler queryAudioMessageURLForIntent:completion:](self, "queryAudioMessageURLForIntent:completion:", v9, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);

}

- (void)confirmPlayAudioMessage:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v6;
      _os_log_impl(&dword_21ED90000, v8, OS_LOG_TYPE_INFO, "Confirm intent: %@", buf, 0xCu);
    }

  }
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_21EDAB2E0;
  v10[3] = &unk_24E396038;
  v11 = v7;
  v9 = v7;
  -[IMAssistantMessagePlayAudioHandler queryAudioMessageURLForIntent:completion:](self, "queryAudioMessageURLForIntent:completion:", v6, v10);

}

- (void)queryAudioMessageURLForIntent:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(a3, "messageIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
  {
    v12[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = sub_21EDAB504;
    v10[3] = &unk_24E396060;
    v11 = v6;
    -[IMAssistantMessageQueryHandler SPIQueryMessagesWithGUIDs:completion:](self, "SPIQueryMessagesWithGUIDs:completion:", v9, v10);

  }
  else
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

- (id)activeAudioPlayer
{
  return self->_audioPlayer;
}

- (id)createAudioPlayerWithIdentifier:(id)a3
{
  id v4;
  IMAssistantAudioPlayer *v5;

  v4 = a3;
  v5 = -[IMAssistantAudioPlayer initWithDelegate:identifier:]([IMAssistantAudioPlayer alloc], "initWithDelegate:identifier:", self, v4);

  return v5;
}

- (void)imAssistantAudioPlayer:(id)a3 didUpdateState:(int64_t)a4
{
  uint64_t v5;
  uint64_t v6;
  id completionHandler;
  id v8;

  if (self->_completionHandler)
  {
    v5 = 4;
    if (a4 == 2)
      v5 = 2;
    if (a4 == 1)
      v6 = 3;
    else
      v6 = v5;
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD9F58]), "initWithCode:userActivity:", v6, 0);
    (*((void (**)(void))self->_completionHandler + 2))();
    completionHandler = self->_completionHandler;
    self->_completionHandler = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_audioPlayer, 0);
}

@end
