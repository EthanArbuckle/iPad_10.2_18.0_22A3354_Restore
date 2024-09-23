@implementation EDUserNotificationMailboxCutoffController

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__EDUserNotificationMailboxCutoffController_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_96 != -1)
    dispatch_once(&log_onceToken_96, block);
  return (OS_os_log *)(id)log_log_96;
}

void __48__EDUserNotificationMailboxCutoffController_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_96;
  log_log_96 = (uint64_t)v1;

}

- (id)cutoffDateForMailbox:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[EDUserNotificationMailboxCutoffController _initializeIfNeeded](self, "_initializeIfNeeded");
  objc_msgSend(v4, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[EDUserNotificationMailboxCutoffController mailboxCutoffs](self, "mailboxCutoffs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isMessageAboveMailboxCutoff:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  -[EDUserNotificationMailboxCutoffController _initializeIfNeeded](self, "_initializeIfNeeded");
  objc_msgSend(v4, "mailbox");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[EDUserNotificationMailboxCutoffController mailboxCutoffs](self, "mailboxCutoffs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v4, "dateReceived");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "ef_isLaterThanDate:", v9);

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (void)updateCutoffForMailboxesWithMessages:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  NSObject *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  uint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[EDUserNotificationMailboxCutoffController _initializeIfNeeded](self, "_initializeIfNeeded", v4);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v6)
  {
    v7 = 0;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (-[EDUserNotificationMailboxCutoffController _shouldUpdateCutoffForMessage:](self, "_shouldUpdateCutoffForMessage:", v10))
        {
          objc_msgSend(v10, "mailbox");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "URL");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "absoluteString");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            objc_msgSend(v10, "dateReceived");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = -[EDUserNotificationMailboxCutoffController _updateCutoffForMailbox:date:](self, "_updateCutoffForMailbox:date:", v13, v14);

            v7 |= v15;
          }
          else
          {
            +[EDUserNotificationMailboxCutoffController log](EDUserNotificationMailboxCutoffController, "log");
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v10, "remoteID");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              -[EDUserNotificationMailboxCutoffController updateCutoffForMailboxesWithMessages:].cold.1(v17, buf, &v23, v16);
            }

          }
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v6);

    if ((v7 & 1) != 0)
      -[EDUserNotificationMailboxCutoffController _writeToDefaults](self, "_writeToDefaults");
  }
  else
  {

  }
}

- (void)clearCutoffForMailbox:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[EDUserNotificationMailboxCutoffController _initializeIfNeeded](self, "_initializeIfNeeded");
  objc_msgSend(v9, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[EDUserNotificationMailboxCutoffController mailboxCutoffs](self, "mailboxCutoffs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[EDUserNotificationMailboxCutoffController mailboxCutoffs](self, "mailboxCutoffs");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, v5);

      -[EDUserNotificationMailboxCutoffController _writeToDefaults](self, "_writeToDefaults");
    }
  }

}

- (BOOL)_shouldUpdateCutoffForMessage:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "flags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "read");

  return v4;
}

- (BOOL)_updateCutoffForMailbox:(id)a3 date:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  v6 = a3;
  v7 = a4;
  -[EDUserNotificationMailboxCutoffController mailboxCutoffs](self, "mailboxCutoffs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && !objc_msgSend(v7, "ef_isLaterThanDate:", v9))
  {
    v11 = 0;
  }
  else
  {
    -[EDUserNotificationMailboxCutoffController mailboxCutoffs](self, "mailboxCutoffs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, v6);

    v11 = 1;
  }

  return v11;
}

- (void)_initializeIfNeeded
{
  void *v3;

  -[EDUserNotificationMailboxCutoffController mailboxCutoffs](self, "mailboxCutoffs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[EDUserNotificationMailboxCutoffController _readFromDefaults](self, "_readFromDefaults");
}

- (void)_readFromDefaults
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("UserNotificationMailboxCutoffs"));
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = (void *)v3;
  else
    v4 = (void *)MEMORY[0x1E0C9AA70];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v4);
  -[EDUserNotificationMailboxCutoffController setMailboxCutoffs:](self, "setMailboxCutoffs:", v5);

}

- (void)_writeToDefaults
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EDUserNotificationMailboxCutoffController mailboxCutoffs](self, "mailboxCutoffs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("UserNotificationMailboxCutoffs"));

}

- (NSMutableDictionary)mailboxCutoffs
{
  return self->_mailboxCutoffs;
}

- (void)setMailboxCutoffs:(id)a3
{
  objc_storeStrong((id *)&self->_mailboxCutoffs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailboxCutoffs, 0);
}

- (void)updateCutoffForMailboxesWithMessages:(_QWORD *)a3 .cold.1(void *a1, uint8_t *buf, _QWORD *a3, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *a3 = a1;
  _os_log_error_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_ERROR, "Message %{public}@ has a nil mailbox identifier", buf, 0xCu);

}

@end
