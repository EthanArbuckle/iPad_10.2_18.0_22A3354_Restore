@implementation NTKCanAddWatchFace

uint64_t __NTKCanAddWatchFace_block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "complicationForSlot:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "complicationType");

  result = objc_msgSend(*(id *)(a1 + 40), "containsIndex:", v6);
  if ((_DWORD)result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v6;
    *a3 = 1;
  }
  return result;
}

void __NTKCanAddWatchFace_block_invoke_370(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  v3 = objc_msgSend(v4, "faceStyle");
  if (v3 == objc_msgSend(*(id *)(a1 + 32), "faceStyle") && objc_msgSend(v4, "isSingular"))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

}

@end
