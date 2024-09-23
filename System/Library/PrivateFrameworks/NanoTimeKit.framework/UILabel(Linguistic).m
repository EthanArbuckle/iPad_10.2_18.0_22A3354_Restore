@implementation UILabel(Linguistic)

- (uint64_t)numberOfWordsInText
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  objc_getAssociatedObject(a1, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    && (objc_msgSend(a1, "text"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "text"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v5, "isEqualToString:", v6),
        v6,
        v5,
        v7))
  {
    v8 = objc_msgSend(v4, "number");
  }
  else
  {
    v9 = (id)*MEMORY[0x1E0CB2D28];
    v10 = objc_alloc(MEMORY[0x1E0CB3730]);
    v24[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithTagSchemes:options:", v11, 30);

    objc_msgSend(a1, "text");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setString:", v13);

    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    objc_msgSend(a1, "text");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "length");
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __42__UILabel_Linguistic__numberOfWordsInText__block_invoke;
    v19[3] = &unk_1E6BD62D8;
    v19[4] = &v20;
    objc_msgSend(v12, "enumerateTagsInRange:scheme:options:usingBlock:", 0, v15, v9, 30, v19);

    v16 = (void *)objc_opt_new();
    objc_msgSend(a1, "text");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setText:", v17);

    objc_msgSend(v16, "setNumber:", v21[3]);
    objc_setAssociatedObject(a1, a2, v16, (void *)1);
    v8 = v21[3];
    _Block_object_dispose(&v20, 8);

    v4 = v16;
  }

  return v8;
}

@end
