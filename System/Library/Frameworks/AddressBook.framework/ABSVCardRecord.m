@implementation ABSVCardRecord

- (ABSVCardRecord)initWithVCardRepresentation:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  ABSVCardRecord *v8;
  id v10;

  v10 = 0;
  objc_msgSend(MEMORY[0x24BDBAD08], "contactsWithData:error:", a3, &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;
  if (!v4)
  {
    +[ABSLog log](ABSLog, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ABSVCardRecord initWithVCardRepresentation:].cold.1((uint64_t)v5, v6);
    goto LABEL_8;
  }
  if (objc_msgSend(v4, "count") != 1)
  {
    +[ABSLog log](ABSLog, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ABSVCardRecord initWithVCardRepresentation:].cold.2(v6);
LABEL_8:
    v7 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v4, "firstObject");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = +[ABSPublicABCNCompatibility publicABPersonFromContact:contactStore:publicAddressBook:](ABSPublicABCNCompatibility, "publicABPersonFromContact:contactStore:publicAddressBook:", v6, 0, 0);
LABEL_9:

  v8 = -[ABSVCardRecord initWithRecord:](self, "initWithRecord:", v7);
  return v8;
}

- (ABSVCardRecord)initWithRecord:(void *)a3
{
  ABSVCardRecord *v4;
  void *v5;
  ABSVCardRecord *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ABSVCardRecord;
  v4 = -[ABSVCardRecord init](&v8, sel_init);
  if (v4)
  {
    if (a3)
      v5 = (void *)CFRetain(a3);
    else
      v5 = 0;
    v4->_record = v5;
    v6 = v4;
  }

  return v4;
}

- (void)dealloc
{
  void *record;
  objc_super v4;

  record = self->_record;
  if (record)
    CFRelease(record);
  v4.receiver = self;
  v4.super_class = (Class)ABSVCardRecord;
  -[ABSVCardRecord dealloc](&v4, sel_dealloc);
}

- (void)record
{
  return self->_record;
}

- (void)initWithVCardRepresentation:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_20A301000, a2, OS_LOG_TYPE_ERROR, "Error parsing vcard: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithVCardRepresentation:(os_log_t)log .cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20A301000, log, OS_LOG_TYPE_ERROR, "Expected a single contact in the vcard, returning nothing", v1, 2u);
}

@end
