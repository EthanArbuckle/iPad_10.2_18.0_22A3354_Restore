@implementation FLHSA2PasswordResetNotification

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *title;
  id v5;

  title = self->_title;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", title, CFSTR("_title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_informativeText, CFSTR("_informativeText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_approveButtonTitle, CFSTR("_approveButtonTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dismissButtonTitle, CFSTR("_dismissButtonTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appleID, CFSTR("_appleID"));

}

- (FLHSA2PasswordResetNotification)initWithCoder:(id)a3
{
  id v4;
  FLHSA2PasswordResetNotification *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  NSString *informativeText;
  uint64_t v10;
  NSString *approveButtonTitle;
  uint64_t v12;
  NSString *dismissButtonTitle;
  uint64_t v14;
  NSString *appleID;

  v4 = a3;
  v5 = -[FLHSA2PasswordResetNotification init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_informativeText"));
    v8 = objc_claimAutoreleasedReturnValue();
    informativeText = v5->_informativeText;
    v5->_informativeText = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_approveButtonTitle"));
    v10 = objc_claimAutoreleasedReturnValue();
    approveButtonTitle = v5->_approveButtonTitle;
    v5->_approveButtonTitle = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_dismissButtonTitle"));
    v12 = objc_claimAutoreleasedReturnValue();
    dismissButtonTitle = v5->_dismissButtonTitle;
    v5->_dismissButtonTitle = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_appleID"));
    v14 = objc_claimAutoreleasedReturnValue();
    appleID = v5->_appleID;
    v5->_appleID = (NSString *)v14;

  }
  return v5;
}

- (FLHSA2PasswordResetNotification)initWithFollowUpItemUserInfo:(id)a3
{
  id v4;
  FLHSA2PasswordResetNotification *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  NSString *informativeText;
  uint64_t v10;
  NSString *approveButtonTitle;
  uint64_t v12;
  NSString *dismissButtonTitle;
  uint64_t v14;
  NSString *appleID;

  v4 = a3;
  v5 = -[FLHSA2PasswordResetNotification init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("informativeText"));
    v8 = objc_claimAutoreleasedReturnValue();
    informativeText = v5->_informativeText;
    v5->_informativeText = (NSString *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("approveButtonTitle"));
    v10 = objc_claimAutoreleasedReturnValue();
    approveButtonTitle = v5->_approveButtonTitle;
    v5->_approveButtonTitle = (NSString *)v10;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dismissButtonTitle"));
    v12 = objc_claimAutoreleasedReturnValue();
    dismissButtonTitle = v5->_dismissButtonTitle;
    v5->_dismissButtonTitle = (NSString *)v12;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appleID"));
    v14 = objc_claimAutoreleasedReturnValue();
    appleID = v5->_appleID;
    v5->_appleID = (NSString *)v14;

  }
  return v5;
}

- (id)followUpItemUserInfo
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("FLHSA2PasswordResetNotification"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_title, CFSTR("title"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_informativeText, CFSTR("informativeText"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_approveButtonTitle, CFSTR("approveButtonTitle"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_dismissButtonTitle, CFSTR("dismissButtonTitle"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_appleID, CFSTR("appleID"));
  return v3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)informativeText
{
  return self->_informativeText;
}

- (void)setInformativeText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)approveButtonTitle
{
  return self->_approveButtonTitle;
}

- (void)setApproveButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)dismissButtonTitle
{
  return self->_dismissButtonTitle;
}

- (void)setDismissButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)appleID
{
  return self->_appleID;
}

- (void)setAppleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_dismissButtonTitle, 0);
  objc_storeStrong((id *)&self->_approveButtonTitle, 0);
  objc_storeStrong((id *)&self->_informativeText, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
