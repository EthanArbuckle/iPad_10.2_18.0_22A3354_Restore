@implementation BSUIMapService

+ (id)sharedService
{
  objc_opt_self();
  if (qword_255E742C8 != -1)
    dispatch_once(&qword_255E742C8, &__block_literal_global);
  return (id)_MergedGlobals;
}

void __31__BSUIMapService_sharedService__block_invoke()
{
  BSUIMapService *v0;
  void *v1;
  BSUIMapService *v2;
  void *v3;
  id v4;
  objc_super v5;

  v0 = [BSUIMapService alloc];
  objc_msgSend(MEMORY[0x24BDDB110], "sharedService");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v1;
  if (v0)
  {
    v5.receiver = v0;
    v5.super_class = (Class)BSUIMapService;
    v2 = (BSUIMapService *)objc_msgSendSuper2(&v5, sel_init);
    v0 = v2;
    if (v2)
      objc_storeStrong((id *)&v2->_mapService, v1);
  }

  v3 = (void *)_MergedGlobals;
  _MergedGlobals = (uint64_t)v0;

}

- (_BSUIMapServiceTicket)ticketForBrandLookupWithIMessageUid:(uint64_t)a1
{
  void *v2;
  _BSUIMapServiceTicket *v3;
  id v4;
  _BSUIMapServiceTicket *v5;
  objc_super v7;

  if (!a1)
    return (_BSUIMapServiceTicket *)0;
  objc_msgSend(*(id *)(a1 + 8), "ticketForBrandLookupWithIMessageUid:traits:", a2, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = [_BSUIMapServiceTicket alloc];
  v4 = v2;
  if (v3)
  {
    v7.receiver = v3;
    v7.super_class = (Class)_BSUIMapServiceTicket;
    v5 = (_BSUIMapServiceTicket *)objc_msgSendSuper2(&v7, sel_init);
    v3 = v5;
    if (v5)
      objc_storeStrong((id *)&v5->_serviceTicket, v2);
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapService, 0);
}

@end
