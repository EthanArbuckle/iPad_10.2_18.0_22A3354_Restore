uint64_t RecapLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = RecapLibraryCore_frameworkLibrary_1;
  v6 = RecapLibraryCore_frameworkLibrary_1;
  if (!RecapLibraryCore_frameworkLibrary_1)
  {
    v7 = xmmword_24F13BA50;
    v8 = *(_OWORD *)&off_24F13BA60;
    v1 = _sl_dlopen();
    v4[3] = v1;
    RecapLibraryCore_frameworkLibrary_1 = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_2287DF264(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_2287DF6BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getRCPSyntheticEventStreamClass()
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
  v0 = (void *)getRCPSyntheticEventStreamClass_softClass;
  v7 = getRCPSyntheticEventStreamClass_softClass;
  if (!getRCPSyntheticEventStreamClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getRCPSyntheticEventStreamClass_block_invoke;
    v3[3] = &unk_24F13B9F0;
    v3[4] = &v4;
    __getRCPSyntheticEventStreamClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2287DF87C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getRCPPlayerPlaybackOptionsClass_block_invoke(uint64_t a1)
{
  Class result;

  RecapLibrary();
  result = objc_getClass("RCPPlayerPlaybackOptions");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getRCPPlayerPlaybackOptionsClass_block_invoke_cold_1();
  getRCPPlayerPlaybackOptionsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void RecapLibrary()
{
  void *v0;

  if (!RecapLibraryCore_frameworkLibrary)
    RecapLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!RecapLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getRCPInlinePlayerClass_block_invoke(uint64_t a1)
{
  Class result;

  RecapLibrary();
  result = objc_getClass("RCPInlinePlayer");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getRCPInlinePlayerClass_block_invoke_cold_1();
  getRCPInlinePlayerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getRCPSyntheticEventStreamClass_block_invoke(uint64_t a1)
{
  Class result;

  RecapLibrary();
  result = objc_getClass("RCPSyntheticEventStream");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getRCPSyntheticEventStreamClass_block_invoke_cold_1();
  getRCPSyntheticEventStreamClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_2287DFEB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

Class __getRCPSyntheticEventStreamClass_block_invoke_0(uint64_t a1)
{
  Class result;

  if (!RecapLibraryCore_frameworkLibrary_0)
  {
    RecapLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!RecapLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
LABEL_6:
      __getRCPSyntheticEventStreamClass_block_invoke_cold_1();
    }
  }
  result = objc_getClass("RCPSyntheticEventStream");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_6;
  getRCPSyntheticEventStreamClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

double CRNViewFrameInWindow(void *a1)
{
  id v1;
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;

  v1 = a1;
  objc_msgSend(v1, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(v1, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    objc_msgSend(v1, "window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "screen");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fixedCoordinateSpace");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "convertRect:toCoordinateSpace:", v13, v4, v6, v8, v10);
    v15 = v14;

  }
  else
  {
    objc_msgSend(v1, "frame");
    v15 = v16;
  }

  return v15;
}

double CRNContentSizeAlongAxis(void *a1, uint64_t a2)
{
  double result;
  double v4;

  objc_msgSend(a1, "contentSize");
  if (a2 != 1)
    return v4;
  return result;
}

double CRNSizeAlongAxis(uint64_t a1, double a2, double a3)
{
  double result;

  if (a1 != 1)
    return a3;
  return result;
}

double CRNContentSizeInDirection(void *a1, uint64_t a2)
{
  uint64_t v2;
  double result;
  double v4;

  v2 = a2 - 1;
  objc_msgSend(a1, "contentSize");
  if ((v2 & 0xFFFFFFFFFFFFFFFALL) != 0)
    return v4;
  return result;
}

uint64_t CRNAxisFromScrollDirection(uint64_t a1)
{
  if (((a1 - 1) & 0xFFFFFFFFFFFFFFFALL) != 0)
    return 2;
  else
    return 1;
}

uint64_t CRNPredominantAxisOfContentOf(void *a1)
{
  double v1;
  double v2;

  objc_msgSend(a1, "contentSize");
  if (v1 > v2)
    return 1;
  else
    return 2 * (v1 < v2);
}

uint64_t CRNQuadrantOfContentOffsetFor(void *a1)
{
  id v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;

  v1 = a1;
  objc_msgSend(v1, "contentSize");
  if (v2 <= v3)
  {
    v9 = v2;
    v10 = v3;
    objc_msgSend(v1, "contentOffset");
    v12 = v11;
    v5 = v13;
    objc_msgSend(v1, "contentSize");
    if (v9 >= v10)
    {
      v7 = 4;
      v8 = 3;
      v5 = v12;
    }
    else
    {
      v6 = v14;
      v7 = 4;
      v8 = 3;
    }
  }
  else
  {
    objc_msgSend(v1, "contentOffset");
    v5 = v4;
    objc_msgSend(v1, "contentSize");
    v7 = 1;
    v8 = 2;
  }
  if (v5 >= v6 * 0.5)
    v15 = v8;
  else
    v15 = v7;

  return v15;
}

uint64_t CRNOppositeDirectionFrom(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 5)
    return 4;
  else
    return qword_2287E3270[a1 - 1];
}

double CRNCGRectGetMidpoint(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  double MidX;
  CGRect v10;

  MidX = CGRectGetMidX(*(CGRect *)&a1);
  v10.origin.x = a1;
  v10.origin.y = a2;
  v10.size.width = a3;
  v10.size.height = a4;
  CGRectGetMidY(v10);
  return MidX;
}

double CRNCGRectGetMidpointAlongSide(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  double MidX;
  double MinX;
  CGRect v12;
  CGRect v13;
  CGRect v14;

  switch(a1)
  {
    case 0:
      MinX = CGRectGetMinX(*(CGRect *)&a2);
      goto LABEL_6;
    case 1:
      MidX = CGRectGetMidX(*(CGRect *)&a2);
      v12.origin.x = a2;
      v12.origin.y = a3;
      v12.size.width = a4;
      v12.size.height = a5;
      CGRectGetMinY(v12);
      return MidX;
    case 2:
      MinX = CGRectGetMaxX(*(CGRect *)&a2);
      goto LABEL_6;
    case 3:
      MidX = CGRectGetMidX(*(CGRect *)&a2);
      v14.origin.x = a2;
      v14.origin.y = a3;
      v14.size.width = a4;
      v14.size.height = a5;
      CGRectGetMaxY(v14);
      return MidX;
    case 4:
    case 5:
      MinX = CGRectGetMidX(*(CGRect *)&a2);
LABEL_6:
      MidX = MinX;
      v13.origin.x = a2;
      v13.origin.y = a3;
      v13.size.width = a4;
      v13.size.height = a5;
      CGRectGetMidY(v13);
      break;
    default:
      return MidX;
  }
  return MidX;
}

double CRNCGPointAdvanceInDirectionByAmount(uint64_t a1, double result, double a3, double a4)
{
  switch(a1)
  {
    case 1:
      result = result + a4;
      break;
    case 2:
      result = result - a4;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t RecapLibrary_0()
{
  uint64_t v0;
  void *v2;

  v0 = RecapLibraryCore();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id getRCPInlinePlayerClass()
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
  v0 = (void *)getRCPInlinePlayerClass_softClass_0;
  v7 = getRCPInlinePlayerClass_softClass_0;
  if (!getRCPInlinePlayerClass_softClass_0)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getRCPInlinePlayerClass_block_invoke_0;
    v3[3] = &unk_24F13B9F0;
    v3[4] = &v4;
    __getRCPInlinePlayerClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2287E1158(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getRCPInlinePlayerClass_block_invoke_0(uint64_t a1)
{
  Class result;

  RecapLibrary_0();
  result = objc_getClass("RCPInlinePlayer");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getRCPInlinePlayerClass_block_invoke_cold_1();
  getRCPInlinePlayerClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getRCPEventStreamClass()
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
  v0 = (void *)getRCPEventStreamClass_softClass;
  v7 = getRCPEventStreamClass_softClass;
  if (!getRCPEventStreamClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getRCPEventStreamClass_block_invoke;
    v3[3] = &unk_24F13B9F0;
    v3[4] = &v4;
    __getRCPEventStreamClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2287E1264(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getRCPEventStreamClass_block_invoke(uint64_t a1)
{
  Class result;

  RecapLibrary_0();
  result = objc_getClass("RCPEventStream");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getRCPEventStreamClass_block_invoke_cold_1();
  getRCPEventStreamClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getRCPSyntheticEventStreamClass_0()
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
  v0 = (void *)getRCPSyntheticEventStreamClass_softClass_1;
  v7 = getRCPSyntheticEventStreamClass_softClass_1;
  if (!getRCPSyntheticEventStreamClass_softClass_1)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getRCPSyntheticEventStreamClass_block_invoke_1;
    v3[3] = &unk_24F13B9F0;
    v3[4] = &v4;
    __getRCPSyntheticEventStreamClass_block_invoke_1((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2287E1370(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getRCPSyntheticEventStreamClass_block_invoke_1(uint64_t a1)
{
  Class result;

  RecapLibrary_0();
  result = objc_getClass("RCPSyntheticEventStream");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getRCPSyntheticEventStreamClass_block_invoke_cold_1();
  getRCPSyntheticEventStreamClass_softClass_1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getRCPPlayerPlaybackOptionsClass()
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
  v0 = (void *)getRCPPlayerPlaybackOptionsClass_softClass_0;
  v7 = getRCPPlayerPlaybackOptionsClass_softClass_0;
  if (!getRCPPlayerPlaybackOptionsClass_softClass_0)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getRCPPlayerPlaybackOptionsClass_block_invoke_0;
    v3[3] = &unk_24F13B9F0;
    v3[4] = &v4;
    __getRCPPlayerPlaybackOptionsClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2287E147C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getRCPPlayerPlaybackOptionsClass_block_invoke_0(uint64_t a1)
{
  Class result;

  RecapLibrary_0();
  result = objc_getClass("RCPPlayerPlaybackOptions");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getRCPPlayerPlaybackOptionsClass_block_invoke_cold_1();
  getRCPPlayerPlaybackOptionsClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getRCPEventSenderPropertiesClass()
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
  v0 = (void *)getRCPEventSenderPropertiesClass_softClass;
  v7 = getRCPEventSenderPropertiesClass_softClass;
  if (!getRCPEventSenderPropertiesClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getRCPEventSenderPropertiesClass_block_invoke;
    v3[3] = &unk_24F13B9F0;
    v3[4] = &v4;
    __getRCPEventSenderPropertiesClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2287E1588(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getRCPEventSenderPropertiesClass_block_invoke(uint64_t a1)
{
  Class result;

  RecapLibrary_0();
  result = objc_getClass("RCPEventSenderProperties");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getRCPEventSenderPropertiesClass_block_invoke_cold_1();
  getRCPEventSenderPropertiesClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_2287E1AE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

Class __getRCPSyntheticEventStreamClass_block_invoke_2(uint64_t a1)
{
  Class result;

  if (!RecapLibraryCore_frameworkLibrary_2)
  {
    RecapLibraryCore_frameworkLibrary_2 = _sl_dlopen();
    if (!RecapLibraryCore_frameworkLibrary_2)
    {
      abort_report_np();
LABEL_6:
      __getRCPSyntheticEventStreamClass_block_invoke_cold_1();
    }
  }
  result = objc_getClass("RCPSyntheticEventStream");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_6;
  getRCPSyntheticEventStreamClass_softClass_2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_2287E1EC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

Class __getRCPSyntheticEventStreamClass_block_invoke_3(uint64_t a1)
{
  Class result;

  if (!RecapLibraryCore_frameworkLibrary_3)
  {
    RecapLibraryCore_frameworkLibrary_3 = _sl_dlopen();
    if (!RecapLibraryCore_frameworkLibrary_3)
    {
      abort_report_np();
LABEL_6:
      __getRCPSyntheticEventStreamClass_block_invoke_cold_1();
    }
  }
  result = objc_getClass("RCPSyntheticEventStream");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_6;
  getRCPSyntheticEventStreamClass_softClass_3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_2287E23A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

Class __getRCPSyntheticEventStreamClass_block_invoke_4(uint64_t a1)
{
  Class result;

  if (!RecapLibraryCore_frameworkLibrary_4)
  {
    RecapLibraryCore_frameworkLibrary_4 = _sl_dlopen();
    if (!RecapLibraryCore_frameworkLibrary_4)
    {
      abort_report_np();
LABEL_6:
      __getRCPSyntheticEventStreamClass_block_invoke_cold_1();
    }
  }
  result = objc_getClass("RCPSyntheticEventStream");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_6;
  getRCPSyntheticEventStreamClass_softClass_4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __getRCPPlayerPlaybackOptionsClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getRCPInlinePlayerClass_block_invoke_cold_1(v0);
}

void __getRCPInlinePlayerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getRCPSyntheticEventStreamClass_block_invoke_cold_1(v0);
}

void __getRCPSyntheticEventStreamClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getRCPEventStreamClass_block_invoke_cold_1(v0);
}

void __getRCPEventStreamClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getRCPEventSenderPropertiesClass_block_invoke_cold_1(v0);
}

void __getRCPEventSenderPropertiesClass_block_invoke_cold_1()
{
  CGRect v0;

  abort_report_np();
  CGRectGetMaxX(v0);
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

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
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

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
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

