void sub_23102E788(uint64_t a1, void *a2)
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const char *v10;
  void *v11;
  MTCCTimer *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  MTCCTimer *v19;
  const char *v20;
  uint64_t v21;
  MTCCTimer *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  id v30;

  v30 = a2;
  v5 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v5 + 73))
  {
    v6 = *(void **)(v5 + 104);
    *(_QWORD *)(v5 + 104) = 0;

    v5 = *(_QWORD *)(a1 + 32);
  }
  v7 = *(void **)(v5 + 104);
  if (v7)
  {
    objc_msgSend_timerID(v7, v3, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = *(_QWORD *)(a1 + 32);
    if (v8)
    {
      objc_msgSend_timerID(*(void **)(v5 + 104), v3, v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_firstThatMatches_fromTimers_(MTCCTimerModule, v10, (uint64_t)v9, v30);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v12 = [MTCCTimer alloc];
        v14 = objc_msgSend_initWithMTTimer_(v12, v13, (uint64_t)v11);
        v15 = *(_QWORD *)(a1 + 32);
        v16 = *(void **)(v15 + 104);
        *(_QWORD *)(v15 + 104) = v14;
      }
      else
      {
        v17 = *(_QWORD *)(a1 + 32);
        v16 = *(void **)(v17 + 104);
        *(_QWORD *)(v17 + 104) = 0;
      }

      v5 = *(_QWORD *)(a1 + 32);
    }
  }
  if (!*(_QWORD *)(v5 + 104))
  {
    objc_msgSend_firstActiveTimerFromTimers_(MEMORY[0x24BE67868], v3, (uint64_t)v30);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = [MTCCTimer alloc];
    v22 = v19;
    if (v18)
    {
      v23 = objc_msgSend_initWithMTTimer_(v19, v20, (uint64_t)v18);
    }
    else
    {
      objc_msgSend_defaultDuration(*(void **)(a1 + 32), v20, v21);
      v23 = objc_msgSend_initWithState_duration_(v22, v24, 1);
    }
    v25 = *(_QWORD *)(a1 + 32);
    v26 = *(void **)(v25 + 104);
    *(_QWORD *)(v25 + 104) = v23;

    v5 = *(_QWORD *)(a1 + 32);
  }
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend_duration(*(void **)(v5 + 104), v3, v4);
    objc_msgSend_setDefaultDuration_((void *)v5, v27, v28);
    v5 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend_setTimer_(*(void **)(v5 + 88), v3, *(_QWORD *)(v5 + 104));
  objc_msgSend_setTimer_(*(void **)(*(_QWORD *)(a1 + 32) + 96), v29, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104));

}

void sub_23102EB08(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  objc_msgSend_timerBackgroundViewController(*(void **)(a1 + 32), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimer_(v6, v7, (uint64_t)v3);

  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 104);
  *(_QWORD *)(v8 + 104) = v3;

}

void sub_23102ED28(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;

  v3 = a2;
  objc_msgSend_timerViewController(*(void **)(a1 + 32), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimer_(v6, v7, (uint64_t)v3);

  objc_msgSend_timerBackgroundViewController(*(void **)(a1 + 32), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimer_(v10, v11, (uint64_t)v3);

  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 104);
  *(_QWORD *)(v12 + 104) = v3;

}

uint64_t sub_23102F00C(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t isEqual;

  v3 = a2;
  if (objc_msgSend_state(v3, v4, v5) == 3 || objc_msgSend_state(v3, v6, v7) == 2)
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend_timerID(v3, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    isEqual = objc_msgSend_isEqual_(v8, v10, (uint64_t)v9);

  }
  else
  {
    isEqual = 0;
  }

  return isEqual;
}

id sub_23102F170(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  const char *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;

  v3 = a2;
  objc_msgSend_timers(*(void **)(*(_QWORD *)(a1 + 32) + 80), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_23102F238;
  v13[3] = &unk_24FFE6480;
  v7 = *(id *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 32);
  v14 = v7;
  v15 = v8;
  v16 = v3;
  v9 = v3;
  objc_msgSend_flatMap_(v6, v10, (uint64_t)v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id sub_23102F238(void **a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void **v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  void *v55;
  void *v56;
  const char *v57;
  id v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  id v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  const char *v73;
  uint64_t v74;
  const char *v75;
  void *v76;
  NSObject *v77;
  void *v78;
  const char *v79;
  const char *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  const char *v84;
  const char *v85;
  void *v86;
  const char *v87;
  id v88;
  void *v89;
  const char *v90;
  const char *v91;
  uint64_t v92;
  const char *v93;
  id v94;
  MTCCTimer *v95;
  const char *v96;
  void *v97;
  const char *v98;
  int v100;
  void *v101;
  __int16 v102;
  void *v103;
  uint64_t v104;

  v104 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend_timerID(a1[4], v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstThatMatches_fromTimers_(MTCCTimerModule, v7, (uint64_t)v6, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  MTLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v12 = a1[5];
    objc_msgSend_sound(a1[6], v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = 138543618;
    v101 = v12;
    v102 = 2114;
    v103 = v13;
    _os_log_impl(&dword_23102D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ fetched latest duration sound: %{public}@", (uint8_t *)&v100, 0x16u);

  }
  if (v8)
  {
    v16 = (void *)objc_msgSend_mutableCopy(v8, v14, v15);
    v19 = objc_msgSend_state(v8, v17, v18);
    v22 = objc_msgSend_state(a1[4], v20, v21);
    v23 = v22;
    if (v19 == 1 && v22 == 3)
    {
      MTLogForCategory();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = a1[5];
        v100 = 138543362;
        v101 = v25;
        _os_log_impl(&dword_23102D000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ current state is stopped and new state is running", (uint8_t *)&v100, 0xCu);
      }

      v27 = a1[5];
      v26 = a1 + 5;
      objc_msgSend_duration(*(v26 - 1), v28, v29);
      objc_msgSend_setDefaultDuration_(v27, v30, v31);
      v32 = (void *)MEMORY[0x24BE67870];
      objc_msgSend_duration(*(v26 - 1), v33, v34);
      objc_msgSend_setDefaultDuration_(v32, v35, v36);
      objc_msgSend_duration(*(v26 - 1), v37, v38);
      objc_msgSend_setDuration_(v16, v39, v40);
      objc_msgSend_sound(v26[1], v41, v42);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (v44)
      {
        objc_msgSend_setSound_(v16, v43, (uint64_t)v44);
      }
      else
      {
        objc_msgSend_defaultSoundForCategory_(MEMORY[0x24BE67850], v43, 1);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setSound_(v16, v84, (uint64_t)v83);

      }
      objc_msgSend_setState_(v16, v85, 3);
    }
    else
    {
      if ((v19 & 0xFFFFFFFFFFFFFFFELL) != 2 || v19 == v22)
        goto LABEL_28;
      MTLogForCategory();
      v77 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
      {
        v78 = a1[5];
        v100 = 138543362;
        v101 = v78;
        _os_log_impl(&dword_23102D000, v77, OS_LOG_TYPE_DEFAULT, "%{public}@ current state is paused or running and does not equal new state", (uint8_t *)&v100, 0xCu);
      }

      objc_msgSend_setState_(v16, v79, v23);
      v26 = a1 + 5;
    }
    objc_msgSend_timerManager(*v26, v80, v81);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = (id)objc_msgSend_updateTimer_(v86, v87, (uint64_t)v16);
LABEL_27:

LABEL_28:
    v95 = [MTCCTimer alloc];
    v97 = (void *)objc_msgSend_initWithMTTimer_(v95, v96, (uint64_t)v16);
    objc_msgSend_futureWithResult_(MEMORY[0x24BE6B608], v98, (uint64_t)v97);
    v82 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_29;
  }
  if (objc_msgSend_state(a1[4], v14, v15) == 3)
  {
    objc_msgSend_editingTimer(a1[4], v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    if (v47)
    {
      objc_msgSend_editingTimer(a1[4], v48, v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timerID(v50, v51, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_firstThatMatches_fromTimers_(MTCCTimerModule, v54, (uint64_t)v53, v3);
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      if (v55)
      {
        objc_msgSend_timerManager(a1[5], v48, v49);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = (id)objc_msgSend_removeTimer_(v56, v57, (uint64_t)v55);

      }
    }
    v59 = (void *)MEMORY[0x24BE67870];
    objc_msgSend_duration(a1[4], v48, v49);
    objc_msgSend_setDefaultDuration_(v59, v60, v61);
    v62 = objc_alloc(MEMORY[0x24BE67868]);
    objc_msgSend_duration(a1[4], v63, v64);
    v66 = (void *)objc_msgSend_initWithState_duration_(v62, v65, 3);
    v16 = (void *)objc_msgSend_mutableCopy(v66, v67, v68);

    objc_msgSend_timerLabel(a1[4], v69, v70);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTitle_(v16, v72, (uint64_t)v71);

    objc_msgSend_sound(a1[6], v73, v74);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    if (v76)
    {
      objc_msgSend_setSound_(v16, v75, (uint64_t)v76);
    }
    else
    {
      objc_msgSend_defaultSoundForCategory_(MEMORY[0x24BE67850], v75, 1);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setSound_(v16, v90, (uint64_t)v89);

    }
    objc_msgSend_timerManager(a1[5], v91, v92);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = (id)objc_msgSend_addTimer_(v86, v93, (uint64_t)v16);
    goto LABEL_27;
  }
  objc_msgSend_futureWithResult_(MEMORY[0x24BE6B608], v45, (uint64_t)a1[4]);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_29:

  return v82;
}

void sub_231030D60(uint64_t a1, const char *a2, uint64_t a3)
{
  const char *v4;
  uint64_t v5;
  double v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  double v33;
  const char *v34;
  uint64_t v35;
  id v36;

  if (objc_msgSend_isEnabled(*(void **)(a1 + 32), a2, a3))
  {
    v6 = 1.0;
    objc_msgSend_colorWithWhite_alpha_(MEMORY[0x24BDF6950], v4, v5, 1.0, 1.0);
  }
  else
  {
    v6 = 0.75;
    objc_msgSend_colorWithWhite_alpha_(MEMORY[0x24BDF6950], v4, v5, 1.0, 0.75);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_titleLabel(*(void **)(a1 + 32), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTextColor_(v10, v11, (uint64_t)v7);

  LODWORD(v10) = objc_msgSend_isSelected(*(void **)(a1 + 32), v12, v13);
  objc_msgSend_selectedStateBackgroundView(*(void **)(a1 + 32), v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v16;
  if ((_DWORD)v10)
  {
    objc_msgSend_setAlpha_(v16, v17, v18, v6);

    objc_msgSend_normalStateBackgroundView(*(void **)(a1 + 32), v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAlpha_(v22, v23, v24, 0.0);
  }
  else
  {
    objc_msgSend_setAlpha_(v16, v17, v18, 0.0);

    objc_msgSend_normalStateBackgroundView(*(void **)(a1 + 32), v25, v26);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAlpha_(v22, v27, v28, v6);
  }

  if (objc_msgSend_isHighlighted(*(void **)(a1 + 32), v29, v30))
    v33 = 1.0;
  else
    v33 = 0.0;
  objc_msgSend_highlightView(*(void **)(a1 + 32), v31, v32);
  v36 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAlpha_(v36, v34, v35, v33);

}

uint64_t sub_231034DCC(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  _BOOL8 v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const __CFString *v19;

  objc_msgSend_sliderView(*(void **)(a1 + 32), a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sliderValueFromRemainingTime_(*(void **)(a1 + 32), v5, v6, *(double *)(a1 + 40));
  *(float *)&v7 = v7;
  objc_msgSend_setValue_animated_(v4, v8, *(unsigned __int8 *)(a1 + 48), v7);

  objc_msgSend_timer(*(void **)(a1 + 32), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_state(v11, v12, v13) != 3;
  objc_msgSend_sliderView(*(void **)(a1 + 32), v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFirstStepIsDisabled_(v17, v18, v14);

  if (*(_BYTE *)(a1 + 49))
    v19 = CFSTR("timing");
  else
    v19 = 0;
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_setGlyphState_, v19);
}

uint64_t CCUISliderExpandedContentModuleHeight()
{
  return MEMORY[0x24BE19AE0]();
}

uint64_t CCUISliderExpandedContentModuleWidth()
{
  return MEMORY[0x24BE19AE8]();
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x24BDBC198](key, value, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t MTLogForCategory()
{
  return MEMORY[0x24BE677C0]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x24BDF7668](lhs, rhs);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x24BDF7698](category);
}

uint64_t UIPointIntegral()
{
  return MEMORY[0x24BDF7C20]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
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

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
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

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

