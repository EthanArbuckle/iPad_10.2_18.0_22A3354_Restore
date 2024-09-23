@implementation CalDAVCalendarServerNotificationTypeItem

- (id)copyParseRules
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v11;

  v11 = objc_alloc(MEMORY[0x24BDBCE70]);
  v2 = *MEMORY[0x24BE1ADC8];
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, *MEMORY[0x24BE1ADC8], CFSTR("invite-notification"), objc_opt_class(), sel_setInviteNotification_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v2, CFSTR("invite-notification"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, v2, CFSTR("invite-reply"), objc_opt_class(), sel_setInviteReply_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v2, CFSTR("invite-reply"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, v2, CFSTR("resource-changed"), objc_opt_class(), sel_setResourceChanged_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v2, CFSTR("resource-changed"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v11, "initWithObjectsAndKeys:", v3, v4, v5, v6, v7, v8, 0);

  return v9;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %p: "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR(" isInviteReply %d"), -[CalDAVCalendarServerNotificationTypeItem isInviteReply](self, "isInviteReply"));
  objc_msgSend(v6, "appendFormat:", CFSTR("\n\tisInviteNotification %d"), -[CalDAVCalendarServerNotificationTypeItem isInviteNotification](self, "isInviteNotification"));
  objc_msgSend(v6, "appendFormat:", CFSTR("\n\tisResourceChanged %d"), -[CalDAVCalendarServerNotificationTypeItem isResourceChanged](self, "isResourceChanged"));
  return v6;
}

- (BOOL)isInviteNotification
{
  void *v2;
  BOOL v3;

  -[CalDAVCalendarServerNotificationTypeItem inviteNotification](self, "inviteNotification");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isInviteReply
{
  void *v2;
  BOOL v3;

  -[CalDAVCalendarServerNotificationTypeItem inviteReply](self, "inviteReply");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isResourceChanged
{
  void *v2;
  BOOL v3;

  -[CalDAVCalendarServerNotificationTypeItem resourceChanged](self, "resourceChanged");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)notificationNameMatches:(id)a3
{
  id v4;
  BOOL v5;
  BOOL v6;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("invite-notification")))
  {
    v5 = -[CalDAVCalendarServerNotificationTypeItem isInviteNotification](self, "isInviteNotification");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("invite-reply")))
  {
    v5 = -[CalDAVCalendarServerNotificationTypeItem isInviteReply](self, "isInviteReply");
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("resource-changed")))
    {
      v6 = 0;
      goto LABEL_8;
    }
    v5 = -[CalDAVCalendarServerNotificationTypeItem isResourceChanged](self, "isResourceChanged");
  }
  v6 = v5;
LABEL_8:

  return v6;
}

- (BOOL)notificationNameIn:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (-[CalDAVCalendarServerNotificationTypeItem notificationNameMatches:](self, "notificationNameMatches:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11))
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (CoreDAVItemWithNoChildren)inviteNotification
{
  return self->_inviteNotification;
}

- (void)setInviteNotification:(id)a3
{
  objc_storeStrong((id *)&self->_inviteNotification, a3);
}

- (CoreDAVItemWithNoChildren)inviteReply
{
  return self->_inviteReply;
}

- (void)setInviteReply:(id)a3
{
  objc_storeStrong((id *)&self->_inviteReply, a3);
}

- (CoreDAVItemWithNoChildren)resourceChanged
{
  return self->_resourceChanged;
}

- (void)setResourceChanged:(id)a3
{
  objc_storeStrong((id *)&self->_resourceChanged, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceChanged, 0);
  objc_storeStrong((id *)&self->_inviteReply, 0);
  objc_storeStrong((id *)&self->_inviteNotification, 0);
}

@end
