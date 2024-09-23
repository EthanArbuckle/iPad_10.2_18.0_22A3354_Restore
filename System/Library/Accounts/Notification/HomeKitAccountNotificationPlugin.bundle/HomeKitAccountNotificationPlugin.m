void sub_230F24CBC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_230F24D00(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x2348C92C8]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      v9 = 138543618;
      v10 = v7;
      v11 = 2112;
      v12 = v8;
      _os_log_impl(&dword_230F23000, v6, OS_LOG_TYPE_ERROR, "%{public}@Error occurred while notifying homed about addition of primary account: %@", (uint8_t *)&v9, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }
  objc_msgSend(*(id *)(a1 + 32), "homeKitConnection");

}

void sub_230F24E14(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x2348C92C8]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      v9 = 138543618;
      v10 = v7;
      v11 = 2112;
      v12 = v8;
      _os_log_impl(&dword_230F23000, v6, OS_LOG_TYPE_ERROR, "%{public}@Error occurred while notifying homed about primary account deletion : %@", (uint8_t *)&v9, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }
  objc_msgSend(*(id *)(a1 + 32), "homeKitConnection");

}

void sub_230F24F28(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x2348C92C8]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      v9 = 138543618;
      v10 = v7;
      v11 = 2112;
      v12 = v8;
      _os_log_impl(&dword_230F23000, v6, OS_LOG_TYPE_ERROR, "%{public}@Error occurred while notifying homed about primary account modification : %@", (uint8_t *)&v9, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }
  objc_msgSend(*(id *)(a1 + 32), "homeKitConnection");

}

void sub_230F2503C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x2348C92C8]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      v9 = 138543618;
      v10 = v7;
      v11 = 2112;
      v12 = v8;
      _os_log_impl(&dword_230F23000, v6, OS_LOG_TYPE_ERROR, "%{public}@Error occurred while notifying homed about primary account change : %@", (uint8_t *)&v9, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }
  objc_msgSend(*(id *)(a1 + 32), "homeKitConnection");

}

void sub_230F25190()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_25414BD68;
  qword_25414BD68 = v0;

}

uint64_t HMFCreateOSLogHandle()
{
  return MEMORY[0x24BE3EA08]();
}

uint64_t HMFEqualObjects()
{
  return MEMORY[0x24BE3EBA8]();
}

uint64_t HMFGetLogIdentifier()
{
  return MEMORY[0x24BE3EBB8]();
}

uint64_t HMFGetOSLogHandle()
{
  return MEMORY[0x24BE3EBC0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x24BDAF470]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

end(v15, "username");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "username");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = HMFEqualObjects();

      if (v34)
      {
        objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "productClass") == 6;

        if (v36)
        {
          v37 = (void *)MEMORY[0x2348C92C8]();
          HMFGetOSLogHandle();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BE3F250], "defaultFormatter");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "privateStringForObjectValue:", v15);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BE3F250], "defaultFormatter");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "privateStringForObjectValue:", v49);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v60 = v39;
            v61 = 2112;
            v62 = v41;
            v63 = 2112;
            v64 = v43;
            _os_log_impl(&dword_230F23000, v38, OS_LOG_TYPE_DEBUG, "%{public}@got account username modification newAccount: %@, oldAccount: %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v37);
          -[HomeKitAccountNotificationPlugin homeKitConnection](self, "homeKitConnection");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v51[0] = MEMORY[0x24BDAC760];
          v51[1] = 3221225472;
          v51[2] = sub_230F2503C;
          v51[3] = &unk_24FFB3E70;
          v51[4] = self;
          v52 = v16;
          objc_msgSend(v44, "notifyAccountStatusUpdate:accountIdentifier:withCompletionHandler:", 3, 0, v51);

        }
      }
    }

  }
}

- (HMClientConnection)homeKitConnection
{
  return self->_homeKitConnection;
}

- (void)setHomeKitConnection:(id)a3
{
  objc_storeStrong((id *)&self->_homeKitConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeKitConnection, 0);
}

+ (id)logCategory
{
  if (qword_25414BD60 != -1)
    dispatch_once(&qword_25414BD60, &unk_24FFB3EB0);
  return (id)qword_25414BD68;
}

@end
