@implementation PFUbiquityRemotePeerState

- (PFUbiquityRemotePeerState)initWithStoreName:(id)a3 andRemotePeerID:(id)a4 insertIntoManagedObjectContext:(id)a5
{
  uint64_t v9;
  PFUbiquityRemotePeerState *v10;
  PFUbiquityRemotePeerState *v11;

  v9 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "persistentStoreCoordinator"), "managedObjectModel"), "entitiesByName"), "objectForKey:", CFSTR("PFUbiquityRemotePeerState"));
  if (v9)
  {
    v10 = -[NSManagedObject initWithEntity:insertIntoManagedObjectContext:](self, "initWithEntity:insertIntoManagedObjectContext:", v9, a5);
    v11 = v10;
    if (v10)
    {
      -[PFUbiquityRemotePeerState setStoreName:](v10, "setStoreName:", a3);
      -[PFUbiquityRemotePeerState setPeerID:](v11, "setPeerID:", a4);
    }
  }
  else
  {

    return 0;
  }
  return v11;
}

@end
