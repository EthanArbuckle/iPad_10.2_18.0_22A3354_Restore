@implementation NFReaderSessionInterface

+ (id)interface
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E041D8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_configureInterface:", v3);
  return v3;
}

+ (void)_configureInterface:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v3 = (objc_class *)MEMORY[0x24BDBCF20];
  v4 = a3;
  v13 = (id)objc_msgSend([v3 alloc], "initWithObjects:", objc_opt_class(), 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_connect_completion_, 0, 0);
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_connect_completion_, 0, 1);
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_transceive_completion_, 0, 1);
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_ndefWrite_completion_, 0, 0);
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_ndefReadWithCompletion_, 1, 1);
  v6 = objc_alloc(MEMORY[0x24BDBCF20]);
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = (void *)objc_msgSend(v6, "initWithObjects:", v7, v8, v9, v10, v11, objc_opt_class(), 0);
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_performVAS_completion_, 0, 0);
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_performVAS_completion_, 1, 1);

}

@end
