@implementation PFCloudKitErrorLog

- (PFCloudKitErrorLog)init
{
  PFCloudKitErrorLog *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PFCloudKitErrorLog;
  v2 = -[PFCloudKitErrorLog init](&v4, sel_init);
  if (v2)
    v2->_entries = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  self->_entries = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitErrorLog;
  -[PFCloudKitErrorLog dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  NSMutableArray *entries;
  _QWORD v6[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PFCloudKitErrorLog;
  v3 = (void *)objc_msgSend(-[PFCloudKitErrorLog description](&v7, sel_description), "mutableCopy");
  entries = self->_entries;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__PFCloudKitErrorLog_description__block_invoke;
  v6[3] = &unk_1E1EDFA88;
  v6[4] = v3;
  -[NSMutableArray enumerateObjectsUsingBlock:](entries, "enumerateObjectsUsingBlock:", v6);
  return v3;
}

uint64_t __33__PFCloudKitErrorLog_description__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    v4 = *(_QWORD *)(a2 + 8);
    v3 = *(_QWORD *)(a2 + 16);
  }
  else
  {
    v3 = 0;
    v4 = 0;
  }
  return objc_msgSend(v2, "appendFormat:", CFSTR("\n%@: %@"), v3, v4);
}

@end
