@implementation CNStaticIdentityEditingCell

+ (BOOL)wantsHorizontalLayout
{
  return objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory") ^ 1;
}

+ (id)supportedPasteboardTypes
{
  if (supportedPasteboardTypes_cn_once_token_1 != -1)
    dispatch_once(&supportedPasteboardTypes_cn_once_token_1, &__block_literal_global_11539);
  return (id)supportedPasteboardTypes_cn_once_object_1;
}

void __55__CNStaticIdentityEditingCell_supportedPasteboardTypes__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CA5C88];
  v3[0] = *MEMORY[0x1E0CA5C20];
  v3[1] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)supportedPasteboardTypes_cn_once_object_1;
  supportedPasteboardTypes_cn_once_object_1 = v1;

}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v5;
  char v6;
  void *v7;
  void *v8;

  v5 = a4;
  if (sel_copy_ == a3)
  {
    v6 = 1;
  }
  else if (sel_paste_ == a3)
  {
    objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "supportedPasteboardTypes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "containsPasteboardTypes:", v8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)paste:(id)a3
{
  NSLog(CFSTR("paste"), a2, a3);
}

- (void)copy:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(a3, "identity");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13850] + 16))())
  {
    objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setString:", v4);

  }
}

@end
