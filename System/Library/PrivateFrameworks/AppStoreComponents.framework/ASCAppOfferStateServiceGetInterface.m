@implementation ASCAppOfferStateServiceGetInterface

void __ASCAppOfferStateServiceGetInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF4CF510);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ASCAppOfferStateServiceGetInterface_interface;
  ASCAppOfferStateServiceGetInterface_interface = v0;

  v2 = (void *)ASCAppOfferStateServiceGetInterface_interface;
  ASCOfferGetCodableClasses();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setByAddingObject:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_startObservingStateOfOffers_, 0, 0);

  v5 = (void *)ASCAppOfferStateServiceGetInterface_interface;
  ASCOfferGetCodableClasses();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setByAddingObject:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_stopObservingStateOfOffers_, 0, 0);

  v8 = (void *)ASCAppOfferStateServiceGetInterface_interface;
  ASCOfferGetCodableClasses();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_performActionOfOffer_withActivity_inContext_withReplyHandler_, 0, 0);

  v10 = (void *)ASCAppOfferStateServiceGetInterface_interface;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_performActionOfOffer_withActivity_inContext_withReplyHandler_, 1, 0);

  v12 = (void *)ASCAppOfferStateServiceGetInterface_interface;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v12, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_performActionOfOffer_withActivity_inContext_withReplyHandler_, 2, 0);

  v14 = (void *)ASCAppOfferStateServiceGetInterface_interface;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_performActionOfOffer_withActivity_inContext_withReplyHandler_, 0, 1);

  v16 = (void *)ASCAppOfferStateServiceGetInterface_interface;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v16, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_reinstallWatchAppWithID_withReplyHandler_, 0, 0);

  v18 = (void *)ASCAppOfferStateServiceGetInterface_interface;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v18, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel_reinstallWatchAppWithID_withReplyHandler_, 0, 1);

  v20 = (void *)ASCAppOfferStateServiceGetInterface_interface;
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v20, "setClasses:forSelector:argumentIndex:ofReply:", v21, sel_reinstallWatchSystemAppWithBundleID_withReplyHandler_, 0, 0);

  v22 = (void *)ASCAppOfferStateServiceGetInterface_interface;
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v22, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_reinstallWatchSystemAppWithBundleID_withReplyHandler_, 0, 1);

  v24 = (void *)ASCAppOfferStateServiceGetInterface_interface;
  v25 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v24, "setClasses:forSelector:argumentIndex:ofReply:", v25, sel_viewAppForAppDistributionOffer_, 0, 0);

}

@end
