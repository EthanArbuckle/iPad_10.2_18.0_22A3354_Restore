@implementation FAFamilyNotification

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FAFamilyNotification)init
{
  FAFamilyNotification *v2;
  FAFamilyNotification *v3;
  uint64_t v4;
  NSDate *relevanceDate;
  FAFamilyNotification *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FAFamilyNotification;
  v2 = -[FAFamilyNotification init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_hasActionButton = 1;
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v4 = objc_claimAutoreleasedReturnValue();
    relevanceDate = v3->_relevanceDate;
    v3->_relevanceDate = (NSDate *)v4;

    v3->_displayStyle = 0;
    v6 = v3;
  }

  return v3;
}

- (FAFamilyNotification)initWithCoder:(id)a3
{
  id v4;
  FAFamilyNotification *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *title;
  uint64_t v10;
  NSDate *relevanceDate;
  uint64_t v12;
  NSDate *expiryDate;
  uint64_t v14;
  NSString *informativeText;
  uint64_t v16;
  NSNumber *familyMemberDSID;
  uint64_t v18;
  NSURL *activateActionURL;
  uint64_t v20;
  NSURL *dismissActionlURL;
  uint64_t v22;
  NSURL *launchActionURL;
  uint64_t v24;
  NSData *launchActionArguments;
  uint64_t v26;
  NSString *actionButtonLabel;
  uint64_t v28;
  NSString *otherButtonLabel;
  uint64_t v30;
  NSString *unlockActionLabel;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  NSDictionary *userInfo;
  FAFamilyNotification *v42;

  v4 = a3;
  v5 = -[FAFamilyNotification init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_title"));
    v8 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_relevanceDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    relevanceDate = v5->_relevanceDate;
    v5->_relevanceDate = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_expiryDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    expiryDate = v5->_expiryDate;
    v5->_expiryDate = (NSDate *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_informativeText"));
    v14 = objc_claimAutoreleasedReturnValue();
    informativeText = v5->_informativeText;
    v5->_informativeText = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_familyMemberDSID"));
    v16 = objc_claimAutoreleasedReturnValue();
    familyMemberDSID = v5->_familyMemberDSID;
    v5->_familyMemberDSID = (NSNumber *)v16;

    v5->_displayStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_displayStyle"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_activateActionURL"));
    v18 = objc_claimAutoreleasedReturnValue();
    activateActionURL = v5->_activateActionURL;
    v5->_activateActionURL = (NSURL *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_dismissActionlURL"));
    v20 = objc_claimAutoreleasedReturnValue();
    dismissActionlURL = v5->_dismissActionlURL;
    v5->_dismissActionlURL = (NSURL *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_launchActionURL"));
    v22 = objc_claimAutoreleasedReturnValue();
    launchActionURL = v5->_launchActionURL;
    v5->_launchActionURL = (NSURL *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_launchActionArguments"));
    v24 = objc_claimAutoreleasedReturnValue();
    launchActionArguments = v5->_launchActionArguments;
    v5->_launchActionArguments = (NSData *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_actionButtonLabel"));
    v26 = objc_claimAutoreleasedReturnValue();
    actionButtonLabel = v5->_actionButtonLabel;
    v5->_actionButtonLabel = (NSString *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_otherButtonLabel"));
    v28 = objc_claimAutoreleasedReturnValue();
    otherButtonLabel = v5->_otherButtonLabel;
    v5->_otherButtonLabel = (NSString *)v28;

    v5->_shouldPersistWhenDismissed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_shouldPersistWhenDismissed"));
    v5->_shouldPersistWhenActivated = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_shouldPersistWhenActivated"));
    v5->_hasActionButton = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_hasActionButton"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_unlockActionLabel"));
    v30 = objc_claimAutoreleasedReturnValue();
    unlockActionLabel = v5->_unlockActionLabel;
    v5->_unlockActionLabel = (NSString *)v30;

    v32 = (void *)MEMORY[0x24BDBCF20];
    v33 = objc_opt_class();
    v34 = objc_opt_class();
    v35 = objc_opt_class();
    v36 = objc_opt_class();
    v37 = objc_opt_class();
    v38 = objc_opt_class();
    objc_msgSend(v32, "setWithObjects:", v33, v34, v35, v36, v37, v38, objc_opt_class(), 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v39, CFSTR("_userInfo"));
    v40 = objc_claimAutoreleasedReturnValue();
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v40;

    v42 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("_identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("_title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_relevanceDate, CFSTR("_relevanceDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expiryDate, CFSTR("_expiryDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_informativeText, CFSTR("_informativeText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_familyMemberDSID, CFSTR("_familyMemberDSID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_displayStyle, CFSTR("_displayStyle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_activateActionURL, CFSTR("_activateActionURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dismissActionlURL, CFSTR("_dismissActionlURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userInfo, CFSTR("_userInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_launchActionURL, CFSTR("_launchActionURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_launchActionArguments, CFSTR("_launchActionArguments"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_actionButtonLabel, CFSTR("_actionButtonLabel"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_otherButtonLabel, CFSTR("_otherButtonLabel"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldPersistWhenDismissed, CFSTR("_shouldPersistWhenDismissed"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldPersistWhenActivated, CFSTR("_shouldPersistWhenActivated"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasActionButton, CFSTR("_hasActionButton"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_unlockActionLabel, CFSTR("_unlockActionLabel"));

}

- (id)cacheDictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *uuid;
  NSString *identifier;
  NSDate *relevanceDate;
  NSDate *expiryDate;
  NSString *title;
  NSString *informativeText;
  NSNumber *familyMemberDSID;
  void *v12;
  NSURL *activateActionURL;
  void *v14;
  NSURL *dismissActionlURL;
  void *v16;
  NSDictionary *userInfo;
  NSString *clientIdentifier;
  NSString *delegateMachServiceName;
  NSURL *launchActionURL;
  void *v21;
  NSData *launchActionArguments;
  NSString *actionButtonLabel;
  NSString *otherButtonLabel;
  void *v25;
  void *v26;
  void *v27;
  NSString *unlockActionLabel;
  void *v29;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  uuid = self->_uuid;
  if (uuid)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", uuid, CFSTR("_uuid"));
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", identifier, CFSTR("_identifier"));
  relevanceDate = self->_relevanceDate;
  if (relevanceDate)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", relevanceDate, CFSTR("_relevanceDate"));
  expiryDate = self->_expiryDate;
  if (expiryDate)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", expiryDate, CFSTR("_expiryDate"));
  title = self->_title;
  if (title)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", title, CFSTR("_title"));
  informativeText = self->_informativeText;
  if (informativeText)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", informativeText, CFSTR("_informativeText"));
  familyMemberDSID = self->_familyMemberDSID;
  if (familyMemberDSID)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", familyMemberDSID, CFSTR("_familyMemberDSID"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_displayStyle);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("_displayStyle"));

  activateActionURL = self->_activateActionURL;
  if (activateActionURL)
  {
    -[NSURL absoluteString](activateActionURL, "absoluteString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("_activateActionURL"));

  }
  dismissActionlURL = self->_dismissActionlURL;
  if (dismissActionlURL)
  {
    -[NSURL absoluteString](dismissActionlURL, "absoluteString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("_dismissActionlURL"));

  }
  userInfo = self->_userInfo;
  if (userInfo)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", userInfo, CFSTR("_userInfo"));
  clientIdentifier = self->_clientIdentifier;
  if (clientIdentifier)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", clientIdentifier, CFSTR("_clientIdentifier"));
  delegateMachServiceName = self->_delegateMachServiceName;
  if (delegateMachServiceName)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", delegateMachServiceName, CFSTR("_delegateMachServiceName"));
  launchActionURL = self->_launchActionURL;
  if (launchActionURL)
  {
    -[NSURL absoluteString](launchActionURL, "absoluteString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, CFSTR("_launchActionURL"));

  }
  launchActionArguments = self->_launchActionArguments;
  if (launchActionArguments)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", launchActionArguments, CFSTR("_launchActionArguments"));
  actionButtonLabel = self->_actionButtonLabel;
  if (actionButtonLabel)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", actionButtonLabel, CFSTR("_actionButtonLabel"));
  otherButtonLabel = self->_otherButtonLabel;
  if (otherButtonLabel)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", otherButtonLabel, CFSTR("_otherButtonLabel"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_shouldPersistWhenDismissed);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v25, CFSTR("_shouldPersistWhenDismissed"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_shouldPersistWhenActivated);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v26, CFSTR("_shouldPersistWhenActivated"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_hasActionButton);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v27, CFSTR("_hasActionButton"));

  unlockActionLabel = self->_unlockActionLabel;
  if (unlockActionLabel)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", unlockActionLabel, CFSTR("_unlockActionLabel"));
  v29 = (void *)objc_msgSend(v4, "copy");

  return v29;
}

- (FAFamilyNotification)initWithCacheDictionaryRepresentation:(id)a3
{
  id v4;
  FAFamilyNotification *v5;
  uint64_t v6;
  NSString *uuid;
  uint64_t v8;
  NSString *identifier;
  uint64_t v10;
  NSDate *relevanceDate;
  uint64_t v12;
  NSDate *expiryDate;
  uint64_t v14;
  NSString *title;
  uint64_t v16;
  NSString *informativeText;
  uint64_t v18;
  NSNumber *familyMemberDSID;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSURL *activateActionURL;
  void *v25;
  void *v26;
  uint64_t v27;
  NSURL *dismissActionlURL;
  uint64_t v29;
  NSDictionary *userInfo;
  uint64_t v31;
  NSString *clientIdentifier;
  uint64_t v33;
  NSString *delegateMachServiceName;
  void *v35;
  void *v36;
  uint64_t v37;
  NSURL *launchActionURL;
  uint64_t v39;
  NSData *launchActionArguments;
  uint64_t v41;
  NSString *actionButtonLabel;
  uint64_t v43;
  NSString *otherButtonLabel;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  NSString *unlockActionLabel;
  FAFamilyNotification *v50;
  objc_super v52;

  v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)FAFamilyNotification;
  -[FAFamilyNotification self](&v52, sel_self);
  v5 = (FAFamilyNotification *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_uuid"));
    v6 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_identifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_relevanceDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    relevanceDate = v5->_relevanceDate;
    v5->_relevanceDate = (NSDate *)v10;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_expiryDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    expiryDate = v5->_expiryDate;
    v5->_expiryDate = (NSDate *)v12;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_title"));
    v14 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v14;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_informativeText"));
    v16 = objc_claimAutoreleasedReturnValue();
    informativeText = v5->_informativeText;
    v5->_informativeText = (NSString *)v16;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_familyMemberDSID"));
    v18 = objc_claimAutoreleasedReturnValue();
    familyMemberDSID = v5->_familyMemberDSID;
    v5->_familyMemberDSID = (NSNumber *)v18;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_displayStyle"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_displayStyle = objc_msgSend(v20, "integerValue");

    v21 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_activateActionURL"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "URLWithString:", v22);
    v23 = objc_claimAutoreleasedReturnValue();
    activateActionURL = v5->_activateActionURL;
    v5->_activateActionURL = (NSURL *)v23;

    v25 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_dismissActionlURL"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "URLWithString:", v26);
    v27 = objc_claimAutoreleasedReturnValue();
    dismissActionlURL = v5->_dismissActionlURL;
    v5->_dismissActionlURL = (NSURL *)v27;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_userInfo"));
    v29 = objc_claimAutoreleasedReturnValue();
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v29;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_clientIdentifier"));
    v31 = objc_claimAutoreleasedReturnValue();
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v31;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_delegateMachServiceName"));
    v33 = objc_claimAutoreleasedReturnValue();
    delegateMachServiceName = v5->_delegateMachServiceName;
    v5->_delegateMachServiceName = (NSString *)v33;

    v35 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_launchActionURL"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "URLWithString:", v36);
    v37 = objc_claimAutoreleasedReturnValue();
    launchActionURL = v5->_launchActionURL;
    v5->_launchActionURL = (NSURL *)v37;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_launchActionArguments"));
    v39 = objc_claimAutoreleasedReturnValue();
    launchActionArguments = v5->_launchActionArguments;
    v5->_launchActionArguments = (NSData *)v39;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_actionButtonLabel"));
    v41 = objc_claimAutoreleasedReturnValue();
    actionButtonLabel = v5->_actionButtonLabel;
    v5->_actionButtonLabel = (NSString *)v41;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_otherButtonLabel"));
    v43 = objc_claimAutoreleasedReturnValue();
    otherButtonLabel = v5->_otherButtonLabel;
    v5->_otherButtonLabel = (NSString *)v43;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_shouldPersistWhenDismissed"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_shouldPersistWhenDismissed = objc_msgSend(v45, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_shouldPersistWhenActivated"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_shouldPersistWhenActivated = objc_msgSend(v46, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_hasActionButton"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_hasActionButton = objc_msgSend(v47, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_unlockActionLabel"));
    v48 = objc_claimAutoreleasedReturnValue();
    unlockActionLabel = v5->_unlockActionLabel;
    v5->_unlockActionLabel = (NSString *)v48;

    v50 = v5;
  }

  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)FAFamilyNotification;
  -[FAFamilyNotification description](&v13, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length") - 1;
  v5 = (void *)MEMORY[0x24BDD17C8];
  -[FAFamilyNotification title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAFamilyNotification informativeText](self, "informativeText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAFamilyNotification identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAFamilyNotification clientIdentifier](self, "clientIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR(" - title=%@ text=%@ identifier=%@ client=%@ displayStyle=%lu >"), v6, v7, v8, v9, -[FAFamilyNotification displayStyle](self, "displayStyle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingCharactersInRange:withString:", v4, 1, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSString)informativeText
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInformativeText:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSDate)relevanceDate
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRelevanceDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSDate)expiryDate
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setExpiryDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (NSNumber)familyMemberDSID
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setFamilyMemberDSID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (unint64_t)displayStyle
{
  return self->_displayStyle;
}

- (void)setDisplayStyle:(unint64_t)a3
{
  self->_displayStyle = a3;
}

- (BOOL)shouldPersistWhenActivated
{
  return self->_shouldPersistWhenActivated;
}

- (void)setShouldPersistWhenActivated:(BOOL)a3
{
  self->_shouldPersistWhenActivated = a3;
}

- (BOOL)shouldPersistWhenDismissed
{
  return self->_shouldPersistWhenDismissed;
}

- (void)setShouldPersistWhenDismissed:(BOOL)a3
{
  self->_shouldPersistWhenDismissed = a3;
}

- (NSString)actionButtonLabel
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setActionButtonLabel:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (NSString)otherButtonLabel
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setOtherButtonLabel:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (BOOL)hasActionButton
{
  return self->_hasActionButton;
}

- (void)setHasActionButton:(BOOL)a3
{
  self->_hasActionButton = a3;
}

- (NSString)unlockActionLabel
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setUnlockActionLabel:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (NSURL)activateActionURL
{
  return (NSURL *)objc_getProperty(self, a2, 96, 1);
}

- (void)setActivateActionURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (NSURL)dismissActionlURL
{
  return (NSURL *)objc_getProperty(self, a2, 104, 1);
}

- (void)setDismissActionlURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (NSURL)launchActionURL
{
  return (NSURL *)objc_getProperty(self, a2, 112, 1);
}

- (void)setLaunchActionURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (NSData)launchActionArguments
{
  return (NSData *)objc_getProperty(self, a2, 120, 1);
}

- (void)setLaunchActionArguments:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 120);
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 128);
}

- (NSString)uuid
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setUuid:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 136);
}

- (NSString)clientIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setClientIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 144);
}

- (NSString)delegateMachServiceName
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (void)setDelegateMachServiceName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateMachServiceName, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_launchActionArguments, 0);
  objc_storeStrong((id *)&self->_launchActionURL, 0);
  objc_storeStrong((id *)&self->_dismissActionlURL, 0);
  objc_storeStrong((id *)&self->_activateActionURL, 0);
  objc_storeStrong((id *)&self->_unlockActionLabel, 0);
  objc_storeStrong((id *)&self->_otherButtonLabel, 0);
  objc_storeStrong((id *)&self->_actionButtonLabel, 0);
  objc_storeStrong((id *)&self->_familyMemberDSID, 0);
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_relevanceDate, 0);
  objc_storeStrong((id *)&self->_informativeText, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
