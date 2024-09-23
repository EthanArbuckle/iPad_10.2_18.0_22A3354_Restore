@implementation ML3AlbumArtist

void __69__ML3AlbumArtist_MPMediaAdditions__propertyForMPMediaEntityProperty___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[10];
  _QWORD v11[11];

  v11[10] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D50AD8];
  v10[0] = CFSTR("albumArtistPersistentID");
  v10[1] = CFSTR("albumArtistName");
  v1 = *MEMORY[0x1E0D50788];
  v11[0] = v0;
  v11[1] = v1;
  v2 = *MEMORY[0x1E0D50790];
  v10[2] = CFSTR("albumArtistSortName");
  v10[3] = CFSTR("albumArtistRepresentativeItemPersistentID");
  v3 = *MEMORY[0x1E0D50868];
  v11[2] = v2;
  v11[3] = v3;
  v4 = *MEMORY[0x1E0D50860];
  v10[4] = CFSTR("albumArtistCloudStatus");
  v10[5] = CFSTR("albumArtistStoreID");
  v5 = *MEMORY[0x1E0D50798];
  v11[4] = v4;
  v11[5] = v5;
  v6 = *MEMORY[0x1E0D50770];
  v10[6] = CFSTR("albumArtistCloudUniversalLibraryID");
  v10[7] = CFSTR("albumArtistFavoriteState");
  v7 = *MEMORY[0x1E0D50778];
  v10[8] = CFSTR("albumArtistDateFavorited");
  v10[9] = CFSTR("_albumArtistLikedState");
  v11[6] = v6;
  v11[7] = v7;
  v11[8] = *MEMORY[0x1E0D50780];
  v11[9] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 10);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)propertyForMPMediaEntityProperty__ML3ForMP_14;
  propertyForMPMediaEntityProperty__ML3ForMP_14 = v8;

}

@end
