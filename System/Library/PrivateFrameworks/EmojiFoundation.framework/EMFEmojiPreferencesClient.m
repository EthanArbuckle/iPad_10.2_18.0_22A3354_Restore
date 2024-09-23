@implementation EMFEmojiPreferencesClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_machName, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (EMFEmojiPreferencesClient)initWithMachName:(id)a3
{
  __CFString *v4;
  EMFEmojiPreferencesClient *v5;
  EMFEmojiPreferencesClient *v6;
  objc_super v8;

  v4 = (__CFString *)a3;
  v8.receiver = self;
  v8.super_class = (Class)EMFEmojiPreferencesClient;
  v5 = -[EMFEmojiPreferences init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    if (!v4)
      v4 = CFSTR("com.apple.TextInput.emoji");
    objc_storeStrong((id *)&v5->_machName, v4);
    v6->_isValid = 0;
    -[EMFEmojiPreferencesClient createConnectionIfNecessary](v6, "createConnectionIfNecessary");
  }

  return v6;
}

- (void)createConnectionIfNecessary
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  void *v6;
  NSXPCConnection *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  if (!self->_isValid)
  {
    -[NSXPCConnection invalidate](self->_connection, "invalidate");
    connection = self->_connection;
    self->_connection = 0;

    self->_isValid = 1;
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", self->_machName, 4096);
    v5 = self->_connection;
    self->_connection = v4;

    +[EMFEmojiPreferencesClient serviceInterface](EMFEmojiPreferencesClient, "serviceInterface");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", v6);

    v7 = self->_connection;
    if (_emojiClientDispatchQueue(void)::onceToken != -1)
      dispatch_once(&_emojiClientDispatchQueue(void)::onceToken, &__block_literal_global_293);
    -[NSXPCConnection _setQueue:](v7, "_setQueue:", _emojiClientDispatchQueue(void)::__xpc_queue);
    objc_initWeak(&location, self);
    v8 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __56__EMFEmojiPreferencesClient_createConnectionIfNecessary__block_invoke;
    v11[3] = &unk_1E66FA4C0;
    objc_copyWeak(&v12, &location);
    -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", v11);
    v9[0] = v8;
    v9[1] = 3221225472;
    v9[2] = __56__EMFEmojiPreferencesClient_createConnectionIfNecessary__block_invoke_2;
    v9[3] = &unk_1E66FA4C0;
    objc_copyWeak(&v10, &location);
    -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", v9);
    -[NSXPCConnection resume](self->_connection, "resume");
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (void)dealloc
{
  NSString *machName;
  NSXPCConnection *connection;
  objc_super v5;

  machName = self->_machName;
  self->_machName = 0;

  if (self->_isValid)
  {
    -[NSXPCConnection invalidate](self->_connection, "invalidate");
    connection = self->_connection;
    self->_connection = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)EMFEmojiPreferencesClient;
  -[EMFEmojiPreferences dealloc](&v5, sel_dealloc);
}

+ (id)serviceInterface
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF0896E8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_sortedEmojis_keyword_localeIdentifier_handler_, 0, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_sortedEmojis_keyword_localeIdentifier_handler_, 0, 1);

  return v2;
}

void __56__EMFEmojiPreferencesClient_createConnectionIfNecessary__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setIsValid:", 0);

}

- (id)_initWithoutConnection
{
  EMFEmojiPreferencesClient *v2;
  EMFEmojiPreferencesClient *v3;
  NSString *machName;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EMFEmojiPreferencesClient;
  v2 = -[EMFEmojiPreferences init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    machName = v2->_machName;
    v2->_machName = (NSString *)CFSTR("com.apple.TextInput.emoji");

    v3->_isValid = 0;
  }
  return v3;
}

- (void)_disconnect
{
  NSXPCConnection *connection;
  EMFEmojiPreferencesClient *obj;

  obj = self;
  objc_sync_enter(obj);
  -[NSXPCConnection invalidate](obj->_connection, "invalidate");
  connection = obj->_connection;
  obj->_connection = 0;

  obj->_isValid = 0;
  objc_sync_exit(obj);

}

void __56__EMFEmojiPreferencesClient_createConnectionIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setIsValid:", 0);

}

- (void)didUseEmoji:(id)a3
{
  -[EMFEmojiPreferencesClient didUseEmoji:usageMode:](self, "didUseEmoji:usageMode:", a3, CFSTR("EmojiKeyboard"));
}

- (void)didUseEmoji:(id)a3 usageMode:(id)a4
{
  -[EMFEmojiPreferencesClient didUseEmoji:usageMode:typingName:](self, "didUseEmoji:usageMode:typingName:", a3, a4, 0);
}

- (void)didUseEmoji:(id)a3 usageMode:(id)a4 typingName:(id)a5
{
  -[EMFEmojiPreferencesClient didUseEmoji:usageMode:typingName:replacementContext:](self, "didUseEmoji:usageMode:typingName:replacementContext:", a3, a4, 0, 0);
}

- (void)didUseEmoji:(id)a3 usageMode:(id)a4 typingName:(id)a5 replacementContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  EMFEmojiPreferencesClient *v14;
  id *v15;
  void *v16;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = self;
  objc_sync_enter(v14);
  v15 = v14;
  objc_msgSend(v15, "createConnectionIfNecessary");
  objc_msgSend(v15[11], "remoteObjectProxy");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "didUseEmoji:usageMode:typingName:replacementContext:", v10, v11, v12, v13);

  v17.receiver = v15;
  v17.super_class = (Class)EMFEmojiPreferencesClient;
  -[EMFEmojiPreferences didUseEmoji:usageMode:typingName:](&v17, sel_didUseEmoji_usageMode_typingName_, v10, v11, v12);

  objc_sync_exit(v15);
}

- (void)didViewEmojiIndex:(int64_t)a3 forCategory:(id)a4
{
  id v6;
  EMFEmojiPreferencesClient *v7;
  id *v8;
  void *v9;
  objc_super v10;

  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  v8 = v7;
  objc_msgSend(v8, "createConnectionIfNecessary");
  objc_msgSend(v8[11], "remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "didViewEmojiIndex:forCategory:", a3, v6);

  v10.receiver = v8;
  v10.super_class = (Class)EMFEmojiPreferencesClient;
  -[EMFEmojiPreferences didViewEmojiIndex:forCategory:](&v10, sel_didViewEmojiIndex_forCategory_, a3, v6);

  objc_sync_exit(v8);
}

- (void)didDisplaySkinToneHelp
{
  EMFEmojiPreferencesClient *v2;
  id *v3;
  void *v4;
  objc_super v5;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2;
  objc_msgSend(v3, "createConnectionIfNecessary");
  objc_msgSend(v3[11], "remoteObjectProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didDisplaySkinToneHelp");

  v5.receiver = v3;
  v5.super_class = (Class)EMFEmojiPreferencesClient;
  -[EMFEmojiPreferences didDisplaySkinToneHelp](&v5, sel_didDisplaySkinToneHelp);

  objc_sync_exit(v3);
}

- (void)didUseEmoji:(id)a3 usageSource:(unint64_t)a4 replacementContext:(id)a5 searchQuery:(id)a6 resultPosition:(id)a7 numberSearchQueriesRun:(id)a8 wasPositiveEngagement:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  EMFEmojiPreferencesClient *v20;
  id *v21;
  void *v22;
  uint64_t v23;
  objc_super v24;

  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = self;
  objc_sync_enter(v20);
  v21 = v20;
  objc_msgSend(v21, "createConnectionIfNecessary");
  objc_msgSend(v21[11], "remoteObjectProxy");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v23) = a9;
  objc_msgSend(v22, "didUseEmoji:usageSource:replacementContext:searchQuery:resultPosition:numberSearchQueriesRun:wasPositiveEngagement:", v15, a4, v16, v17, v18, v19, v23);

  objc_sync_exit(v21);
  v24.receiver = v21;
  v24.super_class = (Class)EMFEmojiPreferencesClient;
  -[EMFEmojiPreferences didUseEmoji:usageMode:](&v24, sel_didUseEmoji_usageMode_, v15, 0);

}

- (void)didUseEmojiInKeyboardCandidateBar:(id)a3 replacementContext:(id)a4
{
  uint64_t v4;

  LOBYTE(v4) = 1;
  -[EMFEmojiPreferencesClient didUseEmoji:usageSource:replacementContext:searchQuery:resultPosition:numberSearchQueriesRun:wasPositiveEngagement:](self, "didUseEmoji:usageSource:replacementContext:searchQuery:resultPosition:numberSearchQueriesRun:wasPositiveEngagement:", a3, 4, a4, 0, 0, 0, v4);
}

- (void)didUseEmojiInKeyboardCandidateBar:(id)a3 candidatePosition:(id)a4 replacementContext:(id)a5
{
  uint64_t v5;

  LOBYTE(v5) = 1;
  -[EMFEmojiPreferencesClient didUseEmoji:usageSource:replacementContext:searchQuery:resultPosition:numberSearchQueriesRun:wasPositiveEngagement:](self, "didUseEmoji:usageSource:replacementContext:searchQuery:resultPosition:numberSearchQueriesRun:wasPositiveEngagement:", a3, 4, a5, 0, a4, 0, v5);
}

- (void)didUseEmojiInDictation:(id)a3 replacementContext:(id)a4
{
  uint64_t v4;

  LOBYTE(v4) = 1;
  -[EMFEmojiPreferencesClient didUseEmoji:usageSource:replacementContext:searchQuery:resultPosition:numberSearchQueriesRun:wasPositiveEngagement:](self, "didUseEmoji:usageSource:replacementContext:searchQuery:resultPosition:numberSearchQueriesRun:wasPositiveEngagement:", a3, 6, a4, 0, 0, 0, v4);
}

- (void)didUseEmojiInHandwriting:(id)a3 replacementContext:(id)a4
{
  uint64_t v4;

  LOBYTE(v4) = 1;
  -[EMFEmojiPreferencesClient didUseEmoji:usageSource:replacementContext:searchQuery:resultPosition:numberSearchQueriesRun:wasPositiveEngagement:](self, "didUseEmoji:usageSource:replacementContext:searchQuery:resultPosition:numberSearchQueriesRun:wasPositiveEngagement:", a3, 5, a4, 0, 0, 0, v4);
}

- (void)didUseEmojiInDFRBar:(id)a3 replacementContext:(id)a4
{
  uint64_t v4;

  LOBYTE(v4) = 1;
  -[EMFEmojiPreferencesClient didUseEmoji:usageSource:replacementContext:searchQuery:resultPosition:numberSearchQueriesRun:wasPositiveEngagement:](self, "didUseEmoji:usageSource:replacementContext:searchQuery:resultPosition:numberSearchQueriesRun:wasPositiveEngagement:", a3, 10, a4, 0, 0, 0, v4);
}

- (void)didUseEmojiInCharacterPickerLightweight:(id)a3 replacementContext:(id)a4
{
  uint64_t v4;

  LOBYTE(v4) = 1;
  -[EMFEmojiPreferencesClient didUseEmoji:usageSource:replacementContext:searchQuery:resultPosition:numberSearchQueriesRun:wasPositiveEngagement:](self, "didUseEmoji:usageSource:replacementContext:searchQuery:resultPosition:numberSearchQueriesRun:wasPositiveEngagement:", a3, 7, a4, 0, 0, 0, v4);
}

- (void)didUseEmojiInCharacterPickerPopover:(id)a3 finalQuery:(id)a4 resultIndex:(id)a5
{
  uint64_t v5;

  LOBYTE(v5) = 1;
  -[EMFEmojiPreferencesClient didUseEmoji:usageSource:replacementContext:searchQuery:resultPosition:numberSearchQueriesRun:wasPositiveEngagement:](self, "didUseEmoji:usageSource:replacementContext:searchQuery:resultPosition:numberSearchQueriesRun:wasPositiveEngagement:", a3, 8, 0, a4, 0, 0, v5);
}

- (void)didUseEmojiInCharacterPickerExtended:(id)a3 finalQuery:(id)a4 resultIndex:(id)a5
{
  uint64_t v5;

  LOBYTE(v5) = 1;
  -[EMFEmojiPreferencesClient didUseEmoji:usageSource:replacementContext:searchQuery:resultPosition:numberSearchQueriesRun:wasPositiveEngagement:](self, "didUseEmoji:usageSource:replacementContext:searchQuery:resultPosition:numberSearchQueriesRun:wasPositiveEngagement:", a3, 9, 0, a4, 0, 0, v5);
}

- (void)didUseEmojiInEmojiKeyboardPalette:(id)a3 wasFromRecentsSection:(BOOL)a4
{
  uint64_t v4;
  uint64_t v5;

  if (a4)
    v4 = 2;
  else
    v4 = 1;
  LOBYTE(v5) = 1;
  -[EMFEmojiPreferencesClient didUseEmoji:usageSource:replacementContext:searchQuery:resultPosition:numberSearchQueriesRun:wasPositiveEngagement:](self, "didUseEmoji:usageSource:replacementContext:searchQuery:resultPosition:numberSearchQueriesRun:wasPositiveEngagement:", a3, v4, 0, 0, 0, 0, v5);
}

- (void)didUseEmojiInEmojiKeyboardSearch:(id)a3 finalQuery:(id)a4 resultIndex:(id)a5
{
  uint64_t v5;

  LOBYTE(v5) = 1;
  -[EMFEmojiPreferencesClient didUseEmoji:usageSource:replacementContext:searchQuery:resultPosition:numberSearchQueriesRun:wasPositiveEngagement:](self, "didUseEmoji:usageSource:replacementContext:searchQuery:resultPosition:numberSearchQueriesRun:wasPositiveEngagement:", a3, 3, 0, a4, a5, 0, v5);
}

- (id)copySortedEmojis:(id)a3 keyword:(id)a4 localeIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  EMFEmojiPreferencesClient *v11;
  dispatch_semaphore_t v12;
  id *v13;
  void *v14;
  NSObject *v15;
  dispatch_time_t v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  NSObject *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__5;
  v27 = __Block_byref_object_dispose__5;
  v28 = 0;
  v11 = self;
  objc_sync_enter(v11);
  v12 = dispatch_semaphore_create(0);
  v13 = v11;
  objc_msgSend(v13, "createConnectionIfNecessary");
  objc_msgSend(v13[11], "remoteObjectProxy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __71__EMFEmojiPreferencesClient_copySortedEmojis_keyword_localeIdentifier___block_invoke;
  v20[3] = &unk_1E66FA4E8;
  v22 = &v23;
  v15 = v12;
  v21 = v15;
  objc_msgSend(v14, "sortedEmojis:keyword:localeIdentifier:handler:", v8, v9, v10, v20);

  v16 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v15, v16);

  objc_sync_exit(v13);
  v17 = (void *)v24[5];
  if (!v17)
    v17 = v8;
  v18 = v17;
  _Block_object_dispose(&v23, 8);

  return v18;
}

void __71__EMFEmojiPreferencesClient_copySortedEmojis_keyword_localeIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (NSString)machName
{
  return self->_machName;
}

- (void)setMachName:(id)a3
{
  objc_storeStrong((id *)&self->_machName, a3);
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (void)setIsValid:(BOOL)a3
{
  self->_isValid = a3;
}

@end
