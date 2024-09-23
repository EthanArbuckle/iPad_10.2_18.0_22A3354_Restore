@implementation RepairResultInputs

- (BOOL)validateAndInitializeParameters:(id)a3
{
  id v4;
  NSNumber *v5;
  NSNumber *testStatusCode;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSNumber *v10;
  NSNumber *v11;
  NSNumber *testIdentifer;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSNumber *v16;
  char v18;
  uint8_t buf[4];
  NSNumber *v20;

  v18 = 0;
  v4 = a3;
  v5 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "NSNumberFromKey:lowerBound:upperBound:defaultValue:failed:", CFSTR("testStatusCode"), &off_100008668, &off_100008680, 0, &v18));
  testStatusCode = self->testStatusCode;
  self->testStatusCode = v5;

  v8 = handleForCategory(0, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = self->testStatusCode;
    *(_DWORD *)buf = 138412290;
    v20 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "testStatusCode : %@", buf, 0xCu);
  }

  v11 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "NSNumberFromKey:lowerBound:upperBound:defaultValue:failed:", CFSTR("testIdentifer"), &off_100008668, &off_100008680, 0, &v18));
  testIdentifer = self->testIdentifer;
  self->testIdentifer = v11;

  v14 = handleForCategory(0, v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = self->testIdentifer;
    *(_DWORD *)buf = 138412290;
    v20 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "testIdentifer: %@", buf, 0xCu);
  }

  return v18 == 0;
}

- (NSNumber)testStatusCode
{
  return self->testStatusCode;
}

- (NSNumber)testIdentifer
{
  return self->testIdentifer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->testIdentifer, 0);
  objc_storeStrong((id *)&self->testStatusCode, 0);
}

@end
