@implementation NFSecureElementReaderSessionInterface

+ (id)interface
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40E538);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[NFSecureElementReaderSessionInterface _configureInterface:](NFSecureElementReaderSessionInterface, "_configureInterface:", v2);
  return v2;
}

+ (void)_configureInterface:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v3 = (objc_class *)MEMORY[0x1E0C99E60];
  v4 = a3;
  v15 = (id)objc_msgSend([v3 alloc], "initWithObjects:", objc_opt_class(), 0);
  v5 = objc_alloc(MEMORY[0x1E0C99E60]);
  v6 = objc_opt_class();
  v7 = (void *)objc_msgSend(v5, "initWithObjects:", v6, objc_opt_class(), 0);
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_selectApplets_completion_, 0, 0);

  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_connect_completion_, 0, 0);
  v8 = objc_alloc(MEMORY[0x1E0C99E60]);
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = (void *)objc_msgSend(v8, "initWithObjects:", v9, v10, v11, v12, v13, objc_opt_class(), 0);
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_performVAS_select_completion_, 0, 0);
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_performVAS_select_completion_, 1, 1);

}

@end
