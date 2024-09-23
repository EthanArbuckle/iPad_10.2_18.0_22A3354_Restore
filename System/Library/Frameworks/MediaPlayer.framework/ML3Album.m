@implementation ML3Album

void __63__ML3Album_MPMediaAdditions__propertyForMPMediaEntityProperty___block_invoke()
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
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[14];
  _QWORD v15[15];

  v15[14] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D50AD8];
  v14[0] = CFSTR("albumPersistentID");
  v14[1] = CFSTR("albumName");
  v1 = *MEMORY[0x1E0D507E0];
  v15[0] = v0;
  v15[1] = v1;
  v2 = *MEMORY[0x1E0D507E8];
  v14[2] = CFSTR("albumSortName");
  v14[3] = CFSTR("albumAlbumArtistPersistentID");
  v3 = *MEMORY[0x1E0D507B8];
  v15[2] = v2;
  v15[3] = v3;
  v4 = *MEMORY[0x1E0D507B0];
  v14[4] = CFSTR("albumAlbumArtist");
  v14[5] = CFSTR("albumRepresentativeItemPersistentID");
  v5 = *MEMORY[0x1E0D50868];
  v15[4] = v4;
  v15[5] = v5;
  v6 = *MEMORY[0x1E0D50860];
  v14[6] = CFSTR("albumCloudStatus");
  v14[7] = CFSTR("albumAlbumYear");
  v7 = *MEMORY[0x1E0D507A0];
  v15[6] = v6;
  v15[7] = v7;
  v8 = *MEMORY[0x1E0D507D0];
  v14[8] = CFSTR("albumLikedState");
  v14[9] = CFSTR("albumStoreID");
  v9 = *MEMORY[0x1E0D507F0];
  v15[8] = v8;
  v15[9] = v9;
  v10 = *MEMORY[0x1E0D507D8];
  v14[10] = CFSTR("albumLikedStateChangedDate");
  v14[11] = CFSTR("albumDatePlayedLocal");
  v11 = *MEMORY[0x1E0D507C8];
  v15[10] = v10;
  v15[11] = v11;
  v14[12] = CFSTR("albumCloudLibraryID");
  v14[13] = CFSTR("_albumLikedState");
  v15[12] = *MEMORY[0x1E0D507C0];
  v15[13] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 14);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)propertyForMPMediaEntityProperty__ML3ForMP_6;
  propertyForMPMediaEntityProperty__ML3ForMP_6 = v12;

}

@end
