@implementation LSApplicationExtensionRecord(IntentsFoundation)

- (id)if_extensionAttributesDictionary
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "infoDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:ofClass:", CFSTR("NSExtension"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("NSExtensionAttributes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
