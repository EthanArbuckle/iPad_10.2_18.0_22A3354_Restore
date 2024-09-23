@implementation sec_LWCRFact

- (void)dealloc
{
  objc_super v3;

  if (self->fact.type == 1)
    CEReleaseManagedContext();
  v3.receiver = self;
  v3.super_class = (Class)sec_LWCRFact;
  -[sec_LWCRFact dealloc](&v3, sel_dealloc);
}

- (void)bindName:(const char *)a3 withLength:(unint64_t)a4
{
  self->fact.name.data = (char *)a3;
  self->fact.name.length = a4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->dataFactStorage, 0);
  objc_storeStrong((id *)&self->stringFactStorage, 0);
}

- (id).cxx_construct
{
  *((_DWORD *)self + 2) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

+ (id)BOOLFact:(BOOL)a3
{
  _BOOL4 v3;
  sec_LWCRFact *v4;

  v3 = a3;
  v4 = objc_alloc_init(sec_LWCRFact);
  v4->fact.type = 5;
  v4->fact.value.integer = v3;
  return v4;
}

+ (id)integerFact:(id)a3
{
  id v3;
  sec_LWCRFact *v4;

  v3 = a3;
  v4 = objc_alloc_init(sec_LWCRFact);
  v4->fact.type = 3;
  v4->fact.value.integer = objc_msgSend(v3, "longLongValue");

  return v4;
}

+ (id)stringFact:(id)a3
{
  id v3;
  sec_LWCRFact *v4;
  uint64_t v5;
  NSString *stringFactStorage;

  v3 = a3;
  v4 = objc_alloc_init(sec_LWCRFact);
  v4->fact.type = 4;
  v5 = objc_msgSend(v3, "copy");
  stringFactStorage = v4->stringFactStorage;
  v4->stringFactStorage = (NSString *)v5;

  v4->fact.value.integer = (int64_t)-[NSString UTF8String](v4->stringFactStorage, "UTF8String");
  v4->fact.value.string.length = strlen(-[NSString UTF8String](v4->stringFactStorage, "UTF8String"));

  return v4;
}

+ (id)entitlementsFact:(id)a3
{
  id v3;
  sec_LWCRFact *v4;
  uint64_t v5;
  uint64_t *v6;
  void *v7;
  NSData *v8;
  sec_LWCRFact *v9;
  NSData *dataFactStorage;
  const __CFData *v11;
  uint64_t v12;
  uint64_t v13;
  id v15;
  id v16;
  void *__p[2];
  uint64_t v18;

  v3 = a3;
  v4 = objc_alloc_init(sec_LWCRFact);
  v4->fact.type = 1;
  __p[0] = 0;
  __p[1] = 0;
  v18 = 0;
  v5 = serializeDict(v3, (char **)__p);
  v6 = (uint64_t *)MEMORY[0x1E0DDFFA0];
  v7 = __p[0];
  if (v5 != *MEMORY[0x1E0DDFFA0] || (v5 = CESizeSerialization(), v5 != *v6))
  {
    v8 = 0;
    if (!v7)
      goto LABEL_5;
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 0);
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v15, "bytes");
  v16 = objc_retainAutorelease(v15);
  objc_msgSend(v16, "bytes");
  v5 = CESerializeWithOptions();
  if (v5 == *v6)
  {
    v8 = (NSData *)v16;
    v5 = *v6;
  }
  else
  {
    v8 = 0;
  }

  if (v7)
LABEL_4:
    operator delete(v7);
LABEL_5:
  if (v5 == *v6)
  {
    dataFactStorage = v4->dataFactStorage;
    v4->dataFactStorage = v8;

    v11 = (const __CFData *)v4->dataFactStorage;
    __p[0] = 0;
    __p[1] = 0;
    v18 = 0;
    CFDataGetBytePtr(v11);
    CFDataGetLength(v11);
    v12 = CEValidate();
    v13 = *v6;
    if (v12 == *v6)
    {
      v12 = CEAcquireManagedContext();
      v13 = *v6;
    }
    if (v12 == v13)
      v9 = v4;
    else
      v9 = 0;
    if (v12 == v13)
      v4 = 0;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)dataFact:(id)a3
{
  id v3;
  sec_LWCRFact *v4;
  uint64_t v5;
  NSData *dataFactStorage;

  v3 = a3;
  v4 = objc_alloc_init(sec_LWCRFact);
  v4->fact.type = 6;
  v5 = objc_msgSend(v3, "copy");
  dataFactStorage = v4->dataFactStorage;
  v4->dataFactStorage = (NSData *)v5;

  v4->fact.value.integer = (int64_t)-[NSData bytes](v4->dataFactStorage, "bytes");
  v4->fact.value.string.length = -[NSData length](v4->dataFactStorage, "length");

  return v4;
}

@end
