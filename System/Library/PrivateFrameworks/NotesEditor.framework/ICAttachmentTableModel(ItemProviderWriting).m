@implementation ICAttachmentTableModel(ItemProviderWriting)

- (id)writableTypeIdentifiersForItemProvider
{
  void *v1;
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&off_1F0484600;
  objc_msgSendSuper2(&v5, sel_writableTypeIdentifiersForItemProvider);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x1E0CEC5C0], "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "arrayByAddingObject:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)loadDataWithTypeIdentifier:()ItemProviderWriting forItemProviderCompletionHandler:
{
  id v6;
  void (**v7)(id, void *, id);
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  objc_super v21;
  id v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend((id)*MEMORY[0x1E0CEC5C0], "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqualToString:", v8);

  if (v9)
  {
    objc_msgSend(a1, "table");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(a1, "attachment");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "managedObjectContext");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "attributedStringWithNSTextTablesForColumns:rows:context:", 0, 0, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v14 = (void *)objc_msgSend(v13, "mutableCopy");
        objc_msgSend(v14, "fixAttributesInRange:", 0, objc_msgSend(v13, "length"));
        v15 = objc_msgSend(v14, "length");
        v23 = *MEMORY[0x1E0DC1118];
        v24[0] = *MEMORY[0x1E0DC1190];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 0;
        objc_msgSend(v14, "dataFromRange:documentAttributes:error:", 0, v15, v16, &v22);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v22;

      }
      else
      {
        v18 = 0;
        v17 = 0;
      }

    }
    else
    {
      v18 = 0;
      v17 = 0;
    }
    v7[2](v7, v17, v18);

    v19 = 0;
  }
  else
  {
    v21.receiver = a1;
    v21.super_class = (Class)&off_1F0484600;
    objc_msgSendSuper2(&v21, sel_loadDataWithTypeIdentifier_forItemProviderCompletionHandler_, v6, v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

@end
