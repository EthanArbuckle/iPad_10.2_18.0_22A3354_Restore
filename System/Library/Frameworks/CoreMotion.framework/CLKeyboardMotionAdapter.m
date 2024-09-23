@implementation CLKeyboardMotionAdapter

- (void)inputReportForDevice:(id)a3 report:(char *)a4 length:(int64_t)a5
{
  uint64_t v8;
  NSObject *v9;
  __int16 v10;
  char v11;
  int v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  BOOL v18;
  NSObject *v19;
  NSObject *v20;
  char *v21;
  unsigned int v22;
  NSObject *v23;
  const char *v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  char *v29;
  _BYTE __dst[3];
  int v31;
  int64_t v32;
  __int16 v33;
  uint64_t v34;
  _BYTE buf[22];
  char v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (qword_1ECEDF888 != -1)
    dispatch_once(&qword_1ECEDF888, &unk_1E29534A8);
  v8 = qword_1ECEDF880;
  if (*(id *)(qword_1ECEDF880 + 48) == a3)
  {
    if (a5 != 30)
    {
      if (qword_1ECEDEE38 != -1)
        dispatch_once(&qword_1ECEDEE38, &unk_1E2945128);
      v19 = qword_1ECEDEE30;
      if (os_log_type_enabled((os_log_t)qword_1ECEDEE30, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = a5;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = 30;
        _os_log_impl(&dword_18F1DC000, v19, OS_LOG_TYPE_FAULT, "Bad motion report input %ld, expected %lu", buf, 0x16u);
      }
      if (sub_18F1FCA08(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1ECEDEE38 != -1)
          dispatch_once(&qword_1ECEDEE38, &unk_1E2945128);
        v31 = 134218240;
        v32 = a5;
        v33 = 2048;
        v34 = 30;
        goto LABEL_39;
      }
      return;
    }
    v10 = *(_WORD *)(a4 + 7);
    v11 = a4[17];
    v12 = *(_DWORD *)(a4 + 26);
    *(_QWORD *)buf = *(_QWORD *)(a4 + 9);
    *(_WORD *)&buf[20] = v10;
    v36 = v11;
    *(_QWORD *)&buf[8] = *(_QWORD *)(a4 + 18);
    *(_DWORD *)&buf[16] = v12;
    sub_18F1FD20C(*(unint64_t *)buf);
    v13 = buf;
    v14 = v8;
    v15 = 0;
    v16 = 23;
LABEL_56:
    sub_18F1FD2C8(v14, v15, (uint64_t)v13, v16);
    return;
  }
  if (*(id *)(qword_1ECEDF880 + 40) != a3)
  {
    if (qword_1ECEDEE38 != -1)
      dispatch_once(&qword_1ECEDEE38, &unk_1E2945128);
    v9 = qword_1ECEDEE30;
    if (os_log_type_enabled((os_log_t)qword_1ECEDEE30, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v9, OS_LOG_TYPE_FAULT, "received bad hid report", buf, 2u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECEDEE38 != -1)
        dispatch_once(&qword_1ECEDEE38, &unk_1E2945128);
      LOWORD(v31) = 0;
LABEL_39:
      v21 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "void CLKeyboardMotionNotifier::onIoHidReportBounce(CLHidDevice *, uint8_t *, CFIndex)", "CoreLocation: %s\n", v21);
      if (v21 != buf)
        free(v21);
      return;
    }
    return;
  }
  if (a5)
  {
    v17 = *a4;
    if (v17 == 196)
    {
      memcpy(__dst, a4, a5);
      v22 = __dst[1] & 2;
      if (*(unsigned __int8 *)(v8 + 88) != v22 >> 1)
      {
        if (qword_1ECEDEE38 != -1)
          dispatch_once(&qword_1ECEDEE38, &unk_1E2945128);
        v23 = qword_1ECEDEE30;
        if (os_log_type_enabled((os_log_t)qword_1ECEDEE30, OS_LOG_TYPE_INFO))
        {
          v24 = "entered";
          if (!v22)
            v24 = "dismissed";
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = v24;
          _os_log_impl(&dword_18F1DC000, v23, OS_LOG_TYPE_INFO, "Accessory Hall Effect sensor detected tablet mode %s", buf, 0xCu);
        }
        if (sub_18F1FCA08(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1ECEDEE38 != -1)
            dispatch_once(&qword_1ECEDEE38, &unk_1E2945128);
          v28 = "entered";
          if (!v22)
            v28 = "dismissed";
          v31 = 136315138;
          v32 = (int64_t)v28;
          v29 = (char *)_os_log_send_and_compose_impl();
          sub_18F419700("Generic", 1, 0, 2, "void CLKeyboardMotionNotifier::onIoHidReportBounce(CLHidDevice *, uint8_t *, CFIndex)", "CoreLocation: %s\n", v29);
          if (v29 != buf)
            free(v29);
        }
        if (v22)
          v25 = 3;
        else
          v25 = 4;
        LOBYTE(v31) = v25;
        v26 = mach_absolute_time();
        sub_18F1FD20C(v26);
        sub_18F1FD2C8(v8, 4, (uint64_t)&v31, 1);
      }
      *(_BYTE *)(v8 + 88) = v22 >> 1;
      return;
    }
    if (v17 != 1)
      return;
    memcpy(buf, a4, a5);
    v18 = 1;
    if (buf[0] == 1 && !buf[1] && !buf[2])
    {
      if (*(_DWORD *)&buf[3] | *(unsigned __int16 *)&buf[7])
        v18 = 1;
      else
        v18 = buf[9] != 0;
    }
    __dst[0] = v18;
    v27 = mach_absolute_time();
    sub_18F1FD20C(v27);
    v13 = __dst;
    v14 = v8;
    v15 = 1;
    v16 = 1;
    goto LABEL_56;
  }
  if (qword_1ECEDEE38 != -1)
    dispatch_once(&qword_1ECEDEE38, &unk_1E2945128);
  v20 = qword_1ECEDEE30;
  if (os_log_type_enabled((os_log_t)qword_1ECEDEE30, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F1DC000, v20, OS_LOG_TYPE_FAULT, "Empty keyboard device report input", buf, 2u);
  }
  if (sub_18F1FCA08(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECEDEE38 != -1)
      dispatch_once(&qword_1ECEDEE38, &unk_1E2945128);
    LOWORD(v31) = 0;
    goto LABEL_39;
  }
}

- (void)monitorUpdateForDevice:(id)a3 added:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  int v7;
  const char *v8;
  char v9;
  uint64_t v10;
  int v11;
  const char *v12;
  char v13;
  BOOL v14;
  _BYTE v15[2];
  _BYTE v16[2];

  v4 = a4;
  if (qword_1ECEDF888 != -1)
    dispatch_once(&qword_1ECEDF888, &unk_1E29534A8);
  v6 = qword_1ECEDF880;
  if (*(id *)(qword_1ECEDF880 + 40) == a3)
  {
    v14 = v4;
    v10 = mach_absolute_time();
    sub_18F1FD20C(v10);
    sub_18F1FD2C8(v6, 2, (uint64_t)&v14, 1);
    *(_BYTE *)(v6 + 91) = v14;
    if (v4)
    {
      v11 = sub_18F3DE228();
      if (*(unsigned __int8 *)(v6 + 89) != v11)
      {
        v13 = v11;
        v15[0] = -60;
        v15[1] = v11;
        if (objc_msgSend_setReport_payload_length_(*(void **)(v6 + 40), v12, 196, (uint64_t)v15, 2))
          *(_BYTE *)(v6 + 89) = v13;
      }
    }
    else
    {
      *(_BYTE *)(v6 + 89) = 0;
    }
  }
  else if (*(id *)(qword_1ECEDF880 + 48) == a3)
  {
    if (v4)
    {
      v7 = sub_18F3DDF7C();
      if (*(unsigned __int8 *)(v6 + 90) != v7)
      {
        v9 = v7;
        v16[0] = 105;
        v16[1] = v7;
        if (objc_msgSend_setReport_payload_length_(*(void **)(v6 + 48), v8, 105, (uint64_t)v16, 2))
          *(_BYTE *)(v6 + 90) = v9;
      }
    }
    else
    {
      *(_BYTE *)(qword_1ECEDF880 + 90) = 0;
    }
  }
}

- (void)eventUpdateForDevice:(id)a3 event:(id)a4
{
  uint64_t v4;
  const __CFArray *Children;
  const __CFArray *v6;
  CFIndex Count;
  CFIndex v8;
  CFIndex i;
  int v10;
  char v11;

  if (qword_1ECEDF888 != -1)
    dispatch_once(&qword_1ECEDF888, &unk_1E29534A8);
  v4 = qword_1ECEDF880;
  if (IOHIDEventConformsTo())
  {
    Children = (const __CFArray *)IOHIDEventGetChildren();
    if (Children)
    {
      v6 = Children;
      Count = CFArrayGetCount(Children);
      if (Count >= 1)
      {
        v8 = Count;
        for (i = 0; i != v8; ++i)
        {
          CFArrayGetValueAtIndex(v6, i);
          if (IOHIDEventGetType() == 11)
          {
            v10 = IOHIDEventGetIntegerValue() == 1;
            if (*(unsigned __int8 *)(v4 + 72) != v10)
            {
              v11 = v10;
              sub_18F1E5A28(v4, 3, (uint64_t)&v11, 1);
              *(_BYTE *)(v4 + 72) = v10;
            }
          }
        }
      }
    }
  }
}

- (void)smartCoverStateDidChange:(int64_t)a3
{
  uint64_t v4;
  char v5;
  NSObject *v6;
  uint64_t v7;
  char *v8;
  char v9;
  int v10;
  uint64_t v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (qword_1ECEDF888 != -1)
    dispatch_once(&qword_1ECEDF888, &unk_1E29534A8);
  v4 = qword_1ECEDF880;
  if (*(_BYTE *)(qword_1ECEDF880 + 91))
  {
    if (a3 == 1)
    {
      v5 = 2;
    }
    else
    {
      if (a3 != 3)
        return;
      v5 = 1;
    }
    v9 = v5;
    if (qword_1ECEDEE38 != -1)
      dispatch_once(&qword_1ECEDEE38, &unk_1E2945128);
    v6 = qword_1ECEDEE30;
    if (os_log_type_enabled((os_log_t)qword_1ECEDEE30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v13 = off_1EE16D6F8(a3);
      _os_log_impl(&dword_18F1DC000, v6, OS_LOG_TYPE_INFO, "iPad Hall Effect sensor detected the cover was, %@", buf, 0xCu);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECEDEE38 != -1)
        dispatch_once(&qword_1ECEDEE38, &unk_1E2945128);
      v10 = 138412290;
      v11 = off_1EE16D6F8(a3);
      v8 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "void CLKeyboardMotionNotifier::onSmartCoverOpened(SBSSmartCoverState)", "CoreLocation: %s\n", v8);
      if (v8 != (char *)buf)
        free(v8);
    }
    v7 = mach_absolute_time();
    sub_18F1FD20C(v7);
    sub_18F1FD2C8(v4, 4, (uint64_t)&v9, 1);
  }
}

@end
