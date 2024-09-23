@implementation ML3CollectionEntityClassForMPMediaItemCollectionProperty

void __ML3CollectionEntityClassForMPMediaItemCollectionProperty_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[39];
  _QWORD v3[40];

  v3[39] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("albumPersistentID");
  v3[0] = objc_opt_class();
  v2[1] = CFSTR("albumName");
  v3[1] = objc_opt_class();
  v2[2] = CFSTR("albumSortName");
  v3[2] = objc_opt_class();
  v2[3] = CFSTR("albumAlbumArtistPersistentID");
  v3[3] = objc_opt_class();
  v2[4] = CFSTR("albumAlbumArtist");
  v3[4] = objc_opt_class();
  v2[5] = CFSTR("albumRepresentativeItemPersistentID");
  v3[5] = objc_opt_class();
  v2[6] = CFSTR("albumCloudStatus");
  v3[6] = objc_opt_class();
  v2[7] = CFSTR("albumStoreID");
  v3[7] = objc_opt_class();
  v2[8] = CFSTR("albumCloudLibraryID");
  v3[8] = objc_opt_class();
  v2[9] = CFSTR("albumLikedState");
  v3[9] = objc_opt_class();
  v2[10] = CFSTR("albumLikedStateChangedDate");
  v3[10] = objc_opt_class();
  v2[11] = CFSTR("albumArtistPersistentID");
  v3[11] = objc_opt_class();
  v2[12] = CFSTR("albumArtistName");
  v3[12] = objc_opt_class();
  v2[13] = CFSTR("albumArtistSortName");
  v3[13] = objc_opt_class();
  v2[14] = CFSTR("albumArtistRepresentativeItemPersistentID");
  v3[14] = objc_opt_class();
  v2[15] = CFSTR("albumArtistCloudStatus");
  v3[15] = objc_opt_class();
  v2[16] = CFSTR("albumArtistStoreID");
  v3[16] = objc_opt_class();
  v2[17] = CFSTR("albumArtistCloudUniversalLibraryID");
  v3[17] = objc_opt_class();
  v2[18] = CFSTR("albumArtistFavoriteState");
  v3[18] = objc_opt_class();
  v2[19] = CFSTR("albumArtistDateFavorited");
  v3[19] = objc_opt_class();
  v2[20] = CFSTR("artistPersistentID");
  v3[20] = objc_opt_class();
  v2[21] = CFSTR("artistName");
  v3[21] = objc_opt_class();
  v2[22] = CFSTR("artistSortName");
  v3[22] = objc_opt_class();
  v2[23] = CFSTR("artistRepresentativeItemPersistentID");
  v3[23] = objc_opt_class();
  v2[24] = CFSTR("artistCloudStatus");
  v3[24] = objc_opt_class();
  v2[25] = CFSTR("artistStoreID");
  v3[25] = objc_opt_class();
  v2[26] = CFSTR("artistLikedState");
  v3[26] = objc_opt_class();
  v2[27] = CFSTR("artistLikedStateChangedDate");
  v3[27] = objc_opt_class();
  v2[28] = CFSTR("composerPersistentID");
  v3[28] = objc_opt_class();
  v2[29] = CFSTR("composerName");
  v3[29] = objc_opt_class();
  v2[30] = CFSTR("composerSortName");
  v3[30] = objc_opt_class();
  v2[31] = CFSTR("composerRepresentativeItemPersistentID");
  v3[31] = objc_opt_class();
  v2[32] = CFSTR("composerCloudStatus");
  v3[32] = objc_opt_class();
  v2[33] = CFSTR("composerStoreID");
  v3[33] = objc_opt_class();
  v2[34] = CFSTR("genrePersistentID");
  v3[34] = objc_opt_class();
  v2[35] = CFSTR("genreName");
  v3[35] = objc_opt_class();
  v2[36] = CFSTR("genreRepresentativeItemPersistentID");
  v3[36] = objc_opt_class();
  v2[37] = CFSTR("genreCloudStatus");
  v3[37] = objc_opt_class();
  v2[38] = CFSTR("genreStoreID");
  v3[38] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 39);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ML3CollectionEntityClassForMPMediaItemCollectionProperty_propertyToClassMap;
  ML3CollectionEntityClassForMPMediaItemCollectionProperty_propertyToClassMap = v0;

}

@end
