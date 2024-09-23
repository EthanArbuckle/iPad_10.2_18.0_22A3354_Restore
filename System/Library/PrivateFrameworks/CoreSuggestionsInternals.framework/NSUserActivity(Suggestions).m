@implementation NSUserActivity(Suggestions)

- (id)sg_serialize
{
  dispatch_semaphore_t v2;
  NSObject *v3;
  id v4;
  _QWORD v6[5];
  NSObject *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__25299;
  v13 = __Block_byref_object_dispose__25300;
  v14 = 0;
  v2 = dispatch_semaphore_create(0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__NSUserActivity_Suggestions__sg_serialize__block_invoke;
  v6[3] = &unk_1E7DB1548;
  v8 = &v9;
  v6[4] = a1;
  v3 = v2;
  v7 = v3;
  objc_msgSend(a1, "_createUserActivityStringsWithOptions:completionHandler:", 0, v6);
  objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:", v3);
  v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v4;
}

+ (id)sg_userActivityWithRequiredString:()Suggestions
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0CA5920];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "_initWithUserActivityStrings:secondaryString:optionalData:", v4, 0, 0);

  return v5;
}

@end
