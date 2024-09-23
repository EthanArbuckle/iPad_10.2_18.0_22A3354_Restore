@implementation PHKeywordDeleteRequest

- (void)deleteManagedObject:(id)a3 photoLibrary:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  objc_msgSend(a4, "managedObjectContext");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deleteObject:", v5);

}

@end
