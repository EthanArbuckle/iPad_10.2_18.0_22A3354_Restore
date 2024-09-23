@implementation SUUIPassbookPassDataConsumer

- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v12;

  v6 = a3;
  v7 = SUUIPassKitCoreFramework();
  v12 = 0;
  v8 = (void *)objc_msgSend(objc_alloc((Class)SUUIWeakLinkedClassForString(CFSTR("PKPass"), v7)), "initWithData:error:", v6, &v12);

  v9 = v12;
  v10 = v9;
  if (a5 && !v8)
    *a5 = objc_retainAutorelease(v9);

  return v8;
}

@end
