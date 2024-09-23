@implementation ICLFrameworkRecord

- (id)legacyRecordDictionary
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)objc_opt_new();
  v7.receiver = self;
  v7.super_class = (Class)ICLFrameworkRecord;
  -[ICLBundleRecord legacyRecordDictionary](&v7, sel_legacyRecordDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v4);

  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Framework"), CFSTR("ApplicationType"));
  v5 = (void *)objc_msgSend(v3, "copy");

  return v5;
}

@end
