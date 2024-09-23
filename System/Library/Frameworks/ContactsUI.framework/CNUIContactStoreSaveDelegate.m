@implementation CNUIContactStoreSaveDelegate

- (BOOL)saveRequest:(id)a3 shouldProceedAfterError:(id)a4
{
  id v4;
  void *v5;
  char v6;

  v4 = a4;
  if (objc_msgSend(v4, "code") == 1015)
  {
    objc_msgSend(v4, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C968C8]);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
