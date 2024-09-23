@implementation IXUninstallOptions

- (IXUninstallOptions)init
{
  IXUninstallOptions *v2;
  IXUninstallOptions *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IXUninstallOptions;
  v2 = -[IXUninstallOptions init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[IXUninstallOptions setRequestUserConfirmation:](v2, "setRequestUserConfirmation:", 0);
    -[IXUninstallOptions setWaitForDeletion:](v3, "setWaitForDeletion:", 0);
    -[IXUninstallOptions setShowArchiveOption:](v3, "setShowArchiveOption:", 0);
    -[IXUninstallOptions setShowDemotionOption:](v3, "setShowDemotionOption:", 0);
    -[IXUninstallOptions setSystemAppNotAllowed:](v3, "setSystemAppNotAllowed:", 0);
    -[IXUninstallOptions setIgnoreRemovability:](v3, "setIgnoreRemovability:", 0);
    -[IXUninstallOptions setIgnoreRestrictions:](v3, "setIgnoreRestrictions:", 0);
    -[IXUninstallOptions setIgnoreAppProtection:](v3, "setIgnoreAppProtection:", 0);
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IXUninstallOptions)initWithCoder:(id)a3
{
  id v4;
  IXUninstallOptions *v5;

  v4 = a3;
  v5 = -[IXUninstallOptions init](self, "init");
  if (v5)
  {
    v5->_requestUserConfirmation = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requestUserConfirmation"));
    v5->_waitForDeletion = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("waitForDeletion"));
    v5->_showArchiveOption = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("showArchiveOption"));
    v5->_showDemotionOption = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("showDemotionOption"));
    v5->_systemAppNotAllowed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("systemAppNotAllowed"));
    v5->_ignoreRemovability = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ignoreRemovability"));
    v5->_ignoreRestrictions = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ignoreRestrictions"));
    v5->_ignoreAppProtection = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ignoreAppProtection"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[IXUninstallOptions requestUserConfirmation](self, "requestUserConfirmation"), CFSTR("requestUserConfirmation"));
  objc_msgSend(v4, "encodeBool:forKey:", -[IXUninstallOptions waitForDeletion](self, "waitForDeletion"), CFSTR("waitForDeletion"));
  objc_msgSend(v4, "encodeBool:forKey:", -[IXUninstallOptions showArchiveOption](self, "showArchiveOption"), CFSTR("showArchiveOption"));
  objc_msgSend(v4, "encodeBool:forKey:", -[IXUninstallOptions showDemotionOption](self, "showDemotionOption"), CFSTR("showDemotionOption"));
  objc_msgSend(v4, "encodeBool:forKey:", -[IXUninstallOptions systemAppNotAllowed](self, "systemAppNotAllowed"), CFSTR("systemAppNotAllowed"));
  objc_msgSend(v4, "encodeBool:forKey:", -[IXUninstallOptions ignoreRemovability](self, "ignoreRemovability"), CFSTR("ignoreRemovability"));
  objc_msgSend(v4, "encodeBool:forKey:", -[IXUninstallOptions ignoreRestrictions](self, "ignoreRestrictions"), CFSTR("ignoreRestrictions"));
  objc_msgSend(v4, "encodeBool:forKey:", -[IXUninstallOptions ignoreAppProtection](self, "ignoreAppProtection"), CFSTR("ignoreAppProtection"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setRequestUserConfirmation:", -[IXUninstallOptions requestUserConfirmation](self, "requestUserConfirmation"));
  objc_msgSend(v4, "setWaitForDeletion:", -[IXUninstallOptions waitForDeletion](self, "waitForDeletion"));
  objc_msgSend(v4, "setShowArchiveOption:", -[IXUninstallOptions showArchiveOption](self, "showArchiveOption"));
  objc_msgSend(v4, "setShowDemotionOption:", -[IXUninstallOptions showDemotionOption](self, "showDemotionOption"));
  objc_msgSend(v4, "setSystemAppNotAllowed:", -[IXUninstallOptions systemAppNotAllowed](self, "systemAppNotAllowed"));
  objc_msgSend(v4, "setIgnoreRemovability:", -[IXUninstallOptions ignoreRemovability](self, "ignoreRemovability"));
  objc_msgSend(v4, "setIgnoreRestrictions:", -[IXUninstallOptions ignoreRestrictions](self, "ignoreRestrictions"));
  objc_msgSend(v4, "setIgnoreAppProtection:", -[IXUninstallOptions ignoreAppProtection](self, "ignoreAppProtection"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  IXUninstallOptions *v4;
  IXUninstallOptions *v5;
  _BOOL4 v6;
  NSObject *v7;
  BOOL v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  _BOOL4 v12;
  _BOOL4 v13;
  _BOOL4 v14;
  _BOOL4 v15;
  _BOOL4 v16;
  int v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (IXUninstallOptions *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[IXUninstallOptions requestUserConfirmation](self, "requestUserConfirmation");
      if (v6 != -[IXUninstallOptions requestUserConfirmation](v5, "requestUserConfirmation"))
      {
        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v18 = 136315394;
          v19 = "-[IXUninstallOptions isEqual:]";
          v20 = 2080;
          v21 = "requestUserConfirmation";
LABEL_32:
          _os_log_impl(&dword_1A4BF6000, v7, OS_LOG_TYPE_DEFAULT, "%s: Property %s did not match", (uint8_t *)&v18, 0x16u);
        }
LABEL_33:

        v8 = 0;
LABEL_34:

        goto LABEL_35;
      }
      v9 = -[IXUninstallOptions waitForDeletion](self, "waitForDeletion");
      if (v9 == -[IXUninstallOptions waitForDeletion](v5, "waitForDeletion"))
      {
        v10 = -[IXUninstallOptions showArchiveOption](self, "showArchiveOption");
        if (v10 != -[IXUninstallOptions showArchiveOption](v5, "showArchiveOption"))
        {
          IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            v18 = 136315394;
            v19 = "-[IXUninstallOptions isEqual:]";
            v20 = 2080;
            v21 = "showArchiveOption";
            goto LABEL_32;
          }
          goto LABEL_33;
        }
        v11 = -[IXUninstallOptions showDemotionOption](self, "showDemotionOption");
        if (v11 != -[IXUninstallOptions showDemotionOption](v5, "showDemotionOption"))
        {
          IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            v18 = 136315394;
            v19 = "-[IXUninstallOptions isEqual:]";
            v20 = 2080;
            v21 = "showDemotionOption";
            goto LABEL_32;
          }
          goto LABEL_33;
        }
        v12 = -[IXUninstallOptions waitForDeletion](self, "waitForDeletion");
        if (v12 == -[IXUninstallOptions waitForDeletion](v5, "waitForDeletion"))
        {
          v13 = -[IXUninstallOptions systemAppNotAllowed](self, "systemAppNotAllowed");
          if (v13 == -[IXUninstallOptions systemAppNotAllowed](v5, "systemAppNotAllowed"))
          {
            v14 = -[IXUninstallOptions ignoreRemovability](self, "ignoreRemovability");
            if (v14 == -[IXUninstallOptions ignoreRemovability](v5, "ignoreRemovability"))
            {
              v15 = -[IXUninstallOptions ignoreRestrictions](self, "ignoreRestrictions");
              if (v15 == -[IXUninstallOptions ignoreRestrictions](v5, "ignoreRestrictions"))
              {
                v16 = -[IXUninstallOptions ignoreAppProtection](self, "ignoreAppProtection");
                if (v16 == -[IXUninstallOptions ignoreAppProtection](v5, "ignoreAppProtection"))
                {
                  v8 = 1;
                  goto LABEL_34;
                }
                IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
                v7 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
                {
                  v18 = 136315394;
                  v19 = "-[IXUninstallOptions isEqual:]";
                  v20 = 2080;
                  v21 = "ignoreAppProtection";
                  goto LABEL_32;
                }
              }
              else
              {
                IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
                v7 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
                {
                  v18 = 136315394;
                  v19 = "-[IXUninstallOptions isEqual:]";
                  v20 = 2080;
                  v21 = "ignoreRestrictions";
                  goto LABEL_32;
                }
              }
            }
            else
            {
              IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
              v7 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
              {
                v18 = 136315394;
                v19 = "-[IXUninstallOptions isEqual:]";
                v20 = 2080;
                v21 = "ignoreRemovability";
                goto LABEL_32;
              }
            }
          }
          else
          {
            IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
            v7 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
            {
              v18 = 136315394;
              v19 = "-[IXUninstallOptions isEqual:]";
              v20 = 2080;
              v21 = "systemAppNotAllowed";
              goto LABEL_32;
            }
          }
          goto LABEL_33;
        }
        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v7 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          goto LABEL_33;
      }
      else
      {
        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v7 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          goto LABEL_33;
      }
      v18 = 136315394;
      v19 = "-[IXUninstallOptions isEqual:]";
      v20 = 2080;
      v21 = "waitForDeletion";
      goto LABEL_32;
    }
    v8 = 0;
  }
LABEL_35:

  return v8;
}

- (id)description
{
  _BOOL4 requestUserConfirmation;
  _BOOL4 waitForDeletion;
  _BOOL4 showArchiveOption;
  _BOOL4 showDemotionOption;
  _BOOL4 systemAppNotAllowed;
  _BOOL4 ignoreRemovability;
  _BOOL4 ignoreRestrictions;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  requestUserConfirmation = self->_requestUserConfirmation;
  waitForDeletion = self->_waitForDeletion;
  showArchiveOption = self->_showArchiveOption;
  showDemotionOption = self->_showDemotionOption;
  systemAppNotAllowed = self->_systemAppNotAllowed;
  ignoreRemovability = self->_ignoreRemovability;
  ignoreRestrictions = self->_ignoreRestrictions;
  if (self->_ignoreAppProtection)
    v9 = 89;
  else
    v9 = 78;
  if (ignoreRestrictions)
    v10 = 89;
  else
    v10 = 78;
  if (ignoreRemovability)
    v11 = 89;
  else
    v11 = 78;
  if (systemAppNotAllowed)
    v12 = 89;
  else
    v12 = 78;
  if (showDemotionOption)
    v13 = 89;
  else
    v13 = 78;
  if (showArchiveOption)
    v14 = 89;
  else
    v14 = 78;
  if (waitForDeletion)
    v15 = 89;
  else
    v15 = 78;
  if (requestUserConfirmation)
    v16 = 89;
  else
    v16 = 78;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<confirmation:%c wait:%c archive:%c demote:%c notAllowed:%c ignoreRemovability:%c ignoreRestrictions:%c ignoreAppProtection:%c>"), v16, v15, v14, v13, v12, v11, v10, v9);
}

- (BOOL)requestUserConfirmation
{
  return self->_requestUserConfirmation;
}

- (void)setRequestUserConfirmation:(BOOL)a3
{
  self->_requestUserConfirmation = a3;
}

- (BOOL)waitForDeletion
{
  return self->_waitForDeletion;
}

- (void)setWaitForDeletion:(BOOL)a3
{
  self->_waitForDeletion = a3;
}

- (BOOL)showArchiveOption
{
  return self->_showArchiveOption;
}

- (void)setShowArchiveOption:(BOOL)a3
{
  self->_showArchiveOption = a3;
}

- (BOOL)showDemotionOption
{
  return self->_showDemotionOption;
}

- (void)setShowDemotionOption:(BOOL)a3
{
  self->_showDemotionOption = a3;
}

- (BOOL)systemAppNotAllowed
{
  return self->_systemAppNotAllowed;
}

- (void)setSystemAppNotAllowed:(BOOL)a3
{
  self->_systemAppNotAllowed = a3;
}

- (BOOL)ignoreRemovability
{
  return self->_ignoreRemovability;
}

- (void)setIgnoreRemovability:(BOOL)a3
{
  self->_ignoreRemovability = a3;
}

- (BOOL)ignoreRestrictions
{
  return self->_ignoreRestrictions;
}

- (void)setIgnoreRestrictions:(BOOL)a3
{
  self->_ignoreRestrictions = a3;
}

- (BOOL)ignoreAppProtection
{
  return self->_ignoreAppProtection;
}

- (void)setIgnoreAppProtection:(BOOL)a3
{
  self->_ignoreAppProtection = a3;
}

@end
