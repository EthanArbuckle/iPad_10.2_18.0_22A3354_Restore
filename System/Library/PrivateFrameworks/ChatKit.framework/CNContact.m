@implementation CNContact

uint64_t __59__CNContact_CKAdditions__identifierForKey_withDestination___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x1E0C966A8]))
  {
    objc_msgSend(v3, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    if (!objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x1E0C967C0]))
    {
      v6 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v3, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isLikePhoneNumber:", *(_QWORD *)(a1 + 48));
  }
  v6 = v5;

LABEL_7:
  return v6;
}

@end
