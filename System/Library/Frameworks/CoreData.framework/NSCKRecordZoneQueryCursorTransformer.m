@implementation NSCKRecordZoneQueryCursorTransformer

+ (id)allowedTopLevelClasses
{
  id v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSCKRecordZoneQueryCursorTransformer;
  v2 = objc_msgSendSuper2(&v4, sel_allowedTopLevelClasses);
  getCloudKitCKQueryCursorClass[0]();
  return (id)objc_msgSend(v2, "arrayByAddingObject:", objc_opt_class());
}

+ (Class)transformedValueClass
{
  getCloudKitCKQueryCursorClass[0]();
  return (Class)objc_opt_class();
}

@end
