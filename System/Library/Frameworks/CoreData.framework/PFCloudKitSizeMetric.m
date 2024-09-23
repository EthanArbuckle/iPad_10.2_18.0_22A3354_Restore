@implementation PFCloudKitSizeMetric

- (PFCloudKitSizeMetric)initWithContainerIdentifier:(id)a3
{
  PFCloudKitSizeMetric *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PFCloudKitSizeMetric;
  v3 = -[PFCloudKitBaseMetric initWithContainerIdentifier:](&v5, sel_initWithContainerIdentifier_, a3);
  if (v3)
    v3->_sizeInBytes = (NSNumber *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 0);
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitSizeMetric;
  -[PFCloudKitBaseMetric dealloc](&v3, sel_dealloc);
}

- (uint64_t)addByteSize:(uint64_t)result
{
  uint64_t v2;
  uint64_t v3;

  if (result)
  {
    v2 = result;
    v3 = objc_msgSend(*(id *)(result + 24), "unsignedIntegerValue") + a2;

    result = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", v3);
    *(_QWORD *)(v2 + 24) = result;
  }
  return result;
}

- (id)payload
{
  void *v3;
  NSNumber *sizeInBytes;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PFCloudKitSizeMetric;
  v3 = (void *)-[NSDictionary mutableCopy](-[PFCloudKitBaseMetric payload](&v6, sel_payload), "mutableCopy");
  sizeInBytes = self->_sizeInBytes;
  if (!sizeInBytes)
    sizeInBytes = (NSNumber *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  objc_msgSend(v3, "setValue:forKey:", sizeInBytes, CFSTR("sizeInBytes"));
  return v3;
}

@end
