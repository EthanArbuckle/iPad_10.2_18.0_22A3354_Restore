@implementation CKPostSharingContext

+ (NSArray)readableTypeIdentifiersForItemProvider
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.cloudkit.sharingsupport.post");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], a2, (uint64_t)v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  void *v6;
  id v7;
  uint64_t v8;
  const char *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0CB3710];
  v7 = a3;
  v8 = objc_opt_class();
  objc_msgSend_unarchivedObjectOfClass_fromData_error_(v6, v9, v8, (uint64_t)v7, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.cloudkit.sharingsupport.post");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], a2, (uint64_t)v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)itemProviderVisibilityForRepresentationWithTypeIdentifier:(id)a3
{
  return 0;
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  void (**v5)(id, void *, id);
  const char *v6;
  void *v7;
  id v8;
  id v10;

  v5 = (void (**)(id, void *, id))a4;
  v10 = 0;
  objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E0CB36F8], v6, (uint64_t)self, 1, &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v10;
  if (v5)
    v5[2](v5, v7, v8);

  return 0;
}

- (CKPostSharingContext)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKPostSharingContext;
  return -[CKSharingContext initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKPostSharingContext;
  -[CKSharingContext encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKPostSharingContext;
  return -[CKSharingContext copyWithZone:](&v4, sel_copyWithZone_, a3);
}

@end
