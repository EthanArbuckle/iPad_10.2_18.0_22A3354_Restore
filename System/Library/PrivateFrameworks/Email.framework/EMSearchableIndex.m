@implementation EMSearchableIndex

+ (id)remoteInterface
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF25FD90);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_reindexSearchableItemsWithIdentifiers_acknowledgementHandler_, 0, 0);

  return v5;
}

- (EMSearchableIndex)initWithRemoteConnection:(id)a3
{
  id v5;
  EMSearchableIndex *v6;
  EMSearchableIndex *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EMSearchableIndex;
  v6 = -[EMSearchableIndex init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_connection, a3);

  return v7;
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__EMSearchableIndex_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_35 != -1)
    dispatch_once(&log_onceToken_35, block);
  return (OS_os_log *)(id)log_log_35;
}

void __24__EMSearchableIndex_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_35;
  log_log_35 = (uint64_t)v1;

}

+ (id)attachmentPersistentIDFromItemIdentifier:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("attachment:")) & 1) != 0)
  {
    objc_msgSend(v3, "substringFromIndex:", objc_msgSend(CFSTR("attachment:"), "length"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)richLinkItemIdentifierFromSearchableItemIdentifier:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("richLink:")) & 1) != 0)
  {
    objc_msgSend(v3, "substringFromIndex:", objc_msgSend(CFSTR("richLink:"), "length"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)persistentIDForSearchableItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;

  v3 = a3;
  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMSearchableIndex attachmentPersistentIDFromItemIdentifier:](EMSearchableIndex, "attachmentPersistentIDFromItemIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    +[EMSearchableIndex richLinkItemIdentifierFromSearchableItemIdentifier:](EMSearchableIndex, "richLinkItemIdentifierFromSearchableItemIdentifier:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      goto LABEL_9;
  }
  objc_msgSend(v3, "attributeSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "relatedUniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v3, "attributeSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "relatedUniqueIdentifier");
    v10 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v10;
  }
  else
  {
    +[EMSearchableIndex log](EMSearchableIndex, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[EMSearchableIndex persistentIDForSearchableItem:].cold.1((uint64_t)v4, v11);

    v4 = 0;
  }
LABEL_9:

  return v4;
}

- (void)reindexSearchableItemsWithIdentifiers:(id)a3 acknowledgementHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[EMSearchableIndex connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reattemptingRemoteObjectProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reindexSearchableItemsWithIdentifiers:acknowledgementHandler:", v9, v6);

}

- (void)reindexAllSearchableItemsWithAcknowledgementHandler:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[EMSearchableIndex connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reattemptingRemoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reindexAllSearchableItemsWithAcknowledgementHandler:", v6);

}

- (void)indexSummaries:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[EMSearchableIndex connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reattemptingRemoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexSummaries:", v6);

}

- (EMRemoteConnection)connection
{
  return (EMRemoteConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

+ (void)persistentIDForSearchableItem:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1B99BB000, a2, OS_LOG_TYPE_ERROR, "Encountered a searchable item %{public}@ without a relatedUniqueIdentifier message ID indexed", (uint8_t *)&v2, 0xCu);
}

@end
