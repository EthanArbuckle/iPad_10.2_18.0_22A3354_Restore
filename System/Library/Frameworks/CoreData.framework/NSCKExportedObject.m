@implementation NSCKExportedObject

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

- (unint64_t)type
{
  return objc_msgSend((id)-[NSCKExportedObject typeNum](self, "typeNum"), "unsignedIntegerValue");
}

- (void)setType:(unint64_t)a3
{
  -[NSCKExportedObject setTypeNum:](self, "setTypeNum:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3));
}

- (int64_t)changeType
{
  return objc_msgSend((id)-[NSCKExportedObject changeTypeNum](self, "changeTypeNum"), "unsignedIntegerValue");
}

- (void)setChangeType:(int64_t)a3
{
  -[NSCKExportedObject setChangeTypeNum:](self, "setChangeTypeNum:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3));
}

@end
