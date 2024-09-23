@implementation SlotDescriptor

void __58___SlotDescriptor_supportsFamiliesOfComplications_inFace___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v6;
  void *v7;

  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a2) = objc_msgSend(v6, "supportsComplicationFamily:forDevice:", a2, v7);

  if ((_DWORD)a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *a3 = 1;
  }
}

@end
