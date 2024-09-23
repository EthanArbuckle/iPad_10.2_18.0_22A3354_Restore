@implementation CKPackage(BRCAdvancedDataProtectionAdditions)

+ (id)br_packageWithBoundaryKey:()BRCAdvancedDataProtectionAdditions error:
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0C94FC8];
  v6 = a3;
  objc_msgSend(v5, "packageWithError:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C94BB8], "transferOptionsWithMMCSV2:", v6 != 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAssetTransferOptions:", v8);

  objc_msgSend(v7, "setBoundaryKey:", v6);
  return v7;
}

+ (id)br_packageWithPackage:()BRCAdvancedDataProtectionAdditions error:
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0C94FC8];
  v6 = a3;
  objc_msgSend(v5, "packageWithPackage:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "boundaryKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C94BB8], "transferOptionsWithMMCSV2:", v8 != 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAssetTransferOptions:", v9);

  objc_msgSend(v7, "setBoundaryKey:", v8);
  return v7;
}

+ (id)br_clonedPackageWithRecordID:()BRCAdvancedDataProtectionAdditions databaseScope:fieldName:boundaryKey:error:
{
  void *v11;
  id v12;
  void *v13;
  void *v14;

  v11 = (void *)MEMORY[0x1E0C94FC8];
  v12 = a6;
  objc_msgSend(v11, "clonedPackageWithRecordID:databaseScope:fieldName:signature:error:", a3, a4, a5, 0, a7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C94BB8], "transferOptionsWithMMCSV2:", v12 != 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAssetTransferOptions:", v14);

  objc_msgSend(v13, "setBoundaryKey:", v12);
  return v13;
}

@end
