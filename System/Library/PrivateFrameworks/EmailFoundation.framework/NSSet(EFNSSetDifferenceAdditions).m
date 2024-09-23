@implementation NSSet(EFNSSetDifferenceAdditions)

- (EFNSSetDifference)differenceFromSet:()EFNSSetDifferenceAdditions
{
  id v4;
  void *v5;
  void *v6;
  EFNSSetDifference *v7;
  void *v8;
  void *v9;
  EFNSSetDifference *v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minusSet:", v4);
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "minusSet:", a1);
  v7 = [EFNSSetDifference alloc];
  v8 = (void *)objc_msgSend(v5, "copy");
  v9 = (void *)objc_msgSend(v6, "copy");
  v10 = -[EFNSSetDifference initWithInsertedObjects:removedObjects:](v7, "initWithInsertedObjects:removedObjects:", v8, v9);

  return v10;
}

@end
