id _CNCinematicError(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD1540];
  if (a2)
  {
    v9 = *MEMORY[0x24BDD1398];
    v10[0] = a2;
    v4 = (void *)MEMORY[0x24BDBCE70];
    v5 = a2;
    objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("CNCinematicErrorDomain"), a1, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
    objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("CNCinematicErrorDomain"), a1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

void sub_2330815B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
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

void _CNLoadFirstAssociatedTrack(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = ___CNLoadFirstAssociatedTrack_block_invoke;
  v11[3] = &unk_25044F6E8;
  v12 = v6;
  v13 = v5;
  v14 = v7;
  v8 = v7;
  v9 = v5;
  v10 = v6;
  objc_msgSend(v9, "loadAssociatedTracksOfType:completionHandler:", v10, v11);

}

void sub_23308294C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_3(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_2330856C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_23308589C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_233085A7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_233085C5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_233085E7C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_23308608C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_233086324(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_233086518(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_233086714(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_233086910(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_233086B04(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_233086CF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_233086EF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_233087108(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_233087310(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2330874EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2330877AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23308799C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_233087B74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_233087D60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_233087F1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_233088174(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_233088368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_5()
{
  return objc_opt_class();
}

id _CNLogSystem()
{
  if (_CNLogSystem_onceToken[0] != -1)
    dispatch_once(_CNLogSystem_onceToken, &__block_literal_global_0);
  return (id)_CNLogSystem_log;
}

id sub_233089720()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_detectionType);
}

id sub_233089730()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_detectionID);
}

id sub_233089740()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_detectionGroupID);
}

id sub_233089750()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_isUserCreated);
}

id sub_233089770()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_isDiscrete);
}

id sub_233089790@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  return sub_2330897A8(a1, a2, a3, (const char **)&selRef_detectionAtOrBeforeTime_, a4);
}

id sub_23308979C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  return sub_2330897A8(a1, a2, a3, (const char **)&selRef_detectionNearestTime_, a4);
}

id sub_2330897A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, const char **a4@<X3>, _QWORD *a5@<X8>)
{
  uint64_t v5;
  void *v7;
  const char *v8;
  id result;
  _QWORD v10[3];

  v7 = *(void **)(v5 + 16);
  v8 = *a4;
  v10[0] = a1;
  v10[1] = a2;
  v10[2] = a3;
  result = objc_msgSend(v7, v8, v10);
  *a5 = result;
  return result;
}

char *sub_2330897FC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  unint64_t v5;
  uint64_t v6;
  char *result;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  unint64_t v12;
  unint64_t v13;
  _QWORD v14[2];
  __int128 v15;
  uint64_t v16;
  uint64_t v17;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(v1 + 16);
  v14[0] = *(_QWORD *)a1;
  v14[1] = *(_QWORD *)(a1 + 8);
  v15 = *(_OWORD *)(a1 + 16);
  v16 = *(_QWORD *)(a1 + 32);
  v17 = v2;
  v4 = objc_msgSend(v3, sel_detectionsInTimeRange_, v14);
  sub_2330899A0();
  v5 = sub_23308EBF0();

  if (!(v5 >> 62))
  {
    v6 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v6)
      goto LABEL_3;
LABEL_13:
    swift_bridgeObjectRelease();
    return (char *)MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRetain();
  v6 = sub_23308EC5C();
  swift_bridgeObjectRelease();
  if (!v6)
    goto LABEL_13;
LABEL_3:
  v14[0] = MEMORY[0x24BEE4AF8];
  result = sub_23308A1D8(0, v6 & ~(v6 >> 63), 0);
  if ((v6 & 0x8000000000000000) == 0)
  {
    v8 = 0;
    v9 = v14[0];
    do
    {
      if ((v5 & 0xC000000000000001) != 0)
        v10 = (id)MEMORY[0x23492E2D0](v8, v5);
      else
        v10 = *(id *)(v5 + 8 * v8 + 32);
      v11 = v10;
      v14[0] = v9;
      v13 = *(_QWORD *)(v9 + 16);
      v12 = *(_QWORD *)(v9 + 24);
      if (v13 >= v12 >> 1)
      {
        sub_23308A1D8((char *)(v12 > 1), v13 + 1, 1);
        v9 = v14[0];
      }
      ++v8;
      *(_QWORD *)(v9 + 16) = v13 + 1;
      *(_QWORD *)(v9 + 8 * v13 + 32) = v11;
    }
    while (v6 != v8);
    swift_bridgeObjectRelease();
    return (char *)v9;
  }
  __break(1u);
  return result;
}

unint64_t sub_2330899A0()
{
  unint64_t result;

  result = qword_256033B80;
  if (!qword_256033B80)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256033B80);
  }
  return result;
}

uint64_t CNDetectionTrack.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t CNDetectionTrack.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t CNFixedDetectionTrack.__allocating_init(focusDisparity:)(float a1)
{
  uint64_t v2;
  id v3;
  double v4;

  v2 = swift_allocObject();
  v3 = objc_allocWithZone((Class)CNFixedDetectionTrack);
  *(float *)&v4 = a1;
  *(_QWORD *)(v2 + 16) = objc_msgSend(v3, sel_initWithFocusDisparity_, v4);
  return v2;
}

uint64_t CNFixedDetectionTrack.init(focusDisparity:)(float a1)
{
  uint64_t v1;
  id v3;
  double v4;

  v3 = objc_allocWithZone((Class)CNFixedDetectionTrack);
  *(float *)&v4 = a1;
  *(_QWORD *)(v1 + 16) = objc_msgSend(v3, sel_initWithFocusDisparity_, v4);
  return v1;
}

uint64_t CNFixedDetectionTrack.__allocating_init(originalDetection:)(void **a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = swift_allocObject();
  v3 = *a1;
  v4 = objc_msgSend(objc_allocWithZone((Class)CNFixedDetectionTrack), sel_initWithOriginalDetection_, v3);

  *(_QWORD *)(v2 + 16) = v4;
  return v2;
}

uint64_t CNFixedDetectionTrack.init(originalDetection:)(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v2 = (void *)*a1;
  v3 = objc_msgSend(objc_allocWithZone((Class)CNFixedDetectionTrack), sel_initWithOriginalDetection_, *a1);

  *(_QWORD *)(v1 + 16) = v3;
  return v1;
}

id sub_233089B70()
{
  objc_opt_self();
  return objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_focusDisparity);
}

id sub_233089BB8@<X0>(_QWORD *a1@<X8>)
{
  id result;

  objc_opt_self();
  result = objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_originalDetection);
  *a1 = result;
  return result;
}

uint64_t CNFixedDetectionTrack.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t CNFixedDetectionTrack.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t CNCustomDetectionTrack.__allocating_init(detections:smooth:)(uint64_t a1, char a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  CNCustomDetectionTrack.init(detections:smooth:)(a1, a2);
  return v4;
}

uint64_t CNCustomDetectionTrack.init(detections:smooth:)(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v3 = v2;
  v6 = *(_QWORD *)(a1 + 16);
  if (v6)
  {
    sub_23308EC38();
    v7 = 0;
    do
    {
      v8 = v7 + 1;
      v9 = *(id *)(a1 + 8 * v7 + 32);
      sub_23308EC20();
      sub_23308EC44();
      sub_23308EC50();
      sub_23308EC2C();
      v7 = v8;
    }
    while (v6 != v8);
  }
  swift_bridgeObjectRelease();
  v10 = objc_allocWithZone((Class)CNCustomDetectionTrack);
  sub_2330899A0();
  v11 = (void *)sub_23308EBE4();
  swift_bridgeObjectRelease();
  v12 = objc_msgSend(v10, sel_initWithDetections_smooth_, v11, a2 & 1);

  *(_QWORD *)(v3 + 16) = v12;
  return v3;
}

char *sub_233089DD4()
{
  id v0;
  unint64_t v1;
  uint64_t v2;
  char *result;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;

  objc_opt_self();
  v0 = objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_allDetections);
  sub_2330899A0();
  v1 = sub_23308EBF0();

  if (!(v1 >> 62))
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v2)
      goto LABEL_3;
LABEL_13:
    swift_bridgeObjectRelease();
    return (char *)MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRetain();
  v2 = sub_23308EC5C();
  swift_bridgeObjectRelease();
  if (!v2)
    goto LABEL_13;
LABEL_3:
  v10 = MEMORY[0x24BEE4AF8];
  result = sub_23308A1D8(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = 0;
    v5 = v10;
    do
    {
      if ((v1 & 0xC000000000000001) != 0)
        v6 = (id)MEMORY[0x23492E2D0](v4, v1);
      else
        v6 = *(id *)(v1 + 8 * v4 + 32);
      v7 = v6;
      v9 = *(_QWORD *)(v10 + 16);
      v8 = *(_QWORD *)(v10 + 24);
      if (v9 >= v8 >> 1)
        sub_23308A1D8((char *)(v8 > 1), v9 + 1, 1);
      ++v4;
      *(_QWORD *)(v10 + 16) = v9 + 1;
      *(_QWORD *)(v10 + 8 * v9 + 32) = v7;
    }
    while (v2 != v4);
    swift_bridgeObjectRelease();
    return (char *)v5;
  }
  __break(1u);
  return result;
}

uint64_t sub_233089F70()
{
  return sub_23308EC74();
}

uint64_t sub_233089F80@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_23308EC98();
  *a1 = result;
  return result;
}

uint64_t sub_233089FA4(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;

  v6 = 0;
  v7 = 1;
  result = MEMORY[0x23492E33C](a1, &v6);
  v4 = v6;
  v5 = v7;
  if (v7)
    v4 = 0;
  *(_QWORD *)a2 = v4;
  *(_BYTE *)(a2 + 8) = v5;
  return result;
}

uint64_t sub_233089FF4(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = sub_23308EC8C();
  *(_QWORD *)a2 = 0;
  *(_BYTE *)(a2 + 8) = 1;
  return v3 & 1;
}

_QWORD *sub_23308A048@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_23308A058(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_23308A064()
{
  sub_23308A51C(&qword_256033EE0, (uint64_t (*)(uint64_t))type metadata accessor for CNDetectionID, (uint64_t)&unk_23308FFDC);
  sub_23308A51C(&qword_256033EE8, (uint64_t (*)(uint64_t))type metadata accessor for CNDetectionID, (uint64_t)&unk_23308FF7C);
  return sub_23308EC68();
}

uint64_t sub_23308A0F8()
{
  sub_23308A51C(&qword_256033ED0, (uint64_t (*)(uint64_t))type metadata accessor for CNDetectionGroupID, (uint64_t)&unk_233090134);
  sub_23308A51C(&qword_256033ED8, (uint64_t (*)(uint64_t))type metadata accessor for CNDetectionGroupID, (uint64_t)&unk_2330900D4);
  return sub_23308EC68();
}

uint64_t sub_23308A18C()
{
  return sub_23308ECA4();
}

uint64_t sub_23308A194()
{
  return sub_23308ECBC();
}

uint64_t sub_23308A1BC()
{
  return sub_23308ECB0();
}

BOOL sub_23308A1C4(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

char *sub_23308A1D8(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_23308A7A0(a1, a2, a3, *v3, &qword_256033F10);
  *v3 = result;
  return result;
}

uint64_t type metadata accessor for CNDetectionTrack()
{
  return objc_opt_self();
}

uint64_t method lookup function for CNDetectionTrack()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CNDetectionTrack.detectionType.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

uint64_t dispatch thunk of CNDetectionTrack.detectionID.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of CNDetectionTrack.detectionGroupID.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of CNDetectionTrack.isUserCreated.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of CNDetectionTrack.isDiscrete.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of CNDetectionTrack.detection(atOrBefore:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of CNDetectionTrack.detection(nearest:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of CNDetectionTrack.detections(in:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(_QWORD *);
  _QWORD v5[2];
  __int128 v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(uint64_t (**)(_QWORD *))(*(_QWORD *)v1 + 152);
  v5[0] = *(_QWORD *)a1;
  v5[1] = *(_QWORD *)(a1 + 8);
  v6 = *(_OWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = v2;
  return v3(v5);
}

uint64_t type metadata accessor for CNFixedDetectionTrack()
{
  return objc_opt_self();
}

uint64_t method lookup function for CNFixedDetectionTrack()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CNFixedDetectionTrack.__allocating_init(focusDisparity:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of CNFixedDetectionTrack.__allocating_init(originalDetection:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t dispatch thunk of CNFixedDetectionTrack.focusDisparity.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of CNFixedDetectionTrack.originalDetection.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t type metadata accessor for CNCustomDetectionTrack()
{
  return objc_opt_self();
}

uint64_t method lookup function for CNCustomDetectionTrack()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CNCustomDetectionTrack.__allocating_init(detections:smooth:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of CNCustomDetectionTrack.allDetections.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
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

uint64_t sub_23308A378(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_23308A398(uint64_t result, int a2, int a3)
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
  sub_23308A964(a1, &qword_256033E78);
}

void type metadata accessor for CNDetectionGroupID(uint64_t a1)
{
  sub_23308A964(a1, &qword_256033E80);
}

void type metadata accessor for CNDetectionID(uint64_t a1)
{
  sub_23308A964(a1, &qword_256033E88);
}

void type metadata accessor for CNRenderingQuality(uint64_t a1)
{
  sub_23308A964(a1, &qword_256033E90);
}

uint64_t initializeBufferWithCopyOfBuffer for CNBoundsPrediction(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t sub_23308A458(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 48))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_23308A478(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
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
  *(_BYTE *)(result + 48) = v3;
  return result;
}

void type metadata accessor for CGAffineTransform(uint64_t a1)
{
  sub_23308A964(a1, &qword_256033E98);
}

uint64_t sub_23308A4C4()
{
  return sub_23308A51C(&qword_256033EA0, (uint64_t (*)(uint64_t))type metadata accessor for CNDetectionID, (uint64_t)&unk_23308FF40);
}

uint64_t sub_23308A4F0()
{
  return sub_23308A51C(&qword_256033EA8, (uint64_t (*)(uint64_t))type metadata accessor for CNDetectionID, (uint64_t)&unk_23308FF14);
}

uint64_t sub_23308A51C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23492E84C](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23308A55C()
{
  return sub_23308A51C(&qword_256033EB0, (uint64_t (*)(uint64_t))type metadata accessor for CNDetectionID, (uint64_t)&unk_23308FFB0);
}

uint64_t sub_23308A588()
{
  return sub_23308A51C(&qword_256033EB8, (uint64_t (*)(uint64_t))type metadata accessor for CNDetectionGroupID, (uint64_t)&unk_233090098);
}

uint64_t sub_23308A5B4()
{
  return sub_23308A51C(&qword_256033EC0, (uint64_t (*)(uint64_t))type metadata accessor for CNDetectionGroupID, (uint64_t)&unk_23309006C);
}

uint64_t sub_23308A5E0()
{
  return sub_23308A51C(&qword_256033EC8, (uint64_t (*)(uint64_t))type metadata accessor for CNDetectionGroupID, (uint64_t)&unk_233090108);
}

char *sub_23308A60C(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_23308A6AC(a1, a2, a3, *v3, &qword_256033F08);
  *v3 = result;
  return result;
}

char *sub_23308A630(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_23308A6AC(a1, a2, a3, *v3, &qword_256033F00);
  *v3 = result;
  return result;
}

char *sub_23308A654(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_23308A7A0(a1, a2, a3, *v3, &qword_256033EF8);
  *v3 = result;
  return result;
}

char *sub_23308A680(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_23308A7A0(a1, a2, a3, *v3, &qword_256033EF0);
  *v3 = result;
  return result;
}

char *sub_23308A6AC(char *result, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  char v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;

  v6 = (char)result;
  if ((a3 & 1) != 0)
  {
    v7 = *((_QWORD *)a4 + 3);
    v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v8 = a2;
    }
  }
  else
  {
    v8 = a2;
  }
  v9 = *((_QWORD *)a4 + 2);
  if (v8 <= v9)
    v10 = *((_QWORD *)a4 + 2);
  else
    v10 = v8;
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    v11 = (char *)swift_allocObject();
    v12 = _swift_stdlib_malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 29;
    *((_QWORD *)v11 + 2) = v9;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 2);
  }
  else
  {
    v11 = (char *)MEMORY[0x24BEE4AF8];
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((v6 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[4 * v9])
      memmove(v14, v15, 4 * v9);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v14, v15, 4 * v9);
  }
  swift_release();
  return v11;
}

char *sub_23308A7A0(char *result, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  char v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;

  v6 = (char)result;
  if ((a3 & 1) != 0)
  {
    v7 = *((_QWORD *)a4 + 3);
    v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v8 = a2;
    }
  }
  else
  {
    v8 = a2;
  }
  v9 = *((_QWORD *)a4 + 2);
  if (v8 <= v9)
    v10 = *((_QWORD *)a4 + 2);
  else
    v10 = v8;
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    v11 = (char *)swift_allocObject();
    v12 = _swift_stdlib_malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 25;
    *((_QWORD *)v11 + 2) = v9;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 3);
  }
  else
  {
    v11 = (char *)MEMORY[0x24BEE4AF8];
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((v6 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[8 * v9])
      memmove(v14, v15, 8 * v9);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v11;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23492E840]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_23308A8F4(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_23308A914(uint64_t result, int a2, int a3)
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
  sub_23308A964(a1, &qword_256033F18);
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_23308A964(a1, (unint64_t *)&unk_256033F20);
}

void sub_23308A964(uint64_t a1, unint64_t *a2)
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

uint64_t CNRenderingSession.Attributes.init(asset:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 128) = a1;
  *(_QWORD *)(v2 + 136) = a2;
  return swift_task_switch();
}

uint64_t sub_23308A9F4()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = v0[17];
  v2 = (void *)objc_opt_self();
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_23308AAA4;
  v3 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v4 = v0 + 10;
  v4[1] = 0x40000000;
  v4[2] = sub_23308ABA4;
  v4[3] = &block_descriptor;
  v4[4] = v3;
  objc_msgSend(v2, sel_loadFromAsset_completionHandler_, v1, v4);
  return swift_continuation_await();
}

uint64_t sub_23308AAA4()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 144) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_23308AB04()
{
  uint64_t v0;
  void *v1;
  _QWORD *v2;
  id v3;
  id v4;

  v2 = *(_QWORD **)(v0 + 128);
  v1 = *(void **)(v0 + 136);
  v3 = *(id *)(v0 + 120);
  v4 = objc_msgSend(v3, sel_renderingVersion);

  *v2 = v3;
  v2[1] = v4;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23308AB64()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 136);
  swift_willThrow();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23308ABA4(uint64_t result, void *a2, void *a3)
{
  _QWORD *v4;
  id v5;
  id v6;

  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_2560340E0);
    swift_allocError();
    *v4 = a3;
    v5 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else if (a2)
  {
    **(_QWORD **)(*(_QWORD *)(*(_QWORD *)(result + 32) + 64) + 40) = a2;
    v6 = a2;
    return swift_continuation_throwingResume();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t CNRenderingSession.Attributes.renderingVersion.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

void CNRenderingSession.FrameAttributes.init(sampleBuffer:sessionAttributes:)(void *a1@<X0>, void **a2@<X1>, _QWORD *a3@<X8>)
{
  sub_23308AC50(a1, a2, (SEL *)&selRef_initWithSampleBuffer_sessionAttributes_, a3);
}

void CNRenderingSession.FrameAttributes.init(timedMetadataGroup:sessionAttributes:)(void *a1@<X0>, void **a2@<X1>, _QWORD *a3@<X8>)
{
  sub_23308AC50(a1, a2, (SEL *)&selRef_initWithTimedMetadataGroup_sessionAttributes_, a3);
}

void sub_23308AC50(void *a1@<X0>, void **a2@<X1>, SEL *a3@<X2>, _QWORD *a4@<X8>)
{
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unint64_t v16;

  v7 = *a2;
  v8 = objc_allocWithZone((Class)CNRenderingSessionFrameAttributes);
  v9 = a1;
  v10 = objc_msgSend(v8, *a3, v9, v7);

  if (v10)
  {
    v11 = v10;
    objc_msgSend(v11, sel_focusDisparity);
    v13 = v12;
    objc_msgSend(v11, sel_fNumber);
    v15 = v14;

    v16 = v13 | ((unint64_t)v15 << 32);
  }
  else
  {

    v16 = 0;
  }
  *a4 = v10;
  a4[1] = v16;
}

float CNRenderingSession.FrameAttributes.focusDisparity.getter()
{
  uint64_t v0;

  return *(float *)(v0 + 8);
}

void CNRenderingSession.FrameAttributes.focusDisparity.setter(float a1)
{
  uint64_t v1;

  *(float *)(v1 + 8) = a1;
}

uint64_t (*CNRenderingSession.FrameAttributes.focusDisparity.modify())()
{
  return nullsub_1;
}

float CNRenderingSession.FrameAttributes.fNumber.getter()
{
  uint64_t v0;

  return *(float *)(v0 + 12);
}

void CNRenderingSession.FrameAttributes.fNumber.setter(float a1)
{
  uint64_t v1;

  *(float *)(v1 + 12) = a1;
}

uint64_t (*CNRenderingSession.FrameAttributes.fNumber.modify())()
{
  return nullsub_1;
}

uint64_t CNRenderingSession.__allocating_init(commandQueue:sessionAttributes:preferredTransform:quality:)(uint64_t a1, uint64_t *a2, __int128 *a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v15;
  __int128 v16;
  _OWORD v17[2];
  uint64_t v18;
  uint64_t v19;

  v15 = a3[1];
  v16 = *a3;
  v8 = *((_QWORD *)a3 + 4);
  v9 = *((_QWORD *)a3 + 5);
  v10 = swift_allocObject();
  v12 = *a2;
  v11 = a2[1];
  v17[0] = v16;
  v17[1] = v15;
  v18 = v8;
  v19 = v9;
  *(_QWORD *)(v10 + 16) = objc_msgSend(objc_allocWithZone((Class)CNRenderingSession), sel_initWithCommandQueue_sessionAttributes_preferredTransform_quality_, a1, v12, v17, a4);
  *(_QWORD *)(v10 + 24) = a1;
  *(_QWORD *)(v10 + 32) = v12;
  *(_QWORD *)(v10 + 40) = v11;
  v13 = a3[1];
  *(_OWORD *)(v10 + 48) = *a3;
  *(_OWORD *)(v10 + 64) = v13;
  *(_OWORD *)(v10 + 80) = a3[2];
  *(_QWORD *)(v10 + 96) = a4;
  return v10;
}

uint64_t CNRenderingSession.init(commandQueue:sessionAttributes:preferredTransform:quality:)(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v14;
  _OWORD v15[2];
  uint64_t v16;
  uint64_t v17;

  v14 = *(_OWORD *)(a3 + 16);
  v8 = *(_QWORD *)(a3 + 32);
  v9 = *(_QWORD *)(a3 + 40);
  v10 = *a2;
  v11 = a2[1];
  v15[0] = *(_OWORD *)a3;
  v15[1] = v14;
  v16 = v8;
  v17 = v9;
  *(_QWORD *)(v4 + 16) = objc_msgSend(objc_allocWithZone((Class)CNRenderingSession), sel_initWithCommandQueue_sessionAttributes_preferredTransform_quality_, a1, v10, v15, a4);
  *(_QWORD *)(v4 + 24) = a1;
  *(_QWORD *)(v4 + 32) = v10;
  *(_QWORD *)(v4 + 40) = v11;
  v12 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(v4 + 48) = *(_OWORD *)a3;
  *(_OWORD *)(v4 + 64) = v12;
  *(_OWORD *)(v4 + 80) = *(_OWORD *)(a3 + 32);
  *(_QWORD *)(v4 + 96) = a4;
  return v4;
}

uint64_t CNRenderingSession.commandQueue.getter()
{
  return swift_unknownObjectRetain();
}

id CNRenderingSession.sessionAttributes.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;

  v2 = *(void **)(v1 + 32);
  v3 = *(_QWORD *)(v1 + 40);
  *a1 = v2;
  a1[1] = v3;
  return v2;
}

__n128 CNRenderingSession.preferredTransform.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __int128 v2;
  __n128 result;

  v2 = *(_OWORD *)(v1 + 64);
  *(_OWORD *)a1 = *(_OWORD *)(v1 + 48);
  *(_OWORD *)(a1 + 16) = v2;
  result = *(__n128 *)(v1 + 80);
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t CNRenderingSession.quality.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 96);
}

id sub_23308AF10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_23308AF28(a1, a2, a3, a4, a5, (SEL *)&selRef_encodeRenderToCommandBuffer_frameAttributes_sourceImage_sourceDisparity_destinationImage_);
}

id sub_23308AF1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_23308AF28(a1, a2, a3, a4, a5, (SEL *)&selRef_encodeRenderToCommandBuffer_frameAttributes_sourceImage_sourceDisparity_destinationRGBA_);
}

id sub_23308AF28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, SEL *a6)
{
  uint64_t v6;
  int v12;
  int v13;
  void *v14;
  id v15;
  double v16;
  double v17;
  id v18;
  id v20;

  v12 = *(_DWORD *)(a2 + 8);
  v13 = *(_DWORD *)(a2 + 12);
  v14 = *(void **)(v6 + 16);
  v15 = *(id *)a2;
  objc_msgSend(v15, sel_mutableCopy);
  sub_23308EC08();
  swift_unknownObjectRelease();
  sub_23308B174(0, &qword_256033F98);
  swift_dynamicCast();
  LODWORD(v16) = v12;
  objc_msgSend(v20, sel_setFocusDisparity_, v16);
  LODWORD(v17) = v13;
  objc_msgSend(v20, sel_setFNumber_, v17);

  v18 = objc_msgSend(v14, *a6, a1, v20, a3, a4, a5);
  return v18;
}

id sub_23308B044(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  int v12;
  int v13;
  void *v14;
  id v15;
  double v16;
  double v17;
  id v18;
  id v20;

  v12 = *(_DWORD *)(a2 + 8);
  v13 = *(_DWORD *)(a2 + 12);
  v14 = *(void **)(v6 + 16);
  v15 = *(id *)a2;
  objc_msgSend(v15, sel_mutableCopy);
  sub_23308EC08();
  swift_unknownObjectRelease();
  sub_23308B174(0, &qword_256033F98);
  swift_dynamicCast();
  LODWORD(v16) = v12;
  objc_msgSend(v20, sel_setFocusDisparity_, v16);
  LODWORD(v17) = v13;
  objc_msgSend(v20, sel_setFNumber_, v17);

  v18 = objc_msgSend(v14, sel_encodeRenderToCommandBuffer_frameAttributes_sourceImage_sourceDisparity_destinationLuma_destinationChroma_, a1, v20, a3, a4, a5, a6);
  return v18;
}

char *static CNRenderingSession.sourcePixelFormatTypes.getter()
{
  return sub_23308B1B8((SEL *)&selRef_sourcePixelFormatTypes);
}

uint64_t sub_23308B174(uint64_t a1, unint64_t *a2)
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

char *static CNRenderingSession.destinationPixelFormatTypes.getter()
{
  return sub_23308B1B8((SEL *)&selRef_destinationPixelFormatTypes);
}

char *sub_23308B1B8(SEL *a1)
{
  id v1;
  unint64_t v2;
  uint64_t v3;
  char *result;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  unsigned int v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;

  v1 = objc_msgSend((id)objc_opt_self(), *a1);
  sub_23308B174(0, &qword_256033FA0);
  v2 = sub_23308EBF0();

  if (!(v2 >> 62))
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v3)
      goto LABEL_3;
LABEL_13:
    swift_bridgeObjectRelease();
    return (char *)MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRetain();
  v3 = sub_23308EC5C();
  swift_bridgeObjectRelease();
  if (!v3)
    goto LABEL_13;
LABEL_3:
  v12 = MEMORY[0x24BEE4AF8];
  result = sub_23308A60C(0, v3 & ~(v3 >> 63), 0);
  if ((v3 & 0x8000000000000000) == 0)
  {
    v5 = 0;
    v6 = v12;
    do
    {
      if ((v2 & 0xC000000000000001) != 0)
        v7 = (id)MEMORY[0x23492E2D0](v5, v2);
      else
        v7 = *(id *)(v2 + 8 * v5 + 32);
      v8 = v7;
      v9 = objc_msgSend(v7, sel_unsignedIntValue);

      v11 = *(_QWORD *)(v12 + 16);
      v10 = *(_QWORD *)(v12 + 24);
      if (v11 >= v10 >> 1)
        sub_23308A60C((char *)(v10 > 1), v11 + 1, 1);
      ++v5;
      *(_QWORD *)(v12 + 16) = v11 + 1;
      *(_DWORD *)(v12 + 4 * v11 + 32) = v9;
    }
    while (v3 != v5);
    swift_bridgeObjectRelease();
    return (char *)v6;
  }
  __break(1u);
  return result;
}

uint64_t CNRenderingSession.deinit()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  return v0;
}

uint64_t CNRenderingSession.__deallocating_deinit()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for CNRenderingSession()
{
  return objc_opt_self();
}

uint64_t method lookup function for CNRenderingSession()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CNRenderingSession.__allocating_init(commandQueue:sessionAttributes:preferredTransform:quality:)(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t, _OWORD *);
  __int128 v5;
  _OWORD v7[3];

  v4 = *(uint64_t (**)(uint64_t, uint64_t, _OWORD *))(v3 + 120);
  v5 = a3[1];
  v7[0] = *a3;
  v7[1] = v5;
  v7[2] = a3[2];
  return v4(a1, a2, v7);
}

uint64_t dispatch thunk of CNRenderingSession.encodeRender(to:frameAttributes:sourceImage:sourceDisparity:destinationImage:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of CNRenderingSession.encodeRender(to:frameAttributes:sourceImage:sourceDisparity:destinationRGBA:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of CNRenderingSession.encodeRender(to:frameAttributes:sourceImage:sourceDisparity:destinationLuma:destinationChroma:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

_QWORD *initializeBufferWithCopyOfBuffer for CNRenderingSession.Attributes(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v5 = v3;
  return a1;
}

void destroy for CNRenderingSession.Attributes(id *a1)
{

}

uint64_t assignWithCopy for CNRenderingSession.Attributes(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  return a1;
}

uint64_t assignWithTake for CNRenderingSession.Attributes(uint64_t a1, _QWORD *a2)
{
  void *v4;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  *(_QWORD *)(a1 + 8) = a2[1];
  return a1;
}

ValueMetadata *type metadata accessor for CNRenderingSession.Attributes()
{
  return &type metadata for CNRenderingSession.Attributes;
}

_QWORD *initializeBufferWithCopyOfBuffer for CNRenderingSession.FrameAttributes(_QWORD *a1, uint64_t a2)
{
  void *v3;
  id v4;

  v3 = *(void **)a2;
  *a1 = *(_QWORD *)a2;
  a1[1] = *(_QWORD *)(a2 + 8);
  v4 = v3;
  return a1;
}

uint64_t assignWithCopy for CNRenderingSession.FrameAttributes(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(_DWORD *)(a1 + 12) = *(_DWORD *)(a2 + 12);
  return a1;
}

uint64_t assignWithTake for CNRenderingSession.FrameAttributes(uint64_t a1, _QWORD *a2)
{
  void *v4;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  *(_QWORD *)(a1 + 8) = a2[1];
  return a1;
}

uint64_t _s9Cinematic18CNRenderingSessionC10AttributesVwet_0(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_23308B620(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CNRenderingSession.FrameAttributes()
{
  return &type metadata for CNRenderingSession.FrameAttributes;
}

Cinematic::CNDetection __swiftcall CNDetection.init(time:detectionType:normalizedRect:focusDisparity:)(CMTime time, CNDetectionType detectionType, __C::CGRect normalizedRect, Swift::Float focusDisparity)
{
  objc_class **v4;
  double height;
  double width;
  double y;
  double x;
  CMTimeEpoch epoch;
  CMTimeScale timescale;
  CMTimeValue value;
  objc_class **v13;
  CMTimeFlags flags;
  id v15;
  double v16;
  objc_class *v17;
  PTCinematographyDetection *v18;
  unint64_t v19;
  CMTimeValue v20;
  CMTimeScale v21;
  CMTimeFlags v22;
  CMTimeEpoch v23;
  Cinematic::CNDetection result;

  height = normalizedRect.size.height;
  width = normalizedRect.size.width;
  y = normalizedRect.origin.y;
  x = normalizedRect.origin.x;
  epoch = time.epoch;
  timescale = time.timescale;
  value = time.value;
  v13 = v4;
  flags = time.flags;
  v15 = objc_allocWithZone((Class)CNDetection);
  v20 = value;
  v21 = timescale;
  v22 = flags;
  v23 = epoch;
  *(Swift::Float *)&v16 = focusDisparity;
  v17 = (objc_class *)objc_msgSend(v15, sel_initWithTime_detectionType_normalizedRect_focusDisparity_, &v20, 0, x, y, width, height, v16);
  *v13 = v17;
  result.internalDetection._creationHash = v19;
  result.internalDetection._internalDetection = v18;
  result.internalDetection.super.isa = v17;
  return result;
}

uint64_t CNDetection.time.getter()
{
  id *v0;
  uint64_t v2;

  objc_msgSend(*v0, sel_time);
  return v2;
}

id CNDetection.detectionType.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_detectionType);
}

id CNDetection.normalizedRect.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_normalizedRect);
}

id CNDetection.focusDisparity.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_focusDisparity);
}

id CNDetection.detectionID.getter()
{
  return sub_23308B7B8((SEL *)&selRef_detectionID, (SEL *)&selRef_isValidDetectionID_);
}

id CNDetection.detectionGroupID.getter()
{
  return sub_23308B7B8((SEL *)&selRef_detectionGroupID, (SEL *)&selRef_isValidDetectionGroupID_);
}

id sub_23308B7B8(SEL *a1, SEL *a2)
{
  void **v2;
  void *v4;

  v4 = *v2;
  if (objc_msgSend((id)objc_opt_self(), *a2, objc_msgSend(v4, *a1)))
    return objc_msgSend(v4, *a1);
  else
    return 0;
}

uint64_t static CNDetection.accessibilityLabel(for:)(uint64_t a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_msgSend((id)objc_opt_self(), sel_accessibilityLabelForDetectionType_, a1);
  v2 = sub_23308EBD8();

  return v2;
}

id static CNDetection.disparity(in:sourceDisparity:detectionType:priorDisparity:)(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6, double a7)
{
  float v13;
  void *v14;
  double v15;

  if ((a3 & 0x100000000) != 0)
    v13 = NAN;
  else
    v13 = *(float *)&a3;
  v14 = (void *)objc_opt_self();
  *(float *)&v15 = v13;
  return objc_msgSend(v14, sel_disparityInNormalizedRect_sourceDisparity_detectionType_priorDisparity_, a1, a2, a4, a5, a6, a7, v15);
}

ValueMetadata *type metadata accessor for CNDetection()
{
  return &type metadata for CNDetection;
}

uint64_t sub_23308B930(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 120) = a1;
  return swift_task_switch();
}

uint64_t sub_23308B948()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = v0[15];
  v2 = (void *)objc_opt_self();
  v0[7] = v0 + 16;
  v0[2] = v0;
  v0[3] = sub_23308B9F8;
  v3 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v4 = v0 + 10;
  v4[1] = 0x40000000;
  v4[2] = sub_23308BA50;
  v4[3] = &block_descriptor_0;
  v4[4] = v3;
  objc_msgSend(v2, sel_checkIfCinematic_completionHandler_, v1, v4);
  return swift_continuation_await();
}

uint64_t sub_23308B9F8()
{
  return swift_task_switch();
}

uint64_t sub_23308BA44()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(unsigned __int8 *)(v0 + 128));
}

uint64_t sub_23308BA50(uint64_t a1, char a2)
{
  **(_BYTE **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 40) = a2;
  return swift_continuation_resume();
}

uint64_t CNAssetInfo.__allocating_init(asset:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  _QWORD *v4;

  v3 = swift_allocObject();
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_23308BAD8;
  v4[16] = a1;
  v4[17] = v3;
  return swift_task_switch();
}

uint64_t sub_23308BAD8(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = swift_task_dealloc();
  if (!v1)
    v5 = a1;
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(v5);
}

uint64_t CNAssetInfo.init(asset:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 128) = a1;
  *(_QWORD *)(v2 + 136) = v1;
  return swift_task_switch();
}

uint64_t sub_23308BB44()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = v0[16];
  v2 = (void *)objc_opt_self();
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_23308BBF4;
  v3 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v4 = v0 + 10;
  v4[1] = 0x40000000;
  v4[2] = sub_23308ABA4;
  v4[3] = &block_descriptor_3;
  v4[4] = v3;
  objc_msgSend(v2, sel_loadFromAsset_completionHandler_, v1, v4);
  return swift_continuation_await();
}

uint64_t sub_23308BBF4()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 144) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_23308BC54()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(void **)(v0 + 128);
  v1 = *(_QWORD *)(v0 + 136);
  v3 = *(void **)(v0 + 120);
  *(_QWORD *)(v1 + 16) = v3;
  v4 = v3;
  v5 = objc_msgSend(v4, sel_asset);

  *(_QWORD *)(v1 + 24) = v5;
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 136));
}

uint64_t sub_23308BCC4()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 128);
  swift_willThrow();

  type metadata accessor for CNAssetInfo();
  swift_deallocPartialClassInstance();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t type metadata accessor for CNAssetInfo()
{
  return objc_opt_self();
}

id CNAssetInfo.asset.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 24);
}

uint64_t sub_23308BD48()
{
  return sub_23308BF08((SEL *)&selRef_allCinematicTracks);
}

id sub_23308BD54()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_cinematicVideoTrack);
}

id sub_23308BD78()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_cinematicDisparityTrack);
}

id sub_23308BD9C()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_cinematicMetadataTrack);
}

double sub_23308BDC0@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  double result;
  uint64_t v4;
  double v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(*(id *)(v1 + 16), sel_timeRange);
  result = v5;
  *(_QWORD *)a1 = v4;
  *(double *)(a1 + 8) = v5;
  *(_OWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  return result;
}

id sub_23308BE20()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_naturalSize);
}

id sub_23308BE30()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_preferredSize);
}

double sub_23308BE40@<D0>(_OWORD *a1@<X8>)
{
  uint64_t v1;
  double result;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  objc_msgSend(*(id *)(v1 + 16), sel_preferredTransform);
  result = *(double *)&v4;
  *a1 = v4;
  a1[1] = v5;
  a1[2] = v6;
  return result;
}

uint64_t CNAssetInfo.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t CNAssetInfo.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

id CNAssetInfo.frameTimingTrack.getter()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_frameTimingTrack);
}

uint64_t CNAssetInfo.videoCompositionTracks.getter()
{
  return sub_23308BF08((SEL *)&selRef_videoCompositionTracks);
}

uint64_t sub_23308BF08(SEL *a1)
{
  uint64_t v1;
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(*(id *)(v1 + 16), *a1);
  sub_23308B174(0, &qword_256034108);
  v3 = sub_23308EBF0();

  return v3;
}

char *CNAssetInfo.videoCompositionTrackIDs.getter()
{
  return sub_23308BF84((SEL *)&selRef_videoCompositionTrackIDs);
}

char *CNAssetInfo.sampleDataTrackIDs.getter()
{
  return sub_23308BF84((SEL *)&selRef_sampleDataTrackIDs);
}

char *sub_23308BF84(SEL *a1)
{
  uint64_t v1;
  id v2;
  unint64_t v3;
  uint64_t v4;
  char *result;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;

  v2 = objc_msgSend(*(id *)(v1 + 16), *a1);
  sub_23308B174(0, &qword_256033FA0);
  v3 = sub_23308EBF0();

  if (!(v3 >> 62))
  {
    v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v4)
      goto LABEL_3;
LABEL_13:
    swift_bridgeObjectRelease();
    return (char *)MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRetain();
  v4 = sub_23308EC5C();
  swift_bridgeObjectRelease();
  if (!v4)
    goto LABEL_13;
LABEL_3:
  v13 = MEMORY[0x24BEE4AF8];
  result = sub_23308A630(0, v4 & ~(v4 >> 63), 0);
  if ((v4 & 0x8000000000000000) == 0)
  {
    v6 = 0;
    v7 = v13;
    do
    {
      if ((v3 & 0xC000000000000001) != 0)
        v8 = (id)MEMORY[0x23492E2D0](v6, v3);
      else
        v8 = *(id *)(v3 + 8 * v6 + 32);
      v9 = v8;
      v10 = objc_msgSend(v8, sel_intValue);

      v12 = *(_QWORD *)(v13 + 16);
      v11 = *(_QWORD *)(v13 + 24);
      if (v12 >= v11 >> 1)
        sub_23308A630((char *)(v11 > 1), v12 + 1, 1);
      ++v6;
      *(_QWORD *)(v13 + 16) = v12 + 1;
      *(_DWORD *)(v13 + 4 * v12 + 32) = v10;
    }
    while (v4 != v6);
    swift_bridgeObjectRelease();
    return (char *)v7;
  }
  __break(1u);
  return result;
}

id sub_23308C128(uint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  int v5;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v16;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v22;
  _QWORD v23[6];
  id v24[2];

  v5 = a4;
  v24[1] = *(id *)MEMORY[0x24BDAC8D0];
  v8 = HIDWORD(a4);
  v9 = *a1;
  v10 = a1[2];
  v11 = a1[3];
  v12 = a1[5];
  objc_opt_self();
  v13 = (void *)swift_dynamicCastObjCClassUnconditional();
  v14 = *(_QWORD *)(a2 + 16);
  v23[5] = v12;
  v24[0] = 0;
  v23[1] = a1[1];
  v23[2] = v10;
  v23[3] = v11;
  v23[4] = a1[4];
  v19 = a3;
  v20 = v5;
  v21 = v8;
  v22 = a5;
  v23[0] = v9;
  if (objc_msgSend(v13, sel_insertTimeRange_ofCinematicAssetInfo_atTime_error_, v23, v14, &v19, v24))
    return v24[0];
  v16 = v24[0];
  sub_23308EBB4();

  return (id)swift_willThrow();
}

uint64_t CNCompositionInfo.__allocating_init(asset:)()
{
  return swift_task_switch();
}

void sub_23308C28C()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t CNCompositionInfo.init(asset:)()
{
  return swift_task_switch();
}

uint64_t CNCompositionInfo.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t CNCompositionInfo.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t AVMutableComposition.addTracks(for:preferredStartingTrackID:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;
  uint64_t v4;

  v3 = objc_msgSend(v2, sel_addTracksForCinematicAssetInfo_preferredStartingTrackID_, *(_QWORD *)(a1 + 16), a2);
  type metadata accessor for CNCompositionInfo();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v3;
  *(_QWORD *)(v4 + 24) = objc_msgSend(v3, sel_asset);
  return v4;
}

uint64_t type metadata accessor for CNCompositionInfo()
{
  return objc_opt_self();
}

uint64_t method lookup function for CNAssetInfo()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of static CNAssetInfo.isCinematic(asset:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(v1 + 104) + *(_QWORD *)(v1 + 104));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23308C428;
  return v6(a1);
}

uint64_t sub_23308C428(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t dispatch thunk of CNAssetInfo.__allocating_init(asset:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(v1 + 112) + *(_QWORD *)(v1 + 112));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23308C4D8;
  return v6(a1);
}

uint64_t sub_23308C4D8(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t dispatch thunk of CNAssetInfo.allCinematicTracks.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of CNAssetInfo.cinematicVideoTrack.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of CNAssetInfo.cinematicDisparityTrack.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of CNAssetInfo.cinematicMetadataTrack.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of CNAssetInfo.timeRange.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of CNAssetInfo.naturalSize.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of CNAssetInfo.preferredSize.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of CNAssetInfo.preferredTransform.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t method lookup function for CNCompositionInfo()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CNCompositionInfo.insertTimeRange(_:of:at:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(_QWORD *);
  _QWORD v5[2];
  __int128 v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(uint64_t (**)(_QWORD *))(*(_QWORD *)v1 + 200);
  v5[0] = *(_QWORD *)a1;
  v5[1] = *(_QWORD *)(a1 + 8);
  v6 = *(_OWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = v2;
  return v3(v5);
}

uint64_t static CNDecision.FocusDetectionID.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return (*(_QWORD *)a1 == *(_QWORD *)a2) & ~(*(unsigned __int8 *)(a1 + 8) ^ *(unsigned __int8 *)(a2 + 8));
}

uint64_t sub_23308C60C(uint64_t a1, uint64_t a2)
{
  return (*(_QWORD *)a1 == *(_QWORD *)a2) & ~(*(unsigned __int8 *)(a1 + 8) ^ *(unsigned __int8 *)(a2 + 8));
}

Cinematic::CNDecision __swiftcall CNDecision.init(time:detectionID:strong:)(CMTime time, CNDetectionID detectionID, Swift::Bool strong)
{
  _QWORD *v3;
  objc_class *v4;
  PTCinematographyDecision *v5;
  Cinematic::CNDecision result;

  v4 = (objc_class *)sub_23308C648(time.value, *(unint64_t *)&time.timescale, time.epoch, detectionID, strong, (const char **)&selRef_initWithTime_detectionID_strong_, v3);
  result.internalDecision._internalDecision = v5;
  result.internalDecision.super.isa = v4;
  return result;
}

Cinematic::CNDecision __swiftcall CNDecision.init(time:detectionGroupID:strong:)(CMTime time, CNDetectionGroupID detectionGroupID, Swift::Bool strong)
{
  _QWORD *v3;
  objc_class *v4;
  PTCinematographyDecision *v5;
  Cinematic::CNDecision result;

  v4 = (objc_class *)sub_23308C648(time.value, *(unint64_t *)&time.timescale, time.epoch, detectionGroupID, strong, (const char **)&selRef_initWithTime_detectionGroupID_strong_, v3);
  result.internalDecision._internalDecision = v5;
  result.internalDecision.super.isa = v4;
  return result;
}

id sub_23308C648@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, const char **a6@<X5>, _QWORD *a7@<X8>)
{
  int v11;
  unint64_t v14;
  id v15;
  const char *v16;
  id result;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t v21;

  v11 = a2;
  v14 = HIDWORD(a2);
  v15 = objc_allocWithZone((Class)CNDecision);
  v16 = *a6;
  v18 = a1;
  v19 = v11;
  v20 = v14;
  v21 = a3;
  result = objc_msgSend(v15, v16, &v18, a4, a5 & 1);
  *a7 = result;
  return result;
}

uint64_t CNDecision.time.getter()
{
  id *v0;
  uint64_t v2;

  objc_msgSend(*v0, sel_time);
  return v2;
}

id CNDecision.focusDetectionID.getter@<X0>(uint64_t a1@<X8>)
{
  void **v1;
  void *v3;
  unsigned int v4;
  char v5;
  char **v6;
  id result;

  v3 = *v1;
  v4 = objc_msgSend(v3, sel_isGroupDecision);
  v5 = v4;
  v6 = &selRef_detectionGroupID;
  if (!v4)
    v6 = &selRef_detectionID;
  result = objc_msgSend(v3, *v6);
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v5;
  return result;
}

id CNDecision.isUserDecision.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_isUserDecision);
}

id CNDecision.isStrongDecision.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_isStrongDecision);
}

uint64_t static CNDecision.== infix(_:_:)()
{
  sub_23308C82C();
  return sub_23308EBFC() & 1;
}

uint64_t sub_23308C7EC()
{
  sub_23308C82C();
  return sub_23308EBFC() & 1;
}

unint64_t sub_23308C82C()
{
  unint64_t result;

  result = qword_256034338;
  if (!qword_256034338)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256034338);
  }
  return result;
}

ValueMetadata *type metadata accessor for CNDecision()
{
  return &type metadata for CNDecision;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for CNDecision.FocusDetectionID(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for CNDecision.FocusDetectionID(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

uint64_t sub_23308C918(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_23308C920(uint64_t result, char a2)
{
  *(_BYTE *)(result + 8) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CNDecision.FocusDetectionID()
{
  return &type metadata for CNDecision.FocusDetectionID;
}

double CNBoundsPrediction.normalizedBounds.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

void CNBoundsPrediction.normalizedBounds.setter(double a1, double a2, double a3, double a4)
{
  double *v4;

  *v4 = a1;
  v4[1] = a2;
  v4[2] = a3;
  v4[3] = a4;
}

uint64_t (*CNBoundsPrediction.normalizedBounds.modify())()
{
  return nullsub_1;
}

float CNBoundsPrediction.confidence.getter()
{
  uint64_t v0;

  return *(float *)(v0 + 32);
}

void CNBoundsPrediction.confidence.setter(float a1)
{
  uint64_t v1;

  *(float *)(v1 + 32) = a1;
}

uint64_t (*CNBoundsPrediction.confidence.modify())()
{
  return nullsub_1;
}

id static CNObjectTracker.isSupported.getter()
{
  return objc_msgSend((id)objc_opt_self(), sel_isSupported);
}

uint64_t CNObjectTracker.__allocating_init(commandQueue:)(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = swift_allocObject();
  v3 = objc_msgSend(objc_allocWithZone((Class)CNObjectTracker), sel_initWithCommandQueue_, a1);
  swift_unknownObjectRelease();
  *(_QWORD *)(v2 + 16) = v3;
  return v2;
}

uint64_t CNObjectTracker.init(commandQueue:)(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v2 = objc_msgSend(objc_allocWithZone((Class)CNObjectTracker), sel_initWithCommandQueue_, a1);
  swift_unknownObjectRelease();
  *(_QWORD *)(v1 + 16) = v2;
  return v1;
}

void sub_23308CA68(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;

  v4 = objc_msgSend(*(id *)(v2 + 16), sel_findObjectAtPoint_sourceImage_, a1);
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v6, sel_normalizedBounds);
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    objc_msgSend(v6, sel_confidence);
    v16 = v15;

  }
  else
  {
    v16 = 0;
    v8 = 0;
    v10 = 0;
    v12 = 0;
    v14 = 0;
  }
  *(_QWORD *)a2 = v8;
  *(_QWORD *)(a2 + 8) = v10;
  *(_QWORD *)(a2 + 16) = v12;
  *(_QWORD *)(a2 + 24) = v14;
  *(_DWORD *)(a2 + 32) = v16;
  *(_BYTE *)(a2 + 36) = v5 == 0;
}

id sub_23308CB38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void *v4;
  _QWORD v6[3];

  v4 = *(void **)(v3 + 16);
  v6[0] = a1;
  v6[1] = a2;
  v6[2] = a3;
  return objc_msgSend(v4, sel_startTrackingAt_within_sourceImage_sourceDisparity_, v6);
}

void sub_23308CB7C(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  _QWORD v20[3];

  v6 = *(void **)(v4 + 16);
  v20[0] = a1;
  v20[1] = a2;
  v20[2] = a3;
  v7 = objc_msgSend(v6, sel_continueTrackingAt_sourceImage_sourceDisparity_, v20);
  v8 = v7;
  if (v7)
  {
    v9 = v7;
    objc_msgSend(v9, sel_normalizedBounds);
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    objc_msgSend(v9, sel_confidence);
    v19 = v18;

  }
  else
  {
    v19 = 0;
    v11 = 0;
    v13 = 0;
    v15 = 0;
    v17 = 0;
  }
  *(_QWORD *)a4 = v11;
  *(_QWORD *)(a4 + 8) = v13;
  *(_QWORD *)(a4 + 16) = v15;
  *(_QWORD *)(a4 + 24) = v17;
  *(_DWORD *)(a4 + 32) = v19;
  *(_BYTE *)(a4 + 36) = v8 == 0;
}

uint64_t sub_23308CC68()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t result;

  v1 = objc_msgSend(*(id *)(v0 + 16), sel_finishDetectionTrack);
  objc_opt_self();
  v2 = swift_dynamicCastObjCClass();
  if (v2)
  {
    v3 = (void *)v2;
    type metadata accessor for CNFixedDetectionTrack();
  }
  else
  {
    objc_opt_self();
    v4 = swift_dynamicCastObjCClass();
    if (!v4)
    {
      type metadata accessor for CNDetectionTrack();
      goto LABEL_6;
    }
    v3 = (void *)v4;
    type metadata accessor for CNCustomDetectionTrack();
  }
  v1 = v3;
LABEL_6:
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = v1;
  return result;
}

id sub_23308CD0C()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_resetDetectionTrack);
}

uint64_t CNObjectTracker.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t CNObjectTracker.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

__n128 __swift_memcpy36_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for CNBoundsPrediction(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 36))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for CNBoundsPrediction(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_DWORD *)(result + 32) = 0;
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
  *(_BYTE *)(result + 36) = v3;
  return result;
}

ValueMetadata *type metadata accessor for CNBoundsPrediction()
{
  return &type metadata for CNBoundsPrediction;
}

uint64_t type metadata accessor for CNObjectTracker()
{
  return objc_opt_self();
}

uint64_t method lookup function for CNObjectTracker()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CNObjectTracker.__allocating_init(commandQueue:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of CNObjectTracker.findObject(at:sourceImage:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of CNObjectTracker.startTracking(at:within:sourceImage:sourceDisparity:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of CNObjectTracker.continueTracking(at:sourceImage:sourceDisparity:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of CNObjectTracker.finishDetectionTrack()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of CNObjectTracker.resetDetectionTrack()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t CNScript.Frame.time.getter()
{
  id *v0;
  uint64_t v2;

  objc_msgSend(*v0, sel_time);
  return v2;
}

id CNScript.Frame.focusDisparity.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_focusDisparity);
}

id CNScript.Frame.focusDetection.getter@<X0>(_QWORD *a1@<X8>)
{
  id *v1;
  id result;

  result = objc_msgSend(*v1, sel_focusDetection);
  *a1 = result;
  return result;
}

char *CNScript.Frame.allDetections.getter()
{
  id *v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  char *result;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;

  v1 = objc_msgSend(*v0, sel_allDetections);
  sub_23308B174(0, (unint64_t *)&qword_256033B80);
  v2 = sub_23308EBF0();

  if (!(v2 >> 62))
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v3)
      goto LABEL_3;
LABEL_13:
    swift_bridgeObjectRelease();
    return (char *)MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRetain();
  v3 = sub_23308EC5C();
  swift_bridgeObjectRelease();
  if (!v3)
    goto LABEL_13;
LABEL_3:
  v11 = MEMORY[0x24BEE4AF8];
  result = sub_23308A1D8(0, v3 & ~(v3 >> 63), 0);
  if ((v3 & 0x8000000000000000) == 0)
  {
    v5 = 0;
    v6 = v11;
    do
    {
      if ((v2 & 0xC000000000000001) != 0)
        v7 = (id)MEMORY[0x23492E2D0](v5, v2);
      else
        v7 = *(id *)(v2 + 8 * v5 + 32);
      v8 = v7;
      v10 = *(_QWORD *)(v11 + 16);
      v9 = *(_QWORD *)(v11 + 24);
      if (v10 >= v9 >> 1)
        sub_23308A1D8((char *)(v9 > 1), v10 + 1, 1);
      ++v5;
      *(_QWORD *)(v11 + 16) = v10 + 1;
      *(_QWORD *)(v11 + 8 * v10 + 32) = v8;
    }
    while (v3 != v5);
    swift_bridgeObjectRelease();
    return (char *)v6;
  }
  __break(1u);
  return result;
}

Cinematic::CNDetection_optional __swiftcall CNScript.Frame.detection(for:)(CNDetectionID a1)
{
  objc_class **v1;
  id *v2;
  objc_class **v3;
  objc_class *v4;
  PTCinematographyDetection *v5;
  unint64_t v6;
  Swift::Bool v7;
  Cinematic::CNDetection_optional result;

  v3 = v1;
  v4 = (objc_class *)objc_msgSend(*v2, sel_detectionForID_, a1);
  *v3 = v4;
  result.value.internalDetection._creationHash = v6;
  result.value.internalDetection._internalDetection = v5;
  result.value.internalDetection.super.isa = v4;
  result.is_nil = v7;
  return result;
}

Cinematic::CNDetection_optional __swiftcall CNScript.Frame.bestDetection(for:)(CNDetectionGroupID a1)
{
  objc_class **v1;
  id *v2;
  objc_class **v3;
  objc_class *v4;
  PTCinematographyDetection *v5;
  unint64_t v6;
  Swift::Bool v7;
  Cinematic::CNDetection_optional result;

  v3 = v1;
  v4 = (objc_class *)objc_msgSend(*v2, sel_bestDetectionForGroupID_, a1);
  *v3 = v4;
  result.value.internalDetection._creationHash = v6;
  result.value.internalDetection._internalDetection = v5;
  result.value.internalDetection.super.isa = v4;
  result.is_nil = v7;
  return result;
}

uint64_t CNScript.__allocating_init(asset:changes:progress:)(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;

  v7 = (_QWORD *)swift_allocObject();
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v8;
  *v8 = v3;
  v8[1] = sub_23308BAD8;
  v8[17] = a3;
  v8[18] = v7;
  v8[16] = a1;
  v9 = *a2;
  v8[19] = *v7;
  v8[20] = v9;
  return swift_task_switch();
}

uint64_t CNScript.init(asset:changes:progress:)(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;

  v4[17] = a3;
  v4[18] = v3;
  v4[16] = a1;
  v5 = *a2;
  v4[19] = *v3;
  v4[20] = v5;
  return swift_task_switch();
}

uint64_t sub_23308D178()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD *v6;

  v1 = v0[20];
  v3 = v0[16];
  v2 = v0[17];
  v4 = (void *)objc_opt_self();
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_23308D23C;
  v5 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v6 = v0 + 10;
  v6[1] = 0x40000000;
  v6[2] = sub_23308ABA4;
  v6[3] = &block_descriptor_1;
  v6[4] = v5;
  objc_msgSend(v4, sel_loadFromAsset_changes_progress_completionHandler_, v3, v1, v2, v6);
  return swift_continuation_await();
}

uint64_t sub_23308D23C()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 168) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_23308D29C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v1 = *(void **)(v0 + 160);
  v3 = *(void **)(v0 + 136);
  v2 = *(_QWORD *)(v0 + 144);

  *(_QWORD *)(v2 + 16) = *(_QWORD *)(v0 + 120);
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 144));
}

uint64_t sub_23308D2F4()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;

  v1 = *(void **)(v0 + 160);
  v3 = *(void **)(v0 + 128);
  v2 = *(void **)(v0 + 136);
  swift_willThrow();

  swift_deallocPartialClassInstance();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

Swift::Void __swiftcall CNScript.reload(changes:)(Cinematic::CNScript::Changes_optional changes)
{
  uint64_t v1;

  objc_msgSend(*(id *)(v1 + 16), sel_reloadWithChanges_, *(_QWORD *)changes.value.internalChanges.super.isa);
}

Cinematic::CNScript::Changes __swiftcall CNScript.changes()()
{
  objc_class **v0;
  uint64_t v1;
  objc_class **v2;
  objc_class *v3;
  NSDictionary *v4;
  Cinematic::CNScript::Changes result;

  v2 = v0;
  v3 = (objc_class *)objc_msgSend(*(id *)(v1 + 16), sel_changes);
  *v2 = v3;
  result.internalChanges._internalChanges = v4;
  result.internalChanges.super.isa = v3;
  return result;
}

Cinematic::CNScript::Changes __swiftcall CNScript.changes(trimmedBy:)(CMTimeRange *trimmedBy)
{
  objc_class **v1;
  uint64_t v2;
  objc_class **v3;
  CMTimeEpoch epoch;
  void *v5;
  objc_class *v6;
  NSDictionary *v7;
  Cinematic::CNScript::Changes result;
  _QWORD v9[2];
  __int128 v10;
  uint64_t v11;
  CMTimeEpoch v12;

  v3 = v1;
  epoch = trimmedBy->duration.epoch;
  v5 = *(void **)(v2 + 16);
  v9[0] = trimmedBy->start.value;
  v9[1] = *(_QWORD *)&trimmedBy->start.timescale;
  v10 = *(_OWORD *)&trimmedBy->start.epoch;
  v11 = *(_QWORD *)&trimmedBy->duration.timescale;
  v12 = epoch;
  v6 = (objc_class *)objc_msgSend(v5, sel_changesTrimmedByTimeRange_, v9);
  *v3 = v6;
  result.internalChanges._internalChanges = v7;
  result.internalChanges.super.isa = v6;
  return result;
}

double CNScript.timeRange.getter@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  double result;
  uint64_t v4;
  double v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(*(id *)(v1 + 16), sel_timeRange);
  result = v5;
  *(_QWORD *)a1 = v4;
  *(double *)(a1 + 8) = v5;
  *(_OWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  return result;
}

Cinematic::CNScript::Frame_optional __swiftcall CNScript.frame(at:tolerance:)(CMTime at, CMTime tolerance)
{
  _QWORD *v2;
  objc_class *v3;
  PTCinematographyFrame *v4;
  Swift::Bool v5;
  Cinematic::CNScript::Frame_optional result;

  v3 = (objc_class *)sub_23308D4BC(at.value, *(uint64_t *)&at.timescale, at.epoch, tolerance.value, *(uint64_t *)&tolerance.timescale, tolerance.epoch, (const char **)&selRef_frameAtTime_tolerance_, v2);
  result.value.internalFrame._internalFrame = v4;
  result.value.internalFrame.super.isa = v3;
  result.is_nil = v5;
  return result;
}

uint64_t CNScript.frames(in:)(uint64_t a1)
{
  return sub_23308D544(a1, (const char **)&selRef_framesInTimeRange_, &qword_256034420, (uint64_t)&off_25044F198, (uint64_t (*)(BOOL, uint64_t, uint64_t))sub_23308A654);
}

Cinematic::CNDecision_optional __swiftcall CNScript.decision(at:tolerance:)(CMTime at, CMTime tolerance)
{
  _QWORD *v2;
  objc_class *v3;
  PTCinematographyDecision *v4;
  Swift::Bool v5;
  Cinematic::CNDecision_optional result;

  v3 = (objc_class *)sub_23308D4BC(at.value, *(uint64_t *)&at.timescale, at.epoch, tolerance.value, *(uint64_t *)&tolerance.timescale, tolerance.epoch, (const char **)&selRef_decisionAtTime_tolerance_, v2);
  result.value.internalDecision._internalDecision = v4;
  result.value.internalDecision.super.isa = v3;
  result.is_nil = v5;
  return result;
}

id sub_23308D4BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, const char **a7@<X6>, _QWORD *a8@<X8>)
{
  uint64_t v8;
  void *v10;
  const char *v11;
  id result;
  _QWORD v13[3];
  _QWORD v14[3];

  v10 = *(void **)(v8 + 16);
  v11 = *a7;
  v13[2] = a6;
  v14[0] = a1;
  v14[1] = a2;
  v14[2] = a3;
  v13[0] = a4;
  v13[1] = a5;
  result = objc_msgSend(v10, v11, v14, v13);
  *a8 = result;
  return result;
}

uint64_t CNScript.decisions(in:)(uint64_t a1)
{
  return sub_23308D544(a1, (const char **)&selRef_decisionsInTimeRange_, &qword_256034428, (uint64_t)off_25044F148, (uint64_t (*)(BOOL, uint64_t, uint64_t))sub_23308A680);
}

uint64_t sub_23308D544(uint64_t a1, const char **a2, unint64_t *a3, uint64_t a4, uint64_t (*a5)(BOOL, uint64_t, uint64_t))
{
  uint64_t v5;
  uint64_t v8;
  void *v9;
  const char *v10;
  id v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  unint64_t v19;
  unint64_t v20;
  _QWORD v21[2];
  __int128 v22;
  uint64_t v23;
  uint64_t v24;

  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(v5 + 16);
  v10 = *a2;
  v21[0] = *(_QWORD *)a1;
  v21[1] = *(_QWORD *)(a1 + 8);
  v22 = *(_OWORD *)(a1 + 16);
  v23 = *(_QWORD *)(a1 + 32);
  v24 = v8;
  v11 = objc_msgSend(v9, v10, v21);
  sub_23308B174(0, a3);
  v12 = sub_23308EBF0();

  if (!(v12 >> 62))
  {
    v13 = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v13)
      goto LABEL_3;
LABEL_13:
    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRetain();
  v13 = sub_23308EC5C();
  swift_bridgeObjectRelease();
  if (!v13)
    goto LABEL_13;
LABEL_3:
  v21[0] = MEMORY[0x24BEE4AF8];
  result = a5(0, v13 & ~(v13 >> 63), 0);
  if ((v13 & 0x8000000000000000) == 0)
  {
    v15 = 0;
    v16 = v21[0];
    do
    {
      if ((v12 & 0xC000000000000001) != 0)
        v17 = (id)MEMORY[0x23492E2D0](v15, v12);
      else
        v17 = *(id *)(v12 + 8 * v15 + 32);
      v18 = v17;
      v21[0] = v16;
      v20 = *(_QWORD *)(v16 + 16);
      v19 = *(_QWORD *)(v16 + 24);
      if (v20 >= v19 >> 1)
      {
        a5(v19 > 1, v20 + 1, 1);
        v16 = v21[0];
      }
      ++v15;
      *(_QWORD *)(v16 + 16) = v20 + 1;
      *(_QWORD *)(v16 + 8 * v20 + 32) = v18;
    }
    while (v13 != v15);
    swift_bridgeObjectRelease();
    return v16;
  }
  __break(1u);
  return result;
}

Cinematic::CNDecision_optional __swiftcall CNScript.decision(after:)(CMTime after)
{
  _QWORD *v1;
  objc_class *v2;
  PTCinematographyDecision *v3;
  Swift::Bool v4;
  Cinematic::CNDecision_optional result;

  v2 = (objc_class *)sub_2330897A8(after.value, *(uint64_t *)&after.timescale, after.epoch, (const char **)&selRef_decisionAfterTime_, v1);
  result.value.internalDecision._internalDecision = v3;
  result.value.internalDecision.super.isa = v2;
  result.is_nil = v4;
  return result;
}

Cinematic::CNDecision_optional __swiftcall CNScript.decision(before:)(CMTime before)
{
  _QWORD *v1;
  objc_class *v2;
  PTCinematographyDecision *v3;
  Swift::Bool v4;
  Cinematic::CNDecision_optional result;

  v2 = (objc_class *)sub_2330897A8(before.value, *(uint64_t *)&before.timescale, before.epoch, (const char **)&selRef_decisionBeforeTime_, v1);
  result.value.internalDecision._internalDecision = v3;
  result.value.internalDecision.super.isa = v2;
  result.is_nil = v4;
  return result;
}

Cinematic::CNDecision_optional __swiftcall CNScript.primaryDecision(at:)(CMTime at)
{
  _QWORD *v1;
  objc_class *v2;
  PTCinematographyDecision *v3;
  Swift::Bool v4;
  Cinematic::CNDecision_optional result;

  v2 = (objc_class *)sub_2330897A8(at.value, *(uint64_t *)&at.timescale, at.epoch, (const char **)&selRef_primaryDecisionAtTime_, v1);
  result.value.internalDecision._internalDecision = v3;
  result.value.internalDecision.super.isa = v2;
  result.is_nil = v4;
  return result;
}

Cinematic::CNDecision_optional __swiftcall CNScript.secondaryDecision(at:)(CMTime at)
{
  _QWORD *v1;
  objc_class *v2;
  PTCinematographyDecision *v3;
  Swift::Bool v4;
  Cinematic::CNDecision_optional result;

  v2 = (objc_class *)sub_2330897A8(at.value, *(uint64_t *)&at.timescale, at.epoch, (const char **)&selRef_secondaryDecisionAtTime_, v1);
  result.value.internalDecision._internalDecision = v3;
  result.value.internalDecision.super.isa = v2;
  result.is_nil = v4;
  return result;
}

void __swiftcall CNScript.timeRangeOfTransition(after:)(CMTimeRange *__return_ptr retstr, Cinematic::CNDecision after)
{
  sub_23308D748(after.internalDecision.super.isa, (SEL *)&selRef_timeRangeOfTransitionAfterDecision_, (uint64_t)retstr);
}

void __swiftcall CNScript.timeRangeOfTransition(before:)(CMTimeRange *__return_ptr retstr, Cinematic::CNDecision before)
{
  sub_23308D748(before.internalDecision.super.isa, (SEL *)&selRef_timeRangeOfTransitionBeforeDecision_, (uint64_t)retstr);
}

double sub_23308D748@<D0>(_QWORD *a1@<X0>, SEL *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  double result;
  uint64_t v6;
  double v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend(*(id *)(v3 + 16), *a2, *a1);
  result = v7;
  *(_QWORD *)a3 = v6;
  *(double *)(a3 + 8) = v7;
  *(_OWORD *)(a3 + 16) = v8;
  *(_QWORD *)(a3 + 32) = v9;
  *(_QWORD *)(a3 + 40) = v10;
  return result;
}

uint64_t CNScript.userDecisions(in:)(uint64_t a1)
{
  return sub_23308D544(a1, (const char **)&selRef_userDecisionsInTimeRange_, &qword_256034428, (uint64_t)off_25044F148, (uint64_t (*)(BOOL, uint64_t, uint64_t))sub_23308A680);
}

uint64_t CNScript.baseDecisions(in:)(uint64_t a1)
{
  return sub_23308D544(a1, (const char **)&selRef_baseDecisionsInTimeRange_, &qword_256034428, (uint64_t)off_25044F148, (uint64_t (*)(BOOL, uint64_t, uint64_t))sub_23308A680);
}

_QWORD *CNScript.detectionTrack(for:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *result;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  result = objc_msgSend(*(id *)(v1 + 16), sel_detectionTrackForID_, a1);
  if (result)
  {
    v3 = result;
    objc_opt_self();
    v4 = swift_dynamicCastObjCClass();
    if (v4)
    {
      v5 = v4;
      type metadata accessor for CNFixedDetectionTrack();
    }
    else
    {
      objc_opt_self();
      v6 = swift_dynamicCastObjCClass();
      if (!v6)
      {
        type metadata accessor for CNDetectionTrack();
        goto LABEL_7;
      }
      v5 = v6;
      type metadata accessor for CNCustomDetectionTrack();
    }
    v3 = (_QWORD *)v5;
LABEL_7:
    result = (_QWORD *)swift_allocObject();
    result[2] = v3;
  }
  return result;
}

_QWORD *CNScript.detectionTrack(for:)(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *result;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  result = objc_msgSend(*(id *)(v1 + 16), sel_detectionTrackForDecision_, *a1);
  if (result)
  {
    v3 = result;
    objc_opt_self();
    v4 = swift_dynamicCastObjCClass();
    if (v4)
    {
      v5 = v4;
      type metadata accessor for CNFixedDetectionTrack();
    }
    else
    {
      objc_opt_self();
      v6 = swift_dynamicCastObjCClass();
      if (!v6)
      {
        type metadata accessor for CNDetectionTrack();
        goto LABEL_7;
      }
      v5 = v6;
      type metadata accessor for CNCustomDetectionTrack();
    }
    v3 = (_QWORD *)v5;
LABEL_7:
    result = (_QWORD *)swift_allocObject();
    result[2] = v3;
  }
  return result;
}

id CNScript.fNumber.getter()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_fNumber);
}

id CNScript.fNumber.setter()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_setFNumber_);
}

id (*CNScript.fNumber.modify(uint64_t a1))(uint64_t a1, double a2)
{
  uint64_t v1;
  void *v3;
  int v4;

  v3 = *(void **)(v1 + 16);
  *(_QWORD *)a1 = v3;
  objc_msgSend(v3, sel_fNumber);
  *(_DWORD *)(a1 + 8) = v4;
  return sub_23308D9A8;
}

id sub_23308D9A8(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 8);
  return objc_msgSend(*(id *)a1, sel_setFNumber_, a2);
}

Swift::Bool __swiftcall CNScript.addUserDecision(_:)(Cinematic::CNDecision a1)
{
  uint64_t v1;

  return objc_msgSend(*(id *)(v1 + 16), sel_addUserDecision_, *(_QWORD *)a1.internalDecision.super.isa);
}

Swift::Bool __swiftcall CNScript.removeUserDecision(_:)(Cinematic::CNDecision a1)
{
  uint64_t v1;

  return objc_msgSend(*(id *)(v1 + 16), sel_removeUserDecision_, *(_QWORD *)a1.internalDecision.super.isa);
}

Swift::Void __swiftcall CNScript.removeAllUserDecisions()()
{
  uint64_t v0;

  objc_msgSend(*(id *)(v0 + 16), sel_removeAllUserDecisions);
}

id CNScript.addDetectionTrack(_:)(uint64_t a1)
{
  uint64_t v1;

  return objc_msgSend(*(id *)(v1 + 16), sel_addDetectionTrack_, *(_QWORD *)(a1 + 16));
}

id CNScript.removeDetectionTrack(_:)(uint64_t a1)
{
  uint64_t v1;

  return objc_msgSend(*(id *)(v1 + 16), sel_removeDetectionTrack_, *(_QWORD *)(a1 + 16));
}

uint64_t CNScript.addedDetectionTracks.getter()
{
  uint64_t v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v1 = objc_msgSend(*(id *)(v0 + 16), sel_addedDetectionTracks);
  sub_23308B174(0, &qword_256034430);
  v2 = sub_23308EBF0();

  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_23308EC5C();
    swift_bridgeObjectRelease();
    if (v3)
      goto LABEL_3;
LABEL_17:
    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
  v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v3)
    goto LABEL_17;
LABEL_3:
  v12 = MEMORY[0x24BEE4AF8];
  result = sub_23308EC38();
  if ((v3 & 0x8000000000000000) == 0)
  {
    v5 = 0;
    while (1)
    {
      if ((v2 & 0xC000000000000001) != 0)
        v8 = (id)MEMORY[0x23492E2D0](v5, v2);
      else
        v8 = *(id *)(v2 + 8 * v5 + 32);
      v7 = (uint64_t)v8;
      objc_opt_self();
      v9 = swift_dynamicCastObjCClass();
      if (v9)
      {
        v6 = v9;
        type metadata accessor for CNFixedDetectionTrack();
      }
      else
      {
        objc_opt_self();
        v10 = swift_dynamicCastObjCClass();
        if (!v10)
        {
          type metadata accessor for CNDetectionTrack();
          goto LABEL_7;
        }
        v6 = v10;
        type metadata accessor for CNCustomDetectionTrack();
      }
      v7 = v6;
LABEL_7:
      *(_QWORD *)(swift_allocObject() + 16) = v7;
      ++v5;
      sub_23308EC20();
      sub_23308EC44();
      sub_23308EC50();
      sub_23308EC2C();
      if (v3 == v5)
      {
        v11 = v12;
        swift_bridgeObjectRelease();
        return v11;
      }
    }
  }
  __break(1u);
  return result;
}

void CNScript.Changes.init(dataRepresentation:)(uint64_t a1@<X0>, unint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  id v6;
  void *v7;
  id v8;

  v6 = objc_allocWithZone((Class)CNScriptChanges);
  v7 = (void *)sub_23308EBC0();
  v8 = objc_msgSend(v6, sel_initWithDataRepresentation_, v7);
  sub_23308E0E4(a1, a2);

  *a3 = v8;
}

uint64_t CNScript.Changes.dataRepresentation.getter()
{
  id *v0;
  id v1;
  uint64_t v2;

  v1 = objc_msgSend(*v0, sel_dataRepresentation);
  v2 = sub_23308EBCC();

  return v2;
}

id CNScript.Changes.fNumber.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_fNumber);
}

char *CNScript.Changes.userDecisions.getter()
{
  id *v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  char *result;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;

  v1 = objc_msgSend(*v0, sel_userDecisions);
  sub_23308B174(0, &qword_256034428);
  v2 = sub_23308EBF0();

  if (!(v2 >> 62))
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v3)
      goto LABEL_3;
LABEL_13:
    swift_bridgeObjectRelease();
    return (char *)MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRetain();
  v3 = sub_23308EC5C();
  swift_bridgeObjectRelease();
  if (!v3)
    goto LABEL_13;
LABEL_3:
  v11 = MEMORY[0x24BEE4AF8];
  result = sub_23308A680(0, v3 & ~(v3 >> 63), 0);
  if ((v3 & 0x8000000000000000) == 0)
  {
    v5 = 0;
    v6 = v11;
    do
    {
      if ((v2 & 0xC000000000000001) != 0)
        v7 = (id)MEMORY[0x23492E2D0](v5, v2);
      else
        v7 = *(id *)(v2 + 8 * v5 + 32);
      v8 = v7;
      v10 = *(_QWORD *)(v11 + 16);
      v9 = *(_QWORD *)(v11 + 24);
      if (v10 >= v9 >> 1)
        sub_23308A680((char *)(v9 > 1), v10 + 1, 1);
      ++v5;
      *(_QWORD *)(v11 + 16) = v10 + 1;
      *(_QWORD *)(v11 + 8 * v10 + 32) = v8;
    }
    while (v3 != v5);
    swift_bridgeObjectRelease();
    return (char *)v6;
  }
  __break(1u);
  return result;
}

uint64_t CNScript.Changes.addedDetectionTracks.getter()
{
  id *v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v1 = objc_msgSend(*v0, sel_addedDetectionTracks);
  sub_23308B174(0, &qword_256034430);
  v2 = sub_23308EBF0();

  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_23308EC5C();
    swift_bridgeObjectRelease();
    if (v3)
      goto LABEL_3;
LABEL_17:
    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
  v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v3)
    goto LABEL_17;
LABEL_3:
  v12 = MEMORY[0x24BEE4AF8];
  result = sub_23308EC38();
  if ((v3 & 0x8000000000000000) == 0)
  {
    v5 = 0;
    while (1)
    {
      if ((v2 & 0xC000000000000001) != 0)
        v8 = (id)MEMORY[0x23492E2D0](v5, v2);
      else
        v8 = *(id *)(v2 + 8 * v5 + 32);
      v7 = (uint64_t)v8;
      objc_opt_self();
      v9 = swift_dynamicCastObjCClass();
      if (v9)
      {
        v6 = v9;
        type metadata accessor for CNFixedDetectionTrack();
      }
      else
      {
        objc_opt_self();
        v10 = swift_dynamicCastObjCClass();
        if (!v10)
        {
          type metadata accessor for CNDetectionTrack();
          goto LABEL_7;
        }
        v6 = v10;
        type metadata accessor for CNCustomDetectionTrack();
      }
      v7 = v6;
LABEL_7:
      *(_QWORD *)(swift_allocObject() + 16) = v7;
      ++v5;
      sub_23308EC20();
      sub_23308EC44();
      sub_23308EC50();
      sub_23308EC2C();
      if (v3 == v5)
      {
        v11 = v12;
        swift_bridgeObjectRelease();
        return v11;
      }
    }
  }
  __break(1u);
  return result;
}

uint64_t CNScript.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t CNScript.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t sub_23308E0E4(uint64_t a1, unint64_t a2)
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

id sub_23308E128@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  id result;
  int v4;

  result = objc_msgSend(*(id *)(*(_QWORD *)a1 + 16), sel_fNumber);
  *a2 = v4;
  return result;
}

id sub_23308E15C(_DWORD *a1, uint64_t a2, double a3)
{
  LODWORD(a3) = *a1;
  return objc_msgSend(*(id *)(*(_QWORD *)a2 + 16), sel_setFNumber_, a3);
}

uint64_t type metadata accessor for CNScript()
{
  return objc_opt_self();
}

uint64_t method lookup function for CNScript()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CNScript.__allocating_init(asset:changes:progress:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t);

  v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(v3 + 96) + *(_QWORD *)(v3 + 96));
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v8;
  *v8 = v4;
  v8[1] = sub_23308C4D8;
  return v10(a1, a2, a3);
}

ValueMetadata *type metadata accessor for CNScript.Frame()
{
  return &type metadata for CNScript.Frame;
}

ValueMetadata *type metadata accessor for CNScript.Changes()
{
  return &type metadata for CNScript.Changes;
}

uint64_t sub_23308EBB4()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_23308EBC0()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_23308EBCC()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_23308EBD8()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23308EBE4()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_23308EBF0()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_23308EBFC()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_23308EC08()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_23308EC14()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_23308EC20()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_23308EC2C()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_23308EC38()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_23308EC44()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_23308EC50()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_23308EC5C()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_23308EC68()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_23308EC74()
{
  return MEMORY[0x24BDD0758]();
}

uint64_t sub_23308EC80()
{
  return MEMORY[0x24BDD0760]();
}

uint64_t sub_23308EC8C()
{
  return MEMORY[0x24BDD0768]();
}

uint64_t sub_23308EC98()
{
  return MEMORY[0x24BDD0770]();
}

uint64_t sub_23308ECA4()
{
  return MEMORY[0x24BEE3FF8]();
}

uint64_t sub_23308ECB0()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_23308ECBC()
{
  return MEMORY[0x24BEE4318]();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBEFB8](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
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

CFArrayRef CMMetadataFormatDescriptionGetIdentifiers(CMMetadataFormatDescriptionRef desc)
{
  return (CFArrayRef)MEMORY[0x24BDC0218](desc);
}

CMTime *__cdecl CMTimeAbsoluteValue(CMTime *__return_ptr retstr, CMTime *time)
{
  return (CMTime *)MEMORY[0x24BDC0418](retstr, time);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x24BDC0450](time1, time2);
}

CMTimeRange *__cdecl CMTimeRangeGetIntersection(CMTimeRange *__return_ptr retstr, CMTimeRange *range, CMTimeRange *otherRange)
{
  return (CMTimeRange *)MEMORY[0x24BDC0568](retstr, range, otherRange);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x24BDC05A0](retstr, lhs, rhs);
}

CVReturn CVMetalTextureCacheCreate(CFAllocatorRef allocator, CFDictionaryRef cacheAttributes, id metalDevice, CFDictionaryRef textureAttributes, CVMetalTextureCacheRef *cacheOut)
{
  return MEMORY[0x24BDC51F8](allocator, cacheAttributes, metalDevice, textureAttributes, cacheOut);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52B0](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52E8](pixelBuffer);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

uint64_t PTDisparityInNormalizedRectFromPixelBufferWithPrior()
{
  return MEMORY[0x24BE74BC8]();
}

uint64_t PTGroupIDIsValid()
{
  return MEMORY[0x24BE74BD0]();
}

uint64_t PTTrackIDIsValid()
{
  return MEMORY[0x24BE74BD8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
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

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x24BEDD020](dest, src, size, atomic, hasStrong);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x24BEE71B8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x24BEE71C0]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x24BEE71C8]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x24BEE71D0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x24BEE71D8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x24BEE4C68]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

