@implementation ICContact

void __21___ICContact_flatten__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "length"))
  {
    if (objc_msgSend(v5, "rangeOfCharacterFromSet:", *(_QWORD *)(a1 + 32)) == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
    }
    else
    {
      objc_msgSend(v5, "componentsSeparatedByCharactersInSet:", *(_QWORD *)(a1 + 32));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)objc_msgSend(v3, "mutableCopy");

      objc_msgSend(v4, "removeObject:", &stru_24EF71F58);
      objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v4);

    }
  }

}

@end
