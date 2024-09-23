@implementation SGPersonalizeEmojisInString

void __SGPersonalizeEmojisInString_block_invoke(uint64_t a1, void *a2, unint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v7 = a2;
  v14 = v7;
  if (a3 > *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "substringWithRange:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendString:", v9);

    v7 = v14;
  }
  if ((objc_msgSend(v7, "supportsSkinToneVariants") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "lastUsedVariantEmojiForEmoji:", v14);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v14;
  }
  v11 = v10;
  v12 = *(void **)(a1 + 32);
  objc_msgSend(v10, "string");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "appendString:", v13);

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a3 + a4;
}

@end
