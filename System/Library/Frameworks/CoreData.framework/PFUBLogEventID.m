@implementation PFUBLogEventID

+ (void)initialize
{
  objc_opt_self();
}

- (PFUBLogEventID)initWithEventType:(int)a3
{
  int64_t v4;
  char v5;
  const __CFString *v6;
  PFUBLogEventID *v7;
  PFUBLogEventID *v8;
  uint64_t v9;
  NSString *v10;
  objc_super v12;

  v4 = a3;
  v5 = 0;
  v6 = CFSTR("PFUbiquitySetup");
  switch(a3)
  {
    case 0:
      break;
    case 1:
      v5 = 0;
      v6 = CFSTR("PFUbiquityTransactionExport");
      break;
    case 2:
      v5 = 0;
      v6 = CFSTR("PFUbiquityTransactionImport");
      break;
    case 3:
      v5 = 0;
      v6 = CFSTR("PFUbiquityTransactionConflict");
      break;
    case 4:
      v5 = 0;
      v6 = CFSTR("PFUbiquityBaselineRoll");
      break;
    default:
      NSLog((NSString *)CFSTR("Invalid EventType %u"), a2, a3);
      v6 = 0;
      v5 = 1;
      break;
  }
  v12.receiver = self;
  v12.super_class = (Class)PFUBLogEventID;
  v7 = -[PFUBLogEventID init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    if ((v5 & 1) != 0)
    {

      return 0;
    }
    else
    {
      v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString");
      v8->_eventType = v4;
      v10 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@:%@"), v6, v9);
      v8->_idString = v10;
      v8->_hash = +[_PFRoutines _generateUbiquityHashForPath:]((uint64_t)_PFRoutines, v10);
    }
  }
  return v8;
}

- (PFUBLogEventID)initWithCustomKey:(id)a3
{
  PFUBLogEventID *v4;
  PFUBLogEventID *v5;
  uint64_t v6;
  NSString *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PFUBLogEventID;
  v4 = -[PFUBLogEventID init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    if (a3)
    {
      v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString");
      v5->_eventType = 5;
      v7 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@:%@"), a3, v6);
      v5->_idString = v7;
      v5->_hash = +[_PFRoutines _generateUbiquityHashForPath:]((uint64_t)_PFRoutines, v7);
    }
    else
    {

      return 0;
    }
  }
  return v5;
}

- (int64_t)hash
{
  return self->_hash;
}

@end
