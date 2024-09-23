@implementation EMFEmojiPreferencesService

+ (id)sharedServiceWithMachName:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  EMFEmojiPreferencesService *v5;

  v3 = (__CFString *)a3;
  if (v3)
    v4 = v3;
  else
    v4 = CFSTR("com.apple.TextInput.emoji");
  if (+[EMFEmojiPreferencesService sharedServiceWithMachName:]::onceToken != -1)
    dispatch_once(&+[EMFEmojiPreferencesService sharedServiceWithMachName:]::onceToken, &__block_literal_global_266);
  objc_msgSend((id)+[EMFEmojiPreferencesService sharedServiceWithMachName:]::_services, "objectForKey:", v4);
  v5 = (EMFEmojiPreferencesService *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = -[EMFEmojiPreferencesService initWithMachName:]([EMFEmojiPreferencesService alloc], "initWithMachName:", v4);
    objc_msgSend((id)+[EMFEmojiPreferencesService sharedServiceWithMachName:]::_services, "setObject:forKey:", v5, v4);
  }

  return v5;
}

void __56__EMFEmojiPreferencesService_sharedServiceWithMachName___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
  v1 = (void *)+[EMFEmojiPreferencesService sharedServiceWithMachName:]::_services;
  +[EMFEmojiPreferencesService sharedServiceWithMachName:]::_services = v0;

}

- (EMFEmojiPreferencesService)initWithMachName:(id)a3
{
  id v4;
  EMFEmojiPreferencesService *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *dispatchQueue;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  NSXPCListener *listener;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EMFEmojiPreferencesService;
  v5 = -[EMFEmojiPreferencesService init](&v13, sel_init);
  if (v5)
  {
    v6 = dispatch_queue_create("com.apple.TextInput.emoji", 0);
    dispatchQueue = v5->_dispatchQueue;
    v5->_dispatchQueue = (OS_dispatch_queue *)v6;

    v8 = v5->_dispatchQueue;
    dispatch_get_global_queue(2, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_set_target_queue(v8, v9);

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", v4);
    listener = v5->_listener;
    v5->_listener = (NSXPCListener *)v10;

    -[NSXPCListener setDelegate:](v5->_listener, "setDelegate:", v5);
    -[NSXPCListener _setQueue:](v5->_listener, "_setQueue:", v5->_dispatchQueue);
    -[NSXPCListener resume](v5->_listener, "resume");
  }

  return v5;
}

- (void)dealloc
{
  NSXPCListener *listener;
  EMFEmojiPreferences *preferences;
  objc_super v5;

  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", 0);
  -[NSXPCListener invalidate](self->_listener, "invalidate");
  listener = self->_listener;
  self->_listener = 0;

  preferences = self->_preferences;
  self->_preferences = 0;

  v5.receiver = self;
  v5.super_class = (Class)EMFEmojiPreferencesService;
  -[EMFEmojiPreferencesService dealloc](&v5, sel_dealloc);
}

- (void)_createPreferencesIfNecessary
{
  EMFEmojiPreferences *v3;
  EMFEmojiPreferences *preferences;

  if (!self->_preferences)
  {
    v3 = objc_alloc_init(EMFEmojiPreferences);
    preferences = self->_preferences;
    self->_preferences = v3;

    -[EMFEmojiPreferences readEmojiDefaults](self->_preferences, "readEmojiDefaults");
  }
}

- (EMFEmojiPreferences)preferences
{
  -[EMFEmojiPreferencesService _createPreferencesIfNecessary](self, "_createPreferencesIfNecessary");
  return self->_preferences;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v11[5];
  _QWORD v12[5];

  v5 = a4;
  -[EMFEmojiPreferencesService _createPreferencesIfNecessary](self, "_createPreferencesIfNecessary");
  -[EMFEmojiPreferencesService preferences](self, "preferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedObject:", v6);

  +[EMFEmojiPreferencesClient serviceInterface](EMFEmojiPreferencesClient, "serviceInterface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedInterface:", v7);

  -[EMFEmojiPreferencesService dispatchQueue](self, "dispatchQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setQueue:", v8);

  v9 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__EMFEmojiPreferencesService_listener_shouldAcceptNewConnection___block_invoke;
  v12[3] = &unk_1E66FA310;
  v12[4] = self;
  objc_msgSend(v5, "setInterruptionHandler:", v12);
  v11[0] = v9;
  v11[1] = 3221225472;
  v11[2] = __65__EMFEmojiPreferencesService_listener_shouldAcceptNewConnection___block_invoke_2;
  v11[3] = &unk_1E66FA310;
  v11[4] = self;
  objc_msgSend(v5, "setInvalidationHandler:", v11);
  objc_msgSend(v5, "resume");

  return 1;
}

uint64_t __65__EMFEmojiPreferencesService_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "writeEmojiDefaults");
}

uint64_t __65__EMFEmojiPreferencesService_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "writeEmojiDefaults");
}

- (void)setPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_preferences, a3);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end
