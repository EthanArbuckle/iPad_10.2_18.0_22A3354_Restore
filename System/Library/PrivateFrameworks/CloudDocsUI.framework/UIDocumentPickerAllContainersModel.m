@implementation UIDocumentPickerAllContainersModel

uint64_t __51___UIDocumentPickerAllContainersModel_updateScopes__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 40), "shouldEnableContainer:", v3);
  v5 = v4;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 120))
    v6 = (_DWORD)v4 == 0;
  else
    v6 = 1;
  if (!v6)
    v5 = objc_msgSend(MEMORY[0x24BE175F8], "canMoveFilesWithoutDownloadingFromContainer:toContainer:");

  return v5;
}

@end
