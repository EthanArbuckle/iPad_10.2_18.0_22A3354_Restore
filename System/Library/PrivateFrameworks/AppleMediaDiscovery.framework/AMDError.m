@implementation AMDError

+ (id)allocError:(int64_t)a3 withMessage:(id)a4
{
  id v5;
  int64_t v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id location;
  int64_t v12;
  SEL v13;
  id v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v14 = a1;
  v13 = a2;
  v12 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v5 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v10 = (id)objc_msgSend(v5, "localizedStringForKey:value:table:", location, &stru_1EA4B7088, 0);

  v7 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v6 = v12;
  v15 = *MEMORY[0x1E0CB2D50];
  v16[0] = v10;
  v8 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v9 = (void *)objc_msgSend(v7, "initWithDomain:code:userInfo:", CFSTR("com.apple.AppleMediaDiscovery"), v6);

  objc_storeStrong(&v10, 0);
  objc_storeStrong(&location, 0);
  return v9;
}

@end
