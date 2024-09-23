@implementation SGNormalizeEmojisInString

void __SGNormalizeEmojisInString_block_invoke(uint64_t a1, void *a2, unint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  if (a3 > *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "substringWithRange:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendString:", v9);

  }
  if (objc_msgSend(v7, "supportsSkinToneVariants"))
  {
    v10 = v7;
    v11 = (void *)MEMORY[0x24BE2E830];
    objc_msgSend(v10, "string");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_baseStringForEmojiString:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(MEMORY[0x24BE2E808], "_isCoupleMultiSkinToneEmoji:", v13))
    {
      v18[0] = *MEMORY[0x24BE2E7F8];
      v18[1] = v18[0];
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (id)objc_msgSend(v10, "copyWithSkinToneVariantSpecifier:", v14);

    }
    else
    {
      v15 = v10;
      if (objc_msgSend(v10, "skinTone"))
      {
        v15 = (id)objc_msgSend(v10, "copyWithSkinToneVariant:", 0);

      }
    }

  }
  else
  {
    v15 = v7;
  }
  v16 = *(void **)(a1 + 32);
  objc_msgSend(v15, "string");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "appendString:", v17);

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3 + a4;
}

@end
