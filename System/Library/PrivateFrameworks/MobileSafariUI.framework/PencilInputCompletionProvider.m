@implementation PencilInputCompletionProvider

- (void)setQueryToComplete:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  PencilInputCompletionItem *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "queryString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    v6 = WBSUnifiedFieldInputTypeForString();
    if ((unint64_t)(v6 - 1) < 2)
    {
      objc_msgSend(v5, "safari_bestURLForUserTypedString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      v8 = -[PencilInputCompletionItem initWithUserQuery:navigationURL:searchQuery:]([PencilInputCompletionItem alloc], "initWithUserQuery:navigationURL:searchQuery:", v4, v7, v5);
      v10[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CompletionProvider setCompletions:forString:](self, "setCompletions:forString:", v9, v5);

      goto LABEL_8;
    }
    if (v6 != 4)
    {
      v7 = 0;
      goto LABEL_7;
    }
  }
  -[CompletionProvider setCompletions:forString:](self, "setCompletions:forString:", MEMORY[0x1E0C9AA60], v5);
LABEL_8:

}

- (unint64_t)maximumCachedCompletionCount
{
  return 1;
}

@end
