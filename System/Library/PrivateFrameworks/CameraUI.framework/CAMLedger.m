@implementation CAMLedger

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_5);
  return (id)sharedInstance_singleton;
}

void __27__CAMLedger_sharedInstance__block_invoke()
{
  CAMLedger *v0;
  void *v1;

  v0 = objc_alloc_init(CAMLedger);
  v1 = (void *)sharedInstance_singleton;
  sharedInstance_singleton = (uint64_t)v0;

}

- (CAMLedger)init
{
  CAMLedger *v2;
  int v3;
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  ledger_entry_info *v9;
  objc_super v11[3];
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v11[0].receiver = self;
  v11[0].super_class = (Class)CAMLedger;
  v2 = -[objc_super init](v11, sel_init);
  if (v2)
  {
    v12 = 0u;
    memset(&v11[1], 0, 32);
    getpid();
    if (!ledger())
    {
      v3 = DWORD2(v12);
      v2->_ledgerCount = *((_QWORD *)&v12 + 1);
      v4 = (char *)malloc_type_malloc(96 * v3, 0x1000040565EDBD2uLL);
      if (v4)
      {
        v5 = v4;
        if (ledger())
          goto LABEL_9;
        v2->_footprintLedgerIndex = -1;
        v6 = *((_QWORD *)&v12 + 1);
        if (*((uint64_t *)&v12 + 1) < 1)
          goto LABEL_9;
        v7 = 0;
        v8 = v5;
        while (strcmp(v8, "phys_footprint"))
        {
          ++v7;
          v8 += 96;
          if (v6 == v7)
            goto LABEL_9;
        }
        v2->_footprintLedgerIndex = v7;
        v9 = (ledger_entry_info *)malloc_type_malloc(56 * SLODWORD(v2->_ledgerCount), 0x100004021716A34uLL);
        v2->_ledgerEntries = v9;
        if (!v9)
        {
LABEL_9:

          v2 = 0;
        }
        free(v5);
      }
      else
      {

        return 0;
      }
    }
  }
  return v2;
}

- (void)dealloc
{
  ledger_entry_info *ledgerEntries;
  objc_super v4;

  ledgerEntries = self->_ledgerEntries;
  if (ledgerEntries)
    free(ledgerEntries);
  v4.receiver = self;
  v4.super_class = (Class)CAMLedger;
  -[CAMLedger dealloc](&v4, sel_dealloc);
}

- (int64_t)footprint
{
  getpid();
  if (ledger())
    return -1;
  else
    return self->_ledgerEntries[self->_footprintLedgerIndex].var0;
}

@end
