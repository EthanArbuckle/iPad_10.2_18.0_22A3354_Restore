@implementation PHImportOptions

- (PHImportOptions)init
{
  PHImportOptions *v2;
  PHImportOptions *v3;
  uint64_t v4;
  NSSortDescriptor *sortDescriptor;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PHImportOptions;
  v2 = -[PHImportOptions init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_options_bits &= 0xE37Fu;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
    v4 = objc_claimAutoreleasedReturnValue();
    sortDescriptor = v3->_sortDescriptor;
    v3->_sortDescriptor = (NSSortDescriptor *)v4;

    *((_BYTE *)&v3->_options_bits + 2) = 4;
  }
  return v3;
}

- (id)description
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  unsigned int v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v18;
  const __CFString *v19;
  const __CFString *v20;
  int v21;
  const __CFString *v22;
  void *v23;

  v23 = (void *)MEMORY[0x1E0CB3940];
  if (-[PHImportOptions preserveFolderStructure](self, "preserveFolderStructure"))
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  v22 = v3;
  v21 = -[PHImportOptions importedBy](self, "importedBy");
  if (-[PHImportOptions hideProgress](self, "hideProgress"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  v20 = v4;
  if (-[PHImportOptions skipAlertWhenFinished](self, "skipAlertWhenFinished"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  v19 = v5;
  v18 = -[PHImportOptions fileOperation](self, "fileOperation");
  if (-[PHImportOptions shouldImportAsReferenced](self, "shouldImportAsReferenced"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  if (-[PHImportOptions allowDuplicates](self, "allowDuplicates"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  if (-[PHImportOptions skipDiskSpaceCheck](self, "skipDiskSpaceCheck"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  if (-[PHImportOptions deleteAfterImport](self, "deleteAfterImport"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  v10 = -[PHImportOptions metadataAddMode](self, "metadataAddMode");
  if (-[PHImportOptions omitImportComplete](self, "omitImportComplete"))
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  if (-[PHImportOptions allowUnsupported](self, "allowUnsupported"))
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  -[PHImportOptions personId](self, "personId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHImportOptions libraryScope](self, "libraryScope");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHImportOptions library](self, "library");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", CFSTR("\npreserveFolderStructure: %@\nimportedBy: %d\nhideProgress: %@\nskipAlertWhenFinished: %@\nfileOperation: %d\nshouldImportAsReferenced: %@\nallowDuplicates: %@\nskipDiskSpaceCheck: %@\ndeleteAfterImport: %@\nmetadataAddMode: %d\nomitImportComplete: %@\nallowUnsupported: %@\npersonId: %@\nlibraryScope: %@\nlibrary: %@\n"), v22, v21, v20, v19, v18, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (BOOL)preserveFolderStructure
{
  return *(_WORD *)&self->_options_bits & 1;
}

- (void)setPreserveFolderStructure:(BOOL)a3
{
  *(_WORD *)&self->_options_bits = *(_WORD *)&self->_options_bits & 0xFFFE | a3;
}

- (signed)importedBy
{
  return *((unsigned __int8 *)&self->_options_bits + 2);
}

- (void)setImportedBy:(signed __int16)a3
{
  *((_BYTE *)&self->_options_bits + 2) = a3;
}

- (BOOL)hideProgress
{
  return (*(_WORD *)&self->_options_bits >> 1) & 1;
}

- (void)setHideProgress:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_options_bits = *(_WORD *)&self->_options_bits & 0xFFFD | v3;
}

- (BOOL)skipAlertWhenFinished
{
  return (*(_WORD *)&self->_options_bits >> 2) & 1;
}

- (void)setSkipAlertWhenFinished:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_options_bits = *(_WORD *)&self->_options_bits & 0xFFFB | v3;
}

- (unsigned)fileOperation
{
  return (*(_WORD *)&self->_options_bits >> 10) & 7;
}

- (void)setFileOperation:(unsigned __int8)a3
{
  *(_WORD *)&self->_options_bits = *(_WORD *)&self->_options_bits & 0xE3FF | ((a3 & 7) << 10);
}

- (BOOL)shouldImportAsReferenced
{
  return (*(_WORD *)&self->_options_bits >> 3) & 1;
}

- (void)setShouldImportAsReferenced:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_options_bits = *(_WORD *)&self->_options_bits & 0xFFF7 | v3;
}

- (BOOL)allowDuplicates
{
  return (*(_WORD *)&self->_options_bits >> 4) & 1;
}

- (void)setAllowDuplicates:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_options_bits = *(_WORD *)&self->_options_bits & 0xFFEF | v3;
}

- (BOOL)skipDiskSpaceCheck
{
  return (*(_WORD *)&self->_options_bits >> 5) & 1;
}

- (void)setSkipDiskSpaceCheck:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_options_bits = *(_WORD *)&self->_options_bits & 0xFFDF | v3;
}

- (BOOL)deleteAfterImport
{
  return (*(_WORD *)&self->_options_bits >> 6) & 1;
}

- (void)setDeleteAfterImport:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_options_bits = *(_WORD *)&self->_options_bits & 0xFFBF | v3;
}

- (unsigned)metadataAddMode
{
  return *(_BYTE *)&self->_options_bits >> 7;
}

- (void)setMetadataAddMode:(unsigned __int8)a3
{
  *(_WORD *)&self->_options_bits = *(_WORD *)&self->_options_bits & 0xFF7F | ((a3 & 1) << 7);
}

- (BOOL)omitImportComplete
{
  return HIBYTE(*(_WORD *)&self->_options_bits) & 1;
}

- (void)setOmitImportComplete:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_options_bits = *(_WORD *)&self->_options_bits & 0xFEFF | v3;
}

- (BOOL)allowUnsupported
{
  return (*(_WORD *)&self->_options_bits >> 9) & 1;
}

- (void)setAllowUnsupported:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_options_bits = *(_WORD *)&self->_options_bits & 0xFDFF | v3;
}

- (PHAssetCollection)destinationAlbum
{
  return self->_destinationAlbum;
}

- (void)setDestinationAlbum:(id)a3
{
  objc_storeStrong((id *)&self->_destinationAlbum, a3);
}

- (PHCollectionList)destinationFolder
{
  return self->_destinationFolder;
}

- (void)setDestinationFolder:(id)a3
{
  objc_storeStrong((id *)&self->_destinationFolder, a3);
}

- (NSSortDescriptor)sortDescriptor
{
  return self->_sortDescriptor;
}

- (void)setSortDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_sortDescriptor, a3);
}

- (NSMutableDictionary)userIptcMetadata
{
  return self->_userIptcMetadata;
}

- (void)setUserIptcMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_userIptcMetadata, a3);
}

- (NSString)personId
{
  return self->_personId;
}

- (void)setPersonId:(id)a3
{
  objc_storeStrong((id *)&self->_personId, a3);
}

- (PHImportSource)importSource
{
  return self->_importSource;
}

- (void)setImportSource:(id)a3
{
  objc_storeStrong((id *)&self->_importSource, a3);
}

- (PHPhotoLibrary)library
{
  return self->_library;
}

- (void)setLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_library, a3);
}

- (PHLibraryScope)libraryScope
{
  return self->_libraryScope;
}

- (void)setLibraryScope:(id)a3
{
  objc_storeStrong((id *)&self->_libraryScope, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryScope, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_importSource, 0);
  objc_storeStrong((id *)&self->_personId, 0);
  objc_storeStrong((id *)&self->_userIptcMetadata, 0);
  objc_storeStrong((id *)&self->_sortDescriptor, 0);
  objc_storeStrong((id *)&self->_destinationFolder, 0);
  objc_storeStrong((id *)&self->_destinationAlbum, 0);
}

@end
