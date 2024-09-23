@implementation FBKEnhancedLoggingSessionInformation

- (NSString)localizedWhenItWillGather
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[FBKEnhancedLoggingSessionInformation createdAt](self, "createdAt");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingTimeInterval:", (double)-[FBKEnhancedLoggingSessionInformation enhancedLoggingDuration](self, "enhancedLoggingDuration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceNow");
  v6 = v5;
  if (v5 >= 30.0)
  {
    +[FBKMatcherPredicate shortestDateFormatter](FBKMatcherPredicate, "shortestDateFormatter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringFromTimeInterval:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "FeedbackCore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("GATHER_IN"), CFSTR("In %@"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v11, v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "FeedbackCore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("GATHER_SOON"), CFSTR("Immediately"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v8;
}

- (FBKEnhancedLoggingSessionInformation)initWithContentItem:(id)a3 followup:(id)a4 filePredicate:(id)a5 devices:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  FBKEnhancedLoggingSessionInformation *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)FBKEnhancedLoggingSessionInformation;
  v14 = -[FBKEnhancedLoggingSessionInformation init](&v23, sel_init);
  if (v14)
  {
    if (objc_msgSend(v10, "itemType") != 4)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Enhanced logging session information must be created from feedback content items."));
    objc_msgSend(v10, "ID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKEnhancedLoggingSessionInformation setFeedbackID:](v14, "setFeedbackID:", v15);

    objc_msgSend(v10, "itemTitle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKEnhancedLoggingSessionInformation setTitle:](v14, "setTitle:", v16);

    objc_msgSend(v10, "itemSubtitle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKEnhancedLoggingSessionInformation setSubtitle:](v14, "setSubtitle:", v17);

    objc_msgSend(v10, "createdAt");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKEnhancedLoggingSessionInformation setCreatedAt:](v14, "setCreatedAt:", v18);

    objc_msgSend(v10, "updatedAt");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKEnhancedLoggingSessionInformation setUpdatedAt:](v14, "setUpdatedAt:", v19);

    -[FBKEnhancedLoggingSessionInformation setEnhancedLoggingDuration:](v14, "setEnhancedLoggingDuration:", objc_msgSend(v12, "enhancedLoggingDuration"));
    -[FBKEnhancedLoggingSessionInformation setEnhancedLoggingRetryCount:](v14, "setEnhancedLoggingRetryCount:", -[FBKEnhancedLoggingSessionInformation enhancedLoggingRetryCount](v14, "enhancedLoggingRetryCount"));
    objc_msgSend(v11, "ID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKEnhancedLoggingSessionInformation setFollowupID:](v14, "setFollowupID:", v20);

    objc_msgSend(v13, "valueForKey:", CFSTR("identifier"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKEnhancedLoggingSessionInformation setDeviceIdentifiers:](v14, "setDeviceIdentifiers:", v21);

  }
  return v14;
}

- (FBKEnhancedLoggingSessionInformation)initWithCoder:(id)a3
{
  id v4;
  FBKEnhancedLoggingSessionInformation *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)FBKEnhancedLoggingSessionInformation;
  v5 = -[FBKEnhancedLoggingSessionInformation init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("feedbackID")));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKEnhancedLoggingSessionInformation setFeedbackID:](v5, "setFeedbackID:", v6);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("followupID")));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKEnhancedLoggingSessionInformation setFollowupID:](v5, "setFollowupID:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKEnhancedLoggingSessionInformation setTitle:](v5, "setTitle:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtitle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKEnhancedLoggingSessionInformation setSubtitle:](v5, "setSubtitle:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("createdAt"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKEnhancedLoggingSessionInformation setCreatedAt:](v5, "setCreatedAt:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("updatedAt"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKEnhancedLoggingSessionInformation setUpdatedAt:](v5, "setUpdatedAt:", v11);

    v12 = (void *)MEMORY[0x24BDBCF20];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("deviceIdentifiers"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKEnhancedLoggingSessionInformation setDeviceIdentifiers:](v5, "setDeviceIdentifiers:", v15);

    -[FBKEnhancedLoggingSessionInformation setEnhancedLoggingDuration:](v5, "setEnhancedLoggingDuration:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("enhancedLoggingDuration")));
    -[FBKEnhancedLoggingSessionInformation setEnhancedLoggingRetryCount:](v5, "setEnhancedLoggingRetryCount:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("enhancedLoggingRetryCount")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[FBKEnhancedLoggingSessionInformation feedbackID](self, "feedbackID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeInteger:forKey:", objc_msgSend(v4, "integerValue"), CFSTR("feedbackID"));

  -[FBKEnhancedLoggingSessionInformation followupID](self, "followupID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeInteger:forKey:", objc_msgSend(v5, "integerValue"), CFSTR("followupID"));

  -[FBKEnhancedLoggingSessionInformation title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v6, CFSTR("title"));

  -[FBKEnhancedLoggingSessionInformation subtitle](self, "subtitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v7, CFSTR("subtitle"));

  -[FBKEnhancedLoggingSessionInformation deviceIdentifiers](self, "deviceIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v8, CFSTR("deviceIdentifiers"));

  -[FBKEnhancedLoggingSessionInformation createdAt](self, "createdAt");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v9, CFSTR("createdAt"));

  -[FBKEnhancedLoggingSessionInformation updatedAt](self, "updatedAt");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v10, CFSTR("updatedAt"));

  objc_msgSend(v11, "encodeInt64:forKey:", -[FBKEnhancedLoggingSessionInformation enhancedLoggingDuration](self, "enhancedLoggingDuration"), CFSTR("enhancedLoggingDuration"));
  objc_msgSend(v11, "encodeInt64:forKey:", -[FBKEnhancedLoggingSessionInformation enhancedLoggingRetryCount](self, "enhancedLoggingRetryCount"), CFSTR("enhancedLoggingRetryCount"));

}

- (FBKContentItem)contentItem
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  +[FBKData sharedInstance](FBKData, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentUser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v11, "ID", (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[FBKEnhancedLoggingSessionInformation feedbackID](self, "feedbackID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "isEqualToNumber:", v13))
        {
          v14 = objc_msgSend(v11, "itemType");

          if (v14 == 4)
          {
            v15 = v11;
            goto LABEL_13;
          }
        }
        else
        {

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }
  v15 = 0;
LABEL_13:

  return (FBKContentItem *)v15;
}

- (NSSet)devices
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCEF0];
  -[FBKEnhancedLoggingSessionInformation deviceIdentifiers](self, "deviceIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[FBKEnhancedLoggingSessionInformation deviceIdentifiers](self, "deviceIdentifiers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
        +[FBKDeviceManager sharedInstance](FBKDeviceManager, "sharedInstance");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "groupedDeviceWithIdentifier:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          objc_msgSend(v5, "addObject:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return (NSSet *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)feedbackID
{
  return self->_feedbackID;
}

- (void)setFeedbackID:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackID, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle, a3);
}

- (NSDate)createdAt
{
  return self->_createdAt;
}

- (void)setCreatedAt:(id)a3
{
  objc_storeStrong((id *)&self->_createdAt, a3);
}

- (NSDate)updatedAt
{
  return self->_updatedAt;
}

- (void)setUpdatedAt:(id)a3
{
  objc_storeStrong((id *)&self->_updatedAt, a3);
}

- (NSNumber)followupID
{
  return self->_followupID;
}

- (void)setFollowupID:(id)a3
{
  objc_storeStrong((id *)&self->_followupID, a3);
}

- (NSSet)deviceIdentifiers
{
  return self->_deviceIdentifiers;
}

- (void)setDeviceIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_deviceIdentifiers, a3);
}

- (int64_t)enhancedLoggingDuration
{
  return self->_enhancedLoggingDuration;
}

- (void)setEnhancedLoggingDuration:(int64_t)a3
{
  self->_enhancedLoggingDuration = a3;
}

- (int64_t)enhancedLoggingRetryCount
{
  return self->_enhancedLoggingRetryCount;
}

- (void)setEnhancedLoggingRetryCount:(int64_t)a3
{
  self->_enhancedLoggingRetryCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdentifiers, 0);
  objc_storeStrong((id *)&self->_followupID, 0);
  objc_storeStrong((id *)&self->_updatedAt, 0);
  objc_storeStrong((id *)&self->_createdAt, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_feedbackID, 0);
}

@end
