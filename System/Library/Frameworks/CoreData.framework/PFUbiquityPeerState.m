@implementation PFUbiquityPeerState

- (PFUbiquityPeerState)initWithStoreName:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  uint64_t v7;
  PFUbiquityPeerState *v8;
  PFUbiquityPeerState *v9;

  v7 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "persistentStoreCoordinator"), "managedObjectModel"), "entitiesByName"), "objectForKey:", CFSTR("PFUbiquityPeerState"));
  if (v7)
  {
    v8 = -[NSManagedObject initWithEntity:insertIntoManagedObjectContext:](self, "initWithEntity:insertIntoManagedObjectContext:", v7, a4);
    v9 = v8;
    if (v8)
      -[PFUbiquityPeerState setStoreName:](v8, "setStoreName:", a3);
  }
  else
  {

    return 0;
  }
  return v9;
}

+ (PFUbiquityPeerState)peerStateForStoreName:(void *)a3 andPeerID:(void *)a4 inManagedObjectContext:(int)a5 createIfMissing:
{
  NSFetchRequest *v9;
  void *v10;
  void *v11;
  PFUbiquityPeerState *v12;
  uint64_t v14;

  objc_opt_self();
  if (!objc_msgSend(a2, "length") || !objc_msgSend(a3, "length") || !objc_msgSend(a4, "persistentStoreCoordinator"))
    return 0;
  v9 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("PFUbiquityPeerState"));
  -[NSFetchRequest setPredicate:](v9, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:argumentArray:", CFSTR("storeName == %@ AND peer.peerKey == %@ AND storeMetadata.ubiquityName == %@"), objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", a2, a3, a2, 0)));
  v14 = 0;
  v10 = (void *)objc_msgSend(a4, "executeFetchRequest:error:", v9, &v14);
  v11 = v10;
  if (v14 || (unint64_t)objc_msgSend(v10, "count") >= 2)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Error or too many peer states: %@, error: %@"), "+[PFUbiquityPeerState(UbiquityMethods) peerStateForStoreName:andPeerID:inManagedObjectContext:createIfMissing:]", 58, v11, v14);
    return 0;
  }
  if (objc_msgSend(v11, "count") == 1)
    v12 = (PFUbiquityPeerState *)objc_msgSend(v11, "objectAtIndex:", 0);
  else
    v12 = 0;
  if (!v12 && a5)
  {
    v12 = -[PFUbiquityPeerState initWithStoreName:insertIntoManagedObjectContext:]([PFUbiquityPeerState alloc], "initWithStoreName:insertIntoManagedObjectContext:", a2, a4);
    -[PFUbiquityPeerState setPeer:](v12, "setPeer:", +[PFUbiquityPeer peerForPeerID:inManagedObjectContext:createIfMissing:]((uint64_t)PFUbiquityPeer, a3, a4, 1));
    -[PFUbiquityPeerState setStoreMetadata:](v12, "setStoreMetadata:", +[PFUbiquityStoreMetadata metadataForStoreWithName:inManagedObjectContext:]((uint64_t)PFUbiquityStoreMetadata, a2, a4));

  }
  return v12;
}

@end
