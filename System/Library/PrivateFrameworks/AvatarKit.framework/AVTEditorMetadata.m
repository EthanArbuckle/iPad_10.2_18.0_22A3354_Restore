@implementation AVTEditorMetadata

void __AVTEditorMetadata_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x1E0CB38B0];
  AVTPrecompiledMemojiEditorMetadata();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dataWithPropertyList:format:options:error:", v3, 200, 0, 0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)AVTEditorMetadata_kAVTEditorMetadata;
  AVTEditorMetadata_kAVTEditorMetadata = v1;

}

@end
