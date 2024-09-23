@implementation NFSecureElementLoggingSessionInterface

+ (id)interface
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v16;

  v16 = objc_alloc(MEMORY[0x1E0C99E60]);
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = (void *)objc_msgSend(v16, "initWithObjects:", v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40E0B8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setByAddingObject:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_getLogs_forSEID_completion_, 0, 1);

  return v13;
}

@end
