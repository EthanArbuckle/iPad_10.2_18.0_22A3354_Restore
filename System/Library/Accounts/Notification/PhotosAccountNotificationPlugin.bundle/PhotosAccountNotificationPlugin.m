void sub_230F519E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

id sub_230F522B8(uint64_t a1)
{
  int v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  int v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 60) || *(_BYTE *)(a1 + 61))
  {
    v2 = *(_DWORD *)(a1 + 56);
    if (v2 == 1)
    {
      if (*(_BYTE *)(a1 + 62))
      {
        PLPreferencesGetLog();
        v3 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
        {
          v4 = *(_QWORD *)(a1 + 32);
          v30 = 138412290;
          v31 = v4;
          _os_log_impl(&dword_230F50000, v3, OS_LOG_TYPE_INFO, "Enabling shared album for new account %@", (uint8_t *)&v30, 0xCu);
        }

        objc_msgSend(*(id *)(a1 + 40), "_setSharedAlbumEnabled:", 1);
      }
      if (*(_BYTE *)(a1 + 63))
      {
        PLPreferencesGetLog();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          v6 = *(_QWORD *)(a1 + 32);
          v30 = 138412290;
          v31 = v6;
          _os_log_impl(&dword_230F50000, v5, OS_LOG_TYPE_INFO, "Enabling My Photo Stream for new account %@", (uint8_t *)&v30, 0xCu);
        }

        objc_msgSend(*(id *)(a1 + 40), "_setPhotoStreamEnabled:", 1);
      }
      if (*(_BYTE *)(a1 + 64))
      {
        PLPreferencesGetLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          v8 = *(_QWORD *)(a1 + 32);
          v30 = 138412290;
          v31 = v8;
          _os_log_impl(&dword_230F50000, v7, OS_LOG_TYPE_INFO, "Enabling iCPL for new account %@", (uint8_t *)&v30, 0xCu);
        }

        objc_msgSend(*(id *)(a1 + 40), "_setiCPLEnabled:", 1);
      }
      v2 = *(_DWORD *)(a1 + 56);
    }
    if (v2 == 2)
    {
      if (!*(_BYTE *)(a1 + 62))
        goto LABEL_62;
      if (!*(_BYTE *)(a1 + 65))
      {
        PLPreferencesGetLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          v10 = *(_QWORD *)(a1 + 32);
          v30 = 138412290;
          v31 = v10;
          _os_log_impl(&dword_230F50000, v9, OS_LOG_TYPE_INFO, "Enabling shared album for modified account %@", (uint8_t *)&v30, 0xCu);
        }

        objc_msgSend(*(id *)(a1 + 40), "_setSharedAlbumEnabled:", 1);
        if (!*(_BYTE *)(a1 + 62))
        {
LABEL_62:
          if (*(_BYTE *)(a1 + 65))
          {
            PLPreferencesGetLog();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
            {
              v12 = *(_QWORD *)(a1 + 32);
              v30 = 138412290;
              v31 = v12;
              _os_log_impl(&dword_230F50000, v11, OS_LOG_TYPE_INFO, "Disabling shared album for modified account %@", (uint8_t *)&v30, 0xCu);
            }

            objc_msgSend(*(id *)(a1 + 40), "_setSharedAlbumEnabled:", 0);
          }
        }
      }
      if (!*(_BYTE *)(a1 + 63))
        goto LABEL_63;
      if (!*(_BYTE *)(a1 + 66))
      {
        PLPreferencesGetLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v14 = *(_QWORD *)(a1 + 32);
          v30 = 138412290;
          v31 = v14;
          _os_log_impl(&dword_230F50000, v13, OS_LOG_TYPE_INFO, "Enabling My Photo Stream for modified account %@", (uint8_t *)&v30, 0xCu);
        }

        objc_msgSend(*(id *)(a1 + 40), "_setPhotoStreamEnabled:", 1);
        if (!*(_BYTE *)(a1 + 63))
        {
LABEL_63:
          if (*(_BYTE *)(a1 + 66))
          {
            PLPreferencesGetLog();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              v16 = *(_QWORD *)(a1 + 32);
              v30 = 138412290;
              v31 = v16;
              _os_log_impl(&dword_230F50000, v15, OS_LOG_TYPE_INFO, "Disabling My Photo Stream for modified account %@", (uint8_t *)&v30, 0xCu);
            }

            objc_msgSend(*(id *)(a1 + 40), "_setPhotoStreamEnabled:", 0);
          }
        }
      }
      if (!*(_BYTE *)(a1 + 64))
        goto LABEL_64;
      if (!*(_BYTE *)(a1 + 67))
      {
        PLPreferencesGetLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          v18 = *(_QWORD *)(a1 + 32);
          v30 = 138412290;
          v31 = v18;
          _os_log_impl(&dword_230F50000, v17, OS_LOG_TYPE_INFO, "Enabling iCPL for modified account %@", (uint8_t *)&v30, 0xCu);
        }

        objc_msgSend(*(id *)(a1 + 40), "_setiCPLEnabled:", 1);
        if (!*(_BYTE *)(a1 + 64))
        {
LABEL_64:
          if (*(_BYTE *)(a1 + 67))
          {
            PLPreferencesGetLog();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              v20 = *(_QWORD *)(a1 + 32);
              v30 = 138412290;
              v31 = v20;
              _os_log_impl(&dword_230F50000, v19, OS_LOG_TYPE_INFO, "Disabling iCPL for modified account %@", (uint8_t *)&v30, 0xCu);
            }

            objc_msgSend(*(id *)(a1 + 40), "_setiCPLEnabled:", 0);
          }
        }
      }
    }
    if (*(_DWORD *)(a1 + 56) == 3)
    {
      PLPreferencesGetLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v22 = *(_QWORD *)(a1 + 32);
        v30 = 138412290;
        v31 = v22;
        _os_log_impl(&dword_230F50000, v21, OS_LOG_TYPE_INFO, "Account %@ deleted, turning off Photos services", (uint8_t *)&v30, 0xCu);
      }

      if (*(_BYTE *)(a1 + 65))
      {
        PLPreferencesGetLog();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          v24 = *(_QWORD *)(a1 + 32);
          v30 = 138412290;
          v31 = v24;
          _os_log_impl(&dword_230F50000, v23, OS_LOG_TYPE_INFO, "Disabling shared album for deleted account %@", (uint8_t *)&v30, 0xCu);
        }

        objc_msgSend(*(id *)(a1 + 40), "_setSharedAlbumEnabled:", 0);
      }
      if (*(_BYTE *)(a1 + 66))
      {
        PLPreferencesGetLog();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          v26 = *(_QWORD *)(a1 + 32);
          v30 = 138412290;
          v31 = v26;
          _os_log_impl(&dword_230F50000, v25, OS_LOG_TYPE_INFO, "Disabling My Photo Stream for deleted account %@", (uint8_t *)&v30, 0xCu);
        }

        objc_msgSend(*(id *)(a1 + 40), "_setPhotoStreamEnabled:", 0);
      }
      PLPreferencesGetLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        v28 = *(_QWORD *)(a1 + 32);
        v30 = 138412290;
        v31 = v28;
        _os_log_impl(&dword_230F50000, v27, OS_LOG_TYPE_INFO, "Disabling iCPL for deleted account %@", (uint8_t *)&v30, 0xCu);
      }

      PLRecordiCPLDisableState();
      objc_msgSend(*(id *)(a1 + 40), "_setiCPLEnabled:", 0);
    }
  }
  return (id)objc_opt_self();
}

void sub_230F528B4(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  PLRecordiCPLEnableState();
  if (a2)
  {
    PLPreferencesGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_230F50000, v6, OS_LOG_TYPE_DEFAULT, "Auto-enable iCloud Photos for account %@", (uint8_t *)&v10, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "setEnabled:forDataclass:", 1, *MEMORY[0x24BDB4590]);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  else if (v5)
  {
    PLPreferencesGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = 138412546;
      v11 = v9;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_230F50000, v8, OS_LOG_TYPE_ERROR, "Unable to auto-enable iCloud Photos for account %@: %@", (uint8_t *)&v10, 0x16u);
    }

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

uint64_t PLCanEnableCloudPhotoLibraryForAccount()
{
  return MEMORY[0x24BE72080]();
}

uint64_t PLCanEnableSharedStreamsForAccount()
{
  return MEMORY[0x24BE72088]();
}

uint64_t PLIsEDUMode()
{
  return MEMORY[0x24BE722A0]();
}

uint64_t PLPlatformCloudPhotosPrimarySyncSupported()
{
  return MEMORY[0x24BE72320]();
}

uint64_t PLPlatformMediaStreamSupported()
{
  return MEMORY[0x24BE72328]();
}

uint64_t PLPlatformSharedStreamsSupported()
{
  return MEMORY[0x24BE72330]();
}

uint64_t PLPreferencesGetLog()
{
  return MEMORY[0x24BE72338]();
}

uint64_t PLRecordiCPLDisableState()
{
  return MEMORY[0x24BE721D8]();
}

uint64_t PLRecordiCPLEnableState()
{
  return MEMORY[0x24BE721E0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x24BDAF438]();
}

uint64_t pl_dispatch_async_without_boost_on_queue()
{
  return MEMORY[0x24BE72390]();
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            _os_log_impl(&dword_230F50000, v7, OS_LOG_TYPE_INFO, "%{public}@ My Photo Stream in library bundle at %@", (uint8_t *)&v12, 0x16u);

      }
      -[NSObject setPhotoStreamEnabled:](v5, "setPhotoStreamEnabled:", v3);
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v11 = CFSTR("disable");
        if (v3)
          v11 = CFSTR("enable");
        v12 = 138412290;
        v13 = v11;
        _os_log_impl(&dword_230F50000, v7, OS_LOG_TYPE_ERROR, "Unable to %@ My Photo Stream due to missing library bundle", (uint8_t *)&v12, 0xCu);
      }

      v5 = 0;
    }
  }
  else
  {
    PLPreferencesGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v10 = CFSTR("disable");
      if (v3)
        v10 = CFSTR("enable");
      v12 = 138412290;
      v13 = v10;
      _os_log_impl(&dword_230F50000, v5, OS_LOG_TYPE_ERROR, "Unable to %@ My Photo Stream for unsupported platform", (uint8_t *)&v12, 0xCu);
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unboostingQueue, 0);
}

@end
