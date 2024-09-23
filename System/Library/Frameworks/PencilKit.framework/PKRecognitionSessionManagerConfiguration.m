@implementation PKRecognitionSessionManagerConfiguration

- (PKRecognitionSessionManagerConfiguration)init
{
  PKRecognitionSessionManagerConfiguration *v2;
  PKRecognitionSessionManagerConfiguration *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  int v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKRecognitionSessionManagerConfiguration;
  v2 = -[PKRecognitionSessionManagerConfiguration init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_sessionCaching = 0;
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.mobilenotes"));

    if ((v6 & 1) != 0
      || (objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v7, "bundleIdentifier"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "hasPrefix:", CFSTR("com.apple.PaperKit.extension")),
          v8,
          v7,
          v9))
    {
      v3->_sessionCaching = 1;
    }
    v3->_smartSelectionQuery = 1;
  }
  return v3;
}

+ (PKRecognitionSessionManagerConfiguration)interactiveCanvasConfiguration
{
  PKRecognitionSessionManagerConfiguration *v0;

  objc_opt_self();
  v0 = objc_alloc_init(PKRecognitionSessionManagerConfiguration);
  if (v0)
    v0->_smartSelectionQuery = 1;
  return v0;
}

+ (PKRecognitionSessionManagerConfiguration)backgroundIndexingConfiguration
{
  PKRecognitionSessionManagerConfiguration *v0;

  objc_opt_self();
  v0 = objc_alloc_init(PKRecognitionSessionManagerConfiguration);
  if (v0)
    v0->_smartSelectionQuery = 0;
  return v0;
}

@end
