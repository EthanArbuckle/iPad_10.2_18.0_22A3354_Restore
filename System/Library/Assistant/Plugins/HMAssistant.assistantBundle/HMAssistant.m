void sub_2176CC64C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  id *v33;

  objc_destroyWeak(v33);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2176CC96C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_2176CC97C(uint64_t a1)
{

}

void sub_2176CC984(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  __int128 v20;
  _QWORD block[4];
  id v22;
  id v23;
  id v24;
  __int128 v25;
  uint64_t v26;
  char v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BE3F248], "sharedPreferences");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "preferenceForKey:", CFSTR("dropHomeNamesFromSyncData"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

    v11 = (void *)MEMORY[0x219A0FE78]();
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      mach_absolute_time();
      v14 = UpTicksToMilliseconds();
      v15 = v14 - objc_msgSend(WeakRetained, "fetchHomeConfigurationStartTime");
      HMFBooleanToString();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v29 = v13;
      v30 = 2048;
      v31 = v15;
      v32 = 2112;
      v33 = v16;
      _os_log_impl(&dword_2176CA000, v12, OS_LOG_TYPE_INFO, "%{public}@Finished sync data retrieval refresh in %llu milliseconds - dropping home names from sync data %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(WeakRetained, "queue");
    v17 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_2176CCCB0;
    block[3] = &unk_24D7EFC70;
    v22 = v5;
    v18 = v6;
    v27 = v10;
    v26 = *(_QWORD *)(a1 + 48);
    v23 = v18;
    v24 = WeakRetained;
    v20 = *(_OWORD *)(a1 + 32);
    v19 = (id)v20;
    v25 = v20;
    dispatch_async(v17, block);

  }
}

uint64_t sub_2176CCBB0(uint64_t a1)
{
  uint64_t result;
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  result = objc_msgSend(*(id *)(a1 + 32), "done");
  if ((result & 1) == 0)
  {
    v3 = (void *)MEMORY[0x219A0FE78]();
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_2176CA000, v4, OS_LOG_TYPE_INFO, "%{public}@homed did not respond", (uint8_t *)&v7, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    objc_msgSend(*(id *)(a1 + 32), "waitGroup");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_group_leave(v6);

    return objc_msgSend(*(id *)(a1 + 32), "setDone:", 1);
  }
  return result;
}

uint64_t sub_2176CCCB0(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  NSObject *v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t result;
  void *v42;
  id v43;
  NSObject *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  id obj;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  _BYTE v60[128];
  uint64_t v61;

  v1 = a1;
  v61 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = (void *)MEMORY[0x219A0FE78]();
    HMFGetOSLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = *(void **)(v1 + 32);
      *(_DWORD *)buf = 138543618;
      v57 = v4;
      v58 = 2112;
      v59 = v5;
      _os_log_impl(&dword_2176CA000, v3, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve Siri sync data - error %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v2);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "hmf_arrayForKey:", CFSTR("kSiriSyncDataEntitiesKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      getAssistantConfigurationVersion();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      v47 = v6;
      obj = v6;
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
      v9 = 0x24BDD1000uLL;
      if (v8)
      {
        v10 = v8;
        v11 = *(_QWORD *)v53;
        v49 = *MEMORY[0x24BE81F38];
        v12 = 1;
        v48 = *(_QWORD *)v53;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v53 != v11)
              objc_enumerationMutation(obj);
            v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE812C0]), "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i));
            v15 = v14;
            if (v14)
            {
              if (*(_BYTE *)(v1 + 80))
              {
                objc_msgSend(v14, "setHome:", 0);
                objc_msgSend(v15, "entityType");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v17 = objc_msgSend(v16, "isEqual:", v49);

                if (v17)
                  v14 = (void *)objc_msgSend(v15, "setName:", 0);
              }
              v18 = (void *)MEMORY[0x219A0FE78](v14);
              HMFGetOSLogHandle();
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v51 = v12;
                v20 = v9;
                v21 = v1;
                v22 = v7;
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "hm_shortDescription");
                v24 = v10;
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v57 = v23;
                v58 = 2112;
                v59 = v25;
                _os_log_impl(&dword_2176CA000, v19, OS_LOG_TYPE_INFO, "%{public}@Siri: entity: %@", buf, 0x16u);

                v10 = v24;
                v7 = v22;
                v1 = v21;
                v9 = v20;
                v11 = v48;
                v12 = v51;
              }

              objc_autoreleasePoolPop(v18);
              objc_msgSend(*(id *)(v9 + 1992), "stringWithFormat:", CFSTR("%@:%tu"), v7, v12);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              ++v12;
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 64) + 8) + 40), "addObject:", v15);
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 72) + 8) + 40), "addObject:", v26);

            }
          }
          v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
        }
        while (v10);
      }
      else
      {
        v12 = 1;
      }

      objc_msgSend(*(id *)(v9 + 1992), "stringWithFormat:", CFSTR("%@:%tu"), v7, v12);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v1 + 48), "setFinalAnchor:", v30);

      v31 = (void *)MEMORY[0x219A0FE78]();
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v1 + 48), "finalAnchor");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v57 = v33;
        v58 = 2112;
        v59 = v34;
        _os_log_impl(&dword_2176CA000, v32, OS_LOG_TYPE_INFO, "%{public}@finalAnchor is %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v31);
      v35 = *(void **)(*(_QWORD *)(*(_QWORD *)(v1 + 72) + 8) + 40);
      objc_msgSend(*(id *)(v1 + 48), "finalAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "addObject:", v36);

      v37 = *(void **)(v1 + 56);
      objc_msgSend(*(id *)(v1 + 48), "finalAnchor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "resetWithValidity:", v38);

      v6 = v47;
    }
    else
    {
      v27 = (void *)MEMORY[0x219A0FE78]();
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v57 = v29;
        _os_log_impl(&dword_2176CA000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@No sync entities from homed", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v27);
    }

  }
  v39 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 64) + 8) + 40), "copy");
  objc_msgSend(*(id *)(v1 + 48), "setEntities:", v39);

  v40 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 72) + 8) + 40), "copy");
  objc_msgSend(*(id *)(v1 + 48), "setAnchors:", v40);

  result = objc_msgSend(*(id *)(v1 + 48), "done");
  if ((result & 1) == 0)
  {
    v42 = (void *)MEMORY[0x219A0FE78]();
    v43 = *(id *)(v1 + 48);
    HMFGetOSLogHandle();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v57 = v45;
      _os_log_impl(&dword_2176CA000, v44, OS_LOG_TYPE_INFO, "%{public}@Leaving the dispatch group as it did not time out.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v42);
    objc_msgSend(*(id *)(v1 + 48), "waitGroup");
    v46 = objc_claimAutoreleasedReturnValue();
    dispatch_group_leave(v46);

    return objc_msgSend(*(id *)(v1 + 48), "setDone:", 1);
  }
  return result;
}

void sub_2176CD2E0()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_253E64B78;
  qword_253E64B78 = v0;

}

uint64_t HMDispatchQueueNameString()
{
  return MEMORY[0x24BDD5BA8]();
}

uint64_t HMFBooleanToString()
{
  return MEMORY[0x24BE3EA00]();
}

uint64_t HMFCreateOSLogHandle()
{
  return MEMORY[0x24BE3EA08]();
}

uint64_t HMFGetLogIdentifier()
{
  return MEMORY[0x24BE3EBB8]();
}

uint64_t HMFGetOSLogHandle()
{
  return MEMORY[0x24BE3EBC0]();
}

uint64_t UpTicksToMilliseconds()
{
  return MEMORY[0x24BE29AF0]();
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

uint64_t getAssistantConfigurationSnapshot()
{
  return MEMORY[0x24BDD7B40]();
}

uint64_t getAssistantConfigurationVersion()
{
  return MEMORY[0x24BDD7B48]();
}

uint64_t getLastSyncedAssistantConfigurationVersion()
{
  return MEMORY[0x24BDD7B50]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
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

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
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

