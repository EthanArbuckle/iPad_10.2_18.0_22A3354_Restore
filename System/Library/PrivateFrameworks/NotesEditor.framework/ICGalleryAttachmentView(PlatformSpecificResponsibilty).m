@implementation ICGalleryAttachmentView(PlatformSpecificResponsibilty)

- (void)collectionView:()PlatformSpecificResponsibilty cellForItemAtIndexPath:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "subAttachmentItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2048;
  v9 = objc_msgSend(v5, "count");
  _os_log_error_impl(&dword_1DD7B0000, a3, OS_LOG_TYPE_ERROR, "Collection view cell out of bounds: %@ (%ld)", (uint8_t *)&v6, 0x16u);

}

@end
