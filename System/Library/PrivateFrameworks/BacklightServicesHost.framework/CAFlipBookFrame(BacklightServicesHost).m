@implementation CAFlipBookFrame(BacklightServicesHost)

- (uint64_t)bls_uuid
{
  return 0;
}

- (id)bls_loggingString
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  float v11;
  id v12;
  float v13;
  id v14;
  id v15;
  id v16;
  void *v17;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "presentationTime");
  BLSLoggingStringForMachTime();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:", v3, CFSTR("presentationTime"));

  v4 = (id)objc_msgSend(v2, "appendUInt64:withName:", objc_msgSend(a1, "frameId"), CFSTR("frameId"));
  objc_msgSend(a1, "bls_specifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bls_loggingString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v2, "appendObject:withName:", v6, CFSTR("specifier"));

  objc_msgSend(MEMORY[0x24BE0B948], "sharedFormatter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringFromByteCount:", objc_msgSend(a1, "memoryUsage"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v2, "appendObject:withName:", v9, CFSTR("memoryUsage"));

  objc_msgSend(a1, "apl");
  v12 = (id)objc_msgSend(v2, "appendFloat:withName:decimalPrecision:", CFSTR("apl"), 3, v11);
  objc_msgSend(a1, "aplDimming");
  v14 = (id)objc_msgSend(v2, "appendFloat:withName:decimalPrecision:", CFSTR("dimming"), 3, v13);
  objc_msgSend(a1, "rawSurfaceFrame");
  v15 = (id)objc_msgSend(v2, "appendRect:withName:", CFSTR("rawSurfaceFrame"));
  v16 = (id)objc_msgSend(v2, "appendBool:withName:ifEqualTo:", objc_msgSend(a1, "isInverted"), CFSTR("inverted"), 1);
  objc_msgSend(v2, "build");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)bls_shortLoggingString
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;
  id (*v8)(uint64_t);
  void *v9;
  id v10;
  uint64_t v11;

  v2 = (void *)objc_opt_new();
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __64__CAFlipBookFrame_BacklightServicesHost__bls_shortLoggingString__block_invoke;
  v9 = &unk_24D1BBE80;
  v10 = v2;
  v11 = a1;
  v3 = v2;
  objc_msgSend(v3, "appendProem:block:", 0, &v6);
  objc_msgSend(v3, "description", v6, v7, v8, v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
