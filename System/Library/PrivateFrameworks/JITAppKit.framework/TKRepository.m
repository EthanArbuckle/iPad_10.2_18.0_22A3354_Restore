@implementation TKRepository

+ (BOOL)_hasEntitlement:(id)a3
{
  const __CFAllocator *Default;
  BOOL v5;
  CFTypeID v6;
  BOOL v7;
  CFTypeRef cf;
  CFErrorRef error;
  SecTaskRef task;
  BOOL v11;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = 0;
  Default = CFAllocatorGetDefault();
  task = SecTaskCreateFromSelf(Default);
  if (task)
  {
    error = 0;
    cf = SecTaskCopyValueForEntitlement(task, (CFStringRef)location[0], &error);
    if (cf)
    {
      v6 = CFGetTypeID(cf);
      v7 = 0;
      if (v6 == CFBooleanGetTypeID())
        v7 = CFBooleanGetValue((CFBooleanRef)cf) != 0;
      v11 = v7;
      CFRelease(cf);
    }
    CFRelease(task);
  }
  v5 = v11;
  objc_storeStrong(location, 0);
  return v5;
}

+ (id)_processBundleIdentifier
{
  const __CFAllocator *Default;
  CFStringRef v3;
  id v4;
  id v6;
  __SecTask *task;
  id v8[3];

  v8[2] = a1;
  v8[1] = (id)a2;
  v8[0] = 0;
  Default = CFAllocatorGetDefault();
  task = SecTaskCreateFromSelf(Default);
  if (task)
  {
    v3 = SecTaskCopySigningIdentifier(task, 0);
    v4 = v8[0];
    v8[0] = (id)v3;

    CFRelease(task);
  }
  v6 = v8[0];
  objc_storeStrong(v8, 0);
  return v6;
}

+ (BOOL)_isApprovedProcess
{
  id location;
  id v4[3];
  char v5;

  v4[2] = a1;
  v4[1] = (id)a2;
  v4[0] = (id)objc_msgSend(a1, "_processBundleIdentifier");
  location = &unk_24E0A4CA8;
  if (v4[0] && objc_msgSend(v4[0], "length"))
    v5 = objc_msgSend(location, "containsObject:", v4[0]) & 1;
  else
    v5 = 0;
  objc_storeStrong(&location, 0);
  objc_storeStrong(v4, 0);
  return v5 & 1;
}

+ (void)loadWithURL:(id)a3 completion:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  BOOL v14;
  NSObject *queue;
  BOOL v16;
  uint64_t v18;
  int v19;
  int v20;
  void (*v21)(uint64_t, void *, void *);
  void *v22;
  id v23;
  id v24[2];
  uint64_t v25;
  uint64_t v26;
  int v27;
  int v28;
  void (*v29)(_QWORD *);
  void *v30;
  id v31;
  id v32;
  id v33;
  char v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  id v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  int v44;
  int v45;
  void (*v46)(_QWORD *);
  void *v47;
  id v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  id v53;
  int v54;
  char v55;
  char v56;
  id v57;
  id location[2];
  id v59;

  v59 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v57 = 0;
  objc_storeStrong(&v57, a4);
  v56 = objc_msgSend(v59, "_hasEntitlement:", CFSTR("com.apple.jitappkit.bundle.load")) & 1;
  v55 = objc_msgSend(v59, "_isApprovedProcess") & 1;
  if ((v56 & 1) != 0 || (v55 & 1) != 0)
  {
    v52 = 0;
    v16 = 0;
    if ((objc_msgSend(location[0], "isFileURL") & 1) != 0)
    {
      v53 = (id)objc_msgSend(location[0], "absoluteString");
      v52 = 1;
      v50 = objc_msgSend(v53, "rangeOfString:options:", CFSTR("cloudkit"), 1);
      v51 = v4;
      v16 = v50 == 0x7FFFFFFFFFFFFFFFLL;
    }
    if ((v52 & 1) != 0)

    if (v16)
    {
      queue = MEMORY[0x24BDAC9B8];
      v43 = MEMORY[0x24BDAC760];
      v44 = -1073741824;
      v45 = 0;
      v46 = __39__TKRepository_loadWithURL_completion___block_invoke;
      v47 = &unk_24E099B88;
      v48 = location[0];
      v49 = v57;
      dispatch_async(queue, &v43);

      v54 = 1;
      objc_storeStrong(&v49, 0);
      objc_storeStrong(&v48, 0);
    }
    else
    {
      v42 = (id)objc_msgSend(v59, "bundlePathForURL:", location[0]);
      v41 = (id)objc_msgSend(v42, "stringByAppendingPathExtension:", CFSTR("unpacked"));
      v40 = (id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v38 = 0;
      v14 = 0;
      if ((objc_msgSend(location[0], "isFileURL") & 1) != 0)
      {
        v39 = (id)objc_msgSend(location[0], "absoluteString");
        v38 = 1;
        v36 = objc_msgSend(v39, "rangeOfString:options:", CFSTR("cloudkit"), 1);
        v37 = v5;
        v14 = v36 != 0x7FFFFFFFFFFFFFFFLL;
      }
      if ((v38 & 1) != 0)

      if (v14)
      {
        v13 = (id)objc_msgSend(location[0], "absoluteString");
        v35 = (id)objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:", CFSTR("file://"), &stru_24E09C510);

        objc_msgSend(v59, "unpackBundleWithURL:destinationPath:completion:", location[0], v35, v57);
        v54 = 1;
        objc_storeStrong(&v35, 0);
      }
      else
      {
        v34 = 0;
        if ((objc_msgSend(v40, "fileExistsAtPath:", v41) & 1) != 0
          && (objc_msgSend(v40, "fileExistsAtPath:isDirectory:", v42, &v34) & 1) != 0
          && (v34 & 1) != 0)
        {
          v12 = MEMORY[0x24BDAC9B8];
          v26 = MEMORY[0x24BDAC760];
          v27 = -1073741824;
          v28 = 0;
          v29 = __39__TKRepository_loadWithURL_completion___block_invoke_2;
          v30 = &unk_24E099BB0;
          v31 = location[0];
          v32 = v42;
          v33 = v57;
          dispatch_async(v12, &v26);

          v54 = 1;
          objc_storeStrong(&v33, 0);
          objc_storeStrong(&v32, 0);
          objc_storeStrong(&v31, 0);
        }
        else
        {
          v7 = objc_alloc(MEMORY[0x24BDD1840]);
          v8 = location[0];
          v9 = +[TKNetwork shared](TKNetwork, "shared");
          objc_msgSend(v9, "timeoutInterval");
          v25 = objc_msgSend(v7, "initWithURL:cachePolicy:timeoutInterval:", v8);

          v11 = +[TKNetwork shared](TKNetwork, "shared");
          v10 = (id)v25;
          v18 = MEMORY[0x24BDAC760];
          v19 = -1073741824;
          v20 = 0;
          v21 = __39__TKRepository_loadWithURL_completion___block_invoke_3;
          v22 = &unk_24E099BD8;
          v24[0] = v57;
          v24[1] = v59;
          v23 = location[0];
          v6 = (id)objc_msgSend(v11, "downloadRequest:priority:completion:", v10, 1, &v18);

          objc_storeStrong(&v23, 0);
          objc_storeStrong(v24, 0);
          objc_storeStrong((id *)&v25, 0);
          v54 = 0;
        }
      }
      objc_storeStrong(&v40, 0);
      objc_storeStrong(&v41, 0);
      objc_storeStrong(&v42, 0);
    }
  }
  else
  {
    v54 = 1;
  }
  objc_storeStrong(&v57, 0);
  objc_storeStrong(location, 0);
}

void __39__TKRepository_loadWithURL_completion___block_invoke(_QWORD *a1)
{
  void *v1;
  TKRepository *v2;
  id v3;
  id v5[3];

  v5[2] = a1;
  v5[1] = a1;
  v2 = [TKRepository alloc];
  v1 = (void *)a1[4];
  v3 = (id)objc_msgSend(v1, "path");
  v5[0] = -[TKRepository initWithURL:bundlePath:](v2, "initWithURL:bundlePath:", v1);

  (*(void (**)(void))(a1[5] + 16))();
  objc_storeStrong(v5, 0);
}

void __39__TKRepository_loadWithURL_completion___block_invoke_2(_QWORD *a1)
{
  id v2[3];

  v2[2] = a1;
  v2[1] = a1;
  v2[0] = -[TKRepository initWithURL:bundlePath:]([TKRepository alloc], "initWithURL:bundlePath:", a1[4], a1[5]);
  (*(void (**)(void))(a1[6] + 16))();
  objc_storeStrong(v2, 0);
}

void __39__TKRepository_loadWithURL_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v5 = 0;
  objc_storeStrong(&v5, a3);
  if (location[0])
    objc_msgSend(*(id *)(a1 + 48), "unpackBundleWithURL:destinationPath:completion:", *(_QWORD *)(a1 + 32), location[0], *(_QWORD *)(a1 + 40));
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

+ (void)reset
{
  id v2;
  id location;
  id v4[3];

  v4[2] = a1;
  v4[1] = (id)a2;
  v2 = +[TKUtils applicationLibraryPath](TKUtils, "applicationLibraryPath");
  v4[0] = (id)objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("JITAppKit"));

  location = (id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  if ((objc_msgSend(location, "fileExistsAtPath:", v4[0]) & 1) != 0)
    objc_msgSend(location, "removeItemAtPath:error:", v4[0], 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong(v4, 0);
}

- (TKRepository)initWithURL:(id)a3 bundlePath:(id)a4
{
  TKRepository *v4;
  uint64_t v5;
  NSURL *URL;
  uint64_t v7;
  NSString *bundlePath;
  uint64_t v9;
  NSString *version;
  TKRepository *v12;
  id v13;
  id v14;
  objc_super v16;
  id v17;
  id location[2];
  TKRepository *v19;

  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = 0;
  objc_storeStrong(&v17, a4);
  v4 = v19;
  v19 = 0;
  v16.receiver = v4;
  v16.super_class = (Class)TKRepository;
  v19 = -[TKRepository init](&v16, sel_init);
  objc_storeStrong((id *)&v19, v19);
  if (v19)
  {
    v5 = objc_msgSend(location[0], "copy");
    URL = v19->_URL;
    v19->_URL = (NSURL *)v5;

    v7 = objc_msgSend(v17, "copy");
    bundlePath = v19->_bundlePath;
    v19->_bundlePath = (NSString *)v7;

    v13 = objc_alloc(MEMORY[0x24BDD17C8]);
    v14 = (id)objc_msgSend(v17, "stringByAppendingPathComponent:", CFSTR("version.txt"));
    v9 = objc_msgSend(v13, "initWithContentsOfFile:encoding:error:");
    version = v19->_version;
    v19->_version = (NSString *)v9;

  }
  v12 = v19;
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v19, 0);
  return v12;
}

- (id)tmlPathForName:(id)a3
{
  NSString *v4;
  id v5;
  id v6;
  int v7;
  id location[2];
  TKRepository *v9;
  id v10;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (objc_msgSend(location[0], "length"))
  {
    v4 = -[NSString stringByAppendingPathComponent:](v9->_bundlePath, "stringByAppendingPathComponent:", location[0]);
    v6 = -[NSString stringByAppendingPathExtension:](v4, "stringByAppendingPathExtension:", CFSTR("tml"));

    v5 = (id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    if ((objc_msgSend(v5, "fileExistsAtPath:", v6) & 1) != 0)
      v10 = v6;
    else
      v10 = 0;
    v7 = 1;
    objc_storeStrong(&v5, 0);
    objc_storeStrong(&v6, 0);
  }
  else
  {
    v10 = 0;
    v7 = 1;
  }
  objc_storeStrong(location, 0);
  return v10;
}

+ (id)bundlePathForURL:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = +[TKUtils applicationLibraryPath](TKUtils, "applicationLibraryPath");
  v9 = (id)objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("JITAppKit"));

  v5 = v9;
  v6 = +[TKUtils uniqueKeyForURL:](TKUtils, "uniqueKeyForURL:", location[0]);
  v8 = (id)objc_msgSend(v5, "stringByAppendingPathComponent:");

  v7 = v8;
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v7;
}

+ (void)unpackBundleWithURL:(id)a3 destinationPath:(id)a4 completion:(id)a5
{
  NSObject *queue;
  uint64_t v8;
  int v9;
  int v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id location[2];
  id v25;

  v25 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v23 = 0;
  objc_storeStrong(&v23, a4);
  v22 = 0;
  objc_storeStrong(&v22, a5);
  v21 = (id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v20 = (id)objc_msgSend(v25, "bundlePathForURL:", location[0]);
  v19 = (id)objc_msgSend(v20, "stringByAppendingPathExtension:", CFSTR("unpacked"));
  queue = dispatch_get_global_queue(2, 0);
  v8 = MEMORY[0x24BDAC760];
  v9 = -1073741824;
  v10 = 0;
  v11 = __63__TKRepository_unpackBundleWithURL_destinationPath_completion___block_invoke;
  v12 = &unk_24E099C28;
  v13 = v23;
  v14 = v20;
  v15 = v21;
  v16 = v19;
  v17 = location[0];
  v18 = v22;
  dispatch_async(queue, &v8);

  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
}

void __63__TKRepository_unpackBundleWithURL_destinationPath_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *queue;
  BOOL v6;
  uint64_t v7;
  id v8;
  NSString *v9;
  uint64_t v11;
  int v12;
  int v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  char v20;
  id v21;
  id v22;
  id v23;
  char v24;
  id v25;
  id v26[3];

  v26[2] = (id)a1;
  v26[1] = (id)a1;
  v8 = (id)objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v26[0] = (id)objc_msgSend(v8, "globallyUniqueString");

  v9 = NSTemporaryDirectory();
  v25 = -[NSString stringByAppendingPathComponent:](v9, "stringByAppendingPathComponent:", v26[0]);

  v24 = 0;
  v24 = +[TKUtils decompressFile:toDestinationPath:algorithm:](TKUtils, "decompressFile:toDestinationPath:algorithm:", *(_QWORD *)(a1 + 32), v25, 774);
  v23 = 0;
  v1 = *(_QWORD *)(a1 + 40);
  if (v24)
  {
    v22 = v23;
    v7 = +[Main unzipFileAtPath:toDestination:overwrite:password:error:](Main, "unzipFileAtPath:toDestination:overwrite:password:error:", v25, v1, 1);
    objc_storeStrong(&v23, v22);
    v24 = v7 & 1;
    objc_msgSend(*(id *)(a1 + 48), "removeItemAtPath:error:", v25, HIDWORD(v7));
  }
  else
  {
    v21 = v23;
    v6 = +[Main unzipFileAtPath:toDestination:overwrite:password:error:](Main, "unzipFileAtPath:toDestination:overwrite:password:error:", v25, v1, 1, 0, &v21);
    objc_storeStrong(&v23, v21);
    v24 = v6;
  }
  if ((v24 & 1) != 0)
  {
    v3 = *(void **)(a1 + 48);
    v2 = *(_QWORD *)(a1 + 56);
    v4 = (id)objc_msgSend(CFSTR("OK"), "dataUsingEncoding:", 4);
    v24 = objc_msgSend(v3, "createFileAtPath:contents:attributes:", v2) & 1;

    queue = MEMORY[0x24BDAC9B8];
    v11 = MEMORY[0x24BDAC760];
    v12 = -1073741824;
    v13 = 0;
    v14 = __63__TKRepository_unpackBundleWithURL_destinationPath_completion___block_invoke_2;
    v15 = &unk_24E099C00;
    v20 = v24 & 1;
    v16 = *(id *)(a1 + 64);
    v17 = *(id *)(a1 + 40);
    v19 = *(id *)(a1 + 72);
    v18 = v23;
    dispatch_async(queue, &v11);

    objc_storeStrong(&v18, 0);
    objc_storeStrong(&v19, 0);
    objc_storeStrong(&v17, 0);
    objc_storeStrong(&v16, 0);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(v26, 0);
}

void __63__TKRepository_unpackBundleWithURL_destinationPath_completion___block_invoke_2(uint64_t a1)
{
  id v2[3];

  v2[2] = (id)a1;
  v2[1] = (id)a1;
  if ((*(_BYTE *)(a1 + 64) & 1) != 0)
  {
    v2[0] = -[TKRepository initWithURL:bundlePath:]([TKRepository alloc], "initWithURL:bundlePath:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    objc_storeStrong(v2, 0);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

- (NSString)version
{
  return self->_version;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_bundlePath, 0);
}

@end
