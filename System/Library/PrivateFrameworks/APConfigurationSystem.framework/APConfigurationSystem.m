void sub_235C3AD08(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_235C3DF88(void **a1, const char *a2, uint64_t a3)
{
  char v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend_cancelled(a1[4], a2, a3);
  APLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((v4 & 1) != 0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_235C39000, v6, OS_LOG_TYPE_INFO, "Request was cancelled and data task is not created.", buf, 2u);
    }

  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_absoluteString(a1[5], v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v9;
      _os_log_impl(&dword_235C39000, v6, OS_LOG_TYPE_DEFAULT, "Starting request to: %{public}@.", buf, 0xCu);

    }
    objc_initWeak((id *)buf, a1[4]);
    v10 = a1[6];
    v11 = (uint64_t)a1[5];
    v15 = MEMORY[0x24BDAC760];
    v16 = 3221225472;
    v17 = sub_235C3E168;
    v18 = &unk_2506FE568;
    objc_copyWeak(&v20, (id *)buf);
    v19 = a1[6];
    objc_msgSend_GET_headers_withCompletionHandler_(v10, v12, v11, 0, &v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setSessionDataTask_(a1[4], v14, (uint64_t)v13, v15, v16, v17, v18);

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
}

void sub_235C3E144(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_235C3E168(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  const char *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  _QWORD block[5];
  id v10;
  id v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend_responseQueue(WeakRetained, v5, v6);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_235C3E228;
    block[3] = &unk_2506FE540;
    block[4] = v7;
    v10 = v3;
    v11 = *(id *)(a1 + 32);
    dispatch_async(v8, block);

  }
}

uint64_t sub_235C3E228(uint64_t a1)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel__httpResponse_session_, *(_QWORD *)(a1 + 40));
}

void sub_235C3E2A4(uint64_t a1, const char *a2)
{
  const char *v3;
  uint64_t v4;
  const char *v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint8_t v15[16];

  objc_msgSend_setCancelled_(*(void **)(a1 + 32), a2, 1);
  objc_msgSend_sessionDataTask(*(void **)(a1 + 32), v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    APLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_235C39000, v7, OS_LOG_TYPE_INFO, "Config System Request: Data task canceled.", v15, 2u);
    }

    objc_msgSend_cancel(v6, v8, v9);
  }
  objc_msgSend__runCompletionHandlerWithSuccess_data_(*(void **)(a1 + 32), v5, 0, 0);
  v10 = *(void **)(a1 + 32);
  v13 = objc_msgSend__configurationVersion(v10, v11, v12);
  objc_msgSend__sendCoreAnalyticsWithUpdateStatus_version_(v10, v14, 1513, v13);

}

void sub_235C3F9E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  id *v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va1, 8);
  objc_destroyWeak(v9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_235C3FA1C(uint64_t a1, uint64_t a2)
{
  objc_moveWeak((id *)(a1 + 40), (id *)(a2 + 40));
}

void sub_235C3FA28(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 40));
}

void sub_235C3FA30(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void (**WeakRetained)(id, _QWORD);
  const char *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend_datasource(*(void **)(a1 + 32), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_subdirectoriesAtURL_(v6, v7, (uint64_t)v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend__versionInDirectoryWithURLs_(*(void **)(a1 + 32), v9, (uint64_t)v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v10;
  if (v10)
  {
    v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v15 = objc_msgSend_integerValue(v10, v11, v12);
    if (v14 <= v15)
      v16 = v15;
    else
      v16 = v14;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v16;
  }
  else
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v17 = v8;
    v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v26, v30, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v27 != v21)
            objc_enumerationMutation(v17);
          v23 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          WeakRetained = (void (**)(id, _QWORD))objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48)
                                                                                                  + 8)
                                                                                      + 40));
          WeakRetained[2](WeakRetained, v23);

        }
        v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v25, (uint64_t)&v26, v30, 16);
      }
      while (v20);
    }

  }
}

uint64_t PurposeConfigSystemConfigurationStore.__allocating_init(configDataSource:fallback:)(__int128 *a1, __int128 *a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  sub_235C3FF7C(a1, v4 + 16);
  sub_235C3FF7C(a2, v4 + 56);
  return v4;
}

uint64_t PurposeConfigSystemConfigurationStore.init(configDataSource:fallback:)(__int128 *a1, __int128 *a2)
{
  uint64_t v2;

  sub_235C3FF7C(a1, v2 + 16);
  sub_235C3FF7C(a2, v2 + 56);
  return v2;
}

uint64_t sub_235C3FF7C(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t PurposeConfigSystemConfigurationStore.deinit()
{
  uint64_t v0;

  sub_235C3FFB8(v0 + 16);
  sub_235C3FFB8(v0 + 56);
  return v0;
}

uint64_t sub_235C3FFB8(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t PurposeConfigSystemConfigurationStore.__deallocating_deinit()
{
  uint64_t v0;

  sub_235C3FFB8(v0 + 16);
  sub_235C3FFB8(v0 + 56);
  return swift_deallocClassInstance();
}

uint64_t PurposeConfigSystemConfigurationStore.configurationFor(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  _QWORD v21[2];

  v3 = v2;
  v6 = sub_235C40614();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235C40224(&qword_256375A10);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = v2[5];
  v13 = v2[6];
  sub_235C40264(v2 + 2, v12);
  v14 = (void *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 8))(a1, v12, v13);
  if (v14)
  {
    sub_235C40324(v14, (uint64_t)v11);
    swift_unknownObjectRelease();
    v15 = sub_235C405E4();
    v16 = *(_QWORD *)(v15 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v11, 1, v15) != 1)
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v16 + 32))(a2, v11, v15);
    sub_235C402A8((uint64_t)v11);
  }
  sub_235C405FC();
  v17 = sub_235C40608();
  v18 = sub_235C4062C();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v19 = 134217984;
    v21[1] = a1;
    sub_235C40638();
    _os_log_impl(&dword_235C39000, v17, v18, "Using fallback configuration for purpose %ld", v19, 0xCu);
    MEMORY[0x23B7DC20C](v19, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_235C40264(v3 + 7, v3[10]);
  return sub_235C405F0();
}

uint64_t sub_235C40224(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7DC1DC]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

_QWORD *sub_235C40264(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_235C40288@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return PurposeConfigSystemConfigurationStore.configurationFor(_:)(a1, a2);
}

uint64_t sub_235C402A8(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_235C40224(&qword_256375A10);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for PurposeConfigSystemConfigurationStore()
{
  return objc_opt_self();
}

uint64_t method lookup function for PurposeConfigSystemConfigurationStore()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PurposeConfigSystemConfigurationStore.__allocating_init(configDataSource:fallback:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of ConfigSystemPurposeDataSource.configFor(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t sub_235C40324@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  unsigned int *v14;
  char v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;

  v4 = sub_235C405CC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = objc_msgSend(a1, sel_boundary);
  if (!v8)
    goto LABEL_14;
  v9 = v8;
  v10 = sub_235C40620();
  v12 = v11;

  if (!v12)
    goto LABEL_14;
  v13 = v10 == 0x6C616E7265747865 && v12 == 0xE800000000000000;
  if (!v13 && (sub_235C40644() & 1) == 0)
  {
    if (v10 == 0x6C616E7265746E69 && v12 == 0xE800000000000000)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v16 = sub_235C40644();
      swift_bridgeObjectRelease();
      if ((v16 & 1) == 0)
      {
LABEL_14:
        v17 = sub_235C405E4();
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(a2, 1, 1, v17);
      }
    }
    v14 = (unsigned int *)MEMORY[0x24BDFD3A0];
    goto LABEL_17;
  }
  swift_bridgeObjectRelease();
  v14 = (unsigned int *)MEMORY[0x24BDFD398];
LABEL_17:
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *v14, v4);
  sub_235C405D8();
  v19 = sub_235C405E4();
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(a2, 0, 1, v19);
}

uint64_t ProductionConfigSystemPurposeDataSource.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t ProductionConfigSystemPurposeDataSource.init()()
{
  uint64_t v0;

  return v0;
}

uint64_t ProductionConfigSystemPurposeDataSource.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t ProductionConfigSystemPurposeDataSource.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

id ProductionConfigSystemPurposeDataSource.configFor(_:)(uint64_t a1)
{
  return objc_msgSend((id)objc_opt_self(), sel_purposeConfig_, a1);
}

id sub_235C4055C(uint64_t a1)
{
  return objc_msgSend((id)objc_opt_self(), sel_purposeConfig_, a1);
}

uint64_t type metadata accessor for ProductionConfigSystemPurposeDataSource()
{
  return objc_opt_self();
}

uint64_t method lookup function for ProductionConfigSystemPurposeDataSource()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ProductionConfigSystemPurposeDataSource.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t sub_235C405CC()
{
  return MEMORY[0x24BDFD3A8]();
}

uint64_t sub_235C405D8()
{
  return MEMORY[0x24BDFD3D0]();
}

uint64_t sub_235C405E4()
{
  return MEMORY[0x24BDFD3D8]();
}

uint64_t sub_235C405F0()
{
  return MEMORY[0x24BDFD3F0]();
}

uint64_t sub_235C405FC()
{
  return MEMORY[0x24BDFD438]();
}

uint64_t sub_235C40608()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_235C40614()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_235C40620()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_235C4062C()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_235C40638()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_235C40644()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t APLogForCategory()
{
  return MEMORY[0x24BDFD458]();
}

uint64_t APSimulateCrash()
{
  return MEMORY[0x24BDFD468]();
}

uint64_t CreateDiagnosticReport()
{
  return MEMORY[0x24BDFD470]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x24BDD1208](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
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

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x24BEDF260](strm, *(_QWORD *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x24BEDF268](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x24BEDF270](strm, *(_QWORD *)&windowBits, version, *(_QWORD *)&stream_size);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
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

void objc_moveWeak(id *to, id *from)
{
  MEMORY[0x24BEDD0F8](to, from);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)((uint64_t (*)(id, SEL))MEMORY[0x24BEDD108])(a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0000](__str, __endptr, *(_QWORD *)&__base);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

