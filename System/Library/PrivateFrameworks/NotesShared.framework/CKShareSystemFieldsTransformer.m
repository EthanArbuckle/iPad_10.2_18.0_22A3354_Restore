@implementation CKShareSystemFieldsTransformer

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

- (id)reverseTransformedValue:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v10;

  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x1E0CB3710];
    v4 = a3;
    v10 = 0;
    v5 = (void *)objc_msgSend([v3 alloc], "initForReadingFromData:error:", v4, &v10);

    v6 = v10;
    if (v6)
    {
      v7 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        +[ICNotePasteboardData pasteboardDataFromPersistenceData:].cold.2((uint64_t)v6, v7);

    }
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95110]), "initWithCoder:", v5);

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

@end
