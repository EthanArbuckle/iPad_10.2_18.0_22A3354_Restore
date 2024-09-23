@implementation UIDocumentInteractionController(SFManagedSourceSupport)

+ (id)sf_interactionControllerWithDocumentURL:()SFManagedSourceSupport sourceURL:
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CEA538], "interactionControllerWithURL:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSourceIsManaged:", objc_msgSend(v7, "isURLManaged:", v5));

    v8 = v6;
  }

  return v6;
}

@end
