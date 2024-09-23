@implementation MCAppLayerVPNPayload

+ (id)typeStrings
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.vpn.managed.applayer");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)localizedSingularForm
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  return MCLocalizedFormat(CFSTR("APP_LAYER_VPN_DESCRIPTION_SINGULAR_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  return MCLocalizedFormat(CFSTR("APP_LAYER_VPN_DESCRIPTION_PLURAL_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCAppLayerVPNPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  MCAppLayerVPNPayload *v10;
  MCAppLayerVPNPayload *v11;
  uint64_t v12;
  id v13;
  NSArray *SafariDomains;
  uint64_t v15;
  NSArray *SMBDomains;
  uint64_t v17;
  NSArray *mailDomains;
  uint64_t v19;
  NSArray *calendarDomains;
  uint64_t v21;
  NSArray *contactsDomains;
  uint64_t v23;
  NSArray *excludedDomains;
  uint64_t v25;
  NSArray *associatedDomains;
  void *v27;
  int v28;
  uint64_t v29;
  void *v30;
  NSString *VPNUUID;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  objc_super v51;
  uint8_t buf[4];
  uint64_t v53;
  __int16 v54;
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v51.receiver = self;
  v51.super_class = (Class)MCAppLayerVPNPayload;
  v10 = -[MCVPNPayloadBase initWithDictionary:profile:outError:](&v51, sel_initWithDictionary_profile_outError_, v8, v9, a5);
  v11 = v10;
  if (!v10)
    goto LABEL_25;
  v10->_restrictDomains = 0;
  v50 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:allowZeroLengthString:outError:", objc_opt_class(), CFSTR("SafariDomains"), 0, objc_msgSend(v9, "isStub"), &v50);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v50;
  SafariDomains = v11->_SafariDomains;
  v11->_SafariDomains = (NSArray *)v12;

  if (v13)
    goto LABEL_16;
  v49 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:allowZeroLengthString:outError:", objc_opt_class(), CFSTR("SMBDomains"), 0, objc_msgSend(v9, "isStub"), &v49);
  v15 = objc_claimAutoreleasedReturnValue();
  v13 = v49;
  SMBDomains = v11->_SMBDomains;
  v11->_SMBDomains = (NSArray *)v15;

  if (v13)
    goto LABEL_16;
  v48 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:allowZeroLengthString:outError:", objc_opt_class(), CFSTR("MailDomains"), 0, objc_msgSend(v9, "isStub"), &v48);
  v17 = objc_claimAutoreleasedReturnValue();
  v13 = v48;
  mailDomains = v11->_mailDomains;
  v11->_mailDomains = (NSArray *)v17;

  if (v13)
    goto LABEL_16;
  v47 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:allowZeroLengthString:outError:", objc_opt_class(), CFSTR("CalendarDomains"), 0, objc_msgSend(v9, "isStub"), &v47);
  v19 = objc_claimAutoreleasedReturnValue();
  v13 = v47;
  calendarDomains = v11->_calendarDomains;
  v11->_calendarDomains = (NSArray *)v19;

  if (v13)
    goto LABEL_16;
  v46 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:allowZeroLengthString:outError:", objc_opt_class(), CFSTR("ContactsDomains"), 0, objc_msgSend(v9, "isStub"), &v46);
  v21 = objc_claimAutoreleasedReturnValue();
  v13 = v46;
  contactsDomains = v11->_contactsDomains;
  v11->_contactsDomains = (NSArray *)v21;

  if (v13)
    goto LABEL_16;
  v45 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:allowZeroLengthString:outError:", objc_opt_class(), CFSTR("ExcludedDomains"), 0, objc_msgSend(v9, "isStub"), &v45);
  v23 = objc_claimAutoreleasedReturnValue();
  v13 = v45;
  excludedDomains = v11->_excludedDomains;
  v11->_excludedDomains = (NSArray *)v23;

  if (v13)
    goto LABEL_16;
  v44 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:allowZeroLengthString:outError:", objc_opt_class(), CFSTR("AssociatedDomains"), 0, objc_msgSend(v9, "isStub"), &v44);
  v25 = objc_claimAutoreleasedReturnValue();
  v13 = v44;
  associatedDomains = v11->_associatedDomains;
  v11->_associatedDomains = (NSArray *)v25;

  if (v13)
    goto LABEL_16;
  if ((objc_msgSend(v9, "isStub") & 1) != 0)
  {
    -[MCVPNPayloadBase vpnType](v11, "vpnType");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("AlwaysOn"));

    if (v28)
    {
      +[MCPayload badFieldTypeErrorWithField:](MCPayload, "badFieldTypeErrorWithField:", CFSTR("VPNType"));
      v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    v42 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("VPNUUID"), 0, &v42);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = v42;
  }
  else
  {
    v43 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("VPNUUID"), 1, &v43);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = v43;
  }
  v13 = v30;
  VPNUUID = v11->_VPNUUID;
  v11->_VPNUUID = (NSString *)v29;

LABEL_15:
  if (v13)
  {
LABEL_16:
    v32 = (void *)objc_msgSend(v13, "MCCopyAsPrimaryError");
    -[MCPayload malformedPayloadErrorWithError:](v11, "malformedPayloadErrorWithError:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (a5)
      *a5 = objc_retainAutorelease(v33);
    v34 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      v35 = v34;
      v36 = objc_opt_class();
      objc_msgSend(v33, "MCVerboseDescription");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v53 = v36;
      v54 = 2114;
      v55 = v37;
      _os_log_impl(&dword_19ECC4000, v35, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);

    }
    v11 = 0;
  }
  if (objc_msgSend(v8, "count"))
  {
    v38 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      v39 = v38;
      -[MCPayload friendlyName](v11, "friendlyName");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v53 = (uint64_t)v40;
      v54 = 2114;
      v55 = v8;
      _os_log_impl(&dword_19ECC4000, v39, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);

    }
  }

LABEL_25:
  return v11;
}

- (id)stubDictionary
{
  void *v3;
  void *v4;
  NSString *VPNUUID;
  NSArray *SafariDomains;
  NSArray *SMBDomains;
  NSArray *mailDomains;
  NSArray *calendarDomains;
  NSArray *contactsDomains;
  NSArray *excludedDomains;
  NSArray *associatedDomains;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MCAppLayerVPNPayload;
  -[MCVPNPayloadBase stubDictionary](&v14, sel_stubDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  VPNUUID = self->_VPNUUID;
  if (VPNUUID)
    objc_msgSend(v3, "setObject:forKey:", VPNUUID, CFSTR("VPNUUID"));
  SafariDomains = self->_SafariDomains;
  if (SafariDomains)
    objc_msgSend(v4, "setObject:forKey:", SafariDomains, CFSTR("SafariDomains"));
  SMBDomains = self->_SMBDomains;
  if (SMBDomains)
    objc_msgSend(v4, "setObject:forKey:", SMBDomains, CFSTR("SMBDomains"));
  mailDomains = self->_mailDomains;
  if (mailDomains)
    objc_msgSend(v4, "setObject:forKey:", mailDomains, CFSTR("MailDomains"));
  calendarDomains = self->_calendarDomains;
  if (calendarDomains)
    objc_msgSend(v4, "setObject:forKey:", calendarDomains, CFSTR("CalendarDomains"));
  contactsDomains = self->_contactsDomains;
  if (contactsDomains)
    objc_msgSend(v4, "setObject:forKey:", contactsDomains, CFSTR("ContactsDomains"));
  excludedDomains = self->_excludedDomains;
  if (excludedDomains)
    objc_msgSend(v4, "setObject:forKey:", excludedDomains, CFSTR("ExcludedDomains"));
  associatedDomains = self->_associatedDomains;
  if (associatedDomains)
    objc_msgSend(v4, "setObject:forKey:", associatedDomains, CFSTR("AssociatedDomains"));
  return v4;
}

- (id)verboseDescription
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
  void *v12;
  void *v13;
  objc_super v15;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v15.receiver = self;
  v15.super_class = (Class)MCAppLayerVPNPayload;
  -[MCVPNPayloadBase verboseDescription](&v15, sel_verboseDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[MCAppLayerVPNPayload VPNUUID](self, "VPNUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("VPNUUID     : %@\n"), v6);

  -[MCAppLayerVPNPayload SafariDomains](self, "SafariDomains");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("Safari Domains: %@\n"), v7);

  -[MCAppLayerVPNPayload SMBDomains](self, "SMBDomains");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("SMB Domains: %@\n"), v8);

  -[MCAppLayerVPNPayload mailDomains](self, "mailDomains");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("Mail Domains: %@\n"), v9);

  -[MCAppLayerVPNPayload calendarDomains](self, "calendarDomains");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("Calendar Domains: %@\n"), v10);

  -[MCAppLayerVPNPayload contactsDomains](self, "contactsDomains");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("Contacts Domains: %@\n"), v11);

  -[MCAppLayerVPNPayload excludedDomains](self, "excludedDomains");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("Excluded Domains: %@\n"), v12);

  -[MCAppLayerVPNPayload associatedDomains](self, "associatedDomains");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("Associated Domains: %@\n"), v13);

  return v5;
}

- (id)payloadDescriptionKeyValueSections
{
  void *v3;
  void *v4;
  void *v5;
  MCKeyValue *v6;
  void *v7;
  void *v8;
  MCKeyValue *v9;
  void *v10;
  MCKeyValue *v11;
  void *v12;
  void *v13;
  MCKeyValue *v14;
  void *v15;
  MCKeyValue *v16;
  void *v17;
  void *v18;
  MCKeyValue *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  objc_super v58;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  -[MCVPNPayloadBase serviceName](self, "serviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = [MCKeyValue alloc];
    -[MCVPNPayloadBase serviceName](self, "serviceName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("KEY_VPN_NAME"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MCKeyValue initWithLocalizedString:localizedKey:](v6, "initWithLocalizedString:localizedKey:", v7, v8);

    objc_msgSend(v4, "addObject:", v9);
  }
  -[MCVPNPayloadBase vpnType](self, "vpnType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = [MCKeyValue alloc];
    -[MCVPNPayloadBase vpnType](self, "vpnType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("KEY_VPN_TYPE"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[MCKeyValue initWithLocalizedString:localizedKey:](v11, "initWithLocalizedString:localizedKey:", v12, v13);

    objc_msgSend(v4, "addObject:", v14);
  }
  -[MCAppLayerVPNPayload VPNUUID](self, "VPNUUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = [MCKeyValue alloc];
    -[MCAppLayerVPNPayload VPNUUID](self, "VPNUUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("APP_LAYER_VPN_VPNUUID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[MCKeyValue initWithLocalizedString:localizedKey:](v16, "initWithLocalizedString:localizedKey:", v17, v18);

    objc_msgSend(v4, "addObject:", v19);
  }
  if (objc_msgSend(v4, "count"))
  {
    +[MCKeyValueSection sectionWithKeyValues:](MCKeyValueSection, "sectionWithKeyValues:", v4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v20);

  }
  -[MCAppLayerVPNPayload SafariDomains](self, "SafariDomains");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  if (v22)
  {
    -[MCAppLayerVPNPayload SafariDomains](self, "SafariDomains");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("APP_LAYER_VPN_SAFARI_DOMAINS"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCKeyValueSection sectionWithLocalizedArray:title:footer:](MCKeyValueSection, "sectionWithLocalizedArray:title:footer:", v23, v24, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v25);
  }
  -[MCAppLayerVPNPayload SMBDomains](self, "SMBDomains");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "count");

  if (v27)
  {
    -[MCAppLayerVPNPayload SMBDomains](self, "SMBDomains");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("APP_LAYER_VPN_SMB_DOMAINS"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCKeyValueSection sectionWithLocalizedArray:title:footer:](MCKeyValueSection, "sectionWithLocalizedArray:title:footer:", v28, v29, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v30);
  }
  -[MCAppLayerVPNPayload mailDomains](self, "mailDomains");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "count");

  if (v32)
  {
    -[MCAppLayerVPNPayload mailDomains](self, "mailDomains");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("APP_LAYER_VPN_MAIL_DOMAINS"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCKeyValueSection sectionWithLocalizedArray:title:footer:](MCKeyValueSection, "sectionWithLocalizedArray:title:footer:", v33, v34, 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v35);
  }
  -[MCAppLayerVPNPayload calendarDomains](self, "calendarDomains");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "count");

  if (v37)
  {
    -[MCAppLayerVPNPayload calendarDomains](self, "calendarDomains");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("APP_LAYER_VPN_CALENDAR_DOMAINS"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCKeyValueSection sectionWithLocalizedArray:title:footer:](MCKeyValueSection, "sectionWithLocalizedArray:title:footer:", v38, v39, 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v40);
  }
  -[MCAppLayerVPNPayload contactsDomains](self, "contactsDomains");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "count");

  if (v42)
  {
    -[MCAppLayerVPNPayload contactsDomains](self, "contactsDomains");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("APP_LAYER_VPN_CONTACTS_DOMAINS"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCKeyValueSection sectionWithLocalizedArray:title:footer:](MCKeyValueSection, "sectionWithLocalizedArray:title:footer:", v43, v44, 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v45);
  }
  -[MCAppLayerVPNPayload associatedDomains](self, "associatedDomains");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "count");

  if (v47)
  {
    -[MCAppLayerVPNPayload associatedDomains](self, "associatedDomains");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("APP_LAYER_VPN_ASSOCIATED_DOMAINS"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCKeyValueSection sectionWithLocalizedArray:title:footer:](MCKeyValueSection, "sectionWithLocalizedArray:title:footer:", v48, v49, 0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v50);
  }
  -[MCAppLayerVPNPayload excludedDomains](self, "excludedDomains");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v51, "count");

  if (v52)
  {
    -[MCAppLayerVPNPayload excludedDomains](self, "excludedDomains");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("APP_LAYER_VPN_EXCLUDED_DOMAINS"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCKeyValueSection sectionWithLocalizedArray:title:footer:](MCKeyValueSection, "sectionWithLocalizedArray:title:footer:", v53, v54, 0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v55);
  }
  v58.receiver = self;
  v58.super_class = (Class)MCAppLayerVPNPayload;
  -[MCVPNPayloadBase payloadDescriptionKeyValueSections](&v58, sel_payloadDescriptionKeyValueSections);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v56);

  if (!objc_msgSend(v3, "count"))
  {

    v3 = 0;
  }

  return v3;
}

- (id)filterForUserEnrollmentOutError:(id *)a3
{
  self->_restrictDomains = 1;
  return 0;
}

- (NSString)VPNUUID
{
  return self->_VPNUUID;
}

- (void)setVPNUUID:(id)a3
{
  objc_storeStrong((id *)&self->_VPNUUID, a3);
}

- (NSArray)SafariDomains
{
  return self->_SafariDomains;
}

- (void)setSafariDomains:(id)a3
{
  objc_storeStrong((id *)&self->_SafariDomains, a3);
}

- (NSArray)SMBDomains
{
  return self->_SMBDomains;
}

- (void)setSMBDomains:(id)a3
{
  objc_storeStrong((id *)&self->_SMBDomains, a3);
}

- (NSArray)mailDomains
{
  return self->_mailDomains;
}

- (void)setMailDomains:(id)a3
{
  objc_storeStrong((id *)&self->_mailDomains, a3);
}

- (NSArray)calendarDomains
{
  return self->_calendarDomains;
}

- (void)setCalendarDomains:(id)a3
{
  objc_storeStrong((id *)&self->_calendarDomains, a3);
}

- (NSArray)contactsDomains
{
  return self->_contactsDomains;
}

- (void)setContactsDomains:(id)a3
{
  objc_storeStrong((id *)&self->_contactsDomains, a3);
}

- (NSArray)excludedDomains
{
  return self->_excludedDomains;
}

- (void)setExcludedDomains:(id)a3
{
  objc_storeStrong((id *)&self->_excludedDomains, a3);
}

- (NSArray)associatedDomains
{
  return self->_associatedDomains;
}

- (void)setAssociatedDomains:(id)a3
{
  objc_storeStrong((id *)&self->_associatedDomains, a3);
}

- (BOOL)restrictDomains
{
  return self->_restrictDomains;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedDomains, 0);
  objc_storeStrong((id *)&self->_excludedDomains, 0);
  objc_storeStrong((id *)&self->_contactsDomains, 0);
  objc_storeStrong((id *)&self->_calendarDomains, 0);
  objc_storeStrong((id *)&self->_mailDomains, 0);
  objc_storeStrong((id *)&self->_SMBDomains, 0);
  objc_storeStrong((id *)&self->_SafariDomains, 0);
  objc_storeStrong((id *)&self->_VPNUUID, 0);
}

@end
