@implementation NSData(GKBase64)

- (id)_gkZippedDictionaryValue
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v9;
  id v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v10 = 0;
  objc_msgSend(a1, "decompressedDataUsingAlgorithm:error:", 3, &v10);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v10;
  v3 = (void *)MEMORY[0x1E0C99E60];
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v2;
  objc_msgSend(MEMORY[0x1E0CB3710], "_strictlyUnarchivedObjectOfClasses:fromData:error:", v5, v1, &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v9;

  return v6;
}

@end
