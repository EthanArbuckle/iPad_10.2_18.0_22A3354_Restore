@implementation HDOntologyBasicPropertyProvider

+ (id)basicAttributesForConcept:(id)a3 ofTypes:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a4;
  objc_msgSend(a3, "attributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__HDOntologyBasicPropertyProvider_basicAttributesForConcept_ofTypes___block_invoke;
  v11[3] = &unk_1E6D11A38;
  v12 = v6;
  v13 = a1;
  v8 = v6;
  objc_msgSend(v7, "hk_map:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __69__HDOntologyBasicPropertyProvider_basicAttributesForConcept_ofTypes___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v3, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((_DWORD)v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "_basicUserDomainConceptPropertyForAttribute:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)_basicUserDomainConceptPropertyForAttribute:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "_basicPropertyTypeForConceptAttributeType:", objc_msgSend(v4, "type"));
  v6 = objc_msgSend(v4, "version");
  if (v5)
  {
    v7 = v6;
    if (objc_msgSend(v4, "isDeleted"))
    {
      objc_msgSend(MEMORY[0x1E0CB6CF0], "nullPropertyWithType:version:", v5, v7);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = objc_alloc(MEMORY[0x1E0CB6CF0]);
      objc_msgSend(v4, "stringValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_msgSend(v8, "initWithType:version:stringValue:", v5, v7, v9);

    }
  }

  return v5;
}

+ (int64_t)_basicPropertyTypeForConceptAttributeType:(int64_t)a3
{
  if (a3 == 984)
    return 160013;
  else
    return 0;
}

@end
