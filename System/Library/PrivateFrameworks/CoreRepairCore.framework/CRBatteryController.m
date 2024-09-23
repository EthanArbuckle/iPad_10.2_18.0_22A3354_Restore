@implementation CRBatteryController

+ (id)setBatteryDateOfFirstUse:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t Use;
  const char *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  const char *v18;
  uint64_t v19;
  id v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  dispatch_semaphore_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  int v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = sub_2145244C0;
  v37 = sub_2145244D0;
  v38 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = -536870212;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_2145244C0;
  v27 = sub_2145244D0;
  v28 = dispatch_semaphore_create(0);
  dispatch_get_global_queue(0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    sub_2145244D8(-39, CFSTR("Invalid input"));
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    if (!a4)
      goto LABEL_12;
LABEL_11:
    v17 = objc_retainAutorelease(v17);
    *a4 = v17;
    goto LABEL_12;
  }
  handleForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_timeIntervalSinceReferenceDate(v5, v8, v9, v10);
    *(_DWORD *)buf = 138412546;
    v40 = v5;
    v41 = 1024;
    v42 = (int)v11;
    _os_log_impl(&dword_214503000, v7, OS_LOG_TYPE_DEFAULT, "setBatteryDateOfFirstUse with %@ (%d)", buf, 0x12u);
  }

  v22 = MEMORY[0x24BDAC760];
  Use = IOPSSetBatteryDateOfFirstUse();
  if ((_DWORD)Use)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v13, (uint64_t)CFSTR("Failed to set battery date of first use when starting: 0x%08x"), v14, Use, v22, 3221225472, sub_2145245DC, &unk_24D1AA310, &v29, &v33, &v23);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    sub_2145244D8(-42, v15);
    v16 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)v24[5], 0xFFFFFFFFFFFFFFFFLL);
    if (!*((_DWORD *)v30 + 6))
    {
      v15 = 0;
      v17 = 0;
      goto LABEL_12;
    }
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v18, (uint64_t)CFSTR("Failed to set battery date of first use when writing: 0x%08x"), v19, *((unsigned int *)v30 + 6), v22, 3221225472, sub_2145245DC, &unk_24D1AA310, &v29, &v33, &v23);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    sub_2145244D8(-42, v15);
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v17 = (id)v16;
  if (a4)
    goto LABEL_11;
LABEL_12:
  v20 = (id)v34[5];

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);

  return v20;
}

@end
