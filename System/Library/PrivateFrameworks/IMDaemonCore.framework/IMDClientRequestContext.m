@implementation IMDClientRequestContext

- (IMDClientRequestContext)initWithListenerID:(id)a3 auditToken:(id *)a4 capabilities:(unint64_t)a5 replyProxy:(id)a6
{
  id v10;
  id v11;
  IMDClientRequestContext *v12;
  uint64_t v13;
  NSString *listenerID;
  __int128 v15;

  v10 = a3;
  v11 = a6;
  v12 = -[IMDClientRequestContext init](self, "init");
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    listenerID = v12->_listenerID;
    v12->_listenerID = (NSString *)v13;

    v12->_capabilities = a5;
    objc_storeStrong((id *)&v12->_replyProxy, a6);
    v15 = *(_OWORD *)&a4->var0[4];
    *(_OWORD *)v12->_auditToken.val = *(_OWORD *)a4->var0;
    *(_OWORD *)&v12->_auditToken.val[4] = v15;
  }

  return v12;
}

+ (void)setCurrentContext:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0CB3978];
  v4 = a3;
  objc_msgSend(v3, "currentThread");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "threadDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("com.apple.messages.IMDClientRequestContext.currentContext"));

}

- (IMDaemonListenerProtocol)replyProxy
{
  return self->_replyProxy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyProxy, 0);
  objc_storeStrong((id *)&self->_listenerID, 0);
}

+ (IMDClientRequestContext)currentContext
{
  void *v2;
  void *v3;
  void *v4;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("com.apple.messages.IMDClientRequestContext.currentContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("No instance IMDClientRequestContext available for current thread, -currentContext caller may not be within a client request handler"), 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  return (IMDClientRequestContext *)v4;
}

- (NSString)listenerID
{
  return self->_listenerID;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var0[4];
  *(_OWORD *)retstr->var0 = *(_OWORD *)self[1].var0;
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (unint64_t)capabilities
{
  return self->_capabilities;
}

@end
