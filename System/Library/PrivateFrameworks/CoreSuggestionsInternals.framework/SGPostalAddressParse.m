@implementation SGPostalAddressParse

void __SGPostalAddressParse_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void *v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v3 = a2;
  objc_msgSend(v3, "objectForKey:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v4);
  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 32), "_pas_retainsConmingledBackingStore"))
      v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", *(_QWORD *)(a1 + 32));
    else
      v5 = *(id *)(a1 + 32);
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__24424;
    v17 = __Block_byref_object_dispose__24425;
    v18 = &unk_1E7E115E0;
    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = __SGPostalAddressParse_block_invoke_2;
    v10 = &unk_1E7DB1158;
    v6 = v5;
    v11 = v6;
    v12 = &v13;
    SGDataDetectorsRunWithSharedScanner(&v7);
    if ((unint64_t)objc_msgSend(v6, "length", v7, v8, v9, v10) <= 0x400)
    {
      if ((unint64_t)objc_msgSend(v3, "count") >= 0x64)
        objc_msgSend(v3, "removeAllObjects");
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14[5], v6);
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), (id)v14[5]);

    _Block_object_dispose(&v13, 8);
  }

}

void __SGPostalAddressParse_block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __SGPostalAddressParse_block_invoke_3;
  v4[3] = &unk_1E7DB1130;
  v3 = *(void **)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  SGDataDetectorsScan(a2, v3, 0, v4);
}

uint64_t __SGPostalAddressParse_block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD buf[4];

  buf[3] = *MEMORY[0x1E0C80C00];
  if ((DDResultHasType() & 1) != 0)
  {
    buf[0] = 0;
    DDResultCopyFullAddressComponents();
    v8[0] = CFSTR("Street");
    v8[1] = CFSTR("City");
    v9[0] = &stru_1E7DB83A8;
    v9[1] = &stru_1E7DB83A8;
    v8[2] = CFSTR("State");
    v8[3] = CFSTR("ZIP");
    v9[2] = &stru_1E7DB83A8;
    v9[3] = &stru_1E7DB83A8;
    v8[4] = CFSTR("Country");
    v9[4] = &stru_1E7DB83A8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 5, 0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
  else
  {
    sgLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf[0]) = 138412290;
      *(_QWORD *)((char *)buf + 4) = DDResultGetType();
      v6 = *(id *)((char *)buf + 4);
      _os_log_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEFAULT, "Scanning address string, expected to only find addresses, but found %@", (uint8_t *)buf, 0xCu);

    }
  }
  return 1;
}

@end
