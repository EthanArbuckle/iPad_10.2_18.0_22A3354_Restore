@implementation ML3Genre

void __63__ML3Genre_MPMediaAdditions__propertyForMPMediaEntityProperty___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[6];

  v7[5] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D50AD8];
  v6[0] = CFSTR("genrePersistentID");
  v6[1] = CFSTR("genreName");
  v1 = *MEMORY[0x1E0D50AE8];
  v7[0] = v0;
  v7[1] = v1;
  v2 = *MEMORY[0x1E0D50868];
  v6[2] = CFSTR("genreRepresentativeItemPersistentID");
  v6[3] = CFSTR("genreCloudStatus");
  v3 = *MEMORY[0x1E0D50860];
  v7[2] = v2;
  v7[3] = v3;
  v6[4] = CFSTR("genreStoreID");
  v7[4] = *MEMORY[0x1E0D50AF0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 5);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)propertyForMPMediaEntityProperty__ML3ForMP_22;
  propertyForMPMediaEntityProperty__ML3ForMP_22 = v4;

}

@end
