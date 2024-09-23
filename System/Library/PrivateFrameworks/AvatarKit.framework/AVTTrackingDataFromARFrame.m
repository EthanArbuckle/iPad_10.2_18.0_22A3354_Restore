@implementation AVTTrackingDataFromARFrame

void __AVTTrackingDataFromARFrame_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  int v7;
  int v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = AVTBlendShapeLocationToARIndex(v9);
  if (v6 > 50)
  {
    objc_msgSend(*(id *)(a1 + 32), "_avt_rawBlendShapeAtLocation:", v9);
    *(_DWORD *)(*(_QWORD *)(a1 + 40) + 4 * v6 + 256) = v8;
  }
  else
  {
    objc_msgSend(v5, "floatValue");
    *(_DWORD *)(*(_QWORD *)(a1 + 40) + 4 * v6 + 52) = v7;
  }

}

@end
