@implementation _DKSyncCoordinatorFactory

+ (id)syncCoordinatorWithContext:(id)a3
{
  id v3;
  _DKSync3Coordinator *v4;

  v3 = a3;
  v4 = -[_DKSync3Coordinator initWithContext:]([_DKSync3Coordinator alloc], "initWithContext:", v3);

  return v4;
}

@end
