@implementation DMCAlert

- (NSString)summary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[DMCAlert title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCAlert message](self, "message");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCAlert defaultButtonText](self, "defaultButtonText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCAlert alternateButtonText](self, "alternateButtonText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCAlert otherButtonText](self, "otherButtonText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %@ [%@] [%@] [%@]"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (id)notificationParametersOutFlags:(unint64_t *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], DMCSBUserNotificationDontDismissOnUnlock());
  -[DMCAlert title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[DMCAlert title](self, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0C9B800]);

  }
  -[DMCAlert message](self, "message");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[DMCAlert message](self, "message");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0C9B810]);

  }
  -[DMCAlert defaultButtonText](self, "defaultButtonText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[DMCAlert defaultButtonText](self, "defaultButtonText");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0C9B838]);

  }
  -[DMCAlert alternateButtonText](self, "alternateButtonText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[DMCAlert alternateButtonText](self, "alternateButtonText");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0C9B830]);

  }
  -[DMCAlert otherButtonText](self, "otherButtonText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[DMCAlert otherButtonText](self, "otherButtonText");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0C9B868]);

  }
  if (-[DMCAlert destructive](self, "destructive"))
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E4D41630, CFSTR("SBUserNotificationAlternateButtonPresentationStyle"));
  if (-[DMCAlert displayOnLockScreen](self, "displayOnLockScreen"))
    objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C9B820]);
  if (-[DMCAlert dismissOnLock](self, "dismissOnLock"))
    objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], DMCSBUserNotificationDismissOnLock());
  *a3 = 0;
  -[DMCAlert defaultButtonText](self, "defaultButtonText");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    -[DMCAlert alternateButtonText](self, "alternateButtonText");
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = (void *)v18;
      -[DMCAlert otherButtonText](self, "otherButtonText");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
        *a3 |= 0x20uLL;
    }
    else
    {

    }
  }
  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (NSString)defaultButtonText
{
  return self->_defaultButtonText;
}

- (void)setDefaultButtonText:(id)a3
{
  objc_storeStrong((id *)&self->_defaultButtonText, a3);
}

- (NSString)alternateButtonText
{
  return self->_alternateButtonText;
}

- (void)setAlternateButtonText:(id)a3
{
  objc_storeStrong((id *)&self->_alternateButtonText, a3);
}

- (NSString)otherButtonText
{
  return self->_otherButtonText;
}

- (void)setOtherButtonText:(id)a3
{
  objc_storeStrong((id *)&self->_otherButtonText, a3);
}

- (BOOL)destructive
{
  return self->_destructive;
}

- (void)setDestructive:(BOOL)a3
{
  self->_destructive = a3;
}

- (BOOL)displayOnLockScreen
{
  return self->_displayOnLockScreen;
}

- (void)setDisplayOnLockScreen:(BOOL)a3
{
  self->_displayOnLockScreen = a3;
}

- (BOOL)dismissOnLock
{
  return self->_dismissOnLock;
}

- (void)setDismissOnLock:(BOOL)a3
{
  self->_dismissOnLock = a3;
}

- (double)dismissAfterTimeInterval
{
  return self->_dismissAfterTimeInterval;
}

- (void)setDismissAfterTimeInterval:(double)a3
{
  self->_dismissAfterTimeInterval = a3;
}

- (id)notification
{
  return self->_notification;
}

- (void)setNotification:(id)a3
{
  objc_storeStrong(&self->_notification, a3);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setSummary:(id)a3
{
  objc_storeStrong((id *)&self->_summary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_notification, 0);
  objc_storeStrong((id *)&self->_otherButtonText, 0);
  objc_storeStrong((id *)&self->_alternateButtonText, 0);
  objc_storeStrong((id *)&self->_defaultButtonText, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
