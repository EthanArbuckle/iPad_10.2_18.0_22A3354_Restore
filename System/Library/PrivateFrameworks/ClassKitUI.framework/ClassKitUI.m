id sub_21EBFE7C0(void *a1, const char *a2, uint64_t a3)
{
  void *v3;
  const char *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_connectedScenes(a1, a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectsPassingTest_(v3, v4, (uint64_t)&unk_24E3570D8);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v24, v28, 16);
  if (v7)
  {
    v10 = v7;
    v11 = *(_QWORD *)v25;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v5);
        objc_msgSend_keyWindow(*(void **)(*((_QWORD *)&v24 + 1) + 8 * v12), v8, v9, (_QWORD)v24);
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v22 = (void *)v13;
          v17 = v5;
          goto LABEL_11;
        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v24, v28, 16);
      if (v10)
        continue;
      break;
    }
  }

  v14 = objc_alloc(MEMORY[0x24BDF6FF8]);
  objc_msgSend_mainScreen(MEMORY[0x24BDF6D38], v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bounds(v17, v18, v19);
  v22 = (void *)objc_msgSend_initWithFrame_(v14, v20, v21);
LABEL_11:

  return v22;
}

uint64_t sub_21EBFE920(uint64_t a1, void *a2)
{
  id v2;
  const char *v3;
  uint64_t v4;
  char isKindOfClass;

  v2 = a2;
  if (objc_msgSend_activationState(v2, v3, v4))
  {
    isKindOfClass = 0;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

void sub_21EBFEC9C()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.ClassKit.banner", 0);
  v1 = (void *)qword_25547D338;
  qword_25547D338 = (uint64_t)v0;

}

void sub_21EBFEDA8(_Unwind_Exception *a1)
{
  objc_sync_exit(CFSTR("CLSNotificationBannerSyncObject"));
  _Unwind_Resume(a1);
}

void sub_21EBFEDC0(uint64_t a1, const char *a2, uint64_t a3)
{
  NSObject *v4;
  _QWORD block[4];
  id v6;

  objc_msgSend_bannerSemaphore((void *)qword_25547D330, a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_21EBFEE54;
  block[3] = &unk_24E357140;
  v6 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t sub_21EBFEE54(uint64_t a1)
{
  return MEMORY[0x24BEDD108](qword_25547D330, sel__showBanner_, *(_QWORD *)(a1 + 32));
}

void sub_21EBFEF38()
{
  id v0;
  const char *v1;
  const char *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x24BDAC8D0];
  v0 = objc_alloc_init(MEMORY[0x24BDF6748]);
  objc_msgSend_setLineBreakMode_(v0, v1, 4);
  objc_msgSend_preferredFontForTextStyle_(MEMORY[0x24BDF6A70], v2, *MEMORY[0x24BDF77E8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BDF65F8];
  v13[0] = v3;
  v5 = *MEMORY[0x24BDF6600];
  v12[0] = v4;
  v12[1] = v5;
  objc_msgSend_labelColor(MEMORY[0x24BDF6950], v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = *MEMORY[0x24BDF6628];
  v13[1] = v8;
  v13[2] = v0;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v9, (uint64_t)v13, v12, 3);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)qword_25547D348;
  qword_25547D348 = v10;

}

void sub_21EBFF084()
{
  id v0;
  const char *v1;
  const char *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x24BDAC8D0];
  v0 = objc_alloc_init(MEMORY[0x24BDF6748]);
  objc_msgSend_setLineBreakMode_(v0, v1, 4);
  objc_msgSend_preferredFontForTextStyle_(MEMORY[0x24BDF6A70], v2, *MEMORY[0x24BDF77C0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BDF65F8];
  v13[0] = v3;
  v5 = *MEMORY[0x24BDF6600];
  v12[0] = v4;
  v12[1] = v5;
  objc_msgSend_labelColor(MEMORY[0x24BDF6950], v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = *MEMORY[0x24BDF6628];
  v13[1] = v8;
  v13[2] = v0;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v9, (uint64_t)v13, v12, 3);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)qword_25547D358;
  qword_25547D358 = v10;

}

void sub_21EBFF1D0()
{
  void *v0;
  uint64_t v1;
  const char *v2;
  uint64_t v3;
  void *v4;

  v0 = (void *)MEMORY[0x24BDD1488];
  v1 = objc_opt_class();
  objc_msgSend_bundleForClass_(v0, v2, v1);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_25547D368;
  qword_25547D368 = v3;

}

void sub_21EC00448(uint64_t a1, const char *a2)
{
  const char *v3;
  uint64_t v4;
  double v5;
  dispatch_time_t v6;
  _QWORD block[5];

  objc_msgSend_setBannerAnimating_(*(void **)(a1 + 32), a2, 0);
  objc_msgSend_duration(*(void **)(a1 + 40), v3, v4);
  v6 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_21EC004DC;
  block[3] = &unk_24E357140;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v6, MEMORY[0x24BDAC9B8], block);
}

uint64_t sub_21EC004DC(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t result;
  const char *v5;

  result = objc_msgSend_bannerVisible(*(void **)(a1 + 32), a2, a3);
  if ((_DWORD)result)
    return objc_msgSend_hideBannerQuickly_(*(void **)(a1 + 32), v5, 0);
  return result;
}

void sub_21EC00518(uint64_t a1, const char *a2, uint64_t a3)
{
  const char *v3;
  uint64_t v4;
  id v5;

  objc_msgSend_bannerView(*(void **)(a1 + 32), a2, a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAlpha_(v5, v3, v4, 1.0);

}

uint64_t sub_21EC0054C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_21EC006C4(uint64_t a1, const char *a2)
{
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  dispatch_time_t v8;

  objc_msgSend_setBannerAnimating_(*(void **)(a1 + 32), a2, 0);
  objc_msgSend_callCompletionHandler(*(void **)(a1 + 40), v3, v4);
  objc_msgSend_removeFromSuperview(*(void **)(a1 + 40), v5, v6);
  objc_msgSend_setBannerView_(*(void **)(a1 + 32), v7, 0);
  v8 = dispatch_time(0, 500000000);
  dispatch_after(v8, MEMORY[0x24BDAC9B8], &unk_24E357210);
}

void sub_21EC00728(uint64_t a1, const char *a2, uint64_t a3)
{
  NSObject *v3;
  unsigned int v4;
  BOOL v5;
  signed int v6;
  void *v7;

  objc_msgSend_bannerSemaphore((void *)qword_25547D330, a2, a3);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v3);

  do
  {
    v4 = __ldxr(&dword_25547D32C);
    v5 = __OFSUB__(v4, 1);
    v6 = v4 - 1;
  }
  while (__stxr(v6, &dword_25547D32C));
  if ((v6 < 0) ^ v5 | (v6 == 0))
  {
    objc_sync_enter(CFSTR("CLSNotificationBannerSyncObject"));
    v7 = (void *)qword_25547D330;
    qword_25547D330 = 0;

    objc_sync_exit(CFSTR("CLSNotificationBannerSyncObject"));
  }
}

void sub_21EC007A4(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  id v20;

  v4 = *(void **)(a1 + 32);
  objc_msgSend_bounds(*(void **)(a1 + 40), a2, a3);
  objc_msgSend__hiddenBannerPosition_(v4, v5, v6, v7, v8);
  v10 = v9;
  objc_msgSend_bannerYPositionConstraint(*(void **)(a1 + 32), v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setConstant_(v13, v14, v15, v10);

  objc_msgSend_view(*(void **)(a1 + 32), v16, v17);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_layoutIfNeeded(v20, v18, v19);

}

uint64_t sub_21EC00820(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_21EC00A0C(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  double v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  double v17;
  double v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  double v39;
  double v40;
  double v41;
  double v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  id v50;

  objc_msgSend_bannerWidthConstraint(*(void **)(a1 + 32), a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend_bannerWidthForViewSize_(*(void **)(a1 + 32), v5, v6, *(double *)(a1 + 40), *(double *)(a1 + 48));
    v8 = v7;
    objc_msgSend_bannerWidthConstraint(*(void **)(a1 + 32), v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setConstant_(v11, v12, v13, v8);

  }
  objc_msgSend_bannerYPositionConstraint(*(void **)(a1 + 32), v5, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_constant(v14, v15, v16);
  v18 = v17;

  v19 = *(void **)(a1 + 32);
  objc_msgSend_bannerView(v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bounds(v22, v23, v24);
  objc_msgSend__hiddenBannerPosition_(v19, v25, v26, v27, v28);
  v30 = v29;

  if (v18 != v30)
  {
    v33 = *(void **)(a1 + 32);
    objc_msgSend_bannerView(v33, v31, v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_bounds(v34, v35, v36);
    objc_msgSend__visibleBannerCenterPosition_(v33, v37, v38, v39, v40);
    v42 = v41;
    objc_msgSend_bannerYPositionConstraint(*(void **)(a1 + 32), v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setConstant_(v45, v46, v47, v42);

  }
  objc_msgSend_view(*(void **)(a1 + 32), v31, v32);
  v50 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_layoutIfNeeded(v50, v48, v49);

}

void sub_21EC01224(uint64_t a1, const char *a2, uint64_t a3)
{
  const char *v3;
  uint64_t v4;
  id v5;

  objc_msgSend_currentDevice(MEMORY[0x24BDF69C8], a2, a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  byte_25547D328 = objc_msgSend_userInterfaceIdiom(v5, v3, v4) == 1;

}

uint64_t sub_21EC01478(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t sub_21EC0148C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a3, a4);
  return result;
}

void sub_21EC016AC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21EC016C8(uint64_t a1)
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  id WeakRetained;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend_previousKeyWindow(WeakRetained, v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend_previousKeyWindow(WeakRetained, v6, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_makeKeyAndVisible(v8, v9, v10);

      objc_msgSend_setPreviousKeyWindow_(WeakRetained, v11, 0);
    }
    objc_msgSend_window(WeakRetained, v6, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRootViewController_(v12, v13, 0);

    objc_msgSend_window(WeakRetained, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeFromSuperview(v16, v17, v18);

    objc_msgSend_setWindow_(WeakRetained, v19, 0);
  }

}

void sub_21EC01808(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  id v29;

  objc_msgSend_sharedApplication(MEMORY[0x24BDF6800], a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_21EBFE7C0(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPreviousKeyWindow_(*(void **)(a1 + 32), v8, (uint64_t)v7);

  v9 = objc_alloc(MEMORY[0x24BDF6FF8]);
  objc_msgSend_mainScreen(MEMORY[0x24BDF6D38], v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bounds(v12, v13, v14);
  v29 = (id)objc_msgSend_initWithFrame_(v9, v15, v16);

  objc_msgSend_setWindow_(*(void **)(a1 + 32), v17, (uint64_t)v29);
  v18 = (void *)objc_opt_new();
  objc_msgSend_setRootViewController_(v29, v19, (uint64_t)v18);

  objc_msgSend_setWindowLevel_(v29, v20, v21, *MEMORY[0x24BDF8010] + -1.0);
  objc_msgSend_makeKeyAndVisible(v29, v22, v23);
  objc_msgSend_setModalPresentationStyle_(*(void **)(a1 + 32), v24, 0);
  objc_msgSend_rootViewController(v29, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_presentViewController_animated_completion_(v27, v28, *(_QWORD *)(a1 + 32), 1, *(_QWORD *)(a1 + 40));

}

void sub_21EC019E8()
{
  CLSNotificationBannerDisplayManager *v0;
  void *v1;

  v0 = objc_alloc_init(CLSNotificationBannerDisplayManager);
  v1 = (void *)qword_25547D380;
  qword_25547D380 = (uint64_t)v0;

}

void sub_21EC01AB8(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  double v12;
  void *v13;
  const char *v14;

  objc_msgSend_lastBannerTime(*(void **)(a1 + 32), a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4
    || (v7 = (void *)v4,
        objc_msgSend_lastBannerTime(*(void **)(a1 + 32), v5, v6),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend_timeIntervalSinceNow(v8, v9, v10),
        v12 = v11,
        v8,
        v7,
        v12 < -30.0))
  {
    objc_msgSend_date(MEMORY[0x24BDBCE60], v5, v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLastBannerTime_(*(void **)(a1 + 32), v14, (uint64_t)v13);

    MEMORY[0x24BEDD108](CLSNotificationBanner, sel_showBannerWithTitle_message_completionHandler_, *(_QWORD *)(a1 + 40));
  }
}

uint64_t sub_21EC01BA4(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x24BEDD108](a2, sel_presentModallyInNewWindowWithCompletion_, 0);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
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

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

