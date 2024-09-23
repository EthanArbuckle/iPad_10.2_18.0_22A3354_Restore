@implementation CKThrottleTable

+ (id)dbProperties
{
  return &unk_1E1FC4D10;
}

+ (Class)entryClass
{
  return (Class)objc_opt_class();
}

- (id)updateRequestCount:(id)a3
{
  return (id)objc_msgSend_updateProperties_usingObject_label_(self, a2, (uint64_t)&unk_1E1FC4280, (uint64_t)a3, off_1E1F64CF0);
}

@end
