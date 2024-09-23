@implementation _CDDataCollectionUtilities

+ (id)randomDataWithLength:(unint64_t)a3
{
  void *v4;
  const __SecRandom *v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (const __SecRandom *)*MEMORY[0x1E0CD7000];
  v6 = objc_retainAutorelease(v4);
  if (SecRandomCopyBytes(v5, a3, (void *)objc_msgSend(v6, "mutableBytes")))
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithData:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

@end
