@implementation PFUbiquityPeer

+ (uint64_t)peerForPeerID:(void *)a3 inManagedObjectContext:(int)a4 createIfMissing:
{
  uint64_t v7;
  PFUbiquityPeer *v8;
  NSFetchRequest *v9;
  void *v10;
  void *v11;
  uint64_t v14;

  objc_opt_self();
  v7 = objc_msgSend(a2, "length");
  v8 = 0;
  if (a3 && v7)
  {
    v9 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("PFUbiquityPeer"));
    -[NSFetchRequest setPredicate:](v9, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("peerKey == %@"), a2));
    v14 = 0;
    v10 = (void *)objc_msgSend(a3, "executeFetchRequest:error:", v9, &v14);
    if (v10)
    {
      v11 = v10;
      if ((unint64_t)objc_msgSend(v10, "count") >= 2)
      {
        if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Found more than one peer object for peer ID: %@\n%@"), "+[PFUbiquityPeer(UbiquityMethods) peerForPeerID:inManagedObjectContext:createIfMissing:]", 37, a2, v11);
        return objc_msgSend(v11, "lastObject");
      }
      if (objc_msgSend(v11, "count") == 1)
        return objc_msgSend(v11, "objectAtIndex:", 0);
      if (a4)
      {
        v8 = -[NSManagedObject initWithEntity:insertIntoManagedObjectContext:]([PFUbiquityPeer alloc], "initWithEntity:insertIntoManagedObjectContext:", objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "persistentStoreCoordinator"), "managedObjectModel"), "entitiesByName"), "objectForKey:", CFSTR("PFUbiquityPeer")), a3);
        -[PFUbiquityPeer setPeerKey:](v8, "setPeerKey:", a2);
        -[PFUbiquityPeer setPeerCode:](v8, "setPeerCode:", a2);

        return (uint64_t)v8;
      }
    }
    else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
    {
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Error getting peer: %@"), "+[PFUbiquityPeer(UbiquityMethods) peerForPeerID:inManagedObjectContext:createIfMissing:]", 34, v14);
    }
    return 0;
  }
  return (uint64_t)v8;
}

@end
