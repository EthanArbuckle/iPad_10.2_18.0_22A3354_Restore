@implementation NSFileManager

void __67__NSFileManager_CRKAdditions__crk_nonContainerizedHomeDirectoryURL__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "crk_computeNonContainerizedHomeDirectoryURL");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)crk_nonContainerizedHomeDirectoryURL_URL;
  crk_nonContainerizedHomeDirectoryURL_URL = v1;

}

uint64_t __79__NSFileManager_CRKAdditions__crk_deepContentsOfDirectoryAtPath_options_error___block_invoke(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  return 0;
}

@end
