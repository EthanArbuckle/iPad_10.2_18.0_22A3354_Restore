id sub_10000150C()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleLargeTitle));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "fontDescriptorWithSymbolicTraits:", 2));

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v1, 0.0));
  return v2;
}

double sub_10000157C()
{
  return 0.0;
}

double sub_100001590()
{
  return 5.0;
}

uint64_t sub_1000015A4(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", kCTSIMSupportSIMStatusPINLocked) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", kCTSIMSupportSIMStatusPUKLocked) & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    v2 = (uint64_t)objc_msgSend(v1, "isEqualToString:", kCTSIMSupportSIMStatusPermanentlyLocked);
  }

  return v2;
}

void sub_100001BCC(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_entryView"));
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  objc_msgSend(v5, "setAttemptsRemaining:", v4);
}

void sub_100001C28(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_entryView"));
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  objc_msgSend(v5, "setAttemptsRemaining:", v4);
}

void sub_1000026D4(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[2];
    v4 = v2[3];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100002758;
    v5[3] = &unk_10001C678;
    v5[4] = v2;
    objc_msgSend(v3, "getRemainingPINAttemptCount:completion:", v4, v5);
  }

}

void sub_100002758(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  int v8;
  const char *v9;

  v3 = a2;
  if (objc_msgSend(v3, "unsignedIntegerValue"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_detailView"));
    objc_msgSend(v4, "setUnlocking:", 0);

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_entryView"));
    objc_msgSend(v5, "setAttemptsRemaining:", objc_msgSend(v3, "unsignedIntegerValue"));

    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_entryView"));
    -[NSObject resetEnteredTextWithShakeAnimation:](v6, "resetEnteredTextWithShakeAnimation:", 1);
  }
  else
  {
    v7 = sub_10000CE68();
    v6 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "-[TSSIMUnlockDetailViewController simPinEntryErrorDidOccur:status:]_block_invoke_2";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "wait for sim status change @%s", (uint8_t *)&v8, 0xCu);
    }
  }

}

void sub_1000029F4(id *a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unsigned int v9;
  void *v10;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v10 = WeakRetained;
    if (objc_msgSend(a1[4], "isEqualToString:", kCTSIMSupportSIMStatusPermanentlyLocked))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "_entryView"));
      objc_msgSend(v4, "resignFirstResponder");

      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "delegate"));
      v6 = v5;
      v7 = v10;
      v8 = 6;
LABEL_6:
      objc_msgSend(v5, "unlockDetailViewController:didCompleteWithResult:", v7, v8);

      v3 = v10;
      goto LABEL_7;
    }
    v9 = objc_msgSend(a1[4], "isEqualToString:", kCTSIMSupportSIMStatusPUKLocked);
    v3 = v10;
    if (v9)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "delegate"));
      v6 = v5;
      v7 = v10;
      v8 = 5;
      goto LABEL_6;
    }
  }
LABEL_7:

}

void sub_100002C58(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void sub_100002CD4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x2Au);
}

void sub_100002D08(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

id sub_100002D14()
{
  void *v0;

  return objc_msgSend(v0, "actionType");
}

void sub_1000034A8(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  uint64_t state64;

  state64 = 0;
  notify_get_state(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 8), &state64);
  if (sub_10000CED8())
  {
    v2 = sub_10000CE68();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      sub_10000F4EC(&state64, v3);

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
  objc_msgSend(v4, "screenLockDidUpdate:", state64 == 1);

}

int64_t sub_100003598(id a1, CTXPCServiceSubscriptionContext *a2, CTXPCServiceSubscriptionContext *a3)
{
  CTXPCServiceSubscriptionContext *v4;
  CTXPCServiceSubscriptionContext *v5;
  id v6;
  int64_t v7;
  id v8;

  v4 = a2;
  v5 = a3;
  v6 = -[CTXPCServiceSubscriptionContext slotID](v4, "slotID");
  if ((uint64_t)v6 <= (uint64_t)-[CTXPCServiceSubscriptionContext slotID](v5, "slotID"))
  {
    v8 = -[CTXPCServiceSubscriptionContext slotID](v4, "slotID");
    if ((uint64_t)v8 >= (uint64_t)-[CTXPCServiceSubscriptionContext slotID](v5, "slotID"))
      v7 = 0;
    else
      v7 = -1;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

void sub_100003CB0(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_100003CD8(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_presentUnlockViewController");
    WeakRetained = v2;
  }

}

void sub_100003D08(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = sub_10000CE68();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_10000F590((uint64_t)v3, v6);

  if (WeakRetained)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subscriptions", 0));
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v12, "isSimHidden") & 1) == 0)
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)WeakRetained + 4), "getSIMStatus:error:", v12, 0));
            objc_msgSend(WeakRetained, "_queue_processSubscriptionContext:withSubscriptionSIMStatus:", v12, v13);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

    dispatch_group_leave(*((dispatch_group_t *)WeakRetained + 3));
  }

}

_BYTE *sub_100003EF8(uint64_t a1, void *a2)
{
  _BYTE *result;

  result = objc_msgSend(a2, "events");
  if ((result & 0x10) != 0)
  {
    result = *(_BYTE **)(a1 + 32);
    if (!result[8])
      return objc_msgSend(result, "_dismissUnlockViewControllerAndDeactivate");
  }
  return result;
}

id sub_100004124(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentUnlockViewController");
}

void sub_1000043E4(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  const char *v13;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained[6], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32)));
    v5 = *(void **)(a1 + 40);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "carrierName"));
    LOBYTE(v5) = objc_msgSend(v5, "isEqualToString:", v6);

    if ((v5 & 1) == 0)
    {
      objc_msgSend(v4, "setCarrierName:", *(_QWORD *)(a1 + 40));
      v7 = sub_10000CE68();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "carrierName"));
        v10 = 138412546;
        v11 = v9;
        v12 = 2080;
        v13 = "-[TSSIMUnlockViewController carrierBundleChange:]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "update carrier name (%@) @%s", (uint8_t *)&v10, 0x16u);

      }
      objc_msgSend(v3, "_applySubscriptionContext:withSubscriptionAction:", *(_QWORD *)(a1 + 48), v4);
    }

  }
}

void sub_1000046C0(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  const char *v13;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained[6], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32)));
    v5 = *(void **)(a1 + 40);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "phoneNumber"));
    LOBYTE(v5) = objc_msgSend(v5, "isEqualToString:", v6);

    if ((v5 & 1) == 0)
    {
      objc_msgSend(v4, "setPhoneNumber:", *(_QWORD *)(a1 + 40));
      v7 = sub_10000CE68();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "phoneNumber"));
        v10 = 138412546;
        v11 = v9;
        v12 = 2080;
        v13 = "-[TSSIMUnlockViewController phoneNumberChanged:]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "update phone number (%@) @%s", (uint8_t *)&v10, 0x16u);

      }
      objc_msgSend(v3, "_applySubscriptionContext:withSubscriptionAction:", *(_QWORD *)(a1 + 48), v4);
    }

  }
}

void sub_100004AC4(uint64_t a1)
{
  _QWORD *v2;
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[2] && (v3 = objc_msgSend(*(id *)(a1 + 40), "slotID"), v2 = *(_QWORD **)(a1 + 32), v3 != (id)v2[2]))
  {
    v4 = sub_10000CE68();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = CTSubscriptionSlotAsString(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
      v7 = CTSubscriptionSlotAsString(objc_msgSend(*(id *)(a1 + 40), "slotID"));
      v8 = 136315650;
      v9 = v6;
      v10 = 2080;
      v11 = v7;
      v12 = 2080;
      v13 = "-[TSSIMUnlockViewController _queue_processSubscriptionContext:withSubscriptionSIMStatus:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "user selected slot %s, ignoring slot %s @%s", (uint8_t *)&v8, 0x20u);
    }

  }
  else
  {
    objc_msgSend(v2, "_applySubscriptionContext:withSubscriptionAction:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
}

id sub_1000053E8(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "SIMUnlockProcedureDidComplete");
  return objc_msgSend(*(id *)(a1 + 32), "_deactivate");
}

id sub_1000054A8(uint64_t a1)
{
  void *v1;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_remoteViewControllerProxy"));
  objc_msgSend(v1, "deactivate");

  return objc_msgSend(UIApp, "terminateWithSuccess");
}

void sub_1000055A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000055BC(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  void *v7;
  unsigned int v8;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "uuid"));
  v8 = objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v8)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
  *a4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != 0x7FFFFFFFFFFFFFFFLL;
}

void sub_10000572C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

const __CFString *sub_100006F6C(unint64_t a1)
{
  if (a1 > 4)
    return CFSTR("???");
  else
    return *(&off_10001C840 + a1);
}

const __CFString *sub_100006F90(unint64_t a1)
{
  if (a1 > 3)
    return CFSTR("???");
  else
    return *(&off_10001C868 + a1);
}

void sub_100009250(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v3 = a2;
  v4 = a1;
  v15 = objc_alloc_init((Class)UILabel);
  objc_msgSend(v15, "setText:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
  objc_msgSend(v15, "setTextColor:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  objc_msgSend(v15, "setFont:", v6);

  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v15, "sizeToFit");
  objc_msgSend(v3, "addSubview:", v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "trailingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layoutMarginsGuide"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "trailingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:", v9));
  objc_msgSend(v10, "setActive:", 1);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "centerYAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layoutMarginsGuide"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "centerYAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v13));
  objc_msgSend(v14, "setActive:", 1);

}

void sub_100009404(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

uint64_t start(int a1, char **a2)
{
  void *v4;
  uint64_t v5;

  v4 = objc_autoreleasePoolPush();
  v5 = UIApplicationMain(a1, a2, 0, 0);
  objc_autoreleasePoolPop(v4);
  return v5;
}

void sub_10000A770(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000A794(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id WeakRetained;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;

  v3 = a2;
  v4 = objc_opt_class(PRXCardContentViewController);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "presentProxCardFlowWithDelegate:initialViewController:", WeakRetained, v3));
    v7 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v7, "setPkNavigationController:", v6);

  }
  else
  {
    v8 = sub_10000CE68();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10000FB40((uint64_t)v3, v9);

    v10 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v10, "simSetupFlowCompleted:", 1);

  }
  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
    (*(void (**)(void))(v11 + 16))();

}

id sub_10000A8DC(uint64_t a1, void *a2)
{
  id result;
  void *v4;
  _QWORD v5[5];

  result = objc_msgSend(a2, "events");
  if ((result & 0x11) != 0)
  {
    v4 = *(void **)(a1 + 32);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10000A954;
    v5[3] = &unk_10001C7A8;
    v5[4] = v4;
    return objc_msgSend(v4, "dismissViewControllerWithTransition:completion:", 3, v5);
  }
  return result;
}

id sub_10000A954(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deactivate");
}

id sub_10000AA08(uint64_t a1)
{
  void *v1;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_remoteViewControllerProxy"));
  objc_msgSend(v1, "dismiss");

  return objc_msgSend(UIApp, "terminateWithSuccess");
}

id sub_10000ADDC(uint64_t a1)
{
  void *v1;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_remoteViewControllerProxy"));
  objc_msgSend(v1, "deactivate");

  return objc_msgSend(UIApp, "terminateWithSuccess");
}

void sub_10000B660(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000B67C(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[8], "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
    WeakRetained = v3;
  }

}

void sub_10000C8B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000C8F0(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  id v4;
  id WeakRetained;

  if (a3)
  {
    v3 = (id *)(a1 + 32);
    v4 = a3;
    WeakRetained = objc_loadWeakRetained(v3);
    objc_msgSend(WeakRetained, "_handleLayoutUpdate:", v4);

  }
}

id sub_10000CE68()
{
  if (qword_100027898 != -1)
    dispatch_once(&qword_100027898, &stru_10001C950);
  return (id)qword_100027890;
}

void sub_10000CEA8(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.SIMSetupUIService", "log");
  v2 = (void *)qword_100027890;
  qword_100027890 = (uint64_t)v1;

}

uint64_t sub_10000CED8()
{
  return MGGetBoolAnswer(CFSTR("apple-internal-install"));
}

void sub_10000D7A4(id a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v1, "postNotificationName:object:", TSNotificationUserCanceled, TSNotificationUserCanceledReason_SwapOutEvent);

}

void sub_10000DE84(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_10000DEBC(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  NSObject *v9;

  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = objc_opt_class(PRXCardContentViewController);
    if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
    {
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "presentProxCardFlowWithDelegate:initialViewController:", WeakRetained, v3));
      v7 = WeakRetained[3];
      WeakRetained[3] = (id)v6;

    }
    else
    {
      v8 = sub_10000CE68();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_10000FEB0();

      objc_msgSend(WeakRetained, "simSetupFlowCompleted:", 1);
    }
    objc_msgSend(WeakRetained[5], "registerForLockNotifications");
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_10000DF9C(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  NSObject *v9;

  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = objc_opt_class(PRXCardContentViewController);
    if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
    {
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "presentProxCardFlowWithDelegate:initialViewController:", WeakRetained, v3));
      v7 = WeakRetained[3];
      WeakRetained[3] = (id)v6;

    }
    else
    {
      v8 = sub_10000CE68();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_10000FEB0();

      objc_msgSend(WeakRetained, "simSetupFlowCompleted:", 1);
    }
    objc_msgSend(WeakRetained[5], "registerForLockNotifications");
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

id sub_10000E07C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "simSetupFlowCompleted:", 2);
}

uint64_t sub_10000E088(uint64_t a1, uint64_t a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_presentFirstController:isRemoteSignup:", a2, 0);
  }
  else
  {
    v3 = sub_10000CE68();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_10000FF1C(v4, v5, v6, v7, v8, v9, v10, v11);

    objc_msgSend(*(id *)(a1 + 32), "_deactivate");
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

id sub_10000E158(uint64_t a1, void *a2)
{
  id result;
  void *v4;
  void *v5;
  _QWORD v6[5];

  result = objc_msgSend(a2, "events");
  if ((result & 0x10) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "postNotificationName:object:", TSNotificationUserCanceled, TSNotificationUserCanceledReason_HomeButtonEvent);

    v5 = *(void **)(a1 + 32);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10000E1FC;
    v6[3] = &unk_10001C7A8;
    v6[4] = v5;
    return objc_msgSend(v5, "dismissViewControllerWithTransition:completion:", 3, v6);
  }
  return result;
}

id sub_10000E1FC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deactivate");
}

id sub_10000E2A0(uint64_t a1)
{
  void *v1;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_remoteViewControllerProxy"));
  objc_msgSend(v1, "dismiss");

  return objc_msgSend(UIApp, "terminateWithSuccess");
}

id sub_10000E450(uint64_t a1)
{
  void *v1;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_remoteViewControllerProxy"));
  objc_msgSend(v1, "dismiss");

  return objc_msgSend(UIApp, "terminateWithSuccess");
}

void sub_10000E790(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v3);

  objc_msgSend(v4, "setModalPresentationStyle:", 2);
  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v4, 1, 0);

}

id sub_10000EA50(uint64_t a1)
{
  void *v1;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_remoteViewControllerProxy"));
  objc_msgSend(v1, "deactivate");

  return objc_msgSend(UIApp, "terminateWithSuccess");
}

Class sub_10000EBA4(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;

  v3 = 0;
  if (!qword_1000278A8)
  {
    v4 = off_10001CA28;
    v5 = 0;
    qword_1000278A8 = _sl_dlopen(&v4, &v3);
    if (!qword_1000278A8)
    {
      abort_report_np("%s", (const char *)v3);
LABEL_8:
      sub_1000100A8();
    }
    if (v3)
      free(v3);
  }
  result = objc_getClass("LAContext");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_8;
  qword_1000278A0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_10000EC98(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_10000EFE4()
{
  id v0;
  id v1;
  const __CFString *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_100002CFC();
  CTSubscriptionSlotAsString(objc_msgSend(v0, "slotID"));
  v1 = sub_100002D14();
  v2 = sub_100006F6C((unint64_t)v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_100002C94();
  sub_100002C58((void *)&_mh_execute_header, v4, v5, "[Db] initWithSubscriptionContext, context %s, action %@ @%s", v6, v7, v8, v9, v10);

  sub_100002CE8();
}

void sub_10000F080()
{
  id v0;
  id v1;
  const __CFString *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_100002CFC();
  CTSubscriptionSlotAsString(objc_msgSend(v0, "slotID"));
  v1 = sub_100002D14();
  v2 = sub_100006F6C((unint64_t)v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_100002C94();
  sub_100002C58((void *)&_mh_execute_header, v4, v5, "[Db] initWithSubscriptionContext, context %s, action %@ @%s", v6, v7, v8, v9, v10);

  sub_100002CE8();
}

void sub_10000F11C(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  const char *v6;

  v3 = 136315394;
  v4 = "-[TSSIMUnlockDetailViewController loadView]";
  v5 = 2080;
  v6 = "-[TSSIMUnlockDetailViewController loadView]";
  sub_100002D08((void *)&_mh_execute_header, a1, a3, "[Db] %s @%s", (uint8_t *)&v3);
}

void sub_10000F1A0(uint64_t a1)
{
  const __CFString *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = sub_100006F6C((unint64_t)objc_msgSend(*(id *)(a1 + 32), "actionType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_100002CB4();
  sub_100002C58((void *)&_mh_execute_header, v3, v4, "[Db] %s, action %@ @%s", v5, v6, v7, v8, 2u);

  sub_100002CF0();
}

void sub_10000F234(void *a1, NSObject *a2)
{
  const __CFString *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  __int16 v8;
  const char *v9;

  v3 = sub_100006F90((unint64_t)objc_msgSend(a1, "actionSubtype"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v6 = 138412546;
  v7 = v4;
  v8 = 2080;
  v9 = "-[TSSIMUnlockDetailViewController entryView:didEnterText:]";
  sub_100002D08((void *)&_mh_execute_header, a2, v5, "[Db] action sub type %@ @%s", (uint8_t *)&v6);

}

void sub_10000F2D8(uint64_t a1)
{
  const __CFString *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = sub_100006F6C((unint64_t)objc_msgSend(*(id *)(a1 + 32), "actionType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_100002CB4();
  sub_100002C58((void *)&_mh_execute_header, v3, v4, "[Db] %s, action %@ @%s", v5, v6, v7, v8, 2u);

  sub_100002CF0();
}

void sub_10000F36C()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100002CFC();
  CTSubscriptionSlotAsString(objc_msgSend(v0, "slotID"));
  sub_100002C6C();
  sub_100002CD4((void *)&_mh_execute_header, v1, v2, "[Db] %s: context %s, status %@ @%s", v3, v4, v5, v6, 2u);
  sub_100002CE8();
}

void sub_10000F3EC()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100002CFC();
  CTSubscriptionSlotAsString(objc_msgSend(v0, "slotID"));
  sub_100002C6C();
  sub_100002CD4((void *)&_mh_execute_header, v1, v2, "[Db] %s: context %s, status %@ @%s", v3, v4, v5, v6, 2u);
  sub_100002CE8();
}

void sub_10000F46C(os_log_t log)
{
  int v1;
  const char *v2;

  v1 = 136315138;
  v2 = "-[TSScreenLockObserver registerForLockNotifications]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[E]unable to register @%s", (uint8_t *)&v1, 0xCu);
}

void sub_10000F4EC(_QWORD *a1, NSObject *a2)
{
  const char *v2;
  int v3;
  const char *v4;
  __int16 v5;
  const char *v6;

  v2 = "";
  if (!*a1)
    v2 = "un";
  v3 = 136315394;
  v4 = v2;
  v5 = 2080;
  v6 = "-[TSScreenLockObserver registerForLockNotifications]_block_invoke";
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[Db] lockHandler: Screne %slocked @%s", (uint8_t *)&v3, 0x16u);
}

void sub_10000F590(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  const char *v5;

  v2 = 138412546;
  v3 = a1;
  v4 = 2080;
  v5 = "-[TSSIMUnlockViewController prepareForActivationWithContext:completion:]_block_invoke_2";
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[Db] subscription info: %@ @%s", (uint8_t *)&v2, 0x16u);
  sub_10000573C();
}

void sub_10000F614(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000572C((void *)&_mh_execute_header, a1, a3, "[E]context not found @%s", a5, a6, a7, a8, 2u);
  sub_10000573C();
}

void sub_10000F684(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000572C((void *)&_mh_execute_header, a1, a3, "[E]Invalid carrier name found @%s", a5, a6, a7, a8, 2u);
  sub_10000573C();
}

void sub_10000F6F4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000572C((void *)&_mh_execute_header, a1, a3, "[E]context not found @%s", a5, a6, a7, a8, 2u);
  sub_10000573C();
}

void sub_10000F764(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000572C((void *)&_mh_execute_header, a1, a3, "[E]No phone number found @%s", a5, a6, a7, a8, 2u);
  sub_10000573C();
}

void sub_10000F7D4(void *a1, uint64_t a2, NSObject *a3)
{
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;

  v5 = 136315650;
  v6 = CTSubscriptionSlotAsString(objc_msgSend(a1, "slotID"));
  v7 = 2112;
  v8 = a2;
  v9 = 2080;
  v10 = "-[TSSIMUnlockViewController _queue_processSubscriptionContext:withSubscriptionSIMStatus:]";
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "[Db] context %s, status %@ @%s", (uint8_t *)&v5, 0x20u);
}

void sub_10000F884(os_log_t log)
{
  int v1;
  const char *v2;

  v1 = 136315138;
  v2 = "-[TSSIMUnlockViewController _deactivate]";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "[Db]  @%s", (uint8_t *)&v1, 0xCu);
  sub_10000573C();
}

void sub_10000F900(os_log_t log)
{
  int v1;
  const char *v2;

  v1 = 136315138;
  v2 = "-[TSSIMUnlockListViewController initWithSubscriptionContexts:subscriptionActions:suppressCancellation:delegate:]";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "[Db] initWithSubscriptionContexts @%s", (uint8_t *)&v1, 0xCu);
}

void sub_10000F980()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1000093E4();
  sub_100009404((void *)&_mh_execute_header, v0, v1, "[Db] %s: result %ld @%s", v2, v3, v4, v5, 2u);
}

void sub_10000F9F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1000093E4();
  sub_100009404((void *)&_mh_execute_header, v0, v1, "[Db] %s: index %ld @%s", v2, v3, v4, v5, 2u);
}

void sub_10000FA60(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000572C((void *)&_mh_execute_header, a1, a3, "[E]decode CBDevice failed @%s", a5, a6, a7, a8, 2u);
  sub_10000573C();
}

void sub_10000FAD0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000572C((void *)&_mh_execute_header, a1, a3, "[E]missing device @%s", a5, a6, a7, a8, 2u);
  sub_10000573C();
}

void sub_10000FB40(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  const char *v5;

  v2 = 138412546;
  v3 = a1;
  v4 = 2080;
  v5 = "-[TSProximitySIMTransferViewController prepareForActivationWithContext:completion:]_block_invoke";
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "[E]unexpected view controller:%@ @%s", (uint8_t *)&v2, 0x16u);
  sub_10000573C();
}

void sub_10000FBC4(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  __int16 v6;
  const char *v7;

  v2 = 136315650;
  v3 = "-[TSProximitySIMTransferViewController simSetupFlowCompleted:]";
  v4 = 2048;
  v5 = a1;
  v6 = 2080;
  v7 = "-[TSProximitySIMTransferViewController simSetupFlowCompleted:]";
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[Db] %s with completionType:%ld @%s", (uint8_t *)&v2, 0x20u);
}

void sub_10000FC58(os_log_t log)
{
  int v1;
  const char *v2;

  v1 = 136315138;
  v2 = "-[SSRemoteAlertMonitor initWithBundleID:dismissHandler:]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[E]invalid dismiss handler @%s", (uint8_t *)&v1, 0xCu);
}

void sub_10000FCD8(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  const char *v5;

  v2 = 138412546;
  v3 = a1;
  v4 = 2080;
  v5 = "-[SSRemoteAlertMonitor initWithBundleID:dismissHandler:]";
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "[E]invalid bundle id. try main bundle %@ @%s", (uint8_t *)&v2, 0x16u);
}

void sub_10000FD60(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000572C((void *)&_mh_execute_header, a1, a3, "[E]invalid externalized context. create one. @%s", a5, a6, a7, a8, 2u);
  sub_10000573C();
}

void sub_10000FDD0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000572C((void *)&_mh_execute_header, a1, a3, "[E]No first view controller - deactivate @%s", a5, a6, a7, a8, 2u);
  sub_10000573C();
}

void sub_10000FE40(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000572C((void *)&_mh_execute_header, a1, a3, "[E]invalid completion @%s", a5, a6, a7, a8, 2u);
  sub_10000573C();
}

void sub_10000FEB0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000ECA8();
  sub_10000EC98((void *)&_mh_execute_header, v0, v1, "[E]unexpected view controller:%@ @%s", v2, v3, v4, v5, v6);
  sub_10000573C();
}

void sub_10000FF1C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000572C((void *)&_mh_execute_header, a1, a3, "[E]No first view controller - deactivate @%s", a5, a6, a7, a8, 2u);
  sub_10000573C();
}

void sub_10000FF8C(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  __int16 v6;
  const char *v7;

  v2 = 136315650;
  v3 = "-[TSSIMSetupSupportViewController simSetupFlowCompleted:]";
  v4 = 2048;
  v5 = a1;
  v6 = 2080;
  v7 = "-[TSSIMSetupSupportViewController simSetupFlowCompleted:]";
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[Db] %s with completionType:%ld @%s", (uint8_t *)&v2, 0x20u);
}

void sub_100010020(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  const char *v4;

  v1 = 136315394;
  v2 = "-[TSSIMSetupSupportViewController userDidTapCancel]";
  v3 = 2080;
  v4 = "-[TSSIMSetupSupportViewController userDidTapCancel]";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "[Db] %s @%s", (uint8_t *)&v1, 0x16u);
  sub_10000573C();
}

void sub_1000100A8()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "LAContext");
  BPSApplyStyleToNavBar(v0);
}

id objc_msgSend_CGRectValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CGRectValue");
}

id objc_msgSend_SIMUnlockProcedureDidComplete(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "SIMUnlockProcedureDidComplete");
}

id objc_msgSend__anESIMExistsInSubscriptionContexts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_anESIMExistsInSubscriptionContexts");
}

id objc_msgSend__appearState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_appearState");
}

id objc_msgSend__appearingOrAppeared(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_appearingOrAppeared");
}

id objc_msgSend__applySubscriptionContext_withSubscriptionAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_applySubscriptionContext:withSubscriptionAction:");
}

id objc_msgSend__calculateEntryViewFrame(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_calculateEntryViewFrame");
}

id objc_msgSend__configureAncillaryViews(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_configureAncillaryViews");
}

id objc_msgSend__configureDescriptionLabelText(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_configureDescriptionLabelText");
}

id objc_msgSend__configureDetailLabelText(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_configureDetailLabelText");
}

id objc_msgSend__configureHeaderView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_configureHeaderView");
}

id objc_msgSend__configureLabels(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_configureLabels");
}

id objc_msgSend__configureNavigationItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_configureNavigationItem");
}

id objc_msgSend__configureOKButtonWithEnteredText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_configureOKButtonWithEnteredText:");
}

id objc_msgSend__configureTableFooterView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_configureTableFooterView");
}

id objc_msgSend__configureTitleLabelText(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_configureTitleLabelText");
}

id objc_msgSend__containerView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_containerView");
}

id objc_msgSend__deactivate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_deactivate");
}

id objc_msgSend__descriptionLabelHeightForWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_descriptionLabelHeightForWidth:");
}

id objc_msgSend__detailView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_detailView");
}

id objc_msgSend__dismissUnlockViewControllerAndDeactivate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_dismissUnlockViewControllerAndDeactivate");
}

id objc_msgSend__doTwoEsimsExist(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_doTwoEsimsExist");
}

id objc_msgSend__doesPhysicalSimExist(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_doesPhysicalSimExist");
}

id objc_msgSend__entryView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_entryView");
}

id objc_msgSend__handleLayoutUpdate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleLayoutUpdate:");
}

id objc_msgSend__indexForSubscriptionContextWithUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_indexForSubscriptionContextWithUUID:");
}

id objc_msgSend__nameForSIMWithSubscriptionContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_nameForSIMWithSubscriptionContext:");
}

id objc_msgSend__numberOfLockedSubscriptionContexts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_numberOfLockedSubscriptionContexts");
}

id objc_msgSend__presentDeviceInfoViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentDeviceInfoViewController");
}

id objc_msgSend__presentFirstController_isRemoteSignup_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentFirstController:isRemoteSignup:");
}

id objc_msgSend__presentPolicyRejectionViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentPolicyRejectionViewController");
}

id objc_msgSend__presentUnlockViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentUnlockViewController");
}

id objc_msgSend__presentedUnlockViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentedUnlockViewController");
}

id objc_msgSend__queue_processSubscriptionContext_withSubscriptionSIMStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_queue_processSubscriptionContext:withSubscriptionSIMStatus:");
}

id objc_msgSend__referenceBounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_referenceBounds");
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteViewControllerProxy");
}

id objc_msgSend__setFont_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setFont:");
}

id objc_msgSend__setHidesShadow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setHidesShadow:");
}

id objc_msgSend__startObserving(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startObserving");
}

id objc_msgSend__stopObserving(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stopObserving");
}

id objc_msgSend__titleLabelHeightForWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_titleLabelHeightForWidth:");
}

id objc_msgSend_actionSubtype(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionSubtype");
}

id objc_msgSend_actionType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionType");
}

id objc_msgSend_activeInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeInstance");
}

id objc_msgSend_addAnimation_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAnimation:forKey:");
}

id objc_msgSend_addGestureRecognizer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addGestureRecognizer:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addSubscriptionContext_withSubscriptionAction_atIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubscriptionContext:withSubscriptionAction:atIndex:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_addTarget_action_forControlEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addTarget:action:forControlEvents:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allValues");
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allocWithZone:");
}

id objc_msgSend_animateWithDuration_delay_options_animations_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animateWithDuration:delay:options:animations:completion:");
}

id objc_msgSend_animation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animation");
}

id objc_msgSend_animationWithKeyPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animationWithKeyPath:");
}

id objc_msgSend_appearance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appearance");
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "becomeFirstResponder");
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blackColor");
}

id objc_msgSend_boldSystemFontOfSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "boldSystemFontOfSize:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_buttonWithType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buttonWithType:");
}

id objc_msgSend_canBecomeFirstResponder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canBecomeFirstResponder");
}

id objc_msgSend_canResignFirstResponder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canResignFirstResponder");
}

id objc_msgSend_carrierName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "carrierName");
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "center");
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "centerYAnchor");
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearColor");
}

id objc_msgSend_colorWithAlphaComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "colorWithAlphaComponent:");
}

id objc_msgSend_configurationForDefaultMainDisplayMonitor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configurationForDefaultMainDisplayMonitor");
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_constraintEqualToConstant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToConstant:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_contentSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentSize");
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentView");
}

id objc_msgSend_convertRect_fromView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "convertRect:fromView:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_copyByApplyingPIN1_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyByApplyingPIN1:");
}

id objc_msgSend_copyByApplyingPUK_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyByApplyingPUK:");
}

id objc_msgSend_copyCarrierBundleValue_key_bundleType_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyCarrierBundleValue:key:bundleType:error:");
}

id objc_msgSend_copyWithZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyWithZone:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentDevice");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_deactivate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deactivate");
}

id objc_msgSend_decimalDigitCharacterSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decimalDigitCharacterSet");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultContentConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultContentConfiguration");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_deleteRowsAtIndexPaths_withRowAnimation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteRowsAtIndexPaths:withRowAnimation:");
}

id objc_msgSend_dequeueReusableCellWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dequeueReusableCellWithIdentifier:");
}

id objc_msgSend_deselectRowAtIndexPath_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deselectRowAtIndexPath:animated:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didSetup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didSetup");
}

id objc_msgSend_dismiss(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismiss");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_dismissViewControllerWithTransition_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissViewControllerWithTransition:completion:");
}

id objc_msgSend_displayPhoneNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayPhoneNumber");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "duration");
}

id objc_msgSend_durationForEpsilon_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "durationForEpsilon:");
}

id objc_msgSend_elements(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "elements");
}

id objc_msgSend_enteredText(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enteredText");
}

id objc_msgSend_entryView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "entryView");
}

id objc_msgSend_entryView_didEnterText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "entryView:didEnterText:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_events(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "events");
}

id objc_msgSend_extent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extent");
}

id objc_msgSend_externalizedContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "externalizedContext");
}

id objc_msgSend_filterWithName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filterWithName:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_firstViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstViewController");
}

id objc_msgSend_firstViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstViewController:");
}

id objc_msgSend_flowWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "flowWithOptions:");
}

id objc_msgSend_fontDescriptorWithSymbolicTraits_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fontDescriptorWithSymbolicTraits:");
}

id objc_msgSend_fontWithDescriptor_size_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fontWithDescriptor:size:");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frame");
}

id objc_msgSend_functionWithControlPoints__::(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "functionWithControlPoints::::");
}

id objc_msgSend_getPhoneNumber_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPhoneNumber:error:");
}

id objc_msgSend_getRemainingPINAttemptCount_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getRemainingPINAttemptCount:completion:");
}

id objc_msgSend_getRemainingPUKAttemptCount_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getRemainingPUKAttemptCount:completion:");
}

id objc_msgSend_getSIMStatus_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSIMStatus:error:");
}

id objc_msgSend_getSimHardwareInfo_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSimHardwareInfo:error:");
}

id objc_msgSend_getSimLabel_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSimLabel:error:");
}

id objc_msgSend_getSubscriptionInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSubscriptionInfo:");
}

id objc_msgSend_hardwareType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hardwareType");
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "heightAnchor");
}

id objc_msgSend_homeButtonType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "homeButtonType");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "image");
}

id objc_msgSend_imageByApplyingTransform_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageByApplyingTransform:");
}

id objc_msgSend_imageNamed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageNamed:");
}

id objc_msgSend_imageView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageView");
}

id objc_msgSend_imageWithCIImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageWithCIImage:");
}

id objc_msgSend_inBuddy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inBuddy");
}

id objc_msgSend_indexOfObject_inSortedRange_options_usingComparator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexOfObject:inSortedRange:options:usingComparator:");
}

id objc_msgSend_indexPathForRow_inSection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexPathForRow:inSection:");
}

id objc_msgSend_indexPathForSelectedRow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexPathForSelectedRow");
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "init");
}

id objc_msgSend_initWithActionType_actionSubtype_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithActionType:actionSubtype:");
}

id objc_msgSend_initWithActionType_actionSubtype_lockedSIMName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithActionType:actionSubtype:lockedSIMName:");
}

id objc_msgSend_initWithBarButtonSystemItem_target_action_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBarButtonSystemItem:target:action:");
}

id objc_msgSend_initWithBundleID_dismissHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleID:dismissHandler:");
}

id objc_msgSend_initWithBundleType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleType:");
}

id objc_msgSend_initWithDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDelegate:");
}

id objc_msgSend_initWithDictionary_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDictionary:error:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithFrame_style_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:style:");
}

id objc_msgSend_initWithImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithImage:");
}

id objc_msgSend_initWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithOptions:");
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithQueue:");
}

id objc_msgSend_initWithRootViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRootViewController:");
}

id objc_msgSend_initWithStyle_reuseIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStyle:reuseIdentifier:");
}

id objc_msgSend_initWithSubscriptionContext_subscriptionAction_lockedSIMName_delegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSubscriptionContext:subscriptionAction:lockedSIMName:delegate:");
}

id objc_msgSend_initWithSubscriptionContext_subscriptionAction_suppressCancellation_delegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSubscriptionContext:subscriptionAction:suppressCancellation:delegate:");
}

id objc_msgSend_initWithSubscriptionContexts_subscriptionActions_suppressCancellation_delegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSubscriptionContexts:subscriptionActions:suppressCancellation:delegate:");
}

id objc_msgSend_initWithTarget_action_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTarget:action:");
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertObject:atIndex:");
}

id objc_msgSend_insertRowsAtIndexPaths_withRowAnimation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertRowsAtIndexPaths:withRowAnimation:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_invertedSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invertedSet");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToDictionary:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFirstResponder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFirstResponder");
}

id objc_msgSend_isOnScreen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isOnScreen");
}

id objc_msgSend_isPad(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPad");
}

id objc_msgSend_isSimHidden(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSimHidden");
}

id objc_msgSend_isUIApplicationElement(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isUIApplicationElement");
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isViewLoaded");
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layer");
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layoutIfNeeded");
}

id objc_msgSend_layoutMarginsGuide(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layoutMarginsGuide");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_level(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "level");
}

id objc_msgSend_lightGrayColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lightGrayColor");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_localizedStringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringWithFormat:");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainScreen");
}

id objc_msgSend_monitorWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "monitorWithConfiguration:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_navigationBar(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "navigationBar");
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "navigationController");
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "navigationItem");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "null");
}

id objc_msgSend_number(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "number");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_outputImage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outputImage");
}

id objc_msgSend_phoneNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "phoneNumber");
}

id objc_msgSend_pin1(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pin1");
}

id objc_msgSend_popToViewController_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "popToViewController:animated:");
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_preferredFontDescriptorWithTextStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredFontDescriptorWithTextStyle:");
}

id objc_msgSend_preferredFontForTextStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredFontForTextStyle:");
}

id objc_msgSend_presentProxCardFlowWithDelegate_initialViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentProxCardFlowWithDelegate:initialViewController:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentedViewController");
}

id objc_msgSend_presentingViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentingViewController");
}

id objc_msgSend_puk(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "puk");
}

id objc_msgSend_pushViewController_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pushViewController:animated:");
}

id objc_msgSend_rangeOfCharacterFromSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeOfCharacterFromSet:");
}

id objc_msgSend_registerForLockNotifications(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerForLockNotifications");
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reloadData");
}

id objc_msgSend_reloadRowsAtIndexPaths_withRowAnimation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reloadRowsAtIndexPaths:withRowAnimation:");
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeFromSuperview");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeSubscriptionContextAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeSubscriptionContextAtIndex:");
}

id objc_msgSend_replaceObjectAtIndex_withObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "replaceObjectAtIndex:withObject:");
}

id objc_msgSend_resetEnteredTextWithShakeAnimation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetEnteredTextWithShakeAnimation:");
}

id objc_msgSend_resignFirstResponder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resignFirstResponder");
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "row");
}

id objc_msgSend_safeAreaInsets(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "safeAreaInsets");
}

id objc_msgSend_screenLockDidUpdate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "screenLockDidUpdate:");
}

id objc_msgSend_secondaryTextProperties(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "secondaryTextProperties");
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "section");
}

id objc_msgSend_setAccessoryType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessoryType:");
}

id objc_msgSend_setAccessoryView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessoryView:");
}

id objc_msgSend_setActive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActive:");
}

id objc_msgSend_setAdditive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAdditive:");
}

id objc_msgSend_setAdjustsFontSizeToFitWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAdjustsFontSizeToFitWidth:");
}

id objc_msgSend_setAllowsAlertStacking_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsAlertStacking:");
}

id objc_msgSend_setAllowsMenuButtonDismissal_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsMenuButtonDismissal:");
}

id objc_msgSend_setAllowsMultipleSelection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsMultipleSelection:");
}

id objc_msgSend_setAllowsSelection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsSelection:");
}

id objc_msgSend_setAnimations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAnimations:");
}

id objc_msgSend_setAttemptsRemaining_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttemptsRemaining:");
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutoresizingMask:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBorderStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBorderStyle:");
}

id objc_msgSend_setCarrierName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCarrierName:");
}

id objc_msgSend_setCenter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCenter:");
}

id objc_msgSend_setClipsToBounds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClipsToBounds:");
}

id objc_msgSend_setColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setColor:");
}

id objc_msgSend_setConstant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConstant:");
}

id objc_msgSend_setContentConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentConfiguration:");
}

id objc_msgSend_setContentMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentMode:");
}

id objc_msgSend_setCornerRadius_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCornerRadius:");
}

id objc_msgSend_setDamping_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDamping:");
}

id objc_msgSend_setDataSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDataSource:");
}

id objc_msgSend_setDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDefaults");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDesiredHardwareButtonEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDesiredHardwareButtonEvents:");
}

id objc_msgSend_setDirection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDirection:");
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDuration:");
}

id objc_msgSend_setEdgesForExtendedLayout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEdgesForExtendedLayout:");
}

id objc_msgSend_setEditing_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEditing:");
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnabled:");
}

id objc_msgSend_setEstimatedRowHeight_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEstimatedRowHeight:");
}

id objc_msgSend_setFillMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFillMode:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setFooterView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFooterView:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setFromValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFromValue:");
}

id objc_msgSend_setHeaderView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHeaderView:");
}

id objc_msgSend_setHeightAnchor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHeightAnchor:");
}

id objc_msgSend_setIdleTimerDisabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdleTimerDisabled:");
}

id objc_msgSend_setIdleTimerDisabled_forReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdleTimerDisabled:forReason:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setInitialVelocity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInitialVelocity:");
}

id objc_msgSend_setKeyboardType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setKeyboardType:");
}

id objc_msgSend_setLeftBarButtonItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLeftBarButtonItem:");
}

id objc_msgSend_setLeftBarButtonItem_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLeftBarButtonItem:animated:");
}

id objc_msgSend_setLineBreakMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLineBreakMode:");
}

id objc_msgSend_setMass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMass:");
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModalPresentationStyle:");
}

id objc_msgSend_setModalTransitionStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModalTransitionStyle:");
}

id objc_msgSend_setNeedsDisplay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNeedsDisplay");
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNeedsLayout");
}

id objc_msgSend_setNeedsUpdateConstraints(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNeedsUpdateConstraints");
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setNumberOfSIMsToUnlockAndanESIMExists_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumberOfSIMsToUnlockAndanESIMExists:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOverrideUserInterfaceStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOverrideUserInterfaceStyle:");
}

id objc_msgSend_setPhoneNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPhoneNumber:");
}

id objc_msgSend_setPinMismatch_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPinMismatch:");
}

id objc_msgSend_setPkNavigationController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPkNavigationController:");
}

id objc_msgSend_setPreferredContentSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreferredContentSize:");
}

id objc_msgSend_setRowHeight_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRowHeight:");
}

id objc_msgSend_setScrollEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScrollEnabled:");
}

id objc_msgSend_setSecondaryText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSecondaryText:");
}

id objc_msgSend_setSecureTextEntry_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSecureTextEntry:");
}

id objc_msgSend_setSeparatorStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSeparatorStyle:");
}

id objc_msgSend_setStiffness_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStiffness:");
}

id objc_msgSend_setTableFooterView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTableFooterView:");
}

id objc_msgSend_setTableView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTableView:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTextAlignment_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTextAlignment:");
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTextColor:");
}

id objc_msgSend_setTimingFunction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimingFunction:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTitle_forState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitle:forState:");
}

id objc_msgSend_setTitleColor_forState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitleColor:forState:");
}

id objc_msgSend_setToValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setToValue:");
}

id objc_msgSend_setTransitionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTransitionHandler:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setTranslucent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTranslucent:");
}

id objc_msgSend_setUnlocking_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUnlocking:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setView:");
}

id objc_msgSend_setWallpaperStyle_withDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWallpaperStyle:withDuration:");
}

id objc_msgSend_setWallpaperTunnelActive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWallpaperTunnelActive:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_simLocation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "simLocation");
}

id objc_msgSend_simSetupFlowCompleted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "simSetupFlowCompleted:");
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "size");
}

id objc_msgSend_sizeThatFits_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sizeThatFits:");
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sizeToFit");
}

id objc_msgSend_slotID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "slotID");
}

id objc_msgSend_stringByReplacingCharactersInRange_withString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByReplacingCharactersInRange:withString:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithString:");
}

id objc_msgSend_subscriptionActionForSubscriptionSIMStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subscriptionActionForSubscriptionSIMStatus:");
}

id objc_msgSend_subscriptionContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subscriptionContext");
}

id objc_msgSend_subscriptions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subscriptions");
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemBackgroundColor");
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemBlueColor");
}

id objc_msgSend_systemGrayColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemGrayColor");
}

id objc_msgSend_systemImageNamed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemImageNamed:");
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tableView");
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "text");
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "textLabel");
}

id objc_msgSend_textProperties(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "textProperties");
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "titleLabel");
}

id objc_msgSend_topViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topViewController");
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trailingAnchor");
}

id objc_msgSend_unlockDetailViewController_didCompleteWithResult_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unlockDetailViewController:didCompleteWithResult:");
}

id objc_msgSend_unlockListFooterViewContinueButtonWasPressed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unlockListFooterViewContinueButtonWasPressed:");
}

id objc_msgSend_unlockListViewControllerDidComplete_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unlockListViewControllerDidComplete:");
}

id objc_msgSend_unlockPIN_pin_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unlockPIN:pin:error:");
}

id objc_msgSend_unlockPUK_puk_newPin_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unlockPUK:puk:newPin:error:");
}

id objc_msgSend_unregisterFromLockNotifications(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unregisterFromLockNotifications");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_updateSubscriptionContext_withSubscriptionAction_atIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateSubscriptionContext:withSubscriptionAction:atIndex:");
}

id objc_msgSend_userDidTapCancel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userDidTapCancel");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInterfaceIdiom");
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uuid");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_valueWithCGPoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueWithCGPoint:");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_viewControllers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewControllers");
}

id objc_msgSend_visiblePeripheralFrame(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "visiblePeripheralFrame");
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "whiteColor");
}
