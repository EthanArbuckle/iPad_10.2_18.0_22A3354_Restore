@implementation LAUpdateAccessControl

void __LAUpdateAccessControl_block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t *v11;
  __CFString *v12;
  uint64_t v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v14 = a2;
  v7 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*(_QWORD *)(a1 + 32))
  {
    v11 = (uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    v12 = CFSTR("Invalid update request.");
LABEL_9:
    makeCFError(v12, -1000, v11);
    *a4 = 1;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = objc_opt_class();
    if (v13 == objc_opt_class())
    {
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, v14);
      goto LABEL_10;
    }
    v11 = (uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    v12 = CFSTR("Invalid update value type.");
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = (uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    v12 = CFSTR("Invalid update value type, expecting dictionary.");
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __LAUpdateAccessControl_block_invoke_2;
  v15[3] = &unk_1E707AE30;
  v16 = v9;
  v10 = v9;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v15);
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v10, v14);

LABEL_10:
}

uint64_t __LAUpdateAccessControl_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a3, a2);
}

@end
