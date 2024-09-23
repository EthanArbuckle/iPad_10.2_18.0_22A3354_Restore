@implementation FMAlert

- (FMAlert)init
{
  FMAlert *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FMAlert;
  v2 = -[FMAlert init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMAlert setAlertId:](v2, "setAlertId:", v3);

  }
  return v2;
}

- (FMAlert)initWithCoder:(id)a3
{
  id v4;
  FMAlert *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FMAlert;
  v5 = -[FMAlert init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("alertId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMAlert setAlertId:](v5, "setAlertId:", v6);

    -[FMAlert setCategory:](v5, "setCategory:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("category")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("msgTitle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMAlert setMsgTitle:](v5, "setMsgTitle:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("msgText"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMAlert setMsgText:](v5, "setMsgText:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("defaultButtonTitle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMAlert setDefaultButtonTitle:](v5, "setDefaultButtonTitle:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("alternateButtonTitle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMAlert setAlternateButtonTitle:](v5, "setAlternateButtonTitle:", v10);

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timeout"));
    -[FMAlert setTimeout:](v5, "setTimeout:");
    -[FMAlert setShowMsgInLockScreen:](v5, "setShowMsgInLockScreen:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("showMsgInLockScreen")));
    -[FMAlert setDismissMsgOnUnlock:](v5, "setDismissMsgOnUnlock:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("dismissMsgOnUnlock")));
    -[FMAlert setDismissMsgOnLock:](v5, "setDismissMsgOnLock:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("dismissMsgOnLock")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[FMAlert alertId](self, "alertId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v4, CFSTR("alertId"));

  objc_msgSend(v9, "encodeInteger:forKey:", -[FMAlert category](self, "category"), CFSTR("category"));
  -[FMAlert msgTitle](self, "msgTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("msgTitle"));

  -[FMAlert msgText](self, "msgText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("msgText"));

  -[FMAlert defaultButtonTitle](self, "defaultButtonTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("defaultButtonTitle"));

  -[FMAlert alternateButtonTitle](self, "alternateButtonTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("alternateButtonTitle"));

  -[FMAlert timeout](self, "timeout");
  objc_msgSend(v9, "encodeDouble:forKey:", CFSTR("timeout"));
  objc_msgSend(v9, "encodeBool:forKey:", -[FMAlert showMsgInLockScreen](self, "showMsgInLockScreen"), CFSTR("showMsgInLockScreen"));
  objc_msgSend(v9, "encodeBool:forKey:", -[FMAlert dismissMsgOnUnlock](self, "dismissMsgOnUnlock"), CFSTR("dismissMsgOnUnlock"));
  objc_msgSend(v9, "encodeBool:forKey:", -[FMAlert dismissMsgOnLock](self, "dismissMsgOnLock"), CFSTR("dismissMsgOnLock"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  unint64_t v15;
  void *v16;

  v16 = (void *)MEMORY[0x1E0CB3940];
  -[FMAlert alertId](self, "alertId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[FMAlert category](self, "category");
  -[FMAlert msgTitle](self, "msgTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMAlert msgText](self, "msgText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMAlert defaultButtonTitle](self, "defaultButtonTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMAlert alternateButtonTitle](self, "alternateButtonTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMAlert timeout](self, "timeout");
  v9 = v8;
  if (-[FMAlert showMsgInLockScreen](self, "showMsgInLockScreen"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  if (-[FMAlert dismissMsgOnUnlock](self, "dismissMsgOnUnlock"))
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  if (-[FMAlert dismissMsgOnLock](self, "dismissMsgOnLock"))
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  objc_msgSend(v16, "stringWithFormat:", CFSTR("FMAlert(0x%lx) %@,%lu,%@,%@,%@,%@,%f,%@,%@,%@"), self, v3, v15, v4, v5, v6, v7, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSUUID)alertId
{
  return self->_alertId;
}

- (void)setAlertId:(id)a3
{
  objc_storeStrong((id *)&self->_alertId, a3);
}

- (unint64_t)category
{
  return self->_category;
}

- (void)setCategory:(unint64_t)a3
{
  self->_category = a3;
}

- (NSString)msgTitle
{
  return self->_msgTitle;
}

- (void)setMsgTitle:(id)a3
{
  objc_storeStrong((id *)&self->_msgTitle, a3);
}

- (NSString)msgText
{
  return self->_msgText;
}

- (void)setMsgText:(id)a3
{
  objc_storeStrong((id *)&self->_msgText, a3);
}

- (NSString)defaultButtonTitle
{
  return self->_defaultButtonTitle;
}

- (void)setDefaultButtonTitle:(id)a3
{
  objc_storeStrong((id *)&self->_defaultButtonTitle, a3);
}

- (NSString)alternateButtonTitle
{
  return self->_alternateButtonTitle;
}

- (void)setAlternateButtonTitle:(id)a3
{
  objc_storeStrong((id *)&self->_alternateButtonTitle, a3);
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (BOOL)showMsgInLockScreen
{
  return self->_showMsgInLockScreen;
}

- (void)setShowMsgInLockScreen:(BOOL)a3
{
  self->_showMsgInLockScreen = a3;
}

- (BOOL)dismissMsgOnUnlock
{
  return self->_dismissMsgOnUnlock;
}

- (void)setDismissMsgOnUnlock:(BOOL)a3
{
  self->_dismissMsgOnUnlock = a3;
}

- (BOOL)dismissMsgOnLock
{
  return self->_dismissMsgOnLock;
}

- (void)setDismissMsgOnLock:(BOOL)a3
{
  self->_dismissMsgOnLock = a3;
}

- (NSDictionary)additionalSettings
{
  return self->_additionalSettings;
}

- (void)setAdditionalSettings:(id)a3
{
  objc_storeStrong((id *)&self->_additionalSettings, a3);
}

- (id)defaultButtonAction
{
  return self->_defaultButtonAction;
}

- (void)setDefaultButtonAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)alternateButtonAction
{
  return self->_alternateButtonAction;
}

- (void)setAlternateButtonAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_alternateButtonAction, 0);
  objc_storeStrong(&self->_defaultButtonAction, 0);
  objc_storeStrong((id *)&self->_additionalSettings, 0);
  objc_storeStrong((id *)&self->_alternateButtonTitle, 0);
  objc_storeStrong((id *)&self->_defaultButtonTitle, 0);
  objc_storeStrong((id *)&self->_msgText, 0);
  objc_storeStrong((id *)&self->_msgTitle, 0);
  objc_storeStrong((id *)&self->_alertId, 0);
}

@end
