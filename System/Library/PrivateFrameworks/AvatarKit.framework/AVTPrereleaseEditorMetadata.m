@implementation AVTPrereleaseEditorMetadata

void __AVTPrereleaseEditorMetadata_block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  id v5;

  AVTPrecompiledMemojiPrereleaseEditorMetadata();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v0 = v4;
  }
  else
  {
    AVTPrecompiledMemojiEditorMetadata();
    v1 = objc_claimAutoreleasedReturnValue();

    v0 = (id)v1;
  }
  v5 = v0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v0, 200, 0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)AVTPrereleaseEditorMetadata_kAVTPrereleaseEditorMetadata;
  AVTPrereleaseEditorMetadata_kAVTPrereleaseEditorMetadata = v2;

}

@end
