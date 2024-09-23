@implementation ICInlineAttachmentView(ICTextPreviewProvider)

- (void)imageForTextPreviewUsingFindingResult:()ICTextPreviewProvider inTextView:completion:
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void (**v12)(id, void *);

  v12 = a5;
  v7 = a3;
  objc_opt_class();
  ICDynamicCast();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v9 = objc_msgSend(v8, "displayTextRange");
    objc_msgSend(a1, "imageForTextPreviewInRange:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, v11);

  }
}

@end
