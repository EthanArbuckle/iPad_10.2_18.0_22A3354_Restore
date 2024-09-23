@implementation ICCalculateResultAttachmentView

- (id)accessibilityHint
{
  return (id)objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Double tap to edit the expression that produced this result"), CFSTR("Double tap to edit the expression that produced this result"), 0, 1);
}

- (id)accessibilityCustomContent
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Expression"), CFSTR("Expression"), 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithString:", v5);

  v14 = *MEMORY[0x1E0DC45F0];
  v15[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0CB3498]);
  -[ICCalculateResultAttachmentView calculateResultTextAttachment](self, "calculateResultTextAttachment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "expression");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithString:attributes:", v10, v7);

  objc_msgSend(MEMORY[0x1E0C8EDD8], "customContentWithAttributedLabel:attributedValue:", v6, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v12);

  return v3;
}

- (id)axValue
{
  void *v3;
  void *v4;
  char v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  -[ICCalculateResultAttachmentView calculateResultTextAttachment](self, "calculateResultTextAttachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isValidCalculateAttachment");

  if ((v5 & 1) != 0)
    return 0;
  v7 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Calculation error"), CFSTR("Calculation error"), 0, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICCalculateResultAttachmentView calculateResultTextAttachment](self, "calculateResultTextAttachment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedError");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "length"))
    objc_msgSend(v10, "addObject:", v12);
  objc_msgSend(v10, "componentsJoinedByString:", CFSTR(", "));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)calculateResultTextAttachment
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[ICInlineAttachmentView textAttachment](self, "textAttachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
