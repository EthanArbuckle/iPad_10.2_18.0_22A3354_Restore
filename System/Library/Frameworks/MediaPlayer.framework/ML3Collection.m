@implementation ML3Collection

void __68__ML3Collection_MPMediaAdditions__propertyForMPMediaEntityProperty___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  _QWORD v6[5];

  v6[4] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D50850];
  v5[0] = CFSTR("albumCount");
  v5[1] = CFSTR("artistCount");
  v1 = *MEMORY[0x1E0D50858];
  v6[0] = v0;
  v6[1] = v1;
  v5[2] = CFSTR("itemCount");
  v5[3] = CFSTR("cloudStatus");
  v2 = *MEMORY[0x1E0D50860];
  v6[2] = *MEMORY[0x1E0D50870];
  v6[3] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 4);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)propertyForMPMediaEntityProperty__ML3ForMP_3;
  propertyForMPMediaEntityProperty__ML3ForMP_3 = v3;

}

@end
