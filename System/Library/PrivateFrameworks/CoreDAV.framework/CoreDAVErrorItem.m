@implementation CoreDAVErrorItem

- (CoreDAVErrorItem)init
{
  return -[CoreDAVItem initWithNameSpace:andName:](self, "initWithNameSpace:andName:", CFSTR("DAV:"), CFSTR("error"));
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
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  objc_super v44;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v44.receiver = self;
  v44.super_class = (Class)CoreDAVErrorItem;
  -[CoreDAVItem description](&v44, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("[%@]"), v4);

  -[CoreDAVErrorItem status](self, "status");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CoreDAVErrorItem status](self, "status");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "payloadAsString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n  Status: [%@]"), v7);

  }
  -[CoreDAVErrorItem numberOfMatchesWithinLimits](self, "numberOfMatchesWithinLimits");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CoreDAVErrorItem numberOfMatchesWithinLimits](self, "numberOfMatchesWithinLimits");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n  Number of matches within limits: [%@]"), v9);

  }
  -[CoreDAVErrorItem validSyncToken](self, "validSyncToken");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[CoreDAVErrorItem validSyncToken](self, "validSyncToken");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n  Valid sync token: [%@]"), v11);

  }
  -[CoreDAVErrorItem noUIDConflict](self, "noUIDConflict");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[CoreDAVErrorItem noUIDConflict](self, "noUIDConflict");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n  No UID conflict: [%@]"), v13);

  }
  -[CoreDAVErrorItem validAddressData](self, "validAddressData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[CoreDAVErrorItem validAddressData](self, "validAddressData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n  Valid Address Data: [%@]"), v15);

  }
  -[CoreDAVErrorItem maxResourceSize](self, "maxResourceSize");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[CoreDAVErrorItem maxResourceSize](self, "maxResourceSize");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n  Max resource size: [%@]"), v17);

  }
  -[CoreDAVErrorItem ctagOkay](self, "ctagOkay");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[CoreDAVErrorItem ctagOkay](self, "ctagOkay");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n  ctag okay: [%@]"), v19);

  }
  -[CoreDAVErrorItem uid](self, "uid");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[CoreDAVErrorItem uid](self, "uid");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "payloadAsString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n  uid: [%@]"), v22);

  }
  -[CoreDAVErrorItem maxImageSize](self, "maxImageSize");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[CoreDAVErrorItem maxImageSize](self, "maxImageSize");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "payloadAsString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n  Max Image Size: [%@]"), v25);

  }
  -[CoreDAVErrorItem invalidImageType](self, "invalidImageType");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[CoreDAVErrorItem invalidImageType](self, "invalidImageType");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "payloadAsString");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n  Invalid Image Type: [%@]"), v28);

  }
  -[CoreDAVErrorItem imageError](self, "imageError");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    -[CoreDAVErrorItem imageError](self, "imageError");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "payloadAsString");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n  Image Error: [%@]"), v31);

  }
  -[CoreDAVErrorItem maxAttendees](self, "maxAttendees");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[CoreDAVErrorItem maxAttendees](self, "maxAttendees");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "payloadAsString");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n  Max Attendees Per Instance: [%@]"), v34);

  }
  -[CoreDAVErrorItem quotaExceeded](self, "quotaExceeded");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    -[CoreDAVErrorItem quotaExceeded](self, "quotaExceeded");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "payloadAsString");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n  Quota Exceeded: [%@]"), v37);

  }
  -[CoreDAVErrorItem maxResources](self, "maxResources");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    -[CoreDAVErrorItem maxResources](self, "maxResources");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "payloadAsString");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n  Max Resources Exceeded: [%@]"), v40);

  }
  -[CoreDAVErrorItem guardianRestricted](self, "guardianRestricted");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    -[CoreDAVErrorItem guardianRestricted](self, "guardianRestricted");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n  Container is guardian restricted: [%@]"), v42);

  }
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
  id v22;
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
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;

  +[CoreDAVItem parseRuleCache](CoreDAVItem, "parseRuleCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass((Class)a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v22 = objc_alloc(MEMORY[0x24BDBCE70]);
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("DAV:"), CFSTR("number-of-matches-within-limits"), objc_opt_class(), sel_setNumberOfMatchesWithinLimits_);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("DAV:"), CFSTR("number-of-matches-within-limits"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("DAV:"), CFSTR("valid-sync-token"), objc_opt_class(), sel_setValidSyncToken_);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("DAV:"), CFSTR("valid-sync-token"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("urn:ietf:params:xml:ns:carddav"), CFSTR("no-uid-conflict"), objc_opt_class());
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("urn:ietf:params:xml:ns:carddav"), CFSTR("no-uid-conflict"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("urn:ietf:params:xml:ns:carddav"), CFSTR("valid-address-data"), objc_opt_class(), sel_setValidAddressData_);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("urn:ietf:params:xml:ns:carddav"), CFSTR("valid-address-data"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("urn:ietf:params:xml:ns:carddav"), CFSTR("max-resource-size"), objc_opt_class(), sel_setMaxResourceSize_);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("urn:ietf:params:xml:ns:carddav"), CFSTR("max-resource-size"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("http://calendarserver.org/ns/"), CFSTR("uid"), objc_opt_class(), sel_setUid_);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("http://calendarserver.org/ns/"), CFSTR("uid"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("http://me.com/_namespace/"), CFSTR("ctag-ok"), objc_opt_class(), sel_setCtagOkay_);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("http://me.com/_namespace/"), CFSTR("ctag-ok"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("http://me.com/_namespace/"), CFSTR("max-image-size"), objc_opt_class(), sel_setMaxImageSize_);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("http://me.com/_namespace/"), CFSTR("max-image-size"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("http://me.com/_namespace/"), CFSTR("invalid-image-type"), objc_opt_class(), sel_setInvalidImageType_);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("http://me.com/_namespace/"), CFSTR("invalid-image-type"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("http://me.com/_namespace/"), CFSTR("image-error"), objc_opt_class(), sel_setImageError_);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("http://me.com/_namespace/"), CFSTR("image-error"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("urn:ietf:params:xml:ns:caldav"), CFSTR("max-attendees-per-instance"), objc_opt_class(), sel_setMaxAttendees_);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("urn:ietf:params:xml:ns:caldav"), CFSTR("max-attendees-per-instance"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("DAV:"), CFSTR("quota-not-exceeded"), objc_opt_class(), sel_setQuotaExceeded_);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("DAV:"), CFSTR("quota-not-exceeded"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("http://calendarserver.org/ns/"), CFSTR("max-resources"), objc_opt_class(), sel_setMaxResources_);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("http://calendarserver.org/ns/"), CFSTR("max-resources"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("urn:ietf:params:xml:ns:caldav"), CFSTR("no-uid-conflict"), objc_opt_class(), sel_setNoUIDConflict_);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("urn:ietf:params:xml:ns:caldav"), CFSTR("no-uid-conflict"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("urn:ietf:params:xml:ns:caldav"), CFSTR("valid-timezone"), objc_opt_class(), sel_setValidTimezone_);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("urn:ietf:params:xml:ns:caldav"), CFSTR("valid-timezone"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("http://calendarserver.org/ns/"), CFSTR("valid-split"), objc_opt_class(), sel_setValidSplit_);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("http://calendarserver.org/ns/"), CFSTR("valid-split"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("http://calendarserver.org/ns/"), CFSTR("invalid-split"), objc_opt_class(), sel_setValidSplit_);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("http://calendarserver.org/ns/"), CFSTR("invalid-split"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("http://me.com/_namespace/"), CFSTR("guardian-restricted"), objc_opt_class(), sel_setGuardianRestricted_);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("http://me.com/_namespace/"), CFSTR("guardian-restricted"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v22, "initWithObjectsAndKeys:", v45, v44, v43, v42, v41, v40, v39, v38, v37, v36, v35, v34, v33, v32, v31, v30, v29,
                   v28,
                   v27,
                   v26,
                   v25,
                   v24,
                   v20,
                   v19,
                   v18,
                   v17,
                   v16,
                   v21,
                   v15,
                   v23,
                   v14,
                   v13,
                   v12,
                   v11,
                   v6,
                   v7,
                   0);

    +[CoreDAVItem parseRuleCache](CoreDAVItem, "parseRuleCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass((Class)a1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v5, v9);

  }
  return v5;
}

- (CoreDAVItemWithNoChildren)numberOfMatchesWithinLimits
{
  return self->_numberOfMatchesWithinLimits;
}

- (void)setNumberOfMatchesWithinLimits:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfMatchesWithinLimits, a3);
}

- (CoreDAVItemWithNoChildren)validSyncToken
{
  return self->_validSyncToken;
}

- (void)setValidSyncToken:(id)a3
{
  objc_storeStrong((id *)&self->_validSyncToken, a3);
}

- (CoreDAVItemWithNoChildren)noUIDConflict
{
  return self->_noUIDConflict;
}

- (void)setNoUIDConflict:(id)a3
{
  objc_storeStrong((id *)&self->_noUIDConflict, a3);
}

- (CoreDAVItemWithNoChildren)validAddressData
{
  return self->_validAddressData;
}

- (void)setValidAddressData:(id)a3
{
  objc_storeStrong((id *)&self->_validAddressData, a3);
}

- (CoreDAVItemWithNoChildren)maxResourceSize
{
  return self->_maxResourceSize;
}

- (void)setMaxResourceSize:(id)a3
{
  objc_storeStrong((id *)&self->_maxResourceSize, a3);
}

- (CoreDAVItemWithNoChildren)uid
{
  return self->_uid;
}

- (void)setUid:(id)a3
{
  objc_storeStrong((id *)&self->_uid, a3);
}

- (CoreDAVItemWithNoChildren)ctagOkay
{
  return self->_ctagOkay;
}

- (void)setCtagOkay:(id)a3
{
  objc_storeStrong((id *)&self->_ctagOkay, a3);
}

- (CoreDAVItemWithNoChildren)maxImageSize
{
  return self->_maxImageSize;
}

- (void)setMaxImageSize:(id)a3
{
  objc_storeStrong((id *)&self->_maxImageSize, a3);
}

- (CoreDAVItemWithNoChildren)invalidImageType
{
  return self->_invalidImageType;
}

- (void)setInvalidImageType:(id)a3
{
  objc_storeStrong((id *)&self->_invalidImageType, a3);
}

- (CoreDAVItemWithNoChildren)imageError
{
  return self->_imageError;
}

- (void)setImageError:(id)a3
{
  objc_storeStrong((id *)&self->_imageError, a3);
}

- (CoreDAVItemWithNoChildren)maxAttendees
{
  return self->_maxAttendees;
}

- (void)setMaxAttendees:(id)a3
{
  objc_storeStrong((id *)&self->_maxAttendees, a3);
}

- (CoreDAVItemWithNoChildren)quotaExceeded
{
  return self->_quotaExceeded;
}

- (void)setQuotaExceeded:(id)a3
{
  objc_storeStrong((id *)&self->_quotaExceeded, a3);
}

- (CoreDAVItemWithNoChildren)maxResources
{
  return self->_maxResources;
}

- (void)setMaxResources:(id)a3
{
  objc_storeStrong((id *)&self->_maxResources, a3);
}

- (CoreDAVItemWithNoChildren)validTimezone
{
  return self->_validTimezone;
}

- (void)setValidTimezone:(id)a3
{
  objc_storeStrong((id *)&self->_validTimezone, a3);
}

- (CoreDAVItemWithNoChildren)validSplit
{
  return self->_validSplit;
}

- (void)setValidSplit:(id)a3
{
  objc_storeStrong((id *)&self->_validSplit, a3);
}

- (CoreDAVItemWithNoChildren)guardianRestricted
{
  return self->_guardianRestricted;
}

- (void)setGuardianRestricted:(id)a3
{
  objc_storeStrong((id *)&self->_guardianRestricted, a3);
}

- (CoreDAVLeafItem)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
  objc_storeStrong((id *)&self->_status, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_validSplit, 0);
  objc_storeStrong((id *)&self->_validTimezone, 0);
  objc_storeStrong((id *)&self->_maxResources, 0);
  objc_storeStrong((id *)&self->_quotaExceeded, 0);
  objc_storeStrong((id *)&self->_maxAttendees, 0);
  objc_storeStrong((id *)&self->_guardianRestricted, 0);
  objc_storeStrong((id *)&self->_imageError, 0);
  objc_storeStrong((id *)&self->_invalidImageType, 0);
  objc_storeStrong((id *)&self->_maxImageSize, 0);
  objc_storeStrong((id *)&self->_ctagOkay, 0);
  objc_storeStrong((id *)&self->_uid, 0);
  objc_storeStrong((id *)&self->_maxResourceSize, 0);
  objc_storeStrong((id *)&self->_validAddressData, 0);
  objc_storeStrong((id *)&self->_noUIDConflict, 0);
  objc_storeStrong((id *)&self->_validSyncToken, 0);
  objc_storeStrong((id *)&self->_numberOfMatchesWithinLimits, 0);
}

@end
