@implementation NRBluetoothPacketParserManager

- (NRBluetoothPacketParserManager)init
{
  NRBluetoothPacketParserManager *v2;
  NRBluetoothPacketParserManager *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *parserDictionary;
  NSObject *v7;
  NSObject *v8;
  _BOOL4 v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  objc_super v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)NRBluetoothPacketParserManager;
  v2 = -[NRBluetoothPacketParserManager init](&v18, sel_init);
  if (!v2)
  {
    v7 = nrCopyLogObj_506();
    v8 = v7;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v9 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

      if (!v9)
      {
LABEL_8:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v16 = _os_log_pack_fill();
        *(_DWORD *)v16 = 136446210;
        *(_QWORD *)(v16 + 4) = "-[NRBluetoothPacketParserManager init]";
        v17 = nrCopyLogObj_506();
        _NRLogAbortWithPack(v17);
      }
    }
    v10 = nrCopyLogObj_506();
    _NRLogWithArgs((uint64_t)v10, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v11, v12, v13, v14, v15, (uint64_t)");

    goto LABEL_8;
  }
  v3 = v2;
  v2->_lock._os_unfair_lock_opaque = 0;
  v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  parserDictionary = v3->_parserDictionary;
  v3->_parserDictionary = v4;

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parserDictionary, 0);
}

void __51__NRBluetoothPacketParserManager_copySharedManager__block_invoke()
{
  NRBluetoothPacketParserManager *v0;
  void *v1;

  v0 = objc_alloc_init(NRBluetoothPacketParserManager);
  v1 = (void *)copySharedManager_manager;
  copySharedManager_manager = (uint64_t)v0;

}

@end
