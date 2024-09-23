@implementation ML3Artist

void __64__ML3Artist_MPMediaAdditions__propertyForMPMediaEntityProperty___block_invoke()
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
  v7[0] = CFSTR("artistPersistentID");
  v7[1] = CFSTR("artistName");
  v1 = *MEMORY[0x1E0D50808];
  v8[0] = v0;
  v8[1] = v1;
  v2 = *MEMORY[0x1E0D50810];
  v7[2] = CFSTR("artistSortName");
  v7[3] = CFSTR("artistRepresentativeItemPersistentID");
  v3 = *MEMORY[0x1E0D50868];
  v8[2] = v2;
  v8[3] = v3;
  v7[4] = CFSTR("artistCloudStatus");
  v7[5] = CFSTR("artistStoreID");
  v4 = *MEMORY[0x1E0D50818];
  v8[4] = *MEMORY[0x1E0D50860];
  v8[5] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 6);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)propertyForMPMediaEntityProperty__ML3ForMP_10;
  propertyForMPMediaEntityProperty__ML3ForMP_10 = v5;

}

@end
