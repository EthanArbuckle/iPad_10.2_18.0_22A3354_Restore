@implementation HFHomeKitSettingsVendorSettingsWriteValueTransaction

__CFString *__75___HFHomeKitSettingsVendorSettingsWriteValueTransaction_descriptionBuilder__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  char v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;

  if (objc_msgSend(*(id *)(a1 + 32), "hasStarted"))
  {
    objc_msgSend(*(id *)(a1 + 32), "settingWriteFuture");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isFinished");

    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "error");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        objc_msgSend(*(id *)(a1 + 32), "error");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "na_isCancelledError");

        if ((v6 & 1) != 0)
        {
          v7 = CFSTR("Cancelled");
        }
        else
        {
          v8 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(*(id *)(a1 + 32), "error");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "localizedDescription");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "stringWithFormat:", CFSTR("Failed (Error: %@)"), v10);
          v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
      }
      else
      {
        v7 = CFSTR("Succeeded");
      }
    }
    else
    {
      v7 = CFSTR("In Progress");
    }
  }
  else
  {
    v7 = CFSTR("Queued");
  }
  return v7;
}

@end
