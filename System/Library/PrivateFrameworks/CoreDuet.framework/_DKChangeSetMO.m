@implementation _DKChangeSetMO

+ (id)fetchAdditionChangeSetRequest
{
  objc_opt_self();
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B48]), "initWithEntityName:", CFSTR("AdditionChangeSet"));
}

+ (id)fetchDeletionChangeSetRequest
{
  objc_opt_self();
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B48]), "initWithEntityName:", CFSTR("DeletionChangeSet"));
}

@end
