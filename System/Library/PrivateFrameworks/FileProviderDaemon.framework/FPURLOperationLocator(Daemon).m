@implementation FPURLOperationLocator(Daemon)

- (id)startAccessingLocator
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(a1, "asURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1 && objc_msgSend(v1, "startAccessingSecurityScopedResource"))
  {
    v3 = (void *)MEMORY[0x1E0CAABE8];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __54__FPURLOperationLocator_Daemon__startAccessingLocator__block_invoke;
    v6[3] = &unk_1E8C75E48;
    v7 = v2;
    objc_msgSend(v3, "tokenWithBlock:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
