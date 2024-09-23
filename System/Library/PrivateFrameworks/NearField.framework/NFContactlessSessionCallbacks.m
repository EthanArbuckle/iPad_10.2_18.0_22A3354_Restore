@implementation NFContactlessSessionCallbacks

+ (id)interface
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;
  id v16;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3FFD20);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_didDetectFieldNotification_, 0, 0);

  v16 = objc_alloc(MEMORY[0x1E0C99E60]);
  v15 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = (void *)objc_msgSend(v16, "initWithObjects:", v15, v4, v5, v6, v7, v8, v9, v10, v11, v12, objc_opt_class(), 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_didFelicaStateChange_, 0, 0);

  return v2;
}

@end
