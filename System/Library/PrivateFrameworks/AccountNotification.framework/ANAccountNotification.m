@implementation ANAccountNotification

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)initForAccountWithType:(id)a3
{
  id v4;
  ANAccountNotification *v5;
  uint64_t v6;
  NSString *accountTypeID;
  void *v8;
  uint64_t v9;
  NSString *identifier;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ANAccountNotification;
  v5 = -[ANAccountNotification init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "identifier");
    v6 = objc_claimAutoreleasedReturnValue();
    accountTypeID = v5->_accountTypeID;
    v5->_accountTypeID = (NSString *)v6;

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v9;

  }
  return v5;
}

- (ANAccountNotification)initWithManagedObject:(id)a3
{
  id v4;
  ANAccountNotification *v5;
  uint64_t v6;
  NSString *accountTypeID;
  uint64_t v8;
  NSString *identifier;
  uint64_t v10;
  NSString *callbackMachService;
  uint64_t v12;
  NSString *title;
  uint64_t v14;
  NSString *message;
  uint64_t v16;
  NSDate *date;
  uint64_t v18;
  NSDictionary *userInfo;
  uint64_t v20;
  NSString *eventIdentifier;
  void *v22;
  ANNotificationAction *v23;
  void *v24;
  uint64_t v25;
  ANNotificationAction *activateAction;
  void *v27;
  ANNotificationAction *v28;
  void *v29;
  uint64_t v30;
  ANNotificationAction *dismissAction;
  ANAccountNotification *v32;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)ANAccountNotification;
  v5 = -[ANAccountNotification init](&v34, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "accountTypeID");
    v6 = objc_claimAutoreleasedReturnValue();
    accountTypeID = v5->_accountTypeID;
    v5->_accountTypeID = (NSString *)v6;

    objc_msgSend(v4, "identifier");
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v8;

    objc_msgSend(v4, "callbackMachServiceName");
    v10 = objc_claimAutoreleasedReturnValue();
    callbackMachService = v5->_callbackMachService;
    v5->_callbackMachService = (NSString *)v10;

    objc_msgSend(v4, "title");
    v12 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v12;

    objc_msgSend(v4, "message");
    v14 = objc_claimAutoreleasedReturnValue();
    message = v5->_message;
    v5->_message = (NSString *)v14;

    objc_msgSend(v4, "date");
    v16 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v16;

    objc_msgSend(v4, "userInfo");
    v18 = objc_claimAutoreleasedReturnValue();
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v18;

    objc_msgSend(v4, "eventID");
    v20 = objc_claimAutoreleasedReturnValue();
    eventIdentifier = v5->_eventIdentifier;
    v5->_eventIdentifier = (NSString *)v20;

    objc_msgSend(v4, "activateAction");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v23 = [ANNotificationAction alloc];
      objc_msgSend(v4, "activateAction");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[ANNotificationAction initWithManagedObject:](v23, "initWithManagedObject:", v24);
      activateAction = v5->_activateAction;
      v5->_activateAction = (ANNotificationAction *)v25;

    }
    objc_msgSend(v4, "dismissAction");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      v28 = [ANNotificationAction alloc];
      objc_msgSend(v4, "dismissAction");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = -[ANNotificationAction initWithManagedObject:](v28, "initWithManagedObject:", v29);
      dismissAction = v5->_dismissAction;
      v5->_dismissAction = (ANNotificationAction *)v30;

    }
  }
  v32 = v5;

  return v32;
}

- (ANAccountNotification)initWithCoder:(id)a3
{
  id v4;
  ANAccountNotification *v5;
  uint64_t v6;
  NSString *accountTypeID;
  uint64_t v8;
  NSString *eventIdentifier;
  uint64_t v10;
  NSString *identifier;
  uint64_t v12;
  NSString *title;
  uint64_t v14;
  NSString *message;
  uint64_t v16;
  NSDate *date;
  uint64_t v18;
  NSString *callbackMachService;
  uint64_t v20;
  ANNotificationAction *activateAction;
  uint64_t v22;
  ANNotificationAction *dismissAction;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSDictionary *userInfo;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)ANAccountNotification;
  v5 = -[ANAccountNotification init](&v34, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_accountTypeID"));
    v6 = objc_claimAutoreleasedReturnValue();
    accountTypeID = v5->_accountTypeID;
    v5->_accountTypeID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_eventIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    eventIdentifier = v5->_eventIdentifier;
    v5->_eventIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_identifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_title"));
    v12 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_message"));
    v14 = objc_claimAutoreleasedReturnValue();
    message = v5->_message;
    v5->_message = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_date"));
    v16 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_callbackMachService"));
    v18 = objc_claimAutoreleasedReturnValue();
    callbackMachService = v5->_callbackMachService;
    v5->_callbackMachService = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_activateAction"));
    v20 = objc_claimAutoreleasedReturnValue();
    activateAction = v5->_activateAction;
    v5->_activateAction = (ANNotificationAction *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_dismissAction"));
    v22 = objc_claimAutoreleasedReturnValue();
    dismissAction = v5->_dismissAction;
    v5->_dismissAction = (ANNotificationAction *)v22;

    v24 = (void *)MEMORY[0x24BDBCF20];
    v25 = objc_opt_class();
    v26 = objc_opt_class();
    v27 = objc_opt_class();
    v28 = objc_opt_class();
    v29 = objc_opt_class();
    objc_msgSend(v24, "setWithObjects:", v25, v26, v27, v28, v29, objc_opt_class(), 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v30, CFSTR("_userInfo"));
    v31 = objc_claimAutoreleasedReturnValue();
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v31;

    v5->_destinations = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_destinations"));
    v5->_sectionSubtype = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_sectionSubtype"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *accountTypeID;
  id v5;

  accountTypeID = self->_accountTypeID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", accountTypeID, CFSTR("_accountTypeID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_eventIdentifier, CFSTR("_eventIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("_title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_message, CFSTR("_message"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("_identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_date, CFSTR("_date"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_callbackMachService, CFSTR("_callbackMachService"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_activateAction, CFSTR("_activateAction"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dismissAction, CFSTR("_dismissAction"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userInfo, CFSTR("_userInfo"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_destinations, CFSTR("_destinations"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_sectionSubtype, CFSTR("_sectionSubtype"));

}

- (ANAccountNotification)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  ANAccountNotification *v5;
  uint64_t v6;
  NSString *accountTypeID;
  uint64_t v8;
  NSString *eventIdentifier;
  uint64_t v10;
  NSString *identifier;
  uint64_t v12;
  NSString *title;
  uint64_t v14;
  NSString *message;
  uint64_t v16;
  NSDate *date;
  uint64_t v18;
  NSString *callbackMachService;
  uint64_t v20;
  NSDictionary *userInfo;
  void *v22;
  void *v23;
  void *v24;
  ANNotificationAction *v25;
  ANNotificationAction *activateAction;
  void *v27;
  ANNotificationAction *v28;
  ANNotificationAction *dismissAction;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)ANAccountNotification;
  v5 = -[ANAccountNotification init](&v31, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_accountTypeID"));
    v6 = objc_claimAutoreleasedReturnValue();
    accountTypeID = v5->_accountTypeID;
    v5->_accountTypeID = (NSString *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_eventIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    eventIdentifier = v5->_eventIdentifier;
    v5->_eventIdentifier = (NSString *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_identifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v10;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_title"));
    v12 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v12;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_message"));
    v14 = objc_claimAutoreleasedReturnValue();
    message = v5->_message;
    v5->_message = (NSString *)v14;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_date"));
    v16 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v16;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_callbackMachService"));
    v18 = objc_claimAutoreleasedReturnValue();
    callbackMachService = v5->_callbackMachService;
    v5->_callbackMachService = (NSString *)v18;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_userInfo"));
    v20 = objc_claimAutoreleasedReturnValue();
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v20;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_destinations"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_destinations = objc_msgSend(v22, "integerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_sectionSubtype"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_sectionSubtype = objc_msgSend(v23, "integerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_activateAction"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = -[ANNotificationAction initWithDictionaryRepresentation:]([ANNotificationAction alloc], "initWithDictionaryRepresentation:", v24);
      activateAction = v5->_activateAction;
      v5->_activateAction = v25;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_dismissAction"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = -[ANNotificationAction initWithDictionaryRepresentation:]([ANNotificationAction alloc], "initWithDictionaryRepresentation:", v27);
      dismissAction = v5->_dismissAction;
      v5->_dismissAction = v28;

    }
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_accountTypeID, CFSTR("_accountTypeID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_eventIdentifier, CFSTR("_eventIdentifier"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_identifier, CFSTR("_identifier"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_title, CFSTR("_title"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_message, CFSTR("_message"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_date, CFSTR("_date"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_callbackMachService, CFSTR("_callbackMachService"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_userInfo, CFSTR("_userInfo"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_destinations);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("_destinations"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_sectionSubtype);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("_sectionSubtype"));

  -[ANNotificationAction dictionaryRepresentation](self->_activateAction, "dictionaryRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("_activateAction"));

  -[ANNotificationAction dictionaryRepresentation](self->_dismissAction, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("_dismissAction"));

  v8 = (void *)objc_msgSend(v3, "copy");
  return v8;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%p> {ID: \"%@\", Type: \"%@\", title: \"%@\" }"), self, self->_identifier, self->_accountTypeID, self->_title);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)accountTypeID
{
  return self->_accountTypeID;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)activateButtonTitle
{
  return self->_activateButtonTitle;
}

- (void)setActivateButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (ANNotificationAction)activateAction
{
  return self->_activateAction;
}

- (void)setActivateAction:(id)a3
{
  objc_storeStrong((id *)&self->_activateAction, a3);
}

- (ANNotificationAction)dismissAction
{
  return self->_dismissAction;
}

- (void)setDismissAction:(id)a3
{
  objc_storeStrong((id *)&self->_dismissAction, a3);
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)eventIdentifier
{
  return self->_eventIdentifier;
}

- (void)setEventIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (int64_t)destinations
{
  return self->_destinations;
}

- (void)setDestinations:(int64_t)a3
{
  self->_destinations = a3;
}

- (int64_t)sectionSubtype
{
  return self->_sectionSubtype;
}

- (void)setSectionSubtype:(int64_t)a3
{
  self->_sectionSubtype = a3;
}

- (NSString)callbackMachService
{
  return self->_callbackMachService;
}

- (void)setCallbackMachService:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackMachService, 0);
  objc_storeStrong((id *)&self->_eventIdentifier, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_dismissAction, 0);
  objc_storeStrong((id *)&self->_activateAction, 0);
  objc_storeStrong((id *)&self->_activateButtonTitle, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_accountTypeID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithManagedObject:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_215D17000, v0, v1, "%s (%d) \"NSObjectInaccessibleException caught inside -[ANAccountNotification initWithManagedObject:]\", v2, v3, v4, v5, v6);
}

@end
