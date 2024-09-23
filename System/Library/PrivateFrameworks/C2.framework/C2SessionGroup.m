@implementation C2SessionGroup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unpinnedSession, 0);
  objc_storeStrong((id *)&self->_pinnedSession, 0);
  objc_storeStrong((id *)&self->_pinnedSessionAllowingExpiredDNS, 0);
  objc_storeStrong((id *)&self->_configurationName, 0);
}

- (NSArray)sessions
{
  id v4;
  void *v6;

  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("C2SessionGroup.m"), 55, CFSTR("Failed to alloc sessions array"));

  }
  if (self->_pinnedSessionAllowingExpiredDNS)
    objc_msgSend(v4, "addObject:");
  if (self->_pinnedSession)
    objc_msgSend(v4, "addObject:");
  if (self->_unpinnedSession)
    objc_msgSend(v4, "addObject:");
  return (NSArray *)v4;
}

- (BOOL)removeSession:(id)a3
{
  C2Session *v4;
  C2Session *v5;
  C2Session **p_pinnedSessionAllowingExpiredDNS;
  C2Session **p_unpinnedSession;
  C2Session *unpinnedSession;
  BOOL v9;

  v4 = (C2Session *)a3;
  v5 = v4;
  p_pinnedSessionAllowingExpiredDNS = &self->_pinnedSessionAllowingExpiredDNS;
  if (self->_pinnedSessionAllowingExpiredDNS == v4)
    goto LABEL_6;
  p_pinnedSessionAllowingExpiredDNS = &self->_pinnedSession;
  if (self->_pinnedSession == v4)
    goto LABEL_6;
  unpinnedSession = self->_unpinnedSession;
  p_unpinnedSession = &self->_unpinnedSession;
  if (unpinnedSession == v4)
  {
    p_pinnedSessionAllowingExpiredDNS = p_unpinnedSession;
LABEL_6:
    *p_pinnedSessionAllowingExpiredDNS = 0;

    v9 = 1;
    goto LABEL_7;
  }
  v9 = 0;
LABEL_7:

  return v9;
}

- (NSString)configurationName
{
  return self->_configurationName;
}

- (BOOL)isEmpty
{
  void *v2;
  BOOL v3;

  -[C2SessionGroup sessions](self, "sessions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

- (id)sessionForOptions:(id)a3
{
  id v4;
  C2Session *v5;

  v4 = a3;
  v5 = self->_pinnedSessionAllowingExpiredDNS;
  if (!v5
    && ((objc_msgSend(v4, "allowExpiredDNSBehavior") & 1) != 0 || (v5 = self->_pinnedSession) == 0))
  {
    if ((objc_msgSend(v4, "allowExpiredDNSBehavior") & 1) != 0 || (objc_msgSend(v4, "tlsPinning") & 1) != 0)
      v5 = 0;
    else
      v5 = self->_unpinnedSession;
  }

  return v5;
}

- (void)setSession:(id)a3 forOptions:(id)a4
{
  id v8;
  C2Session **p_pinnedSessionAllowingExpiredDNS;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  if (objc_msgSend(v8, "allowExpiredDNSBehavior"))
  {
    p_pinnedSessionAllowingExpiredDNS = &self->_pinnedSessionAllowingExpiredDNS;
    if (self->_pinnedSessionAllowingExpiredDNS)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("C2SessionGroup.m"), 42, CFSTR("_pinnedSessionAllowingExpiredDNS already present for options %@"), v8, v12);
LABEL_11:

    }
  }
  else if (objc_msgSend(v8, "tlsPinning"))
  {
    if (self->_pinnedSessionAllowingExpiredDNS)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("C2SessionGroup.m"), 45, CFSTR("_pinnedSession already present for options %@"), v8, v12);

    }
    p_pinnedSessionAllowingExpiredDNS = &self->_pinnedSession;
  }
  else
  {
    p_pinnedSessionAllowingExpiredDNS = &self->_unpinnedSession;
    if (self->_unpinnedSession)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("C2SessionGroup.m"), 48, CFSTR("_pinnedSession already present for options %@"), v8, v12);
      goto LABEL_11;
    }
  }
  objc_storeStrong((id *)p_pinnedSessionAllowingExpiredDNS, a3);

}

- (C2SessionGroup)initWithConfigurationName:(id)a3
{
  id v5;
  C2SessionGroup *v6;
  C2SessionGroup *v7;
  C2SessionGroup *v8;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)C2SessionGroup;
    v6 = -[C2SessionGroup init](&v10, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_configurationName, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)setConfigurationName:(id)a3
{
  objc_storeStrong((id *)&self->_configurationName, a3);
}

- (C2Session)pinnedSessionAllowingExpiredDNS
{
  return self->_pinnedSessionAllowingExpiredDNS;
}

- (void)setPinnedSessionAllowingExpiredDNS:(id)a3
{
  objc_storeStrong((id *)&self->_pinnedSessionAllowingExpiredDNS, a3);
}

- (C2Session)pinnedSession
{
  return self->_pinnedSession;
}

- (void)setPinnedSession:(id)a3
{
  objc_storeStrong((id *)&self->_pinnedSession, a3);
}

- (C2Session)unpinnedSession
{
  return self->_unpinnedSession;
}

- (void)setUnpinnedSession:(id)a3
{
  objc_storeStrong((id *)&self->_unpinnedSession, a3);
}

@end
