@implementation CLKUserActivity

- (CLKUserActivity)initWithUserActivity:(id)a3
{
  id v5;
  CLKUserActivity *v6;
  CLKUserActivity *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLKUserActivity;
  v6 = -[CLKUserActivity init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_userActivity, a3);

  return v7;
}

- (CLKUserActivity)initWithEncodedUserActivity:(id)a3
{
  id v5;
  CLKUserActivity *v6;
  CLKUserActivity *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLKUserActivity;
  v6 = -[CLKUserActivity init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_encodedUserActivity, a3);

  return v7;
}

- (NSUserActivity)userActivity
{
  NSUserActivity *userActivity;
  void *v4;
  NSUserActivity *v5;
  NSUserActivity *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  userActivity = self->_userActivity;
  if (!userActivity)
  {
    if (self->_encodedUserActivity)
    {
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", self->_encodedUserActivity, 0);
      v5 = (NSUserActivity *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1960]), "_initWithUserActivityData:", v4);
      v6 = self->_userActivity;
      self->_userActivity = v5;

      if (!self->_userActivity)
      {
        CLKLoggingObjectForDomain(1);
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          -[CLKUserActivity userActivity].cold.1((uint64_t)&self->_encodedUserActivity, v7, v8, v9, v10, v11, v12, v13);

      }
      userActivity = self->_userActivity;
    }
    else
    {
      userActivity = 0;
    }
  }
  return userActivity;
}

- (NSString)encodedUserActivity
{
  NSString *encodedUserActivity;
  dispatch_semaphore_t v4;
  NSUserActivity *userActivity;
  NSObject *v6;
  dispatch_time_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSString *v15;
  NSString *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  NSObject *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  encodedUserActivity = self->_encodedUserActivity;
  if (encodedUserActivity)
    return encodedUserActivity;
  if (!self->_userActivity)
  {
    encodedUserActivity = 0;
    return encodedUserActivity;
  }
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__2;
  v28 = __Block_byref_object_dispose__2;
  v29 = 0;
  v4 = dispatch_semaphore_create(0);
  userActivity = self->_userActivity;
  v18 = MEMORY[0x24BDAC760];
  v19 = 3221225472;
  v20 = __38__CLKUserActivity_encodedUserActivity__block_invoke;
  v21 = &unk_24CBFA598;
  v23 = &v24;
  v6 = v4;
  v22 = v6;
  -[NSUserActivity _createUserActivityDataWithOptions:completionHandler:](userActivity, "_createUserActivityDataWithOptions:completionHandler:", MEMORY[0x24BDBD1B8], &v18);
  v7 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v6, v7))
  {
    CLKLoggingObjectForDomain(1);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CLKUserActivity encodedUserActivity].cold.1((uint64_t)&self->_userActivity, v8, v9, v10, v11, v12, v13, v14);

  }
  objc_msgSend((id)v25[5], "base64EncodedStringWithOptions:", 0, v18, v19, v20, v21);
  v15 = (NSString *)objc_claimAutoreleasedReturnValue();
  v16 = self->_encodedUserActivity;
  self->_encodedUserActivity = v15;

  _Block_object_dispose(&v24, 8);
  return self->_encodedUserActivity;
}

void __38__CLKUserActivity_encodedUserActivity__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodedUserActivity, 0);
  objc_storeStrong((id *)&self->_userActivity, 0);
}

- (void)userActivity
{
  OUTLINED_FUNCTION_0(&dword_2114F4000, a2, a3, "Failed to decode user activity %@", a5, a6, a7, a8, 2u);
}

- (void)encodedUserActivity
{
  OUTLINED_FUNCTION_0(&dword_2114F4000, a2, a3, "Failed to encode user activity %@. Semaphore timed out.", a5, a6, a7, a8, 2u);
}

@end
