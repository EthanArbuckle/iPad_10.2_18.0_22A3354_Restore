@implementation AVTPlistDatabaseMemojiAssetWithIdentifier

void __AVTPlistDatabaseMemojiAssetWithIdentifier_block_invoke()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  +[AVTResourceLocator sharedResourceLocator]();
  v0 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  +[AVTResourceLocator generatedPlistFolderName]();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTResourceLocator pathForMemojiResource:ofType:inDirectory:isDirectory:](v0, (uint64_t)CFSTR("assetByIdentifier"), (uint64_t)CFSTR("plist"), (uint64_t)v1, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)AVTPlistDatabaseMemojiAssetWithIdentifier::kAVTPlistDatabase_assetByIdentifier;
  AVTPlistDatabaseMemojiAssetWithIdentifier::kAVTPlistDatabase_assetByIdentifier = v2;

}

@end
