@implementation NFContactlessPaymentSessionCallbacks

+ (id)interface
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  void *v25;

  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3FFEA8);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_alloc(MEMORY[0x1E0C99E60]);
  v21 = objc_opt_class();
  v0 = objc_opt_class();
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = (void *)objc_msgSend(v23, "initWithObjects:", v21, v0, v1, v2, v3, v4, v5, v6, v7, v8, objc_opt_class(), 0);
  objc_msgSend(v25, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_didPerformValueAddedServiceTransactions_, 0, 0);
  v24 = objc_alloc(MEMORY[0x1E0C99E60]);
  v22 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  v19 = (void *)objc_msgSend(v24, "initWithObjects:", v22, v10, v11, v12, v13, v14, v15, v16, v17, v18, objc_opt_class(), 0);
  objc_msgSend(v25, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel_didFelicaStateChange_, 0, 0);

  return v25;
}

@end
