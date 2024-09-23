@implementation SGDataDetectorsScanForPhone

void __SGDataDetectorsScanForPhone_block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  DDScannerSetScannerTimeout();
  v4 = (void *)a1[4];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __SGDataDetectorsScanForPhone_block_invoke_2;
  v8[3] = &unk_1E7DAE760;
  v5 = v4;
  v7 = a1[5];
  v6 = a1[6];
  v9 = v5;
  v10 = v7;
  SGDataDetectorsScanRange(a2, v5, v6, a1[7], 0, v8);
  DDScannerSetScannerTimeout();

}

uint64_t __SGDataDetectorsScanForPhone_block_invoke_2(uint64_t a1)
{
  int HasType;
  uint64_t Range;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  HasType = DDResultHasType();
  if (HasType)
  {
    if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "length") < 0x65
      || (Range = DDResultGetRange(), (unint64_t)(Range + v4) <= 0x5A))
    {
      if (DDResultCopyPhoneValue())
      {
        v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v6 = *(void **)(v5 + 40);
        *(_QWORD *)(v5 + 40) = 0;

      }
    }
  }
  return HasType ^ 1u;
}

@end
