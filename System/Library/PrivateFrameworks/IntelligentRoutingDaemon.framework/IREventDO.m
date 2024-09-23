@implementation IREventDO

+ (IREventDO)eventDOWithMediaType:(int64_t)a3
{
  return +[IREventDO eventDOWithMediaType:bundleID:](IREventDO, "eventDOWithMediaType:bundleID:", a3, 0);
}

+ (IREventDO)eventDOWithMediaType:(int64_t)a3 bundleID:(id)a4
{
  id v5;
  IREventDO *v6;
  IREventDO *v7;
  uint64_t v9;

  v5 = a4;
  v6 = [IREventDO alloc];
  LOBYTE(v9) = 0;
  v7 = -[IREventDO initWithEventType:eventSubType:name:bundleID:contextIdentifier:isOutsideApp:isEligibleApp:](v6, "initWithEventType:eventSubType:name:bundleID:contextIdentifier:isOutsideApp:isEligibleApp:", a3, 0, *MEMORY[0x24BE5B320], v5, 0, 0, v9);

  return v7;
}

+ (IREventDO)eventDOWithAppleTVControlType:(int64_t)a3
{
  IREventDO *v4;
  uint64_t v6;

  v4 = [IREventDO alloc];
  LOBYTE(v6) = 0;
  return -[IREventDO initWithEventType:eventSubType:name:bundleID:contextIdentifier:isOutsideApp:isEligibleApp:](v4, "initWithEventType:eventSubType:name:bundleID:contextIdentifier:isOutsideApp:isEligibleApp:", a3, 0, *MEMORY[0x24BE5B318], 0, 0, 0, v6);
}

+ (id)atvUserInteractionEvents
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCF20];
  +[IREventDO eventDOWithAppleTVControlType:](IREventDO, "eventDOWithAppleTVControlType:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[IREventDO eventDOWithAppleTVControlType:](IREventDO, "eventDOWithAppleTVControlType:", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObjects:", v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)mediaUserInteractionEvents
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCF20];
  +[IREventDO eventDOWithMediaType:](IREventDO, "eventDOWithMediaType:", 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[IREventDO eventDOWithMediaType:](IREventDO, "eventDOWithMediaType:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObjects:", v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)mediaBrokeredDeviceEvents
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCF20];
  +[IREventDO eventDOWithMediaType:](IREventDO, "eventDOWithMediaType:", 9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[IREventDO eventDOWithMediaType:](IREventDO, "eventDOWithMediaType:", 10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObjects:", v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)pickerChoiceEvents
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCF20];
  +[IREventDO eventDOWithAppleTVControlType:](IREventDO, "eventDOWithAppleTVControlType:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[IREventDO eventDOWithMediaType:](IREventDO, "eventDOWithMediaType:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObjects:", v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)exportAsDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BE5B2E0], "eventTypeStringEventDO:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("eventType"));

  objc_msgSend(MEMORY[0x24BE5B2E0], "eventSubTypeStringEventDO:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("eventSubType"));

  -[IREventDO name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("name"));

  -[IREventDO bundleID](self, "bundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("bundleID"));

  -[IREventDO contextIdentifier](self, "contextIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("contextIdentifier"));

  return v3;
}

- (BOOL)isUserIntentionEvent
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  +[IREventDO mediaUserInteractionEvents](IREventDO, "mediaUserInteractionEvents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "containsObject:", self) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    +[IREventDO atvUserInteractionEvents](IREventDO, "atvUserInteractionEvents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "containsObject:", self) & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      +[IREventDO mediaBrokeredDeviceEvents](IREventDO, "mediaBrokeredDeviceEvents");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v6, "containsObject:", self);

    }
  }

  return v4;
}

- (BOOL)isPickerChoiceEvent
{
  void *v3;

  +[IREventDO pickerChoiceEvents](IREventDO, "pickerChoiceEvents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v3, "containsObject:", self);

  return (char)self;
}

- (BOOL)isBannerEvent
{
  char v3;
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
  _QWORD v15[3];
  _QWORD v16[6];

  v16[5] = *MEMORY[0x24BDAC8D0];
  v3 = 1;
  +[IREventDO eventDOWithMediaType:](IREventDO, "eventDOWithMediaType:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v4;
  +[IREventDO eventDOWithMediaType:](IREventDO, "eventDOWithMediaType:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v5;
  +[IREventDO eventDOWithMediaType:](IREventDO, "eventDOWithMediaType:", 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v6;
  +[IREventDO eventDOWithMediaType:](IREventDO, "eventDOWithMediaType:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v7;
  +[IREventDO eventDOWithMediaType:](IREventDO, "eventDOWithMediaType:", 8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[IREventDO eventDOWithAppleTVControlType:](IREventDO, "eventDOWithAppleTVControlType:", 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  +[IREventDO eventDOWithAppleTVControlType:](IREventDO, "eventDOWithAppleTVControlType:", 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v11;
  +[IREventDO eventDOWithAppleTVControlType:](IREventDO, "eventDOWithAppleTVControlType:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "containsObject:", self) & 1) == 0)
    v3 = objc_msgSend(v13, "containsObject:", self);

  return v3;
}

- (IREventDO)initWithEventType:(int64_t)a3 eventSubType:(int64_t)a4 name:(id)a5 bundleID:(id)a6 contextIdentifier:(id)a7 isOutsideApp:(BOOL)a8 isEligibleApp:(BOOL)a9
{
  id v16;
  id v17;
  id v18;
  IREventDO *v19;
  IREventDO *v20;
  objc_super v22;

  v16 = a5;
  v17 = a6;
  v18 = a7;
  v22.receiver = self;
  v22.super_class = (Class)IREventDO;
  v19 = -[IREventDO init](&v22, sel_init);
  v20 = v19;
  if (v19)
  {
    v19->_eventType = a3;
    v19->_eventSubType = a4;
    objc_storeStrong((id *)&v19->_name, a5);
    objc_storeStrong((id *)&v20->_bundleID, a6);
    objc_storeStrong((id *)&v20->_contextIdentifier, a7);
    v20->_isOutsideApp = a8;
    v20->_isEligibleApp = a9;
  }

  return v20;
}

+ (IREventDO)eventDOWithEventType:(int64_t)a3 eventSubType:(int64_t)a4 name:(id)a5 bundleID:(id)a6 contextIdentifier:(id)a7 isOutsideApp:(BOOL)a8 isEligibleApp:(BOOL)a9
{
  _BOOL8 v9;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v20;

  v9 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  LOBYTE(v20) = a9;
  v18 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithEventType:eventSubType:name:bundleID:contextIdentifier:isOutsideApp:isEligibleApp:", a3, a4, v17, v16, v15, v9, v20);

  return (IREventDO *)v18;
}

- (id)copyWithReplacementEventType:(int64_t)a3
{
  id v5;
  uint64_t v7;

  v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v7) = self->_isEligibleApp;
  return (id)objc_msgSend(v5, "initWithEventType:eventSubType:name:bundleID:contextIdentifier:isOutsideApp:isEligibleApp:", a3, self->_eventSubType, self->_name, self->_bundleID, self->_contextIdentifier, self->_isOutsideApp, v7);
}

- (id)copyWithReplacementEventSubType:(int64_t)a3
{
  id v5;
  uint64_t v7;

  v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v7) = self->_isEligibleApp;
  return (id)objc_msgSend(v5, "initWithEventType:eventSubType:name:bundleID:contextIdentifier:isOutsideApp:isEligibleApp:", self->_eventType, a3, self->_name, self->_bundleID, self->_contextIdentifier, self->_isOutsideApp, v7);
}

- (id)copyWithReplacementName:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v8;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_isEligibleApp;
  v6 = (void *)objc_msgSend(v5, "initWithEventType:eventSubType:name:bundleID:contextIdentifier:isOutsideApp:isEligibleApp:", self->_eventType, self->_eventSubType, v4, self->_bundleID, self->_contextIdentifier, self->_isOutsideApp, v8);

  return v6;
}

- (id)copyWithReplacementBundleID:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v8;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_isEligibleApp;
  v6 = (void *)objc_msgSend(v5, "initWithEventType:eventSubType:name:bundleID:contextIdentifier:isOutsideApp:isEligibleApp:", self->_eventType, self->_eventSubType, self->_name, v4, self->_contextIdentifier, self->_isOutsideApp, v8);

  return v6;
}

- (id)copyWithReplacementContextIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v8;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_isEligibleApp;
  v6 = (void *)objc_msgSend(v5, "initWithEventType:eventSubType:name:bundleID:contextIdentifier:isOutsideApp:isEligibleApp:", self->_eventType, self->_eventSubType, self->_name, self->_bundleID, v4, self->_isOutsideApp, v8);

  return v6;
}

- (id)copyWithReplacementIsOutsideApp:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  uint64_t v7;

  v3 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v7) = self->_isEligibleApp;
  return (id)objc_msgSend(v5, "initWithEventType:eventSubType:name:bundleID:contextIdentifier:isOutsideApp:isEligibleApp:", self->_eventType, self->_eventSubType, self->_name, self->_bundleID, self->_contextIdentifier, v3, v7);
}

- (id)copyWithReplacementIsEligibleApp:(BOOL)a3
{
  uint64_t v4;

  LOBYTE(v4) = a3;
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithEventType:eventSubType:name:bundleID:contextIdentifier:isOutsideApp:isEligibleApp:", self->_eventType, self->_eventSubType, self->_name, self->_bundleID, self->_contextIdentifier, self->_isOutsideApp, v4);
}

- (BOOL)isEqualToEventDO:(id)a3
{
  id v4;
  void *v5;
  int64_t eventType;
  int64_t eventSubType;
  int v8;
  void *v9;
  int v10;
  NSString *name;
  void *v12;
  char v13;

  v4 = a3;
  v5 = v4;
  if (v4
    && (eventType = self->_eventType, eventType == objc_msgSend(v4, "eventType"))
    && (eventSubType = self->_eventSubType, eventSubType == objc_msgSend(v5, "eventSubType"))
    && (v8 = self->_name != 0,
        objc_msgSend(v5, "name"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = v9 == 0,
        v9,
        v8 != v10))
  {
    name = self->_name;
    if (name)
    {
      objc_msgSend(v5, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[NSString isEqual:](name, "isEqual:", v12);

    }
    else
    {
      v13 = 1;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  IREventDO *v4;
  IREventDO *v5;
  BOOL v6;

  v4 = (IREventDO *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[IREventDO isEqualToEventDO:](self, "isEqualToEventDO:", v5);

  return v6;
}

- (unint64_t)hash
{
  int64_t v2;

  v2 = self->_eventSubType - self->_eventType + 32 * self->_eventType;
  return -[NSString hash](self->_name, "hash") - v2 + 32 * v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IREventDO)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  objc_class *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString **v17;
  uint64_t *v18;
  void *v19;
  IREventDO *v20;
  void *v21;
  objc_class *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  objc_class *v26;
  objc_class *v27;
  void *v28;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  const __CFString **v35;
  uint64_t *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  const __CFString *v40;
  uint64_t v41;
  const __CFString *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  const __CFString *v50;
  uint64_t v51;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("eventType"));
  if (!v5)
  {
    objc_msgSend(v4, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      goto LABEL_10;
    if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("eventType")) & 1) == 0)
    {
      v51 = *MEMORY[0x24BDD0FC8];
      v52[0] = CFSTR("Missing serialized value for IREventDO.eventType");
      v16 = (void *)MEMORY[0x24BDBCE70];
      v17 = (const __CFString **)v52;
      v18 = &v51;
      goto LABEL_18;
    }
  }
  v6 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("eventSubType"));
  if (v6)
  {
LABEL_3:
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v8 = (objc_class *)objc_opt_class();
        NSStringFromClass(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unarchived unexpected class for IREventDO key \"name\" (expected %@, decoded %@)"), v9, v11, 0);
        v47 = *MEMORY[0x24BDD0FC8];
        v48 = v12;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IREventDOOCNTErrorDomain"), 3, v13);
        objc_msgSend(v4, "failWithError:", v14);
LABEL_25:

LABEL_26:
LABEL_27:
        v20 = 0;
LABEL_28:

        goto LABEL_29;
      }
    }
    else
    {
      objc_msgSend(v4, "error");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        v20 = 0;
LABEL_30:

        goto LABEL_31;
      }
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v22 = (objc_class *)objc_opt_class();
        NSStringFromClass(v22);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (objc_class *)objc_opt_class();
        NSStringFromClass(v23);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unarchived unexpected class for IREventDO key \"bundleID\" (expected %@, decoded %@)"), v11, v12, 0);
        v45 = *MEMORY[0x24BDD0FC8];
        v46 = v13;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IREventDOOCNTErrorDomain"), 3, v14);
        objc_msgSend(v4, "failWithError:", v24);
LABEL_24:

        goto LABEL_25;
      }
LABEL_21:
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contextIdentifier"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v26 = (objc_class *)objc_opt_class();
          NSStringFromClass(v26);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = (objc_class *)objc_opt_class();
          NSStringFromClass(v27);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unarchived unexpected class for IREventDO key \"contextIdentifier\" (expected %@, decoded %@)"), v12, v13, 0);
          v43 = *MEMORY[0x24BDD0FC8];
          v44 = v14;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IREventDOOCNTErrorDomain"), 3, v24);
          objc_msgSend(v4, "failWithError:", v28);

          goto LABEL_24;
        }
      }
      else
      {
        objc_msgSend(v4, "error");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
          goto LABEL_27;
      }
      v31 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("isOutsideApp"));
      if (v31)
        goto LABEL_34;
      objc_msgSend(v4, "error");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
        goto LABEL_27;
      if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("isOutsideApp")) & 1) != 0)
      {
LABEL_34:
        v32 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("isEligibleApp"));
        if (v32)
          goto LABEL_35;
        objc_msgSend(v4, "error");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37)
          goto LABEL_27;
        if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("isEligibleApp")) & 1) != 0)
        {
LABEL_35:
          LOBYTE(v38) = v32 != 0;
          self = -[IREventDO initWithEventType:eventSubType:name:bundleID:contextIdentifier:isOutsideApp:isEligibleApp:](self, "initWithEventType:eventSubType:name:bundleID:contextIdentifier:isOutsideApp:isEligibleApp:", v5, v6, v7, v9, v11, v31 != 0, v38);
          v20 = self;
          goto LABEL_28;
        }
        v39 = *MEMORY[0x24BDD0FC8];
        v40 = CFSTR("Missing serialized value for IREventDO.isEligibleApp");
        v34 = (void *)MEMORY[0x24BDBCE70];
        v35 = &v40;
        v36 = &v39;
      }
      else
      {
        v41 = *MEMORY[0x24BDD0FC8];
        v42 = CFSTR("Missing serialized value for IREventDO.isOutsideApp");
        v34 = (void *)MEMORY[0x24BDBCE70];
        v35 = &v42;
        v36 = &v41;
      }
      objc_msgSend(v34, "dictionaryWithObjects:forKeys:count:", v35, v36, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IREventDOOCNTErrorDomain"), 1, v12);
      objc_msgSend(v4, "failWithError:", v13);
      goto LABEL_26;
    }
    objc_msgSend(v4, "error");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v25)
      goto LABEL_21;
LABEL_20:
    v20 = 0;
LABEL_29:

    goto LABEL_30;
  }
  objc_msgSend(v4, "error");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("eventSubType")) & 1) != 0)
      goto LABEL_3;
    v49 = *MEMORY[0x24BDD0FC8];
    v50 = CFSTR("Missing serialized value for IREventDO.eventSubType");
    v16 = (void *)MEMORY[0x24BDBCE70];
    v17 = &v50;
    v18 = &v49;
LABEL_18:
    objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v17, v18, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IREventDOOCNTErrorDomain"), 1, v7);
    objc_msgSend(v4, "failWithError:", v9);
    goto LABEL_20;
  }
LABEL_10:
  v20 = 0;
LABEL_31:

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  NSString *bundleID;
  NSString *contextIdentifier;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "encodeInt64:forKey:", self->_eventType, CFSTR("eventType"));
  objc_msgSend(v8, "encodeInt64:forKey:", self->_eventSubType, CFSTR("eventSubType"));
  name = self->_name;
  if (name)
    objc_msgSend(v8, "encodeObject:forKey:", name, CFSTR("name"));
  bundleID = self->_bundleID;
  if (bundleID)
    objc_msgSend(v8, "encodeObject:forKey:", bundleID, CFSTR("bundleID"));
  contextIdentifier = self->_contextIdentifier;
  v7 = v8;
  if (contextIdentifier)
  {
    objc_msgSend(v8, "encodeObject:forKey:", contextIdentifier, CFSTR("contextIdentifier"));
    v7 = v8;
  }
  objc_msgSend(v7, "encodeInt64:forKey:", self->_isOutsideApp, CFSTR("isOutsideApp"));
  objc_msgSend(v8, "encodeInt64:forKey:", self->_isEligibleApp, CFSTR("isEligibleApp"));

}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  NSString *contextIdentifier;
  void *v7;
  void *v8;
  void *v9;
  __int128 v11;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_eventType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_eventSubType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_OWORD *)&self->_name;
  contextIdentifier = self->_contextIdentifier;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isOutsideApp);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isEligibleApp);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<IREventDO | eventType:%@ eventSubType:%@ name:%@ bundleID:%@ contextIdentifier:%@ isOutsideApp:%@ isEligibleApp:%@>"), v4, v5, v11, contextIdentifier, v7, v8);

  return v9;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (int64_t)eventSubType
{
  return self->_eventSubType;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)contextIdentifier
{
  return self->_contextIdentifier;
}

- (BOOL)isOutsideApp
{
  return self->_isOutsideApp;
}

- (BOOL)isEligibleApp
{
  return self->_isEligibleApp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
