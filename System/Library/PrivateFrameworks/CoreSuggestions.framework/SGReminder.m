@implementation SGReminder

- (SGReminder)initWithRecordId:(id)a3 origin:(id)a4 title:(id)a5 dueDateComponents:(id)a6 dueLocationType:(unsigned __int8)a7 dueLocation:(id)a8 dueLocationTrigger:(unsigned __int8)a9 sourceURL:(id)a10 reminderStatus:(unsigned __int8)a11 opaqueKey:(id)a12 uniqueKey:(id)a13 contactIdentifier:(id)a14 creationDate:(id)a15
{
  id v20;
  id v21;
  id v22;
  SGReminder *v23;
  SGReminder *v24;
  id obj;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  objc_super v34;

  v33 = a5;
  obj = a6;
  v32 = a6;
  v31 = a8;
  v30 = a10;
  v29 = a12;
  v20 = a13;
  v21 = a14;
  v22 = a15;
  v34.receiver = self;
  v34.super_class = (Class)SGReminder;
  v23 = -[SGObject initWithRecordId:origin:](&v34, sel_initWithRecordId_origin_, a3, a4);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_title, a5);
    objc_storeStrong((id *)&v24->_dueDateComponents, obj);
    v24->_dueLocationType = a7;
    objc_storeStrong((id *)&v24->_dueLocation, a8);
    v24->_dueLocationTrigger = a9;
    objc_storeStrong((id *)&v24->_sourceURL, a10);
    v24->_reminderStatus = a11;
    objc_storeStrong((id *)&v24->_opaqueKey, a12);
    objc_storeStrong((id *)&v24->_uniqueKey, a13);
    objc_storeStrong((id *)&v24->_contactIdentifier, a14);
    objc_storeStrong((id *)&v24->_creationDate, a15);
  }

  return v24;
}

- (BOOL)isAllDay
{
  NSDateComponents *dueDateComponents;

  dueDateComponents = self->_dueDateComponents;
  if (dueDateComponents)
    LOBYTE(dueDateComponents) = -[NSDateComponents hour](dueDateComponents, "hour") == 0x7FFFFFFFFFFFFFFFLL
                             && -[NSDateComponents minute](self->_dueDateComponents, "minute") == 0x7FFFFFFFFFFFFFFFLL
                             && -[NSDateComponents second](self->_dueDateComponents, "second") == 0x7FFFFFFFFFFFFFFFLL
                             && -[NSDateComponents nanosecond](self->_dueDateComponents, "nanosecond") == 0x7FFFFFFFFFFFFFFFLL;
  return (char)dueDateComponents;
}

- (id)description
{
  id v3;
  NSString *title;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  title = self->_title;
  -[NSDateComponents date](self->_dueDateComponents, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<SGReminder '%@' dueDate: %@>"), title, v5);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_title, "hash");
  v4 = -[NSString hash](self->_opaqueKey, "hash") - v3 + 32 * v3;
  return -[NSString hash](self->_uniqueKey, "hash") - v4 + 32 * v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SGReminder;
  v4 = a3;
  -[SGObject encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_title, CFSTR("title"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_dueDateComponents, CFSTR("dueDateComponents"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_dueLocationType, CFSTR("dueLocationType"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_dueLocation, CFSTR("dueLocation"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_dueLocationTrigger, CFSTR("dueLocationTrigger"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_sourceURL, CFSTR("sourceURL"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_reminderStatus, CFSTR("reminderStatus"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_opaqueKey, CFSTR("opaqueKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_uniqueKey, CFSTR("uniqueKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_contactIdentifier, CFSTR("contactIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_creationDate, CFSTR("creationDate"));

}

- (SGReminder)initWithCoder:(id)a3
{
  id v5;
  SGReminder *v6;
  void *v7;
  void *v8;
  NSString *v9;
  void *title;
  void *v11;
  uint64_t v12;
  NSDateComponents *dueDateComponents;
  void *v14;
  uint64_t v15;
  SGLocation *dueLocation;
  void *v17;
  void *v18;
  NSURL *v19;
  void *sourceURL;
  void *v21;
  uint64_t v22;
  NSString *opaqueKey;
  void *v24;
  uint64_t v25;
  NSString *uniqueKey;
  void *v27;
  uint64_t v28;
  NSString *contactIdentifier;
  void *v30;
  void *v31;
  NSDate *v32;
  void *creationDate;
  objc_super v35;

  v5 = a3;
  v35.receiver = self;
  v35.super_class = (Class)SGReminder;
  v6 = -[SGObject initWithCoder:](&v35, sel_initWithCoder_, v5);
  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("title"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = v8;
      title = v6->_title;
      v6->_title = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      title = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(title, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("SGReminder.m"), 102, CFSTR("nonnull property %s *%s was null when decoded"), "NSString", "title");
    }

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v11, CFSTR("dueDateComponents"));
    v12 = objc_claimAutoreleasedReturnValue();
    dueDateComponents = v6->_dueDateComponents;
    v6->_dueDateComponents = (NSDateComponents *)v12;

    v6->_dueLocationType = objc_msgSend(v5, "decodeInt64ForKey:", CFSTR("dueLocationType"));
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v14, CFSTR("dueLocation"));
    v15 = objc_claimAutoreleasedReturnValue();
    dueLocation = v6->_dueLocation;
    v6->_dueLocation = (SGLocation *)v15;

    v6->_dueLocationTrigger = objc_msgSend(v5, "decodeInt64ForKey:", CFSTR("dueLocationTrigger"));
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v17, CFSTR("sourceURL"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = v18;
      sourceURL = v6->_sourceURL;
      v6->_sourceURL = v19;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      sourceURL = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(sourceURL, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("SGReminder.m"), 107, CFSTR("nonnull property %s *%s was null when decoded"), "NSURL", "sourceURL");
    }

    v6->_reminderStatus = objc_msgSend(v5, "decodeInt64ForKey:", CFSTR("reminderStatus"));
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v21, CFSTR("opaqueKey"));
    v22 = objc_claimAutoreleasedReturnValue();
    opaqueKey = v6->_opaqueKey;
    v6->_opaqueKey = (NSString *)v22;

    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v24, CFSTR("uniqueKey"));
    v25 = objc_claimAutoreleasedReturnValue();
    uniqueKey = v6->_uniqueKey;
    v6->_uniqueKey = (NSString *)v25;

    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v27, CFSTR("contactIdentifier"));
    v28 = objc_claimAutoreleasedReturnValue();
    contactIdentifier = v6->_contactIdentifier;
    v6->_contactIdentifier = (NSString *)v28;

    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v30, CFSTR("creationDate"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      v32 = v31;
      creationDate = v6->_creationDate;
      v6->_creationDate = v32;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      creationDate = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(creationDate, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("SGReminder.m"), 112, CFSTR("nonnull property %s *%s was null when decoded"), "NSDate", "creationDate");
    }

  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSString *title;
  void *v9;
  uint64_t dueLocationType;
  id v11;
  unsigned __int8 dueLocationTrigger;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;

  v5 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[SGObject recordId](self, "recordId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGObject origin](self, "origin");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  title = self->_title;
  v9 = (void *)-[NSDateComponents copyWithZone:](self->_dueDateComponents, "copyWithZone:", a3);
  dueLocationType = self->_dueLocationType;
  v11 = -[SGLocation copyWithZone:](self->_dueLocation, "copyWithZone:", a3);
  dueLocationTrigger = self->_dueLocationTrigger;
  v13 = (void *)-[NSURL copyWithZone:](self->_sourceURL, "copyWithZone:", a3);
  LOBYTE(v17) = self->_reminderStatus;
  LOBYTE(v16) = dueLocationTrigger;
  v14 = (void *)objc_msgSend(v5, "initWithRecordId:origin:title:dueDateComponents:dueLocationType:dueLocation:dueLocationTrigger:sourceURL:reminderStatus:opaqueKey:uniqueKey:contactIdentifier:creationDate:", v6, v7, title, v9, dueLocationType, v11, v16, v13, v17, self->_opaqueKey, self->_uniqueKey, self->_contactIdentifier, self->_creationDate);

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  SGReminder *v4;
  SGReminder *v5;
  BOOL v6;

  v4 = (SGReminder *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGReminder isEqualToReminder:](self, "isEqualToReminder:", v5);

  return v6;
}

- (BOOL)isEqualToReminder:(id)a3
{
  id *v4;
  id *v5;
  NSString *title;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  NSDateComponents *dueDateComponents;
  NSDateComponents *v12;
  NSDateComponents *v13;
  NSDateComponents *v14;
  char v15;
  int dueLocationType;
  SGLocation *dueLocation;
  SGLocation *v18;
  SGLocation *v19;
  SGLocation *v20;
  BOOL v21;
  int dueLocationTrigger;
  NSURL *sourceURL;
  NSURL *v24;
  NSURL *v25;
  NSURL *v26;
  char v27;
  int reminderStatus;
  NSString *opaqueKey;
  NSString *v30;
  NSString *v31;
  NSString *v32;
  char v33;
  NSString *uniqueKey;
  NSString *v35;
  NSString *v36;
  NSString *v37;
  char v38;
  NSString *contactIdentifier;
  NSString *v40;
  NSString *v41;
  NSString *v42;
  char v43;
  char v44;
  NSDate *v46;
  NSDate *v47;

  v4 = (id *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_31;
  title = self->_title;
  v7 = (NSString *)v4[4];
  if (title == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = title;
    v10 = -[NSString isEqual:](v9, "isEqual:", v8);

    if ((v10 & 1) == 0)
      goto LABEL_31;
  }
  dueDateComponents = self->_dueDateComponents;
  v12 = (NSDateComponents *)v5[5];
  if (dueDateComponents == v12)
  {

  }
  else
  {
    v13 = v12;
    v14 = dueDateComponents;
    v15 = -[NSDateComponents isEqual:](v14, "isEqual:", v13);

    if ((v15 & 1) == 0)
      goto LABEL_31;
  }
  dueLocationType = self->_dueLocationType;
  if (dueLocationType != objc_msgSend(v5, "dueLocationType"))
    goto LABEL_31;
  dueLocation = self->_dueLocation;
  v18 = (SGLocation *)v5[6];
  if (dueLocation == v18)
  {

  }
  else
  {
    v19 = v18;
    v20 = dueLocation;
    v21 = -[SGLocation isEqual:](v20, "isEqual:", v19);

    if (!v21)
      goto LABEL_31;
  }
  dueLocationTrigger = self->_dueLocationTrigger;
  if (dueLocationTrigger != objc_msgSend(v5, "dueLocationTrigger"))
    goto LABEL_31;
  sourceURL = self->_sourceURL;
  v24 = (NSURL *)v5[7];
  if (sourceURL == v24)
  {

  }
  else
  {
    v25 = v24;
    v26 = sourceURL;
    v27 = -[NSURL isEqual:](v26, "isEqual:", v25);

    if ((v27 & 1) == 0)
      goto LABEL_31;
  }
  reminderStatus = self->_reminderStatus;
  if (reminderStatus != objc_msgSend(v5, "reminderStatus"))
  {
LABEL_31:
    v44 = 0;
    goto LABEL_32;
  }
  opaqueKey = self->_opaqueKey;
  v30 = (NSString *)v5[9];
  if (opaqueKey == v30)
  {

  }
  else
  {
    v31 = v30;
    v32 = opaqueKey;
    v33 = -[NSString isEqual:](v32, "isEqual:", v31);

    if ((v33 & 1) == 0)
      goto LABEL_31;
  }
  uniqueKey = self->_uniqueKey;
  v35 = (NSString *)v5[10];
  if (uniqueKey == v35)
  {

  }
  else
  {
    v36 = v35;
    v37 = uniqueKey;
    v38 = -[NSString isEqual:](v37, "isEqual:", v36);

    if ((v38 & 1) == 0)
      goto LABEL_31;
  }
  contactIdentifier = self->_contactIdentifier;
  v40 = (NSString *)v5[11];
  if (contactIdentifier == v40)
  {

  }
  else
  {
    v41 = v40;
    v42 = contactIdentifier;
    v43 = -[NSString isEqual:](v42, "isEqual:", v41);

    if ((v43 & 1) == 0)
      goto LABEL_31;
  }
  v46 = self->_creationDate;
  v47 = v46;
  if (v46 == v5[8])
    v44 = 1;
  else
    v44 = -[NSDate isEqual:](v46, "isEqual:");

LABEL_32:
  return v44;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_opt_new();
  v4 = CFSTR("SGEntityTypePseudoReminder");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("SGEntityTypePseudoReminder"), CFSTR("type"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_title, CFSTR("title"));
  -[NSDateComponents date](self->_dueDateComponents, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB36A8];
    -[NSDateComponents timeZone](self->_dueDateComponents, "timeZone");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringFromDate:timeZone:formatOptions:", v5, v7, 1907);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("dueDate"));

  }
  if (self->_dueLocationType)
  {
    objc_msgSend((id)objc_opt_class(), "describeReminderDueLocationType:", self->_dueLocationType);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("dueLocationType"));

  }
  -[SGLocation label](self->_dueLocation, "label");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("dueLocation"));

  if (self->_dueLocationTrigger)
  {
    objc_msgSend((id)objc_opt_class(), "describeReminderDueLocationTrigger:", self->_dueLocationTrigger);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("dueLocationTrigger"));

  }
  objc_msgSend((id)objc_opt_class(), "describeReminderStatus:", self->_reminderStatus);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("SGReminderStatus"));

  return v3;
}

- (id)loggingIdentifier
{
  NSString **p_opaqueKey;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  p_opaqueKey = &self->_opaqueKey;
  if (self->_opaqueKey || (p_opaqueKey = &self->_uniqueKey, self->_uniqueKey))
    v3 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%tu"), -[NSString hash](*p_opaqueKey, "hash"));
  else
    v3 = &stru_1E4762D08;
  if ((unint64_t)-[__CFString length](v3, "length") > 0xC)
  {
    -[__CFString substringWithRange:](v3, "substringWithRange:", 0, 12);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v3;
  }
  v5 = v4;

  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (NSDateComponents)dueDateComponents
{
  return self->_dueDateComponents;
}

- (unsigned)dueLocationType
{
  return self->_dueLocationType;
}

- (SGLocation)dueLocation
{
  return self->_dueLocation;
}

- (unsigned)dueLocationTrigger
{
  return self->_dueLocationTrigger;
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSString)opaqueKey
{
  return self->_opaqueKey;
}

- (NSString)uniqueKey
{
  return self->_uniqueKey;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (unsigned)reminderStatus
{
  return self->_reminderStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueKey, 0);
  objc_storeStrong((id *)&self->_opaqueKey, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
  objc_storeStrong((id *)&self->_dueLocation, 0);
  objc_storeStrong((id *)&self->_dueDateComponents, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)describeReminderStatus:(unsigned __int8)a3
{
  if ((a3 - 1) > 2)
    return CFSTR("ReminderStatusUnknown");
  else
    return off_1E4760000[(a3 - 1)];
}

+ (id)describeReminderDueLocationTrigger:(unsigned __int8)a3
{
  const __CFString *v3;

  v3 = CFSTR("ReminderDueLocationTriggerUnknown");
  if (a3 == 1)
    v3 = CFSTR("ReminderDueLocationTriggerEnter");
  if (a3 == 2)
    return CFSTR("ReminderDueLocationTriggerLeave");
  else
    return (id)v3;
}

+ (id)describeReminderDueLocationType:(unsigned __int8)a3
{
  if ((a3 - 1) > 3u)
    return CFSTR("ReminderDueLocationTypeUnknown");
  else
    return off_1E4760018[(a3 - 1)];
}

@end
