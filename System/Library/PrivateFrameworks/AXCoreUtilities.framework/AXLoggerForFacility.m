@implementation AXLoggerForFacility

void __AXLoggerForFacility_block_invoke(uint64_t a1)
{
  const __CFString *v2;
  const __CFString *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  __CFString *v8;
  os_log_t v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;

  v2 = (const __CFString *)*(id *)(a1 + 32);
  if (v2)
    v3 = v2;
  else
    v3 = CFSTR("Accessibility");
  v12 = (__CFString *)v3;
  objc_msgSend((id)_OSLogCache, "objectForKeyedSubscript:");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v7 = (const char *)objc_msgSend(objc_retainAutorelease((id)*MEMORY[0x1E0DDDF48]), "UTF8String");
    v8 = objc_retainAutorelease(v12);
    v9 = os_log_create(v7, (const char *)-[__CFString UTF8String](v8, "UTF8String"));
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    objc_msgSend((id)_OSLogCache, "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v8);
  }

}

@end
