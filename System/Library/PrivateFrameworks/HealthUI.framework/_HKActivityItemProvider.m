@implementation _HKActivityItemProvider

- (id)item
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;

  -[UIActivityItemProvider activityType](self, "activityType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D96DE8]))
  {

  }
  else
  {
    -[UIActivityItemProvider activityType](self, "activityType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D96DD0]);

    if (!v5)
    {
      -[UIActivityItemProvider placeholderItem](self, "placeholderItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      return v7;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("OD_SHARE_TEMPLATE_SOCIAL"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
