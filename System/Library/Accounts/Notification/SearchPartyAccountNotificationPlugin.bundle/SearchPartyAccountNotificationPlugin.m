void sub_230F5A974(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  objc_destroyWeak((id *)(v8 - 40));
  _Unwind_Resume(a1);
}

uint64_t sub_230F5A994(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_230F5A9A4(uint64_t a1)
{

}

void sub_230F5A9AC(uint64_t a1)
{
  id WeakRetained;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  int v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend_session(WeakRetained, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v8 = objc_alloc(MEMORY[0x24BE2FE78]);
    objc_msgSend_serviceDescription(WeakRetained, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend_initWithServiceDescription_(v8, v12, (uint64_t)v11);
    objc_msgSend_setSession_(WeakRetained, v14, (uint64_t)v13);

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_serviceDescription(WeakRetained, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_machService(v17, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138412290;
      v31 = v20;
      _os_log_impl(&dword_230F59000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Establishing XPC connection to %@", (uint8_t *)&v30, 0xCu);

    }
    objc_msgSend_session(WeakRetained, v15, v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_resume(v21, v22, v23);

  }
  objc_msgSend_session(WeakRetained, v6, v7);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_proxy(v24, v25, v26);
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v29 = *(void **)(v28 + 40);
  *(_QWORD *)(v28 + 40) = v27;

}

void sub_230F5AC40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  objc_destroyWeak((id *)(v8 - 40));
  _Unwind_Resume(a1);
}

void sub_230F5AC60(uint64_t a1)
{
  id WeakRetained;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  int v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend_session(WeakRetained, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v8 = objc_alloc(MEMORY[0x24BE2FE78]);
    objc_msgSend_serviceDescription(WeakRetained, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend_initWithServiceDescription_(v8, v12, (uint64_t)v11);
    objc_msgSend_setSession_(WeakRetained, v14, (uint64_t)v13);

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_serviceDescription(WeakRetained, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_machService(v17, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138412290;
      v30 = v20;
      _os_log_impl(&dword_230F59000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Establishing XPC connection to %@", (uint8_t *)&v29, 0xCu);

    }
    objc_msgSend_session(WeakRetained, v15, v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_resume(v21, v22, v23);

  }
  objc_msgSend_session(WeakRetained, v6, v7);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_syncProxyWithErrorHandler_(v24, v25, *(_QWORD *)(a1 + 32));
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v28 = *(void **)(v27 + 40);
  *(_QWORD *)(v27 + 40) = v26;

}

void sub_230F5B020(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  NSObject *v4;
  _QWORD block[5];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    sub_230F5BA94();
  objc_msgSend_serialQueue(*(void **)(a1 + 32), v2, v3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_230F5B0B0;
  block[3] = &unk_24FFBD650;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v4, block);

}

uint64_t sub_230F5B0B0(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;

  objc_msgSend_session(*(void **)(a1 + 32), a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_invalidate(v4, v5, v6);

  return objc_msgSend_setSession_(*(void **)(a1 + 32), v7, 0);
}

void sub_230F5B0EC(void **a1, const char *a2)
{
  void *v3;
  const char *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  objc_msgSend_userAgentSynchronousProxyWithErrorHandler_(a1[4], a2, (uint64_t)&unk_24FFBD690);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_230F5B1C8;
  v5[3] = &unk_24FFBD6B8;
  v6 = a1[5];
  v7 = a1[6];
  objc_msgSend_removeLocalAccountDataWithCompletion_(v3, v4, (uint64_t)v5);

}

void sub_230F5B18C(uint64_t a1, uint64_t a2)
{
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    sub_230F5BAD8(a2);
}

void sub_230F5B1C8(uint64_t a1, int a2)
{
  const char *v4;
  uint64_t v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a2;
    _os_log_impl(&dword_230F59000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "removeLocalAccountDataWithCompletion returned %d", (uint8_t *)v6, 8u);
  }
  objc_msgSend_cancel(*(void **)(a1 + 32), v4, v5);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_230F5B72C(uint64_t a1, void *a2)
{
  id v2;
  _BOOL4 v3;
  NSObject *v4;
  const char *v5;
  uint32_t v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v3)
    {
      v7 = 138543362;
      v8 = v2;
      v4 = MEMORY[0x24BDACB70];
      v5 = "Failed to update masked phone number: %{public}@.";
      v6 = 12;
LABEL_6:
      _os_log_impl(&dword_230F59000, v4, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v7, v6);
    }
  }
  else if (v3)
  {
    LOWORD(v7) = 0;
    v4 = MEMORY[0x24BDACB70];
    v5 = "Masked phone number updated successfully.";
    v6 = 2;
    goto LABEL_6;
  }

}

void sub_230F5BA7C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_230F5BA94()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_230F59000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "removeLocalAccountDataWithCompletion timed out!", v0, 2u);
}

void sub_230F5BAD8(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 138412290;
  v2 = a1;
  _os_log_error_impl(&dword_230F59000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "canRemoveAccount sync XPC error: %@", (uint8_t *)&v1, 0xCu);
  sub_230F5BA8C();
}

void sub_230F5BB50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_230F5BA7C(&dword_230F59000, MEMORY[0x24BDACB70], a3, "oldMaskedPhoneNumber: %@.", a5, a6, a7, a8, 2u);
  sub_230F5BA8C();
}

void sub_230F5BBBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_230F5BA7C(&dword_230F59000, MEMORY[0x24BDACB70], a3, "maskedPhoneNumber: %@.", a5, a6, a7, a8, 2u);
  sub_230F5BA8C();
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

3);
    }
  }
LABEL_39:

}

- (id)_extractPhoneNumberFrom:(id)a3
{
  id v3;
  const char *v4;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  __CFString *v12;
  uint64_t i;
  void *v14;
  const char *v15;
  void *v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v5 = v3;
  if (v3)
  {
    objc_msgSend_objectForKeyedSubscript_(v3, v4, (uint64_t)CFSTR("obfuscatedPhoneNumbers"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v19, v23, 16);
    if (v8)
    {
      v10 = v8;
      v11 = *(_QWORD *)v20;
      v12 = &stru_24FFBD7A0;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v6);
          v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend_objectForKeyedSubscript_(v14, v9, (uint64_t)CFSTR("recentlyUsed"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            objc_msgSend_objectForKeyedSubscript_(v14, v15, (uint64_t)CFSTR("maskedPhoneNumber"));
            v17 = objc_claimAutoreleasedReturnValue();

            v12 = (__CFString *)v17;
          }

        }
        v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v19, v23, 16);
      }
      while (v10);
    }
    else
    {
      v12 = &stru_24FFBD7A0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)primaryAccountModified
{
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint8_t v8[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_230F59000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "primaryAccountModified", v8, 2u);
  }
  objc_msgSend_userAgentProxy(self, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_primaryAccountModified(v5, v6, v7);

}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (FMXPCServiceDescription)serviceDescription
{
  return self->_serviceDescription;
}

- (void)setServiceDescription:(id)a3
{
  objc_storeStrong((id *)&self->_serviceDescription, a3);
}

- (FMXPCSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_serviceDescription, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_akAccountManager, 0);
}

@end
