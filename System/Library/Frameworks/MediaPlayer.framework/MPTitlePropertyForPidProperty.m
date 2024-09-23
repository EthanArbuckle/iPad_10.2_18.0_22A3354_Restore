@implementation MPTitlePropertyForPidProperty

void ___MPTitlePropertyForPidProperty_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("albumPID");
  v2[1] = CFSTR("artistPID");
  v3[0] = CFSTR("albumTitle");
  v3[1] = CFSTR("artist");
  v2[2] = CFSTR("playlistPersistentID");
  v3[2] = CFSTR("name");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MPTitlePropertyForPidProperty___pidPropertyToAlbumMappings;
  _MPTitlePropertyForPidProperty___pidPropertyToAlbumMappings = v0;

}

@end
