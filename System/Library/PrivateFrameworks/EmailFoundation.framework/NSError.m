@implementation NSError

void __63__NSError_EFPubliclyDescribableAdditions__ef_publicDescription__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = (void *)sErrorDecoders;
  objc_msgSend(*(id *)(a1 + 32), "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v8;
  if (v8)
  {
    (*((void (**)(id, uint64_t))v8 + 2))(v8, objc_msgSend(*(id *)(a1 + 32), "code"));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v4 = v8;
  }

}

BOOL __45__NSError_EmailFoundationAdditions__ef_match__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  _BOOL8 v7;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", v5))
    v7 = objc_msgSend(*(id *)(a1 + 32), "code") == a3;
  else
    v7 = 0;

  return v7;
}

void __67__NSError_EFPubliclyDescribableAdditions__ef_setDecoder_forDomain___block_invoke(uint64_t a1)
{
  id v1;

  v1 = _Block_copy(*(const void **)(a1 + 40));
  objc_msgSend((id)sErrorDecoders, "setObject:forKeyedSubscript:");

}

void __58__NSError_EmailFoundationAdditions__ef_secureCodableError__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB3388])
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v6, "ef_secureCodableError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v5);
    if ((objc_msgSend(v7, "isEqual:", v6) & 1) == 0)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

  }
  else if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB2F70])
         && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __58__NSError_EmailFoundationAdditions__ef_secureCodableError__block_invoke_2;
    v10[3] = &unk_1E62A6498;
    v10[4] = &v11;
    objc_msgSend(v6, "ef_map:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 32);
    if (*((_BYTE *)v12 + 24))
    {
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
    else
    {
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, v5);
    }

    _Block_object_dispose(&v11, 8);
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("NSErrorPeerCertificateChainKey")) & 1) != 0
         || (objc_msgSend(v5, "isEqualToString:", CFSTR("NSErrorClientCertificateChainKey")) & 1) != 0
         || objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB32F8])
         || !objc_msgSend(v6, "conformsToProtocol:", &unk_1EEF108B0)
         || (objc_msgSend((id)objc_opt_class(), "supportsSecureCoding") & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);
  }

}

id __58__NSError_EmailFoundationAdditions__ef_secureCodableError__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "ef_secureCodableError");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqual:", v3) & 1) == 0)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
  else
  {
    v4 = v3;
  }

  return v4;
}

@end
