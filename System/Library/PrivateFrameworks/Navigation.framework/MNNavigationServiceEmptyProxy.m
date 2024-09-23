@implementation MNNavigationServiceEmptyProxy

- (MNNavigationServiceEmptyProxy)initWithPeer:(id)a3
{
  id v5;
  MNNavigationServiceEmptyProxy *v6;
  MNNavigationServiceEmptyProxy *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MNNavigationServiceEmptyProxy;
  v6 = -[MNNavigationServiceEmptyProxy init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_peer, a3);

  return v7;
}

- (void)forwardInvocation:(id)a3
{
  const char *v4;
  NSObject *v5;
  void *v6;
  MNNavigationServicePeer *peer;
  int v8;
  void *v9;
  __int16 v10;
  MNNavigationServicePeer *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = (const char *)objc_msgSend(a3, "selector");
  if (-[MNNavigationServiceEmptyProxy _isSelectorValidForForwarding:](self, "_isSelectorValidForForwarding:", v4))
  {
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      peer = self->_peer;
      v8 = 138412546;
      v9 = v6;
      v10 = 2112;
      v11 = peer;
      _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_ERROR, "%@ is not allowed because %@ is missing the required entitlement.", (uint8_t *)&v8, 0x16u);

    }
  }
  else
  {
    -[MNNavigationServiceEmptyProxy doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", v4);
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  objc_super v7;

  if (-[MNNavigationServiceEmptyProxy _isSelectorValidForForwarding:](self, "_isSelectorValidForForwarding:"))
  {
    objc_msgSend(MEMORY[0x1E0C99DD8], "_navigation_methodSignatureForEmptyMethod");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)MNNavigationServiceEmptyProxy;
    -[MNNavigationServiceEmptyProxy methodSignatureForSelector:](&v7, sel_methodSignatureForSelector_, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  objc_super v6;

  if (-[MNNavigationServiceEmptyProxy _isSelectorValidForForwarding:](self, "_isSelectorValidForForwarding:"))
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)MNNavigationServiceEmptyProxy;
  return -[MNNavigationServiceEmptyProxy respondsToSelector:](&v6, sel_respondsToSelector_, a3);
}

- (BOOL)_isSelectorValidForForwarding:(SEL)a3
{
  return MNProtocolDeclaresSelector(&unk_1EEED5B90, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peer, 0);
}

@end
