@implementation NEIPSecIKEStartMOBIKEReuseSocket

void __NEIPSecIKEStartMOBIKEReuseSocket_block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  id v17;

  v17 = a2;
  v7 = a4;
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
  {
    if (v7)
    {
      v9 = 70001;
      v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v7, "domain");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqual:", CFSTR("NEIKEv2ErrorDomain"));

      if (v12)
      {
        v13 = objc_msgSend(v7, "code");
        if ((unint64_t)(v13 - 2) < 0xD)
          v9 = dword_19BED7190[v13 - 2];
      }
      else
      {
        objc_msgSend(v7, "domain");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqual:", CFSTR("NEIKEv2ProtocolErrorDomain"));

        if (v15)
          v9 = objc_msgSend(v7, "code");
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, CFSTR("NotifyCode"));

      v8 = *(_QWORD *)(a1 + 32);
    }
    else
    {
      v10 = 0;
    }
    (*(void (**)(uint64_t, id, uint64_t, id))(v8 + 16))(v8, v17, a3, v10);

  }
}

@end
