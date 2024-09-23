@implementation ML3ContainerItem

void __71__ML3ContainerItem_MPMediaAdditions__propertyForMPMediaEntityProperty___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D508B8];
  v4[0] = CFSTR("entryUniversalIdentifier");
  v4[1] = CFSTR("entryPositionUniversalIdentifier");
  v1 = *MEMORY[0x1E0D508B0];
  v5[0] = v0;
  v5[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)propertyForMPMediaEntityProperty__ML3ForMP_30;
  propertyForMPMediaEntityProperty__ML3ForMP_30 = v2;

}

@end
