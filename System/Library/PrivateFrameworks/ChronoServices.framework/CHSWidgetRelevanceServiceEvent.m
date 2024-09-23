@implementation CHSWidgetRelevanceServiceEvent

- (_QWORD)initWithEventType:(void *)a3 keys:(void *)a4 extensionIdentities:
{
  id v7;
  id v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  if (a1)
  {
    v15.receiver = a1;
    v15.super_class = (Class)CHSWidgetRelevanceServiceEvent;
    v9 = objc_msgSendSuper2(&v15, sel_init);
    a1 = v9;
    if (v9)
    {
      v9[1] = a2;
      v10 = objc_msgSend(v7, "copy");
      v11 = (void *)a1[2];
      a1[2] = v10;

      v12 = objc_msgSend(v8, "copy");
      v13 = (void *)a1[3];
      a1[3] = v12;

    }
  }

  return a1;
}

+ (id)reloadEvent
{
  return -[CHSWidgetRelevanceServiceEvent initWithEventType:keys:extensionIdentities:](objc_alloc((Class)a1), 0, 0, 0);
}

+ (id)addOrUpdateEventWithRelevanceKeys:(id)a3
{
  id v4;
  _QWORD *v5;

  v4 = a3;
  v5 = -[CHSWidgetRelevanceServiceEvent initWithEventType:keys:extensionIdentities:](objc_alloc((Class)a1), 1, v4, 0);

  return v5;
}

+ (id)removeEventWithExtensionIdentities:(id)a3
{
  id v4;
  _QWORD *v5;

  v4 = a3;
  v5 = -[CHSWidgetRelevanceServiceEvent initWithEventType:keys:extensionIdentities:](objc_alloc((Class)a1), 2, 0, v4);

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t eventType;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  eventType = self->_eventType;
  v6 = CFSTR("reload");
  if (eventType == 1)
    v6 = CFSTR("addOrUpdate");
  if (eventType == 2)
    v7 = CFSTR("remove");
  else
    v7 = v6;
  objc_msgSend(v3, "appendString:withName:", v7, CFSTR("eventType"));
  -[NSSet allObjects](self->_keys, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendArraySection:withName:skipIfEmpty:", v8, CFSTR("keys"), 1);

  -[NSSet allObjects](self->_extensionIdentities, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendArraySection:withName:skipIfEmpty:", v9, CFSTR("extensionIdentities"), 1);

  objc_msgSend(v4, "build");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSSet hash](self->_keys, "hash");
  return -[NSSet hash](self->_extensionIdentities, "hash") ^ v3 ^ self->_eventType;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && v4[1] == self->_eventType && BSEqualSets())
    v5 = BSEqualSets();
  else
    v5 = 0;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", self->_eventType, CFSTR("eventType"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_keys, CFSTR("keys"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_extensionIdentities, CFSTR("extensionIdentities"));

}

- (CHSWidgetRelevanceServiceEvent)initWithCoder:(id)a3
{
  id v4;
  CHSWidgetRelevanceServiceEvent *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSSet *keys;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSSet *extensionIdentities;
  objc_super v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CHSWidgetRelevanceServiceEvent;
  v5 = -[CHSWidgetRelevanceServiceEvent init](&v17, sel_init);
  if (v5)
  {
    v5->_eventType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("eventType"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("keys"));
    v9 = objc_claimAutoreleasedReturnValue();
    keys = v5->_keys;
    v5->_keys = (NSSet *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("extensionIdentities"));
    v14 = objc_claimAutoreleasedReturnValue();
    extensionIdentities = v5->_extensionIdentities;
    v5->_extensionIdentities = (NSSet *)v14;

  }
  return v5;
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (NSSet)keys
{
  return self->_keys;
}

- (NSSet)extensionIdentities
{
  return self->_extensionIdentities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionIdentities, 0);
  objc_storeStrong((id *)&self->_keys, 0);
}

@end
