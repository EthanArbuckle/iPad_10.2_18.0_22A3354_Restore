@implementation ENCDGroup

+ (id)fetchRequest
{
  id v2;
  objc_class *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x1E0C97B48]);
  objc_opt_self();
  v3 = (objc_class *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithEntityName:", v4);

  return v5;
}

+ (id)insertIntoManagedObjectContext:(id)a3
{
  void *v4;
  id v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0C97B20];
  v5 = a3;
  objc_opt_self();
  v6 = (objc_class *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityForName:inManagedObjectContext:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithEntity:insertIntoManagedObjectContext:", v8, v5);
  return v9;
}

+ (id)groupFromGroup:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  +[ENCDGroup insertIntoManagedObjectContext:](ENCDGroup, "insertIntoManagedObjectContext:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "groupID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setGroupID:", v7);

  objc_msgSend(v5, "groupID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stableGroupID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStableGroupID:", v9);

  objc_msgSend(v5, "groupID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setGroupIDGeneration:", (int)objc_msgSend(v10, "generation"));

  objc_msgSend(v5, "sharedApplicationData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSharedApplicationData:", v11);

  objc_msgSend(v5, "cypher");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setCypher:", v12);
  return v6;
}

+ (id)predicateForGroupID:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3880];
  v4 = a3;
  NSStringFromSelector(sel_groupID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K == %@"), v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)predicateForGroupIDs:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3880];
  v4 = a3;
  NSStringFromSelector(sel_groupID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K IN %@"), v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)predicateForStableGroupID:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3880];
  v4 = a3;
  NSStringFromSelector(sel_stableGroupID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K == %@"), v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
