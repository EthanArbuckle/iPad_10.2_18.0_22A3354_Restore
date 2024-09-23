uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2199D50F0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2199D50FC](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void FCUIRegisterLogging()
{
  if (FCUIRegisterLogging_onceToken != -1)
    dispatch_once(&FCUIRegisterLogging_onceToken, &__block_literal_global_2);
}

void sub_214775E8C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_21477666C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_214776984(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_214776CF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, id a17)
{
  id *v17;
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a17);
  _Unwind_Resume(a1);
}

void sub_2147777D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *a12, id *a13, id *a14, id *location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,id a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
  uint64_t v47;

  objc_destroyWeak((id *)(v47 - 248));
  _Unwind_Resume(a1);
}

void sub_21477A844(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_21477D7A0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21477D844(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21477D9A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  void *v16;
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_sync_exit(v16);
  _Unwind_Resume(a1);
}

void sub_21477DB00(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t FCUIBundle()
{
  return objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.FocusUI"));
}

const __CFString *FCUIPackageNameForActivity(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  char v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  int v29;

  v1 = a1;
  objc_msgSend(v1, "activityIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((BSEqualStrings() & 1) != 0)
  {
    objc_msgSend(v1, "activitySymbolImageName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = BSEqualStrings();

    if ((v4 & 1) != 0)
    {
      v5 = CFSTR("dnd_cg_02");
      goto LABEL_38;
    }
  }
  else
  {

  }
  objc_msgSend(v1, "activityIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((BSEqualStrings() & 1) != 0)
  {
    objc_msgSend(v1, "activitySymbolImageName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = BSEqualStrings();

    if ((v8 & 1) != 0)
    {
      v5 = CFSTR("work_cg_02");
      goto LABEL_38;
    }
  }
  else
  {

  }
  objc_msgSend(v1, "activityIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((BSEqualStrings() & 1) != 0)
  {
    objc_msgSend(v1, "activitySymbolImageName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = BSEqualStrings();

    if ((v11 & 1) != 0)
    {
      v5 = CFSTR("driving_cg_03");
      goto LABEL_38;
    }
  }
  else
  {

  }
  objc_msgSend(v1, "activityIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((BSEqualStrings() & 1) != 0)
  {
    objc_msgSend(v1, "activitySymbolImageName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = BSEqualStrings();

    if ((v14 & 1) != 0)
    {
      v5 = CFSTR("gaming_cg_02");
      goto LABEL_38;
    }
  }
  else
  {

  }
  objc_msgSend(v1, "activityIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((BSEqualStrings() & 1) != 0)
  {
    objc_msgSend(v1, "activitySymbolImageName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = BSEqualStrings();

    if ((v17 & 1) != 0)
    {
      v5 = CFSTR("mindful_cg_02");
      goto LABEL_38;
    }
  }
  else
  {

  }
  objc_msgSend(v1, "activityIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((BSEqualStrings() & 1) != 0)
  {
    objc_msgSend(v1, "activitySymbolImageName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = BSEqualStrings();

    if ((v20 & 1) != 0)
    {
      v5 = CFSTR("personal_cg_02");
      goto LABEL_38;
    }
  }
  else
  {

  }
  objc_msgSend(v1, "activityIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if ((BSEqualStrings() & 1) != 0)
  {
    objc_msgSend(v1, "activitySymbolImageName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = BSEqualStrings();

    if ((v23 & 1) != 0)
    {
      v5 = CFSTR("reading_cg_02");
      goto LABEL_38;
    }
  }
  else
  {

  }
  objc_msgSend(v1, "activityIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if ((BSEqualStrings() & 1) != 0)
  {
    objc_msgSend(v1, "activitySymbolImageName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = BSEqualStrings();

    if ((v26 & 1) != 0)
    {
      v5 = CFSTR("sleep_cg_02");
      goto LABEL_38;
    }
  }
  else
  {

  }
  objc_msgSend(v1, "activityIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if ((BSEqualStrings() & 1) != 0)
  {
    objc_msgSend(v1, "activitySymbolImageName");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = BSEqualStrings();

    if (v29)
      v5 = CFSTR("fitness_cg_02");
    else
      v5 = 0;
  }
  else
  {

    v5 = 0;
  }
LABEL_38:

  return v5;
}

void sub_21477E10C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_21477E2D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_214782064(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_214784914(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_214784BE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_214785A78(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_21478F920(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2147903A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double FrameForBaubleAtIndex(void *a1, unint64_t a2, uint64_t a3, int a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  id v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double MinX;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  v15 = a1;
  v16 = v15;
  if (a3)
  {
    objc_msgSend(v15, "scaledValueForValue:", 35.0);
    v18 = v17;
    objc_msgSend(v16, "scaledValueForValue:", 6.0);
    v20 = v18 * (double)a2 - v19 * (double)a2;
    if (a4)
    {
      v36.origin.x = a5;
      v36.origin.y = a6;
      v36.size.width = a7;
      v36.size.height = a8;
      v20 = CGRectGetMaxX(v36) - v20 - v18;
    }
  }
  else
  {
    if (a2 == 2)
    {
      objc_msgSend(v15, "scaledValueForValue:", 15.0);
      v26 = v25;
      v39.origin.x = a5;
      v39.origin.y = a6;
      v39.size.width = a7;
      v39.size.height = a8;
      MinX = CGRectGetMinX(v39);
      v28 = 25.0;
      if (a4)
        v28 = 19.0;
      objc_msgSend(v16, "scaledValueForValue:", v28);
      v30 = MinX + v29;
      objc_msgSend(v16, "scaledValueForValue:", 4.0);
      v20 = v30 + v31 * 0.5 - v26 * 0.5;
      v40.origin.x = a5;
      v40.origin.y = a6;
      v40.size.width = a7;
      v40.size.height = a8;
      CGRectGetMinY(v40);
      objc_msgSend(v16, "scaledValueForValue:", 3.0);
      objc_msgSend(v16, "scaledValueForValue:", 25.0);
      v24 = 2.0;
    }
    else if (a2 == 1)
    {
      objc_msgSend(v15, "scaledValueForValue:", 19.0);
      v41.origin.x = a5;
      v41.origin.y = a6;
      v41.size.width = a7;
      v41.size.height = a8;
      v20 = CGRectGetMinX(v41);
      if ((a4 & 1) == 0)
      {
        objc_msgSend(v16, "scaledValueForValue:", 25.0);
        v33 = v20 + v32;
        objc_msgSend(v16, "scaledValueForValue:", 4.0);
        v20 = v33 + v34;
      }
      v42.origin.x = a5;
      v42.origin.y = a6;
      v42.size.width = a7;
      v42.size.height = a8;
      CGRectGetMinY(v42);
      v24 = 8.0;
    }
    else
    {
      if (a2)
      {
        v20 = *MEMORY[0x24BDBF090];
        goto LABEL_17;
      }
      objc_msgSend(v15, "scaledValueForValue:", 25.0);
      v37.origin.x = a5;
      v37.origin.y = a6;
      v37.size.width = a7;
      v37.size.height = a8;
      v20 = CGRectGetMinX(v37);
      if (a4)
      {
        objc_msgSend(v16, "scaledValueForValue:", 19.0);
        v22 = v20 + v21;
        objc_msgSend(v16, "scaledValueForValue:", 4.0);
        v20 = v22 + v23;
      }
      v38.origin.x = a5;
      v38.origin.y = a6;
      v38.size.width = a7;
      v38.size.height = a8;
      CGRectGetMinY(v38);
      v24 = 3.0;
    }
    objc_msgSend(v16, "scaledValueForValue:", v24);
  }
LABEL_17:

  return v20;
}

uint64_t variable initialization expression of QuickStartViewController.delegate()
{
  return 0;
}

uint64_t QuickStartViewController.delegate.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC7FocusUI24QuickStartViewController_delegate;
  swift_beginAccess();
  return MEMORY[0x2199D5180](v1);
}

uint64_t QuickStartViewController.delegate.setter()
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*QuickStartViewController.delegate.modify(_QWORD *a1))(void **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC7FocusUI24QuickStartViewController_delegate;
  v3[4] = v1;
  v3[5] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x2199D5180](v5);
  return sub_21479132C;
}

void sub_21479132C(void **a1, char a2)
{
  void *v3;

  v3 = *a1;
  swift_unknownObjectWeakAssign();
  if ((a2 & 1) != 0)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

id QuickStartViewController.__allocating_init(modeIdentifier:)(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  char *v5;
  char *v6;
  objc_super v8;

  v5 = (char *)objc_allocWithZone(v2);
  swift_unknownObjectWeakInit();
  v6 = &v5[OBJC_IVAR____TtC7FocusUI24QuickStartViewController_modeIdentifier];
  *(_QWORD *)v6 = a1;
  *((_QWORD *)v6 + 1) = a2;
  v8.receiver = v5;
  v8.super_class = v2;
  return objc_msgSendSuper2(&v8, sel_initWithNibName_bundle_, 0, 0);
}

id QuickStartViewController.init(modeIdentifier:)(uint64_t a1, uint64_t a2)
{
  char *v2;
  char *v5;
  objc_super v7;

  swift_unknownObjectWeakInit();
  v5 = &v2[OBJC_IVAR____TtC7FocusUI24QuickStartViewController_modeIdentifier];
  *(_QWORD *)v5 = a1;
  *((_QWORD *)v5 + 1) = a2;
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for QuickStartViewController();
  return objc_msgSendSuper2(&v7, sel_initWithNibName_bundle_, 0, 0);
}

uint64_t type metadata accessor for QuickStartViewController()
{
  return objc_opt_self();
}

id sub_214791528(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

void sub_214791568()
{
  void *v0;

  swift_unknownObjectWeakInit();

  sub_214794858();
  __break(1u);
}

uint64_t sub_214791658()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC7FocusUI24QuickStartViewController_modeIdentifier);
  swift_bridgeObjectRetain();
  return v1;
}

Swift::Void __swiftcall QuickStartViewController.viewDidLoad()()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  uint64_t v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  void *v57;
  id v58;
  id v59;
  void *v60;
  id v61;
  id v62;
  id v63;
  void *v64;
  id v65;
  id v66;
  void *v67;
  void *v68;
  id v69;
  id v70;
  void *v71;
  id v72;
  id v73;
  uint64_t v74;
  objc_super v75;

  v75.receiver = v0;
  v75.super_class = (Class)type metadata accessor for QuickStartViewController();
  objc_msgSendSuper2(&v75, sel_viewDidLoad);
  v1 = objc_msgSend(v0, sel_view);
  if (!v1)
  {
    __break(1u);
    goto LABEL_20;
  }
  v2 = v1;
  v3 = (void *)objc_opt_self();
  v4 = objc_msgSend(v3, sel_clearColor);
  objc_msgSend(v2, sel_setBackgroundColor_, v4);

  v5 = objc_msgSend(v0, sel_view);
  if (!v5)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v6 = v5;
  objc_msgSend(v5, sel_frame);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), sel_initWithFrame_, v8, v10, v12, v14);
  v16 = objc_msgSend(v0, sel_view);
  if (!v16)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v17 = v16;
  objc_msgSend(v16, sel_addSubview_, v15);

  *(_QWORD *)(swift_allocObject() + 16) = v0;
  swift_bridgeObjectRetain();
  v18 = v0;
  sub_214794750();
  *(_QWORD *)(swift_allocObject() + 16) = v18;
  sub_214791F90();
  v73 = v18;
  sub_2147947C8();
  swift_release();
  sub_214791FD4();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_254D85738));
  sub_214791FDC();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_214791FE4(v74);
  v19 = (void *)sub_214794798();
  objc_msgSend(v73, sel_addChildViewController_, v19);
  v20 = objc_msgSend(v19, sel_view);
  if (!v20)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v21 = v20;
  v22 = objc_msgSend(v3, sel_clearColor);
  objc_msgSend(v21, sel_setBackgroundColor_, v22);

  v23 = objc_msgSend(v19, sel_view);
  if (!v23)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v24 = v23;
  v25 = objc_msgSend(v73, sel_view);
  if (!v25)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v26 = v25;
  objc_msgSend(v25, sel_bounds);
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;

  objc_msgSend(v24, sel_setFrame_, v28, v30, v32, v34);
  v35 = objc_msgSend(v73, sel_view);
  if (!v35)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v36 = v35;
  v37 = objc_msgSend(v19, sel_view);
  if (!v37)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  v38 = v37;
  objc_msgSend(v36, sel_addSubview_, v37);

  objc_msgSend(v19, sel_didMoveToParentViewController_, v73);
  v39 = objc_msgSend(v19, sel_view);
  if (!v39)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  v40 = v39;
  objc_msgSend(v39, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  __swift_instantiateConcreteTypeFromMangledName(&qword_254D85740);
  v41 = swift_allocObject();
  *(_OWORD *)(v41 + 16) = xmmword_214797530;
  v42 = objc_msgSend(v19, sel_view);
  if (!v42)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  v43 = v42;
  v44 = objc_msgSend(v42, sel_topAnchor);

  v45 = objc_msgSend(v73, sel_view);
  if (!v45)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  v46 = v45;
  v47 = objc_msgSend(v45, sel_topAnchor);

  v48 = objc_msgSend(v44, sel_constraintEqualToAnchor_, v47);
  *(_QWORD *)(v41 + 32) = v48;
  v49 = objc_msgSend(v19, sel_view);
  if (!v49)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  v50 = v49;
  v51 = objc_msgSend(v49, sel_leadingAnchor);

  v52 = objc_msgSend(v73, sel_view);
  if (!v52)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  v53 = v52;
  v54 = objc_msgSend(v52, sel_leadingAnchor);

  v55 = objc_msgSend(v51, sel_constraintEqualToAnchor_, v54);
  *(_QWORD *)(v41 + 40) = v55;
  v56 = objc_msgSend(v73, sel_view);
  if (!v56)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  v57 = v56;
  v58 = objc_msgSend(v56, sel_trailingAnchor);

  v59 = objc_msgSend(v19, sel_view);
  if (!v59)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  v60 = v59;
  v61 = objc_msgSend(v59, sel_trailingAnchor);

  v62 = objc_msgSend(v58, sel_constraintEqualToAnchor_, v61);
  *(_QWORD *)(v41 + 48) = v62;
  v63 = objc_msgSend(v73, sel_view);
  if (!v63)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  v64 = v63;
  v65 = objc_msgSend(v63, sel_bottomAnchor);

  v66 = objc_msgSend(v19, sel_view);
  if (v66)
  {
    v67 = v66;
    v68 = (void *)objc_opt_self();
    v69 = objc_msgSend(v67, sel_bottomAnchor);

    v70 = objc_msgSend(v65, sel_constraintEqualToAnchor_, v69);
    *(_QWORD *)(v41 + 56) = v70;
    sub_21479484C();
    sub_214791FF4();
    v71 = (void *)sub_214794840();
    swift_bridgeObjectRelease();
    objc_msgSend(v68, sel_activateConstraints_, v71);

    v72 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDA20]), sel_initWithTarget_action_, v73, sel_handleTap_);
    objc_msgSend(v15, sel_addGestureRecognizer_, v72);

    sub_214791FD4();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    sub_214792030(v74);

    return;
  }
LABEL_35:
  __break(1u);
}

uint64_t sub_214791EE4()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_214791F08(char a1)
{
  uint64_t v1;
  _QWORD *v2;
  void *v3;

  v2 = *(_QWORD **)(v1 + 16);
  if ((a1 & 1) != 0)
  {
    v3 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v2) + 0x60))();
    if (v3)
    {
      objc_msgSend(v3, sel_requestDismissal_, v2);
      swift_unknownObjectRelease();
    }
  }
  return objc_msgSend(v2, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

id sub_214791F78()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_dismissViewControllerAnimated_completion_, 1, 0);
}

unint64_t sub_214791F90()
{
  unint64_t result;

  result = qword_254D85730;
  if (!qword_254D85730)
  {
    result = MEMORY[0x2199D5108](MEMORY[0x24BE37EE0], MEMORY[0x24BE37EF8]);
    atomic_store(result, (unint64_t *)&qword_254D85730);
  }
  return result;
}

uint64_t sub_214791FD4()
{
  return swift_release();
}

uint64_t sub_214791FDC()
{
  return swift_retain();
}

uint64_t sub_214791FE4(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

unint64_t sub_214791FF4()
{
  unint64_t result;

  result = qword_254D85748;
  if (!qword_254D85748)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254D85748);
  }
  return result;
}

uint64_t sub_214792030(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

Swift::Void __swiftcall QuickStartViewController.viewWillAppear(_:)(Swift::Bool a1)
{
  void *v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  char isEscapingClosureAtFileLocation;
  _QWORD v9[6];
  objc_super v10;

  v10.receiver = v1;
  v10.super_class = (Class)type metadata accessor for QuickStartViewController();
  objc_msgSendSuper2(&v10, sel_viewWillAppear_, a1);
  v3 = (void *)objc_opt_self();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v1;
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = sub_2147921C8;
  *(_QWORD *)(v5 + 24) = v4;
  v9[4] = sub_214792224;
  v9[5] = v5;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = sub_214792244;
  v9[3] = &block_descriptor;
  v6 = _Block_copy(v9);
  v7 = v1;
  swift_retain();
  swift_release();
  objc_msgSend(v3, sel_performWithoutAnimation_, v6);
  _Block_release(v6);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
    __break(1u);
}

void sub_2147921C8()
{
  uint64_t v0;
  id v1;
  id v2;

  v1 = objc_msgSend(*(id *)(v0 + 16), sel_view);
  if (v1)
  {
    v2 = v1;
    objc_msgSend(v1, sel_layoutIfNeeded);

  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_214792214()
{
  return swift_deallocObject();
}

uint64_t sub_214792224()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_214792244(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

id QuickStartViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;
  id v7;

  v4 = v3;
  if (a2)
  {
    v6 = (void *)sub_214794828();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void QuickStartViewController.init(nibName:bundle:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id QuickStartViewController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for QuickStartViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2147923F4(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

void sub_214792418()
{
  swift_deletedMethodError();
  __break(1u);
}

void sub_214792430()
{
  qword_254D859B8 = 0x4042000000000000;
}

void sub_214792440()
{
  qword_254D859C8 = 0x4018000000000000;
}

void sub_214792450()
{
  qword_254D859D8 = 0x4039000000000000;
}

id ActivityEditViewController.__allocating_init(activityDescription:)(uint64_t a1)
{
  objc_class *v1;
  char *v3;
  char *v4;
  objc_super v6;

  v3 = (char *)objc_allocWithZone(v1);
  *(_QWORD *)&v3[OBJC_IVAR____TtC7FocusUI26ActivityEditViewController_visibleHeight] = 0x4084000000000000;
  v4 = &v3[OBJC_IVAR____TtC7FocusUI26ActivityEditViewController_willDisappearBlock];
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC7FocusUI26ActivityEditViewController_activityDescription] = a1;
  v6.receiver = v3;
  v6.super_class = v1;
  return objc_msgSendSuper2(&v6, sel_initWithNibName_bundle_, 0, 0);
}

id ActivityEditViewController.init(activityDescription:)(uint64_t a1)
{
  char *v1;
  char *v2;
  objc_super v4;

  *(_QWORD *)&v1[OBJC_IVAR____TtC7FocusUI26ActivityEditViewController_visibleHeight] = 0x4084000000000000;
  v2 = &v1[OBJC_IVAR____TtC7FocusUI26ActivityEditViewController_willDisappearBlock];
  *(_QWORD *)v2 = 0;
  *((_QWORD *)v2 + 1) = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC7FocusUI26ActivityEditViewController_activityDescription] = a1;
  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for ActivityEditViewController();
  return objc_msgSendSuper2(&v4, sel_initWithNibName_bundle_, 0, 0);
}

uint64_t type metadata accessor for ActivityEditViewController()
{
  return objc_opt_self();
}

double variable initialization expression of ActivityEditViewController.visibleHeight()
{
  return 640.0;
}

uint64_t variable initialization expression of ActivityEditViewController.willDisappearBlock()
{
  return 0;
}

void sub_2147925F0()
{
  char *v0;
  char *v1;

  *(_QWORD *)&v0[OBJC_IVAR____TtC7FocusUI26ActivityEditViewController_visibleHeight] = 0x4084000000000000;
  v1 = &v0[OBJC_IVAR____TtC7FocusUI26ActivityEditViewController_willDisappearBlock];
  *(_QWORD *)v1 = 0;
  *((_QWORD *)v1 + 1) = 0;

  sub_214794858();
  __break(1u);
}

uint64_t sub_2147926F4()
{
  return swift_unknownObjectRetain();
}

double ActivityEditViewController.visibleHeight.getter()
{
  uint64_t v0;

  return *(double *)(v0 + OBJC_IVAR____TtC7FocusUI26ActivityEditViewController_visibleHeight);
}

uint64_t ActivityEditViewController.willDisappearBlock.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC7FocusUI26ActivityEditViewController_willDisappearBlock);
  swift_beginAccess();
  v2 = *v1;
  sub_214791FE4(*v1);
  return v2;
}

void sub_21479282C(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t ActivityEditViewController.willDisappearBlock.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t v6;

  v5 = (uint64_t *)(v2 + OBJC_IVAR____TtC7FocusUI26ActivityEditViewController_willDisappearBlock);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a1;
  v5[1] = a2;
  return sub_214792030(v6);
}

uint64_t (*ActivityEditViewController.willDisappearBlock.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

Swift::Void __swiftcall ActivityEditViewController.viewDidLoad()()
{
  char *v0;
  id v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  char *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  uint64_t v51;
  objc_super v52;

  v52.receiver = v0;
  v52.super_class = (Class)type metadata accessor for ActivityEditViewController();
  objc_msgSendSuper2(&v52, sel_viewDidLoad);
  v1 = objc_msgSend(v0, sel_view);
  if (!v1)
  {
    __break(1u);
    goto LABEL_15;
  }
  v2 = v1;
  v3 = (void *)objc_opt_self();
  v4 = objc_msgSend(v3, sel_clearColor);
  objc_msgSend(v2, sel_setBackgroundColor_, v4);

  v5 = objc_msgSend(v0, sel_view);
  if (!v5)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v6 = v5;
  objc_msgSend(v5, sel_frame);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), sel_initWithFrame_, v8, v10, v12, v14);
  v16 = objc_msgSend(v0, sel_view);
  if (!v16)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v17 = v16;
  objc_msgSend(v16, sel_addSubview_, v15);

  v18 = objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC7FocusUI26ActivityEditViewController_activityDescription], sel_activityIdentifier);
  v19 = sub_214794834();

  sub_214793C68(v19);
  *(_QWORD *)(swift_allocObject() + 16) = v0;
  sub_214793DA4();
  v20 = v0;
  sub_2147947C8();
  swift_release();
  swift_bridgeObjectRelease();
  v21 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_254D857A0));
  swift_bridgeObjectRetain();
  swift_retain();
  sub_214791FE4(v51);
  v22 = (void *)sub_214794798();
  objc_msgSend(v20, sel_addChildViewController_, v22);
  v23 = objc_msgSend(v22, sel_view);
  if (!v23)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v24 = v23;
  v25 = objc_msgSend(v3, sel_clearColor);
  objc_msgSend(v24, sel_setBackgroundColor_, v25);

  v26 = objc_msgSend(v22, sel_view);
  if (!v26)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v27 = v26;
  v28 = objc_msgSend(v20, sel_view);
  if (!v28)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v29 = v28;
  objc_msgSend(v28, sel_bounds);
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v37 = v36;

  objc_msgSend(v27, sel_setFrame_, v31, v33, v35, v37);
  v38 = objc_msgSend(v22, sel_view);
  if (!v38)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v39 = v38;
  objc_msgSend(v38, sel_frame);
  objc_msgSend(v39, sel_setFrame_);

  v40 = objc_msgSend(v22, sel_view);
  if (!v40)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v41 = v40;
  v42 = objc_msgSend(v20, sel_view);
  if (!v42)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v43 = v42;
  objc_msgSend(v42, sel_bounds);

  v44 = objc_msgSend(v22, sel_view);
  if (!v44)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v45 = v44;
  objc_msgSend(v44, sel_frame);

  objc_msgSend(v41, sel_frame);
  objc_msgSend(v41, sel_setFrame_);

  v46 = objc_msgSend(v20, sel_view);
  if (!v46)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v47 = v46;
  v48 = objc_msgSend(v22, sel_view);
  if (v48)
  {
    v49 = v48;
    objc_msgSend(v47, sel_addSubview_, v48);

    objc_msgSend(v22, sel_didMoveToParentViewController_, v20);
    v50 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDA20]), sel_initWithTarget_action_, v20, sel_handleTap_);
    objc_msgSend(v15, sel_addGestureRecognizer_, v50);
    swift_release();
    swift_bridgeObjectRelease();

    sub_214792030(v51);
    return;
  }
LABEL_25:
  __break(1u);
}

Swift::Void __swiftcall ActivityEditViewController.viewWillDisappear(_:)(Swift::Bool a1)
{
  _QWORD *v1;
  id v3;
  void (*v4)();
  uint64_t v5;
  objc_super v6;

  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for ActivityEditViewController();
  v3 = objc_msgSendSuper2(&v6, sel_viewWillDisappear_, a1);
  v4 = (void (*)())(*(uint64_t (**)(id))((*MEMORY[0x24BEE4EA0] & *v1) + 0x70))(v3);
  if (v4)
  {
    v5 = (uint64_t)v4;
    v4();
    sub_214792030(v5);
  }
}

Swift::Void __swiftcall ActivityEditViewController.viewWillAppear(_:)(Swift::Bool a1)
{
  void *v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  char isEscapingClosureAtFileLocation;
  _QWORD v9[6];
  objc_super v10;

  v10.receiver = v1;
  v10.super_class = (Class)type metadata accessor for ActivityEditViewController();
  objc_msgSendSuper2(&v10, sel_viewWillAppear_, a1);
  v3 = (void *)objc_opt_self();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v1;
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = sub_2147921C8;
  *(_QWORD *)(v5 + 24) = v4;
  v9[4] = sub_214792224;
  v9[5] = v5;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = sub_214792244;
  v9[3] = &block_descriptor_0;
  v6 = _Block_copy(v9);
  v7 = v1;
  swift_retain();
  swift_release();
  objc_msgSend(v3, sel_performWithoutAnimation_, v6);
  _Block_release(v6);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
    __break(1u);
}

id ActivityEditViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;
  id v7;

  v4 = v3;
  if (a2)
  {
    v6 = (void *)sub_214794828();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void ActivityEditViewController.init(nibName:bundle:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id ActivityEditViewController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivityEditViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_214793320(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_214793350@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(void);
  uint64_t v20;

  v6 = sub_214794774();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (uint64_t *)((char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D857A8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v11 = sub_21479478C();
  *((_QWORD *)v11 + 1) = 0;
  v11[16] = 1;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D857B0);
  sub_21479350C(a1, a2, (uint64_t)&v11[*(int *)(v12 + 44)]);
  if (qword_254D859D0 != -1)
    swift_once();
  v13 = qword_254D859D8;
  v14 = (char *)v8 + *(int *)(v6 + 20);
  v15 = *MEMORY[0x24BDEEB68];
  v16 = sub_214794780();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 104))(v14, v15, v16);
  *v8 = v13;
  v8[1] = v13;
  v17 = a3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254D857B8) + 36);
  v18 = MEMORY[0x24BDED998];
  sub_214794014((uint64_t)v8, v17, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
  *(_WORD *)(v17 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254D857C0) + 36)) = 256;
  sub_21479420C((uint64_t)v11, a3, &qword_254D857A8);
  sub_214794058((uint64_t)v8, (uint64_t (*)(_QWORD))v18);
  return sub_214794250((uint64_t)v11, &qword_254D857A8);
}

uint64_t sub_21479350C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(void);
  char *v27;
  __int128 v28;
  char v29;
  char *v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;

  v46 = a1;
  v47 = a2;
  v54 = a3;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D85868);
  v51 = *(_QWORD *)(v3 - 8);
  v52 = v3;
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v49 = (char *)&v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D85870);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v50 = (char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D85878);
  v6 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v8 = (char *)&v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v53 = (uint64_t)&v45 - v9;
  v10 = sub_214794810();
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D85880);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D85888);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v45 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D85890);
  v20 = MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v45 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v45 = (uint64_t)&v45 - v23;
  v24 = *MEMORY[0x24BDEEB68];
  v25 = sub_214794780();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 104))(v12, v24, v25);
  if (qword_254D859B0 != -1)
    swift_once();
  if (qword_254D859C0 != -1)
    swift_once();
  sub_21479481C();
  sub_21479475C();
  v26 = MEMORY[0x24BDF48E8];
  sub_214794014((uint64_t)v12, (uint64_t)v15, (uint64_t (*)(_QWORD))MEMORY[0x24BDF48E8]);
  v27 = &v15[*(int *)(v13 + 36)];
  v28 = v58;
  *(_OWORD *)v27 = v57;
  *((_OWORD *)v27 + 1) = v28;
  *((_OWORD *)v27 + 2) = v59;
  sub_214794058((uint64_t)v12, (uint64_t (*)(_QWORD))v26);
  v29 = sub_2147947BC();
  sub_21479420C((uint64_t)v15, (uint64_t)v18, &qword_254D85880);
  v30 = &v18[*(int *)(v16 + 36)];
  *v30 = v29;
  *(_OWORD *)(v30 + 8) = 0u;
  *(_OWORD *)(v30 + 24) = 0u;
  v30[40] = 1;
  sub_214794250((uint64_t)v15, &qword_254D85880);
  v31 = sub_2147947A4();
  sub_21479420C((uint64_t)v18, (uint64_t)v22, &qword_254D85888);
  *(_DWORD *)&v22[*(int *)(v19 + 36)] = v31;
  sub_214794250((uint64_t)v18, &qword_254D85888);
  v32 = v45;
  v33 = sub_2147941C8((uint64_t)v22, v45, &qword_254D85890);
  MEMORY[0x24BDAC7A8](v33);
  v34 = v47;
  *(&v45 - 2) = v46;
  *(&v45 - 1) = v34;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D85898);
  v35 = sub_214794144();
  v55 = MEMORY[0x24BE37ED8];
  v56 = v35;
  swift_getOpaqueTypeConformance2();
  v36 = v49;
  sub_214794768();
  sub_214794188(&qword_254D858A8, &qword_254D85868, MEMORY[0x24BDEC988]);
  v37 = (uint64_t)v50;
  v38 = v52;
  sub_2147947D4();
  (*(void (**)(char *, uint64_t))(v51 + 8))(v36, v38);
  LOBYTE(v26) = sub_2147947B0();
  sub_21479420C(v37, (uint64_t)v8, &qword_254D85870);
  v39 = &v8[*(int *)(v48 + 36)];
  *v39 = (char)v26;
  *(_OWORD *)(v39 + 8) = 0u;
  *(_OWORD *)(v39 + 24) = 0u;
  v39[40] = 1;
  sub_214794250(v37, &qword_254D85870);
  v40 = v53;
  sub_2147941C8((uint64_t)v8, v53, &qword_254D85878);
  sub_21479420C(v32, (uint64_t)v22, &qword_254D85890);
  sub_21479420C(v40, (uint64_t)v8, &qword_254D85878);
  v41 = v54;
  sub_21479420C((uint64_t)v22, v54, &qword_254D85890);
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D858B0);
  sub_21479420C((uint64_t)v8, v41 + *(int *)(v42 + 48), &qword_254D85878);
  v43 = v41 + *(int *)(v42 + 64);
  *(_QWORD *)v43 = 0;
  *(_BYTE *)(v43 + 8) = 1;
  sub_214794250(v40, &qword_254D85878);
  sub_214794250(v32, &qword_254D85890);
  sub_214794250((uint64_t)v8, &qword_254D85878);
  return sub_214794250((uint64_t)v22, &qword_254D85890);
}

uint64_t sub_214793A98()
{
  return sub_2147947F8();
}

uint64_t sub_214793AB0@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(void);
  uint64_t v19;

  v3 = sub_214794774();
  MEMORY[0x24BDAC7A8](v3);
  v5 = (uint64_t *)((char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D857A8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v1;
  v9 = v1[1];
  *(_QWORD *)v8 = sub_21479478C();
  *((_QWORD *)v8 + 1) = 0;
  v8[16] = 1;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D857B0);
  sub_21479350C(v10, v9, (uint64_t)&v8[*(int *)(v11 + 44)]);
  if (qword_254D859D0 != -1)
    swift_once();
  v12 = qword_254D859D8;
  v13 = (char *)v5 + *(int *)(v3 + 20);
  v14 = *MEMORY[0x24BDEEB68];
  v15 = sub_214794780();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 104))(v13, v14, v15);
  *v5 = v12;
  v5[1] = v12;
  v16 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254D857B8) + 36);
  v17 = MEMORY[0x24BDED998];
  sub_214794014((uint64_t)v5, v16, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
  *(_WORD *)(v16 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254D857C0) + 36)) = 256;
  sub_21479420C((uint64_t)v8, a1, &qword_254D857A8);
  sub_214794058((uint64_t)v5, (uint64_t (*)(_QWORD))v17);
  return sub_214794250((uint64_t)v8, &qword_254D857A8);
}

uint64_t sub_214793C68(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  id v5;
  id v6;

  sub_21479430C(0, &qword_254D858B8);
  v2 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_appearance);
  v3 = (void *)objc_opt_self();
  v4 = objc_msgSend(v3, sel_clearColor);
  objc_msgSend(v2, sel_setBackgroundColor_, v4);

  sub_21479430C(0, (unint64_t *)&unk_254D858C0);
  v5 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_appearance);
  v6 = objc_msgSend(v3, sel_clearColor);
  objc_msgSend(v5, sel_setBackgroundColor_, v6);

  return a1;
}

uint64_t sub_214793D80()
{
  uint64_t v0;

  return swift_deallocObject();
}

unint64_t sub_214793DA4()
{
  unint64_t result;

  result = qword_254D85798;
  if (!qword_254D85798)
  {
    result = MEMORY[0x2199D5108](&unk_214797590, &type metadata for ConfigNavigationView);
    atomic_store(result, (unint64_t *)&qword_254D85798);
  }
  return result;
}

uint64_t sub_214793DE8()
{
  return swift_deallocObject();
}

uint64_t sub_214793DF8()
{
  return swift_getOpaqueTypeConformance2();
}

_QWORD *initializeBufferWithCopyOfBuffer for ConfigNavigationView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for ConfigNavigationView()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for ConfigNavigationView(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for ConfigNavigationView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ConfigNavigationView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ConfigNavigationView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ConfigNavigationView()
{
  return &type metadata for ConfigNavigationView;
}

unint64_t sub_214793F44()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254D85850;
  if (!qword_254D85850)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D857B8);
    v2[0] = sub_214794188(&qword_254D85858, &qword_254D857A8, MEMORY[0x24BDF4700]);
    v2[1] = sub_214794188(&qword_254D85860, &qword_254D857C0, MEMORY[0x24BDEB950]);
    result = MEMORY[0x2199D5108](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254D85850);
  }
  return result;
}

uint64_t sub_214793FE0()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_214794004()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_214794014(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_214794058(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_214794094()
{
  __int128 v1;
  __int128 v2;
  char v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  char v7;
  __int128 v8;

  swift_bridgeObjectRetain();
  sub_214794744();
  v8 = v4;
  v5 = v1;
  v6 = v2;
  v7 = v3;
  sub_214794144();
  sub_214794804();
  sub_21479428C((uint64_t)&v5);
  sub_2147942B4((uint64_t)&v6);
  return sub_2147942E4((uint64_t)&v8);
}

unint64_t sub_214794144()
{
  unint64_t result;

  result = qword_254D858A0;
  if (!qword_254D858A0)
  {
    result = MEMORY[0x2199D5108](MEMORY[0x24BE37EC0], MEMORY[0x24BE37ED8]);
    atomic_store(result, (unint64_t *)&qword_254D858A0);
  }
  return result;
}

uint64_t sub_214794188(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x2199D5108](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2147941C8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_21479420C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_214794250(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_21479428C(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2147942B4(uint64_t a1)
{
  sub_214791FD4();
  return a1;
}

uint64_t sub_2147942E4(uint64_t a1)
{
  swift_release();
  return a1;
}

uint64_t sub_21479430C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_214794744()
{
  return MEMORY[0x24BE37EC8]();
}

uint64_t sub_214794750()
{
  return MEMORY[0x24BE37EE8]();
}

uint64_t sub_21479475C()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t sub_214794768()
{
  return MEMORY[0x24BDEC970]();
}

uint64_t sub_214794774()
{
  return MEMORY[0x24BDED998]();
}

uint64_t sub_214794780()
{
  return MEMORY[0x24BDEEB88]();
}

uint64_t sub_21479478C()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_214794798()
{
  return MEMORY[0x24BDEF1D0]();
}

uint64_t sub_2147947A4()
{
  return MEMORY[0x24BDEFCB8]();
}

uint64_t sub_2147947B0()
{
  return MEMORY[0x24BDF14A0]();
}

uint64_t sub_2147947BC()
{
  return MEMORY[0x24BDF14C0]();
}

uint64_t sub_2147947C8()
{
  return MEMORY[0x24BE37F08]();
}

uint64_t sub_2147947D4()
{
  return MEMORY[0x24BE37F10]();
}

uint64_t sub_2147947E0()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_2147947EC()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_2147947F8()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_214794804()
{
  return MEMORY[0x24BDF2E30]();
}

uint64_t sub_214794810()
{
  return MEMORY[0x24BDF48E8]();
}

uint64_t sub_21479481C()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_214794828()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_214794834()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_214794840()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_21479484C()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_214794858()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t BNPresentableDescription()
{
  return MEMORY[0x24BE0BA18]();
}

uint64_t BSDispatchQueueCreateSerialWithQoS()
{
  return MEMORY[0x24BE0BB68]();
}

uint64_t BSEqualArrays()
{
  return MEMORY[0x24BE0BB80]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x24BE0BBA0]();
}

uint64_t BSEqualStrings()
{
  return MEMORY[0x24BE0BBB0]();
}

uint64_t BSRectRoundForScale()
{
  return MEMORY[0x24BE0BCB8]();
}

uint64_t BSRectWithSize()
{
  return MEMORY[0x24BE0BCC0]();
}

uint64_t BSSizeCeilForScale()
{
  return MEMORY[0x24BE0BD38]();
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  float v3;
  float v4;
  float v5;
  CAFrameRateRange result;

  MEMORY[0x24BDE5440](minimum, maximum, preferred);
  result.preferred = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x24BDE55D0](retstr, sx, sy, sz);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8A0](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E8](retstr, tx, ty);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF030]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBF048]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x24BDBF050]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x24BDBF060]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF088]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t CTFontCopySystemUIFontExcessiveLineHeightCharacterSet()
{
  return MEMORY[0x24BDC4750]();
}

uint64_t CTFontGetExuberatedLineHeightForLineHeight()
{
  return MEMORY[0x24BDC48E8]();
}

uint64_t CTFontHasExuberatedLineHeight()
{
  return MEMORY[0x24BDC4968]();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x24BDD1218](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

uint64_t SBSIsSystemApertureAvailable()
{
  return MEMORY[0x24BEB0C98]();
}

uint64_t SBUISystemApertureDefaultContentSizeCategory()
{
  return MEMORY[0x24BEB1000]();
}

uint64_t UICeilToScale()
{
  return MEMORY[0x24BEBE038]();
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x24BEBE080](lhs, rhs);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x24BEBE0B0](category);
}

uint64_t UIFloorToScale()
{
  return MEMORY[0x24BEBE160]();
}

uint64_t UIRectCenteredIntegralRect()
{
  return MEMORY[0x24BEBE658]();
}

uint64_t UIRectCenteredIntegralRectScale()
{
  return MEMORY[0x24BEBE660]();
}

uint64_t UIRectCenteredXInRect()
{
  return MEMORY[0x24BEBE670]();
}

uint64_t UIRectCenteredXInRectScale()
{
  return MEMORY[0x24BEBE678]();
}

uint64_t UIRectCenteredYInRect()
{
  return MEMORY[0x24BEBE680]();
}

uint64_t UIRectCenteredYInRectScale()
{
  return MEMORY[0x24BEBE688]();
}

uint64_t UIRectInset()
{
  return MEMORY[0x24BEBE6B0]();
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x24BEBE6B8]();
}

uint64_t UIRectRoundToScale()
{
  return MEMORY[0x24BEBE6C8]();
}

uint64_t UIRoundToScale()
{
  return MEMORY[0x24BEBE6D0]();
}

uint64_t UISizeRoundToScale()
{
  return MEMORY[0x24BEBE748]();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x24BEDD3C0](object, key, value, policy);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x24BEE4C28]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x24BEE4DC0]();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
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

