@implementation NSOrderedSet(SafariExtras)

- (SetChange)safari_changeFromSet:()SafariExtras withModificationCheck:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  SetChange *v17;
  void *v18;
  SetChange *v19;
  void *v20;
  SetChange *v21;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;

  v6 = a3;
  v7 = a4;
  if (a1 == v6)
  {
    +[SetChange emptyChange](SetChange, "emptyChange");
    v19 = (SetChange *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (!objc_msgSend(a1, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, objc_msgSend(v6, "count"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[SetChange initAsDeleteAllWithIndexes:]([SetChange alloc], "initAsDeleteAllWithIndexes:", v20);
LABEL_11:
    v19 = v21;

    goto LABEL_12;
  }
  if (!objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, objc_msgSend(a1, "count"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[SetChange initAsInsertAllWithIndexes:]([SetChange alloc], "initAsInsertAllWithIndexes:", v20);
    goto LABEL_11;
  }
  -[NSOrderedSet safari_indexesNotInSet:](v6, a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSOrderedSet safari_indexesNotInSet:](a1, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0C99E20];
  v11 = objc_msgSend(a1, "count");
  if (v11 >= objc_msgSend(v6, "count"))
    v12 = v6;
  else
    v12 = a1;
  objc_msgSend(v10, "setWithCapacity:", objc_msgSend(v12, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __73__NSOrderedSet_SafariExtras__safari_changeFromSet_withModificationCheck___block_invoke;
  v23[3] = &unk_1E9CFAC28;
  v23[4] = a1;
  v24 = v8;
  v25 = v9;
  v26 = v13;
  v27 = v7;
  v14 = v13;
  v15 = v9;
  v16 = v8;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v23);
  v17 = [SetChange alloc];
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[SetChange initWithInsertedIndexes:deletedIndexes:modifiedIndexes:moves:](v17, "initWithInsertedIndexes:deletedIndexes:modifiedIndexes:moves:", v15, v16, v18, v14);

LABEL_12:
  return v19;
}

@end
