@implementation NSError

void __73__NSError_EKAdditions___cal_serializedEntryForKey_value_outKey_outValue___block_invoke(uint64_t a1, SecCertificateRef certificate)
{
  CFDataRef v3;
  CFDataRef v4;

  v3 = SecCertificateCopyData(certificate);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    CFRelease(v4);
  }
}

void __48__NSError_EKAdditions__cal_serializableUserInfo__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;

  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v5) & 1) != 0)
  {
    v18 = 0;
    v19 = 0;
    v7 = objc_msgSend(MEMORY[0x1E0CB35C8], "_cal_serializedEntryForKey:value:outKey:outValue:", v5, v6, &v19, &v18);
    v8 = v19;
    v9 = v18;
    if (v7)
    {
      v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      if (!v10)
      {
        v11 = objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v13 = *(void **)(v12 + 40);
        *(_QWORD *)(v12 + 40) = v11;

        v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      }
      objc_msgSend(v10, "removeObjectForKey:", v5);
      if (v8 && v9)
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", v9, v8);
    }

  }
  else
  {
    v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (!v14)
    {
      v15 = objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v17 = *(void **)(v16 + 40);
      *(_QWORD *)(v16 + 40) = v15;

      v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    }
    objc_msgSend(v14, "removeObjectForKey:", v5);
  }

}

@end
