@implementation CUIKNotificationConflictCacheObject

+ (id)keyForNotification:(id)a3
{
  id v3;
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
  void *v15;

  v15 = (void *)MEMORY[0x1E0CB3940];
  v3 = a3;
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "event");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "calendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "event");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "event");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "endDateUnadjustedForLegacyClients");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "event");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "stringWithFormat:", CFSTR("%@ %@ %@ %@ %i"), v4, v7, v9, v11, objc_msgSend(v12, "isDetached"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (EKConflictDetails)conflictInfo
{
  return (EKConflictDetails *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConflictInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conflictInfo, 0);
}

@end
