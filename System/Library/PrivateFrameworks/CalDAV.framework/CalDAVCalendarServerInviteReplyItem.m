@implementation CalDAVCalendarServerInviteReplyItem

- (CalDAVCalendarServerInviteReplyItem)init
{
  return -[CoreDAVItem initWithNameSpace:andName:](self, "initWithNameSpace:andName:", *MEMORY[0x24BE1ADC8], CFSTR("invite-reply"));
}

- (void)setFirstNameItem:(id)a3
{
  id v4;

  objc_msgSend(a3, "payloadAsString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CalDAVCalendarServerInviteReplyItem setFirstName:](self, "setFirstName:", v4);

}

- (void)setLastNameItem:(id)a3
{
  id v4;

  objc_msgSend(a3, "payloadAsString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CalDAVCalendarServerInviteReplyItem setLastName:](self, "setLastName:", v4);

}

- (void)setAcceptedURLItem:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "href");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "payloadAsFullURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVCalendarServerInviteReplyItem setAcceptedURL:](self, "setAcceptedURL:", v4);

}

- (id)copyParseRules
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v19 = objc_alloc(MEMORY[0x24BDBCE70]);
  v2 = *MEMORY[0x24BE1AE30];
  v3 = *MEMORY[0x24BE1AE70];
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 1, 1, *MEMORY[0x24BE1AE30], *MEMORY[0x24BE1AE70], objc_opt_class(), sel_setHref_);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v2, v3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BE1ADC8];
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, *MEMORY[0x24BE1ADC8], CFSTR("invite-noresponse"), objc_opt_class(), sel_setInviteStatus_);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v4, CFSTR("invite-noresponse"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, v4, CFSTR("invite-deleted"), objc_opt_class(), sel_setInviteStatus_);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v4, CFSTR("invite-deleted"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, v4, CFSTR("invite-accepted"), objc_opt_class(), sel_setInviteStatus_);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v4, CFSTR("invite-accepted"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, v4, CFSTR("invite-declined"), objc_opt_class(), sel_setInviteStatus_);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v4, CFSTR("invite-declined"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 1, 1, v4, CFSTR("hosturl"), objc_opt_class(), sel_setHostURL_);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v4, CFSTR("hosturl"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 1, 1, v4, CFSTR("in-reply-to"), objc_opt_class(), sel_setInReplyTo_);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v4, CFSTR("in-reply-to"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, v4, CFSTR("summary"), objc_opt_class(), sel_setSummary_);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v4, CFSTR("summary"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, v4, CFSTR("first-name"), objc_opt_class(), sel_setFirstNameItem_);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v4, CFSTR("first-name"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, v4, CFSTR("last-name"), objc_opt_class(), sel_setLastNameItem_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v4, CFSTR("last-name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 1, 1, v4, CFSTR("accepted-sharee-url"), objc_opt_class(), sel_setAcceptedURLItem_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v4, CFSTR("accepted-sharee-url"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "initWithObjectsAndKeys:", v29, v28, v27, v26, v25, v24, v23, v22, v21, v18, v17, v16, v15, v14, v12, v13, v11,
                  v10,
                  v5,
                  v6,
                  v7,
                  v8,
                  0);

  return v20;
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

- (CoreDAVItemWithHrefChildItem)hostURL
{
  return self->_hostURL;
}

- (void)setHostURL:(id)a3
{
  objc_storeStrong((id *)&self->_hostURL, a3);
}

- (CoreDAVLeafItem)inReplyTo
{
  return self->_inReplyTo;
}

- (void)setInReplyTo:(id)a3
{
  objc_storeStrong((id *)&self->_inReplyTo, a3);
}

- (CoreDAVLeafItem)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
  objc_storeStrong((id *)&self->_summary, a3);
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
  objc_storeStrong((id *)&self->_firstName, a3);
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
  objc_storeStrong((id *)&self->_lastName, a3);
}

- (NSURL)acceptedURL
{
  return self->_acceptedURL;
}

- (void)setAcceptedURL:(id)a3
{
  objc_storeStrong((id *)&self->_acceptedURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acceptedURL, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_inReplyTo, 0);
  objc_storeStrong((id *)&self->_hostURL, 0);
  objc_storeStrong((id *)&self->_inviteStatus, 0);
  objc_storeStrong((id *)&self->_href, 0);
}

@end
