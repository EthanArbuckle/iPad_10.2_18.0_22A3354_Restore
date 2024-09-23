@implementation SFSpeechProfileContainerManager

- (SFSpeechProfileContainerManager)init
{
  SFSpeechProfileContainerManager *v2;
  uint64_t v3;
  NSMutableDictionary *containerForPersona;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFSpeechProfileContainerManager;
  v2 = -[SFSpeechProfileContainerManager init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    containerForPersona = v2->_containerForPersona;
    v2->_containerForPersona = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (id)containerForCurrentPersona
{
  return 0;
}

- (id)containerForPersona:(id)a3
{
  id v4;
  SFSpeechProfileContainer *v5;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_containerForPersona, "objectForKey:", v4);
  v5 = (SFSpeechProfileContainer *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = -[SFSpeechProfileContainer initWithPersona:]([SFSpeechProfileContainer alloc], "initWithPersona:", v4);
    if (v5)
      -[NSMutableDictionary setObject:forKey:](self->_containerForPersona, "setObject:forKey:", v5, v4);
  }

  return v5;
}

- (void)releaseContainerForPersona:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_containerForPersona, "removeObjectForKey:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerForPersona, 0);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1352);
  return (id)sharedInstance_sharedManager;
}

void __49__SFSpeechProfileContainerManager_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedManager;
  sharedInstance_sharedManager = v0;

}

@end
