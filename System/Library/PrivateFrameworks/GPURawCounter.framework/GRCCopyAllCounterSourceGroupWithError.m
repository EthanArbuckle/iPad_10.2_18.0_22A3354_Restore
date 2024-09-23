@implementation GRCCopyAllCounterSourceGroupWithError

dispatch_queue_t __GRCCopyAllCounterSourceGroupWithError_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("com.GPURawCounter.CopyAllCounterSourceDispatchQueue", 0);
  copyAllCounterSourceDispatchQueue = (uint64_t)result;
  return result;
}

void __GRCCopyAllCounterSourceGroupWithError_block_invoke_2(uint64_t a1)
{
  mach_port_t v2;
  const __CFDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id *v8;
  void *v9;
  char *v10;
  const void *CFProperty;
  const void *v12;
  CFTypeID v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  char *v18;
  const void *v19;
  void *v20;
  char v21;
  id v22;
  id v23;
  void *v24;
  const void *v25;
  CFTypeID v26;
  objc_class *v27;
  objc_class *v28;
  id v29;
  void *v30;
  void *v31;
  id *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  io_iterator_t existing;
  mach_port_t v38;
  uint64_t v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x24BDAC8D0];
  if (!allSourceManagers)
  {
    allSourceManagers = (uint64_t)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v38 = 0;
    if (MEMORY[0x212BE1C8C](*MEMORY[0x24BDAD2F0], &v38)
      || (existing = 0,
          v2 = v38,
          v3 = IOServiceMatching("IOAcceleratorES"),
          IOServiceGetMatchingServices(v2, v3, &existing)))
    {

      allSourceManagers = 0;
      return;
    }
    v4 = IOIteratorNext(existing);
    if ((_DWORD)v4)
    {
      v5 = v4;
      v6 = *MEMORY[0x24BDD0FC8];
      v7 = 0x24BDD1000uLL;
      do
      {
        v8 = *(id **)(a1 + 32);
        v9 = (void *)MEMORY[0x212BE1D40]();
        v10 = getenv("CTR_OVERRIDE_BUNDLE");
        if (v10)
          CFProperty = CFStringCreateWithCString(0, v10, 0x8000100u);
        else
          CFProperty = IORegistryEntryCreateCFProperty(v5, CFSTR("GPURawCounterBundleName"), 0, 0);
        v12 = CFProperty;
        if (CFProperty && (v13 = CFGetTypeID(CFProperty), v13 == CFStringGetTypeID()))
        {
          v14 = v6;
          v15 = objc_msgSend((id)objc_msgSend(CFSTR("/System/Library/Extensions"), "stringByAppendingPathComponent:", v12), "stringByAppendingString:", CFSTR(".bundle"));
          v16 = objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", v15);
          if (v16)
          {
            v17 = (void *)v16;
            v18 = getenv("CTR_OVERRIDE_CLASS");
            if (v18)
              v19 = CFStringCreateWithCString(0, v18, 0x8000100u);
            else
              v19 = IORegistryEntryCreateCFProperty(v5, CFSTR("GPURawCounterPluginClassName"), 0, 0);
            v25 = v19;
            if (v19
              && (v26 = CFGetTypeID(v19), v26 == CFStringGetTypeID())
              && (v27 = (objc_class *)objc_msgSend(v17, "classNamed:", v25)) != 0
              && (v28 = v27, -[objc_class isSubclassOfClass:](v27, "isSubclassOfClass:", objc_opt_class())))
            {
              v29 = [v28 alloc];
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                v30 = (void *)objc_msgSend(v29, "initWithAcceleratorPort:error:", v5, v8);
                v6 = v14;
                if (!v30)
                {
                  v21 = 0;
                  goto LABEL_50;
                }
LABEL_49:
                objc_msgSend((id)allSourceManagers, "addObject:", v30);
                v21 = 1;
LABEL_50:
                v7 = 0x24BDD1000;
              }
              else
              {
                v34 = objc_msgSend(v29, "initWithAcceleratorPort:", v5);
                v6 = v14;
                if (v34)
                {
                  v30 = (void *)v34;
                  goto LABEL_49;
                }
                v7 = 0x24BDD1000uLL;
                if (v8)
                {
                  v35 = (void *)MEMORY[0x24BDD1540];
                  v39 = v6;
                  v40[0] = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Fail to instantiate %@"), v25, 0);
                  v36 = objc_msgSend(v35, "errorWithDomain:code:userInfo:", CFSTR("GPURawCounterErrorDomain"), -1, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1));
                  v30 = 0;
                  v21 = 0;
                  *v8 = (id)v36;
                }
                else
                {
                  v30 = 0;
                  v21 = 0;
                }
              }
LABEL_35:
              CFRelease(v25);
            }
            else
            {
              v6 = v14;
              v7 = 0x24BDD1000uLL;
              if (v8)
              {
                v31 = (void *)MEMORY[0x24BDD1540];
                v39 = v6;
                v40[0] = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Fail to find %@ in bundle at \"%@\"!\n"), v25, v15, 0);
                *v8 = (id)objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("GPURawCounterErrorDomain"), -1, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1));
              }
              v30 = 0;
              v21 = 0;
              if (v25)
                goto LABEL_35;
            }

            goto LABEL_37;
          }
          if (v8)
          {
            v24 = (void *)MEMORY[0x24BDD1540];
            v39 = v6;
            v7 = 0x24BDD1000uLL;
            v40[0] = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Fail to load bundle at \"%@\"!\n"), v15, 0);
            v21 = 0;
            *v8 = (id)objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("GPURawCounterErrorDomain"), -1, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1));
          }
          else
          {
            v21 = 0;
            v7 = 0x24BDD1000;
          }
        }
        else
        {
          if (v8)
          {
            v20 = (void *)MEMORY[0x24BDD1540];
            v39 = v6;
            v40[0] = objc_msgSend(*(id *)(v7 + 1992), "stringWithFormat:", CFSTR("Invalid counter bundle name!\n"), 0);
            *v8 = (id)objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("GPURawCounterErrorDomain"), -1, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1));
          }
          v21 = 0;
          if (!v12)
          {
            if (v8)
              goto LABEL_20;
            goto LABEL_38;
          }
        }
LABEL_37:
        CFRelease(v12);
        if (v8)
        {
LABEL_20:
          v22 = *v8;
          objc_autoreleasePoolPop(v9);
          v23 = *v8;
          if ((v21 & 1) == 0)
            goto LABEL_39;
          goto LABEL_44;
        }
LABEL_38:
        objc_autoreleasePoolPop(v9);
        if ((v21 & 1) == 0)
        {
LABEL_39:
          v32 = *(id **)(a1 + 32);
          if (v32 && *v32)
            v33 = (const char *)objc_msgSend((id)objc_msgSend(*v32, "description"), "UTF8String");
          else
            v33 = "no vendor error info";
          NSLog(CFSTR("Error, registring service 0x%x! (%s)"), v5, v33);
        }
LABEL_44:
        v5 = IOIteratorNext(existing);
      }
      while ((_DWORD)v5);
    }
  }
}

@end
