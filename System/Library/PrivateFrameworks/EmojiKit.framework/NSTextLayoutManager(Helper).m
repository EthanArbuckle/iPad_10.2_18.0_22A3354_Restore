@implementation NSTextLayoutManager(Helper)

- (uint64_t)_rangeFromTextRange_emk:()Helper
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "textContentManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_rangeFromTextRange_emk:", v4);

  return v6;
}

- (void)enumerateTextParagraphsFromLocation:()Helper options:usingBlock_emk:
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v8 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __90__NSTextLayoutManager_Helper__enumerateTextParagraphsFromLocation_options_usingBlock_emk___block_invoke;
  v11[3] = &unk_1EA2589C8;
  v12 = v8;
  v10 = v8;
  v9 = (id)objc_msgSend(a1, "enumerateTextLayoutFragmentsFromLocation:options:usingBlock:", a3, a4, v11);

}

- (void)enumerateAllTextParagraphsUsingBlock_emk:()Helper
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  objc_msgSend(a1, "documentRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__NSTextLayoutManager_Helper__enumerateAllTextParagraphsUsingBlock_emk___block_invoke;
  v8[3] = &unk_1EA2589F0;
  v9 = v4;
  v7 = v4;
  objc_msgSend(a1, "enumerateTextParagraphsFromLocation:options:usingBlock_emk:", v6, 4, v8);

}

- (void)_enumerateTextLineFragmentsInTextRange:()Helper usingBlock:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  void *v14;
  id v15;
  _QWORD *v16;
  _QWORD v17[4];

  v6 = a3;
  v7 = a4;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v17[3] = 0;
  objc_msgSend(v6, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __81__NSTextLayoutManager_Helper___enumerateTextLineFragmentsInTextRange_usingBlock___block_invoke;
  v12[3] = &unk_1EA258A18;
  v9 = v6;
  v13 = v9;
  v14 = a1;
  v10 = v7;
  v15 = v10;
  v16 = v17;
  v11 = (id)objc_msgSend(a1, "enumerateTextLayoutFragmentsFromLocation:options:usingBlock:", v8, 4, v12);

  _Block_object_dispose(v17, 8);
}

- (void)_enumerateAllTokenListsUsingBlock_emk:()Helper
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v4 = a3;
  objc_msgSend(a1, "documentRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__NSTextLayoutManager_Helper___enumerateAllTokenListsUsingBlock_emk___block_invoke;
  v8[3] = &unk_1EA258A68;
  v8[4] = a1;
  v9 = v5;
  v10 = v4;
  v6 = v4;
  v7 = v5;
  objc_msgSend(a1, "enumerateAllTextParagraphsUsingBlock_emk:", v8);

}

- (uint64_t)animatingGlyphCount_emk
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  objc_msgSend(a1, "documentRange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__NSTextLayoutManager_Helper__animatingGlyphCount_emk__block_invoke;
  v7[3] = &unk_1EA258A90;
  v7[4] = &v8;
  v4 = (id)objc_msgSend(a1, "enumerateTextLayoutFragmentsFromLocation:options:usingBlock:", v3, 4, v7);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

@end
