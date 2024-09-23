@implementation _CDInteraction

- (BOOL)isUncachedSentinel
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_CDInteraction)initWithCoder:(id)a3
{
  id v4;
  _CDInteraction *v5;
  uint64_t v6;
  NSDate *startDate;
  uint64_t v8;
  NSDate *updateDate;
  uint64_t v10;
  NSDate *endDate;
  uint64_t v12;
  NSString *uuid;
  uint64_t v14;
  NSString *locationUUID;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSArray *keywords;
  uint64_t v27;
  NSArray *attachments;
  void *v29;
  _CDInteraction *v30;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)_CDInteraction;
  v5 = -[_CDInteraction init](&v32, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("updateDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    updateDate = v5->_updateDate;
    v5->_updateDate = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
    v12 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("locationUUID"));
    v14 = objc_claimAutoreleasedReturnValue();
    locationUUID = v5->_locationUUID;
    v5->_locationUUID = (NSString *)v14;

    v5->_mechanism = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("mechanism"));
    v5->_direction = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("direction"));
    v5->_isResponse = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isResponse"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleId"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDInteraction setBundleId:](v5, "setBundleId:", v16);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("targetBundleId"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDInteraction setTargetBundleId:](v5, "setTargetBundleId:", v17);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupName"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDInteraction setGroupName:](v5, "setGroupName:", v18);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contentURL"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDInteraction setContentURL:](v5, "setContentURL:", v19);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("derivedIntentIdentifier"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDInteraction setDerivedIntentIdentifier:](v5, "setDerivedIntentIdentifier:", v20);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("domainIdentifier"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDInteraction setDomainIdentifier:](v5, "setDomainIdentifier:", v21);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("account"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDInteraction setAccount:](v5, "setAccount:", v22);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sender"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDInteraction setSender:](v5, "setSender:", v23);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("recipients"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDInteraction setRecipients:](v5, "setRecipients:", v24);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("keywords"));
    v25 = objc_claimAutoreleasedReturnValue();
    keywords = v5->_keywords;
    v5->_keywords = (NSArray *)v25;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("attachments"));
    v27 = objc_claimAutoreleasedReturnValue();
    attachments = v5->_attachments;
    v5->_attachments = (NSArray *)v27;

    v5->_selfParticipantStatus = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("selfParticipantStatus"));
    v5->_forcePersistInteraction = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("forcePersistInteraction"));
    v5->_mailShareSheetDeletionCandidate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("mailShareSheetDeletionCandidate"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nsUserName"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDInteraction setNsUserName:](v5, "setNsUserName:", v29);

    v30 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *startDate;
  void *v5;
  id v6;

  startDate = self->_startDate;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", startDate, CFSTR("startDate"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_updateDate, CFSTR("updateDate"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_endDate, CFSTR("endDate"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_uuid, CFSTR("uuid"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_locationUUID, CFSTR("locationUUID"));
  objc_msgSend(v6, "encodeInt64:forKey:", self->_mechanism, CFSTR("mechanism"));
  objc_msgSend(v6, "encodeInt64:forKey:", self->_direction, CFSTR("direction"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_isResponse, CFSTR("isResponse"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_bundleId, CFSTR("bundleId"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_targetBundleId, CFSTR("targetBundleId"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_groupName, CFSTR("groupName"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_contentURL, CFSTR("contentURL"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_derivedIntentIdentifier, CFSTR("derivedIntentIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_domainIdentifier, CFSTR("domainIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_account, CFSTR("account"));
  -[_CDInteraction recipients](self, "recipients");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("recipients"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_sender, CFSTR("sender"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_keywords, CFSTR("keywords"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_attachments, CFSTR("attachments"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_forcePersistInteraction, CFSTR("forcePersistInteraction"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_mailShareSheetDeletionCandidate, CFSTR("mailShareSheetDeletionCandidate"));
  objc_msgSend(v6, "encodeInt64:forKey:", self->_selfParticipantStatus, CFSTR("selfParticipantStatus"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_nsUserName, CFSTR("nsUserName"));

}

- (_CDInteraction)init
{
  char *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_CDInteraction;
  v2 = -[_CDInteraction init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)*((_QWORD *)v2 + 12);
    *((_QWORD *)v2 + 12) = v3;

    objc_storeStrong((id *)v2 + 13, *((id *)v2 + 12));
    objc_storeStrong((id *)v2 + 14, *((id *)v2 + 12));
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)*((_QWORD *)v2 + 15);
    *((_QWORD *)v2 + 15) = v6;

    *(_OWORD *)(v2 + 136) = xmmword_18DF4C640;
    v2[88] = 0;
    v2[90] = 0;
  }
  return (_CDInteraction *)v2;
}

+ (id)_internPool
{
  if (_internPool__pasOnceToken5 != -1)
    dispatch_once(&_internPool__pasOnceToken5, &__block_literal_global_13);
  return (id)_internPool__pasExprOnceResult;
}

- (NSArray)recipients
{
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (!self->_recipients)
    return (NSArray *)MEMORY[0x1E0C9AA60];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (NSArray *)self->_recipients;
  v4 = (void *)MEMORY[0x193FEE914]();
  v6[0] = self->_recipients;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v4);
  return (NSArray *)v5;
}

- (void)setRecipients:(id)a3
{
  id v4;
  void *v5;
  id recipients;
  void *v7;
  id *p_recipients;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  BOOL v21;
  id v22;
  id obj;

  v4 = a3;
  if (objc_msgSend(v4, "count") != 1)
  {
    obj = (id)objc_msgSend(v4, "copy");

    +[_CDInteraction _internPool](_CDInteraction, "_internPool");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "intern:", obj);
    recipients = (id)objc_claimAutoreleasedReturnValue();

    p_recipients = &self->_recipients;
    if (recipients == obj)
    {
      v22 = obj;
      v15 = *p_recipients;
      *p_recipients = v22;
    }
    else
    {
      objc_storeStrong(p_recipients, recipients);
      if (!objc_msgSend(obj, "count"))
        goto LABEL_19;
      v9 = 0;
      v10 = obj;
      while (1)
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "displayName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          v14 = v12;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v14 = (id)objc_claimAutoreleasedReturnValue();
        }
        v15 = v14;

        objc_msgSend(recipients, "objectAtIndexedSubscript:", v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "displayName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17)
        {
          v19 = v17;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v19 = (id)objc_claimAutoreleasedReturnValue();
        }
        v20 = v19;

        if ((objc_msgSend(v15, "isEqual:", v20) & 1) == 0)
          break;

        v21 = ++v9 >= (unint64_t)objc_msgSend(obj, "count");
        v10 = obj;
        if (v21)
          goto LABEL_19;
      }
      objc_storeStrong(p_recipients, obj);

    }
    goto LABEL_19;
  }
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  recipients = self->_recipients;
  self->_recipients = v5;
  obj = v4;
LABEL_19:

}

- (unint64_t)recipientsCount
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(self->_recipients, "count");
  else
    return 1;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *bundleId;
  id v8;

  v4 = a3;
  +[_CDInteraction _internPool](_CDInteraction, "_internPool");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(v8, "intern:", v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  bundleId = self->_bundleId;
  self->_bundleId = v6;

}

- (NSString)targetBundleId
{
  return self->_targetBundleId;
}

- (void)setTargetBundleId:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *targetBundleId;
  id v8;

  v4 = a3;
  +[_CDInteraction _internPool](_CDInteraction, "_internPool");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(v8, "intern:", v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  targetBundleId = self->_targetBundleId;
  self->_targetBundleId = v6;

}

- (NSString)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *account;
  id v8;

  v4 = a3;
  +[_CDInteraction _internPool](_CDInteraction, "_internPool");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(v8, "intern:", v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  account = self->_account;
  self->_account = v6;

}

- (NSString)derivedIntentIdentifier
{
  return self->_derivedIntentIdentifier;
}

- (void)setDerivedIntentIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *derivedIntentIdentifier;
  id v8;

  v4 = a3;
  +[_CDInteraction _internPool](_CDInteraction, "_internPool");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(v8, "intern:", v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  derivedIntentIdentifier = self->_derivedIntentIdentifier;
  self->_derivedIntentIdentifier = v6;

}

- (NSString)domainIdentifier
{
  return self->_domainIdentifier;
}

- (void)setDomainIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *domainIdentifier;
  id v8;

  v4 = a3;
  +[_CDInteraction _internPool](_CDInteraction, "_internPool");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(v8, "intern:", v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  domainIdentifier = self->_domainIdentifier;
  self->_domainIdentifier = v6;

}

- (NSString)groupName
{
  return self->_groupName;
}

- (void)setGroupName:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *groupName;
  id v8;

  v4 = a3;
  +[_CDInteraction _internPool](_CDInteraction, "_internPool");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(v8, "intern:", v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  groupName = self->_groupName;
  self->_groupName = v6;

}

- (_CDContact)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
  id v4;
  void *v5;
  _CDContact *v6;
  _CDContact *sender;
  id v8;

  v4 = a3;
  +[_CDInteraction _internPool](_CDInteraction, "_internPool");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(v8, "intern:", v5);
  v6 = (_CDContact *)objc_claimAutoreleasedReturnValue();
  sender = self->_sender;
  self->_sender = v6;

}

- (NSURL)contentURL
{
  return self->_contentURL;
}

- (void)setContentURL:(id)a3
{
  id v4;
  void *v5;
  NSURL *v6;
  NSURL *contentURL;
  id v8;

  v4 = a3;
  +[_CDInteraction _internPool](_CDInteraction, "_internPool");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(v8, "intern:", v5);
  v6 = (NSURL *)objc_claimAutoreleasedReturnValue();
  contentURL = self->_contentURL;
  self->_contentURL = v6;

}

- (NSString)nsUserName
{
  return self->_nsUserName;
}

- (void)setNsUserName:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *nsUserName;
  id v8;

  v4 = a3;
  +[_CDInteraction _internPool](_CDInteraction, "_internPool");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(v8, "intern:", v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  nsUserName = self->_nsUserName;
  self->_nsUserName = v6;

}

- (NSString)description
{
  return (NSString *)-[_CDInteraction descriptionRedacted:](self, "descriptionRedacted:", 0);
}

- (id)redactedDescription
{
  return -[_CDInteraction descriptionRedacted:](self, "descriptionRedacted:", 1);
}

- (id)descriptionRedacted:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  const __CFString *v13;
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

  v3 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v5, "appendString:", CFSTR("Interaction { \n"));
  -[_CDInteraction startDate](self, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("                startDate: %@\n"), v6);

  -[_CDInteraction updateDate](self, "updateDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("               updateDate: %@\n"), v7);

  -[_CDInteraction endDate](self, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("                  endDate: %@\n"), v8);

  -[_CDInteraction uuid](self, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("                     uuid: %@\n"), v9);

  if (v3)
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("             locationUUID: %@\n"), CFSTR("redacted"));
  }
  else
  {
    -[_CDInteraction locationUUID](self, "locationUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("             locationUUID: %@\n"), v10);

  }
  mechanismToString(-[_CDInteraction mechanism](self, "mechanism"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("                mechanism: %@ (%ld)\n"), v11, -[_CDInteraction mechanism](self, "mechanism"));

  v12 = -[_CDInteraction direction](self, "direction") - 1;
  if (v12 > 3)
    v13 = CFSTR("Incoming");
  else
    v13 = off_1E26E3E78[v12];
  objc_msgSend(v5, "appendFormat:", CFSTR("                direction: %@ (%ld)\n"), v13, -[_CDInteraction direction](self, "direction"));
  objc_msgSend(v5, "appendFormat:", CFSTR("               isResponse: %d\n"), -[_CDInteraction isResponse](self, "isResponse"));
  -[_CDInteraction bundleId](self, "bundleId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("                 bundleId: %@\n"), v14);

  -[_CDInteraction targetBundleId](self, "targetBundleId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("           targetBundleId: %@\n"), v15);

  -[_CDInteraction groupName](self, "groupName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDLogging descriptionOfObject:redacted:](_CDLogging, "descriptionOfObject:redacted:", v16, v3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("                groupName: %@\n"), v17);

  -[_CDInteraction contentURL](self, "contentURL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDLogging descriptionOfObject:redacted:](_CDLogging, "descriptionOfObject:redacted:", v18, v3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("               contentURL: %@\n"), v19);

  -[_CDInteraction derivedIntentIdentifier](self, "derivedIntentIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDLogging descriptionOfObject:redacted:](_CDLogging, "descriptionOfObject:redacted:", v20, v3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("  derivedIntentIdentifier: %@\n"), v21);

  -[_CDInteraction domainIdentifier](self, "domainIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDLogging descriptionOfObject:redacted:](_CDLogging, "descriptionOfObject:redacted:", v22, v3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("         domainIdentifier: %@\n"), v23);

  -[_CDInteraction account](self, "account");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDLogging descriptionOfObject:redacted:](_CDLogging, "descriptionOfObject:redacted:", v24, v3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("                  account: %@\n"), v25);

  -[_CDInteraction sender](self, "sender");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDLogging descriptionOfObject:redacted:](_CDLogging, "descriptionOfObject:redacted:", v26, v3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("                   sender: %@\n"), v27);

  -[_CDInteraction recipients](self, "recipients");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDLogging descriptionOfArray:redacted:](_CDLogging, "descriptionOfArray:redacted:", v28, v3);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("               recipients: %@\n"), v29);

  -[_CDInteraction keywords](self, "keywords");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDLogging descriptionOfArray:redacted:](_CDLogging, "descriptionOfArray:redacted:", v30, v3);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("                 keywords: %@\n"), v31);

  -[_CDInteraction attachments](self, "attachments");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDLogging descriptionOfArray:redacted:](_CDLogging, "descriptionOfArray:redacted:", v32, v3);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("              attachments: %@\n"), v33);

  if (-[_CDInteraction mechanism](self, "mechanism") == 5)
  {
    meetingStatusToString(-[_CDInteraction selfParticipantStatus](self, "selfParticipantStatus"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("    selfParticipantStatus: %@\n"), v34);

  }
  -[_CDInteraction nsUserName](self, "nsUserName");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("               nsUserName: %@\n"), v35);

  objc_msgSend(v5, "appendString:", CFSTR("}\n"));
  return v5;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[_CDInteraction uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _CDInteraction *v4;
  _CDInteraction *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (_CDInteraction *)a3;
  v5 = v4;
  if (self == v4)
  {
    v8 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[_CDInteraction uuid](v5, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDInteraction uuid](self, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isInteractionMechanismCalls
{
  return (self->_mechanism < 0x12uLL) & (0x31D01u >> self->_mechanism);
}

- (BOOL)isValidInteraction
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v12;
  id v13;

  v3 = (void *)MEMORY[0x193FEE914](self, a2);
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, +[_CDInteraction supportsSecureCoding](_CDInteraction, "supportsSecureCoding"), &v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v13;
  if (v5)
  {
    v6 = v5;

    objc_autoreleasePoolPop(v3);
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CB3710];
    +[_CDXPCCodecs supportedClassesToUnarchive](_CDXPCCodecs, "supportedClassesToUnarchive");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v9 = (id)objc_msgSend(v7, "unarchivedObjectOfClasses:fromData:error:", v8, v4, &v12);
    v6 = v12;

    objc_autoreleasePoolPop(v3);
    if (!v6)
      return 1;
  }
  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    -[_CDInteraction isValidInteraction].cold.1();

  return 0;
}

- (BOOL)isGroupChat
{
  if (-[_CDInteraction direction](self, "direction") == 1
    && -[_CDInteraction recipientsCount](self, "recipientsCount") > 1)
  {
    return 1;
  }
  if (-[_CDInteraction direction](self, "direction"))
    return 0;
  return -[_CDInteraction recipientsCount](self, "recipientsCount") != 0;
}

- (id)dateInterval
{
  void *v3;
  void *v4;
  void *v5;

  -[NSDate earlierDate:](self->_startDate, "earlierDate:", self->_endDate);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate laterDate:](self->_startDate, "laterDate:", self->_endDate);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v3, v4);

  return v5;
}

+ (id)conversationIdPercentEscapes
{
  if (initPercentEscapes_onceToken != -1)
    dispatch_once(&initPercentEscapes_onceToken, &__block_literal_global_675);
  return (id)percentEscapes;
}

+ (id)inverseConversationIdPercentEscapes
{
  if (initPercentEscapes_onceToken != -1)
    dispatch_once(&initPercentEscapes_onceToken, &__block_literal_global_675);
  return (id)inversePercentEscapes;
}

+ (id)generateConversationIdFromObjectsWithIdentifiers:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  unint64_t v7;
  char *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  id *v12;
  void *v13;
  void *v14;
  size_t v15;
  void *v16;
  uint64_t v17;
  size_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  __CFString *v27;
  void *v28;
  uint64_t v29;
  char *v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  int v35;
  int v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  id v44;
  void *memptr;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  v5 = v4 - 1;
  if (v4 == 1)
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "identifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[_CDInteraction generateConversationIdFromHandle:](_CDInteraction, "generateConversationIdFromHandle:", v26);
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_31;
  }
  v6 = v4;
  if (!v4)
  {
    v27 = &stru_1E26E9728;
    goto LABEL_31;
  }
  v7 = (8 * v4) | 7;
  memptr = 0;
  v46 = 0;
  v42 = v7;
  v43 = MEMORY[0x193FEE914]();
  if (v7 > 0x400)
  {
    v35 = malloc_type_posix_memalign(&memptr, 8uLL, 8 * v6, 0x80040B8603338uLL);
    LOBYTE(v46) = 0;
    if (v35)
      goto LABEL_38;
    v8 = (char *)memptr;
  }
  else
  {
    MEMORY[0x1E0C80A78]();
    v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v8, (8 * v6) | 7);
  }
  v44 = v3;
  objc_msgSend(v3, "getObjects:range:", v8, 0, v6);
  qsort_b(v8, v6, 8uLL, &__block_literal_global_488);
  v9 = 0;
  v10 = 0;
  do
  {
    v11 = v5;
    objc_msgSend(*(id *)&v8[8 * v10], "identifier");
    v12 = (id *)v8;
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[_CDInteraction generateConversationIdFromHandle:](_CDInteraction, "generateConversationIdFromHandle:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v6;
    v16 = v14;
    if (v13 != v14)
      v9 = 1;
    v17 = objc_msgSend(v14, "length");
    v5 += v17;

    v6 = v15;
    v8 = (char *)v12;
    ++v10;
  }
  while (v15 != v10);
  v41 = v11;
  memptr = 0;
  v46 = 0;
  v39 = 2 * v5;
  if (((2 * v5) | 1uLL) < 0x401)
  {
    MEMORY[0x1E0C80A78]();
    v19 = (char *)&v38 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v19, v18);
    memptr = v19;
    LOBYTE(v46) = 1;
    goto LABEL_11;
  }
  v36 = malloc_type_posix_memalign(&memptr, 8uLL, 2 * v5, 0xC021AE26uLL);
  LOBYTE(v46) = 0;
  if (v36)
  {
LABEL_38:
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
    v37 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v37);
  }
  v19 = (char *)memptr;
LABEL_11:
  v20 = 0;
  v21 = 0;
  v40 = v46;
  do
  {
    if (v20)
      *(_WORD *)&v19[2 * v21++] = 10;
    objc_msgSend(v12[v20], "identifier");
    if ((v9 & 1) != 0)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[_CDInteraction generateConversationIdFromHandle:](_CDInteraction, "generateConversationIdFromHandle:", v24);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v23 = objc_msgSend(v22, "length");
    objc_msgSend(v22, "getCharacters:range:", &v19[2 * v21], 0, v23);
    v21 += v23;

    ++v20;
  }
  while (v15 != v20);
  if (v42 > 0x400)
    free(v12);
  v28 = (void *)v43;
  if (v5)
  {
    v29 = v17 + v41;
    v30 = v19;
    do
    {
      v31 = *(unsigned __int16 *)v30;
      v30 += 2;
      if (v31 >= 0x80)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "_pas_stringWithConsumedAllocaDescrNoCopy:bufferSize:encoding:nullTerminated:isExternalRepresentation:", v19, v40, v39, 2483028224, 0, 0);
        v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_30;
      }
      --v29;
    }
    while (v29);
    v32 = 0;
    v33 = v17 + v41;
    do
    {
      v19[v32] = *(_WORD *)&v19[2 * v32];
      ++v32;
    }
    while (v33 != v32);
  }
  v27 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v19, v5, 1);
  if ((v40 & 1) == 0)
    free(v19);
LABEL_30:
  v3 = v44;
  objc_autoreleasePoolPop(v28);
LABEL_31:

  return v27;
}

+ (id)generateConversationIdFromHandle:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;

  v3 = a3;
  +[_CDInteraction conversationIdPercentEscapes](_CDInteraction, "conversationIdPercentEscapes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "rangeOfCharacterFromSet:options:", v4, 2);

  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = (__CFString *)v3;
  }
  else
  {
    v7 = (void *)MEMORY[0x193FEE914]();
    +[_CDInteraction inverseConversationIdPercentEscapes](_CDInteraction, "inverseConversationIdPercentEscapes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAddingPercentEncodingWithAllowedCharacters:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = &stru_1E26E9728;
    if (v9)
      v11 = (__CFString *)v9;
    v6 = v11;

    objc_autoreleasePoolPop(v7);
  }

  return v6;
}

+ (id)recipientIdentifiersFromMobileMailConversationId:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67___CDInteraction_recipientIdentifiersFromMobileMailConversationId___block_invoke;
  v7[3] = &unk_1E26E3D28;
  v5 = v4;
  v8 = v5;
  objc_msgSend(v3, "enumerateLinesUsingBlock:", v7);

  return v5;
}

- (id)metadataFromFeedbackEvent:(id)a3
{
  id v3;
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
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "derivedIntentIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "derivedIntentIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKShareSheetFeedbackMetadataKey derivedIntentIdentifier](_DKShareSheetFeedbackMetadataKey, "derivedIntentIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v7);

  }
  objc_msgSend(v3, "targetBundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v3, "targetBundleID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKShareSheetFeedbackMetadataKey targetBundleID](_DKShareSheetFeedbackMetadataKey, "targetBundleID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, v10);

  }
  objc_msgSend(v3, "extensionContextUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v3, "extensionContextUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKShareSheetFeedbackMetadataKey extensionContextUUID](_DKShareSheetFeedbackMetadataKey, "extensionContextUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v13);

  }
  objc_msgSend(v3, "attachments");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v3, "attachments");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKShareSheetFeedbackMetadataKey attachments](_DKShareSheetFeedbackMetadataKey, "attachments");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, v16);

  }
  objc_msgSend(v3, "locationUUIDs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v3, "locationUUIDs");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKShareSheetFeedbackMetadataKey locationUUIDs](_DKShareSheetFeedbackMetadataKey, "locationUUIDs");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, v19);

  }
  objc_msgSend(v3, "photoSuggestedContacts");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v3, "photoSuggestedContacts");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKShareSheetFeedbackMetadataKey photoSuggestedContacts](_DKShareSheetFeedbackMetadataKey, "photoSuggestedContacts");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, v22);

  }
  objc_msgSend(v3, "sourceBundleID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(v3, "sourceBundleID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKShareSheetFeedbackMetadataKey sourceBundleID](_DKShareSheetFeedbackMetadataKey, "sourceBundleID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v24, v25);

  }
  objc_msgSend(v3, "modelSuggestionProxies");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    objc_msgSend(v3, "modelSuggestionProxies");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKShareSheetFeedbackMetadataKey modelSuggestionProxies](_DKShareSheetFeedbackMetadataKey, "modelSuggestionProxies");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v27, v28);

  }
  objc_msgSend(v3, "adaptedModelRecipeID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend(v3, "adaptedModelRecipeID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKShareSheetFeedbackMetadataKey adaptedModelRecipeID](_DKShareSheetFeedbackMetadataKey, "adaptedModelRecipeID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v30, v31);

  }
  objc_msgSend(v3, "supportedBundleIDs");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    objc_msgSend(v3, "supportedBundleIDs");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKShareSheetFeedbackMetadataKey supportedBundleIDs](_DKShareSheetFeedbackMetadataKey, "supportedBundleIDs");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v33, v34);

  }
  objc_msgSend(v3, "reasonType");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    objc_msgSend(v3, "reasonType");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKShareSheetFeedbackMetadataKey reasonType](_DKShareSheetFeedbackMetadataKey, "reasonType");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v36, v37);

  }
  objc_msgSend(v3, "reason");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    objc_msgSend(v3, "reason");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKShareSheetFeedbackMetadataKey reason](_DKShareSheetFeedbackMetadataKey, "reason");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v39, v40);

  }
  objc_msgSend(v3, "transportBundleID");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    objc_msgSend(v3, "transportBundleID");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKShareSheetFeedbackMetadataKey transportBundleID](_DKShareSheetFeedbackMetadataKey, "transportBundleID");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v42, v43);

  }
  objc_msgSend(v3, "trackingID");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    objc_msgSend(v3, "trackingID");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKShareSheetFeedbackMetadataKey trackingID](_DKShareSheetFeedbackMetadataKey, "trackingID");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v45, v46);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "isAdaptedModelUsed"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKShareSheetFeedbackMetadataKey isAdaptedModelUsed](_DKShareSheetFeedbackMetadataKey, "isAdaptedModelUsed");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v47, v48);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "isAdaptedModelCreated"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKShareSheetFeedbackMetadataKey isAdaptedModelCreated](_DKShareSheetFeedbackMetadataKey, "isAdaptedModelCreated");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v49, v50);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v3, "indexSelected"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKShareSheetFeedbackMetadataKey indexSelected](_DKShareSheetFeedbackMetadataKey, "indexSelected");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v51, v52);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v3, "engagementType"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKShareSheetFeedbackMetadataKey engagementType](_DKShareSheetFeedbackMetadataKey, "engagementType");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v53, v54);

  v55 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "numberOfVisibleSuggestions");
  objc_msgSend(v55, "numberWithDouble:");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKShareSheetFeedbackMetadataKey numberOfVisibleSuggestions](_DKShareSheetFeedbackMetadataKey, "numberOfVisibleSuggestions");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v56, v57);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "iCloudFamilyInvocation"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKShareSheetFeedbackMetadataKey iCloudFamilyInvocation](_DKShareSheetFeedbackMetadataKey, "iCloudFamilyInvocation");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v58, v59);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v3, "peopleSuggestionsDisabled"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKShareSheetFeedbackMetadataKey peopleSuggestionsDisabled](_DKShareSheetFeedbackMetadataKey, "peopleSuggestionsDisabled");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v60, v61);

  return v4;
}

- (void)fetchAndAddShareSheetContentToInteractionWithKnowledgeStore:(id)a3
{
  NSString *targetBundleId;
  void *v5;
  NSString *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _CDAttachment *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t k;
  uint64_t v53;
  _CDAttachment *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  _CDAttachment *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t m;
  uint64_t v64;
  _CDAttachment *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  _CDAttachment *v73;
  void *v74;
  void *v75;
  void *v76;
  BOOL v77;
  int v78;
  _CDAttachment *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  _CDAttachment *v87;
  void *v88;
  NSObject *v89;
  id obj;
  uint64_t v91;
  uint64_t v92;
  char v93;
  NSObject *v94;
  id v95;
  void *v96;
  id v97;
  void *v98;
  NSObject *v99;
  _CDAttachment *v100;
  uint64_t j;
  void *v102;
  void *v103;
  NSString *v104;
  _CDInteraction *v105;
  void *v106;
  id v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  void *v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  id v124;
  _QWORD v125[4];
  id v126;
  _CDInteraction *v127;
  uint64_t *v128;
  uint64_t v129;
  uint64_t *v130;
  uint64_t v131;
  uint64_t (*v132)(uint64_t, uint64_t);
  void (*v133)(uint64_t);
  id v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  _BYTE v139[128];
  _BYTE v140[128];
  _BYTE v141[128];
  _BYTE v142[128];
  uint64_t v143;

  v143 = *MEMORY[0x1E0C80C00];
  v97 = a3;
  v105 = self;
  if (self->_mechanism == 13)
  {
    targetBundleId = self->_targetBundleId;
    +[_CDConstants shareSheetTargetBundleIdMessages]();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(targetBundleId) = -[NSString isEqualToString:](targetBundleId, "isEqualToString:", v5);

    v6 = v105->_bundleId;
    if ((_DWORD)targetBundleId)
    {
      +[_CDConstants mobileMessagesBundleId]();
      v7 = objc_claimAutoreleasedReturnValue();

      v93 = 1;
      v6 = (NSString *)v7;
      goto LABEL_6;
    }
  }
  else
  {
    v6 = self->_bundleId;
  }
  v93 = 0;
LABEL_6:
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", v6, 0);
  v104 = v6;
  objc_msgSend(MEMORY[0x1E0CA5890], "bundleProxyForIdentifier:", v6);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v137 = 0u;
    v138 = 0u;
    v135 = 0u;
    v136 = 0u;
    objc_msgSend(v106, "plugInKitPlugins");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v135, v142, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v136;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v136 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * i);
          objc_msgSend(v13, "bundleIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            objc_msgSend(v13, "protocol");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.share-services"));

            if (v16)
              objc_msgSend(v8, "addObject:", v14);
          }

        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v135, v142, 16);
      }
      while (v10);
    }

  }
  +[_CDConstants mobileMessagesBundleId]();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[NSString isEqualToString:](v104, "isEqualToString:", v17);

  if (v18)
  {
    +[_CDConstants shareSheetTargetBundleIdMessages]();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v19);

  }
  v129 = 0;
  v130 = &v129;
  v131 = 0x3032000000;
  v132 = __Block_byref_object_copy__6;
  v133 = __Block_byref_object_dispose__6;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v134 = (id)objc_claimAutoreleasedReturnValue();
  BiomeLibrary();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "ShareSheet");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "Feedback");
  v103 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v103, "publisherWithUseCase:", CFSTR("ShareSheetFeedback"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v125[0] = MEMORY[0x1E0C809B0];
  v125[1] = 3221225472;
  v125[2] = __78___CDInteraction_fetchAndAddShareSheetContentToInteractionWithKnowledgeStore___block_invoke_506;
  v125[3] = &unk_1E26E3D90;
  v95 = v8;
  v126 = v95;
  v127 = v105;
  v128 = &v129;
  v23 = (id)objc_msgSend(v22, "sinkWithCompletion:receiveInput:", &__block_literal_global_505, v125);
  v96 = v22;
  objc_msgSend((id)v130[5], "anyObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = v24;
  if (v24)
  {
    objc_msgSend(v24, "source");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "bundleID");
    v99 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v102, "metadata");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKShareSheetFeedbackMetadataKey targetBundleID](_DKShareSheetFeedbackMetadataKey, "targetBundleID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKeyedSubscript:", v27);
    v98 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v98 || !objc_msgSend(v98, "length") || !v99 || !-[NSObject length](v99, "length"))
    {
      +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
      v94 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
        -[_CDInteraction fetchAndAddShareSheetContentToInteractionWithKnowledgeStore:].cold.2();
      goto LABEL_44;
    }
    objc_msgSend(v102, "metadata");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKShareSheetFeedbackMetadataKey attachments](_DKShareSheetFeedbackMetadataKey, "attachments");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKeyedSubscript:", v29);
    v94 = objc_claimAutoreleasedReturnValue();

    if (v94)
    {
      get_PSAttachmentClass();
      v30 = objc_opt_class();
      if (!v30)
      {
        +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          -[_CDInteraction fetchAndAddShareSheetContentToInteractionWithKnowledgeStore:].cold.3(v33);
        goto LABEL_42;
      }
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), v30, 0);
      v124 = 0;
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v88, v94, &v124);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = v124;
      if (v89)
      {
        +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          -[_CDInteraction fetchAndAddShareSheetContentToInteractionWithKnowledgeStore:].cold.4();

        v33 = v89;
LABEL_42:

        v110 = 0;
LABEL_43:

LABEL_44:
        goto LABEL_45;
      }
      v110 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v31, "count"));
      v122 = 0u;
      v123 = 0u;
      v120 = 0u;
      v121 = 0u;
      obj = v31;
      v92 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v120, v141, 16);
      if (v92)
      {
        v91 = *(_QWORD *)v121;
        do
        {
          for (j = 0; j != v92; ++j)
          {
            if (*(_QWORD *)v121 != v91)
              objc_enumerationMutation(obj);
            v39 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * j);
            v40 = [_CDAttachment alloc];
            objc_msgSend(v39, "identifier");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "cloudIdentifier");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "photoLocalIdentifier");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "UTI");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "creationDate");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "contentURL");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "contentText");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v100 = -[_CDAttachment initWithIdentifier:cloudIdentifier:photoLocalIdentifier:type:sizeInBytes:creationDate:contentURL:contentText:photoSceneDescriptor:personInPhoto:](v40, "initWithIdentifier:cloudIdentifier:photoLocalIdentifier:type:sizeInBytes:creationDate:contentURL:contentText:photoSceneDescriptor:personInPhoto:", v41, v42, v43, v44, 0, v45, v46, v47, 0, 0);
            v111 = v39;

            objc_msgSend(v110, "addObject:", v100);
            objc_msgSend(v39, "peopleInPhoto");
            v48 = (void *)objc_claimAutoreleasedReturnValue();

            if (v48)
            {
              v118 = 0u;
              v119 = 0u;
              v116 = 0u;
              v117 = 0u;
              objc_msgSend(v39, "peopleInPhoto");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v116, v140, 16);
              if (v50)
              {
                v51 = *(_QWORD *)v117;
                do
                {
                  for (k = 0; k != v50; ++k)
                  {
                    if (*(_QWORD *)v117 != v51)
                      objc_enumerationMutation(v49);
                    v53 = *(_QWORD *)(*((_QWORD *)&v116 + 1) + 8 * k);
                    v54 = [_CDAttachment alloc];
                    objc_msgSend(v111, "identifier");
                    v55 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v111, "cloudIdentifier");
                    v56 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v111, "photoLocalIdentifier");
                    v57 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v111, "UTI");
                    v58 = (void *)objc_claimAutoreleasedReturnValue();
                    v59 = -[_CDAttachment initWithIdentifier:cloudIdentifier:photoLocalIdentifier:type:sizeInBytes:creationDate:contentURL:contentText:photoSceneDescriptor:personInPhoto:](v54, "initWithIdentifier:cloudIdentifier:photoLocalIdentifier:type:sizeInBytes:creationDate:contentURL:contentText:photoSceneDescriptor:personInPhoto:", v55, v56, v57, v58, 0, 0, 0, 0, 0, v53);

                    objc_msgSend(v110, "addObject:", v59);
                  }
                  v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v116, v140, 16);
                }
                while (v50);
              }

            }
            objc_msgSend(v111, "photoSceneDescriptors");
            v60 = (void *)objc_claimAutoreleasedReturnValue();

            if (v60)
            {
              v114 = 0u;
              v115 = 0u;
              v112 = 0u;
              v113 = 0u;
              objc_msgSend(v111, "photoSceneDescriptors");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v112, v139, 16);
              if (v62)
              {
                v107 = v61;
                v108 = *(_QWORD *)v113;
                do
                {
                  v109 = v62;
                  for (m = 0; m != v109; ++m)
                  {
                    if (*(_QWORD *)v113 != v108)
                      objc_enumerationMutation(v107);
                    v64 = *(_QWORD *)(*((_QWORD *)&v112 + 1) + 8 * m);
                    v65 = [_CDAttachment alloc];
                    objc_msgSend(v111, "identifier");
                    v66 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v111, "cloudIdentifier");
                    v67 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v111, "photoLocalIdentifier");
                    v68 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v111, "UTI");
                    v69 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v111, "creationDate");
                    v70 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v111, "contentURL");
                    v71 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v111, "contentText");
                    v72 = (void *)objc_claimAutoreleasedReturnValue();
                    v73 = -[_CDAttachment initWithIdentifier:cloudIdentifier:photoLocalIdentifier:type:sizeInBytes:creationDate:contentURL:contentText:photoSceneDescriptor:personInPhoto:](v65, "initWithIdentifier:cloudIdentifier:photoLocalIdentifier:type:sizeInBytes:creationDate:contentURL:contentText:photoSceneDescriptor:personInPhoto:", v66, v67, v68, v69, 0, v70, v71, v72, v64, 0);

                    objc_msgSend(v110, "addObject:", v73);
                  }
                  v61 = v107;
                  v62 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v112, v139, 16);
                }
                while (v62);
              }

            }
            objc_msgSend(v111, "contentURL");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "host");
            v75 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v111, "contentURL");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            if (v76)
              v77 = v75 == 0;
            else
              v77 = 1;
            v78 = !v77;

            if (v78)
            {
              v79 = [_CDAttachment alloc];
              objc_msgSend(v111, "identifier");
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v111, "cloudIdentifier");
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v111, "photoLocalIdentifier");
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v111, "UTI");
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v111, "creationDate");
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              v85 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v75);
              objc_msgSend(v111, "contentText");
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              v87 = -[_CDAttachment initWithIdentifier:cloudIdentifier:photoLocalIdentifier:type:sizeInBytes:creationDate:contentURL:contentText:](v79, "initWithIdentifier:cloudIdentifier:photoLocalIdentifier:type:sizeInBytes:creationDate:contentURL:contentText:", v80, v81, v82, v83, 0, v84, v85, v86);

              objc_msgSend(v110, "addObject:", v87);
            }

          }
          v92 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v120, v141, 16);
        }
        while (v92);
      }

    }
    else
    {
      v110 = 0;
    }
    +[_CDConstants shareSheetTargetBundleIdMessages]();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "isEqualToString:", v98);

    if (v35)
      -[_CDInteraction setDerivedIntentIdentifier:](v105, "setDerivedIntentIdentifier:", 0);
    v36 = (void *)objc_msgSend(v110, "copy");
    -[_CDInteraction setAttachments:](v105, "setAttachments:", v36);

    objc_msgSend(v102, "source");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "bundleID");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDInteraction setBundleId:](v105, "setBundleId:", v38);

    if ((v93 & 1) == 0)
      -[_CDInteraction setTargetBundleId:](v105, "setTargetBundleId:", v98);
    goto LABEL_43;
  }
  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v99 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
    -[_CDInteraction fetchAndAddShareSheetContentToInteractionWithKnowledgeStore:].cold.1();
LABEL_45:

  _Block_object_dispose(&v129, 8);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSDate)updateDate
{
  return self->_updateDate;
}

- (void)setUpdateDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)locationUUID
{
  return self->_locationUUID;
}

- (void)setLocationUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (int64_t)mechanism
{
  return self->_mechanism;
}

- (void)setMechanism:(int64_t)a3
{
  self->_mechanism = a3;
}

- (int64_t)direction
{
  return self->_direction;
}

- (void)setDirection:(int64_t)a3
{
  self->_direction = a3;
}

- (BOOL)isResponse
{
  return self->_isResponse;
}

- (void)setIsResponse:(BOOL)a3
{
  self->_isResponse = a3;
}

- (NSArray)keywords
{
  return self->_keywords;
}

- (void)setKeywords:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (int64_t)selfParticipantStatus
{
  return self->_selfParticipantStatus;
}

- (void)setSelfParticipantStatus:(int64_t)a3
{
  self->_selfParticipantStatus = a3;
}

- (BOOL)forcePersistInteraction
{
  return self->_forcePersistInteraction;
}

- (void)setForcePersistInteraction:(BOOL)a3
{
  self->_forcePersistInteraction = a3;
}

- (BOOL)mailShareSheetDeletionCandidate
{
  return self->_mailShareSheetDeletionCandidate;
}

- (void)setMailShareSheetDeletionCandidate:(BOOL)a3
{
  self->_mailShareSheetDeletionCandidate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_keywords, 0);
  objc_storeStrong((id *)&self->_locationUUID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_updateDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_nsUserName, 0);
  objc_storeStrong((id *)&self->_contentURL, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_domainIdentifier, 0);
  objc_storeStrong((id *)&self->_derivedIntentIdentifier, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_targetBundleId, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong(&self->_recipients, 0);
}

- (BOOL)userIsSender
{
  return -[_CDInteraction direction](self, "direction") == 1;
}

- (NSArray)peopleIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[_CDInteraction recipients](self, "recipients");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count") + 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[_CDInteraction recipients](self, "recipients", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v11, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "length");

        if (v13)
        {
          objc_msgSend(v11, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v14);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  -[_CDInteraction sender](self, "sender");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v16, "length"))
    goto LABEL_13;
  v17 = -[_CDInteraction direction](self, "direction");

  if (!v17)
  {
    -[_CDInteraction sender](self, "sender");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v16);
LABEL_13:

  }
  return (NSArray *)v5;
}

- (NSString)title
{
  void *v2;
  void *v3;

  -[_CDInteraction keywords](self, "keywords");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsJoinedByString:", CFSTR(","));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)userIsThreadInitiator
{
  return !-[_CDInteraction isResponse](self, "isResponse");
}

- (_CDInteraction)initWithINInteraction:(id)a3 bundleID:(id)a4 nsUserName:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  char isKindOfClass;
  _CDInteraction *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
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
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  objc_class *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  _CDContact *v46;
  void *v47;
  _CDContact *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t i;
  _CDContact *v53;
  void *v54;
  objc_class *v55;
  void *v56;
  char v57;
  _CDContact *v58;
  void *v59;
  _CDContact *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  id v70;
  void *v71;
  id v72;
  void *v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[_CDInteraction(INInteraction) initWithINInteraction:bundleID:nsUserName:].cold.2((uint64_t)v8, (uint64_t)v9, v11);

  if (v8)
  {
    self = -[_CDInteraction init](self, "init");
    objc_msgSend(v8, "intent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[_CDConstants mobileMessagesBundleId]();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqualToString:", v13))
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
        goto LABEL_10;
      objc_msgSend(v12, "donationMetadata");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v13, "isBusinessChat") & 1) != 0)
      {
        v15 = 0;

LABEL_50:
        goto LABEL_51;
      }
    }

LABEL_10:
    -[_CDInteraction setMechanism:](self, "setMechanism:", objc_msgSend(v12, "cd_interactionMechanism"));
    objc_msgSend(v8, "identifier");
    v16 = objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      v17 = v9;
      +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[_CDInteraction(INInteraction) initWithINInteraction:bundleID:nsUserName:].cold.1(v18);

      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "UUIDString");
      v16 = objc_claimAutoreleasedReturnValue();

      v9 = v17;
    }
    if (-[_CDInteraction mechanism](self, "mechanism") == 11 || -[_CDInteraction mechanism](self, "mechanism") == 17)
    {
      +[_CDConstants facetimeBundleId]();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CDInteraction setBundleId:](self, "setBundleId:", v20);

    }
    else
    {
      -[_CDInteraction setBundleId:](self, "setBundleId:", v9);
    }
    -[_CDInteraction bundleId](self, "bundleId");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[_CDSpotlightItemUtils interactionUUIDForSearchableItemWithUID:bundleID:](_CDSpotlightItemUtils, "interactionUUIDForSearchableItemWithUID:bundleID:", v16, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDInteraction setUuid:](self, "setUuid:", v22);

    objc_msgSend(v8, "dateInterval");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "startDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDInteraction setStartDate:](self, "setStartDate:", v24);

    objc_msgSend(v8, "dateInterval");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "endDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDInteraction setEndDate:](self, "setEndDate:", v26);

    objc_msgSend(v12, "imageForParameterNamed:", CFSTR("speakableGroupName"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "_uri");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v73 = (void *)v16;
    if (v28)
    {
      objc_msgSend(v27, "_uri");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CDInteraction setContentURL:](self, "setContentURL:", v29);
      goto LABEL_26;
    }
    objc_msgSend(v27, "_identifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      v31 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v27, "_identifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "URLWithString:", v29);
      v32 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v12, "_keyImage");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "_uri");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "_keyImage");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v35;
      if (!v34)
      {
        objc_msgSend(v35, "_identifier");
        v65 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v65)
          goto LABEL_27;
        v66 = (void *)MEMORY[0x1E0C99E98];
        objc_msgSend(v12, "_keyImage");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "_identifier");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "URLWithString:", v67);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        -[_CDInteraction setContentURL:](self, "setContentURL:", v68);

LABEL_26:
LABEL_27:
        v71 = v27;
        v72 = v10;
        objc_msgSend(v8, "groupIdentifier");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[_CDInteraction setDomainIdentifier:](self, "setDomainIdentifier:", v37);

        objc_msgSend(v12, "cd_groupName");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[_CDInteraction setGroupName:](self, "setGroupName:", v38);

        objc_msgSend(v12, "cd_derivedIntentIdentifier");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[_CDInteraction setDerivedIntentIdentifier:](self, "setDerivedIntentIdentifier:", v39);

        v40 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
        objc_msgSend(v12, "_className");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = (objc_class *)objc_opt_class();
        NSStringFromClass(v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v41, "isEqualToString:", v43) && objc_msgSend(v8, "direction") == 2)
        {
          objc_msgSend(v12, "cd_recipients");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v44, "count");

          if (v45 == 1)
          {
            v46 = [_CDContact alloc];
            objc_msgSend(v12, "cd_sender");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = -[_CDContact initWithINPerson:](v46, "initWithINPerson:", v47);
            -[_CDInteraction setSender:](self, "setSender:", v48);

LABEL_42:
            objc_msgSend(v12, "_className");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = (objc_class *)objc_opt_class();
            NSStringFromClass(v55);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = objc_msgSend(v54, "isEqualToString:", v56);

            v10 = v72;
            if ((v57 & 1) == 0)
            {
              v58 = [_CDContact alloc];
              objc_msgSend(v12, "cd_sender");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              v60 = -[_CDContact initWithINPerson:](v58, "initWithINPerson:", v59);
              -[_CDInteraction setSender:](self, "setSender:", v60);

            }
            -[_CDInteraction setRecipients:](self, "setRecipients:", v40);
            v61 = objc_msgSend(v8, "direction");
            v62 = 3;
            if (v61 == 1)
              v62 = 1;
            if (v61 == 2)
              v63 = 0;
            else
              v63 = v62;
            -[_CDInteraction setDirection:](self, "setDirection:", v63);
            -[_CDInteraction setNsUserName:](self, "setNsUserName:", v72);
            v15 = self;

            goto LABEL_50;
          }
        }
        else
        {

        }
        v76 = 0u;
        v77 = 0u;
        v74 = 0u;
        v75 = 0u;
        objc_msgSend(v12, "cd_recipients");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v74, v78, 16);
        if (v49)
        {
          v50 = v49;
          v69 = v9;
          v70 = v8;
          v51 = *(_QWORD *)v75;
          do
          {
            for (i = 0; i != v50; ++i)
            {
              if (*(_QWORD *)v75 != v51)
                objc_enumerationMutation(v47);
              v53 = -[_CDContact initWithINPerson:]([_CDContact alloc], "initWithINPerson:", *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * i));
              if (v53)
                objc_msgSend(v40, "addObject:", v53);

            }
            v50 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v74, v78, 16);
          }
          while (v50);
          v9 = v69;
          v8 = v70;
        }
        goto LABEL_42;
      }
      objc_msgSend(v35, "_uri");
      v32 = objc_claimAutoreleasedReturnValue();
    }
    v36 = (void *)v32;
    -[_CDInteraction setContentURL:](self, "setContentURL:", v32);

    goto LABEL_26;
  }
  v15 = 0;
LABEL_51:

  return v15;
}

+ (id)shareSheetInteractionFromINInteraction:(id)a3 bundleID:(id)a4 nsUserName:(id)a5 knowledgeStore:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _CDInteraction *v14;
  void *v15;
  void *v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = v12;
  v14 = 0;
  if (v9 && v10 && v12)
  {
    objc_msgSend(v9, "_contextExtensionUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v14 = -[_CDInteraction initWithINInteraction:bundleID:nsUserName:]([_CDInteraction alloc], "initWithINInteraction:bundleID:nsUserName:", v9, v10, v11);
      -[_CDInteraction setMechanism:](v14, "setMechanism:", 13);
      -[_CDInteraction fetchAndAddShareSheetContentToInteractionWithKnowledgeStore:](v14, "fetchAndAddShareSheetContentToInteractionWithKnowledgeStore:", v13);
    }
    else
    {
      v14 = 0;
    }

  }
  return v14;
}

- (void)isValidInteraction
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  v3 = 2112;
  v4 = v0;
  _os_log_fault_impl(&dword_18DDBE000, v1, OS_LOG_TYPE_FAULT, "Not recording %{sensitive}@ as it is not a valid interaction, error: %@", v2, 0x16u);
  OUTLINED_FUNCTION_5();
}

- (void)fetchAndAddShareSheetContentToInteractionWithKnowledgeStore:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, v0, v1, "No corresponding share sheet feedback for interaction %{sensitive}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)fetchAndAddShareSheetContentToInteractionWithKnowledgeStore:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, v0, v1, "Missing sharingSourceBundleID or targetBundleID on share sheet feedback for interaction %{sensitive}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)fetchAndAddShareSheetContentToInteractionWithKnowledgeStore:(os_log_t)log .cold.3(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18DDBE000, log, OS_LOG_TYPE_ERROR, "Failure to load soft-linked people suggester class when converting INInteraction to share sheet interaction", v1, 2u);
}

- (void)fetchAndAddShareSheetContentToInteractionWithKnowledgeStore:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, v0, v1, "Error unarchiving share sheet attachments: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
