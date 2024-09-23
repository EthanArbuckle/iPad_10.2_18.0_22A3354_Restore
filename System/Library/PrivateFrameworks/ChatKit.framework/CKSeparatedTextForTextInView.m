@implementation CKSeparatedTextForTextInView

void __CKSeparatedTextForTextInView_block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  void *v9;
  char v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  BOOL v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  char v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  unint64_t *v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  id v33;

  v33 = a2;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "attributedSubstringFromRange:", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendAttributedString:", v8);

  v9 = *(void **)(a1 + 48);
  if (v9)
    v10 = objc_msgSend(v9, "_isSystemAttachment:", v33);
  else
    v10 = 0;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_msgSend(*(id *)(a1 + 40), "string");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "rangeOfCharacterFromSet:options:range:", v13, 12, a3, a4);

  v15 = a3 + a4;
  v16 = (double)(unint64_t)(a3 + a4);
  v17 = v16 < (double)(unint64_t)objc_msgSend(*(id *)(a1 + 40), "length") && v14 == 0x7FFFFFFFFFFFFFFFLL;
  if (v17 && (v10 & 1) == 0 && (isKindOfClass & 1) == 0)
  {
    v18 = *MEMORY[0x1E0DC10F8];
    objc_msgSend(*(id *)(a1 + 40), "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC10F8], v15, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *(void **)(a1 + 48);
    if (v20)
      v21 = objc_msgSend(v20, "_isSystemAttachment:", v19) ^ 1;
    else
      v21 = 1;
    objc_opt_class();
    v22 = objc_opt_isKindOfClass();
    objc_msgSend(*(id *)(a1 + 40), "string");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "rangeOfCharacterFromSet:options:range:", v24, 8, v15, 1);

    if (v25 == 0x7FFFFFFFFFFFFFFFLL && v21 && (v22 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "attributesAtIndex:effectiveRange:", objc_msgSend(*(id *)(a1 + 32), "length") - 1, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend(v26, "mutableCopy");

      objc_msgSend(v27, "removeObjectForKey:", CFSTR("CKFileTransferGUIDAttributeName"));
      objc_msgSend(v27, "removeObjectForKey:", v18);
      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", CFSTR("\n"), v27);
      objc_msgSend(*(id *)(a1 + 32), "appendAttributedString:", v28);
      v29 = *(unint64_t **)(a1 + 56);
      if (v29)
      {
        v30 = *v29;
        if (v16 <= (double)*v29
          || (v31 = (unint64_t)v16 - v30, (unint64_t)v16 >= v30)
          && (v32 = v29[1], ++v29, v30 = v32, v31 < v32))
        {
          *v29 = v30 + 1;
        }
      }

    }
  }

}

@end
