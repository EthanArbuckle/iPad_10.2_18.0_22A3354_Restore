@implementation CalDatabaseGetIDOfOneEventWithAnErrorPerSource

void ___CalDatabaseGetIDOfOneEventWithAnErrorPerSource_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  CADObjectID *v7;
  uint64_t v8;
  CADObjectID *v9;
  uint64_t v10;
  CADObjectID *v11;
  CADObjectID *v12;

  v5 = a3;
  v6 = a2;
  v7 = [CADObjectID alloc];
  v8 = objc_msgSend(v6, "intValue");

  v12 = -[CADObjectID initWithEntityType:entityID:databaseID:](v7, "initWithEntityType:entityID:databaseID:", 6, v8, *(unsigned int *)(a1 + 40));
  v9 = [CADObjectID alloc];
  v10 = objc_msgSend(v5, "intValue");

  v11 = -[CADObjectID initWithEntityType:entityID:databaseID:](v9, "initWithEntityType:entityID:databaseID:", 2, v10, *(unsigned int *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v11, v12);

}

@end
