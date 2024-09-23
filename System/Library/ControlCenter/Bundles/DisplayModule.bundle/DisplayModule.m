void sub_230FC41D0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_230FC41EC(uint64_t a1, __int128 *a2)
{
  id *v3;
  id WeakRetained;
  void *v5;
  __int128 v6;
  __int128 v7;
  _QWORD v8[4];
  id v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v7 = a2[1];
    v13 = *a2;
    v6 = v13;
    v14 = v7;
    v15 = *((_QWORD *)a2 + 4);
    *((_QWORD *)WeakRetained + 138) = v15;
    *((_OWORD *)WeakRetained + 67) = v6;
    *((_OWORD *)WeakRetained + 68) = v7;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = sub_230FC42C0;
    v8[3] = &unk_24FFD1838;
    objc_copyWeak(&v9, v3);
    v10 = v13;
    v11 = v14;
    v12 = v15;
    dispatch_async(MEMORY[0x24BDAC9B8], v8);
    objc_destroyWeak(&v9);
  }

}

void sub_230FC42C0(uint64_t a1)
{
  id WeakRetained;
  const char *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  _QWORD v12[5];
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = (void *)MEMORY[0x24BE19B10];
    objc_msgSend_viewIfLoaded(WeakRetained, v3, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_window(v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = sub_230FC438C;
    v12[3] = &unk_24FFD1810;
    v12[4] = v5;
    v13 = *(_OWORD *)(a1 + 40);
    v14 = *(_OWORD *)(a1 + 56);
    v15 = *(_QWORD *)(a1 + 72);
    objc_msgSend_performWithoutAnimationWhileHiddenInWindow_actions_(v6, v11, (uint64_t)v10, v12);

  }
}

uint64_t sub_230FC438C(uint64_t a1, const char *a2)
{
  _QWORD v3[5];
  __int128 v4;
  __int128 v5;
  uint64_t v6;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = sub_230FC4414;
  v3[3] = &unk_24FFD1810;
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = *(_OWORD *)(a1 + 40);
  v5 = *(_OWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 72);
  return objc_msgSend_animateWithDuration_delay_options_animations_completion_(MEMORY[0x24BDF6F90], a2, 4, v3, 0, 0.25, 0.0);
}

void sub_230FC4414(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  void *v8;
  __int128 v9;
  void *v10;
  const char *v11;
  _OWORD v12[2];
  uint64_t v13;

  objc_msgSend_nightShiftButton(*(void **)(a1 + 32), a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEnabled_(v4, v5, *(unsigned __int8 *)(a1 + 41));
  if (*(_QWORD *)(a1 + 64))
    objc_msgSend_setInoperative_(v4, v6, 1);
  else
    objc_msgSend_setInoperative_(v4, v6, *(_BYTE *)(a1 + 72) == 0);
  v8 = *(void **)(a1 + 32);
  v9 = *(_OWORD *)(a1 + 56);
  v12[0] = *(_OWORD *)(a1 + 40);
  v12[1] = v9;
  v13 = *(_QWORD *)(a1 + 72);
  objc_msgSend__subtitleForBlueLightStatus_(v8, v7, (uint64_t)v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSubtitle_(v4, v11, (uint64_t)v10);

}

void sub_230FC456C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_230FC4588(uint64_t a1)
{
  id WeakRetained;
  const char *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  _QWORD v11[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)MEMORY[0x24BE19B10];
    objc_msgSend_viewIfLoaded(WeakRetained, v2, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_window(v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = sub_230FC4630;
    v11[3] = &unk_24FFD1888;
    v11[4] = v4;
    objc_msgSend_performWithoutAnimationWhileHiddenInWindow_actions_(v5, v10, (uint64_t)v9, v11);

  }
}

uint64_t sub_230FC4630(uint64_t a1, const char *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = sub_230FC46A0;
  v3[3] = &unk_24FFD1888;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend_animateWithDuration_delay_options_animations_completion_(MEMORY[0x24BDF6F90], a2, 4, v3, 0, 0.25, 0.0);
}

void sub_230FC46A0(uint64_t a1, const char *a2, uint64_t a3)
{
  const char *v4;
  uint64_t v5;
  uint64_t Enabled;
  const char *v7;
  const char *v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  int v13;
  const char *v14;
  id v15;

  objc_msgSend_trueToneButton(*(void **)(a1 + 32), a2, a3);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  Enabled = objc_msgSend_getEnabled(*(void **)(*(_QWORD *)(a1 + 32) + 1056), v4, v5);
  objc_msgSend_setEnabled_(v15, v7, Enabled);
  objc_msgSend__subtitleForTrueToneEnabled_(*(void **)(a1 + 32), v8, Enabled);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSubtitle_(v15, v10, (uint64_t)v9);

  v13 = objc_msgSend_available(*(void **)(*(_QWORD *)(a1 + 32) + 1056), v11, v12);
  objc_msgSend_setInoperative_(v15, v14, v13 ^ 1u);

}

void sub_230FC4904(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v19;
  const char *v20;
  void *v21;
  const char *v22;
  _OWORD v23[2];
  uint64_t v24;

  v5 = *(_QWORD *)(a1 + 32) + 1072;
  v6 = *(_QWORD *)(a2 + 32);
  v7 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v7;
  *(_QWORD *)(v5 + 32) = v6;
  objc_msgSend_nightShiftButton(*(void **)(a1 + 32), (const char *)a2, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEnabled_(v8, v9, *(unsigned __int8 *)(a2 + 1));

  objc_msgSend_nightShiftButton(*(void **)(a1 + 32), v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12;
  if (*(_QWORD *)(a2 + 24))
    objc_msgSend_setInoperative_(v12, v13, 1);
  else
    objc_msgSend_setInoperative_(v12, v13, *(_BYTE *)(a2 + 32) == 0);

  objc_msgSend_nightShiftButton(*(void **)(a1 + 32), v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *(void **)(a1 + 32);
  v19 = *(_OWORD *)(a2 + 16);
  v23[0] = *(_OWORD *)a2;
  v23[1] = v19;
  v24 = *(_QWORD *)(a2 + 32);
  objc_msgSend__subtitleForBlueLightStatus_(v18, v20, (uint64_t)v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSubtitle_(v17, v22, (uint64_t)v21);

}

void sub_230FC4A80(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  void (**v8)(_QWORD);
  void *v9;
  const char *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  _QWORD v19[5];
  _QWORD v20[5];
  char v21;

  v3 = *(unsigned __int8 *)(a2 + 1);
  v4 = *(_QWORD *)(a1 + 32) + 1072;
  v5 = *(_QWORD *)(a2 + 32);
  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)v4 = *(_OWORD *)a2;
  *(_OWORD *)(v4 + 16) = v6;
  *(_QWORD *)(v4 + 32) = v5;
  v7 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = sub_230FC4BD8;
  v20[3] = &unk_24FFD1900;
  v20[4] = *(_QWORD *)(a1 + 32);
  v21 = v3 ^ 1;
  v8 = (void (**)(_QWORD))MEMORY[0x2348CC774](v20);
  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = sub_230FC4C2C;
  v19[3] = &unk_24FFD1888;
  v19[4] = *(_QWORD *)(a1 + 32);
  v9 = (void *)MEMORY[0x2348CC774](v19);
  if (v3 || !_AXSScreenFilterApplied())
  {
    v8[2](v8);
  }
  else
  {
    objc_msgSend__alertControllerForDisablingAccessibilityScreenFilter_cancelBlock_(*(void **)(a1 + 32), v10, (uint64_t)v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 1112);
    *(_QWORD *)(v12 + 1112) = v11;
    v14 = v11;

    objc_msgSend_parentViewController(*(void **)(a1 + 32), v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_presentViewController_animated_completion_(v17, v18, (uint64_t)v14, 1, 0);

  }
}

void sub_230FC4BD8(uint64_t a1, const char *a2)
{
  uint64_t v3;
  void *v4;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1073) = *(_BYTE *)(a1 + 40);
  objc_msgSend__setNightShiftEnabled_(*(void **)(a1 + 32), a2, *(unsigned __int8 *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 1112);
  *(_QWORD *)(v3 + 1112) = 0;

}

void sub_230FC4C2C(uint64_t a1, const char *a2)
{
  uint64_t v3;
  void *v4;

  objc_msgSend__setNightShiftEnabled_(*(void **)(a1 + 32), a2, *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1073));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 1112);
  *(_QWORD *)(v3 + 1112) = 0;

}

uint64_t sub_230FC4FC0(uint64_t a1)
{
  uint64_t result;

  _AXSDisableScreenFilters();
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_230FC4FF8(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_230FC59C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_230FC59E8(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_230FC5A60;
  block[3] = &unk_24FFD1968;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v2);
}

void sub_230FC5A60(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  _QWORD v10[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)MEMORY[0x24BE19B10];
  objc_msgSend_viewIfLoaded(WeakRetained, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_window(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_230FC5B00;
  v10[3] = &unk_24FFD1888;
  v10[4] = WeakRetained;
  objc_msgSend_performWithoutAnimationWhileHiddenInWindow_actions_(v2, v9, (uint64_t)v8, v10);

}

uint64_t sub_230FC5B00(uint64_t a1, const char *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = sub_230FC5B70;
  v3[3] = &unk_24FFD1888;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend_animateWithDuration_delay_options_animations_completion_(MEMORY[0x24BDF6F90], a2, 4, v3, 0, 0.25, 0.0);
}

uint64_t sub_230FC5B70(uint64_t a1, const char *a2, uint64_t a3)
{
  return objc_msgSend__updateBrightnessControlAvailability(*(void **)(a1 + 32), a2, a3);
}

uint64_t sub_230FC5C2C(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4;

  objc_msgSend_setNeedsLayout(*(void **)(*(_QWORD *)(a1 + 32) + 1016), a2, a3);
  return MEMORY[0x24BEDD108](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1016), sel_layoutIfNeeded, v4);
}

uint64_t BKSDisplayBrightnessGetCurrent()
{
  return MEMORY[0x24BE0B4F8]();
}

uint64_t BKSDisplayBrightnessIsBrightnessLevelControlAvailable()
{
  return MEMORY[0x24BE0B500]();
}

uint64_t BKSDisplayBrightnessSet()
{
  return MEMORY[0x24BE0B508]();
}

uint64_t BKSDisplayBrightnessTransactionCreate()
{
  return MEMORY[0x24BE0B518]();
}

uint64_t CCUISliderExpandedContentModuleHeight()
{
  return MEMORY[0x24BE19AE0]();
}

uint64_t CCUISliderExpandedContentModuleWidth()
{
  return MEMORY[0x24BE19AE8]();
}

uint64_t CCUISliderExpandedModuleContinuousCornerRadius()
{
  return MEMORY[0x24BE19AF0]();
}

uint64_t CCUISliderPreviewRenderingModeValue()
{
  return MEMORY[0x24BE19AF8]();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

uint64_t _AXSDisableScreenFilters()
{
  return MEMORY[0x24BED21C8]();
}

uint64_t _AXSScreenFilterApplied()
{
  return MEMORY[0x24BED2400]();
}

uint64_t _UIUpdatedVisualStyleEnabled()
{
  return MEMORY[0x24BDF81C0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
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

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

