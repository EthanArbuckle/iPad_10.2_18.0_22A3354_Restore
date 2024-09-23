@implementation HDSOSManager

- (BOOL)isAllowedToMessageSOSContacts
{
  return objc_msgSend(getSOSUtilitiesClass_0(), "isAllowedToMessageSOSContacts");
}

- (void)setIsAllowedToMessageSOSContacts
{
  objc_msgSend(getSOSUtilitiesClass_0(), "setAllowedToMessageSOSContacts:", 1);
}

- (id)sosContactManager
{
  void *v2;
  objc_class *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getSOSContactsManagerClass_softClass;
  v9 = getSOSContactsManagerClass_softClass;
  if (!getSOSContactsManagerClass_softClass)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getSOSContactsManagerClass_block_invoke;
    v5[3] = &unk_1E6CECDD0;
    v5[4] = &v6;
    __getSOSContactsManagerClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  return objc_alloc_init(v3);
}

@end
