void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1DD143F8C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

CGContextRef CNUIBitmapContextCreate(int a1, int a2, CGColorSpaceRef space)
{
  CGContextRef v5;
  NSObject *v6;
  _DWORD v8[2];
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = CGBitmapContextCreate(0, a1, a2, 8uLL, 4 * a1, space, 1u);
  if (!v5)
  {
    if (CNUIPRLikenessRenderingUtilitiesLog_cn_once_token_1 != -1)
      dispatch_once(&CNUIPRLikenessRenderingUtilitiesLog_cn_once_token_1, &__block_literal_global_7);
    v6 = CNUIPRLikenessRenderingUtilitiesLog_cn_once_object_1;
    if (os_log_type_enabled((os_log_t)CNUIPRLikenessRenderingUtilitiesLog_cn_once_object_1, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 67109376;
      v8[1] = a1;
      v9 = 1024;
      v10 = a2;
      _os_log_impl(&dword_1DD140000, v6, OS_LOG_TYPE_DEFAULT, "Error creating context of size {%d, %d}", (uint8_t *)v8, 0xEu);
    }
  }
  return v5;
}

void CNUIDrawImagesInRects(CGContextRef c, CGColor *a2, uint64_t a3, CGImageRef *a4, CGRect *a5, void (*a6)(CGContext *, double, double, double, double), CGFloat a7, CGFloat a8)
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGAffineTransform v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  if (a3)
  {
    if (a3 != 1)
    {
      CGContextSaveGState(c);
      x = a5[1].origin.x;
      y = a5[1].origin.y;
      width = a5[1].size.width;
      height = a5[1].size.height;
      CGAffineTransformMakeScale(&v39, a7, a7);
      v40.origin.x = x;
      v40.origin.y = y;
      v40.size.width = width;
      v40.size.height = height;
      v41 = CGRectApplyAffineTransform(v40, &v39);
      v19 = v41.origin.x;
      v20 = v41.origin.y;
      v21 = v41.size.width;
      v22 = v41.size.height;
      ((void (*)(CGContextRef))a6)(c);
      CGContextClip(c);
      v42.origin.x = v19;
      v42.origin.y = v20;
      v42.size.width = v21;
      v42.size.height = v22;
      CGContextDrawImage(c, v42, a4[1]);
      CNUIApplyOutlineToContext(c, a2, a6, v19, v20, v21, v22, a8);
      CGContextRestoreGState(c);
      CGContextSaveGState(c);
      v43 = CGRectInset(*a5, -2.0, -2.0);
      v23 = v43.origin.x;
      v24 = v43.origin.y;
      v25 = v43.size.width;
      v26 = v43.size.height;
      CGAffineTransformMakeScale(&v39, a7, a7);
      v44.origin.x = v23;
      v44.origin.y = v24;
      v44.size.width = v25;
      v44.size.height = v26;
      v45 = CGRectApplyAffineTransform(v44, &v39);
      v27 = v45.origin.x;
      v28 = v45.origin.y;
      v29 = v45.size.width;
      v30 = v45.size.height;
      ((void (*)(CGContextRef))a6)(c);
      CGContextClip(c);
      CGContextSetBlendMode(c, kCGBlendModeClear);
      v46.origin.x = v27;
      v46.origin.y = v28;
      v46.size.width = v29;
      v46.size.height = v30;
      CGContextFillRect(c, v46);
      CGContextRestoreGState(c);
    }
    CGContextSaveGState(c);
    v31 = a5->origin.x;
    v32 = a5->origin.y;
    v33 = a5->size.width;
    v34 = a5->size.height;
    CGAffineTransformMakeScale(&v39, a7, a7);
    v47.origin.x = v31;
    v47.origin.y = v32;
    v47.size.width = v33;
    v47.size.height = v34;
    v48 = CGRectApplyAffineTransform(v47, &v39);
    v35 = v48.origin.x;
    v36 = v48.origin.y;
    v37 = v48.size.width;
    v38 = v48.size.height;
    ((void (*)(CGContextRef))a6)(c);
    CGContextClip(c);
    v49.origin.x = v35;
    v49.origin.y = v36;
    v49.size.width = v37;
    v49.size.height = v38;
    CGContextDrawImage(c, v49, *a4);
    CNUIApplyOutlineToContext(c, a2, a6, v35, v36, v37, v38, a8);
    CGContextRestoreGState(c);
  }
}

void CNUIAddCircleToContextInRect(CGContext *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  CGFloat v10;
  CGFloat MidX;
  CGFloat MidY;
  CGRect v13;

  v10 = a4 * 0.5;
  MidX = CGRectGetMidX(*(CGRect *)&a2);
  v13.origin.x = a2;
  v13.origin.y = a3;
  v13.size.width = a4;
  v13.size.height = a5;
  MidY = CGRectGetMidY(v13);
  CGContextAddArc(a1, MidX, MidY, v10, 0.0, 6.28318531, 1);
}

void CNUIDrawCircularImagesInRects(CGContext *a1, CGColor *a2, uint64_t a3, CGImageRef *a4, CGRect *a5, CGFloat a6, CGFloat a7)
{
  CNUIDrawImagesInRects(a1, a2, a3, a4, a5, CNUIAddCircleToContextInRect, a6, a7);
}

void CNUIApplyOutlineToContext(CGContext *a1, CGColor *a2, void (*a3)(CGContext *, double, double, double, double), double a4, double a5, double a6, double a7, CGFloat a8)
{
  if (a2)
  {
    CGContextSetLineWidth(a1, a8);
    CGContextSetStrokeColorWithColor(a1, a2);
    a3(a1, a4, a5, a6, a7);
    CGContextStrokePath(a1);
  }
}

uint64_t sIsAvailable_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isAvailable");
}

uint64_t sHandleToDestinationTransform_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_cnui_IDSIDRepresentation");
}

uint64_t sActionItemToTargetHandle_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "targetHandle");
}

BOOL sHasValidDestination_block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "_cnui_IDSIDRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

void sub_1DD149D04(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

CGImageRef CNUICircularImageCreate(void *a1, double a2, double a3, double a4)
{
  void (**v7)(id, CGContext *, CGColorSpace *, double, double, double, double);
  double v8;
  double v9;
  CGColorSpace *DeviceRGB;
  CGContext *v11;
  CGContext *v12;
  double v13;
  CGFloat v14;
  CGImageRef Image;

  v7 = a1;
  if (a4 <= 0.0)
    goto LABEL_7;
  v8 = a2 * a4;
  v9 = a3 * a4;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v11 = CNUIBitmapContextCreate((int)v8, (int)v9, DeviceRGB);
  if (!v11)
  {
    CGColorSpaceRelease(DeviceRGB);
LABEL_7:
    Image = 0;
    goto LABEL_8;
  }
  v12 = v11;
  v13 = *MEMORY[0x1E0C9D648];
  v14 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  CNUIAddCircleToContextInRect(v11, *MEMORY[0x1E0C9D648], v14, v8, v9);
  CGContextClip(v12);
  if (v7)
    v7[2](v7, v12, DeviceRGB, v13, v14, v8, v9);
  Image = CGBitmapContextCreateImage(v12);
  CGColorSpaceRelease(DeviceRGB);
  CGContextRelease(v12);
LABEL_8:

  return Image;
}

void CNUIDrawLikenessPlatterInContext(CGContext *a1, CGColorSpace *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  CGColor *v12;
  CGColor *v13;
  CGGradient *v14;
  CGFloat MinY;
  __int128 v16;
  _QWORD v17[2];
  CGFloat v18[2];
  __int128 v19;
  CGFloat components[2];
  __int128 v21;
  uint64_t v22;
  CGPoint v23;
  CGPoint v24;
  CGRect v25;
  CGRect v26;

  v22 = *MEMORY[0x1E0C80C00];
  CGContextSaveGState(a1);
  *(_OWORD *)components = xmmword_1DD1C8E98;
  v21 = unk_1DD1C8EA8;
  v12 = CGColorCreate(a2, components);
  *(_OWORD *)v18 = xmmword_1DD1C8EB8;
  v19 = unk_1DD1C8EC8;
  v13 = CGColorCreate(a2, v18);
  v17[0] = v12;
  v17[1] = v13;
  v16 = xmmword_1DD1C8E80;
  v14 = CGGradientCreateWithColors(a2, (CFArrayRef)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2), (const CGFloat *)&v16);
  v25.origin.x = a3;
  v25.origin.y = a4;
  v25.size.width = a5;
  v25.size.height = a6;
  MinY = CGRectGetMinY(v25);
  v26.origin.x = a3;
  v26.origin.y = a4;
  v26.size.width = a5;
  v26.size.height = a6;
  v24.y = CGRectGetMaxY(v26);
  v23.x = 0.0;
  v24.x = 0.0;
  v23.y = MinY;
  CGContextDrawLinearGradient(a1, v14, v23, v24, 0);
  CGContextRestoreGState(a1);
  CGGradientRelease(v14);
  CGColorRelease(v12);
  CGColorRelease(v13);
}

void DrawSilhouetteInContext(CGContext *a1, CGImage *a2, int a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  const CGPath *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[5];
  _QWORD v25[5];
  CGFloat components[2];
  __int128 v27;
  uint64_t v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  v28 = *MEMORY[0x1E0C80C00];
  v14 = objc_alloc_init(MEMORY[0x1E0D13B88]);
  CGContextSaveGState(a1);
  v15 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __DrawSilhouetteInContext_block_invoke;
  v25[3] = &__block_descriptor_40_e5_v8__0l;
  v25[4] = a1;
  v16 = (void *)objc_msgSend(v25, "copy");
  objc_opt_self();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1DF0D6388]();
  objc_msgSend(v14, "push:", v18);

  if (a3)
  {
    v29.origin.x = a4;
    v29.origin.y = a5;
    v29.size.width = a6;
    v29.size.height = a7;
    v19 = CGPathCreateWithEllipseInRect(v29, 0);
    v24[0] = v15;
    v24[1] = 3221225472;
    v24[2] = __DrawSilhouetteInContext_block_invoke_2;
    v24[3] = &__block_descriptor_40_e5_v8__0l;
    v24[4] = v19;
    v20 = (void *)objc_msgSend(v24, "copy");
    objc_opt_self();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x1DF0D6388]();
    objc_msgSend(v14, "push:", v22);

    CGContextAddPath(a1, v19);
  }
  CGContextClip(a1);
  v30.origin.x = a4;
  v30.origin.y = a5;
  v30.size.width = a6;
  v30.size.height = a7;
  CGContextClipToMask(a1, v30, a2);
  *(_OWORD *)components = xmmword_1DD1C8F18;
  v27 = unk_1DD1C8F28;
  CGContextSetFillColor(a1, components);
  v31.origin.x = a4;
  v31.origin.y = a5;
  v31.size.width = a6;
  v31.size.height = a7;
  CGContextFillRect(a1, v31);
  objc_msgSend(v14, "popAllWithHandler:", &__block_literal_global_50);
  v23 = (id)objc_opt_self();

}

void sub_1DD14A4EC(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1DD14A7F4(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    JUMPOUT(0x1DD14A77CLL);
  }
  _Unwind_Resume(exception_object);
}

id sPhoneNumberValue_block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id _safeImageDataType(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  if (!v1)
    goto LABEL_5;
  CGImageSourceGetTypeWithData();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2 || (objc_msgSend(&unk_1EA61C6B8, "containsObject:", v2) & 1) == 0)
  {

LABEL_5:
    v2 = 0;
  }

  return v2;
}

uint64_t initIDSCopyIDForPhoneNumberWithOptions(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;

  v5 = LoadIDS_loadPredicate_0;
  v6 = a2;
  v7 = a1;
  if (v5 != -1)
    dispatch_once(&LoadIDS_loadPredicate_0, &__block_literal_global_26);
  softLinkIDSCopyIDForPhoneNumberWithOptions = (uint64_t (*)())dlsym((void *)LoadIDS_frameworkLibrary_0, "IDSCopyIDForPhoneNumberWithOptions");
  v8 = ((uint64_t (*)(id, id, uint64_t))softLinkIDSCopyIDForPhoneNumberWithOptions)(v7, v6, a3);

  return v8;
}

uint64_t initIDSCopyIDForEmailAddress(void *a1)
{
  uint64_t v1;
  id v2;
  uint64_t v3;

  v1 = LoadIDS_loadPredicate_0;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&LoadIDS_loadPredicate_0, &__block_literal_global_26);
  softLinkIDSCopyIDForEmailAddress = (uint64_t (*)())dlsym((void *)LoadIDS_frameworkLibrary_0, "IDSCopyIDForEmailAddress");
  v3 = ((uint64_t (*)(id))softLinkIDSCopyIDForEmailAddress)(v2);

  return v3;
}

id CNUIUserActionRecentsAddressKindForContactProperty()
{
  return (id)*MEMORY[0x1E0D18230];
}

id sSortKeyForUserActionItem_block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "targetHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[CNUIUserActionRanking sortKeyWithUsername:bundleIdentifier:](CNUIUserActionRanking, "sortKeyWithUsername:bundleIdentifier:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t sEmailAddressValue_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "value");
}

void sub_1DD14D200(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD14D2F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD14DA54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD14DDB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id initIDSServiceNameiMessage()
{
  id *v0;

  if (LoadIDS_loadPredicate != -1)
    dispatch_once(&LoadIDS_loadPredicate, &__block_literal_global_118);
  v0 = (id *)dlsym((void *)LoadIDS_frameworkLibrary, "IDSServiceNameiMessage");
  objc_storeStrong((id *)&constantIDSServiceNameiMessage, *v0);
  getIDSServiceNameiMessage = (uint64_t)IDSServiceNameiMessageFunction;
  return (id)constantIDSServiceNameiMessage;
}

id initIDSServiceNameFaceTime()
{
  id *v0;

  if (LoadIDS_loadPredicate != -1)
    dispatch_once(&LoadIDS_loadPredicate, &__block_literal_global_118);
  v0 = (id *)dlsym((void *)LoadIDS_frameworkLibrary, "IDSServiceNameFaceTime");
  objc_storeStrong((id *)&constantIDSServiceNameFaceTime, *v0);
  getIDSServiceNameFaceTime = (uint64_t)IDSServiceNameFaceTimeFunction;
  return (id)constantIDSServiceNameFaceTime;
}

id IDSServiceNameFaceTimeFunction()
{
  return (id)constantIDSServiceNameFaceTime;
}

void sub_1DD14FB3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD150930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD15195C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sSortKeyForAdvisedInteraction_block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = a2;
  objc_msgSend(v2, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[CNUIUserActionRanking sortKeyWithUsername:bundleIdentifier:](CNUIUserActionRanking, "sortKeyWithUsername:bundleIdentifier:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id sIntentForActionType_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;

  v2 = sIntentForActionType_block_invoke_cn_once_token_4;
  v3 = a2;
  if (v2 != -1)
    dispatch_once(&sIntentForActionType_block_invoke_cn_once_token_4, &__block_literal_global_30_1);
  objc_msgSend((id)sIntentForActionType_block_invoke_cn_once_object_4, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t initPKPeerPaymentIsAvailable()
{
  if (LoadPassKitCore_loadPredicate != -1)
    dispatch_once(&LoadPassKitCore_loadPredicate, &__block_literal_global_18);
  softLinkPKPeerPaymentIsAvailable = (uint64_t (*)())dlsym((void *)LoadPassKitCore_frameworkLibrary, "PKPeerPaymentIsAvailable");
  return softLinkPKPeerPaymentIsAvailable();
}

void sub_1DD155074(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD1567C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD157C58(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

Class initTUCallProviderManager()
{
  Class result;

  if (LoadTelephonyUtilities_loadPredicate_1 != -1)
    dispatch_once(&LoadTelephonyUtilities_loadPredicate_1, &__block_literal_global_76);
  result = objc_getClass("TUCallProviderManager");
  classTUCallProviderManager = (uint64_t)result;
  getTUCallProviderManagerClass = (uint64_t (*)())TUCallProviderManagerFunction;
  return result;
}

Class initTUCallProviderManager_0()
{
  Class result;

  if (LoadTelephonyUtilities_loadPredicate_3 != -1)
    dispatch_once(&LoadTelephonyUtilities_loadPredicate_3, &__block_literal_global_81_0);
  result = objc_getClass("TUCallProviderManager");
  classTUCallProviderManager_0 = (uint64_t)result;
  getTUCallProviderManagerClass_0 = (uint64_t (*)())TUCallProviderManagerFunction_0;
  return result;
}

Class initRTTTelephonyUtilities()
{
  Class result;

  if (LoadRTTUtilities_loadPredicate != -1)
    dispatch_once(&LoadRTTUtilities_loadPredicate, &__block_literal_global_1);
  result = objc_getClass("RTTTelephonyUtilities");
  classRTTTelephonyUtilities = (uint64_t)result;
  getRTTTelephonyUtilitiesClass = (uint64_t (*)())RTTTelephonyUtilitiesFunction;
  return result;
}

void sIntentForActionType_block_invoke_2()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0C96658];
  v4[0] = *MEMORY[0x1E0C965F8];
  v4[1] = v0;
  v5[0] = CFSTR("INStartAudioCallIntent");
  v5[1] = CFSTR("INStartVideoCallIntent");
  v4[2] = *MEMORY[0x1E0C96620];
  v5[2] = CFSTR("INSendMessageIntent");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "copy");
  v3 = (void *)sIntentForActionType_block_invoke_cn_once_object_4;
  sIntentForActionType_block_invoke_cn_once_object_4 = v2;

}

const void *_cgProcessSafeImageSourceFromData(void *a1, void *a2)
{
  id v3;
  uint64_t (**v4)(id, CGImageSourceRef);
  void *v5;
  CGDataProviderRef v6;
  CGDataProvider *v7;
  uint64_t v8;
  const __CFDictionary *v9;
  CGImageSourceRef v10;
  CGImageSourceRef v11;
  const void *v12;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  _safeImageDataType(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_7;
  v6 = CGDataProviderCreateWithCFData((CFDataRef)v3);
  if (!v6)
    goto LABEL_7;
  v7 = v6;
  v8 = *MEMORY[0x1E0CBD2A8];
  v14[0] = *MEMORY[0x1E0CBD1C8];
  v14[1] = v8;
  v15[0] = MEMORY[0x1E0C9AAB0];
  v15[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v10 = CGImageSourceCreateWithDataProvider(v7, v9);
  if (!v10 || (v11 = v10, v12 = (const void *)v4[2](v4, v10), CFRelease(v11), !v12))
  {
    CFRelease(v7);

LABEL_7:
    v12 = (const void *)CNUIEmptyPixelImageGet();
    goto LABEL_8;
  }
  CFRelease(v7);
  CFAutorelease(v12);

LABEL_8:
  return v12;
}

void sub_1DD15C674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CoreSpotlightLibrary()
{
  uint64_t v0;
  void *v2;

  if (!CoreSpotlightLibraryCore_frameworkLibrary)
    CoreSpotlightLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = CoreSpotlightLibraryCore_frameworkLibrary;
  if (!CoreSpotlightLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class initPRMonogram()
{
  Class result;

  if (LoadPersonaUI_loadPredicate != -1)
    dispatch_once(&LoadPersonaUI_loadPredicate, &__block_literal_global_146);
  result = objc_getClass("PRMonogram");
  classPRMonogram = (uint64_t)result;
  getPRMonogramClass = (uint64_t (*)())PRMonogramFunction;
  return result;
}

Class initPRMonogram_0()
{
  Class result;

  if (LoadPersonaUI_loadPredicate_0 != -1)
    dispatch_once(&LoadPersonaUI_loadPredicate_0, &__block_literal_global_208);
  result = objc_getClass("PRMonogram");
  classPRMonogram_0 = (uint64_t)result;
  getPRMonogramClass_0 = (uint64_t (*)(void))PRMonogramFunction_0;
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

id IDSServiceNameiMessageFunction()
{
  return (id)constantIDSServiceNameiMessage;
}

id initIDSServiceNameFaceTimeMultiway()
{
  id *v0;

  if (LoadIDS_loadPredicate != -1)
    dispatch_once(&LoadIDS_loadPredicate, &__block_literal_global_118);
  v0 = (id *)dlsym((void *)LoadIDS_frameworkLibrary, "IDSServiceNameFaceTimeMultiway");
  objc_storeStrong((id *)&constantIDSServiceNameFaceTimeMultiway, *v0);
  getIDSServiceNameFaceTimeMultiway = (uint64_t)IDSServiceNameFaceTimeMultiwayFunction;
  return (id)constantIDSServiceNameFaceTimeMultiway;
}

id IDSServiceNameFaceTimeMultiwayFunction()
{
  return (id)constantIDSServiceNameFaceTimeMultiway;
}

id RTTTelephonyUtilitiesFunction()
{
  return (id)classRTTTelephonyUtilities;
}

Class initTUCallCenter()
{
  Class result;

  if (LoadTelephonyUtilities_loadPredicate != -1)
    dispatch_once(&LoadTelephonyUtilities_loadPredicate, &__block_literal_global_81);
  result = objc_getClass("TUCallCenter");
  classTUCallCenter = (uint64_t)result;
  getTUCallCenterClass = (uint64_t (*)())TUCallCenterFunction;
  return result;
}

id TUCallCenterFunction()
{
  return (id)classTUCallCenter;
}

Class initTUDialRequest()
{
  Class result;

  if (LoadTelephonyUtilities_loadPredicate != -1)
    dispatch_once(&LoadTelephonyUtilities_loadPredicate, &__block_literal_global_81);
  result = objc_getClass("TUDialRequest");
  classTUDialRequest = (uint64_t)result;
  getTUDialRequestClass = (uint64_t (*)())TUDialRequestFunction;
  return result;
}

id TUDialRequestFunction()
{
  return (id)classTUDialRequest;
}

uint64_t imageFromImageRef(uint64_t a1, double a2, double a3, double a4)
{
  return -[objc_class imageWithCGImage:scale:orientation:](NSClassFromString(CFSTR("UIImage")), "imageWithCGImage:scale:orientation:", a1, 0, a4);
}

uint64_t imageRefFromImage(void *a1)
{
  return objc_msgSend(objc_retainAutorelease(a1), "CGImage");
}

id PRMonogramFunction()
{
  return (id)classPRMonogram;
}

Class initPRLikeness()
{
  Class result;

  if (LoadPersonaUI_loadPredicate != -1)
    dispatch_once(&LoadPersonaUI_loadPredicate, &__block_literal_global_146);
  result = objc_getClass("PRLikeness");
  classPRLikeness = (uint64_t)result;
  getPRLikenessClass = (uint64_t (*)())PRLikenessFunction;
  return result;
}

id PRLikenessFunction()
{
  return (id)classPRLikeness;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t kCNUICoreContactToIdentifer_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

void sub_1DD162864(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sCNContactToContactIdentifier_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

uint64_t sCNUICoreFamilyMemberContactItemToContactidentifier_block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "contactIdentifier");
}

uint64_t sCNUICoreFamilyMemberContactItemNotPersisted_block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasBeenPersisted") ^ 1;
}

uint64_t sCNUICoreFamilyMemberContactItemPersisted_block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasBeenPersisted");
}

uint64_t CNUICoreItemFormattedNameComparator_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "formattedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "formattedName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t sCNUICoreFamilyMemberContactItemToContactIdentifier_block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "contactIdentifier");
}

uint64_t sCNUICoreContactToIdentifier_block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

Class initTUDialRequest_0()
{
  Class result;

  if (LoadTelephonyUtilities_loadPredicate_0 != -1)
    dispatch_once(&LoadTelephonyUtilities_loadPredicate_0, &__block_literal_global_86);
  result = objc_getClass("TUDialRequest");
  classTUDialRequest_0 = (uint64_t)result;
  getTUDialRequestClass_0 = (uint64_t (*)())TUDialRequestFunction_0;
  return result;
}

id TUDialRequestFunction_0()
{
  return (id)classTUDialRequest_0;
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1DD16A1E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_1DD16A4A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id initPKPeerPaymentGetSendPaymentSensitiveURL(void *a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  void *v9;

  v5 = LoadPassKitCore_loadPredicate;
  v6 = a3;
  v7 = a2;
  v8 = a1;
  if (v5 != -1)
    dispatch_once(&LoadPassKitCore_loadPredicate, &__block_literal_global_18);
  softLinkPKPeerPaymentGetSendPaymentSensitiveURL = (uint64_t (*)())dlsym((void *)LoadPassKitCore_frameworkLibrary, "PKPeerPaymentGetSendPaymentSensitiveURL");
  ((void (*)(id, id, id))softLinkPKPeerPaymentGetSendPaymentSensitiveURL)(v8, v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id TUCallProviderManagerFunction()
{
  return (id)classTUCallProviderManager;
}

uint64_t initABLogDisplayInternalAlert(uint64_t a1)
{
  if (LoadAddressBookLegacy_loadPredicate != -1)
    dispatch_once(&LoadAddressBookLegacy_loadPredicate, &__block_literal_global_79);
  softLinkABLogDisplayInternalAlert = (uint64_t (*)())dlsym((void *)LoadAddressBookLegacy_frameworkLibrary, "ABLogDisplayInternalAlert");
  return ((uint64_t (*)(uint64_t))softLinkABLogDisplayInternalAlert)(a1);
}

Class initTUDialRequest_1()
{
  Class result;

  if (LoadTelephonyUtilities_loadPredicate_1 != -1)
    dispatch_once(&LoadTelephonyUtilities_loadPredicate_1, &__block_literal_global_76);
  result = objc_getClass("TUDialRequest");
  classTUDialRequest_1 = (uint64_t)result;
  getTUDialRequestClass_1 = (uint64_t (*)())TUDialRequestFunction_1;
  return result;
}

id TUDialRequestFunction_1()
{
  return (id)classTUDialRequest_1;
}

Class initTUConversationMember()
{
  Class result;

  if (LoadTelephonyUtilities_loadPredicate_1 != -1)
    dispatch_once(&LoadTelephonyUtilities_loadPredicate_1, &__block_literal_global_76);
  result = objc_getClass("TUConversationMember");
  classTUConversationMember = (uint64_t)result;
  getTUConversationMemberClass = (uint64_t (*)())TUConversationMemberFunction;
  return result;
}

id TUConversationMemberFunction()
{
  return (id)classTUConversationMember;
}

Class initTUJoinConversationRequest()
{
  Class result;

  if (LoadTelephonyUtilities_loadPredicate_1 != -1)
    dispatch_once(&LoadTelephonyUtilities_loadPredicate_1, &__block_literal_global_76);
  result = objc_getClass("TUJoinConversationRequest");
  classTUJoinConversationRequest = (uint64_t)result;
  getTUJoinConversationRequestClass = (uint64_t (*)())TUJoinConversationRequestFunction;
  return result;
}

id TUJoinConversationRequestFunction()
{
  return (id)classTUJoinConversationRequest;
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_1DD16C37C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id initkMCCommunicationServiceTypeAudioCall()
{
  id *v0;

  if (LoadManagedConfiguration_loadPredicate != -1)
    dispatch_once(&LoadManagedConfiguration_loadPredicate, &__block_literal_global_20);
  v0 = (id *)dlsym((void *)LoadManagedConfiguration_frameworkLibrary, "kMCCommunicationServiceTypeAudioCall");
  objc_storeStrong((id *)&constantkMCCommunicationServiceTypeAudioCall, *v0);
  getkMCCommunicationServiceTypeAudioCall = (uint64_t (*)())kMCCommunicationServiceTypeAudioCallFunction;
  return (id)constantkMCCommunicationServiceTypeAudioCall;
}

id kMCCommunicationServiceTypeAudioCallFunction()
{
  return (id)constantkMCCommunicationServiceTypeAudioCall;
}

uint64_t sCNUICoreScrachpadContactToContactIdentifier_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

void sub_1DD16E5B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t contactToContactIdentifier_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1DD16F980(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

id contactsBackgroundColorServiceInterface()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F03EAF18);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v1, sel_getBackgroundColorOnImageData_bitmapFormat_withReply_, 1, 0);

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_getBackgroundColorOnImageData_bitmapFormat_withReply_, 0, 1);

  return v0;
}

uint64_t CNPropertyDescriptionKeyTransform_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "key");
}

id sEmailStringRepresentationsTransform_block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = *MEMORY[0x1E0D13848];
  objc_msgSend(v2, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = (*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  if ((v3 & 1) != 0)
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(v2, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

void sAddNonEmptyString_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) == 0)
    objc_msgSend(v5, "addObject:", v4);

}

id sPhoneNumberStringRepresentationsTransform_block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
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
  void *v15;
  void *v16;
  void *v17;

  v2 = (void *)MEMORY[0x1E0C99DE8];
  v3 = a2;
  objc_msgSend(v2, "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unformattedInternationalStringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  sAddNonEmptyString_block_invoke_3((uint64_t)v6, v4, v6);

  objc_msgSend(v3, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  sAddNonEmptyString_block_invoke_3((uint64_t)v8, v4, v8);

  objc_msgSend(v3, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "formattedStringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_cn_stringBySanitizingPhoneNumber");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sAddNonEmptyString_block_invoke_3((uint64_t)v11, v4, v11);

  objc_msgSend(v3, "value");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "formattedInternationalStringValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_cn_stringBySanitizingPhoneNumber");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  sAddNonEmptyString_block_invoke_3((uint64_t)v14, v4, v14);

  objc_msgSend(v3, "value");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "digits");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  sAddNonEmptyString_block_invoke_3((uint64_t)v16, v4, v16);

  v17 = (void *)objc_msgSend(v4, "copy");
  return v17;
}

void OUTLINED_FUNCTION_0_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_1DD1720C4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DD172284(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id initTUCallCapabilitiesFaceTimeAvailabilityChangedNotification()
{
  id *v0;

  if (LoadTelephonyUtilities_loadPredicate_2 != -1)
    dispatch_once(&LoadTelephonyUtilities_loadPredicate_2, &__block_literal_global_237);
  v0 = (id *)dlsym((void *)LoadTelephonyUtilities_frameworkLibrary_2, "TUCallCapabilitiesFaceTimeAvailabilityChangedNotification");
  objc_storeStrong((id *)&constantTUCallCapabilitiesFaceTimeAvailabilityChangedNotification, *v0);
  getTUCallCapabilitiesFaceTimeAvailabilityChangedNotification = (uint64_t (*)())TUCallCapabilitiesFaceTimeAvailabilityChangedNotificationFunction;
  return (id)constantTUCallCapabilitiesFaceTimeAvailabilityChangedNotification;
}

id TUCallCapabilitiesFaceTimeAvailabilityChangedNotificationFunction()
{
  return (id)constantTUCallCapabilitiesFaceTimeAvailabilityChangedNotification;
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

id background_color_os_log()
{
  if (background_color_os_log_cn_once_token_376 != -1)
    dispatch_once(&background_color_os_log_cn_once_token_376, &__block_literal_global_61);
  return (id)background_color_os_log_cn_once_object_376;
}

void __background_color_os_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.ui", "backgroundColor");
  v1 = (void *)background_color_os_log_cn_once_object_376;
  background_color_os_log_cn_once_object_376 = (uint64_t)v0;

}

void sub_1DD1742F0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1DD175ED4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD1762BC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1DD1782FC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

uint64_t sContactToIdentifier_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

uint64_t kCNUICoreContactToIdentifier_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

uint64_t _mergedCarrierBundleValue(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(MEMORY[0x1E0D34CC8], "sharedInstance", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "carrierBundleValueFromAllSIMsForKey:ofType:withFallback:", v3, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    LOBYTE(a2) = 1;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        if ((a2 & 1) != 0)
          a2 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11), "BOOLValue");
        else
          a2 = 0;
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  return a2;
}

double _interiorPointForCorner(uint64_t a1, double result, double a3, double a4)
{
  double v4;

  switch(a1)
  {
    case 1:
      v4 = a3 + a4;
      goto LABEL_6;
    case 2:
      result = a4 - result;
      break;
    case 4:
      result = result + a4;
      break;
    case 8:
      v4 = a4 - a3;
LABEL_6:
      result = v4;
      break;
    default:
      return result;
  }
  return result;
}

double QL_UIValueCGSizeValue(void *a1)
{
  id v1;
  _QWORD v3[2];
  NSUInteger sizep;

  v3[0] = 0;
  v3[1] = 0;
  sizep = 0;
  v1 = objc_retainAutorelease(a1);
  NSGetSizeAndAlignment((const char *)objc_msgSend(v1, "objCType"), &sizep, 0);
  objc_msgSend(v1, "getValue:size:", v3, 16);

  return *(double *)v3;
}

double UIRectGetMinY(double a1, double a2)
{
  return a2;
}

double UIRectGetMaxX(double a1, double a2, double a3)
{
  return a1 + a3;
}

double UIRectGetMaxY(double a1, double a2, double a3, double a4)
{
  return a2 + a4;
}

void _addContinuousCornerToContextPath(CGContext *a1, uint64_t a2, double a3, double a4, double a5)
{
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  __double2 v29;
  CGFloat cp2y;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;

  v8 = 20.0;
  if ((unint64_t)(a2 - 1) <= 3)
    v8 = dbl_1DD1C8ED8[a2 - 1];
  v9 = a5 * 0.95 / 1.528665;
  v10 = v9 * 0.33 * 0.666666667;
  v11 = v10 * 1.05304313 + (v9 / 1.05304313 + v10 * 0.33 / 1.05304313) * 0.67;
  v12 = v10 * 1.05304313 + v11;
  v13 = v10 * 1.05304313 + v10 * 1.05304313 + v12;
  v14 = _interiorPointForCorner(a2, v12, 0.0, a3);
  v35 = v15;
  v36 = v14;
  v16 = _interiorPointForCorner(a2, v11, 0.0, a3);
  v31 = v17;
  v32 = v16;
  v18 = _interiorPointForCorner(a2, 0.0, v11, a3);
  v33 = v19;
  v34 = v18;
  v20 = _interiorPointForCorner(a2, 0.0, v12, a3);
  cp2y = v21;
  v22 = _interiorPointForCorner(a2, 0.0, v13, a3);
  v24 = v23;
  v25 = _interiorPointForCorner(a2, v9, v9, a3);
  v27 = v26;
  v28 = v9 * 0.980263;
  v29 = __sincos_stret(v8 * 0.0174532925);
  CGContextAddCurveToPoint(a1, v36, v35, v32, v31, v25 + v28 * v29.__cosval, v27 + v28 * v29.__sinval);
  CGContextAddArc(a1, v25, v27, v28, v8 * 0.0174532925, (v8 + 50.0) * 0.0174532925, 0);
  CGContextAddCurveToPoint(a1, v34, v33, v20, cp2y, v22, v24);
}

void CNUIAddRoundedRectToContextInRect(CGContext *a1, double a2, CGFloat a3, double a4, double a5)
{
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _QWORD v21[5];

  v21[4] = *MEMORY[0x1E0C80C00];
  v10 = floor(a4 * 0.2);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", v10, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v11;
  v21[1] = v11;
  v21[2] = v11;
  v21[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndex:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "QL_CGSizeValue");
  v15 = v14 * 1.528665;
  objc_msgSend(v12, "objectAtIndex:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "QL_CGSizeValue");
  v18 = v17 * 1.528665;

  v19 = a2 + a4;
  v20 = a3 + a5;
  CGContextMoveToPoint(a1, a2 + v15, a3);
  CGContextAddLineToPoint(a1, v19 - v15, a3);
  _addContinuousCornerToContextPath(a1, 2, v19, a3, v15);
  CGContextAddLineToPoint(a1, v19, v20 - v18);
  _addContinuousCornerToContextPath(a1, 8, v19, v20, v15);
  CGContextAddLineToPoint(a1, a2 + v15, v20);
  _addContinuousCornerToContextPath(a1, 4, a2, v20, v15);
  CGContextAddLineToPoint(a1, a2, a3 + v18);
  _addContinuousCornerToContextPath(a1, 1, a2, a3, v15);

}

void CNUIClipContextWithCircleInRect(CGContext *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  CNUIAddCircleToContextInRect(a1, a2, a3, a4, a5);
  CGContextClip(a1);
}

void CNUIClipContextWithRoundedRectInRect(CGContext *a1, double a2, CGFloat a3, double a4, double a5)
{
  CNUIAddRoundedRectToContextInRect(a1, a2, a3, a4, a5);
  CGContextClip(a1);
}

CGImageRef CNUIRoundedRectImageCreate(void *a1, double a2, double a3, double a4)
{
  void (**v7)(id, CGContext *, CGColorSpace *, double, double, double, double);
  double v8;
  double v9;
  CGColorSpace *DeviceRGB;
  CGContext *v11;
  CGContext *v12;
  double v13;
  CGFloat v14;
  CGImageRef Image;

  v7 = a1;
  if (a4 <= 0.0)
    goto LABEL_7;
  v8 = a2 * a4;
  v9 = a3 * a4;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v11 = CNUIBitmapContextCreate((int)v8, (int)v9, DeviceRGB);
  if (!v11)
  {
    CGColorSpaceRelease(DeviceRGB);
LABEL_7:
    Image = 0;
    goto LABEL_8;
  }
  v12 = v11;
  v13 = *MEMORY[0x1E0C9D648];
  v14 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  CNUIAddRoundedRectToContextInRect(v11, *MEMORY[0x1E0C9D648], v14, v8, v9);
  CGContextClip(v12);
  if (v7)
    v7[2](v7, v12, DeviceRGB, v13, v14, v8, v9);
  Image = CGBitmapContextCreateImage(v12);
  CGColorSpaceRelease(DeviceRGB);
  CGContextRelease(v12);
LABEL_8:

  return Image;
}

uint64_t CNUIEmptyPixelImageGet()
{
  if (CNUIEmptyPixelImageGet_onceToken != -1)
    dispatch_once(&CNUIEmptyPixelImageGet_onceToken, &__block_literal_global_43);
  return CNUIEmptyPixelImageGet_emptyPixelImage;
}

double __CNUISmartCeiling(double a1)
{
  double v1;
  double v2;
  double result;

  v1 = floor(a1);
  v2 = a1 - v1;
  result = ceil(a1);
  if (v2 < 0.00000011920929)
    return v1;
  return result;
}

double CNUIRectIntegralWithScale(double a1, double a2, double a3, double a4, double a5)
{
  double v7;

  if (CGRectIsNull(*(CGRect *)&a1))
    return a1;
  if (a5 == 0.0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Can't pass a 0 scale when rendering likenesses"));
  if (a5 == 1.0)
    v7 = floor(a1);
  else
    v7 = floor(a1 * a5) / a5;
  if (a5 == 0.0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Can't pass a 0 scale when rendering likenesses"));
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Can't pass a 0 scale when rendering likenesses"));
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Can't pass a 0 scale when rendering likenesses"));
  }
  return v7;
}

void CNUICalculateSubRectsForOverlappingLikenesses(uint64_t a1, uint64_t a2, int a3, double a4, double a5, double a6, double a7, double a8)
{
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (a1)
  {
    v12 = 0.666666667;
    if (a1 == 1)
      v12 = 1.0;
    if (a6 >= a7)
      v13 = a7;
    else
      v13 = a6;
    v14 = v12 * v13;
    v15 = v13 - v12 * v13;
    if (a3)
      v16 = 0.0;
    else
      v16 = v13 - v12 * v13;
    *(double *)a2 = CNUIRectIntegralWithScale(v16, 0.0, v14, v14, a8);
    *(_QWORD *)(a2 + 8) = v17;
    *(_QWORD *)(a2 + 16) = v18;
    *(_QWORD *)(a2 + 24) = v19;
    if (a1 != 1)
    {
      if (a3)
        v20 = v15;
      else
        v20 = 0.0;
      *(double *)(a2 + 32) = CNUIRectIntegralWithScale(v20, v15, v14, v14, a8);
      *(_QWORD *)(a2 + 40) = v21;
      *(_QWORD *)(a2 + 48) = v22;
      *(_QWORD *)(a2 + 56) = v23;
    }
  }
}

void CNUIClipPathInRect(CGContext *a1, void (*a2)(void))
{
  a2();
  CGContextClip(a1);
}

void CNUIDrawRoundedRectImagesInRects(CGContext *a1, CGColor *a2, uint64_t a3, CGImageRef *a4, CGRect *a5, CGFloat a6, CGFloat a7)
{
  CNUIDrawImagesInRects(a1, a2, a3, a4, a5, CNUIAddRoundedRectToContextInRect, a6, a7);
}

void sub_1DD17ECFC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DD17EE5C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

id TUCallProviderManagerFunction_0()
{
  return (id)classTUCallProviderManager_0;
}

void sub_1DD181E44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id PRMonogramFunction_0()
{
  return (id)classPRMonogram_0;
}

void sub_1DD185A50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD185DBC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

Class initSTRemotePasscodeController()
{
  Class result;

  if (LoadScreenTimeUI_loadPredicate != -1)
    dispatch_once(&LoadScreenTimeUI_loadPredicate, &__block_literal_global_56);
  result = objc_getClass("STRemotePasscodeController");
  classSTRemotePasscodeController = (uint64_t)result;
  getSTRemotePasscodeControllerClass = (uint64_t (*)())STRemotePasscodeControllerFunction;
  return result;
}

id STRemotePasscodeControllerFunction()
{
  return (id)classSTRemotePasscodeController;
}

void sub_1DD188AB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void sub_1DD18907C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD189358(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DD189694(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

Class initTUDialRequest_2()
{
  Class result;

  if (LoadTelephonyUtilities_loadPredicate_4 != -1)
    dispatch_once(&LoadTelephonyUtilities_loadPredicate_4, &__block_literal_global_64);
  result = objc_getClass("TUDialRequest");
  classTUDialRequest_2 = (uint64_t)result;
  getTUDialRequestClass_2 = (uint64_t (*)())TUDialRequestFunction_2;
  return result;
}

id TUDialRequestFunction_2()
{
  return (id)classTUDialRequest_2;
}

id initFBSOpenApplicationOptionKeyUnlockDevice()
{
  id *v0;

  if (LoadFrontBoardServices_loadPredicate != -1)
    dispatch_once(&LoadFrontBoardServices_loadPredicate, &__block_literal_global_2_2);
  v0 = (id *)dlsym((void *)LoadFrontBoardServices_frameworkLibrary, "FBSOpenApplicationOptionKeyUnlockDevice");
  objc_storeStrong((id *)&constantFBSOpenApplicationOptionKeyUnlockDevice, *v0);
  getFBSOpenApplicationOptionKeyUnlockDevice = (uint64_t (*)())FBSOpenApplicationOptionKeyUnlockDeviceFunction;
  return (id)constantFBSOpenApplicationOptionKeyUnlockDevice;
}

id FBSOpenApplicationOptionKeyUnlockDeviceFunction()
{
  return (id)constantFBSOpenApplicationOptionKeyUnlockDevice;
}

id initFBSOpenApplicationOptionKeyPromptUnlockDevice()
{
  id *v0;

  if (LoadFrontBoardServices_loadPredicate != -1)
    dispatch_once(&LoadFrontBoardServices_loadPredicate, &__block_literal_global_2_2);
  v0 = (id *)dlsym((void *)LoadFrontBoardServices_frameworkLibrary, "FBSOpenApplicationOptionKeyPromptUnlockDevice");
  objc_storeStrong((id *)&constantFBSOpenApplicationOptionKeyPromptUnlockDevice, *v0);
  getFBSOpenApplicationOptionKeyPromptUnlockDevice = (uint64_t (*)())FBSOpenApplicationOptionKeyPromptUnlockDeviceFunction;
  return (id)constantFBSOpenApplicationOptionKeyPromptUnlockDevice;
}

id FBSOpenApplicationOptionKeyPromptUnlockDeviceFunction()
{
  return (id)constantFBSOpenApplicationOptionKeyPromptUnlockDevice;
}

void sub_1DD18D724(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD18DA88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class initSTManagementState()
{
  Class result;

  if (LoadScreenTimeCore_loadPredicate != -1)
    dispatch_once(&LoadScreenTimeCore_loadPredicate, &__block_literal_global_68);
  result = objc_getClass("STManagementState");
  classSTManagementState = (uint64_t)result;
  getSTManagementStateClass = (uint64_t (*)())STManagementStateFunction;
  return result;
}

id STManagementStateFunction()
{
  return (id)classSTManagementState;
}

Class initTUHandle()
{
  Class result;

  if (LoadTelephonyUtilities_loadPredicate_5 != -1)
    dispatch_once(&LoadTelephonyUtilities_loadPredicate_5, &__block_literal_global_102);
  result = objc_getClass("TUHandle");
  classTUHandle = (uint64_t)result;
  getTUHandleClass = (uint64_t (*)())TUHandleFunction;
  return result;
}

id TUHandleFunction()
{
  return (id)classTUHandle;
}

id sFamilyElementToMatchingContact_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "matchingContacts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t sFamilyElementIsParent_block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isParent");
}

id sMostRecentPair_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v5 = a2;
  objc_msgSend(v5, "second");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mostRecentDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "second");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mostRecentDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "compare:", v9) == -1)
    v10 = v4;
  else
    v10 = v5;
  v11 = v10;

  return v11;
}

Class initMCProfileConnection()
{
  Class result;

  if (LoadManagedConfiguration_loadPredicate_0[0] != -1)
    dispatch_once(LoadManagedConfiguration_loadPredicate_0, &__block_literal_global_81);
  result = objc_getClass("MCProfileConnection");
  classMCProfileConnection = (uint64_t)result;
  getMCProfileConnectionClass = (uint64_t (*)())MCProfileConnectionFunction;
  return result;
}

id MCProfileConnectionFunction()
{
  return (id)classMCProfileConnection;
}

id initMCProfileListChangedNotification()
{
  id *v0;

  if (LoadManagedConfiguration_loadPredicate_0[0] != -1)
    dispatch_once(LoadManagedConfiguration_loadPredicate_0, &__block_literal_global_81);
  v0 = (id *)dlsym((void *)LoadManagedConfiguration_frameworkLibrary_0, "MCProfileListChangedNotification");
  objc_storeStrong((id *)&constantMCProfileListChangedNotification, *v0);
  getMCProfileListChangedNotification = (uint64_t (*)())MCProfileListChangedNotificationFunction;
  return (id)constantMCProfileListChangedNotification;
}

id MCProfileListChangedNotificationFunction()
{
  return (id)constantMCProfileListChangedNotification;
}

id sub_1DD195108()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void **v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9680);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1DD1C8F90;
  v1 = (void *)objc_opt_self();
  *(_QWORD *)(v0 + 32) = objc_msgSend(v1, sel_descriptorForRequiredKeysForStyle_, 1);
  v2 = objc_msgSend(v1, sel_descriptorForRequiredKeysForStyle_, 0);
  v3 = (void *)*MEMORY[0x1E0C966A8];
  *(_QWORD *)(v0 + 40) = v2;
  *(_QWORD *)(v0 + 48) = v3;
  v4 = (void *)*MEMORY[0x1E0C967C0];
  v5 = (void *)*MEMORY[0x1E0C96708];
  *(_QWORD *)(v0 + 56) = *MEMORY[0x1E0C967C0];
  *(_QWORD *)(v0 + 64) = v5;
  v6 = (void *)*MEMORY[0x1E0C96688];
  v7 = (void *)*MEMORY[0x1E0C96890];
  *(_QWORD *)(v0 + 72) = *MEMORY[0x1E0C96688];
  *(_QWORD *)(v0 + 80) = v7;
  v8 = (void *)*MEMORY[0x1E0C968A8];
  v9 = (void *)*MEMORY[0x1E0C968B8];
  *(_QWORD *)(v0 + 88) = *MEMORY[0x1E0C968A8];
  *(_QWORD *)(v0 + 96) = v9;
  v10 = (void *)*MEMORY[0x1E0C96668];
  v45 = (void *)*MEMORY[0x1E0C96820];
  v11 = *MEMORY[0x1E0C96820];
  *(_QWORD *)(v0 + 104) = *MEMORY[0x1E0C96668];
  *(_QWORD *)(v0 + 112) = v11;
  v44 = (void *)*MEMORY[0x1E0C96798];
  v47 = (void *)*MEMORY[0x1E0C967A0];
  v12 = *MEMORY[0x1E0C967A0];
  *(_QWORD *)(v0 + 120) = *MEMORY[0x1E0C96798];
  *(_QWORD *)(v0 + 128) = v12;
  v46 = (void *)*MEMORY[0x1E0C967B8];
  v49 = (void *)*MEMORY[0x1E0C967E8];
  v13 = *MEMORY[0x1E0C967E8];
  *(_QWORD *)(v0 + 136) = *MEMORY[0x1E0C967B8];
  *(_QWORD *)(v0 + 144) = v13;
  v48 = (void *)*MEMORY[0x1E0C96698];
  v51 = (void *)*MEMORY[0x1E0C96758];
  v14 = *MEMORY[0x1E0C96758];
  *(_QWORD *)(v0 + 152) = *MEMORY[0x1E0C96698];
  *(_QWORD *)(v0 + 160) = v14;
  v50 = (void *)*MEMORY[0x1E0C96670];
  v54 = (void *)*MEMORY[0x1E0C967A8];
  v15 = *MEMORY[0x1E0C967A8];
  *(_QWORD *)(v0 + 168) = *MEMORY[0x1E0C96670];
  *(_QWORD *)(v0 + 176) = v15;
  v53 = (void *)*MEMORY[0x1E0C967B0];
  v16 = (void **)MEMORY[0x1E0C967F0];
  *(_QWORD *)(v0 + 184) = *MEMORY[0x1E0C967B0];
  *(_QWORD *)(v0 + 192) = v5;
  v52 = *v16;
  v56 = (void *)*MEMORY[0x1E0C96690];
  v17 = *MEMORY[0x1E0C96690];
  *(_QWORD *)(v0 + 200) = v52;
  *(_QWORD *)(v0 + 208) = v17;
  v55 = (void *)*MEMORY[0x1E0C968A0];
  v18 = *MEMORY[0x1E0C96840];
  v58 = (void *)*MEMORY[0x1E0C96840];
  *(_QWORD *)(v0 + 216) = *MEMORY[0x1E0C968A0];
  *(_QWORD *)(v0 + 224) = v18;
  v57 = (void *)*MEMORY[0x1E0C96868];
  v19 = *MEMORY[0x1E0C96740];
  v59 = (void *)*MEMORY[0x1E0C96740];
  *(_QWORD *)(v0 + 232) = *MEMORY[0x1E0C96868];
  *(_QWORD *)(v0 + 240) = v19;
  sub_1DD1C2098();
  static CNUINameDrop.descriptorForRequiredKeys = v0;
  v20 = v5;
  v21 = v3;
  v22 = v4;
  v23 = v6;
  v24 = v7;
  v25 = v8;
  v26 = v9;
  v27 = v10;
  v28 = v45;
  v29 = v44;
  v30 = v47;
  v31 = v46;
  v32 = v49;
  v33 = v48;
  v34 = v51;
  v35 = v50;
  v36 = v54;
  v37 = v53;
  v38 = v52;
  v39 = v56;
  v40 = v55;
  v41 = v58;
  v42 = v57;
  return v59;
}

uint64_t *CNUINameDrop.descriptorForRequiredKeys.unsafeMutableAddressor()
{
  if (qword_1F03C9560 != -1)
    swift_once();
  return &static CNUINameDrop.descriptorForRequiredKeys;
}

uint64_t static CNUINameDrop.descriptorForRequiredKeys.getter()
{
  if (qword_1F03C9560 != -1)
    swift_once();
  return swift_bridgeObjectRetain();
}

uint64_t static CNUINameDrop.vCardMergingContact(_:with:)(void *a1, void *a2)
{
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  id v32;
  id v33;
  unint64_t v34;
  uint64_t v35;
  id v36;
  void *v37;
  uint64_t v38;
  id v39;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  id v47;
  id v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  _QWORD *v52;
  id v53;
  void *v54;
  void *v56;
  id v57[5];

  v57[4] = *(id *)MEMORY[0x1E0C80C00];
  objc_msgSend(a1, sel_mutableCopy);
  sub_1DD1C2140();
  swift_unknownObjectRelease();
  sub_1DD1A0658(0, (unint64_t *)&qword_1F03C9670);
  swift_dynamicCast();
  objc_msgSend(v56, sel_setContactType_, objc_msgSend(a2, sel_contactType));
  v4 = objc_msgSend(a2, sel_givenName);
  if (!v4)
  {
    sub_1DD1C202C();
    v4 = (id)sub_1DD1C2020();
    swift_bridgeObjectRelease();
  }
  objc_msgSend(v56, sel_setGivenName_, v4);

  v5 = objc_msgSend(a2, sel_familyName);
  if (!v5)
  {
    sub_1DD1C202C();
    v5 = (id)sub_1DD1C2020();
    swift_bridgeObjectRelease();
  }
  objc_msgSend(v56, sel_setFamilyName_, v5);

  v6 = objc_msgSend(a2, sel_thumbnailImageData);
  if (v6)
  {
    v7 = v6;
    v8 = sub_1DD1C1F48();
    v10 = v9;

    sub_1DD19F9D4(v8, v10);
    v11 = objc_msgSend(a2, sel_thumbnailImageData);
    if (v11)
    {
      v12 = sub_1DD1C1F48();
      v14 = v13;

      v11 = (id)sub_1DD1C1F3C();
      sub_1DD19F9D4(v12, v14);
    }
    objc_msgSend(v56, sel_setThumbnailImageData_, v11);

  }
  else
  {
    v15 = objc_msgSend(a2, sel_imageData);
    if (v15)
    {
      v16 = v15;
      v17 = sub_1DD1C1F48();
      v19 = v18;

      v20 = (void *)sub_1DD1C1F3C();
      objc_msgSend(a2, sel_cropRect);
      v21 = (id)CNImageUtilsCroppedImageDataFromFullSizeImageData();

      v22 = sub_1DD1C1F48();
      v24 = v23;

      v25 = (void *)sub_1DD1C1F3C();
      sub_1DD19F9D4(v22, v24);
      objc_msgSend(v56, sel_setThumbnailImageData_, v25);

      sub_1DD19F9D4(v17, v19);
    }
  }
  v26 = objc_msgSend(a2, sel_wallpaper);

  if (v26)
  {
    v27 = objc_msgSend(a2, sel_wallpaper);
    objc_msgSend(v56, sel_setWallpaper_, v27);

    objc_msgSend(v56, sel_setSharedPhotoDisplayPreference_, 1);
  }
  v28 = objc_msgSend(a2, sel_watchWallpaperImageData);
  if (v28)
  {
    v29 = sub_1DD1C1F48();
    v31 = v30;

    v28 = (id)sub_1DD1C1F3C();
    sub_1DD19F9D4(v29, v31);
  }
  objc_msgSend(v56, sel_setWatchWallpaperImageData_, v28);

  v32 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DDCAF0]), sel_init);
  objc_msgSend(v32, sel_setIncludePhotos_, 1);
  objc_msgSend(v32, sel_setIncludeWallpaper_, 1);
  objc_msgSend(v32, sel_setIncludeNotes_, 1);
  v33 = objc_msgSend(a1, sel_addressingGrammars);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9678);
  v34 = sub_1DD1C2080();

  if (v34 >> 62)
  {
    swift_bridgeObjectRetain();
    v35 = sub_1DD1C21DC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v35 = *(_QWORD *)((v34 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v35)
  {
    v36 = objc_msgSend(a1, sel_addressingGrammars);
    if (!v36)
    {
      sub_1DD1C2080();
      v36 = (id)sub_1DD1C2074();
      swift_bridgeObjectRelease();
    }
    objc_msgSend(v56, sel_setAddressingGrammars_, v36);

    objc_msgSend(v32, sel_setIncludePronouns_, 1);
    objc_msgSend(v32, sel_setUseUnencryptedPronouns_, 1);
  }
  v37 = (void *)objc_opt_self();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9680);
  v38 = swift_allocObject();
  *(_OWORD *)(v38 + 16) = xmmword_1DD1C8FA0;
  *(_QWORD *)(v38 + 32) = v56;
  sub_1DD1C2098();
  sub_1DD1A0658(0, (unint64_t *)&qword_1F03C9688);
  v39 = v56;
  v40 = (void *)sub_1DD1C2074();
  swift_bridgeObjectRelease();
  v57[0] = 0;
  v41 = objc_msgSend(v37, sel_dataWithContacts_options_error_, v40, v32, v57);

  v42 = v57[0];
  if (v41)
  {
    v43 = sub_1DD1C1F48();

  }
  else
  {
    v44 = v42;
    v45 = (void *)sub_1DD1C1EC4();

    swift_willThrow();
    if (qword_1F03C95A0 != -1)
      swift_once();
    v46 = sub_1DD1C1FA8();
    __swift_project_value_buffer(v46, (uint64_t)qword_1F03C95A8);
    v47 = v45;
    v48 = v45;
    v49 = sub_1DD1C1F90();
    v50 = sub_1DD1C20F8();
    if (os_log_type_enabled(v49, v50))
    {
      v51 = (uint8_t *)swift_slowAlloc();
      v52 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v51 = 138412290;
      v53 = v45;
      v54 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v57[0] = v54;
      sub_1DD1C211C();
      *v52 = v54;

      _os_log_impl(&dword_1DD140000, v49, v50, "Could not encode vCard: %@", v51, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9690);
      swift_arrayDestroy();
      MEMORY[0x1DF0D66B8](v52, -1, -1);
      MEMORY[0x1DF0D66B8](v51, -1, -1);

    }
    else
    {

    }
    return 0;
  }
  return v43;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1DF0D6640]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

id static CNUINameDrop.getFieldPreferences()()
{
  return _s14ContactsUICore12CNUINameDropC19getFieldPreferences3forSo9CNContactCAGSg_tFZ_0(0);
}

id sub_1DD195C68()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  unint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  _QWORD *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  os_log_type_t v26;
  uint8_t *v27;
  void *v28;
  id v30[2];

  v30[1] = *(id *)MEMORY[0x1E0C80C00];
  if (qword_1F03C95C0 != -1)
    swift_once();
  v0 = (void *)qword_1F03C95C8;
  if (!qword_1F03C95C8)
    return 0;
  v1 = (void *)sub_1DD1C2020();
  v2 = objc_msgSend(v0, sel_dataForKey_, v1);

  if (!v2)
    return 0;
  v3 = sub_1DD1C1F48();
  v5 = v4;

  v6 = (void *)objc_opt_self();
  v7 = (void *)sub_1DD1C1F3C();
  v30[0] = 0;
  v8 = objc_msgSend(v6, sel_contactsWithData_error_, v7, v30);

  v9 = v30[0];
  if (!v8)
  {
    v14 = v30[0];
    v9 = (id)sub_1DD1C1EC4();

    swift_willThrow();
    if (qword_1F03C95A0 == -1)
    {
LABEL_13:
      v15 = sub_1DD1C1FA8();
      __swift_project_value_buffer(v15, (uint64_t)qword_1F03C95A8);
      v16 = v9;
      v17 = v9;
      v18 = sub_1DD1C1F90();
      v19 = sub_1DD1C20F8();
      if (os_log_type_enabled(v18, v19))
      {
        v20 = (uint8_t *)swift_slowAlloc();
        v21 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v20 = 138412290;
        v22 = v9;
        v23 = (void *)_swift_stdlib_bridgeErrorToNSError();
        v30[0] = v23;
        sub_1DD1C211C();
        *v21 = v23;

        _os_log_impl(&dword_1DD140000, v18, v19, "Could not decode vCard from pref: %@", v20, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9690);
        swift_arrayDestroy();
        MEMORY[0x1DF0D66B8](v21, -1, -1);
        MEMORY[0x1DF0D66B8](v20, -1, -1);
        sub_1DD19F9D4(v3, v5);

        return 0;
      }
      sub_1DD19F9D4(v3, v5);

LABEL_22:
      return 0;
    }
LABEL_27:
    swift_once();
    goto LABEL_13;
  }
  sub_1DD1A0658(0, (unint64_t *)&qword_1F03C9688);
  v10 = sub_1DD1C2080();
  v11 = v9;

  if (!(v10 >> 62))
  {
    if (*(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_8;
LABEL_17:
    swift_bridgeObjectRelease();
    if (qword_1F03C95A0 != -1)
      swift_once();
    v25 = sub_1DD1C1FA8();
    __swift_project_value_buffer(v25, (uint64_t)qword_1F03C95A8);
    v18 = sub_1DD1C1F90();
    v26 = sub_1DD1C20F8();
    if (os_log_type_enabled(v18, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc();
      v28 = (void *)swift_slowAlloc();
      v30[0] = v28;
      *(_DWORD *)v27 = 136315138;
      sub_1DD1AAA14(0xD000000000000010, 0x80000001DD1D0950, (uint64_t *)v30);
      sub_1DD1C211C();
      _os_log_impl(&dword_1DD140000, v18, v26, "Could not turn preference %s into CNContact", v27, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1DF0D66B8](v28, -1, -1);
      MEMORY[0x1DF0D66B8](v27, -1, -1);
    }
    sub_1DD19F9D4(v3, v5);
    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  v24 = sub_1DD1C21DC();
  swift_bridgeObjectRelease();
  if (!v24)
    goto LABEL_17;
LABEL_8:
  if ((v10 & 0xC000000000000001) != 0)
  {
    v12 = (id)MEMORY[0x1DF0D5B0C](0, v10);
    goto LABEL_11;
  }
  if (!*(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    goto LABEL_27;
  }
  v12 = *(id *)(v10 + 32);
LABEL_11:
  v13 = v12;
  swift_bridgeObjectRelease();
  sub_1DD19F9D4(v3, v5);
  return v13;
}

uint64_t sub_1DD19616C()
{
  id v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;

  v0 = objc_allocWithZone(MEMORY[0x1E0C99EA0]);
  v1 = (void *)sub_1DD1C2020();
  v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  if (!v2)
    return 0;
  v3 = (void *)sub_1DD1C2020();
  v4 = objc_msgSend(v2, sel_stringForKey_, v3);

  if (!v4)
  {

    return 0;
  }
  v5 = sub_1DD1C202C();

  return v5;
}

void static CNUINameDrop.saveFieldPreferences(for:)(void *a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  os_log_type_t v29;
  uint8_t *v30;
  _QWORD *v31;
  id v32;
  void *v33;
  id v34[2];

  v34[1] = *(id *)MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DDCAF0]), sel_init);
  -[NSObject setIncludeNotes:](v2, sel_setIncludeNotes_, 1);
  v3 = (void *)objc_opt_self();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9680);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1DD1C8FA0;
  *(_QWORD *)(v4 + 32) = a1;
  sub_1DD1C2098();
  sub_1DD1A0658(0, (unint64_t *)&qword_1F03C9688);
  v5 = a1;
  v6 = (void *)sub_1DD1C2074();
  swift_bridgeObjectRelease();
  v34[0] = 0;
  v7 = objc_msgSend(v3, sel_dataWithContacts_options_error_, v6, v2, v34);

  v8 = v34[0];
  if (v7)
  {
    v9 = sub_1DD1C1F48();
    v11 = v10;

    if (qword_1F03C95C0 != -1)
      swift_once();
    v12 = (void *)qword_1F03C95C8;
    if (qword_1F03C95C8)
    {
      v13 = (void *)sub_1DD1C1F3C();
      v14 = (void *)sub_1DD1C2020();
      objc_msgSend(v12, sel_setObject_forKey_, v13, v14);

    }
    v15 = objc_msgSend(v5, sel_addressingGrammars);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9678);
    v16 = sub_1DD1C2080();

    if (v16 >> 62)
    {
      swift_bridgeObjectRetain();
      v17 = sub_1DD1C21DC();
      swift_bridgeObjectRelease();
    }
    else
    {
      v17 = *(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    v18 = (void *)qword_1F03C95C8;
    if (qword_1F03C95C8)
    {
      v19 = (void *)sub_1DD1C2020();
      objc_msgSend(v18, sel_setBool_forKey_, v17 != 0, v19);

    }
    if (qword_1F03C95A0 != -1)
      swift_once();
    v20 = sub_1DD1C1FA8();
    __swift_project_value_buffer(v20, (uint64_t)qword_1F03C95A8);
    v21 = sub_1DD1C1F90();
    v22 = sub_1DD1C20EC();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_1DD140000, v21, v22, "Saved NameDrop field pref", v23, 2u);
      MEMORY[0x1DF0D66B8](v23, -1, -1);
      sub_1DD19F9D4(v9, v11);

    }
    else
    {

      sub_1DD19F9D4(v9, v11);
    }
  }
  else
  {
    v24 = v8;
    v25 = (void *)sub_1DD1C1EC4();

    swift_willThrow();
    if (qword_1F03C95A0 != -1)
      swift_once();
    v26 = sub_1DD1C1FA8();
    __swift_project_value_buffer(v26, (uint64_t)qword_1F03C95A8);
    v27 = v25;
    v28 = v25;
    v21 = sub_1DD1C1F90();
    v29 = sub_1DD1C20F8();
    if (os_log_type_enabled(v21, v29))
    {
      v30 = (uint8_t *)swift_slowAlloc();
      v31 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v30 = 138412290;
      v32 = v25;
      v33 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v34[0] = v33;
      sub_1DD1C211C();
      *v31 = v33;

      _os_log_impl(&dword_1DD140000, v21, v29, "Failed to save NameDrop field pref: %@", v30, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9690);
      swift_arrayDestroy();
      MEMORY[0x1DF0D66B8](v31, -1, -1);
      MEMORY[0x1DF0D66B8](v30, -1, -1);

      v21 = v2;
    }
    else
    {

    }
  }

}

void static CNUINameDrop.fieldSummary(contact:)(void *a1@<X0>, _QWORD *a2@<X8>)
{
  char **v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char **v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  _QWORD *v21;
  id v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  unint64_t v26;
  unint64_t v27;
  char *v28;
  id v29;
  unint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  unint64_t v33;
  unint64_t v34;
  _QWORD *v35;
  id v36;
  unint64_t v37;
  uint64_t v38;
  id v39;
  unint64_t v40;
  _QWORD *v41;
  int64_t v42;
  unint64_t v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  unint64_t v54;
  unint64_t i;
  char v56;
  _QWORD *v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  char v61;
  _QWORD *v62;
  unint64_t v63;
  unint64_t v64;
  id v65;
  id v66;
  void *v67;
  uint64_t v68;
  id v69;
  unint64_t v70;
  uint64_t v71;
  _QWORD *v72;
  unint64_t v73;
  unint64_t v74;
  _QWORD *v75;
  int v76;
  id v77;
  unint64_t v78;
  uint64_t v79;
  id v80;
  unint64_t v81;
  uint64_t v82;
  _QWORD *v83;
  unint64_t v84;
  unint64_t v85;
  _QWORD *v86;
  id v87;
  unint64_t v88;
  uint64_t v89;
  _QWORD *v90;
  unint64_t v91;
  unint64_t v92;
  _QWORD *v93;
  id v94;
  unint64_t v95;
  uint64_t v96;
  _QWORD *v97;
  uint64_t v98;
  unint64_t v99;
  unint64_t v100;
  unint64_t v101;
  uint64_t v102;
  id v103;
  unint64_t v104;
  uint64_t v105;
  id v106;
  unint64_t v107;
  uint64_t v108;
  id v109;
  _QWORD *v110;
  id v111;
  void *v112;
  id v113;
  id v114;
  id v115;
  unint64_t v116;
  uint64_t v117;
  id v118;
  unint64_t v119;
  unint64_t v120;
  id v121;
  unint64_t v122;
  uint64_t v123;
  id v124;
  unint64_t v125;
  uint64_t v126;
  BOOL v127;
  uint64_t v128;
  uint64_t v129;
  void (*v130)(char *, uint64_t);
  uint64_t v131;
  id v132;
  void *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  void (*v141)(char *, uint64_t);
  uint64_t v142;
  id v143;
  unint64_t v144;
  uint64_t v145;
  id v146;
  unint64_t v147;
  uint64_t v148;
  id v149;
  unint64_t v150;
  id v151;
  void *v152;
  id v153;
  void *v154;
  unsigned int v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  _QWORD *v160;
  uint64_t v161;
  uint64_t v162;
  id v163;
  id v164;
  unint64_t v165;
  void *v166;
  int v167;
  void *v168;
  unsigned __int8 v169;
  void *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  _QWORD *v175;
  uint64_t v176;
  uint64_t v177;
  id v178;
  void *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  void (*v184)(char *, uint64_t);
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  id v188;
  void *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  id v195;
  unint64_t v196;
  uint64_t v197;
  id v198;
  uint64_t v199;
  void *v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  _QWORD *v212;
  uint64_t v213;
  uint64_t v214;
  id v215;
  void *v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  id v225;
  void *v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  id v233;
  void *v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  unint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  unint64_t v247;
  uint64_t v248;
  _QWORD *v249;
  id v250;
  uint64_t v251;
  uint64_t v252;
  unint64_t v253;
  void (*v254)(char *, uint64_t);
  uint64_t v255;
  uint64_t v256;
  _QWORD *v257;

  v4 = (char **)sub_1DD1C1E94();
  v5 = (uint64_t)*(v4 - 1);
  MEMORY[0x1E0C80A78]();
  v251 = (uint64_t)&v243 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9698);
  MEMORY[0x1E0C80A78]();
  v8 = (char **)((char *)&v243 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = sub_1DD1C2014();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78]();
  v12 = (char *)&v243 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x1E0DEE9D8];
  v257 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  sub_1DD1C1FCC();
  v252 = sub_1DD19839C((uint64_t)v12, v13);
  v253 = v14;
  v254 = *(void (**)(char *, uint64_t))(v10 + 8);
  v255 = v9;
  v254(v12, v9);
  v15 = objc_msgSend(a1, sel_phoneNumbers);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9678);
  v16 = sub_1DD1C2080();

  if (v16 >> 62)
  {
    swift_bridgeObjectRetain();
    v17 = sub_1DD1C21DC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v17 = *(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v17)
  {
    v18 = v257;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v18 = sub_1DD19F8C8(0, v18[2] + 1, 1, v18);
    v20 = v18[2];
    v19 = v18[3];
    if (v20 >= v19 >> 1)
      v18 = sub_1DD19F8C8((_QWORD *)(v19 > 1), v20 + 1, 1, v18);
    v18[2] = v20 + 1;
    v21 = &v18[2 * v20];
    v21[4] = 0x69662E656E6F6870;
    v21[5] = 0xEA00000000006C6CLL;
    v257 = v18;
  }
  v22 = objc_msgSend(a1, sel_emailAddresses);
  v23 = sub_1DD1C2080();

  if (v23 >> 62)
  {
    swift_bridgeObjectRetain();
    v24 = sub_1DD1C21DC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v24 = *(_QWORD *)((v23 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v24)
  {
    v25 = v257;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v25 = sub_1DD19F8C8(0, v25[2] + 1, 1, v25);
    v27 = v25[2];
    v26 = v25[3];
    if (v27 >= v26 >> 1)
      v25 = sub_1DD19F8C8((_QWORD *)(v26 > 1), v27 + 1, 1, v25);
    v25[2] = v27 + 1;
    v28 = (char *)&v25[2 * v27];
    strcpy(v28 + 32, "envelope.fill");
    *((_WORD *)v28 + 23) = -4864;
    v257 = v25;
  }
  v29 = objc_msgSend(a1, sel_urlAddresses);
  v30 = sub_1DD1C2080();

  if (v30 >> 62)
  {
    swift_bridgeObjectRetain();
    v31 = sub_1DD1C21DC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v31 = *(_QWORD *)((v30 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v31)
  {
    v32 = v257;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v32 = sub_1DD19F8C8(0, v32[2] + 1, 1, v32);
    v34 = v32[2];
    v33 = v32[3];
    if (v34 >= v33 >> 1)
      v32 = sub_1DD19F8C8((_QWORD *)(v33 > 1), v34 + 1, 1, v32);
    v32[2] = v34 + 1;
    v35 = &v32[2 * v34];
    v35[4] = 0x662E697261666173;
    v35[5] = 0xEB000000006C6C69;
    v257 = v32;
  }
  v36 = objc_msgSend(a1, sel_postalAddresses);
  v37 = sub_1DD1C2080();

  if (v37 >> 62)
  {
    swift_bridgeObjectRetain();
    v38 = sub_1DD1C21DC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v38 = *(_QWORD *)((v37 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (!v38)
    goto LABEL_60;
  v39 = objc_msgSend(a1, sel_postalAddresses);
  v40 = sub_1DD1C2080();

  if (!(v40 >> 62))
  {
    v42 = *(_QWORD *)((v40 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v42)
      goto LABEL_30;
LABEL_59:
    swift_bridgeObjectRelease();
    goto LABEL_60;
  }
  swift_bridgeObjectRetain();
  v42 = sub_1DD1C21DC();
  swift_bridgeObjectRelease();
  if (!v42)
    goto LABEL_59;
LABEL_30:
  if ((v40 & 0xC000000000000001) != 0)
  {
    v44 = (id)MEMORY[0x1DF0D5B0C](0, v40);
  }
  else
  {
    v43 = *(_QWORD *)((v40 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v43)
    {
      __break(1u);
      goto LABEL_138;
    }
    v44 = *(id *)(v40 + 32);
  }
  v45 = v44;
  swift_bridgeObjectRelease();
  v250 = v45;
  v46 = objc_msgSend(v45, sel_label);
  if (!v46)
  {
    sub_1DD1C202C();
LABEL_40:
    swift_bridgeObjectRelease();
    sub_1DD1C202C();
    swift_bridgeObjectRelease();
    goto LABEL_41;
  }
  v47 = v46;
  v249 = a2;
  v48 = sub_1DD1C202C();
  v50 = v49;

  v51 = sub_1DD1C202C();
  if (!v50)
  {
    a2 = v249;
    goto LABEL_40;
  }
  if (v51 == v48 && v50 == v52)
  {
    swift_bridgeObjectRelease();
LABEL_44:
    swift_bridgeObjectRelease();
    sub_1DD19F840();
    v57 = v257;
    v59 = v257[2];
    v58 = v257[3];
    if (v59 >= v58 >> 1)
    {
      v57 = sub_1DD19F8C8((_QWORD *)(v58 > 1), v59 + 1, 1, v257);
      v257 = v57;
    }
    a2 = v249;
    v57[2] = v59 + 1;
    v53 = &v57[2 * v59];
    v54 = 0x69662E6573756F68;
    i = 0xEA00000000006C6CLL;
    goto LABEL_47;
  }
  v56 = sub_1DD1C21F4();
  swift_bridgeObjectRelease();
  if ((v56 & 1) != 0)
    goto LABEL_44;
  if (sub_1DD1C202C() == v48 && v50 == v60)
  {
    swift_bridgeObjectRelease_n();
    a2 = v249;
    goto LABEL_52;
  }
  v61 = sub_1DD1C21F4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  a2 = v249;
  if ((v61 & 1) != 0)
  {
LABEL_52:
    sub_1DD19F840();
    v62 = v257;
    v64 = v257[2];
    v63 = v257[3];
    v65 = (id)(v64 + 1);
    if (v64 >= v63 >> 1)
      goto LABEL_143;
    goto LABEL_53;
  }
LABEL_41:
  sub_1DD19F840();
  v41 = v257;
  v40 = v257[2];
  v43 = v257[3];
  v42 = v40 + 1;
  if (v40 >= v43 >> 1)
  {
LABEL_138:
    v41 = sub_1DD19F8C8((_QWORD *)(v43 > 1), v42, 1, v41);
    v257 = v41;
  }
  v41[2] = v42;
  v53 = &v41[2 * v40];
  v54 = 0xD00000000000001ALL;
  for (i = 0x80000001DD1D0990; ; i = 0xEF6C6C69662E322ELL)
  {
LABEL_47:
    v53[4] = v54;
    v53[5] = i;

LABEL_60:
    v66 = objc_msgSend(a1, sel_birthday);
    if (v66)
    {
      v67 = v66;
      v68 = v251;
      sub_1DD1C1E88();

      (*(void (**)(char **, uint64_t, char **))(v5 + 32))(v8, v68, v4);
      (*(void (**)(char **, _QWORD, uint64_t, char **))(v5 + 56))(v8, 0, 1, v4);
      if ((*(unsigned int (**)(char **, uint64_t, char **))(v5 + 48))(v8, 1, v4) != 1)
      {
        sub_1DD1A0740((uint64_t)v8, &qword_1F03C9698);
        v5 = v255;
        goto LABEL_65;
      }
    }
    else
    {
      (*(void (**)(char **, uint64_t, uint64_t, char **))(v5 + 56))(v8, 1, 1, v4);
    }
    sub_1DD1A0740((uint64_t)v8, &qword_1F03C9698);
    v69 = objc_msgSend(a1, sel_dates);
    v70 = sub_1DD1C2080();

    v71 = sub_1DD1985CC(v70);
    swift_bridgeObjectRelease();
    v5 = v255;
    if (!v71)
    {
      v76 = 0;
      goto LABEL_69;
    }
LABEL_65:
    sub_1DD19F840();
    v72 = v257;
    v74 = v257[2];
    v73 = v257[3];
    if (v74 >= v73 >> 1)
    {
      v72 = sub_1DD19F8C8((_QWORD *)(v73 > 1), v74 + 1, 1, v257);
      v257 = v72;
    }
    v72[2] = v74 + 1;
    v75 = &v72[2 * v74];
    v75[4] = 0x7261646E656C6163;
    v75[5] = 0xE800000000000000;
    v76 = 1;
LABEL_69:
    v77 = objc_msgSend(a1, sel_contactRelations);
    v78 = sub_1DD1C2080();

    v79 = sub_1DD1985CC(v78);
    swift_bridgeObjectRelease();
    if (v79
      || (v80 = objc_msgSend(a1, sel_socialProfiles),
          v81 = sub_1DD1C2080(),
          v80,
          v82 = sub_1DD1985CC(v81),
          swift_bridgeObjectRelease(),
          v82))
    {
      sub_1DD19F840();
      v83 = v257;
      v85 = v257[2];
      v84 = v257[3];
      if (v85 >= v84 >> 1)
      {
        v83 = sub_1DD19F8C8((_QWORD *)(v84 > 1), v85 + 1, 1, v257);
        v257 = v83;
      }
      v83[2] = v85 + 1;
      v86 = &v83[2 * v85];
      v86[4] = 0x662E6E6F73726570;
      v86[5] = 0xEB000000006C6C69;
    }
    v87 = objc_msgSend(a1, sel_instantMessageAddresses);
    v88 = sub_1DD1C2080();

    v89 = sub_1DD1985CC(v88);
    swift_bridgeObjectRelease();
    if (v89)
    {
      sub_1DD19F840();
      v90 = v257;
      v92 = v257[2];
      v91 = v257[3];
      if (v92 >= v91 >> 1)
      {
        v90 = sub_1DD19F8C8((_QWORD *)(v91 > 1), v92 + 1, 1, v257);
        v257 = v90;
      }
      v90[2] = v92 + 1;
      v93 = &v90[2 * v92];
      v93[4] = 0xD000000000000010;
      v93[5] = 0x80000001DD1D09B0;
    }
    v94 = objc_msgSend(a1, sel_termsOfAddress);
    sub_1DD1A0658(0, (unint64_t *)&unk_1F03C96A0);
    v95 = sub_1DD1C2080();

    v96 = sub_1DD1985CC(v95);
    swift_bridgeObjectRelease();
    v97 = v257;
    if (v96)
    {
      sub_1DD1C1FCC();
      v98 = sub_1DD19839C((uint64_t)v12, MEMORY[0x1E0DEE9D8]);
      v100 = v99;
      goto LABEL_80;
    }
    if (v257[2] != 1)
      goto LABEL_103;
    LODWORD(v250) = v76;
    v4 = &selRef_lookupOptions;
    v103 = objc_msgSend(a1, sel_phoneNumbers);
    v104 = sub_1DD1C2080();

    v105 = sub_1DD1985CC(v104);
    swift_bridgeObjectRelease();
    if (v105)
    {
      v106 = objc_msgSend(a1, sel_phoneNumbers);
      v107 = sub_1DD1C2080();

      v108 = sub_1DD1985CC(v107);
      swift_bridgeObjectRelease();
      if (v108 != 1)
        goto LABEL_101;
      v109 = objc_msgSend(a1, sel_phoneNumbers);
      v64 = sub_1DD1C2080();

      if (sub_1DD1985CC(v64))
      {
        if ((v64 & 0xC000000000000001) != 0)
        {
          v110 = a2;
          v111 = (id)MEMORY[0x1DF0D5B0C](0, v64);
LABEL_90:
          v112 = v111;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v113 = objc_msgSend(v112, sel_value);
          v114 = objc_msgSend(v113, sel_formattedStringValue);

          if (v114)
            goto LABEL_100;
          v163 = objc_msgSend(v112, sel_value);
          v164 = objc_msgSend(v163, sel_stringValue);

          v98 = sub_1DD1C202C();
          v100 = v165;

        }
        else
        {
          if (*(_QWORD *)((v64 & 0xFFFFFFFFFFFFF8) + 0x10))
          {
            v110 = a2;
            v111 = *(id *)(v64 + 32);
            goto LABEL_90;
          }
          __break(1u);
LABEL_141:
          v110 = a2;
          v118 = (id)MEMORY[0x1DF0D5B0C](0, v64);
LABEL_99:
          v112 = v118;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v114 = objc_msgSend(v112, sel_value);
LABEL_100:
          v98 = sub_1DD1C202C();
          v100 = v119;

        }
        v102 = 0;
        v101 = 0xE000000000000000;
        v97 = (_QWORD *)MEMORY[0x1E0DEE9D8];
        a2 = v110;
LABEL_82:
        *a2 = v97;
        a2[1] = v98;
        a2[2] = v100;
        a2[3] = v102;
        a2[4] = v101;
        return;
      }
      swift_bridgeObjectRelease();
    }
    v8 = &selRef_defaultProvider;
    v115 = objc_msgSend(a1, sel_emailAddresses);
    v116 = sub_1DD1C2080();

    v117 = sub_1DD1985CC(v116);
    swift_bridgeObjectRelease();
    if (v117 != 1)
    {
LABEL_101:
      swift_bridgeObjectRelease();
      sub_1DD1C1FCC();
      v97 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      v98 = sub_1DD19839C((uint64_t)v12, MEMORY[0x1E0DEE9D8]);
      v100 = v120;
LABEL_80:
      swift_bridgeObjectRelease();
      v254(v12, v5);
LABEL_81:
      v102 = v252;
      v101 = v253;
      goto LABEL_82;
    }
    v65 = objc_msgSend(a1, sel_emailAddresses);
    v64 = sub_1DD1C2080();

    if (!sub_1DD1985CC(v64))
      break;
    if ((v64 & 0xC000000000000001) != 0)
      goto LABEL_141;
    v63 = *(_QWORD *)((v64 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v63)
    {
      v110 = a2;
      v118 = *(id *)(v64 + 32);
      goto LABEL_99;
    }
    __break(1u);
LABEL_143:
    v62 = sub_1DD19F8C8((_QWORD *)(v63 > 1), (int64_t)v65, 1, v62);
    v257 = v62;
LABEL_53:
    v62[2] = v65;
    v53 = &v62[2 * v64];
    v54 = 0x676E69646C697562;
  }
  swift_bridgeObjectRelease();
  v76 = (int)v250;
LABEL_103:
  v121 = objc_msgSend(a1, sel_contactRelations);
  v122 = sub_1DD1C2080();

  v123 = sub_1DD1985CC(v122);
  swift_bridgeObjectRelease();
  if (v123)
  {
    v124 = objc_msgSend(a1, sel_socialProfiles);
    v125 = sub_1DD1C2080();

    v126 = sub_1DD1985CC(v125);
    swift_bridgeObjectRelease();
    v127 = v126 != 0;
  }
  else
  {
    v127 = 0;
  }
  v98 = 0;
  v100 = 0xE000000000000000;
  if (v97[2] != 2 || v127)
    goto LABEL_81;
  LODWORD(v250) = v76;
  v249 = a2;
  v247 = 0xD000000000000017;
  sub_1DD1C1FCC();
  v128 = MEMORY[0x1E0DEE9D8];
  v245 = sub_1DD19839C((uint64_t)v12, MEMORY[0x1E0DEE9D8]);
  v246 = v129;
  swift_bridgeObjectRelease();
  v130 = v254;
  v254(v12, v5);
  v131 = swift_allocObject();
  *(_QWORD *)(v131 + 16) = v128;
  v248 = v131 + 16;
  v132 = objc_msgSend(a1, sel_phoneNumbers);
  if (!v132)
    goto LABEL_146;
  v133 = v132;
  sub_1DD1C1FCC();
  v251 = sub_1DD19839C((uint64_t)v12, v128);
  v135 = v134;
  swift_bridgeObjectRelease();
  v130(v12, v5);
  sub_1DD1C1FCC();
  v136 = v5;
  v137 = sub_1DD19839C((uint64_t)v12, v128);
  v139 = v138;
  swift_bridgeObjectRelease();
  v140 = v136;
  v141 = v254;
  v254(v12, v140);
  v142 = v251;
  v251 = v131;
  sub_1DD198628(v133, v142, v135, v137, v139, v131);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v143 = objc_msgSend(a1, sel_emailAddresses);
  v144 = sub_1DD1C2080();

  v145 = sub_1DD1985CC(v144);
  swift_bridgeObjectRelease();
  if (!v145)
    goto LABEL_125;
  v146 = objc_msgSend(a1, sel_emailAddresses);
  v147 = sub_1DD1C2080();

  v148 = sub_1DD1985CC(v147);
  swift_bridgeObjectRelease();
  if (v148 != 1)
  {
    sub_1DD1C1FCC();
    v156 = sub_1DD19839C((uint64_t)v12, MEMORY[0x1E0DEE9D8]);
    v158 = v157;
    swift_bridgeObjectRelease();
    v141(v12, v255);
    v159 = v248;
    swift_beginAccess();
    sub_1DD19F840();
    v160 = *(_QWORD **)(*(_QWORD *)v159 + 16);
    sub_1DD19F888(v160);
    v161 = *(_QWORD *)v159;
    *(_QWORD *)(v161 + 16) = (char *)v160 + 1;
    v162 = v161 + 16 * (_QWORD)v160;
    *(_QWORD *)(v162 + 32) = v156;
    *(_QWORD *)(v162 + 40) = v158;
    swift_endAccess();
    goto LABEL_125;
  }
  v149 = objc_msgSend(a1, sel_emailAddresses);
  v150 = sub_1DD1C2080();

  if (!sub_1DD1985CC(v150))
  {
    swift_bridgeObjectRelease();
    goto LABEL_125;
  }
  if ((v150 & 0xC000000000000001) != 0)
  {
    v151 = (id)MEMORY[0x1DF0D5B0C](0, v150);
    goto LABEL_115;
  }
  if (!*(_QWORD *)((v150 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
LABEL_146:
    __break(1u);
LABEL_147:
    __break(1u);
    goto LABEL_148;
  }
  v151 = *(id *)(v150 + 32);
LABEL_115:
  v152 = v151;
  swift_bridgeObjectRelease();
  v153 = objc_msgSend(v152, sel_value);
  v154 = (void *)sub_1DD1C2020();
  v155 = objc_msgSend(v153, sel_hasSuffix_, v154);

  if (!v155)
  {
    v166 = (void *)sub_1DD1C2020();
    v167 = objc_msgSend(v153, sel_hasSuffix_, v166);

    if ((v167 & 1) == 0)
    {
      v168 = (void *)sub_1DD1C2020();
      v169 = objc_msgSend(v153, sel_hasSuffix_, v168);

      if ((v169 & 1) == 0)
      {
        v170 = (void *)sub_1DD1C2020();
        objc_msgSend(v153, sel_hasSuffix_, v170);

      }
    }
  }
  sub_1DD1C1FCC();
  v171 = sub_1DD19839C((uint64_t)v12, MEMORY[0x1E0DEE9D8]);
  v173 = v172;
  swift_bridgeObjectRelease();
  v141(v12, v255);
  v174 = v248;
  swift_beginAccess();
  sub_1DD19F840();
  v175 = *(_QWORD **)(*(_QWORD *)v174 + 16);
  sub_1DD19F888(v175);
  v176 = *(_QWORD *)v174;
  *(_QWORD *)(v176 + 16) = (char *)v175 + 1;
  v177 = v176 + 16 * (_QWORD)v175;
  *(_QWORD *)(v177 + 32) = v171;
  *(_QWORD *)(v177 + 40) = v173;
  swift_endAccess();

LABEL_125:
  v178 = objc_msgSend(a1, sel_urlAddresses);
  if (!v178)
    goto LABEL_147;
  v179 = v178;
  sub_1DD1C1FCC();
  v180 = MEMORY[0x1E0DEE9D8];
  v244 = sub_1DD19839C((uint64_t)v12, MEMORY[0x1E0DEE9D8]);
  v182 = v181;
  swift_bridgeObjectRelease();
  v184 = v254;
  v183 = v255;
  v254(v12, v255);
  sub_1DD1C1FCC();
  v185 = sub_1DD19839C((uint64_t)v12, v180);
  v187 = v186;
  swift_bridgeObjectRelease();
  v184(v12, v183);
  sub_1DD198628(v179, v244, v182, v185, v187, v251);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v188 = objc_msgSend(a1, sel_postalAddresses);
  if (!v188)
  {
LABEL_148:
    __break(1u);
    goto LABEL_149;
  }
  v189 = v188;
  sub_1DD1C1FCC();
  v244 = sub_1DD19839C((uint64_t)v12, v180);
  v191 = v190;
  swift_bridgeObjectRelease();
  v184(v12, v183);
  sub_1DD1C1FCC();
  v192 = sub_1DD19839C((uint64_t)v12, v180);
  v194 = v193;
  swift_bridgeObjectRelease();
  v184(v12, v183);
  sub_1DD198628(v189, v244, v191, v192, v194, v251);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v250 & 1) == 0)
    goto LABEL_132;
  v195 = objc_msgSend(a1, sel_dates);
  v196 = sub_1DD1C2080();

  v197 = sub_1DD1985CC(v196);
  swift_bridgeObjectRelease();
  if (!v197)
  {
    sub_1DD1C1FCC();
    v208 = sub_1DD19839C((uint64_t)v12, MEMORY[0x1E0DEE9D8]);
    v210 = v209;
    swift_bridgeObjectRelease();
    v184(v12, v255);
    v211 = v248;
    swift_beginAccess();
    sub_1DD19F840();
    v212 = *(_QWORD **)(*(_QWORD *)v211 + 16);
    sub_1DD19F888(v212);
    v213 = *(_QWORD *)v211;
    *(_QWORD *)(v213 + 16) = (char *)v212 + 1;
    v214 = v213 + 16 * (_QWORD)v212;
    *(_QWORD *)(v214 + 32) = v208;
    *(_QWORD *)(v214 + 40) = v210;
    swift_endAccess();
LABEL_132:
    v215 = objc_msgSend(a1, sel_socialProfiles);
    if (v215)
    {
      v216 = v215;
      sub_1DD1C1FCC();
      v217 = MEMORY[0x1E0DEE9D8];
      v218 = sub_1DD19839C((uint64_t)v12, MEMORY[0x1E0DEE9D8]);
      v220 = v219;
      swift_bridgeObjectRelease();
      v221 = v255;
      v184(v12, v255);
      sub_1DD1C1FCC();
      v222 = sub_1DD19839C((uint64_t)v12, v217);
      v224 = v223;
      swift_bridgeObjectRelease();
      v184(v12, v221);
      sub_1DD198628(v216, v218, v220, v222, v224, v251);

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v225 = objc_msgSend(a1, sel_contactRelations);
      if (v225)
      {
        v226 = v225;
        sub_1DD1C1FCC();
        v227 = sub_1DD19839C((uint64_t)v12, v217);
        v229 = v228;
        swift_bridgeObjectRelease();
        v184(v12, v221);
        sub_1DD1C1FCC();
        v230 = sub_1DD19839C((uint64_t)v12, v217);
        v232 = v231;
        swift_bridgeObjectRelease();
        v184(v12, v221);
        sub_1DD198628(v226, v227, v229, v230, v232, v251);

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v233 = objc_msgSend(a1, sel_instantMessageAddresses);
        if (v233)
        {
          v234 = v233;
          swift_bridgeObjectRelease();
          sub_1DD1C1FCC();
          v97 = (_QWORD *)MEMORY[0x1E0DEE9D8];
          v235 = sub_1DD19839C((uint64_t)v12, MEMORY[0x1E0DEE9D8]);
          v237 = v236;
          swift_bridgeObjectRelease();
          v184(v12, v221);
          sub_1DD1C1FCC();
          v238 = sub_1DD19839C((uint64_t)v12, (uint64_t)v97);
          v240 = v239;
          swift_bridgeObjectRelease();
          v184(v12, v221);
          v241 = v251;
          sub_1DD198628(v234, v235, v237, v238, v240, v251);

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_beginAccess();
          v256 = *(_QWORD *)(v241 + 16);
          swift_bridgeObjectRetain();
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F03C9CF0);
          sub_1DD1A0340();
          v98 = sub_1DD1C1FB4();
          v100 = v242;
          swift_release();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          a2 = v249;
          goto LABEL_81;
        }
        goto LABEL_151;
      }
LABEL_150:
      __break(1u);
LABEL_151:
      __break(1u);
      goto LABEL_152;
    }
LABEL_149:
    __break(1u);
    goto LABEL_150;
  }
  v198 = objc_msgSend(a1, sel_dates);
  v199 = v255;
  if (v198)
  {
    v200 = v198;
    sub_1DD1C1FCC();
    v201 = MEMORY[0x1E0DEE9D8];
    v202 = sub_1DD19839C((uint64_t)v12, MEMORY[0x1E0DEE9D8]);
    v204 = v203;
    swift_bridgeObjectRelease();
    v184(v12, v199);
    sub_1DD1C1FCC();
    v205 = sub_1DD19839C((uint64_t)v12, v201);
    v207 = v206;
    swift_bridgeObjectRelease();
    v184(v12, v199);
    sub_1DD198628(v200, v202, v204, v205, v207, v251);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_132;
  }
LABEL_152:
  __break(1u);
}

uint64_t sub_1DD19839C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t ObjCClassFromMetadata;
  id v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD v20[3];
  __int128 v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;

  sub_1DD1C1F84();
  MEMORY[0x1E0C80A78]();
  sub_1DD1C2014();
  MEMORY[0x1E0C80A78]();
  (*(void (**)(char *, uint64_t))(v5 + 16))((char *)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  type metadata accessor for CNUINameDrop();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v7 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_1DD1C1F78();
  v8 = sub_1DD1C2044();
  v10 = *(_QWORD *)(a2 + 16);
  if (v10)
  {
    v20[1] = v8;
    v20[2] = v9;
    v24 = MEMORY[0x1E0DEE9D8];
    sub_1DD1B0268(0, v10, 0);
    v11 = v24;
    v12 = (unint64_t *)(a2 + 40);
    v13 = MEMORY[0x1E0DEA968];
    do
    {
      if (*v12)
      {
        v14 = *(v12 - 1);
        v15 = *v12;
      }
      else
      {
        v14 = 0;
        v15 = 0xE000000000000000;
      }
      v24 = v11;
      v17 = *(_QWORD *)(v11 + 16);
      v16 = *(_QWORD *)(v11 + 24);
      swift_bridgeObjectRetain();
      if (v17 >= v16 >> 1)
      {
        sub_1DD1B0268(v16 > 1, v17 + 1, 1);
        v11 = v24;
      }
      v22 = v13;
      v23 = sub_1DD1A056C();
      *(_QWORD *)&v21 = v14;
      *((_QWORD *)&v21 + 1) = v15;
      *(_QWORD *)(v11 + 16) = v17 + 1;
      sub_1DD1A05B0(&v21, v11 + 40 * v17 + 32);
      v12 += 2;
      --v10;
    }
    while (v10);
  }
  v18 = sub_1DD1C2038();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v18;
}

uint64_t sub_1DD1985CC(unint64_t a1)
{
  uint64_t v2;

  if (!(a1 >> 62))
    return *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  v2 = sub_1DD1C21DC();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_1DD198628(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t result;
  _QWORD **v13;
  uint64_t v14;
  _QWORD *v15;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;

  result = (uint64_t)objc_msgSend(a1, sel_count);
  if (result >= 1)
  {
    v13 = (_QWORD **)(a6 + 16);
    if (objc_msgSend(a1, sel_count) == (id)1)
    {
      a5 = a3;
      v14 = a2;
    }
    else
    {
      v14 = a4;
    }
    swift_bridgeObjectRetain();
    swift_beginAccess();
    v15 = *v13;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v13 = v15;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v15 = sub_1DD19F8C8(0, v15[2] + 1, 1, v15);
      *v13 = v15;
    }
    v18 = v15[2];
    v17 = v15[3];
    if (v18 >= v17 >> 1)
    {
      v15 = sub_1DD19F8C8((_QWORD *)(v17 > 1), v18 + 1, 1, v15);
      *v13 = v15;
    }
    v15[2] = v18 + 1;
    v19 = &v15[2 * v18];
    v19[4] = v14;
    v19[5] = a5;
    return swift_endAccess();
  }
  return result;
}

id CNUINameDrop.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id CNUINameDrop.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CNUINameDrop();
  return objc_msgSendSuper2(&v2, sel_init);
}

id CNUINameDrop.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CNUINameDrop();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_1DD198804()
{
  qword_1F03C9570 = 0x706F7244656D614ELL;
  *(_QWORD *)algn_1F03C9578 = 0xE800000000000000;
}

uint64_t sub_1DD198828()
{
  uint64_t v0;

  v0 = sub_1DD1C1FA8();
  __swift_allocate_value_buffer(v0, qword_1F03C9588);
  __swift_project_value_buffer(v0, (uint64_t)qword_1F03C9588);
  if (qword_1F03C9568 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  return sub_1DD1C1F9C();
}

uint64_t sub_1DD1988D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_1DD1C1FA8();
  __swift_allocate_value_buffer(v0, qword_1F03C95A8);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1F03C95A8);
  if (qword_1F03C9580 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_1F03C9588);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

void sub_1DD198980()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x1E0C99EA0]);
  v1 = (void *)sub_1DD1C2020();
  v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  qword_1F03C95C8 = (uint64_t)v2;
}

uint64_t sub_1DD1989EC()
{
  uint64_t v0;
  uint64_t v1;
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
  uint64_t v23;
  uint64_t result;
  uint64_t v25;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F03C9D00);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1DD1C8FB0;
  *(_QWORD *)(v0 + 32) = sub_1DD1C202C();
  *(_QWORD *)(v0 + 40) = v1;
  *(_QWORD *)(v0 + 48) = sub_1DD1C202C();
  *(_QWORD *)(v0 + 56) = v2;
  *(_QWORD *)(v0 + 64) = sub_1DD1C202C();
  *(_QWORD *)(v0 + 72) = v3;
  *(_QWORD *)(v0 + 80) = sub_1DD1C202C();
  *(_QWORD *)(v0 + 88) = v4;
  *(_QWORD *)(v0 + 96) = sub_1DD1C202C();
  *(_QWORD *)(v0 + 104) = v5;
  *(_QWORD *)(v0 + 112) = sub_1DD1C202C();
  *(_QWORD *)(v0 + 120) = v6;
  *(_QWORD *)(v0 + 128) = sub_1DD1C202C();
  *(_QWORD *)(v0 + 136) = v7;
  *(_QWORD *)(v0 + 144) = sub_1DD1C202C();
  *(_QWORD *)(v0 + 152) = v8;
  *(_QWORD *)(v0 + 160) = sub_1DD1C202C();
  *(_QWORD *)(v0 + 168) = v9;
  *(_QWORD *)(v0 + 176) = sub_1DD1C202C();
  *(_QWORD *)(v0 + 184) = v10;
  *(_QWORD *)(v0 + 192) = sub_1DD1C202C();
  *(_QWORD *)(v0 + 200) = v11;
  *(_QWORD *)(v0 + 208) = sub_1DD1C202C();
  *(_QWORD *)(v0 + 216) = v12;
  *(_QWORD *)(v0 + 224) = sub_1DD1C202C();
  *(_QWORD *)(v0 + 232) = v13;
  *(_QWORD *)(v0 + 240) = sub_1DD1C202C();
  *(_QWORD *)(v0 + 248) = v14;
  *(_QWORD *)(v0 + 256) = sub_1DD1C202C();
  *(_QWORD *)(v0 + 264) = v15;
  *(_QWORD *)(v0 + 272) = sub_1DD1C202C();
  *(_QWORD *)(v0 + 280) = v16;
  *(_QWORD *)(v0 + 288) = sub_1DD1C202C();
  *(_QWORD *)(v0 + 296) = v17;
  *(_QWORD *)(v0 + 304) = sub_1DD1C202C();
  *(_QWORD *)(v0 + 312) = v18;
  *(_QWORD *)(v0 + 320) = sub_1DD1C202C();
  *(_QWORD *)(v0 + 328) = v19;
  *(_QWORD *)(v0 + 336) = sub_1DD1C202C();
  *(_QWORD *)(v0 + 344) = v20;
  *(_QWORD *)(v0 + 352) = sub_1DD1C202C();
  *(_QWORD *)(v0 + 360) = v21;
  *(_QWORD *)(v0 + 368) = sub_1DD1C202C();
  *(_QWORD *)(v0 + 376) = v22;
  *(_QWORD *)(v0 + 384) = sub_1DD1C202C();
  *(_QWORD *)(v0 + 392) = v23;
  result = sub_1DD1C202C();
  *(_QWORD *)(v0 + 400) = result;
  *(_QWORD *)(v0 + 408) = v25;
  off_1F03C95D8 = (_UNKNOWN *)v0;
  return result;
}

uint64_t sub_1DD198C14(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[32];

  v36 = a3;
  v5 = sub_1DD1C1F0C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78]();
  v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (void *)sub_1DD1C2020();
  v10 = objc_msgSend(a4, sel_isKeyAvailable_, v9);

  if (!v10)
    return 0;
  v11 = (void *)sub_1DD1C2020();
  v12 = objc_msgSend(a4, sel_valueForKey_, v11);

  v35 = v6;
  if (v12)
  {
    sub_1DD1C2140();
    swift_unknownObjectRelease();
  }
  else
  {
    v38 = 0u;
    v39 = 0u;
  }
  sub_1DD1A06B0((uint64_t)&v38, (uint64_t)v40);
  sub_1DD1A06F8((uint64_t)v40, (uint64_t)&v38);
  if (*((_QWORD *)&v39 + 1))
  {
    sub_1DD1A0658(0, &qword_1F03C97D0);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v33 = v37;
      v34 = v5;
      sub_1DD1C2104();
      sub_1DD1C1F00();
      while (*((_QWORD *)&v39 + 1))
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9678);
        if ((swift_dynamicCast() & 1) != 0)
        {
          v13 = v37;
          v14 = objc_msgSend(v36, sel_value);
          v15 = objc_msgSend(v13, sel_value);
          v16 = v14;
          v17 = v15;
          v18 = objc_msgSend(v16, sel_day);
          if (v18 == objc_msgSend(v17, sel_day)
            && (v19 = objc_msgSend(v16, sel_month), v19 == objc_msgSend(v17, (SEL)&selRef_y + 1))
            && (v20 = objc_msgSend(v16, sel_year), v20 == objc_msgSend(v17, sel_year)))
          {
            v21 = objc_msgSend(v16, sel_era);
            v22 = objc_msgSend(v17, sel_era);

            if (v21 == v22)
            {

              (*(void (**)(char *, uint64_t))(v35 + 8))(v8, v34);
              sub_1DD1A0740((uint64_t)v40, &qword_1F03C97E8);
              return 1;
            }
          }
          else
          {

          }
        }
        sub_1DD1C1F00();
      }

      (*(void (**)(char *, uint64_t))(v35 + 8))(v8, v34);
      goto LABEL_27;
    }
  }
  else
  {
    sub_1DD1A0740((uint64_t)&v38, &qword_1F03C97E8);
  }
  sub_1DD1A06F8((uint64_t)v40, (uint64_t)&v38);
  if (!*((_QWORD *)&v39 + 1))
  {
    sub_1DD1A0740((uint64_t)&v38, &qword_1F03C97E8);
    goto LABEL_27;
  }
  sub_1DD1A0658(0, &qword_1F03C97E0);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_27:
    sub_1DD1A0740((uint64_t)v40, &qword_1F03C97E8);
    return 0;
  }
  v23 = v37;
  v24 = objc_msgSend(v36, sel_value);
  v25 = v23;
  v26 = objc_msgSend(v24, sel_day);
  if (v26 == objc_msgSend(v25, sel_day)
    && (v27 = objc_msgSend(v24, sel_month), v27 == objc_msgSend(v25, sel_month))
    && (v28 = objc_msgSend(v24, sel_year), v28 == objc_msgSend(v25, sel_year)))
  {
    v29 = objc_msgSend(v24, sel_era);
    v30 = objc_msgSend(v25, sel_era);

    sub_1DD1A0740((uint64_t)v40, &qword_1F03C97E8);
    if (v29 == v30)
      return 1;
  }
  else
  {

    sub_1DD1A0740((uint64_t)v40, &qword_1F03C97E8);
  }
  return 0;
}

BOOL sub_1DD1990EC(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  unsigned __int8 v18;
  void *v19;
  id v20;
  unsigned __int8 v21;
  uint64_t v23;
  id v24;
  uint64_t v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[32];

  v6 = sub_1DD1C1F0C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78]();
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (void *)sub_1DD1C2020();
  v11 = objc_msgSend(a4, sel_isKeyAvailable_, v10);

  if (!v11)
    return 0;
  v12 = (void *)sub_1DD1C2020();
  v13 = objc_msgSend(a4, sel_valueForKey_, v12);

  if (v13)
  {
    sub_1DD1C2140();
    swift_unknownObjectRelease();
  }
  else
  {
    v27 = 0u;
    v28 = 0u;
  }
  sub_1DD1A06B0((uint64_t)&v27, (uint64_t)v29);
  sub_1DD1A06F8((uint64_t)v29, (uint64_t)&v27);
  if (*((_QWORD *)&v28 + 1))
  {
    sub_1DD1A0658(0, &qword_1F03C97D0);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v24 = v26;
      v25 = v6;
      sub_1DD1C2104();
      sub_1DD1C1F00();
      if (*((_QWORD *)&v28 + 1))
      {
        while (1)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9678);
          if ((swift_dynamicCast() & 1) != 0)
          {
            v14 = v26;
            v15 = objc_msgSend(a3, sel_value);
            v16 = a3;
            v17 = objc_msgSend(v14, sel_value);
            v18 = objc_msgSend((id)objc_opt_self(), sel_isObject_equalToOther_, v15, v17);

            a3 = v16;
            if ((v18 & 1) != 0)
              break;
          }
          sub_1DD1C1F00();
          if (!*((_QWORD *)&v28 + 1))
            goto LABEL_19;
        }

        (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v25);
        sub_1DD1A0740((uint64_t)v29, &qword_1F03C97E8);
        return 1;
      }
LABEL_19:

      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v25);
      goto LABEL_20;
    }
  }
  else
  {
    sub_1DD1A0740((uint64_t)&v27, &qword_1F03C97E8);
  }
  sub_1DD1A06F8((uint64_t)v29, (uint64_t)&v27);
  if (!*((_QWORD *)&v28 + 1))
  {
    sub_1DD1A0740((uint64_t)&v27, &qword_1F03C97E8);
    goto LABEL_20;
  }
  sub_1DD1A0658(0, &qword_1F03C97D8);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_20:
    sub_1DD1A0740((uint64_t)v29, &qword_1F03C97E8);
    return 0;
  }
  v19 = v26;
  v20 = objc_msgSend(a3, sel_value);
  v21 = objc_msgSend((id)objc_opt_self(), sel_isObject_equalToOther_, v20, v19);

  sub_1DD1A0740((uint64_t)v29, &qword_1F03C97E8);
  return (v21 & 1) != 0;
}

void sub_1DD199464(uint64_t *a1, void *a2, void *a3, void *a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  unsigned int v13;
  void *v14;
  unsigned int v15;
  void *v16;
  id v17;
  char v18;
  void *v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  void *v23;
  id v24;
  uint64_t ObjectType;
  void *v26;
  uint64_t v27;
  id v28;
  NSObject *v29;
  os_log_type_t v30;
  uint64_t v31;
  _QWORD *v32;
  NSObject *v33;
  os_log_type_t v34;
  const char *v35;
  uint64_t v36;
  os_log_type_t v37;
  _QWORD *v38;
  char v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  id v44;
  char v45;
  id v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  char v51;
  void *v52;
  uint64_t v53;
  NSObject *v54;
  NSObject *v55;
  os_log_type_t v56;
  uint8_t *v57;
  NSObject *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  id v62;
  __int128 v63;
  id v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  _BYTE v70[32];
  _OWORD v71[2];
  __int128 v72;
  uint64_t v73;
  _OWORD v74[2];
  void *v75;

  v68 = a4;
  v7 = sub_1DD1C1F0C();
  v67 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78]();
  v9 = (char *)&v61 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *a1;
  v11 = a1[1];
  v12 = (void *)sub_1DD1C2020();
  v13 = objc_msgSend(a2, sel_isKeyAvailable_, v12);

  if (v13)
  {
    v14 = (void *)sub_1DD1C2020();
    v15 = objc_msgSend(a3, sel_isKeyAvailable_, v14);

    if (v15)
    {
      v66 = a3;
      v16 = (void *)sub_1DD1C2020();
      v17 = objc_msgSend(a2, sel_valueForKey_, v16);

      if (v17)
      {
        sub_1DD1C2140();
        swift_unknownObjectRelease();
        sub_1DD1A060C(&v72, v74);
        sub_1DD1A061C((uint64_t)v74, (uint64_t)&v72);
        sub_1DD1A0658(0, &qword_1F03C97D0);
        v18 = swift_dynamicCast();
        v69 = v11;
        if ((v18 & 1) != 0)
        {
          v65 = v10;
          v19 = *(void **)&v71[0];
          v20 = (uint64_t)objc_msgSend(*(id *)&v71[0], sel_count);
          v21 = v66;
          if (v20 >= 1)
          {
            v64 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99DE8]), sel_init);
            v62 = v19;
            sub_1DD1C2104();
            sub_1DD1C1F00();
            if (v73)
            {
              *(_QWORD *)&v22 = 138412290;
              v63 = v22;
              do
              {
                sub_1DD1A060C(&v72, v71);
                sub_1DD1A061C((uint64_t)v71, (uint64_t)v70);
                __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9678);
                if ((swift_dynamicCast() & 1) == 0)
                  goto LABEL_10;
                v23 = v75;
                v24 = objc_msgSend(v75, sel_value);
                ObjectType = swift_getObjectType();

                if (ObjectType == sub_1DD1A0658(0, &qword_1F03C97E0))
                {
                  sub_1DD1A061C((uint64_t)v71, (uint64_t)v70);
                  if ((swift_dynamicCast() & 1) != 0)
                  {
                    v26 = v75;
                    if ((sub_1DD198C14(v65, v69, v75, v21) & 1) != 0)
                    {
                      objc_msgSend(v64, sel_addObject_, v26);

                      goto LABEL_10;
                    }

                  }
                  if (qword_1F03C95A0 != -1)
                    swift_once();
                  v36 = sub_1DD1C1FA8();
                  __swift_project_value_buffer(v36, (uint64_t)qword_1F03C95A8);
                  v28 = v23;
                  v29 = sub_1DD1C1F90();
                  v37 = sub_1DD1C20F8();
                  if (os_log_type_enabled(v29, v37))
                  {
                    v31 = swift_slowAlloc();
                    v32 = (_QWORD *)swift_slowAlloc();
                    *(_DWORD *)v31 = v63;
                    *(_QWORD *)(v31 + 4) = v28;
                    *v32 = v28;

                    v33 = v29;
                    v34 = v37;
                    v35 = "unable to find date pref in me card: %@";
                    goto LABEL_27;
                  }
                }
                else
                {
                  if (sub_1DD1990EC(v65, v69, v23, v21))
                  {
                    objc_msgSend(v64, sel_addObject_, v23);

                    goto LABEL_10;
                  }
                  if (qword_1F03C95A0 != -1)
                    swift_once();
                  v27 = sub_1DD1C1FA8();
                  __swift_project_value_buffer(v27, (uint64_t)qword_1F03C95A8);
                  v28 = v23;
                  v29 = sub_1DD1C1F90();
                  v30 = sub_1DD1C20F8();
                  if (os_log_type_enabled(v29, v30))
                  {
                    v31 = swift_slowAlloc();
                    v32 = (_QWORD *)swift_slowAlloc();
                    *(_DWORD *)v31 = v63;
                    *(_QWORD *)(v31 + 4) = v28;
                    *v32 = v28;

                    v33 = v29;
                    v34 = v30;
                    v35 = "unable to find string pref in me card: %@";
LABEL_27:
                    _os_log_impl(&dword_1DD140000, v33, v34, v35, (uint8_t *)v31, 0xCu);
                    __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9690);
                    swift_arrayDestroy();
                    v38 = v32;
                    v21 = v66;
                    MEMORY[0x1DF0D66B8](v38, -1, -1);
                    MEMORY[0x1DF0D66B8](v31, -1, -1);
                    goto LABEL_9;
                  }
                }

LABEL_9:
LABEL_10:
                __swift_destroy_boxed_opaque_existential_0((uint64_t)v71);
                sub_1DD1C1F00();
              }
              while (v73);
            }
            (*(void (**)(char *, uint64_t))(v67 + 8))(v9, v7);
            v46 = v64;
            if ((uint64_t)objc_msgSend(v64, sel_count) <= 0)
            {
              v52 = (void *)sub_1DD1C2020();
              objc_msgSend(v68, sel_setNilValueForKey_, v52);

            }
            else
            {
              v47 = v46;
              v48 = (void *)sub_1DD1C2020();
              objc_msgSend(v68, sel_setValue_forKey_, v47, v48);

            }
            goto LABEL_46;
          }
          goto LABEL_38;
        }
        sub_1DD1A061C((uint64_t)v74, (uint64_t)&v72);
        sub_1DD1A0658(0, &qword_1F03C97D8);
        v39 = swift_dynamicCast();
        v40 = v66;
        if ((v39 & 1) != 0)
        {
          v19 = *(void **)&v71[0];
          if ((uint64_t)objc_msgSend(*(id *)&v71[0], sel_length) < 1)
            goto LABEL_38;
          v41 = objc_allocWithZone(MEMORY[0x1E0C97338]);
          v42 = v19;
          v43 = (void *)sub_1DD1C2020();
          v44 = objc_msgSend(v41, sel_initWithLabel_value_, v43, v42);

          v45 = sub_1DD1990EC(v10, v11, v44, v40);
        }
        else
        {
          sub_1DD1A061C((uint64_t)v74, (uint64_t)&v72);
          sub_1DD1A0658(0, &qword_1F03C97E0);
          if ((swift_dynamicCast() & 1) == 0)
          {
LABEL_46:
            __swift_destroy_boxed_opaque_existential_0((uint64_t)v74);
            return;
          }
          v19 = *(void **)&v71[0];
          if (!objc_msgSend(*(id *)&v71[0], sel_isValidDate))
          {
LABEL_38:
            __swift_destroy_boxed_opaque_existential_0((uint64_t)v74);

            return;
          }
          v49 = objc_allocWithZone(MEMORY[0x1E0C97338]);
          v42 = v19;
          v50 = (void *)sub_1DD1C2020();
          v44 = objc_msgSend(v49, sel_initWithLabel_value_, v50, v42);

          v45 = sub_1DD198C14(v10, v11, v44, v40);
        }
        v51 = v45;

        if ((v51 & 1) != 0)
        {
          __swift_destroy_boxed_opaque_existential_0((uint64_t)v74);

          return;
        }
        if (qword_1F03C95A0 != -1)
          swift_once();
        v53 = sub_1DD1C1FA8();
        __swift_project_value_buffer(v53, (uint64_t)qword_1F03C95A8);
        v54 = v42;
        v55 = sub_1DD1C1F90();
        v56 = sub_1DD1C20F8();
        if (os_log_type_enabled(v55, v56))
        {
          v57 = (uint8_t *)swift_slowAlloc();
          v67 = swift_slowAlloc();
          *(_DWORD *)v57 = 138412290;
          *(_QWORD *)&v72 = v54;
          v58 = v54;
          sub_1DD1C211C();
          v59 = v67;
          *(_QWORD *)v67 = v54;

          _os_log_impl(&dword_1DD140000, v55, v56, "unable to find pref in me card: %@", v57, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9690);
          swift_arrayDestroy();
          MEMORY[0x1DF0D66B8](v59, -1, -1);
          MEMORY[0x1DF0D66B8](v57, -1, -1);
        }
        else
        {

          v55 = v54;
        }

        v60 = (void *)sub_1DD1C2020();
        objc_msgSend(v68, sel_setNilValueForKey_, v60);

        goto LABEL_46;
      }
    }
  }
}

uint64_t variable initialization expression of SearchInContactsIntent._criteria()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v21[2];

  sub_1DD1C2014();
  v0 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  MEMORY[0x1E0C80A78](v0);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96C0);
  MEMORY[0x1E0C80A78](v1);
  v21[0] = (char *)v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_1DD1C1EDC();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1DD1C1F84();
  MEMORY[0x1E0C80A78](v7);
  v8 = sub_1DD1C1EE8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  v10 = *MEMORY[0x1E0CAF9B8];
  v11 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 104);
  v11(v6, v10, v3);
  sub_1DD1C1EF4();
  sub_1DD1C1FCC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96C8);
  sub_1DD1C1F78();
  v11(v6, v10, v3);
  v12 = v21[0];
  sub_1DD1C1EF4();
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v9 + 56))(v12, 0, 1, v8);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96D0);
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_1DD1C1A80();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v15, 1, 1, v16);
  v17 = sub_1DD1C1DA4();
  MEMORY[0x1E0C80A78](v17);
  (*(void (**)(char *, _QWORD))(v19 + 104))((char *)v21 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x1E0C91740]);
  return sub_1DD1C1BAC();
}

uint64_t variable initialization expression of CreateContactIntent._namePrefix()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t, uint64_t);
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;

  v0 = sub_1DD1C2014();
  v1 = MEMORY[0x1E0C80A78](v0);
  MEMORY[0x1E0C80A78](v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96C0);
  MEMORY[0x1E0C80A78](v2);
  v28 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1DD1C1EDC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1DD1C1F84();
  MEMORY[0x1E0C80A78](v8);
  v9 = sub_1DD1C1EE8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v29 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  v12 = *MEMORY[0x1E0CAF9B8];
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 104);
  v13(v7, v12, v4);
  sub_1DD1C1EF4();
  sub_1DD1C1FCC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96D8);
  sub_1DD1C1F78();
  v13(v7, v12, v4);
  v14 = v28;
  sub_1DD1C1EF4();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v14, 0, 1, v9);
  v30 = 0;
  v31 = 0;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96E0);
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_1DD1C1FC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v17, 1, 1, v18);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96D0);
  MEMORY[0x1E0C80A78](v19);
  v21 = (char *)&v27 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_1DD1C1A80();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v21, 1, 1, v22);
  v23 = sub_1DD1C1DA4();
  MEMORY[0x1E0C80A78](v23);
  (*(void (**)(char *, _QWORD))(v25 + 104))((char *)&v27 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x1E0C91740]);
  return sub_1DD1C1BC4();
}

uint64_t variable initialization expression of CreateContactIntent._givenName()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t, uint64_t);
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;

  v0 = sub_1DD1C2014();
  v1 = MEMORY[0x1E0C80A78](v0);
  MEMORY[0x1E0C80A78](v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96C0);
  MEMORY[0x1E0C80A78](v2);
  v28 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1DD1C1EDC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1DD1C1F84();
  MEMORY[0x1E0C80A78](v8);
  v9 = sub_1DD1C1EE8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v29 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  v12 = *MEMORY[0x1E0CAF9B8];
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 104);
  v13(v7, v12, v4);
  sub_1DD1C1EF4();
  sub_1DD1C1FCC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96D8);
  sub_1DD1C1F78();
  v13(v7, v12, v4);
  v14 = v28;
  sub_1DD1C1EF4();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v14, 0, 1, v9);
  v30 = 0;
  v31 = 0;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96E0);
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_1DD1C1FC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v17, 1, 1, v18);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96D0);
  MEMORY[0x1E0C80A78](v19);
  v21 = (char *)&v27 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_1DD1C1A80();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v21, 1, 1, v22);
  v23 = sub_1DD1C1DA4();
  MEMORY[0x1E0C80A78](v23);
  (*(void (**)(char *, _QWORD))(v25 + 104))((char *)&v27 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x1E0C91740]);
  return sub_1DD1C1BC4();
}

uint64_t variable initialization expression of CreateContactIntent._middleName()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t, uint64_t);
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;

  v0 = sub_1DD1C2014();
  v1 = MEMORY[0x1E0C80A78](v0);
  MEMORY[0x1E0C80A78](v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96C0);
  MEMORY[0x1E0C80A78](v2);
  v28 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1DD1C1EDC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1DD1C1F84();
  MEMORY[0x1E0C80A78](v8);
  v9 = sub_1DD1C1EE8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v29 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  v12 = *MEMORY[0x1E0CAF9B8];
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 104);
  v13(v7, v12, v4);
  sub_1DD1C1EF4();
  sub_1DD1C1FCC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96D8);
  sub_1DD1C1F78();
  v13(v7, v12, v4);
  v14 = v28;
  sub_1DD1C1EF4();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v14, 0, 1, v9);
  v30 = 0;
  v31 = 0;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96E0);
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_1DD1C1FC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v17, 1, 1, v18);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96D0);
  MEMORY[0x1E0C80A78](v19);
  v21 = (char *)&v27 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_1DD1C1A80();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v21, 1, 1, v22);
  v23 = sub_1DD1C1DA4();
  MEMORY[0x1E0C80A78](v23);
  (*(void (**)(char *, _QWORD))(v25 + 104))((char *)&v27 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x1E0C91740]);
  return sub_1DD1C1BC4();
}

uint64_t variable initialization expression of CreateContactIntent._familyName()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t, uint64_t);
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;

  v0 = sub_1DD1C2014();
  v1 = MEMORY[0x1E0C80A78](v0);
  MEMORY[0x1E0C80A78](v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96C0);
  MEMORY[0x1E0C80A78](v2);
  v28 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1DD1C1EDC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1DD1C1F84();
  MEMORY[0x1E0C80A78](v8);
  v9 = sub_1DD1C1EE8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v29 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  v12 = *MEMORY[0x1E0CAF9B8];
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 104);
  v13(v7, v12, v4);
  sub_1DD1C1EF4();
  sub_1DD1C1FCC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96D8);
  sub_1DD1C1F78();
  v13(v7, v12, v4);
  v14 = v28;
  sub_1DD1C1EF4();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v14, 0, 1, v9);
  v30 = 0;
  v31 = 0;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96E0);
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_1DD1C1FC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v17, 1, 1, v18);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96D0);
  MEMORY[0x1E0C80A78](v19);
  v21 = (char *)&v27 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_1DD1C1A80();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v21, 1, 1, v22);
  v23 = sub_1DD1C1DA4();
  MEMORY[0x1E0C80A78](v23);
  (*(void (**)(char *, _QWORD))(v25 + 104))((char *)&v27 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x1E0C91740]);
  return sub_1DD1C1BC4();
}

uint64_t variable initialization expression of CreateContactIntent._nameSuffix()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t, uint64_t);
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;

  v0 = sub_1DD1C2014();
  v1 = MEMORY[0x1E0C80A78](v0);
  MEMORY[0x1E0C80A78](v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96C0);
  MEMORY[0x1E0C80A78](v2);
  v28 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1DD1C1EDC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1DD1C1F84();
  MEMORY[0x1E0C80A78](v8);
  v9 = sub_1DD1C1EE8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v29 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  v12 = *MEMORY[0x1E0CAF9B8];
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 104);
  v13(v7, v12, v4);
  sub_1DD1C1EF4();
  sub_1DD1C1FCC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96D8);
  sub_1DD1C1F78();
  v13(v7, v12, v4);
  v14 = v28;
  sub_1DD1C1EF4();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v14, 0, 1, v9);
  v30 = 0;
  v31 = 0;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96E0);
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_1DD1C1FC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v17, 1, 1, v18);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96D0);
  MEMORY[0x1E0C80A78](v19);
  v21 = (char *)&v27 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_1DD1C1A80();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v21, 1, 1, v22);
  v23 = sub_1DD1C1DA4();
  MEMORY[0x1E0C80A78](v23);
  (*(void (**)(char *, _QWORD))(v25 + 104))((char *)&v27 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x1E0C91740]);
  return sub_1DD1C1BC4();
}

uint64_t variable initialization expression of CreateContactIntent._phoneNumber()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t, uint64_t);
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;

  v0 = sub_1DD1C2014();
  v1 = MEMORY[0x1E0C80A78](v0);
  MEMORY[0x1E0C80A78](v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96C0);
  MEMORY[0x1E0C80A78](v2);
  v28 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1DD1C1EDC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1DD1C1F84();
  MEMORY[0x1E0C80A78](v8);
  v9 = sub_1DD1C1EE8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v29 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  v12 = *MEMORY[0x1E0CAF9B8];
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 104);
  v13(v7, v12, v4);
  sub_1DD1C1EF4();
  sub_1DD1C1FCC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96D8);
  sub_1DD1C1F78();
  v13(v7, v12, v4);
  v14 = v28;
  sub_1DD1C1EF4();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v14, 0, 1, v9);
  v30 = 0;
  v31 = 0;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96E0);
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_1DD1C1FC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v17, 1, 1, v18);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96D0);
  MEMORY[0x1E0C80A78](v19);
  v21 = (char *)&v27 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_1DD1C1A80();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v21, 1, 1, v22);
  v23 = sub_1DD1C1DA4();
  MEMORY[0x1E0C80A78](v23);
  (*(void (**)(char *, _QWORD))(v25 + 104))((char *)&v27 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x1E0C91740]);
  return sub_1DD1C1BC4();
}

uint64_t variable initialization expression of CreateContactIntent._emailAddress()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t, uint64_t);
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;

  v0 = sub_1DD1C2014();
  v1 = MEMORY[0x1E0C80A78](v0);
  MEMORY[0x1E0C80A78](v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96C0);
  MEMORY[0x1E0C80A78](v2);
  v28 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1DD1C1EDC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1DD1C1F84();
  MEMORY[0x1E0C80A78](v8);
  v9 = sub_1DD1C1EE8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v29 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  v12 = *MEMORY[0x1E0CAF9B8];
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 104);
  v13(v7, v12, v4);
  sub_1DD1C1EF4();
  sub_1DD1C1FCC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96D8);
  sub_1DD1C1F78();
  v13(v7, v12, v4);
  v14 = v28;
  sub_1DD1C1EF4();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v14, 0, 1, v9);
  v30 = 0;
  v31 = 0;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96E0);
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_1DD1C1FC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v17, 1, 1, v18);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96D0);
  MEMORY[0x1E0C80A78](v19);
  v21 = (char *)&v27 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_1DD1C1A80();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v21, 1, 1, v22);
  v23 = sub_1DD1C1DA4();
  MEMORY[0x1E0C80A78](v23);
  (*(void (**)(char *, _QWORD))(v25 + 104))((char *)&v27 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x1E0C91740]);
  return sub_1DD1C1BC4();
}

uint64_t variable initialization expression of ContactLabeledValueEntity._label()
{
  return sub_1DD19BCC4(0x6C6562614CLL, &qword_1F03C96E8);
}

uint64_t variable initialization expression of ContactLabeledValueEntity._value()
{
  return sub_1DD19BCC4(0x65756C6156, &qword_1F03C96F0);
}

uint64_t sub_1DD19BCC4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  _BYTE v13[16];

  v3 = sub_1DD1C2014();
  MEMORY[0x1E0C80A78](v3);
  v4 = sub_1DD1C1EDC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = &v13[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = sub_1DD1C1F84();
  MEMORY[0x1E0C80A78](v8);
  v9 = sub_1DD1C1EE8();
  MEMORY[0x1E0C80A78](v9);
  v11 = &v13[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1DD1C1FCC();
  __swift_instantiateConcreteTypeFromMangledName(a2);
  sub_1DD1C1F78();
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E0CAF9B8], v4);
  sub_1DD1C1EF4();
  return MEMORY[0x1DF0D54F4](v11);
}

uint64_t variable initialization expression of ContactEntity._person()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE v10[16];

  v0 = sub_1DD1C2014();
  MEMORY[0x1E0C80A78](v0);
  v1 = sub_1DD1C1EDC();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = &v10[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_1DD1C1F84();
  MEMORY[0x1E0C80A78](v5);
  v6 = sub_1DD1C1EE8();
  MEMORY[0x1E0C80A78](v6);
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1DD1C1FCC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96F8);
  sub_1DD1C1F78();
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x1E0CAF9B8], v1);
  sub_1DD1C1EF4();
  return MEMORY[0x1DF0D54DC](v8);
}

uint64_t variable initialization expression of ContactEntity._phoneNumbers()
{
  return sub_1DD19C080();
}

uint64_t variable initialization expression of ContactEntity._emailAddresses()
{
  return sub_1DD19C080();
}

uint64_t sub_1DD19C080()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  unint64_t v9;
  _BYTE v11[16];

  v0 = sub_1DD1C2014();
  MEMORY[0x1E0C80A78](v0);
  v1 = sub_1DD1C1EDC();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = &v11[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_1DD1C1F84();
  MEMORY[0x1E0C80A78](v5);
  v6 = sub_1DD1C1EE8();
  MEMORY[0x1E0C80A78](v6);
  v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1DD1C1FCC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9700);
  sub_1DD1C1F78();
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x1E0CAF9B8], v1);
  sub_1DD1C1EF4();
  v9 = sub_1DD1A03F0();
  return MEMORY[0x1DF0D54D0](v8, v9);
}

uint64_t variable initialization expression of ContactEntity._postalAddresses()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  unint64_t v9;
  _BYTE v11[16];

  v0 = sub_1DD1C1EDC();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = &v11[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = sub_1DD1C1F84();
  MEMORY[0x1E0C80A78](v4);
  v5 = sub_1DD1C2014();
  MEMORY[0x1E0C80A78](v5);
  v6 = sub_1DD1C1EE8();
  MEMORY[0x1E0C80A78](v6);
  v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1DD1C1FCC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9700);
  sub_1DD1C1F78();
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E0CAF9B8], v0);
  sub_1DD1C1EF4();
  v9 = sub_1DD1A03F0();
  return MEMORY[0x1DF0D54D0](v8, v9);
}

uint64_t variable initialization expression of ContactEntity._birthday()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE v10[16];

  v0 = sub_1DD1C1EDC();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = &v10[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = sub_1DD1C1F84();
  MEMORY[0x1E0C80A78](v4);
  v5 = sub_1DD1C2014();
  MEMORY[0x1E0C80A78](v5);
  v6 = sub_1DD1C1EE8();
  MEMORY[0x1E0C80A78](v6);
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1DD1C1FCC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9710);
  sub_1DD1C1F78();
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E0CAF9B8], v0);
  sub_1DD1C1EF4();
  return MEMORY[0x1DF0D54E8](v8);
}

uint64_t variable initialization expression of DeleteContactIntent._entities()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v25[4];

  v0 = sub_1DD1C2014();
  v1 = MEMORY[0x1E0C80A78](v0);
  MEMORY[0x1E0C80A78](v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96C0);
  MEMORY[0x1E0C80A78](v2);
  v25[0] = (char *)v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1DD1C1EDC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1DD1C1F84();
  MEMORY[0x1E0C80A78](v8);
  v9 = sub_1DD1C1EE8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v25[1] = (char *)v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  v12 = *MEMORY[0x1E0CAF9B8];
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 104);
  v13(v7, v12, v4);
  sub_1DD1C1EF4();
  sub_1DD1C1FCC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9718);
  sub_1DD1C1F78();
  v13(v7, v12, v4);
  v14 = v25[0];
  sub_1DD1C1EF4();
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v10 + 56))(v14, 0, 1, v9);
  v25[2] = 0;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96D0);
  v16 = *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64);
  MEMORY[0x1E0C80A78](v15);
  v17 = (v16 + 15) & 0xFFFFFFFFFFFFFFF0;
  v18 = sub_1DD1C1A80();
  v19 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56);
  v20 = v19((char *)v25 - v17, 1, 1, v18);
  MEMORY[0x1E0C80A78](v20);
  v19((char *)v25 - v17, 1, 1, v18);
  v21 = sub_1DD1C1DA4();
  MEMORY[0x1E0C80A78](v21);
  (*(void (**)(char *, _QWORD))(v23 + 104))((char *)v25 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x1E0C91740]);
  sub_1DD1A0434();
  return sub_1DD1C1BA0();
}

uint64_t variable initialization expression of ViewContactCardIntent._target()
{
  return sub_1DD19CE0C(0xD00000000000001FLL, 0x80000001DD1D1170);
}

uint64_t variable initialization expression of ViewContactCardIntent._shouldEdit()
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
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(char *, uint64_t, uint64_t);
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v26;
  char v27;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96C0);
  MEMORY[0x1E0C80A78](v0);
  v26 = (char *)&v26 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = sub_1DD1C1EDC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1DD1C1F84();
  MEMORY[0x1E0C80A78](v6);
  v7 = sub_1DD1C2014();
  v8 = MEMORY[0x1E0C80A78](v7);
  MEMORY[0x1E0C80A78](v8);
  v9 = sub_1DD1C1EE8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  v11 = *MEMORY[0x1E0CAF9B8];
  v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 104);
  v12(v5, v11, v2);
  sub_1DD1C1EF4();
  sub_1DD1C1FCC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9730);
  sub_1DD1C1F78();
  v12(v5, v11, v2);
  v13 = v26;
  sub_1DD1C1EF4();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v13, 0, 1, v9);
  v27 = 2;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9738);
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_1DD1C20BC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v16, 1, 1, v17);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96D0);
  MEMORY[0x1E0C80A78](v18);
  v20 = (char *)&v26 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_1DD1C1A80();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v20, 1, 1, v21);
  v22 = sub_1DD1C1DA4();
  MEMORY[0x1E0C80A78](v22);
  (*(void (**)(char *, _QWORD))(v24 + 104))((char *)&v26 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x1E0C91740]);
  return sub_1DD1C1BD0();
}

uint64_t _s14ContactsUICore08SearchInA6IntentV15_entityProvider33_9DE8544A2D012B977D72ADF6C851FAF6LL10AppIntents0P10DependencyCyAA013ContactEntityG0CGvpfi_0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9D10);
  if (qword_1F03C7E40 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  sub_1DD1C2158();
  sub_1DD1C19F0();
  sub_1DD1C19E4();
  return sub_1DD1C19CC();
}

uint64_t variable initialization expression of UpdateContactIntent._target()
{
  return sub_1DD19CE0C(0xD000000000000015, 0x80000001DD1D1220);
}

uint64_t sub_1DD19CE0C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t, uint64_t);
  char *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v26[3];
  char *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;

  v26[1] = a1;
  v26[2] = a2;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96C0);
  MEMORY[0x1E0C80A78](v2);
  v27 = (char *)v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1DD1C1EDC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1DD1C1F84();
  MEMORY[0x1E0C80A78](v8);
  v9 = sub_1DD1C2014();
  v10 = MEMORY[0x1E0C80A78](v9);
  MEMORY[0x1E0C80A78](v10);
  v11 = sub_1DD1C1EE8();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  v13 = *MEMORY[0x1E0CAF9B8];
  v14 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 104);
  v14(v7, v13, v4);
  sub_1DD1C1EF4();
  sub_1DD1C1FCC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9728);
  sub_1DD1C1F78();
  v14(v7, v13, v4);
  v15 = v27;
  sub_1DD1C1EF4();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v15, 0, 1, v11);
  v34 = 0;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96D0);
  v17 = *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64);
  MEMORY[0x1E0C80A78](v16);
  v18 = (v17 + 15) & 0xFFFFFFFFFFFFFFF0;
  v19 = sub_1DD1C1A80();
  v20 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56);
  v21 = v20((char *)v26 - v18, 1, 1, v19);
  MEMORY[0x1E0C80A78](v21);
  v20((char *)v26 - v18, 1, 1, v19);
  v22 = sub_1DD1C1DA4();
  MEMORY[0x1E0C80A78](v22);
  (*(void (**)(char *, _QWORD))(v24 + 104))((char *)v26 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x1E0C91740]);
  sub_1DD1A0434();
  return sub_1DD1C1BA0();
}

uint64_t variable initialization expression of UpdateContactIntent._label()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t, uint64_t);
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;

  v0 = sub_1DD1C2014();
  v1 = MEMORY[0x1E0C80A78](v0);
  MEMORY[0x1E0C80A78](v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96C0);
  MEMORY[0x1E0C80A78](v2);
  v28 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1DD1C1EDC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1DD1C1F84();
  MEMORY[0x1E0C80A78](v8);
  v9 = sub_1DD1C1EE8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v29 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  v12 = *MEMORY[0x1E0CAF9B8];
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 104);
  v13(v7, v12, v4);
  sub_1DD1C1EF4();
  sub_1DD1C1FCC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96D8);
  sub_1DD1C1F78();
  v13(v7, v12, v4);
  v14 = v28;
  sub_1DD1C1EF4();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v14, 0, 1, v9);
  v30 = 0;
  v31 = 0;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96E0);
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_1DD1C1FC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v17, 1, 1, v18);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96D0);
  MEMORY[0x1E0C80A78](v19);
  v21 = (char *)&v27 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_1DD1C1A80();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v21, 1, 1, v22);
  v23 = sub_1DD1C1DA4();
  MEMORY[0x1E0C80A78](v23);
  (*(void (**)(char *, _QWORD))(v25 + 104))((char *)&v27 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x1E0C91740]);
  return sub_1DD1C1BC4();
}

uint64_t variable initialization expression of UpdateContactIntent._namePrefix()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t, uint64_t);
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;

  v0 = sub_1DD1C2014();
  v1 = MEMORY[0x1E0C80A78](v0);
  MEMORY[0x1E0C80A78](v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96C0);
  MEMORY[0x1E0C80A78](v2);
  v28 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1DD1C1EDC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1DD1C1F84();
  MEMORY[0x1E0C80A78](v8);
  v9 = sub_1DD1C1EE8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v29 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  v12 = *MEMORY[0x1E0CAF9B8];
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 104);
  v13(v7, v12, v4);
  sub_1DD1C1EF4();
  sub_1DD1C1FCC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96D8);
  sub_1DD1C1F78();
  v13(v7, v12, v4);
  v14 = v28;
  sub_1DD1C1EF4();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v14, 0, 1, v9);
  v30 = 0;
  v31 = 0;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96E0);
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_1DD1C1FC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v17, 1, 1, v18);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96D0);
  MEMORY[0x1E0C80A78](v19);
  v21 = (char *)&v27 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_1DD1C1A80();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v21, 1, 1, v22);
  v23 = sub_1DD1C1DA4();
  MEMORY[0x1E0C80A78](v23);
  (*(void (**)(char *, _QWORD))(v25 + 104))((char *)&v27 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x1E0C91740]);
  return sub_1DD1C1BC4();
}

uint64_t variable initialization expression of UpdateContactIntent._givenName()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t, uint64_t);
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;

  v0 = sub_1DD1C2014();
  v1 = MEMORY[0x1E0C80A78](v0);
  MEMORY[0x1E0C80A78](v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96C0);
  MEMORY[0x1E0C80A78](v2);
  v28 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1DD1C1EDC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1DD1C1F84();
  MEMORY[0x1E0C80A78](v8);
  v9 = sub_1DD1C1EE8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v29 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  v12 = *MEMORY[0x1E0CAF9B8];
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 104);
  v13(v7, v12, v4);
  sub_1DD1C1EF4();
  sub_1DD1C1FCC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96D8);
  sub_1DD1C1F78();
  v13(v7, v12, v4);
  v14 = v28;
  sub_1DD1C1EF4();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v14, 0, 1, v9);
  v30 = 0;
  v31 = 0;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96E0);
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_1DD1C1FC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v17, 1, 1, v18);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96D0);
  MEMORY[0x1E0C80A78](v19);
  v21 = (char *)&v27 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_1DD1C1A80();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v21, 1, 1, v22);
  v23 = sub_1DD1C1DA4();
  MEMORY[0x1E0C80A78](v23);
  (*(void (**)(char *, _QWORD))(v25 + 104))((char *)&v27 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x1E0C91740]);
  return sub_1DD1C1BC4();
}

uint64_t variable initialization expression of UpdateContactIntent._middleName()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t, uint64_t);
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;

  v0 = sub_1DD1C2014();
  v1 = MEMORY[0x1E0C80A78](v0);
  MEMORY[0x1E0C80A78](v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96C0);
  MEMORY[0x1E0C80A78](v2);
  v28 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1DD1C1EDC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1DD1C1F84();
  MEMORY[0x1E0C80A78](v8);
  v9 = sub_1DD1C1EE8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v29 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  v12 = *MEMORY[0x1E0CAF9B8];
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 104);
  v13(v7, v12, v4);
  sub_1DD1C1EF4();
  sub_1DD1C1FCC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96D8);
  sub_1DD1C1F78();
  v13(v7, v12, v4);
  v14 = v28;
  sub_1DD1C1EF4();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v14, 0, 1, v9);
  v30 = 0;
  v31 = 0;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96E0);
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_1DD1C1FC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v17, 1, 1, v18);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96D0);
  MEMORY[0x1E0C80A78](v19);
  v21 = (char *)&v27 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_1DD1C1A80();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v21, 1, 1, v22);
  v23 = sub_1DD1C1DA4();
  MEMORY[0x1E0C80A78](v23);
  (*(void (**)(char *, _QWORD))(v25 + 104))((char *)&v27 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x1E0C91740]);
  return sub_1DD1C1BC4();
}

uint64_t variable initialization expression of UpdateContactIntent._familyName()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t, uint64_t);
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;

  v0 = sub_1DD1C2014();
  v1 = MEMORY[0x1E0C80A78](v0);
  MEMORY[0x1E0C80A78](v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96C0);
  MEMORY[0x1E0C80A78](v2);
  v28 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1DD1C1EDC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1DD1C1F84();
  MEMORY[0x1E0C80A78](v8);
  v9 = sub_1DD1C1EE8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v29 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  v12 = *MEMORY[0x1E0CAF9B8];
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 104);
  v13(v7, v12, v4);
  sub_1DD1C1EF4();
  sub_1DD1C1FCC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96D8);
  sub_1DD1C1F78();
  v13(v7, v12, v4);
  v14 = v28;
  sub_1DD1C1EF4();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v14, 0, 1, v9);
  v30 = 0;
  v31 = 0;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96E0);
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_1DD1C1FC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v17, 1, 1, v18);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96D0);
  MEMORY[0x1E0C80A78](v19);
  v21 = (char *)&v27 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_1DD1C1A80();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v21, 1, 1, v22);
  v23 = sub_1DD1C1DA4();
  MEMORY[0x1E0C80A78](v23);
  (*(void (**)(char *, _QWORD))(v25 + 104))((char *)&v27 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x1E0C91740]);
  return sub_1DD1C1BC4();
}

uint64_t variable initialization expression of UpdateContactIntent._nameSuffix()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t, uint64_t);
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;

  v0 = sub_1DD1C2014();
  v1 = MEMORY[0x1E0C80A78](v0);
  MEMORY[0x1E0C80A78](v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96C0);
  MEMORY[0x1E0C80A78](v2);
  v28 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1DD1C1EDC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1DD1C1F84();
  MEMORY[0x1E0C80A78](v8);
  v9 = sub_1DD1C1EE8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v29 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  v12 = *MEMORY[0x1E0CAF9B8];
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 104);
  v13(v7, v12, v4);
  sub_1DD1C1EF4();
  sub_1DD1C1FCC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96D8);
  sub_1DD1C1F78();
  v13(v7, v12, v4);
  v14 = v28;
  sub_1DD1C1EF4();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v14, 0, 1, v9);
  v30 = 0;
  v31 = 0;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96E0);
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_1DD1C1FC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v17, 1, 1, v18);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96D0);
  MEMORY[0x1E0C80A78](v19);
  v21 = (char *)&v27 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_1DD1C1A80();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v21, 1, 1, v22);
  v23 = sub_1DD1C1DA4();
  MEMORY[0x1E0C80A78](v23);
  (*(void (**)(char *, _QWORD))(v25 + 104))((char *)&v27 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x1E0C91740]);
  return sub_1DD1C1BC4();
}

uint64_t variable initialization expression of UpdateContactIntent._phoneNumber()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t, uint64_t);
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;

  v0 = sub_1DD1C2014();
  v1 = MEMORY[0x1E0C80A78](v0);
  MEMORY[0x1E0C80A78](v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96C0);
  MEMORY[0x1E0C80A78](v2);
  v28 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1DD1C1EDC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1DD1C1F84();
  MEMORY[0x1E0C80A78](v8);
  v9 = sub_1DD1C1EE8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v29 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  v12 = *MEMORY[0x1E0CAF9B8];
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 104);
  v13(v7, v12, v4);
  sub_1DD1C1EF4();
  sub_1DD1C1FCC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96D8);
  sub_1DD1C1F78();
  v13(v7, v12, v4);
  v14 = v28;
  sub_1DD1C1EF4();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v14, 0, 1, v9);
  v30 = 0;
  v31 = 0;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96E0);
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_1DD1C1FC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v17, 1, 1, v18);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96D0);
  MEMORY[0x1E0C80A78](v19);
  v21 = (char *)&v27 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_1DD1C1A80();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v21, 1, 1, v22);
  v23 = sub_1DD1C1DA4();
  MEMORY[0x1E0C80A78](v23);
  (*(void (**)(char *, _QWORD))(v25 + 104))((char *)&v27 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x1E0C91740]);
  return sub_1DD1C1BC4();
}

uint64_t variable initialization expression of UpdateContactIntent._emailAddress()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t, uint64_t);
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;

  v0 = sub_1DD1C2014();
  v1 = MEMORY[0x1E0C80A78](v0);
  MEMORY[0x1E0C80A78](v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96C0);
  MEMORY[0x1E0C80A78](v2);
  v28 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1DD1C1EDC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1DD1C1F84();
  MEMORY[0x1E0C80A78](v8);
  v9 = sub_1DD1C1EE8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v29 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  v12 = *MEMORY[0x1E0CAF9B8];
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 104);
  v13(v7, v12, v4);
  sub_1DD1C1EF4();
  sub_1DD1C1FCC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96D8);
  sub_1DD1C1F78();
  v13(v7, v12, v4);
  v14 = v28;
  sub_1DD1C1EF4();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v14, 0, 1, v9);
  v30 = 0;
  v31 = 0;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96E0);
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_1DD1C1FC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v17, 1, 1, v18);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96D0);
  MEMORY[0x1E0C80A78](v19);
  v21 = (char *)&v27 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_1DD1C1A80();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v21, 1, 1, v22);
  v23 = sub_1DD1C1DA4();
  MEMORY[0x1E0C80A78](v23);
  (*(void (**)(char *, _QWORD))(v25 + 104))((char *)&v27 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x1E0C91740]);
  return sub_1DD1C1BC4();
}

uint64_t variable initialization expression of UpdateContactIntent._postalAddress()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t, uint64_t);
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;

  v0 = sub_1DD1C2014();
  v1 = MEMORY[0x1E0C80A78](v0);
  MEMORY[0x1E0C80A78](v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96C0);
  MEMORY[0x1E0C80A78](v2);
  v28 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1DD1C1EDC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1DD1C1F84();
  MEMORY[0x1E0C80A78](v8);
  v9 = sub_1DD1C1EE8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v29 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  v12 = *MEMORY[0x1E0CAF9B8];
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 104);
  v13(v7, v12, v4);
  sub_1DD1C1EF4();
  sub_1DD1C1FCC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96D8);
  sub_1DD1C1F78();
  v13(v7, v12, v4);
  v14 = v28;
  sub_1DD1C1EF4();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v14, 0, 1, v9);
  v30 = 0;
  v31 = 0;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96E0);
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_1DD1C1FC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v17, 1, 1, v18);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96D0);
  MEMORY[0x1E0C80A78](v19);
  v21 = (char *)&v27 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_1DD1C1A80();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v21, 1, 1, v22);
  v23 = sub_1DD1C1DA4();
  MEMORY[0x1E0C80A78](v23);
  (*(void (**)(char *, _QWORD))(v25 + 104))((char *)&v27 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x1E0C91740]);
  return sub_1DD1C1BC4();
}

uint64_t variable initialization expression of UpdateContactIntent._birthday()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t, uint64_t);
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  char *v27;
  char *v28;

  v0 = sub_1DD1C2014();
  v1 = MEMORY[0x1E0C80A78](v0);
  MEMORY[0x1E0C80A78](v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96C0);
  MEMORY[0x1E0C80A78](v2);
  v27 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1DD1C1EDC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1DD1C1F84();
  MEMORY[0x1E0C80A78](v8);
  v9 = sub_1DD1C1EE8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v28 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  v12 = *MEMORY[0x1E0CAF9B8];
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 104);
  v13(v7, v12, v4);
  sub_1DD1C1EF4();
  sub_1DD1C1FCC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9740);
  sub_1DD1C1F78();
  v13(v7, v12, v4);
  v14 = v27;
  sub_1DD1C1EF4();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v14, 0, 1, v9);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96D0);
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_1DD1C1A80();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v17, 1, 1, v18);
  v19 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F03C9748);
  MEMORY[0x1E0C80A78](v19);
  (*(void (**)(char *, _QWORD))(v21 + 104))((char *)&v26 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x1E0C90D68]);
  v22 = sub_1DD1C1DA4();
  MEMORY[0x1E0C80A78](v22);
  (*(void (**)(char *, _QWORD))(v24 + 104))((char *)&v26 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x1E0C91740]);
  return sub_1DD1C1BB8();
}

_QWORD *sub_1DD19F840()
{
  _QWORD **v0;
  _QWORD *v1;
  _QWORD *result;

  v1 = *v0;
  result = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  *v0 = v1;
  if (!(_DWORD)result)
  {
    result = sub_1DD19F8C8(result, v1[2] + 1, 1, v1);
    *v0 = result;
  }
  return result;
}

_QWORD *sub_1DD19F888(_QWORD *result)
{
  _QWORD **v1;
  unint64_t v2;

  v2 = (*v1)[3];
  if ((uint64_t)result + 1 > (uint64_t)(v2 >> 1))
  {
    result = sub_1DD19F8C8((_QWORD *)(v2 > 1), (int64_t)result + 1, 1, *v1);
    *v1 = result;
  }
  return result;
}

_QWORD *sub_1DD19F8C8(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F03C9D00);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      v13 = (_QWORD *)(MEMORY[0x1E0DEE9D8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_1DD1A0478(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1DD19F9D4(uint64_t a1, unint64_t a2)
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

id _s14ContactsUICore12CNUINameDropC19getFieldPreferences3forSo9CNContactCAGSg_tFZ_0(id a1)
{
  id v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  uint64_t v37;
  id v38;
  char v39;
  id v40;
  int v41;
  id v42;
  id v43;
  id v44;
  uint64_t v45;
  id v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;

  v2 = sub_1DD195C68();
  if (!v2)
  {
    v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C97360]), sel_init);
    v17 = sub_1DD19616C();
    if (v18)
    {
      v19 = v17;
      v20 = v18;
      if (qword_1F03C95A0 != -1)
        swift_once();
      v21 = sub_1DD1C1FA8();
      __swift_project_value_buffer(v21, (uint64_t)qword_1F03C95A8);
      v22 = sub_1DD1C1F90();
      v23 = sub_1DD1C20EC();
      if (os_log_type_enabled(v22, v23))
      {
        v24 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v24 = 0;
        _os_log_impl(&dword_1DD140000, v22, v23, "Using legacy NameDrop handle pref", v24, 2u);
        MEMORY[0x1DF0D66B8](v24, -1, -1);
      }

      v53 = v19;
      v54 = v20;
      v52 = 64;
      sub_1DD1A05C8();
      if ((sub_1DD1C2134() & 1) != 0)
      {
        v25 = (void *)sub_1DD1C2020();
        swift_bridgeObjectRelease();
        v26 = objc_allocWithZone(MEMORY[0x1E0C97338]);
        v27 = (void *)sub_1DD1C2020();
        objc_msgSend(v26, sel_initWithLabel_value_, v27, v25);

        v28 = objc_msgSend(v12, sel_emailAddresses);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9678);
        v29 = sub_1DD1C2080();

        v53 = v29;
        MEMORY[0x1DF0D59F8]();
        if (*(_QWORD *)((v53 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v53 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_1DD1C20A4();
        sub_1DD1C20B0();
        sub_1DD1C2098();
        v30 = (void *)sub_1DD1C2074();
        swift_bridgeObjectRelease();
        objc_msgSend(v12, sel_setEmailAddresses_, v30);
      }
      else
      {
        v31 = objc_allocWithZone(MEMORY[0x1E0C97398]);
        v32 = (void *)sub_1DD1C2020();
        swift_bridgeObjectRelease();
        v33 = objc_msgSend(v31, sel_initWithStringValue_, v32);

        v34 = objc_allocWithZone(MEMORY[0x1E0C97338]);
        v35 = (void *)sub_1DD1C2020();
        objc_msgSend(v34, sel_initWithLabel_value_, v35, v33);

        v36 = objc_msgSend(v12, sel_phoneNumbers);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9678);
        v37 = sub_1DD1C2080();

        v53 = v37;
        MEMORY[0x1DF0D59F8]();
        if (*(_QWORD *)((v53 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v53 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_1DD1C20A4();
        sub_1DD1C20B0();
        sub_1DD1C2098();
        v30 = (void *)sub_1DD1C2074();
        swift_bridgeObjectRelease();
        objc_msgSend(v12, sel_setPhoneNumbers_, v30);
      }

    }
    if (!a1)
      return v12;
    a1 = a1;
    v38 = objc_msgSend(a1, sel_givenName);
    if (!v38)
    {
      sub_1DD1C202C();
      v38 = (id)sub_1DD1C2020();
      swift_bridgeObjectRelease();
    }
    v39 = CNIsChineseJapaneseKoreanString();

    if ((v39 & 1) != 0)
      goto LABEL_39;
    v40 = objc_msgSend(a1, sel_familyName);
    if (!v40)
    {
      sub_1DD1C202C();
      v40 = (id)sub_1DD1C2020();
      swift_bridgeObjectRelease();
    }
    v41 = CNIsChineseJapaneseKoreanString();

    if (v41)
    {
LABEL_39:
      v42 = objc_msgSend(a1, sel_phoneticGivenName);
      if (!v42)
      {
        sub_1DD1C202C();
        v42 = (id)sub_1DD1C2020();
        swift_bridgeObjectRelease();
      }
      objc_msgSend(v12, sel_setPhoneticGivenName_, v42);

      v43 = objc_msgSend(a1, sel_phoneticMiddleName);
      if (!v43)
      {
        sub_1DD1C202C();
        v43 = (id)sub_1DD1C2020();
        swift_bridgeObjectRelease();
      }
      objc_msgSend(v12, sel_setPhoneticMiddleName_, v43);

      v44 = objc_msgSend(a1, sel_phoneticFamilyName);
      if (!v44)
      {
        sub_1DD1C202C();
        v44 = (id)sub_1DD1C2020();
        swift_bridgeObjectRelease();
      }
      objc_msgSend(v12, sel_setPhoneticFamilyName_, v44);

    }
    goto LABEL_47;
  }
  v3 = qword_1F03C95A0;
  v4 = v2;
  if (v3 != -1)
    swift_once();
  v5 = sub_1DD1C1FA8();
  __swift_project_value_buffer(v5, (uint64_t)qword_1F03C95A8);
  v6 = sub_1DD1C1F90();
  v7 = sub_1DD1C20EC();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1DD140000, v6, v7, "Using NameDrop field pref", v8, 2u);
    MEMORY[0x1DF0D66B8](v8, -1, -1);
  }

  if (qword_1F03C95C0 != -1)
    swift_once();
  v9 = (void *)qword_1F03C95C8;
  if (qword_1F03C95C8
    && (v10 = (void *)sub_1DD1C2020(), v11 = objc_msgSend(v9, sel_BOOLForKey_, v10),
                                       v10,
                                       v11))
  {
    if (!a1)
    {

      return v4;
    }
    a1 = a1;
    objc_msgSend(v4, sel_mutableCopy);

    sub_1DD1C2140();
    swift_unknownObjectRelease();
    sub_1DD1A0658(0, (unint64_t *)&qword_1F03C9670);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v12 = (id)v52;
      v13 = sub_1DD1C1F90();
      v14 = sub_1DD1C20EC();
      if (os_log_type_enabled(v13, v14))
      {
        v15 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1DD140000, v13, v14, "Using NameDrop pronoun pref", v15, 2u);
        MEMORY[0x1DF0D66B8](v15, -1, -1);
      }

      v16 = objc_msgSend(a1, sel_addressingGrammars);
      if (!v16)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9678);
        sub_1DD1C2080();
        v16 = (id)sub_1DD1C2074();
        swift_bridgeObjectRelease();
      }
      objc_msgSend((id)v52, sel_setAddressingGrammars_, v16);

      goto LABEL_47;
    }

  }
  else
  {

    if (!a1)
      return v4;
  }
  v12 = v4;
LABEL_47:
  v45 = qword_1F03C95D0;
  v46 = a1;
  if (v45 != -1)
    swift_once();
  v47 = off_1F03C95D8;
  objc_msgSend(v12, sel_mutableCopy);
  sub_1DD1C2140();
  swift_unknownObjectRelease();
  sub_1DD1A0658(0, (unint64_t *)&qword_1F03C9670);
  swift_dynamicCast();
  v4 = (id)v52;
  v48 = v47[2];
  if (v48)
  {
    swift_bridgeObjectRetain();
    v49 = v47 + 5;
    do
    {
      v50 = *v49;
      v53 = *(v49 - 1);
      v54 = v50;
      swift_bridgeObjectRetain();
      sub_1DD199464(&v53, v12, v46, (void *)v52);
      swift_bridgeObjectRelease();
      v49 += 2;
      --v48;
    }
    while (v48);

    swift_bridgeObjectRelease();
  }
  else
  {

  }
  return v4;
}

uint64_t sub_1DD1A031C()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

unint64_t sub_1DD1A0340()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F03C96B0;
  if (!qword_1F03C96B0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_1F03C9CF0);
    result = MEMORY[0x1DF0D6658](MEMORY[0x1E0DEAF20], v1);
    atomic_store(result, (unint64_t *)&qword_1F03C96B0);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1DF0D664C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for CNUINameDrop()
{
  return objc_opt_self();
}

unint64_t sub_1DD1A03F0()
{
  unint64_t result;

  result = qword_1F03C9708;
  if (!qword_1F03C9708)
  {
    result = MEMORY[0x1DF0D6658](&protocol conformance descriptor for ContactLabeledValueEntity, &type metadata for ContactLabeledValueEntity);
    atomic_store(result, (unint64_t *)&qword_1F03C9708);
  }
  return result;
}

unint64_t sub_1DD1A0434()
{
  unint64_t result;

  result = qword_1F03C9720;
  if (!qword_1F03C9720)
  {
    result = MEMORY[0x1DF0D6658](&protocol conformance descriptor for ContactEntity, &type metadata for ContactEntity);
    atomic_store(result, (unint64_t *)&qword_1F03C9720);
  }
  return result;
}

uint64_t sub_1DD1A0478(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_1DD1C21E8();
  __break(1u);
  return result;
}

unint64_t sub_1DD1A056C()
{
  unint64_t result;

  result = qword_1F03C97C0;
  if (!qword_1F03C97C0)
  {
    result = MEMORY[0x1DF0D6658](MEMORY[0x1E0CB1A70], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1F03C97C0);
  }
  return result;
}

uint64_t sub_1DD1A05B0(__int128 *a1, uint64_t a2)
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

unint64_t sub_1DD1A05C8()
{
  unint64_t result;

  result = qword_1F03C97C8;
  if (!qword_1F03C97C8)
  {
    result = MEMORY[0x1DF0D6658](MEMORY[0x1E0DEA9B8], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1F03C97C8);
  }
  return result;
}

_OWORD *sub_1DD1A060C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1DD1A061C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1DD1A0658(uint64_t a1, unint64_t *a2)
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

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_1DD1A06B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C97E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DD1A06F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C97E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DD1A0740(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_1DD1A07BC()
{
  uint64_t v0;

  v0 = sub_1DD1C1FA8();
  __swift_allocate_value_buffer(v0, qword_1F03CC040);
  __swift_project_value_buffer(v0, (uint64_t)qword_1F03CC040);
  return sub_1DD1C1F9C();
}

uint64_t static CNContactsAppIntentDependencyManager.setupAppIntentDependencies()()
{
  id v0;
  _BYTE v2[40];

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C97298]), sel_init);
  type metadata accessor for ContactEntityProvider();
  swift_allocObject();
  sub_1DD1A6B34(v0, 0);
  sub_1DD1C19F0();
  sub_1DD1C19E4();
  if (qword_1F03C7E40 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  sub_1DD1C2158();
  sub_1DD1C1C0C();
  sub_1DD1C19D8();

  swift_release();
  swift_release_n();
  return sub_1DD1A0C94((uint64_t)v2);
}

uint64_t static CNContactsAppIntentDependencyManager.setupAppIntentDependencies(with:)(uint64_t a1)
{
  id v2;
  _BYTE v4[40];

  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C97298]), sel_init);
  type metadata accessor for ContactEntityProvider();
  swift_allocObject();
  swift_unknownObjectRetain();
  sub_1DD1A6B34(v2, a1);
  swift_unknownObjectRelease();
  sub_1DD1C19F0();
  sub_1DD1C19E4();
  if (qword_1F03C7E40 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  sub_1DD1C2158();
  sub_1DD1C1C0C();
  sub_1DD1C19D8();

  swift_release();
  swift_release_n();
  return sub_1DD1A0C94((uint64_t)v4);
}

CNContactsAppIntentDependencyManager __swiftcall CNContactsAppIntentDependencyManager.init()()
{
  return (CNContactsAppIntentDependencyManager)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

id CNContactsAppIntentDependencyManager.init()()
{
  objc_super v1;

  v1.super_class = (Class)CNContactsAppIntentDependencyManager;
  return objc_msgSendSuper2(&v1, sel_init);
}

uint64_t sub_1DD1A0B50(uint64_t a1)
{
  id v2;
  _BYTE v4[40];

  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C97298]), sel_init);
  type metadata accessor for ContactEntityProvider();
  swift_allocObject();
  swift_unknownObjectRetain();
  sub_1DD1A6B34(v2, a1);
  swift_unknownObjectRelease();
  sub_1DD1C19F0();
  sub_1DD1C19E4();
  if (qword_1F03C7E40 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  sub_1DD1C2158();
  sub_1DD1C1C0C();
  sub_1DD1C19D8();

  swift_release();
  swift_release_n();
  return sub_1DD1A0C94((uint64_t)v4);
}

uint64_t sub_1DD1A0C88@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = v1;
  return sub_1DD1C1C0C();
}

uint64_t sub_1DD1A0C94(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(qword_1F03C7E48);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t type metadata accessor for CNContactsAppIntentDependencyManager()
{
  unint64_t result;

  result = qword_1F03C9970;
  if (!qword_1F03C9970)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1F03C9970);
  }
  return result;
}

void *SearchInContactsIntent.openAppWhenRun.unsafeMutableAddressor()
{
  return &static SearchInContactsIntent.openAppWhenRun;
}

uint64_t static SearchInContactsIntent.openAppWhenRun.getter()
{
  return 1;
}

void *SearchInContactsIntent.assistantOnly.unsafeMutableAddressor()
{
  return &static SearchInContactsIntent.assistantOnly;
}

uint64_t static SearchInContactsIntent.assistantOnly.getter()
{
  return 1;
}

uint64_t sub_1DD1A0D3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v0 = sub_1DD1C1EDC();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1DD1C1F84();
  MEMORY[0x1E0C80A78](v4);
  v5 = sub_1DD1C2014();
  MEMORY[0x1E0C80A78](v5);
  v6 = sub_1DD1C1EE8();
  __swift_allocate_value_buffer(v6, static SearchInContactsIntent.title);
  __swift_project_value_buffer(v6, (uint64_t)static SearchInContactsIntent.title);
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E0CAF9B8], v0);
  return sub_1DD1C1EF4();
}

uint64_t SearchInContactsIntent.title.unsafeMutableAddressor()
{
  return sub_1DD1A11AC(&qword_1F03C95E8, (uint64_t (*)(_QWORD))MEMORY[0x1E0CAF9F8], (uint64_t)static SearchInContactsIntent.title);
}

uint64_t static SearchInContactsIntent.title.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1F03C95E8 != -1)
    swift_once();
  v2 = sub_1DD1C1EE8();
  v3 = __swift_project_value_buffer(v2, (uint64_t)static SearchInContactsIntent.title);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_1DD1A0F54()
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
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[2];

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96C0);
  MEMORY[0x1E0C80A78](v0);
  v12[0] = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = sub_1DD1C1EDC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1DD1C1F84();
  MEMORY[0x1E0C80A78](v6);
  v7 = sub_1DD1C2014();
  MEMORY[0x1E0C80A78](v7);
  v8 = sub_1DD1C1EE8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v10 = sub_1DD1C1CD8();
  __swift_allocate_value_buffer(v10, static SearchInContactsIntent.description);
  __swift_project_value_buffer(v10, (uint64_t)static SearchInContactsIntent.description);
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x1E0CAF9B8], v2);
  sub_1DD1C1EF4();
  (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(v9 + 56))(v12[0], 1, 1, v8);
  return sub_1DD1C1CE4();
}

uint64_t SearchInContactsIntent.description.unsafeMutableAddressor()
{
  return sub_1DD1A11AC(&qword_1F03C95F0, (uint64_t (*)(_QWORD))MEMORY[0x1E0C91130], (uint64_t)static SearchInContactsIntent.description);
}

uint64_t sub_1DD1A11AC(_QWORD *a1, uint64_t (*a2)(_QWORD), uint64_t a3)
{
  uint64_t v5;

  if (*a1 != -1)
    swift_once();
  v5 = a2(0);
  return __swift_project_value_buffer(v5, a3);
}

uint64_t static SearchInContactsIntent.description.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1F03C95F0 != -1)
    swift_once();
  v2 = sub_1DD1C1CD8();
  v3 = __swift_project_value_buffer(v2, (uint64_t)static SearchInContactsIntent.description);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t static SearchInContactsIntent.description.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (qword_1F03C95F0 != -1)
    swift_once();
  v2 = sub_1DD1C1CD8();
  v3 = __swift_project_value_buffer(v2, (uint64_t)static SearchInContactsIntent.description);
  swift_beginAccess();
  v4 = *(_QWORD *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*static SearchInContactsIntent.description.modify())()
{
  uint64_t v0;

  if (qword_1F03C95F0 != -1)
    swift_once();
  v0 = sub_1DD1C1CD8();
  __swift_project_value_buffer(v0, (uint64_t)static SearchInContactsIntent.description);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_1DD1A13B4()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C99C8);
  v0 = sub_1DD1C1CF0();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1DD1C8FF0;
  result = (*(uint64_t (**)(unint64_t, _QWORD, uint64_t))(v1 + 104))(v3 + v2, *MEMORY[0x1E0C911C8], v0);
  static SearchInContactsIntent.searchScopes = v3;
  return result;
}

uint64_t *SearchInContactsIntent.searchScopes.unsafeMutableAddressor()
{
  if (qword_1F03C95F8 != -1)
    swift_once();
  return &static SearchInContactsIntent.searchScopes;
}

uint64_t static SearchInContactsIntent.searchScopes.getter()
{
  if (qword_1F03C95F8 != -1)
    swift_once();
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t static SearchInContactsIntent.searchScopes.setter(uint64_t a1)
{
  if (qword_1F03C95F8 != -1)
    swift_once();
  swift_beginAccess();
  static SearchInContactsIntent.searchScopes = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*static SearchInContactsIntent.searchScopes.modify())()
{
  if (qword_1F03C95F8 != -1)
    swift_once();
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t SearchInContactsIntent.criteria.getter()
{
  return sub_1DD1C1B7C();
}

uint64_t SearchInContactsIntent.criteria.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_1DD1C1D2C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  sub_1DD1C1B88();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

uint64_t (*SearchInContactsIntent.criteria.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1DD1C1B70();
  return sub_1DD1A16D4;
}

uint64_t SearchInContactsIntent.$criteria.getter()
{
  return sub_1DD1C1B94();
}

uint64_t SearchInContactsIntent.perform()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[4] = a2;
  v3[5] = a3;
  v3[3] = a1;
  sub_1DD1C20E0();
  v3[6] = sub_1DD1C20D4();
  sub_1DD1C20C8();
  return swift_task_switch();
}

uint64_t sub_1DD1A176C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  swift_release();
  sub_1DD1C19B4();
  v1 = *(void **)(*(_QWORD *)(v0 + 16) + 24);
  swift_unknownObjectRetain();
  swift_release();
  if (v1)
  {
    v2 = sub_1DD1C1D2C();
    v3 = *(_QWORD *)(v2 - 8);
    v4 = swift_task_alloc();
    sub_1DD1C1B7C();
    sub_1DD1C1D20();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v4, v2);
    v5 = (void *)sub_1DD1C2020();
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    objc_msgSend(v1, sel_searchForString_, v5);

    sub_1DD1C1AEC();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_1DD1A20CC();
    swift_allocError();
    swift_willThrow();
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DD1A18B0@<X0>(_QWORD *a1@<X8>)
{
  if (qword_1F03C95F8 != -1)
    swift_once();
  swift_beginAccess();
  *a1 = static SearchInContactsIntent.searchScopes;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1DD1A1924()
{
  return sub_1DD1C1B7C();
}

uint64_t sub_1DD1A1944(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_1DD1C1D2C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  sub_1DD1C1B88();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

uint64_t (*sub_1DD1A19DC(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1DD1C1B70();
  return sub_1DD1A16D4;
}

void sub_1DD1A1A24(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 32))(*a1, 0);
  free(v1);
}

uint64_t sub_1DD1A1A54@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1F03C95E8 != -1)
    swift_once();
  v2 = sub_1DD1C1EE8();
  v3 = __swift_project_value_buffer(v2, (uint64_t)static SearchInContactsIntent.title);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_1DD1A1AC4()
{
  return 1;
}

uint64_t sub_1DD1A1ACC()
{
  return sub_1DD1C1A44();
}

uint64_t sub_1DD1A1AE0()
{
  return MEMORY[0x1DF0D53B0]() & 1;
}

uint64_t sub_1DD1A1AF8()
{
  return sub_1DD1C1A2C();
}

uint64_t sub_1DD1A1B0C()
{
  return sub_1DD1C1A14();
}

uint64_t sub_1DD1A1B20(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v5 = *v1;
  v4 = v1[1];
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_1DD1A1B84;
  return SearchInContactsIntent.perform()(a1, v5, v4);
}

uint64_t sub_1DD1A1B84()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1DD1A1BCC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = _s14ContactsUICore08SearchInA6IntentVACycfC_0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1DD1A1BF0()
{
  sub_1DD1A21A8();
  return sub_1DD1C1A50();
}

uint64_t sub_1DD1A1C1C()
{
  sub_1DD1C2230();
  sub_1DD1C223C();
  return sub_1DD1C2248();
}

uint64_t sub_1DD1A1C5C()
{
  return sub_1DD1C223C();
}

uint64_t sub_1DD1A1C80()
{
  sub_1DD1C2230();
  sub_1DD1C223C();
  return sub_1DD1C2248();
}

uint64_t _s14ContactsUICore08SearchInA6IntentVACycfC_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v0 = sub_1DD1C2014();
  v1 = MEMORY[0x1E0C80A78](v0);
  MEMORY[0x1E0C80A78](v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96C0);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1DD1C1EDC();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1DD1C1F84();
  MEMORY[0x1E0C80A78](v9);
  v23 = sub_1DD1C1EE8();
  v21 = *(_QWORD *)(v23 - 8);
  MEMORY[0x1E0C80A78](v23);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9D10);
  if (qword_1F03C7E40 != -1)
    swift_once();
  v24 = qword_1F03CC020;
  v25 = *(_QWORD *)algn_1F03CC028;
  swift_bridgeObjectRetain();
  sub_1DD1C2158();
  sub_1DD1C19F0();
  sub_1DD1C19E4();
  v22 = sub_1DD1C19CC();
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  v10 = *MEMORY[0x1E0CAF9B8];
  v11 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 104);
  v11(v8, v10, v5);
  sub_1DD1C1EF4();
  sub_1DD1C1FCC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96C8);
  sub_1DD1C1F78();
  v11(v8, v10, v5);
  sub_1DD1C1EF4();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v4, 0, 1, v23);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96D0);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_1DD1C1A80();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v14, 1, 1, v15);
  v16 = sub_1DD1C1DA4();
  MEMORY[0x1E0C80A78](v16);
  (*(void (**)(char *, _QWORD))(v18 + 104))((char *)&v20 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x1E0C91740]);
  sub_1DD1C1BAC();
  return v22;
}

unint64_t sub_1DD1A20CC()
{
  unint64_t result;

  result = qword_1F03C9980;
  if (!qword_1F03C9980)
  {
    result = MEMORY[0x1DF0D6658](&unk_1DD1C9210, &type metadata for SearchInContactsIntent.SearchInContactsError);
    atomic_store(result, (unint64_t *)&qword_1F03C9980);
  }
  return result;
}

unint64_t sub_1DD1A2114()
{
  unint64_t result;

  result = qword_1F03C9988;
  if (!qword_1F03C9988)
  {
    result = MEMORY[0x1DF0D6658](&protocol conformance descriptor for SearchInContactsIntent, &type metadata for SearchInContactsIntent);
    atomic_store(result, (unint64_t *)&qword_1F03C9988);
  }
  return result;
}

unint64_t sub_1DD1A215C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F03C9990;
  if (!qword_1F03C9990)
  {
    v1 = sub_1DD1C1D2C();
    result = MEMORY[0x1DF0D6658](MEMORY[0x1E0C913E8], v1);
    atomic_store(result, (unint64_t *)&qword_1F03C9990);
  }
  return result;
}

unint64_t sub_1DD1A21A8()
{
  unint64_t result;

  result = qword_1F03C9998;
  if (!qword_1F03C9998)
  {
    result = MEMORY[0x1DF0D6658](&protocol conformance descriptor for SearchInContactsIntent, &type metadata for SearchInContactsIntent);
    atomic_store(result, (unint64_t *)&qword_1F03C9998);
  }
  return result;
}

unint64_t sub_1DD1A21F0()
{
  unint64_t result;

  result = qword_1F03C99A0;
  if (!qword_1F03C99A0)
  {
    result = MEMORY[0x1DF0D6658](&protocol conformance descriptor for SearchInContactsIntent, &type metadata for SearchInContactsIntent);
    atomic_store(result, (unint64_t *)&qword_1F03C99A0);
  }
  return result;
}

unint64_t sub_1DD1A2238()
{
  unint64_t result;

  result = qword_1F03C99A8;
  if (!qword_1F03C99A8)
  {
    result = MEMORY[0x1DF0D6658](&protocol conformance descriptor for SearchInContactsIntent, &type metadata for SearchInContactsIntent);
    atomic_store(result, (unint64_t *)&qword_1F03C99A8);
  }
  return result;
}

uint64_t sub_1DD1A227C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1DD1A228C()
{
  sub_1DD1A21A8();
  return swift_getOpaqueTypeConformance2();
}

uint64_t destroy for SearchInContactsIntent()
{
  swift_release();
  return swift_release();
}

_QWORD *_s14ContactsUICore22SearchInContactsIntentVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  return a1;
}

_QWORD *assignWithCopy for SearchInContactsIntent(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  sub_1DD1C1C0C();
  swift_release();
  a1[1] = a2[1];
  sub_1DD1C1C0C();
  swift_release();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for SearchInContactsIntent(_OWORD *a1, _OWORD *a2)
{
  swift_release();
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SearchInContactsIntent(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SearchInContactsIntent(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SearchInContactsIntent()
{
  return &type metadata for SearchInContactsIntent;
}

unint64_t sub_1DD1A2468()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F03C9CE0;
  if (!qword_1F03C9CE0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F03C99B8);
    result = MEMORY[0x1DF0D6658](MEMORY[0x1E0C91598], v1);
    atomic_store(result, (unint64_t *)&qword_1F03C9CE0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SearchInContactsIntent.SearchInContactsError(unsigned int *a1, int a2)
{
  int v2;
  int v3;

  if (!a2)
    return 0;
  if ((a2 + 1) >= 0x10000)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) < 0x100)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
    return *a1;
  if (v3 == 2)
    return *(unsigned __int16 *)a1;
  return *(unsigned __int8 *)a1;
}

uint64_t storeEnumTagSinglePayload for SearchInContactsIntent.SearchInContactsError(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_1DD1A254C + 4 * byte_1DD1C9000[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1DD1A256C + 4 * byte_1DD1C9005[v4]))();
}

_BYTE *sub_1DD1A254C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1DD1A256C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1DD1A2574(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1DD1A257C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1DD1A2584(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1DD1A258C(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_1DD1A2598()
{
  return 0;
}

ValueMetadata *type metadata accessor for SearchInContactsIntent.SearchInContactsError()
{
  return &type metadata for SearchInContactsIntent.SearchInContactsError;
}

unint64_t sub_1DD1A25B8()
{
  unint64_t result;

  result = qword_1F03C99C0;
  if (!qword_1F03C99C0)
  {
    result = MEMORY[0x1DF0D6658](&unk_1DD1C91E8, &type metadata for SearchInContactsIntent.SearchInContactsError);
    atomic_store(result, (unint64_t *)&qword_1F03C99C0);
  }
  return result;
}

uint64_t sub_1DD1A2600()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v0 = sub_1DD1C2014();
  MEMORY[0x1E0C80A78](v0);
  v1 = sub_1DD1C1EDC();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1DD1C1F84();
  MEMORY[0x1E0C80A78](v5);
  v6 = sub_1DD1C1EE8();
  __swift_allocate_value_buffer(v6, static CreateContactIntent.title);
  __swift_project_value_buffer(v6, (uint64_t)static CreateContactIntent.title);
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x1E0CAF9B8], v1);
  return sub_1DD1C1EF4();
}

uint64_t CreateContactIntent.title.unsafeMutableAddressor()
{
  return sub_1DD1A11AC(&qword_1F03C9600, (uint64_t (*)(_QWORD))MEMORY[0x1E0CAF9F8], (uint64_t)static CreateContactIntent.title);
}

uint64_t static CreateContactIntent.title.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DD1A2AEC(&qword_1F03C9600, (uint64_t (*)(_QWORD))MEMORY[0x1E0CAF9F8], (uint64_t)static CreateContactIntent.title, a1);
}

uint64_t static CreateContactIntent.title.setter(uint64_t a1)
{
  return sub_1DD1A2B9C(a1, &qword_1F03C9600, (uint64_t (*)(_QWORD))MEMORY[0x1E0CAF9F8], (uint64_t)static CreateContactIntent.title);
}

uint64_t (*static CreateContactIntent.title.modify())()
{
  uint64_t v0;

  if (qword_1F03C9600 != -1)
    swift_once();
  v0 = sub_1DD1C1EE8();
  __swift_project_value_buffer(v0, (uint64_t)static CreateContactIntent.title);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1DD1A2870()
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
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[2];

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96C0);
  MEMORY[0x1E0C80A78](v0);
  v12[0] = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = sub_1DD1C1EDC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1DD1C1F84();
  MEMORY[0x1E0C80A78](v6);
  v7 = sub_1DD1C2014();
  MEMORY[0x1E0C80A78](v7);
  v8 = sub_1DD1C1EE8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v10 = sub_1DD1C1CD8();
  __swift_allocate_value_buffer(v10, static CreateContactIntent.description);
  __swift_project_value_buffer(v10, (uint64_t)static CreateContactIntent.description);
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x1E0CAF9B8], v2);
  sub_1DD1C1EF4();
  (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(v9 + 56))(v12[0], 1, 1, v8);
  return sub_1DD1C1CE4();
}

uint64_t CreateContactIntent.description.unsafeMutableAddressor()
{
  return sub_1DD1A11AC(&qword_1F03C9608, (uint64_t (*)(_QWORD))MEMORY[0x1E0C91130], (uint64_t)static CreateContactIntent.description);
}

uint64_t static CreateContactIntent.description.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DD1A2AEC(&qword_1F03C9608, (uint64_t (*)(_QWORD))MEMORY[0x1E0C91130], (uint64_t)static CreateContactIntent.description, a1);
}

uint64_t sub_1DD1A2AEC@<X0>(_QWORD *a1@<X0>, uint64_t (*a2)(_QWORD)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;

  if (*a1 != -1)
    swift_once();
  v7 = a2(0);
  v8 = __swift_project_value_buffer(v7, a3);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a4, v8, v7);
}

uint64_t static CreateContactIntent.description.setter(uint64_t a1)
{
  return sub_1DD1A2B9C(a1, &qword_1F03C9608, (uint64_t (*)(_QWORD))MEMORY[0x1E0C91130], (uint64_t)static CreateContactIntent.description);
}

uint64_t sub_1DD1A2B9C(uint64_t a1, _QWORD *a2, uint64_t (*a3)(_QWORD), uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (*a2 != -1)
    swift_once();
  v7 = a3(0);
  v8 = __swift_project_value_buffer(v7, a4);
  swift_beginAccess();
  v9 = *(_QWORD *)(v7 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 24))(v8, a1, v7);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(a1, v7);
}

uint64_t (*static CreateContactIntent.description.modify())()
{
  uint64_t v0;

  if (qword_1F03C9608 != -1)
    swift_once();
  v0 = sub_1DD1C1CD8();
  __swift_project_value_buffer(v0, (uint64_t)static CreateContactIntent.description);
  swift_beginAccess();
  return j__swift_endAccess;
}

void *CreateContactIntent.assistantOnly.unsafeMutableAddressor()
{
  return &static CreateContactIntent.assistantOnly;
}

uint64_t static CreateContactIntent.assistantOnly.getter()
{
  return 1;
}

uint64_t CreateContactIntent.namePrefix.getter()
{
  uint64_t v1;

  sub_1DD1C1B7C();
  return v1;
}

uint64_t CreateContactIntent.namePrefix.setter()
{
  return sub_1DD1C1B88();
}

uint64_t (*CreateContactIntent.namePrefix.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1DD1C1B70();
  return sub_1DD1A16D4;
}

uint64_t CreateContactIntent.$namePrefix.getter()
{
  return sub_1DD1C1B94();
}

uint64_t CreateContactIntent.givenName.getter()
{
  uint64_t v1;

  sub_1DD1C1B7C();
  return v1;
}

uint64_t CreateContactIntent.givenName.setter()
{
  return sub_1DD1C1B88();
}

uint64_t (*CreateContactIntent.givenName.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1DD1C1B70();
  return sub_1DD1A16D4;
}

uint64_t CreateContactIntent.$givenName.getter()
{
  return sub_1DD1C1B94();
}

uint64_t CreateContactIntent.middleName.getter()
{
  uint64_t v1;

  sub_1DD1C1B7C();
  return v1;
}

uint64_t CreateContactIntent.middleName.setter()
{
  return sub_1DD1C1B88();
}

uint64_t (*CreateContactIntent.middleName.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1DD1C1B70();
  return sub_1DD1A16D4;
}

uint64_t CreateContactIntent.$middleName.getter()
{
  return sub_1DD1C1B94();
}

uint64_t CreateContactIntent.familyName.getter()
{
  uint64_t v1;

  sub_1DD1C1B7C();
  return v1;
}

uint64_t CreateContactIntent.familyName.setter()
{
  return sub_1DD1C1B88();
}

uint64_t (*CreateContactIntent.familyName.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1DD1C1B70();
  return sub_1DD1A16D4;
}

uint64_t CreateContactIntent.$familyName.getter()
{
  return sub_1DD1C1B94();
}

uint64_t CreateContactIntent.nameSuffix.getter()
{
  uint64_t v1;

  sub_1DD1C1B7C();
  return v1;
}

uint64_t CreateContactIntent.nameSuffix.setter()
{
  return sub_1DD1C1B88();
}

uint64_t (*CreateContactIntent.nameSuffix.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1DD1C1B70();
  return sub_1DD1A16D4;
}

uint64_t CreateContactIntent.$nameSuffix.getter()
{
  return sub_1DD1C1B94();
}

uint64_t CreateContactIntent.phoneNumber.getter()
{
  uint64_t v1;

  sub_1DD1C1B7C();
  return v1;
}

uint64_t CreateContactIntent.phoneNumber.setter()
{
  return sub_1DD1C1B88();
}

uint64_t (*CreateContactIntent.phoneNumber.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1DD1C1B70();
  return sub_1DD1A16D4;
}

uint64_t CreateContactIntent.$phoneNumber.getter()
{
  return sub_1DD1C1B94();
}

uint64_t CreateContactIntent.emailAddress.getter()
{
  uint64_t v1;

  sub_1DD1C1B7C();
  return v1;
}

uint64_t CreateContactIntent.emailAddress.setter()
{
  return sub_1DD1C1B88();
}

uint64_t (*CreateContactIntent.emailAddress.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1DD1C1B70();
  return sub_1DD1A16D4;
}

uint64_t CreateContactIntent.$emailAddress.getter()
{
  return sub_1DD1C1B94();
}

double CreateContactIntent.init()@<D0>(_OWORD *a1@<X8>)
{
  __int128 v2;
  double result;
  __int128 v4;
  _OWORD v5[2];
  __int128 v6;
  __int128 v7;

  sub_1DD1A3BAC((uint64_t *)v5);
  v2 = v5[1];
  *a1 = v5[0];
  a1[1] = v2;
  result = *(double *)&v6;
  v4 = v7;
  a1[2] = v6;
  a1[3] = v4;
  return result;
}

uint64_t CreateContactIntent.perform()(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[35] = a1;
  v2[36] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C99D8);
  v2[37] = swift_task_alloc();
  v2[38] = swift_task_alloc();
  v3 = sub_1DD1C1F30();
  v2[39] = v3;
  v2[40] = *(_QWORD *)(v3 - 8);
  v2[41] = swift_task_alloc();
  v2[42] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1DD1A3354()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  unsigned int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(void);
  id v26;
  uint64_t v27;
  uint64_t v28;

  v1 = sub_1DD1A37D0();
  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C973D0]), sel_init);
  objc_msgSend(v2, sel_addContact_toContainerWithIdentifier_, v1, 0);
  sub_1DD1C19B4();
  v3 = *(id *)(*(_QWORD *)(v0 + 264) + 16);
  swift_release();
  *(_QWORD *)(v0 + 272) = 0;
  v4 = objc_msgSend(v3, sel_executeSaveRequest_error_, v2, v0 + 272);

  v5 = *(void **)(v0 + 272);
  v6 = *(_QWORD *)(v0 + 304);
  if (!v4)
  {
    v26 = v5;
    sub_1DD1C1EC4();

    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v25 = *(uint64_t (**)(void))(v0 + 8);
    return v25();
  }
  v8 = *(_QWORD *)(v0 + 312);
  v7 = *(_QWORD *)(v0 + 320);
  v9 = v5;
  sub_1DD1C2164();
  swift_bridgeObjectRelease();
  v10 = objc_msgSend(v1, sel_identifier);
  sub_1DD1C202C();

  sub_1DD1C2050();
  swift_bridgeObjectRelease();
  sub_1DD1C1F24();
  swift_bridgeObjectRelease();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v6, 1, v8);
  if ((_DWORD)result != 1)
  {
    v12 = *(_QWORD *)(v0 + 336);
    v14 = *(_QWORD *)(v0 + 312);
    v13 = *(_QWORD *)(v0 + 320);
    v15 = *(_QWORD *)(v0 + 304);

    (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 32))(v12, v15, v14);
    v16 = *(_QWORD *)(v0 + 328);
    v17 = *(_QWORD *)(v0 + 320);
    v27 = *(_QWORD *)(v0 + 312);
    v28 = *(_QWORD *)(v0 + 336);
    objc_msgSend(v1, sel_copy);
    sub_1DD1C2140();
    swift_unknownObjectRelease();
    sub_1DD1A51BC();
    swift_dynamicCast();
    sub_1DD1AC734(*(void **)(v0 + 256), (uint64_t *)(v0 + 16));
    v18 = *(_OWORD *)(v0 + 48);
    *(_OWORD *)(v0 + 168) = *(_OWORD *)(v0 + 64);
    v19 = *(_OWORD *)(v0 + 96);
    *(_OWORD *)(v0 + 184) = *(_OWORD *)(v0 + 80);
    *(_OWORD *)(v0 + 200) = v19;
    *(_QWORD *)(v0 + 216) = *(_QWORD *)(v0 + 112);
    v20 = *(_OWORD *)(v0 + 32);
    *(_OWORD *)(v0 + 120) = *(_OWORD *)(v0 + 16);
    *(_OWORD *)(v0 + 136) = v20;
    *(_OWORD *)(v0 + 152) = v18;
    v21 = sub_1DD1C1AF8();
    v22 = v1;
    v23 = *(_QWORD *)(v21 - 8);
    v24 = swift_task_alloc();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v16, v28, v27);
    sub_1DD1C1B04();
    sub_1DD1A51F8();
    sub_1DD1A523C();
    sub_1DD1C1AE0();

    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v24, v21);
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v28, v27);
    sub_1DD1A5284(v0 + 16);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v25 = *(uint64_t (**)(void))(v0 + 8);
    return v25();
  }
  __break(1u);
  return result;
}

void *sub_1DD1A37D0()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9698);
  MEMORY[0x1E0C80A78](v0);
  v2 = (char *)&v16 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DD1C19B4();
  v23 = v24;
  v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C97360]), sel_init);
  sub_1DD1C1B7C();
  v20 = v25;
  v21 = v24;
  sub_1DD1C1B7C();
  v18 = v25;
  v19 = (uint64_t)v24;
  sub_1DD1C1B7C();
  v3 = v25;
  v17 = (uint64_t)v24;
  sub_1DD1C1B7C();
  v4 = v25;
  v16 = (uint64_t)v24;
  sub_1DD1C1B7C();
  v6 = (uint64_t)v24;
  v5 = v25;
  sub_1DD1C1B7C();
  v8 = (uint64_t)v24;
  v7 = v25;
  sub_1DD1C1B7C();
  v10 = (uint64_t)v24;
  v9 = v25;
  v11 = sub_1DD1C1E94();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v2, 1, 1, v11);
  v15 = v4;
  v12 = v22;
  v13 = v26;
  v21 = sub_1DD1A6C00(v22, (uint64_t)v21, v20, v19, v18, v17, v3, v16, v15, v6, v5, 0, 0, v8, v7, v10, v9, 0, 0,
          (uint64_t)v2);
  v26 = v13;
  sub_1DD1A5830((uint64_t)v2);
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v21;
}

uint64_t sub_1DD1A39DC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1F03C9600 != -1)
    swift_once();
  v2 = sub_1DD1C1EE8();
  v3 = __swift_project_value_buffer(v2, (uint64_t)static CreateContactIntent.title);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_1DD1A3A74()
{
  return MEMORY[0x1DF0D5398]() & 1;
}

uint64_t sub_1DD1A3A8C(uint64_t a1)
{
  _OWORD *v1;
  uint64_t v2;
  __int128 v4;
  __int128 v5;
  _QWORD *v6;

  v4 = v1[1];
  *(_OWORD *)(v2 + 16) = *v1;
  *(_OWORD *)(v2 + 32) = v4;
  v5 = v1[3];
  *(_OWORD *)(v2 + 48) = v1[2];
  *(_OWORD *)(v2 + 64) = v5;
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 80) = v6;
  *v6 = v2;
  v6[1] = sub_1DD1A3AFC;
  return CreateContactIntent.perform()(a1);
}

uint64_t sub_1DD1A3AFC()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

double sub_1DD1A3B44@<D0>(_OWORD *a1@<X8>)
{
  __int128 v2;
  double result;
  __int128 v4;
  _OWORD v5[2];
  __int128 v6;
  __int128 v7;

  sub_1DD1A3BAC((uint64_t *)v5);
  v2 = v5[1];
  *a1 = v5[0];
  a1[1] = v2;
  result = *(double *)&v6;
  v4 = v7;
  a1[2] = v6;
  a1[3] = v4;
  return result;
}

uint64_t sub_1DD1A3B80()
{
  sub_1DD1A5418();
  return sub_1DD1C1A50();
}

uint64_t sub_1DD1A3BAC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  void (*v63)(char *);
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void (*v78)(char *, uint64_t, uint64_t);
  char *v79;
  uint64_t (*v80)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void (*v87)(char *, uint64_t, uint64_t);
  char *v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void (*v95)(char *, uint64_t, uint64_t);
  char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void (*v103)(char *, uint64_t, uint64_t);
  char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t (*v107)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void (*v112)(char *, uint64_t, uint64_t);
  char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  void (*v119)(char *, uint64_t, uint64_t);
  char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t result;
  uint64_t *v125;
  uint64_t v126;
  char *v127;
  char *v128;
  _QWORD v129[3];
  char *v130;
  char *v131;
  char *v132;
  char *v133;
  char *v134;
  char *v135;
  char *v136;
  char *v137;
  uint64_t v138;
  char *v139;
  char *v140;
  char *v141;
  char *v142;
  char *v143;
  uint64_t v144;
  char *v145;
  char *v146;
  char *v147;
  char *v148;
  char *v149;
  char *v150;
  char *v151;
  uint64_t *v152;
  char *v153;
  char *v154;
  char *v155;
  uint64_t v156;
  unint64_t v157;
  uint64_t v158;
  unint64_t v159;
  void (*v160)(char *, _QWORD, uint64_t, uint64_t);
  void (*v161)(char *, uint64_t, uint64_t, uint64_t);
  unsigned int v162;
  void (*v163)(char *);
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  unsigned int v168;
  void (*v169)(char *);
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  unint64_t v173;
  void (*v174)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;

  v152 = a1;
  v1 = sub_1DD1C2014();
  v2 = MEMORY[0x1E0C80A78](v1);
  v150 = (char *)v129 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = MEMORY[0x1E0C80A78](v2);
  v151 = (char *)v129 - v5;
  v6 = MEMORY[0x1E0C80A78](v4);
  v146 = (char *)v129 - v7;
  v8 = MEMORY[0x1E0C80A78](v6);
  v148 = (char *)v129 - v9;
  v10 = MEMORY[0x1E0C80A78](v8);
  v141 = (char *)v129 - v11;
  v12 = MEMORY[0x1E0C80A78](v10);
  v142 = (char *)v129 - v13;
  v14 = MEMORY[0x1E0C80A78](v12);
  v135 = (char *)v129 - v15;
  v16 = MEMORY[0x1E0C80A78](v14);
  v137 = (char *)v129 - v17;
  v18 = MEMORY[0x1E0C80A78](v16);
  v132 = (char *)v129 - v19;
  v20 = MEMORY[0x1E0C80A78](v18);
  v134 = (char *)v129 - v21;
  v22 = MEMORY[0x1E0C80A78](v20);
  v129[2] = (char *)v129 - v23;
  v24 = MEMORY[0x1E0C80A78](v22);
  v131 = (char *)v129 - v25;
  v26 = MEMORY[0x1E0C80A78](v24);
  MEMORY[0x1E0C80A78](v26);
  v174 = (void (*)(char *, uint64_t, uint64_t, uint64_t))((char *)v129 - v27);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96C0);
  v29 = MEMORY[0x1E0C80A78](v28);
  v149 = (char *)v129 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = MEMORY[0x1E0C80A78](v29);
  v145 = (char *)v129 - v32;
  v33 = MEMORY[0x1E0C80A78](v31);
  v140 = (char *)v129 - v34;
  v35 = MEMORY[0x1E0C80A78](v33);
  v136 = (char *)v129 - v36;
  v37 = MEMORY[0x1E0C80A78](v35);
  v133 = (char *)v129 - v38;
  v39 = MEMORY[0x1E0C80A78](v37);
  v130 = (char *)v129 - v40;
  MEMORY[0x1E0C80A78](v39);
  v42 = (char *)v129 - v41;
  v43 = sub_1DD1C1EDC();
  v44 = *(_QWORD *)(v43 - 8);
  MEMORY[0x1E0C80A78](v43);
  v46 = (char *)v129 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = sub_1DD1C1F84();
  MEMORY[0x1E0C80A78](v47);
  v167 = sub_1DD1C1EE8();
  v48 = *(_QWORD *)(v167 - 8);
  v49 = MEMORY[0x1E0C80A78](v167);
  v147 = (char *)v129 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = MEMORY[0x1E0C80A78](v49);
  v143 = (char *)v129 - v52;
  v53 = MEMORY[0x1E0C80A78](v51);
  v139 = (char *)v129 - v54;
  v55 = MEMORY[0x1E0C80A78](v53);
  v155 = (char *)v129 - v56;
  v57 = MEMORY[0x1E0C80A78](v55);
  v154 = (char *)v129 - v58;
  v59 = MEMORY[0x1E0C80A78](v57);
  v153 = (char *)v129 - v60;
  MEMORY[0x1E0C80A78](v59);
  v62 = (char *)v129 - v61;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9D10);
  if (qword_1F03C7E40 != -1)
    swift_once();
  v175 = qword_1F03CC020;
  v176 = *(_QWORD *)algn_1F03CC028;
  swift_bridgeObjectRetain();
  sub_1DD1C2158();
  sub_1DD1C19F0();
  sub_1DD1C19E4();
  v144 = sub_1DD1C19CC();
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  v63 = *(void (**)(char *))(v44 + 104);
  v162 = *MEMORY[0x1E0CAF9B8];
  v64 = v162;
  v63(v46);
  v163 = v63;
  v138 = (uint64_t)v62;
  sub_1DD1C1EF4();
  sub_1DD1C1FCC();
  v170 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96D8);
  sub_1DD1C1F78();
  ((void (*)(char *, uint64_t, uint64_t))v63)(v46, v64, v43);
  sub_1DD1C1EF4();
  v160 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v48 + 56);
  v65 = v167;
  v160(v42, 0, 1, v167);
  v177 = 0;
  v178 = 0;
  v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96E0);
  v129[1] = v129;
  v166 = *(_QWORD *)(*(_QWORD *)(v66 - 8) + 64);
  MEMORY[0x1E0C80A78](v66);
  v157 = (v67 + 15) & 0xFFFFFFFFFFFFFFF0;
  v68 = (char *)v129 - v157;
  v158 = sub_1DD1C1FC0();
  v161 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v158 - 8) + 56);
  v161(v68, 1, 1, v158);
  v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96D0);
  v129[0] = v129;
  v165 = *(_QWORD *)(*(_QWORD *)(v69 - 8) + 64);
  MEMORY[0x1E0C80A78](v69);
  v159 = (v70 + 15) & 0xFFFFFFFFFFFFFFF0;
  v71 = (char *)v129 - v159;
  v164 = sub_1DD1C1A80();
  v174 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v164 - 8) + 56);
  v174(v71, 1, 1, v164);
  v72 = sub_1DD1C1DA4();
  v73 = v43;
  v74 = *(_QWORD *)(*(_QWORD *)(v72 - 8) + 64);
  v171 = v72;
  v172 = v74;
  MEMORY[0x1E0C80A78](v72);
  v173 = (v75 + 15) & 0xFFFFFFFFFFFFFFF0;
  v168 = *MEMORY[0x1E0C91740];
  v169 = *(void (**)(char *))(v76 + 104);
  v169((char *)v129 - v173);
  v138 = sub_1DD1C1BC4();
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  v77 = v162;
  v156 = v73;
  v78 = (void (*)(char *, uint64_t, uint64_t))v163;
  ((void (*)(char *, _QWORD, uint64_t))v163)(v46, v162, v73);
  sub_1DD1C1EF4();
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  v78(v46, v77, v73);
  v79 = v130;
  sub_1DD1C1EF4();
  v80 = (uint64_t (*)(char *, _QWORD, uint64_t, uint64_t))v160;
  v81 = ((uint64_t (*)(char *, _QWORD, uint64_t, uint64_t))v160)(v79, 0, 1, v65);
  v131 = (char *)v129;
  v177 = 0;
  v178 = 0;
  MEMORY[0x1E0C80A78](v81);
  v82 = ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v161)((char *)v129 - v157, 1, 1, v158);
  MEMORY[0x1E0C80A78](v82);
  v83 = v159;
  v84 = ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v174)((char *)v129 - v159, 1, 1, v164);
  MEMORY[0x1E0C80A78](v84);
  ((void (*)(char *, _QWORD, uint64_t))v169)((char *)v129 - v173, v168, v171);
  v153 = (char *)sub_1DD1C1BC4();
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  v85 = v162;
  v86 = v156;
  v87 = (void (*)(char *, uint64_t, uint64_t))v163;
  ((void (*)(char *, _QWORD, uint64_t))v163)(v46, v162, v156);
  sub_1DD1C1EF4();
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  v87(v46, v85, v86);
  v88 = v133;
  sub_1DD1C1EF4();
  v89 = v80(v88, 0, 1, v167);
  v134 = (char *)v129;
  v177 = 0;
  v178 = 0;
  MEMORY[0x1E0C80A78](v89);
  v90 = v157;
  v91 = ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v161)((char *)v129 - v157, 1, 1, v158);
  MEMORY[0x1E0C80A78](v91);
  v92 = ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v174)((char *)v129 - v83, 1, 1, v164);
  MEMORY[0x1E0C80A78](v92);
  ((void (*)(char *, _QWORD, uint64_t))v169)((char *)v129 - v173, v168, v171);
  v154 = (char *)sub_1DD1C1BC4();
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  v93 = v162;
  v94 = v156;
  v95 = (void (*)(char *, uint64_t, uint64_t))v163;
  ((void (*)(char *, _QWORD, uint64_t))v163)(v46, v162, v156);
  sub_1DD1C1EF4();
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  v95(v46, v93, v94);
  v96 = v136;
  sub_1DD1C1EF4();
  v97 = ((uint64_t (*)(char *, _QWORD, uint64_t, uint64_t))v160)(v96, 0, 1, v167);
  v137 = (char *)v129;
  v177 = 0;
  v178 = 0;
  MEMORY[0x1E0C80A78](v97);
  v98 = v158;
  v99 = ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v161)((char *)v129 - v90, 1, 1, v158);
  MEMORY[0x1E0C80A78](v99);
  v100 = ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v174)((char *)v129 - v159, 1, 1, v164);
  MEMORY[0x1E0C80A78](v100);
  ((void (*)(char *, _QWORD, uint64_t))v169)((char *)v129 - v173, v168, v171);
  v155 = (char *)sub_1DD1C1BC4();
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  v101 = v162;
  v102 = v156;
  v103 = (void (*)(char *, uint64_t, uint64_t))v163;
  ((void (*)(char *, _QWORD, uint64_t))v163)(v46, v162, v156);
  sub_1DD1C1EF4();
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  v103(v46, v101, v102);
  v104 = v140;
  sub_1DD1C1EF4();
  v105 = ((uint64_t (*)(char *, _QWORD, uint64_t, uint64_t))v160)(v104, 0, 1, v167);
  v141 = (char *)v129;
  v177 = 0;
  v178 = 0;
  MEMORY[0x1E0C80A78](v105);
  v106 = v98;
  v107 = (uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v161;
  v108 = ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v161)((char *)v129 - v157, 1, 1, v106);
  MEMORY[0x1E0C80A78](v108);
  v109 = ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v174)((char *)v129 - v159, 1, 1, v164);
  MEMORY[0x1E0C80A78](v109);
  ((void (*)(char *, _QWORD, uint64_t))v169)((char *)v129 - v173, v168, v171);
  v142 = (char *)sub_1DD1C1BC4();
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  v110 = v162;
  v111 = v156;
  v112 = (void (*)(char *, uint64_t, uint64_t))v163;
  ((void (*)(char *, _QWORD, uint64_t))v163)(v46, v162, v156);
  sub_1DD1C1EF4();
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  v112(v46, v110, v111);
  v113 = v145;
  sub_1DD1C1EF4();
  v114 = ((uint64_t (*)(char *, _QWORD, uint64_t, uint64_t))v160)(v113, 0, 1, v167);
  v146 = (char *)v129;
  v177 = 0;
  v178 = 0;
  MEMORY[0x1E0C80A78](v114);
  v115 = v107((char *)v129 - v157, 1, 1, v158);
  MEMORY[0x1E0C80A78](v115);
  v116 = ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v174)((char *)v129 - v159, 1, 1, v164);
  MEMORY[0x1E0C80A78](v116);
  ((void (*)(char *, _QWORD, uint64_t))v169)((char *)v129 - v173, v168, v171);
  v148 = (char *)sub_1DD1C1BC4();
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  v117 = v162;
  v118 = v156;
  v119 = (void (*)(char *, uint64_t, uint64_t))v163;
  ((void (*)(char *, _QWORD, uint64_t))v163)(v46, v162, v156);
  sub_1DD1C1EF4();
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  v119(v46, v117, v118);
  v120 = v149;
  sub_1DD1C1EF4();
  v121 = ((uint64_t (*)(char *, _QWORD, uint64_t, uint64_t))v160)(v120, 0, 1, v167);
  v177 = 0;
  v178 = 0;
  MEMORY[0x1E0C80A78](v121);
  v122 = ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v161)((char *)v129 - v157, 1, 1, v158);
  MEMORY[0x1E0C80A78](v122);
  v123 = ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v174)((char *)v129 - v159, 1, 1, v164);
  MEMORY[0x1E0C80A78](v123);
  ((void (*)(char *, _QWORD, uint64_t))v169)((char *)v129 - v173, v168, v171);
  result = sub_1DD1C1BC4();
  v125 = v152;
  v126 = v138;
  *v152 = v144;
  v125[1] = v126;
  v127 = v154;
  v125[2] = (uint64_t)v153;
  v125[3] = (uint64_t)v127;
  v128 = v142;
  v125[4] = (uint64_t)v155;
  v125[5] = (uint64_t)v128;
  v125[6] = (uint64_t)v148;
  v125[7] = result;
  return result;
}

unint64_t sub_1DD1A51BC()
{
  unint64_t result;

  result = qword_1F03C9688;
  if (!qword_1F03C9688)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1F03C9688);
  }
  return result;
}

unint64_t sub_1DD1A51F8()
{
  unint64_t result;

  result = qword_1F03C8090;
  if (!qword_1F03C8090)
  {
    result = MEMORY[0x1DF0D6658](&protocol conformance descriptor for ContactEntity, &type metadata for ContactEntity);
    atomic_store(result, (unint64_t *)&qword_1F03C8090);
  }
  return result;
}

unint64_t sub_1DD1A523C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F03C99E0;
  if (!qword_1F03C99E0)
  {
    v1 = sub_1DD1C1AF8();
    result = MEMORY[0x1DF0D6658](MEMORY[0x1E0C90A38], v1);
    atomic_store(result, (unint64_t *)&qword_1F03C99E0);
  }
  return result;
}

uint64_t sub_1DD1A5284(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 72);
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return a1;
}

unint64_t sub_1DD1A5328()
{
  unint64_t result;

  result = qword_1F03C99E8;
  if (!qword_1F03C99E8)
  {
    result = MEMORY[0x1DF0D6658](&protocol conformance descriptor for CreateContactIntent, &type metadata for CreateContactIntent);
    atomic_store(result, (unint64_t *)&qword_1F03C99E8);
  }
  return result;
}

unint64_t sub_1DD1A5370()
{
  unint64_t result;

  result = qword_1F03C99F0;
  if (!qword_1F03C99F0)
  {
    result = MEMORY[0x1DF0D6658](&protocol conformance descriptor for CreateContactIntent, &type metadata for CreateContactIntent);
    atomic_store(result, (unint64_t *)&qword_1F03C99F0);
  }
  return result;
}

uint64_t sub_1DD1A53B4()
{
  return *(_QWORD *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_1DD1A53D8()
{
  sub_1DD1A5418();
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1DD1A5418()
{
  unint64_t result;

  result = qword_1F03C99F8;
  if (!qword_1F03C99F8)
  {
    result = MEMORY[0x1DF0D6658](&protocol conformance descriptor for CreateContactIntent, &type metadata for CreateContactIntent);
    atomic_store(result, (unint64_t *)&qword_1F03C99F8);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for CreateContactIntent(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  sub_1DD1C1C0C();
  return v3;
}

uint64_t destroy for CreateContactIntent()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

_QWORD *initializeWithCopy for CreateContactIntent(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  return a1;
}

_QWORD *assignWithCopy for CreateContactIntent(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  sub_1DD1C1C0C();
  swift_release();
  a1[1] = a2[1];
  sub_1DD1C1C0C();
  swift_release();
  a1[2] = a2[2];
  sub_1DD1C1C0C();
  swift_release();
  a1[3] = a2[3];
  sub_1DD1C1C0C();
  swift_release();
  a1[4] = a2[4];
  sub_1DD1C1C0C();
  swift_release();
  a1[5] = a2[5];
  sub_1DD1C1C0C();
  swift_release();
  a1[6] = a2[6];
  sub_1DD1C1C0C();
  swift_release();
  a1[7] = a2[7];
  sub_1DD1C1C0C();
  swift_release();
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

_OWORD *assignWithTake for CreateContactIntent(_OWORD *a1, _OWORD *a2)
{
  swift_release();
  *a1 = *a2;
  swift_release();
  swift_release();
  a1[1] = a2[1];
  swift_release();
  swift_release();
  a1[2] = a2[2];
  swift_release();
  swift_release();
  a1[3] = a2[3];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CreateContactIntent(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 64))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CreateContactIntent(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 64) = 1;
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
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CreateContactIntent()
{
  return &type metadata for CreateContactIntent;
}

uint64_t sub_1DD1A57A4()
{
  return sub_1DD1A57EC(&qword_1F03C9A08, MEMORY[0x1E0C91588]);
}

uint64_t sub_1DD1A57C8()
{
  return sub_1DD1A57EC((unint64_t *)&unk_1F03C9A18, MEMORY[0x1E0C915A8]);
}

uint64_t sub_1DD1A57EC(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F03C9A10);
    result = MEMORY[0x1DF0D6658](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1DD1A5830(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9698);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1DD1A5870()
{
  strcpy((char *)&qword_1F03CC020, "entityProvider");
  algn_1F03CC028[7] = -18;
}

id sub_1DD1A58A0()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v15;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9680);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1DD1C9360;
  v1 = (void *)*MEMORY[0x1E0C966D0];
  v2 = (void *)*MEMORY[0x1E0C966C0];
  *(_QWORD *)(v0 + 32) = *MEMORY[0x1E0C966D0];
  *(_QWORD *)(v0 + 40) = v2;
  v3 = (void *)*MEMORY[0x1E0C967C0];
  v4 = (void *)*MEMORY[0x1E0C966A8];
  *(_QWORD *)(v0 + 48) = *MEMORY[0x1E0C967C0];
  *(_QWORD *)(v0 + 56) = v4;
  v5 = (void *)*MEMORY[0x1E0C96670];
  *(_QWORD *)(v0 + 64) = *MEMORY[0x1E0C96670];
  v6 = (void *)objc_opt_self();
  v7 = v1;
  v8 = v2;
  v9 = v3;
  v10 = v4;
  v11 = v5;
  v12 = objc_msgSend(v6, sel_descriptorForRequiredKeysForStyle_, 0);
  v15 = (void *)*MEMORY[0x1E0C967F0];
  v13 = *MEMORY[0x1E0C967F0];
  *(_QWORD *)(v0 + 72) = v12;
  *(_QWORD *)(v0 + 80) = v13;
  sub_1DD1C2098();
  qword_1F03CC0C0 = v0;
  return v15;
}

_QWORD *ContactEntityProvider.__allocating_init(contactStore:)(void *a1)
{
  _QWORD *v2;

  swift_allocObject();
  v2 = sub_1DD1A6B34(a1, 0);

  return v2;
}

uint64_t sub_1DD1A59F8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 128) = a1;
  *(_QWORD *)(v2 + 136) = v1;
  return swift_task_switch();
}

uint64_t sub_1DD1A5A5C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id v23;
  void *v25;
  uint64_t v26;

  if (qword_1F03C9618 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 136);
  v2 = (void *)objc_opt_self();
  v3 = (void *)sub_1DD1C2074();
  v4 = objc_msgSend(v2, sel_predicateForContactsWithIdentifiers_, v3);

  v5 = *(void **)(v1 + 16);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F03C9AA0);
  v6 = (void *)sub_1DD1C2074();
  *(_QWORD *)(v0 + 120) = 0;
  v7 = objc_msgSend(v5, sel_unifiedContactsMatchingPredicate_keysToFetch_error_, v4, v6, v0 + 120);

  v8 = *(void **)(v0 + 120);
  if (!v7)
  {
    v23 = v8;
    sub_1DD1C1EC4();

    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  sub_1DD1A0658(0, (unint64_t *)&qword_1F03C9688);
  v9 = sub_1DD1C2080();
  v10 = v8;

  if (v9 >> 62)
  {
    swift_bridgeObjectRetain();
    v11 = sub_1DD1C21DC();
    swift_bridgeObjectRelease();
    if (v11)
      goto LABEL_6;
  }
  else
  {
    v11 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v11)
    {
LABEL_6:
      v26 = MEMORY[0x1E0DEE9D8];
      sub_1DD1B02A0(0, v11 & ~(v11 >> 63), 0);
      if (v11 < 0)
        __break(1u);
      v25 = v4;
      v12 = 0;
      v13 = v26;
      do
      {
        if ((v9 & 0xC000000000000001) != 0)
          v14 = (id)MEMORY[0x1DF0D5B0C](v12, v9);
        else
          v14 = *(id *)(v9 + 8 * v12 + 32);
        sub_1DD1AC734(v14, (uint64_t *)(v0 + 16));
        v16 = *(_QWORD *)(v26 + 16);
        v15 = *(_QWORD *)(v26 + 24);
        if (v16 >= v15 >> 1)
          sub_1DD1B02A0(v15 > 1, v16 + 1, 1);
        ++v12;
        *(_QWORD *)(v26 + 16) = v16 + 1;
        v17 = v26 + 104 * v16;
        v18 = *(_OWORD *)(v0 + 16);
        v19 = *(_OWORD *)(v0 + 48);
        *(_OWORD *)(v17 + 48) = *(_OWORD *)(v0 + 32);
        *(_OWORD *)(v17 + 64) = v19;
        *(_OWORD *)(v17 + 32) = v18;
        v20 = *(_OWORD *)(v0 + 64);
        v21 = *(_OWORD *)(v0 + 80);
        v22 = *(_OWORD *)(v0 + 96);
        *(_QWORD *)(v17 + 128) = *(_QWORD *)(v0 + 112);
        *(_OWORD *)(v17 + 96) = v21;
        *(_OWORD *)(v17 + 112) = v22;
        *(_OWORD *)(v17 + 80) = v20;
      }
      while (v11 != v12);

      swift_bridgeObjectRelease();
      return (*(uint64_t (**)(uint64_t))(v0 + 8))(v13);
    }
  }

  swift_bridgeObjectRelease();
  v13 = MEMORY[0x1E0DEE9D8];
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v13);
}

uint64_t sub_1DD1A5D84(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[43] = a2;
  v3[44] = v2;
  v3[42] = a1;
  return swift_task_switch();
}

uint64_t sub_1DD1A5DEC()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  unint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  id v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  id v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;

  v2 = v0 + 328;
  if (qword_1F03C9618 != -1)
    swift_once();
  v3 = *(_QWORD *)(v0 + 352);
  v4 = (void *)objc_opt_self();
  v5 = (void *)sub_1DD1C2020();
  v65 = v4;
  v6 = objc_msgSend(v4, sel_predicateForContactsMatchingName_, v5);

  v7 = *(void **)(v3 + 16);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F03C9AA0);
  v8 = (void *)sub_1DD1C2074();
  *(_QWORD *)(v0 + 328) = 0;
  v64 = v7;
  v9 = objc_msgSend(v7, sel_unifiedContactsMatchingPredicate_keysToFetch_error_, v6, v8, v0 + 328);

  v10 = *(void **)(v0 + 328);
  if (!v9)
  {
    v25 = v10;
    sub_1DD1C1EC4();

    swift_willThrow();
    goto LABEL_17;
  }
  sub_1DD1A0658(0, (unint64_t *)&qword_1F03C9688);
  v11 = sub_1DD1C2080();
  v12 = v10;

  if (v11 >> 62)
  {
    swift_bridgeObjectRetain();
    v13 = sub_1DD1C21DC();
    swift_bridgeObjectRelease();
    if (v13)
      goto LABEL_6;
  }
  else
  {
    v13 = *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v13)
    {
LABEL_6:
      v66 = MEMORY[0x1E0DEE9D8];
      sub_1DD1B02A0(0, v13 & ~(v13 >> 63), 0);
      if (v13 < 0)
      {
        __break(1u);
        goto LABEL_34;
      }
      v14 = 0;
      v15 = v66;
      do
      {
        if ((v11 & 0xC000000000000001) != 0)
          v16 = (id)MEMORY[0x1DF0D5B0C](v14, v11);
        else
          v16 = *(id *)(v11 + 8 * v14 + 32);
        sub_1DD1AC734(v16, (uint64_t *)(v0 + 224));
        v18 = *(_QWORD *)(v66 + 16);
        v17 = *(_QWORD *)(v66 + 24);
        if (v18 >= v17 >> 1)
          sub_1DD1B02A0(v17 > 1, v18 + 1, 1);
        ++v14;
        *(_QWORD *)(v66 + 16) = v18 + 1;
        v19 = v66 + 104 * v18;
        v20 = *(_OWORD *)(v0 + 224);
        v21 = *(_OWORD *)(v0 + 256);
        *(_OWORD *)(v19 + 48) = *(_OWORD *)(v0 + 240);
        *(_OWORD *)(v19 + 64) = v21;
        *(_OWORD *)(v19 + 32) = v20;
        v22 = *(_OWORD *)(v0 + 272);
        v23 = *(_OWORD *)(v0 + 288);
        v24 = *(_OWORD *)(v0 + 304);
        *(_QWORD *)(v19 + 128) = *(_QWORD *)(v0 + 320);
        *(_OWORD *)(v19 + 96) = v23;
        *(_OWORD *)(v19 + 112) = v24;
        *(_OWORD *)(v19 + 80) = v22;
      }
      while (v13 != v14);
      swift_bridgeObjectRelease();
      v2 = v0 + 328;
      if (*(_QWORD *)(v66 + 16))
        goto LABEL_38;
LABEL_20:
      swift_bridgeObjectRelease();
      v27 = objc_allocWithZone(MEMORY[0x1E0C97398]);
      swift_bridgeObjectRetain();
      v3 = sub_1DD1C2020();
      swift_bridgeObjectRelease();
      v28 = objc_msgSend(v27, sel_initWithStringValue_, v3);

      v1 = objc_msgSend(v65, sel_predicateForContactsMatchingPhoneNumber_prefixHint_groupIdentifiers_limitToOneResult_, v28, 0, 0, 0);
      v29 = (void *)sub_1DD1C2074();
      *(_QWORD *)(v0 + 328) = 0;
      v30 = objc_msgSend(v64, sel_unifiedContactsMatchingPredicate_keysToFetch_error_, v1, v29, v2);

      v31 = *(void **)(v0 + 328);
      if (!v30)
      {
        v44 = v31;
        sub_1DD1C1EC4();

        swift_willThrow();
        v6 = v1;
        goto LABEL_17;
      }
      v62 = v1;
      v11 = sub_1DD1C2080();
      v32 = v31;

      if (!(v11 >> 62))
      {
        v33 = *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10);
        if (v33)
        {
LABEL_23:
          v67 = MEMORY[0x1E0DEE9D8];
          sub_1DD1B02A0(0, v33 & ~(v33 >> 63), 0);
          if (v33 < 0)
          {
            __break(1u);
            goto LABEL_54;
          }
          v34 = 0;
          v15 = v67;
          do
          {
            if ((v11 & 0xC000000000000001) != 0)
              v35 = (id)MEMORY[0x1DF0D5B0C](v34, v11);
            else
              v35 = *(id *)(v11 + 8 * v34 + 32);
            sub_1DD1AC734(v35, (uint64_t *)(v0 + 120));
            v37 = *(_QWORD *)(v67 + 16);
            v36 = *(_QWORD *)(v67 + 24);
            if (v37 >= v36 >> 1)
              sub_1DD1B02A0(v36 > 1, v37 + 1, 1);
            ++v34;
            *(_QWORD *)(v67 + 16) = v37 + 1;
            v38 = v67 + 104 * v37;
            v39 = *(_OWORD *)(v0 + 120);
            v40 = *(_OWORD *)(v0 + 152);
            *(_OWORD *)(v38 + 48) = *(_OWORD *)(v0 + 136);
            *(_OWORD *)(v38 + 64) = v40;
            *(_OWORD *)(v38 + 32) = v39;
            v41 = *(_OWORD *)(v0 + 168);
            v42 = *(_OWORD *)(v0 + 184);
            v43 = *(_OWORD *)(v0 + 200);
            *(_QWORD *)(v38 + 128) = *(_QWORD *)(v0 + 216);
            *(_OWORD *)(v38 + 96) = v42;
            *(_OWORD *)(v38 + 112) = v43;
            *(_OWORD *)(v38 + 80) = v41;
          }
          while (v33 != v34);
          swift_bridgeObjectRelease();
          goto LABEL_36;
        }
LABEL_35:
        swift_bridgeObjectRelease();
        v15 = MEMORY[0x1E0DEE9D8];
LABEL_36:
        v1 = v62;
        if (*(_QWORD *)(v15 + 16))
        {

          goto LABEL_38;
        }
        swift_bridgeObjectRelease();
        v45 = (void *)sub_1DD1C2020();
        v33 = (uint64_t)objc_msgSend(v65, sel_predicateForContactsMatchingEmailAddress_, v45);

        v46 = (void *)sub_1DD1C2074();
        *(_QWORD *)(v0 + 328) = 0;
        v47 = objc_msgSend(v64, sel_unifiedContactsMatchingPredicate_keysToFetch_error_, v33, v46, v2);

        v48 = *(void **)(v0 + 328);
        if (v47)
        {
          v3 = sub_1DD1C2080();
          v49 = v48;

          if (!(v3 >> 62))
          {
            v50 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
            if (v50)
            {
LABEL_43:
              v63 = v6;
              v68 = MEMORY[0x1E0DEE9D8];
              sub_1DD1B02A0(0, v50 & ~(v50 >> 63), 0);
              if (v50 < 0)
                __break(1u);
              v51 = 0;
              v15 = v68;
              do
              {
                if ((v3 & 0xC000000000000001) != 0)
                  v52 = (id)MEMORY[0x1DF0D5B0C](v51, v3);
                else
                  v52 = *(id *)(v3 + 8 * v51 + 32);
                sub_1DD1AC734(v52, (uint64_t *)(v0 + 16));
                v54 = *(_QWORD *)(v68 + 16);
                v53 = *(_QWORD *)(v68 + 24);
                if (v54 >= v53 >> 1)
                  sub_1DD1B02A0(v53 > 1, v54 + 1, 1);
                ++v51;
                *(_QWORD *)(v68 + 16) = v54 + 1;
                v55 = v68 + 104 * v54;
                v56 = *(_OWORD *)(v0 + 16);
                v57 = *(_OWORD *)(v0 + 48);
                *(_OWORD *)(v55 + 48) = *(_OWORD *)(v0 + 32);
                *(_OWORD *)(v55 + 64) = v57;
                *(_OWORD *)(v55 + 32) = v56;
                v58 = *(_OWORD *)(v0 + 64);
                v59 = *(_OWORD *)(v0 + 80);
                v60 = *(_OWORD *)(v0 + 96);
                *(_QWORD *)(v55 + 128) = *(_QWORD *)(v0 + 112);
                *(_OWORD *)(v55 + 96) = v59;
                *(_OWORD *)(v55 + 112) = v60;
                *(_OWORD *)(v55 + 80) = v58;
              }
              while (v50 != v51);

              swift_bridgeObjectRelease();
              return (*(uint64_t (**)(uint64_t))(v0 + 8))(v15);
            }
LABEL_55:

            swift_bridgeObjectRelease();
            v15 = MEMORY[0x1E0DEE9D8];
            return (*(uint64_t (**)(uint64_t))(v0 + 8))(v15);
          }
LABEL_54:
          swift_bridgeObjectRetain();
          v50 = sub_1DD1C21DC();
          swift_bridgeObjectRelease();
          if (v50)
            goto LABEL_43;
          goto LABEL_55;
        }
        v61 = v48;
        sub_1DD1C1EC4();

        swift_willThrow();
        v6 = (id)v33;
LABEL_17:

        return (*(uint64_t (**)(void))(v0 + 8))();
      }
LABEL_34:
      swift_bridgeObjectRetain();
      v33 = sub_1DD1C21DC();
      swift_bridgeObjectRelease();
      if (v33)
        goto LABEL_23;
      goto LABEL_35;
    }
  }
  swift_bridgeObjectRelease();
  v15 = MEMORY[0x1E0DEE9D8];
  if (!*(_QWORD *)(MEMORY[0x1E0DEE9D8] + 16))
    goto LABEL_20;
LABEL_38:

  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v15);
}

uint64_t sub_1DD1A65D8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2[16] = a1;
  v2[17] = v1;
  v2[18] = *(_QWORD *)(type metadata accessor for ContactEntityPropertyComparator() - 8);
  v2[19] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1DD1A6660()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v25;
  id v26;
  id v27;

  v1 = *(_QWORD *)(v0 + 128);
  if (!*(_QWORD *)(v1 + 16))
  {
    v5 = MEMORY[0x1E0DEE9D8];
LABEL_20:
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v5);
  }
  if (qword_1F03C9618 != -1)
  {
    swift_once();
    v1 = *(_QWORD *)(v0 + 128);
  }
  v2 = *(_QWORD *)(v0 + 152);
  v3 = *(unsigned __int8 *)(*(_QWORD *)(v0 + 144) + 80);
  sub_1DD1A75B0(v1 + ((v3 + 32) & ~v3), v2);
  v4 = sub_1DD1A75F4(v2);
  v5 = MEMORY[0x1E0DEE9D8];
  if (!v4)
  {
LABEL_19:
    sub_1DD1A7990(*(_QWORD *)(v0 + 152));
    goto LABEL_20;
  }
  v6 = *(void **)(*(_QWORD *)(v0 + 136) + 16);
  v7 = v4;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F03C9AA0);
  v8 = (void *)sub_1DD1C2074();
  *(_QWORD *)(v0 + 120) = 0;
  v9 = objc_msgSend(v6, sel_unifiedContactsMatchingPredicate_keysToFetch_error_, v7, v8, v0 + 120);

  v10 = *(void **)(v0 + 120);
  if (v9)
  {
    sub_1DD1A0658(0, (unint64_t *)&qword_1F03C9688);
    v11 = sub_1DD1C2080();
    v12 = v10;

    if (v11 >> 62)
    {
      swift_bridgeObjectRetain();
      v13 = sub_1DD1C21DC();
      swift_bridgeObjectRelease();
      if (v13)
        goto LABEL_8;
    }
    else
    {
      v13 = *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v13)
      {
LABEL_8:
        v27 = v7;
        sub_1DD1B02A0(0, v13 & ~(v13 >> 63), 0);
        if (v13 < 0)
          __break(1u);
        v14 = 0;
        do
        {
          if ((v11 & 0xC000000000000001) != 0)
            v15 = (id)MEMORY[0x1DF0D5B0C](v14, v11);
          else
            v15 = *(id *)(v11 + 8 * v14 + 32);
          sub_1DD1AC734(v15, (uint64_t *)(v0 + 16));
          v17 = *(_QWORD *)(v5 + 16);
          v16 = *(_QWORD *)(v5 + 24);
          if (v17 >= v16 >> 1)
            sub_1DD1B02A0(v16 > 1, v17 + 1, 1);
          ++v14;
          *(_QWORD *)(v5 + 16) = v17 + 1;
          v18 = v5 + 104 * v17;
          v19 = *(_OWORD *)(v0 + 16);
          v20 = *(_OWORD *)(v0 + 48);
          *(_OWORD *)(v18 + 48) = *(_OWORD *)(v0 + 32);
          *(_OWORD *)(v18 + 64) = v20;
          *(_OWORD *)(v18 + 32) = v19;
          v21 = *(_OWORD *)(v0 + 64);
          v22 = *(_OWORD *)(v0 + 80);
          v23 = *(_OWORD *)(v0 + 96);
          *(_QWORD *)(v18 + 128) = *(_QWORD *)(v0 + 112);
          *(_OWORD *)(v18 + 96) = v22;
          *(_OWORD *)(v18 + 112) = v23;
          *(_OWORD *)(v18 + 80) = v21;
        }
        while (v13 != v14);
        v7 = v27;
      }
    }

    swift_bridgeObjectRelease();
    goto LABEL_19;
  }
  v25 = *(_QWORD *)(v0 + 152);
  v26 = v10;
  sub_1DD1C1EC4();

  swift_willThrow();
  sub_1DD1A7990(v25);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id sub_1DD1A69A0()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v8[2];

  v8[1] = *(id *)MEMORY[0x1E0C80C00];
  if (qword_1F03C9618 != -1)
    swift_once();
  v1 = *(void **)(v0 + 16);
  v2 = (void *)sub_1DD1C2020();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F03C9AA0);
  v3 = (void *)sub_1DD1C2074();
  v8[0] = 0;
  v4 = objc_msgSend(v1, sel_unifiedContactWithIdentifier_keysToFetch_error_, v2, v3, v8);

  if (v4)
  {
    v5 = v8[0];
  }
  else
  {
    v6 = v8[0];
    sub_1DD1C1EC4();

    swift_willThrow();
  }
  return v4;
}

id *ContactEntityProvider.deinit()
{
  id *v0;

  swift_unknownObjectRelease();
  return v0;
}

uint64_t ContactEntityProvider.__deallocating_deinit()
{
  id *v0;

  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

_QWORD *sub_1DD1A6B34(void *a1, uint64_t a2)
{
  _QWORD *v2;
  id v4;
  id v5;
  id v6;

  v2[2] = a1;
  v2[3] = a2;
  v4 = objc_allocWithZone(MEMORY[0x1E0C97218]);
  swift_unknownObjectRetain();
  v5 = a1;
  v6 = objc_msgSend(v4, sel_init);
  v2[4] = v6;
  objc_msgSend(v6, sel_setStyle_, 0);
  objc_msgSend(v6, sel_setFallbackStyle_, -1);
  v2[5] = objc_msgSend(objc_allocWithZone((Class)CNLSApplicationWorkspace), sel_init);
  return v2;
}

uint64_t type metadata accessor for ContactEntityProvider()
{
  return objc_opt_self();
}

void *sub_1DD1A6C00(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  BOOL v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  uint64_t v51;
  id v52;
  void *v53;
  id v54;
  void *v55;
  id v56;
  id v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  id v65;
  id v66;
  uint64_t v67;
  id v68;
  void *v69;
  id v70;
  id v71;
  id v72;
  uint64_t v73;
  id v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  void *v80;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;

  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9698);
  MEMORY[0x1E0C80A78](v24);
  v84 = (uint64_t)&v82 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = sub_1DD1C1E94();
  v85 = *(_QWORD *)(v26 - 8);
  v86 = v26;
  MEMORY[0x1E0C80A78](v26);
  v83 = (char *)&v82 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(a1, sel_mutableCopy);
  sub_1DD1C2140();
  swift_unknownObjectRelease();
  sub_1DD1A0658(0, (unint64_t *)&qword_1F03C9670);
  swift_dynamicCast();
  v28 = v89;
  v29 = a3 != 0;
  if (a3)
  {
    v30 = (void *)sub_1DD1C2020();
    objc_msgSend(v28, sel_setNamePrefix_, v30);

  }
  if (a5)
  {
    v31 = (void *)sub_1DD1C2020();
    objc_msgSend(v28, sel_setGivenName_, v31);

    v29 = 1;
  }
  if (a7)
  {
    v32 = (void *)sub_1DD1C2020();
    objc_msgSend(v28, sel_setMiddleName_, v32);

    v29 = 1;
  }
  if (a9)
  {
    v33 = (void *)sub_1DD1C2020();
    objc_msgSend(v28, sel_setFamilyName_, v33);

    v29 = 1;
  }
  v87 = a12;
  if (a11)
  {
    v34 = (void *)sub_1DD1C2020();
    objc_msgSend(v28, sel_setNameSuffix_, v34);

    v29 = 1;
  }
  if (a15)
  {
    v35 = objc_allocWithZone(MEMORY[0x1E0C97398]);
    swift_bridgeObjectRetain();
    v36 = (void *)sub_1DD1C2020();
    swift_bridgeObjectRelease();
    v37 = objc_msgSend(v35, sel_initWithStringValue_, v36);

    v38 = v37;
    if (a13)
    {
      swift_bridgeObjectRetain();
      v39 = (void *)sub_1DD1C2020();
      swift_bridgeObjectRelease();
    }
    else
    {
      v39 = 0;
    }
    v40 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C97338]), sel_initWithLabel_value_, v39, v37);

    v41 = v40;
    v42 = objc_msgSend(v28, sel_phoneNumbers);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9678);
    v43 = sub_1DD1C2080();

    v88 = v43;
    v44 = v41;
    MEMORY[0x1DF0D59F8]();
    if (*(_QWORD *)((v88 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v88 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_1DD1C20A4();
    sub_1DD1C20B0();
    sub_1DD1C2098();

    v45 = (void *)sub_1DD1C2074();
    swift_bridgeObjectRelease();
    objc_msgSend(v28, sel_setPhoneNumbers_, v45);

    v29 = 1;
  }
  if (a17)
  {
    swift_bridgeObjectRetain();
    v46 = (void *)sub_1DD1C2020();
    if (a13)
    {
      v47 = (void *)sub_1DD1C2020();
      swift_bridgeObjectRelease();
    }
    else
    {
      v47 = 0;
    }
    v48 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C97338]), sel_initWithLabel_value_, v47, v46);

    v49 = v48;
    v50 = objc_msgSend(v28, sel_emailAddresses);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9678);
    v51 = sub_1DD1C2080();

    v88 = v51;
    v52 = v49;
    MEMORY[0x1DF0D59F8]();
    if (*(_QWORD *)((v88 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v88 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_1DD1C20A4();
    sub_1DD1C20B0();
    sub_1DD1C2098();

    v53 = (void *)sub_1DD1C2074();
    swift_bridgeObjectRelease();
    objc_msgSend(v28, sel_setEmailAddresses_, v53);

    v29 = 1;
  }
  if (a19)
  {
    v54 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C973B0]), sel_init);
    v55 = (void *)sub_1DD1C2020();
    v56 = objc_msgSend(v54, sel_postalAddressFromString_, v55);

    if (v56)
    {
      if (a13)
      {
        swift_bridgeObjectRetain();
        v57 = v56;
        v58 = (void *)sub_1DD1C2020();
        swift_bridgeObjectRelease();
      }
      else
      {
        v63 = v56;
        v58 = 0;
      }
      v64 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C97338]), sel_initWithLabel_value_, v58, v56);

      v65 = v64;
      v66 = objc_msgSend(v28, sel_postalAddresses);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9678);
      v67 = sub_1DD1C2080();

      v88 = v67;
      v68 = v65;
      MEMORY[0x1DF0D59F8]();
      if (*(_QWORD *)((v88 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v88 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_1DD1C20A4();
      sub_1DD1C20B0();
      sub_1DD1C2098();

      v69 = (void *)sub_1DD1C2074();
      swift_bridgeObjectRelease();
      objc_msgSend(v28, sel_setPostalAddresses_, v69);

    }
    else
    {
      v59 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C97378]), sel_init);
      v60 = (void *)sub_1DD1C2020();
      objc_msgSend(v59, sel_setStreet_, v60);

      swift_bridgeObjectRetain();
      objc_msgSend(v59, sel_copy);
      sub_1DD1C2140();
      swift_unknownObjectRelease();
      sub_1DD1A0658(0, (unint64_t *)&unk_1F03C9A30);
      swift_dynamicCast();
      v61 = v89;
      if (a13)
      {
        v62 = (void *)sub_1DD1C2020();
        swift_bridgeObjectRelease();
      }
      else
      {
        v62 = 0;
      }
      v70 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C97338]), sel_initWithLabel_value_, v62, v61);

      v71 = v70;
      v72 = objc_msgSend(v28, sel_postalAddresses);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9678);
      v73 = sub_1DD1C2080();

      v88 = v73;
      v74 = v71;
      MEMORY[0x1DF0D59F8]();
      if (*(_QWORD *)((v88 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v88 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_1DD1C20A4();
      sub_1DD1C20B0();
      sub_1DD1C2098();

      v75 = (void *)sub_1DD1C2074();
      swift_bridgeObjectRelease();
      objc_msgSend(v28, sel_setPostalAddresses_, v75);

    }
    v29 = 1;
  }
  v76 = v84;
  sub_1DD1A7A14(a20, v84, &qword_1F03C9698);
  v78 = v85;
  v77 = v86;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v85 + 48))(v76, 1, v86) == 1)
  {
    sub_1DD1A0740(v76, &qword_1F03C9698);
    if (!v29)
    {
      sub_1DD1A756C();
      swift_allocError();
      swift_willThrow();

    }
  }
  else
  {
    v79 = v83;
    (*(void (**)(char *, uint64_t, uint64_t))(v78 + 32))(v83, v76, v77);
    v80 = (void *)sub_1DD1C1E7C();
    objc_msgSend(v28, sel_setBirthday_, v80);

    (*(void (**)(char *, uint64_t))(v78 + 8))(v79, v77);
  }
  return v28;
}

unint64_t sub_1DD1A756C()
{
  unint64_t result;

  result = qword_1F03C9A28;
  if (!qword_1F03C9A28)
  {
    result = MEMORY[0x1DF0D6658](&unk_1DD1C9454, &type metadata for ContactEntityProviderError);
    atomic_store(result, (unint64_t *)&qword_1F03C9A28);
  }
  return result;
}

uint64_t sub_1DD1A75B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ContactEntityPropertyComparator();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

id sub_1DD1A75F4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  int EnumCaseMultiPayload;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v32;

  v2 = sub_1DD1C1EB8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9AC0);
  v7 = MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v32 - v10;
  v12 = type metadata accessor for ContactEntityPropertyComparator();
  v13 = MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v17 = (char *)&v32 - v16;
  sub_1DD1A75B0(a1, (uint64_t)&v32 - v16);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (!EnumCaseMultiPayload)
  {
    sub_1DD1A75B0(a1, (uint64_t)v15);
    if (!swift_getEnumCaseMultiPayload())
    {
      sub_1DD1A79CC((uint64_t)v15, (uint64_t)v11);
      sub_1DD1A7A14((uint64_t)v11, (uint64_t)v9, &qword_1F03C9AC0);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v9, 1, v2) == 1)
      {
        sub_1DD1A0740((uint64_t)v11, &qword_1F03C9AC0);
        sub_1DD1A0740((uint64_t)v9, &qword_1F03C9AC0);
        sub_1DD1A7990((uint64_t)v17);
        return 0;
      }
      (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v9, v2);
      v26 = (void *)objc_opt_self();
      v27 = (void *)sub_1DD1C1EAC();
      v28 = objc_msgSend(v26, sel_localizedStringFromPersonNameComponents_style_options_, v27, 0, 0);

      sub_1DD1C202C();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      sub_1DD1A0740((uint64_t)v11, &qword_1F03C9AC0);
    }
    v29 = (void *)objc_opt_self();
    v30 = (void *)sub_1DD1C2020();
    swift_bridgeObjectRelease();
    v23 = objc_msgSend(v29, sel_predicateForContactsMatchingName_, v30);

    sub_1DD1A7990((uint64_t)v17);
    return v23;
  }
  if (EnumCaseMultiPayload == 1)
  {
    v19 = (void *)objc_opt_self();
    v20 = objc_allocWithZone(MEMORY[0x1E0C97398]);
    v21 = (void *)sub_1DD1C2020();
    swift_bridgeObjectRelease();
    v22 = objc_msgSend(v20, sel_initWithStringValue_, v21);

    v23 = objc_msgSend(v19, sel_predicateForContactsMatchingPhoneNumber_prefixHint_groupIdentifiers_limitToOneResult_, v22, 0, 0, 0);
  }
  else
  {
    v24 = (void *)objc_opt_self();
    v25 = (void *)sub_1DD1C2020();
    swift_bridgeObjectRelease();
    v23 = objc_msgSend(v24, sel_predicateForContactsMatchingEmailAddress_, v25);

  }
  return v23;
}

uint64_t sub_1DD1A7990(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for ContactEntityPropertyComparator();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1DD1A79CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9AC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DD1A7A14(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t storeEnumTagSinglePayload for ContactEntityProviderError(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_1DD1A7A98 + 4 * byte_1DD1C9370[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1DD1A7AB8 + 4 * byte_1DD1C9375[v4]))();
}

_BYTE *sub_1DD1A7A98(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1DD1A7AB8(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1DD1A7AC0(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1DD1A7AC8(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1DD1A7AD0(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1DD1A7AD8(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for ContactEntityProviderError()
{
  return &type metadata for ContactEntityProviderError;
}

unint64_t sub_1DD1A7AF8()
{
  unint64_t result;

  result = qword_1F03C9AD8;
  if (!qword_1F03C9AD8)
  {
    result = MEMORY[0x1DF0D6658](&unk_1DD1C942C, &type metadata for ContactEntityProviderError);
    atomic_store(result, (unint64_t *)&qword_1F03C9AD8);
  }
  return result;
}

uint64_t static ContactLabeledValueEntity.typeDisplayRepresentation.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v12[16];

  v0 = sub_1DD1C2014();
  MEMORY[0x1E0C80A78](v0);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96C0);
  MEMORY[0x1E0C80A78](v1);
  v3 = &v12[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = sub_1DD1C1EDC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = &v12[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = sub_1DD1C1F84();
  MEMORY[0x1E0C80A78](v8);
  v9 = sub_1DD1C1EE8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E0CAF9B8], v4);
  sub_1DD1C1EF4();
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v3, 1, 1, v9);
  return sub_1DD1C1DC8();
}

uint64_t ContactLabeledValueEntity.displayRepresentation.getter()
{
  sub_1DD1C1B1C();
  return sub_1DD1C1D38();
}

uint64_t ContactLabeledValueEntity.value.getter()
{
  uint64_t v1;

  sub_1DD1C1B1C();
  return v1;
}

uint64_t ContactLabeledValueEntity.label.getter()
{
  uint64_t v1;

  sub_1DD1C1B1C();
  return v1;
}

uint64_t ContactLabeledValueEntity.label.setter()
{
  return sub_1DD1C1B28();
}

uint64_t (*ContactLabeledValueEntity.label.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1DD1C1B10();
  return sub_1DD1A16D4;
}

uint64_t ContactLabeledValueEntity.$label.getter()
{
  return sub_1DD1C1B34();
}

uint64_t ContactLabeledValueEntity.value.setter()
{
  return sub_1DD1C1B28();
}

uint64_t (*ContactLabeledValueEntity.value.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1DD1C1B10();
  return sub_1DD1A16D4;
}

uint64_t ContactLabeledValueEntity.$value.getter()
{
  return sub_1DD1C1B34();
}

uint64_t ContactLabeledValueEntity.identifier.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_bridgeObjectRetain();
  return a3;
}

uint64_t ContactLabeledValueEntity.identifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*ContactLabeledValueEntity.identifier.modify())()
{
  return nullsub_1;
}

uint64_t sub_1DD1A7F84@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  result = _s14ContactsUICore25ContactLabeledValueEntityVACycfC_0();
  *a1 = result;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  return result;
}

uint64_t sub_1DD1A7FAC()
{
  sub_1DD1A9194();
  return sub_1DD1C199C();
}

uint64_t sub_1DD1A7FE8()
{
  sub_1DD1A9194();
  return sub_1DD1C19A8();
}

uint64_t sub_1DD1A8024()
{
  return sub_1DD1C1DB0();
}

uint64_t sub_1DD1A803C()
{
  sub_1DD1A03F0();
  return sub_1DD1C19FC();
}

uint64_t sub_1DD1A8078()
{
  sub_1DD1C1B1C();
  return sub_1DD1C1D38();
}

uint64_t sub_1DD1A80B4()
{
  sub_1DD1A8E68();
  return sub_1DD1C1DEC();
}

uint64_t static ContactLabeledValueEntity.== infix(_:_:)()
{
  return sub_1DD1A8110();
}

uint64_t sub_1DD1A80FC()
{
  return sub_1DD1A8110();
}

uint64_t sub_1DD1A8110()
{
  uint64_t v1;

  sub_1DD1C1B1C();
  sub_1DD1C1B1C();
  if (v1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  sub_1DD1C1B1C();
  sub_1DD1C1B1C();
  swift_bridgeObjectRelease_n();
  return 1;
}

uint64_t sub_1DD1A8254(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
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
  char *v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v27 = a5;
  v28 = a6;
  v24 = a3;
  v25 = a4;
  v26 = a2;
  v29 = a1;
  v6 = sub_1DD1C2014();
  v7 = MEMORY[0x1E0C80A78](v6);
  MEMORY[0x1E0C80A78](v7);
  v8 = sub_1DD1C1EDC();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1DD1C1F84();
  MEMORY[0x1E0C80A78](v12);
  v13 = sub_1DD1C1EE8();
  v14 = MEMORY[0x1E0C80A78](v13);
  v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v14);
  v18 = (char *)&v23 - v17;
  sub_1DD1C1FCC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96E8);
  sub_1DD1C1F78();
  v19 = *MEMORY[0x1E0CAF9B8];
  v20 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 104);
  v20(v11, v19, v8);
  sub_1DD1C1EF4();
  v21 = MEMORY[0x1DF0D54F4](v18);
  sub_1DD1C1C0C();
  sub_1DD1C1FCC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96F0);
  sub_1DD1C1F78();
  v20(v11, v19, v8);
  sub_1DD1C1EF4();
  MEMORY[0x1DF0D54F4](v16);
  v30 = v24;
  v31 = v25;
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  swift_bridgeObjectRetain();
  sub_1DD1C1B28();
  swift_release();
  v30 = v27;
  v31 = v28;
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  swift_bridgeObjectRetain();
  sub_1DD1C1B28();
  swift_bridgeObjectRelease();
  swift_release_n();
  swift_release_n();
  return v21;
}

uint64_t sub_1DD1A8574(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
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
  char *v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t, uint64_t);
  uint64_t v21;
  char *v22;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v29 = a3;
  v30 = a4;
  v27 = a1;
  v28 = a2;
  v4 = sub_1DD1C1F6C();
  v25 = *(_QWORD *)(v4 - 8);
  v26 = v4;
  MEMORY[0x1E0C80A78](v4);
  v24 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1DD1C2014();
  v7 = MEMORY[0x1E0C80A78](v6);
  MEMORY[0x1E0C80A78](v7);
  v8 = sub_1DD1C1EDC();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1DD1C1F84();
  MEMORY[0x1E0C80A78](v12);
  v13 = sub_1DD1C1EE8();
  v14 = MEMORY[0x1E0C80A78](v13);
  v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v14);
  v18 = (char *)&v24 - v17;
  sub_1DD1C1FCC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96E8);
  sub_1DD1C1F78();
  v19 = *MEMORY[0x1E0CAF9B8];
  v20 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 104);
  v20(v11, v19, v8);
  sub_1DD1C1EF4();
  v21 = MEMORY[0x1DF0D54F4](v18);
  sub_1DD1C1C0C();
  sub_1DD1C1FCC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96F0);
  sub_1DD1C1F78();
  v20(v11, v19, v8);
  sub_1DD1C1EF4();
  MEMORY[0x1DF0D54F4](v16);
  sub_1DD1C1C0C();
  v22 = v24;
  sub_1DD1C19A8();
  sub_1DD1C1F54();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v22, v26);
  v31 = v27;
  v32 = v28;
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  swift_bridgeObjectRetain();
  sub_1DD1C1B28();
  swift_release();
  swift_release();
  v31 = v29;
  v32 = v30;
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  swift_bridgeObjectRetain();
  sub_1DD1C1B28();
  swift_bridgeObjectRelease_n();
  swift_release_n();
  swift_release_n();
  return v21;
}

uint64_t _s14ContactsUICore25ContactLabeledValueEntityVACycfC_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t, uint64_t);
  uint64_t v17;
  char *v18;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;

  v0 = sub_1DD1C1F6C();
  v21 = *(_QWORD *)(v0 - 8);
  v22 = v0;
  MEMORY[0x1E0C80A78](v0);
  v20 = (char *)&v20 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = sub_1DD1C2014();
  v3 = MEMORY[0x1E0C80A78](v2);
  MEMORY[0x1E0C80A78](v3);
  v4 = sub_1DD1C1EDC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1DD1C1F84();
  MEMORY[0x1E0C80A78](v8);
  v9 = sub_1DD1C1EE8();
  v10 = MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10);
  v14 = (char *)&v20 - v13;
  sub_1DD1C1FCC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96E8);
  sub_1DD1C1F78();
  v15 = *MEMORY[0x1E0CAF9B8];
  v16 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 104);
  v16(v7, v15, v4);
  sub_1DD1C1EF4();
  v17 = MEMORY[0x1DF0D54F4](v14);
  sub_1DD1C1C0C();
  sub_1DD1C1FCC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96F0);
  sub_1DD1C1F78();
  v16(v7, v15, v4);
  sub_1DD1C1EF4();
  MEMORY[0x1DF0D54F4](v12);
  sub_1DD1C1C0C();
  v18 = v20;
  sub_1DD1C19A8();
  sub_1DD1C1F54();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v18, v22);
  v23 = 0;
  v24 = 0;
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  swift_bridgeObjectRetain();
  sub_1DD1C1B28();
  swift_release();
  swift_release();
  v23 = 0;
  v24 = 0xE000000000000000;
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  swift_bridgeObjectRetain();
  sub_1DD1C1B28();
  swift_bridgeObjectRelease_n();
  swift_release_n();
  swift_release_n();
  return v17;
}

unint64_t sub_1DD1A8C80()
{
  unint64_t result;

  result = qword_1F03C9AE0;
  if (!qword_1F03C9AE0)
  {
    result = MEMORY[0x1DF0D6658](&protocol conformance descriptor for ContactLabeledValueEntity, &type metadata for ContactLabeledValueEntity);
    atomic_store(result, (unint64_t *)&qword_1F03C9AE0);
  }
  return result;
}

unint64_t sub_1DD1A8CC8()
{
  unint64_t result;

  result = qword_1F03C9AE8;
  if (!qword_1F03C9AE8)
  {
    result = MEMORY[0x1DF0D6658](&protocol conformance descriptor for ContactLabeledValueEntity, &type metadata for ContactLabeledValueEntity);
    atomic_store(result, (unint64_t *)&qword_1F03C9AE8);
  }
  return result;
}

unint64_t sub_1DD1A8D10()
{
  unint64_t result;

  result = qword_1F03C9AF0;
  if (!qword_1F03C9AF0)
  {
    result = MEMORY[0x1DF0D6658](&protocol conformance descriptor for ContactLabeledValueEntity, &type metadata for ContactLabeledValueEntity);
    atomic_store(result, (unint64_t *)&qword_1F03C9AF0);
  }
  return result;
}

uint64_t sub_1DD1A8D54()
{
  return sub_1DD1A8F24(&qword_1F03C9AF8, &qword_1F03C9B00, MEMORY[0x1E0C902F0]);
}

uint64_t sub_1DD1A8D80()
{
  return MEMORY[0x1E0C91C50];
}

unint64_t sub_1DD1A8D90()
{
  unint64_t result;

  result = qword_1F03C9B08;
  if (!qword_1F03C9B08)
  {
    result = MEMORY[0x1DF0D6658](&protocol conformance descriptor for ContactLabeledValueEntity, &type metadata for ContactLabeledValueEntity);
    atomic_store(result, (unint64_t *)&qword_1F03C9B08);
  }
  return result;
}

unint64_t sub_1DD1A8DD8()
{
  unint64_t result;

  result = qword_1F03C9B10;
  if (!qword_1F03C9B10)
  {
    result = MEMORY[0x1DF0D6658](&protocol conformance descriptor for ContactLabeledValueEntity, &type metadata for ContactLabeledValueEntity);
    atomic_store(result, (unint64_t *)&qword_1F03C9B10);
  }
  return result;
}

unint64_t sub_1DD1A8E20()
{
  unint64_t result;

  result = qword_1F03C9B18;
  if (!qword_1F03C9B18)
  {
    result = MEMORY[0x1DF0D6658](&protocol conformance descriptor for ContactLabeledValueEntity, &type metadata for ContactLabeledValueEntity);
    atomic_store(result, (unint64_t *)&qword_1F03C9B18);
  }
  return result;
}

unint64_t sub_1DD1A8E68()
{
  unint64_t result;

  result = qword_1F03C9B20;
  if (!qword_1F03C9B20)
  {
    result = MEMORY[0x1DF0D6658](&protocol conformance descriptor for ContactLabeledValueEntity, &type metadata for ContactLabeledValueEntity);
    atomic_store(result, (unint64_t *)&qword_1F03C9B20);
  }
  return result;
}

unint64_t sub_1DD1A8EB0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F03C9B28;
  if (!qword_1F03C9B28)
  {
    v1 = sub_1DD1C1F6C();
    result = MEMORY[0x1DF0D6658](MEMORY[0x1E0CB09C8], v1);
    atomic_store(result, (unint64_t *)&qword_1F03C9B28);
  }
  return result;
}

uint64_t sub_1DD1A8EF8()
{
  return sub_1DD1A8F24(&qword_1F03C9B30, &qword_1F03C9B38, MEMORY[0x1E0C919A0]);
}

uint64_t sub_1DD1A8F24(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x1DF0D6658](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1DD1A8F68()
{
  unint64_t result;

  result = qword_1F03C9B40;
  if (!qword_1F03C9B40)
  {
    result = MEMORY[0x1DF0D6658](&protocol conformance descriptor for ContactLabeledValueEntity, &type metadata for ContactLabeledValueEntity);
    atomic_store(result, (unint64_t *)&qword_1F03C9B40);
  }
  return result;
}

uint64_t destroy for ContactLabeledValueEntity()
{
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for ContactLabeledValueEntity(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for ContactLabeledValueEntity(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  sub_1DD1C1C0C();
  swift_release();
  a1[1] = a2[1];
  sub_1DD1C1C0C();
  swift_release();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
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

uint64_t assignWithTake for ContactLabeledValueEntity(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ContactLabeledValueEntity(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ContactLabeledValueEntity(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
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
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ContactLabeledValueEntity()
{
  return &type metadata for ContactLabeledValueEntity;
}

unint64_t sub_1DD1A9194()
{
  unint64_t result;

  result = qword_1F03C9B48;
  if (!qword_1F03C9B48)
  {
    result = MEMORY[0x1DF0D6658](&protocol conformance descriptor for ContactLabeledValueEntity, &type metadata for ContactLabeledValueEntity);
    atomic_store(result, (unint64_t *)&qword_1F03C9B48);
  }
  return result;
}

uint64_t ContactEntityQuery.init()()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9D10);
  if (qword_1F03C7E40 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  sub_1DD1C2158();
  sub_1DD1C19F0();
  sub_1DD1C19E4();
  return sub_1DD1C19CC();
}

uint64_t ContactEntityQuery.entities(for:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 48) = a1;
  *(_QWORD *)(v2 + 56) = a2;
  return swift_task_switch();
}

uint64_t sub_1DD1A9298()
{
  _QWORD *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD *v10;
  uint64_t v12;

  if (qword_1F03C95E0 != -1)
    swift_once();
  v1 = sub_1DD1C1FA8();
  v0[8] = __swift_project_value_buffer(v1, (uint64_t)qword_1F03CC040);
  swift_bridgeObjectRetain_n();
  v2 = sub_1DD1C1F90();
  v3 = sub_1DD1C20EC();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v12 = v5;
    *(_DWORD *)v4 = 136315138;
    v6 = swift_bridgeObjectRetain();
    v7 = MEMORY[0x1DF0D5A1C](v6, MEMORY[0x1E0DEA968]);
    v9 = v8;
    swift_bridgeObjectRelease();
    v0[5] = sub_1DD1AAA14(v7, v9, &v12);
    sub_1DD1C211C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1DD140000, v2, v3, "[ContactEntityQuery] Querying for identifiers %s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1DF0D66B8](v5, -1, -1);
    MEMORY[0x1DF0D66B8](v4, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  sub_1DD1C19B4();
  v0[9] = v0[2];
  v10 = (_QWORD *)swift_task_alloc();
  v0[10] = v10;
  *v10 = v0;
  v10[1] = sub_1DD1A94B0;
  return sub_1DD1A59F8(v0[6]);
}

uint64_t sub_1DD1A94B0(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 88) = a1;
  *(_QWORD *)(v3 + 96) = v1;
  swift_task_dealloc();
  if (!v1)
    swift_release();
  return swift_task_switch();
}

uint64_t sub_1DD1A9524()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;

  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  v1 = sub_1DD1C1F90();
  v2 = sub_1DD1C20EC();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = *(_QWORD *)(v0 + 88);
    v4 = swift_slowAlloc();
    v10 = swift_slowAlloc();
    v11 = v10;
    *(_DWORD *)v4 = 134218242;
    *(_QWORD *)(v0 + 24) = *(_QWORD *)(v3 + 16);
    sub_1DD1C211C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v4 + 12) = 2080;
    v5 = swift_bridgeObjectRetain();
    v6 = MEMORY[0x1DF0D5A1C](v5, MEMORY[0x1E0DEA968]);
    v8 = v7;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 32) = sub_1DD1AAA14(v6, v8, &v11);
    sub_1DD1C211C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1DD140000, v1, v2, "[ContactEntityQuery] Found %ld matching contacts for identifiers %s", (uint8_t *)v4, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1DF0D66B8](v10, -1, -1);
    MEMORY[0x1DF0D66B8](v4, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
  }

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 88));
}

uint64_t sub_1DD1A96FC()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DD1A9730@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9D10);
  if (qword_1F03C7E40 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  sub_1DD1C2158();
  sub_1DD1C19F0();
  sub_1DD1C19E4();
  result = sub_1DD1C19CC();
  *a1 = result;
  return result;
}

uint64_t sub_1DD1A97E8(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *v1;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1DD1A984C;
  v5[6] = a1;
  v5[7] = v4;
  return swift_task_switch();
}

uint64_t sub_1DD1A984C(uint64_t a1)
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

uint64_t sub_1DD1A98A0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1DD1A1B84;
  return sub_1DD1C1A5C();
}

uint64_t sub_1DD1A990C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  sub_1DD1AB5F8();
  *v1 = v0;
  v1[1] = sub_1DD1AB794;
  return sub_1DD1C1A68();
}

uint64_t sub_1DD1A9978()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1DD1A1B84;
  return sub_1DD1C1D8C();
}

uint64_t sub_1DD1A99E4()
{
  return MEMORY[0x1DF0D5728]() & 1;
}

uint64_t ContactEntityQuery.entities(matching:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  return swift_task_switch();
}

uint64_t sub_1DD1A9A18()
{
  _QWORD *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  _BOOL4 v4;
  unint64_t v5;
  uint64_t v6;
  uint8_t *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v11;

  if (qword_1F03C95E0 != -1)
    swift_once();
  v1 = sub_1DD1C1FA8();
  v0[9] = __swift_project_value_buffer(v1, (uint64_t)qword_1F03CC040);
  swift_bridgeObjectRetain_n();
  v2 = sub_1DD1C1F90();
  v3 = sub_1DD1C20EC();
  v4 = os_log_type_enabled(v2, v3);
  v5 = v0[7];
  if (v4)
  {
    v6 = v0[6];
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v11 = v8;
    *(_DWORD *)v7 = 136315138;
    swift_bridgeObjectRetain();
    v0[5] = sub_1DD1AAA14(v6, v5, &v11);
    sub_1DD1C211C();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1DD140000, v2, v3, "[ContactEntityQuery] Querying for matching name %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1DF0D66B8](v8, -1, -1);
    MEMORY[0x1DF0D66B8](v7, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  sub_1DD1C19B4();
  v0[10] = v0[2];
  v9 = (_QWORD *)swift_task_alloc();
  v0[11] = v9;
  *v9 = v0;
  v9[1] = sub_1DD1A9C0C;
  return sub_1DD1A5D84(v0[6], v0[7]);
}

uint64_t sub_1DD1A9C0C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 96) = a1;
  *(_QWORD *)(v3 + 104) = v1;
  swift_task_dealloc();
  if (!v1)
    swift_release();
  return swift_task_switch();
}

uint64_t sub_1DD1A9C80()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  v1 = sub_1DD1C1F90();
  v2 = sub_1DD1C20EC();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = *(_QWORD *)(v0 + 96);
    v5 = *(_QWORD *)(v0 + 48);
    v4 = *(_QWORD *)(v0 + 56);
    v6 = swift_slowAlloc();
    v7 = swift_slowAlloc();
    *(_DWORD *)v6 = 134218242;
    *(_QWORD *)(v0 + 24) = *(_QWORD *)(v3 + 16);
    v9 = v7;
    sub_1DD1C211C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v6 + 12) = 2080;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 32) = sub_1DD1AAA14(v5, v4, &v9);
    sub_1DD1C211C();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1DD140000, v1, v2, "[ContactEntityQuery] Found %ld matching contact for string: %s", (uint8_t *)v6, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1DF0D66B8](v7, -1, -1);
    MEMORY[0x1DF0D66B8](v6, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
  }

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 96));
}

uint64_t sub_1DD1A9E34()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DD1A9E68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v7;
  _QWORD *v8;

  *(_QWORD *)(v4 + 16) = a1;
  v7 = *v3;
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 24) = v8;
  *v8 = v4;
  v8[1] = sub_1DD1A9EE0;
  v8[7] = a3;
  v8[8] = v7;
  v8[6] = a2;
  return swift_task_switch();
}

uint64_t sub_1DD1A9EE0(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = *v2;
  swift_task_dealloc();
  if (!v1)
    **(_QWORD **)(v4 + 16) = a1;
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t sub_1DD1A9F3C()
{
  uint64_t v0;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9B60);
  __swift_allocate_value_buffer(v0, static ContactEntityQuery.sortingOptions);
  __swift_project_value_buffer(v0, (uint64_t)static ContactEntityQuery.sortingOptions);
  sub_1DD1A0434();
  return sub_1DD1C1DBC();
}

uint64_t sub_1DD1A9FA8()
{
  sub_1DD1A0434();
  return sub_1DD1C1E10();
}

uint64_t ContactEntityQuery.sortingOptions.unsafeMutableAddressor()
{
  return sub_1DD1AA52C(&qword_1F03C9620, &qword_1F03C9B60, (uint64_t)static ContactEntityQuery.sortingOptions);
}

uint64_t static ContactEntityQuery.sortingOptions.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DD1AA594(&qword_1F03C9620, &qword_1F03C9B60, (uint64_t)static ContactEntityQuery.sortingOptions, a1);
}

uint64_t static ContactEntityQuery.sortingOptions.setter(uint64_t a1)
{
  return sub_1DD1AA644(a1, &qword_1F03C9620, &qword_1F03C9B60, (uint64_t)static ContactEntityQuery.sortingOptions);
}

uint64_t (*static ContactEntityQuery.sortingOptions.modify())()
{
  uint64_t v0;

  if (qword_1F03C9620 != -1)
    swift_once();
  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9B60);
  __swift_project_value_buffer(v0, (uint64_t)static ContactEntityQuery.sortingOptions);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1DD1AA0BC()
{
  uint64_t v0;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9B68);
  __swift_allocate_value_buffer(v0, static ContactEntityQuery.properties);
  __swift_project_value_buffer(v0, (uint64_t)static ContactEntityQuery.properties);
  type metadata accessor for ContactEntityPropertyComparator();
  sub_1DD1A0434();
  return sub_1DD1C1D5C();
}

uint64_t sub_1DD1AA138()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9BE0);
  swift_getKeyPath();
  sub_1DD1C1D14();
  sub_1DD1A0434();
  v0 = sub_1DD1C1C0C();
  swift_release();
  swift_getKeyPath();
  sub_1DD1C1C0C();
  sub_1DD1C1D14();
  v1 = sub_1DD1C1C0C();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9680);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1DD1C9720;
  *(_QWORD *)(v2 + 32) = v0;
  *(_QWORD *)(v2 + 40) = v1;
  sub_1DD1C2098();
  type metadata accessor for ContactEntityPropertyComparator();
  sub_1DD1C1C0C();
  v3 = sub_1DD1C1DD4();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return v3;
}

uint64_t sub_1DD1AA280()
{
  return sub_1DD1AA2A0();
}

uint64_t sub_1DD1AA28C@<X0>(_QWORD *a1@<X8>)
{
  return sub_1DD1AA4AC(a1);
}

uint64_t sub_1DD1AA294()
{
  return sub_1DD1AA2A0();
}

uint64_t sub_1DD1AA2A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9BE8);
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9BF0);
  swift_allocObject();
  sub_1DD1AB72C(&qword_1F03C9BF8, &qword_1F03C9C00, (uint64_t (*)(void))sub_1DD1A8E20, MEMORY[0x1E0C91CE8]);
  sub_1DD1AB69C();
  sub_1DD1AB6E8();
  sub_1DD1C1CFC();
  sub_1DD1A0434();
  sub_1DD1C1E04();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9C18);
  v4 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1DD1C8FF0;
  (*(void (**)(unint64_t, char *, uint64_t))(v1 + 16))(v5 + v4, v3, v0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9700);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9C00);
  type metadata accessor for ContactEntityPropertyComparator();
  sub_1DD1AB72C(&qword_1F03C9C20, &qword_1F03C9C00, (uint64_t (*)(void))sub_1DD1A8E20, MEMORY[0x1E0C91CD0]);
  v6 = sub_1DD1C1DF8();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v6;
}

uint64_t sub_1DD1AA4A4@<X0>(_QWORD *a1@<X8>)
{
  return sub_1DD1AA4AC(a1);
}

uint64_t sub_1DD1AA4AC@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  sub_1DD1C1B1C();
  *a1 = v3;
  a1[1] = v4;
  type metadata accessor for ContactEntityPropertyComparator();
  return swift_storeEnumTagMultiPayload();
}

uint64_t ContactEntityQuery.properties.unsafeMutableAddressor()
{
  return sub_1DD1AA52C(&qword_1F03C9628, &qword_1F03C9B68, (uint64_t)static ContactEntityQuery.properties);
}

uint64_t sub_1DD1AA52C(_QWORD *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;

  if (*a1 != -1)
    swift_once();
  v5 = __swift_instantiateConcreteTypeFromMangledName(a2);
  return __swift_project_value_buffer(v5, a3);
}

uint64_t static ContactEntityQuery.properties.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DD1AA594(&qword_1F03C9628, &qword_1F03C9B68, (uint64_t)static ContactEntityQuery.properties, a1);
}

uint64_t sub_1DD1AA594@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;

  if (*a1 != -1)
    swift_once();
  v7 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v8 = __swift_project_value_buffer(v7, a3);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a4, v8, v7);
}

uint64_t static ContactEntityQuery.properties.setter(uint64_t a1)
{
  return sub_1DD1AA644(a1, &qword_1F03C9628, &qword_1F03C9B68, (uint64_t)static ContactEntityQuery.properties);
}

uint64_t sub_1DD1AA644(uint64_t a1, _QWORD *a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (*a2 != -1)
    swift_once();
  v7 = __swift_instantiateConcreteTypeFromMangledName(a3);
  v8 = __swift_project_value_buffer(v7, a4);
  swift_beginAccess();
  v9 = *(_QWORD *)(v7 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 24))(v8, a1, v7);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(a1, v7);
}

uint64_t (*static ContactEntityQuery.properties.modify())()
{
  uint64_t v0;

  if (qword_1F03C9628 != -1)
    swift_once();
  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9B68);
  __swift_project_value_buffer(v0, (uint64_t)static ContactEntityQuery.properties);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t ContactEntityQuery.entities(matching:mode:sortedBy:limit:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t);

  v11 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_1F03C9B78 + dword_1F03C9B78);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 16) = v9;
  *v9 = v6;
  v9[1] = sub_1DD1AB798;
  return v11(a1, a6);
}

uint64_t sub_1DD1AA7D4@<X0>(uint64_t a1@<X8>)
{
  return sub_1DD1AA81C(&qword_1F03C9628, &qword_1F03C9B68, (uint64_t)static ContactEntityQuery.properties, a1);
}

uint64_t sub_1DD1AA7F8@<X0>(uint64_t a1@<X8>)
{
  return sub_1DD1AA81C(&qword_1F03C9620, &qword_1F03C9B60, (uint64_t)static ContactEntityQuery.sortingOptions, a1);
}

uint64_t sub_1DD1AA81C@<X0>(_QWORD *a1@<X2>, uint64_t *a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;

  if (*a1 != -1)
    swift_once();
  v7 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v8 = __swift_project_value_buffer(v7, a3);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a4, v8, v7);
}

uint64_t sub_1DD1AA8AC()
{
  return sub_1DD1C1D08();
}

uint64_t sub_1DD1AA8C0(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v5;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  *(_QWORD *)(v3 + 16) = a1;
  v5 = *v2;
  v8 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_1F03C9B78 + dword_1F03C9B78);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 24) = v6;
  *v6 = v3;
  v6[1] = sub_1DD1AB79C;
  return v8(a2, v5);
}

uint64_t ContactEntityQuery.init(entityProvider:)()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9D10);
  if (qword_1F03C7E40 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  sub_1DD1C2158();
  sub_1DD1C19F0();
  sub_1DD1C19E4();
  v0 = sub_1DD1C19CC();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  sub_1DD1C19C0();
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_1DD1AAA14(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_1DD1AAAE4(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1DD1A061C((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x1E0DEC2B8];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_1DD1A061C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1DD1AAAE4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1DD1C2128();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_1DD1AAC9C(a5, a6);
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
  v8 = sub_1DD1C2188();
  if (!v8)
  {
    sub_1DD1C21D0();
    __break(1u);
LABEL_17:
    result = sub_1DD1C21E8();
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

uint64_t sub_1DD1AAC9C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_1DD1AAD30(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1DD1AAF08(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1DD1AAF08(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1DD1AAD30(uint64_t a1, unint64_t a2)
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
      v3 = sub_1DD1AAEA4(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_1DD1C2170();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_1DD1C21D0();
      __break(1u);
LABEL_10:
      v2 = sub_1DD1C205C();
      if (!v2)
        return MEMORY[0x1E0DEE9D8];
    }
    sub_1DD1C21E8();
    __break(1u);
LABEL_14:
    result = sub_1DD1C21D0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9D8];
  }
  return result;
}

_QWORD *sub_1DD1AAEA4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9C28);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1DD1AAF08(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9C28);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
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
  result = sub_1DD1C21E8();
  __break(1u);
  return result;
}

uint64_t sub_1DD1AB054(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 48) = a1;
  *(_QWORD *)(v2 + 56) = a2;
  return swift_task_switch();
}

uint64_t sub_1DD1AB06C()
{
  _QWORD *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  uint64_t v13;

  if (qword_1F03C95E0 != -1)
    swift_once();
  v1 = sub_1DD1C1FA8();
  v0[8] = __swift_project_value_buffer(v1, (uint64_t)qword_1F03CC040);
  swift_bridgeObjectRetain_n();
  v2 = sub_1DD1C1F90();
  v3 = sub_1DD1C20EC();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v13 = v5;
    *(_DWORD *)v4 = 136315138;
    v6 = type metadata accessor for ContactEntityPropertyComparator();
    v7 = swift_bridgeObjectRetain();
    v8 = MEMORY[0x1DF0D5A1C](v7, v6);
    v10 = v9;
    swift_bridgeObjectRelease();
    v0[5] = sub_1DD1AAA14(v8, v10, &v13);
    sub_1DD1C211C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1DD140000, v2, v3, "[ContactEntityQuery] Querying for matching property query %s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1DF0D66B8](v5, -1, -1);
    MEMORY[0x1DF0D66B8](v4, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  sub_1DD1C19B4();
  v0[9] = v0[2];
  v11 = (_QWORD *)swift_task_alloc();
  v0[10] = v11;
  *v11 = v0;
  v11[1] = sub_1DD1AB28C;
  return sub_1DD1A65D8(v0[6]);
}

uint64_t sub_1DD1AB28C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 88) = a1;
  *(_QWORD *)(v3 + 96) = v1;
  swift_task_dealloc();
  if (!v1)
    swift_release();
  return swift_task_switch();
}

uint64_t sub_1DD1AB300()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v11;
  uint64_t v12;

  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  v1 = sub_1DD1C1F90();
  v2 = sub_1DD1C20EC();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = *(_QWORD *)(v0 + 88);
    v4 = swift_slowAlloc();
    v11 = swift_slowAlloc();
    v12 = v11;
    *(_DWORD *)v4 = 134218242;
    *(_QWORD *)(v0 + 24) = *(_QWORD *)(v3 + 16);
    sub_1DD1C211C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v4 + 12) = 2080;
    v5 = type metadata accessor for ContactEntityPropertyComparator();
    v6 = swift_bridgeObjectRetain();
    v7 = MEMORY[0x1DF0D5A1C](v6, v5);
    v9 = v8;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 32) = sub_1DD1AAA14(v7, v9, &v12);
    sub_1DD1C211C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1DD140000, v1, v2, "[ContactEntityQuery] Found %ld matching contact for comparators: %s", (uint8_t *)v4, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1DF0D66B8](v11, -1, -1);
    MEMORY[0x1DF0D66B8](v4, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
  }

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 88));
}

unint64_t sub_1DD1AB4E4()
{
  unint64_t result;

  result = qword_1F03C9B80;
  if (!qword_1F03C9B80)
  {
    result = MEMORY[0x1DF0D6658](&protocol conformance descriptor for ContactEntityQuery, &type metadata for ContactEntityQuery);
    atomic_store(result, (unint64_t *)&qword_1F03C9B80);
  }
  return result;
}

unint64_t sub_1DD1AB52C()
{
  unint64_t result;

  result = qword_1F03C9B88[0];
  if (!qword_1F03C9B88[0])
  {
    result = MEMORY[0x1DF0D6658](&protocol conformance descriptor for ContactEntityQuery, &type metadata for ContactEntityQuery);
    atomic_store(result, qword_1F03C9B88);
  }
  return result;
}

unint64_t sub_1DD1AB578()
{
  unint64_t result;

  result = qword_1F03C9BA0;
  if (!qword_1F03C9BA0)
  {
    result = MEMORY[0x1DF0D6658](&protocol conformance descriptor for ContactEntityQuery, &type metadata for ContactEntityQuery);
    atomic_store(result, (unint64_t *)&qword_1F03C9BA0);
  }
  return result;
}

uint64_t sub_1DD1AB5C0()
{
  return sub_1DD1AB72C(&qword_1F03C9BA8, qword_1F03C9BB0, (uint64_t (*)(void))sub_1DD1A51F8, MEMORY[0x1E0C91CD8]);
}

unint64_t sub_1DD1AB5F8()
{
  unint64_t result;

  result = qword_1F03C9BC8[0];
  if (!qword_1F03C9BC8[0])
  {
    result = MEMORY[0x1DF0D6658](&protocol conformance descriptor for ContactEntityQuery, &type metadata for ContactEntityQuery);
    atomic_store(result, qword_1F03C9BC8);
  }
  return result;
}

ValueMetadata *type metadata accessor for ContactEntityQuery()
{
  return &type metadata for ContactEntityQuery;
}

uint64_t sub_1DD1AB64C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_1DD1C1B34();
  *a1 = result;
  return result;
}

uint64_t sub_1DD1AB674@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_1DD1C1B34();
  *a1 = result;
  return result;
}

unint64_t sub_1DD1AB69C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F03C9C08;
  if (!qword_1F03C9C08)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F03C9C00);
    result = MEMORY[0x1DF0D6658](MEMORY[0x1E0DEAF38], v1);
    atomic_store(result, (unint64_t *)&qword_1F03C9C08);
  }
  return result;
}

unint64_t sub_1DD1AB6E8()
{
  unint64_t result;

  result = qword_1F03C9C10;
  if (!qword_1F03C9C10)
  {
    result = MEMORY[0x1DF0D6658](&protocol conformance descriptor for ContactLabeledValueEntity, &type metadata for ContactLabeledValueEntity);
    atomic_store(result, (unint64_t *)&qword_1F03C9C10);
  }
  return result;
}

uint64_t sub_1DD1AB72C(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9 = a3();
    result = MEMORY[0x1DF0D6658](a4, v8, &v9);
    atomic_store(result, a1);
  }
  return result;
}

__n128 ContactEntity.init(_:)@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  __int128 v3;
  __int128 v4;
  __n128 result;
  _OWORD v6[6];
  uint64_t v7;

  sub_1DD1AC734(a1, (uint64_t *)v6);
  v3 = v6[5];
  *(_OWORD *)(a2 + 64) = v6[4];
  *(_OWORD *)(a2 + 80) = v3;
  *(_QWORD *)(a2 + 96) = v7;
  v4 = v6[1];
  *(_OWORD *)a2 = v6[0];
  *(_OWORD *)(a2 + 16) = v4;
  result = (__n128)v6[3];
  *(_OWORD *)(a2 + 32) = v6[2];
  *(__n128 *)(a2 + 48) = result;
  return result;
}

uint64_t ContactEntity.$phoneNumbers.getter()
{
  return sub_1DD1C1B34();
}

uint64_t ContactEntity.$emailAddresses.getter()
{
  return sub_1DD1C1B34();
}

uint64_t sub_1DD1AB838()
{
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9D10);
  if (qword_1F03C7E40 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  sub_1DD1C2158();
  sub_1DD1C19F0();
  sub_1DD1C19E4();
  result = sub_1DD1C19CC();
  static ContactEntity.defaultQuery = result;
  return result;
}

uint64_t *ContactEntity.defaultQuery.unsafeMutableAddressor()
{
  if (qword_1F03C9630 != -1)
    swift_once();
  return &static ContactEntity.defaultQuery;
}

uint64_t static ContactEntity.defaultQuery.getter()
{
  if (qword_1F03C9630 != -1)
    swift_once();
  swift_beginAccess();
  return sub_1DD1C1C0C();
}

uint64_t static ContactEntity.defaultQuery.setter(uint64_t a1)
{
  if (qword_1F03C9630 != -1)
    swift_once();
  swift_beginAccess();
  static ContactEntity.defaultQuery = a1;
  return swift_release();
}

uint64_t (*static ContactEntity.defaultQuery.modify())()
{
  if (qword_1F03C9630 != -1)
    swift_once();
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t ContactEntity.updateIntent.unsafeMutableAddressor()
{
  uint64_t result;

  if (qword_1F03C9638 != -1)
    return swift_once();
  return result;
}

uint64_t static ContactEntity.updateIntent.getter()
{
  uint64_t result;

  if (qword_1F03C9638 != -1)
    return swift_once();
  return result;
}

uint64_t (*static ContactEntity.updateIntent.modify())()
{
  if (qword_1F03C9638 != -1)
    swift_once();
  return nullsub_1;
}

uint64_t ContactEntity.person.getter()
{
  return sub_1DD1C1B1C();
}

uint64_t ContactEntity.person.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_1DD1C1AC8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  sub_1DD1C1B28();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

uint64_t (*ContactEntity.person.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1DD1C1B10();
  return sub_1DD1A16D4;
}

uint64_t ContactEntity.$person.getter()
{
  return sub_1DD1C1B34();
}

uint64_t ContactEntity.phoneNumbers.getter()
{
  uint64_t v1;

  sub_1DD1C1B1C();
  return v1;
}

uint64_t ContactEntity.phoneNumbers.setter()
{
  return sub_1DD1C1B28();
}

uint64_t (*ContactEntity.phoneNumbers.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1DD1C1B10();
  return sub_1DD1A16D4;
}

uint64_t ContactEntity.emailAddresses.getter()
{
  uint64_t v1;

  sub_1DD1C1B1C();
  return v1;
}

uint64_t ContactEntity.emailAddresses.setter()
{
  return sub_1DD1C1B28();
}

uint64_t (*ContactEntity.emailAddresses.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1DD1C1B10();
  return sub_1DD1A16D4;
}

uint64_t ContactEntity.postalAddresses.getter()
{
  uint64_t v1;

  sub_1DD1C1B1C();
  return v1;
}

uint64_t ContactEntity.postalAddresses.setter()
{
  return sub_1DD1C1B28();
}

uint64_t (*ContactEntity.postalAddresses.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1DD1C1B10();
  return sub_1DD1A16D4;
}

uint64_t ContactEntity.$postalAddresses.getter()
{
  return sub_1DD1C1B34();
}

uint64_t ContactEntity.birthday.getter()
{
  return sub_1DD1C1B1C();
}

uint64_t ContactEntity.birthday.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9698);
  MEMORY[0x1E0C80A78](v2);
  sub_1DD1ADF50(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1DD1C1B28();
  return sub_1DD1A5830(a1);
}

uint64_t (*ContactEntity.birthday.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1DD1C1B10();
  return sub_1DD1A16D4;
}

uint64_t ContactEntity.$birthday.getter()
{
  return sub_1DD1C1B34();
}

uint64_t ContactEntity.id.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 80);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t static ContactEntity.typeDisplayRepresentation.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v12[16];

  v0 = sub_1DD1C2014();
  MEMORY[0x1E0C80A78](v0);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96C0);
  MEMORY[0x1E0C80A78](v1);
  v3 = &v12[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = sub_1DD1C1EDC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = &v12[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = sub_1DD1C1F84();
  MEMORY[0x1E0C80A78](v8);
  v9 = sub_1DD1C1EE8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E0CAF9B8], v4);
  sub_1DD1C1EF4();
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v3, 1, 1, v9);
  return sub_1DD1C1DC8();
}

uint64_t ContactEntity.displayRepresentation.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE v13[16];
  _BYTE v14[16];
  _QWORD v15[2];

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96C0);
  MEMORY[0x1E0C80A78](v1);
  v3 = &v13[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = sub_1DD1C2014();
  MEMORY[0x1E0C80A78](v4);
  v5 = sub_1DD1C1F84();
  MEMORY[0x1E0C80A78](v5);
  v6 = sub_1DD1C1EE8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  sub_1DD1ADF98(v0 + 40, (uint64_t)v14);
  sub_1DD1ADF98((uint64_t)v14, (uint64_t)v15);
  if (!v15[1])
  {
    sub_1DD1C1FCC();
    sub_1DD1C1F78();
    sub_1DD1C2044();
  }
  sub_1DD1ADFE0((uint64_t)v14);
  sub_1DD1C1ED0();
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v3, 1, 1, v6);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9C38);
  MEMORY[0x1E0C80A78](v8);
  v10 = &v13[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = sub_1DD1C1D44();
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
  return sub_1DD1C1D50();
}

uint64_t ContactEntity.namePrefix.getter()
{
  return sub_1DD1AC408(MEMORY[0x1E0CAF728]);
}

uint64_t ContactEntity.givenName.getter()
{
  return sub_1DD1AC408(MEMORY[0x1E0CAF6F0]);
}

uint64_t ContactEntity.middleName.getter()
{
  return sub_1DD1AC408(MEMORY[0x1E0CAF710]);
}

uint64_t ContactEntity.familyName.getter()
{
  return sub_1DD1AC408(MEMORY[0x1E0CAF700]);
}

uint64_t ContactEntity.nameSuffix.getter()
{
  return sub_1DD1AC408(MEMORY[0x1E0CAF738]);
}

uint64_t ContactEntity.nickname.getter()
{
  return sub_1DD1AC408(MEMORY[0x1E0CAF770]);
}

uint64_t sub_1DD1AC408(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);

  v18 = a1;
  v1 = sub_1DD1C1EB8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1DD1C1AC8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DD1C1B1C();
  v9 = sub_1DD1C1AA4();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DD1C1AB0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v13 = (*(uint64_t (**)(char *, uint64_t))(v10 + 88))(v12, v9);
  if (MEMORY[0x1E0C90848] && v13 == *MEMORY[0x1E0C90848])
  {
    (*(void (**)(char *, uint64_t))(v10 + 96))(v12, v9);
    v14 = (*(uint64_t (**)(char *, char *, uint64_t))(v2 + 32))(v4, v12, v1);
    v15 = v18(v14);
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    return 0;
  }
  return v15;
}

ValueMetadata *sub_1DD1AC5B0()
{
  if (qword_1F03C9638 != -1)
    swift_once();
  return &type metadata for UpdateContactIntent;
}

uint64_t sub_1DD1AC5F0@<X0>(_QWORD *a1@<X8>)
{
  if (qword_1F03C9630 != -1)
    swift_once();
  swift_beginAccess();
  *a1 = static ContactEntity.defaultQuery;
  return sub_1DD1C1C0C();
}

uint64_t sub_1DD1AC664@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + 88);
  *a1 = *(_QWORD *)(v1 + 80);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1DD1AC674()
{
  sub_1DD1A0434();
  return sub_1DD1C19FC();
}

uint64_t sub_1DD1AC6B0()
{
  return ContactEntity.displayRepresentation.getter();
}

uint64_t sub_1DD1AC6F8()
{
  sub_1DD1AE258();
  return sub_1DD1C1DEC();
}

uint64_t sub_1DD1AC734@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
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
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  void (*v35)(char *, uint64_t, uint64_t);
  unint64_t v36;
  char *v37;
  char *v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  id v44;
  id v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  id v55;
  unint64_t v56;
  id v57;
  uint64_t *v58;
  id v59;
  id v60;
  id v61;
  id v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  _QWORD *v89;
  char *v90;
  char *v91;
  id v92;
  unint64_t v93;
  uint64_t v94;
  uint64_t result;
  char *v96;
  uint64_t v97;
  id v98;
  void *v99;
  id v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  id v104;
  void *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  id v109;
  id v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  unint64_t v121;
  unint64_t v122;
  _QWORD *v123;
  id v124;
  id v125;
  id v126;
  unint64_t v127;
  uint64_t v128;
  char *v129;
  uint64_t v130;
  id v131;
  void *v132;
  id v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  id v137;
  void *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  id v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  unint64_t v153;
  unint64_t v154;
  _QWORD *v155;
  id v156;
  id v157;
  unint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  id v162;
  void *v163;
  id v164;
  void *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  id v169;
  id v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  unint64_t v181;
  unint64_t v182;
  _QWORD *v183;
  id v184;
  id v185;
  id v186;
  void *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  char *v191;
  char *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  char *v196;
  char *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t *v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  id v206;
  uint64_t v207;
  char *v208;
  uint64_t v209;
  uint64_t *v210;
  uint64_t *v211;
  id v212;
  unint64_t v213;
  char *v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  char *v220;
  char *v221;
  char *v222;
  char *v223;
  uint64_t v224;
  uint64_t v225;
  id v226;
  _QWORD *v227;
  char *v228;
  char *v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;

  v226 = a1;
  v210 = a2;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9698);
  v3 = MEMORY[0x1E0C80A78](v2);
  v209 = (uint64_t)&v203 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  v208 = (char *)&v203 - v5;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9AC0);
  MEMORY[0x1E0C80A78](v6);
  v229 = (char *)&v203 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v215 = sub_1DD1C1EB8();
  v216 = *(_QWORD *)(v215 - 8);
  MEMORY[0x1E0C80A78](v215);
  v214 = (char *)&v203 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1DD1C2014();
  v10 = MEMORY[0x1E0C80A78](v9);
  v228 = (char *)&v203 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x1E0C80A78](v10);
  v223 = (char *)&v203 - v13;
  v14 = MEMORY[0x1E0C80A78](v12);
  v222 = (char *)&v203 - v15;
  v16 = MEMORY[0x1E0C80A78](v14);
  MEMORY[0x1E0C80A78](v16);
  v17 = sub_1DD1C1EDC();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x1E0C80A78](v17);
  v20 = (char *)&v203 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_1DD1C1F84();
  MEMORY[0x1E0C80A78](v21);
  v22 = sub_1DD1C1EE8();
  v23 = MEMORY[0x1E0C80A78](v22);
  v227 = (uint64_t *)((char *)&v203 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
  v25 = MEMORY[0x1E0C80A78](v23);
  v221 = (char *)&v203 - v26;
  v27 = MEMORY[0x1E0C80A78](v25);
  v220 = (char *)&v203 - v28;
  v29 = MEMORY[0x1E0C80A78](v27);
  v31 = (char *)&v203 - v30;
  MEMORY[0x1E0C80A78](v29);
  v33 = (char *)&v203 - v32;
  sub_1DD1C1FCC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96F8);
  sub_1DD1C1F78();
  v34 = *MEMORY[0x1E0CAF9B8];
  v35 = *(void (**)(char *, uint64_t, uint64_t))(v18 + 104);
  v35(v20, v34, v17);
  sub_1DD1C1EF4();
  v225 = MEMORY[0x1DF0D54DC](v33);
  sub_1DD1C1C0C();
  sub_1DD1C1FCC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9700);
  sub_1DD1C1F78();
  v35(v20, v34, v17);
  sub_1DD1C1EF4();
  v36 = sub_1DD1A03F0();
  v224 = MEMORY[0x1DF0D54D0](v31, v36);
  sub_1DD1C1C0C();
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  v35(v20, v34, v17);
  v37 = v220;
  sub_1DD1C1EF4();
  v223 = (char *)MEMORY[0x1DF0D54D0](v37, v36);
  sub_1DD1C1C0C();
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  v35(v20, v34, v17);
  v38 = v221;
  sub_1DD1C1EF4();
  v222 = (char *)MEMORY[0x1DF0D54D0](v38, v36);
  sub_1DD1C1C0C();
  sub_1DD1C1FCC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9710);
  sub_1DD1C1F78();
  v35(v20, v34, v17);
  v39 = v227;
  sub_1DD1C1EF4();
  v40 = MEMORY[0x1DF0D54E8](v39);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9D10);
  v41 = qword_1F03C7E40;
  v221 = (char *)v40;
  sub_1DD1C1C0C();
  if (v41 != -1)
    swift_once();
  v230 = qword_1F03CC020;
  v231 = *(_QWORD *)algn_1F03CC028;
  swift_bridgeObjectRetain();
  sub_1DD1C2158();
  sub_1DD1C19F0();
  sub_1DD1C19E4();
  v42 = sub_1DD1C19CC();
  v43 = objc_allocWithZone(MEMORY[0x1E0C97218]);
  v220 = (char *)v42;
  sub_1DD1C1C0C();
  v44 = objc_msgSend(v43, sel_init);
  objc_msgSend(v44, sel_setStyle_, 0);
  objc_msgSend(v44, sel_setFallbackStyle_, -1);
  v45 = v226;
  v46 = objc_msgSend(v226, sel_identifier);
  v207 = sub_1DD1C202C();
  v48 = v47;

  v219 = v48;
  swift_bridgeObjectRetain();
  v206 = v44;
  v49 = objc_msgSend(v44, sel_stringFromContact_, v45);
  if (v49)
  {
    v50 = v49;
    v205 = sub_1DD1C202C();
    v52 = v51;

  }
  else
  {
    v205 = 0;
    v52 = 0;
  }
  v218 = v52;
  swift_bridgeObjectRetain();
  v53 = objc_msgSend(v45, sel_identifier);
  v204 = sub_1DD1C202C();
  v217 = v54;

  swift_bridgeObjectRetain();
  v228 = (char *)objc_msgSend(v45, sel_keyVector);
  v55 = objc_msgSend(v45, sel_namePrefix);
  v227 = (_QWORD *)sub_1DD1C202C();
  v213 = v56;

  v57 = objc_msgSend(v45, sel_givenName);
  v212 = (id)sub_1DD1C202C();
  v211 = v58;

  v59 = objc_msgSend(v45, sel_middleName);
  sub_1DD1C202C();

  v60 = objc_msgSend(v45, sel_familyName);
  sub_1DD1C202C();

  v61 = objc_msgSend(v45, sel_nameSuffix);
  sub_1DD1C202C();

  v62 = objc_msgSend(v226, sel_nickname);
  sub_1DD1C202C();

  v63 = v215;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v216 + 56))(v229, 1, 1, v215);
  v64 = v214;
  sub_1DD1C1EA0();
  v227 = (_QWORD *)sub_1DD1C1AC8();
  v229 = (char *)&v203;
  v65 = *(v227 - 1);
  v212 = *(id *)(v65 + 64);
  MEMORY[0x1E0C80A78](v227);
  v213 = (v66 + 15) & 0xFFFFFFFFFFFFFFF0;
  v67 = (char *)&v203 - v213;
  v68 = sub_1DD1C1A8C();
  v211 = &v203;
  v69 = *(_QWORD *)(v68 - 8);
  MEMORY[0x1E0C80A78](v68);
  v71 = (uint64_t *)((char *)&v203 - ((v70 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v228 = v228;
  swift_bridgeObjectRetain();
  sub_1DD1C1C0C();
  v72 = objc_msgSend(v226, sel_identifier);
  v73 = sub_1DD1C202C();
  v75 = v74;

  *v71 = v73;
  v71[1] = v75;
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(v69 + 104))(v71, *MEMORY[0x1E0C907F8], v68);
  v76 = sub_1DD1C1AA4();
  v77 = *(_QWORD *)(v76 - 8);
  MEMORY[0x1E0C80A78](v76);
  v79 = (char *)&v203 - ((v78 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, char *, uint64_t))(v216 + 16))(v79, v64, v63);
  (*(void (**)(char *, _QWORD, uint64_t))(v77 + 104))(v79, *MEMORY[0x1E0C90848], v76);
  v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9C68);
  MEMORY[0x1E0C80A78](v80);
  v82 = (char *)&v203 - ((v81 + 15) & 0xFFFFFFFFFFFFFFF0);
  v83 = sub_1DD1C1ABC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v83 - 8) + 56))(v82, 1, 1, v83);
  v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9C38);
  MEMORY[0x1E0C80A78](v84);
  v86 = (char *)&v203 - ((v85 + 15) & 0xFFFFFFFFFFFFFFF0);
  v87 = sub_1DD1C1D44();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v87 - 8) + 56))(v86, 1, 1, v87);
  v88 = sub_1DD1C1A98();
  v211 = &v203;
  MEMORY[0x1E0C80A78](v88);
  v89 = v227;
  (*(void (**)(char *, char *, _QWORD *))(v65 + 16))((char *)&v203 - v213, v67, v227);
  sub_1DD1C1B28();
  (*(void (**)(char *, _QWORD *))(v65 + 8))(v67, v89);
  swift_release();
  swift_bridgeObjectRelease();
  v90 = v228;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v91 = v90;
  swift_bridgeObjectRetain();
  sub_1DD1C1C0C();
  v92 = objc_msgSend(v226, sel_phoneNumbers);
  v213 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9678);
  v93 = sub_1DD1C2080();

  if (v93 >> 62)
  {
    swift_bridgeObjectRetain();
    v94 = sub_1DD1C21DC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v94 = *(_QWORD *)((v93 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v212 = v91;
  if (v94)
  {
    v232 = MEMORY[0x1E0DEE9D8];
    result = sub_1DD1B0284(0, v94 & ~(v94 >> 63), 0);
    if (v94 < 0)
    {
      __break(1u);
      goto LABEL_60;
    }
    v96 = 0;
    v97 = v232;
    v227 = (_QWORD *)(v93 & 0xC000000000000001);
    v228 = (char *)v94;
    v229 = (char *)v93;
    do
    {
      if (v227)
        v98 = (id)MEMORY[0x1DF0D5B0C](v96, v93);
      else
        v98 = *(id *)(v93 + 8 * (_QWORD)v96 + 32);
      v99 = v98;
      v100 = objc_msgSend(v98, sel_identifier);
      v101 = sub_1DD1C202C();
      v103 = v102;

      v104 = objc_msgSend(v99, sel_label);
      if (v104)
      {
        v105 = v104;
        v106 = sub_1DD1C202C();
        v108 = v107;

      }
      else
      {
        v106 = 0;
        v108 = 0;
      }
      v109 = objc_msgSend(v99, sel_value);
      v110 = objc_msgSend(v109, sel_stringValue);

      v111 = sub_1DD1C202C();
      v113 = v112;

      v114 = sub_1DD1A8254(v101, v103, v106, v108, v111, v113);
      v116 = v115;
      v118 = v117;
      v120 = v119;

      swift_bridgeObjectRelease();
      v232 = v97;
      v122 = *(_QWORD *)(v97 + 16);
      v121 = *(_QWORD *)(v97 + 24);
      if (v122 >= v121 >> 1)
      {
        sub_1DD1B0284(v121 > 1, v122 + 1, 1);
        v97 = v232;
      }
      ++v96;
      *(_QWORD *)(v97 + 16) = v122 + 1;
      v123 = (_QWORD *)(v97 + 32 * v122);
      v123[4] = v114;
      v123[5] = v116;
      v123[6] = v118;
      v123[7] = v120;
      v93 = (unint64_t)v229;
    }
    while (v228 != v96);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v97 = MEMORY[0x1E0DEE9D8];
  }
  v232 = v97;
  sub_1DD1C1B28();
  swift_release();
  swift_bridgeObjectRelease();
  v124 = v212;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v125 = v124;
  swift_bridgeObjectRetain();
  sub_1DD1C1C0C();
  v126 = objc_msgSend(v226, sel_emailAddresses);
  v127 = sub_1DD1C2080();

  v212 = v125;
  if (!(v127 >> 62))
  {
    v128 = *(_QWORD *)((v127 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v128)
      goto LABEL_24;
LABEL_38:
    swift_bridgeObjectRelease();
    v130 = MEMORY[0x1E0DEE9D8];
    goto LABEL_39;
  }
  swift_bridgeObjectRetain();
  v128 = sub_1DD1C21DC();
  swift_bridgeObjectRelease();
  if (!v128)
    goto LABEL_38;
LABEL_24:
  v232 = MEMORY[0x1E0DEE9D8];
  result = sub_1DD1B0284(0, v128 & ~(v128 >> 63), 0);
  if (v128 < 0)
  {
LABEL_60:
    __break(1u);
    goto LABEL_61;
  }
  v129 = 0;
  v130 = v232;
  v227 = (_QWORD *)(v127 & 0xC000000000000001);
  v228 = (char *)v128;
  v229 = (char *)v127;
  do
  {
    if (v227)
      v131 = (id)MEMORY[0x1DF0D5B0C](v129, v127);
    else
      v131 = *(id *)(v127 + 8 * (_QWORD)v129 + 32);
    v132 = v131;
    v133 = objc_msgSend(v131, sel_identifier);
    v134 = sub_1DD1C202C();
    v136 = v135;

    v137 = objc_msgSend(v132, sel_label);
    if (v137)
    {
      v138 = v137;
      v139 = sub_1DD1C202C();
      v141 = v140;

    }
    else
    {
      v139 = 0;
      v141 = 0;
    }
    v142 = objc_msgSend(v132, sel_value);
    v143 = sub_1DD1C202C();
    v145 = v144;

    v146 = sub_1DD1A8254(v134, v136, v139, v141, v143, v145);
    v148 = v147;
    v150 = v149;
    v152 = v151;

    swift_bridgeObjectRelease();
    v232 = v130;
    v154 = *(_QWORD *)(v130 + 16);
    v153 = *(_QWORD *)(v130 + 24);
    if (v154 >= v153 >> 1)
    {
      sub_1DD1B0284(v153 > 1, v154 + 1, 1);
      v130 = v232;
    }
    ++v129;
    *(_QWORD *)(v130 + 16) = v154 + 1;
    v155 = (_QWORD *)(v130 + 32 * v154);
    v155[4] = v146;
    v155[5] = v148;
    v155[6] = v150;
    v155[7] = v152;
    v127 = (unint64_t)v229;
  }
  while (v228 != v129);
  swift_bridgeObjectRelease();
LABEL_39:
  v232 = v130;
  sub_1DD1C1B28();
  swift_release();
  swift_bridgeObjectRelease();
  v156 = v212;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v227 = v156;
  swift_bridgeObjectRetain();
  sub_1DD1C1C0C();
  v157 = objc_msgSend(v226, sel_postalAddresses);
  v158 = sub_1DD1C2080();

  if (v158 >> 62)
  {
    swift_bridgeObjectRetain();
    v159 = sub_1DD1C21DC();
    swift_bridgeObjectRelease();
    if (v159)
    {
LABEL_41:
      v232 = MEMORY[0x1E0DEE9D8];
      result = sub_1DD1B0284(0, v159 & ~(v159 >> 63), 0);
      if ((v159 & 0x8000000000000000) == 0)
      {
        v160 = 0;
        v161 = v232;
        v228 = (char *)(v158 & 0xC000000000000001);
        v229 = (char *)v158;
        do
        {
          if (v228)
            v162 = (id)MEMORY[0x1DF0D5B0C](v160, v158);
          else
            v162 = *(id *)(v158 + 8 * v160 + 32);
          v163 = v162;
          v164 = objc_msgSend(v162, sel_label);
          if (v164)
          {
            v165 = v164;
            v166 = sub_1DD1C202C();
            v168 = v167;

          }
          else
          {
            v166 = 0;
            v168 = 0;
          }
          v169 = objc_msgSend(v163, sel_value);
          v170 = objc_msgSend(v169, sel_formattedAddress);

          v171 = sub_1DD1C202C();
          v173 = v172;

          v174 = sub_1DD1A8574(v166, v168, v171, v173);
          v176 = v175;
          v178 = v177;
          v180 = v179;

          v232 = v161;
          v182 = *(_QWORD *)(v161 + 16);
          v181 = *(_QWORD *)(v161 + 24);
          if (v182 >= v181 >> 1)
          {
            sub_1DD1B0284(v181 > 1, v182 + 1, 1);
            v161 = v232;
          }
          ++v160;
          *(_QWORD *)(v161 + 16) = v182 + 1;
          v183 = (_QWORD *)(v161 + 32 * v182);
          v183[4] = v174;
          v183[5] = v176;
          v183[6] = v178;
          v183[7] = v180;
          v158 = (unint64_t)v229;
        }
        while (v159 != v160);
        swift_bridgeObjectRelease();
        goto LABEL_55;
      }
LABEL_61:
      __break(1u);
      return result;
    }
  }
  else
  {
    v159 = *(_QWORD *)((v158 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v159)
      goto LABEL_41;
  }
  swift_bridgeObjectRelease();
  v161 = MEMORY[0x1E0DEE9D8];
LABEL_55:
  v232 = v161;
  sub_1DD1C1B28();
  swift_release();
  swift_bridgeObjectRelease();
  v184 = v227;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v185 = v184;
  swift_bridgeObjectRetain();
  sub_1DD1C1C0C();
  v186 = objc_msgSend(v226, sel_birthday);
  if (v186)
  {
    v187 = v186;
    v188 = (uint64_t)v208;
    sub_1DD1C1E88();

    v189 = sub_1DD1C1E94();
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v189 - 8) + 56))(v188, 0, 1, v189);
  }
  else
  {
    v190 = sub_1DD1C1E94();
    v188 = (uint64_t)v208;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v190 - 8) + 56))(v208, 1, 1, v190);
  }
  sub_1DD1ADF50(v188, v209);
  v191 = v221;
  sub_1DD1C1B28();
  sub_1DD1A5830(v188);
  v192 = v220;
  swift_release();
  v193 = v217;
  swift_bridgeObjectRelease();

  v194 = v219;
  swift_bridgeObjectRelease();
  v195 = v218;
  swift_bridgeObjectRelease();
  swift_release();
  v196 = v222;
  swift_release();
  v197 = v223;
  swift_release();
  v198 = v224;
  swift_release();
  v199 = v225;
  swift_release();

  (*(void (**)(char *, uint64_t))(v216 + 8))(v214, v215);
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  result = swift_release();
  v200 = v210;
  *v210 = v199;
  v200[1] = v198;
  v200[2] = (uint64_t)v197;
  v200[3] = (uint64_t)v196;
  v201 = v205;
  v200[4] = (uint64_t)v191;
  v200[5] = v201;
  v202 = v207;
  v200[6] = v195;
  v200[7] = v202;
  v200[8] = v194;
  v200[9] = (uint64_t)v185;
  v200[10] = v204;
  v200[11] = v193;
  v200[12] = (uint64_t)v192;
  return result;
}

uint64_t sub_1DD1ADF50(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9698);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DD1ADF98(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9C30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DD1ADFE0(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

unint64_t sub_1DD1AE00C()
{
  unint64_t result;

  result = qword_1F03C9C40;
  if (!qword_1F03C9C40)
  {
    result = MEMORY[0x1DF0D6658](&protocol conformance descriptor for ContactEntity, &type metadata for ContactEntity);
    atomic_store(result, (unint64_t *)&qword_1F03C9C40);
  }
  return result;
}

unint64_t sub_1DD1AE054()
{
  unint64_t result;

  result = qword_1F03C9C48;
  if (!qword_1F03C9C48)
  {
    result = MEMORY[0x1DF0D6658](&protocol conformance descriptor for ContactEntity, &type metadata for ContactEntity);
    atomic_store(result, (unint64_t *)&qword_1F03C9C48);
  }
  return result;
}

unint64_t sub_1DD1AE09C()
{
  unint64_t result;

  result = qword_1F03C8088;
  if (!qword_1F03C8088)
  {
    result = MEMORY[0x1DF0D6658](&protocol conformance descriptor for ContactEntity, &type metadata for ContactEntity);
    atomic_store(result, (unint64_t *)&qword_1F03C8088);
  }
  return result;
}

unint64_t sub_1DD1AE0E4()
{
  unint64_t result;

  result = qword_1F03C8098;
  if (!qword_1F03C8098)
  {
    result = MEMORY[0x1DF0D6658](&protocol conformance descriptor for ContactEntity, &type metadata for ContactEntity);
    atomic_store(result, (unint64_t *)&qword_1F03C8098);
  }
  return result;
}

unint64_t sub_1DD1AE12C()
{
  unint64_t result;

  result = qword_1F03C80C0;
  if (!qword_1F03C80C0)
  {
    result = MEMORY[0x1DF0D6658](&protocol conformance descriptor for ContactEntity, &type metadata for ContactEntity);
    atomic_store(result, (unint64_t *)&qword_1F03C80C0);
  }
  return result;
}

uint64_t sub_1DD1AE170()
{
  return MEMORY[0x1E0C91C90];
}

unint64_t sub_1DD1AE180()
{
  unint64_t result;

  result = qword_1F03C9C50;
  if (!qword_1F03C9C50)
  {
    result = MEMORY[0x1DF0D6658](&protocol conformance descriptor for UpdateContactIntent, &type metadata for UpdateContactIntent);
    atomic_store(result, (unint64_t *)&qword_1F03C9C50);
  }
  return result;
}

unint64_t sub_1DD1AE1C8()
{
  unint64_t result;

  result = qword_1F03C80A0;
  if (!qword_1F03C80A0)
  {
    result = MEMORY[0x1DF0D6658](&protocol conformance descriptor for ContactEntity, &type metadata for ContactEntity);
    atomic_store(result, (unint64_t *)&qword_1F03C80A0);
  }
  return result;
}

unint64_t sub_1DD1AE210()
{
  unint64_t result;

  result = qword_1F03C80A8;
  if (!qword_1F03C80A8)
  {
    result = MEMORY[0x1DF0D6658](&protocol conformance descriptor for ContactEntity, &type metadata for ContactEntity);
    atomic_store(result, (unint64_t *)&qword_1F03C80A8);
  }
  return result;
}

unint64_t sub_1DD1AE258()
{
  unint64_t result;

  result = qword_1F03C80B0;
  if (!qword_1F03C80B0)
  {
    result = MEMORY[0x1DF0D6658](&protocol conformance descriptor for ContactEntity, &type metadata for ContactEntity);
    atomic_store(result, (unint64_t *)&qword_1F03C80B0);
  }
  return result;
}

uint64_t sub_1DD1AE29C()
{
  return MEMORY[0x1E0DEA978];
}

unint64_t sub_1DD1AE2AC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F03C9C58;
  if (!qword_1F03C9C58)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F03C9C60);
    result = MEMORY[0x1DF0D6658](MEMORY[0x1E0C919A0], v1);
    atomic_store(result, (unint64_t *)&qword_1F03C9C58);
  }
  return result;
}

unint64_t sub_1DD1AE2FC()
{
  unint64_t result;

  result = qword_1F03C80B8;
  if (!qword_1F03C80B8)
  {
    result = MEMORY[0x1DF0D6658](&protocol conformance descriptor for ContactEntity, &type metadata for ContactEntity);
    atomic_store(result, (unint64_t *)&qword_1F03C80B8);
  }
  return result;
}

uint64_t destroy for ContactEntity(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return swift_release();
}

_QWORD *initializeWithCopy for ContactEntity(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  v7 = (void *)a2[9];
  a1[8] = a2[8];
  a1[9] = v7;
  v8 = a2[11];
  a1[10] = a2[10];
  a1[11] = v8;
  a1[12] = a2[12];
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v9 = v7;
  swift_bridgeObjectRetain();
  sub_1DD1C1C0C();
  return a1;
}

_QWORD *assignWithCopy for ContactEntity(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;

  *a1 = *a2;
  sub_1DD1C1C0C();
  swift_release();
  a1[1] = a2[1];
  sub_1DD1C1C0C();
  swift_release();
  a1[2] = a2[2];
  sub_1DD1C1C0C();
  swift_release();
  a1[3] = a2[3];
  sub_1DD1C1C0C();
  swift_release();
  a1[4] = a2[4];
  sub_1DD1C1C0C();
  swift_release();
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = (void *)a2[9];
  v5 = (void *)a1[9];
  a1[9] = v4;
  v6 = v4;

  a1[10] = a2[10];
  a1[11] = a2[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[12] = a2[12];
  sub_1DD1C1C0C();
  swift_release();
  return a1;
}

__n128 __swift_memcpy104_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __n128 result;
  __int128 v5;
  __int128 v6;

  v2 = *a2;
  v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  result = (__n128)a2[3];
  v5 = a2[4];
  v6 = a2[5];
  *(_QWORD *)(a1 + 96) = *((_QWORD *)a2 + 12);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t assignWithTake for ContactEntity(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;

  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  swift_release();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_release();
  v4 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  v5 = *(void **)(a1 + 72);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);

  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ContactEntity(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 104))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ContactEntity(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 104) = 1;
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
    *(_BYTE *)(result + 104) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ContactEntity()
{
  return &type metadata for ContactEntity;
}

uint64_t *initializeBufferWithCopyOfBuffer for ContactEntityPropertyComparator(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    sub_1DD1C1C0C();
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
    {
      v7 = a2[1];
      *a1 = *a2;
      a1[1] = v7;
      swift_bridgeObjectRetain();
    }
    else
    {
      v9 = sub_1DD1C1EB8();
      v10 = *(_QWORD *)(v9 - 8);
      if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v10 + 48))(a2, 1, v9))
      {
        v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9AC0);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
      }
      else
      {
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v10 + 16))(a1, a2, v9);
        (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v10 + 56))(a1, 0, 1, v9);
      }
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for ContactEntityPropertyComparator(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 2 || (_DWORD)result == 1)
    return swift_bridgeObjectRelease();
  if (!(_DWORD)result)
  {
    v3 = sub_1DD1C1EB8();
    v4 = *(_QWORD *)(v3 - 8);
    result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(a1, 1, v3);
    if (!(_DWORD)result)
      return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }
  return result;
}

_QWORD *initializeWithCopy for ContactEntityPropertyComparator(_QWORD *a1, _QWORD *a2)
{
  int EnumCaseMultiPayload;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
  {
    v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    swift_bridgeObjectRetain();
  }
  else
  {
    v6 = sub_1DD1C1EB8();
    v7 = *(_QWORD *)(v6 - 8);
    if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
    {
      v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9AC0);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
    }
    else
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v7 + 16))(a1, a2, v6);
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
    }
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

_QWORD *assignWithCopy for ContactEntityPropertyComparator(_QWORD *a1, _QWORD *a2)
{
  int EnumCaseMultiPayload;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (a1 != a2)
  {
    sub_1DD1A7990((uint64_t)a1);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
    }
    else
    {
      v5 = sub_1DD1C1EB8();
      v6 = *(_QWORD *)(v5 - 8);
      if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
      {
        v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9AC0);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v6 + 16))(a1, a2, v5);
        (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
      }
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t type metadata accessor for ContactEntityPropertyComparator()
{
  uint64_t result;

  result = qword_1F03C9C70;
  if (!qword_1F03C9C70)
    return swift_getSingletonMetadata();
  return result;
}

void *initializeWithTake for ContactEntityPropertyComparator(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v6 = sub_1DD1C1EB8();
    v7 = *(_QWORD *)(v6 - 8);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
    {
      v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9AC0);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(a1, a2, v6);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *assignWithTake for ContactEntityPropertyComparator(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (a1 != a2)
  {
    sub_1DD1A7990((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      v6 = sub_1DD1C1EB8();
      v7 = *(_QWORD *)(v6 - 8);
      if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
      {
        v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9AC0);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(a1, a2, v6);
        (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      }
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for ContactEntityPropertyComparator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for ContactEntityPropertyComparator(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_1DD1AED80()
{
  return swift_storeEnumTagMultiPayload();
}

void sub_1DD1AED90()
{
  unint64_t v0;

  sub_1DD1AEE00();
  if (v0 <= 0x3F)
    swift_initEnumMetadataMultiPayload();
}

void sub_1DD1AEE00()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F03C9C80)
  {
    sub_1DD1C1EB8();
    v0 = sub_1DD1C2110();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1F03C9C80);
  }
}

uint64_t sub_1DD1AEE54()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v0 = sub_1DD1C2014();
  MEMORY[0x1E0C80A78](v0);
  v1 = sub_1DD1C1EDC();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1DD1C1F84();
  MEMORY[0x1E0C80A78](v5);
  v6 = sub_1DD1C1EE8();
  __swift_allocate_value_buffer(v6, static DeleteContactIntent.title);
  __swift_project_value_buffer(v6, (uint64_t)static DeleteContactIntent.title);
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x1E0CAF9B8], v1);
  return sub_1DD1C1EF4();
}

uint64_t DeleteContactIntent.title.unsafeMutableAddressor()
{
  return sub_1DD1A11AC(&qword_1F03C9640, (uint64_t (*)(_QWORD))MEMORY[0x1E0CAF9F8], (uint64_t)static DeleteContactIntent.title);
}

uint64_t static DeleteContactIntent.title.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DD1A2AEC(&qword_1F03C9640, (uint64_t (*)(_QWORD))MEMORY[0x1E0CAF9F8], (uint64_t)static DeleteContactIntent.title, a1);
}

uint64_t static DeleteContactIntent.title.setter(uint64_t a1)
{
  return sub_1DD1A2B9C(a1, &qword_1F03C9640, (uint64_t (*)(_QWORD))MEMORY[0x1E0CAF9F8], (uint64_t)static DeleteContactIntent.title);
}

uint64_t (*static DeleteContactIntent.title.modify())()
{
  uint64_t v0;

  if (qword_1F03C9640 != -1)
    swift_once();
  v0 = sub_1DD1C1EE8();
  __swift_project_value_buffer(v0, (uint64_t)static DeleteContactIntent.title);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1DD1AF0C4()
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
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[2];

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96C0);
  MEMORY[0x1E0C80A78](v0);
  v12[0] = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = sub_1DD1C1EDC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1DD1C1F84();
  MEMORY[0x1E0C80A78](v6);
  v7 = sub_1DD1C2014();
  MEMORY[0x1E0C80A78](v7);
  v8 = sub_1DD1C1EE8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v10 = sub_1DD1C1CD8();
  __swift_allocate_value_buffer(v10, static DeleteContactIntent.description);
  __swift_project_value_buffer(v10, (uint64_t)static DeleteContactIntent.description);
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x1E0CAF9B8], v2);
  sub_1DD1C1EF4();
  (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(v9 + 56))(v12[0], 1, 1, v8);
  return sub_1DD1C1CE4();
}

uint64_t DeleteContactIntent.description.unsafeMutableAddressor()
{
  return sub_1DD1A11AC(&qword_1F03C9648, (uint64_t (*)(_QWORD))MEMORY[0x1E0C91130], (uint64_t)static DeleteContactIntent.description);
}

uint64_t static DeleteContactIntent.description.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DD1A2AEC(&qword_1F03C9648, (uint64_t (*)(_QWORD))MEMORY[0x1E0C91130], (uint64_t)static DeleteContactIntent.description, a1);
}

uint64_t static DeleteContactIntent.description.setter(uint64_t a1)
{
  return sub_1DD1A2B9C(a1, &qword_1F03C9648, (uint64_t (*)(_QWORD))MEMORY[0x1E0C91130], (uint64_t)static DeleteContactIntent.description);
}

uint64_t (*static DeleteContactIntent.description.modify())()
{
  uint64_t v0;

  if (qword_1F03C9648 != -1)
    swift_once();
  v0 = sub_1DD1C1CD8();
  __swift_project_value_buffer(v0, (uint64_t)static DeleteContactIntent.description);
  swift_beginAccess();
  return j__swift_endAccess;
}

void *DeleteContactIntent.assistantOnly.unsafeMutableAddressor()
{
  return &static DeleteContactIntent.assistantOnly;
}

uint64_t static DeleteContactIntent.assistantOnly.getter()
{
  return 1;
}

uint64_t DeleteContactIntent.entities.getter()
{
  uint64_t v1;

  sub_1DD1C1B7C();
  return v1;
}

uint64_t DeleteContactIntent.entities.setter()
{
  return sub_1DD1C1B88();
}

void (*DeleteContactIntent.entities.modify(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1DD1C1B70();
  return sub_1DD1A1A24;
}

uint64_t DeleteContactIntent.$entities.getter()
{
  return sub_1DD1C1B94();
}

uint64_t DeleteContactIntent.perform()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  return swift_task_switch();
}

uint64_t sub_1DD1AF4D8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v1 = v0[8];
  v0[2] = v0[7];
  v0[3] = v1;
  v2 = sub_1DD1C1D80();
  v0[9] = v2;
  v0[10] = *(_QWORD *)(v2 - 8);
  v0[11] = swift_task_alloc();
  v0[4] = MEMORY[0x1E0DEE9D8];
  sub_1DD1B1088();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9CA0);
  sub_1DD1A8F24(&qword_1F03C9CA8, &qword_1F03C9CA0, MEMORY[0x1E0DEAF38]);
  sub_1DD1C214C();
  v3 = sub_1DD1C1D74();
  v0[12] = v3;
  v0[13] = *(_QWORD *)(v3 - 8);
  v0[14] = swift_task_alloc();
  sub_1DD1C1D68();
  v4 = sub_1DD1C1A80();
  v0[15] = v4;
  v0[16] = *(_QWORD *)(v4 - 8);
  v5 = swift_task_alloc();
  v0[17] = v5;
  sub_1DD1AF854(v5);
  v6 = (_QWORD *)swift_task_alloc();
  v0[18] = v6;
  sub_1DD1B10D0();
  *v6 = v0;
  v6[1] = sub_1DD1AF668;
  return sub_1DD1C1A38();
}

uint64_t sub_1DD1AF668()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
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

  v2 = *(_QWORD **)v1;
  *(_QWORD *)(*(_QWORD *)v1 + 152) = v0;
  swift_task_dealloc();
  if (v0)
  {
    v3 = v2[14];
    v4 = v2[12];
    v5 = v2[13];
    v7 = v2[10];
    v6 = v2[11];
    v8 = v2[9];
    (*(void (**)(_QWORD, _QWORD))(v2[16] + 8))(v2[17], v2[15]);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  }
  else
  {
    v9 = v2[16];
    v10 = v2[17];
    v12 = v2[14];
    v11 = v2[15];
    v13 = v2[12];
    v14 = v2[13];
    v16 = v2[10];
    v15 = v2[11];
    v17 = v2[9];
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v10, v11);
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v12, v13);
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
  }
  return swift_task_switch();
}

uint64_t sub_1DD1AF778()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 152);
  sub_1DD1C1B7C();
  sub_1DD1AFEDC(*(_QWORD *)(v0 + 40));
  swift_bridgeObjectRelease();
  if (!v1)
    sub_1DD1C1AEC();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DD1AF808()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DD1AF854@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t *, _QWORD, uint64_t);
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(char *, char *, uint64_t);
  void (*v44)(char *, uint64_t);
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  char *v50;
  uint64_t v51;
  char *v52;
  char *v53;
  char *v54;
  char *v55;
  char *v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;

  v2 = sub_1DD1C1FFC();
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1DD1C1F84();
  MEMORY[0x1E0C80A78](v5);
  v61 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1DD1C1EDC();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (uint64_t *)((char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = sub_1DD1C2014();
  v12 = MEMORY[0x1E0C80A78](v11);
  v60 = (char *)&v46 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x1E0C80A78](v12);
  v57 = (char *)&v46 - v15;
  MEMORY[0x1E0C80A78](v14);
  v52 = (char *)&v46 - v16;
  v17 = sub_1DD1C1EE8();
  v58 = *(_QWORD *)(v17 - 8);
  v59 = v17;
  v18 = MEMORY[0x1E0C80A78](v17);
  v56 = (char *)&v46 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x1E0C80A78](v18);
  v55 = (char *)&v46 - v21;
  v22 = MEMORY[0x1E0C80A78](v20);
  v54 = (char *)&v46 - v23;
  MEMORY[0x1E0C80A78](v22);
  v53 = (char *)&v46 - v24;
  sub_1DD1C1B7C();
  v25 = v67;
  v26 = *(_QWORD *)(v67 + 16);
  if (v26)
  {
    v47 = v8;
    v48 = v7;
    v49 = v10;
    v50 = v4;
    v51 = a1;
    v67 = MEMORY[0x1E0DEE9D8];
    sub_1DD1B02BC(0, v26, 0);
    v27 = v67;
    v46 = v25;
    v28 = (uint64_t *)(v25 + 64);
    do
    {
      v29 = *(v28 - 1);
      v30 = *v28;
      v31 = v28[2];
      v65 = v28[4];
      v66 = v30;
      v64 = (id)v28[5];
      if (v31)
      {
        v63 = v28[1];
        sub_1DD1C1C0C();
        sub_1DD1C1C0C();
        sub_1DD1C1C0C();
        sub_1DD1C1C0C();
        sub_1DD1C1C0C();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v32 = v64;
        swift_bridgeObjectRetain();
        sub_1DD1C1C0C();
      }
      else
      {
        sub_1DD1C1C0C();
        sub_1DD1C1C0C();
        sub_1DD1C1C0C();
        sub_1DD1C1C0C();
        sub_1DD1C1C0C();
        swift_bridgeObjectRetain();
        v33 = v64;
        swift_bridgeObjectRetain();
        sub_1DD1C1C0C();
        v62 = v29;
        sub_1DD1C1FCC();
        sub_1DD1C1F78();
        v63 = sub_1DD1C2044();
        v31 = v34;
      }
      swift_release();
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      v67 = v27;
      v36 = *(_QWORD *)(v27 + 16);
      v35 = *(_QWORD *)(v27 + 24);
      if (v36 >= v35 >> 1)
      {
        sub_1DD1B02BC(v35 > 1, v36 + 1, 1);
        v27 = v67;
      }
      *(_QWORD *)(v27 + 16) = v36 + 1;
      v37 = v27 + 16 * v36;
      *(_QWORD *)(v37 + 32) = v63;
      *(_QWORD *)(v37 + 40) = v31;
      v28 += 13;
      --v26;
    }
    while (v26);
    swift_bridgeObjectRelease();
    v7 = v48;
    v10 = v49;
    v8 = v47;
  }
  else
  {
    swift_bridgeObjectRelease();
    v27 = MEMORY[0x1E0DEE9D8];
  }
  v67 = v27;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F03C9CF0);
  sub_1DD1A8F24((unint64_t *)&qword_1F03C96B0, (uint64_t *)&unk_1F03C9CF0, MEMORY[0x1E0DEAF20]);
  sub_1DD1C1FB4();
  swift_bridgeObjectRelease();
  sub_1DD1C1FCC();
  *v10 = type metadata accessor for ContactEntityProvider();
  v38 = *(void (**)(uint64_t *, _QWORD, uint64_t))(v8 + 104);
  v38(v10, *MEMORY[0x1E0CAF9C8], v7);
  sub_1DD1C1F78();
  v39 = v53;
  sub_1DD1C1EF4();
  sub_1DD1C1FF0();
  sub_1DD1C1FE4();
  sub_1DD1C1FD8();
  swift_bridgeObjectRelease();
  sub_1DD1C1FE4();
  sub_1DD1C2008();
  sub_1DD1C1F78();
  v38(v10, *MEMORY[0x1E0CAF9B8], v7);
  v40 = v54;
  sub_1DD1C1EF4();
  v42 = v58;
  v41 = v59;
  v43 = *(void (**)(char *, char *, uint64_t))(v58 + 16);
  v43(v55, v39, v59);
  v43(v56, v40, v41);
  sub_1DD1C1A74();
  v44 = *(void (**)(char *, uint64_t))(v42 + 8);
  v44(v40, v41);
  return ((uint64_t (*)(char *, uint64_t))v44)(v39, v41);
}

void sub_1DD1AFEDC(uint64_t a1)
{
  uint64_t v1;
  unint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t i;
  id v9;
  void *v10;
  id v11;
  id v12;
  unsigned __int8 v13;
  id v14;
  id v15;
  id v16[2];

  v16[1] = *(id *)MEMORY[0x1E0C80C00];
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  v3 = sub_1DD1B08CC(a1);
  swift_release();
  swift_release();
  if (v1)
    return;
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C973D0]), sel_init);
  v5 = v4;
  if (v3 >> 62)
  {
    v11 = v4;
    swift_bridgeObjectRetain();
    v6 = sub_1DD1C21DC();
    if (v6)
      goto LABEL_4;
  }
  else
  {
    v6 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    v7 = v4;
    swift_bridgeObjectRetain();
    if (v6)
    {
LABEL_4:
      if (v6 < 1)
        __break(1u);
      for (i = 0; i != v6; ++i)
      {
        if ((v3 & 0xC000000000000001) != 0)
          v9 = (id)MEMORY[0x1DF0D5B0C](i, v3);
        else
          v9 = *(id *)(v3 + 8 * i + 32);
        v10 = v9;
        objc_msgSend(v5, sel_deleteContact_, v9);

      }
    }
  }

  swift_bridgeObjectRelease_n();
  sub_1DD1C19B4();
  v12 = *((id *)v16[0] + 2);
  swift_release();
  v16[0] = 0;
  v13 = objc_msgSend(v12, sel_executeSaveRequest_error_, v5, v16);

  if ((v13 & 1) != 0)
  {
    v14 = v16[0];
  }
  else
  {
    v15 = v16[0];
    sub_1DD1C1EC4();

    swift_willThrow();
  }

}

uint64_t sub_1DD1B00E8()
{
  uint64_t v1;

  sub_1DD1C1B7C();
  return v1;
}

uint64_t sub_1DD1B0118@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1F03C9640 != -1)
    swift_once();
  v2 = sub_1DD1C1EE8();
  v3 = __swift_project_value_buffer(v2, (uint64_t)static DeleteContactIntent.title);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_1DD1B01B0(uint64_t a1)
{
  _OWORD *v1;
  uint64_t v2;
  uint64_t v4;

  v4 = swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *(_QWORD *)v4 = v2;
  *(_QWORD *)(v4 + 8) = sub_1DD1A1B84;
  *(_OWORD *)(v4 + 56) = *v1;
  *(_QWORD *)(v4 + 48) = a1;
  return swift_task_switch();
}

uint64_t sub_1DD1B0218@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = _s14ContactsUICore19DeleteContactIntentVACycfC_0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1DD1B023C()
{
  sub_1DD1B10D0();
  return sub_1DD1C1A50();
}

uint64_t sub_1DD1B0268(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_1DD1B02D8(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_1DD1B0284(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_1DD1B0478(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_1DD1B02A0(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_1DD1B05E0(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_1DD1B02BC(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_1DD1B0764(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_1DD1B02D8(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9D28);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  v12 = (unint64_t)(v10 + 4);
  v13 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= v13 + 40 * v8)
      memmove(v10 + 4, a4 + 4, 40 * v8);
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 40 * v8 || v12 >= v13 + 40 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F03C9D30);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_1DD1C21E8();
  __break(1u);
  return result;
}

uint64_t sub_1DD1B0478(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9D20);
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
    v10 = (char *)MEMORY[0x1E0DEE9D8];
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
  result = sub_1DD1C21E8();
  __break(1u);
  return result;
}

uint64_t sub_1DD1B05E0(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9D18);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 104);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[104 * v8])
      memmove(v12, v13, 104 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[104 * v8] || v12 >= &v13[104 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_1DD1C21E8();
  __break(1u);
  return result;
}

uint64_t sub_1DD1B0764(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F03C9D00);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_1DD1C21E8();
  __break(1u);
  return result;
}

uint64_t sub_1DD1B08CC(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t i;
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  id v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 16);
  result = MEMORY[0x1E0DEE9D8];
  if (v2)
  {
    v16 = MEMORY[0x1E0DEE9D8];
    sub_1DD1C21AC();
    for (i = a1 + 64; ; i += 104)
    {
      v13 = v2;
      v5 = *(void **)(i + 40);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v14 = v5;
      swift_bridgeObjectRetain();
      sub_1DD1C1C0C();
      sub_1DD1C1C0C();
      sub_1DD1C1C0C();
      sub_1DD1C1C0C();
      sub_1DD1C1C0C();
      sub_1DD1C1C0C();
      sub_1DD1C19B4();
      v6 = v15;
      if (qword_1F03C9618 != -1)
        swift_once();
      v7 = (void *)v6[2];
      v8 = (void *)sub_1DD1C2020();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F03C9AA0);
      v9 = (void *)sub_1DD1C2074();
      v15 = 0;
      v10 = objc_msgSend(v7, sel_unifiedContactWithIdentifier_keysToFetch_error_, v8, v9, &v15);

      if (!v10)
        break;
      v11 = v15;
      swift_release();
      objc_msgSend(v10, sel_mutableCopy);

      sub_1DD1C2140();
      swift_unknownObjectRelease();
      sub_1DD1B1254();
      swift_dynamicCast();
      swift_release();
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      sub_1DD1C2194();
      sub_1DD1C21B8();
      sub_1DD1C21C4();
      sub_1DD1C21A0();
      v2 = v13 - 1;
      if (v13 == 1)
        return v16;
    }
    v12 = v15;
    sub_1DD1C1EC4();

    swift_willThrow();
    swift_release();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t _s14ContactsUICore19DeleteContactIntentVACycfC_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t, uint64_t);
  char *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v0 = sub_1DD1C2014();
  v1 = MEMORY[0x1E0C80A78](v0);
  MEMORY[0x1E0C80A78](v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96C0);
  MEMORY[0x1E0C80A78](v2);
  v26 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1DD1C1EDC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1DD1C1F84();
  MEMORY[0x1E0C80A78](v8);
  v24 = sub_1DD1C1EE8();
  v9 = *(_QWORD *)(v24 - 8);
  MEMORY[0x1E0C80A78](v24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9D10);
  if (qword_1F03C7E40 != -1)
    swift_once();
  v27 = qword_1F03CC020;
  v28 = *(_QWORD *)algn_1F03CC028;
  swift_bridgeObjectRetain();
  sub_1DD1C2158();
  sub_1DD1C19F0();
  sub_1DD1C19E4();
  v25 = sub_1DD1C19CC();
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  v10 = *MEMORY[0x1E0CAF9B8];
  v11 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 104);
  v11(v7, v10, v4);
  sub_1DD1C1EF4();
  sub_1DD1C1FCC();
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9718);
  sub_1DD1C1F78();
  v11(v7, v10, v4);
  v12 = v26;
  sub_1DD1C1EF4();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v12, 0, 1, v24);
  v29 = 0;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96D0);
  v14 = *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64);
  MEMORY[0x1E0C80A78](v13);
  v15 = (v14 + 15) & 0xFFFFFFFFFFFFFFF0;
  v16 = sub_1DD1C1A80();
  v17 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56);
  v18 = v17((char *)&v23 - v15, 1, 1, v16);
  MEMORY[0x1E0C80A78](v18);
  v17((char *)&v23 - v15, 1, 1, v16);
  v19 = sub_1DD1C1DA4();
  MEMORY[0x1E0C80A78](v19);
  (*(void (**)(char *, _QWORD))(v21 + 104))((char *)&v23 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x1E0C91740]);
  sub_1DD1A0434();
  sub_1DD1C1BA0();
  return v25;
}

unint64_t sub_1DD1B1088()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F03C9C98;
  if (!qword_1F03C9C98)
  {
    v1 = sub_1DD1C1D80();
    result = MEMORY[0x1DF0D6658](MEMORY[0x1E0C91608], v1);
    atomic_store(result, (unint64_t *)&qword_1F03C9C98);
  }
  return result;
}

unint64_t sub_1DD1B10D0()
{
  unint64_t result;

  result = qword_1F03C9CB0;
  if (!qword_1F03C9CB0)
  {
    result = MEMORY[0x1DF0D6658](&protocol conformance descriptor for DeleteContactIntent, &type metadata for DeleteContactIntent);
    atomic_store(result, (unint64_t *)&qword_1F03C9CB0);
  }
  return result;
}

unint64_t sub_1DD1B1118()
{
  unint64_t result;

  result = qword_1F03C9CB8;
  if (!qword_1F03C9CB8)
  {
    result = MEMORY[0x1DF0D6658](&protocol conformance descriptor for DeleteContactIntent, &type metadata for DeleteContactIntent);
    atomic_store(result, (unint64_t *)&qword_1F03C9CB8);
  }
  return result;
}

unint64_t sub_1DD1B1164()
{
  unint64_t result;

  result = qword_1F03C9CC8;
  if (!qword_1F03C9CC8)
  {
    result = MEMORY[0x1DF0D6658](&protocol conformance descriptor for DeleteContactIntent, &type metadata for DeleteContactIntent);
    atomic_store(result, (unint64_t *)&qword_1F03C9CC8);
  }
  return result;
}

unint64_t sub_1DD1B11AC()
{
  unint64_t result;

  result = qword_1F03C9CD0;
  if (!qword_1F03C9CD0)
  {
    result = MEMORY[0x1DF0D6658](&protocol conformance descriptor for DeleteContactIntent, &type metadata for DeleteContactIntent);
    atomic_store(result, (unint64_t *)&qword_1F03C9CD0);
  }
  return result;
}

uint64_t sub_1DD1B11F0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1DD1B1200()
{
  sub_1DD1B10D0();
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for DeleteContactIntent()
{
  return &type metadata for DeleteContactIntent;
}

unint64_t sub_1DD1B1254()
{
  unint64_t result;

  result = qword_1F03C9670;
  if (!qword_1F03C9670)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1F03C9670);
  }
  return result;
}

uint64_t sub_1DD1B1290()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t (*v4)(char *, uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9DC8);
  v1 = *(_QWORD *)(v0 - 8);
  v2 = *(_QWORD *)(v1 + 64);
  MEMORY[0x1E0C80A78](v0);
  v3 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  sub_1DD1A5418();
  sub_1DD1C1C84();
  v15 = sub_1DD1C1C24();
  v4 = *(uint64_t (**)(char *, uint64_t))(v1 + 8);
  v5 = v4((char *)&v14 - v3, v0);
  MEMORY[0x1E0C80A78](v5);
  sub_1DD1C1C84();
  v6 = sub_1DD1C1C24();
  v7 = v4((char *)&v14 - v3, v0);
  MEMORY[0x1E0C80A78](v7);
  sub_1DD1C1C84();
  v8 = sub_1DD1C1C24();
  v9 = v4((char *)&v14 - v3, v0);
  MEMORY[0x1E0C80A78](v9);
  sub_1DD1C1C84();
  v10 = sub_1DD1C1C24();
  v4((char *)&v14 - v3, v0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9DD0);
  v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_1DD1C9D80;
  *(_QWORD *)(v11 + 32) = v15;
  *(_QWORD *)(v11 + 40) = v6;
  *(_QWORD *)(v11 + 48) = v8;
  *(_QWORD *)(v11 + 56) = v10;
  v12 = sub_1DD1C1C18();
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_1DD1B14F4()
{
  return sub_1DD1C1C48();
}

uint64_t sub_1DD1B1508(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t);
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(char *, uint64_t);
  uint64_t v34;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9DC0);
  v32 = *(_QWORD *)(*(_QWORD *)(v2 - 8) + 64);
  MEMORY[0x1E0C80A78](v2);
  v28 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  sub_1DD1A5418();
  sub_1DD1C1CA8();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  v34 = sub_1DD1AB72C(&qword_1F03C9D60, &qword_1F03C9C30, (uint64_t (*)(void))sub_1DD1B7888, MEMORY[0x1E0C91D80]);
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  sub_1DD1C1C9C();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9DC8);
  v5 = *(_QWORD *)(v4 - 8);
  v29 = *(_QWORD *)(v5 + 64);
  v30 = v4;
  MEMORY[0x1E0C80A78](v4);
  v31 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  v7 = (char *)&v23 - v31;
  sub_1DD1C1CB4();
  v26 = sub_1DD1C1C24();
  v33 = *(uint64_t (**)(char *, uint64_t))(v5 + 8);
  v8 = v33(v7, v4);
  v24 = &v23;
  MEMORY[0x1E0C80A78](v8);
  sub_1DD1C1CA8();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  v27 = a1;
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  v9 = sub_1DD1C1C9C();
  MEMORY[0x1E0C80A78](v9);
  v10 = v31;
  sub_1DD1C1CB4();
  v25 = sub_1DD1C1C24();
  v11 = v30;
  v12 = v33((char *)&v23 - v10, v30);
  v23 = (uint64_t)&v23;
  MEMORY[0x1E0C80A78](v12);
  sub_1DD1C1CA8();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  v13 = sub_1DD1C1C9C();
  MEMORY[0x1E0C80A78](v13);
  sub_1DD1C1CB4();
  v24 = (uint64_t *)sub_1DD1C1C24();
  v14 = (void (*)(char *, uint64_t))v33;
  v15 = v33((char *)&v23 - v10, v11);
  v23 = (uint64_t)&v23;
  MEMORY[0x1E0C80A78](v15);
  sub_1DD1C1CA8();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  v16 = sub_1DD1C1C9C();
  MEMORY[0x1E0C80A78](v16);
  v17 = (char *)&v23 - v31;
  sub_1DD1C1CB4();
  v18 = sub_1DD1C1C24();
  v14(v17, v30);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9DD0);
  v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_1DD1C9D80;
  v20 = v25;
  *(_QWORD *)(v19 + 32) = v26;
  *(_QWORD *)(v19 + 40) = v20;
  *(_QWORD *)(v19 + 48) = v24;
  *(_QWORD *)(v19 + 56) = v18;
  v21 = sub_1DD1C1C18();
  swift_bridgeObjectRelease();
  return v21;
}

uint64_t sub_1DD1B1C14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(char *, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v0 = sub_1DD1C1C78();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = *(_QWORD *)(v1 + 64);
  MEMORY[0x1E0C80A78](v0);
  v3 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  swift_getKeyPath();
  sub_1DD1AB72C(&qword_1F03C9D60, &qword_1F03C9C30, (uint64_t (*)(void))sub_1DD1B7888, MEMORY[0x1E0C91D80]);
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1A5418();
  sub_1DD1C1C6C();
  v4 = sub_1DD1C1C60();
  v5 = *(uint64_t (**)(char *, uint64_t))(v1 + 8);
  v6 = v5((char *)&v11 - v3, v0);
  MEMORY[0x1E0C80A78](v6);
  swift_getKeyPath();
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C6C();
  v7 = sub_1DD1C1C60();
  v5((char *)&v11 - v3, v0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9D70);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_1DD1C9D90;
  *(_QWORD *)(v8 + 32) = v4;
  *(_QWORD *)(v8 + 40) = v7;
  v9 = sub_1DD1C1C54();
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_1DD1B1DD0()
{
  return sub_1DD1B71D0();
}

uint64_t sub_1DD1B1DEC()
{
  return sub_1DD1B71D0();
}

uint64_t sub_1DD1B1E0C(uint64_t a1)
{
  return sub_1DD1B1EBC(a1, 37, 0xD000000000000013, 0x80000001DD1D2270, (uint64_t)&unk_1DD1CA070);
}

uint64_t sub_1DD1B1E34(uint64_t a1)
{
  return sub_1DD1B2144(a1, (uint64_t)sub_1DD1B1DD0, (uint64_t)sub_1DD1B1DEC, (uint64_t)&unk_1DD1CA070, (uint64_t)sub_1DD1B1E58);
}

uint64_t sub_1DD1B1E58()
{
  return sub_1DD1B71D0();
}

uint64_t sub_1DD1B1E94(uint64_t a1)
{
  return sub_1DD1B1EBC(a1, 38, 0xD000000000000014, 0x80000001DD1D2250, (uint64_t)&unk_1DD1CA048);
}

uint64_t sub_1DD1B1EBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[2];

  v14[1] = a5;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9DC0);
  MEMORY[0x1E0C80A78](v5);
  sub_1DD1A5418();
  sub_1DD1C1CA8();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  sub_1DD1AB72C(&qword_1F03C9D60, &qword_1F03C9C30, (uint64_t (*)(void))sub_1DD1B7888, MEMORY[0x1E0C91D80]);
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  sub_1DD1C1C9C();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9DC8);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DD1C1CB4();
  v10 = sub_1DD1C1C24();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9DD0);
  v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_1DD1C8FF0;
  *(_QWORD *)(v11 + 32) = v10;
  v12 = sub_1DD1C1C18();
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_1DD1B2120(uint64_t a1)
{
  return sub_1DD1B2144(a1, (uint64_t)sub_1DD1B1DD0, (uint64_t)sub_1DD1B1DEC, (uint64_t)&unk_1DD1CA048, (uint64_t)sub_1DD1B237C);
}

uint64_t sub_1DD1B2144(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t (*v9)(char *, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v19 = a4;
  v20 = a5;
  v17 = a3;
  v5 = sub_1DD1C1C78();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x1E0C80A78](v5);
  v8 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  swift_getKeyPath();
  sub_1DD1AB72C(&qword_1F03C9D60, &qword_1F03C9C30, (uint64_t (*)(void))sub_1DD1B7888, MEMORY[0x1E0C91D80]);
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1A5418();
  sub_1DD1C1C6C();
  v18 = sub_1DD1C1C60();
  v9 = *(uint64_t (**)(char *, uint64_t))(v6 + 8);
  v10 = v9((char *)&v17 - v8, v5);
  MEMORY[0x1E0C80A78](v10);
  swift_getKeyPath();
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C6C();
  v11 = sub_1DD1C1C60();
  v12 = v9((char *)&v17 - v8, v5);
  MEMORY[0x1E0C80A78](v12);
  swift_getKeyPath();
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C6C();
  v13 = sub_1DD1C1C60();
  v9((char *)&v17 - v8, v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9D70);
  v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_1DD1C9DA0;
  *(_QWORD *)(v14 + 32) = v18;
  *(_QWORD *)(v14 + 40) = v11;
  *(_QWORD *)(v14 + 48) = v13;
  v15 = sub_1DD1C1C54();
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t sub_1DD1B237C()
{
  return sub_1DD1B71D0();
}

uint64_t sub_1DD1B23B4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t (*v7)(char *, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v19;
  uint64_t v20;
  unint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v22 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9DA8);
  v25 = *(_QWORD *)(*(_QWORD *)(v1 - 8) + 64);
  MEMORY[0x1E0C80A78](v1);
  v26 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  sub_1DD1B10D0();
  sub_1DD1C1CA8();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  v28 = sub_1DD1AB72C(&qword_1F03C9DA0, qword_1F03C9BB0, (uint64_t (*)(void))sub_1DD1A51F8, MEMORY[0x1E0C91CD0]);
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  sub_1DD1C1C9C();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9DB0);
  v4 = *(_QWORD *)(v3 - 8);
  v20 = v3;
  v27 = *(_QWORD *)(v4 + 64);
  MEMORY[0x1E0C80A78](v3);
  v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  v19 = v6;
  sub_1DD1C1CB4();
  v24 = sub_1DD1C1C24();
  v7 = *(uint64_t (**)(char *, uint64_t))(v4 + 8);
  v8 = v7((char *)&v19 - v6, v3);
  v21 = &v19;
  MEMORY[0x1E0C80A78](v8);
  sub_1DD1C1CA8();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  v9 = sub_1DD1C1C9C();
  MEMORY[0x1E0C80A78](v9);
  sub_1DD1C1CB4();
  v23 = sub_1DD1C1C24();
  v10 = v20;
  v11 = v7((char *)&v19 - v6, v20);
  v21 = &v19;
  MEMORY[0x1E0C80A78](v11);
  sub_1DD1C1CA8();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  v12 = sub_1DD1C1C9C();
  MEMORY[0x1E0C80A78](v12);
  v13 = (char *)&v19 - v19;
  sub_1DD1C1CB4();
  v14 = sub_1DD1C1C24();
  v7(v13, v10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9DB8);
  v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_1DD1C9DA0;
  v16 = v23;
  *(_QWORD *)(v15 + 32) = v24;
  *(_QWORD *)(v15 + 40) = v16;
  *(_QWORD *)(v15 + 48) = v14;
  v17 = sub_1DD1C1C18();
  swift_bridgeObjectRelease();
  return v17;
}

uint64_t sub_1DD1B284C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v0 = sub_1DD1C1C78();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_1DD1AB72C(&qword_1F03C9DA0, qword_1F03C9BB0, (uint64_t (*)(void))sub_1DD1A51F8, MEMORY[0x1E0C91CD0]);
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1B10D0();
  sub_1DD1C1C6C();
  v4 = sub_1DD1C1C60();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9D70);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1DD1C8FF0;
  *(_QWORD *)(v5 + 32) = v4;
  v6 = sub_1DD1C1C54();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_1DD1B297C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v0 = sub_1DD1C1C3C();
  v1 = sub_1DD1C1C3C();
  v2 = sub_1DD1C1C3C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9D48);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1DD1C9DA0;
  *(_QWORD *)(v3 + 32) = v0;
  *(_QWORD *)(v3 + 40) = v1;
  *(_QWORD *)(v3 + 48) = v2;
  v4 = sub_1DD1C1C30();
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_1DD1B2A30(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t (*v11)(char *, uint64_t);
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v24[2];
  uint64_t (*v25)(char *, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;

  v30 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9D78);
  v31 = *(_QWORD *)(*(_QWORD *)(v1 - 8) + 64);
  MEMORY[0x1E0C80A78](v1);
  v24[1] = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  v3 = sub_1DD1B77D4();
  sub_1DD1C1CA8();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  v32 = sub_1DD1AB72C(&qword_1F03C9D60, &qword_1F03C9C30, (uint64_t (*)(void))sub_1DD1B7888, MEMORY[0x1E0C91D80]);
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  sub_1DD1C1C9C();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9D90);
  v5 = *(_QWORD *)(v4 - 8);
  v29 = v4;
  v33 = *(_QWORD *)(v5 + 64);
  MEMORY[0x1E0C80A78](v4);
  v34 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  v7 = (char *)v24 - v34;
  sub_1DD1C1CB4();
  v28 = sub_1DD1C1C24();
  v25 = *(uint64_t (**)(char *, uint64_t))(v5 + 8);
  v8 = v25(v7, v4);
  MEMORY[0x1E0C80A78](v8);
  sub_1DD1C1CA8();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  v9 = sub_1DD1C1C9C();
  MEMORY[0x1E0C80A78](v9);
  v10 = (char *)v24 - v34;
  sub_1DD1C1CB4();
  v24[0] = v3;
  v27 = sub_1DD1C1C24();
  v11 = v25;
  v12 = v25(v10, v29);
  MEMORY[0x1E0C80A78](v12);
  sub_1DD1C1CA8();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  v13 = sub_1DD1C1C9C();
  MEMORY[0x1E0C80A78](v13);
  v14 = (char *)v24 - v34;
  sub_1DD1C1CB4();
  v26 = sub_1DD1C1C24();
  v15 = v29;
  v16 = v11(v14, v29);
  MEMORY[0x1E0C80A78](v16);
  sub_1DD1C1CA8();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  sub_1DD1A51F8();
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  v17 = sub_1DD1C1C9C();
  MEMORY[0x1E0C80A78](v17);
  v18 = (char *)v24 - v34;
  sub_1DD1C1CB4();
  v19 = sub_1DD1C1C24();
  v11(v18, v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9D98);
  v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_1DD1C9D80;
  v21 = v27;
  *(_QWORD *)(v20 + 32) = v28;
  *(_QWORD *)(v20 + 40) = v21;
  *(_QWORD *)(v20 + 48) = v26;
  *(_QWORD *)(v20 + 56) = v19;
  v22 = sub_1DD1C1C18();
  swift_bridgeObjectRelease();
  return v22;
}

__n128 sub_1DD1B3014@<Q0>(uint64_t a1@<X8>)
{
  __n128 result;
  __int128 v3;
  __int128 v4;
  uint64_t v5;
  __n128 v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;

  sub_1DD1C1B7C();
  result = v6;
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = v5;
  *(__n128 *)(a1 + 40) = v6;
  *(_QWORD *)(a1 + 56) = v7;
  *(_OWORD *)(a1 + 64) = v8;
  *(_QWORD *)(a1 + 80) = v9;
  *(_OWORD *)(a1 + 88) = v10;
  return result;
}

uint64_t sub_1DD1B307C(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v2 = v1;
  swift_bridgeObjectRetain();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  return sub_1DD1C1B88();
}

uint64_t sub_1DD1B314C()
{
  return sub_1DD1B38D0();
}

uint64_t sub_1DD1B3168()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v0 = sub_1DD1C1C3C();
  v1 = sub_1DD1C1C3C();
  v2 = sub_1DD1C1C3C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9D48);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1DD1C9DA0;
  *(_QWORD *)(v3 + 32) = v0;
  *(_QWORD *)(v3 + 40) = v1;
  *(_QWORD *)(v3 + 48) = v2;
  v4 = sub_1DD1C1C30();
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_1DD1B3210()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v0 = sub_1DD1C1C3C();
  v1 = sub_1DD1C1C3C();
  v2 = sub_1DD1C1C3C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9D48);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1DD1C9DA0;
  *(_QWORD *)(v3 + 32) = v0;
  *(_QWORD *)(v3 + 40) = v1;
  *(_QWORD *)(v3 + 48) = v2;
  v4 = sub_1DD1C1C30();
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_1DD1B32CC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t (*v11)(char *, uint64_t);
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v24[2];
  uint64_t (*v25)(char *, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;

  v30 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9D78);
  v31 = *(_QWORD *)(*(_QWORD *)(v1 - 8) + 64);
  MEMORY[0x1E0C80A78](v1);
  v24[1] = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  v3 = sub_1DD1B77D4();
  sub_1DD1C1CA8();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  v32 = sub_1DD1AB72C(&qword_1F03C9D60, &qword_1F03C9C30, (uint64_t (*)(void))sub_1DD1B7888, MEMORY[0x1E0C91D80]);
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  sub_1DD1C1C9C();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9D90);
  v5 = *(_QWORD *)(v4 - 8);
  v29 = v4;
  v33 = *(_QWORD *)(v5 + 64);
  MEMORY[0x1E0C80A78](v4);
  v34 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  v7 = (char *)v24 - v34;
  sub_1DD1C1CB4();
  v28 = sub_1DD1C1C24();
  v25 = *(uint64_t (**)(char *, uint64_t))(v5 + 8);
  v8 = v25(v7, v4);
  MEMORY[0x1E0C80A78](v8);
  sub_1DD1C1CA8();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  v9 = sub_1DD1C1C9C();
  MEMORY[0x1E0C80A78](v9);
  v10 = (char *)v24 - v34;
  sub_1DD1C1CB4();
  v24[0] = v3;
  v27 = sub_1DD1C1C24();
  v11 = v25;
  v12 = v25(v10, v29);
  MEMORY[0x1E0C80A78](v12);
  sub_1DD1C1CA8();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  v13 = sub_1DD1C1C9C();
  MEMORY[0x1E0C80A78](v13);
  v14 = (char *)v24 - v34;
  sub_1DD1C1CB4();
  v26 = sub_1DD1C1C24();
  v15 = v29;
  v16 = v11(v14, v29);
  MEMORY[0x1E0C80A78](v16);
  sub_1DD1C1CA8();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  sub_1DD1A51F8();
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  v17 = sub_1DD1C1C9C();
  MEMORY[0x1E0C80A78](v17);
  v18 = (char *)v24 - v34;
  sub_1DD1C1CB4();
  v19 = sub_1DD1C1C24();
  v11(v18, v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9D98);
  v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_1DD1C9D80;
  v21 = v27;
  *(_QWORD *)(v20 + 32) = v28;
  *(_QWORD *)(v20 + 40) = v21;
  *(_QWORD *)(v20 + 48) = v26;
  *(_QWORD *)(v20 + 56) = v19;
  v22 = sub_1DD1C1C18();
  swift_bridgeObjectRelease();
  return v22;
}

uint64_t sub_1DD1B38B4()
{
  return sub_1DD1B38D0();
}

uint64_t sub_1DD1B38D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(char *, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v0 = sub_1DD1C1C78();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = *(_QWORD *)(v1 + 64);
  MEMORY[0x1E0C80A78](v0);
  v3 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  swift_getKeyPath();
  sub_1DD1AB72C(&qword_1F03C9D60, &qword_1F03C9C30, (uint64_t (*)(void))sub_1DD1B7888, MEMORY[0x1E0C91D80]);
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1B77D4();
  sub_1DD1C1C6C();
  v4 = sub_1DD1C1C60();
  v5 = *(uint64_t (**)(char *, uint64_t))(v1 + 8);
  v6 = v5((char *)&v11 - v3, v0);
  MEMORY[0x1E0C80A78](v6);
  swift_getKeyPath();
  sub_1DD1A51F8();
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C6C();
  v7 = sub_1DD1C1C60();
  v5((char *)&v11 - v3, v0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9D70);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_1DD1C9D90;
  *(_QWORD *)(v8 + 32) = v4;
  *(_QWORD *)(v8 + 40) = v7;
  v9 = sub_1DD1C1C54();
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_1DD1B3A90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v0 = sub_1DD1C1C3C();
  v1 = sub_1DD1C1C3C();
  v2 = sub_1DD1C1C3C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9D48);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1DD1C9DA0;
  *(_QWORD *)(v3 + 32) = v0;
  *(_QWORD *)(v3 + 40) = v1;
  *(_QWORD *)(v3 + 48) = v2;
  v4 = sub_1DD1C1C30();
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_1DD1B3B44(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t);
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v24[3];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(char *, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;

  v30 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9D78);
  v2 = *(_QWORD *)(*(_QWORD *)(v1 - 8) + 64);
  MEMORY[0x1E0C80A78](v1);
  v32 = v2;
  v24[1] = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  sub_1DD1B77D4();
  sub_1DD1C1CA8();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  v31 = sub_1DD1AB72C(&qword_1F03C9D60, &qword_1F03C9C30, (uint64_t (*)(void))sub_1DD1B7888, MEMORY[0x1E0C91D80]);
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  sub_1DD1C1C9C();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9D90);
  v4 = *(_QWORD *)(v3 - 8);
  v29 = v3;
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x1E0C80A78](v3);
  v33 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  v6 = (char *)v24 - v33;
  sub_1DD1C1CB4();
  v7 = sub_1DD1C1C24();
  v8 = *(uint64_t (**)(char *, uint64_t))(v4 + 8);
  v27 = v7;
  v28 = v8;
  v9 = v8(v6, v3);
  MEMORY[0x1E0C80A78](v9);
  sub_1DD1C1CA8();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  v10 = sub_1DD1C1C9C();
  v24[2] = v5;
  MEMORY[0x1E0C80A78](v10);
  v11 = (char *)v24 - v33;
  sub_1DD1C1CB4();
  v26 = sub_1DD1C1C24();
  v12 = v28(v11, v29);
  MEMORY[0x1E0C80A78](v12);
  sub_1DD1C1CA8();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  v13 = sub_1DD1C1C9C();
  MEMORY[0x1E0C80A78](v13);
  v14 = v33;
  sub_1DD1C1CB4();
  v25 = sub_1DD1C1C24();
  v16 = (void (*)(char *, uint64_t))v28;
  v15 = v29;
  v17 = v28((char *)v24 - v14, v29);
  MEMORY[0x1E0C80A78](v17);
  sub_1DD1C1CA8();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  sub_1DD1A51F8();
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  v18 = sub_1DD1C1C9C();
  MEMORY[0x1E0C80A78](v18);
  sub_1DD1C1CB4();
  v19 = sub_1DD1C1C24();
  v16((char *)v24 - v14, v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9D98);
  v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_1DD1C9D80;
  v21 = v26;
  *(_QWORD *)(v20 + 32) = v27;
  *(_QWORD *)(v20 + 40) = v21;
  *(_QWORD *)(v20 + 48) = v25;
  *(_QWORD *)(v20 + 56) = v19;
  v22 = sub_1DD1C1C18();
  swift_bridgeObjectRelease();
  return v22;
}

uint64_t sub_1DD1B4100()
{
  return sub_1DD1B38D0();
}

uint64_t sub_1DD1B411C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = sub_1DD1C1C3C();
  v1 = sub_1DD1C1C3C();
  v2 = sub_1DD1C1C3C();
  v3 = sub_1DD1C1C3C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9D48);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1DD1C9D80;
  *(_QWORD *)(v4 + 32) = v0;
  *(_QWORD *)(v4 + 40) = v1;
  *(_QWORD *)(v4 + 48) = v2;
  *(_QWORD *)(v4 + 56) = v3;
  v5 = sub_1DD1C1C30();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1DD1B41D4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t);
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v24[3];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(char *, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;

  v30 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9D78);
  v2 = *(_QWORD *)(*(_QWORD *)(v1 - 8) + 64);
  MEMORY[0x1E0C80A78](v1);
  v32 = v2;
  v24[1] = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  sub_1DD1B77D4();
  sub_1DD1C1CA8();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  v31 = sub_1DD1AB72C(&qword_1F03C9D60, &qword_1F03C9C30, (uint64_t (*)(void))sub_1DD1B7888, MEMORY[0x1E0C91D80]);
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  sub_1DD1C1C9C();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9D90);
  v4 = *(_QWORD *)(v3 - 8);
  v29 = v3;
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x1E0C80A78](v3);
  v33 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  v6 = (char *)v24 - v33;
  sub_1DD1C1CB4();
  v7 = sub_1DD1C1C24();
  v8 = *(uint64_t (**)(char *, uint64_t))(v4 + 8);
  v27 = v7;
  v28 = v8;
  v9 = v8(v6, v3);
  MEMORY[0x1E0C80A78](v9);
  sub_1DD1C1CA8();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  v10 = sub_1DD1C1C9C();
  v24[2] = v5;
  MEMORY[0x1E0C80A78](v10);
  v11 = (char *)v24 - v33;
  sub_1DD1C1CB4();
  v26 = sub_1DD1C1C24();
  v12 = v28(v11, v29);
  MEMORY[0x1E0C80A78](v12);
  sub_1DD1C1CA8();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  v13 = sub_1DD1C1C9C();
  MEMORY[0x1E0C80A78](v13);
  v14 = v33;
  sub_1DD1C1CB4();
  v25 = sub_1DD1C1C24();
  v16 = (void (*)(char *, uint64_t))v28;
  v15 = v29;
  v17 = v28((char *)v24 - v14, v29);
  MEMORY[0x1E0C80A78](v17);
  sub_1DD1C1CA8();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  sub_1DD1A51F8();
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  v18 = sub_1DD1C1C9C();
  MEMORY[0x1E0C80A78](v18);
  sub_1DD1C1CB4();
  v19 = sub_1DD1C1C24();
  v16((char *)v24 - v14, v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9D98);
  v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_1DD1C9D80;
  v21 = v26;
  *(_QWORD *)(v20 + 32) = v27;
  *(_QWORD *)(v20 + 40) = v21;
  *(_QWORD *)(v20 + 48) = v25;
  *(_QWORD *)(v20 + 56) = v19;
  v22 = sub_1DD1C1C18();
  swift_bridgeObjectRelease();
  return v22;
}

uint64_t sub_1DD1B4790()
{
  return sub_1DD1B38D0();
}

uint64_t sub_1DD1B47AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = sub_1DD1C1C3C();
  v1 = sub_1DD1C1C3C();
  v2 = sub_1DD1C1C3C();
  v3 = sub_1DD1C1C3C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9D48);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1DD1C9D80;
  *(_QWORD *)(v4 + 32) = v0;
  *(_QWORD *)(v4 + 40) = v1;
  *(_QWORD *)(v4 + 48) = v2;
  *(_QWORD *)(v4 + 56) = v3;
  v5 = sub_1DD1C1C30();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1DD1B485C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(char *, uint64_t);
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t (*v41)(char *, uint64_t);
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9D78);
  v45 = *(_QWORD *)(*(_QWORD *)(v2 - 8) + 64);
  MEMORY[0x1E0C80A78](v2);
  v44 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  sub_1DD1B77D4();
  sub_1DD1C1CA8();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  v4 = sub_1DD1AB72C(&qword_1F03C9D60, &qword_1F03C9C30, (uint64_t (*)(void))sub_1DD1B7888, MEMORY[0x1E0C91D80]);
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  sub_1DD1C1C9C();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9D90);
  v6 = *(_QWORD *)(v5 - 8);
  v43 = v5;
  v39 = *(_QWORD *)(v6 + 64);
  MEMORY[0x1E0C80A78](v5);
  v40 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  v8 = (char *)&v32 - v40;
  sub_1DD1C1CB4();
  v37 = sub_1DD1C1C24();
  v41 = *(uint64_t (**)(char *, uint64_t))(v6 + 8);
  v9 = v41(v8, v5);
  v35 = &v32;
  MEMORY[0x1E0C80A78](v9);
  sub_1DD1C1CA8();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  v42 = v4;
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  v10 = sub_1DD1C1C9C();
  MEMORY[0x1E0C80A78](v10);
  v11 = v40;
  sub_1DD1C1CB4();
  v36 = sub_1DD1C1C24();
  v12 = v41((char *)&v32 - v11, v43);
  v34 = &v32;
  MEMORY[0x1E0C80A78](v12);
  sub_1DD1C1CA8();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  v38 = a1;
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  v13 = sub_1DD1C1C9C();
  MEMORY[0x1E0C80A78](v13);
  sub_1DD1C1CB4();
  v35 = (uint64_t *)sub_1DD1C1C24();
  v14 = v41;
  v15 = v41((char *)&v32 - v11, v43);
  v33 = &v32;
  MEMORY[0x1E0C80A78](v15);
  sub_1DD1C1CA8();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  v16 = sub_1DD1C1C9C();
  MEMORY[0x1E0C80A78](v16);
  v17 = v40;
  sub_1DD1C1CB4();
  v34 = (uint64_t *)sub_1DD1C1C24();
  v18 = v14((char *)&v32 - v17, v43);
  v32 = (uint64_t)&v32;
  MEMORY[0x1E0C80A78](v18);
  sub_1DD1C1CA8();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  v19 = sub_1DD1C1C9C();
  MEMORY[0x1E0C80A78](v19);
  sub_1DD1C1CB4();
  v33 = (uint64_t *)sub_1DD1C1C24();
  v20 = (char *)&v32 - v17;
  v21 = v43;
  v22 = (void (*)(char *, uint64_t))v41;
  v23 = v41(v20, v43);
  v32 = (uint64_t)&v32;
  MEMORY[0x1E0C80A78](v23);
  sub_1DD1C1CA8();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  sub_1DD1A51F8();
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  v24 = sub_1DD1C1C9C();
  MEMORY[0x1E0C80A78](v24);
  v25 = (char *)&v32 - v40;
  sub_1DD1C1CB4();
  v26 = sub_1DD1C1C24();
  v22(v25, v21);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9D98);
  v27 = swift_allocObject();
  *(_OWORD *)(v27 + 16) = xmmword_1DD1C9DB0;
  v28 = v36;
  *(_QWORD *)(v27 + 32) = v37;
  *(_QWORD *)(v27 + 40) = v28;
  v29 = v34;
  *(_QWORD *)(v27 + 48) = v35;
  *(_QWORD *)(v27 + 56) = v29;
  *(_QWORD *)(v27 + 64) = v33;
  *(_QWORD *)(v27 + 72) = v26;
  v30 = sub_1DD1C1C18();
  swift_bridgeObjectRelease();
  return v30;
}

uint64_t sub_1DD1B522C(uint64_t a1)
{
  return sub_1DD1B5DE0(a1, (uint64_t)sub_1DD1B5250, (uint64_t)&unk_1DD1C9F08, (uint64_t)sub_1DD1B5318, (uint64_t)sub_1DD1B7E80);
}

uint64_t sub_1DD1B5250()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = sub_1DD1C1C3C();
  v1 = sub_1DD1C1C3C();
  v2 = sub_1DD1C1C3C();
  v3 = sub_1DD1C1C3C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9D48);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1DD1C9D80;
  *(_QWORD *)(v4 + 32) = v0;
  *(_QWORD *)(v4 + 40) = v1;
  *(_QWORD *)(v4 + 48) = v2;
  *(_QWORD *)(v4 + 56) = v3;
  v5 = sub_1DD1C1C30();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1DD1B5318()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v0 = sub_1DD1C1C3C();
  v1 = sub_1DD1C1C3C();
  v2 = sub_1DD1C1C3C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9D48);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1DD1C9DA0;
  *(_QWORD *)(v3 + 32) = v0;
  *(_QWORD *)(v3 + 40) = v1;
  *(_QWORD *)(v3 + 48) = v2;
  v4 = sub_1DD1C1C30();
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_1DD1B53F0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(char *, uint64_t);
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t (*v41)(char *, uint64_t);
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9D78);
  v45 = *(_QWORD *)(*(_QWORD *)(v2 - 8) + 64);
  MEMORY[0x1E0C80A78](v2);
  v44 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  sub_1DD1B77D4();
  sub_1DD1C1CA8();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  v4 = sub_1DD1AB72C(&qword_1F03C9D60, &qword_1F03C9C30, (uint64_t (*)(void))sub_1DD1B7888, MEMORY[0x1E0C91D80]);
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  sub_1DD1C1C9C();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9D90);
  v6 = *(_QWORD *)(v5 - 8);
  v43 = v5;
  v39 = *(_QWORD *)(v6 + 64);
  MEMORY[0x1E0C80A78](v5);
  v40 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  v8 = (char *)&v32 - v40;
  sub_1DD1C1CB4();
  v37 = sub_1DD1C1C24();
  v41 = *(uint64_t (**)(char *, uint64_t))(v6 + 8);
  v9 = v41(v8, v5);
  v35 = &v32;
  MEMORY[0x1E0C80A78](v9);
  sub_1DD1C1CA8();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  v42 = v4;
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  v10 = sub_1DD1C1C9C();
  MEMORY[0x1E0C80A78](v10);
  v11 = v40;
  sub_1DD1C1CB4();
  v36 = sub_1DD1C1C24();
  v12 = v41((char *)&v32 - v11, v43);
  v34 = &v32;
  MEMORY[0x1E0C80A78](v12);
  sub_1DD1C1CA8();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  v38 = a1;
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  v13 = sub_1DD1C1C9C();
  MEMORY[0x1E0C80A78](v13);
  sub_1DD1C1CB4();
  v35 = (uint64_t *)sub_1DD1C1C24();
  v14 = v41;
  v15 = v41((char *)&v32 - v11, v43);
  v33 = &v32;
  MEMORY[0x1E0C80A78](v15);
  sub_1DD1C1CA8();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  v16 = sub_1DD1C1C9C();
  MEMORY[0x1E0C80A78](v16);
  v17 = v40;
  sub_1DD1C1CB4();
  v34 = (uint64_t *)sub_1DD1C1C24();
  v18 = v14((char *)&v32 - v17, v43);
  v32 = (uint64_t)&v32;
  MEMORY[0x1E0C80A78](v18);
  sub_1DD1C1CA8();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  v19 = sub_1DD1C1C9C();
  MEMORY[0x1E0C80A78](v19);
  sub_1DD1C1CB4();
  v33 = (uint64_t *)sub_1DD1C1C24();
  v20 = (char *)&v32 - v17;
  v21 = v43;
  v22 = (void (*)(char *, uint64_t))v41;
  v23 = v41(v20, v43);
  v32 = (uint64_t)&v32;
  MEMORY[0x1E0C80A78](v23);
  sub_1DD1C1CA8();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  sub_1DD1A51F8();
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  v24 = sub_1DD1C1C9C();
  MEMORY[0x1E0C80A78](v24);
  v25 = (char *)&v32 - v40;
  sub_1DD1C1CB4();
  v26 = sub_1DD1C1C24();
  v22(v25, v21);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9D98);
  v27 = swift_allocObject();
  *(_OWORD *)(v27 + 16) = xmmword_1DD1C9DB0;
  v28 = v36;
  *(_QWORD *)(v27 + 32) = v37;
  *(_QWORD *)(v27 + 40) = v28;
  v29 = v34;
  *(_QWORD *)(v27 + 48) = v35;
  *(_QWORD *)(v27 + 56) = v29;
  *(_QWORD *)(v27 + 64) = v33;
  *(_QWORD *)(v27 + 72) = v26;
  v30 = sub_1DD1C1C18();
  swift_bridgeObjectRelease();
  return v30;
}

uint64_t sub_1DD1B5DBC(uint64_t a1)
{
  return sub_1DD1B5DE0(a1, (uint64_t)sub_1DD1B6020, (uint64_t)&unk_1DD1C9EE0, (uint64_t)sub_1DD1B60E4, (uint64_t)sub_1DD1B7E80);
}

uint64_t sub_1DD1B5DE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t (*v9)(char *, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v17[2];
  uint64_t v18;
  uint64_t v19;

  v19 = a5;
  v17[0] = a3;
  v17[1] = a4;
  v5 = sub_1DD1C1C78();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x1E0C80A78](v5);
  v8 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  swift_getKeyPath();
  sub_1DD1AB72C(&qword_1F03C9D60, &qword_1F03C9C30, (uint64_t (*)(void))sub_1DD1B7888, MEMORY[0x1E0C91D80]);
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1B77D4();
  sub_1DD1C1C6C();
  v18 = sub_1DD1C1C60();
  v9 = *(uint64_t (**)(char *, uint64_t))(v6 + 8);
  v10 = v9((char *)v17 - v8, v5);
  MEMORY[0x1E0C80A78](v10);
  swift_getKeyPath();
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C6C();
  v11 = sub_1DD1C1C60();
  v12 = v9((char *)v17 - v8, v5);
  MEMORY[0x1E0C80A78](v12);
  swift_getKeyPath();
  sub_1DD1A51F8();
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C6C();
  v13 = sub_1DD1C1C60();
  v9((char *)v17 - v8, v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9D70);
  v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_1DD1C9DA0;
  *(_QWORD *)(v14 + 32) = v18;
  *(_QWORD *)(v14 + 40) = v11;
  *(_QWORD *)(v14 + 48) = v13;
  v15 = sub_1DD1C1C54();
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t sub_1DD1B6020()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = sub_1DD1C1C3C();
  v1 = sub_1DD1C1C3C();
  v2 = sub_1DD1C1C3C();
  v3 = sub_1DD1C1C3C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9D48);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1DD1C9D80;
  *(_QWORD *)(v4 + 32) = v0;
  *(_QWORD *)(v4 + 40) = v1;
  *(_QWORD *)(v4 + 48) = v2;
  *(_QWORD *)(v4 + 56) = v3;
  v5 = sub_1DD1C1C30();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1DD1B60E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v0 = sub_1DD1C1C3C();
  v1 = sub_1DD1C1C3C();
  v2 = sub_1DD1C1C3C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9D48);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1DD1C9DA0;
  *(_QWORD *)(v3 + 32) = v0;
  *(_QWORD *)(v3 + 40) = v1;
  *(_QWORD *)(v3 + 48) = v2;
  v4 = sub_1DD1C1C30();
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_1DD1B61AC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(char *, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  _QWORD v27[2];
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t (*v34)(char *, uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9D78);
  v38 = *(_QWORD *)(*(_QWORD *)(v2 - 8) + 64);
  MEMORY[0x1E0C80A78](v2);
  v4 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  sub_1DD1B77D4();
  sub_1DD1C1CA8();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  v39 = sub_1DD1AB72C(&qword_1F03C9D60, &qword_1F03C9C30, (uint64_t (*)(void))sub_1DD1B7888, MEMORY[0x1E0C91D80]);
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  sub_1DD1C1C9C();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9D90);
  v6 = *(_QWORD *)(v5 - 8);
  v36 = *(_QWORD *)(v6 + 64);
  v37 = v5;
  MEMORY[0x1E0C80A78](v5);
  v33 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  v8 = (char *)v27 - v33;
  sub_1DD1C1CB4();
  v31 = sub_1DD1C1C24();
  v34 = *(uint64_t (**)(char *, uint64_t))(v6 + 8);
  v9 = v34(v8, v5);
  v29 = v27;
  MEMORY[0x1E0C80A78](v9);
  v32 = v4;
  sub_1DD1C1CA8();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  v35 = a1;
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  v10 = sub_1DD1C1C9C();
  MEMORY[0x1E0C80A78](v10);
  v11 = (char *)v27 - v33;
  sub_1DD1C1CB4();
  v30 = sub_1DD1C1C24();
  v12 = v34(v11, v37);
  v28 = v27;
  MEMORY[0x1E0C80A78](v12);
  sub_1DD1C1CA8();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  v13 = sub_1DD1C1C9C();
  MEMORY[0x1E0C80A78](v13);
  v14 = v33;
  sub_1DD1C1CB4();
  v29 = (_QWORD *)sub_1DD1C1C24();
  v15 = v37;
  v16 = v34;
  v17 = v34((char *)v27 - v14, v37);
  v27[1] = v27;
  MEMORY[0x1E0C80A78](v17);
  sub_1DD1C1CA8();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  v18 = sub_1DD1C1C9C();
  MEMORY[0x1E0C80A78](v18);
  sub_1DD1C1CB4();
  v28 = (_QWORD *)sub_1DD1C1C24();
  v19 = v16((char *)v27 - v14, v15);
  MEMORY[0x1E0C80A78](v19);
  sub_1DD1C1CA8();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  sub_1DD1A51F8();
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  v20 = sub_1DD1C1C9C();
  MEMORY[0x1E0C80A78](v20);
  sub_1DD1C1CB4();
  v21 = sub_1DD1C1C24();
  v16((char *)v27 - v14, v37);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9D98);
  v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_1DD1C9DC0;
  v23 = v30;
  *(_QWORD *)(v22 + 32) = v31;
  *(_QWORD *)(v22 + 40) = v23;
  v24 = v28;
  *(_QWORD *)(v22 + 48) = v29;
  *(_QWORD *)(v22 + 56) = v24;
  *(_QWORD *)(v22 + 64) = v21;
  v25 = sub_1DD1C1C18();
  swift_bridgeObjectRelease();
  return v25;
}

uint64_t sub_1DD1B6A0C()
{
  return sub_1DD1B38D0();
}

uint64_t sub_1DD1B6A28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = sub_1DD1C1C3C();
  v1 = sub_1DD1C1C3C();
  v2 = sub_1DD1C1C3C();
  v3 = sub_1DD1C1C3C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9D48);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1DD1C9D80;
  *(_QWORD *)(v4 + 32) = v0;
  *(_QWORD *)(v4 + 40) = v1;
  *(_QWORD *)(v4 + 48) = v2;
  *(_QWORD *)(v4 + 56) = v3;
  v5 = sub_1DD1C1C30();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1DD1B6AEC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v22[2];
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(char *, uint64_t);
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;

  v29 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9D78);
  v30 = *(_QWORD *)(*(_QWORD *)(v1 - 8) + 64);
  MEMORY[0x1E0C80A78](v1);
  v28 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  sub_1DD1B77D4();
  sub_1DD1C1CA8();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  v31 = sub_1DD1AB72C(&qword_1F03C9D80, &qword_1F03C9698, (uint64_t (*)(void))sub_1DD1B78F8, MEMORY[0x1E0C91D80]);
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  sub_1DD1C1C9C();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9D90);
  v4 = *(_QWORD *)(v3 - 8);
  v26 = v3;
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x1E0C80A78](v3);
  v32 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  v6 = (char *)v22 - v32;
  sub_1DD1C1CB4();
  v25 = sub_1DD1C1C24();
  v27 = *(uint64_t (**)(char *, uint64_t))(v4 + 8);
  v7 = v27(v6, v3);
  MEMORY[0x1E0C80A78](v7);
  sub_1DD1C1CA8();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  v8 = sub_1DD1C1C9C();
  v22[0] = v5;
  MEMORY[0x1E0C80A78](v8);
  v9 = (char *)v22 - v32;
  sub_1DD1C1CB4();
  v24 = sub_1DD1C1C24();
  v10 = v27(v9, v26);
  MEMORY[0x1E0C80A78](v10);
  sub_1DD1C1CA8();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  v11 = sub_1DD1C1C9C();
  MEMORY[0x1E0C80A78](v11);
  v12 = v32;
  sub_1DD1C1CB4();
  v23 = sub_1DD1C1C24();
  v13 = v26;
  v14 = (void (*)(char *, uint64_t))v27;
  v15 = v27((char *)v22 - v12, v26);
  v22[1] = v22;
  MEMORY[0x1E0C80A78](v15);
  sub_1DD1C1CA8();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  sub_1DD1A51F8();
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  sub_1DD1C1C9C();
  swift_getKeyPath();
  sub_1DD1C1C0C();
  swift_release();
  sub_1DD1C1C90();
  swift_release();
  v16 = sub_1DD1C1C9C();
  MEMORY[0x1E0C80A78](v16);
  sub_1DD1C1CB4();
  v17 = sub_1DD1C1C24();
  v14((char *)v22 - v12, v13);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9D98);
  v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_1DD1C9D80;
  v19 = v24;
  *(_QWORD *)(v18 + 32) = v25;
  *(_QWORD *)(v18 + 40) = v19;
  *(_QWORD *)(v18 + 48) = v23;
  *(_QWORD *)(v18 + 56) = v17;
  v20 = sub_1DD1C1C18();
  swift_bridgeObjectRelease();
  return v20;
}

uint64_t sub_1DD1B70D8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9698);
  v3 = MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  v7 = (char *)&v9 - v6;
  sub_1DD1ADF50(a1, (uint64_t)&v9 - v6);
  sub_1DD1ADF50((uint64_t)v7, (uint64_t)v5);
  sub_1DD1C1B88();
  return sub_1DD1A5830((uint64_t)v7);
}

uint64_t sub_1DD1B7184()
{
  return sub_1DD1B38D0();
}

uint64_t sub_1DD1B71A0()
{
  return sub_1DD1B71D0();
}

uint64_t sub_1DD1B71D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v0 = sub_1DD1C1C3C();
  v1 = sub_1DD1C1C3C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9D48);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1DD1C9D90;
  *(_QWORD *)(v2 + 32) = v0;
  *(_QWORD *)(v2 + 40) = v1;
  v3 = sub_1DD1C1C30();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_1DD1B7250()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v0 = sub_1DD1C1C3C();
  v1 = sub_1DD1C1C3C();
  v2 = sub_1DD1C1C3C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9D48);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1DD1C9DA0;
  *(_QWORD *)(v3 + 32) = v0;
  *(_QWORD *)(v3 + 40) = v1;
  *(_QWORD *)(v3 + 48) = v2;
  v4 = sub_1DD1C1C30();
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_1DD1B7318()
{
  return sub_1DD1C1990();
}

uint64_t sub_1DD1B732C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v0 = sub_1DD1C1C00();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DD1A5418();
  sub_1DD1C1BF4();
  v4 = sub_1DD1C1BE8();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9D40);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1DD1C8FF0;
  *(_QWORD *)(v5 + 32) = v4;
  v6 = sub_1DD1C1BDC();
  swift_bridgeObjectRelease();
  return v6;
}

ValueMetadata *type metadata accessor for ContactsAssistantIntents()
{
  return &type metadata for ContactsAssistantIntents;
}

uint64_t sub_1DD1B741C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3[12];

  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9D50);
  sub_1DD1C1CC0();
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1DD1C9DD0;
  sub_1DD1A3BAC(v3);
  sub_1DD1A5418();
  sub_1DD1C1CCC();
  sub_1DD1A3BAC(v3);
  sub_1DD1C1CCC();
  sub_1DD1A3BAC(v3);
  sub_1DD1C1CCC();
  sub_1DD1A3BAC(v3);
  sub_1DD1C1CCC();
  v3[0] = _s14ContactsUICore19DeleteContactIntentVACycfC_0();
  v3[1] = v1;
  sub_1DD1B10D0();
  sub_1DD1C1CCC();
  sub_1DD1BB304(v3);
  sub_1DD1B77D4();
  sub_1DD1C1CCC();
  sub_1DD1BB304(v3);
  sub_1DD1C1CCC();
  sub_1DD1BB304(v3);
  sub_1DD1C1CCC();
  sub_1DD1BB304(v3);
  sub_1DD1C1CCC();
  sub_1DD1BB304(v3);
  sub_1DD1C1CCC();
  sub_1DD1BB304(v3);
  sub_1DD1C1CCC();
  sub_1DD1BB304(v3);
  sub_1DD1C1CCC();
  sub_1DD1BB304(v3);
  sub_1DD1C1CCC();
  return v0;
}

unint64_t sub_1DD1B77D4()
{
  unint64_t result;

  result = qword_1F03C9D58;
  if (!qword_1F03C9D58)
  {
    result = MEMORY[0x1DF0D6658](&protocol conformance descriptor for UpdateContactIntent, &type metadata for UpdateContactIntent);
    atomic_store(result, (unint64_t *)&qword_1F03C9D58);
  }
  return result;
}

double sub_1DD1B7818@<D0>(_OWORD *a1@<X8>)
{
  double result;
  __int128 v3;

  sub_1DD1C1B7C();
  result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_1DD1B7850()
{
  swift_bridgeObjectRetain();
  return sub_1DD1C1B88();
}

unint64_t sub_1DD1B7888()
{
  unint64_t result;

  result = qword_1F03C9D68;
  if (!qword_1F03C9D68)
  {
    result = MEMORY[0x1DF0D6658](MEMORY[0x1E0C91C80], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1F03C9D68);
  }
  return result;
}

uint64_t sub_1DD1B78D4()
{
  return sub_1DD1C1B7C();
}

unint64_t sub_1DD1B78F8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F03C9D88;
  if (!qword_1F03C9D88)
  {
    v1 = sub_1DD1C1E94();
    result = MEMORY[0x1DF0D6658](MEMORY[0x1E0C91C30], v1);
    atomic_store(result, (unint64_t *)&qword_1F03C9D88);
  }
  return result;
}

double sub_1DD1B7940@<D0>(_OWORD *a1@<X8>)
{
  double result;
  __int128 v3;

  sub_1DD1C1B7C();
  result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_1DD1B7978()
{
  swift_bridgeObjectRetain();
  return sub_1DD1C1B88();
}

double sub_1DD1B79B0@<D0>(_OWORD *a1@<X8>)
{
  double result;
  __int128 v3;

  sub_1DD1C1B7C();
  result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_1DD1B79E8()
{
  swift_bridgeObjectRetain();
  return sub_1DD1C1B88();
}

double sub_1DD1B7A20@<D0>(_OWORD *a1@<X8>)
{
  double result;
  __int128 v3;

  sub_1DD1C1B7C();
  result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_1DD1B7A58()
{
  swift_bridgeObjectRetain();
  return sub_1DD1C1B88();
}

double sub_1DD1B7A90@<D0>(_OWORD *a1@<X8>)
{
  double result;
  __int128 v3;

  sub_1DD1C1B7C();
  result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_1DD1B7AC8()
{
  swift_bridgeObjectRetain();
  return sub_1DD1C1B88();
}

double sub_1DD1B7B00@<D0>(_OWORD *a1@<X8>)
{
  double result;
  __int128 v3;

  sub_1DD1C1B7C();
  result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_1DD1B7B38()
{
  swift_bridgeObjectRetain();
  return sub_1DD1C1B88();
}

double sub_1DD1B7B70@<D0>(_OWORD *a1@<X8>)
{
  double result;
  __int128 v3;

  sub_1DD1C1B7C();
  result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_1DD1B7BA8()
{
  swift_bridgeObjectRetain();
  return sub_1DD1C1B88();
}

double sub_1DD1B7BE0@<D0>(_OWORD *a1@<X8>)
{
  double result;
  __int128 v3;

  sub_1DD1C1B7C();
  result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_1DD1B7C18()
{
  swift_bridgeObjectRetain();
  return sub_1DD1C1B88();
}

uint64_t sub_1DD1B7C50@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1DD1C1B7C();
  *a1 = v3;
  return result;
}

uint64_t sub_1DD1B7C88()
{
  swift_bridgeObjectRetain();
  return sub_1DD1C1B88();
}

double sub_1DD1B7CC0@<D0>(_OWORD *a1@<X8>)
{
  double result;
  __int128 v3;

  sub_1DD1C1B7C();
  result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_1DD1B7CF8()
{
  swift_bridgeObjectRetain();
  return sub_1DD1C1B88();
}

double sub_1DD1B7D30@<D0>(_OWORD *a1@<X8>)
{
  double result;
  __int128 v3;

  sub_1DD1C1B7C();
  result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_1DD1B7D68()
{
  swift_bridgeObjectRetain();
  return sub_1DD1C1B88();
}

double sub_1DD1B7DA0@<D0>(_OWORD *a1@<X8>)
{
  double result;
  __int128 v3;

  sub_1DD1C1B7C();
  result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_1DD1B7DD8()
{
  swift_bridgeObjectRetain();
  return sub_1DD1C1B88();
}

double sub_1DD1B7E10@<D0>(_OWORD *a1@<X8>)
{
  double result;
  __int128 v3;

  sub_1DD1C1B7C();
  result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_1DD1B7E48()
{
  swift_bridgeObjectRetain();
  return sub_1DD1C1B88();
}

uint64_t CNContact.contactEntityIdentifier.getter()
{
  void *v0;
  id v1;
  uint64_t v2;

  v1 = objc_msgSend(v0, sel_identifier);
  v2 = sub_1DD1C202C();

  return v2;
}

void *ViewContactCardIntent.openAppWhenRun.unsafeMutableAddressor()
{
  return &static ViewContactCardIntent.openAppWhenRun;
}

uint64_t static ViewContactCardIntent.openAppWhenRun.getter()
{
  return 1;
}

void *ViewContactCardIntent.assistantOnly.unsafeMutableAddressor()
{
  return &static ViewContactCardIntent.assistantOnly;
}

uint64_t static ViewContactCardIntent.assistantOnly.getter()
{
  return 1;
}

uint64_t sub_1DD1B7F00()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v0 = sub_1DD1C1EDC();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1DD1C1F84();
  MEMORY[0x1E0C80A78](v4);
  v5 = sub_1DD1C2014();
  MEMORY[0x1E0C80A78](v5);
  v6 = sub_1DD1C1EE8();
  __swift_allocate_value_buffer(v6, static ViewContactCardIntent.title);
  __swift_project_value_buffer(v6, (uint64_t)static ViewContactCardIntent.title);
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E0CAF9B8], v0);
  return sub_1DD1C1EF4();
}

uint64_t ViewContactCardIntent.title.unsafeMutableAddressor()
{
  return sub_1DD1A11AC(&qword_1F03C9650, (uint64_t (*)(_QWORD))MEMORY[0x1E0CAF9F8], (uint64_t)static ViewContactCardIntent.title);
}

uint64_t static ViewContactCardIntent.title.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1F03C9650 != -1)
    swift_once();
  v2 = sub_1DD1C1EE8();
  v3 = __swift_project_value_buffer(v2, (uint64_t)static ViewContactCardIntent.title);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_1DD1B8118()
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
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[2];

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96C0);
  MEMORY[0x1E0C80A78](v0);
  v12[0] = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = sub_1DD1C1EDC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1DD1C1F84();
  MEMORY[0x1E0C80A78](v6);
  v7 = sub_1DD1C2014();
  MEMORY[0x1E0C80A78](v7);
  v8 = sub_1DD1C1EE8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v10 = sub_1DD1C1CD8();
  __swift_allocate_value_buffer(v10, static ViewContactCardIntent.description);
  __swift_project_value_buffer(v10, (uint64_t)static ViewContactCardIntent.description);
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x1E0CAF9B8], v2);
  sub_1DD1C1EF4();
  (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(v9 + 56))(v12[0], 1, 1, v8);
  return sub_1DD1C1CE4();
}

uint64_t ViewContactCardIntent.description.unsafeMutableAddressor()
{
  return sub_1DD1A11AC(&qword_1F03C9658, (uint64_t (*)(_QWORD))MEMORY[0x1E0C91130], (uint64_t)static ViewContactCardIntent.description);
}

uint64_t static ViewContactCardIntent.description.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1F03C9658 != -1)
    swift_once();
  v2 = sub_1DD1C1CD8();
  v3 = __swift_project_value_buffer(v2, (uint64_t)static ViewContactCardIntent.description);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t static ViewContactCardIntent.description.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (qword_1F03C9658 != -1)
    swift_once();
  v2 = sub_1DD1C1CD8();
  v3 = __swift_project_value_buffer(v2, (uint64_t)static ViewContactCardIntent.description);
  swift_beginAccess();
  v4 = *(_QWORD *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*static ViewContactCardIntent.description.modify())()
{
  uint64_t v0;

  if (qword_1F03C9658 != -1)
    swift_once();
  v0 = sub_1DD1C1CD8();
  __swift_project_value_buffer(v0, (uint64_t)static ViewContactCardIntent.description);
  swift_beginAccess();
  return j__swift_endAccess;
}

__n128 ViewContactCardIntent.target.getter@<Q0>(uint64_t a1@<X8>)
{
  __n128 result;
  __int128 v3;
  __int128 v4;
  uint64_t v5;
  __n128 v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;

  sub_1DD1C1B7C();
  result = v6;
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = v5;
  *(__n128 *)(a1 + 40) = v6;
  *(_QWORD *)(a1 + 56) = v7;
  *(_OWORD *)(a1 + 64) = v8;
  *(_QWORD *)(a1 + 80) = v9;
  *(_OWORD *)(a1 + 88) = v10;
  return result;
}

uint64_t ViewContactCardIntent.target.setter(uint64_t a1)
{
  sub_1DD1B85F4(a1);
  sub_1DD1C1B88();
  return sub_1DD1A5284(a1);
}

uint64_t sub_1DD1B85F4(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v3 = v2;
  swift_bridgeObjectRetain();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  return a1;
}

uint64_t (*ViewContactCardIntent.target.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1DD1C1B70();
  return sub_1DD1A16D4;
}

uint64_t ViewContactCardIntent.$target.getter()
{
  return sub_1DD1C1B94();
}

uint64_t ViewContactCardIntent.shouldEdit.getter()
{
  unsigned __int8 v1;

  sub_1DD1C1B7C();
  return v1;
}

uint64_t ViewContactCardIntent.shouldEdit.setter()
{
  return sub_1DD1C1B88();
}

uint64_t (*ViewContactCardIntent.shouldEdit.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1DD1C1B70();
  return sub_1DD1A16D4;
}

uint64_t ViewContactCardIntent.$shouldEdit.getter()
{
  return sub_1DD1C1B94();
}

uint64_t ViewContactCardIntent.perform()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4[33] = a3;
  v4[34] = a4;
  v4[31] = a1;
  v4[32] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C99D8);
  v4[35] = swift_task_alloc();
  v5 = sub_1DD1C1F30();
  v4[36] = v5;
  v4[37] = *(_QWORD *)(v5 - 8);
  v4[38] = swift_task_alloc();
  v6 = sub_1DD1C1E70();
  v4[39] = v6;
  v4[40] = *(_QWORD *)(v6 - 8);
  v4[41] = swift_task_alloc();
  sub_1DD1C20E0();
  v4[42] = sub_1DD1C20D4();
  v4[43] = sub_1DD1C20C8();
  v4[44] = v7;
  return swift_task_switch();
}

uint64_t sub_1DD1B88AC()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v10 = *(_QWORD *)(v0 + 296);
  v11 = *(_QWORD *)(v0 + 288);
  v9 = *(_QWORD *)(v0 + 280);
  sub_1DD1C1E64();
  sub_1DD1C1E58();
  sub_1DD1C1B7C();
  sub_1DD1C1E4C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9DE0);
  sub_1DD1C1E28();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1DD1C8FF0;
  sub_1DD1C1B7C();
  v1 = *(void **)(v0 + 152);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  sub_1DD1C1E1C();
  swift_bridgeObjectRelease();
  sub_1DD1C1E34();
  sub_1DD1C1E40();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v9, 1, v11) == 1)
  {
    v2 = *(_QWORD *)(v0 + 280);
    swift_release();
    sub_1DD1B981C(v2);
    sub_1DD1C1AEC();
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 320) + 8))(*(_QWORD *)(v0 + 328), *(_QWORD *)(v0 + 312));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 296) + 32))(*(_QWORD *)(v0 + 304), *(_QWORD *)(v0 + 280), *(_QWORD *)(v0 + 288));
    sub_1DD1C19B4();
    v4 = *(void **)(*(_QWORD *)(v0 + 240) + 40);
    *(_QWORD *)(v0 + 360) = v4;
    v5 = v4;
    swift_release();
    v6 = sub_1DD1C1F18();
    *(_QWORD *)(v0 + 368) = v6;
    *(_QWORD *)(v0 + 56) = v0 + 224;
    *(_QWORD *)(v0 + 16) = v0;
    *(_QWORD *)(v0 + 24) = sub_1DD1B8BBC;
    v7 = swift_continuation_init();
    *(_QWORD *)(v0 + 184) = MEMORY[0x1E0C809B0];
    v8 = (_QWORD *)(v0 + 184);
    v8[1] = 0x40000000;
    v8[2] = sub_1DD1B8CAC;
    v8[3] = &block_descriptor;
    v8[4] = v7;
    objc_msgSend(v5, sel_openSensitiveURLInBackground_withOptions_completionHandler_, v6, 0, v8);
    return swift_continuation_await();
  }
}

uint64_t sub_1DD1B8BBC()
{
  return swift_task_switch();
}

uint64_t sub_1DD1B8C00()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(void **)(v0 + 360);
  v1 = *(void **)(v0 + 368);
  v4 = *(_QWORD *)(v0 + 296);
  v3 = *(_QWORD *)(v0 + 304);
  v5 = *(_QWORD *)(v0 + 288);
  swift_release();

  sub_1DD1C1AEC();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 320) + 8))(*(_QWORD *)(v0 + 328), *(_QWORD *)(v0 + 312));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DD1B8CAC(uint64_t a1, char a2, void *a3)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 40);
  *(_BYTE *)v3 = a2;
  *(_QWORD *)(v3 + 8) = a3;
  v4 = a3;
  return swift_continuation_resume();
}

__n128 sub_1DD1B8CE0@<Q0>(uint64_t a1@<X8>)
{
  __n128 result;
  __int128 v3;
  __int128 v4;
  uint64_t v5;
  __n128 v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;

  sub_1DD1C1B7C();
  result = v6;
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = v5;
  *(__n128 *)(a1 + 40) = v6;
  *(_QWORD *)(a1 + 56) = v7;
  *(_OWORD *)(a1 + 64) = v8;
  *(_QWORD *)(a1 + 80) = v9;
  *(_OWORD *)(a1 + 88) = v10;
  return result;
}

uint64_t sub_1DD1B8D48(uint64_t a1)
{
  void *v1;
  id v3;

  v1 = *(void **)(a1 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v3 = v1;
  swift_bridgeObjectRetain();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  sub_1DD1C1B88();
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_1DD1B8E80@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1F03C9650 != -1)
    swift_once();
  v2 = sub_1DD1C1EE8();
  v3 = __swift_project_value_buffer(v2, (uint64_t)static ViewContactCardIntent.title);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_1DD1B8EF0(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = *v1;
  v5 = v1[1];
  v6 = v1[2];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_1DD1A1B84;
  return ViewContactCardIntent.perform()(a1, v4, v5, v6);
}

uint64_t sub_1DD1B8F5C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  result = _s14ContactsUICore21ViewContactCardIntentVACycfC_0();
  *a1 = result;
  a1[1] = v3;
  a1[2] = v4;
  return result;
}

uint64_t sub_1DD1B8F84()
{
  sub_1DD1B98A8();
  return sub_1DD1C1A50();
}

uint64_t _s14ContactsUICore21ViewContactCardIntentVACycfC_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
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
  char *v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t, uint64_t);
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(char *, uint64_t, uint64_t);
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD v44[4];
  unsigned int v45;
  void (*v46)(char *, uint64_t, uint64_t);
  char *v47;
  unsigned int v48;
  void (*v49)(char *);
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t (*v54)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v55;
  unint64_t v56;
  void (*v57)(char *, _QWORD, uint64_t, uint64_t);
  char *v58;
  char *v59;
  uint64_t v60;
  char *v61;
  char *v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96C0);
  v1 = MEMORY[0x1E0C80A78](v0);
  v63 = (char *)v44 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v1);
  v59 = (char *)v44 - v3;
  v65 = sub_1DD1C1EDC();
  v4 = *(_QWORD *)(v65 - 8);
  MEMORY[0x1E0C80A78](v65);
  v6 = (char *)v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1DD1C1F84();
  MEMORY[0x1E0C80A78](v7);
  v8 = sub_1DD1C2014();
  v9 = MEMORY[0x1E0C80A78](v8);
  v61 = (char *)v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x1E0C80A78](v9);
  v58 = (char *)v44 - v12;
  v13 = MEMORY[0x1E0C80A78](v11);
  MEMORY[0x1E0C80A78](v13);
  v64 = sub_1DD1C1EE8();
  v14 = *(_QWORD *)(v64 - 8);
  v15 = MEMORY[0x1E0C80A78](v64);
  v62 = (char *)v44 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v15);
  v18 = (char *)v44 - v17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9D10);
  if (qword_1F03C7E40 != -1)
    swift_once();
  v73 = qword_1F03CC020;
  v74 = *(_QWORD *)algn_1F03CC028;
  swift_bridgeObjectRetain();
  sub_1DD1C2158();
  sub_1DD1C19F0();
  sub_1DD1C19E4();
  v60 = sub_1DD1C19CC();
  sub_1DD1C1C0C();
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  v20 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 104);
  v45 = *MEMORY[0x1E0CAF9B8];
  v19 = v45;
  v21 = v65;
  v20(v6, v45, v65);
  v46 = v20;
  v47 = v18;
  sub_1DD1C1EF4();
  sub_1DD1C1FCC();
  v44[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9728);
  sub_1DD1C1F78();
  v20(v6, v19, v21);
  v22 = v59;
  sub_1DD1C1EF4();
  v57 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56);
  v57(v22, 0, 1, v64);
  v72 = 0;
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96D0);
  v44[2] = v44;
  v24 = *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64);
  MEMORY[0x1E0C80A78](v23);
  v55 = v24;
  v56 = (v24 + 15) & 0xFFFFFFFFFFFFFFF0;
  v25 = sub_1DD1C1A80();
  v26 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56);
  v53 = v25;
  v27 = v26((char *)v44 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0), 1, 1, v25);
  v54 = v26;
  v44[1] = v44;
  MEMORY[0x1E0C80A78](v27);
  v26((char *)v44 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0), 1, 1, v25);
  v28 = sub_1DD1C1DA4();
  v29 = v65;
  v30 = *(_QWORD *)(v28 - 8);
  v50 = v28;
  v51 = *(_QWORD *)(v30 + 64);
  MEMORY[0x1E0C80A78](v28);
  v52 = (v31 + 15) & 0xFFFFFFFFFFFFFFF0;
  v48 = *MEMORY[0x1E0C91740];
  v49 = *(void (**)(char *))(v32 + 104);
  v49((char *)v44 - v52);
  sub_1DD1A0434();
  sub_1DD1C1BA0();
  sub_1DD1C1C0C();
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  v33 = v45;
  v34 = v46;
  v46(v6, v45, v29);
  sub_1DD1C1EF4();
  sub_1DD1C1FCC();
  v59 = (char *)__swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9730);
  sub_1DD1C1F78();
  v34(v6, v33, v29);
  v35 = v63;
  sub_1DD1C1EF4();
  v57(v35, 0, 1, v64);
  LOBYTE(v66) = 2;
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9738);
  MEMORY[0x1E0C80A78](v36);
  v38 = (char *)v44 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = sub_1DD1C20BC();
  v40 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 56))(v38, 1, 1, v39);
  MEMORY[0x1E0C80A78](v40);
  v41 = v54((char *)v44 - v56, 1, 1, v53);
  MEMORY[0x1E0C80A78](v41);
  ((void (*)(char *, _QWORD, uint64_t))v49)((char *)v44 - v52, v48, v50);
  sub_1DD1C1BD0();
  LOBYTE(v66) = 0;
  v42 = v60;
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  sub_1DD1C1B88();
  swift_release();
  swift_release_n();
  swift_release_n();
  return v42;
}

uint64_t sub_1DD1B981C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C99D8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1DD1B9860()
{
  unint64_t result;

  result = qword_1F03C9DE8;
  if (!qword_1F03C9DE8)
  {
    result = MEMORY[0x1DF0D6658](&protocol conformance descriptor for ViewContactCardIntent, &type metadata for ViewContactCardIntent);
    atomic_store(result, (unint64_t *)&qword_1F03C9DE8);
  }
  return result;
}

unint64_t sub_1DD1B98A8()
{
  unint64_t result;

  result = qword_1F03C9DF0;
  if (!qword_1F03C9DF0)
  {
    result = MEMORY[0x1DF0D6658](&protocol conformance descriptor for ViewContactCardIntent, &type metadata for ViewContactCardIntent);
    atomic_store(result, (unint64_t *)&qword_1F03C9DF0);
  }
  return result;
}

unint64_t sub_1DD1B98F0()
{
  unint64_t result;

  result = qword_1F03C9DF8;
  if (!qword_1F03C9DF8)
  {
    result = MEMORY[0x1DF0D6658](&protocol conformance descriptor for ViewContactCardIntent, &type metadata for ViewContactCardIntent);
    atomic_store(result, (unint64_t *)&qword_1F03C9DF8);
  }
  return result;
}

unint64_t sub_1DD1B9938()
{
  unint64_t result;

  result = qword_1F03C9E00;
  if (!qword_1F03C9E00)
  {
    result = MEMORY[0x1DF0D6658](&protocol conformance descriptor for ViewContactCardIntent, &type metadata for ViewContactCardIntent);
    atomic_store(result, (unint64_t *)&qword_1F03C9E00);
  }
  return result;
}

uint64_t sub_1DD1B997C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1DD1B998C()
{
  sub_1DD1B98A8();
  return swift_getOpaqueTypeConformance2();
}

uint64_t destroy for ViewContactCardIntent()
{
  swift_release();
  swift_release();
  return swift_release();
}

_QWORD *_s14ContactsUICore21ViewContactCardIntentVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  return a1;
}

_QWORD *assignWithCopy for ViewContactCardIntent(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  sub_1DD1C1C0C();
  swift_release();
  a1[1] = a2[1];
  sub_1DD1C1C0C();
  swift_release();
  a1[2] = a2[2];
  sub_1DD1C1C0C();
  swift_release();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for ViewContactCardIntent(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ViewContactCardIntent(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ViewContactCardIntent(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 24) = 1;
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
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ViewContactCardIntent()
{
  return &type metadata for ViewContactCardIntent;
}

double UpdateContactIntent.init()@<D0>(_OWORD *a1@<X8>)
{
  __int128 v2;
  __int128 v3;
  double result;
  __int128 v5;
  _OWORD v6[6];

  sub_1DD1BB304((uint64_t *)v6);
  v2 = v6[3];
  a1[2] = v6[2];
  a1[3] = v2;
  v3 = v6[5];
  a1[4] = v6[4];
  a1[5] = v3;
  result = *(double *)v6;
  v5 = v6[1];
  *a1 = v6[0];
  a1[1] = v5;
  return result;
}

uint64_t UpdateContactIntent.givenName.getter()
{
  uint64_t v1;

  sub_1DD1C1B7C();
  return v1;
}

uint64_t UpdateContactIntent.givenName.setter()
{
  return sub_1DD1C1B88();
}

__n128 UpdateContactIntent.target.getter@<Q0>(uint64_t a1@<X8>)
{
  __n128 result;
  __int128 v3;
  __int128 v4;
  uint64_t v5;
  __n128 v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;

  sub_1DD1C1B7C();
  result = v6;
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = v5;
  *(__n128 *)(a1 + 40) = v6;
  *(_QWORD *)(a1 + 56) = v7;
  *(_OWORD *)(a1 + 64) = v8;
  *(_QWORD *)(a1 + 80) = v9;
  *(_OWORD *)(a1 + 88) = v10;
  return result;
}

uint64_t UpdateContactIntent.target.setter(uint64_t a1)
{
  sub_1DD1B85F4(a1);
  sub_1DD1C1B88();
  return sub_1DD1A5284(a1);
}

uint64_t UpdateContactIntent.familyName.getter()
{
  uint64_t v1;

  sub_1DD1C1B7C();
  return v1;
}

uint64_t UpdateContactIntent.familyName.setter()
{
  return sub_1DD1C1B88();
}

uint64_t UpdateContactIntent.nameSuffix.getter()
{
  uint64_t v1;

  sub_1DD1C1B7C();
  return v1;
}

uint64_t UpdateContactIntent.nameSuffix.setter()
{
  return sub_1DD1C1B88();
}

uint64_t UpdateContactIntent.namePrefix.getter()
{
  uint64_t v1;

  sub_1DD1C1B7C();
  return v1;
}

uint64_t UpdateContactIntent.namePrefix.setter()
{
  return sub_1DD1C1B88();
}

uint64_t UpdateContactIntent.label.getter()
{
  uint64_t v1;

  sub_1DD1C1B7C();
  return v1;
}

uint64_t UpdateContactIntent.label.setter()
{
  return sub_1DD1C1B88();
}

uint64_t UpdateContactIntent.phoneNumber.getter()
{
  uint64_t v1;

  sub_1DD1C1B7C();
  return v1;
}

uint64_t UpdateContactIntent.phoneNumber.setter()
{
  return sub_1DD1C1B88();
}

uint64_t UpdateContactIntent.emailAddress.getter()
{
  uint64_t v1;

  sub_1DD1C1B7C();
  return v1;
}

uint64_t UpdateContactIntent.emailAddress.setter()
{
  return sub_1DD1C1B88();
}

uint64_t UpdateContactIntent.postalAddress.getter()
{
  uint64_t v1;

  sub_1DD1C1B7C();
  return v1;
}

uint64_t UpdateContactIntent.postalAddress.setter()
{
  return sub_1DD1C1B88();
}

uint64_t UpdateContactIntent.birthday.getter()
{
  return sub_1DD1C1B7C();
}

uint64_t UpdateContactIntent.birthday.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9698);
  MEMORY[0x1E0C80A78](v2);
  sub_1DD1ADF50(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1DD1C1B88();
  return sub_1DD1A5830(a1);
}

uint64_t sub_1DD1BA064()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v0 = sub_1DD1C1EDC();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1DD1C1F84();
  MEMORY[0x1E0C80A78](v4);
  v5 = sub_1DD1C2014();
  MEMORY[0x1E0C80A78](v5);
  v6 = sub_1DD1C1EE8();
  __swift_allocate_value_buffer(v6, static UpdateContactIntent.title);
  __swift_project_value_buffer(v6, (uint64_t)static UpdateContactIntent.title);
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E0CAF9B8], v0);
  return sub_1DD1C1EF4();
}

uint64_t UpdateContactIntent.title.unsafeMutableAddressor()
{
  return sub_1DD1A11AC(&qword_1F03C9660, (uint64_t (*)(_QWORD))MEMORY[0x1E0CAF9F8], (uint64_t)static UpdateContactIntent.title);
}

uint64_t static UpdateContactIntent.title.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DD1A2AEC(&qword_1F03C9660, (uint64_t (*)(_QWORD))MEMORY[0x1E0CAF9F8], (uint64_t)static UpdateContactIntent.title, a1);
}

uint64_t static UpdateContactIntent.title.setter(uint64_t a1)
{
  return sub_1DD1A2B9C(a1, &qword_1F03C9660, (uint64_t (*)(_QWORD))MEMORY[0x1E0CAF9F8], (uint64_t)static UpdateContactIntent.title);
}

uint64_t (*static UpdateContactIntent.title.modify())()
{
  uint64_t v0;

  if (qword_1F03C9660 != -1)
    swift_once();
  v0 = sub_1DD1C1EE8();
  __swift_project_value_buffer(v0, (uint64_t)static UpdateContactIntent.title);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1DD1BA2CC()
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
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[2];

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96C0);
  MEMORY[0x1E0C80A78](v0);
  v12[0] = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = sub_1DD1C1EDC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1DD1C1F84();
  MEMORY[0x1E0C80A78](v6);
  v7 = sub_1DD1C2014();
  MEMORY[0x1E0C80A78](v7);
  v8 = sub_1DD1C1EE8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v10 = sub_1DD1C1CD8();
  __swift_allocate_value_buffer(v10, static UpdateContactIntent.description);
  __swift_project_value_buffer(v10, (uint64_t)static UpdateContactIntent.description);
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x1E0CAF9B8], v2);
  sub_1DD1C1EF4();
  (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(v9 + 56))(v12[0], 1, 1, v8);
  return sub_1DD1C1CE4();
}

uint64_t UpdateContactIntent.description.unsafeMutableAddressor()
{
  return sub_1DD1A11AC(&qword_1F03C9668, (uint64_t (*)(_QWORD))MEMORY[0x1E0C91130], (uint64_t)static UpdateContactIntent.description);
}

uint64_t static UpdateContactIntent.description.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DD1A2AEC(&qword_1F03C9668, (uint64_t (*)(_QWORD))MEMORY[0x1E0C91130], (uint64_t)static UpdateContactIntent.description, a1);
}

uint64_t static UpdateContactIntent.description.setter(uint64_t a1)
{
  return sub_1DD1A2B9C(a1, &qword_1F03C9668, (uint64_t (*)(_QWORD))MEMORY[0x1E0C91130], (uint64_t)static UpdateContactIntent.description);
}

uint64_t (*static UpdateContactIntent.description.modify())()
{
  uint64_t v0;

  if (qword_1F03C9668 != -1)
    swift_once();
  v0 = sub_1DD1C1CD8();
  __swift_project_value_buffer(v0, (uint64_t)static UpdateContactIntent.description);
  swift_beginAccess();
  return j__swift_endAccess;
}

void *UpdateContactIntent.assistantOnly.unsafeMutableAddressor()
{
  return &static UpdateContactIntent.assistantOnly;
}

uint64_t static UpdateContactIntent.assistantOnly.getter()
{
  return 1;
}

uint64_t (*UpdateContactIntent.target.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1DD1C1B70();
  return sub_1DD1A16D4;
}

uint64_t UpdateContactIntent.$target.getter()
{
  return sub_1DD1C1B94();
}

uint64_t (*UpdateContactIntent.label.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1DD1C1B70();
  return sub_1DD1A16D4;
}

uint64_t UpdateContactIntent.$label.getter()
{
  return sub_1DD1C1B94();
}

uint64_t (*UpdateContactIntent.namePrefix.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1DD1C1B70();
  return sub_1DD1A16D4;
}

uint64_t UpdateContactIntent.$namePrefix.getter()
{
  return sub_1DD1C1B94();
}

uint64_t (*UpdateContactIntent.givenName.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1DD1C1B70();
  return sub_1DD1A16D4;
}

uint64_t UpdateContactIntent.$givenName.getter()
{
  return sub_1DD1C1B94();
}

uint64_t UpdateContactIntent.middleName.getter()
{
  uint64_t v1;

  sub_1DD1C1B7C();
  return v1;
}

uint64_t UpdateContactIntent.middleName.setter()
{
  return sub_1DD1C1B88();
}

uint64_t (*UpdateContactIntent.middleName.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1DD1C1B70();
  return sub_1DD1A16D4;
}

uint64_t UpdateContactIntent.$middleName.getter()
{
  return sub_1DD1C1B94();
}

uint64_t (*UpdateContactIntent.familyName.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1DD1C1B70();
  return sub_1DD1A16D4;
}

uint64_t UpdateContactIntent.$familyName.getter()
{
  return sub_1DD1C1B94();
}

uint64_t (*UpdateContactIntent.nameSuffix.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1DD1C1B70();
  return sub_1DD1A16D4;
}

uint64_t UpdateContactIntent.$nameSuffix.getter()
{
  return sub_1DD1C1B94();
}

uint64_t (*UpdateContactIntent.phoneNumber.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1DD1C1B70();
  return sub_1DD1A16D4;
}

uint64_t UpdateContactIntent.$phoneNumber.getter()
{
  return sub_1DD1C1B94();
}

uint64_t (*UpdateContactIntent.emailAddress.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1DD1C1B70();
  return sub_1DD1A16D4;
}

uint64_t UpdateContactIntent.$emailAddress.getter()
{
  return sub_1DD1C1B94();
}

uint64_t (*UpdateContactIntent.postalAddress.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1DD1C1B70();
  return sub_1DD1A16D4;
}

uint64_t UpdateContactIntent.$postalAddress.getter()
{
  return sub_1DD1C1B94();
}

uint64_t (*UpdateContactIntent.birthday.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1DD1C1B70();
  return sub_1DD1A16D4;
}

uint64_t UpdateContactIntent.$birthday.getter()
{
  return sub_1DD1C1B94();
}

uint64_t UpdateContactIntent.perform()(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 224) = a1;
  *(_QWORD *)(v2 + 232) = v1;
  return swift_task_switch();
}

uint64_t sub_1DD1BAAE8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;

  sub_1DD1C1B7C();
  sub_1DD1BACB4();
  sub_1DD1A5284(v0 + 16);
  v7 = _s14ContactsUICore21ViewContactCardIntentVACycfC_0();
  v8 = v1;
  v5 = v2;
  sub_1DD1C1B7C();
  v3 = *(void **)(v0 + 192);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v6 = v3;
  swift_bridgeObjectRetain();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  sub_1DD1C1B88();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
  *(_QWORD *)(v0 + 120) = v7;
  *(_QWORD *)(v0 + 128) = v5;
  *(_QWORD *)(v0 + 136) = v8;
  sub_1DD1B98A8();
  sub_1DD1C1AD4();
  swift_release();
  swift_release();
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_1DD1BACB4()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  unsigned __int8 v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  id v47[6];

  v47[4] = *(id *)MEMORY[0x1E0C80C00];
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9698);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  sub_1DD1C19B4();
  v6 = sub_1DD1A69A0();
  v43 = v1;
  if (v1)
  {
    swift_release();
  }
  else
  {
    v7 = v6;
    swift_release();
    v27 = v5;
    sub_1DD1C19B4();
    v40 = v47[0];
    objc_msgSend(v7, sel_mutableCopy);
    sub_1DD1C2140();
    swift_unknownObjectRelease();
    sub_1DD1B1254();
    swift_dynamicCast();
    v38 = v44;
    sub_1DD1C1B7C();
    v36 = v45;
    v33 = v46;
    sub_1DD1C1B7C();
    v35 = v45;
    v32 = v46;
    sub_1DD1C1B7C();
    v34 = v45;
    v30 = v46;
    sub_1DD1C1B7C();
    v31 = v45;
    v42 = v46;
    sub_1DD1C1B7C();
    v29 = v45;
    v41 = v46;
    sub_1DD1C1B7C();
    v8 = v46;
    v28 = v45;
    sub_1DD1C1B7C();
    v9 = v46;
    v37 = v45;
    v39 = v7;
    sub_1DD1C1B7C();
    v11 = v45;
    v10 = v46;
    sub_1DD1C1B7C();
    v12 = v45;
    v13 = v46;
    sub_1DD1C1B7C();
    v26 = v37;
    v37 = v8;
    v25 = v8;
    v14 = v38;
    v15 = v43;
    v16 = sub_1DD1A6C00(v38, v36, v33, v35, v32, v34, v30, v31, v42, v29, v41, v28, v25, v26, v9, v11, v10, v12, v13,
            (uint64_t)v4);
    v43 = v15;
    if (v15)
    {
      sub_1DD1A5830((uint64_t)v4);

      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      v17 = v16;
      sub_1DD1A5830((uint64_t)v4);
      swift_release();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C973D0]), sel_init);
      v19 = v17;
      objc_msgSend(v18, sel_updateContact_, v17);
      sub_1DD1C19B4();
      v20 = *((id *)v47[0] + 2);
      swift_release();
      v47[0] = 0;
      v21 = objc_msgSend(v20, sel_executeSaveRequest_error_, v18, v47);

      if ((v21 & 1) != 0)
      {
        v22 = v47[0];
      }
      else
      {
        v23 = v47[0];
        v24 = sub_1DD1C1EC4();

        v43 = v24;
        swift_willThrow();
      }

    }
  }
}

uint64_t sub_1DD1BB130@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1F03C9660 != -1)
    swift_once();
  v2 = sub_1DD1C1EE8();
  v3 = __swift_project_value_buffer(v2, (uint64_t)static UpdateContactIntent.title);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_1DD1BB1C8(uint64_t a1)
{
  _OWORD *v1;
  uint64_t v2;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _QWORD *v7;

  v4 = v1[3];
  *(_OWORD *)(v2 + 48) = v1[2];
  *(_OWORD *)(v2 + 64) = v4;
  v5 = v1[5];
  *(_OWORD *)(v2 + 80) = v1[4];
  *(_OWORD *)(v2 + 96) = v5;
  v6 = v1[1];
  *(_OWORD *)(v2 + 16) = *v1;
  *(_OWORD *)(v2 + 32) = v6;
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 112) = v7;
  *v7 = v2;
  v7[1] = sub_1DD1BB24C;
  v7[28] = a1;
  v7[29] = v2 + 16;
  return swift_task_switch();
}

uint64_t sub_1DD1BB24C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

double sub_1DD1BB294@<D0>(_OWORD *a1@<X8>)
{
  __int128 v2;
  __int128 v3;
  double result;
  __int128 v5;
  _OWORD v6[6];

  sub_1DD1BB304((uint64_t *)v6);
  v2 = v6[3];
  a1[2] = v6[2];
  a1[3] = v2;
  v3 = v6[5];
  a1[4] = v6[4];
  a1[5] = v3;
  result = *(double *)v6;
  v5 = v6[1];
  *a1 = v6[0];
  a1[1] = v5;
  return result;
}

uint64_t sub_1DD1BB2D8()
{
  sub_1DD1B77D4();
  return sub_1DD1C1A50();
}

uint64_t sub_1DD1BB304@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  void (*v92)(char *, uint64_t, uint64_t);
  char *v93;
  uint64_t v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t (*v99)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void (*v107)(char *, uint64_t, uint64_t);
  char *v108;
  uint64_t v109;
  uint64_t v110;
  char *v111;
  uint64_t v112;
  unint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void (*v118)(char *, uint64_t, uint64_t);
  char *v119;
  uint64_t v120;
  uint64_t v121;
  char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  void (*v129)(char *, uint64_t, uint64_t);
  char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t (*v134)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v135;
  uint64_t v136;
  void (*v137)(char *);
  uint64_t v138;
  uint64_t v139;
  void (*v140)(char *, uint64_t, uint64_t);
  char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  void (*v147)(char *, uint64_t, uint64_t);
  char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  void (*v155)(char *, uint64_t, uint64_t);
  char *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  void (*v162)(char *, uint64_t, uint64_t);
  char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  void (*v170)(char *, uint64_t, uint64_t);
  char *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  void (*v177)(char *, uint64_t, uint64_t);
  char *v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  void (*v185)(char *, uint64_t, uint64_t);
  char *v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t result;
  uint64_t *v193;
  uint64_t v194;
  char *v195;
  char *v196;
  char *v197;
  char *v198;
  uint64_t v199;
  uint64_t *v200;
  char *v201;
  char *v202;
  char *v203;
  char *v204;
  char *v205;
  char *v206;
  char *v207;
  char *v208;
  char *v209;
  char *v210;
  char *v211;
  char *v212;
  char *v213;
  char *v214;
  char *v215;
  char *v216;
  char *v217;
  char *v218;
  char *v219;
  uint64_t v220;
  char *v221;
  char *v222;
  char *v223;
  char *v224;
  char *v225;
  uint64_t v226;
  char *v227;
  char *v228;
  char *v229;
  char *v230;
  char *v231;
  char *v232;
  char *v233;
  char *v234;
  char *v235;
  uint64_t *v236;
  char *v237;
  char *v238;
  char *v239;
  char *v240;
  char *v241;
  char *v242;
  uint64_t v243;
  uint64_t (*v244)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v245;
  char *v246;
  char *v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t (*v250)(char *, uint64_t, uint64_t, uint64_t);
  void (*v251)(char *);
  unint64_t v252;
  unsigned int v253;
  uint64_t v254;
  char *v255;
  unsigned int v256;
  void (*v257)(char *, uint64_t, uint64_t);
  uint64_t v258;
  unint64_t v259;
  void (*v260)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v261;
  __int128 v262;
  __int128 v263;
  __int128 v264;
  __int128 v265;
  __int128 v266;
  __int128 v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;

  v236 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96C0);
  v2 = MEMORY[0x1E0C80A78](v1);
  v235 = (char *)&v199 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = MEMORY[0x1E0C80A78](v2);
  v234 = (char *)&v199 - v5;
  v6 = MEMORY[0x1E0C80A78](v4);
  v231 = (char *)&v199 - v7;
  v8 = MEMORY[0x1E0C80A78](v6);
  v227 = (char *)&v199 - v9;
  v10 = MEMORY[0x1E0C80A78](v8);
  v222 = (char *)&v199 - v11;
  v12 = MEMORY[0x1E0C80A78](v10);
  v217 = (char *)&v199 - v13;
  v14 = MEMORY[0x1E0C80A78](v12);
  v213 = (char *)&v199 - v15;
  v16 = MEMORY[0x1E0C80A78](v14);
  v210 = (char *)&v199 - v17;
  v18 = MEMORY[0x1E0C80A78](v16);
  v208 = (char *)&v199 - v19;
  v20 = MEMORY[0x1E0C80A78](v18);
  v205 = (char *)&v199 - v21;
  MEMORY[0x1E0C80A78](v20);
  v255 = (char *)&v199 - v22;
  v261 = sub_1DD1C1EDC();
  v23 = *(_QWORD *)(v261 - 8);
  MEMORY[0x1E0C80A78](v261);
  v201 = (char *)&v199 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = sub_1DD1C1F84();
  MEMORY[0x1E0C80A78](v25);
  v26 = sub_1DD1C2014();
  v27 = MEMORY[0x1E0C80A78](v26);
  v232 = (char *)&v199 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = MEMORY[0x1E0C80A78](v27);
  v233 = (char *)&v199 - v30;
  v31 = MEMORY[0x1E0C80A78](v29);
  v228 = (char *)&v199 - v32;
  v33 = MEMORY[0x1E0C80A78](v31);
  v229 = (char *)&v199 - v34;
  v35 = MEMORY[0x1E0C80A78](v33);
  v223 = (char *)&v199 - v36;
  v37 = MEMORY[0x1E0C80A78](v35);
  v224 = (char *)&v199 - v38;
  v39 = MEMORY[0x1E0C80A78](v37);
  v218 = (char *)&v199 - v40;
  v41 = MEMORY[0x1E0C80A78](v39);
  v219 = (char *)&v199 - v42;
  v43 = MEMORY[0x1E0C80A78](v41);
  v214 = (char *)&v199 - v44;
  v45 = MEMORY[0x1E0C80A78](v43);
  v215 = (char *)&v199 - v46;
  v47 = MEMORY[0x1E0C80A78](v45);
  v211 = (char *)&v199 - v48;
  v49 = MEMORY[0x1E0C80A78](v47);
  v212 = (char *)&v199 - v50;
  v51 = MEMORY[0x1E0C80A78](v49);
  v207 = (char *)&v199 - v52;
  v53 = MEMORY[0x1E0C80A78](v51);
  v209 = (char *)&v199 - v54;
  v55 = MEMORY[0x1E0C80A78](v53);
  v204 = (char *)&v199 - v56;
  v57 = MEMORY[0x1E0C80A78](v55);
  v206 = (char *)&v199 - v58;
  v59 = MEMORY[0x1E0C80A78](v57);
  v202 = (char *)&v199 - v60;
  v61 = MEMORY[0x1E0C80A78](v59);
  v203 = (char *)&v199 - v62;
  v63 = MEMORY[0x1E0C80A78](v61);
  v246 = (char *)&v199 - v64;
  v65 = MEMORY[0x1E0C80A78](v63);
  v247 = (char *)&v199 - v66;
  v67 = MEMORY[0x1E0C80A78](v65);
  MEMORY[0x1E0C80A78](v67);
  v258 = sub_1DD1C1EE8();
  v68 = *(_QWORD *)(v258 - 8);
  v69 = MEMORY[0x1E0C80A78](v258);
  v230 = (char *)&v199 - ((v70 + 15) & 0xFFFFFFFFFFFFFFF0);
  v71 = MEMORY[0x1E0C80A78](v69);
  v225 = (char *)&v199 - v72;
  v73 = MEMORY[0x1E0C80A78](v71);
  v221 = (char *)&v199 - v74;
  v75 = MEMORY[0x1E0C80A78](v73);
  v216 = (char *)&v199 - v76;
  v77 = MEMORY[0x1E0C80A78](v75);
  v242 = (char *)&v199 - v78;
  v79 = MEMORY[0x1E0C80A78](v77);
  v241 = (char *)&v199 - v80;
  v81 = MEMORY[0x1E0C80A78](v79);
  v240 = (char *)&v199 - v82;
  v83 = MEMORY[0x1E0C80A78](v81);
  v239 = (char *)&v199 - v84;
  v85 = MEMORY[0x1E0C80A78](v83);
  v238 = (char *)&v199 - v86;
  v87 = MEMORY[0x1E0C80A78](v85);
  v237 = (char *)&v199 - v88;
  MEMORY[0x1E0C80A78](v87);
  v90 = (char *)&v199 - v89;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9D10);
  if (qword_1F03C7E40 != -1)
    swift_once();
  v269 = qword_1F03CC020;
  v270 = *(_QWORD *)algn_1F03CC028;
  swift_bridgeObjectRetain();
  sub_1DD1C2158();
  sub_1DD1C19F0();
  sub_1DD1C19E4();
  v226 = sub_1DD1C19CC();
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  v92 = *(void (**)(char *, uint64_t, uint64_t))(v23 + 104);
  v93 = v201;
  v256 = *MEMORY[0x1E0CAF9B8];
  v91 = v256;
  v94 = v261;
  v92(v201, v256, v261);
  v257 = v92;
  v245 = (uint64_t)v90;
  sub_1DD1C1EF4();
  sub_1DD1C1FCC();
  v244 = (uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))__swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9728);
  sub_1DD1C1F78();
  v92(v93, v91, v94);
  v95 = v255;
  sub_1DD1C1EF4();
  v260 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v68 + 56);
  v260(v95, 0, 1, v258);
  v268 = 0;
  v266 = 0u;
  v267 = 0u;
  v264 = 0u;
  v265 = 0u;
  v262 = 0u;
  v263 = 0u;
  v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96D0);
  v200 = &v199;
  v97 = *(_QWORD *)(*(_QWORD *)(v96 - 8) + 64);
  MEMORY[0x1E0C80A78](v96);
  v254 = v97;
  v252 = (v97 + 15) & 0xFFFFFFFFFFFFFFF0;
  v98 = sub_1DD1C1A80();
  v99 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v98 - 8) + 56);
  v248 = v98;
  v100 = v99((char *)&v199 - ((v97 + 15) & 0xFFFFFFFFFFFFFFF0), 1, 1, v98);
  v250 = v99;
  MEMORY[0x1E0C80A78](v100);
  v99((char *)&v199 - ((v97 + 15) & 0xFFFFFFFFFFFFFFF0), 1, 1, v98);
  v101 = sub_1DD1C1DA4();
  v102 = *(_QWORD *)(v101 - 8);
  v243 = v101;
  v249 = *(_QWORD *)(v102 + 64);
  MEMORY[0x1E0C80A78](v101);
  v259 = (v103 + 15) & 0xFFFFFFFFFFFFFFF0;
  v253 = *MEMORY[0x1E0C91740];
  v251 = *(void (**)(char *))(v104 + 104);
  v251((char *)&v199 - v259);
  sub_1DD1A0434();
  v220 = sub_1DD1C1BA0();
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  v105 = v256;
  v106 = v261;
  v107 = v257;
  v257(v93, v256, v261);
  sub_1DD1C1EF4();
  sub_1DD1C1FCC();
  v255 = (char *)__swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96D8);
  sub_1DD1C1F78();
  v107(v93, v105, v106);
  v108 = v205;
  sub_1DD1C1EF4();
  v260(v108, 0, 1, v258);
  v262 = 0uLL;
  v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C96E0);
  v200 = &v199;
  v246 = *(char **)(*(_QWORD *)(v109 - 8) + 64);
  MEMORY[0x1E0C80A78](v109);
  v247 = (char *)((v110 + 15) & 0xFFFFFFFFFFFFFFF0);
  v111 = (char *)((char *)&v199 - v247);
  v245 = sub_1DD1C1FC0();
  v244 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v245 - 8) + 56);
  v112 = v244(v111, 1, 1, v245);
  MEMORY[0x1E0C80A78](v112);
  v113 = v252;
  v114 = v250((char *)&v199 - v252, 1, 1, v248);
  MEMORY[0x1E0C80A78](v114);
  v115 = v253;
  ((void (*)(char *, _QWORD, uint64_t))v251)((char *)&v199 - v259, v253, v243);
  v237 = (char *)sub_1DD1C1BC4();
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  v116 = v256;
  v117 = v261;
  v118 = v257;
  v257(v93, v256, v261);
  sub_1DD1C1EF4();
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  v118(v93, v116, v117);
  v119 = v208;
  sub_1DD1C1EF4();
  v120 = ((uint64_t (*)(char *, _QWORD, uint64_t, uint64_t))v260)(v119, 0, 1, v258);
  v205 = (char *)&v199;
  v262 = 0uLL;
  MEMORY[0x1E0C80A78](v120);
  v121 = v244((char *)((char *)&v199 - v247), 1, 1, v245);
  MEMORY[0x1E0C80A78](v121);
  v122 = (char *)&v199 - v113;
  v123 = v248;
  v124 = v250(v122, 1, 1, v248);
  MEMORY[0x1E0C80A78](v124);
  v125 = v115;
  v126 = v243;
  ((void (*)(char *, uint64_t, uint64_t))v251)((char *)&v199 - v259, v125, v243);
  v238 = (char *)sub_1DD1C1BC4();
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  v127 = v256;
  v128 = v261;
  v129 = v257;
  v257(v93, v256, v261);
  sub_1DD1C1EF4();
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  v129(v93, v127, v128);
  v130 = v210;
  sub_1DD1C1EF4();
  v131 = ((uint64_t (*)(char *, _QWORD, uint64_t, uint64_t))v260)(v130, 0, 1, v258);
  v208 = (char *)&v199;
  v262 = 0uLL;
  MEMORY[0x1E0C80A78](v131);
  v132 = v244((char *)((char *)&v199 - v247), 1, 1, v245);
  MEMORY[0x1E0C80A78](v132);
  v133 = v123;
  v134 = v250;
  v135 = v250((char *)&v199 - v252, 1, 1, v133);
  MEMORY[0x1E0C80A78](v135);
  v136 = v126;
  v137 = v251;
  ((void (*)(char *, _QWORD, uint64_t))v251)((char *)&v199 - v259, v253, v136);
  v239 = (char *)sub_1DD1C1BC4();
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  v138 = v256;
  v139 = v261;
  v140 = v257;
  v257(v93, v256, v261);
  sub_1DD1C1EF4();
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  v140(v93, v138, v139);
  v141 = v213;
  sub_1DD1C1EF4();
  v142 = ((uint64_t (*)(char *, _QWORD, uint64_t, uint64_t))v260)(v141, 0, 1, v258);
  v210 = (char *)&v199;
  v262 = 0uLL;
  MEMORY[0x1E0C80A78](v142);
  v143 = v244((char *)((char *)&v199 - v247), 1, 1, v245);
  MEMORY[0x1E0C80A78](v143);
  v144 = v134((char *)&v199 - v252, 1, 1, v248);
  MEMORY[0x1E0C80A78](v144);
  ((void (*)(char *, _QWORD, uint64_t))v137)((char *)&v199 - v259, v253, v243);
  v240 = (char *)sub_1DD1C1BC4();
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  v145 = v256;
  v146 = v261;
  v147 = v257;
  v257(v93, v256, v261);
  sub_1DD1C1EF4();
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  v147(v93, v145, v146);
  v148 = v217;
  sub_1DD1C1EF4();
  v149 = ((uint64_t (*)(char *, _QWORD, uint64_t, uint64_t))v260)(v148, 0, 1, v258);
  v213 = (char *)&v199;
  v262 = 0uLL;
  MEMORY[0x1E0C80A78](v149);
  v150 = v244((char *)((char *)&v199 - v247), 1, 1, v245);
  MEMORY[0x1E0C80A78](v150);
  v151 = v250((char *)&v199 - v252, 1, 1, v248);
  MEMORY[0x1E0C80A78](v151);
  v152 = v243;
  ((void (*)(char *, _QWORD, uint64_t))v251)((char *)&v199 - v259, v253, v243);
  v241 = (char *)sub_1DD1C1BC4();
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  v153 = v256;
  v154 = v261;
  v155 = v257;
  v257(v93, v256, v261);
  sub_1DD1C1EF4();
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  v155(v93, v153, v154);
  v156 = v222;
  sub_1DD1C1EF4();
  v157 = ((uint64_t (*)(char *, _QWORD, uint64_t, uint64_t))v260)(v156, 0, 1, v258);
  v217 = (char *)&v199;
  v262 = 0uLL;
  MEMORY[0x1E0C80A78](v157);
  v158 = v244((char *)((char *)&v199 - v247), 1, 1, v245);
  MEMORY[0x1E0C80A78](v158);
  v159 = v250((char *)&v199 - v252, 1, 1, v248);
  MEMORY[0x1E0C80A78](v159);
  ((void (*)(char *, _QWORD, uint64_t))v251)((char *)&v199 - v259, v253, v152);
  v242 = (char *)sub_1DD1C1BC4();
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  v160 = v256;
  v161 = v261;
  v162 = v257;
  v257(v93, v256, v261);
  sub_1DD1C1EF4();
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  v162(v93, v160, v161);
  v163 = v227;
  sub_1DD1C1EF4();
  v164 = v258;
  v165 = ((uint64_t (*)(char *, _QWORD, uint64_t, uint64_t))v260)(v163, 0, 1, v258);
  v222 = (char *)&v199;
  v262 = 0uLL;
  MEMORY[0x1E0C80A78](v165);
  v166 = v244((char *)((char *)&v199 - v247), 1, 1, v245);
  MEMORY[0x1E0C80A78](v166);
  v167 = v250((char *)&v199 - v252, 1, 1, v248);
  MEMORY[0x1E0C80A78](v167);
  ((void (*)(char *, _QWORD, uint64_t))v251)((char *)&v199 - v259, v253, v243);
  v227 = (char *)sub_1DD1C1BC4();
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  v168 = v256;
  v169 = v261;
  v170 = v257;
  v257(v93, v256, v261);
  sub_1DD1C1EF4();
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  v170(v93, v168, v169);
  v171 = v231;
  sub_1DD1C1EF4();
  v172 = ((uint64_t (*)(char *, _QWORD, uint64_t, uint64_t))v260)(v171, 0, 1, v164);
  v224 = (char *)&v199;
  v262 = 0uLL;
  MEMORY[0x1E0C80A78](v172);
  v173 = v244((char *)((char *)&v199 - v247), 1, 1, v245);
  MEMORY[0x1E0C80A78](v173);
  v174 = v250((char *)&v199 - v252, 1, 1, v248);
  MEMORY[0x1E0C80A78](v174);
  ((void (*)(char *, _QWORD, uint64_t))v251)((char *)&v199 - v259, v253, v243);
  v231 = (char *)sub_1DD1C1BC4();
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  v175 = v256;
  v176 = v261;
  v177 = v257;
  v257(v93, v256, v261);
  sub_1DD1C1EF4();
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  v177(v93, v175, v176);
  v178 = v234;
  sub_1DD1C1EF4();
  v179 = ((uint64_t (*)(char *, _QWORD, uint64_t, uint64_t))v260)(v178, 0, 1, v258);
  v229 = (char *)&v199;
  v262 = 0uLL;
  MEMORY[0x1E0C80A78](v179);
  v180 = v244((char *)((char *)&v199 - v247), 1, 1, v245);
  MEMORY[0x1E0C80A78](v180);
  v181 = v250((char *)&v199 - v252, 1, 1, v248);
  MEMORY[0x1E0C80A78](v181);
  ((void (*)(char *, _QWORD, uint64_t))v251)((char *)&v199 - v259, v253, v243);
  v182 = sub_1DD1C1BC4();
  sub_1DD1C1FCC();
  sub_1DD1C1F78();
  v183 = v256;
  v184 = v261;
  v185 = v257;
  v257(v93, v256, v261);
  sub_1DD1C1EF4();
  sub_1DD1C1FCC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03C9740);
  sub_1DD1C1F78();
  v185(v93, v183, v184);
  v186 = v235;
  sub_1DD1C1EF4();
  v187 = ((uint64_t (*)(char *, _QWORD, uint64_t, uint64_t))v260)(v186, 0, 1, v258);
  MEMORY[0x1E0C80A78](v187);
  v250((char *)&v199 - v252, 1, 1, v248);
  v188 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F03C9748);
  MEMORY[0x1E0C80A78](v188);
  v191 = (*(uint64_t (**)(char *, _QWORD))(v190 + 104))((char *)&v199 - ((v189 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x1E0C90D68]);
  MEMORY[0x1E0C80A78](v191);
  ((void (*)(char *, _QWORD, uint64_t))v251)((char *)&v199 - v259, v253, v243);
  result = sub_1DD1C1BB8();
  v193 = v236;
  v194 = v220;
  *v236 = v226;
  v193[1] = v194;
  v195 = v238;
  v193[2] = (uint64_t)v237;
  v193[3] = (uint64_t)v195;
  v196 = v240;
  v193[4] = (uint64_t)v239;
  v193[5] = (uint64_t)v196;
  v197 = v242;
  v193[6] = (uint64_t)v241;
  v193[7] = (uint64_t)v197;
  v198 = v231;
  v193[8] = (uint64_t)v227;
  v193[9] = (uint64_t)v198;
  v193[10] = v182;
  v193[11] = result;
  return result;
}

unint64_t sub_1DD1BD6AC()
{
  unint64_t result;

  result = qword_1F03C9E18;
  if (!qword_1F03C9E18)
  {
    result = MEMORY[0x1DF0D6658](&protocol conformance descriptor for UpdateContactIntent, &type metadata for UpdateContactIntent);
    atomic_store(result, (unint64_t *)&qword_1F03C9E18);
  }
  return result;
}

unint64_t sub_1DD1BD6F4()
{
  unint64_t result;

  result = qword_1F03C9E20;
  if (!qword_1F03C9E20)
  {
    result = MEMORY[0x1DF0D6658](&protocol conformance descriptor for UpdateContactIntent, &type metadata for UpdateContactIntent);
    atomic_store(result, (unint64_t *)&qword_1F03C9E20);
  }
  return result;
}

uint64_t sub_1DD1BD738()
{
  return *(_QWORD *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_1DD1BD75C()
{
  sub_1DD1B77D4();
  return swift_getOpaqueTypeConformance2();
}

uint64_t destroy for UpdateContactIntent()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

_QWORD *initializeWithCopy for UpdateContactIntent(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  v7 = a2[9];
  a1[8] = a2[8];
  a1[9] = v7;
  v9 = a2[11];
  a1[10] = a2[10];
  a1[11] = v9;
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  sub_1DD1C1C0C();
  return a1;
}

_QWORD *assignWithCopy for UpdateContactIntent(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  sub_1DD1C1C0C();
  swift_release();
  a1[1] = a2[1];
  sub_1DD1C1C0C();
  swift_release();
  a1[2] = a2[2];
  sub_1DD1C1C0C();
  swift_release();
  a1[3] = a2[3];
  sub_1DD1C1C0C();
  swift_release();
  a1[4] = a2[4];
  sub_1DD1C1C0C();
  swift_release();
  a1[5] = a2[5];
  sub_1DD1C1C0C();
  swift_release();
  a1[6] = a2[6];
  sub_1DD1C1C0C();
  swift_release();
  a1[7] = a2[7];
  sub_1DD1C1C0C();
  swift_release();
  a1[8] = a2[8];
  sub_1DD1C1C0C();
  swift_release();
  a1[9] = a2[9];
  sub_1DD1C1C0C();
  swift_release();
  a1[10] = a2[10];
  sub_1DD1C1C0C();
  swift_release();
  a1[11] = a2[11];
  sub_1DD1C1C0C();
  swift_release();
  return a1;
}

__n128 __swift_memcpy96_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __n128 result;
  __int128 v4;
  __int128 v5;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  result = *(__n128 *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v4;
  return result;
}

_OWORD *assignWithTake for UpdateContactIntent(_OWORD *a1, _OWORD *a2)
{
  swift_release();
  *a1 = *a2;
  swift_release();
  swift_release();
  a1[1] = a2[1];
  swift_release();
  swift_release();
  a1[2] = a2[2];
  swift_release();
  swift_release();
  a1[3] = a2[3];
  swift_release();
  swift_release();
  a1[4] = a2[4];
  swift_release();
  swift_release();
  a1[5] = a2[5];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for UpdateContactIntent(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 96))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for UpdateContactIntent(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 96) = 1;
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
    *(_BYTE *)(result + 96) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for UpdateContactIntent()
{
  return &type metadata for UpdateContactIntent;
}

unint64_t sub_1DD1BDBBC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F03C9E30;
  if (!qword_1F03C9E30)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F03C9E38);
    result = MEMORY[0x1DF0D6658](MEMORY[0x1E0C91588], v1);
    atomic_store(result, (unint64_t *)&qword_1F03C9E30);
  }
  return result;
}

uint64_t sub_1DD1BDC08()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t sub_1DD1C1990()
{
  return MEMORY[0x1E0C902D0]();
}

uint64_t sub_1DD1C199C()
{
  return MEMORY[0x1E0C90320]();
}

uint64_t sub_1DD1C19A8()
{
  return MEMORY[0x1E0C90338]();
}

uint64_t sub_1DD1C19B4()
{
  return MEMORY[0x1E0C90358]();
}

uint64_t sub_1DD1C19C0()
{
  return MEMORY[0x1E0C90370]();
}

uint64_t sub_1DD1C19CC()
{
  return MEMORY[0x1E0C90388]();
}

uint64_t sub_1DD1C19D8()
{
  return MEMORY[0x1E0C90418]();
}

uint64_t sub_1DD1C19E4()
{
  return MEMORY[0x1E0C90430]();
}

uint64_t sub_1DD1C19F0()
{
  return MEMORY[0x1E0C90440]();
}

uint64_t sub_1DD1C19FC()
{
  return MEMORY[0x1E0C90510]();
}

uint64_t sub_1DD1C1A08()
{
  return MEMORY[0x1E0C905A8]();
}

uint64_t sub_1DD1C1A14()
{
  return MEMORY[0x1E0C905C8]();
}

uint64_t sub_1DD1C1A20()
{
  return MEMORY[0x1E0C905D8]();
}

uint64_t sub_1DD1C1A2C()
{
  return MEMORY[0x1E0C905E8]();
}

uint64_t sub_1DD1C1A38()
{
  return MEMORY[0x1E0C90618]();
}

uint64_t sub_1DD1C1A44()
{
  return MEMORY[0x1E0C90648]();
}

uint64_t sub_1DD1C1A50()
{
  return MEMORY[0x1E0C90658]();
}

uint64_t sub_1DD1C1A5C()
{
  return MEMORY[0x1E0C90758]();
}

uint64_t sub_1DD1C1A68()
{
  return MEMORY[0x1E0C90780]();
}

uint64_t sub_1DD1C1A74()
{
  return MEMORY[0x1E0C907C8]();
}

uint64_t sub_1DD1C1A80()
{
  return MEMORY[0x1E0C907D8]();
}

uint64_t sub_1DD1C1A8C()
{
  return MEMORY[0x1E0C90818]();
}

uint64_t sub_1DD1C1A98()
{
  return MEMORY[0x1E0C90820]();
}

uint64_t sub_1DD1C1AA4()
{
  return MEMORY[0x1E0C90868]();
}

uint64_t sub_1DD1C1AB0()
{
  return MEMORY[0x1E0C90870]();
}

uint64_t sub_1DD1C1ABC()
{
  return MEMORY[0x1E0C90948]();
}

uint64_t sub_1DD1C1AC8()
{
  return MEMORY[0x1E0C90990]();
}

uint64_t sub_1DD1C1AD4()
{
  return MEMORY[0x1E0C909C0]();
}

uint64_t sub_1DD1C1AE0()
{
  return MEMORY[0x1E0C909D0]();
}

uint64_t sub_1DD1C1AEC()
{
  return MEMORY[0x1E0C90A00]();
}

uint64_t sub_1DD1C1AF8()
{
  return MEMORY[0x1E0C90A48]();
}

uint64_t sub_1DD1C1B04()
{
  return MEMORY[0x1E0C90A68]();
}

uint64_t sub_1DD1C1B10()
{
  return MEMORY[0x1E0C90AD0]();
}

uint64_t sub_1DD1C1B1C()
{
  return MEMORY[0x1E0C90AE0]();
}

uint64_t sub_1DD1C1B28()
{
  return MEMORY[0x1E0C90AF0]();
}

uint64_t sub_1DD1C1B34()
{
  return MEMORY[0x1E0C90B00]();
}

uint64_t sub_1DD1C1B40()
{
  return MEMORY[0x1E0C90B18]();
}

uint64_t sub_1DD1C1B4C()
{
  return MEMORY[0x1E0C90B30]();
}

uint64_t sub_1DD1C1B58()
{
  return MEMORY[0x1E0C90B58]();
}

uint64_t sub_1DD1C1B64()
{
  return MEMORY[0x1E0C90B88]();
}

uint64_t sub_1DD1C1B70()
{
  return MEMORY[0x1E0C90CE8]();
}

uint64_t sub_1DD1C1B7C()
{
  return MEMORY[0x1E0C90CF8]();
}

uint64_t sub_1DD1C1B88()
{
  return MEMORY[0x1E0C90D08]();
}

uint64_t sub_1DD1C1B94()
{
  return MEMORY[0x1E0C90D18]();
}

uint64_t sub_1DD1C1BA0()
{
  return MEMORY[0x1E0C90DC0]();
}

uint64_t sub_1DD1C1BAC()
{
  return MEMORY[0x1E0C90DF8]();
}

uint64_t sub_1DD1C1BB8()
{
  return MEMORY[0x1E0C90E20]();
}

uint64_t sub_1DD1C1BC4()
{
  return MEMORY[0x1E0C90E48]();
}

uint64_t sub_1DD1C1BD0()
{
  return MEMORY[0x1E0C90E68]();
}

uint64_t sub_1DD1C1BDC()
{
  return MEMORY[0x1E0C90F10]();
}

uint64_t sub_1DD1C1BE8()
{
  return MEMORY[0x1E0C90F18]();
}

uint64_t sub_1DD1C1BF4()
{
  return MEMORY[0x1E0C90F30]();
}

uint64_t sub_1DD1C1C00()
{
  return MEMORY[0x1E0C90F40]();
}

uint64_t sub_1DD1C1C0C()
{
  return MEMORY[0x1E0C90F58]();
}

uint64_t sub_1DD1C1C18()
{
  return MEMORY[0x1E0C90F88]();
}

uint64_t sub_1DD1C1C24()
{
  return MEMORY[0x1E0C90F98]();
}

uint64_t sub_1DD1C1C30()
{
  return MEMORY[0x1E0C90FA8]();
}

uint64_t sub_1DD1C1C3C()
{
  return MEMORY[0x1E0C90FB8]();
}

uint64_t sub_1DD1C1C48()
{
  return MEMORY[0x1E0C90FC8]();
}

uint64_t sub_1DD1C1C54()
{
  return MEMORY[0x1E0C90FE0]();
}

uint64_t sub_1DD1C1C60()
{
  return MEMORY[0x1E0C90FE8]();
}

uint64_t sub_1DD1C1C6C()
{
  return MEMORY[0x1E0C90FF8]();
}

uint64_t sub_1DD1C1C78()
{
  return MEMORY[0x1E0C91010]();
}

uint64_t sub_1DD1C1C84()
{
  return MEMORY[0x1E0C91028]();
}

uint64_t sub_1DD1C1C90()
{
  return MEMORY[0x1E0C91050]();
}

uint64_t sub_1DD1C1C9C()
{
  return MEMORY[0x1E0C91060]();
}

uint64_t sub_1DD1C1CA8()
{
  return MEMORY[0x1E0C91070]();
}

uint64_t sub_1DD1C1CB4()
{
  return MEMORY[0x1E0C91098]();
}

uint64_t sub_1DD1C1CC0()
{
  return MEMORY[0x1E0C910E0]();
}

uint64_t sub_1DD1C1CCC()
{
  return MEMORY[0x1E0C910F8]();
}

uint64_t sub_1DD1C1CD8()
{
  return MEMORY[0x1E0C91130]();
}

uint64_t sub_1DD1C1CE4()
{
  return MEMORY[0x1E0C91150]();
}

uint64_t sub_1DD1C1CF0()
{
  return MEMORY[0x1E0C911D8]();
}

uint64_t sub_1DD1C1CFC()
{
  return MEMORY[0x1E0C91218]();
}

uint64_t sub_1DD1C1D08()
{
  return MEMORY[0x1E0C912D0]();
}

uint64_t sub_1DD1C1D14()
{
  return MEMORY[0x1E0C912F8]();
}

uint64_t sub_1DD1C1D20()
{
  return MEMORY[0x1E0C913D0]();
}

uint64_t sub_1DD1C1D2C()
{
  return MEMORY[0x1E0C91400]();
}

uint64_t sub_1DD1C1D38()
{
  return MEMORY[0x1E0C91448]();
}

uint64_t sub_1DD1C1D44()
{
  return MEMORY[0x1E0C91488]();
}

uint64_t sub_1DD1C1D50()
{
  return MEMORY[0x1E0C914B8]();
}

uint64_t sub_1DD1C1D5C()
{
  return MEMORY[0x1E0C914F0]();
}

uint64_t sub_1DD1C1D68()
{
  return MEMORY[0x1E0C915D0]();
}

uint64_t sub_1DD1C1D74()
{
  return MEMORY[0x1E0C915E0]();
}

uint64_t sub_1DD1C1D80()
{
  return MEMORY[0x1E0C915E8]();
}

uint64_t sub_1DD1C1D8C()
{
  return MEMORY[0x1E0C91628]();
}

uint64_t sub_1DD1C1D98()
{
  return MEMORY[0x1E0C91648]();
}

uint64_t sub_1DD1C1DA4()
{
  return MEMORY[0x1E0C91748]();
}

uint64_t sub_1DD1C1DB0()
{
  return MEMORY[0x1E0C91828]();
}

uint64_t sub_1DD1C1DBC()
{
  return MEMORY[0x1E0C918C0]();
}

uint64_t sub_1DD1C1DC8()
{
  return MEMORY[0x1E0C91928]();
}

uint64_t sub_1DD1C1DD4()
{
  return MEMORY[0x1E0C91A18]();
}

uint64_t sub_1DD1C1DE0()
{
  return MEMORY[0x1E0C91A28]();
}

uint64_t sub_1DD1C1DEC()
{
  return MEMORY[0x1E0C91A40]();
}

uint64_t sub_1DD1C1DF8()
{
  return MEMORY[0x1E0C91AA0]();
}

uint64_t sub_1DD1C1E04()
{
  return MEMORY[0x1E0C91AB0]();
}

uint64_t sub_1DD1C1E10()
{
  return MEMORY[0x1E0C91BC0]();
}

uint64_t sub_1DD1C1E1C()
{
  return MEMORY[0x1E0CAE668]();
}

uint64_t sub_1DD1C1E28()
{
  return MEMORY[0x1E0CAE690]();
}

uint64_t sub_1DD1C1E34()
{
  return MEMORY[0x1E0CAE778]();
}

uint64_t sub_1DD1C1E40()
{
  return MEMORY[0x1E0CAE7D0]();
}

uint64_t sub_1DD1C1E4C()
{
  return MEMORY[0x1E0CAE7F0]();
}

uint64_t sub_1DD1C1E58()
{
  return MEMORY[0x1E0CAE848]();
}

uint64_t sub_1DD1C1E64()
{
  return MEMORY[0x1E0CAE878]();
}

uint64_t sub_1DD1C1E70()
{
  return MEMORY[0x1E0CAE890]();
}

uint64_t sub_1DD1C1E7C()
{
  return MEMORY[0x1E0CAE9A0]();
}

uint64_t sub_1DD1C1E88()
{
  return MEMORY[0x1E0CAE9B8]();
}

uint64_t sub_1DD1C1E94()
{
  return MEMORY[0x1E0CAEAB0]();
}

uint64_t sub_1DD1C1EA0()
{
  return MEMORY[0x1E0CAF720]();
}

uint64_t sub_1DD1C1EAC()
{
  return MEMORY[0x1E0CAF750]();
}

uint64_t sub_1DD1C1EB8()
{
  return MEMORY[0x1E0CAF790]();
}

uint64_t sub_1DD1C1EC4()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1DD1C1ED0()
{
  return MEMORY[0x1E0CAF9B0]();
}

uint64_t sub_1DD1C1EDC()
{
  return MEMORY[0x1E0CAF9D0]();
}

uint64_t sub_1DD1C1EE8()
{
  return MEMORY[0x1E0CAF9F8]();
}

uint64_t sub_1DD1C1EF4()
{
  return MEMORY[0x1E0CAFA28]();
}

uint64_t sub_1DD1C1F00()
{
  return MEMORY[0x1E0CAFB50]();
}

uint64_t sub_1DD1C1F0C()
{
  return MEMORY[0x1E0CAFB58]();
}

uint64_t sub_1DD1C1F18()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_1DD1C1F24()
{
  return MEMORY[0x1E0CAFF90]();
}

uint64_t sub_1DD1C1F30()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1DD1C1F3C()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1DD1C1F48()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1DD1C1F54()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_1DD1C1F60()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_1DD1C1F6C()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1DD1C1F78()
{
  return MEMORY[0x1E0CB0CC8]();
}

uint64_t sub_1DD1C1F84()
{
  return MEMORY[0x1E0CB0E38]();
}

uint64_t sub_1DD1C1F90()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1DD1C1F9C()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1DD1C1FA8()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1DD1C1FB4()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t sub_1DD1C1FC0()
{
  return MEMORY[0x1E0C91CA0]();
}

uint64_t sub_1DD1C1FCC()
{
  return MEMORY[0x1E0CB18A0]();
}

uint64_t sub_1DD1C1FD8()
{
  return MEMORY[0x1E0CB18C0]();
}

uint64_t sub_1DD1C1FE4()
{
  return MEMORY[0x1E0CB18D8]();
}

uint64_t sub_1DD1C1FF0()
{
  return MEMORY[0x1E0CB18E0]();
}

uint64_t sub_1DD1C1FFC()
{
  return MEMORY[0x1E0CB18E8]();
}

uint64_t sub_1DD1C2008()
{
  return MEMORY[0x1E0CB18F0]();
}

uint64_t sub_1DD1C2014()
{
  return MEMORY[0x1E0CB18F8]();
}

uint64_t sub_1DD1C2020()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1DD1C202C()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1DD1C2038()
{
  return MEMORY[0x1E0CB19B0]();
}

uint64_t sub_1DD1C2044()
{
  return MEMORY[0x1E0CB1A40]();
}

uint64_t sub_1DD1C2050()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1DD1C205C()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1DD1C2068()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1DD1C2074()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1DD1C2080()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1DD1C208C()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t sub_1DD1C2098()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1DD1C20A4()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1DD1C20B0()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1DD1C20BC()
{
  return MEMORY[0x1E0C91D00]();
}

uint64_t sub_1DD1C20C8()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1DD1C20D4()
{
  return MEMORY[0x1E0DF06D8]();
}

uint64_t sub_1DD1C20E0()
{
  return MEMORY[0x1E0DF06E0]();
}

uint64_t sub_1DD1C20EC()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_1DD1C20F8()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1DD1C2104()
{
  return MEMORY[0x1E0CB1FF0]();
}

uint64_t sub_1DD1C2110()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1DD1C211C()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1DD1C2128()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1DD1C2134()
{
  return MEMORY[0x1E0CB2588]();
}

uint64_t sub_1DD1C2140()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1DD1C214C()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1DD1C2158()
{
  return MEMORY[0x1E0DEC1B0]();
}

uint64_t sub_1DD1C2164()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1DD1C2170()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1DD1C217C()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1DD1C2188()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1DD1C2194()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_1DD1C21A0()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_1DD1C21AC()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_1DD1C21B8()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_1DD1C21C4()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_1DD1C21D0()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1DD1C21DC()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1DD1C21E8()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1DD1C21F4()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1DD1C2200()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1DD1C220C()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1DD1C2218()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1DD1C2224()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1DD1C2230()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1DD1C223C()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1DD1C2248()
{
  return MEMORY[0x1E0DEDF40]();
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1E0C97E90](arg);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1E0C98758](cf);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD8](retstr, sx, sy);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1E0C9BB10](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1E0C9BB20](context);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1E0C9BC78](space, components);
}

CGColorRef CGColorCreateCopy(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x1E0C9BC80](color);
}

CGColorRef CGColorCreateSRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1E0C9BCB8](red, green, blue, alpha);
}

BOOL CGColorEqualToColor(CGColorRef color1, CGColorRef color2)
{
  return MEMORY[0x1E0C9BCD8](color1, color2);
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BD00](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1E0C9BD08](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x1E0C9BD20](color);
}

void CGColorRelease(CGColorRef color)
{
  MEMORY[0x1E0C9BD60](color);
}

CGColorRef CGColorRetain(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x1E0C9BD68](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE50](name);
}

CFStringRef CGColorSpaceGetName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x1E0C9BED0](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
}

void CGContextAddArc(CGContextRef c, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, int clockwise)
{
  MEMORY[0x1E0C9BFB0](c, *(_QWORD *)&clockwise, x, y, radius, startAngle, endAngle);
}

void CGContextAddCurveToPoint(CGContextRef c, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9BFC0](c, cp1x, cp1y, cp2x, cp2y, x, y);
}

void CGContextAddLineToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9BFD0](c, x, y);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
  MEMORY[0x1E0C9BFD8](c, path);
}

void CGContextClip(CGContextRef c)
{
  MEMORY[0x1E0C9C028](c);
}

void CGContextClipToMask(CGContextRef c, CGRect rect, CGImageRef mask)
{
  MEMORY[0x1E0C9C030](c, mask, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
  MEMORY[0x1E0C9C050](c, transform);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x1E0C9C170](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
  MEMORY[0x1E0C9C198](c, gradient, *(_QWORD *)&options, (__n128)startPoint, *(__n128 *)&startPoint.y, (__n128)endPoint, *(__n128 *)&endPoint.y);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C220](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextMoveToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9C330](c, x, y);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x1E0C9C340](c);
}

void CGContextRestoreGState(CGContextRef c)
{
  MEMORY[0x1E0C9C370](c);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x1E0C9C388](c);
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
  MEMORY[0x1E0C9C3C8](c, *(_QWORD *)&mode);
}

void CGContextSetFillColor(CGContextRef c, const CGFloat *components)
{
  MEMORY[0x1E0C9C3F8](c, components);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C408](c, color);
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
  MEMORY[0x1E0C9C480](c, width);
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C508](c, color);
}

void CGContextStrokePath(CGContextRef c)
{
  MEMORY[0x1E0C9C570](c);
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x1E0C9C5F0](data);
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x1E0C9CA90](space, colors, locations);
}

void CGGradientRelease(CGGradientRef gradient)
{
  MEMORY[0x1E0C9CAC0](gradient);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1E0C9CC60](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1E0C9CCD0](image);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x1E0C9CDA0](image);
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1E0C9CDA8](image);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1E0CBC568](isrc, index, options);
}

CGImageRef CGImageSourceCreateThumbnailAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1E0CBC588](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithDataProvider(CGDataProviderRef provider, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC5A0](provider, options);
}

uint64_t CGImageSourceGetTypeWithData()
{
  return MEMORY[0x1E0CBC628]();
}

CGPathRef CGPathCreateWithEllipseInRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1E0C9D3C0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGPathRef CGPathCreateWithRoundedRect(CGRect rect, CGFloat cornerWidth, CGFloat cornerHeight, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1E0C9D3D0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, cornerWidth, cornerHeight);
}

void CGPathRelease(CGPathRef path)
{
  MEMORY[0x1E0C9D498](path);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D548](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D588]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5B0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D5E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0C9D5F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1E0C9D618]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t CNAbstractMethodException()
{
  return MEMORY[0x1E0D136F0]();
}

uint64_t CNAggregateComparator()
{
  return MEMORY[0x1E0D136F8]();
}

uint64_t CNComparatorForSortingByAuxiliaryValues()
{
  return MEMORY[0x1E0D13718]();
}

uint64_t CNImageUtilsCroppedImageDataFromFullSizeImageData()
{
  return MEMORY[0x1E0C968F0]();
}

uint64_t CNInitializerUnavailableException()
{
  return MEMORY[0x1E0D137E8]();
}

uint64_t CNIsChineseJapaneseKoreanString()
{
  return MEMORY[0x1E0D13808]();
}

uint64_t CNLogicalNot()
{
  return MEMORY[0x1E0D13860]();
}

uint64_t CNResultWithLock()
{
  return MEMORY[0x1E0D13900]();
}

uint64_t CNRunWithLock()
{
  return MEMORY[0x1E0D13908]();
}

uint64_t CNUnimplementedMethodException()
{
  return MEMORY[0x1E0D13948]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

const char *__cdecl NSGetSizeAndAlignment(const char *typePtr, NSUInteger *sizep, NSUInteger *alignp)
{
  return (const char *)MEMORY[0x1E0C99758](typePtr, sizep, alignp);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1E0CB3178](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSize(NSSize aSize)
{
  return (NSString *)MEMORY[0x1E0CB3240]((__n128)aSize, *(__n128 *)&aSize.height);
}

uint64_t UICreateCGImageFromIOSurface()
{
  return MEMORY[0x1E0CEB448]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFMZEnabled()
{
  return MEMORY[0x1E0C9A260]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x1E0C80BC8](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1E0DEEA28]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

uint64_t cn_objectResultWithObjectLock()
{
  return MEMORY[0x1E0D13BF0]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1E0DEEB20]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x1E0DF0F88]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1E0DF0F90]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x1E0DF0F98]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1E0DEEC40]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1E0DEECB8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1E0DEECE8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1E0DEED60]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1E0DEEE38]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1E0DEEE98]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

