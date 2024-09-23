@implementation NSCKExportOperation

+ (NSString)entityPath
{
  void *v2;
  id v3;
  objc_class *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = +[PFCloudKitMetadataModel ancillaryModelNamespace](PFCloudKitMetadataModel, "ancillaryModelNamespace");
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)objc_msgSend(v2, "stringWithFormat:", CFSTR("%@/%@"), v3, NSStringFromClass(v4));
}

- (unint64_t)status
{
  return objc_msgSend((id)-[NSCKExportOperation statusNum](self, "statusNum"), "unsignedIntegerValue");
}

- (void)setStatus:(unint64_t)a3
{
  -[NSCKExportOperation setStatusNum:](self, "setStatusNum:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3));
}

@end
