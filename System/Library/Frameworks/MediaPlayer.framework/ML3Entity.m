@implementation ML3Entity

void __64__ML3Entity_MPMediaAdditions__propertyForMPMediaEntityProperty___block_invoke()
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
  v6[0] = CFSTR("persistentID");
  v6[1] = CFSTR("keepLocal");
  v1 = *MEMORY[0x1E0D50AB8];
  v7[0] = v0;
  v7[1] = v1;
  v2 = *MEMORY[0x1E0D50AC8];
  v6[2] = CFSTR("keepLocalStatus");
  v6[3] = CFSTR("keepLocalStatusReason");
  v3 = *MEMORY[0x1E0D50AD0];
  v7[2] = v2;
  v7[3] = v3;
  v6[4] = CFSTR("keepLocalConstraints");
  v7[4] = *MEMORY[0x1E0D50AC0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 5);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)propertyForMPMediaEntityProperty__ML3ForMP;
  propertyForMPMediaEntityProperty__ML3ForMP = v4;

}

void __73__ML3Entity_MPMediaAdditions__spotlightPropertyForMPMediaEntityProperty___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[6];
  _QWORD v7[7];

  v7[6] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D50FE0];
  v6[0] = CFSTR("title");
  v6[1] = CFSTR("albumTitle");
  v1 = *MEMORY[0x1E0D50FC8];
  v6[2] = CFSTR("albumArtist");
  v6[3] = CFSTR("artist");
  v2 = *MEMORY[0x1E0D50FD0];
  v7[2] = v1;
  v7[3] = v2;
  v3 = *MEMORY[0x1E0D50FC0];
  v6[4] = CFSTR("composer");
  v6[5] = CFSTR("podcastTitle");
  v7[0] = v0;
  v7[1] = v3;
  v7[4] = *MEMORY[0x1E0D50FD8];
  v7[5] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 6);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)spotlightPropertyForMPMediaEntityProperty__ML3ForMP;
  spotlightPropertyForMPMediaEntityProperty__ML3ForMP = v4;

}

@end
