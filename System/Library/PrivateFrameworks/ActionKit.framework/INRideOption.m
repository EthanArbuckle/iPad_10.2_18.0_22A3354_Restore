@implementation INRideOption

void __64__INRideOption_WFRideOptionsLoader__wf_isAvailableForPartySize___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  unint64_t v7;
  BOOL v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;

  v6 = a2;
  v7 = *(_QWORD *)(a1 + 40);
  v12 = v6;
  if (v7 >= objc_msgSend(v6, "partySizeRange"))
  {
    v9 = *(_QWORD *)(a1 + 40);
    v10 = v9 - objc_msgSend(v12, "partySizeRange");
    objc_msgSend(v12, "partySizeRange");
    v8 = v10 <= v11;
  }
  else
  {
    v8 = 0;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v8;
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);

}

@end
