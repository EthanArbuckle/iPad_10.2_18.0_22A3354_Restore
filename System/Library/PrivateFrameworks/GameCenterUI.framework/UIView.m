@implementation UIView

uint64_t __64__UIView_GKAdditionsAdditional___gkRecursivelyApplyBlock_depth___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_gkRecursivelyApplyBlock:depth:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __69__UIView_GKAdditionsAdditional___gkRecursiveDescriptionForKey_depth___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  v6 = a2;
  NSSelectorFromString(*(NSString **)(a1 + 32));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "valueForKey:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "appendFormat:", CFSTR("%*s<%@ %p>: %@\n"), a3, ", objc_opt_class(), v6, v5);

  }
}

void __78__UIView_GKAdditionsAdditional___gkRecursiveDescriptionForValue_forKey_depth___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  char v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  NSSelectorFromString(*(NSString **)(a1 + 32));
  v5 = objc_opt_respondsToSelector();
  v6 = v8;
  if ((v5 & 1) != 0)
  {
    objc_msgSend(v8, "valueForKey:", *(_QWORD *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 40)))
      objc_msgSend(*(id *)(a1 + 48), "appendFormat:", CFSTR("%*s<%@ %p>: %@\n"), a3, ", objc_opt_class(), v8, v7);

    v6 = v8;
  }

}

@end
