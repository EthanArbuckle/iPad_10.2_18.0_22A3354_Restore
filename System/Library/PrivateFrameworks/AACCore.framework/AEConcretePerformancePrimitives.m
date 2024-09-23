@implementation AEConcretePerformancePrimitives

- (_QWORD)initWithSubsystem:(_QWORD *)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)AEConcretePerformancePrimitives;
    a1 = objc_msgSendSuper2(&v7, sel_init);
    if (a1)
    {
      v4 = objc_msgSend(v3, "copy");
      v5 = (void *)a1[1];
      a1[1] = v4;

    }
  }

  return a1;
}

- (id)beginIntervalWithCategory:(id)a3 name:(id)a4
{
  id v6;
  NSString *subsystem;
  NSString *v8;
  id v9;
  const char *v10;
  id v11;
  const char *v12;
  NSObject *v13;
  char *v14;
  NSObject *v15;
  NSObject *v16;
  id *v17;
  int v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (self)
    subsystem = self->_subsystem;
  else
    subsystem = 0;
  v8 = objc_retainAutorelease(subsystem);
  v9 = a3;
  v10 = -[NSString UTF8String](v8, "UTF8String");
  v11 = objc_retainAutorelease(v9);
  v12 = (const char *)objc_msgSend(v11, "UTF8String");

  v13 = os_log_create(v10, v12);
  v14 = (char *)os_signpost_id_generate(v13);
  v15 = v13;
  v16 = v15;
  if ((unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    v19 = 136446210;
    v20 = objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    _os_signpost_emit_with_name_impl(&dword_22E279000, v16, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v14, "AAC Signposts", "%{public}s", (uint8_t *)&v19, 0xCu);
  }

  v17 = -[AEConcretePerformancePrimitivesInFlightInterval initWithName:signpostID:log:]((id *)[AEConcretePerformancePrimitivesInFlightInterval alloc], v6, v14, v16);
  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subsystem, 0);
}

@end
