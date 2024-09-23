@implementation CalDAVCalendarServerUserItem

- (CalDAVCalendarServerUserItem)init
{
  return -[CoreDAVItem initWithNameSpace:andName:](self, "initWithNameSpace:andName:", *MEMORY[0x24BE1ADC8], CFSTR("user"));
}

- (CalDAVCalendarServerUserItem)initWithHREF:(id)a3 commonName:(id)a4 inviteStatus:(int)a5 access:(int)a6
{
  uint64_t v6;
  id v10;
  id v11;
  CalDAVCalendarServerUserItem *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  CalDAVCalendarServerAccessItem *v21;

  v6 = *(_QWORD *)&a6;
  v10 = a3;
  v11 = a4;
  v12 = -[CalDAVCalendarServerUserItem init](self, "init");
  if (v12)
  {
    v13 = objc_alloc(MEMORY[0x24BE1AB10]);
    v14 = (void *)objc_msgSend(v13, "initWithNameSpace:andName:", *MEMORY[0x24BE1AE30], *MEMORY[0x24BE1AE70]);
    objc_msgSend(v10, "absoluteString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPayloadAsString:", v15);

    -[CalDAVCalendarServerUserItem setHref:](v12, "setHref:", v14);
    v16 = objc_alloc(MEMORY[0x24BE1AB48]);
    v17 = *MEMORY[0x24BE1ADC8];
    v18 = (void *)objc_msgSend(v16, "initWithNameSpace:andName:", *MEMORY[0x24BE1ADC8], CFSTR("common-name"));
    objc_msgSend(v18, "setPayloadAsString:", v11);
    -[CalDAVCalendarServerUserItem setCommonName:](v12, "setCommonName:", v18);
    if ((a5 - 1) > 4)
    {
      v20 = 0;
    }
    else
    {
      v19 = a5 - 1;
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1AB40]), "initWithNameSpace:andName:", v17, *off_24C1FB358[v19]);
    }
    -[CalDAVCalendarServerUserItem setInviteStatus:](v12, "setInviteStatus:", v20);
    v21 = -[CalDAVCalendarServerAccessItem initWithAccess:]([CalDAVCalendarServerAccessItem alloc], "initWithAccess:", v6);
    -[CalDAVCalendarServerUserItem setAccess:](v12, "setAccess:", v21);

  }
  return v12;
}

- (id)description
{
  id v3;
  void *v4;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v27;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v27.receiver = self;
  v27.super_class = (Class)CalDAVCalendarServerUserItem;
  -[CoreDAVItem description](&v27, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("[%@]"), v4);

  -[CalDAVCalendarServerUserItem commonName](self, "commonName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "payloadAsString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Common name: [%@]"), v6);

  -[CalDAVCalendarServerUserItem firstName](self, "firstName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  First Name: [%@]"), v7);

  -[CalDAVCalendarServerUserItem lastName](self, "lastName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Last Name: [%@]"), v8);

  -[CalDAVCalendarServerUserItem acceptedURL](self, "acceptedURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Accepted URL: [%@]"), v9);

  -[CalDAVCalendarServerUserItem href](self, "href");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "payloadAsFullURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Full HREF: [%@]"), v11);

  -[CalDAVCalendarServerUserItem href](self, "href");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "payloadAsOriginalURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Original HREF: [%@]"), v13);

  -[CalDAVCalendarServerUserItem inviteStatus](self, "inviteStatus");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "nameSpace");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVCalendarServerUserItem inviteStatus](self, "inviteStatus");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "name");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Invite status: [%@%@]"), v15, v17);

  -[CalDAVCalendarServerUserItem access](self, "access");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "accessLevel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "nameSpace");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVCalendarServerUserItem access](self, "access");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "accessLevel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "name");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Access level: [%@%@]"), v20, v23);

  -[CalDAVCalendarServerUserItem summary](self, "summary");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "payloadAsString");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Summary: [%@]"), v25);

  return v3;
}

- (void)setFirstNameItem:(id)a3
{
  id v4;

  objc_msgSend(a3, "payloadAsString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CalDAVCalendarServerUserItem setFirstName:](self, "setFirstName:", v4);

}

- (void)setLastNameItem:(id)a3
{
  id v4;

  objc_msgSend(a3, "payloadAsString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CalDAVCalendarServerUserItem setLastName:](self, "setLastName:", v4);

}

- (void)setAcceptedURLItem:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "href");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "payloadAsFullURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVCalendarServerUserItem setAcceptedURL:](self, "setAcceptedURL:", v4);

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
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, *MEMORY[0x24BE1ADC8], CFSTR("first-name"), objc_opt_class(), sel_setFirstNameItem_);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v4, CFSTR("first-name"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, v4, CFSTR("last-name"), objc_opt_class(), sel_setLastNameItem_);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v4, CFSTR("last-name"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, v4, CFSTR("common-name"), objc_opt_class(), sel_setCommonName_);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v4, CFSTR("common-name"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, v4, CFSTR("invite-noresponse"), objc_opt_class(), sel_setInviteStatus_);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v4, CFSTR("invite-noresponse"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, v4, CFSTR("invite-accepted"), objc_opt_class(), sel_setInviteStatus_);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v4, CFSTR("invite-accepted"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, v4, CFSTR("invite-declined"), objc_opt_class(), sel_setInviteStatus_);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v4, CFSTR("invite-declined"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, v4, CFSTR("invite-invalid"), objc_opt_class(), sel_setInviteStatus_);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v4, CFSTR("invite-invalid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 1, 1, v4, CFSTR("access"), objc_opt_class(), sel_setAccess_);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v4, CFSTR("access"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, v4, CFSTR("summary"), objc_opt_class(), sel_setSummary_);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v4, CFSTR("summary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 1, 1, v4, CFSTR("accepted-sharee-url"), objc_opt_class(), sel_setAcceptedURLItem_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v4, CFSTR("accepted-sharee-url"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "initWithObjectsAndKeys:", v29, v28, v27, v26, v25, v24, v23, v22, v21, v18, v17, v16, v15, v14, v13, v5, v12,
                  v11,
                  v10,
                  v6,
                  v7,
                  v8,
                  0);

  return v20;
}

- (int64_t)compare:(id)a3
{
  CalDAVCalendarServerUserItem *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
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
  void *v21;
  void *v22;
  void *v23;

  v4 = (CalDAVCalendarServerUserItem *)a3;
  if (self == v4)
  {
    v9 = 0;
  }
  else
  {
    -[CalDAVCalendarServerUserItem href](self, "href");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "payloadAsString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVCalendarServerUserItem href](v4, "href");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "payloadAsString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "compare:", v8);

    if (!v9)
    {
      -[CalDAVCalendarServerUserItem access](self, "access");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "accessLevel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CalDAVCalendarServerUserItem access](v4, "access");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "accessLevel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v12, "compare:", v15);

      if (!v9)
      {
        -[CalDAVCalendarServerUserItem inviteStatus](self, "inviteStatus");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "name");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[CalDAVCalendarServerUserItem inviteStatus](v4, "inviteStatus");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "name");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v17, "compare:", v19);

        if (!v9)
        {
          -[CalDAVCalendarServerUserItem commonName](self, "commonName");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "payloadAsString");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[CalDAVCalendarServerUserItem commonName](v4, "commonName");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "payloadAsString");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v21, "compare:", v23);

        }
      }
    }
  }

  return v9;
}

- (CoreDAVHrefItem)href
{
  return self->_href;
}

- (void)setHref:(id)a3
{
  objc_storeStrong((id *)&self->_href, a3);
}

- (CoreDAVLeafItem)commonName
{
  return self->_commonName;
}

- (void)setCommonName:(id)a3
{
  objc_storeStrong((id *)&self->_commonName, a3);
}

- (CoreDAVItemWithNoChildren)inviteStatus
{
  return self->_inviteStatus;
}

- (void)setInviteStatus:(id)a3
{
  objc_storeStrong((id *)&self->_inviteStatus, a3);
}

- (CalDAVCalendarServerAccessItem)access
{
  return self->_access;
}

- (void)setAccess:(id)a3
{
  objc_storeStrong((id *)&self->_access, a3);
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
  objc_storeStrong((id *)&self->_access, 0);
  objc_storeStrong((id *)&self->_inviteStatus, 0);
  objc_storeStrong((id *)&self->_commonName, 0);
  objc_storeStrong((id *)&self->_href, 0);
}

@end
