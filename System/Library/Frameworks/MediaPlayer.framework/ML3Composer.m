@implementation ML3Composer

void __66__ML3Composer_MPMediaAdditions__propertyForMPMediaEntityProperty___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[6];
  _QWORD v8[7];

  v8[6] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D50AD8];
  v7[0] = CFSTR("composerPersistentID");
  v7[1] = CFSTR("composerName");
  v1 = *MEMORY[0x1E0D50878];
  v8[0] = v0;
  v8[1] = v1;
  v2 = *MEMORY[0x1E0D50880];
  v7[2] = CFSTR("composerSortName");
  v7[3] = CFSTR("composerRepresentativeItemPersistentID");
  v3 = *MEMORY[0x1E0D50868];
  v8[2] = v2;
  v8[3] = v3;
  v7[4] = CFSTR("composerCloudStatus");
  v7[5] = CFSTR("composerStoreID");
  v4 = *MEMORY[0x1E0D50888];
  v8[4] = *MEMORY[0x1E0D50860];
  v8[5] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 6);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)propertyForMPMediaEntityProperty__ML3ForMP_18;
  propertyForMPMediaEntityProperty__ML3ForMP_18 = v5;

}

@end
