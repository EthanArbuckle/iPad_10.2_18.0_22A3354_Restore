@implementation ATXNotificationsInterface

- (id)extractMetadata
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_numSuppActions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXNotificationsInterface createArchivedMetadata:categoryId:title:subtitle:message:numSuppActions:feed:](ATXNotificationsInterface, "createArchivedMetadata:categoryId:title:subtitle:message:numSuppActions:feed:", self->_sectionID, self->_topic, self->_title, self->_subtitle, self->_message, v3, self->_feed);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)createArchivedMetadata:(id)a3 categoryId:(id)a4 title:(id)a5 subtitle:(id)a6 message:(id)a7 numSuppActions:(id)a8 feed:(unint64_t)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = (void *)objc_opt_new();
  v21 = v20;
  if (v14)
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v14, CFSTR("appName"));
  if (v15)
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v15, CFSTR("categoryID"));
  if (v16)
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v16, CFSTR("title"));
  if (v17)
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v17, CFSTR("subtitle"));
  if (v18)
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v18, CFSTR("message"));
  if (v19)
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v19, CFSTR("numSuppActions"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, CFSTR("feed"));

  v23 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "numberWithInteger:", objc_msgSend(v24, "secondsFromGMT"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v25, CFSTR("tz"));

  return v21;
}

+ (void)stripContentInMetadata:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("title"));
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("subtitle"));
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("message"));

}

+ (id)getBundleIdFromMetadata:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("appName"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = CFSTR("unknown");
  v5 = v3;

  return v5;
}

+ (id)getTopicFromMetadata:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("categoryID"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = CFSTR("unknown");
  v5 = v3;

  return v5;
}

+ (id)getTitleFromMetadata:(id)a3
{
  return (id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("title"));
}

+ (id)getSubtitleFromMetadata:(id)a3
{
  return (id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("subtitle"));
}

+ (id)getMessageFromMetadata:(id)a3
{
  return (id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("message"));
}

+ (id)getNumSuppActionsFromMetadata:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("numSuppActions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = &unk_24F87C768;
  v5 = v3;

  return v5;
}

+ (id)getTimezoneFromMetadata:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("tz"));
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4
    && (v5 = (void *)v4,
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("tz")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v6,
        v5,
        (isKindOfClass & 1) != 0))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("tz"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "numberWithInteger:", objc_msgSend(v10, "secondsFromGMT"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

+ (unint64_t)getFeedFromMetadata:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  unint64_t v7;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("feed"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = &unk_24F87C768;
  if (v3)
    v5 = (void *)v3;
  v6 = v5;

  v7 = objc_msgSend(v6, "unsignedIntegerValue");
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *sectionID;
  id v5;

  sectionID = self->_sectionID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", sectionID, CFSTR("appName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_topic, CFSTR("categoryID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subtitle, CFSTR("subtitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_message, CFSTR("message"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_publicationDate, CFSTR("pubdate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_numSuppActions, CFSTR("numSuppActions"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_feed, CFSTR("feed"));

}

- (ATXNotificationsInterface)initWithCoder:(id)a3
{
  id v4;
  ATXNotificationsInterface *v5;
  uint64_t v6;
  NSString *sectionID;
  uint64_t v8;
  NSString *topic;
  uint64_t v10;
  NSString *title;
  uint64_t v12;
  NSString *subtitle;
  uint64_t v14;
  NSString *message;
  uint64_t v16;
  NSDate *publicationDate;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ATXNotificationsInterface;
  v5 = -[ATXNotificationsInterface init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appName"));
    v6 = objc_claimAutoreleasedReturnValue();
    sectionID = v5->_sectionID;
    v5->_sectionID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("categoryID"));
    v8 = objc_claimAutoreleasedReturnValue();
    topic = v5->_topic;
    v5->_topic = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v10 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtitle"));
    v12 = objc_claimAutoreleasedReturnValue();
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("message"));
    v14 = objc_claimAutoreleasedReturnValue();
    message = v5->_message;
    v5->_message = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pubdate"));
    v16 = objc_claimAutoreleasedReturnValue();
    publicationDate = v5->_publicationDate;
    v5->_publicationDate = (NSDate *)v16;

    v5->_numSuppActions = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("numSuppActions"));
    v5->_feed = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("feed"));
  }

  return v5;
}

- (NSString)sectionID
{
  return self->_sectionID;
}

- (void)setSectionID:(id)a3
{
  objc_storeStrong((id *)&self->_sectionID, a3);
}

- (NSString)topic
{
  return self->_topic;
}

- (void)setTopic:(id)a3
{
  objc_storeStrong((id *)&self->_topic, a3);
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

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (NSDate)publicationDate
{
  return self->_publicationDate;
}

- (void)setPublicationDate:(id)a3
{
  objc_storeStrong((id *)&self->_publicationDate, a3);
}

- (unint64_t)numSuppActions
{
  return self->_numSuppActions;
}

- (void)setNumSuppActions:(unint64_t)a3
{
  self->_numSuppActions = a3;
}

- (unint64_t)feed
{
  return self->_feed;
}

- (void)setFeed:(unint64_t)a3
{
  self->_feed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicationDate, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_sectionID, 0);
}

@end
