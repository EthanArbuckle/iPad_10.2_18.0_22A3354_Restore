@implementation GCDeviceDBBundle

void __42___GCDeviceDBBundle_initWithBundle_error___block_invoke(uint64_t a1, void (**a2)(_QWORD, _QWORD, _QWORD), uint64_t a3, _BYTE *a4)
{
  void (**v8)(_QWORD, _QWORD, _QWORD);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _GCDeviceDBBundleDevice *v13;
  uint64_t v14;
  id *v15;
  _GCDeviceDBBundleDevice *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  id obj;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  void *v40;
  void *v41;
  _QWORD v42[2];
  _QWORD v43[3];

  v43[2] = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = objc_opt_class();
  v10 = a1 + 56;
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v11 + 40);
  ((void (**)(_QWORD, uint64_t, id *))a2)[2](v8, v9, &obj);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_storeStrong((id *)(v11 + 40), obj);
  if (v12)
  {
    v13 = [_GCDeviceDBBundleDevice alloc];
    v14 = *(_QWORD *)(a1 + 32);
    v15 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v31 = 0;
    v16 = -[_GCDeviceDBBundleDevice initWithBundle:dictionary:error:](v13, "initWithBundle:dictionary:error:", v14, v12, &v31);
    objc_storeStrong(v15, v31);
    if (v16)
    {
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v16);
    }
    else
    {
      v24 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)v10 + 8) + 40), "code");
      _gc_log_devicedb();
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (v24 == 5)
      {
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          v27 = *(_QWORD *)(a1 + 40);
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "localizedFailureReason");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v34 = v27;
          v35 = 2114;
          v36 = CFSTR("Devices");
          v37 = 2048;
          v38 = a3;
          v39 = 2114;
          v40 = v28;
          _os_log_debug_impl(&dword_1DC79E000, v26, OS_LOG_TYPE_DEBUG, "📦 Skipping loading device definition at '%@' > '%{public}@' > [%zd]: %{public}@.", buf, 0x2Au);

        }
      }
      else if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      {
        __42___GCDeviceDBBundle_initWithBundle_error___block_invoke_cold_1((uint64_t *)(a1 + 32), a1 + 56, v26);
      }

      v29 = *(_QWORD *)(*(_QWORD *)v10 + 8);
      v30 = *(void **)(v29 + 40);
      *(_QWORD *)(v29 + 40) = 0;

    }
  }
  else
  {
    v42[0] = *MEMORY[0x1E0CB2D68];
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)v10 + 8) + 40), "localizedFailureReason");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v42[1] = 0x1EA4D51E8;
    v43[0] = v17;
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("[%zd]"), a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v18;
    +[NSArray arrayWithObjects:count:](&off_1F03A70A0, "arrayWithObjects:count:", &v41, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v43[1] = v19;
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSError gc_deviceDBError:userInfo:]((uint64_t)&off_1F03A6B68, 3, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = *(_QWORD *)(*(_QWORD *)v10 + 8);
    v23 = *(void **)(v22 + 40);
    *(_QWORD *)(v22 + 40) = v21;

    *a4 = 1;
  }

}

void __42___GCDeviceDBBundle_initWithBundle_error___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a2 + 8) + 40);
  v5 = 138412546;
  v6 = v3;
  v7 = 2114;
  v8 = v4;
  _os_log_fault_impl(&dword_1DC79E000, log, OS_LOG_TYPE_FAULT, "📦 Error loading device definition in bundle %@: %{public}@", (uint8_t *)&v5, 0x16u);
}

@end
