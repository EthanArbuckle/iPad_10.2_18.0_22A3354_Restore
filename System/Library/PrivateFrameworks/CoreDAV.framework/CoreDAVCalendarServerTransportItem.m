@implementation CoreDAVCalendarServerTransportItem

- (CoreDAVCalendarServerTransportItem)init
{
  return -[CoreDAVItem initWithNameSpace:andName:](self, "initWithNameSpace:andName:", CFSTR("http://calendarserver.org/ns/"), CFSTR("transport"));
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
  objc_super v24;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v24.receiver = self;
  v24.super_class = (Class)CoreDAVCalendarServerTransportItem;
  -[CoreDAVItem description](&v24, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("[%@]"), v4);

  -[CoreDAVCalendarServerTransportItem subscriptionURL](self, "subscriptionURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "href");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "payloadAsString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Subscription URL: [%@]"), v7);

  -[CoreDAVCalendarServerTransportItem tokenURL](self, "tokenURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "href");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "payloadAsString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Token URL: [%@]"), v10);

  -[CoreDAVCalendarServerTransportItem apsBundleID](self, "apsBundleID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "payloadAsString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  APS bundle ID: [%@]"), v12);

  -[CoreDAVCalendarServerTransportItem courierServer](self, "courierServer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "payloadAsString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Courier server: [%@]"), v14);

  -[CoreDAVCalendarServerTransportItem apsEnv](self, "apsEnv");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "payloadAsString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  APS Environment: [%@]"), v16);

  -[CoreDAVCalendarServerTransportItem refreshInterval](self, "refreshInterval");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "payloadAsString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Refresh Interval: [%@]"), v18);

  -[CoreDAVCalendarServerTransportItem xmppServer](self, "xmppServer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "payloadAsString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  XMPP server: [%@]"), v20);

  -[CoreDAVCalendarServerTransportItem xmppURI](self, "xmppURI");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "payloadAsString");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  XMPP URI: [%@]"), v22);

  return v3;
}

+ (id)copyParseRules
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  objc_class *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  +[CoreDAVItem parseRuleCache](CoreDAVItem, "parseRuleCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass((Class)a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v21 = objc_alloc(MEMORY[0x24BDBCE70]);
    v22 = (objc_class *)a1;
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("http://calendarserver.org/ns/"), CFSTR("subscription-url"), objc_opt_class(), sel_setSubscriptionURL_);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("http://calendarserver.org/ns/"), CFSTR("subscription-url"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("http://calendarserver.org/ns/"), CFSTR("token-url"), objc_opt_class(), sel_setTokenURL_);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("http://calendarserver.org/ns/"), CFSTR("token-url"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("http://calendarserver.org/ns/"), CFSTR("apsbundleid"), objc_opt_class(), sel_setApsBundleID_);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("http://calendarserver.org/ns/"), CFSTR("apsbundleid"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("http://cal.me.com/_namespace/"), CFSTR("apsbundleid"), objc_opt_class(), sel_setApsBundleID_);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("http://cal.me.com/_namespace/"), CFSTR("apsbundleid"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("http://calendarserver.org/ns/"), CFSTR("courierserver"), objc_opt_class(), sel_setCourierServer_);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("http://calendarserver.org/ns/"), CFSTR("courierserver"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("urn:mobileme:davservices"), CFSTR("env"), objc_opt_class(), sel_setApsEnv_);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("urn:mobileme:davservices"), CFSTR("env"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("http://calendarserver.org/ns/"), CFSTR("refresh-interval"), objc_opt_class(), sel_setRefreshInterval_);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("http://calendarserver.org/ns/"), CFSTR("refresh-interval"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("http://calendarserver.org/ns/"), CFSTR("xmpp-server"), objc_opt_class(), sel_setXmppServer_);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("http://calendarserver.org/ns/"), CFSTR("xmpp-server"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("http://calendarserver.org/ns/"), CFSTR("xmpp-uri"), objc_opt_class(), sel_setXmppURI_);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("http://calendarserver.org/ns/"), CFSTR("xmpp-uri"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v21, "initWithObjectsAndKeys:", v28, v27, v26, v25, v23, v24, v20, v19, v18, v17, v16, v15, v14, v6, v13, v7, v8,
                   v9,
                   0);

    +[CoreDAVItem parseRuleCache](CoreDAVItem, "parseRuleCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(v22);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v5, v11);

  }
  return v5;
}

- (CoreDAVLeafItem)apsBundleID
{
  return self->_apsBundleID;
}

- (void)setApsBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_apsBundleID, a3);
}

- (CoreDAVLeafItem)courierServer
{
  return self->_courierServer;
}

- (void)setCourierServer:(id)a3
{
  objc_storeStrong((id *)&self->_courierServer, a3);
}

- (CoreDAVItemWithHrefChildItem)subscriptionURL
{
  return self->_subscriptionURL;
}

- (void)setSubscriptionURL:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionURL, a3);
}

- (CoreDAVItemWithHrefChildItem)tokenURL
{
  return self->_tokenURL;
}

- (void)setTokenURL:(id)a3
{
  objc_storeStrong((id *)&self->_tokenURL, a3);
}

- (CoreDAVLeafItem)apsEnv
{
  return self->_apsEnv;
}

- (void)setApsEnv:(id)a3
{
  objc_storeStrong((id *)&self->_apsEnv, a3);
}

- (CoreDAVLeafItem)refreshInterval
{
  return self->_refreshInterval;
}

- (void)setRefreshInterval:(id)a3
{
  objc_storeStrong((id *)&self->_refreshInterval, a3);
}

- (CoreDAVLeafItem)xmppServer
{
  return self->_xmppServer;
}

- (void)setXmppServer:(id)a3
{
  objc_storeStrong((id *)&self->_xmppServer, a3);
}

- (CoreDAVLeafItem)xmppURI
{
  return self->_xmppURI;
}

- (void)setXmppURI:(id)a3
{
  objc_storeStrong((id *)&self->_xmppURI, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xmppURI, 0);
  objc_storeStrong((id *)&self->_xmppServer, 0);
  objc_storeStrong((id *)&self->_refreshInterval, 0);
  objc_storeStrong((id *)&self->_apsEnv, 0);
  objc_storeStrong((id *)&self->_tokenURL, 0);
  objc_storeStrong((id *)&self->_subscriptionURL, 0);
  objc_storeStrong((id *)&self->_courierServer, 0);
  objc_storeStrong((id *)&self->_apsBundleID, 0);
}

@end
