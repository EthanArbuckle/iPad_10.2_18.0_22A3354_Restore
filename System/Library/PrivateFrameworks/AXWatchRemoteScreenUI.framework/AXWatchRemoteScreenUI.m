void *__getAXWatchRemoteScreenIsPairedGizmoHasStingSupportSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (AXWatchRemoteScreenServicesLibraryCore_frameworkLibrary)
  {
    v2 = (void *)AXWatchRemoteScreenServicesLibraryCore_frameworkLibrary;
  }
  else
  {
    AXWatchRemoteScreenServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)AXWatchRemoteScreenServicesLibraryCore_frameworkLibrary;
    if (!AXWatchRemoteScreenServicesLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "AXWatchRemoteScreenIsPairedGizmoHasStingSupport");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getAXWatchRemoteScreenIsPairedGizmoHasStingSupportSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                                 + 24);
  return result;
}

double AXCSLUIKitSceneMetricsSystemMinimumMargin()
{
  return 0.0;
}

void AXWatchRemoteScreenBannerView(void *a1, void *a2, void *a3, double a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  NSClassFromString(CFSTR("UIView"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2050000000;
    v10 = (void *)getAXUIBannerPresenterClass_softClass;
    v19 = getAXUIBannerPresenterClass_softClass;
    if (!getAXUIBannerPresenterClass_softClass)
    {
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __getAXUIBannerPresenterClass_block_invoke;
      v15[3] = &unk_24E36D4C8;
      v15[4] = &v16;
      __getAXUIBannerPresenterClass_block_invoke((uint64_t)v15);
      v10 = (void *)v17[3];
    }
    v11 = objc_retainAutorelease(v10);
    _Block_object_dispose(&v16, 8);
    v12 = (void *)objc_msgSend([v11 alloc], "initWithContainingView:", v7);
    objc_msgSend(v12, "containingView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    AXWatchRemoteScreenRemoveLayerFromAirplay(v14);

    objc_msgSend(v12, "presentBannerViewWithText:secondaryText:duration:fromUserAction:", v8, v9, 0, a4);
  }

}

void sub_21EC62778(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void AXWatchRemoteScreenRemoveLayerFromAirplay(void *a1)
{
  id v1;

  v1 = a1;
  objc_msgSend(v1, "setDisableUpdateMask:", objc_msgSend(v1, "disableUpdateMask") | 0x10);

}

Class __getAXUIBannerPresenterClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!AccessibilityUIUtilitiesLibraryCore_frameworkLibrary)
  {
    AccessibilityUIUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!AccessibilityUIUtilitiesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("AXUIBannerPresenter");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getAXUIBannerPresenterClass_block_invoke_cold_1();
    free(v3);
  }
  getAXUIBannerPresenterClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getAPRKStreamRenderingManagerClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getAPRKStreamRenderingManagerClass_softClass;
  v7 = getAPRKStreamRenderingManagerClass_softClass;
  if (!getAPRKStreamRenderingManagerClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getAPRKStreamRenderingManagerClass_block_invoke;
    v3[3] = &unk_24E36D4C8;
    v3[4] = &v4;
    __getAPRKStreamRenderingManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21EC62AC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAPRKStreamRenderingManagerClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!AirPlayReceiverKitLibraryCore_frameworkLibrary)
  {
    AirPlayReceiverKitLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!AirPlayReceiverKitLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_6:
      __getAPRKStreamRenderingManagerClass_block_invoke_cold_1();
    }
  }
  result = objc_getClass("APRKStreamRenderingManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_6;
  getAPRKStreamRenderingManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_3()
{
  void *v0;

  return objc_msgSend(v0, "streamRendererMode");
}

void sub_21EC63480()
{
  id v0;
  id v1;
  id v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  double v9;
  id v10;
  id v11;

  v0 = objc_msgSend((id)objc_opt_self(), sel_preferredFontDescriptorWithTextStyle_, *MEMORY[0x24BEBE210]);
  v1 = objc_msgSend(v0, sel_fontDescriptorWithSymbolicTraits_, objc_msgSend(v0, sel_symbolicTraits) | 0x8002);

  if (v1)
  {

    v2 = objc_allocWithZone(MEMORY[0x24BEBD708]);
    v3 = v1;
    v4 = objc_msgSend(v2, sel_init);
    sub_21EC7CF98();
    v5 = (void *)sub_21EC7CF38();
    MEMORY[0x2207B9FF8]();
    v7 = v6;

    if (v7)
    {
      v8 = (void *)sub_21EC7D094();
      swift_bridgeObjectRelease();
    }
    else
    {
      v8 = 0;
    }
    objc_msgSend(v4, sel_setText_, v8);

    objc_msgSend(v4, sel_setTextAlignment_, 1);
    objc_msgSend(v3, sel_pointSize);
    v10 = objc_msgSend((id)objc_opt_self(), sel_fontWithDescriptor_size_, v3, v9);

    objc_msgSend(v4, sel_setFont_, v10);
    objc_msgSend(v4, sel_setNumberOfLines_, 0);
    objc_msgSend(v4, sel_setAccessibilityTraits_, *MEMORY[0x24BEBDF08]);
    v11 = v4;
    objc_msgSend(v11, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  }
  else
  {
    __break(1u);
  }
}

id sub_21EC63678@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  void **v3;
  void *v4;

  v3 = (void **)(*a1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_titleLabel);
  swift_beginAccess();
  v4 = *v3;
  *a2 = *v3;
  return v4;
}

void sub_21EC636C8(void **a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_21EC64008(a1, a2, a3, a4, &OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_titleLabel);
}

id sub_21EC636D4()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_titleLabel);
  swift_beginAccess();
  return *v1;
}

void sub_21EC63718(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_titleLabel);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*sub_21EC63768())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id sub_21EC637B0()
{
  void *v0;
  id v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v0 = (void *)objc_opt_self();
  v1 = objc_msgSend(v0, sel_configurationWithPointSize_weight_scale_, 5, 3, 20.0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2554816B0);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_21EC7DEA0;
  v3 = (void *)objc_opt_self();
  *(_QWORD *)(v2 + 32) = objc_msgSend(v3, sel_systemGrayColor);
  *(_QWORD *)(v2 + 40) = objc_msgSend(v3, sel_systemGray5Color);
  sub_21EC7D10C();
  sub_21EC66B28(0, &qword_2554816F0);
  v4 = (void *)sub_21EC7D0E8();
  swift_bridgeObjectRelease();
  v5 = objc_msgSend(v0, sel_configurationWithPaletteColors_, v4);

  v6 = v1;
  v7 = (void *)sub_21EC7D094();
  v8 = objc_msgSend((id)objc_opt_self(), sel_systemImageNamed_withConfiguration_, v7, v6);

  v9 = objc_msgSend(v8, sel_imageByApplyingSymbolConfiguration_, v5);
  v10 = objc_msgSend((id)objc_opt_self(), sel_buttonWithType_, 0);
  objc_msgSend(v10, sel_setBackgroundImage_forState_, v9, 0);
  objc_msgSend(v10, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  sub_21EC7CF98();
  v11 = v10;
  v12 = (void *)sub_21EC7CF38();
  sub_21EC7CF44();

  v13 = (void *)sub_21EC7D094();
  swift_bridgeObjectRelease();
  objc_msgSend(v11, sel_setAccessibilityLabel_, v13);

  return v11;
}

id sub_21EC63A50@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  void **v3;
  void *v4;

  v3 = (void **)(*a1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_dismissButton);
  swift_beginAccess();
  v4 = *v3;
  *a2 = *v3;
  return v4;
}

void sub_21EC63AA0(void **a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_21EC64008(a1, a2, a3, a4, &OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_dismissButton);
}

id sub_21EC63AAC()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_dismissButton);
  swift_beginAccess();
  return *v1;
}

void sub_21EC63AF0(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_dismissButton);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*sub_21EC63B40())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id sub_21EC63B84@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = sub_21EC63BE8();
  *a1 = result;
  return result;
}

void sub_21EC63BAC(void **a1, _QWORD *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *a1;
  v4 = *(id *)(*a2
             + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController____lazy_storage___watchDeviceView);
  *(_QWORD *)(*a2
            + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController____lazy_storage___watchDeviceView) = *a1;
  v3 = v2;

}

id sub_21EC63BE8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController____lazy_storage___watchDeviceView;
  v2 = *(void **)(v0
                + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController____lazy_storage___watchDeviceView);
  if (v2)
  {
    v3 = *(id *)(v0
               + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController____lazy_storage___watchDeviceView);
  }
  else
  {
    type metadata accessor for AXTwiceCompanionWatchView();
    v4 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

void sub_21EC63C5C(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1
                + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController____lazy_storage___watchDeviceView);
  *(_QWORD *)(v1
            + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController____lazy_storage___watchDeviceView) = a1;

}

void (*sub_21EC63C70(id *a1))(uint64_t *a1)
{
  void *v1;

  a1[1] = v1;
  *a1 = sub_21EC63BE8();
  return sub_21EC63CA4;
}

void sub_21EC63CA4(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v2 = *a1;
  v1 = a1[1];
  v3 = *(void **)(v1
                + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController____lazy_storage___watchDeviceView);
  *(_QWORD *)(v1
            + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController____lazy_storage___watchDeviceView) = v2;

}

id sub_21EC63CBC@<X0>(_QWORD *a1@<X8>)
{
  id result;
  uint64_t v3;

  result = sub_21EC63D24();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_21EC63CE4(__int128 *a1, _QWORD *a2)
{
  __int128 v2;
  id v3;
  id v4;

  v4 = *(id *)(*a2
             + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController____lazy_storage___deviceView);
  v2 = *a1;
  *(_OWORD *)(*a2
            + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController____lazy_storage___deviceView) = *a1;
  v3 = (id)v2;

}

id sub_21EC63D24()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController____lazy_storage___deviceView;
  v2 = *(void **)(v0
                + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController____lazy_storage___deviceView);
  if (v2)
  {
    v3 = *(id *)(v0
               + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController____lazy_storage___deviceView);
  }
  else
  {
    _AXSTwiceRemoteScreenPlatform();
    v4 = sub_21EC63BE8();
    v5 = *(void **)v1;
    *(_QWORD *)v1 = v4;
    *(_QWORD *)(v1 + 8) = &protocol witness table for AXTwiceCompanionWatchView;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

void sub_21EC63D98(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  void *v4;

  v3 = (_QWORD *)(v2
                + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController____lazy_storage___deviceView);
  v4 = *(void **)(v2
                + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController____lazy_storage___deviceView);
  *v3 = a1;
  v3[1] = a2;

}

void (*sub_21EC63DB0(id *a1))(uint64_t a1)
{
  void *v1;
  void *v3;

  a1[2] = v1;
  *a1 = sub_21EC63D24();
  a1[1] = v3;
  return sub_21EC63DE4;
}

void sub_21EC63DE4(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = *(void **)(v1
                + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController____lazy_storage___deviceView);
  *(_OWORD *)(v1
            + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController____lazy_storage___deviceView) = *(_OWORD *)a1;

}

id sub_21EC63E00()
{
  id v0;
  id v1;
  id v2;
  id v3;
  void *v4;
  double v5;
  id v6;
  id v7;

  v0 = objc_msgSend((id)objc_opt_self(), sel_preferredFontDescriptorWithTextStyle_, *MEMORY[0x24BEBE1D0]);
  v1 = objc_allocWithZone(MEMORY[0x24BEBD708]);
  v2 = v0;
  v3 = objc_msgSend(v1, sel_init);
  v4 = (void *)sub_21EC7D094();
  objc_msgSend(v3, sel_setText_, v4);

  objc_msgSend(v3, sel_setTextAlignment_, 1);
  objc_msgSend(v2, sel_pointSize);
  v6 = objc_msgSend((id)objc_opt_self(), sel_fontWithDescriptor_size_, v2, v5);

  objc_msgSend(v3, sel_setFont_, v6);
  objc_msgSend(v3, sel_setNumberOfLines_, 0);
  objc_msgSend(v3, sel_setAdjustsFontSizeToFitWidth_, 1);
  objc_msgSend(v3, sel_setMinimumScaleFactor_, 0.5);
  objc_msgSend(v3, sel_setAccessibilityTraits_, *MEMORY[0x24BEBDF40]);
  objc_msgSend(v3, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v7 = v3;
  objc_msgSend(v7, sel_setHidden_, 1);

  return v7;
}

id sub_21EC63FAC@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  void **v3;
  void *v4;

  v3 = (void **)(*a1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_statusLabel);
  swift_beginAccess();
  v4 = *v3;
  *a2 = *v3;
  return v4;
}

void sub_21EC63FFC(void **a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_21EC64008(a1, a2, a3, a4, &OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_statusLabel);
}

void sub_21EC64008(void **a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  void *v5;
  void **v6;
  void *v7;
  id v8;

  v5 = *a1;
  v6 = (void **)(*a2 + *a5);
  swift_beginAccess();
  v7 = *v6;
  *v6 = v5;
  v8 = v5;

}

id sub_21EC64064()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_statusLabel);
  swift_beginAccess();
  return *v1;
}

void sub_21EC640A8(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_statusLabel);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*sub_21EC640F8())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id sub_21EC6413C()
{
  id v0;
  id v1;
  id v2;
  id v3;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), sel_init);
  v1 = objc_msgSend((id)objc_opt_self(), sel_systemBackgroundColor);
  objc_msgSend(v0, sel_setBackgroundColor_, v1);

  v2 = objc_msgSend(v0, sel_layer);
  AXDisplayCornerRadiusWithMargin();
  objc_msgSend(v2, sel_setCornerRadius_);

  v3 = objc_msgSend(v0, sel_layer);
  objc_msgSend(v3, sel_setCornerCurve_, *MEMORY[0x24BDE58E8]);

  objc_msgSend(v0, sel_setClipsToBounds_, 1);
  objc_msgSend(v0, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  return v0;
}

uint64_t type metadata accessor for AXTwiceCompanionMainViewController()
{
  return objc_opt_self();
}

void sub_21EC64300()
{
  char *v0;
  char *v1;
  id v2;
  void *v3;
  id v4;
  id v5;
  char *v6;
  id *v7;
  id v8;
  id v9;
  char *v10;
  id *v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  id *v45;
  uint64_t v46;
  id v47;
  id v48;
  uint64_t v49;
  id v50;
  id v51;
  id v52;
  id v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t ObjectType;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  uint64_t v100;
  void *v101;
  id *v102;
  uint64_t v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  id v113;
  id v114;
  id v115;
  id v116;
  void *v117;
  void *v118;
  id *v119;
  uint64_t v120;
  id v121;
  id v122;
  id v123;
  id v124;
  id v125;
  id v126;
  id v127;
  id v128;
  id v129;
  id v130;
  id v131;
  id v132;
  id v133;
  void *v134;
  void *v135;
  id v136;
  objc_super v137;

  v1 = v0;
  v137.receiver = v0;
  v137.super_class = (Class)type metadata accessor for AXTwiceCompanionMainViewController();
  objc_msgSendSuper2(&v137, sel_viewDidLoad);
  objc_msgSend(v0, sel_setModalPresentationStyle_, 4);
  v2 = objc_msgSend(v0, sel_view);
  if (!v2)
  {
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v3 = v2;
  v4 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
  objc_msgSend(v3, sel_setBackgroundColor_, v4);

  objc_msgSend(v1, sel_setTransitioningDelegate_, *(_QWORD *)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_pullToDismissManager]);
  v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD7E0]), sel_initWithTarget_action_, v1, sel_cardSwipeDownWithGesture_);
  v6 = (char *)sub_21EC63BE8();
  v7 = (id *)&v6[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_swipeUpCrownGesture];
  swift_beginAccess();
  v8 = *v7;
  v9 = *v7;

  if (v8)
  {
    objc_msgSend(v5, sel_requireGestureRecognizerToFail_, v9);

  }
  v10 = (char *)sub_21EC63BE8();
  v11 = (id *)&v10[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_swipeDownCrownGesture];
  swift_beginAccess();
  v12 = *v11;
  v13 = *v11;

  if (v12)
  {
    objc_msgSend(v5, sel_requireGestureRecognizerToFail_, v13);

  }
  v14 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_cardBackgroundView;
  objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_cardBackgroundView], sel_addGestureRecognizer_, v5);
  v15 = objc_msgSend(v1, sel_view);
  if (!v15)
    goto LABEL_18;
  v16 = v15;
  objc_msgSend(v15, sel_addSubview_, *(_QWORD *)&v1[v14]);

  __swift_instantiateConcreteTypeFromMangledName(&qword_2554816B0);
  v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_21EC7DEB0;
  v18 = objc_msgSend(*(id *)&v1[v14], sel_centerXAnchor);
  v19 = objc_msgSend(v1, sel_view);
  if (!v19)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v20 = v19;
  v21 = objc_msgSend(v19, sel_centerXAnchor);

  v22 = objc_msgSend(v18, sel_constraintEqualToAnchor_, v21);
  *(_QWORD *)(v17 + 32) = v22;
  v23 = objc_msgSend(*(id *)&v1[v14], sel_leadingAnchor);
  v24 = objc_msgSend(v1, sel_view);
  if (!v24)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v25 = v24;
  v26 = objc_msgSend(v24, sel_leadingAnchor);

  v27 = objc_msgSend(v23, sel_constraintEqualToAnchor_constant_, v26, 6.0);
  *(_QWORD *)(v17 + 40) = v27;
  v28 = objc_msgSend(*(id *)&v1[v14], sel_trailingAnchor);
  v29 = objc_msgSend(v1, sel_view);
  if (!v29)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v30 = v29;
  v31 = objc_msgSend(v29, sel_trailingAnchor);

  v32 = objc_msgSend(v28, sel_constraintEqualToAnchor_constant_, v31, -6.0);
  *(_QWORD *)(v17 + 48) = v32;
  v33 = objc_msgSend(*(id *)&v1[v14], sel_heightAnchor);
  v34 = objc_msgSend(v1, sel_view);
  if (!v34)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v35 = v34;
  v135 = v5;
  v36 = objc_msgSend(v34, sel_heightAnchor);

  v37 = objc_msgSend(v33, sel_constraintLessThanOrEqualToAnchor_multiplier_, v36, 0.9);
  *(_QWORD *)(v17 + 56) = v37;
  v38 = objc_msgSend(*(id *)&v1[v14], sel_bottomAnchor);
  v39 = objc_msgSend(v1, sel_view);
  if (!v39)
  {
LABEL_23:
    __break(1u);
    return;
  }
  v40 = v39;
  v136 = (id)objc_opt_self();
  v41 = objc_msgSend(v40, sel_bottomAnchor);

  v42 = objc_msgSend(v38, sel_constraintEqualToAnchor_constant_, v41, -6.0);
  *(_QWORD *)(v17 + 64) = v42;
  sub_21EC7D10C();
  sub_21EC66B28(0, &qword_2554816B8);
  v43 = (void *)sub_21EC7D0E8();
  swift_bridgeObjectRelease();
  objc_msgSend(v136, sel_activateConstraints_, v43);

  v44 = *(void **)&v1[v14];
  v45 = (id *)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_dismissButton];
  swift_beginAccess();
  objc_msgSend(v44, sel_addSubview_, *v45);
  v46 = swift_allocObject();
  *(_OWORD *)(v46 + 16) = xmmword_21EC7DEA0;
  v47 = objc_msgSend(*v45, sel_centerYAnchor);
  v48 = objc_msgSend(*(id *)&v1[v14], sel_topAnchor);
  v49 = v14;
  v50 = objc_msgSend(v47, sel_constraintEqualToAnchor_constant_, v48, 32.0);

  *(_QWORD *)(v46 + 32) = v50;
  v51 = objc_msgSend(*v45, sel_centerXAnchor);
  v52 = objc_msgSend(*(id *)&v1[v49], sel_trailingAnchor);
  v53 = objc_msgSend(v51, (SEL)0x24E36FF67, v52, -32.0);

  *(_QWORD *)(v46 + 40) = v53;
  sub_21EC7D10C();
  v54 = (void *)sub_21EC7D0E8();
  swift_bridgeObjectRelease();
  objc_msgSend(v136, sel_activateConstraints_, v54);

  v55 = *(id *)&v1[v49];
  v56 = sub_21EC63D24();
  objc_msgSend(v55, sel_addSubview_, v56);

  v57 = sub_21EC63D24();
  v59 = v58;
  ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t, double))(v59 + 16))(ObjectType, v59, 30.0);

  v61 = sub_21EC63D24();
  v63 = v62;
  v64 = swift_getObjectType();
  v65 = sub_21EC63D24();
  v66 = objc_msgSend(v65, sel_leftAnchor);

  v67 = objc_msgSend(*(id *)&v1[v49], sel_leftAnchor);
  v68 = objc_msgSend(v66, sel_constraintEqualToAnchor_, v67);

  (*(void (**)(id, uint64_t, uint64_t))(v63 + 40))(v68, v64, v63);
  v69 = sub_21EC63D24();
  v71 = v70;
  v72 = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t, double))(v71 + 64))(v72, v71, 15.0);

  v73 = sub_21EC63D24();
  v75 = v74;
  v76 = swift_getObjectType();
  v77 = sub_21EC63D24();
  v78 = objc_msgSend(v77, sel_rightAnchor);

  v79 = objc_msgSend(*(id *)&v1[v49], sel_rightAnchor);
  v80 = objc_msgSend(v78, sel_constraintEqualToAnchor_, v79);

  (*(void (**)(id, uint64_t, uint64_t))(v75 + 88))(v80, v76, v75);
  v81 = sub_21EC63D24();
  v83 = v82;
  v84 = swift_getObjectType();
  v85 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v83 + 32))(v84, v83);

  if (v85)
  {
    v86 = sub_21EC63D24();
    v88 = v87;
    v89 = swift_getObjectType();
    v90 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v88 + 80))(v89, v88);

    if (v90)
    {
      v91 = swift_allocObject();
      *(_OWORD *)(v91 + 16) = xmmword_21EC7DEC0;
      *(_QWORD *)(v91 + 32) = v85;
      *(_QWORD *)(v91 + 40) = v90;
      v92 = v85;
      v93 = v90;
      v94 = sub_21EC63D24();
      v95 = objc_msgSend(v94, sel_heightAnchor);

      v96 = sub_21EC63D24();
      v97 = objc_msgSend(v96, sel_widthAnchor);

      v98 = objc_msgSend(v95, sel_constraintEqualToAnchor_multiplier_, v97, 1.12);
      *(_QWORD *)(v91 + 48) = v98;
      sub_21EC7D10C();
      v85 = (void *)sub_21EC7D0E8();
      swift_bridgeObjectRelease();
      objc_msgSend(v136, sel_activateConstraints_, v85);

    }
  }
  v99 = sub_21EC63BE8();
  sub_21EC6E4E0(0.1);

  v100 = v49;
  v101 = *(void **)&v1[v49];
  v102 = (id *)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_titleLabel];
  swift_beginAccess();
  objc_msgSend(v101, sel_addSubview_, *v102);
  v103 = swift_allocObject();
  *(_OWORD *)(v103 + 16) = xmmword_21EC7DED0;
  v104 = objc_msgSend(*v102, sel_leadingAnchor);
  v105 = objc_msgSend(*(id *)&v1[v49], (SEL)&stru_24E36F120.type + 6);
  v106 = objc_msgSend(v104, sel_constraintEqualToAnchor_constant_, v105, 40.0);

  *(_QWORD *)(v103 + 32) = v106;
  v107 = objc_msgSend(*v102, sel_trailingAnchor);
  v108 = objc_msgSend(*(id *)&v1[v49], (SEL)&OBJC_INSTANCE_METHODS_AXTwiceCompanionAirplayReceiverDelegate);
  v109 = objc_msgSend(v107, sel_constraintEqualToAnchor_constant_, v108, -45.0);

  *(_QWORD *)(v103 + 40) = v109;
  v110 = objc_msgSend(*v102, sel_topAnchor);
  v111 = objc_msgSend(*(id *)&v1[v49], (SEL)&ResourceBundleClass.name + 4);
  v112 = objc_msgSend(v110, sel_constraintEqualToAnchor_constant_, v111, 32.0);

  *(_QWORD *)(v103 + 48) = v112;
  v113 = objc_msgSend(*v102, sel_bottomAnchor);
  v114 = sub_21EC63D24();
  v115 = objc_msgSend(v114, (SEL)&ResourceBundleClass.name + 4);

  v116 = objc_msgSend(v113, sel_constraintEqualToAnchor_constant_, v115, -20.0);
  *(_QWORD *)(v103 + 56) = v116;
  sub_21EC7D10C();
  v117 = (void *)sub_21EC7D0E8();
  swift_bridgeObjectRelease();
  objc_msgSend(v136, sel_activateConstraints_, v117);

  v118 = *(void **)&v1[v49];
  v119 = (id *)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_statusLabel];
  swift_beginAccess();
  objc_msgSend(v118, sel_addSubview_, *v119);
  v120 = swift_allocObject();
  *(_OWORD *)(v120 + 16) = xmmword_21EC7DED0;
  v121 = objc_msgSend(*v119, sel_leadingAnchor);
  v122 = objc_msgSend(*(id *)&v1[v100], sel_leadingAnchor);
  v123 = objc_msgSend(v121, sel_constraintEqualToAnchor_constant_, v122, 40.0);

  *(_QWORD *)(v120 + 32) = v123;
  v124 = objc_msgSend(*v119, sel_trailingAnchor);
  v125 = objc_msgSend(*(id *)&v1[v100], sel_trailingAnchor);
  v126 = objc_msgSend(v124, sel_constraintEqualToAnchor_constant_, v125, -45.0);

  *(_QWORD *)(v120 + 40) = v126;
  v127 = objc_msgSend(*v119, sel_topAnchor);
  v128 = sub_21EC63D24();
  v129 = objc_msgSend(v128, sel_bottomAnchor);

  v130 = objc_msgSend(v127, sel_constraintEqualToAnchor_constant_, v129, 20.0);
  *(_QWORD *)(v120 + 48) = v130;
  v131 = objc_msgSend(*v119, sel_bottomAnchor);
  v132 = objc_msgSend(*(id *)&v1[v100], sel_bottomAnchor);
  v133 = objc_msgSend(v131, sel_constraintEqualToAnchor_constant_, v132, -32.0);

  *(_QWORD *)(v120 + 56) = v133;
  sub_21EC7D10C();
  v134 = (void *)sub_21EC7D0E8();
  swift_bridgeObjectRelease();
  objc_msgSend(v136, sel_activateConstraints_, v134);

}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2207BA928]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_21EC6520C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  int v6;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v19;

  v2 = sub_21EC7CFE0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  if (v6 == *MEMORY[0x24BDFF510]
    || v6 == *MEMORY[0x24BDFF4F8]
    || v6 == *MEMORY[0x24BDFF500]
    || v6 == *MEMORY[0x24BDFF508])
  {
    sub_21EC7CF98();
    v10 = (void *)sub_21EC7CF38();
    v11 = sub_21EC7CF44();
    v13 = v12;

    v14 = 0;
    v15 = 0;
  }
  else if (v6 == *MEMORY[0x24BDFF520])
  {
    sub_21EC7CF98();
    v16 = (void *)sub_21EC7CF38();
    v11 = sub_21EC7CF44();
    v13 = v17;

    v15 = 0xEC0000006F656469;
    v14 = 0x7679616C70726961;
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    v14 = 0;
    v15 = 0;
    v11 = 0;
    v13 = 0xE000000000000000;
  }
  sub_21EC657A0(v11, v13, v14, v15);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21EC653E8(uint64_t a1, uint64_t a2)
{
  return sub_21EC657A0(a1, a2, 0xD000000000000016, 0x800000021EC7E600);
}

void sub_21EC65404(uint64_t a1)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char v17;
  void (*v18)(char *, uint64_t);
  void (*v19)(char *, uint64_t, uint64_t);
  char *v20;
  char *v21;
  char v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t ObjectType;
  char v27;
  char *v28;
  uint64_t v29;
  char *v30;
  char *v31;
  void (*v32)(char *, uint64_t, uint64_t);
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v2 = sub_21EC7CFE0();
  v3 = (uint64_t (*)(uint64_t))MEMORY[0x24BDFF528];
  v4 = *(_QWORD **)(v2 - 8);
  v5 = MEMORY[0x24BDAC7A8](v2);
  v30 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v33 = (char *)&v29 - v8;
  v9 = MEMORY[0x24BDAC7A8](v7);
  v31 = (char *)&v29 - v10;
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v29 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v29 - v14;
  v16 = *MEMORY[0x24BDFF4F8];
  v32 = (void (*)(char *, uint64_t, uint64_t))v4[13];
  v32((char *)&v29 - v14, v16, v2);
  sub_21EC66630((unint64_t *)&unk_255481D60, v3, MEMORY[0x24BDFF540]);
  sub_21EC7D0D0();
  sub_21EC7D0D0();
  if (v36 == v34 && v37 == v35)
    v17 = 1;
  else
    v17 = sub_21EC7D2EC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v18 = (void (*)(char *, uint64_t))v4[1];
  v18(v15, v2);
  v19 = (void (*)(char *, uint64_t, uint64_t))v4[2];
  v19(v13, a1, v2);
  if ((v17 & 1) != 0)
    goto LABEL_9;
  v20 = v31;
  v32(v31, *MEMORY[0x24BDFF500], v2);
  sub_21EC7D0D0();
  sub_21EC7D0D0();
  if (v36 == v34 && v37 == v35)
  {
    swift_bridgeObjectRelease_n();
    v18(v20, v2);
LABEL_9:
    v18(v13, v2);
    v21 = v33;
    v19(v33, a1, v2);
LABEL_10:
    v22 = 1;
    goto LABEL_11;
  }
  v27 = sub_21EC7D2EC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v18(v20, v2);
  v18(v13, v2);
  v21 = v33;
  v19(v33, a1, v2);
  if ((v27 & 1) != 0)
    goto LABEL_10;
  v28 = v30;
  v32(v30, *MEMORY[0x24BDFF508], v2);
  sub_21EC7D0D0();
  sub_21EC7D0D0();
  if (v36 == v34 && v37 == v35)
    v22 = 1;
  else
    v22 = sub_21EC7D2EC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v18(v28, v2);
LABEL_11:
  v18(v21, v2);
  v23 = sub_21EC63D24();
  v25 = v24;
  ObjectType = swift_getObjectType();
  sub_21EC69194(v22 & 1, ObjectType, v25);

}

uint64_t sub_21EC657A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  id v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD aBlock[6];

  v9 = sub_21EC7D01C();
  v23 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_21EC7D040();
  v21 = *(_QWORD *)(v12 - 8);
  v22 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21EC66B28(0, (unint64_t *)&qword_255481B40);
  v15 = (void *)sub_21EC7D178();
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = v4;
  v16[3] = a1;
  v16[4] = a2;
  v16[5] = a3;
  v16[6] = a4;
  aBlock[4] = sub_21EC66608;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21EC65AAC;
  aBlock[3] = &block_descriptor;
  v17 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  v18 = v4;
  swift_bridgeObjectRetain();
  swift_release();
  sub_21EC7D028();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_21EC66630((unint64_t *)&qword_255481CD0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2554816C0);
  sub_21EC66670();
  sub_21EC7D1D8();
  MEMORY[0x2207BA220](0, v14, v11, v17);
  _Block_release(v17);

  (*(void (**)(char *, uint64_t))(v23 + 8))(v11, v9);
  return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v14, v22);
}

void sub_21EC659C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id *v9;
  id v10;
  id v11;
  id v12;
  void *v13;

  v9 = (id *)(a1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_statusLabel);
  swift_beginAccess();
  objc_msgSend(*v9, sel_setHidden_, 0);
  v10 = *v9;
  v11 = sub_21EC6693C(a2, a3, a4, a5);
  objc_msgSend(v10, sel_setAttributedText_, v11);

  v12 = *v9;
  v13 = (void *)sub_21EC7D094();
  objc_msgSend(v12, sel_setAccessibilityLabel_, v13);

}

uint64_t sub_21EC65AAC(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_21EC65AD8(void *a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  char *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  CGRect v28;

  v2 = v1;
  v4 = sub_21EC7D004();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_cardBackgroundView;
  objc_msgSend(a1, sel_translationInView_, *(_QWORD *)&v2[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_cardBackgroundView]);
  v10 = v9;
  objc_msgSend(*(id *)&v2[v8], sel_bounds);
  v11 = v10 / CGRectGetHeight(v28);
  sub_21EC7CD94();
  v12 = sub_21EC7CFF8();
  v13 = sub_21EC7D130();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc();
    v25 = a1;
    v15 = v14;
    v16 = swift_slowAlloc();
    v27 = v16;
    *(_DWORD *)v15 = 136315394;
    v26 = sub_21EC68898(0xD000000000000017, 0x800000021EC7E810, &v27);
    sub_21EC7D1B4();
    *(_WORD *)(v15 + 12) = 2048;
    v26 = *(_QWORD *)&v11;
    sub_21EC7D1B4();
    _os_log_impl(&dword_21EC60000, v12, v13, "[TWICE] %s - %f", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2207BA9A0](v16, -1, -1);
    v17 = v15;
    a1 = v25;
    MEMORY[0x2207BA9A0](v17, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v18 = *(_QWORD *)&v2[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_pullToDismissManager];
  switch((unint64_t)objc_msgSend(a1, sel_state))
  {
    case 1uLL:
      *(_BYTE *)(v18 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI36AXTwiceCompanionPullToDismissManager_isInteractive) = 1;
      v19 = objc_allocWithZone(MEMORY[0x24BEBD7F0]);
      v20 = v2;
      v21 = objc_msgSend(v19, sel_init);
      v22 = *(void **)(v18
                     + OBJC_IVAR____TtC21AXWatchRemoteScreenUI36AXTwiceCompanionPullToDismissManager_percentDrivenInteractive);
      *(_QWORD *)(v18
                + OBJC_IVAR____TtC21AXWatchRemoteScreenUI36AXTwiceCompanionPullToDismissManager_percentDrivenInteractive) = v21;

      sub_21EC65E54();
      break;
    case 2uLL:
      objc_msgSend(*(id *)(v18+ OBJC_IVAR____TtC21AXWatchRemoteScreenUI36AXTwiceCompanionPullToDismissManager_percentDrivenInteractive), sel_updateInteractiveTransition_, v11);
      break;
    case 3uLL:
      *(_BYTE *)(v18 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI36AXTwiceCompanionPullToDismissManager_isInteractive) = 0;
      v23 = *(void **)(v18
                     + OBJC_IVAR____TtC21AXWatchRemoteScreenUI36AXTwiceCompanionPullToDismissManager_percentDrivenInteractive);
      if (v11 <= 0.3)
        goto LABEL_9;
      objc_msgSend(v23, sel_finishInteractiveTransition);
      break;
    case 4uLL:
      *(_BYTE *)(v18 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI36AXTwiceCompanionPullToDismissManager_isInteractive) = 0;
      v23 = *(void **)(v18
                     + OBJC_IVAR____TtC21AXWatchRemoteScreenUI36AXTwiceCompanionPullToDismissManager_percentDrivenInteractive);
LABEL_9:
      objc_msgSend(v23, sel_cancelInteractiveTransition);
      break;
    default:
      return;
  }
}

id sub_21EC65E54()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;

  v1 = v0;
  v2 = sub_21EC7D004();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21EC7CD94();
  v6 = sub_21EC7CFF8();
  v7 = sub_21EC7D130();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v12 = v9;
    *(_DWORD *)v8 = 136315138;
    v11 = sub_21EC68898(0xD000000000000015, 0x800000021EC7E7F0, &v12);
    sub_21EC7D1B4();
    _os_log_impl(&dword_21EC60000, v6, v7, "[TWICE] %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207BA9A0](v9, -1, -1);
    MEMORY[0x2207BA9A0](v8, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return objc_msgSend(v1, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

void sub_21EC65FF8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  char *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;

  v0 = sub_21EC7D004();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21EC7CD94();
  v4 = sub_21EC7CFF8();
  v5 = sub_21EC7D148();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = swift_slowAlloc();
    v15 = v7;
    *(_DWORD *)v6 = 136315138;
    v14 = sub_21EC68898(0xD000000000000020, 0x800000021EC7E7C0, &v15);
    sub_21EC7D1B4();
    _os_log_impl(&dword_21EC60000, v4, v5, "[TWICE] %s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207BA9A0](v7, -1, -1);
    MEMORY[0x2207BA9A0](v6, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v8 = sub_21EC63D24();
  v10 = v9;
  ObjectType = swift_getObjectType();
  v12 = (char *)(*(uint64_t (**)(uint64_t, uint64_t))(v10 + 152))(ObjectType, v10);

  if (v12)
  {
    v13 = (void *)MEMORY[0x2207BA9E8](&v12[OBJC_IVAR____TtC21AXWatchRemoteScreenUI28AXTwiceCompanionRendererView_delegate]);

    if (v13)
    {
      objc_msgSend(v13, sel_pullToDismissViewController);
      swift_unknownObjectRelease();
    }
  }
}

id AXTwiceCompanionMainViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;
  id v7;

  v4 = v3;
  if (a2)
  {
    v6 = (void *)sub_21EC7D094();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

id AXTwiceCompanionMainViewController.init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  objc_super v17;

  v6 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_titleLabel;
  v7 = v3;
  sub_21EC63480();
  *(_QWORD *)&v3[v6] = v8;
  v9 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_dismissButton;
  *(_QWORD *)&v7[v9] = sub_21EC637B0();
  *(_QWORD *)&v7[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController____lazy_storage___watchDeviceView] = 0;
  v10 = &v7[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController____lazy_storage___deviceView];
  *(_QWORD *)v10 = 0;
  *((_QWORD *)v10 + 1) = 0;
  v11 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_statusLabel;
  *(_QWORD *)&v7[v11] = sub_21EC63E00();
  v12 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_pullToDismissManager;
  *(_QWORD *)&v7[v12] = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for AXTwiceCompanionPullToDismissManager()), sel_init);
  v13 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_cardBackgroundView;
  *(_QWORD *)&v7[v13] = sub_21EC6413C();

  if (a2)
  {
    v14 = (void *)sub_21EC7D094();
    swift_bridgeObjectRelease();
  }
  else
  {
    v14 = 0;
  }
  v17.receiver = v7;
  v17.super_class = (Class)type metadata accessor for AXTwiceCompanionMainViewController();
  v15 = objc_msgSendSuper2(&v17, sel_initWithNibName_bundle_, v14, a3);

  return v15;
}

id AXTwiceCompanionMainViewController.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id AXTwiceCompanionMainViewController.init(coder:)(void *a1)
{
  char *v1;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  objc_super v13;

  v3 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_titleLabel;
  v4 = v1;
  sub_21EC63480();
  *(_QWORD *)&v1[v3] = v5;
  v6 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_dismissButton;
  *(_QWORD *)&v4[v6] = sub_21EC637B0();
  *(_QWORD *)&v4[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController____lazy_storage___watchDeviceView] = 0;
  v7 = &v4[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController____lazy_storage___deviceView];
  *(_QWORD *)v7 = 0;
  *((_QWORD *)v7 + 1) = 0;
  v8 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_statusLabel;
  *(_QWORD *)&v4[v8] = sub_21EC63E00();
  v9 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_pullToDismissManager;
  *(_QWORD *)&v4[v9] = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for AXTwiceCompanionPullToDismissManager()), sel_init);
  v10 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_cardBackgroundView;
  *(_QWORD *)&v4[v10] = sub_21EC6413C();

  v13.receiver = v4;
  v13.super_class = (Class)type metadata accessor for AXTwiceCompanionMainViewController();
  v11 = objc_msgSendSuper2(&v13, sel_initWithCoder_, a1);

  return v11;
}

id AXTwiceCompanionMainViewController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AXTwiceCompanionMainViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_21EC665D4()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_21EC66608()
{
  uint64_t *v0;

  sub_21EC659C0(v0[2], v0[3], v0[4], v0[5], v0[6]);
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_21EC66630(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2207BA940](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_21EC66670()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255481CE0;
  if (!qword_255481CE0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2554816C0);
    result = MEMORY[0x2207BA940](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_255481CE0);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2207BA934](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t method lookup function for AXTwiceCompanionMainViewController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AXTwiceCompanionMainViewController.titleLabel.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of AXTwiceCompanionMainViewController.titleLabel.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of AXTwiceCompanionMainViewController.titleLabel.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of AXTwiceCompanionMainViewController.dismissButton.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of AXTwiceCompanionMainViewController.dismissButton.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of AXTwiceCompanionMainViewController.dismissButton.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of AXTwiceCompanionMainViewController.watchDeviceView.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of AXTwiceCompanionMainViewController.watchDeviceView.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of AXTwiceCompanionMainViewController.watchDeviceView.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of AXTwiceCompanionMainViewController.deviceView.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of AXTwiceCompanionMainViewController.deviceView.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of AXTwiceCompanionMainViewController.deviceView.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of AXTwiceCompanionMainViewController.statusLabel.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of AXTwiceCompanionMainViewController.statusLabel.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of AXTwiceCompanionMainViewController.statusLabel.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of AXTwiceCompanionMainViewController.updateStatus(state:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of AXTwiceCompanionMainViewController.updateStatusLabel(errorStr:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of AXTwiceCompanionMainViewController.updateSpinner(state:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of AXTwiceCompanionMainViewController.updateStatusLabel(text:systemImageName:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x138))();
}

_DWORD *sub_21EC66920@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(_BYTE *)(a2 + 4) = 0;
  return result;
}

void sub_21EC66930(_DWORD *a1@<X8>)
{
  _DWORD *v1;

  *a1 = *v1;
}

id sub_21EC6693C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;

  if (a4
    && (swift_bridgeObjectRetain(),
        v4 = (void *)sub_21EC7D094(),
        swift_bridgeObjectRelease(),
        v5 = objc_msgSend((id)objc_opt_self(), sel_systemImageNamed_, v4),
        v4,
        v5))
  {
    v6 = objc_allocWithZone(MEMORY[0x24BDD1458]);
    swift_bridgeObjectRetain();
    v7 = (void *)sub_21EC7D094();
    swift_bridgeObjectRelease();
    v8 = objc_msgSend(v6, sel_initWithString_, v7);

    v9 = objc_allocWithZone(MEMORY[0x24BDD1458]);
    v10 = (void *)sub_21EC7D094();
    v11 = objc_msgSend(v9, sel_initWithString_, v10);

    v12 = objc_msgSend((id)objc_opt_self(), sel_textAttachmentWithImage_, v5);
    sub_21EC66B28(0, &qword_2554816F8);
    v13 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_attributedStringWithAttachment_, v12);
    objc_msgSend(v13, sel_appendAttributedString_, v11);
    objc_msgSend(v13, sel_appendAttributedString_, v8);

  }
  else
  {
    v14 = objc_allocWithZone(MEMORY[0x24BDD1458]);
    swift_bridgeObjectRetain();
    v5 = (id)sub_21EC7D094();
    swift_bridgeObjectRelease();
    v13 = objc_msgSend(v14, sel_initWithString_, v5);
  }

  return v13;
}

uint64_t sub_21EC66B28(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for AXTwiceHIDEvent(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_21EC66BA0(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_21EC66BC0(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 32) = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
  sub_21EC66C90(a1, &qword_255481700);
}

void type metadata accessor for AXHandEventType(uint64_t a1)
{
  sub_21EC66C90(a1, &qword_255481708);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_21EC66C90(a1, &qword_255481710);
}

uint64_t sub_21EC66C34(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_21EC66C54(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
  sub_21EC66C90(a1, &qword_255481718);
}

void sub_21EC66C90(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

void sub_21EC66CF0(void *a1)
{
  void *v1;
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  void *v18;
  CGFloat *v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  uint64_t aBlock;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  CGFloat *v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  v3 = objc_msgSend(a1, sel_viewControllerForKey_, *MEMORY[0x24BEBE9B0]);
  if (v3)
  {
    v26 = v3;
    v4 = objc_msgSend(a1, sel_viewControllerForKey_, *MEMORY[0x24BEBE9A0]);
    if (!v4)
    {

      return;
    }
    v5 = v4;
    v6 = objc_msgSend(a1, sel_containerView);
    v7 = objc_msgSend(v5, sel_view);
    if (v7)
    {
      v8 = v7;
      v9 = objc_msgSend(v26, sel_view);
      if (v9)
      {
        v10 = v9;
        objc_msgSend(v6, sel_insertSubview_belowSubview_, v8, v9);

        objc_msgSend(v6, sel_bounds);
        x = v33.origin.x;
        y = v33.origin.y;
        width = v33.size.width;
        height = v33.size.height;
        v15 = CGRectGetHeight(v33);
        v34.origin.x = x;
        v34.origin.y = y;
        v34.size.width = width;
        v34.size.height = height;
        v16 = CGRectGetWidth(v34);
        v35.origin.x = x;
        v35.origin.y = y;
        v35.size.width = width;
        v35.size.height = height;
        v17 = CGRectGetHeight(v35);
        v18 = (void *)objc_opt_self();
        v19 = (CGFloat *)swift_allocObject();
        *((_QWORD *)v19 + 2) = v5;
        v19[3] = 0.0;
        v19[4] = v15;
        v19[5] = v16;
        v19[6] = v17;
        v31 = sub_21EC676EC;
        v32 = v19;
        v20 = MEMORY[0x24BDAC760];
        aBlock = MEMORY[0x24BDAC760];
        v28 = 1107296256;
        v29 = sub_21EC65AAC;
        v30 = &block_descriptor_0;
        v21 = _Block_copy(&aBlock);
        v22 = v5;
        swift_release();
        v23 = swift_allocObject();
        *(_QWORD *)(v23 + 16) = a1;
        *(_QWORD *)(v23 + 24) = v1;
        v31 = sub_21EC67740;
        v32 = (CGFloat *)v23;
        aBlock = v20;
        v28 = 1107296256;
        v29 = sub_21EC670D8;
        v30 = &block_descriptor_8;
        v24 = _Block_copy(&aBlock);
        swift_unknownObjectRetain();
        v25 = v1;
        swift_release();
        objc_msgSend(v18, sel_animateWithDuration_animations_completion_, v21, v24, 0.3);
        _Block_release(v24);
        _Block_release(v21);

        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
}

void sub_21EC66FC8(void *a1, double a2, double a3, double a4, double a5)
{
  id v9;
  id v10;

  v9 = objc_msgSend(a1, sel_view);
  if (v9)
  {
    v10 = v9;
    objc_msgSend(v9, sel_setFrame_, a2, a3, a4, a5);

  }
  else
  {
    __break(1u);
  }
}

id sub_21EC67040(int a1, id a2, uint64_t a3)
{
  unsigned int v5;
  void *v6;
  id v7;

  v5 = objc_msgSend(a2, sel_transitionWasCancelled);
  if ((v5 & 1) == 0)
  {
    v6 = *(void **)(a3
                  + OBJC_IVAR____TtC21AXWatchRemoteScreenUI47AXTwiceCompanionPullToDismissAnimatedController_dismissedVC);
    if (v6)
    {
      type metadata accessor for AXTwiceCompanionMainViewController();
      if (swift_dynamicCastClass())
      {
        v7 = v6;
        sub_21EC65FF8();

      }
    }
  }
  return objc_msgSend(a2, sel_completeTransition_, v5 ^ 1);
}

uint64_t sub_21EC670D8(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

id sub_21EC67194()
{
  return sub_21EC672CC(type metadata accessor for AXTwiceCompanionPullToDismissAnimatedController);
}

uint64_t type metadata accessor for AXTwiceCompanionPullToDismissAnimatedController()
{
  return objc_opt_self();
}

id sub_21EC672C0()
{
  return sub_21EC672CC(type metadata accessor for AXTwiceCompanionPullToDismissManager);
}

id sub_21EC672CC(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for AXTwiceCompanionPullToDismissManager()
{
  return objc_opt_self();
}

char *sub_21EC6732C(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  objc_class *v10;
  char *v11;
  id v12;
  char *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  objc_super v18;

  v2 = sub_21EC7D004();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21EC7CD94();
  v6 = sub_21EC7CFF8();
  v7 = sub_21EC7D148();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v17 = v9;
    *(_DWORD *)v8 = 136315138;
    v16 = sub_21EC68898(0xD000000000000022, 0x800000021EC7EA60, &v17);
    sub_21EC7D1B4();
    _os_log_impl(&dword_21EC60000, v6, v7, "[TWICE] %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207BA9A0](v9, -1, -1);
    MEMORY[0x2207BA9A0](v8, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v10 = (objc_class *)type metadata accessor for AXTwiceCompanionPullToDismissAnimatedController();
  v11 = (char *)objc_allocWithZone(v10);
  *(_QWORD *)&v11[OBJC_IVAR____TtC21AXWatchRemoteScreenUI47AXTwiceCompanionPullToDismissAnimatedController_dismissedVC] = 0;
  v18.receiver = v11;
  v18.super_class = v10;
  v12 = a1;
  v13 = (char *)objc_msgSendSuper2(&v18, sel_init);
  v14 = *(void **)&v13[OBJC_IVAR____TtC21AXWatchRemoteScreenUI47AXTwiceCompanionPullToDismissAnimatedController_dismissedVC];
  *(_QWORD *)&v13[OBJC_IVAR____TtC21AXWatchRemoteScreenUI47AXTwiceCompanionPullToDismissAnimatedController_dismissedVC] = v12;

  return v13;
}

void *sub_21EC67508()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v13;
  uint64_t v14;

  v1 = v0;
  v2 = sub_21EC7D004();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21EC7CD94();
  v6 = sub_21EC7CFF8();
  v7 = sub_21EC7D148();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v14 = v9;
    *(_DWORD *)v8 = 136315138;
    v13 = sub_21EC68898(0xD000000000000029, 0x800000021EC7EA30, &v14);
    sub_21EC7D1B4();
    _os_log_impl(&dword_21EC60000, v6, v7, "[TWICE] %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207BA9A0](v9, -1, -1);
    MEMORY[0x2207BA9A0](v8, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI36AXTwiceCompanionPullToDismissManager_isInteractive) != 1)
    return 0;
  v10 = *(void **)(v1
                 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI36AXTwiceCompanionPullToDismissManager_percentDrivenInteractive);
  if (v10)
    v11 = v10;
  return v10;
}

uint64_t sub_21EC676C8()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_21EC676EC()
{
  uint64_t v0;

  sub_21EC66FC8(*(void **)(v0 + 16), *(double *)(v0 + 24), *(double *)(v0 + 32), *(double *)(v0 + 40), *(double *)(v0 + 48));
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_21EC67714()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

id sub_21EC67740(int a1)
{
  uint64_t v1;

  return sub_21EC67040(a1, *(id *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

id sub_21EC67750()
{
  char *v0;
  void *v1;
  void *v2;
  id v3;
  objc_super v5;

  v5.receiver = v0;
  v5.super_class = (Class)type metadata accessor for AXTwiceCompanionRendererView();
  objc_msgSendSuper2(&v5, sel_layoutSubviews);
  v1 = (void *)objc_opt_self();
  objc_msgSend(v1, sel_begin);
  objc_msgSend(v1, sel_setDisableActions_, 1);
  v2 = *(void **)&v0[OBJC_IVAR____TtC21AXWatchRemoteScreenUI28AXTwiceCompanionRendererView_mirroringLayer];
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v0, sel_bounds);
    objc_msgSend(v3, sel_setFrame_);

  }
  return objc_msgSend(v1, sel_commit);
}

uint64_t type metadata accessor for AXTwiceCompanionRendererView()
{
  return objc_opt_self();
}

void sub_21EC67860(void *a1)
{
  char *v1;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  CGRect v18;

  v3 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI28AXTwiceCompanionRendererView_mirroringLayer;
  objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI28AXTwiceCompanionRendererView_mirroringLayer], sel_removeFromSuperlayer);
  v4 = *(void **)&v1[v3];
  *(_QWORD *)&v1[v3] = a1;
  v5 = a1;

  v6 = *(void **)&v1[v3];
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v1, sel_bounds);
    objc_msgSend(v7, sel_setFrame_);

    v8 = *(void **)&v1[v3];
    if (v8)
    {
      objc_msgSend(v8, sel_setContentsGravity_, *MEMORY[0x24BDE5C78]);
      v9 = *(void **)&v1[v3];
      if (v9)
      {
        objc_msgSend(v9, sel_setNeedsDisplayOnBoundsChange_, 0);
        v10 = *(void **)&v1[v3];
        if (v10)
        {
          v11 = *(double *)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI28AXTwiceCompanionRendererView_cornerRadiusRatio];
          v12 = v10;
          objc_msgSend(v1, sel_frame);
          objc_msgSend(v12, sel_setCornerRadius_, v11 * CGRectGetWidth(v18));

          v13 = *(void **)&v1[v3];
          if (v13)
          {
            objc_msgSend(v13, sel_setCornerCurve_, *MEMORY[0x24BDE58E8]);
            v14 = *(void **)&v1[v3];
            if (v14)
            {
              objc_msgSend(v14, sel_setMasksToBounds_, 1);
              v15 = *(void **)&v1[v3];
              if (v15)
              {
                v17 = v15;
                v16 = objc_msgSend(v1, sel_layer);
                objc_msgSend(v16, sel_insertSublayer_atIndex_, v17, 0);

                objc_msgSend(v1, sel_layoutSubviews);
              }
            }
          }
        }
      }
    }
  }
}

void sub_21EC67A18(unint64_t a1, char a2, double a3, double a4)
{
  void *v4;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  CGAffineTransform v27;
  CGAffineTransform v28;

  objc_msgSend(v4, sel_bounds);
  v10 = v9;
  objc_msgSend(v4, sel_bounds);
  objc_msgSend(v4, sel_convertPoint_toView_, 0, v10);
  v12 = v11;
  v14 = v13;
  objc_msgSend(v4, sel_frame);
  v16 = v15 / a3;
  objc_msgSend(v4, sel_frame);
  v18 = v17 / a4;
  CGAffineTransformMakeTranslation(&v28, v12, v14);
  CGAffineTransformMakeScale(&v27, v16, v18);
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v19 = sub_21EC7D298();
    if (!v19)
      goto LABEL_10;
  }
  else
  {
    v19 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v19)
      goto LABEL_10;
  }
  if (v19 < 1)
  {
    __break(1u);
    goto LABEL_15;
  }
  v20 = 0;
  v21 = a2 & 1;
  do
  {
    if ((a1 & 0xC000000000000001) != 0)
      v22 = (id)MEMORY[0x2207BA2BC](v20, a1);
    else
      v22 = *(id *)(a1 + 8 * v20 + 32);
    v23 = v22;
    ++v20;
    v26 = v22;
    sub_21EC67C9C(&v26, v4, v21, &v27.a, &v28.a, a3, a4, a3 * 0.5, a4 * 0.5);

  }
  while (v19 != v20);
LABEL_10:
  swift_bridgeObjectRelease();
  sub_21EC67F8C(a1);
  v24 = (void *)sub_21EC7D0E8();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, sel_setAccessibilityElements_, v24);

  if (!_AXSCommandAndControlEnabled())
  {
    UIAccessibilityPostNotification(*MEMORY[0x24BEBDE88], v4);
    return;
  }
  if (*MEMORY[0x24BDFEEB0])
  {
    v25 = (id)*MEMORY[0x24BDFEEB0];
    UIAccessibilityPostNotification(*MEMORY[0x24BEBDE88], (id)*MEMORY[0x24BDFEEB0]);

    return;
  }
LABEL_15:
  __break(1u);
}

void sub_21EC67C9C(id *a1, void *a2, char a3, CGFloat *a4, CGFloat *a5, double a6, double a7, CGFloat a8, CGFloat a9)
{
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  int v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  __int128 v30;
  CGFloat tx;
  CGFloat ty;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  void *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGAffineTransform v52;
  CGAffineTransform v53;
  CGFloat v54;

  v54 = *a5;
  v50 = a5[2];
  v51 = a5[1];
  v48 = a5[4];
  v49 = a5[3];
  v46 = *a4;
  v47 = a5[5];
  v44 = a4[2];
  v45 = a4[1];
  v42 = a4[4];
  v43 = a4[3];
  v41 = a4[5];
  v15 = *a1;
  objc_msgSend(*a1, sel_accessibilityFrame);
  v19 = v18;
  v21 = v20;
  v22 = a6 - v16 - v18;
  v23 = a7 - v17 - v20;
  v24 = a3 & 1;
  if (v24)
    v25 = v17;
  else
    v25 = v23;
  if (v24)
    v26 = v16;
  else
    v26 = v22;
  objc_msgSend(a2, sel_frame);
  v28 = v27 / a6;
  objc_msgSend(a2, sel_frame);
  objc_msgSend(v15, sel_setAccessibilityFrameInContainerSpace_, v26 * v28, v25 * (v29 / a7), v19 * v28, v21 * (v29 / a7));
  if (!v24)
  {
    v30 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)&v53.a = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)&v53.c = v30;
    *(_OWORD *)&v53.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    CGAffineTransformTranslate(&v52, &v53, a8, a9);
    v53 = v52;
    CGAffineTransformRotate(&v52, &v53, 3.14159265);
    v53 = v52;
    CGAffineTransformTranslate(&v52, &v53, -a8, -a9);
    v39 = *(_OWORD *)&v52.c;
    v40 = *(_OWORD *)&v52.a;
    tx = v52.tx;
    ty = v52.ty;
    v33 = objc_msgSend(v15, sel_accessibilityPath);
    *(_OWORD *)&v53.a = v40;
    *(_OWORD *)&v53.c = v39;
    v53.tx = tx;
    v53.ty = ty;
    objc_msgSend(v33, sel_applyTransform_, &v53);

  }
  v34 = objc_msgSend(v15, sel_accessibilityPath);
  v53.a = v46;
  v53.b = v45;
  v53.c = v44;
  v53.d = v43;
  v53.tx = v42;
  v53.ty = v41;
  objc_msgSend(v34, sel_applyTransform_, &v53);

  v35 = objc_msgSend(v15, sel_accessibilityPath);
  v53.a = v54;
  v53.b = v51;
  v53.c = v50;
  v53.d = v49;
  v53.tx = v48;
  v53.ty = v47;
  objc_msgSend(v35, sel_applyTransform_, &v53);

  objc_opt_self();
  v36 = swift_dynamicCastObjCClass();
  if (v36)
  {
    v37 = (void *)v36;
    v38 = v15;
    objc_msgSend(v37, sel_setAxActionHandler_, a2);
    objc_msgSend(v37, sel_overrideAccessibilityMethodsForRemoteDevice);

  }
}

uint64_t sub_21EC67F8C(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t i;
  unint64_t v6;
  unint64_t v7;
  id *v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  _OWORD v12[2];
  uint64_t v13;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v2 = sub_21EC7D298();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v3 = MEMORY[0x24BEE4AF8];
  if (!v2)
    return v3;
  v13 = MEMORY[0x24BEE4AF8];
  result = sub_21EC68FC0(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v2; ++i)
      {
        MEMORY[0x2207BA2BC](i, a1);
        sub_21EC68FDC();
        swift_dynamicCast();
        v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_21EC68FC0(0, *(_QWORD *)(v3 + 16) + 1, 1);
          v3 = v13;
        }
        v7 = *(_QWORD *)(v3 + 16);
        v6 = *(_QWORD *)(v3 + 24);
        if (v7 >= v6 >> 1)
        {
          sub_21EC68FC0(v6 > 1, v7 + 1, 1);
          v3 = v13;
        }
        *(_QWORD *)(v3 + 16) = v7 + 1;
        sub_21EC69018(v12, (_OWORD *)(v3 + 32 * v7 + 32));
      }
    }
    else
    {
      v8 = (id *)(a1 + 32);
      sub_21EC68FDC();
      do
      {
        v9 = *v8;
        swift_dynamicCast();
        v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_21EC68FC0(0, *(_QWORD *)(v3 + 16) + 1, 1);
          v3 = v13;
        }
        v11 = *(_QWORD *)(v3 + 16);
        v10 = *(_QWORD *)(v3 + 24);
        if (v11 >= v10 >> 1)
        {
          sub_21EC68FC0(v10 > 1, v11 + 1, 1);
          v3 = v13;
        }
        *(_QWORD *)(v3 + 16) = v11 + 1;
        sub_21EC69018(v12, (_OWORD *)(v3 + 32 * v11 + 32));
        ++v8;
        --v2;
      }
      while (v2);
    }
    return v3;
  }
  __break(1u);
  return result;
}

id AXTwiceCompanionRendererView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

id AXTwiceCompanionRendererView.init(frame:)(double a1, double a2, double a3, double a4)
{
  char *v4;
  char *v9;
  void *v10;
  char v11;
  double v12;
  objc_super v14;

  *(_QWORD *)&v4[OBJC_IVAR____TtC21AXWatchRemoteScreenUI28AXTwiceCompanionRendererView_mirroringLayer] = 0;
  swift_unknownObjectWeakInit();
  sub_21EC7CF98();
  v9 = v4;
  v10 = (void *)sub_21EC7CF38();
  v11 = MEMORY[0x2207BA028]();

  v12 = 0.23;
  if ((v11 & 1) != 0)
    v12 = 0.29;
  *(double *)&v9[OBJC_IVAR____TtC21AXWatchRemoteScreenUI28AXTwiceCompanionRendererView_cornerRadiusRatio] = v12;

  v14.receiver = v9;
  v14.super_class = (Class)type metadata accessor for AXTwiceCompanionRendererView();
  return objc_msgSendSuper2(&v14, sel_initWithFrame_, a1, a2, a3, a4);
}

id AXTwiceCompanionRendererView.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id AXTwiceCompanionRendererView.init(coder:)(void *a1)
{
  char *v1;
  char *v3;
  void *v4;
  char v5;
  double v6;
  id v7;
  objc_super v9;

  *(_QWORD *)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI28AXTwiceCompanionRendererView_mirroringLayer] = 0;
  swift_unknownObjectWeakInit();
  sub_21EC7CF98();
  v3 = v1;
  v4 = (void *)sub_21EC7CF38();
  v5 = MEMORY[0x2207BA028]();

  v6 = 0.23;
  if ((v5 & 1) != 0)
    v6 = 0.29;
  *(double *)&v3[OBJC_IVAR____TtC21AXWatchRemoteScreenUI28AXTwiceCompanionRendererView_cornerRadiusRatio] = v6;

  v9.receiver = v3;
  v9.super_class = (Class)type metadata accessor for AXTwiceCompanionRendererView();
  v7 = objc_msgSendSuper2(&v9, sel_initWithCoder_, a1);

  return v7;
}

id AXTwiceCompanionRendererView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AXTwiceCompanionRendererView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

BOOL AXTwiceCompanionRendererView.perform(_:withValue:on:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32[3];
  uint64_t v33;

  v4 = v3;
  v8 = sub_21EC7D004();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21EC7CD94();
  v12 = sub_21EC7CFF8();
  v13 = sub_21EC7D148();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc();
    v30 = a3;
    v15 = v14;
    v16 = swift_slowAlloc();
    v32[0] = v16;
    *(_DWORD *)v15 = 136315394;
    v29 = v8;
    v31 = sub_21EC68898(0xD000000000000018, 0x800000021EC7EAF0, v32);
    v28 = v9;
    sub_21EC7D1B4();
    *(_WORD *)(v15 + 12) = 1024;
    LODWORD(v31) = a1;
    sub_21EC7D1B4();
    _os_log_impl(&dword_21EC60000, v12, v13, "[TWICE] %s %u", (uint8_t *)v15, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x2207BA9A0](v16, -1, -1);
    v17 = v15;
    a3 = v30;
    MEMORY[0x2207BA9A0](v17, -1, -1);

    (*(void (**)(char *, uint64_t))(v28 + 8))(v11, v29);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  v18 = (void *)MEMORY[0x2207BA9E8](v4 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI28AXTwiceCompanionRendererView_delegate);
  if (v18)
  {
    sub_21EC68774(a2, (uint64_t)v32);
    v19 = v33;
    if (v33)
    {
      v20 = __swift_project_boxed_opaque_existential_0(v32, v33);
      v21 = *(_QWORD *)(v19 - 8);
      MEMORY[0x24BDAC7A8](v20);
      v23 = a1;
      v24 = (char *)&v28 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v21 + 16))(v24);
      v25 = sub_21EC7D2E0();
      v26 = v24;
      a1 = v23;
      (*(void (**)(char *, uint64_t))(v21 + 8))(v26, v19);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v32);
    }
    else
    {
      v25 = 0;
    }
    objc_msgSend(v18, sel_axActionPerformWithAction_value_bridgeElement_, a1, v25, a3);
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
  return v18 != 0;
}

uint64_t sub_21EC68774(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255481BB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_QWORD *__swift_project_boxed_opaque_existential_0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_21EC68898(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_21EC68A10(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_21EC68BC8((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_21EC68BC8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t method lookup function for AXTwiceCompanionRendererView()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AXTwiceCompanionRendererView.addMirrorLayer(newLayer:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of AXTwiceCompanionRendererView.addUIAccessibilityElements(_:rootViewSize:isCrownOnRightSide:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA0))();
}

uint64_t sub_21EC689AC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255481BB0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21EC689EC(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t sub_21EC68A10(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_21EC7D1C0();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_21EC68C04(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_21EC7D22C();
  if (!v8)
  {
    sub_21EC7D280();
    __break(1u);
LABEL_17:
    result = sub_21EC7D2C8();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_21EC68BC8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_21EC68C04(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_21EC68C98(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_21EC68E70(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_21EC68E70(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_21EC68C98(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_21EC68E0C(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_21EC7D214();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_21EC7D280();
      __break(1u);
LABEL_10:
      v2 = sub_21EC7D0C4();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_21EC7D2C8();
    __break(1u);
LABEL_14:
    result = sub_21EC7D280();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_21EC68E0C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2554819B8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_21EC68E70(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2554819B8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_21EC7D2C8();
  __break(1u);
  return result;
}

uint64_t sub_21EC68FC0(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_21EC69028(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

unint64_t sub_21EC68FDC()
{
  unint64_t result;

  result = qword_2554819C0;
  if (!qword_2554819C0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2554819C0);
  }
  return result;
}

_OWORD *sub_21EC69018(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_21EC69028(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2554819C8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8])
      memmove(v13, v14, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_21EC7D2C8();
  __break(1u);
  return result;
}

void sub_21EC69194(int a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD aBlock[6];

  v4 = v3;
  v8 = sub_21EC7D01C();
  v21 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_21EC7D040();
  v11 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a3 + 128))(a2, a3);
  v15 = objc_msgSend(v14, sel_isHidden);

  if (((v15 ^ a1) & 1) == 0)
  {
    sub_21EC695D4();
    v16 = (void *)sub_21EC7D178();
    v17 = swift_allocObject();
    *(_QWORD *)(v17 + 16) = a2;
    *(_QWORD *)(v17 + 24) = a3;
    *(_QWORD *)(v17 + 32) = v4;
    *(_BYTE *)(v17 + 40) = a1 & 1;
    aBlock[4] = sub_21EC69634;
    aBlock[5] = v17;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_21EC65AAC;
    aBlock[3] = &block_descriptor_1;
    v18 = _Block_copy(aBlock);
    v19 = v4;
    swift_release();
    sub_21EC7D028();
    aBlock[0] = MEMORY[0x24BEE4AF8];
    sub_21EC6965C();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2554816C0);
    sub_21EC66670();
    sub_21EC7D1D8();
    MEMORY[0x2207BA220](0, v13, v10, v18);
    _Block_release(v18);

    (*(void (**)(char *, uint64_t))(v21 + 8))(v10, v8);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v20);
  }
}

void sub_21EC693AC(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t (*v7)(uint64_t, uint64_t);
  void *v8;
  void *v9;
  char **v10;
  id v11;

  v7 = *(uint64_t (**)(uint64_t, uint64_t))(a4 + 128);
  v8 = (void *)v7(a3, a4);
  objc_msgSend(v8, sel_setHidden_, (a2 & 1) == 0);

  v9 = (void *)v7(a3, a4);
  v11 = v9;
  v10 = &selRef_startAnimating;
  if ((a2 & 1) == 0)
    v10 = &selRef_stopAnimating;
  objc_msgSend(v9, *v10);

}

Swift::Void __swiftcall AXTwiceCompanionDeviceView.addScreenSubLayer(layer:)(CALayer layer)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v6)(Class, uint64_t, uint64_t);
  objc_class *v7;
  uint64_t v8;
  id v9;

  v3 = v2;
  v4 = v1;
  v6 = *(void (**)(Class, uint64_t, uint64_t))(v2 + 184);
  v7 = layer.super.isa;
  v6(layer.super.isa, v4, v3);
  v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 152))(v4, v3);
  if (v8)
  {
    v9 = (id)v8;
    sub_21EC67860(v7);

  }
}

uint64_t dispatch thunk of AXTwiceCompanionDeviceView.leftPadding.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of AXTwiceCompanionDeviceView.leftPadding.setter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of AXTwiceCompanionDeviceView.leftPadding.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of AXTwiceCompanionDeviceView.leftConstraint.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of AXTwiceCompanionDeviceView.leftConstraint.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of AXTwiceCompanionDeviceView.leftConstraint.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of AXTwiceCompanionDeviceView.rightPadding.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of AXTwiceCompanionDeviceView.rightPadding.setter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of AXTwiceCompanionDeviceView.rightPadding.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t dispatch thunk of AXTwiceCompanionDeviceView.rightContraint.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t dispatch thunk of AXTwiceCompanionDeviceView.rightContraint.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 88))();
}

uint64_t dispatch thunk of AXTwiceCompanionDeviceView.rightContraint.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 96))();
}

uint64_t dispatch thunk of AXTwiceCompanionDeviceView.deviceChromeView.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 104))();
}

uint64_t dispatch thunk of AXTwiceCompanionDeviceView.deviceChromeView.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 112))();
}

uint64_t dispatch thunk of AXTwiceCompanionDeviceView.deviceChromeView.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 120))();
}

uint64_t dispatch thunk of AXTwiceCompanionDeviceView.deviceSpinner.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 128))();
}

uint64_t dispatch thunk of AXTwiceCompanionDeviceView.deviceSpinner.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 136))();
}

uint64_t dispatch thunk of AXTwiceCompanionDeviceView.deviceSpinner.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 144))();
}

uint64_t dispatch thunk of AXTwiceCompanionDeviceView.rendererView.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 152))();
}

uint64_t dispatch thunk of AXTwiceCompanionDeviceView.rendererView.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 160))();
}

uint64_t dispatch thunk of AXTwiceCompanionDeviceView.rendererView.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 168))();
}

uint64_t dispatch thunk of AXTwiceCompanionDeviceView.mirroringLayer.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 176))();
}

uint64_t dispatch thunk of AXTwiceCompanionDeviceView.mirroringLayer.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 184))();
}

uint64_t dispatch thunk of AXTwiceCompanionDeviceView.mirroringLayer.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 192))();
}

uint64_t dispatch thunk of AXTwiceCompanionDeviceView.makeViewAccessible(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 200))();
}

uint64_t dispatch thunk of AXTwiceCompanionDeviceView.normalizedScreenPoint(normalizedPoint:)(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 208))();
}

unint64_t sub_21EC695D4()
{
  unint64_t result;

  result = qword_255481B40;
  if (!qword_255481B40)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255481B40);
  }
  return result;
}

uint64_t sub_21EC69610()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_21EC69634()
{
  uint64_t v0;

  sub_21EC693AC(*(_QWORD *)(v0 + 32), *(_BYTE *)(v0 + 40), *(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

unint64_t sub_21EC6965C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255481CD0;
  if (!qword_255481CD0)
  {
    v1 = sub_21EC7D01C();
    result = MEMORY[0x2207BA940](MEMORY[0x24BEE5468], v1);
    atomic_store(result, (unint64_t *)&qword_255481CD0);
  }
  return result;
}

Swift::Void __swiftcall AXTwiceCompanionWatchView.updateNanoCrownOrientation(shouldDelayUpdatingView:)(Swift::Bool shouldDelayUpdatingView)
{
  double v1;

  v1 = 0.1;
  if (shouldDelayUpdatingView)
    v1 = 1.0;
  sub_21EC6E4E0(v1);
}

void sub_21EC696BC()
{
  char *v0;
  unint64_t v1;
  uint64_t v2;
  void *v3;
  double v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[6];

  v1 = (unint64_t)objc_msgSend(v0, sel_accessibilityTraits);
  if ((*MEMORY[0x24BEBDEF8] & ~v1) == 0)
  {
    v2 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI23AXTwiceWatchCrownButton_watchCrownDirectTouchTimer;
    if (!*(_QWORD *)&v0[OBJC_IVAR____TtC21AXWatchRemoteScreenUI23AXTwiceWatchCrownButton_watchCrownDirectTouchTimer])
    {
      v3 = (void *)objc_opt_self();
      v4 = *(double *)&v0[OBJC_IVAR____TtC21AXWatchRemoteScreenUI23AXTwiceWatchCrownButton_watchCrownDirectTouchInterval];
      v5 = swift_allocObject();
      swift_unknownObjectWeakInit();
      v9[4] = sub_21EC6E778;
      v9[5] = v5;
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 1107296256;
      v9[2] = sub_21EC698C4;
      v9[3] = &block_descriptor_2;
      v6 = _Block_copy(v9);
      swift_release();
      v7 = objc_msgSend(v3, sel_scheduledTimerWithTimeInterval_repeats_block_, 0, v6, v4);
      _Block_release(v6);
      v8 = *(void **)&v0[v2];
      *(_QWORD *)&v0[v2] = v7;

    }
  }
}

void sub_21EC697E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  char *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v2 = a2 + 16;
  swift_beginAccess();
  v3 = MEMORY[0x2207BA9E8](v2);
  if (v3)
  {
    v4 = (void *)v3;
    v5 = objc_retain(*(id *)(v3
                           + OBJC_IVAR____TtC21AXWatchRemoteScreenUI23AXTwiceWatchCrownButton_watchCrownDirectTouchTimer));

    objc_msgSend(v5, sel_invalidate);
  }
  swift_beginAccess();
  v6 = (char *)MEMORY[0x2207BA9E8](v2);
  if (v6)
  {
    v7 = *(void **)&v6[OBJC_IVAR____TtC21AXWatchRemoteScreenUI23AXTwiceWatchCrownButton_watchCrownDirectTouchTimer];
    *(_QWORD *)&v6[OBJC_IVAR____TtC21AXWatchRemoteScreenUI23AXTwiceWatchCrownButton_watchCrownDirectTouchTimer] = 0;

  }
  swift_beginAccess();
  v8 = MEMORY[0x2207BA9E8](v2);
  if (v8)
  {
    v9 = (void *)v8;
    sub_21EC69948();

  }
}

void sub_21EC698C4(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

void sub_21EC69948()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  UIAccessibilityNotifications v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v1 = v0;
  v2 = sub_21EC7D004();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21EC7CD94();
  v6 = sub_21EC7CFF8();
  v7 = sub_21EC7D148();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v13 = v9;
    *(_DWORD *)v8 = 136315138;
    v12 = sub_21EC68898(0xD00000000000001DLL, 0x800000021EC7F7B0, &v13);
    sub_21EC7D1B4();
    _os_log_impl(&dword_21EC60000, v6, v7, "[TWICE] %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207BA9A0](v9, -1, -1);
    MEMORY[0x2207BA9A0](v8, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  objc_msgSend(v1, sel_setAccessibilityTraits_, *MEMORY[0x24BEBDF00]);
  v10 = *MEMORY[0x24BEBDDB0];
  v11 = (void *)sub_21EC7D094();
  UIAccessibilityPostNotification(v10, v11);

}

id AXTwiceWatchCrownButton.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

id AXTwiceWatchCrownButton.init(frame:)(double a1, double a2, double a3, double a4)
{
  char *v4;
  objc_super v10;

  *(_QWORD *)&v4[OBJC_IVAR____TtC21AXWatchRemoteScreenUI23AXTwiceWatchCrownButton_watchCrownDirectTouchTimer] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC21AXWatchRemoteScreenUI23AXTwiceWatchCrownButton_watchCrownDirectTouchInterval] = 0x3FF0000000000000;
  v10.receiver = v4;
  v10.super_class = (Class)type metadata accessor for AXTwiceWatchCrownButton();
  return objc_msgSendSuper2(&v10, sel_initWithFrame_, a1, a2, a3, a4);
}

id AXTwiceWatchCrownButton.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id AXTwiceWatchCrownButton.init(coder:)(void *a1)
{
  char *v1;
  id v3;
  objc_super v5;

  *(_QWORD *)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI23AXTwiceWatchCrownButton_watchCrownDirectTouchTimer] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI23AXTwiceWatchCrownButton_watchCrownDirectTouchInterval] = 0x3FF0000000000000;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for AXTwiceWatchCrownButton();
  v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id AXTwiceWatchCrownButton.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AXTwiceWatchCrownButton();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_21EC69DD4()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0
                         + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_isCrownOrientationOnRightSide);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_21EC69E18(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_isCrownOrientationOnRightSide);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_21EC69E60())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

double sub_21EC69EA4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_leftPadding;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_21EC69EE8(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_leftPadding);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_21EC69F38())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void *sub_21EC69F7C()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_leftConstraint);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_21EC69FC8(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_leftConstraint);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*sub_21EC6A018())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

double sub_21EC6A05C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_rightPadding;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_21EC6A0A0(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_rightPadding);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_21EC6A0F0())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void *sub_21EC6A134()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_rightContraint);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_21EC6A180(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_rightContraint);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*sub_21EC6A1D0())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void *sub_21EC6A214()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_deviceChromeView);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_21EC6A260(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_deviceChromeView);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*sub_21EC6A2B0())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id sub_21EC6A2F4()
{
  id v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  type metadata accessor for AXTwiceWatchCrownButton();
  v0 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  v1 = (void *)objc_opt_self();
  v2 = v0;
  v3 = objc_msgSend(v1, sel_clearColor);
  objc_msgSend(v2, sel_setBackgroundColor_, v3);

  objc_msgSend(v2, sel_setIsAccessibilityElement_, 0);
  sub_21EC7CF98();
  v4 = v2;
  v5 = (void *)sub_21EC7CF38();
  sub_21EC7CF44();

  v6 = (void *)sub_21EC7D094();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, sel_setAccessibilityLabel_, v6);

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255481AF0);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_21EC7E100;
  v8 = v4;
  v9 = (void *)sub_21EC7CF38();
  v10 = sub_21EC7CF44();
  v12 = v11;

  *(_QWORD *)(v7 + 32) = v10;
  *(_QWORD *)(v7 + 40) = v12;
  v13 = (void *)sub_21EC7D0E8();
  swift_bridgeObjectRelease();
  objc_msgSend(v8, sel_setAccessibilityUserInputLabels_, v13);

  objc_msgSend(v8, sel_setAccessibilityTraits_, *MEMORY[0x24BEBDF00]);
  objc_msgSend(v8, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  return v8;
}

id sub_21EC6A4F0()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchCrownButton);
  swift_beginAccess();
  return *v1;
}

void sub_21EC6A534(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchCrownButton);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*sub_21EC6A584())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void *sub_21EC6A5C8()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_swipeUpCrownGesture);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_21EC6A614(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_swipeUpCrownGesture);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*sub_21EC6A664())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void *sub_21EC6A6A8()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_swipeDownCrownGesture);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_21EC6A6F4(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_swipeDownCrownGesture);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*sub_21EC6A744())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id sub_21EC6A788()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchSideButton);
  swift_beginAccess();
  return *v1;
}

void sub_21EC6A7CC(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchSideButton);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*sub_21EC6A81C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void *sub_21EC6A860()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_rendererView);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_21EC6A8AC(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_rendererView);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*sub_21EC6A8FC())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void *sub_21EC6A940()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_mirroringLayer);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_21EC6A98C(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_mirroringLayer);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*sub_21EC6A9DC())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id sub_21EC6AA20()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;

  v1 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView____lazy_storage___deviceSpinner;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView____lazy_storage___deviceSpinner);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView____lazy_storage___deviceSpinner);
  }
  else
  {
    v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD398]), sel_initWithActivityIndicatorStyle_, 100);
    v5 = objc_msgSend((id)objc_opt_self(), sel_whiteColor);
    objc_msgSend(v4, sel_setColor_, v5);

    objc_msgSend(v4, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    objc_msgSend(v4, sel_stopAnimating);
    objc_msgSend(v4, sel_setHidden_, 1);
    v6 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v7 = v2;
  return v3;
}

void sub_21EC6AB0C(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView____lazy_storage___deviceSpinner);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView____lazy_storage___deviceSpinner) = a1;

}

void (*sub_21EC6AB20(id *a1))(uint64_t *a1)
{
  void *v1;

  a1[1] = v1;
  *a1 = sub_21EC6AA20();
  return sub_21EC6AB54;
}

void sub_21EC6AB54(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v2 = *a1;
  v1 = a1[1];
  v3 = *(void **)(v1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView____lazy_storage___deviceSpinner);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView____lazy_storage___deviceSpinner) = v2;

}

id sub_21EC6AB6C(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t))
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), sel_init);
  v7 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
  objc_msgSend(v6, sel_setBackgroundColor_, v7);

  objc_msgSend(v6, sel_setIsAccessibilityElement_, 0);
  sub_21EC7CF98();
  v8 = v6;
  v9 = (void *)sub_21EC7CF38();
  a3(a1, a2);

  v10 = (void *)sub_21EC7D094();
  swift_bridgeObjectRelease();
  objc_msgSend(v8, sel_setAccessibilityLabel_, v10);

  objc_msgSend(v8, sel_setAccessibilityTraits_, *MEMORY[0x24BEBDF00]);
  objc_msgSend(v8, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  return v8;
}

id sub_21EC6ACAC()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchStingButton);
  swift_beginAccess();
  return *v1;
}

void sub_21EC6ACF0(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchStingButton);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*sub_21EC6AD40())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

__CFString *sub_21EC6AD84(double a1, double a2, double a3, double a4)
{
  void *v4;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  objc_class *v16;
  char *v17;
  id v18;
  id *v19;
  id v20;
  id v21;
  id *v22;
  id v23;
  id v24;
  id *v25;
  id v26;
  id v27;
  id v28;
  id *v29;
  id v30;
  id v31;
  id *v32;
  id v33;
  id v34;
  id *v35;
  id v36;
  uint64_t v37;
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  __CFString *v43;
  void *v44;
  id v45;
  id *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  __CFString *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  __CFString *v57;
  id v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  void *v63;
  uint64_t v64;
  id v65;
  id v66;
  void *v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  void *v84;
  id v85;
  id v86;
  id v87;
  uint64_t v88;
  void *v89;
  id v90;
  id v91;
  id v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  id v98;
  uint64_t v99;
  id v100;
  id v101;
  void *v102;
  char v103;
  double v104;
  id v105;
  id v106;
  id v107;
  void *v108;
  char v109;
  double v110;
  id v111;
  void *v112;
  uint64_t v113;
  id v114;
  id v115;
  id v116;
  id v117;
  id v118;
  id v119;
  id v120;
  id v121;
  id v122;
  id v123;
  id v124;
  void *v125;
  id *v126;
  uint64_t v127;
  id v128;
  id v129;
  id v130;
  id v131;
  id v132;
  id v133;
  void *v134;
  __CFString *v135;
  id v136;
  uint64_t v137;
  id v138;
  id v139;
  id v140;
  id v141;
  id v142;
  id v143;
  id v144;
  id v145;
  id v146;
  id v147;
  id v148;
  id v149;
  id v150;
  id v151;
  id v152;
  id v153;
  id v154;
  void *v155;
  uint64_t v156;
  __CFString *v157;
  __CFNotificationCenter *v158;
  id v160;
  void *v161;
  uint64_t v162;
  id *v163;
  id v164;
  void **v165;
  id v166;
  id *v167;
  id v168;
  void *v169;
  id v170;
  void *v171;
  void *v172;
  void *v173;
  objc_class *v174;
  id v175;
  id *v176;
  uint64_t v177;
  _QWORD v178[3];
  objc_class *v179;
  objc_super v180;

  v9 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_isCrownOrientationOnRightSide;
  v10 = v4;
  *((_BYTE *)v4 + v9) = AXIsCrownOrientationOnRightSide();
  *(_QWORD *)&v10[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_leftPadding] = 0;
  *(_QWORD *)&v10[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_leftConstraint] = 0;
  *(_QWORD *)&v10[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_rightPadding] = 0;
  *(_QWORD *)&v10[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_rightContraint] = 0;
  *(_QWORD *)&v10[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_deviceChromeView] = 0;
  *(_QWORD *)&v10[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchCrownButtonTopConstraint] = 0;
  *(_QWORD *)&v10[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchCrownButtonHorizontalConstraint] = 0;
  v11 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchCrownButton;
  *(_QWORD *)&v10[v11] = sub_21EC6A2F4();
  *(_QWORD *)&v10[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_swipeUpCrownGesture] = 0;
  *(_QWORD *)&v10[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_swipeDownCrownGesture] = 0;
  *(_QWORD *)&v10[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchSideButtonTopConstraint] = 0;
  *(_QWORD *)&v10[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchSideButtonHorizontalConstraint] = 0;
  v12 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchSideButton;
  *(_QWORD *)&v10[v12] = sub_21EC6AB6C(0xD00000000000001ALL, 0x800000021EC7F660, (void (*)(uint64_t, uint64_t))MEMORY[0x24BDFF3D0]);
  *(_QWORD *)&v10[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchRendererViewLeftConstraint] = 0;
  *(_QWORD *)&v10[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchRendererViewRightConstraint] = 0;
  *(_QWORD *)&v10[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_rendererView] = 0;
  *(_QWORD *)&v10[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_mirroringLayer] = 0;
  *(_QWORD *)&v10[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView____lazy_storage___deviceSpinner] = 0;
  v13 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_hasStingSupport;
  sub_21EC7CF98();
  v14 = (void *)sub_21EC7CF38();
  LOBYTE(v9) = MEMORY[0x2207BA028]();

  v10[v13] = v9 & 1;
  *(_QWORD *)&v10[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchStingButtonTopConstraint] = 0;
  *(_QWORD *)&v10[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchStingButtonHorizontalConstraint] = 0;
  v15 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchStingButton;
  *(_QWORD *)&v10[v15] = sub_21EC6AB6C(0xD00000000000001BLL, 0x800000021EC7F640, (void (*)(uint64_t, uint64_t))MEMORY[0x24BDFF3F8]);

  v16 = (objc_class *)type metadata accessor for AXTwiceCompanionWatchView();
  v180.receiver = v10;
  v180.super_class = v16;
  v17 = (char *)objc_msgSendSuper2(&v180, sel_initWithFrame_, a1, a2, a3, a4);
  objc_msgSend(v17, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v18 = objc_msgSend((id)objc_opt_self(), sel_watchView);
  v19 = (id *)&v17[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_deviceChromeView];
  swift_beginAccess();
  v20 = *v19;
  *v19 = v18;

  v167 = v19;
  if (*v19)
    objc_msgSend(*v19, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v174 = v16;
  type metadata accessor for AXTwiceCompanionRendererView();
  v21 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  v22 = (id *)&v17[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_rendererView];
  swift_beginAccess();
  v23 = *v22;
  *v22 = v21;

  if (*v22)
  {
    objc_msgSend(*v22, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    if (*v22)
      objc_msgSend(*v22, sel_setContentMode_, 1);
  }
  v165 = v22;
  v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDA20]), sel_initWithTarget_action_, v17, sel_digitalCrownButtonTappedWithSender_);
  objc_msgSend(v24, sel_setNumberOfTapsRequired_, 1);
  objc_msgSend(v24, sel_setNumberOfTouchesRequired_, 1);
  v25 = (id *)&v17[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchCrownButton];
  swift_beginAccess();
  objc_msgSend(*v25, sel_addGestureRecognizer_, v24);
  sub_21EC6D84C();
  v26 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDA20]), (SEL)&stru_24E36F140.name, v17, sel_doubleCrownButtonTappedWithSender_);
  objc_msgSend(v26, sel_setNumberOfTapsRequired_, 2);
  objc_msgSend(v26, sel_setNumberOfTouchesRequired_, 1);
  objc_msgSend(v24, sel_requireGestureRecognizerToFail_, v26);
  objc_msgSend(*v25, sel_addGestureRecognizer_, v26);
  v27 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDA20]), sel_initWithTarget_action_, v17, sel_tripleCrownButtonTappedWithSender_);
  objc_msgSend(v27, sel_setNumberOfTapsRequired_, 3);
  objc_msgSend(v27, sel_setNumberOfTouchesRequired_, 1);
  v172 = v26;
  objc_msgSend(v26, sel_requireGestureRecognizerToFail_, v27);
  v173 = v24;
  objc_msgSend(v24, sel_requireGestureRecognizerToFail_, v27);
  v176 = v25;
  v171 = v27;
  objc_msgSend(*v25, sel_addGestureRecognizer_, v27);
  v28 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD9B0]), sel_initWithTarget_action_, v17, sel_digitalCrownSwipeUpWithGesture_);
  v29 = (id *)&v17[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_swipeUpCrownGesture];
  swift_beginAccess();
  v30 = *v29;
  *v29 = v28;

  if (*v29)
  {
    objc_msgSend(*v29, sel_setDirection_, 4);
    if (*v29)
      objc_msgSend(*v25, sel_addGestureRecognizer_);
  }
  v31 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD9B0]), sel_initWithTarget_action_, v17, sel_digitalCrownSwipeDownWithGesture_);
  v32 = (id *)&v17[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_swipeDownCrownGesture];
  swift_beginAccess();
  v33 = *v32;
  *v32 = v31;

  if (*v32)
  {
    objc_msgSend(*v32, sel_setDirection_, 8);
    if (*v32)
      objc_msgSend(*v25, sel_addGestureRecognizer_);
  }
  v170 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD740]), sel_initWithTarget_action_, v17, sel_digitalCrownLongPressedWithGesture_);
  objc_msgSend(*v25, sel_addGestureRecognizer_);
  v34 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDA20]), sel_initWithTarget_action_, v17, sel_sideButtonTappedWithSender_);
  objc_msgSend(v34, sel_setNumberOfTapsRequired_, 1);
  objc_msgSend(v34, sel_setNumberOfTouchesRequired_, 1);
  v35 = (id *)&v17[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchSideButton];
  swift_beginAccess();
  v169 = v34;
  objc_msgSend(*v35, sel_addGestureRecognizer_, v34);
  v168 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD740]), sel_initWithTarget_action_, v17, sel_sideButtonLongPressedWithGesture_);
  objc_msgSend(*v35, sel_addGestureRecognizer_);
  v163 = v35;
  v36 = *v35;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2554816B0);
  v37 = swift_allocObject();
  *(_OWORD *)(v37 + 16) = xmmword_21EC7E110;
  sub_21EC66B28(0, &qword_255481A58);
  v38 = v36;
  v39 = (void *)sub_21EC7CF38();
  v40 = sub_21EC7CF44();
  v42 = v41;

  v179 = v174;
  v178[0] = v17;
  v43 = v17;
  *(_QWORD *)(v37 + 32) = sub_21EC6C370(v40, v42, v178, (uint64_t)sel_sideButtonAXLongPressed_);
  v178[0] = v37;
  sub_21EC7D10C();
  v44 = (void *)sub_21EC7D0E8();
  swift_bridgeObjectRelease();
  objc_msgSend(v38, sel_setAccessibilityCustomActions_, v44);

  v162 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_hasStingSupport;
  if (*((_BYTE *)&v43->isa + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_hasStingSupport) == 1)
  {
    v45 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDA20]), sel_initWithTarget_action_, v43, sel_stingButtonTappedWithSender_);
    objc_msgSend(v45, sel_setNumberOfTapsRequired_, 1);
    objc_msgSend(v45, sel_setNumberOfTouchesRequired_, 1);
    v46 = (void **)((char *)&v43->isa
                  + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchStingButton);
    swift_beginAccess();
    v161 = v45;
    objc_msgSend(*v46, sel_addGestureRecognizer_, v45);
    v160 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD740]), sel_initWithTarget_action_, v43, sel_stingButtonLongPressedWithGesture_);
    objc_msgSend(*v46, sel_addGestureRecognizer_);
    v47 = swift_allocObject();
    *(_OWORD *)(v47 + 16) = xmmword_21EC7E110;
    v48 = (void *)sub_21EC7CF38();
    v49 = sub_21EC7CF80();
    v51 = v50;

    v179 = v174;
    v178[0] = v43;
    v52 = v43;
    *(_QWORD *)(v47 + 32) = sub_21EC6C370(v49, v51, v178, (uint64_t)sel_stingButtonAXKeycord_);
    v178[0] = v47;
    sub_21EC7D10C();
    v177 = v178[0];
    v53 = (void *)sub_21EC7CF38();
    v54 = sub_21EC7CF80();
    v56 = v55;

    v179 = v174;
    v178[0] = v52;
    v57 = v52;
    sub_21EC6C370(v54, v56, v178, (uint64_t)sel_stingButtonAXLongPressed_);
    MEMORY[0x2207BA178]();
    if (*(_QWORD *)((v177 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v177 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_21EC7D118();
    sub_21EC7D124();
    sub_21EC7D10C();
    v58 = *v46;
    v59 = (void *)sub_21EC7D0E8();
    swift_bridgeObjectRelease();
    objc_msgSend(v58, sel_setAccessibilityCustomActions_, v59);

  }
  if (*v167)
  {
    v60 = *v165;
    if (*v165)
    {
      v61 = *v167;
      v62 = v60;
      -[__CFString addSubview:](v43, sel_addSubview_, v61);
      v63 = (void *)objc_opt_self();
      v64 = swift_allocObject();
      *(_OWORD *)(v64 + 16) = xmmword_21EC7E120;
      v65 = objc_msgSend(v61, sel_topAnchor);
      v66 = -[__CFString topAnchor](v43, sel_topAnchor);
      v67 = v62;
      v68 = objc_msgSend(v65, sel_constraintEqualToAnchor_, v66);

      *(_QWORD *)(v64 + 32) = v68;
      v69 = objc_msgSend(v61, sel_leadingAnchor);
      v70 = -[__CFString leadingAnchor](v43, sel_leadingAnchor);
      v71 = objc_msgSend(v69, sel_constraintEqualToAnchor_, v70);

      *(_QWORD *)(v64 + 40) = v71;
      v72 = objc_msgSend(v61, sel_trailingAnchor);
      v73 = -[__CFString trailingAnchor](v43, sel_trailingAnchor);
      v74 = objc_msgSend(v72, sel_constraintEqualToAnchor_, v73);

      *(_QWORD *)(v64 + 48) = v74;
      v75 = objc_msgSend(v61, sel_bottomAnchor);
      v76 = -[__CFString bottomAnchor](v43, sel_bottomAnchor);
      v77 = objc_msgSend(v75, sel_constraintEqualToAnchor_, v76);

      *(_QWORD *)(v64 + 56) = v77;
      v78 = objc_msgSend(v61, sel_centerXAnchor);
      v79 = -[__CFString centerXAnchor](v43, sel_centerXAnchor);
      v80 = objc_msgSend(v78, sel_constraintEqualToAnchor_, v79);

      *(_QWORD *)(v64 + 64) = v80;
      v81 = objc_msgSend(v61, sel_centerYAnchor);
      v82 = -[__CFString centerYAnchor](v43, sel_centerYAnchor);
      v83 = objc_msgSend(v81, sel_constraintEqualToAnchor_, v82);

      *(_QWORD *)(v64 + 72) = v83;
      v178[0] = v64;
      sub_21EC7D10C();
      sub_21EC66B28(0, &qword_2554816B8);
      v84 = (void *)sub_21EC7D0E8();
      swift_bridgeObjectRelease();
      v175 = v63;
      objc_msgSend(v63, sel_activateConstraints_, v84);

      v85 = objc_msgSend(v67, sel_leftAnchor);
      v86 = objc_msgSend(v61, sel_leftAnchor);
      v87 = objc_msgSend(v85, sel_constraintEqualToAnchor_, v86);

      v88 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchRendererViewLeftConstraint;
      v89 = *(void **)((char *)&v43->isa
                     + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchRendererViewLeftConstraint);
      *(void **)((char *)&v43->isa
               + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchRendererViewLeftConstraint) = v87;

      v90 = objc_msgSend(v67, sel_rightAnchor);
      v91 = objc_msgSend(v61, sel_rightAnchor);
      v92 = objc_msgSend(v90, sel_constraintEqualToAnchor_, v91);

      v93 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchRendererViewRightConstraint;
      v94 = *(void **)((char *)&v43->isa
                     + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchRendererViewRightConstraint);
      *(void **)((char *)&v43->isa
               + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchRendererViewRightConstraint) = v92;

      sub_21EC6C490();
      v95 = *(void **)((char *)&v43->isa + v88);
      if (v95)
      {
        v96 = *(void **)((char *)&v43->isa + v93);
        if (v96)
        {
          v97 = v95;
          v98 = v96;
          -[__CFString addSubview:](v43, sel_addSubview_, v67);
          v99 = swift_allocObject();
          *(_OWORD *)(v99 + 16) = xmmword_21EC7DED0;
          *(_QWORD *)(v99 + 32) = v97;
          *(_QWORD *)(v99 + 40) = v98;
          v166 = v97;
          v164 = v98;
          v100 = objc_msgSend(v67, sel_topAnchor);
          v101 = objc_msgSend(v61, sel_topAnchor);
          v102 = (void *)sub_21EC7CF38();
          v103 = MEMORY[0x2207BA028]();

          if ((v103 & 1) != 0)
            v104 = 25.0;
          else
            v104 = 24.0;
          v105 = objc_msgSend(v100, sel_constraintEqualToAnchor_constant_, v101, v104);

          *(_QWORD *)(v99 + 48) = v105;
          v106 = objc_msgSend(v67, sel_bottomAnchor);
          v107 = objc_msgSend(v61, sel_bottomAnchor);
          v108 = (void *)sub_21EC7CF38();
          v109 = MEMORY[0x2207BA028]();

          if ((v109 & 1) != 0)
            v110 = 25.0;
          else
            v110 = 24.0;
          v111 = objc_msgSend(v106, sel_constraintEqualToAnchor_constant_, v107, -v110);

          *(_QWORD *)(v99 + 56) = v111;
          v178[0] = v99;
          sub_21EC7D10C();
          v112 = (void *)sub_21EC7D0E8();
          swift_bridgeObjectRelease();
          objc_msgSend(v175, sel_activateConstraints_, v112);

        }
      }
      -[__CFString addSubview:](v43, sel_addSubview_, *v176);
      -[__CFString addSubview:](v43, sel_addSubview_, *v163);
      sub_21EC6C608();
      v113 = swift_allocObject();
      *(_OWORD *)(v113 + 16) = xmmword_21EC7DED0;
      v114 = objc_msgSend(*v176, sel_widthAnchor);
      v115 = objc_msgSend(v114, sel_constraintEqualToConstant_, 45.0);

      *(_QWORD *)(v113 + 32) = v115;
      v116 = objc_msgSend(*v176, sel_heightAnchor);
      v117 = objc_msgSend(v67, sel_heightAnchor);
      v118 = objc_msgSend(v116, sel_constraintEqualToAnchor_multiplier_, v117, 0.5);

      *(_QWORD *)(v113 + 40) = v118;
      v119 = objc_msgSend(*v163, sel_widthAnchor);
      v120 = objc_msgSend(*v176, sel_widthAnchor);
      v121 = objc_msgSend(v119, sel_constraintEqualToAnchor_, v120);

      *(_QWORD *)(v113 + 48) = v121;
      v122 = objc_msgSend(*v163, sel_heightAnchor);
      v123 = objc_msgSend(*v176, sel_heightAnchor);
      v124 = objc_msgSend(v122, sel_constraintEqualToAnchor_, v123);

      *(_QWORD *)(v113 + 56) = v124;
      v178[0] = v113;
      sub_21EC7D10C();
      v125 = (void *)sub_21EC7D0E8();
      swift_bridgeObjectRelease();
      objc_msgSend(v175, sel_activateConstraints_, v125);

      if (*((_BYTE *)&v43->isa + v162) == 1)
      {
        v126 = (void **)((char *)&v43->isa
                       + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchStingButton);
        swift_beginAccess();
        -[__CFString addSubview:](v43, sel_addSubview_, *v126);
        sub_21EC6CBC0();
        v127 = swift_allocObject();
        *(_OWORD *)(v127 + 16) = xmmword_21EC7DEA0;
        v128 = objc_msgSend(*v126, sel_widthAnchor);
        v129 = objc_msgSend(*v163, sel_widthAnchor);
        v130 = objc_msgSend(v128, (SEL)&protocolRef_AXTwiceCompanionAirplayReceiverDelegate + 6, v129);

        *(_QWORD *)(v127 + 32) = v130;
        v131 = objc_msgSend(*v126, sel_heightAnchor);
        v132 = objc_msgSend(*v163, sel_heightAnchor);
        v133 = objc_msgSend(v131, sel_constraintEqualToAnchor_, v132);

        *(_QWORD *)(v127 + 40) = v133;
        sub_21EC7D10C();
        v134 = (void *)sub_21EC7D0E8();
        swift_bridgeObjectRelease();
        objc_msgSend(v175, sel_activateConstraints_, v134);

      }
      v135 = v43;
      v136 = sub_21EC6AA20();
      -[__CFString addSubview:](v135, sel_addSubview_, v136);

      v137 = swift_allocObject();
      *(_OWORD *)(v137 + 16) = xmmword_21EC7DED0;
      v138 = sub_21EC6AA20();
      v139 = objc_msgSend(v138, sel_centerXAnchor);

      v140 = objc_msgSend(v67, sel_centerXAnchor);
      v141 = objc_msgSend(v139, sel_constraintEqualToAnchor_, v140);

      *(_QWORD *)(v137 + 32) = v141;
      v142 = sub_21EC6AA20();
      v143 = objc_msgSend(v142, sel_centerYAnchor);

      v144 = objc_msgSend(v67, sel_centerYAnchor);
      v145 = objc_msgSend(v143, (SEL)&protocolRef_AXTwiceCompanionAirplayReceiverDelegate + 6, v144);

      *(_QWORD *)(v137 + 40) = v145;
      v146 = sub_21EC6AA20();
      v147 = objc_msgSend(v146, sel_widthAnchor);

      v148 = objc_msgSend(v67, sel_widthAnchor);
      v149 = objc_msgSend(v147, sel_constraintEqualToAnchor_multiplier_, v148, 0.5);

      *(_QWORD *)(v137 + 48) = v149;
      v150 = sub_21EC6AA20();
      v151 = objc_msgSend(v150, sel_heightAnchor);

      v152 = sub_21EC6AA20();
      v153 = objc_msgSend(v152, sel_heightAnchor);

      v154 = objc_msgSend(v151, (SEL)&protocolRef_AXTwiceCompanionAirplayReceiverDelegate + 6, v153);
      *(_QWORD *)(v137 + 56) = v154;
      sub_21EC7D10C();
      v155 = (void *)sub_21EC7D0E8();
      swift_bridgeObjectRelease();
      objc_msgSend(v175, sel_activateConstraints_, v155);

    }
  }
  v156 = AXkNanoOrientationStatusNotificationID();
  if (v156)
  {
    v157 = (__CFString *)v156;
    v158 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v158, v43, (CFNotificationCallback)sub_21EC6E4D8, v157, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

  }
  else
  {
    v157 = v43;
    v158 = (__CFNotificationCenter *)v168;
  }

  return v43;
}

id sub_21EC6C370(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4)
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  id v13;
  uint64_t v15;

  v6 = (void *)sub_21EC7D094();
  swift_bridgeObjectRelease();
  v7 = a3[3];
  if (v7)
  {
    v8 = __swift_project_boxed_opaque_existential_0(a3, a3[3]);
    v9 = *(_QWORD *)(v7 - 8);
    MEMORY[0x24BDAC7A8](v8);
    v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v9 + 16))(v11);
    v12 = sub_21EC7D2E0();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v7);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a3);
  }
  else
  {
    v12 = 0;
  }
  v13 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithName_target_selector_, v6, v12, a4);

  swift_unknownObjectRelease();
  return v13;
}

void sub_21EC6C490()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  unsigned __int8 *v3;
  int v4;
  id v5;
  void *v6;
  char v7;
  double v8;
  double v9;
  void *v10;
  unsigned __int8 *v11;
  int v12;
  id v13;
  void *v14;
  char v15;
  double v16;
  double v17;

  v1 = v0;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchRendererViewLeftConstraint);
  if (v2)
  {
    v3 = (unsigned __int8 *)(v0
                           + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_isCrownOrientationOnRightSide);
    swift_beginAccess();
    v4 = *v3;
    sub_21EC7CF98();
    v5 = v2;
    v6 = (void *)sub_21EC7CF38();
    v7 = MEMORY[0x2207BA028]();

    v8 = 24.0;
    if ((v7 & 1) != 0)
      v8 = 25.0;
    v9 = 41.0;
    if ((v7 & 1) != 0)
      v9 = 44.0;
    if (!v4)
      v8 = v9;
    objc_msgSend(v5, sel_setConstant_, v8);

  }
  v10 = *(void **)(v1
                 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchRendererViewRightConstraint);
  if (v10)
  {
    v11 = (unsigned __int8 *)(v1
                            + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_isCrownOrientationOnRightSide);
    swift_beginAccess();
    v12 = *v11;
    sub_21EC7CF98();
    v13 = v10;
    v14 = (void *)sub_21EC7CF38();
    v15 = MEMORY[0x2207BA028]();

    v16 = 41.0;
    if ((v15 & 1) != 0)
      v16 = 44.0;
    v17 = 24.0;
    if ((v15 & 1) != 0)
      v17 = 25.0;
    if (!v12)
      v16 = v17;
    objc_msgSend(v13, sel_setConstant_, -v16);

  }
}

void sub_21EC6C608()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id *v7;
  void *v8;
  void **v9;
  void *v10;
  void **v11;
  void *v12;
  _BYTE *v13;
  id *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  double v24;
  id v25;
  id v26;
  id *v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  void **v35;
  id *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  double v46;
  id v47;
  id v48;
  id *v49;
  id v50;
  id v51;
  id v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;

  v1 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchCrownButtonTopConstraint;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchCrownButtonTopConstraint);
  if (v2)
    objc_msgSend(v2, sel_setActive_, 0);
  v3 = (id *)(v0
            + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchCrownButtonHorizontalConstraint);
  v4 = *(void **)(v0
                + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchCrownButtonHorizontalConstraint);
  if (v4)
    objc_msgSend(v4, sel_setActive_, 0);
  v5 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchSideButtonTopConstraint;
  v6 = *(void **)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchSideButtonTopConstraint);
  if (v6)
    objc_msgSend(v6, sel_setActive_, 0);
  v7 = (id *)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchSideButtonHorizontalConstraint);
  v8 = *(void **)(v0
                + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchSideButtonHorizontalConstraint);
  if (v8)
    objc_msgSend(v8, sel_setActive_, 0);
  v9 = (void **)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_deviceChromeView);
  swift_beginAccess();
  v10 = *v9;
  if (*v9)
  {
    v11 = (void **)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_rendererView);
    swift_beginAccess();
    v12 = *v11;
    if (*v11)
    {
      v13 = (_BYTE *)(v0
                    + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_isCrownOrientationOnRightSide);
      swift_beginAccess();
      v59 = v12;
      v60 = v10;
      if (*v13 == 1)
      {
        v14 = (id *)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchCrownButton);
        swift_beginAccess();
        v15 = *v14;
        v16 = v10;
        v17 = v12;
        v18 = objc_msgSend(v15, sel_topAnchor);
        v19 = objc_msgSend(v17, (SEL)&ResourceBundleClass.name + 4);
        v20 = objc_msgSend(v18, sel_constraintEqualToAnchor_, v19);

        v21 = *(void **)(v0 + v1);
        *(_QWORD *)(v0 + v1) = v20;

        v22 = objc_msgSend(*v14, sel_rightAnchor);
        v23 = objc_msgSend(v16, (SEL)&stru_24E36F490.offs + 4);
        objc_msgSend(v16, sel_layoutMargins);
        v25 = objc_msgSend(v22, sel_constraintEqualToAnchor_constant_, v23, v24);

        v26 = *v3;
        *v3 = v25;

        v27 = (id *)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchSideButton);
        swift_beginAccess();
        v28 = objc_msgSend(*v27, sel_topAnchor);
        v29 = objc_msgSend(*v14, sel_bottomAnchor);
        v30 = objc_msgSend(v28, sel_constraintEqualToAnchor_, v29);

        v31 = *(void **)(v0 + v5);
        *(_QWORD *)(v0 + v5) = v30;

        v32 = objc_msgSend(*v27, sel_rightAnchor);
        v33 = objc_msgSend(*v14, sel_rightAnchor);
        v34 = objc_msgSend(v32, sel_constraintEqualToAnchor_, v33);
        v35 = v7;
      }
      else
      {
        v36 = (id *)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchSideButton);
        swift_beginAccess();
        v37 = *v36;
        v38 = v10;
        v39 = v12;
        v40 = objc_msgSend(v37, sel_topAnchor);
        v41 = objc_msgSend(v39, (SEL)&ResourceBundleClass.name + 4);
        v42 = objc_msgSend(v40, sel_constraintEqualToAnchor_, v41);

        v43 = *(void **)(v0 + v5);
        *(_QWORD *)(v0 + v5) = v42;

        v44 = objc_msgSend(*v36, sel_leftAnchor);
        v45 = objc_msgSend(v38, sel_leftAnchor);
        objc_msgSend(v38, sel_layoutMargins);
        v47 = objc_msgSend(v44, sel_constraintEqualToAnchor_constant_, v45, -v46);

        v48 = *v7;
        *v7 = v47;

        v49 = (id *)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchCrownButton);
        swift_beginAccess();
        v50 = objc_msgSend(*v49, sel_topAnchor);
        v51 = objc_msgSend(*v36, sel_bottomAnchor);
        v52 = objc_msgSend(v50, sel_constraintEqualToAnchor_, v51);

        v53 = *(void **)(v0 + v1);
        *(_QWORD *)(v0 + v1) = v52;

        v32 = objc_msgSend(*v49, sel_rightAnchor);
        v33 = objc_msgSend(*v36, sel_rightAnchor);
        v34 = objc_msgSend(v32, sel_constraintEqualToAnchor_, v33);
        v35 = v3;
      }
      v54 = v34;

      v55 = *v35;
      *v35 = v54;

      v56 = *(void **)(v0 + v1);
      if (v56)
        objc_msgSend(v56, sel_setActive_, 1);
      if (*v3)
        objc_msgSend(*v3, sel_setActive_, 1);
      v57 = *(void **)(v0 + v5);
      if (v57)
        objc_msgSend(v57, sel_setActive_, 1);
      if (*v7)
      {
        v58 = *v7;
        objc_msgSend(v58, sel_setActive_, 1);

      }
    }
  }
}

void sub_21EC6CBC0()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void **v5;
  void *v6;
  unsigned __int8 *v7;
  int v8;
  id *v9;
  id v10;
  id v11;
  id v12;
  id *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  double v19;
  double v20;
  id v21;
  id v22;
  id v23;
  id *v24;
  id v25;
  id v26;
  void *v27;
  double v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;

  v1 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchStingButtonTopConstraint;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchStingButtonTopConstraint);
  if (v2)
    objc_msgSend(v2, sel_setActive_, 0);
  v3 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchStingButtonHorizontalConstraint;
  v4 = *(void **)(v0
                + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchStingButtonHorizontalConstraint);
  if (v4)
    objc_msgSend(v4, sel_setActive_, 0);
  v5 = (void **)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_deviceChromeView);
  swift_beginAccess();
  v6 = *v5;
  if (*v5)
  {
    v7 = (unsigned __int8 *)(v0
                           + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_isCrownOrientationOnRightSide);
    swift_beginAccess();
    v8 = *v7;
    v9 = (id *)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchStingButton);
    if (v8 == 1)
    {
      swift_beginAccess();
      v10 = *v9;
      v11 = v6;
      v12 = objc_msgSend(v10, sel_topAnchor);
      v13 = (id *)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchSideButton);
      swift_beginAccess();
      v14 = objc_msgSend(*v13, sel_topAnchor);
      v15 = objc_msgSend(v12, sel_constraintEqualToAnchor_, v14);

      v16 = *(void **)(v0 + v1);
      *(_QWORD *)(v0 + v1) = v15;

      v17 = objc_msgSend(*v9, sel_leftAnchor);
      v18 = objc_msgSend(v11, sel_leftAnchor);
      objc_msgSend(v11, sel_layoutMargins);
      v20 = -v19;
    }
    else
    {
      swift_beginAccess();
      v21 = *v9;
      v22 = v6;
      v23 = objc_msgSend(v21, sel_topAnchor);
      v24 = (id *)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchSideButton);
      swift_beginAccess();
      v25 = objc_msgSend(*v24, sel_topAnchor);
      v26 = objc_msgSend(v23, sel_constraintEqualToAnchor_, v25);

      v27 = *(void **)(v0 + v1);
      *(_QWORD *)(v0 + v1) = v26;

      v17 = objc_msgSend(*v9, sel_rightAnchor);
      v18 = objc_msgSend(v22, sel_rightAnchor);
      objc_msgSend(v22, sel_layoutMargins);
      v20 = v28;
    }
    v29 = objc_msgSend(v17, sel_constraintEqualToAnchor_constant_, v18, v20);

    v30 = *(void **)(v0 + v3);
    *(_QWORD *)(v0 + v3) = v29;

    v31 = *(void **)(v0 + v1);
    if (v31)
      objc_msgSend(v31, sel_setActive_, 1);
    v32 = *(void **)(v0 + v3);
    if (v32)
    {
      v33 = v32;
      objc_msgSend(v33, sel_setActive_, 1);

    }
  }
}

id AXTwiceCompanionWatchView.__deallocating_deinit()
{
  void *v0;
  __CFNotificationCenter *v1;
  objc_super v3;

  v1 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(v1, v0);

  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for AXTwiceCompanionWatchView();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

id sub_21EC6D11C(int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint8_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t *v12;
  id *v13;
  id *v14;
  id result;
  id *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19[3];

  v2 = v1;
  LODWORD(v3) = a1;
  v4 = sub_21EC7D004();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21EC7CD94();
  v8 = sub_21EC7CFF8();
  v9 = sub_21EC7D148();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = swift_slowAlloc();
    HIDWORD(v17) = (_DWORD)v3;
    v3 = (uint8_t *)v10;
    v11 = swift_slowAlloc();
    v19[0] = v11;
    *(_DWORD *)v3 = 136315138;
    v18 = sub_21EC68898(0xD000000000000016, 0x800000021EC7EE40, v19);
    sub_21EC7D1B4();
    _os_log_impl(&dword_21EC60000, v8, v9, "[TWICE] %s", v3, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207BA9A0](v11, -1, -1);
    v12 = v3;
    LOBYTE(v3) = BYTE4(v17);
    MEMORY[0x2207BA9A0](v12, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v13 = (id *)(v2 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchCrownButton);
  swift_beginAccess();
  objc_msgSend(*v13, sel_setIsAccessibilityElement_, v3 & 1);
  v14 = (id *)(v2 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchSideButton);
  swift_beginAccess();
  result = objc_msgSend(*v14, sel_setIsAccessibilityElement_, v3 & 1);
  if (*(_BYTE *)(v2 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_hasStingSupport) == 1)
  {
    v16 = (id *)(v2 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchStingButton);
    swift_beginAccess();
    return objc_msgSend(*v16, sel_setIsAccessibilityElement_, v3 & 1);
  }
  return result;
}

uint64_t sub_21EC6D360(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void **v17;
  void *v18;
  id v19;
  id *v20;
  id v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28[3];

  v2 = v1;
  v4 = sub_21EC7D004();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21EC7CD94();
  v8 = a1;
  v9 = sub_21EC7CFF8();
  v10 = sub_21EC7D148();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = swift_slowAlloc();
    v26 = v2;
    v12 = v11;
    v13 = (_QWORD *)swift_slowAlloc();
    v24 = swift_slowAlloc();
    v28[0] = v24;
    *(_DWORD *)v12 = 136315394;
    v27 = sub_21EC68898(0xD000000000000019, 0x800000021EC7EE60, v28);
    v25 = v5;
    sub_21EC7D1B4();
    *(_WORD *)(v12 + 12) = 2112;
    v23 = v4;
    v27 = (uint64_t)v8;
    v14 = v8;
    sub_21EC7D1B4();
    *v13 = v8;

    _os_log_impl(&dword_21EC60000, v9, v10, "[TWICE] %s %@", (uint8_t *)v12, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255481BC0);
    swift_arrayDestroy();
    MEMORY[0x2207BA9A0](v13, -1, -1);
    v15 = v24;
    swift_arrayDestroy();
    MEMORY[0x2207BA9A0](v15, -1, -1);
    v16 = v12;
    v2 = v26;
    MEMORY[0x2207BA9A0](v16, -1, -1);

    (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v23);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  v17 = (void **)(v2 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_mirroringLayer);
  swift_beginAccess();
  v18 = *v17;
  *v17 = v8;
  v19 = v8;

  v20 = (id *)(v2 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_rendererView);
  swift_beginAccess();
  if (*v20)
  {
    v21 = *v20;
    sub_21EC67860(v19);

  }
  return sub_21EC6E4E0(1.0);
}

uint64_t sub_21EC6D624(double a1, double a2)
{
  uint64_t v2;
  _QWORD *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  id v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  double x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v33;
  _BYTE *v34;
  double v35;
  CGPoint v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  v5 = (_QWORD *)(v2 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_rendererView);
  swift_beginAccess();
  if (!*v5)
    return 0;
  v6 = *(void **)(*v5 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI28AXTwiceCompanionRendererView_mirroringLayer);
  if (!v6)
    return 0;
  v7 = (void *)objc_opt_self();
  v8 = v6;
  v9 = objc_msgSend(v7, sel_mainScreen);
  objc_msgSend(v9, sel_bounds);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v38.origin.x = v11;
  v38.origin.y = v13;
  v38.size.width = v15;
  v38.size.height = v17;
  v18 = CGRectGetWidth(v38) * a1;
  v19 = objc_msgSend(v7, sel_mainScreen);
  objc_msgSend(v19, sel_bounds);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;

  v39.origin.x = v21;
  v39.origin.y = v23;
  v39.size.width = v25;
  v39.size.height = v27;
  v28 = CGRectGetHeight(v39) * a2;
  objc_msgSend(v8, sel_bounds);
  objc_msgSend(v8, sel_convertRect_toLayer_, 0);
  x = v40.origin.x;
  y = v40.origin.y;
  width = v40.size.width;
  height = v40.size.height;
  v37.x = v18;
  v37.y = v28;
  if (!CGRectContainsPoint(v40, v37))
  {

    return 0;
  }
  v41.origin.x = x;
  v41.origin.y = y;
  v41.size.width = width;
  v41.size.height = height;
  v33 = (v18 - x) / CGRectGetWidth(v41);
  v42.origin.x = x;
  v42.origin.y = y;
  v42.size.width = width;
  v42.size.height = height;
  CGRectGetHeight(v42);

  v34 = (_BYTE *)(v2 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_isCrownOrientationOnRightSide);
  swift_beginAccess();
  v35 = 1.0 - v33;
  if (*v34)
    v35 = v33;
  return *(_QWORD *)&v35;
}

void sub_21EC6D84C()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  id *v29;
  id v30;
  void *v31;
  _QWORD v32[3];
  uint64_t v33;
  uint64_t v34;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2554816B0);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_21EC7DED0;
  sub_21EC66B28(0, &qword_255481A58);
  sub_21EC7CF98();
  v3 = (void *)sub_21EC7CF38();
  v4 = sub_21EC7CF44();
  v6 = v5;

  v7 = type metadata accessor for AXTwiceCompanionWatchView();
  v33 = v7;
  v32[0] = v1;
  v8 = v1;
  *(_QWORD *)(v2 + 32) = sub_21EC6C370(v4, v6, v32, (uint64_t)sel_digitalCrownButtonScrollUp_);
  v9 = (void *)sub_21EC7CF38();
  v10 = sub_21EC7CF44();
  v12 = v11;

  v33 = v7;
  v32[0] = v8;
  v13 = v8;
  *(_QWORD *)(v2 + 40) = sub_21EC6C370(v10, v12, v32, (uint64_t)sel_digitalCrownButtonScrollDown_);
  v14 = (void *)sub_21EC7CF38();
  v15 = sub_21EC7CF44();
  v17 = v16;

  v33 = v7;
  v32[0] = v13;
  v18 = v13;
  *(_QWORD *)(v2 + 48) = sub_21EC6C370(v15, v17, v32, (uint64_t)sel_doubleDigitalCrownButtonTapped_);
  v19 = (void *)sub_21EC7CF38();
  v20 = sub_21EC7CF44();
  v22 = v21;

  v33 = v7;
  v32[0] = v18;
  v23 = (char *)v18;
  *(_QWORD *)(v2 + 56) = sub_21EC6C370(v20, v22, v32, (uint64_t)sel_tripleDigitalCrownButtonTapped_);
  v32[0] = v2;
  sub_21EC7D10C();
  v34 = v32[0];
  v24 = (void *)sub_21EC7CF38();
  v25 = sub_21EC7CF44();
  v27 = v26;

  v33 = v7;
  v32[0] = v23;
  v28 = v23;
  sub_21EC6C370(v25, v27, v32, (uint64_t)sel_digitalCrownAXLongPressed_);
  MEMORY[0x2207BA178]();
  if (*(_QWORD *)((v34 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v34 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_21EC7D118();
  sub_21EC7D124();
  sub_21EC7D10C();
  v29 = (id *)&v23[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchCrownButton];
  swift_beginAccess();
  v30 = *v29;
  v31 = (void *)sub_21EC7D0E8();
  swift_bridgeObjectRelease();
  objc_msgSend(v30, sel_setAccessibilityCustomActions_, v31);

}

void sub_21EC6DF48(uint64_t a1, SEL *a2)
{
  uint64_t v4;
  void *v5;
  id *v6;
  id v7;
  char *v8;
  void *v9;

  swift_beginAccess();
  v4 = MEMORY[0x2207BA9E8](a1);
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (id *)(v4 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_rendererView);
    swift_beginAccess();
    v7 = *v6;
    v8 = (char *)*v6;

    if (v7)
    {
      v9 = (void *)MEMORY[0x2207BA9E8](&v8[OBJC_IVAR____TtC21AXWatchRemoteScreenUI28AXTwiceCompanionRendererView_delegate]);

      if (v9)
      {
        objc_msgSend(v9, *a2);
        swift_unknownObjectRelease();
      }
    }
  }
}

void sub_21EC6E00C(void *a1, uint64_t a2, void *a3, SEL *a4)
{
  id v7;
  id v8;
  _BYTE v9[8];

  swift_unknownObjectWeakInit();
  v7 = a3;
  v8 = a1;
  sub_21EC6F540(v7, (uint64_t)v9, a4);
  swift_unknownObjectWeakDestroy();

}

uint64_t (*sub_21EC6E404())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void (*sub_21EC6E44C(id **a1))(_QWORD *a1)
{
  id *v2;

  v2 = (id *)malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_21EC6AB20(v2);
  return sub_21EC6E490;
}

void sub_21EC6E490(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t sub_21EC6E4C0(double a1, double a2)
{
  return sub_21EC6D624(a1, a2);
}

void sub_21EC6E4D8(uint64_t a1, void *a2)
{
  sub_21EC702B4(a2);
}

uint64_t sub_21EC6E4E0(double a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  void *v16;
  void (*v17)(char *, uint64_t);
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD aBlock[6];

  v3 = sub_21EC7D01C();
  v25 = *(_QWORD *)(v3 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_21EC7D040();
  v23 = *(_QWORD *)(v6 - 8);
  v24 = v6;
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_21EC7D058();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v22 - v14;
  sub_21EC66B28(0, (unint64_t *)&qword_255481B40);
  v16 = (void *)sub_21EC7D178();
  sub_21EC7D04C();
  MEMORY[0x2207BA10C](v13, a1);
  v17 = *(void (**)(char *, uint64_t))(v10 + 8);
  v17(v13, v9);
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = v1;
  aBlock[4] = sub_21EC7052C;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21EC65AAC;
  aBlock[3] = &block_descriptor_32;
  v19 = _Block_copy(aBlock);
  v20 = v1;
  swift_release();
  sub_21EC7D028();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_21EC6965C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2554816C0);
  sub_21EC66670();
  sub_21EC7D1D8();
  MEMORY[0x2207BA1FC](v15, v8, v5, v19);
  _Block_release(v19);

  (*(void (**)(char *, uint64_t))(v25 + 8))(v5, v3);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v8, v24);
  return ((uint64_t (*)(char *, uint64_t))v17)(v15, v9);
}

uint64_t sub_21EC6E754()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_21EC6E778(uint64_t a1)
{
  uint64_t v1;

  sub_21EC697E8(a1, v1);
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t type metadata accessor for AXTwiceWatchCrownButton()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for AXTwiceCompanionWatchView()
{
  return objc_opt_self();
}

id sub_21EC6E7D8(_BYTE *a1)
{
  unsigned __int8 *v2;
  int v3;
  id *v4;
  double v5;
  id v6;
  id v7;
  CATransform3D v9;

  v2 = &a1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_isCrownOrientationOnRightSide];
  swift_beginAccess();
  v3 = *v2;
  v4 = (id *)&a1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_deviceChromeView];
  swift_beginAccess();
  if (*v4)
  {
    if (v3)
      v5 = 0.0;
    else
      v5 = 1.0;
    v6 = *v4;
    v7 = objc_msgSend(v6, sel_layer);
    CATransform3DMakeRotation(&v9, 3.14159265, 0.0, 0.0, v5);
    objc_msgSend(v7, sel_setTransform_, &v9);

  }
  sub_21EC6E914();
  sub_21EC6C490();
  sub_21EC6C608();
  if (a1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_hasStingSupport] == 1)
    sub_21EC6CBC0();
  return objc_msgSend(a1, sel_setNeedsUpdateConstraints);
}

id sub_21EC6E914()
{
  uint64_t v0;
  void **v1;
  void *v2;
  _BYTE *v3;
  uint64_t v4;
  double *v5;
  void **v6;
  id result;
  void *v8;
  _BYTE *v9;
  uint64_t v10;
  double *v11;

  v1 = (void **)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_leftConstraint);
  swift_beginAccess();
  v2 = *v1;
  if (v2)
  {
    v3 = (_BYTE *)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_isCrownOrientationOnRightSide);
    swift_beginAccess();
    if (*v3 == 1)
      v4 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_leftPadding;
    else
      v4 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_rightPadding;
    v5 = (double *)(v0 + v4);
    swift_beginAccess();
    objc_msgSend(v2, sel_setConstant_, *v5);
  }
  v6 = (void **)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_rightContraint);
  result = (id)swift_beginAccess();
  v8 = *v6;
  if (v8)
  {
    v9 = (_BYTE *)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_isCrownOrientationOnRightSide);
    swift_beginAccess();
    if (*v9 == 1)
      v10 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_rightPadding;
    else
      v10 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_leftPadding;
    v11 = (double *)(v0 + v10);
    swift_beginAccess();
    return objc_msgSend(v8, sel_setConstant_, -*v11);
  }
  return result;
}

uint64_t sub_21EC6EA68@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(*a1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_isCrownOrientationOnRightSide);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_21EC6EAB8(char *a1, _QWORD *a2)
{
  char v2;
  _BYTE *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_BYTE *)(*a2 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_isCrownOrientationOnRightSide);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

double sub_21EC6EB04@<D0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_1Tm(a1, &OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_leftPadding, a2);
}

uint64_t sub_21EC6EB10(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_2Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_leftPadding);
}

id sub_21EC6EB1C@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  return keypath_get_3Tm(a1, &OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_leftConstraint, a2);
}

void sub_21EC6EB28(void **a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_21EC64008(a1, a2, a3, a4, &OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_leftConstraint);
}

double sub_21EC6EB44@<D0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_1Tm(a1, &OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_rightPadding, a2);
}

double keypath_get_1Tm@<D0>(_QWORD *a1@<X0>, _QWORD *a2@<X3>, _QWORD *a3@<X8>)
{
  double *v4;
  double result;

  v4 = (double *)(*a1 + *a2);
  swift_beginAccess();
  result = *v4;
  *a3 = *(_QWORD *)v4;
  return result;
}

uint64_t sub_21EC6EB9C(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_2Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_rightPadding);
}

uint64_t keypath_set_2Tm(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t result;

  v5 = *a1;
  v6 = (_QWORD *)(*a2 + *a5);
  result = swift_beginAccess();
  *v6 = v5;
  return result;
}

id sub_21EC6EBF8@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  return keypath_get_3Tm(a1, &OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_rightContraint, a2);
}

void sub_21EC6EC04(void **a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_21EC64008(a1, a2, a3, a4, &OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_rightContraint);
}

id sub_21EC6EC20@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  return keypath_get_3Tm(a1, &OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_deviceChromeView, a2);
}

void sub_21EC6EC2C(void **a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_21EC64008(a1, a2, a3, a4, &OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_deviceChromeView);
}

id sub_21EC6EC48@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  return keypath_get_3Tm(a1, &OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchCrownButton, a2);
}

void sub_21EC6EC54(void **a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_21EC64008(a1, a2, a3, a4, &OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchCrownButton);
}

id sub_21EC6EC70@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  return keypath_get_3Tm(a1, &OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_swipeUpCrownGesture, a2);
}

void sub_21EC6EC7C(void **a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_21EC64008(a1, a2, a3, a4, &OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_swipeUpCrownGesture);
}

id sub_21EC6EC98@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  return keypath_get_3Tm(a1, &OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_swipeDownCrownGesture, a2);
}

void sub_21EC6ECA4(void **a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_21EC64008(a1, a2, a3, a4, &OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_swipeDownCrownGesture);
}

id sub_21EC6ECC0@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  return keypath_get_3Tm(a1, &OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchSideButton, a2);
}

void sub_21EC6ECCC(void **a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_21EC64008(a1, a2, a3, a4, &OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchSideButton);
}

id sub_21EC6ECE8@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  return keypath_get_3Tm(a1, &OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_rendererView, a2);
}

void sub_21EC6ECF4(void **a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_21EC64008(a1, a2, a3, a4, &OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_rendererView);
}

id sub_21EC6ED10@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  return keypath_get_3Tm(a1, &OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_mirroringLayer, a2);
}

id keypath_get_3Tm@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X3>, void **a3@<X8>)
{
  void **v4;
  void *v5;

  v4 = (void **)(*a1 + *a2);
  swift_beginAccess();
  v5 = *v4;
  *a3 = *v4;
  return v5;
}

void sub_21EC6ED68(void **a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_21EC64008(a1, a2, a3, a4, &OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_mirroringLayer);
}

id sub_21EC6ED84@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = sub_21EC6AA20();
  *a1 = result;
  return result;
}

void sub_21EC6EDAC(void **a1, _QWORD *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *a1;
  v4 = *(id *)(*a2 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView____lazy_storage___deviceSpinner);
  *(_QWORD *)(*a2 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView____lazy_storage___deviceSpinner) = *a1;
  v3 = v2;

}

id sub_21EC6EDE8@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  return keypath_get_3Tm(a1, &OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchStingButton, a2);
}

void sub_21EC6EDF4(void **a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_21EC64008(a1, a2, a3, a4, &OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchStingButton);
}

uint64_t method lookup function for AXTwiceWatchCrownButton()
{
  return swift_lookUpClassMethod();
}

uint64_t method lookup function for AXTwiceCompanionWatchView()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.isCrownOrientationOnRightSide.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.isCrownOrientationOnRightSide.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.isCrownOrientationOnRightSide.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.leftPadding.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.leftPadding.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.leftPadding.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x130))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.leftConstraint.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x138))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.leftConstraint.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x140))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.leftConstraint.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x148))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.rightPadding.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x150))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.rightPadding.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.rightPadding.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.rightContraint.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x168))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.rightContraint.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x170))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.rightContraint.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x178))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.deviceChromeView.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x180))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.deviceChromeView.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x188))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.deviceChromeView.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x190))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.watchCrownButton.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1C8))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.watchCrownButton.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1D0))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.watchCrownButton.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1D8))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.swipeUpCrownGesture.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1E0))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.swipeUpCrownGesture.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1E8))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.swipeUpCrownGesture.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1F0))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.swipeDownCrownGesture.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1F8))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.swipeDownCrownGesture.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x200))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.swipeDownCrownGesture.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x208))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.watchSideButton.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x240))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.watchSideButton.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x248))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.watchSideButton.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x250))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.rendererView.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x298))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.rendererView.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2A0))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.rendererView.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2A8))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.mirroringLayer.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2B0))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.mirroringLayer.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2B8))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.mirroringLayer.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2C0))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.deviceSpinner.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2C8))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.deviceSpinner.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2D0))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.deviceSpinner.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2D8))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.watchStingButton.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x310))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.watchStingButton.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x318))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.watchStingButton.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x320))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.makeViewAccessible(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x328))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.addScreenSubLayer(layer:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x330))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.normalizedScreenPoint(normalizedPoint:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x338))();
}

uint64_t dispatch thunk of AXTwiceCompanionWatchView.updateCrownAXActions(isGizmoSystemStateLocked:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x340))();
}

void sub_21EC6F34C()
{
  _BYTE *v0;
  _BYTE *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  char v7;
  uint64_t v8;

  v1 = v0;
  v2 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_isCrownOrientationOnRightSide;
  v1[v2] = AXIsCrownOrientationOnRightSide();
  *(_QWORD *)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_leftPadding] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_leftConstraint] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_rightPadding] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_rightContraint] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_deviceChromeView] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchCrownButtonTopConstraint] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchCrownButtonHorizontalConstraint] = 0;
  v3 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchCrownButton;
  *(_QWORD *)&v1[v3] = sub_21EC6A2F4();
  *(_QWORD *)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_swipeUpCrownGesture] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_swipeDownCrownGesture] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchSideButtonTopConstraint] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchSideButtonHorizontalConstraint] = 0;
  v4 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchSideButton;
  *(_QWORD *)&v1[v4] = sub_21EC6AB6C(0xD00000000000001ALL, 0x800000021EC7F660, (void (*)(uint64_t, uint64_t))MEMORY[0x24BDFF3D0]);
  *(_QWORD *)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchRendererViewLeftConstraint] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchRendererViewRightConstraint] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_rendererView] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_mirroringLayer] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView____lazy_storage___deviceSpinner] = 0;
  v5 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_hasStingSupport;
  sub_21EC7CF98();
  v6 = (void *)sub_21EC7CF38();
  v7 = MEMORY[0x2207BA028]();

  v1[v5] = v7 & 1;
  *(_QWORD *)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchStingButtonTopConstraint] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchStingButtonHorizontalConstraint] = 0;
  v8 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchStingButton;
  *(_QWORD *)&v1[v8] = sub_21EC6AB6C(0xD00000000000001BLL, 0x800000021EC7F640, (void (*)(uint64_t, uint64_t))MEMORY[0x24BDFF3F8]);

  sub_21EC7D28C();
  __break(1u);
}

void sub_21EC6F540(void *a1, uint64_t a2, SEL *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  id v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  uint8_t *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint8_t *v38;
  NSObject *v39;
  uint64_t v40;
  SEL *v41;
  uint8_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  CGPoint v46;
  CGRect v47;

  v6 = sub_21EC7D004();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v38 - v11;
  if (objc_msgSend(a1, sel_state) == (id)2)
  {
    v13 = objc_msgSend(a1, sel_view);
    if (v13)
    {
      v14 = v13;
      objc_msgSend(v13, sel_bounds);
      v16 = v15;
      v18 = v17;
      v20 = v19;
      v22 = v21;
      objc_msgSend(a1, sel_locationInView_, v14);
      v46.x = v23;
      v46.y = v24;
      v47.origin.x = v16;
      v47.origin.y = v18;
      v47.size.width = v20;
      v47.size.height = v22;
      if (CGRectContainsPoint(v47, v46))
      {

      }
      else
      {
        v43 = a2;
        sub_21EC7CD94();
        v25 = sub_21EC7CFF8();
        v26 = sub_21EC7D148();
        if (os_log_type_enabled(v25, v26))
        {
          v42 = (uint8_t *)swift_slowAlloc();
          v27 = swift_slowAlloc();
          v39 = v25;
          v40 = v27;
          v45 = v27;
          v41 = a3;
          v28 = v42;
          *(_DWORD *)v42 = 136315138;
          v38 = v28 + 4;
          v44 = sub_21EC68898(0xD000000000000029, 0x800000021EC7F490, &v45);
          a3 = v41;
          sub_21EC7D1B4();
          v29 = v26;
          v30 = v42;
          _os_log_impl(&dword_21EC60000, v25, v29, "[TWICE] %s. Gesture is out of its bounds. Cancel the gesture!", v42, 0xCu);
          v31 = v40;
          swift_arrayDestroy();
          MEMORY[0x2207BA9A0](v31, -1, -1);
          MEMORY[0x2207BA9A0](v30, -1, -1);

        }
        else
        {

        }
        (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
        objc_msgSend(a1, sel_setState_, 5);

        a2 = v43;
      }
    }
  }
  if (objc_msgSend(a1, sel_state) == (id)3)
  {
    sub_21EC7CD94();
    v32 = sub_21EC7CFF8();
    v33 = sub_21EC7D148();
    if (os_log_type_enabled(v32, v33))
    {
      v34 = (uint8_t *)swift_slowAlloc();
      v35 = swift_slowAlloc();
      v43 = a2;
      v36 = v35;
      v45 = v35;
      *(_DWORD *)v34 = 136315138;
      v44 = sub_21EC68898(0xD000000000000029, 0x800000021EC7F490, &v45);
      sub_21EC7D1B4();
      _os_log_impl(&dword_21EC60000, v32, v33, "[TWICE] %s", v34, 0xCu);
      swift_arrayDestroy();
      v37 = v36;
      a2 = v43;
      MEMORY[0x2207BA9A0](v37, -1, -1);
      MEMORY[0x2207BA9A0](v34, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    sub_21EC6DF48(a2, a3);
  }
}

id sub_21EC6F918(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  id v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  id result;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint8_t *v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  CGPoint v40;
  CGRect v41;

  v4 = sub_21EC7D004();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v34 - v9;
  if (objc_msgSend(a1, sel_state) == (id)2)
  {
    v11 = objc_msgSend(a1, sel_view);
    if (v11)
    {
      v12 = v11;
      objc_msgSend(v11, sel_bounds);
      v14 = v13;
      v16 = v15;
      v18 = v17;
      v20 = v19;
      objc_msgSend(a1, sel_locationInView_, v12);
      v40.x = v21;
      v40.y = v22;
      v41.origin.x = v14;
      v41.origin.y = v16;
      v41.size.width = v18;
      v41.size.height = v20;
      if (!CGRectContainsPoint(v41, v40))
      {
        sub_21EC7CD94();
        v23 = sub_21EC7CFF8();
        v24 = sub_21EC7D148();
        if (os_log_type_enabled(v23, v24))
        {
          v36 = (uint8_t *)swift_slowAlloc();
          v35 = swift_slowAlloc();
          v39 = v35;
          v37 = v23;
          v25 = v36;
          *(_DWORD *)v36 = 136315138;
          v34 = v25 + 4;
          v38 = sub_21EC68898(0xD000000000000029, 0x800000021EC7F490, &v39);
          sub_21EC7D1B4();
          v26 = v24;
          v27 = v36;
          _os_log_impl(&dword_21EC60000, v37, v26, "[TWICE] %s. Gesture is out of its bounds. Cancel the gesture!", v36, 0xCu);
          v28 = v35;
          swift_arrayDestroy();
          MEMORY[0x2207BA9A0](v28, -1, -1);
          MEMORY[0x2207BA9A0](v27, -1, -1);

        }
        else
        {

        }
        (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
        objc_msgSend(a1, sel_setState_, 5);
      }

    }
  }
  result = objc_msgSend(a1, sel_state);
  if (result == (id)3)
  {
    sub_21EC7CD94();
    v30 = sub_21EC7CFF8();
    v31 = sub_21EC7D148();
    if (os_log_type_enabled(v30, v31))
    {
      v32 = (uint8_t *)swift_slowAlloc();
      v33 = swift_slowAlloc();
      v39 = v33;
      *(_DWORD *)v32 = 136315138;
      v38 = sub_21EC68898(0xD000000000000029, 0x800000021EC7F490, &v39);
      sub_21EC7D1B4();
      _os_log_impl(&dword_21EC60000, v30, v31, "[TWICE] %s", v32, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2207BA9A0](v33, -1, -1);
      MEMORY[0x2207BA9A0](v32, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    return (id)(*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  }
  return result;
}

void *sub_21EC6FCC4(uint64_t a1, unint64_t a2, SEL *a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint8_t *v17;
  _QWORD *v18;
  void *result;
  SEL *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23[3];

  v7 = v3;
  v8 = sub_21EC7D004();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21EC7CD94();
  v12 = sub_21EC7CFF8();
  v13 = sub_21EC7D148();
  if (os_log_type_enabled(v12, v13))
  {
    v20 = a3;
    v14 = swift_slowAlloc();
    v21 = v7;
    v15 = (uint8_t *)v14;
    v16 = swift_slowAlloc();
    v23[0] = v16;
    *(_DWORD *)v15 = 136315138;
    v22 = sub_21EC68898(a1, a2, v23);
    a3 = v20;
    sub_21EC7D1B4();
    _os_log_impl(&dword_21EC60000, v12, v13, "[TWICE] %s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207BA9A0](v16, -1, -1);
    v17 = v15;
    v7 = v21;
    MEMORY[0x2207BA9A0](v17, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v18 = (_QWORD *)(v7 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_rendererView);
  result = (void *)swift_beginAccess();
  if (*v18)
  {
    result = (void *)MEMORY[0x2207BA9E8](*v18 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI28AXTwiceCompanionRendererView_delegate);
    if (result)
    {
      objc_msgSend(result, *a3);
      return (void *)swift_unknownObjectRelease();
    }
  }
  return result;
}

uint64_t sub_21EC6FEB0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  id *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14[3];

  v1 = v0;
  v2 = sub_21EC7D004();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v14[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21EC7CD94();
  v6 = sub_21EC7CFF8();
  v7 = sub_21EC7D148();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v14[0] = v9;
    *(_DWORD *)v8 = 136315138;
    v13 = sub_21EC68898(0xD00000000000001BLL, 0x800000021EC7F3A0, v14);
    sub_21EC7D1B4();
    _os_log_impl(&dword_21EC60000, v6, v7, "[TWICE] %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207BA9A0](v9, -1, -1);
    MEMORY[0x2207BA9A0](v8, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v10 = (id *)(v1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_watchCrownButton);
  swift_beginAccess();
  objc_msgSend(*v10, sel_setAccessibilityTraits_, *MEMORY[0x24BEBDEF8]);
  LODWORD(v10) = *MEMORY[0x24BEBDDB0];
  v11 = (void *)sub_21EC7D094();
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v10, v11);

  return 1;
}

uint64_t sub_21EC700C4(uint64_t a1, unint64_t a2, SEL *a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint8_t *v17;
  _QWORD *v18;
  void *v19;
  SEL *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24[3];

  v7 = v3;
  v8 = sub_21EC7D004();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21EC7CD94();
  v12 = sub_21EC7CFF8();
  v13 = sub_21EC7D148();
  if (os_log_type_enabled(v12, v13))
  {
    v21 = a3;
    v14 = swift_slowAlloc();
    v22 = v7;
    v15 = (uint8_t *)v14;
    v16 = swift_slowAlloc();
    v24[0] = v16;
    *(_DWORD *)v15 = 136315138;
    v23 = sub_21EC68898(a1, a2, v24);
    a3 = v21;
    sub_21EC7D1B4();
    _os_log_impl(&dword_21EC60000, v12, v13, "[TWICE] %s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207BA9A0](v16, -1, -1);
    v17 = v15;
    v7 = v22;
    MEMORY[0x2207BA9A0](v17, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v18 = (_QWORD *)(v7 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_rendererView);
  swift_beginAccess();
  if (*v18)
  {
    v19 = (void *)MEMORY[0x2207BA9E8](*v18 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI28AXTwiceCompanionRendererView_delegate);
    if (v19)
    {
      objc_msgSend(v19, *a3);
      swift_unknownObjectRelease();
    }
  }
  return 1;
}

void sub_21EC702B4(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  int v7;
  char *v8;
  char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;

  v2 = sub_21EC7D004();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v6 = a1;
    v7 = AXIsCrownOrientationOnRightSide();
    v8 = &v6[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_isCrownOrientationOnRightSide];
    swift_beginAccess();
    if (v7 != *v8)
    {
      sub_21EC7CD94();
      v9 = v6;
      v10 = sub_21EC7CFF8();
      v11 = sub_21EC7D148();
      if (os_log_type_enabled(v10, v11))
      {
        v12 = swift_slowAlloc();
        v15 = swift_slowAlloc();
        v18 = v15;
        *(_DWORD *)v12 = 136315650;
        v16 = v9;
        v17 = sub_21EC68898(0xD000000000000026, 0x800000021EC7F750, &v18);
        sub_21EC7D1B4();
        *(_WORD *)(v12 + 12) = 1024;
        LODWORD(v17) = *v8;
        sub_21EC7D1B4();

        *(_WORD *)(v12 + 18) = 1024;
        LODWORD(v17) = v7;
        sub_21EC7D1B4();
        _os_log_impl(&dword_21EC60000, v10, v11, "[TWICE] %s %{BOOL}d %{BOOL}d", (uint8_t *)v12, 0x18u);
        v13 = v15;
        swift_arrayDestroy();
        MEMORY[0x2207BA9A0](v13, -1, -1);
        MEMORY[0x2207BA9A0](v12, -1, -1);

      }
      else
      {

      }
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      *v8 = v7;
      sub_21EC6E4E0(0.1);
    }

  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_21EC70508()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_21EC7052C()
{
  uint64_t v0;

  return sub_21EC6E7D8(*(_BYTE **)(v0 + 16));
}

void sub_21EC7053C()
{
  if (*MEMORY[0x24BED26E0])
    qword_255481ED0 = *MEMORY[0x24BED26E0];
  else
    __break(1u);
}

id sub_21EC7055C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  id v5;

  v1 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController____lazy_storage___airplayReceiver;
  v2 = *(void **)(v0
                + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController____lazy_storage___airplayReceiver);
  v3 = v2;
  if (v2 == (void *)1)
  {
    v3 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
    objc_msgSend(v3, sel_setDelegate_, v0);
    v4 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v3;
    v5 = v3;
    sub_21EC7C8B0(v4);
  }
  sub_21EC7C8C0(v2);
  return v3;
}

double sub_21EC705F0()
{
  uint64_t v0;
  _BYTE *v1;
  double result;

  v1 = (_BYTE *)(v0
               + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController____lazy_storage___distanceHIDThreshold);
  if ((*(_BYTE *)(v0
                 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController____lazy_storage___distanceHIDThreshold
                 + 8) & 1) == 0)
    return *(double *)v1;
  result = sub_21EC7BF40();
  *(double *)v1 = result;
  v1[8] = 0;
  return result;
}

id sub_21EC70630()
{
  char *v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  char *v9;
  void *v10;
  id v11;
  _QWORD v13[6];

  v1 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController____lazy_storage___eventProcessor;
  v2 = *(void **)&v0[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController____lazy_storage___eventProcessor];
  v3 = v2;
  if (v2 == (void *)1)
  {
    v4 = objc_allocWithZone(MEMORY[0x24BE00618]);
    v5 = (void *)sub_21EC7D094();
    v3 = objc_msgSend(v4, sel_initWithHIDTapIdentifier_HIDEventTapPriority_systemEventTapIdentifier_systemEventTapPriority_, v5, 70, 0, 30);

    if (v3)
    {
      objc_msgSend(v3, sel_setHIDEventFilterMask_, 33);
      v6 = swift_allocObject();
      *(_QWORD *)(v6 + 16) = v0;
      v13[4] = sub_21EC7C8D0;
      v13[5] = v6;
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 1107296256;
      v13[2] = sub_21EC714B4;
      v13[3] = &block_descriptor_15;
      v7 = _Block_copy(v13);
      v8 = v3;
      v9 = v0;
      swift_release();
      objc_msgSend(v8, sel_setHIDEventHandler_, v7);
      _Block_release(v7);

    }
    v10 = *(void **)&v0[v1];
    *(_QWORD *)&v0[v1] = v3;
    v11 = v3;
    sub_21EC7C8B0(v10);
  }
  sub_21EC7C8C0(v2);
  return v3;
}

void AXTwiceCompanionRootViewController.handleHIDEvent(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject **v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint8_t *v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  void (*isa)(char *, unint64_t);
  char *v30;
  void *v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  NSObject *v35;
  NSObject *v36;
  os_log_type_t v37;
  _BOOL4 v38;
  NSObject **v39;
  uint8_t *v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  uint64_t v46;
  id v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t ObjectType;
  uint64_t v52;
  double v53;
  double v54;
  char v55;
  uint64_t v56;
  __objc2_meth_list **p_base_meths;
  __objc2_meth_list **v58;
  char *v59;
  unint64_t v60;
  int v61;
  double v62;
  double v63;
  id v64;
  void *v65;
  unsigned int v66;
  BOOL v67;
  double v68;
  double v69;
  double v70;
  double v71;
  uint8_t *v72;
  NSObject *v73;
  os_log_type_t v74;
  uint64_t v75;
  NSObject *v76;
  NSObject *v77;
  os_log_type_t v78;
  uint8_t *v79;
  NSObject *v80;
  unint64_t v81;
  NSObject *v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  id v88;
  void *v89;
  double v90;
  double v91;
  unsigned int v92;
  NSObject *v93;
  NSObject *v94;
  os_log_type_t v95;
  uint8_t *v96;
  uint64_t v97;
  id v98;
  uint64_t v99;
  unint64_t v100;
  unint64_t v101;
  uint64_t v102;
  uint64_t v103;
  id v104;
  id v105;
  void *v106;
  id v107;
  unint64_t v108;
  uint64_t v109;
  uint64_t v110;
  unint64_t v111;
  id v112;
  id v113;
  void *v114;
  id v115;
  char *v116;
  double v117;
  double v118;
  double v119;
  double v120;
  char *v121;
  void *v122;
  void *v123;
  id v124;
  double v125;
  CGFloat v126;
  double v127;
  CGFloat v128;
  double v129;
  CGFloat v130;
  double v131;
  CGFloat v132;
  CGFloat v133;
  id v134;
  double v135;
  CGFloat v136;
  double v137;
  CGFloat v138;
  double v139;
  CGFloat v140;
  double v141;
  CGFloat v142;
  CGFloat v143;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  unint64_t v148;
  NSObject *v149;
  NSObject **v150;
  NSObject *v151;
  NSObject *v152;
  uint64_t v153;
  uint8_t *v154;
  NSObject **v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  NSObject *v160;
  unint64_t v161;
  uint64_t v162;
  double v163[4];
  CGPoint v164;
  CGRect v165;
  CGRect v166;
  CGRect v167;
  CGRect v168;
  CGRect v169;

  v159 = a1;
  v1 = sub_21EC7CFC8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (NSObject **)((char *)&v153 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = sub_21EC7D004();
  v160 = *(NSObject **)(v5 - 8);
  v161 = v5;
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v153 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)&v153 - v10;
  v12 = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)&v153 - v13;
  v15 = MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)&v153 - v16;
  v18 = MEMORY[0x24BDAC7A8](v15);
  v20 = (char *)&v153 - v19;
  v21 = MEMORY[0x24BDAC7A8](v18);
  v23 = (char *)&v153 - v22;
  MEMORY[0x24BDAC7A8](v21);
  v25 = (uint8_t *)&v153 - v24;
  if (_AXSVoiceOverTouchEnabled())
  {
    sub_21EC7CD94();
    v26 = sub_21EC7CFF8();
    v27 = sub_21EC7D130();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v28 = 0;
      _os_log_impl(&dword_21EC60000, v26, v27, "[TWICE] VoiceOver is on. Not going to process the hid event.", v28, 2u);
      MEMORY[0x2207BA9A0](v28, -1, -1);
    }

    isa = (void (*)(char *, unint64_t))v160[1].isa;
    v30 = v8;
LABEL_9:
    isa(v30, v161);
    return;
  }
  v31 = (void *)v159;
  v154 = v25;
  v155 = v4;
  v156 = v1;
  v157 = v2;
  if (_AXSAssistiveTouchScannerEnabled())
  {
    sub_21EC7CD94();
    v32 = sub_21EC7CFF8();
    v33 = sub_21EC7D130();
    if (os_log_type_enabled(v32, v33))
    {
      v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v34 = 0;
      _os_log_impl(&dword_21EC60000, v32, v33, "[TWICE] Switch Control is on. Not going to process the hid event.", v34, 2u);
      MEMORY[0x2207BA9A0](v34, -1, -1);
    }

    isa = (void (*)(char *, unint64_t))v160[1].isa;
    v30 = v11;
    goto LABEL_9;
  }
  if (!v31)
  {
    sub_21EC7CD94();
    v43 = sub_21EC7CFF8();
    v44 = sub_21EC7D13C();
    if (os_log_type_enabled(v43, v44))
    {
      v45 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v45 = 0;
      _os_log_impl(&dword_21EC60000, v43, v44, "[TWICE] invalid HID event", v45, 2u);
      MEMORY[0x2207BA9A0](v45, -1, -1);
    }

    isa = (void (*)(char *, unint64_t))v160[1].isa;
    v30 = v14;
    goto LABEL_9;
  }
  v35 = v31;
  -[NSObject type](v35, sel_type);
  if ((AXEventTypeIsHomeButtonPress() & 1) == 0)
  {
    v46 = v158;
    v159 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_mainVC;
    v47 = *(id *)(v158 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_mainVC);
    v48 = sub_21EC63D24();
    v50 = v49;

    ObjectType = swift_getObjectType();
    -[NSObject location](v35, sel_location);
    *(double *)&v52 = COERCE_DOUBLE((*(uint64_t (**)(uint64_t, uint64_t))(v50 + 208))(ObjectType, v50));
    v54 = v53;
    LOBYTE(v47) = v55;

    if ((v47 & 1) != 0)
    {
      sub_21EC7CD94();
      v77 = sub_21EC7CFF8();
      v78 = sub_21EC7D130();
      if (os_log_type_enabled(v77, v78))
      {
        v79 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v79 = 0;
        _os_log_impl(&dword_21EC60000, v77, v78, "[TWICE] hid location is not inside device screen", v79, 2u);
        MEMORY[0x2207BA9A0](v79, -1, -1);
        v80 = v35;
      }
      else
      {
        v80 = v77;
        v77 = v35;
      }
      v82 = v160;
      v81 = v161;

      ((void (*)(char *, unint64_t))v82[1].isa)(v20, v81);
      return;
    }
    if (-[NSObject type](v35, sel_type) != 3001)
    {

      return;
    }
    v56 = v46 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_lastHIDEvent;
    p_base_meths = &AXTwiceWatchCrownButton.base_meths;
    v58 = &AXTwiceWatchCrownButton.base_meths;
    v59 = v23;
    if ((*(_BYTE *)(v46 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_lastHIDEvent + 28) & 1) == 0)
    {
      v60 = *(_QWORD *)v56;
      v61 = *(_DWORD *)(v56 + 24);
      v63 = *(double *)(v56 + 8);
      v62 = *(double *)(v56 + 16);
      v64 = -[NSObject handInfo](v35, sel_handInfo);
      if (!v64)
      {
LABEL_64:
        __break(1u);
        return;
      }
      v65 = v64;
      v66 = objc_msgSend(v64, sel_eventType);

      v67 = v61 == v66;
      v58 = (__objc2_meth_list **)(&AXTwiceWatchCrownButton + 32);
      p_base_meths = &AXTwiceWatchCrownButton.base_meths;
      if (v67)
      {
        v68 = sub_21EC7C074(v60, (unint64_t)-[NSObject HIDTime](v35, sel_HIDTime));
        -[NSObject location](v35, sel_location);
        if (v68 != -1.0 && v68 < 60.0)
        {
          v71 = sqrt((v63 - v69) * (v63 - v69) + (v62 - v70) * (v62 - v70));
          p_base_meths = (__objc2_meth_list **)(&AXTwiceWatchCrownButton + 32);
          if (v71 < sub_21EC705F0())
          {
            v72 = v154;
            sub_21EC7CD94();
            v73 = sub_21EC7CFF8();
            v74 = sub_21EC7D130();
            if (os_log_type_enabled(v73, v74))
            {
              v75 = swift_slowAlloc();
              *(_DWORD *)v75 = 134218240;
              v163[0] = v68;
              sub_21EC7D1B4();
              *(_WORD *)(v75 + 12) = 2048;
              v163[0] = v71;
              sub_21EC7D1B4();
              _os_log_impl(&dword_21EC60000, v73, v74, "[TWICE] Skip event interval:%f distance:%f", (uint8_t *)v75, 0x16u);
              MEMORY[0x2207BA9A0](v75, -1, -1);
              v76 = v35;
            }
            else
            {
              v76 = v73;
              v73 = v35;
            }
            v149 = v160;
            v148 = v161;

            ((void (*)(uint8_t *, unint64_t))v149[1].isa)(v72, v148);
            return;
          }
        }
      }
    }
    v83 = objc_msgSend(v35, (SEL)p_base_meths[434]);
    -[NSObject location](v35, sel_location);
    v85 = v84;
    v87 = v86;
    v88 = objc_msgSend(v35, (SEL)v58[435]);
    if (!v88)
      goto LABEL_61;
    v89 = v88;
    v90 = *(double *)&v52;
    v91 = v54;
    v92 = objc_msgSend(v88, sel_eventType);

    *(_QWORD *)v56 = v83;
    *(_QWORD *)(v56 + 8) = v85;
    *(_QWORD *)(v56 + 16) = v87;
    *(_DWORD *)(v56 + 24) = v92;
    *(_BYTE *)(v56 + 28) = 0;
    sub_21EC7CD94();
    v93 = v35;
    v94 = sub_21EC7CFF8();
    v95 = sub_21EC7D130();
    if (os_log_type_enabled(v94, v95))
    {
      v96 = (uint8_t *)swift_slowAlloc();
      *(double *)&v97 = COERCE_DOUBLE(swift_slowAlloc());
      v163[0] = *(double *)&v97;
      *(_DWORD *)v96 = 136315138;
      v154 = v96 + 4;
      v98 = -[NSObject description](v93, sel_description);
      v99 = sub_21EC7D0A0();
      v101 = v100;

      v162 = sub_21EC68898(v99, v101, (uint64_t *)v163);
      sub_21EC7D1B4();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21EC60000, v94, v95, "[TWICE] handleHIDEvent %s", v96, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2207BA9A0](v97, -1, -1);
      MEMORY[0x2207BA9A0](v96, -1, -1);

    }
    else
    {

    }
    ((void (*)(char *, unint64_t))v160[1].isa)(v59, v161);
    v102 = v156;
    v103 = v157;
    -[NSObject setLocation:](v93, sel_setLocation_, v90, v91);
    v104 = -[NSObject handInfo](v93, sel_handInfo);
    objc_msgSend(v104, sel_setHandPosition_, v90, v91);

    v105 = -[NSObject handInfo](v93, sel_handInfo);
    if (!v105)
      goto LABEL_62;
    v106 = v105;
    v107 = objc_msgSend(v105, sel_paths);

    if (!v107)
    {
LABEL_63:
      __break(1u);
      goto LABEL_64;
    }
    v160 = v93;
    sub_21EC66B28(0, &qword_255481B10);
    v108 = sub_21EC7D0F4();

    if (v108 >> 62)
    {
      swift_bridgeObjectRetain();
      v109 = sub_21EC7D298();
      swift_bridgeObjectRelease();
      if (v109)
        goto LABEL_42;
    }
    else
    {
      v109 = *(_QWORD *)((v108 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v109)
      {
LABEL_42:
        if (v109 >= 1)
        {
          v110 = 0;
          v111 = v108 & 0xC000000000000001;
          v161 = v108;
          while (1)
          {
            if (v111)
              v113 = (id)MEMORY[0x2207BA2BC](v110, v108);
            else
              v113 = *(id *)(v108 + 8 * v110 + 32);
            v114 = v113;
            v115 = *(id *)(v158 + v159);
            v116 = (char *)sub_21EC63BE8();

            objc_msgSend(v114, sel_pathLocation);
            v118 = v117;
            v120 = v119;
            v121 = &v116[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_rendererView];
            swift_beginAccess();
            if (*(_QWORD *)v121)
            {
              v122 = *(void **)(*(_QWORD *)v121
                              + OBJC_IVAR____TtC21AXWatchRemoteScreenUI28AXTwiceCompanionRendererView_mirroringLayer);
              if (v122)
              {
                v123 = (void *)objc_opt_self();
                v112 = v122;
                v124 = objc_msgSend(v123, sel_mainScreen);
                objc_msgSend(v124, sel_bounds);
                v126 = v125;
                v128 = v127;
                v130 = v129;
                v132 = v131;

                v165.origin.x = v126;
                v165.origin.y = v128;
                v165.size.width = v130;
                v165.size.height = v132;
                v133 = v118 * CGRectGetWidth(v165);
                v134 = objc_msgSend(v123, sel_mainScreen);
                objc_msgSend(v134, sel_bounds);
                v136 = v135;
                v138 = v137;
                v140 = v139;
                v142 = v141;

                v166.origin.x = v136;
                v166.origin.y = v138;
                v166.size.width = v140;
                v166.size.height = v142;
                v143 = v120 * CGRectGetHeight(v166);
                objc_msgSend(v112, sel_bounds);
                objc_msgSend(v112, sel_convertRect_toLayer_, 0);
                x = v167.origin.x;
                y = v167.origin.y;
                width = v167.size.width;
                height = v167.size.height;
                v164.x = v133;
                v164.y = v143;
                if (CGRectContainsPoint(v167, v164))
                {
                  v168.origin.x = x;
                  v168.origin.y = y;
                  v168.size.width = width;
                  v168.size.height = height;
                  CGRectGetWidth(v168);
                  v169.origin.x = x;
                  v169.origin.y = y;
                  v169.size.width = width;
                  v169.size.height = height;
                  CGRectGetHeight(v169);

                  swift_beginAccess();
                  v102 = v156;
                  v108 = v161;
                  goto LABEL_46;
                }

                v102 = v156;
                v108 = v161;
              }
              else
              {
                v112 = v116;
                v102 = v156;
              }
            }
            else
            {
              v112 = v116;
            }

            objc_msgSend(v114, sel_pathLocation);
LABEL_46:
            ++v110;
            objc_msgSend(v114, sel_setPathLocation_);

            v103 = v157;
            if (v109 == v110)
              goto LABEL_59;
          }
        }
        __break(1u);
LABEL_61:
        __break(1u);
LABEL_62:
        __break(1u);
        goto LABEL_63;
      }
    }
LABEL_59:
    swift_bridgeObjectRelease();
    v150 = v155;
    v151 = v160;
    *v155 = v160;
    (*(void (**)(NSObject **, _QWORD, uint64_t))(v103 + 104))(v150, *MEMORY[0x24BDFF470], v102);
    v152 = v151;
    sub_21EC71C4C(v150);

    (*(void (**)(NSObject **, uint64_t))(v103 + 8))(v150, v102);
    return;
  }
  sub_21EC7CD94();
  v36 = sub_21EC7CFF8();
  v37 = sub_21EC7D148();
  v38 = os_log_type_enabled(v36, v37);
  v39 = v155;
  if (v38)
  {
    v40 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v40 = 0;
    _os_log_impl(&dword_21EC60000, v36, v37, "[TWICE] Home Button Pressed. Dismiss this view.", v40, 2u);
    MEMORY[0x2207BA9A0](v40, -1, -1);
  }

  ((void (*)(char *, unint64_t))v160[1].isa)(v17, v161);
  v41 = v156;
  v42 = v157;
  (*(void (**)(NSObject **, _QWORD, uint64_t))(v157 + 104))(v39, *MEMORY[0x24BDFF4C8], v156);
  sub_21EC71C4C(v39);

  (*(void (**)(NSObject **, uint64_t))(v42 + 8))(v39, v41);
}

uint64_t sub_21EC714B4(uint64_t a1, void *a2)
{
  uint64_t (*v3)(void *);
  id v4;

  v3 = *(uint64_t (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  LOBYTE(a2) = v3(a2);
  swift_release();

  return a2 & 1;
}

uint64_t sub_21EC71508()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  char *v22;
  void (*v23)(char *, char *, uint64_t);
  id v24;
  void (*v25)(char *, uint64_t);
  void *v26;
  id v27;
  uint8_t *v29;
  uint64_t v30;
  uint8_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35[3];

  v1 = sub_21EC7CFE0();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_21EC7D004();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21EC7CD94();
  v9 = v0;
  v10 = sub_21EC7CFF8();
  v11 = sub_21EC7D148();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    v32 = swift_slowAlloc();
    v35[0] = v32;
    v33 = v6;
    v31 = v12;
    *(_DWORD *)v12 = 136315138;
    v29 = v12 + 4;
    v13 = &v9[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_currentState];
    swift_beginAccess();
    (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v4, v13, v1);
    sub_21EC66630(&qword_255481D00, (uint64_t (*)(uint64_t))MEMORY[0x24BDFF528], MEMORY[0x24BDFF548]);
    v14 = sub_21EC7D2D4();
    v30 = v5;
    v15 = v2;
    v17 = v16;
    (*(void (**)(char *, uint64_t))(v15 + 8))(v4, v1);
    v34 = sub_21EC68898(v14, v17, v35);
    sub_21EC7D1B4();

    v2 = v15;
    swift_bridgeObjectRelease();
    v18 = v31;
    _os_log_impl(&dword_21EC60000, v10, v11, "[TWICE] AXTwiceCompanionRootViewController State is %s", v31, 0xCu);
    v19 = v32;
    swift_arrayDestroy();
    MEMORY[0x2207BA9A0](v19, -1, -1);
    MEMORY[0x2207BA9A0](v18, -1, -1);

    (*(void (**)(char *, uint64_t))(v33 + 8))(v8, v30);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  v20 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_mainVC;
  v21 = *(void **)&v9[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_mainVC];
  v22 = &v9[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_currentState];
  swift_beginAccess();
  v23 = *(void (**)(char *, char *, uint64_t))(v2 + 16);
  v23(v4, v22, v1);
  v24 = v21;
  sub_21EC6520C((uint64_t)v4);

  v25 = *(void (**)(char *, uint64_t))(v2 + 8);
  v25(v4, v1);
  v26 = *(void **)&v9[v20];
  v23(v4, v22, v1);
  v27 = v26;
  sub_21EC65404((uint64_t)v4);

  return ((uint64_t (*)(char *, uint64_t))v25)(v4, v1);
}

void sub_21EC71828()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v1 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController____lazy_storage___inactiveTimer;
  v2 = *(void **)(v0
                + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController____lazy_storage___inactiveTimer);
  if (v2)
    goto LABEL_4;
  v3 = v0;
  sub_21EC66B28(0, (unint64_t *)&qword_255481B40);
  v4 = (void *)sub_21EC7D178();
  v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDFE490]), sel_initWithTargetSerialQueue_, v4);

  if (v5)
  {
    objc_msgSend(v5, sel_setAutomaticallyCancelPendingBlockUponSchedulingNewBlock_, 1);
    v6 = *(void **)(v3 + v1);
    *(_QWORD *)(v3 + v1) = v5;
    v5;

    v2 = 0;
LABEL_4:
    v7 = v2;
    return;
  }
  __break(1u);
}

void sub_21EC718E8()
{
  char *v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  char *v5;
  uint64_t v6;
  id *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t ObjectType;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  char *v19;
  id v20;
  _QWORD aBlock[6];
  objc_super v22;

  v22.receiver = v0;
  v22.super_class = (Class)type metadata accessor for AXTwiceCompanionRootViewController();
  objc_msgSendSuper2(&v22, sel_viewDidLoad);
  v1 = objc_msgSend(v0, sel_view);
  if (v1)
  {
    v2 = v1;
    v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 0.0, 0.6);
    objc_msgSend(v2, sel_setBackgroundColor_, v3);

    v4 = *(id *)&v0[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_remoteMessenger];
    v5 = v0;
    sub_21EC7CF14();

    v6 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_mainVC;
    objc_msgSend(*(id *)&v5[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_mainVC], sel_setModalPresentationStyle_, 4);
    v7 = (id *)(*(_QWORD *)&v5[v6]
              + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_dismissButton);
    swift_beginAccess();
    objc_msgSend(*v7, sel_addTarget_action_forControlEvents_, v5, sel_dismissButtonTappedWithSender_, 64);
    v8 = *(id *)&v5[v6];
    v9 = sub_21EC63D24();
    v11 = v10;

    ObjectType = swift_getObjectType();
    v13 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v11 + 152))(ObjectType, v11);

    if (v13)
    {
      swift_unknownObjectWeakAssign();

    }
    AXDeviceRemoteScreenIsBluetoothOn();
    v14 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
    if (qword_255481670 != -1)
      swift_once();
    v15 = qword_255481ED0;
    v16 = objc_msgSend((id)objc_opt_self(), sel_mainQueue);
    v17 = swift_allocObject();
    *(_QWORD *)(v17 + 16) = v5;
    aBlock[4] = sub_21EC7C18C;
    aBlock[5] = v17;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_21EC71EE0;
    aBlock[3] = &block_descriptor_3;
    v18 = _Block_copy(aBlock);
    v19 = v5;
    swift_release();
    v20 = objc_msgSend(v14, sel_addObserverForName_object_queue_usingBlock_, v15, 0, v16, v18);
    _Block_release(v18);
    swift_unknownObjectRelease();

  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_21EC71BB8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v0 = sub_21EC7CFC8();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BDFF498], v0);
  sub_21EC71C4C((uint64_t)v3);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_21EC71C4C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v19[2];
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD aBlock[6];

  v2 = v1;
  v4 = sub_21EC7D01C();
  v22 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_21EC7D040();
  v20 = *(_QWORD *)(v7 - 8);
  v21 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_21EC7CFC8();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19[1] = *(_QWORD *)(v2 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_eventSerialQueue);
  v14 = swift_allocObject();
  swift_unknownObjectWeakInit();
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a1, v10);
  v15 = (*(unsigned __int8 *)(v11 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = v14;
  (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v16 + v15, v13, v10);
  aBlock[4] = sub_21EC7CA10;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21EC65AAC;
  aBlock[3] = &block_descriptor_30;
  v17 = _Block_copy(aBlock);
  swift_retain();
  sub_21EC7D028();
  v23 = MEMORY[0x24BEE4AF8];
  sub_21EC66630((unint64_t *)&qword_255481CD0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2554816C0);
  sub_21EC7C8FC((unint64_t *)&qword_255481CE0, &qword_2554816C0);
  sub_21EC7D1D8();
  MEMORY[0x2207BA220](0, v9, v6, v17);
  _Block_release(v17);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v6, v4);
  (*(void (**)(char *, uint64_t))(v20 + 8))(v9, v21);
  swift_release();
  return swift_release();
}

uint64_t sub_21EC71EE0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void (*v6)(char *);
  uint64_t v8;

  v2 = sub_21EC7CD40();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(void (**)(char *))(a1 + 32);
  sub_21EC7CD34();
  swift_retain();
  v6(v5);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

void sub_21EC71FB8(char a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  objc_class *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  char *v14;
  uint64_t v15;
  __CFString *v16;
  __CFNotificationCenter *v17;
  _QWORD aBlock[6];
  objc_super v19;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255481B20);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for AXTwiceCompanionRootViewController();
  v19.receiver = v1;
  v19.super_class = v6;
  objc_msgSendSuper2(&v19, sel_viewDidAppear_, a1 & 1);
  sub_21EC7CD7C();
  v7 = sub_21EC7CD88();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5, 0, 1, v7);
  v8 = (uint64_t)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_viewDidAppearDate];
  swift_beginAccess();
  sub_21EC7C1AC((uint64_t)v5, v8);
  swift_endAccess();
  v9 = &v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_lastHIDEvent];
  *((_QWORD *)v9 + 1) = 0;
  *((_QWORD *)v9 + 2) = 0;
  *(_QWORD *)v9 = 0;
  *((_DWORD *)v9 + 6) = 0;
  v9[28] = 1;
  v10 = *(void **)&v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_mainVC];
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v1;
  aBlock[4] = sub_21EC7C1F4;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21EC65AAC;
  aBlock[3] = &block_descriptor_6;
  v12 = _Block_copy(aBlock);
  v13 = v10;
  v14 = v1;
  swift_release();
  objc_msgSend(v14, sel_presentViewController_animated_completion_, v13, 1, v12);
  _Block_release(v12);

  v15 = AXkMobileKeyBagLockStatusNotificationID();
  if (v15)
  {
    v16 = (__CFString *)v15;
    v17 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v17, v14, (CFNotificationCallback)sub_21EC73120, v16, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

  }
}

uint64_t sub_21EC721B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v0 = sub_21EC7CFC8();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BDFF4C0], v0);
  sub_21EC71C4C((uint64_t)v3);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_21EC72284(char a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  objc_class *v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __CFNotificationCenter *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v34;
  void (*v35)(char *, uint64_t);
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43[3];
  objc_super v44;

  v2 = v1;
  v4 = sub_21EC7CD88();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v36 - v9;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_255481B20);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v41 = (char *)&v36 - v15;
  v16 = sub_21EC7D004();
  v40 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v36 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = (objc_class *)type metadata accessor for AXTwiceCompanionRootViewController();
  v44.receiver = v2;
  v44.super_class = v19;
  objc_msgSendSuper2(&v44, sel_viewDidDisappear_, a1 & 1);
  sub_21EC7CD94();
  v20 = sub_21EC7CFF8();
  v21 = sub_21EC7D148();
  if (os_log_type_enabled(v20, v21))
  {
    v38 = v5;
    v22 = swift_slowAlloc();
    v36 = v16;
    v23 = (uint8_t *)v22;
    v24 = swift_slowAlloc();
    v39 = v4;
    v25 = v24;
    v43[0] = v24;
    v37 = v2;
    *(_DWORD *)v23 = 136315138;
    v42 = sub_21EC68898(0xD000000000000015, 0x800000021EC7F800, v43);
    v2 = v37;
    v5 = v38;
    sub_21EC7D1B4();
    _os_log_impl(&dword_21EC60000, v20, v21, "[TWICE] %s", v23, 0xCu);
    swift_arrayDestroy();
    v26 = v25;
    v4 = v39;
    MEMORY[0x2207BA9A0](v26, -1, -1);
    MEMORY[0x2207BA9A0](v23, -1, -1);

    (*(void (**)(char *, uint64_t))(v40 + 8))(v18, v36);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v40 + 8))(v18, v16);
  }
  v27 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(v27, v2);

  sub_21EC71828();
  v29 = v28;
  objc_msgSend(v28, sel_cancel);

  v30 = (uint64_t)v41;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v41, 1, 1, v4);
  v31 = (uint64_t)v2 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_inactiveDate;
  swift_beginAccess();
  sub_21EC7C1AC(v30, v31);
  swift_endAccess();
  v32 = (uint64_t)v2 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_viewDidAppearDate;
  swift_beginAccess();
  sub_21EC7CA88(v32, (uint64_t)v14, &qword_255481B20);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v14, 1, v4) == 1)
    return sub_21EC7C230((uint64_t)v14, &qword_255481B20);
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v10, v14, v4);
  sub_21EC7CD7C();
  sub_21EC7CF98();
  v34 = (void *)sub_21EC7CF38();
  sub_21EC7CF74();

  v35 = *(void (**)(char *, uint64_t))(v5 + 8);
  v35(v8, v4);
  return ((uint64_t (*)(char *, uint64_t))v35)(v10, v4);
}

id AXTwiceCompanionRootViewController.__deallocating_deinit()
{
  char *v0;
  void *v1;
  id v2;
  id v3;
  objc_super v5;

  v1 = v0;
  v2 = *(id *)&v0[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_remoteMessenger];
  sub_21EC7CF08();

  v3 = sub_21EC7055C();
  objc_msgSend(v3, sel_cleanup);

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for AXTwiceCompanionRootViewController();
  return objc_msgSendSuper2(&v5, sel_dealloc);
}

id AXTwiceCompanionRootViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;
  id v7;

  v4 = v3;
  if (a2)
  {
    v6 = (void *)sub_21EC7D094();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

id AXTwiceCompanionRootViewController.init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  uint64_t v9;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v19;
  id v20;
  uint64_t v21;
  void *v22;
  objc_class *v23;
  void *v24;
  id v25;
  _QWORD v27[3];
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  objc_super v32;
  uint64_t v33;

  v30 = a2;
  v31 = a3;
  v27[0] = a1;
  v29 = sub_21EC7D16C();
  v4 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v6 = (char *)v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_21EC7D154();
  v8 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8](v7);
  v9 = sub_21EC7D040();
  MEMORY[0x24BDAC7A8](v9);
  v28 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_eventSerialQueue;
  v27[1] = sub_21EC66B28(0, (unint64_t *)&qword_255481B40);
  v10 = v3;
  sub_21EC7D034();
  v33 = MEMORY[0x24BEE4AF8];
  sub_21EC66630(&qword_255481B48, v8, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255481B50);
  sub_21EC7C8FC(&qword_255481B58, &qword_255481B50);
  sub_21EC7D1D8();
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BEE5750], v29);
  *(_QWORD *)(v27[2] + v28) = sub_21EC7D190();
  *(_QWORD *)&v10[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController____lazy_storage___airplayReceiver] = 1;
  v11 = &v10[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_lastHIDEvent];
  *((_QWORD *)v11 + 1) = 0;
  *((_QWORD *)v11 + 2) = 0;
  *(_QWORD *)v11 = 0;
  *((_DWORD *)v11 + 6) = 0;
  v11[28] = 1;
  *(_QWORD *)&v10[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_intervalHIDThreshold] = 0x404E000000000000;
  v12 = &v10[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController____lazy_storage___distanceHIDThreshold];
  *(_QWORD *)v12 = 0;
  v12[8] = 1;
  v13 = &v10[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_hidEventReason];
  *(_QWORD *)v13 = 0xD000000000000022;
  *((_QWORD *)v13 + 1) = 0x800000021EC7E1A0;
  *(_QWORD *)&v10[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController____lazy_storage___eventProcessor] = 1;
  *(_QWORD *)&v10[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_gizmoErrorRetryLimit] = 3;
  v14 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_remoteMessenger;
  sub_21EC7CF2C();
  *(_QWORD *)&v10[v14] = sub_21EC7CEF0();
  sub_21EC7CFB0();
  v15 = &v10[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_initialPingMessageIdentifier];
  *(_QWORD *)v15 = 0;
  *((_QWORD *)v15 + 1) = 0;
  v16 = &v10[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_inactiveDate];
  v17 = sub_21EC7CD88();
  v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56);
  v18(v16, 1, 1, v17);
  *(_QWORD *)&v10[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_inactiveTimeInterval] = 0x4072C00000000000;
  *(_QWORD *)&v10[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController____lazy_storage___inactiveTimer] = 0;
  v19 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_mainVC;
  type metadata accessor for AXTwiceCompanionMainViewController();
  v20 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  *(_QWORD *)&v10[v19] = objc_msgSend(v20, sel_init, v27[0]);
  v21 = v30;
  v18(&v10[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_viewDidAppearDate], 1, 1, v17);

  if (v21)
  {
    v22 = (void *)sub_21EC7D094();
    swift_bridgeObjectRelease();
  }
  else
  {
    v22 = 0;
  }
  v23 = (objc_class *)type metadata accessor for AXTwiceCompanionRootViewController();
  v32.receiver = v10;
  v32.super_class = v23;
  v24 = v31;
  v25 = objc_msgSendSuper2(&v32, sel_initWithNibName_bundle_, v22, v31);

  return v25;
}

id AXTwiceCompanionRootViewController.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id AXTwiceCompanionRootViewController.init(coder:)(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  objc_class *v18;
  void *v19;
  id v20;
  _QWORD v22[2];
  uint64_t v23;
  uint64_t v24;
  void *v25;
  objc_super v26;
  uint64_t v27;

  v25 = a1;
  v24 = sub_21EC7D16C();
  v2 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v4 = (char *)v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_21EC7D154();
  v6 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8](v5);
  v7 = sub_21EC7D040();
  MEMORY[0x24BDAC7A8](v7);
  v23 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_eventSerialQueue;
  v22[0] = sub_21EC66B28(0, (unint64_t *)&qword_255481B40);
  v8 = v1;
  sub_21EC7D034();
  v27 = MEMORY[0x24BEE4AF8];
  sub_21EC66630(&qword_255481B48, v6, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255481B50);
  sub_21EC7C8FC(&qword_255481B58, &qword_255481B50);
  sub_21EC7D1D8();
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x24BEE5750], v24);
  *(_QWORD *)(v22[1] + v23) = sub_21EC7D190();
  *(_QWORD *)&v8[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController____lazy_storage___airplayReceiver] = 1;
  v9 = &v8[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_lastHIDEvent];
  *((_QWORD *)v9 + 1) = 0;
  *((_QWORD *)v9 + 2) = 0;
  *(_QWORD *)v9 = 0;
  *((_DWORD *)v9 + 6) = 0;
  v9[28] = 1;
  *(_QWORD *)&v8[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_intervalHIDThreshold] = 0x404E000000000000;
  v10 = &v8[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController____lazy_storage___distanceHIDThreshold];
  *(_QWORD *)v10 = 0;
  v10[8] = 1;
  v11 = &v8[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_hidEventReason];
  *(_QWORD *)v11 = 0xD000000000000022;
  *((_QWORD *)v11 + 1) = 0x800000021EC7E1A0;
  *(_QWORD *)&v8[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController____lazy_storage___eventProcessor] = 1;
  *(_QWORD *)&v8[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_gizmoErrorRetryLimit] = 3;
  v12 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_remoteMessenger;
  sub_21EC7CF2C();
  *(_QWORD *)&v8[v12] = sub_21EC7CEF0();
  sub_21EC7CFB0();
  v13 = &v8[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_initialPingMessageIdentifier];
  *(_QWORD *)v13 = 0;
  *((_QWORD *)v13 + 1) = 0;
  v14 = &v8[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_inactiveDate];
  v15 = sub_21EC7CD88();
  v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56);
  v16(v14, 1, 1, v15);
  *(_QWORD *)&v8[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_inactiveTimeInterval] = 0x4072C00000000000;
  *(_QWORD *)&v8[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController____lazy_storage___inactiveTimer] = 0;
  v17 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_mainVC;
  type metadata accessor for AXTwiceCompanionMainViewController();
  *(_QWORD *)&v8[v17] = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  v16(&v8[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_viewDidAppearDate], 1, 1, v15);

  v18 = (objc_class *)type metadata accessor for AXTwiceCompanionRootViewController();
  v26.receiver = v8;
  v26.super_class = v18;
  v19 = v25;
  v20 = objc_msgSendSuper2(&v26, sel_initWithCoder_, v25);

  return v20;
}

void sub_21EC73120(uint64_t a1, void *a2)
{
  sub_21EC7C4C8(a2);
}

void sub_21EC73128()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD aBlock[6];

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_255481B20);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)aBlock - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21EC7CD7C();
  v4 = sub_21EC7CD88();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 0, 1, v4);
  v5 = v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_inactiveDate;
  swift_beginAccess();
  sub_21EC7C1AC((uint64_t)v3, v5);
  swift_endAccess();
  sub_21EC71828();
  v7 = v6;
  objc_msgSend(v6, sel_cancel);

  sub_21EC71828();
  v9 = v8;
  v10 = swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = sub_21EC7CB20;
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21EC65AAC;
  aBlock[3] = &block_descriptor_44;
  v11 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v9, sel_afterDelay_processBlock_, v11, 300.0);
  _Block_release(v11);

}

void sub_21EC732A4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x2207BA9E8](v1);
  if (v2)
  {
    v3 = (void *)v2;
    sub_21EC732F4();

  }
}

uint64_t sub_21EC732F4()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t *v27;
  void (*v28)(char *, uint64_t);
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v33;
  double v34;
  double v35;
  void (*v36)(char *, uint64_t);
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  NSObject *v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  void *v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  char *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59[3];

  v1 = v0;
  v2 = sub_21EC7CFC8();
  v53 = *(_QWORD *)(v2 - 8);
  v54 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v52 = (char *)&v48 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255481B20);
  MEMORY[0x24BDAC7A8](v4);
  v57 = (uint64_t)&v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_21EC7CD88();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v55 = (char *)&v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v48 - v10;
  v12 = sub_21EC7D004();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v48 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v14);
  v56 = (char *)&v48 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v48 - v19;
  sub_21EC7CD94();
  v21 = sub_21EC7CFF8();
  v22 = sub_21EC7D148();
  if (os_log_type_enabled(v21, v22))
  {
    v51 = v11;
    v23 = swift_slowAlloc();
    v49 = v7;
    v24 = (uint8_t *)v23;
    v25 = swift_slowAlloc();
    v48 = v13;
    v26 = v25;
    v59[0] = v25;
    v50 = v16;
    *(_DWORD *)v24 = 136315138;
    v58 = sub_21EC68898(0xD000000000000021, 0x800000021EC80050, v59);
    v16 = v50;
    v11 = v51;
    sub_21EC7D1B4();
    _os_log_impl(&dword_21EC60000, v21, v22, "[TWICE] %s", v24, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207BA9A0](v26, -1, -1);
    v27 = v24;
    v7 = v49;
    MEMORY[0x2207BA9A0](v27, -1, -1);

    v28 = *(void (**)(char *, uint64_t))(v48 + 8);
  }
  else
  {

    v28 = *(void (**)(char *, uint64_t))(v13 + 8);
  }
  v28(v20, v12);
  v29 = &v1[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_inactiveDate];
  swift_beginAccess();
  v30 = (uint64_t)v29;
  v31 = v57;
  sub_21EC7CA88(v30, v57, &qword_255481B20);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v31, 1, v6) == 1)
    return sub_21EC7C230(v31, &qword_255481B20);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 32))(v11, v31, v6);
  v33 = v55;
  sub_21EC7CD7C();
  sub_21EC7CD70();
  v35 = v34;
  v36 = *(void (**)(char *, uint64_t))(v7 + 8);
  v36(v33, v6);
  if (round(v35) >= 300.0)
  {
    sub_21EC7CD94();
    v40 = v1;
    v41 = sub_21EC7CFF8();
    v42 = sub_21EC7D148();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v43 = 134217984;
      v58 = 0x4072C00000000000;
      sub_21EC7D1B4();

      _os_log_impl(&dword_21EC60000, v41, v42, "[TWICE] Inactive for more than %fs. Dismiss the card.", v43, 0xCu);
      MEMORY[0x2207BA9A0](v43, -1, -1);
    }
    else
    {

      v41 = v40;
    }

    v28(v56, v12);
    sub_21EC7CF98();
    v44 = (void *)sub_21EC7CF38();
    sub_21EC7CF68();

    v46 = v52;
    v45 = v53;
    v47 = v54;
    (*(void (**)(char *, _QWORD, uint64_t))(v53 + 104))(v52, *MEMORY[0x24BDFF4C8], v54);
    sub_21EC71C4C(v46);
    (*(void (**)(char *, uint64_t))(v45 + 8))(v46, v47);
  }
  else
  {
    sub_21EC7CD94();
    v37 = sub_21EC7CFF8();
    v38 = sub_21EC7D148();
    if (os_log_type_enabled(v37, v38))
    {
      v39 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v39 = 134217984;
      v58 = *(_QWORD *)&v35;
      sub_21EC7D1B4();
      MEMORY[0x2207BA9A0](v39, -1, -1);
    }

    v28(v16, v12);
  }
  return ((uint64_t (*)(char *, uint64_t))v36)(v11, v6);
}

uint64_t sub_21EC73884(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  char *v36;
  char *v37;
  void (*v38)(char *, char *, uint64_t);
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  void (*v43)(char *, uint64_t);
  NSObject *v44;
  os_log_type_t v45;
  BOOL v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  unint64_t v50;
  void (*v51)(char *, uint64_t);
  uint64_t v52;
  NSObject *v53;
  os_log_type_t v54;
  uint8_t *v55;
  char *v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  unsigned int *v63;
  uint64_t v64;
  int v65;
  uint64_t v66;
  unsigned int (*v67)(unsigned int *, uint64_t);
  char *v68;
  uint64_t v69;
  unsigned int *v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  char *v75;
  void (*v76)(char *, uint64_t);
  char *v77;
  uint64_t v78;
  unsigned int v79;
  char *v80;
  NSObject *v81;
  os_log_type_t v82;
  uint8_t *v83;
  uint64_t v84;
  unsigned int v85;
  uint64_t v86;
  void *v87;
  uint64_t inited;
  id v89;
  uint64_t v90;
  BOOL v91;
  uint64_t v92;
  NSObject *v93;
  unsigned int v94;
  unsigned int v95;
  void *v96;
  unsigned int v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  id v101;
  id v102;
  char *v103;
  uint64_t v104;
  void (*v105)(char *, uint64_t);
  unint64_t v106;
  unint64_t v107;
  NSObject *v108;
  uint64_t v109;
  os_log_type_t v110;
  char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  unint64_t v115;
  char *v116;
  uint64_t v117;
  char *v118;
  char *v119;
  void *v120;
  void *v121;
  uint64_t v122;
  uint64_t v123;
  char *v124;
  uint64_t v125;
  char *v126;
  uint64_t v127;
  char *v128;
  void (*v129)(char *, uint64_t);
  void *v130;
  id v131;
  void *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  void (*v138)(char *, uint64_t, uint64_t);
  char *v139;
  char v140;
  char *v141;
  void *v142;
  uint64_t v143;
  id v144;
  uint64_t v145;
  BOOL v146;
  char *v147;
  char *v148;
  char *v149;
  char *v150;
  NSObject *v151;
  os_log_type_t v152;
  uint64_t v153;
  char *v154;
  uint64_t v155;
  uint64_t v156;
  unint64_t v157;
  unint64_t v158;
  uint64_t v159;
  unint64_t v160;
  char *v161;
  void (*v162)(unsigned int *, uint64_t);
  NSObject *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  void *v167;
  uint64_t v168;
  unint64_t v169;
  uint64_t v170;
  uint64_t v171;
  char *v172;
  char *v173;
  char *v174;
  char *v175;
  char *v176;
  char *v177;
  uint64_t v178;
  uint64_t v179;
  void (*v180)(char *, uint64_t);
  char *v181;
  char *v182;
  uint64_t v183;
  char *v184;
  uint64_t v185;
  NSObject *v186;
  char *v187;
  char *v188;
  uint64_t v189;
  void (*isa)(char *, uint64_t, uint64_t);
  void (*v191)(char *, char *, uint64_t);
  void (*v192)(char *, uint64_t);
  char *v193;
  char *v194;
  char *v195;
  uint64_t v196;
  uint64_t v197;
  void *v198;
  _QWORD v199[4];
  _QWORD v200[4];
  uint64_t v201;
  uint64_t v202;

  v197 = a2;
  v3 = sub_21EC7CFA4();
  v178 = *(_QWORD *)(v3 - 8);
  v179 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v177 = (char *)&v170 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255481B20);
  MEMORY[0x24BDAC7A8](v5);
  v175 = (char *)&v170 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v183 = __swift_instantiateConcreteTypeFromMangledName(&qword_255481D08);
  MEMORY[0x24BDAC7A8](v183);
  v193 = (char *)&v170 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_21EC7CFC8();
  v9 = *(NSObject **)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v170 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v10);
  v173 = (char *)&v170 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v194 = (char *)&v170 - v15;
  v16 = sub_21EC7CFE0();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v172 = (char *)&v170 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x24BDAC7A8](v18);
  v184 = (char *)&v170 - v21;
  MEMORY[0x24BDAC7A8](v20);
  v23 = (char *)&v170 - v22;
  v196 = sub_21EC7D004();
  v192 = *(void (**)(char *, uint64_t))(v196 - 8);
  v24 = MEMORY[0x24BDAC7A8](v196);
  v195 = (char *)&v170 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = MEMORY[0x24BDAC7A8](v24);
  v174 = (char *)&v170 - v27;
  v28 = MEMORY[0x24BDAC7A8](v26);
  v176 = (char *)&v170 - v29;
  v30 = MEMORY[0x24BDAC7A8](v28);
  v32 = (char *)&v170 - v31;
  MEMORY[0x24BDAC7A8](v30);
  v34 = (char *)&v170 - v33;
  swift_beginAccess();
  v35 = MEMORY[0x2207BA9E8](a1 + 16);
  if (v35)
  {
    v36 = (char *)v35;
    v181 = v12;
    sub_21EC73128();
    v187 = v36;
    v37 = &v36[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_currentState];
    swift_beginAccess();
    v38 = *(void (**)(char *, char *, uint64_t))(v17 + 16);
    v188 = v37;
    v191 = v38;
    v38(v23, v37, v16);
    v39 = sub_21EC7CFD4();
    v40 = v16;
    v42 = v41;
    v185 = v17;
    v43 = *(void (**)(char *, uint64_t))(v17 + 8);
    v182 = v23;
    v189 = v40;
    v180 = v43;
    v43(v23, v40);
    sub_21EC7CD94();
    isa = (void (*)(char *, uint64_t, uint64_t))v9[2].isa;
    isa(v194, v197, v8);
    swift_bridgeObjectRetain();
    v44 = sub_21EC7CFF8();
    v45 = sub_21EC7D148();
    v46 = os_log_type_enabled(v44, v45);
    v186 = v9;
    if (v46)
    {
      v47 = swift_slowAlloc();
      v171 = swift_slowAlloc();
      v201 = v171;
      *(_DWORD *)v47 = 136315394;
      swift_bridgeObjectRetain();
      v200[0] = sub_21EC68898(v39, v42, &v201);
      sub_21EC7D1B4();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v47 + 12) = 2080;
      v48 = v194;
      v49 = sub_21EC7CFBC();
      v200[0] = sub_21EC68898(v49, v50, &v201);
      sub_21EC7D1B4();
      swift_bridgeObjectRelease();
      v51 = (void (*)(char *, uint64_t))v186[1].isa;
      v51(v48, v8);
      _os_log_impl(&dword_21EC60000, v44, v45, "[TWICE] HANDLE_EVENT - from: %s, event: %s", (uint8_t *)v47, 0x16u);
      v52 = v171;
      swift_arrayDestroy();
      MEMORY[0x2207BA9A0](v52, -1, -1);
      MEMORY[0x2207BA9A0](v47, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
      v51 = (void (*)(char *, uint64_t))v9[1].isa;
      v51(v194, v8);
    }

    v194 = (char *)*((_QWORD *)v192 + 1);
    ((void (*)(char *, uint64_t))v194)(v32, v196);
    v57 = v195;
    v58 = v197;
    v59 = v193;
    v60 = v189;
    v62 = v183;
    v61 = v184;
    v191(v184, v188, v189);
    v63 = (unsigned int *)&v59[*(int *)(v62 + 48)];
    v64 = v185;
    (*(void (**)(char *, char *, uint64_t))(v185 + 32))(v59, v61, v60);
    isa((char *)v63, v58, v8);
    v65 = (*(uint64_t (**)(char *, uint64_t))(v64 + 88))(v59, v60);
    v66 = *MEMORY[0x24BDFF510];
    v192 = v51;
    if (v65 == (_DWORD)v66)
    {
      v67 = (unsigned int (*)(unsigned int *, uint64_t))v186[11].isa;
      v68 = v57;
      v69 = v8;
      if (v67(v63, v8) == *MEMORY[0x24BDFF4C0])
      {
        sub_21EC74E04();
        v70 = (unsigned int *)MEMORY[0x24BDFF4F8];
LABEL_11:
        v71 = v185;
        v72 = v69;
        v73 = v182;
        v74 = v189;
        (*(void (**)(char *, _QWORD, uint64_t))(v185 + 104))(v182, *v70, v189);
        v75 = v188;
        swift_beginAccess();
        (*(void (**)(char *, char *, uint64_t))(v71 + 24))(v75, v73, v74);
        swift_endAccess();
LABEL_12:
        sub_21EC71508();
        v76 = v180;
        v180(v73, v74);
        v77 = v181;
LABEL_42:
        v103 = v193;
LABEL_43:
        v76(v103, v74);
        v191(v73, v75, v74);
        v104 = sub_21EC7CFD4();
        v105 = v76;
        v107 = v106;
        v105(v73, v74);
        sub_21EC7CD94();
        isa(v77, v197, v72);
        swift_bridgeObjectRetain();
        v108 = sub_21EC7CFF8();
        v109 = v72;
        v110 = sub_21EC7D148();
        if (os_log_type_enabled(v108, v110))
        {
          v111 = v77;
          v112 = swift_slowAlloc();
          v113 = swift_slowAlloc();
          v201 = v113;
          *(_DWORD *)v112 = 136315394;
          swift_bridgeObjectRetain();
          v200[0] = sub_21EC68898(v104, v107, &v201);
          sub_21EC7D1B4();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v112 + 12) = 2080;
          v114 = sub_21EC7CFBC();
          v200[0] = sub_21EC68898(v114, v115, &v201);
          sub_21EC7D1B4();
          swift_bridgeObjectRelease();
          v192(v111, v109);
          _os_log_impl(&dword_21EC60000, v108, v110, "[TWICE] HANDLE_EVENT - to: %s, event: %s", (uint8_t *)v112, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x2207BA9A0](v113, -1, -1);
          MEMORY[0x2207BA9A0](v112, -1, -1);

          v116 = v195;
        }
        else
        {
          swift_bridgeObjectRelease_n();

          v192(v77, v109);
          v116 = v68;
        }
        return ((uint64_t (*)(char *, uint64_t))v194)(v116, v196);
      }
      goto LABEL_36;
    }
    v78 = v8;
    if (v65 == *MEMORY[0x24BDFF4F8])
    {
      v67 = (unsigned int (*)(unsigned int *, uint64_t))v186[11].isa;
      v79 = v67(v63, v8);
      if (v79 == *MEMORY[0x24BDFF4A0])
      {
        v80 = v176;
        sub_21EC7CD94();
        v81 = sub_21EC7CFF8();
        v82 = sub_21EC7D148();
        if (os_log_type_enabled(v81, v82))
        {
          v83 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v83 = 0;
          _os_log_impl(&dword_21EC60000, v81, v82, "[TWICE] Device jumpstart", v83, 2u);
          MEMORY[0x2207BA9A0](v83, -1, -1);
        }

        ((void (*)(char *, uint64_t))v194)(v80, v196);
        sub_21EC74E04();
        v84 = v185;
        v73 = v182;
        v74 = v189;
        (*(void (**)(void))(v185 + 104))();
        v75 = v188;
        swift_beginAccess();
        (*(void (**)(char *, char *, uint64_t))(v84 + 24))(v75, v73, v74);
        swift_endAccess();
        sub_21EC71508();
        v76 = v180;
        v180(v73, v74);
        v77 = v181;
        v72 = v78;
        v68 = v195;
        goto LABEL_42;
      }
      v69 = v8;
      v68 = v195;
      if (v79 == *MEMORY[0x24BDFF4B0])
      {
        v87 = *(void **)&v187[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_remoteMessenger];
        __swift_instantiateConcreteTypeFromMangledName(&qword_255481CE8);
        inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_21EC7E100;
        v72 = v8;
        v89 = v87;
        v201 = sub_21EC7CE3C();
        v202 = v90;
        sub_21EC7D1FC();
        v91 = _AXSApplicationAccessibilityEnabled() != 0;
        *(_QWORD *)(inited + 96) = MEMORY[0x24BEE1328];
        *(_BYTE *)(inited + 72) = v91;
        sub_21EC77D24(inited);
        MEMORY[0x2207B9F80]();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_21EC75254();
        v92 = v185;
        v73 = v182;
        v74 = v189;
        (*(void (**)(char *, _QWORD, uint64_t))(v185 + 104))(v182, *MEMORY[0x24BDFF500], v189);
        v75 = v188;
        swift_beginAccess();
        (*(void (**)(char *, char *, uint64_t))(v92 + 24))(v75, v73, v74);
        swift_endAccess();
        goto LABEL_12;
      }
      goto LABEL_36;
    }
    if (v65 == *MEMORY[0x24BDFF500])
    {
      v67 = (unsigned int (*)(unsigned int *, uint64_t))v186[11].isa;
      v69 = v8;
      v85 = v67(v63, v8);
      v68 = v195;
      if (v85 == *MEMORY[0x24BDFF4B8])
      {
        v86 = v185;
        v72 = v8;
        v73 = v182;
        v74 = v189;
        (*(void (**)(char *, _QWORD, uint64_t))(v185 + 104))(v182, *MEMORY[0x24BDFF508], v189);
        v75 = v188;
        swift_beginAccess();
        (*(void (**)(char *, char *, uint64_t))(v86 + 24))(v75, v73, v74);
        swift_endAccess();
        goto LABEL_12;
      }
      goto LABEL_36;
    }
    v93 = v186;
    if (v65 == *MEMORY[0x24BDFF508])
    {
      v67 = (unsigned int (*)(unsigned int *, uint64_t))v186[11].isa;
      v69 = v8;
      v94 = v67(v63, v8);
      v68 = v195;
      if (v94 == *MEMORY[0x24BDFF4D8])
      {
        sub_21EC755F4();
        v70 = (unsigned int *)MEMORY[0x24BDFF520];
        goto LABEL_11;
      }
      goto LABEL_36;
    }
    if (v65 == *MEMORY[0x24BDFF520])
    {
      v67 = (unsigned int (*)(unsigned int *, uint64_t))v186[11].isa;
      v69 = v8;
      v95 = v67(v63, v8);
      if (v95 == *MEMORY[0x24BDFF470])
      {
        ((void (*)(unsigned int *, uint64_t))v93[12].isa)(v63, v8);
        v72 = v8;
        v96 = *(void **)v63;
        sub_21EC756F8(*(void **)v63);
      }
      else
      {
        if (v95 != *MEMORY[0x24BDFF478])
        {
          if (v95 == *MEMORY[0x24BDFF480])
          {
            ((void (*)(unsigned int *, uint64_t))v93[12].isa)(v63, v8);
            v166 = *v63;
            sub_21EC7CA40((uint64_t)(v63 + 2), (uint64_t)&v201);
            sub_21EC7CA40((uint64_t)(v63 + 10), (uint64_t)v200);
            sub_21EC7CA88((uint64_t)v200, (uint64_t)v199, &qword_255481BB0);
            if (v199[3])
            {
              sub_21EC66B28(0, &qword_255481BC8);
              if ((swift_dynamicCast() & 1) != 0)
              {
                v167 = v198;
                sub_21EC75CA8(v166, (uint64_t)&v201, v198);

              }
            }
            else
            {
              sub_21EC7C230((uint64_t)v199, &qword_255481BB0);
            }
            v77 = v181;
            v73 = v182;
            v76 = v180;
            v103 = v193;
            sub_21EC7C230((uint64_t)v200, &qword_255481BB0);
            sub_21EC7C230((uint64_t)&v201, &qword_255481BB0);
            v75 = v188;
            v74 = v189;
            v72 = v78;
            v68 = v195;
            goto LABEL_43;
          }
          v68 = v195;
          if (v95 == *MEMORY[0x24BDFF490])
          {
            ((void (*)(unsigned int *, uint64_t))v186[12].isa)(v63, v8);
            v72 = v8;
            v168 = *(_QWORD *)v63;
            v169 = *((_QWORD *)v63 + 1);
            sub_21EC75E6C(*(_QWORD *)v63, v169);
            sub_21EC7C2B0(v168, v169);
            goto LABEL_40;
          }
LABEL_36:
          v97 = v67(v63, v69);
          if (v97 == *MEMORY[0x24BDFF488])
          {
            ((void (*)(unsigned int *, uint64_t))v186[12].isa)(v63, v69);
            v99 = (uint64_t)v177;
            v98 = v178;
            v72 = v69;
            v100 = v179;
            (*(void (**)(char *, unsigned int *, uint64_t))(v178 + 32))(v177, v63, v179);
            sub_21EC7608C(v99);
            (*(void (**)(uint64_t, uint64_t))(v98 + 8))(v99, v100);
          }
          else
          {
            if (v97 != *MEMORY[0x24BDFF468])
            {
              v72 = v69;
              if (v97 == *MEMORY[0x24BDFF4C8])
              {
                v117 = v185;
                v118 = v182;
                v74 = v189;
                (*(void (**)(char *, uint64_t, uint64_t))(v185 + 104))(v182, v66, v189);
                v75 = v188;
                swift_beginAccess();
                (*(void (**)(char *, char *, uint64_t))(v117 + 24))(v75, v118, v74);
                swift_endAccess();
                v119 = v187;
                sub_21EC71508();
                v76 = v180;
                v180(v118, v74);
                _AXSTwiceRemoteScreenSetEnabled();
                sub_21EC71828();
                v121 = v120;
                objc_msgSend(v120, sel_cancel);

                v122 = sub_21EC7CD88();
                v123 = (uint64_t)v175;
                (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v122 - 8) + 56))(v175, 1, 1, v122);
                v124 = &v119[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_inactiveDate];
                swift_beginAccess();
                v125 = (uint64_t)v124;
                v73 = v118;
                sub_21EC7C1AC(v123, v125);
                swift_endAccess();
                v126 = &v119[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_initialPingMessageIdentifier];
                *(_QWORD *)v126 = 0;
                *((_QWORD *)v126 + 1) = 0;
              }
              else
              {
                v73 = v182;
                if (v97 != *MEMORY[0x24BDFF4D0])
                {
                  v77 = v181;
                  if (v97 == *MEMORY[0x24BDFF498])
                  {
                    v137 = v185;
                    v75 = v188;
                    v74 = v189;
                    v191(v182, v188, v189);
                    v138 = *(void (**)(char *, uint64_t, uint64_t))(v137 + 104);
                    v139 = v172;
                    v138(v172, v66, v74);
                    sub_21EC66630(&qword_255481D10, (uint64_t (*)(uint64_t))MEMORY[0x24BDFF528], MEMORY[0x24BDFF538]);
                    v140 = sub_21EC7D088();
                    v141 = v139;
                    v76 = v180;
                    v180(v141, v74);
                    v76(v73, v74);
                    v103 = v193;
                    if ((v140 & 1) == 0)
                    {
                      v142 = *(void **)&v187[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_remoteMessenger];
                      __swift_instantiateConcreteTypeFromMangledName(&qword_255481CE8);
                      v143 = swift_initStackObject();
                      *(_OWORD *)(v143 + 16) = xmmword_21EC7E100;
                      v144 = v142;
                      v201 = sub_21EC7CE3C();
                      v202 = v145;
                      sub_21EC7D1FC();
                      v146 = _AXSApplicationAccessibilityEnabled() != 0;
                      *(_QWORD *)(v143 + 96) = MEMORY[0x24BEE1328];
                      *(_BYTE *)(v143 + 72) = v146;
                      sub_21EC77D24(v143);
                      MEMORY[0x2207B9F80]();

                      v77 = v181;
                      v73 = v182;
                      swift_bridgeObjectRelease();
                      swift_bridgeObjectRelease();
                    }
                    goto LABEL_43;
                  }
                  v147 = v174;
                  sub_21EC7CD94();
                  v148 = v173;
                  v149 = (char *)v72;
                  isa(v173, v197, v72);
                  v150 = v187;
                  v151 = sub_21EC7CFF8();
                  v152 = sub_21EC7D13C();
                  v186 = v151;
                  if (os_log_type_enabled(v151, v152))
                  {
                    v153 = swift_slowAlloc();
                    v185 = swift_slowAlloc();
                    v201 = v185;
                    *(_DWORD *)v153 = 136315394;
                    v183 = v153 + 4;
                    v184 = v149;
                    v154 = v182;
                    v155 = v189;
                    v191(v182, v188, v189);
                    sub_21EC66630(&qword_255481D00, (uint64_t (*)(uint64_t))MEMORY[0x24BDFF528], MEMORY[0x24BDFF548]);
                    v156 = sub_21EC7D2D4();
                    v158 = v157;
                    v180(v154, v155);
                    v200[0] = sub_21EC68898(v156, v158, &v201);
                    sub_21EC7D1B4();

                    v68 = v195;
                    swift_bridgeObjectRelease();
                    *(_WORD *)(v153 + 12) = 2080;
                    v159 = sub_21EC7CFBC();
                    v200[0] = sub_21EC68898(v159, v160, &v201);
                    sub_21EC7D1B4();
                    swift_bridgeObjectRelease();
                    v161 = v184;
                    v162 = (void (*)(unsigned int *, uint64_t))v192;
                    v192(v148, (uint64_t)v184);
                    v163 = v186;
                    _os_log_impl(&dword_21EC60000, v186, v152, "[TWICE] unhandled event %s %s", (uint8_t *)v153, 0x16u);
                    v164 = v185;
                    swift_arrayDestroy();
                    MEMORY[0x2207BA9A0](v164, -1, -1);
                    v165 = v153;
                    v77 = v181;
                    MEMORY[0x2207BA9A0](v165, -1, -1);

                    ((void (*)(char *, uint64_t))v194)(v174, v196);
                    v72 = (uint64_t)v161;
                  }
                  else
                  {

                    v162 = (void (*)(unsigned int *, uint64_t))v192;
                    v192(v148, (uint64_t)v149);

                    ((void (*)(char *, uint64_t))v194)(v147, v196);
                    v72 = (uint64_t)v149;
                  }
                  v162(v63, v72);
                  v75 = v188;
                  v74 = v189;
                  v73 = v182;
                  goto LABEL_41;
                }
                v127 = v185;
                v74 = v189;
                (*(void (**)(char *, uint64_t, uint64_t))(v185 + 104))(v182, v66, v189);
                v75 = v188;
                swift_beginAccess();
                (*(void (**)(char *, char *, uint64_t))(v127 + 24))(v75, v73, v74);
                swift_endAccess();
                v128 = v187;
                sub_21EC71508();
                v129 = v180;
                v180(v73, v74);
                sub_21EC77A18();
                v130 = *(void **)&v128[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_mainVC];
                sub_21EC7CF98();
                v131 = v130;
                v132 = (void *)sub_21EC7CF38();
                v133 = sub_21EC7CF44();
                v134 = v72;
                v136 = v135;

                sub_21EC657A0(v133, v136, 0xD000000000000016, 0x800000021EC7E600);
                v73 = v182;
                v72 = v134;
                v76 = v129;
              }
              swift_bridgeObjectRelease();
              v77 = v181;
              goto LABEL_42;
            }
            ((void (*)(unsigned int *, uint64_t))v186[12].isa)(v63, v69);
            v72 = v69;
            v101 = *(id *)&v187[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_mainVC];
            v102 = sub_21EC63BE8();

            sub_21EC6D84C();
          }
LABEL_40:
          v77 = v181;
          v73 = v182;
          v75 = v188;
          v74 = v189;
LABEL_41:
          v76 = v180;
          goto LABEL_42;
        }
        ((void (*)(unsigned int *, uint64_t))v93[12].isa)(v63, v8);
        v72 = v8;
        v96 = *(void **)v63;
        sub_21EC75BA8(*(_QWORD *)v63);
      }

    }
    else
    {
      if (v65 != *MEMORY[0x24BDFF518])
      {
        v67 = (unsigned int (*)(unsigned int *, uint64_t))v186[11].isa;
        v69 = v8;
        v68 = v195;
        goto LABEL_36;
      }
      v72 = v8;
      v51((char *)v63, v8);
    }
    v77 = v181;
    v73 = v182;
    v75 = v188;
    v74 = v189;
    v76 = v180;
    v68 = v195;
    goto LABEL_42;
  }
  sub_21EC7CD94();
  v53 = sub_21EC7CFF8();
  v54 = sub_21EC7D13C();
  if (os_log_type_enabled(v53, v54))
  {
    v55 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v55 = 0;
    _os_log_impl(&dword_21EC60000, v53, v54, "[TWICE] self is nil", v55, 2u);
    MEMORY[0x2207BA9A0](v55, -1, -1);
  }

  return (*((uint64_t (**)(char *, uint64_t))v192 + 1))(v34, v196);
}

uint64_t sub_21EC74E04()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int IsBluetoothOn;
  int IsWifiOn;
  uint64_t v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  _BOOL4 v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  unsigned int *v21;
  uint64_t v22;
  void *v23;
  uint64_t inited;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v35;
  unsigned int *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50[2];

  v1 = sub_21EC7CFC8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v41 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_21EC7D004();
  v47 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  IsBluetoothOn = AXDeviceRemoteScreenIsBluetoothOn();
  IsWifiOn = AXDeviceRemoteScreenIsWifiOn();
  v10 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_remoteMessenger;
  v48 = v0;
  v11 = objc_retain(*(id *)(v0
                          + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_remoteMessenger));
  v46 = sub_21EC7CEFC();

  sub_21EC7CD94();
  v12 = sub_21EC7CFF8();
  v13 = sub_21EC7D148();
  v14 = os_log_type_enabled(v12, v13);
  v45 = IsBluetoothOn;
  if (v14)
  {
    v15 = swift_slowAlloc();
    v43 = v10;
    v16 = IsBluetoothOn;
    v17 = v15;
    v18 = swift_slowAlloc();
    v44 = v1;
    v42 = v18;
    v50[0] = v18;
    *(_DWORD *)v17 = 136315906;
    v49 = sub_21EC68898(0xD000000000000019, 0x800000021EC7FE10, v50);
    sub_21EC7D1B4();
    v41 = v5;
    *(_WORD *)(v17 + 12) = 1024;
    LODWORD(v49) = v16;
    v10 = v43;
    sub_21EC7D1B4();
    *(_WORD *)(v17 + 18) = 1024;
    LODWORD(v49) = IsWifiOn;
    sub_21EC7D1B4();
    *(_WORD *)(v17 + 24) = 1024;
    v19 = v46;
    LODWORD(v49) = v46 & 1;
    sub_21EC7D1B4();
    _os_log_impl(&dword_21EC60000, v12, v13, "[TWICE] %s BT:%{BOOL}d, WF:%{BOOL}d, isConnected: %{BOOL}d", (uint8_t *)v17, 0x1Eu);
    v20 = v42;
    swift_arrayDestroy();
    v1 = v44;
    MEMORY[0x2207BA9A0](v20, -1, -1);
    MEMORY[0x2207BA9A0](v17, -1, -1);

    (*(void (**)(char *, uint64_t))(v47 + 8))(v7, v41);
    if ((v19 & 1) == 0)
    {
LABEL_3:
      v21 = (unsigned int *)MEMORY[0x24BDFF440];
      goto LABEL_14;
    }
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v47 + 8))(v7, v5);
    if ((v46 & 1) == 0)
      goto LABEL_3;
  }
  if (v45)
  {
    if (IsWifiOn)
    {
      v22 = v48;
      v23 = *(void **)(v48 + v10);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255481CE8);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_21EC7E100;
      v25 = v23;
      v50[0] = sub_21EC7CDE8();
      v50[1] = v26;
      v27 = MEMORY[0x24BEE0D00];
      sub_21EC7D1FC();
      v28 = sub_21EC7CE30();
      *(_QWORD *)(inited + 96) = v27;
      *(_QWORD *)(inited + 72) = v28;
      *(_QWORD *)(inited + 80) = v29;
      sub_21EC77D24(inited);
      v30 = MEMORY[0x2207B9F80]();
      v32 = v31;

      swift_bridgeObjectRelease();
      v33 = (uint64_t *)(v22
                      + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_initialPingMessageIdentifier);
      *v33 = v30;
      v33[1] = v32;
      return swift_bridgeObjectRelease();
    }
    v37 = *MEMORY[0x24BDFF550];
    v38 = sub_21EC7CFEC();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 104))(v4, v37, v38);
  }
  else
  {
    v35 = sub_21EC7CFEC();
    if (IsWifiOn)
      v36 = (unsigned int *)MEMORY[0x24BDFF558];
    else
      v36 = (unsigned int *)MEMORY[0x24BDFF560];
    (*(void (**)(char *, _QWORD, uint64_t))(*(_QWORD *)(v35 - 8) + 104))(v4, *v36, v35);
  }
  v21 = (unsigned int *)MEMORY[0x24BDFF420];
LABEL_14:
  v39 = *v21;
  v40 = sub_21EC7CFA4();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 104))(v4, v39, v40);
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x24BDFF488], v1);
  sub_21EC71C4C(v4);
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t sub_21EC75254()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t inited;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36[2];

  v1 = v0;
  v2 = sub_21EC7CFC8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_21EC7D004();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_21EC7055C();
  if (v10)
  {
    v11 = v10;
    v12 = objc_msgSend(v10, sel_start);

    v13 = sub_21EC7CD64();
    v15 = v14;

    sub_21EC7CD94();
    v16 = sub_21EC7CFF8();
    v17 = sub_21EC7D148();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      *(_QWORD *)&v34 = v1;
      v20 = v19;
      v36[0] = v19;
      v33 = v15;
      *(_DWORD *)v18 = 136315138;
      v35 = sub_21EC68898(0xD000000000000015, 0x800000021EC7FE30, v36);
      v15 = v33;
      sub_21EC7D1B4();
      _os_log_impl(&dword_21EC60000, v16, v17, "[TWICE] %s Received airplay data blob", v18, 0xCu);
      swift_arrayDestroy();
      v21 = v20;
      v1 = v34;
      MEMORY[0x2207BA9A0](v21, -1, -1);
      MEMORY[0x2207BA9A0](v18, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255481D18);
    inited = swift_initStackObject();
    v34 = xmmword_21EC7E100;
    *(_OWORD *)(inited + 16) = xmmword_21EC7E100;
    *(_QWORD *)(inited + 32) = sub_21EC7CE30();
    *(_QWORD *)(inited + 40) = v23;
    *(_QWORD *)(inited + 48) = v13;
    *(_QWORD *)(inited + 56) = v15;
    sub_21EC7C26C(v13, v15);
    v24 = sub_21EC77E64(inited);
    v25 = *(void **)(v1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_remoteMessenger);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255481CE8);
    v26 = swift_initStackObject();
    *(_OWORD *)(v26 + 16) = v34;
    v27 = v25;
    v36[0] = sub_21EC7CE0C();
    v36[1] = v28;
    sub_21EC7D1FC();
    *(_QWORD *)(v26 + 96) = __swift_instantiateConcreteTypeFromMangledName(&qword_255481D20);
    *(_QWORD *)(v26 + 72) = v24;
    sub_21EC77D24(v26);
    MEMORY[0x2207B9F80]();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return sub_21EC7C2B0(v13, v15);
  }
  else
  {
    v30 = *MEMORY[0x24BDFF428];
    v31 = sub_21EC7CFA4();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 104))(v5, v30, v31);
    (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BDFF488], v2);
    sub_21EC71C4C(v5);
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
}

uint64_t sub_21EC755F4()
{
  uint64_t v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t inited;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = sub_21EC70630();
  if (v1)
  {
    v2 = v1;
    v3 = (void *)sub_21EC7D094();
    objc_msgSend(v2, sel_beginHandlingHIDEventsForReason_, v3);

  }
  v4 = *(void **)(v0 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_remoteMessenger);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255481CE8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21EC7E100;
  v6 = v4;
  sub_21EC7CE54();
  v7 = MEMORY[0x24BEE0D00];
  sub_21EC7D1FC();
  v8 = sub_21EC7CE30();
  *(_QWORD *)(inited + 96) = v7;
  *(_QWORD *)(inited + 72) = v8;
  *(_QWORD *)(inited + 80) = v9;
  sub_21EC77D24(inited);
  MEMORY[0x2207B9F80]();

  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_21EC756F8(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t inited;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int v23;
  uint64_t v24;
  unsigned __int8 v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  unsigned __int8 v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  unsigned int v34;
  unint64_t v35;
  id v36;
  void *v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char isUniquelyReferenced_nonNull_native;
  void *v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  id v50;
  id v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  _OWORD v59[2];
  __int128 v60;
  uint64_t v61;
  uint64_t v62;

  v2 = v1;
  v62 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(a1, sel_type) != 3001)
  {
    *(_QWORD *)&v60 = 0;
    v50 = objc_msgSend((id)objc_opt_self(), sel_archivedDataWithRootObject_requiringSecureCoding_error_, a1, 1, &v60);
    v51 = (id)v60;
    if (v50)
    {
      v52 = sub_21EC7CD64();
      v54 = v53;

      v55 = objc_retain(*(id *)(v2
                              + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_remoteMessenger));
      sub_21EC7CF20();

      sub_21EC7C2B0(v52, v54);
      return;
    }
    v56 = v51;
    v57 = (void *)sub_21EC7CD4C();

    swift_willThrow();
    goto LABEL_11;
  }
  v4 = objc_msgSend(a1, sel_handInfo);
  if (!v4)
    return;
  v5 = v4;
  *(_QWORD *)&v60 = 0;
  v6 = objc_msgSend((id)objc_opt_self(), sel_archivedDataWithRootObject_requiringSecureCoding_error_, v4, 1, &v60);
  v7 = (id)v60;
  if (!v6)
  {
    v58 = v7;
    v57 = (void *)sub_21EC7CD4C();

    swift_willThrow();
LABEL_11:

    return;
  }
  v8 = sub_21EC7CD64();
  v10 = v9;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255481D30);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21EC7E1B0;
  *(_QWORD *)(inited + 32) = sub_21EC7CEC0();
  *(_QWORD *)(inited + 40) = v12;
  v13 = MEMORY[0x24BDCDDE8];
  *(_QWORD *)(inited + 72) = MEMORY[0x24BDCDDE8];
  *(_QWORD *)(inited + 48) = v8;
  *(_QWORD *)(inited + 56) = v10;
  sub_21EC7C26C(v8, v10);
  *(_QWORD *)(inited + 80) = sub_21EC7CE60();
  *(_QWORD *)(inited + 88) = v14;
  v15 = objc_msgSend(a1, sel_isGeneratedEvent);
  v16 = MEMORY[0x24BEE1328];
  *(_QWORD *)(inited + 120) = MEMORY[0x24BEE1328];
  *(_BYTE *)(inited + 96) = v15;
  *(_QWORD *)(inited + 128) = sub_21EC7CE84();
  *(_QWORD *)(inited + 136) = v17;
  v18 = objc_msgSend(a1, sel_generationCount);
  *(_QWORD *)(inited + 168) = MEMORY[0x24BEE1768];
  *(_QWORD *)(inited + 144) = v18;
  *(_QWORD *)(inited + 176) = sub_21EC7CE78();
  *(_QWORD *)(inited + 184) = v19;
  v20 = objc_msgSend(a1, sel_willUpdateMask);
  v21 = MEMORY[0x24BEE44F0];
  *(_QWORD *)(inited + 216) = MEMORY[0x24BEE44F0];
  *(_DWORD *)(inited + 192) = v20;
  *(_QWORD *)(inited + 224) = sub_21EC7CE6C();
  *(_QWORD *)(inited + 232) = v22;
  v23 = objc_msgSend(a1, sel_didUpdateMask);
  *(_QWORD *)(inited + 264) = v21;
  *(_DWORD *)(inited + 240) = v23;
  *(_QWORD *)(inited + 272) = sub_21EC7CE9C();
  *(_QWORD *)(inited + 280) = v24;
  v25 = objc_msgSend(a1, sel_useOriginalHIDTime);
  *(_QWORD *)(inited + 312) = v16;
  *(_BYTE *)(inited + 288) = v25;
  *(_QWORD *)(inited + 320) = sub_21EC7CEB4();
  *(_QWORD *)(inited + 328) = v26;
  v27 = objc_msgSend(a1, sel_HIDTime);
  v28 = MEMORY[0x24BEE4568];
  *(_QWORD *)(inited + 360) = MEMORY[0x24BEE4568];
  *(_QWORD *)(inited + 336) = v27;
  *(_QWORD *)(inited + 368) = sub_21EC7CEA8();
  *(_QWORD *)(inited + 376) = v29;
  v30 = objc_msgSend(a1, sel_isDisplayIntegrated);
  *(_QWORD *)(inited + 408) = v16;
  *(_BYTE *)(inited + 384) = v30;
  *(_QWORD *)(inited + 416) = sub_21EC7CECC();
  *(_QWORD *)(inited + 424) = v31;
  v32 = objc_msgSend(a1, sel_senderID);
  *(_QWORD *)(inited + 456) = v28;
  *(_QWORD *)(inited + 432) = v32;
  *(_QWORD *)(inited + 464) = sub_21EC7CED8();
  *(_QWORD *)(inited + 472) = v33;
  v34 = objc_msgSend(a1, sel_contextId);
  *(_QWORD *)(inited + 504) = v21;
  *(_DWORD *)(inited + 480) = v34;
  v35 = sub_21EC77F88(inited);
  v36 = objc_msgSend(a1, sel_HIDAttributeData);
  if (v36)
  {
    v37 = v36;
    v38 = sub_21EC7CD64();
    v40 = v39;

    v41 = sub_21EC7CE90();
    v42 = v13;
    v44 = v43;
    v61 = v42;
    *(_QWORD *)&v60 = v38;
    *((_QWORD *)&v60 + 1) = v40;
    sub_21EC69018(&v60, v59);
    sub_21EC7C26C(v38, v40);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_21EC7BBC4(v59, v41, v44, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_21EC7C2B0(v38, v40);
  }
  v46 = *(void **)(v2 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_remoteMessenger);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255481CE8);
  v47 = swift_initStackObject();
  *(_OWORD *)(v47 + 16) = xmmword_21EC7E100;
  v48 = v46;
  *(_QWORD *)&v60 = sub_21EC7CDC4();
  *((_QWORD *)&v60 + 1) = v49;
  sub_21EC7D1FC();
  *(_QWORD *)(v47 + 96) = __swift_instantiateConcreteTypeFromMangledName(&qword_255481D38);
  *(_QWORD *)(v47 + 72) = v35;
  sub_21EC77D24(v47);
  MEMORY[0x2207B9F80]();

  sub_21EC7C2B0(v8, v10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

void sub_21EC75BA8(uint64_t a1)
{
  uint64_t v1;
  id v2;
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10[2];

  v10[1] = *(id *)MEMORY[0x24BDAC8D0];
  v10[0] = 0;
  v2 = objc_msgSend((id)objc_opt_self(), sel_archivedDataWithRootObject_requiringSecureCoding_error_, a1, 1, v10);
  v3 = v10[0];
  if (v2)
  {
    v4 = sub_21EC7CD64();
    v6 = v5;

    v7 = objc_retain(*(id *)(v1
                           + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_remoteMessenger));
    sub_21EC7CF20();

    sub_21EC7C2B0(v4, v6);
  }
  else
  {
    v8 = v3;
    v9 = (void *)sub_21EC7CD4C();

    swift_willThrow();
  }
}

void sub_21EC75CA8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v4;
  id v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  id v21;
  void *v22;
  void *v23;
  id v24[5];

  v4 = v3;
  v24[4] = *(id *)MEMORY[0x24BDAC8D0];
  sub_21EC7CA88(a2, (uint64_t)v24, &qword_255481BB0);
  v7 = objc_msgSend(a3, sel_elementRefData);
  if (v7)
  {
    v8 = v7;
    v9 = sub_21EC7CD64();
    v11 = v10;

  }
  else
  {
    v9 = 0;
    v11 = 0xF000000000000000;
  }
  v12 = objc_allocWithZone(MEMORY[0x24BEBADB8]);
  v13 = sub_21EC7B558(a1, v24, v9, v11);
  v14 = (void *)objc_opt_self();
  v24[0] = v13;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255481D50);
  v15 = sub_21EC7D19C();
  v24[0] = 0;
  v16 = objc_msgSend(v14, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v15, 1, v24);
  swift_unknownObjectRelease();
  v17 = v24[0];
  if (v16)
  {
    v18 = sub_21EC7CD64();
    v20 = v19;

    v21 = objc_retain(*(id *)(v4
                            + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_remoteMessenger));
    sub_21EC7CF20();

    sub_21EC7C2B0(v18, v20);
  }
  else
  {
    v22 = v17;
    v23 = (void *)sub_21EC7CD4C();

    swift_willThrow();
  }
}

uint64_t sub_21EC75E6C(uint64_t a1, unint64_t a2)
{
  void *v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  _QWORD aBlock[6];

  v5 = sub_21EC7D01C();
  v17 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_21EC7D040();
  v8 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21EC66B28(0, (unint64_t *)&qword_255481B40);
  v11 = (void *)sub_21EC7D178();
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = v2;
  v12[3] = a1;
  v12[4] = a2;
  aBlock[4] = sub_21EC7CB0C;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21EC65AAC;
  aBlock[3] = &block_descriptor_36;
  v13 = _Block_copy(aBlock);
  v14 = v2;
  sub_21EC7C26C(a1, a2);
  swift_release();
  sub_21EC7D028();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_21EC66630((unint64_t *)&qword_255481CD0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2554816C0);
  sub_21EC7C8FC((unint64_t *)&qword_255481CE0, &qword_2554816C0);
  sub_21EC7D1D8();
  MEMORY[0x2207BA220](0, v10, v7, v13);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v17 + 8))(v7, v5);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v16);
}

void sub_21EC7608C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  void (*v30)(char *, uint64_t, uint64_t);
  int v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(char *, uint64_t, uint64_t);
  char v35;
  void (*v36)(char *, uint64_t);
  uint64_t v37;
  void (*v38)(_QWORD *, char *, uint64_t);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  void (*v44)(char *, uint64_t, uint64_t);
  char v45;
  void (*v46)(char *, uint64_t);
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  void (*v53)(char *, uint64_t, uint64_t);
  char *v54;
  uint64_t v55;
  void (*v56)(char *, uint64_t);
  void (*v57)(_QWORD, _QWORD, _QWORD);
  char *v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  void (*v65)(char *, uint64_t, uint64_t);
  char v66;
  void (*v67)(char *, uint64_t);
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void (*v77)(char *, uint64_t, uint64_t);
  uint64_t v78;
  char *v79;
  char v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  void (*v86)(char *, uint64_t, uint64_t);
  char v87;
  void (*v88)(char *, uint64_t);
  uint64_t v89;
  void (*v90)(char *, uint64_t);
  char *v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  uint64_t v97;
  void (*v98)(char *, uint64_t, uint64_t);
  char v99;
  void (*v100)(char *, uint64_t);
  void *v101;
  id v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char v107;
  char *v108;
  NSObject *v109;
  os_log_type_t v110;
  uint8_t *v111;
  char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  id v118;
  void *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  char *v123;
  NSObject *v124;
  os_log_type_t v125;
  uint8_t *v126;
  uint64_t v127;
  uint64_t v128;
  char *v129;
  char *v130;
  char *v131;
  char *v132;
  char *v133;
  uint64_t v134;
  uint64_t v135;
  char *v136;
  uint64_t v137;
  uint64_t v138;
  char *v139;
  uint64_t v140;
  uint64_t v141;
  _QWORD *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  unint64_t v148;
  uint64_t v149[4];

  v2 = sub_21EC7D004();
  v134 = *(_QWORD *)(v2 - 8);
  v135 = v2;
  v3 = MEMORY[0x24BDAC7A8](v2);
  v129 = (char *)&v128 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v132 = (char *)&v128 - v5;
  v6 = sub_21EC7CFEC();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v141 = (uint64_t)&v128 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v142 = (uint64_t *)((char *)&v128 - v10);
  v11 = sub_21EC7CFE0();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v130 = (char *)&v128 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v131 = (char *)&v128 - v16;
  v17 = MEMORY[0x24BDAC7A8](v15);
  v136 = (char *)&v128 - v18;
  v19 = MEMORY[0x24BDAC7A8](v17);
  v139 = (char *)&v128 - v20;
  v21 = MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v128 - v22;
  MEMORY[0x24BDAC7A8](v21);
  v25 = (char *)&v128 - v24;
  v26 = sub_21EC7CFA4();
  v27 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v29 = (char *)&v128 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = *(void (**)(char *, uint64_t, uint64_t))(v27 + 16);
  v143 = a1;
  v30(v29, a1, v26);
  v31 = (*(uint64_t (**)(char *, uint64_t))(v27 + 88))(v29, v26);
  if (v31 == *MEMORY[0x24BDFF448])
  {
    (*(void (**)(char *, uint64_t))(v27 + 96))(v29, v26);
    v142 = *(_QWORD **)v29;
    v32 = v144 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_currentState;
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v25, v32, v11);
    v33 = *MEMORY[0x24BDFF510];
    v34 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 104);
    v34(v23, v33, v11);
    sub_21EC66630(&qword_255481D10, (uint64_t (*)(uint64_t))MEMORY[0x24BDFF528], MEMORY[0x24BDFF538]);
    v35 = sub_21EC7D088();
    v36 = *(void (**)(char *, uint64_t))(v12 + 8);
    v36(v23, v11);
    v36(v25, v11);
    if ((v35 & 1) != 0)
      return;
    v34(v25, v33, v11);
    swift_beginAccess();
    (*(void (**)(uint64_t, char *, uint64_t))(v12 + 24))(v32, v25, v11);
    swift_endAccess();
    sub_21EC71508();
    v36(v25, v11);
    sub_21EC772B4((uint64_t)v142);
    v147 = 0;
    v148 = 0xE000000000000000;
    goto LABEL_4;
  }
  v137 = v12;
  v138 = v11;
  v133 = v25;
  v37 = v144;
  v140 = v26;
  if (v31 == *MEMORY[0x24BDFF418])
  {
    (*(void (**)(char *, uint64_t))(v27 + 96))(v29, v140);
    v141 = v7;
    v38 = *(void (**)(_QWORD *, char *, uint64_t))(v7 + 32);
    v139 = (char *)v6;
    v38(v142, v29, v6);
    v39 = v37 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_currentState;
    swift_beginAccess();
    v40 = v137;
    v41 = v138;
    v42 = v133;
    (*(void (**)(char *, uint64_t, uint64_t))(v137 + 16))(v133, v39, v138);
    v43 = *MEMORY[0x24BDFF510];
    v44 = *(void (**)(char *, uint64_t, uint64_t))(v40 + 104);
    v44(v23, v43, v41);
    sub_21EC66630(&qword_255481D10, (uint64_t (*)(uint64_t))MEMORY[0x24BDFF528], MEMORY[0x24BDFF538]);
    v45 = sub_21EC7D088();
    v46 = *(void (**)(char *, uint64_t))(v40 + 8);
    v46(v23, v41);
    v46(v42, v41);
    if ((v45 & 1) != 0)
    {
      (*(void (**)(_QWORD *, char *))(v141 + 8))(v142, v139);
      return;
    }
    v44(v42, v43, v41);
    swift_beginAccess();
    (*(void (**)(uint64_t, char *, uint64_t))(v40 + 24))(v39, v42, v41);
    swift_endAccess();
    sub_21EC71508();
    v46(v42, v41);
    v57 = (void (*)(_QWORD, _QWORD, _QWORD))v142;
    sub_21EC775BC(0, (uint64_t)v142);
    v147 = 0;
    v148 = 0xE000000000000000;
    sub_21EC7D274();
    sub_21EC7D0B8();
    v58 = v139;
    sub_21EC7D274();
    (*(void (**)(void (*)(_QWORD, _QWORD, _QWORD), char *))(v141 + 8))(v57, v58);
    goto LABEL_21;
  }
  if (v31 == *MEMORY[0x24BDFF420])
  {
    v47 = v7;
    (*(void (**)(char *, uint64_t))(v27 + 96))(v29, v140);
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v141, v29, v6);
    v139 = (char *)v6;
    v48 = v37 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_currentState;
    swift_beginAccess();
    v49 = v137;
    v50 = v138;
    v51 = v133;
    (*(void (**)(char *, uint64_t, uint64_t))(v137 + 16))(v133, v48, v138);
    v52 = *MEMORY[0x24BDFF510];
    v53 = *(void (**)(char *, uint64_t, uint64_t))(v49 + 104);
    v54 = v23;
    v53(v23, v52, v50);
    sub_21EC66630(&qword_255481D10, (uint64_t (*)(uint64_t))MEMORY[0x24BDFF528], MEMORY[0x24BDFF538]);
    v55 = v47;
    LOBYTE(v47) = sub_21EC7D088();
    v56 = *(void (**)(char *, uint64_t))(v49 + 8);
    v56(v54, v50);
    v56(v51, v50);
    if ((v47 & 1) != 0)
    {
      (*(void (**)(uint64_t, char *))(v55 + 8))(v141, v139);
      return;
    }
    v53(v51, v52, v50);
    swift_beginAccess();
    (*(void (**)(uint64_t, char *, uint64_t))(v49 + 24))(v48, v51, v50);
    swift_endAccess();
    sub_21EC71508();
    v56(v51, v50);
    v68 = v141;
    sub_21EC775BC(1, v141);
    v147 = 0;
    v148 = 0xE000000000000000;
    sub_21EC7D274();
    sub_21EC7D0B8();
    v69 = v139;
    sub_21EC7D274();
    (*(void (**)(uint64_t, char *))(v55 + 8))(v68, v69);
    goto LABEL_21;
  }
  v59 = v133;
  if (v31 == *MEMORY[0x24BDFF450])
  {
    v60 = v144 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_currentState;
    swift_beginAccess();
    v62 = v137;
    v61 = v138;
    v63 = v59;
    (*(void (**)(char *, uint64_t, uint64_t))(v137 + 16))(v59, v60, v138);
    v64 = *MEMORY[0x24BDFF510];
    v65 = *(void (**)(char *, uint64_t, uint64_t))(v62 + 104);
    v65(v23, v64, v61);
    sub_21EC66630(&qword_255481D10, (uint64_t (*)(uint64_t))MEMORY[0x24BDFF528], MEMORY[0x24BDFF538]);
    v66 = sub_21EC7D088();
    v67 = *(void (**)(char *, uint64_t))(v62 + 8);
    v67(v23, v61);
    v67(v63, v61);
    if ((v66 & 1) != 0)
      return;
    v65(v63, v64, v61);
    swift_beginAccess();
    (*(void (**)(uint64_t, char *, uint64_t))(v62 + 24))(v60, v63, v61);
    swift_endAccess();
    sub_21EC71508();
    v67(v63, v61);
    sub_21EC77A18();
    goto LABEL_16;
  }
  if (v31 == *MEMORY[0x24BDFF428])
  {
    v71 = v137;
    v70 = v138;
    (*(void (**)(char *, _QWORD, uint64_t))(v137 + 104))(v133, *MEMORY[0x24BDFF500], v138);
    v72 = v37 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_currentState;
    swift_beginAccess();
    (*(void (**)(uint64_t, char *, uint64_t))(v71 + 24))(v72, v59, v70);
    swift_endAccess();
    sub_21EC71508();
    (*(void (**)(char *, uint64_t))(v71 + 8))(v59, v70);
    sub_21EC75254();
LABEL_20:
    v149[0] = 0;
    v149[1] = 0xE000000000000000;
    sub_21EC7D274();
    goto LABEL_21;
  }
  if (v31 != *MEMORY[0x24BDFF438])
  {
    if (v31 == *MEMORY[0x24BDFF410])
    {
      v81 = v144 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_currentState;
      swift_beginAccess();
      v83 = v137;
      v82 = v138;
      v84 = v59;
      (*(void (**)(char *, uint64_t, uint64_t))(v137 + 16))(v59, v81, v138);
      v85 = *MEMORY[0x24BDFF510];
      v86 = *(void (**)(char *, uint64_t, uint64_t))(v83 + 104);
      v86(v23, v85, v82);
      sub_21EC66630(&qword_255481D10, (uint64_t (*)(uint64_t))MEMORY[0x24BDFF528], MEMORY[0x24BDFF538]);
      v87 = sub_21EC7D088();
      v88 = *(void (**)(char *, uint64_t))(v83 + 8);
      v88(v23, v82);
      v88(v84, v82);
      if ((v87 & 1) != 0)
        return;
      v86(v84, v85, v82);
      swift_beginAccess();
      (*(void (**)(uint64_t, char *, uint64_t))(v83 + 24))(v81, v84, v82);
      swift_endAccess();
      sub_21EC71508();
      v88(v84, v82);
      sub_21EC772B4(2);
    }
    else
    {
      if (v31 != *MEMORY[0x24BDFF440])
      {
        if (v31 != *MEMORY[0x24BDFF430])
        {
          v123 = v129;
          sub_21EC7CD94();
          v124 = sub_21EC7CFF8();
          v125 = sub_21EC7D13C();
          if (os_log_type_enabled(v124, v125))
          {
            v126 = (uint8_t *)swift_slowAlloc();
            v127 = swift_slowAlloc();
            v149[0] = v127;
            *(_DWORD *)v126 = 136315138;
            v147 = sub_21EC68898(0xD000000000000013, 0x800000021EC7FE50, v149);
            sub_21EC7D1B4();
            _os_log_impl(&dword_21EC60000, v124, v125, "[TWICE] %s @unknown default", v126, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x2207BA9A0](v127, -1, -1);
            MEMORY[0x2207BA9A0](v126, -1, -1);
          }

          (*(void (**)(char *, uint64_t))(v134 + 8))(v123, v135);
          (*(void (**)(char *, uint64_t))(v27 + 8))(v29, v140);
          goto LABEL_21;
        }
        v115 = v137;
        v114 = v138;
        (*(void (**)(char *, _QWORD, uint64_t))(v137 + 104))(v133, *MEMORY[0x24BDFF510], v138);
        v116 = v37 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_currentState;
        swift_beginAccess();
        (*(void (**)(uint64_t, char *, uint64_t))(v115 + 24))(v116, v59, v114);
        swift_endAccess();
        sub_21EC71508();
        (*(void (**)(char *, uint64_t))(v115 + 8))(v59, v114);
        sub_21EC77A18();
        v117 = *(void **)(v37 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_mainVC);
        sub_21EC7CF98();
        v118 = v117;
        v119 = (void *)sub_21EC7CF38();
        v120 = sub_21EC7CF44();
        v122 = v121;

        sub_21EC657A0(v120, v122, 0xD000000000000016, 0x800000021EC7E600);
        swift_bridgeObjectRelease();
        goto LABEL_20;
      }
      v93 = v144 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_currentState;
      swift_beginAccess();
      v95 = v137;
      v94 = v138;
      v96 = v59;
      (*(void (**)(char *, uint64_t, uint64_t))(v137 + 16))(v59, v93, v138);
      v97 = *MEMORY[0x24BDFF510];
      v98 = *(void (**)(char *, uint64_t, uint64_t))(v95 + 104);
      v98(v23, v97, v94);
      sub_21EC66630(&qword_255481D10, (uint64_t (*)(uint64_t))MEMORY[0x24BDFF528], MEMORY[0x24BDFF538]);
      v99 = sub_21EC7D088();
      v100 = *(void (**)(char *, uint64_t))(v95 + 8);
      v100(v23, v94);
      v100(v96, v94);
      if ((v99 & 1) != 0)
        return;
      v98(v96, v97, v94);
      swift_beginAccess();
      (*(void (**)(uint64_t, char *, uint64_t))(v95 + 24))(v93, v96, v94);
      swift_endAccess();
      sub_21EC71508();
      v100(v96, v94);
      sub_21EC77A18();
      v101 = *(void **)(v37 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_mainVC);
      sub_21EC7CF98();
      v102 = v101;
      v103 = (void *)sub_21EC7CF38();
      v104 = sub_21EC7CF44();
      v106 = v105;

      sub_21EC657A0(v104, v106, 0xD000000000000016, 0x800000021EC7E600);
      swift_bridgeObjectRelease();
    }
LABEL_16:
    v147 = 0;
    v148 = 0xE000000000000000;
LABEL_4:
    sub_21EC7D274();
LABEL_21:
    sub_21EC7CF98();
    v73 = (void *)sub_21EC7CF38();
    sub_21EC7CF50();
    swift_bridgeObjectRelease();

    return;
  }
  v74 = v144 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_currentState;
  swift_beginAccess();
  v75 = v137;
  v76 = v138;
  v77 = *(void (**)(char *, uint64_t, uint64_t))(v137 + 16);
  v77(v139, v74, v138);
  v78 = *MEMORY[0x24BDFF508];
  v79 = v136;
  v142 = *(_QWORD **)(v75 + 104);
  ((void (*)(char *, uint64_t, uint64_t))v142)(v136, v78, v76);
  sub_21EC66630((unint64_t *)&unk_255481D60, (uint64_t (*)(uint64_t))MEMORY[0x24BDFF528], MEMORY[0x24BDFF540]);
  sub_21EC7D0D0();
  sub_21EC7D0D0();
  if (v147 == v145 && v148 == v146)
    v80 = 1;
  else
    v80 = sub_21EC7D2EC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v89 = v138;
  v90 = *(void (**)(char *, uint64_t))(v137 + 8);
  v90(v79, v138);
  v90(v139, v89);
  if ((v80 & 1) != 0)
    goto LABEL_39;
  v91 = v131;
  v77(v131, v74, v89);
  v92 = v130;
  ((void (*)(char *, _QWORD, uint64_t))v142)(v130, *MEMORY[0x24BDFF520], v89);
  sub_21EC7D0D0();
  sub_21EC7D0D0();
  if (v147 == v145 && v148 == v146)
  {
    swift_bridgeObjectRelease_n();
    v90(v92, v89);
    v90(v91, v89);
LABEL_39:
    v108 = v132;
    sub_21EC7CD94();
    v109 = sub_21EC7CFF8();
    v110 = sub_21EC7D13C();
    if (os_log_type_enabled(v109, v110))
    {
      v111 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v111 = 0;
      _os_log_impl(&dword_21EC60000, v109, v110, "[TWICE] airplayDidStopStreamingError:", v111, 2u);
      MEMORY[0x2207BA9A0](v111, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v134 + 8))(v108, v135);
    v112 = v133;
    v113 = v138;
    ((void (*)(char *, _QWORD, uint64_t))v142)(v133, *MEMORY[0x24BDFF510], v138);
    swift_beginAccess();
    (*(void (**)(uint64_t, char *, uint64_t))(v137 + 24))(v74, v112, v113);
    swift_endAccess();
    sub_21EC71508();
    v90(v112, v113);
    sub_21EC772B4(1);
    v147 = 0;
    v148 = 0xE000000000000000;
    goto LABEL_4;
  }
  v107 = sub_21EC7D2EC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v90(v92, v89);
  v90(v91, v89);
  if ((v107 & 1) != 0)
    goto LABEL_39;
}

uint64_t sub_21EC772B4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  void (*v18)(char *, uint64_t);
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD aBlock[6];

  v23 = a1;
  v26 = sub_21EC7D01C();
  v29 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_21EC7D040();
  v27 = *(_QWORD *)(v4 - 8);
  v28 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_21EC7D010();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (uint64_t *)((char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = sub_21EC7D058();
  v12 = *(_QWORD *)(v11 - 8);
  v24 = v11;
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v23 - v16;
  sub_21EC77A18();
  v25 = *(_QWORD *)(v1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_eventSerialQueue);
  sub_21EC7D04C();
  *v10 = v23;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x24BEE5420], v7);
  MEMORY[0x2207BA100](v15, v10);
  (*(void (**)(_QWORD *, uint64_t))(v8 + 8))(v10, v7);
  v18 = *(void (**)(char *, uint64_t))(v12 + 8);
  v18(v15, v11);
  v19 = swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = sub_21EC7CB18;
  aBlock[5] = v19;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21EC65AAC;
  aBlock[3] = &block_descriptor_40;
  v20 = _Block_copy(aBlock);
  swift_retain();
  sub_21EC7D028();
  v30 = MEMORY[0x24BEE4AF8];
  sub_21EC66630((unint64_t *)&qword_255481CD0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2554816C0);
  sub_21EC7C8FC((unint64_t *)&qword_255481CE0, &qword_2554816C0);
  v21 = v26;
  sub_21EC7D1D8();
  MEMORY[0x2207BA1FC](v17, v6, v3, v20);
  _Block_release(v20);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v3, v21);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v6, v28);
  v18(v17, v24);
  swift_release();
  return swift_release();
}

uint64_t sub_21EC775BC(char a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  int v13;
  unint64_t v14;
  const char *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[2];
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;

  v4 = sub_21EC7D004();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_21EC7CFEC();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (void *)sub_21EC7D094();
  MGGetBoolAnswer();

  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  v13 = (*(uint64_t (**)(char *, uint64_t))(v9 + 88))(v11, v8);
  if (v13 == *MEMORY[0x24BDFF558])
  {
    swift_bridgeObjectRelease();
LABEL_14:
    v21 = *(void **)(v28 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_mainVC);
    sub_21EC7CF98();
    v22 = v21;
    v23 = (void *)sub_21EC7CF38();
    v24 = sub_21EC7CF44();
    v26 = v25;

    swift_bridgeObjectRelease();
    sub_21EC657A0(v24, v26, 0xD000000000000016, 0x800000021EC7E600);

    return swift_bridgeObjectRelease();
  }
  if (v13 == *MEMORY[0x24BDFF550])
  {
    v29 = 0;
    v30 = 0xE000000000000000;
    sub_21EC7D208();
    swift_bridgeObjectRelease();
    if ((a1 & 1) != 0)
    {
      v14 = 0xD000000000000024;
      v15 = "AX_APPLE_WATCH_REMOTE_SCREEN_IPHONE_";
    }
    else
    {
      v14 = 0xD000000000000023;
      v15 = "AX_APPLE_WATCH_REMOTE_SCREEN_GIZMO_";
    }
    v29 = v14;
    v30 = (unint64_t)(v15 - 32) | 0x8000000000000000;
    goto LABEL_13;
  }
  if (v13 == *MEMORY[0x24BDFF560])
  {
    v29 = 0;
    v30 = 0xE000000000000000;
    sub_21EC7D208();
    sub_21EC7D0B8();
LABEL_13:
    sub_21EC7D0B8();
    swift_bridgeObjectRelease();
    sub_21EC7D0B8();
    goto LABEL_14;
  }
  swift_bridgeObjectRelease();
  sub_21EC7CD94();
  v16 = sub_21EC7CFF8();
  v17 = sub_21EC7D13C();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc();
    v28 = swift_slowAlloc();
    v29 = v28;
    *(_DWORD *)v18 = 136315138;
    v27[1] = v18 + 4;
    v31 = sub_21EC68898(0xD000000000000033, 0x800000021EC7FED0, (uint64_t *)&v29);
    sub_21EC7D1B4();
    _os_log_impl(&dword_21EC60000, v16, v17, "[TWICE] %s unknown status error", v18, 0xCu);
    v19 = v28;
    swift_arrayDestroy();
    MEMORY[0x2207BA9A0](v19, -1, -1);
    MEMORY[0x2207BA9A0](v18, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

void sub_21EC77A18()
{
  void *v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char *v11;
  void *v12;
  uint64_t inited;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t aBlock;
  uint64_t v26;
  uint64_t (*v27)(uint64_t);
  void *v28;
  void (*v29)();
  uint64_t v30;

  v1 = sub_21EC7D01C();
  v2 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v24 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_21EC7D040();
  v5 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21EC66B28(0, (unint64_t *)&qword_255481B40);
  v8 = (void *)sub_21EC7D178();
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v0;
  v29 = sub_21EC7C8F4;
  v30 = v9;
  aBlock = MEMORY[0x24BDAC760];
  v26 = 1107296256;
  v27 = sub_21EC65AAC;
  v28 = &block_descriptor_21;
  v10 = _Block_copy(&aBlock);
  v11 = v0;
  swift_release();
  sub_21EC7D028();
  aBlock = MEMORY[0x24BEE4AF8];
  sub_21EC66630((unint64_t *)&qword_255481CD0, v2, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2554816C0);
  sub_21EC7C8FC((unint64_t *)&qword_255481CE0, &qword_2554816C0);
  sub_21EC7D1D8();
  MEMORY[0x2207BA220](0, v7, v4, v10);
  _Block_release(v10);

  (*(void (**)(char *, uint64_t))(v24 + 8))(v4, v1);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v23);
  v12 = *(void **)&v11[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_remoteMessenger];
  __swift_instantiateConcreteTypeFromMangledName(&qword_255481CE8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21EC7E100;
  v14 = v12;
  aBlock = sub_21EC7CE18();
  v26 = v15;
  v16 = MEMORY[0x24BEE0D00];
  sub_21EC7D1FC();
  v17 = sub_21EC7CE30();
  *(_QWORD *)(inited + 96) = v16;
  *(_QWORD *)(inited + 72) = v17;
  *(_QWORD *)(inited + 80) = v18;
  sub_21EC77D24(inited);
  MEMORY[0x2207B9F80]();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v19 = sub_21EC70630();
  if (v19)
  {
    v20 = v19;
    v21 = (void *)sub_21EC7D094();
    objc_msgSend(v20, sel_endHandlingHIDEventsForReason_, v21);

  }
  v22 = sub_21EC7055C();
  objc_msgSend(v22, sel_cleanup);

}

unint64_t sub_21EC77D24(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  _OWORD v15[2];
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255481CF0);
  v2 = sub_21EC7D2BC();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_21EC7CA88(v6, (uint64_t)v15, &qword_255481CF8);
    result = sub_21EC7B690((uint64_t)v15);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v9 = v3[6] + 40 * result;
    v10 = v15[0];
    v11 = v15[1];
    *(_QWORD *)(v9 + 32) = v16;
    *(_OWORD *)v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    result = (unint64_t)sub_21EC69018(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 72;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_21EC77E64(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  unint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255481D28);
  v2 = (_QWORD *)sub_21EC7D2BC();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (unint64_t *)(a1 + 56);
  while (1)
  {
    v5 = *(v4 - 3);
    v6 = *(v4 - 2);
    v7 = *(v4 - 1);
    v8 = *v4;
    swift_bridgeObjectRetain();
    sub_21EC7C26C(v7, v8);
    result = sub_21EC7B6C0(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    v12 = (uint64_t *)(v2[7] + 16 * result);
    *v12 = v7;
    v12[1] = v8;
    v13 = v2[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4 += 4;
    v2[2] = v15;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_21EC77F88(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255481D40);
  v2 = sub_21EC7D2BC();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_21EC7CA88(v6, (uint64_t)&v15, &qword_255481D48);
    v7 = v15;
    v8 = v16;
    result = sub_21EC7B6C0(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_21EC69018(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

void sub_21EC780BC(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t ObjectType;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  int v29;
  uint64_t v30;
  uint8_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint8_t *v39;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  id v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  id v59;
  char *v60;
  char *v61;
  uint64_t v62;
  id v63;
  uint8_t *v64;
  uint8_t *v65;
  void *v66;
  int v67;
  NSObject *v68;
  uint64_t v69;
  uint64_t v70;
  id v71[4];

  v71[3] = *(id *)MEMORY[0x24BDAC8D0];
  v6 = sub_21EC7D004();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v62 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_mainVC;
  v11 = *(id *)(a1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_mainVC);
  v12 = sub_21EC63D24();
  v14 = v13;

  ObjectType = swift_getObjectType();
  v16 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v14 + 152))(ObjectType, v14);

  if (v16)
  {
    v69 = a1;
    v17 = objc_allocWithZone(MEMORY[0x24BEBADD0]);
    sub_21EC7C26C(a2, a3);
    v18 = (void *)sub_21EC7CD58();
    v19 = objc_msgSend(v17, sel_initWithHierarchyData_, v18);
    sub_21EC7C2B0(a2, a3);

    v71[0] = 0;
    v20 = objc_msgSend(v19, sel_decodeHierarchyWithContainer_error_, v16, v71);
    if (v20)
    {
      v21 = v20;
      v22 = v71[0];
      v23 = objc_msgSend(v21, sel_accessibilityElements);
      if (v23
        && (v24 = v23,
            v25 = sub_21EC7D0F4(),
            v24,
            v26 = sub_21EC78584(v25),
            swift_bridgeObjectRelease(),
            v26))
      {
        sub_21EC7CD94();
        swift_bridgeObjectRetain_n();
        v27 = sub_21EC7CFF8();
        v28 = sub_21EC7D148();
        v29 = v28;
        if (os_log_type_enabled(v27, v28))
        {
          v68 = v27;
          v30 = swift_slowAlloc();
          v67 = v29;
          v31 = (uint8_t *)v30;
          v66 = (void *)swift_slowAlloc();
          v71[0] = v66;
          v65 = v31;
          *(_DWORD *)v31 = 136315138;
          v64 = v31 + 4;
          v32 = sub_21EC66B28(0, (unint64_t *)&qword_2554819C0);
          v33 = swift_bridgeObjectRetain();
          v34 = MEMORY[0x2207BA19C](v33, v32);
          v63 = v19;
          v35 = v34;
          v37 = v36;
          swift_bridgeObjectRelease();
          v38 = v35;
          v19 = v63;
          v70 = sub_21EC68898(v38, v37, (uint64_t *)v71);
          sub_21EC7D1B4();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          v39 = v65;
          _os_log_impl(&dword_21EC60000, v68, (os_log_type_t)v67, "[TWICE] adding %s", v65, 0xCu);
          v40 = v66;
          swift_arrayDestroy();
          MEMORY[0x2207BA9A0](v40, -1, -1);
          MEMORY[0x2207BA9A0](v39, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
        v43 = v69;
        v44 = *(id *)(v69 + v10);
        v45 = sub_21EC63D24();
        v47 = v46;

        v48 = swift_getObjectType();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v47 + 200))(1, v48, v47);

        v49 = *(id *)(v43 + v10);
        v50 = sub_21EC63D24();
        v52 = v51;

        v53 = swift_getObjectType();
        v54 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v52 + 152))(v53, v52);

        if (v54)
        {
          objc_msgSend(v21, sel_accessibilityFrame);
          v56 = v55;
          v58 = v57;
          v59 = *(id *)(v43 + v10);
          v60 = (char *)sub_21EC63BE8();

          v61 = &v60[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_isCrownOrientationOnRightSide];
          swift_beginAccess();
          LOBYTE(v61) = *v61;

          sub_21EC67A18(v26, (char)v61, v56, v58);
        }
        swift_bridgeObjectRelease();

      }
      else
      {

      }
    }
    else
    {
      v41 = v71[0];
      v42 = (void *)sub_21EC7CD4C();

      swift_willThrow();
    }
  }
}

uint64_t sub_21EC78584(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;
  _BYTE v5[32];
  uint64_t v6;

  v6 = MEMORY[0x24BEE4AF8];
  v2 = *(_QWORD *)(a1 + 16);
  sub_21EC7D250();
  if (!v2)
    return v6;
  for (i = a1 + 32; ; i += 32)
  {
    sub_21EC68BC8(i, (uint64_t)v5);
    sub_21EC66B28(0, (unint64_t *)&qword_2554819C0);
    if (!swift_dynamicCast())
      break;
    sub_21EC7D238();
    sub_21EC7D25C();
    sub_21EC7D268();
    sub_21EC7D244();
    if (!--v2)
      return v6;
  }
  swift_release();

  return 0;
}

void sub_21EC7869C(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t ObjectType;
  id v5;

  v1 = *(id *)(a1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_mainVC);
  v5 = sub_21EC63D24();
  v3 = v2;

  ObjectType = swift_getObjectType();
  (*(void (**)(_QWORD, uint64_t, uint64_t))(v3 + 200))(0, ObjectType, v3);

}

uint64_t sub_21EC78704(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t result;
  void *v15;
  _BYTE v16[24];

  v2 = sub_21EC7CFC8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = &v16[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = sub_21EC7CFE0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = &v16[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = a1 + 16;
  swift_beginAccess();
  v11 = MEMORY[0x2207BA9E8](a1 + 16);
  if (v11)
  {
    v12 = (char *)v11;
    (*(void (**)(_BYTE *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x24BDFF510], v6);
    v13 = &v12[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_currentState];
    swift_beginAccess();
    (*(void (**)(char *, _BYTE *, uint64_t))(v7 + 24))(v13, v9, v6);
    swift_endAccess();
    sub_21EC71508();
    (*(void (**)(_BYTE *, uint64_t))(v7 + 8))(v9, v6);

  }
  swift_beginAccess();
  result = MEMORY[0x2207BA9E8](v10);
  if (result)
  {
    v15 = (void *)result;
    (*(void (**)(_BYTE *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BDFF4C0], v2);
    sub_21EC71C4C(v5);

    return (*(uint64_t (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
  }
  return result;
}

Swift::Void __swiftcall AXTwiceCompanionRootViewController.twiceRemoteScreenReceiveMessage(_:)(Swift::OpaquePointer a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  char *v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  BOOL v27;
  unint64_t v28;
  char v29;
  uint64_t v30;
  unsigned int *v31;
  unsigned int *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(char *, _QWORD, uint64_t);
  void (*v38)(char *, uint64_t);
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  uint64_t v43;
  BOOL v44;
  unint64_t v45;
  unint64_t v46;
  char v47;
  char *v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  unsigned int *v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  NSObject *v63;
  char *v64;
  os_log_type_t v65;
  uint8_t *v66;
  uint8_t *v67;
  uint8_t *v68;
  uint8_t *v69;
  NSObject *v70;
  os_log_type_t v71;
  uint8_t *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  BOOL v78;
  uint64_t v79;
  unint64_t v80;
  unint64_t v81;
  char v82;
  uint64_t v83;
  unint64_t v84;
  unint64_t v85;
  unint64_t v86;
  char v87;
  unint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char v91;
  unint64_t v92;
  unint64_t v93;
  char v94;
  unint64_t v95;
  uint64_t v96;
  uint64_t v97;
  char v98;
  uint64_t v99;
  uint64_t v100;
  unint64_t v101;
  unint64_t v102;
  char v103;
  unint64_t v104;
  unint64_t v105;
  char v106;
  unint64_t v107;
  unint64_t v108;
  char v109;
  unint64_t v110;
  uint64_t v111;
  uint64_t v112;
  NSObject *v113;
  os_log_type_t v114;
  uint8_t *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  char *v119;
  uint8_t *v120;
  uint64_t v121;
  uint64_t v122;
  char *v123;
  uint64_t v124;
  unint64_t v125;
  uint64_t v126[5];
  __int128 v127;
  __int128 v128;

  v2 = v1;
  v4 = sub_21EC7D004();
  v121 = *(_QWORD *)(v4 - 8);
  v122 = v4;
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v119 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (uint8_t *)&v119 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v123 = (char *)&v119 - v11;
  v12 = sub_21EC7CFC8();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v119 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v124 = sub_21EC7CE48();
  v125 = v16;
  sub_21EC7D1FC();
  v17 = *((_QWORD *)a1._rawValue + 2);
  v120 = v10;
  if (v17 && (v18 = sub_21EC7B690((uint64_t)v126), (v19 & 1) != 0))
  {
    sub_21EC68BC8(*((_QWORD *)a1._rawValue + 7) + 32 * v18, (uint64_t)&v127);
  }
  else
  {
    v127 = 0u;
    v128 = 0u;
  }
  sub_21EC7C1FC((uint64_t)v126);
  if (*((_QWORD *)&v128 + 1))
  {
    if ((swift_dynamicCast() & 1) != 0 && v124 == 1)
    {
      (*(void (**)(char *, _QWORD, uint64_t))(v13 + 104))(v15, *MEMORY[0x24BDFF4A0], v12);
      sub_21EC71C4C((uint64_t)v15);
      (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    }
  }
  else
  {
    sub_21EC7C230((uint64_t)&v127, &qword_255481BB0);
  }
  v124 = sub_21EC7CDE8();
  v125 = v20;
  sub_21EC7D1FC();
  if (*((_QWORD *)a1._rawValue + 2) && (v21 = sub_21EC7B690((uint64_t)v126), (v22 & 1) != 0))
  {
    sub_21EC68BC8(*((_QWORD *)a1._rawValue + 7) + 32 * v21, (uint64_t)&v127);
  }
  else
  {
    v127 = 0u;
    v128 = 0u;
  }
  sub_21EC7C1FC((uint64_t)v126);
  if (!*((_QWORD *)&v128 + 1))
  {
    sub_21EC7C230((uint64_t)&v127, &qword_255481BB0);
    goto LABEL_37;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255481BB8);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v119 = v7;
    v23 = v1;
    v24 = v124;
    if (!*(_QWORD *)(v124 + 16))
      goto LABEL_30;
    v25 = sub_21EC7B6C0(21570, 0xE200000000000000);
    if ((v26 & 1) != 0)
    {
      v27 = *(_QWORD *)(*(_QWORD *)(v24 + 56) + 8 * v25) == 1;
      if (!*(_QWORD *)(v24 + 16))
        goto LABEL_26;
    }
    else
    {
      v27 = 0;
      if (!*(_QWORD *)(v24 + 16))
        goto LABEL_26;
    }
    v28 = sub_21EC7B6C0(18007, 0xE200000000000000);
    if ((v29 & 1) != 0)
    {
      v30 = *(_QWORD *)(*(_QWORD *)(v24 + 56) + 8 * v28);
      if (v27)
      {
        if (v30 == 1)
        {
          v31 = (unsigned int *)MEMORY[0x24BDFF4B0];
          goto LABEL_32;
        }
        goto LABEL_27;
      }
      if (v30 == 1)
      {
        v32 = (unsigned int *)MEMORY[0x24BDFF558];
        goto LABEL_31;
      }
LABEL_30:
      v32 = (unsigned int *)MEMORY[0x24BDFF560];
      goto LABEL_31;
    }
LABEL_26:
    if (v27)
    {
LABEL_27:
      v32 = (unsigned int *)MEMORY[0x24BDFF550];
LABEL_31:
      v33 = *v32;
      v34 = sub_21EC7CFEC();
      (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 104))(v15, v33, v34);
      v35 = *MEMORY[0x24BDFF418];
      v36 = sub_21EC7CFA4();
      (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 104))(v15, v35, v36);
      v31 = (unsigned int *)MEMORY[0x24BDFF488];
LABEL_32:
      v37 = *(void (**)(char *, _QWORD, uint64_t))(v13 + 104);
      v37(v15, *v31, v12);
      sub_21EC71C4C((uint64_t)v15);
      v38 = *(void (**)(char *, uint64_t))(v13 + 8);
      v38(v15, v12);
      v39 = sub_21EC7CDB8();
      if (*(_QWORD *)(v24 + 16) && (v41 = sub_21EC7B6C0(v39, v40), (v42 & 1) != 0))
      {
        v43 = *(_QWORD *)(*(_QWORD *)(v24 + 56) + 8 * v41);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v44 = v43 == 1;
      }
      else
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v44 = 0;
      }
      *v15 = v44;
      v37(v15, *MEMORY[0x24BDFF468], v12);
      v2 = v23;
      sub_21EC71C4C((uint64_t)v15);
      v38(v15, v12);
      v7 = v119;
      goto LABEL_37;
    }
    goto LABEL_30;
  }
LABEL_37:
  v124 = sub_21EC7CE0C();
  v125 = v45;
  sub_21EC7D1FC();
  if (*((_QWORD *)a1._rawValue + 2) && (v46 = sub_21EC7B690((uint64_t)v126), (v47 & 1) != 0))
  {
    sub_21EC68BC8(*((_QWORD *)a1._rawValue + 7) + 32 * v46, (uint64_t)&v127);
  }
  else
  {
    v127 = 0u;
    v128 = 0u;
  }
  sub_21EC7C1FC((uint64_t)v126);
  if (*((_QWORD *)&v128 + 1))
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v48 = v2;
      v50 = v124;
      v49 = v125;
      if (v50 == sub_21EC7CE00() && v49 == v51)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        v52 = sub_21EC7D2EC();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v52 & 1) == 0)
        {
          v54 = *MEMORY[0x24BDFF428];
          v55 = sub_21EC7CFA4();
          (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v55 - 8) + 104))(v15, v54, v55);
          v53 = (unsigned int *)MEMORY[0x24BDFF488];
          goto LABEL_50;
        }
      }
      v53 = (unsigned int *)MEMORY[0x24BDFF4B8];
LABEL_50:
      (*(void (**)(char *, _QWORD, uint64_t))(v13 + 104))(v15, *v53, v12);
      v2 = v48;
      sub_21EC71C4C((uint64_t)v15);
      (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    }
  }
  else
  {
    sub_21EC7C230((uint64_t)&v127, &qword_255481BB0);
  }
  v124 = sub_21EC7CDDC();
  v125 = v56;
  sub_21EC7D1FC();
  if (*((_QWORD *)a1._rawValue + 2) && (v57 = sub_21EC7B690((uint64_t)v126), (v58 & 1) != 0))
  {
    sub_21EC68BC8(*((_QWORD *)a1._rawValue + 7) + 32 * v57, (uint64_t)&v127);
  }
  else
  {
    v127 = 0u;
    v128 = 0u;
  }
  sub_21EC7C1FC((uint64_t)v126);
  if (!*((_QWORD *)&v128 + 1))
  {
    sub_21EC7C230((uint64_t)&v127, &qword_255481BB0);
LABEL_61:
    if (!_AXSApplicationAccessibilityEnabled())
      goto LABEL_78;
    goto LABEL_70;
  }
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_61;
  v59 = OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_gizmoErrorRetryLimit;
  if (*(uint64_t *)&v2[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_gizmoErrorRetryLimit] < 1)
  {
    v69 = v120;
    sub_21EC7CD94();
    v70 = sub_21EC7CFF8();
    v71 = sub_21EC7D13C();
    if (os_log_type_enabled(v70, v71))
    {
      v72 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v72 = 0;
      _os_log_impl(&dword_21EC60000, v70, v71, "[TWICE] Gizmo retry limit. Disconnect!", v72, 2u);
      MEMORY[0x2207BA9A0](v72, -1, -1);
    }

    (*(void (**)(uint8_t *, uint64_t))(v121 + 8))(v69, v122);
    v73 = *MEMORY[0x24BDFF440];
    v74 = sub_21EC7CFA4();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v74 - 8) + 104))(v15, v73, v74);
    (*(void (**)(char *, _QWORD, uint64_t))(v13 + 104))(v15, *MEMORY[0x24BDFF488], v12);
    sub_21EC71C4C((uint64_t)v15);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }
  else
  {
    v119 = v7;
    v60 = v13;
    v61 = v124;
    sub_21EC7CD94();
    v62 = v2;
    v63 = sub_21EC7CFF8();
    v64 = v2;
    v65 = sub_21EC7D148();
    if (os_log_type_enabled(v63, v65))
    {
      v66 = (uint8_t *)swift_slowAlloc();
      v120 = (uint8_t *)v61;
      v67 = v66;
      *(_DWORD *)v66 = 134217984;
      v126[0] = *(_QWORD *)&v64[v59];
      sub_21EC7D1B4();

      _os_log_impl(&dword_21EC60000, v63, v65, "[TWICE] Gizmo retry limit. Retry#%ld", v67, 0xCu);
      v68 = v67;
      v61 = (uint64_t)v120;
      MEMORY[0x2207BA9A0](v68, -1, -1);
    }
    else
    {

      v63 = v62;
    }

    (*(void (**)(char *, uint64_t))(v121 + 8))(v123, v122);
    *(_QWORD *)v15 = v61;
    v75 = *MEMORY[0x24BDFF448];
    v76 = sub_21EC7CFA4();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v76 - 8) + 104))(v15, v75, v76);
    (*(void (**)(char *, _QWORD, uint64_t))(v60 + 104))(v15, *MEMORY[0x24BDFF488], v12);
    sub_21EC71C4C((uint64_t)v15);
    (*(void (**)(char *, uint64_t))(v60 + 8))(v15, v12);
    v77 = *(_QWORD *)&v64[v59];
    v78 = __OFSUB__(v77, 1);
    v79 = v77 - 1;
    if (v78)
    {
      __break(1u);
      return;
    }
    v2 = v64;
    *(_QWORD *)&v64[v59] = v79;
    v13 = v60;
    v7 = v119;
  }
  if (_AXSApplicationAccessibilityEnabled())
  {
LABEL_70:
    v124 = sub_21EC7CDF4();
    v125 = v80;
    sub_21EC7D1FC();
    if (*((_QWORD *)a1._rawValue + 2) && (v81 = sub_21EC7B690((uint64_t)v126), (v82 & 1) != 0))
    {
      sub_21EC68BC8(*((_QWORD *)a1._rawValue + 7) + 32 * v81, (uint64_t)&v127);
    }
    else
    {
      v127 = 0u;
      v128 = 0u;
    }
    sub_21EC7C1FC((uint64_t)v126);
    if (*((_QWORD *)&v128 + 1))
    {
      if ((swift_dynamicCast() & 1) != 0)
      {
        v83 = v124;
        v84 = v125;
        *(_QWORD *)v15 = v124;
        *((_QWORD *)v15 + 1) = v84;
        (*(void (**)(char *, _QWORD, uint64_t))(v13 + 104))(v15, *MEMORY[0x24BDFF490], v12);
        sub_21EC7C26C(v83, v84);
        sub_21EC71C4C((uint64_t)v15);
        sub_21EC7C2B0(v83, v84);
        (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
      }
    }
    else
    {
      sub_21EC7C230((uint64_t)&v127, &qword_255481BB0);
    }
  }
LABEL_78:
  v124 = sub_21EC7CE18();
  v125 = v85;
  sub_21EC7D1FC();
  if (*((_QWORD *)a1._rawValue + 2) && (v86 = sub_21EC7B690((uint64_t)v126), (v87 & 1) != 0))
  {
    sub_21EC68BC8(*((_QWORD *)a1._rawValue + 7) + 32 * v86, (uint64_t)&v127);
  }
  else
  {
    v127 = 0u;
    v128 = 0u;
  }
  sub_21EC7C1FC((uint64_t)v126);
  if (*((_QWORD *)&v128 + 1))
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v89 = v124;
      v88 = v125;
      if (v89 == sub_21EC7CE30() && v88 == v90)
      {
        swift_bridgeObjectRelease_n();
LABEL_89:
        (*(void (**)(char *, _QWORD, uint64_t))(v13 + 104))(v15, *MEMORY[0x24BDFF4D0], v12);
        sub_21EC71C4C((uint64_t)v15);
        (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
        goto LABEL_90;
      }
      v91 = sub_21EC7D2EC();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v91 & 1) != 0)
        goto LABEL_89;
    }
  }
  else
  {
    sub_21EC7C230((uint64_t)&v127, &qword_255481BB0);
  }
LABEL_90:
  v124 = sub_21EC7CDD0();
  v125 = v92;
  sub_21EC7D1FC();
  if (*((_QWORD *)a1._rawValue + 2) && (v93 = sub_21EC7B690((uint64_t)v126), (v94 & 1) != 0))
  {
    sub_21EC68BC8(*((_QWORD *)a1._rawValue + 7) + 32 * v93, (uint64_t)&v127);
  }
  else
  {
    v127 = 0u;
    v128 = 0u;
  }
  sub_21EC7C1FC((uint64_t)v126);
  if (!*((_QWORD *)&v128 + 1))
  {
    sub_21EC7C230((uint64_t)&v127, &qword_255481BB0);
    goto LABEL_102;
  }
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_102;
  v96 = v124;
  v95 = v125;
  if (v96 == sub_21EC7CE24() && v95 == v97)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v98 = sub_21EC7D2EC();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v98 & 1) == 0)
      goto LABEL_102;
  }
  v99 = *MEMORY[0x24BDFF440];
  v100 = sub_21EC7CFA4();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v100 - 8) + 104))(v15, v99, v100);
  (*(void (**)(char *, _QWORD, uint64_t))(v13 + 104))(v15, *MEMORY[0x24BDFF488], v12);
  sub_21EC71C4C((uint64_t)v15);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
LABEL_102:
  v124 = sub_21EC7CDB8();
  v125 = v101;
  sub_21EC7D1FC();
  if (*((_QWORD *)a1._rawValue + 2) && (v102 = sub_21EC7B690((uint64_t)v126), (v103 & 1) != 0))
  {
    sub_21EC68BC8(*((_QWORD *)a1._rawValue + 7) + 32 * v102, (uint64_t)&v127);
  }
  else
  {
    v127 = 0u;
    v128 = 0u;
  }
  sub_21EC7C1FC((uint64_t)v126);
  if (*((_QWORD *)&v128 + 1))
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      *v15 = v124 == 1;
      (*(void (**)(char *, _QWORD, uint64_t))(v13 + 104))(v15, *MEMORY[0x24BDFF468], v12);
      sub_21EC71C4C((uint64_t)v15);
      (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    }
  }
  else
  {
    sub_21EC7C230((uint64_t)&v127, &qword_255481BB0);
  }
  v124 = sub_21EC7CDAC();
  v125 = v104;
  sub_21EC7D1FC();
  if (*((_QWORD *)a1._rawValue + 2) && (v105 = sub_21EC7B690((uint64_t)v126), (v106 & 1) != 0))
  {
    sub_21EC68BC8(*((_QWORD *)a1._rawValue + 7) + 32 * v105, (uint64_t)&v127);
  }
  else
  {
    v127 = 0u;
    v128 = 0u;
  }
  sub_21EC7C1FC((uint64_t)v126);
  if (!*((_QWORD *)&v128 + 1))
    goto LABEL_128;
  if (!swift_dynamicCast())
    return;
  v124 = sub_21EC7CDA0();
  v125 = v107;
  sub_21EC7D1FC();
  if (*((_QWORD *)a1._rawValue + 2) && (v108 = sub_21EC7B690((uint64_t)v126), (v109 & 1) != 0))
  {
    sub_21EC68BC8(*((_QWORD *)a1._rawValue + 7) + 32 * v108, (uint64_t)&v127);
  }
  else
  {
    v127 = 0u;
    v128 = 0u;
  }
  sub_21EC7C1FC((uint64_t)v126);
  if (*((_QWORD *)&v128 + 1))
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v110 = v125;
      v111 = *(_QWORD *)&v2[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_initialPingMessageIdentifier
                          + 8];
      if (v111
        && ((v112 = v124,
             v124 == *(_QWORD *)&v2[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_initialPingMessageIdentifier])
         && v111 == v125
         || (sub_21EC7D2EC() & 1) != 0))
      {
        v123 = v2;
        sub_21EC7CD94();
        swift_bridgeObjectRetain();
        v113 = sub_21EC7CFF8();
        v114 = sub_21EC7D130();
        if (os_log_type_enabled(v113, v114))
        {
          v115 = (uint8_t *)swift_slowAlloc();
          v116 = swift_slowAlloc();
          v126[0] = v116;
          v119 = v7;
          *(_DWORD *)v115 = 136315138;
          v120 = v115 + 4;
          swift_bridgeObjectRetain();
          *(_QWORD *)&v127 = sub_21EC68898(v112, v110, v126);
          sub_21EC7D1B4();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_21EC60000, v113, v114, "[TWICE] Got timeout for message identifier matching initial ping (%s). Showing first unlock error.", v115, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x2207BA9A0](v116, -1, -1);
          MEMORY[0x2207BA9A0](v115, -1, -1);

          (*(void (**)(char *, uint64_t))(v121 + 8))(v119, v122);
        }
        else
        {

          swift_bridgeObjectRelease_n();
          (*(void (**)(char *, uint64_t))(v121 + 8))(v7, v122);
        }
        v117 = *MEMORY[0x24BDFF430];
        v118 = sub_21EC7CFA4();
        (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v118 - 8) + 104))(v15, v117, v118);
        (*(void (**)(char *, _QWORD, uint64_t))(v13 + 104))(v15, *MEMORY[0x24BDFF488], v12);
        sub_21EC71C4C((uint64_t)v15);
        (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
  }
  else
  {
LABEL_128:
    sub_21EC7C230((uint64_t)&v127, &qword_255481BB0);
  }
}

Swift::Void __swiftcall AXTwiceCompanionRootViewController.airplayDidStartStreaming(withMirroringLayer:)(CALayer withMirroringLayer)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  objc_class *v11;
  NSObject *v12;
  os_log_type_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  objc_class *v18;
  _QWORD *v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  _BYTE v25[4];
  int v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _BYTE *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v2 = v1;
  v33 = sub_21EC7CFC8();
  v4 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  v6 = &v25[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = sub_21EC7D004();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = &v25[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_21EC7CD94();
  v11 = withMirroringLayer.super.isa;
  v12 = sub_21EC7CFF8();
  v13 = sub_21EC7D148();
  v14 = v13;
  if (os_log_type_enabled(v12, v13))
  {
    v15 = swift_slowAlloc();
    v31 = v8;
    v16 = v15;
    v27 = (_QWORD *)swift_slowAlloc();
    v29 = swift_slowAlloc();
    v35 = v29;
    *(_DWORD *)v16 = 136315394;
    v30 = v7;
    v34 = sub_21EC68898(0xD00000000000002DLL, 0x800000021EC7F870, &v35);
    v32 = v6;
    v28 = v4;
    sub_21EC7D1B4();
    *(_WORD *)(v16 + 12) = 2112;
    v26 = v14;
    v34 = (uint64_t)v11;
    v17 = v2;
    v18 = v11;
    v4 = v28;
    v6 = v32;
    sub_21EC7D1B4();
    v19 = v27;
    *v27 = v11;

    v2 = v17;
    v20 = v12;
    _os_log_impl(&dword_21EC60000, v12, (os_log_type_t)v26, "[TWICE] %s %@", (uint8_t *)v16, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255481BC0);
    swift_arrayDestroy();
    MEMORY[0x2207BA9A0](v19, -1, -1);
    v21 = v29;
    swift_arrayDestroy();
    MEMORY[0x2207BA9A0](v21, -1, -1);
    MEMORY[0x2207BA9A0](v16, -1, -1);

    (*(void (**)(_BYTE *, uint64_t))(v31 + 8))(v10, v30);
  }
  else
  {

    (*(void (**)(_BYTE *, uint64_t))(v8 + 8))(v10, v7);
  }
  v22 = *(id *)(v2 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_mainVC);
  v23 = sub_21EC63D24();

  swift_getObjectType();
  AXTwiceCompanionDeviceView.addScreenSubLayer(layer:)((CALayer)v11);

  v24 = v33;
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BDFF4D8], v33);
  sub_21EC71C4C((uint64_t)v6);
  (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v24);
}

Swift::Void __swiftcall AXTwiceCompanionRootViewController.airplayDidStopStreaming()()
{
  sub_21EC79E18(0xD000000000000019, 0x800000021EC7F8A0, "[TWICE] %s", MEMORY[0x24BDFF438]);
}

Swift::Void __swiftcall AXTwiceCompanionRootViewController.connectionWithClientServiceWasInterrupted()()
{
  sub_21EC79E18(0xD00000000000002BLL, 0x800000021EC7F8C0, "[TWICE] backbaordd crashed %s", MEMORY[0x24BDFF450]);
}

Swift::Void __swiftcall AXTwiceCompanionRootViewController.axuiserverWasRestarted()()
{
  sub_21EC79E18(0xD000000000000018, 0x800000021EC7F8F0, "[TWICE] axuiserver crashed %s", MEMORY[0x24BDFF410]);
}

uint64_t sub_21EC79E18(uint64_t a1, unint64_t a2, const char *a3, unsigned int *a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;

  v29 = a2;
  v30 = a3;
  v28 = a1;
  v5 = sub_21EC7CFC8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_21EC7D004();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21EC7CD94();
  v13 = sub_21EC7CFF8();
  v14 = sub_21EC7D148();
  if (os_log_type_enabled(v13, v14))
  {
    v25 = v10;
    v15 = swift_slowAlloc();
    v24 = v9;
    v16 = (uint8_t *)v15;
    v17 = swift_slowAlloc();
    v26 = a4;
    v18 = v17;
    v32 = v17;
    v27 = v6;
    *(_DWORD *)v16 = 136315138;
    v31 = sub_21EC68898(v28, v29, &v32);
    v6 = v27;
    sub_21EC7D1B4();
    _os_log_impl(&dword_21EC60000, v13, v14, v30, v16, 0xCu);
    swift_arrayDestroy();
    v19 = v18;
    a4 = v26;
    MEMORY[0x2207BA9A0](v19, -1, -1);
    MEMORY[0x2207BA9A0](v16, -1, -1);

    (*(void (**)(char *, uint64_t))(v25 + 8))(v12, v24);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  v20 = *a4;
  v21 = sub_21EC7CFA4();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 104))(v8, v20, v21);
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x24BDFF488], v5);
  sub_21EC71C4C((uint64_t)v8);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

void AXTwiceCompanionRootViewController.prepareToDisappear(completion:)(uint64_t a1, uint64_t a2)
{
  char *v2;
  char *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t *v20;
  char *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t aBlock[6];

  v3 = v2;
  v6 = sub_21EC7CFE0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_21EC7D004();
  v30 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21EC7CD94();
  v13 = sub_21EC7CFF8();
  v14 = sub_21EC7D148();
  if (os_log_type_enabled(v13, v14))
  {
    v26 = v10;
    v15 = swift_slowAlloc();
    v28 = a2;
    v16 = (uint8_t *)v15;
    v17 = swift_slowAlloc();
    v29 = v3;
    v18 = v17;
    aBlock[0] = v17;
    v27 = a1;
    *(_DWORD *)v16 = 136315138;
    v31 = sub_21EC68898(0xD00000000000001FLL, 0x800000021EC7F910, aBlock);
    a1 = v27;
    sub_21EC7D1B4();
    _os_log_impl(&dword_21EC60000, v13, v14, "[TWICE] %s", v16, 0xCu);
    swift_arrayDestroy();
    v19 = v18;
    v3 = v29;
    MEMORY[0x2207BA9A0](v19, -1, -1);
    v20 = v16;
    a2 = v28;
    MEMORY[0x2207BA9A0](v20, -1, -1);

    (*(void (**)(char *, uint64_t))(v30 + 8))(v12, v26);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v30 + 8))(v12, v10);
  }
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x24BDFF510], v6);
  v21 = &v3[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_currentState];
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v7 + 24))(v21, v9, v6);
  swift_endAccess();
  sub_21EC71508();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_21EC77A18();
  v22 = objc_msgSend(v3, sel_view);
  if (v22)
  {
    v23 = v22;
    v24 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
    objc_msgSend(v23, sel_setBackgroundColor_, v24);

    if (a1)
    {
      aBlock[4] = a1;
      aBlock[5] = a2;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_21EC65AAC;
      aBlock[3] = (uint64_t)&block_descriptor_9;
      v25 = _Block_copy(aBlock);
      swift_retain();
      swift_release();
    }
    else
    {
      v25 = 0;
    }
    objc_msgSend(v3, sel_dismissViewControllerAnimated_completion_, 1, v25);
    _Block_release(v25);
  }
  else
  {
    __break(1u);
  }
}

Swift::Void __swiftcall AXTwiceCompanionRootViewController.axElementActivate(_:)(CGPoint a1)
{
  uint64_t v1;
  uint64_t v2;
  double y;
  double x;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v2 = v1;
  y = a1.y;
  x = a1.x;
  v5 = sub_21EC7CFC8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (uint64_t *)((char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = sub_21EC7D004();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21EC7CD94();
  v13 = sub_21EC7CFF8();
  v14 = sub_21EC7D148();
  if (os_log_type_enabled(v13, v14))
  {
    v23 = v9;
    v15 = swift_slowAlloc();
    v25 = v5;
    v16 = (uint8_t *)v15;
    v17 = swift_slowAlloc();
    v24 = v2;
    v18 = v17;
    v27 = v17;
    *(_DWORD *)v16 = 136315138;
    v26 = sub_21EC68898(0xD000000000000015, 0x800000021EC7F930, &v27);
    sub_21EC7D1B4();
    _os_log_impl(&dword_21EC60000, v13, v14, "[TWICE] %s", v16, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207BA9A0](v18, -1, -1);
    v19 = v16;
    v5 = v25;
    MEMORY[0x2207BA9A0](v19, -1, -1);

    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v23);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  v20 = objc_msgSend((id)objc_opt_self(), sel_tapGestureForInterfaceOrientedPoint_, x, y);
  *v8 = v20;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x24BDFF478], v5);
  v21 = v20;
  sub_21EC71C4C((uint64_t)v8);

  (*(void (**)(_QWORD *, uint64_t))(v6 + 8))(v8, v5);
}

Swift::Void __swiftcall AXTwiceCompanionRootViewController.crownButtonPressed()()
{
  sub_21EC7B2C0(0xD000000000000014, 0x800000021EC7F950, 1000);
}

Swift::Void __swiftcall AXTwiceCompanionRootViewController.doubleCrownButtonPressed()()
{
  sub_21EC7B2C0(0xD00000000000001ALL, 0x800000021EC7F970, 4202);
}

Swift::Void __swiftcall AXTwiceCompanionRootViewController.tripleCrownButtonPressed()()
{
  sub_21EC7B2C0(0xD00000000000001ALL, 0x800000021EC7F990, 4204);
}

Swift::Void __swiftcall AXTwiceCompanionRootViewController.crownButtonScrollUp()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t *v17;
  id v18;
  void *v19;
  id v20;
  char *v21;
  char *v22;
  int v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31[3];

  v1 = v0;
  v2 = sub_21EC7CFC8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (uint64_t *)((char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = sub_21EC7D004();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21EC7CD94();
  v10 = sub_21EC7CFF8();
  v11 = sub_21EC7D148();
  if (os_log_type_enabled(v10, v11))
  {
    v27 = v6;
    v12 = swift_slowAlloc();
    v29 = v2;
    v13 = (uint8_t *)v12;
    v14 = swift_slowAlloc();
    v28 = v3;
    v15 = v14;
    v31[0] = v14;
    *(_DWORD *)v13 = 136315138;
    v30 = sub_21EC68898(0xD000000000000015, 0x800000021EC7F9B0, v31);
    sub_21EC7D1B4();
    _os_log_impl(&dword_21EC60000, v10, v11, "[TWICE] %s", v13, 0xCu);
    swift_arrayDestroy();
    v16 = v15;
    v3 = v28;
    MEMORY[0x2207BA9A0](v16, -1, -1);
    v17 = v13;
    v2 = v29;
    MEMORY[0x2207BA9A0](v17, -1, -1);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v27);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  v18 = objc_msgSend((id)objc_opt_self(), sel_buttonRepresentationWithType_, 1100);
  if (v18)
  {
    v19 = v18;
    v20 = *(id *)(v1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_mainVC);
    v21 = (char *)sub_21EC63BE8();

    v22 = &v21[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_isCrownOrientationOnRightSide];
    swift_beginAccess();
    v23 = *v22;

    if (v23)
      v24 = 100;
    else
      v24 = -100;
    objc_msgSend(v19, sel_setScrollAmount_, v24);
    *v5 = v19;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BDFF470], v2);
    v25 = v19;
    sub_21EC71C4C((uint64_t)v5);

    (*(void (**)(_QWORD *, uint64_t))(v3 + 8))(v5, v2);
  }
}

Swift::Void __swiftcall AXTwiceCompanionRootViewController.crownButtonScrollDown()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t *v17;
  id v18;
  void *v19;
  id v20;
  char *v21;
  char *v22;
  int v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31[3];

  v1 = v0;
  v2 = sub_21EC7CFC8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (uint64_t *)((char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = sub_21EC7D004();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21EC7CD94();
  v10 = sub_21EC7CFF8();
  v11 = sub_21EC7D148();
  if (os_log_type_enabled(v10, v11))
  {
    v27 = v6;
    v12 = swift_slowAlloc();
    v29 = v2;
    v13 = (uint8_t *)v12;
    v14 = swift_slowAlloc();
    v28 = v3;
    v15 = v14;
    v31[0] = v14;
    *(_DWORD *)v13 = 136315138;
    v30 = sub_21EC68898(0xD000000000000017, 0x800000021EC7F9D0, v31);
    sub_21EC7D1B4();
    _os_log_impl(&dword_21EC60000, v10, v11, "[TWICE] %s", v13, 0xCu);
    swift_arrayDestroy();
    v16 = v15;
    v3 = v28;
    MEMORY[0x2207BA9A0](v16, -1, -1);
    v17 = v13;
    v2 = v29;
    MEMORY[0x2207BA9A0](v17, -1, -1);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v27);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  v18 = objc_msgSend((id)objc_opt_self(), sel_buttonRepresentationWithType_, 1100);
  if (v18)
  {
    v19 = v18;
    v20 = *(id *)(v1 + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_mainVC);
    v21 = (char *)sub_21EC63BE8();

    v22 = &v21[OBJC_IVAR____TtC21AXWatchRemoteScreenUI25AXTwiceCompanionWatchView_isCrownOrientationOnRightSide];
    swift_beginAccess();
    v23 = *v22;

    if (v23)
      v24 = -100;
    else
      v24 = 100;
    objc_msgSend(v19, sel_setScrollAmount_, v24);
    *v5 = v19;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BDFF470], v2);
    v25 = v19;
    sub_21EC71C4C((uint64_t)v5);

    (*(void (**)(_QWORD *, uint64_t))(v3 + 8))(v5, v2);
  }
}

Swift::Void __swiftcall AXTwiceCompanionRootViewController.crownButtonLongPressed()()
{
  sub_21EC7B2C0(0xD000000000000018, 0x800000021EC7F9F0, 1021);
}

Swift::Void __swiftcall AXTwiceCompanionRootViewController.sideButtonPressed()()
{
  sub_21EC7B2C0(0xD000000000000013, 0x800000021EC7FA10, 1103);
}

Swift::Void __swiftcall AXTwiceCompanionRootViewController.sideButtonLongPressed()()
{
  sub_21EC7B2C0(0xD000000000000017, 0x800000021EC7FA30, 1029);
}

uint64_t AXTwiceCompanionRootViewController.axActionPerform(action:value:bridgeElement:)(int a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t *v22;
  id v23;
  _BYTE v25[4];
  int v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v4 = v3;
  v8 = sub_21EC7CFC8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = &v25[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = sub_21EC7D004();
  v30 = *(_QWORD *)(v12 - 8);
  v31 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v14 = &v25[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_21EC7CD94();
  v15 = sub_21EC7CFF8();
  v16 = sub_21EC7D148();
  if (os_log_type_enabled(v15, v16))
  {
    v29 = v4;
    v17 = swift_slowAlloc();
    v27 = a3;
    v18 = (uint8_t *)v17;
    v19 = swift_slowAlloc();
    v28 = v8;
    v20 = v19;
    v33 = v19;
    v26 = a1;
    *(_DWORD *)v18 = 136315138;
    v32 = sub_21EC68898(0xD00000000000002CLL, 0x800000021EC7FA50, &v33);
    a1 = v26;
    sub_21EC7D1B4();
    _os_log_impl(&dword_21EC60000, v15, v16, "[TWICE] %s", v18, 0xCu);
    swift_arrayDestroy();
    v21 = v20;
    v8 = v28;
    MEMORY[0x2207BA9A0](v21, -1, -1);
    v22 = v18;
    a3 = v27;
    MEMORY[0x2207BA9A0](v22, -1, -1);
  }

  (*(void (**)(_BYTE *, uint64_t))(v30 + 8))(v14, v31);
  *(_DWORD *)v11 = a1;
  sub_21EC7CA88(a2, (uint64_t)(v11 + 8), &qword_255481BB0);
  *((_QWORD *)v11 + 8) = sub_21EC66B28(0, &qword_255481BC8);
  *((_QWORD *)v11 + 5) = a3;
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x24BDFF480], v8);
  v23 = a3;
  sub_21EC71C4C((uint64_t)v11);
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v9 + 8))(v11, v8);
}

Swift::Void __swiftcall AXTwiceCompanionRootViewController.pullToDismissViewController()()
{
  sub_21EC7C694(0xD00000000000001DLL, 0x800000021EC7FA80);
}

Swift::Void __swiftcall AXTwiceCompanionRootViewController.stingButtonPressed()()
{
  sub_21EC7B2C0(0xD000000000000014, 0x800000021EC7FAA0, 1105);
}

Swift::Void __swiftcall AXTwiceCompanionRootViewController.stingButtonLongPressed()()
{
  sub_21EC7B2C0(0xD000000000000018, 0x800000021EC7FAC0, 1108);
}

Swift::Void __swiftcall AXTwiceCompanionRootViewController.stingButtonKeycord()()
{
  sub_21EC7B2C0(0xD000000000000014, 0x800000021EC7FAE0, 1107);
}

id sub_21EC7B2C0(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t *v21;
  id result;
  void *v23;
  id v24;
  _QWORD v25[2];
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v28 = a1;
  v29 = a2;
  v5 = v3;
  v6 = sub_21EC7CFC8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (_QWORD *)((char *)v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = sub_21EC7D004();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21EC7CD94();
  v14 = sub_21EC7CFF8();
  v15 = sub_21EC7D148();
  if (os_log_type_enabled(v14, v15))
  {
    v25[1] = v5;
    v16 = swift_slowAlloc();
    v26 = v7;
    v17 = (uint8_t *)v16;
    v18 = swift_slowAlloc();
    v27 = v6;
    v19 = v18;
    v31 = v18;
    v25[0] = v10;
    *(_DWORD *)v17 = 136315138;
    v30 = sub_21EC68898(v28, v29, &v31);
    sub_21EC7D1B4();
    _os_log_impl(&dword_21EC60000, v14, v15, "[TWICE] %s", v17, 0xCu);
    swift_arrayDestroy();
    v20 = v19;
    v6 = v27;
    MEMORY[0x2207BA9A0](v20, -1, -1);
    v21 = v17;
    v7 = v26;
    MEMORY[0x2207BA9A0](v21, -1, -1);

    (*(void (**)(char *, _QWORD))(v11 + 8))(v13, v25[0]);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  result = objc_msgSend((id)objc_opt_self(), sel_buttonRepresentationWithType_, a3);
  if (result)
  {
    v23 = result;
    *v9 = result;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x24BDFF470], v6);
    v24 = v23;
    sub_21EC71C4C((uint64_t)v9);

    return (id)(*(uint64_t (**)(_QWORD *, uint64_t))(v7 + 8))(v9, v6);
  }
  return result;
}

id sub_21EC7B558(uint64_t a1, _QWORD *a2, uint64_t a3, unint64_t a4)
{
  void *v4;
  uint64_t v8;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v18;

  v8 = a2[3];
  if (v8)
  {
    v10 = __swift_project_boxed_opaque_existential_0(a2, a2[3]);
    v11 = *(_QWORD *)(v8 - 8);
    MEMORY[0x24BDAC7A8](v10);
    v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v11 + 16))(v13);
    v14 = sub_21EC7D2E0();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v8);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a2);
  }
  else
  {
    v14 = 0;
  }
  if (a4 >> 60 == 15)
  {
    v15 = 0;
  }
  else
  {
    v15 = (void *)sub_21EC7CD58();
    sub_21EC7CACC(a3, a4);
  }
  v16 = objc_msgSend(v4, sel_initWithAxAction_withValue_forElementRefData_, a1, v14, v15);
  swift_unknownObjectRelease();

  return v16;
}

unint64_t sub_21EC7B690(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_21EC7D1E4();
  return sub_21EC7B724(a1, v2);
}

unint64_t sub_21EC7B6C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_21EC7D304();
  sub_21EC7D0AC();
  v4 = sub_21EC7D310();
  return sub_21EC7B7E8(a1, a2, v4);
}

unint64_t sub_21EC7B724(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  _BYTE v9[40];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      sub_21EC7C93C(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x2207BA28C](v9, a1);
      sub_21EC7C1FC((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_21EC7B7E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_21EC7D2EC() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_21EC7D2EC() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_21EC7B8C8(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  unint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _OWORD *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  _QWORD *v34;
  _OWORD v35[2];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255481D40);
  v6 = sub_21EC7D2B0();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v34 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v33 = (unint64_t)(v8 + 63) >> 6;
    v11 = v6 + 64;
    result = swift_retain();
    v13 = 0;
    while (1)
    {
      if (v10)
      {
        v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v17 = v16 | (v13 << 6);
      }
      else
      {
        v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33)
          goto LABEL_34;
        v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          v13 = v18 + 1;
          if (v18 + 1 >= v33)
            goto LABEL_34;
          v19 = v34[v13];
          if (!v19)
          {
            v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              v3 = v2;
              if ((a2 & 1) != 0)
              {
                v32 = 1 << *(_BYTE *)(v5 + 32);
                if (v32 >= 64)
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v34 = -1 << v32;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                v13 = v20 + 1;
                if (__OFADD__(v20, 1))
                  goto LABEL_41;
                if (v13 >= v33)
                  goto LABEL_34;
                v19 = v34[v13];
                ++v20;
                if (v19)
                  goto LABEL_21;
              }
            }
            v13 = v20;
          }
        }
LABEL_21:
        v10 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      v21 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v17);
      v23 = *v21;
      v22 = v21[1];
      v24 = (_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v17);
      if ((a2 & 1) != 0)
      {
        sub_21EC69018(v24, v35);
      }
      else
      {
        sub_21EC68BC8((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_21EC7D304();
      sub_21EC7D0AC();
      result = sub_21EC7D310();
      v25 = -1 << *(_BYTE *)(v7 + 32);
      v26 = result & ~v25;
      v27 = v26 >> 6;
      if (((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        v14 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v28 = 0;
        v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v30 = v27 == v29;
          if (v27 == v29)
            v27 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      v15 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v14);
      *v15 = v23;
      v15[1] = v22;
      result = (uint64_t)sub_21EC69018(v35, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v14));
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

_OWORD *sub_21EC7BBC4(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  _OWORD *v19;
  _OWORD *result;
  unint64_t v21;
  char v22;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v12 = sub_21EC7B6C0(a2, a3);
  v13 = v10[2];
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
  }
  else
  {
    v16 = v11;
    v17 = v10[3];
    if (v17 >= v15 && (a4 & 1) != 0)
    {
LABEL_7:
      v18 = *v5;
      if ((v16 & 1) != 0)
      {
LABEL_8:
        v19 = (_OWORD *)(v18[7] + 32 * v12);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);
        return sub_21EC69018(a1, v19);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_21EC7BD5C();
      goto LABEL_7;
    }
    sub_21EC7B8C8(v15, a4 & 1);
    v21 = sub_21EC7B6C0(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      v12 = v21;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_21EC7BCF4(v12, a2, a3, a1, v18);
      return (_OWORD *)swift_bridgeObjectRetain();
    }
  }
  result = (_OWORD *)sub_21EC7D2F8();
  __break(1u);
  return result;
}

_OWORD *sub_21EC7BCF4(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, _QWORD *a5)
{
  _QWORD *v6;
  _OWORD *result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v6 = (_QWORD *)(a5[6] + 16 * a1);
  *v6 = a2;
  v6[1] = a3;
  result = sub_21EC69018(a4, (_OWORD *)(a5[7] + 32 * a1));
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

void *sub_21EC7BD5C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t *v25;
  _OWORD v26[2];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255481D40);
  v2 = *v0;
  v3 = sub_21EC7D2A4();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v4;
    return result;
  }
  v25 = v1;
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 32 * v15;
    sub_21EC68BC8(*(_QWORD *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_21EC69018(v26, (_OWORD *)(*(_QWORD *)(v4 + 56) + v20));
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v25;
    goto LABEL_28;
  }
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

double sub_21EC7BF40()
{
  void *v0;
  id v1;
  double v2;
  double v3;
  double v4;
  id v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  id v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  CGFloat Height;
  CGRect v26;
  CGRect v27;

  v0 = (void *)objc_opt_self();
  v1 = objc_msgSend(v0, sel_mainScreen);
  objc_msgSend(v1, sel_scale);
  v3 = v2;

  v4 = v3 * 5.0;
  v5 = objc_msgSend(v0, sel_mainScreen);
  objc_msgSend(v5, sel_bounds);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v26.origin.x = v7;
  v26.origin.y = v9;
  v26.size.width = v11;
  v26.size.height = v13;
  v14 = v4 / CGRectGetWidth(v26);
  v15 = objc_msgSend(v0, sel_mainScreen);
  objc_msgSend(v15, sel_bounds);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v27.origin.x = v17;
  v27.origin.y = v19;
  v27.size.width = v21;
  v27.size.height = v23;
  Height = CGRectGetHeight(v27);
  return sqrt((0.0 - v14) * (0.0 - v14) + (0.0 - v4 / Height) * (0.0 - v4 / Height));
}

double sub_21EC7C074(unint64_t a1, unint64_t a2)
{
  kern_return_t v4;
  double result;
  unint64_t v6;
  uint64_t v7;
  mach_timebase_info v8[2];

  v8[1] = *(mach_timebase_info *)MEMORY[0x24BDAC8D0];
  v8[0] = 0;
  v4 = mach_timebase_info(v8);
  result = -1.0;
  if (!v4)
  {
    v6 = a2 - a1;
    if (a2 < a1)
    {
      __break(1u);
    }
    else if ((v6 & 0x8000000000000000) == 0)
    {
      v7 = v6 * v8[0].numer;
      if (((uint64_t)v6 * (unsigned __int128)v8[0].numer) >> 64 == v7 >> 63)
      {
        if (v8[0].denom)
          return (double)(v7 / v8[0].denom) / 1000000.0;
LABEL_11:
        __break(1u);
      }
LABEL_10:
      __break(1u);
      goto LABEL_11;
    }
    __break(1u);
    goto LABEL_10;
  }
  return result;
}

uint64_t type metadata accessor for AXTwiceCompanionRootViewController()
{
  uint64_t result;

  result = qword_255481BF8;
  if (!qword_255481BF8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_21EC7C168()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_21EC7C18C()
{
  return sub_21EC71BB8();
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t sub_21EC7C1AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255481B20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_21EC7C1F4()
{
  return sub_21EC721B0();
}

uint64_t sub_21EC7C1FC(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

uint64_t sub_21EC7C230(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_21EC7C26C(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_21EC7C2B0(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

uint64_t sub_21EC7C2F4()
{
  return type metadata accessor for AXTwiceCompanionRootViewController();
}

void sub_21EC7C2FC()
{
  unint64_t v0;
  unint64_t v1;

  sub_21EC7CFE0();
  if (v0 <= 0x3F)
  {
    sub_21EC7C400();
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for AXTwiceCompanionRootViewController()
{
  return swift_lookUpClassMethod();
}

void sub_21EC7C400()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255481C08)
  {
    sub_21EC7CD88();
    v0 = sub_21EC7D1A8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255481C08);
  }
}

__n128 __swift_memcpy28_8(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 12) = *(_OWORD *)(a2 + 12);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for AXTwiceHIDEvent(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 28))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for AXTwiceHIDEvent(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_DWORD *)(result + 24) = 0;
    *(_QWORD *)result = (a2 - 1);
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 28) = v3;
  return result;
}

ValueMetadata *type metadata accessor for AXTwiceHIDEvent()
{
  return &type metadata for AXTwiceHIDEvent;
}

void sub_21EC7C4C8(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  void *v11;
  unsigned int v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t, uint64_t);
  id v18;
  uint64_t v19;

  v2 = sub_21EC7CFC8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_21EC7D004();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = objc_msgSend((id)objc_opt_self(), sel_server);
  if (!v10)
  {
    __break(1u);
    goto LABEL_9;
  }
  v11 = v10;
  v12 = objc_msgSend(v10, sel_isScreenLockedWithPasscode_, 0);

  if (!v12)
    return;
  sub_21EC7CD94();
  v13 = sub_21EC7CFF8();
  v14 = sub_21EC7D148();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_21EC60000, v13, v14, "[TWICE] Device is locked. Dismissing Twice VC!", v15, 2u);
    MEMORY[0x2207BA9A0](v15, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  if (!a1)
  {
LABEL_9:
    __break(1u);
    return;
  }
  v16 = *MEMORY[0x24BDFF4C8];
  v17 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 104);
  v18 = a1;
  v17(v5, v16, v2);
  sub_21EC71C4C((uint64_t)v5);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_21EC7C694(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v21[2];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v23 = a1;
  v4 = v2;
  v5 = sub_21EC7CFC8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_21EC7D004();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21EC7CD94();
  v13 = sub_21EC7CFF8();
  v14 = sub_21EC7D148();
  if (os_log_type_enabled(v13, v14))
  {
    v21[0] = v9;
    v15 = swift_slowAlloc();
    v21[1] = v4;
    v16 = (uint8_t *)v15;
    v17 = swift_slowAlloc();
    v22 = v5;
    v18 = v17;
    v25 = v17;
    *(_DWORD *)v16 = 136315138;
    v24 = sub_21EC68898(v23, a2, &v25);
    sub_21EC7D1B4();
    _os_log_impl(&dword_21EC60000, v13, v14, "[TWICE] %s", v16, 0xCu);
    swift_arrayDestroy();
    v19 = v18;
    v5 = v22;
    MEMORY[0x2207BA9A0](v19, -1, -1);
    MEMORY[0x2207BA9A0](v16, -1, -1);

    (*(void (**)(char *, _QWORD))(v10 + 8))(v12, v21[0]);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x24BDFF4C8], v5);
  sub_21EC71C4C((uint64_t)v8);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

void sub_21EC7C8B0(id a1)
{
  if (a1 != (id)1)

}

id sub_21EC7C8C0(id result)
{
  if (result != (id)1)
    return result;
  return result;
}

uint64_t sub_21EC7C8D0(uint64_t a1)
{
  char v1;

  AXTwiceCompanionRootViewController.handleHIDEvent(_:)(a1);
  return v1 & 1;
}

void sub_21EC7C8F4()
{
  uint64_t v0;

  sub_21EC7869C(*(_QWORD *)(v0 + 16));
}

uint64_t sub_21EC7C8FC(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x2207BA940](MEMORY[0x24BEE12C8], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21EC7C93C(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_21EC7C978()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_21EC7C99C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_21EC7CFC8();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_21EC7CA10()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(sub_21EC7CFC8() - 8) + 80);
  return sub_21EC73884(*(_QWORD *)(v0 + 16), v0 + ((v1 + 24) & ~v1));
}

uint64_t sub_21EC7CA40(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255481BB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21EC7CA88(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_21EC7CACC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_21EC7C2B0(a1, a2);
  return a1;
}

uint64_t sub_21EC7CAE0()
{
  uint64_t v0;

  sub_21EC7C2B0(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
  return swift_deallocObject();
}

void sub_21EC7CB0C()
{
  uint64_t v0;

  sub_21EC780BC(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t sub_21EC7CB18()
{
  uint64_t v0;

  return sub_21EC78704(v0);
}

void sub_21EC7CB20()
{
  uint64_t v0;

  sub_21EC732A4(v0);
}

uint64_t dispatch thunk of AXTwiceRootViewControllerProtocol.axuiserverWasRestarted()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of AXTwiceRootViewControllerProtocol.connectionWithClientServiceWasInterrupted()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of AXTwiceRootViewControllerProtocol.prepareToDisappear(completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t sub_21EC7CB8C()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t __getAXUIBannerPresenterClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[AXTwiceCompanionAirplayReceiver didStartStreamingWithRenderer:].cold.1(v0);
}

void __getAPRKStreamRenderingManagerClass_block_invoke_cold_1()
{
  abort_report_np();
  sub_21EC7CD34();
}

uint64_t sub_21EC7CD34()
{
  return MEMORY[0x24BDCB8E8]();
}

uint64_t sub_21EC7CD40()
{
  return MEMORY[0x24BDCB930]();
}

uint64_t sub_21EC7CD4C()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_21EC7CD58()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_21EC7CD64()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_21EC7CD70()
{
  return MEMORY[0x24BDCE330]();
}

uint64_t sub_21EC7CD7C()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_21EC7CD88()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_21EC7CD94()
{
  return MEMORY[0x24BDFF2A8]();
}

uint64_t sub_21EC7CDA0()
{
  return MEMORY[0x24BDFF2B0]();
}

uint64_t sub_21EC7CDAC()
{
  return MEMORY[0x24BDFF2B8]();
}

uint64_t sub_21EC7CDB8()
{
  return MEMORY[0x24BDFF2C0]();
}

uint64_t sub_21EC7CDC4()
{
  return MEMORY[0x24BDFF2C8]();
}

uint64_t sub_21EC7CDD0()
{
  return MEMORY[0x24BDFF2D0]();
}

uint64_t sub_21EC7CDDC()
{
  return MEMORY[0x24BDFF2D8]();
}

uint64_t sub_21EC7CDE8()
{
  return MEMORY[0x24BDFF2E0]();
}

uint64_t sub_21EC7CDF4()
{
  return MEMORY[0x24BDFF2E8]();
}

uint64_t sub_21EC7CE00()
{
  return MEMORY[0x24BDFF2F0]();
}

uint64_t sub_21EC7CE0C()
{
  return MEMORY[0x24BDFF2F8]();
}

uint64_t sub_21EC7CE18()
{
  return MEMORY[0x24BDFF300]();
}

uint64_t sub_21EC7CE24()
{
  return MEMORY[0x24BDFF308]();
}

uint64_t sub_21EC7CE30()
{
  return MEMORY[0x24BDFF310]();
}

uint64_t sub_21EC7CE3C()
{
  return MEMORY[0x24BDFF318]();
}

uint64_t sub_21EC7CE48()
{
  return MEMORY[0x24BDFF320]();
}

uint64_t sub_21EC7CE54()
{
  return MEMORY[0x24BDFF328]();
}

uint64_t sub_21EC7CE60()
{
  return MEMORY[0x24BDFF330]();
}

uint64_t sub_21EC7CE6C()
{
  return MEMORY[0x24BDFF338]();
}

uint64_t sub_21EC7CE78()
{
  return MEMORY[0x24BDFF340]();
}

uint64_t sub_21EC7CE84()
{
  return MEMORY[0x24BDFF348]();
}

uint64_t sub_21EC7CE90()
{
  return MEMORY[0x24BDFF350]();
}

uint64_t sub_21EC7CE9C()
{
  return MEMORY[0x24BDFF358]();
}

uint64_t sub_21EC7CEA8()
{
  return MEMORY[0x24BDFF360]();
}

uint64_t sub_21EC7CEB4()
{
  return MEMORY[0x24BDFF368]();
}

uint64_t sub_21EC7CEC0()
{
  return MEMORY[0x24BDFF370]();
}

uint64_t sub_21EC7CECC()
{
  return MEMORY[0x24BDFF378]();
}

uint64_t sub_21EC7CED8()
{
  return MEMORY[0x24BDFF380]();
}

uint64_t sub_21EC7CEE4()
{
  return MEMORY[0x24BDFF388]();
}

uint64_t sub_21EC7CEF0()
{
  return MEMORY[0x24BDFF390]();
}

uint64_t sub_21EC7CEFC()
{
  return MEMORY[0x24BDFF398]();
}

uint64_t sub_21EC7CF08()
{
  return MEMORY[0x24BDFF3A0]();
}

uint64_t sub_21EC7CF14()
{
  return MEMORY[0x24BDFF3A8]();
}

uint64_t sub_21EC7CF20()
{
  return MEMORY[0x24BDFF3B0]();
}

uint64_t sub_21EC7CF2C()
{
  return MEMORY[0x24BDFF3B8]();
}

uint64_t sub_21EC7CF38()
{
  return MEMORY[0x24BDFF3C8]();
}

uint64_t sub_21EC7CF44()
{
  return MEMORY[0x24BDFF3D0]();
}

uint64_t sub_21EC7CF50()
{
  return MEMORY[0x24BDFF3D8]();
}

uint64_t sub_21EC7CF5C()
{
  return MEMORY[0x24BDFF3E0]();
}

uint64_t sub_21EC7CF68()
{
  return MEMORY[0x24BDFF3E8]();
}

uint64_t sub_21EC7CF74()
{
  return MEMORY[0x24BDFF3F0]();
}

uint64_t sub_21EC7CF80()
{
  return MEMORY[0x24BDFF3F8]();
}

uint64_t sub_21EC7CF8C()
{
  return MEMORY[0x24BDFF400]();
}

uint64_t sub_21EC7CF98()
{
  return MEMORY[0x24BDFF408]();
}

uint64_t sub_21EC7CFA4()
{
  return MEMORY[0x24BDFF458]();
}

uint64_t sub_21EC7CFB0()
{
  return MEMORY[0x24BDFF460]();
}

uint64_t sub_21EC7CFBC()
{
  return MEMORY[0x24BDFF4A8]();
}

uint64_t sub_21EC7CFC8()
{
  return MEMORY[0x24BDFF4E0]();
}

uint64_t sub_21EC7CFD4()
{
  return MEMORY[0x24BDFF4F0]();
}

uint64_t sub_21EC7CFE0()
{
  return MEMORY[0x24BDFF528]();
}

uint64_t sub_21EC7CFEC()
{
  return MEMORY[0x24BDFF568]();
}

uint64_t sub_21EC7CFF8()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_21EC7D004()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_21EC7D010()
{
  return MEMORY[0x24BEE5428]();
}

uint64_t sub_21EC7D01C()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_21EC7D028()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_21EC7D034()
{
  return MEMORY[0x24BEE54D8]();
}

uint64_t sub_21EC7D040()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_21EC7D04C()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_21EC7D058()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_21EC7D064()
{
  return MEMORY[0x24BEE5620]();
}

uint64_t sub_21EC7D070()
{
  return MEMORY[0x24BEE5628]();
}

uint64_t sub_21EC7D07C()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_21EC7D088()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_21EC7D094()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_21EC7D0A0()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_21EC7D0AC()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_21EC7D0B8()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_21EC7D0C4()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_21EC7D0D0()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_21EC7D0DC()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_21EC7D0E8()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_21EC7D0F4()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_21EC7D100()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_21EC7D10C()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_21EC7D118()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_21EC7D124()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_21EC7D130()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_21EC7D13C()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_21EC7D148()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_21EC7D154()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_21EC7D160()
{
  return MEMORY[0x24BEE56B8]();
}

uint64_t sub_21EC7D16C()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_21EC7D178()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_21EC7D184()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_21EC7D190()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_21EC7D19C()
{
  return MEMORY[0x24BEE1C60]();
}

uint64_t sub_21EC7D1A8()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_21EC7D1B4()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_21EC7D1C0()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_21EC7D1CC()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_21EC7D1D8()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_21EC7D1E4()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_21EC7D1F0()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_21EC7D1FC()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_21EC7D208()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_21EC7D214()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_21EC7D220()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_21EC7D22C()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_21EC7D238()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_21EC7D244()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_21EC7D250()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_21EC7D25C()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_21EC7D268()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_21EC7D274()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_21EC7D280()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_21EC7D28C()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_21EC7D298()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_21EC7D2A4()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_21EC7D2B0()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_21EC7D2BC()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_21EC7D2C8()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_21EC7D2D4()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_21EC7D2E0()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_21EC7D2EC()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_21EC7D2F8()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_21EC7D304()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_21EC7D310()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t AXDeviceRemoteScreenIsBluetoothOn()
{
  return MEMORY[0x24BDFF570]();
}

uint64_t AXDeviceRemoteScreenIsWifiOn()
{
  return MEMORY[0x24BDFF578]();
}

uint64_t AXDisplayCornerRadiusWithMargin()
{
  return MEMORY[0x24BDFF580]();
}

uint64_t AXEventTypeIsHomeButtonPress()
{
  return MEMORY[0x24BE00070]();
}

uint64_t AXIsCrownOrientationOnRightSide()
{
  return MEMORY[0x24BDFF588]();
}

uint64_t AXLogTwiceRemoteScreen()
{
  return MEMORY[0x24BDFE1D8]();
}

uint64_t AXkMobileKeyBagLockStatusNotificationID()
{
  return MEMORY[0x24BE00568]();
}

uint64_t AXkNanoOrientationStatusNotificationID()
{
  return MEMORY[0x24BDFF590]();
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x24BDE55C8](retstr, angle, x, y, z);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
  MEMORY[0x24BDBC080](center, observer);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E8](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8F8](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD908](retstr, t, tx, ty);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x24BDBEFC0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
  MEMORY[0x24BEBDE98](*(_QWORD *)&notification, argument);
}

uint64_t _AXSApplicationAccessibilityEnabled()
{
  return MEMORY[0x24BED2040]();
}

uint64_t _AXSAssistiveTouchScannerEnabled()
{
  return MEMORY[0x24BED2070]();
}

uint64_t _AXSCommandAndControlEnabled()
{
  return MEMORY[0x24BED2170]();
}

uint64_t _AXSTwiceRemoteScreenPlatform()
{
  return MEMORY[0x24BED2570]();
}

uint64_t _AXSTwiceRemoteScreenSetEnabled()
{
  return MEMORY[0x24BED2578]();
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return MEMORY[0x24BED25B0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
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

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x24BEE4FB0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x24BEE4FC8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x24BEE4FD0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x24BEE4FD8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

