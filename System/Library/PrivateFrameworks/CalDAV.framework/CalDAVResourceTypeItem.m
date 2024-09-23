@implementation CalDAVResourceTypeItem

- (id)copyParseRules
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v27;
  void *v28;
  objc_super v29;

  v24 = objc_alloc(MEMORY[0x24BDBCED8]);
  v2 = *MEMORY[0x24BE1ACF8];
  v3 = *MEMORY[0x24BE1AD08];
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, *MEMORY[0x24BE1ACF8], *MEMORY[0x24BE1AD08], objc_opt_class(), sel_setCalendar_);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v2, v3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BE1AF40];
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, v2, *MEMORY[0x24BE1AF40], objc_opt_class(), sel_setScheduleInbox_);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v2, v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BE1AF48];
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, v2, *MEMORY[0x24BE1AF48], objc_opt_class(), sel_setScheduleOutbox_);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v2, v5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BE1ADC8];
  v7 = *MEMORY[0x24BE1AE78];
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, *MEMORY[0x24BE1ADC8], *MEMORY[0x24BE1AE78], objc_opt_class(), sel_setIsFamilyCalendar_);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v6, v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BE1AEE8];
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, v6, *MEMORY[0x24BE1AEE8], objc_opt_class(), sel_setNotification_);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v6, v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BE1AF58];
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, v6, *MEMORY[0x24BE1AF58], objc_opt_class(), sel_setSubscribed_);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v6, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, v6, CFSTR("shared-owner"), objc_opt_class(), sel_setSharedOwner_);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v6, CFSTR("shared-owner"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v24, "initWithObjectsAndKeys:", v28, v27, v23, v22, v21, v20, v19, v18, v17, v16, v10, v11, v12, v13, 0);

  v29.receiver = self;
  v29.super_class = (Class)CalDAVResourceTypeItem;
  v14 = -[CoreDAVItem copyParseRules](&v29, sel_copyParseRules);
  objc_msgSend(v25, "addEntriesFromDictionary:", v14);

  return v25;
}

- (void)write:(id)a3
{
  id v4;
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
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CoreDAVItem name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVItem nameSpace](self, "nameSpace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startElement:inNamespace:withAttributeNamesAndValues:", v5, v6, 0);

  -[CalDAVResourceTypeItem calendar](self, "calendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[CalDAVResourceTypeItem calendar](self, "calendar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "write:", v4);

  }
  -[CalDAVResourceTypeItem scheduleInbox](self, "scheduleInbox");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[CalDAVResourceTypeItem scheduleInbox](self, "scheduleInbox");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "write:", v4);

  }
  -[CalDAVResourceTypeItem scheduleOutbox](self, "scheduleOutbox");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[CalDAVResourceTypeItem scheduleOutbox](self, "scheduleOutbox");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "write:", v4);

  }
  -[CalDAVResourceTypeItem notification](self, "notification");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[CalDAVResourceTypeItem notification](self, "notification");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "write:", v4);

  }
  -[CalDAVResourceTypeItem subscribed](self, "subscribed");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[CalDAVResourceTypeItem subscribed](self, "subscribed");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "write:", v4);

  }
  -[CalDAVResourceTypeItem sharedOwner](self, "sharedOwner");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[CalDAVResourceTypeItem sharedOwner](self, "sharedOwner");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "write:", v4);

  }
  -[CoreDAVResourceTypeItem shared](self, "shared");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[CoreDAVResourceTypeItem shared](self, "shared");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "write:", v4);

  }
  -[CoreDAVResourceTypeItem addressBook](self, "addressBook");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[CoreDAVResourceTypeItem addressBook](self, "addressBook");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "write:", v4);

  }
  -[CoreDAVResourceTypeItem searchAddressBook](self, "searchAddressBook");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[CoreDAVResourceTypeItem searchAddressBook](self, "searchAddressBook");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "write:", v4);

  }
  -[CoreDAVResourceTypeItem principal](self, "principal");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[CoreDAVResourceTypeItem principal](self, "principal");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "write:", v4);

  }
  -[CoreDAVResourceTypeItem collection](self, "collection");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    -[CoreDAVResourceTypeItem collection](self, "collection");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "write:", v4);

  }
  -[CoreDAVResourceTypeItem unauthenticated](self, "unauthenticated");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    -[CoreDAVResourceTypeItem unauthenticated](self, "unauthenticated");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "write:", v4);

  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[CoreDAVItem extraChildItems](self, "extraChildItems", 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v39;
    do
    {
      v35 = 0;
      do
      {
        if (*(_QWORD *)v39 != v34)
          objc_enumerationMutation(v31);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v35++), "write:", v4);
      }
      while (v33 != v35);
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v33);
  }

  -[CoreDAVItem name](self, "name");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVItem nameSpace](self, "nameSpace");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endElement:inNamespace:", v36, v37);

}

- (CoreDAVItemWithNoChildren)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_calendar, a3);
}

- (CoreDAVItemWithNoChildren)scheduleInbox
{
  return self->_scheduleInbox;
}

- (void)setScheduleInbox:(id)a3
{
  objc_storeStrong((id *)&self->_scheduleInbox, a3);
}

- (CoreDAVItemWithNoChildren)scheduleOutbox
{
  return self->_scheduleOutbox;
}

- (void)setScheduleOutbox:(id)a3
{
  objc_storeStrong((id *)&self->_scheduleOutbox, a3);
}

- (CoreDAVItemWithNoChildren)notification
{
  return self->_notification;
}

- (void)setNotification:(id)a3
{
  objc_storeStrong((id *)&self->_notification, a3);
}

- (CoreDAVItemWithNoChildren)subscribed
{
  return self->_subscribed;
}

- (void)setSubscribed:(id)a3
{
  objc_storeStrong((id *)&self->_subscribed, a3);
}

- (CoreDAVItemWithNoChildren)sharedOwner
{
  return self->_sharedOwner;
}

- (void)setSharedOwner:(id)a3
{
  objc_storeStrong((id *)&self->_sharedOwner, a3);
}

- (CoreDAVItemWithNoChildren)isFamilyCalendar
{
  return self->_isFamilyCalendar;
}

- (void)setIsFamilyCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_isFamilyCalendar, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isFamilyCalendar, 0);
  objc_storeStrong((id *)&self->_sharedOwner, 0);
  objc_storeStrong((id *)&self->_subscribed, 0);
  objc_storeStrong((id *)&self->_notification, 0);
  objc_storeStrong((id *)&self->_scheduleOutbox, 0);
  objc_storeStrong((id *)&self->_scheduleInbox, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
}

@end
