@implementation CAFlipBookFrame

id __64__CAFlipBookFrame_BacklightServicesHost__bls_shortLoggingString__block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  float v13;
  id v14;
  void *v15;
  float v16;
  id v17;
  void *v18;
  id v19;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPointer:withName:", *(_QWORD *)(a1 + 40), 0);
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUInt64:withName:", objc_msgSend(*(id *)(a1 + 40), "frameId"), CFSTR("id"));
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "bls_specifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 40);
  if (v5)
  {
    objc_msgSend(v6, "bls_specifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bls_shortLoggingString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:withName:", v8, 0);

  }
  else
  {
    objc_msgSend(v6, "presentationTime");
    BLSShortLoggingStringForMachTime();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:withName:", v7, 0);
  }

  v9 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BE0B948], "sharedFormatter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringFromByteCount:", objc_msgSend(*(id *)(a1 + 40), "memoryUsage"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v9, "appendObject:withName:", v11, 0);

  objc_msgSend(*(id *)(a1 + 40), "apl");
  v14 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:decimalPrecision:", CFSTR("apl"), 3, v13);
  objc_msgSend(*(id *)(a1 + 40), "aplDimming");
  v15 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "aplDimming");
  v17 = (id)objc_msgSend(v15, "appendFloat:withName:decimalPrecision:", CFSTR("%"), 3, v16);
  v18 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "rawSurfaceFrame");
  v19 = (id)objc_msgSend(v18, "appendRect:withName:", 0);
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 40), "isInverted"), CFSTR("inverted"), 1);
}

@end
