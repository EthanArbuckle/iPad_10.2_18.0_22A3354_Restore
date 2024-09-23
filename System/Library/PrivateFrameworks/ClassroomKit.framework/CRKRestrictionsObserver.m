@implementation CRKRestrictionsObserver

+ (void)addRestrictionsObserver:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x24BDD16D0];
  v4 = a3;
  objc_msgSend(v3, "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[CRKRestrictions didChangeNotification](CRKRestrictions, "didChangeNotification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", v4, sel_restrictionsDidChange_, v5, 0);

}

+ (void)removeRestrictionsObserver:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x24BDD16D0];
  v4 = a3;
  objc_msgSend(v3, "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[CRKRestrictions didChangeNotification](CRKRestrictions, "didChangeNotification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", v4, v5, 0);

}

@end
