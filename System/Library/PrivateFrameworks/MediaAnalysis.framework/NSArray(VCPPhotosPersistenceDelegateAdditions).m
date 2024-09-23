@implementation NSArray(VCPPhotosPersistenceDelegateAdditions)

- (void)persistenceDelegate_enumerateInChunksOfSize:()VCPPhotosPersistenceDelegateAdditions withOverageAllowance:usingBlock:
{
  void (**v8)(id, void *, unint64_t, unint64_t, _BYTE *);
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;

  v8 = a5;
  v9 = objc_msgSend(a1, "count");
  if (v9)
  {
    v10 = 0;
    v14 = 0;
    do
    {
      if (v10 + a4 + a3 >= v9)
        a3 = v9 - v10;
      v11 = (void *)MEMORY[0x1BCCA1B2C]();
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v10, a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "objectsAtIndexes:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v8[2](v8, v13, v10, a3, &v14);
      LODWORD(v12) = v14;

      objc_autoreleasePoolPop(v11);
      if ((_DWORD)v12)
        break;
      v10 += a3;
    }
    while (v10 < v9);
  }

}

@end
