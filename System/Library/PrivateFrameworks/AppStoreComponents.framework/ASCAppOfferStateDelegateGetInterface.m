@implementation ASCAppOfferStateDelegateGetInterface

void __ASCAppOfferStateDelegateGetInterface_block_invoke()
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
  id v11;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF4A1AA8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ASCAppOfferStateDelegateGetInterface_interface;
  ASCAppOfferStateDelegateGetInterface_interface = v0;

  v2 = (void *)ASCAppOfferStateDelegateGetInterface_interface;
  ASCOfferGetCodableClasses();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_offer_didChangeState_withMetadata_flags_, 0, 0);

  v4 = (void *)ASCAppOfferStateDelegateGetInterface_interface;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_offer_didChangeState_withMetadata_flags_, 1, 0);

  v6 = (void *)ASCAppOfferStateDelegateGetInterface_interface;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_offer_didChangeState_withMetadata_flags_, 2, 0);

  v8 = (void *)ASCAppOfferStateDelegateGetInterface_interface;
  ASCOfferGetCodableClasses();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_offer_didChangeStatusText_, 0, 0);

  v10 = (void *)ASCAppOfferStateDelegateGetInterface_interface;
  v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_offer_didChangeStatusText_, 1, 0);

}

@end
