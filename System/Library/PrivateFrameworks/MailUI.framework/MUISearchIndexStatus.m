@implementation MUISearchIndexStatus

- (BOOL)isVisible
{
  void *v3;
  void *v4;
  NSObject *v5;
  unint64_t v6;
  float v7;
  float v8;
  unint64_t v9;
  unint64_t v10;
  int v11;
  NSObject *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D1E360], "getValueForKey:", CFSTR("min-messages-for-search-index-visibility"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1E360], "getValueForKey:", CFSTR("max-indexing-ratio-for-search-index-visibility"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  EMLogSearchableIndexStatus();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138543618;
    v15 = v3;
    v16 = 2114;
    v17 = v4;
    _os_log_impl(&dword_1D5522000, v5, OS_LOG_TYPE_DEFAULT, "Server Config:: MinMessageToIndex:%{public}@ MaxIndexedToTotalRatio:%{public}@", (uint8_t *)&v14, 0x16u);
  }

  if (!v3)
  {
    v6 = 100;
    if (v4)
      goto LABEL_5;
LABEL_7:
    v8 = 0.95;
    goto LABEL_8;
  }
  v6 = objc_msgSend(v3, "unsignedIntegerValue");
  if (!v4)
    goto LABEL_7;
LABEL_5:
  objc_msgSend(v4, "floatValue");
  v8 = v7;
LABEL_8:
  v9 = -[MUISearchIndexStatus messagesIndexed](self, "messagesIndexed");
  v10 = -[MUISearchIndexStatus totalMessages](self, "totalMessages");
  if (-[MUISearchIndexStatus messagesIndexed](self, "messagesIndexed") <= v6 || (float)((float)v9 / (float)v10) >= v8)
    v11 = 0;
  else
    v11 = _os_feature_enabled_impl() ^ 1;
  EMLogSearchableIndexStatus();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 67109120;
    LODWORD(v15) = v11;
    _os_log_impl(&dword_1D5522000, v12, OS_LOG_TYPE_DEFAULT, "Indexing Status Visible:%{BOOL}d", (uint8_t *)&v14, 8u);
  }

  return v11;
}

- (float)progress
{
  float v3;

  if (!-[MUISearchIndexStatus totalMessages](self, "totalMessages"))
    return 1.0;
  v3 = (float)-[MUISearchIndexStatus messagesIndexed](self, "messagesIndexed");
  return v3 / (float)-[MUISearchIndexStatus totalMessages](self, "totalMessages");
}

- (MUISearchIndexStatus)initWithMessagesIndexed:(unint64_t)a3 totalMessages:(unint64_t)a4 messagesInLargestRemoteAccount:(unint64_t)a5 paused:(BOOL)a6
{
  MUISearchIndexStatus *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MUISearchIndexStatus;
  result = -[MUISearchIndexStatus init](&v11, sel_init);
  if (result)
  {
    result->_messagesIndexed = a3;
    result->_totalMessages = a4;
    result->_messagesInLargestRemoteAccount = a5;
    result->_isPaused = a6;
  }
  return result;
}

- (MUISearchIndexStatus)init
{
  return -[MUISearchIndexStatus initWithMessagesIndexed:totalMessages:messagesInLargestRemoteAccount:paused:](self, "initWithMessagesIndexed:totalMessages:messagesInLargestRemoteAccount:paused:", 0, 0, 0, 0);
}

- (BOOL)isEqual:(id)a3
{
  MUISearchIndexStatus *v4;
  MUISearchIndexStatus *v5;
  _BOOL4 v6;
  BOOL v7;
  float v8;
  float v9;
  float v10;

  v4 = (MUISearchIndexStatus *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[MUISearchIndexStatus isPaused](self, "isPaused");
      if (v6 == -[MUISearchIndexStatus isPaused](v5, "isPaused"))
      {
        -[MUISearchIndexStatus progress](self, "progress");
        v9 = v8;
        -[MUISearchIndexStatus progress](v5, "progress");
        v7 = v9 == v10;
      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (BOOL)isPaused
{
  return self->_isPaused;
}

- (void)setIsPaused:(BOOL)a3
{
  self->_isPaused = a3;
}

- (unint64_t)messagesIndexed
{
  return self->_messagesIndexed;
}

- (void)setMessagesIndexed:(unint64_t)a3
{
  self->_messagesIndexed = a3;
}

- (unint64_t)totalMessages
{
  return self->_totalMessages;
}

- (void)setTotalMessages:(unint64_t)a3
{
  self->_totalMessages = a3;
}

- (unint64_t)messagesInLargestRemoteAccount
{
  return self->_messagesInLargestRemoteAccount;
}

@end
