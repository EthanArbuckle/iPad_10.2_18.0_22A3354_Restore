@implementation APSRadarComponentEntry

- (NSString)componentName
{
  return self->componentName;
}

- (NSString)componentVersion
{
  return self->componentVersion;
}

- (NSString)componentID
{
  return self->componentID;
}

+ (id)componentEntryWithName:(id)a3 componentVersion:(id)a4 componentID:(id)a5
{
  APSRadarComponentEntry *v8;

  v8 = objc_alloc_init(APSRadarComponentEntry);
  if (v8)
  {
    v8->componentName = (NSString *)objc_msgSend(a3, "copy");
    v8->componentVersion = (NSString *)objc_msgSend(a4, "copy");
    v8->componentID = (NSString *)objc_msgSend(a5, "copy");
  }
  return v8;
}

@end
