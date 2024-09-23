@implementation CalDAVCalendarServerInviteNotificationItem

- (CalDAVCalendarServerInviteNotificationItem)init
{
  return -[CoreDAVItem initWithNameSpace:andName:](self, "initWithNameSpace:andName:", *MEMORY[0x24BE1ADC8], CFSTR("invite-notification"));
}

- (id)initForReplyWithUID:(id)a3 href:(id)a4 hostURL:(id)a5 summary:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  CalDAVCalendarServerInviteNotificationItem *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v26;

  v26 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = *MEMORY[0x24BE1ADC8];
  v14 = -[CoreDAVItem initWithNameSpace:andName:](self, "initWithNameSpace:andName:", *MEMORY[0x24BE1ADC8], CFSTR("invite-notification"));
  if (v14)
  {
    v15 = objc_alloc(MEMORY[0x24BE1AB10]);
    v16 = *MEMORY[0x24BE1AE30];
    v17 = *MEMORY[0x24BE1AE70];
    v18 = (void *)objc_msgSend(v15, "initWithNameSpace:andName:", *MEMORY[0x24BE1AE30], *MEMORY[0x24BE1AE70]);
    objc_msgSend(v10, "absoluteString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setPayloadAsString:", v19);

    -[CalDAVCalendarServerInviteNotificationItem setHref:](v14, "setHref:", v18);
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1AB28]), "initWithNameSpace:andName:", v13, CFSTR("hosturl"));
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1AB10]), "initWithNameSpace:andName:", v16, v17);
    objc_msgSend(v11, "absoluteString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setPayloadAsString:", v22);

    objc_msgSend(v20, "setHref:", v21);
    -[CalDAVCalendarServerInviteNotificationItem setHostURL:](v14, "setHostURL:", v20);
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1AB48]), "initWithNameSpace:andName:", v13, CFSTR("uid"));
    objc_msgSend(v23, "setPayloadAsString:", v26);
    -[CalDAVCalendarServerInviteNotificationItem setUid:](v14, "setUid:", v23);
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1AB48]), "initWithNameSpace:andName:", v13, CFSTR("summary"));
    objc_msgSend(v24, "setPayloadAsString:", v12);
    -[CalDAVCalendarServerInviteNotificationItem setSummary:](v14, "setSummary:", v24);

  }
  return v14;
}

- (id)copyParseRules
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;

  v21 = objc_alloc(MEMORY[0x24BDBCE70]);
  v2 = *MEMORY[0x24BE1ADC8];
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 1, 1, *MEMORY[0x24BE1ADC8], CFSTR("uid"), objc_opt_class(), sel_setUid_);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v2, CFSTR("uid"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x24BE1AE30];
  v4 = *MEMORY[0x24BE1AE70];
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 1, 1, *MEMORY[0x24BE1AE30], *MEMORY[0x24BE1AE70], objc_opt_class(), sel_setHref_);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v3, v4);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, v2, CFSTR("invite-noresponse"), objc_opt_class(), sel_setInviteStatus_);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v2, CFSTR("invite-noresponse"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, v2, CFSTR("invite-deleted"), objc_opt_class(), sel_setInviteStatus_);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v2, CFSTR("invite-deleted"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, v2, CFSTR("invite-accepted"), objc_opt_class(), sel_setInviteStatus_);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v2, CFSTR("invite-accepted"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, v2, CFSTR("invite-declined"), objc_opt_class(), sel_setInviteStatus_);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v2, CFSTR("invite-declined"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BE1ACF8];
  v6 = *MEMORY[0x24BE1AF60];
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, *MEMORY[0x24BE1ACF8], *MEMORY[0x24BE1AF60], objc_opt_class(), sel_setSupportedCalendarComponentSet_);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v5, v6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 1, 1, v2, CFSTR("access"), objc_opt_class(), sel_setAccess_);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v2, CFSTR("access"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 1, 1, v2, CFSTR("hosturl"), objc_opt_class(), sel_setHostURL_);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v2, CFSTR("hosturl"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 1, 1, v2, CFSTR("organizer"), objc_opt_class(), sel_setOrganizer_);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v2, CFSTR("organizer"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 1, 1, v2, CFSTR("summary"), objc_opt_class(), sel_setSummary_);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v2, CFSTR("summary"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, v2, CFSTR("calendar-public"), objc_opt_class(), sel_setCalendarPublic_);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v2, CFSTR("calendar-public"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, v2, CFSTR("calendar-not-public"), objc_opt_class(), sel_setCalendarPublic_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v2, CFSTR("calendar-not-public"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "initWithObjectsAndKeys:", v35, v34, v33, v32, v31, v30, v29, v28, v27, v26, v25, v24, v23, v20, v19, v18, v17,
                  v16,
                  v15,
                  v14,
                  v13,
                  v12,
                  v11,
                  v7,
                  v8,
                  v9,
                  0);

  return v22;
}

- (BOOL)isComponentSupportedForString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  -[CalDAVCalendarServerInviteNotificationItem supportedCalendarComponentSet](self, "supportedCalendarComponentSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CalDAVCalendarServerInviteNotificationItem supportedCalendarComponentSet](self, "supportedCalendarComponentSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "compNames");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", v4);

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (CoreDAVLeafItem)uid
{
  return self->_uid;
}

- (void)setUid:(id)a3
{
  objc_storeStrong((id *)&self->_uid, a3);
}

- (CoreDAVHrefItem)href
{
  return self->_href;
}

- (void)setHref:(id)a3
{
  objc_storeStrong((id *)&self->_href, a3);
}

- (CoreDAVItemWithNoChildren)inviteStatus
{
  return self->_inviteStatus;
}

- (void)setInviteStatus:(id)a3
{
  objc_storeStrong((id *)&self->_inviteStatus, a3);
}

- (CoreDAVItemWithNoChildren)calendarPublic
{
  return self->_calendarPublic;
}

- (void)setCalendarPublic:(id)a3
{
  objc_storeStrong((id *)&self->_calendarPublic, a3);
}

- (CalDAVCalendarServerAccessItem)access
{
  return self->_access;
}

- (void)setAccess:(id)a3
{
  objc_storeStrong((id *)&self->_access, a3);
}

- (CoreDAVItemWithHrefChildItem)hostURL
{
  return self->_hostURL;
}

- (void)setHostURL:(id)a3
{
  objc_storeStrong((id *)&self->_hostURL, a3);
}

- (CalDAVCalendarServerOrganizerItem)organizer
{
  return self->_organizer;
}

- (void)setOrganizer:(id)a3
{
  objc_storeStrong((id *)&self->_organizer, a3);
}

- (CoreDAVLeafItem)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
  objc_storeStrong((id *)&self->_summary, a3);
}

- (CalDAVSupportedCalendarComponentSet)supportedCalendarComponentSet
{
  return self->_supportedCalendarComponentSet;
}

- (void)setSupportedCalendarComponentSet:(id)a3
{
  objc_storeStrong((id *)&self->_supportedCalendarComponentSet, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedCalendarComponentSet, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_organizer, 0);
  objc_storeStrong((id *)&self->_hostURL, 0);
  objc_storeStrong((id *)&self->_access, 0);
  objc_storeStrong((id *)&self->_calendarPublic, 0);
  objc_storeStrong((id *)&self->_inviteStatus, 0);
  objc_storeStrong((id *)&self->_href, 0);
  objc_storeStrong((id *)&self->_uid, 0);
}

@end
