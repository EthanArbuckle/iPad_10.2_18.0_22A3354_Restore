@implementation AMDPirTest

+ (id)testPir:(id)a3
{
  id v3;
  id v4;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  int v12;
  id obj;
  id v14;
  id v15;
  id v16;
  id v17;
  id location[3];
  id v19;
  const __CFString *v20;
  id v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = 0;
  v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (!objc_msgSend(location[0], "count"))
    objc_msgSend(v16, "setObject:forKey:", CFSTR("Nothing to do"), CFSTR("error"));
  v15 = (id)objc_msgSend(location[0], "objectForKey:", TEST_PIR);
  if (!v15)
    goto LABEL_8;
  obj = v17;
  v9 = +[AMDJSCipherMLQueryHandler triggerPIRKVFetch:withError:](AMDJSCipherMLQueryHandler, "triggerPIRKVFetch:withError:", v15, &obj);
  objc_storeStrong(&v17, obj);
  v14 = v9;
  if (v17)
  {
    v22 = CFSTR("error");
    v8 = (id)objc_msgSend(v17, "localizedDescription");
    v23[0] = v8;
    v19 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);

    v12 = 1;
  }
  else
  {
    objc_msgSend(v16, "setObject:forKey:", v14, TEST_PIR);
    v12 = 0;
  }
  objc_storeStrong(&v14, 0);
  if (!v12)
  {
LABEL_8:
    v3 = (id)objc_msgSend(location[0], "objectForKey:", TEST_PEC);
    v4 = v15;
    v15 = v3;

    if (!v15)
      goto LABEL_13;
    v10 = v17;
    v7 = +[AMDJSCipherMLQueryHandler triggerPECCall:withError:](AMDJSCipherMLQueryHandler, "triggerPECCall:withError:", v15, &v10);
    objc_storeStrong(&v17, v10);
    v11 = v7;
    if (v17)
    {
      v20 = CFSTR("error");
      v6 = (id)objc_msgSend(v17, "localizedDescription");
      v21 = v6;
      v19 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);

      v12 = 1;
    }
    else
    {
      objc_msgSend(v16, "setObject:forKey:", v11, TEST_PEC);
      v12 = 0;
    }
    objc_storeStrong(&v11, 0);
    if (!v12)
    {
LABEL_13:
      v19 = v16;
      v12 = 1;
    }
  }
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
  return v19;
}

@end
