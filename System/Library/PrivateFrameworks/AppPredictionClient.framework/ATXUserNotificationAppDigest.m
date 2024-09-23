@implementation ATXUserNotificationAppDigest

- (ATXUserNotificationAppDigest)initWithBundleId:(id)a3 appMarqueeGroups:(id)a4 nonAppMarqueeGroups:(id)a5
{
  id v8;
  id v9;
  id v10;
  ATXUserNotificationAppDigest *v11;
  uint64_t v12;
  NSString *bundleId;
  uint64_t v14;
  NSArray *appMarqueeGroups;
  uint64_t v16;
  NSArray *nonAppMarqueeGroups;
  uint64_t v18;
  NSArray *groups;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)ATXUserNotificationAppDigest;
  v11 = -[ATXUserNotificationAppDigest init](&v21, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    bundleId = v11->_bundleId;
    v11->_bundleId = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    appMarqueeGroups = v11->_appMarqueeGroups;
    v11->_appMarqueeGroups = (NSArray *)v14;

    v16 = objc_msgSend(v10, "copy");
    nonAppMarqueeGroups = v11->_nonAppMarqueeGroups;
    v11->_nonAppMarqueeGroups = (NSArray *)v16;

    objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v10);
    v18 = objc_claimAutoreleasedReturnValue();
    groups = v11->_groups;
    v11->_groups = (NSArray *)v18;

  }
  return v11;
}

- (id)initFromJSON:(id)a3
{
  id v4;
  id v5;
  ATXUserNotificationAppDigest *v6;

  v4 = a3;
  v5 = -[ATXPBUserNotificationAppDigest initFromJSON:]([ATXPBUserNotificationAppDigest alloc], "initFromJSON:", v4);

  v6 = -[ATXUserNotificationAppDigest initWithProto:](self, "initWithProto:", v5);
  return v6;
}

- (id)jsonRepresentation
{
  void *v2;
  void *v3;

  -[ATXUserNotificationAppDigest proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "jsonRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ATXUserNotificationAppDigest)initWithProtoData:(id)a3
{
  id v4;
  ATXPBUserNotificationAppDigest *v5;
  ATXUserNotificationAppDigest *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBUserNotificationAppDigest initWithData:]([ATXPBUserNotificationAppDigest alloc], "initWithData:", v4);

    self = -[ATXUserNotificationAppDigest initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXUserNotificationAppDigest proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ATXUserNotificationAppDigest)initWithProto:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  ATXUserNotificationAppDigest *v11;
  NSObject *v12;

  v4 = a3;
  if (!v4)
  {
LABEL_7:
    v11 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_notification_management();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[ATXDigestTimeline initWithProto:].cold.1((uint64_t)self, v12);

    goto LABEL_7;
  }
  v5 = v4;
  objc_msgSend(v5, "bundleId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appMarqueeGroups");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXUserNotificationDigestNotificationGroup groupsFromProtos:](ATXUserNotificationDigestNotificationGroup, "groupsFromProtos:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nonAppMarqueeGroups");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[ATXUserNotificationDigestNotificationGroup groupsFromProtos:](ATXUserNotificationDigestNotificationGroup, "groupsFromProtos:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  self = -[ATXUserNotificationAppDigest initWithBundleId:appMarqueeGroups:nonAppMarqueeGroups:](self, "initWithBundleId:appMarqueeGroups:nonAppMarqueeGroups:", v6, v8, v10);

  v11 = self;
LABEL_8:

  return v11;
}

- (id)proto
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setBundleId:", self->_bundleId);
  +[ATXUserNotificationDigestNotificationGroup protosFromGroups:](ATXUserNotificationDigestNotificationGroup, "protosFromGroups:", self->_appMarqueeGroups);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAppMarqueeGroups:", v4);

  +[ATXUserNotificationDigestNotificationGroup protosFromGroups:](ATXUserNotificationDigestNotificationGroup, "protosFromGroups:", self->_nonAppMarqueeGroups);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNonAppMarqueeGroups:", v5);

  return v3;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSArray)appMarqueeGroups
{
  return self->_appMarqueeGroups;
}

- (NSArray)nonAppMarqueeGroups
{
  return self->_nonAppMarqueeGroups;
}

- (NSArray)groups
{
  return self->_groups;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_nonAppMarqueeGroups, 0);
  objc_storeStrong((id *)&self->_appMarqueeGroups, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end
