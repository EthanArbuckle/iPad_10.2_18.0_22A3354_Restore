@implementation NoteBodyObject

- (NSString)contentAsPlainText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[NoteBodyObject content](self, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0D46098];
    -[NoteBodyObject content](self, "content");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "plainTextFromHTML:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (NSString *)v6;
}

- (id)contentAsPlainTextPreservingNewlines
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[NoteBodyObject content](self, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0D46098];
    -[NoteBodyObject content](self, "content");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "plainTextFromHTML:limit:preserveNewlines:", v5, 0xFFFFFFFFLL, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

@end
