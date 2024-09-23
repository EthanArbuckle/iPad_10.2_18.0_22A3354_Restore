uint64_t SetAKEnabled(uint64_t result)
{
  AKAdaptorEnabled = result;
  return result;
}

void sub_209D1487C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL IsObcCEquivalent(void *a1, const char *a2)
{
  return strcmp((const char *)objc_msgSend(objc_retainAutorelease(a1), "objCType"), a2) == 0;
}

void PDFAnnotationCGPathApplierFunc(void *a1, uint64_t a2)
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double *v11;
  double *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a1;
  objc_msgSend(v21, "objectForKey:", CFSTR("bounds"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "PDFKitPDFRectValue");
  v5 = v4;
  v7 = v6;

  objc_msgSend(v21, "objectForKey:", CFSTR("elementCount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  objc_msgSend(v21, "objectForKey:", CFSTR("pathArray"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(double **)(a2 + 8);
  switch(*(_DWORD *)a2)
  {
    case 0:
    case 1:
      goto LABEL_4;
    case 2:
      v12 = v11 + 3;
      v11 += 2;
      goto LABEL_6;
    case 3:
      v12 = v11 + 5;
      v11 += 4;
      goto LABEL_6;
    case 4:
      if (v9 < 1)
        goto LABEL_12;
      objc_msgSend(v21, "objectForKey:", CFSTR("firstPoint"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "PDFKitPDFPointValue");
      v14 = v16;
      v13 = v17;
      goto LABEL_10;
    default:
      v11 = (double *)MEMORY[0x24BDBEFB0];
LABEL_4:
      v12 = v11 + 1;
LABEL_6:
      v13 = *v12;
      v14 = *v11;
      if (v9)
        goto LABEL_11;
      objc_msgSend(MEMORY[0x24BDD1968], "PDFKitValueWithPDFPoint:", v14, *v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKey:", v15, CFSTR("firstPoint"));
LABEL_10:

LABEL_11:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v5 + v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v18);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v7 + v13);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v19);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v9 + 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKey:", v20, CFSTR("elementCount"));

LABEL_12:
      return;
  }
}

BOOL getStreams(const char *a1, uint64_t a2, uint64_t a3)
{
  CGPDFDictionary *v5;
  CGPDFStreamRef *v6;
  const char *v7;

  if (!strcmp(a1, "Off"))
  {
    v5 = *(CGPDFDictionary **)a3;
    v7 = a1;
    v6 = (CGPDFStreamRef *)(a3 + 16);
  }
  else
  {
    *(_QWORD *)(a3 + 24) = a1;
    v5 = *(CGPDFDictionary **)a3;
    v6 = (CGPDFStreamRef *)(a3 + 8);
    v7 = a1;
  }
  return CGPDFDictionaryGetStream(v5, v7, v6);
}

void sub_209D29708(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_209D298F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCRNormalizedQuadClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!TextRecognitionLibraryCore_frameworkLibrary)
  {
    TextRecognitionLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!TextRecognitionLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("CRNormalizedQuad");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getCRNormalizedQuadClass_block_invoke_cold_1();
    free(v3);
  }
  getCRNormalizedQuadClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getVKCFormRegionClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!VisionKitCoreLibraryCore_frameworkLibrary)
  {
    VisionKitCoreLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!VisionKitCoreLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("VKCFormRegion");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getVKCFormRegionClass_block_invoke_cold_1();
    free(v3);
  }
  getVKCFormRegionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_209D2CF08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209D2FF08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  void *v9;
  void *v10;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_209D30174(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  void *v17;
  void *v18;
  void *v19;
  std::mutex *v20;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  std::mutex::unlock(v20);

  _Unwind_Resume(a1);
}

void sub_209D305D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,void *a22,void *a23,void *a24)
{
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  std::mutex *v29;

  std::mutex::unlock(v29);

  _Unwind_Resume(a1);
}

void sub_209D30960(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;
  std::mutex *v13;

  std::mutex::unlock(v13);

  _Unwind_Resume(a1);
}

void sub_209D30AA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, void *a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  void *v11;
  void *v12;
  va_list va;

  va_start(va, a11);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)(a2 + 48);
  v3 = *(_OWORD *)(a2 + 64);
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v3;
  return result;
}

void sub_209D30DAC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_209D30F30(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_209D31180(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  void *v4;
  void *v5;
  void *v6;
  const void *v8;
  va_list va;
  const void *v10;
  va_list va1;
  const void *v12;
  va_list va2;
  const void *v14;
  va_list va3;
  const void *v16;
  va_list va4;
  const void *v18;
  va_list va5;
  va_list va6;

  va_start(va6, a4);
  va_start(va5, a4);
  va_start(va4, a4);
  va_start(va3, a4);
  va_start(va2, a4);
  va_start(va1, a4);
  va_start(va, a4);
  v8 = va_arg(va1, const void *);
  va_copy(va2, va1);
  v10 = va_arg(va2, const void *);
  va_copy(va3, va2);
  v12 = va_arg(va3, const void *);
  va_copy(va4, va3);
  v14 = va_arg(va4, const void *);
  va_copy(va5, va4);
  v16 = va_arg(va5, const void *);
  va_copy(va6, va5);
  v18 = va_arg(va6, const void *);
  applesauce::CF::ObjectRef<CGPDFDocument *>::~ObjectRef((const void **)va);
  applesauce::CF::ObjectRef<CGDataProvider *>::~ObjectRef((const void **)va1);
  applesauce::CF::ObjectRef<CGContext *>::~ObjectRef((const void **)va2);
  applesauce::CF::ObjectRef<CGDataConsumer *>::~ObjectRef((const void **)va3);
  applesauce::CF::ObjectRef<__CFData *>::~ObjectRef((const void **)va4);
  applesauce::CF::ObjectRef<CGContext *>::~ObjectRef((const void **)va5);
  applesauce::CF::ObjectRef<CGDisplayList *>::~ObjectRef((const void **)va6);

  _Unwind_Resume(a1);
}

const void **applesauce::CF::ObjectRef<CGPDFDocument *>::~ObjectRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

const void **applesauce::CF::ObjectRef<CGDataProvider *>::~ObjectRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

const void **applesauce::CF::ObjectRef<CGContext *>::~ObjectRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

const void **applesauce::CF::ObjectRef<CGDataConsumer *>::~ObjectRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

const void **applesauce::CF::ObjectRef<__CFData *>::~ObjectRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

const void **applesauce::CF::ObjectRef<CGDisplayList *>::~ObjectRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

void sub_209D31828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15)
{

  _Unwind_Resume(a1);
}

void sub_209D32064(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,CFTypeRef cf,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50,uint64_t a51)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

id quadTransformedWithAffineTransform(void *a1, double *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
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
  void *v24;
  objc_class *v25;
  void *v26;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  _QWORD v52[5];
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;

  v3 = a1;
  objc_msgSend(v3, "topLeft");
  v5 = v4;
  v7 = v6;
  v9 = *a2;
  v8 = a2[1];
  v10 = a2[3];
  v51 = a2[2];
  v11 = a2[5];
  v50 = a2[4];
  objc_msgSend(v3, "bottomLeft");
  v13 = v12;
  v15 = v14;
  v46 = v11;
  v47 = v10;
  v48 = v9;
  v49 = v8;
  v44 = *a2;
  v45 = a2[1];
  v40 = a2[4];
  v41 = a2[2];
  v42 = a2[5];
  v43 = a2[3];
  objc_msgSend(v3, "topRight");
  v17 = v16;
  v19 = v18;
  v38 = *a2;
  v39 = a2[1];
  v34 = a2[4];
  v35 = a2[2];
  v36 = a2[5];
  v37 = a2[3];
  objc_msgSend(v3, "bottomRight");
  v21 = v20;
  v23 = v22;
  v32 = *a2;
  v33 = a2[1];
  v28 = a2[4];
  v29 = a2[2];
  v30 = a2[5];
  v31 = a2[3];
  v53 = 0;
  v54 = &v53;
  v55 = 0x2050000000;
  v24 = (void *)getVKQuadClass(void)::softClass;
  v56 = getVKQuadClass(void)::softClass;
  if (!getVKQuadClass(void)::softClass)
  {
    v52[0] = MEMORY[0x24BDAC760];
    v52[1] = 3221225472;
    v52[2] = ___ZL14getVKQuadClassv_block_invoke;
    v52[3] = &unk_24C25CA98;
    v52[4] = &v53;
    ___ZL14getVKQuadClassv_block_invoke((uint64_t)v52);
    v24 = (void *)v54[3];
  }
  v25 = objc_retainAutorelease(v24);
  _Block_object_dispose(&v53, 8);
  v26 = (void *)objc_msgSend([v25 alloc], "initWithTopLeft:topRight:bottomLeft:bottomRight:", v50 + v7 * v51 + v48 * v5, v46 + v7 * v47 + v49 * v5, v34 + v19 * v35 + v38 * v17, v36 + v19 * v37 + v39 * v17, v40 + v15 * v41 + v44 * v13, v42 + v15 * v43 + v45 * v13, v28 + v23 * v29 + v32 * v21, v30 + v23 * v31 + v33 * v21);

  return v26;
}

void sub_209D324B8(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;

  _Block_object_dispose((const void *)(v2 - 128), 8);

  _Unwind_Resume(a1);
}

const void **applesauce::CF::ObjectRef<__CTFont const*>::~ObjectRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

const void **applesauce::CF::ObjectRef<CGPath *>::~ObjectRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

void sub_209D32658(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_209D329A8(_Unwind_Exception *a1)
{
  uint64_t v1;
  void *v2;

  CGBuf::~CGBuf((CGBuf *)(v1 + 392));

  _Unwind_Resume(a1);
}

void __copy_helper_block_ea8_32c10_ZTS5CGBuf(uint64_t a1, uint64_t a2)
{
  CGBuf::CGBuf((CGBuf *)(a1 + 32), (const CGBuf *)(a2 + 32));
}

void __destroy_helper_block_ea8_32c10_ZTS5CGBuf(uint64_t a1)
{
  CGBuf::~CGBuf((CGBuf *)(a1 + 32));
}

void divideQuadSideIntoSegments(void *a1, uint64_t a2, double *a3)
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  float64x2_t v13;
  float64x2_t v14;
  double *v15;
  double *v16;
  id v17;
  double v18;
  double v19;
  float64x2x2_t v20;
  float64x2x2_t v21;

  v5 = a1;
  if (a2 == 1)
  {
    v17 = v5;
    objc_msgSend(v5, "topRight");
    v18 = v12;
    v19 = v11;
    objc_msgSend(v17, "bottomRight");
    goto LABEL_5;
  }
  v19 = v8;
  v18 = v8;
  if (!a2)
  {
    v17 = v5;
    objc_msgSend(v5, "topLeft");
    v18 = v10;
    v19 = v9;
    objc_msgSend(v17, "bottomLeft");
LABEL_5:
    v5 = v17;
  }
  v13 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v18, 0);
  v14 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v19, 0);
  v21.val[0] = vmlaq_n_f64(v14, (float64x2_t)xmmword_209DC0410, v6 - v19);
  v21.val[1] = vmlaq_n_f64(v13, (float64x2_t)xmmword_209DC0410, v7 - v18);
  v15 = a3 + 2;
  vst2q_f64(v15, v21);
  *a3 = v19;
  a3[1] = v18;
  v20.val[0] = vmlaq_n_f64(v14, (float64x2_t)xmmword_209DC0420, v6 - v19);
  v20.val[1] = vmlaq_n_f64(v13, (float64x2_t)xmmword_209DC0420, v7 - v18);
  v16 = a3 + 6;
  vst2q_f64(v16, v20);
  a3[10] = v6;
  a3[11] = v7;

}

void sub_209D32B34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_209D32D8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, _QWORD *a20)
{
  void *v20;
  void *v21;

  std::__tree<std::__value_type<double,PDFAnnotation * {__strong}>,std::__map_value_compare<double,std::__value_type<double,PDFAnnotation * {__strong}>,std::less<double>,true>,std::allocator<std::__value_type<double,PDFAnnotation * {__strong}>>>::destroy((uint64_t)&a19, a20);
  _Unwind_Resume(a1);
}

void sub_209D333E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, void *a18)
{
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_209D33778(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_209D33838(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_209D33AFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
  void *v9;
  void *v10;

  _Unwind_Resume(a1);
}

void ___ZL23getVKImageAnalyzerClassv_block_invoke(uint64_t a1)
{
  VisionKitCoreLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("VKImageAnalyzer");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getVKImageAnalyzerClass(void)::softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    ___ZL23getVKImageAnalyzerClassv_block_invoke_cold_1();
    VisionKitCoreLibrary();
  }
}

void VisionKitCoreLibrary(void)
{
  void *v0;

  if (!VisionKitCoreLibraryCore(char **)::frameworkLibrary)
    VisionKitCoreLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
  if (!VisionKitCoreLibraryCore(char **)::frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class ___ZL30getVKImageAnalyzerRequestClassv_block_invoke(uint64_t a1)
{
  Class result;
  CGBuf *v3;
  const CGBuf *v4;

  VisionKitCoreLibrary();
  result = objc_getClass("VKImageAnalyzerRequest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getVKImageAnalyzerRequestClass(void)::softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (CGBuf *)___ZL30getVKImageAnalyzerRequestClassv_block_invoke_cold_1();
    return CGBuf::CGBuf(v3, v4);
  }
  return result;
}

void CGBuf::CGBuf(CGBuf *this, const CGBuf *a2)
{
  CGImageRef v4;
  uint64_t v5;
  unint64_t v6;
  CGColorSpace *v7;
  CGColorSpaceRef v8;
  uint64_t v9;
  uint64_t v10;

  v4 = *(CGImageRef *)a2;
  *(_QWORD *)this = *(_QWORD *)a2;
  if (v4)
  {
    v5 = atomic_load((unint64_t *)v4);
    if (v5 <= 0)
      CGBuf::CGBuf();
    do
      v6 = __ldaxr((unint64_t *)v4);
    while (__stlxr(v6 + 1, (unint64_t *)v4));
  }
  *((_QWORD *)this + 1) = CGImageRetain(*((CGImageRef *)a2 + 1));
  *((_QWORD *)this + 2) = CGContextRetain(*((CGContextRef *)a2 + 2));
  *(_OWORD *)((char *)this + 24) = *(_OWORD *)((char *)a2 + 24);
  v7 = (CGColorSpace *)*((_QWORD *)a2 + 6);
  *((_QWORD *)this + 5) = *((_QWORD *)a2 + 5);
  v8 = CGColorSpaceRetain(v7);
  v9 = *((_QWORD *)a2 + 7);
  *((_QWORD *)this + 6) = v8;
  *((_QWORD *)this + 7) = v9;
  if (v9)
  {
    *((_QWORD *)this + 7) = (char *)this + 64;
    v10 = *((unsigned __int8 *)a2 + 326);
    if ((*((_DWORD *)a2 + 80) & 0x1Fu) - 1 < 4)
      ++v10;
    memcpy((char *)this + 64, *((const void **)a2 + 7), 16 * v10);
  }
  *((_DWORD *)this + 80) = *((_DWORD *)a2 + 80);
  *((_DWORD *)this + 81) = *((_DWORD *)a2 + 81);
}

void CGBuf::~CGBuf(CGBuf *this)
{
  CGColorSpace *v2;
  unint64_t *v3;
  uint64_t v4;
  CGImage *v5;
  CGContext *v6;

  v2 = (CGColorSpace *)*((_QWORD *)this + 6);
  if (v2)
    CGColorSpaceRelease(v2);
  *((_QWORD *)this + 6) = 0;
  v3 = *(unint64_t **)this;
  if (*(_QWORD *)this)
  {
    do
      v4 = __ldaxr(v3);
    while (__stlxr(v4 - 1, v3));
    if (v4 <= 0)
    {
      _CGHandleAssert();
    }
    else if (v4 == 1)
    {
      CGBufferStorage::~CGBufferStorage((CGBufferStorage *)v3);
    }
  }
  *(_QWORD *)this = 0;
  v5 = (CGImage *)*((_QWORD *)this + 1);
  if (v5)
    CGImageRelease(v5);
  *((_QWORD *)this + 1) = 0;
  v6 = (CGContext *)*((_QWORD *)this + 2);
  if (v6)
    CGContextRelease(v6);
  *((_QWORD *)this + 2) = 0;
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void CGBufferStorage::~CGBufferStorage(CGBufferStorage *this)
{
  void (*v3)(_QWORD, _QWORD);
  void (*v4)(CGBufferStorage *, _QWORD);

  if (atomic_load((unint64_t *)this))
    _CGHandleAssert();
  v3 = (void (*)(_QWORD, _QWORD))*((_QWORD *)this + 9);
  if (v3)
    v3(*((_QWORD *)this + 10), *((_QWORD *)this + 2));
  v4 = (void (*)(CGBufferStorage *, _QWORD))*((_QWORD *)this + 8);
  if (v4)
    v4(this, *((_QWORD *)this + 6));
}

Class ___ZL14getVKQuadClassv_block_invoke(uint64_t a1)
{
  Class result;

  VisionKitCoreLibrary();
  result = objc_getClass("VKQuad");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    ___ZL14getVKQuadClassv_block_invoke_cold_1();
  getVKQuadClass(void)::softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void std::__tree<std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>,std::__map_value_compare<double,std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>,std::less<double>,true>,std::allocator<std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>,std::__map_value_compare<double,std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>,std::less<double>,true>,std::allocator<std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>,std::__map_value_compare<double,std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>,std::less<double>,true>,std::allocator<std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>>>::destroy(a1, a2[1]);
    std::__destroy_at[abi:ne180100]<std::pair<double const,applesauce::CF::ObjectRef<__CTFont const*>>,0>((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<double const,applesauce::CF::ObjectRef<__CTFont const*>>,0>(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 8);
  if (v1)
    CFRelease(v1);
}

uint64_t *std::__tree<std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>,std::__map_value_compare<double,std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>,std::less<double>,true>,std::allocator<std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>>>::__emplace_unique_key_args<double,double &,applesauce::CF::ObjectRef<__CTFont const*>&>(uint64_t **a1, double *a2, _QWORD *a3, CFTypeRef *a4)
{
  uint64_t *v7;
  uint64_t **v8;
  uint64_t **v9;
  uint64_t **v10;
  double v11;
  double v12;
  uint64_t *v13;
  _QWORD v15[2];
  char v16;

  v8 = a1 + 1;
  v7 = a1[1];
  v9 = a1 + 1;
  v10 = a1 + 1;
  if (v7)
  {
    v11 = *a2;
    while (1)
    {
      while (1)
      {
        v10 = (uint64_t **)v7;
        v12 = *((double *)v7 + 4);
        if (v11 >= v12)
          break;
        v7 = (uint64_t *)*v7;
        v9 = v10;
        if (!*v10)
          goto LABEL_9;
      }
      if (v12 >= v11)
        break;
      v7 = (uint64_t *)v7[1];
      if (!v7)
      {
        v9 = v10 + 1;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v13 = (uint64_t *)operator new(0x30uLL);
    v15[1] = v8;
    std::pair<double const,applesauce::CF::ObjectRef<__CTFont const*>>::pair[abi:ne180100]<double &,applesauce::CF::ObjectRef<__CTFont const*>&,0>(v13 + 4, a3, a4);
    v16 = 1;
    std::__tree<std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>,std::__map_value_compare<double,std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>,std::less<double>,true>,std::allocator<std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>>>::__insert_node_at(a1, (uint64_t)v10, v9, v13);
    v15[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>,void *>>>>::reset[abi:ne180100]((uint64_t)v15, 0);
    return v13;
  }
  return (uint64_t *)v10;
}

uint64_t *std::__tree<std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>,std::__map_value_compare<double,std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>,std::less<double>,true>,std::allocator<std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  uint64_t *v5;
  uint64_t *result;

  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

_QWORD *std::pair<double const,applesauce::CF::ObjectRef<__CTFont const*>>::pair[abi:ne180100]<double &,applesauce::CF::ObjectRef<__CTFont const*>&,0>(_QWORD *a1, _QWORD *a2, CFTypeRef *a3)
{
  CFTypeRef v4;

  *a1 = *a2;
  v4 = *a3;
  if (*a3)
    CFRetain(*a3);
  a1[1] = v4;
  return a1;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  _BYTE *v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t **v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      v2 = (uint64_t *)a2[2];
      if (*((_BYTE *)v2 + 24))
        return result;
      v3 = (uint64_t *)v2[2];
      v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), v5 = (_BYTE *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            v9 = (uint64_t **)a2[2];
          }
          else
          {
            v9 = (uint64_t **)v2[1];
            v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = v9;
            *v9 = v2;
            v2[2] = (uint64_t)v9;
            v3 = v9[2];
            v2 = (uint64_t *)*v3;
          }
          *((_BYTE *)v9 + 24) = 1;
          *((_BYTE *)v3 + 24) = 0;
          v13 = v2[1];
          *v3 = v13;
          if (v13)
            *(_QWORD *)(v13 + 16) = v3;
          v2[2] = v3[2];
          *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          v11 = a2[1];
          *v2 = v11;
          if (v11)
          {
            *(_QWORD *)(v11 + 16) = v2;
            v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((_BYTE *)a2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        v2 = (uint64_t *)v3[1];
        v12 = *v2;
        v3[1] = *v2;
        if (v12)
          *(_QWORD *)(v12 + 16) = v3;
        v2[2] = v3[2];
        *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
        *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((_BYTE *)v2 + 24) = 1;
      a2 = v3;
      *((_BYTE *)v3 + 24) = v3 == result;
      *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void std::unique_ptr<std::__tree_node<std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:ne180100]<std::pair<double const,applesauce::CF::ObjectRef<__CTFont const*>>,0>((uint64_t)v2 + 32);
    operator delete(v2);
  }
}

void std::__tree<std::__value_type<double,PDFAnnotation * {__strong}>,std::__map_value_compare<double,std::__value_type<double,PDFAnnotation * {__strong}>,std::less<double>,true>,std::allocator<std::__value_type<double,PDFAnnotation * {__strong}>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<double,PDFAnnotation * {__strong}>,std::__map_value_compare<double,std::__value_type<double,PDFAnnotation * {__strong}>,std::less<double>,true>,std::allocator<std::__value_type<double,PDFAnnotation * {__strong}>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<double,PDFAnnotation * {__strong}>,std::__map_value_compare<double,std::__value_type<double,PDFAnnotation * {__strong}>,std::less<double>,true>,std::allocator<std::__value_type<double,PDFAnnotation * {__strong}>>>::destroy(a1, a2[1]);

    operator delete(a2);
  }
}

uint64_t *std::__tree<std::__value_type<double,PDFAnnotation * {__strong}>,std::__map_value_compare<double,std::__value_type<double,PDFAnnotation * {__strong}>,std::less<double>,true>,std::allocator<std::__value_type<double,PDFAnnotation * {__strong}>>>::__emplace_unique_key_args<double,std::piecewise_construct_t const&,std::tuple<double const&>,std::tuple<>>(uint64_t **a1, double *a2, uint64_t a3, uint64_t **a4)
{
  uint64_t *v6;
  uint64_t **v7;
  double v8;
  uint64_t **v9;
  double v10;
  uint64_t *v11;

  v7 = a1 + 1;
  v6 = a1[1];
  if (v6)
  {
    v8 = *a2;
    while (1)
    {
      while (1)
      {
        v9 = (uint64_t **)v6;
        v10 = *((double *)v6 + 4);
        if (v8 >= v10)
          break;
        v6 = (uint64_t *)*v6;
        v7 = v9;
        if (!*v9)
          goto LABEL_10;
      }
      if (v10 >= v8)
        break;
      v6 = (uint64_t *)v6[1];
      if (!v6)
      {
        v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v9 = a1 + 1;
LABEL_10:
    v11 = (uint64_t *)operator new(0x30uLL);
    v11[4] = **a4;
    v11[5] = 0;
    std::__tree<std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>,std::__map_value_compare<double,std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>,std::less<double>,true>,std::allocator<std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>>>::__insert_node_at(a1, (uint64_t)v9, v7, v11);
    return v11;
  }
  return (uint64_t *)v9;
}

void sub_209D34A54(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_209D34B40(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_209D34D84(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_209D34E6C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_209D34F00(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_209D34F74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)PDFPageEvaluator;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_209D35078(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  std::unique_ptr<CGPDFScanner,std::function<void ()(CGPDFScanner*)>>::~unique_ptr[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_209D352E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209D3565C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t op_q(CGPDFScanner *a1, void *a2)
{
  return objc_msgSend(a2, "op_q:", a1);
}

uint64_t op_Q(CGPDFScanner *a1, void *a2)
{
  return objc_msgSend(a2, "op_Q:", a1);
}

uint64_t op_cm(CGPDFScanner *a1, void *a2)
{
  return objc_msgSend(a2, "op_cm:", a1);
}

uint64_t op_singlequote(CGPDFScanner *a1, void *a2)
{
  return objc_msgSend(a2, "op_singlequote:", a1);
}

uint64_t op_doublequote(CGPDFScanner *a1, void *a2)
{
  return objc_msgSend(a2, "op_doublequote:", a1);
}

uint64_t op_TJ(CGPDFScanner *a1, void *a2)
{
  return objc_msgSend(a2, "op_TJ:", a1);
}

uint64_t op_Tj(CGPDFScanner *a1, void *a2)
{
  return objc_msgSend(a2, "op_Tj:", a1);
}

uint64_t op_Do(CGPDFScanner *a1, void *a2)
{
  return objc_msgSend(a2, "op_Do:", a1);
}

BOOL std::type_info::operator==[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a2 + 8);
  if (v2 == v3)
    return 1;
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3))
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  return 0;
}

uint64_t std::__function::__value_func<void ()(CGPDFScanner *)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  uint64_t v4;

  v3 = (_QWORD *)(a2 + 24);
  v4 = *(_QWORD *)(a2 + 24);
  if (v4)
  {
    if (v4 == a2)
    {
      *(_QWORD *)(a1 + 24) = a1;
      (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)*v3 + 24))(*v3, a1);
      return a1;
    }
    *(_QWORD *)(a1 + 24) = v4;
  }
  else
  {
    v3 = (_QWORD *)(a1 + 24);
  }
  *v3 = 0;
  return a1;
}

uint64_t *std::unique_ptr<CGPDFScanner,std::function<void ()(CGPDFScanner*)>>::~unique_ptr[abi:ne180100](uint64_t *a1)
{
  uint64_t *v2;
  uint64_t v3;

  std::unique_ptr<CGPDFScanner,std::function<void ()(CGPDFScanner*)>>::reset[abi:ne180100](a1, 0);
  v2 = (uint64_t *)a1[4];
  if (v2 == a1 + 1)
  {
    v3 = 4;
    v2 = a1 + 1;
    goto LABEL_5;
  }
  if (v2)
  {
    v3 = 5;
LABEL_5:
    (*(void (**)(void))(*v2 + 8 * v3))();
  }
  return a1;
}

uint64_t *std::unique_ptr<CGPDFScanner,std::function<void ()(CGPDFScanner*)>>::reset[abi:ne180100](uint64_t *result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *result;
  *result = a2;
  if (v2)
  {
    v4 = v2;
    v3 = result[4];
    if (!v3)
      std::__throw_bad_function_call[abi:ne180100]();
    return (uint64_t *)(*(uint64_t (**)(uint64_t, uint64_t *))(*(_QWORD *)v3 + 48))(v3, &v4);
  }
  return result;
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);
  JUMPOUT(0x20BD1AAACLL);
}

void sub_209D36DF0(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_209D37178(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_209D37628(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209D37B2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209D38004(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209D38658(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_209D38CD8(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_209D38F88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209D3916C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209D39BC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209D39DA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209D3A1F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a39, 8);
  _Unwind_Resume(a1);
}

void sub_209D3A930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
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

void sub_209D3B7AC()
{
  objc_end_catch();
  JUMPOUT(0x209D3B7B4);
}

void sub_209D3C140(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a39, 8);
  _Unwind_Resume(a1);
}

void sub_209D3DFF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location, id a20)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a20);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void __getIOSurfaceContextOptions_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BDBF358];
  v3[0] = &unk_24C27D778;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, &v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)getIOSurfaceContextOptions_options;
  getIOSurfaceContextOptions_options = v0;

}

void sub_209D45960(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t PDFPageLayerTileRectFromPoints(__n128 a1, __n128 a2, double a3, double a4)
{
  float v4;
  float v5;
  uint64_t result;

  v4 = a3 - a1.n128_f64[0];
  if (v4 >= 0.0)
  {
    v5 = a4 - a2.n128_f64[0];
    if (v5 >= 0.0)
      return PDFRectMake(a1, a2, v4, v5);
  }
  return result;
}

void sub_209D4D4A0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_209D51A00(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_209D51B38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_209D535A8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_209D536B4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_209D54FC4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_209D5649C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a71;

  _Block_object_dispose(&a71, 8);
  _Unwind_Resume(a1);
}

Class __getAFInsertionManagerClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!AutoFillCoreLibraryCore_frameworkLibrary)
  {
    AutoFillCoreLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!AutoFillCoreLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_6:
      __getAFInsertionManagerClass_block_invoke_cold_1();
    }
  }
  result = objc_getClass("AFInsertionManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_6;
  getAFInsertionManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id _dictionaryForPDFDictionary(CGPDFDictionary *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  v7[0] = CFSTR("resultDict");
  v7[1] = CFSTR("visitedSet");
  v8[0] = v4;
  v8[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  CGPDFDictionaryApplyFunction(a1, (CGPDFDictionaryApplierFunction)_iterateDictionaryValueCallback, v5);
  return v4;
}

void _iterateDictionaryValueCallback(uint64_t a1, CGPDFObject *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("resultDict"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("visitedSet"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", a1, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _objectForCGPDFObjectRefAndVisitedSet(a2, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v7);

  }
}

id _objectForCGPDFObjectRefAndVisitedSet(CGPDFObject *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  CGPDFArray *v9;
  id v10;
  size_t Count;
  size_t i;
  void *v13;
  void *v14;
  CGPDFArray *v16;
  CGPDFObjectRef value;

  v3 = a2;
  v4 = v3;
  v5 = 0;
  if (a1 && v3)
  {
    objc_msgSend(v3, "objectForKey:", a1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
LABEL_4:
      v5 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v7, a1);

      switch(CGPDFObjectGetType(a1))
      {
        case kCGPDFObjectTypeBoolean:
          LOBYTE(value) = 0;
          CGPDFObjectGetValue(a1, kCGPDFObjectTypeBoolean, &value);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", value);
          v8 = objc_claimAutoreleasedReturnValue();
          goto LABEL_19;
        case kCGPDFObjectTypeInteger:
          value = 0;
          CGPDFObjectGetValue(a1, kCGPDFObjectTypeInteger, &value);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", value);
          v8 = objc_claimAutoreleasedReturnValue();
          goto LABEL_19;
        case kCGPDFObjectTypeReal:
          value = 0;
          CGPDFObjectGetValue(a1, kCGPDFObjectTypeReal, &value);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)&value);
          v8 = objc_claimAutoreleasedReturnValue();
          goto LABEL_19;
        case kCGPDFObjectTypeName:
          value = 0;
          CGPDFObjectGetValue(a1, kCGPDFObjectTypeName, &value);
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", value, 4);
          v8 = objc_claimAutoreleasedReturnValue();
          goto LABEL_19;
        case kCGPDFObjectTypeString:
          value = 0;
          CGPDFObjectGetValue(a1, kCGPDFObjectTypeString, &value);
          v8 = (uint64_t)CGPDFStringCopyTextString(value);
          goto LABEL_19;
        case kCGPDFObjectTypeArray:
          v16 = 0;
          CGPDFObjectGetValue(a1, kCGPDFObjectTypeArray, &v16);
          v9 = v16;
          v10 = v4;
          Count = CGPDFArrayGetCount(v9);
          v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", Count);
          if (Count)
          {
            for (i = 0; i != Count; ++i)
            {
              value = 0;
              CGPDFArrayGetObject(v9, i, &value);
              _objectForCGPDFObjectRefAndVisitedSet(value, v10);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              if (v13)
              {
                objc_msgSend(v5, "setObject:atIndexedSubscript:", v13, i);
              }
              else
              {
                objc_msgSend(MEMORY[0x24BDBCEF8], "null");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "setObject:atIndexedSubscript:", v14, i);

              }
            }
          }

          break;
        case kCGPDFObjectTypeDictionary:
          value = 0;
          CGPDFObjectGetValue(a1, kCGPDFObjectTypeDictionary, &value);
          _dictionaryForPDFDictionary(value, v4);
          v8 = objc_claimAutoreleasedReturnValue();
LABEL_19:
          v5 = (void *)v8;
          break;
        default:
          goto LABEL_4;
      }
    }
  }

  return v5;
}

void sub_209D5B908(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_209D5B98C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_209D5BB1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209D5BC44(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_209D5BE28(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_209D5BF30(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_209D5C074(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_209D5C7FC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_209D5C934(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_209D5CDD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_209D5CFDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_209D5D8D0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 120));
  _Unwind_Resume(a1);
}

void highlightPath(CGContext *a1, float64x2_t *a2, float64x2_t *a3, float64x2_t *a4, float64x2_t *a5)
{
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;

  v5 = vsubq_f64(*a4, *a2);
  v6 = (float64x2_t)vdupq_n_s64(0x3FB999999999999AuLL);
  *a2 = vmlaq_f64(*a2, v6, v5);
  *a4 = vmlsq_f64(*a4, v6, v5);
  *a3 = vmlaq_f64(*a3, v6, v5);
  v7 = vmlsq_f64(*a5, v6, v5);
  *a5 = v7;
  v9 = a2->f64[0];
  v8 = a2->f64[1];
  v10 = a3->f64[1];
  v11 = a3->f64[0] - a2->f64[0];
  v12 = v10 - v8;
  v13 = sqrt(v12 * v12 + v11 * v11);
  if (v13 != 0.0)
  {
    v19 = a4->f64[1];
    v20 = sqrt((v8 - v19) * (v8 - v19) + (v9 - a4->f64[0]) * (v9 - a4->f64[0])) / (v13 * 4.0);
    v21 = (v9 + a4->f64[0]) * 0.5;
    v22 = (v8 + v19) * 0.5;
    v29 = v21;
    v30 = v22;
    v23 = (v7.f64[0] + a3->f64[0]) * 0.5;
    v24 = (v7.f64[1] + v10) * 0.5;
    CGContextMoveToPoint(a1, v21, v22);
    CGContextAddCurveToPoint(a1, (v21 + a2->f64[0]) * 0.5, (v22 + a2->f64[1]) * 0.5, (a2->f64[0] + a2->f64[0] + v20 * v11) * 0.5, (a2->f64[1] + a2->f64[1] + v20 * v12) * 0.5, a2->f64[0] + v20 * v11, a2->f64[1] + v20 * v12);
    v25 = a3->f64[0] - v20 * v11;
    v26 = a3->f64[1] - v20 * v12;
    CGContextAddLineToPoint(a1, v25, v26);
    CGContextAddCurveToPoint(a1, (v25 + a3->f64[0]) * 0.5, (v26 + a3->f64[1]) * 0.5, (v23 + a3->f64[0]) * 0.5, (v24 + a3->f64[1]) * 0.5, v23, v24);
    CGContextAddCurveToPoint(a1, (v23 + a5->f64[0]) * 0.5, (v24 + a5->f64[1]) * 0.5, (a5->f64[0] + a5->f64[0] - v20 * v11) * 0.5, (a5->f64[1] + a5->f64[1] - v20 * v12) * 0.5, a5->f64[0] - v20 * v11, a5->f64[1] - v20 * v12);
    v27 = a4->f64[0] + v20 * v11;
    v28 = a4->f64[1] + v20 * v12;
    CGContextAddLineToPoint(a1, v27, v28);
    CGContextAddCurveToPoint(a1, (v27 + a4->f64[0]) * 0.5, (v28 + a4->f64[1]) * 0.5, (v29 + a4->f64[0]) * 0.5, (v30 + a4->f64[1]) * 0.5, v29, v30);
  }
}

void strikeOutPath(CGContext *a1, double *a2, double *a3, double *a4, double *a5)
{
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  double v11;

  v6 = a2[1];
  v7 = a4[1];
  v8 = sqrt((v6 - v7) * (v6 - v7) + (*a2 - *a4) * (*a2 - *a4));
  v9 = (*a3 + *a5) * 0.5;
  v10 = (a3[1] + a5[1]) * 0.5;
  CGContextMoveToPoint(a1, (*a2 + *a4) * 0.5, (v6 + v7) * 0.5);
  CGContextAddLineToPoint(a1, v9, v10);
  v11 = v8 * 0.08;
  if (v8 * 0.08 < 1.0)
    v11 = 1.0;
  CGContextSetLineWidth(a1, v11);
}

void underlinePath(CGContext *a1, double *a2, CGFloat *a3, CGFloat *a4)
{
  double v7;
  double v8;

  v7 = sqrt((a2[1] - a3[1]) * (a2[1] - a3[1]) + (*a2 - *a3) * (*a2 - *a3)) * 0.08;
  if (v7 >= 1.0)
    v8 = v7;
  else
    v8 = 1.0;
  CGContextSetLineWidth(a1, v8);
  CGContextMoveToPoint(a1, *a3, a3[1] + v8);
  CGContextAddLineToPoint(a1, *a4, a4[1] + v8);
}

void redactPath(CGContext *a1, CGFloat *a2, double *a3, double *a4, double *a5, double a6)
{
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
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  __int128 v36;
  double v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat a;
  CGFloat v41;
  CGFloat d;
  double v43;
  CGFloat v44;
  CGFloat ty;
  CGFloat v46;
  double v47;
  double v48;
  CGPath *Mutable;
  int v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  void *v63;
  id v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  CGFloat v73;
  double tx;
  double v75;
  double v76;
  __int128 v77;
  double c;
  double v79;
  __int128 v80;
  double v81;
  double v82;
  double b;
  __int128 v84;
  double v85;
  double v86;
  double v87;
  double v88;
  CGAffineTransform v89;
  CGAffineTransform v90;
  CGAffineTransform v91;
  CGAffineTransform v92;
  CGAffineTransform v93;
  CGAffineTransform v94;

  CGContextSaveGState(a1);
  v12 = *a2;
  v13 = *a3;
  v14 = *a4;
  v15 = *a5;
  if (*a4 >= *a5)
    v16 = *a5;
  else
    v16 = *a4;
  if (v13 >= v16)
  {
    if (v12 < v16)
      v16 = *a2;
  }
  else
  {
    v16 = *a2;
    if (v12 >= v13)
      v16 = *a3;
  }
  v17 = a2[1];
  v18 = a3[1];
  v19 = a4[1];
  v20 = a5[1];
  if (v19 >= v20)
    v21 = a5[1];
  else
    v21 = a4[1];
  if (v18 >= v21)
  {
    if (v17 >= v21)
      v22 = v21;
    else
      v22 = a2[1];
  }
  else
  {
    v22 = a2[1];
    if (v17 >= v18)
      v22 = a3[1];
  }
  if (v14 <= v15)
    v23 = *a5;
  else
    v23 = *a4;
  if (v12 <= v23)
    v24 = v23;
  else
    v24 = *a2;
  if (v12 <= v13)
    v25 = *a3;
  else
    v25 = *a2;
  if (v13 > v23)
    v26 = v25;
  else
    v26 = v24;
  if (v19 <= v20)
    v27 = a5[1];
  else
    v27 = a4[1];
  if (v17 <= v27)
    v28 = v27;
  else
    v28 = a2[1];
  if (v17 <= v18)
    v29 = a3[1];
  else
    v29 = a2[1];
  if (v18 > v27)
    v30 = v29;
  else
    v30 = v28;
  v31 = sqrt((v20 - v19) * (v20 - v19) + (v15 - v14) * (v15 - v14));
  if (v31 != 0.0)
  {
    v86 = *a2;
    v75 = a6;
    v32 = (v16 + v26) * 0.5;
    v33 = (v22 + v30) * 0.5;
    v34 = asin((v27 - v21) / v31);
    if (v19 > v17)
    {
      v34 = PDFDegToRad(180.0) - v34;
      v20 = a5[1];
      v19 = a4[1];
      v86 = *a2;
    }
    if (v20 <= v19)
      v35 = v34;
    else
      v35 = -v34;
    v36 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    v84 = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)&v93.a = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)&v93.c = v36;
    v80 = v36;
    v77 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    *(_OWORD *)&v93.tx = v77;
    CGAffineTransformTranslate(&v94, &v93, v32, v33);
    v37 = v33;
    v38 = v35;
    v73 = v35;
    v93 = v94;
    CGAffineTransformRotate(&v94, &v93, -v35);
    a = v94.a;
    b = v94.b;
    v39 = v94.b;
    d = v94.d;
    c = v94.c;
    v41 = v94.c;
    v43 = v32;
    v44 = v94.tx;
    ty = v94.ty;
    memset(&v94, 0, sizeof(v94));
    v93.a = a;
    v93.b = v39;
    v46 = a;
    v76 = a;
    v93.c = v41;
    v93.d = d;
    v93.tx = v44;
    v93.ty = ty;
    CGAffineTransformTranslate(&v94, &v93, -0.8, 0.8);
    v92 = v94;
    CGAffineTransformRotate(&v93, &v92, v38);
    v94 = v93;
    v47 = -v43;
    v82 = v44;
    v48 = -v37;
    v92 = v93;
    CGAffineTransformTranslate(&v93, &v92, -v43, v48);
    v94 = v93;
    *(float64x2_t *)a2 = vaddq_f64(*(float64x2_t *)&v93.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v93.c, a2[1]), *(float64x2_t *)&v93.a, v86));
    memset(&v93, 0, sizeof(v93));
    v92.a = v46;
    v92.b = b;
    v92.c = c;
    v92.d = d;
    v92.tx = v44;
    v92.ty = ty;
    CGAffineTransformTranslate(&v93, &v92, 0.8, 0.8);
    v91 = v93;
    CGAffineTransformRotate(&v92, &v91, v73);
    v93 = v92;
    v91 = v92;
    CGAffineTransformTranslate(&v92, &v91, -v43, v48);
    v93 = v92;
    *(float64x2_t *)a3 = vaddq_f64(*(float64x2_t *)&v92.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v92.c, a3[1]), *(float64x2_t *)&v92.a, *a3));
    memset(&v92, 0, sizeof(v92));
    v91.a = v76;
    v91.b = b;
    v91.c = c;
    v91.d = d;
    v91.tx = v44;
    v91.ty = ty;
    CGAffineTransformTranslate(&v92, &v91, -0.8, -0.8);
    v90 = v92;
    CGAffineTransformRotate(&v91, &v90, v73);
    v92 = v91;
    v90 = v91;
    CGAffineTransformTranslate(&v91, &v90, -v43, v48);
    v92 = v91;
    *(float64x2_t *)a4 = vaddq_f64(*(float64x2_t *)&v91.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v91.c, a4[1]), *(float64x2_t *)&v91.a, *a4));
    memset(&v91, 0, sizeof(v91));
    v90.a = v76;
    v90.b = b;
    v90.c = c;
    v90.d = d;
    v71 = d;
    v72 = ty;
    v90.tx = v44;
    v90.ty = ty;
    CGAffineTransformTranslate(&v91, &v90, 0.8, -0.8);
    v89 = v91;
    CGAffineTransformRotate(&v90, &v89, v73);
    v91 = v90;
    v89 = v90;
    CGAffineTransformTranslate(&v90, &v89, -v43, v48);
    v91 = v90;
    *(float64x2_t *)a5 = vaddq_f64(*(float64x2_t *)&v90.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v90.c, a5[1]), *(float64x2_t *)&v90.a, *a5));
    Mutable = CGPathCreateMutable();
    CGPathMoveToPoint(Mutable, 0, *a2, a2[1]);
    CGPathAddLineToPoint(Mutable, 0, *a3, a3[1]);
    CGPathAddLineToPoint(Mutable, 0, *a5, a5[1]);
    CGPathAddLineToPoint(Mutable, 0, *a4, a4[1]);
    CGPathAddLineToPoint(Mutable, 0, *a2, a2[1]);
    CGPathCloseSubpath(Mutable);
    v50 = GetDefaultsWriteHighlightRedactions();
    CGContextAddPath(a1, Mutable);
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v51;
    if (v50)
    {
      v53 = objc_retainAutorelease(v51);
      CGContextSetStrokeColorWithColor(a1, (CGColorRef)objc_msgSend(v53, "CGColor"));

      CGContextStrokePath(a1);
      CGPathRelease(Mutable);
    }
    else
    {
      objc_msgSend(v51, "colorWithAlphaComponent:", v75);
      v54 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      CGContextSetFillColorWithColor(a1, (CGColorRef)objc_msgSend(v54, "CGColor"));

      CGContextFillPath(a1);
      CGContextAddPath(a1, Mutable);
      CGContextClip(a1);
      CGPathRelease(Mutable);
      *(_OWORD *)&v89.a = v84;
      *(_OWORD *)&v89.c = v80;
      *(_OWORD *)&v89.tx = v77;
      CGAffineTransformRotate(&v90, &v89, v73);
      v92 = v90;
      v89 = v90;
      CGAffineTransformTranslate(&v90, &v89, v47, v48);
      v92 = v90;
      v69 = v90.d;
      v70 = v90.b;
      v68 = v90.ty;
      tx = a4[1];
      v87 = *a4;
      v55 = v90.tx + tx * v90.c + v90.a * *a4;
      *(_OWORD *)&v89.a = v84;
      *(_OWORD *)&v89.c = v80;
      *(_OWORD *)&v89.tx = v77;
      CGAffineTransformRotate(&v90, &v89, v73);
      v91 = v90;
      v89 = v90;
      CGAffineTransformTranslate(&v90, &v89, v47, v48);
      v91 = v90;
      v57 = *a5;
      v56 = a5[1];
      v66 = v90.d;
      v67 = v90.b;
      v65 = v90.ty;
      v58 = v90.tx + v56 * v90.c + v90.a * *a5;
      *(_OWORD *)&v89.a = v84;
      *(_OWORD *)&v89.c = v80;
      *(_OWORD *)&v89.tx = v77;
      CGAffineTransformRotate(&v90, &v89, v73);
      v93 = v90;
      v89 = v90;
      CGAffineTransformTranslate(&v90, &v89, v47, v48);
      v93 = v90;
      if (v55 < v58)
      {
        v59 = v68 + tx * v69 + v70 * v87;
        v88 = c * v59;
        v85 = v71 * v59;
        v81 = v93.ty + a3[1] * v93.d + v93.b * *a3 - (v65 + v56 * v66 + v67 * v57);
        v60 = v59 + v81;
        v79 = c * v60;
        v61 = v71 * v60;
        do
        {
          CGContextMoveToPoint(a1, v82 + v88 + v76 * v55, v72 + v85 + b * v55);
          v62 = v81 + v55;
          CGContextAddLineToPoint(a1, v82 + v79 + v76 * v62, v72 + v61 + b * v62);
          CGContextMoveToPoint(a1, v82 + v79 + v76 * v55, v72 + v61 + b * v55);
          CGContextAddLineToPoint(a1, v82 + v88 + v76 * v62, v72 + v85 + b * v62);
          v55 = v81 + v55;
        }
        while (v62 < v58);
      }
      objc_msgSend(MEMORY[0x24BDF6950], "darkGrayColor", *(_QWORD *)&v65, *(_QWORD *)&v66, *(_QWORD *)&v67);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "colorWithAlphaComponent:", v75);
      v64 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      CGContextSetStrokeColorWithColor(a1, (CGColorRef)objc_msgSend(v64, "CGColor"));

      CGContextSetLineWidth(a1, 1.0);
      CGContextStrokePath(a1);
      CGContextRestoreGState(a1);
    }
  }
}

id PDFMarkupMenuColorForMenuIcon(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  if (PDFMarkupMenuColorForMenuIcon_onceToken != -1)
    dispatch_once(&PDFMarkupMenuColorForMenuIcon_onceToken, &__block_literal_global_8);
  v2 = (void *)PDFMarkupMenuColorForMenuIcon_colors;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id PDFMarkupMenuString(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  if (PDFMarkupMenuString_onceToken != -1)
    dispatch_once(&PDFMarkupMenuString_onceToken, &__block_literal_global_14);
  v2 = (void *)PDFMarkupMenuString_menuIconStrings;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t PDFMarkupMenuColorMenuIconForMarkupStyle(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 6)
    return 1;
  else
    return (a1 + 1);
}

void sub_209D6901C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location,id a22)
{
  uint64_t v22;

  objc_destroyWeak(&location);
  objc_destroyWeak(&a22);
  objc_destroyWeak((id *)(v22 - 96));
  objc_destroyWeak((id *)(v22 - 88));
  _Unwind_Resume(a1);
}

void sub_209D699F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id RVItemClass()
{
  if (loadReveal_onceToken != -1)
    dispatch_once(&loadReveal_onceToken, &__block_literal_global_10);
  return (id)kRVItemClass;
}

id DDParsecCollectionViewControllerClass()
{
  if (loadReveal_onceToken != -1)
    dispatch_once(&loadReveal_onceToken, &__block_literal_global_10);
  return (id)kDDParsecCollectionViewControllerClass;
}

void *__loadReveal_block_invoke()
{
  void *result;

  if (dlopen("/System/Library/PrivateFrameworks/RevealCore.framework/RevealCore", 1))
  {
    kRVItemClass = (uint64_t)NSClassFromString(CFSTR("RVItem"));
    kRVDocumentContextClass = (uint64_t)NSClassFromString(CFSTR("RVDocumentContext"));
  }
  result = dlopen("/System/Library/PrivateFrameworks/DataDetectorsUI.framework/DataDetectorsUI", 1);
  if (result)
  {
    result = NSClassFromString(CFSTR("DDParsecCollectionViewController"));
    kDDParsecCollectionViewControllerClass = (uint64_t)result;
  }
  return result;
}

void sub_209D72B44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209D72FAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_209D732D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209D75840(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209D75978(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_209D75DDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location)
{
  id *v9;
  id *v10;
  uint64_t v11;

  objc_destroyWeak(v10);
  objc_destroyWeak(v9);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v11 - 112));
  _Unwind_Resume(a1);
}

void sub_209D75F14(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_209D763A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void _PDFLog(os_log_type_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (_PDFLog_onceToken != -1)
    dispatch_once(&_PDFLog_onceToken, &__block_literal_global_12);
  v12 = objc_alloc(MEMORY[0x24BDD17C8]);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", a3);
  v14 = (void *)objc_msgSend(v12, "initWithFormat:arguments:", v13, &a9);

  if (v14)
  {
    v15 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, a1))
    {
      *(_DWORD *)buf = 136446466;
      v17 = a2;
      v18 = 2114;
      v19 = v14;
      _os_log_impl(&dword_209D11000, v15, a1, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }

}

void UpdateRectTransformDictionary(void *a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, uint64_t);
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  __int128 v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  void (**v32)(id, _QWORD);
  id obj;
  _QWORD v34[5];
  _QWORD v35[4];
  id v36;
  CGAffineTransform v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;
  CGRect v49;
  CGRect v50;

  v48 = *MEMORY[0x24BDAC8D0];
  v8 = a1;
  v9 = a2;
  v32 = a4;
  v10 = a5;
  v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  objc_msgSend(v8, "allKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v43 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKey:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKey:", v18, v17);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    }
    while (v14);
  }

  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v9;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v39;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v39 != v21)
          objc_enumerationMutation(obj);
        v23 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j);
        v49 = *(CGRect *)(v23 + 16);
        v24 = *(_OWORD *)(v23 + 64);
        *(_OWORD *)&v37.a = *(_OWORD *)(v23 + 48);
        *(_OWORD *)&v37.c = v24;
        *(_OWORD *)&v37.tx = *(_OWORD *)(v23 + 80);
        v50 = CGRectApplyAffineTransform(v49, &v37);
        objc_msgSend(MEMORY[0x24BDD1968], "PDFKitValueWithPDFRect:", PDFRectFromCGRect(v50.origin.x, v50.origin.y, v50.size.width, v50.size.height));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v25);
        v26 = objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          v27 = (void *)v26;
          if (v10)
            v10[2](v10, v23, v26);
          objc_msgSend(v11, "removeObjectForKey:", v25);
        }
        else
        {
          v32[2](v32, v23);
          v28 = objc_claimAutoreleasedReturnValue();
          if (!v28)
            goto LABEL_20;
          v27 = (void *)v28;
          objc_msgSend(v8, "setObject:forKey:", v28, v25);
        }

LABEL_20:
      }
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v20);
  }

  v29 = MEMORY[0x24BDAC760];
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __UpdateRectTransformDictionary_block_invoke;
  v35[3] = &unk_24C25D910;
  v30 = v8;
  v36 = v30;
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v35);
  objc_msgSend(v11, "removeAllObjects");
  if (a3)
  {
    v34[0] = v29;
    v34[1] = 3221225472;
    v34[2] = __UpdateRectTransformDictionary_block_invoke_2;
    v34[3] = &__block_descriptor_40_e33_v32__0__NSValue_8__CALayer_16_B24l;
    v34[4] = a3;
    objc_msgSend(v30, "enumerateKeysAndObjectsUsingBlock:", v34);
  }

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

void sub_209D7A40C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t get_number(CGPDFArray *a1, size_t a2, CGPDFReal *a3)
{
  CGPDFReal value;

  value = 0.0;
  if (CGPDFArrayGetNumber(a1, a2, &value))
  {
    *a3 = value;
  }
  else
  {
    if (!CGPDFArrayGetNull(a1, a2) && CGPDFArrayGetCount(a1) > a2)
    {
      NSLog(CFSTR("Missing or invalid destination coordinate."));
      return 0;
    }
    *a3 = 3.40282347e38;
  }
  return 1;
}

void sub_209D7DF1C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_209D7E1EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,const void *a24)
{
  void *v24;
  void *v25;

  if (__p)
    operator delete(__p);

  if (a20)
    operator delete(a20);
  applesauce::CF::ObjectRef<CGDisplayList *>::~ObjectRef(&a24);

  _Unwind_Resume(a1);
}

void sub_209D7E7E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,const void *a30,const void *a31)
{
  applesauce::CF::ObjectRef<__CFData const*>::~ObjectRef(&a30);
  applesauce::CF::ObjectRef<__CFData const*>::~ObjectRef(&a31);
  _Unwind_Resume(a1);
}

const void **applesauce::CF::ObjectRef<__CFData const*>::~ObjectRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

_QWORD *__copy_helper_block_ea8_64c62_ZTSNSt3__16vectorIPK18CGDisplayListEntryNS_9allocatorIS3_EEEE(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 72) = 0;
  v2 = (_QWORD *)(a1 + 64);
  v2[2] = 0;
  return std::vector<CGDisplayListEntry const*>::__init_with_size[abi:ne180100]<CGDisplayListEntry const**,CGDisplayListEntry const**>(v2, *(const void **)(a2 + 64), *(_QWORD *)(a2 + 72), (uint64_t)(*(_QWORD *)(a2 + 72) - *(_QWORD *)(a2 + 64)) >> 3);
}

void __destroy_helper_block_ea8_64c62_ZTSNSt3__16vectorIPK18CGDisplayListEntryNS_9allocatorIS3_EEEE(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 64);
  if (v2)
  {
    *(_QWORD *)(a1 + 72) = v2;
    operator delete(v2);
  }
}

PDFDetectedFormRow *PDFDetectedFormRow::mergeFields(PDFDetectedFormRow *this)
{
  unint64_t v1;
  char *v2;
  id *v3;
  PDFDetectedFormRow *v5;
  unint64_t v6;
  id *v7;
  id *v8;
  id *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  id *v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  double x;
  double y;
  double width;
  double height;
  double v27;
  double v28;
  char v29;
  uint64_t v30;
  id *v31;
  id *v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  v3 = (id *)*((_QWORD *)this + 1);
  v1 = *((_QWORD *)this + 2);
  v2 = (char *)this + 8;
  if (v1 - (unint64_t)v3 >= 0x10 && (unint64_t)(v3 + 1) < v1)
  {
    v5 = this;
    v6 = 1;
    do
    {
      if ((unint64_t)(v3 + 1) < v1)
      {
        v7 = v3 + 1;
        v8 = v3;
        while (1)
        {
          v9 = v7;
          this = (PDFDetectedFormRow *)objc_msgSend(*v8, "canBeMergedWith:", v8[1]);
          if (!(_DWORD)this)
            break;
          ++v6;
          v7 = v9 + 1;
          v8 = v9;
          if ((unint64_t)(v9 + 1) >= *((_QWORD *)v5 + 2))
          {
            v8 = v9;
            break;
          }
        }
        if (v6 < 2)
        {
          v3 = v8;
        }
        else
        {
          objc_msgSend(*v3, "rect");
          v11 = v10;
          v13 = v12;
          v15 = v14;
          v17 = v16;
          v18 = &v3[v6 - 1];
          objc_msgSend(*v18, "rect");
          v37.origin.x = v19;
          v37.origin.y = v20;
          v37.size.width = v21;
          v37.size.height = v22;
          v33.origin.x = v11;
          v33.origin.y = v13;
          v33.size.width = v15;
          v33.size.height = v17;
          v34 = CGRectUnion(v33, v37);
          x = v34.origin.x;
          y = v34.origin.y;
          width = v34.size.width;
          height = v34.size.height;
          v27 = CGRectGetWidth(v34);
          v35.origin.x = x;
          v35.origin.y = y;
          v35.size.width = width;
          v35.size.height = height;
          if (CGRectGetHeight(v35) <= 0.0)
          {
            std::vector<PDFDetectedFormField * {__strong}>::erase((uint64_t)v2, v3 + 1, &v3[v6]);
            this = (PDFDetectedFormRow *)objc_msgSend(*v3, "setRect:", x, y, width, height);
          }
          else
          {
            v28 = v27 / (double)v6;
            if (v18 >= v3)
            {
              v29 = 0;
              v30 = 8 * v6 - 8;
              v31 = v3;
              while (1)
              {
                objc_msgSend(*v31, "rect");
                if (vabdd_f64(v28, CGRectGetWidth(v36)) > 0.5)
                  break;
                if (!v30)
                  v29 = 1;
                ++v31;
                v30 -= 8;
                if (v18 < v31)
                  goto LABEL_22;
              }
            }
            v29 = 0;
LABEL_22:
            std::vector<PDFDetectedFormField * {__strong}>::erase((uint64_t)v2, v3 + 1, &v3[v6]);
            this = (PDFDetectedFormRow *)objc_msgSend(*v3, "setRect:", x, y, width, height);
            if ((v29 & 1) != 0)
            {
              objc_msgSend(*v3, "setKind:", 3);
              objc_msgSend(*v3, "setNumberOfSegments:", v6);
              this = (PDFDetectedFormRow *)objc_msgSend(*v3, "setSegmentWidth:", v28);
            }
          }
          v6 = 1;
        }
      }
      v32 = v3 + 2;
      ++v3;
      v1 = *((_QWORD *)v5 + 2);
    }
    while ((unint64_t)v32 < v1);
  }
  return this;
}

void sub_209D7EC28(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id *PDFDetectedFormRow::fieldNearestXCoordinate(PDFDetectedFormRow *this, double a2)
{
  id *v2;
  id *v3;
  unint64_t v6;
  void **v7;
  id *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v2 = (id *)*((_QWORD *)this + 1);
  v3 = (id *)*((_QWORD *)this + 2);
  if (v3 != v2)
  {
    v6 = v3 - v2;
    v3 = (id *)*((_QWORD *)this + 1);
    do
    {
      v7 = &v3[v6 >> 1];
      v9 = *v7;
      v8 = v7 + 1;
      objc_msgSend(v9, "minX");
      if (v10 >= a2)
        v6 >>= 1;
      else
        v6 += ~(v6 >> 1);
      if (v10 < a2)
        v3 = v8;
    }
    while (v6);
    if (v3 == *((id **)this + 2))
    {
      --v3;
    }
    else if (v3 != *((id **)this + 1))
    {
      objc_msgSend(*v3, "minX");
      v12 = vabdd_f64(a2, v11);
      objc_msgSend(*(v3 - 1), "minX");
      if (v12 >= vabdd_f64(a2, v13))
        --v3;
    }
  }
  return v3;
}

void sub_209D7EE6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  std::vector<PDFDetectedFormField * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

_QWORD *std::vector<PDFDetectedFormRow>::insert(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v4;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  void *v17;
  char *v18;
  char *v19;
  char *v20;
  uint64_t v21;

  v4 = (_QWORD *)a2;
  v7 = *a1;
  v6 = a1[1];
  v8 = (a2 - *a1) >> 5;
  v11 = a1[2];
  v9 = (uint64_t)(a1 + 2);
  v10 = v11;
  if (v6 >= v11)
  {
    v12 = ((uint64_t)(v6 - v7) >> 5) + 1;
    if (v12 >> 59)
      std::vector<PDFDetectedFormField * {__strong}>::__throw_length_error[abi:ne180100]();
    v13 = v10 - v7;
    if (v13 >> 4 > v12)
      v12 = v13 >> 4;
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFE0)
      v14 = 0x7FFFFFFFFFFFFFFLL;
    else
      v14 = v12;
    v21 = v9;
    if (v14)
      v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PDFDetectedFormRow>>(v9, v14);
    else
      v15 = 0;
    v17 = v15;
    v18 = &v15[32 * v8];
    v19 = v18;
    v20 = &v15[32 * v14];
    std::__split_buffer<PDFDetectedFormRow>::push_back(&v17, a3);
    v4 = (_QWORD *)std::vector<PDFDetectedFormRow>::__swap_out_circular_buffer(a1, &v17, (uint64_t)v4);
    std::__split_buffer<PDFDetectedFormRow>::~__split_buffer(&v17);
  }
  else if (a2 == v6)
  {
    std::vector<PDFDetectedFormRow>::__construct_one_at_end[abi:ne180100]<PDFDetectedFormRow>((uint64_t)a1, a3);
  }
  else
  {
    std::vector<PDFDetectedFormRow>::__move_range((uint64_t)a1, a2, v6, a2 + 32);
    *v4 = *(_QWORD *)a3;
    if (v4 == (_QWORD *)a3)
      return (_QWORD *)a3;
    else
      std::vector<PDFDetectedFormField * {__strong}>::__assign_with_size[abi:ne180100]<PDFDetectedFormField * {__strong}*,PDFDetectedFormField * {__strong}*>(v7 + 32 * v8 + 8, *(void ***)(a3 + 8), *(void ***)(a3 + 16), (uint64_t)(*(_QWORD *)(a3 + 16) - *(_QWORD *)(a3 + 8)) >> 3);
  }
  return v4;
}

void sub_209D7EFCC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<PDFDetectedFormRow>::~__split_buffer((void **)va);
  _Unwind_Resume(a1);
}

void PDFDetectedFormRow::insertField(PDFDetectedFormRow *this, PDFDetectedFormField *a2)
{
  id *v3;
  id *v4;
  id *v5;
  PDFDetectedFormField *v6;
  char v7;

  v6 = a2;
  v3 = (id *)*((_QWORD *)this + 1);
  v4 = (id *)*((_QWORD *)this + 2);
  v7 = 0;
  v5 = std::__lower_bound[abi:ne180100]<std::_ClassicAlgPolicy,std::__wrap_iter<PDFDetectedFormField * {__strong}*>,std::__wrap_iter<PDFDetectedFormField * {__strong}*>,PDFDetectedFormField * {__strong},std::__identity,PDFDetectedFormRow::insertField(PDFDetectedFormField *)::{lambda(PDFDetectedFormField *,PDFDetectedFormField *)#1}>(v3, v4, (void **)&v6);
  std::vector<PDFDetectedFormField * {__strong}>::insert((_QWORD *)this + 1, v5, (id *)&v6);

}

void sub_209D7F03C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{

  _Unwind_Resume(a1);
}

void sub_209D7F1DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,_QWORD *a32)
{
  uint64_t v32;

  _Block_object_dispose(&a16, 8);
  if (__p)
  {
    a23 = (uint64_t)__p;
    operator delete(__p);
  }
  _Block_object_dispose(&a25, 8);
  std::__tree<double>::destroy(v32, a32);
  _Unwind_Resume(a1);
}

_QWORD *__Block_byref_object_copy__3(_QWORD *result, _QWORD *a2)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  result[6] = a2[6];
  v2 = a2 + 7;
  v3 = a2[7];
  result[7] = v3;
  v4 = result + 7;
  v5 = a2[8];
  result[8] = v5;
  if (v5)
  {
    *(_QWORD *)(v3 + 16) = v4;
    a2[6] = v2;
    *v2 = 0;
    a2[8] = 0;
  }
  else
  {
    result[6] = v4;
  }
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
  std::__tree<double>::destroy(a1 + 48, *(_QWORD **)(a1 + 56));
}

__n128 __Block_byref_object_copy__48(__n128 *a1, __n128 *a2)
{
  __n128 result;

  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

void __Block_byref_object_dispose__49(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(_QWORD *)(a1 + 56) = v2;
    operator delete(v2);
  }
}

void std::vector<CGDisplayListEntry const*>::reserve(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  int64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  uint64_t v13;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 3)
  {
    if (a2 >> 61)
      std::vector<PDFDetectedFormField * {__strong}>::__throw_length_error[abi:ne180100]();
    v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PDFDetectedFormField * {__strong}>>(v3, a2);
    v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    v9 = &v6[8 * v8];
    v11 = (char *)*a1;
    v10 = (char *)a1[1];
    v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        v13 = *((_QWORD *)v10 - 1);
        v10 -= 8;
        *((_QWORD *)v12 - 1) = v13;
        v12 -= 8;
      }
      while (v10 != v11);
      v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

void **std::vector<PDFDetectedFormField * {__strong}>::erase(uint64_t a1, void **a2, void **a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (a2 != a3)
  {
    std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,PDFDetectedFormField * {__strong}*,PDFDetectedFormField * {__strong}*,PDFDetectedFormField * {__strong}*,0>(a3, *(void ***)(a1 + 8), a2);
    v6 = v5;
    v7 = *(_QWORD *)(a1 + 8);
    if (v7 != v5)
    {
      do
      {
        v8 = *(void **)(v7 - 8);
        v7 -= 8;

      }
      while (v7 != v6);
    }
    *(_QWORD *)(a1 + 8) = v6;
  }
  return a2;
}

void **std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,PDFDetectedFormField * {__strong}*,PDFDetectedFormField * {__strong}*,PDFDetectedFormField * {__strong}*,0>(void **a1, void **a2, void **a3)
{
  void **v4;
  void *v6;
  void *v7;

  v4 = a1;
  if (a1 != a2)
  {
    do
    {
      v6 = *v4;
      *v4++ = 0;
      v7 = *a3;
      *a3++ = v6;

    }
    while (v4 != a2);
    return a2;
  }
  return v4;
}

void std::vector<PDFDetectedFormField * {__strong}>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  char *v2;
  char *v4;
  void *v5;
  void *v6;

  v1 = *a1;
  v2 = (char *)**a1;
  if (v2)
  {
    v4 = (char *)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v6 = (void *)*((_QWORD *)v4 - 1);
        v4 -= 8;

      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

id *std::vector<PDFDetectedFormField * {__strong}>::insert(_QWORD *a1, id *a2, id *a3)
{
  id *v4;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  void **v15;
  void **v16;
  uint64_t v17;
  void **v18;
  unint64_t v19;
  void **v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  int64x2_t v29;
  char *v30;
  void **v32;
  __int128 v33;
  char *v34;
  _QWORD *v35;
  void **v36;
  int64x2_t v37;
  char *v38;
  uint64_t v39;

  v4 = a2;
  v6 = a1[1];
  v8 = (uint64_t)(a1 + 2);
  v7 = a1[2];
  if (v6 >= v7)
  {
    v9 = (char *)*a1;
    v10 = ((uint64_t)(v6 - *a1) >> 3) + 1;
    if (v10 >> 61)
      std::vector<PDFDetectedFormField * {__strong}>::__throw_length_error[abi:ne180100]();
    v11 = (char *)a2 - v9;
    v12 = ((char *)a2 - v9) >> 3;
    v13 = v7 - (_QWORD)v9;
    if (v13 >> 2 > v10)
      v10 = v13 >> 2;
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF8)
      v14 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v14 = v10;
    v35 = a1 + 2;
    if (v14)
      v15 = (void **)std::__allocate_at_least[abi:ne180100]<std::allocator<PDFDetectedFormField * {__strong}>>((uint64_t)(a1 + 2), v14);
    else
      v15 = 0;
    v16 = &v15[v12];
    v32 = v15;
    *(_QWORD *)&v33 = v16;
    *((_QWORD *)&v33 + 1) = v16;
    v34 = (char *)&v15[v14];
    if (v12 == v14)
    {
      if (v11 < 1)
      {
        if (v9 == (char *)v4)
          v19 = 1;
        else
          v19 = v11 >> 2;
        v39 = v8;
        v20 = (void **)std::__allocate_at_least[abi:ne180100]<std::allocator<PDFDetectedFormField * {__strong}>>(v8, v19);
        v22 = (uint64_t *)v33;
        v23 = *((_QWORD *)&v33 + 1) - v33;
        if (*((_QWORD *)&v33 + 1) == (_QWORD)v33)
        {
          v29 = vdupq_n_s64(v33);
          v25 = (unint64_t)&v20[v19 >> 2];
        }
        else
        {
          v24 = v23 >> 3;
          v25 = (unint64_t)&v20[v19 >> 2] + (v23 & 0xFFFFFFFFFFFFFFF8);
          v26 = 8 * v24;
          v27 = (char *)&v20[v19 >> 2];
          do
          {
            v28 = *v22;
            *v22++ = 0;
            *(_QWORD *)v27 = v28;
            v27 += 8;
            v26 -= 8;
          }
          while (v26);
          v29 = (int64x2_t)v33;
        }
        v30 = v34;
        v36 = v32;
        v32 = v20;
        *(_QWORD *)&v33 = &v20[v19 >> 2];
        v37 = v29;
        *((_QWORD *)&v33 + 1) = v25;
        v34 = (char *)&v20[v21];
        v38 = v30;
        std::__split_buffer<PDFDetectedFormField * {__strong}>::~__split_buffer((uint64_t)&v36);
        v16 = (void **)*((_QWORD *)&v33 + 1);
      }
      else
      {
        if (v12 >= -1)
          v17 = v12 + 1;
        else
          v17 = v12 + 2;
        std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,PDFDetectedFormField * {__strong}*,PDFDetectedFormField * {__strong}*,PDFDetectedFormField * {__strong}*,0>(&v15[v12], v16, &v16[-(v17 >> 1)]);
        v16 = v18;
        *(_QWORD *)&v33 = v33 - 8 * (v17 >> 1);
        *((_QWORD *)&v33 + 1) = v18;
      }
    }
    *v16 = *a3;
    *((_QWORD *)&v33 + 1) += 8;
    v4 = (id *)std::vector<PDFDetectedFormField * {__strong}>::__swap_out_circular_buffer(a1, &v32, v4);
    std::__split_buffer<PDFDetectedFormField * {__strong}>::~__split_buffer((uint64_t)&v32);
  }
  else if (a2 == (id *)v6)
  {
    *a2 = *a3;
    a1[1] = v4 + 1;
  }
  else
  {
    std::vector<PDFDetectedFormField * {__strong}>::__move_range((uint64_t)a1, a2, v6, (uint64_t)(a2 + 1));
    if (v4 <= a3)
      a3 += a1[1] > (unint64_t)a3;
    objc_storeStrong(v4, *a3);
  }
  return v4;
}

void sub_209D7FAAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__split_buffer<PDFDetectedFormField * {__strong}>::~__split_buffer((uint64_t)&a9);
  _Unwind_Resume(a1);
}

id *std::__lower_bound[abi:ne180100]<std::_ClassicAlgPolicy,std::__wrap_iter<PDFDetectedFormField * {__strong}*>,std::__wrap_iter<PDFDetectedFormField * {__strong}*>,PDFDetectedFormField * {__strong},std::__identity,PDFDetectedFormRow::insertField(PDFDetectedFormField *)::{lambda(PDFDetectedFormField *,PDFDetectedFormField *)#1}>(id *a1, id *a2, void **a3)
{
  id *v3;
  unint64_t v5;
  id *v6;
  void *v7;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v3 = a1;
  if (a2 != a1)
  {
    v5 = a2 - a1;
    do
    {
      v6 = &v3[v5 >> 1];
      v7 = *a3;
      v8 = *v6;
      v9 = v7;
      objc_msgSend(v8, "minX");
      v11 = v10;
      objc_msgSend(v9, "minX");
      v13 = v12;

      if (v11 >= v13)
        v5 >>= 1;
      else
        v5 += ~(v5 >> 1);
      if (v11 < v13)
        v3 = v6 + 1;
    }
    while (v5);
  }
  return v3;
}

void sub_209D7FB6C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

_QWORD *std::vector<PDFDetectedFormField * {__strong}>::__move_range(uint64_t a1, _QWORD *a2, unint64_t a3, uint64_t a4)
{
  _QWORD *v6;
  uint64_t *v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;

  v6 = *(_QWORD **)(a1 + 8);
  v7 = (_QWORD *)((char *)v6 + (_QWORD)a2 - a4);
  v8 = v6;
  if ((unint64_t)v7 < a3)
  {
    v9 = v7;
    v8 = *(_QWORD **)(a1 + 8);
    do
    {
      v10 = *v9;
      *v9++ = 0;
      *v8++ = v10;
    }
    while ((unint64_t)v9 < a3);
  }
  *(_QWORD *)(a1 + 8) = v8;
  return std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_backward_loop<std::_ClassicAlgPolicy>,std::__move_backward_trivial>,PDFDetectedFormField * {__strong}*,PDFDetectedFormField * {__strong}*,PDFDetectedFormField * {__strong}*,0>(a2, v7, v6);
}

uint64_t std::vector<PDFDetectedFormField * {__strong}>::__swap_out_circular_buffer(_QWORD *a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t result;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;

  result = a2[1];
  v5 = (_QWORD *)*a1;
  v6 = result;
  if ((_QWORD *)*a1 != a3)
  {
    v6 = a2[1];
    v7 = a3;
    do
    {
      v8 = *--v7;
      *v7 = 0;
      *(_QWORD *)(v6 - 8) = v8;
      v6 -= 8;
    }
    while (v7 != v5);
  }
  a2[1] = v6;
  v9 = (_QWORD *)a1[1];
  v10 = (_QWORD *)a2[2];
  if (v9 != a3)
  {
    do
    {
      v11 = *a3;
      *a3++ = 0;
      *v10++ = v11;
    }
    while (a3 != v9);
    v6 = a2[1];
  }
  a2[2] = v10;
  v12 = (_QWORD *)*a1;
  *a1 = v6;
  a2[1] = v12;
  v13 = a1[1];
  a1[1] = a2[2];
  a2[2] = v13;
  v14 = a1[2];
  a1[2] = a2[3];
  a2[3] = v14;
  *a2 = a2[1];
  return result;
}

_QWORD *std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_backward_loop<std::_ClassicAlgPolicy>,std::__move_backward_trivial>,PDFDetectedFormField * {__strong}*,PDFDetectedFormField * {__strong}*,PDFDetectedFormField * {__strong}*,0>(_QWORD *a1, _QWORD *a2, _QWORD *a3)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  if (a2 != a1)
  {
    v6 = a2;
    do
    {
      v8 = *--v6;
      v7 = v8;
      *v6 = 0;
      v9 = (void *)*--a3;
      *a3 = v7;

    }
    while (v6 != a1);
  }
  return a2;
}

void std::vector<PDFDetectedFormField * {__strong}>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24C25B730, MEMORY[0x24BEDAAF0]);
}

void sub_209D7FD10(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<PDFDetectedFormField * {__strong}>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

uint64_t std::__split_buffer<PDFDetectedFormField * {__strong}>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 8;

  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

_QWORD **std::__advance[abi:ne180100]<std::__tree_const_iterator<double,std::__tree_node<double,void *> *,long>>(_QWORD **result, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  BOOL v5;
  _QWORD *v7;
  _QWORD *v8;

  if (a2 < 0)
  {
    v7 = *result;
    do
    {
      v8 = (_QWORD *)*v7;
      if (*v7)
      {
        do
        {
          v4 = v8;
          v8 = (_QWORD *)v8[1];
        }
        while (v8);
      }
      else
      {
        do
        {
          v4 = (_QWORD *)v7[2];
          v5 = *v4 == (_QWORD)v7;
          v7 = v4;
        }
        while (v5);
      }
      v7 = v4;
    }
    while (!__CFADD__(a2++, 1));
  }
  else
  {
    if (!a2)
      return result;
    v2 = *result;
    do
    {
      v3 = (_QWORD *)v2[1];
      if (v3)
      {
        do
        {
          v4 = v3;
          v3 = (_QWORD *)*v3;
        }
        while (v3);
      }
      else
      {
        do
        {
          v4 = (_QWORD *)v2[2];
          v5 = *v4 == (_QWORD)v2;
          v2 = v4;
        }
        while (!v5);
      }
      v2 = v4;
    }
    while (a2-- > 1);
  }
  *result = v4;
  return result;
}

_QWORD *std::vector<CGDisplayListEntry const*>::__init_with_size[abi:ne180100]<CGDisplayListEntry const**,CGDisplayListEntry const**>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<CGDisplayListEntry const*>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_209D7FEDC(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<CGDisplayListEntry const*>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 61)
    std::vector<PDFDetectedFormField * {__strong}>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PDFDetectedFormField * {__strong}>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

char *std::vector<PDFDetectedFormRow>::__construct_one_at_end[abi:ne180100]<PDFDetectedFormRow>(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char *result;

  v3 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)v3 = *(_QWORD *)a2;
  *(_QWORD *)(v3 + 16) = 0;
  *(_QWORD *)(v3 + 24) = 0;
  *(_QWORD *)(v3 + 8) = 0;
  result = std::vector<PDFDetectedFormField * {__strong}>::__init_with_size[abi:ne180100]<PDFDetectedFormField * {__strong}*,PDFDetectedFormField * {__strong}*>((char *)(v3 + 8), *(void ***)(a2 + 8), *(void ***)(a2 + 16), (uint64_t)(*(_QWORD *)(a2 + 16) - *(_QWORD *)(a2 + 8)) >> 3);
  *(_QWORD *)(a1 + 8) = v3 + 32;
  return result;
}

void sub_209D7FF88(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<PDFDetectedFormRow>::__move_range(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v10;
  unint64_t v11;
  char v13;

  v6 = *(_QWORD *)(a1 + 8);
  v7 = a2 + v6 - a4;
  v8 = v6;
  if (v7 < a3)
  {
    v10 = v6 + 8;
    v11 = a2 + v6 - a4;
    do
    {
      *(_QWORD *)(v10 - 8) = *(_QWORD *)v11;
      *(_QWORD *)(v10 + 8) = 0;
      *(_QWORD *)(v10 + 16) = 0;
      *(_QWORD *)v10 = 0;
      std::vector<PDFDetectedFormField * {__strong}>::__init_with_size[abi:ne180100]<PDFDetectedFormField * {__strong}*,PDFDetectedFormField * {__strong}*>((char *)v10, *(void ***)(v11 + 8), *(void ***)(v11 + 16), (uint64_t)(*(_QWORD *)(v11 + 16) - *(_QWORD *)(v11 + 8)) >> 3);
      v10 += 32;
      v11 += 32;
    }
    while (v11 < a3);
    v8 = v10 - 8;
  }
  *(_QWORD *)(a1 + 8) = v8;
  return std::__move_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<PDFDetectedFormRow *,PDFDetectedFormRow *,PDFDetectedFormRow *>((uint64_t)&v13, a2, v7, v6);
}

void sub_209D80044(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2 - 8;
  _Unwind_Resume(a1);
}

char *std::__split_buffer<PDFDetectedFormRow>::push_back(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  char *result;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v4 = a1[2];
  if (v4 == a1[3])
  {
    v5 = a1[1];
    v6 = v5 - *a1;
    if (v5 <= *a1)
    {
      v14 = v4 - *a1;
      v13 = v14 == 0;
      v15 = v14 >> 4;
      if (v13)
        v16 = 1;
      else
        v16 = v15;
      v17 = a1[4];
      v25 = a1[4];
      *(_QWORD *)&v23 = std::__allocate_at_least[abi:ne180100]<std::allocator<PDFDetectedFormRow>>(v17, v16);
      *((_QWORD *)&v23 + 1) = v23 + 32 * (v16 >> 2);
      *(_QWORD *)&v24 = *((_QWORD *)&v23 + 1);
      *((_QWORD *)&v24 + 1) = v23 + 32 * v18;
      std::__split_buffer<PDFDetectedFormRow>::__construct_at_end_with_size<std::move_iterator<PDFDetectedFormRow*>>((char *)&v23, a1[1], (uint64_t)(a1[2] - a1[1]) >> 5);
      v19 = v24;
      v20 = *(_OWORD *)a1;
      v21 = *((_OWORD *)a1 + 1);
      *(_OWORD *)a1 = v23;
      *((_OWORD *)a1 + 1) = v19;
      v23 = v20;
      v24 = v21;
      std::__split_buffer<PDFDetectedFormRow>::~__split_buffer((void **)&v23);
      v4 = a1[2];
    }
    else
    {
      v7 = v6 >> 5;
      v8 = v6 >> 5 < -1;
      v9 = (v6 >> 5) + 2;
      if (v8)
        v10 = v9;
      else
        v10 = v7 + 1;
      v11 = v10 >> 1;
      std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<PDFDetectedFormRow *,PDFDetectedFormRow *,PDFDetectedFormRow *>((uint64_t)&v23, v5, v4, (_QWORD *)(v5 - 32 * (v10 >> 1)));
      v4 = v12;
      a1[1] -= 32 * v11;
      a1[2] = v12;
    }
  }
  *(_QWORD *)v4 = *(_QWORD *)a2;
  *(_QWORD *)(v4 + 16) = 0;
  *(_QWORD *)(v4 + 24) = 0;
  *(_QWORD *)(v4 + 8) = 0;
  result = std::vector<PDFDetectedFormField * {__strong}>::__init_with_size[abi:ne180100]<PDFDetectedFormField * {__strong}*,PDFDetectedFormField * {__strong}*>((char *)(v4 + 8), *(void ***)(a2 + 8), *(void ***)(a2 + 16), (uint64_t)(*(_QWORD *)(a2 + 16) - *(_QWORD *)(a2 + 8)) >> 3);
  a1[2] += 32;
  return result;
}

void sub_209D80160(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  std::__split_buffer<PDFDetectedFormRow>::~__split_buffer(&a9);
  _Unwind_Resume(a1);
}

uint64_t std::vector<PDFDetectedFormRow>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = a2[1];
  v7 = (uint64_t)(a1 + 2);
  std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<PDFDetectedFormRow>,std::reverse_iterator<PDFDetectedFormRow*>,std::reverse_iterator<PDFDetectedFormRow*>,std::reverse_iterator<PDFDetectedFormRow*>>((uint64_t)(a1 + 2), a3, a3, *a1, *a1, v6, v6);
  a2[1] = v8;
  a2[2] = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<PDFDetectedFormRow>,PDFDetectedFormRow*,PDFDetectedFormRow*,PDFDetectedFormRow*>(v7, a3, a1[1], a2[2]);
  v9 = *a1;
  *a1 = a2[1];
  a2[1] = v9;
  v10 = a1[1];
  a1[1] = a2[2];
  a2[2] = v10;
  v11 = a1[2];
  a1[2] = a2[3];
  a2[3] = v11;
  *a2 = a2[1];
  return v6;
}

char *std::vector<PDFDetectedFormField * {__strong}>::__init_with_size[abi:ne180100]<PDFDetectedFormField * {__strong}*,PDFDetectedFormField * {__strong}*>(char *result, void **a2, void **a3, unint64_t a4)
{
  char *v6;
  char **v7;
  void *v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<CGDisplayListEntry const*>::__vallocate[abi:ne180100](result, a4);
    v7 = (char **)*((_QWORD *)v6 + 1);
    while (a2 != a3)
    {
      v8 = *a2++;
      result = v8;
      *v7++ = result;
    }
    *((_QWORD *)v6 + 1) = v7;
  }
  return result;
}

void sub_209D8028C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  std::vector<PDFDetectedFormField * {__strong}>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

uint64_t std::__move_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<PDFDetectedFormRow *,PDFDetectedFormRow *,PDFDetectedFormRow *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a3 != a2)
  {
    v6 = a3;
    v7 = a3;
    v8 = a4;
    do
    {
      v9 = *(_QWORD *)(v7 - 32);
      v7 -= 32;
      *(_QWORD *)(v8 - 32) = v9;
      v8 -= 32;
      if (v6 != a4)
        std::vector<PDFDetectedFormField * {__strong}>::__assign_with_size[abi:ne180100]<PDFDetectedFormField * {__strong}*,PDFDetectedFormField * {__strong}*>(a4 - 24, *(void ***)(v6 - 24), *(void ***)(v6 - 16), (uint64_t)(*(_QWORD *)(v6 - 16) - *(_QWORD *)(v6 - 24)) >> 3);
      a4 = v8;
      v6 = v7;
    }
    while (v7 != a2);
  }
  return a3;
}

void std::vector<PDFDetectedFormField * {__strong}>::__assign_with_size[abi:ne180100]<PDFDetectedFormField * {__strong}*,PDFDetectedFormField * {__strong}*>(uint64_t a1, void **a2, void **a3, unint64_t a4)
{
  void **v6;
  id *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  void *v13;
  unint64_t v14;
  void **v15;
  uint64_t v16;
  _QWORD *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  char v23;
  char v24;

  v6 = a2;
  v8 = *(id **)a1;
  if (a4 <= (uint64_t)(*(_QWORD *)(a1 + 16) - *(_QWORD *)a1) >> 3)
  {
    v14 = (uint64_t)(*(_QWORD *)(a1 + 8) - (_QWORD)v8) >> 3;
    if (v14 >= a4)
    {
      std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<PDFDetectedFormField * {__strong}*,PDFDetectedFormField * {__strong}*,PDFDetectedFormField * {__strong}*>((int)&v24, a2, a3, v8);
      v20 = v19;
      v21 = *(_QWORD *)(a1 + 8);
      if (v21 != v19)
      {
        do
        {
          v22 = *(void **)(v21 - 8);
          v21 -= 8;

        }
        while (v21 != v20);
      }
      *(_QWORD *)(a1 + 8) = v20;
    }
    else
    {
      v15 = &a2[v14];
      std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<PDFDetectedFormField * {__strong}*,PDFDetectedFormField * {__strong}*,PDFDetectedFormField * {__strong}*>((int)&v23, a2, v15, v8);
      v16 = *(_QWORD *)(a1 + 8);
      if (v15 != a3)
      {
        v17 = *(_QWORD **)(a1 + 8);
        do
        {
          v18 = *v15++;
          *v17++ = v18;
          v16 += 8;
        }
        while (v15 != a3);
      }
      *(_QWORD *)(a1 + 8) = v16;
    }
  }
  else
  {
    std::vector<PDFDetectedFormField * {__strong}>::__vdeallocate((void **)a1);
    if (a4 >> 61)
      std::vector<PDFDetectedFormField * {__strong}>::__throw_length_error[abi:ne180100]();
    v9 = *(_QWORD *)(a1 + 16) - *(_QWORD *)a1;
    v10 = v9 >> 2;
    if (v9 >> 2 <= a4)
      v10 = a4;
    if ((unint64_t)v9 >= 0x7FFFFFFFFFFFFFF8)
      v11 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v11 = v10;
    std::vector<CGDisplayListEntry const*>::__vallocate[abi:ne180100]((_QWORD *)a1, v11);
    v12 = *(_QWORD **)(a1 + 8);
    while (v6 != a3)
    {
      v13 = *v6++;
      *v12++ = v13;
    }
    *(_QWORD *)(a1 + 8) = v12;
  }
}

void std::vector<PDFDetectedFormField * {__strong}>::__vdeallocate(void **a1)
{
  char *v1;
  char *v3;
  void *v4;
  void *v5;

  v1 = (char *)*a1;
  if (*a1)
  {
    v3 = (char *)a1[1];
    v4 = *a1;
    if (v3 != v1)
    {
      do
      {
        v5 = (void *)*((_QWORD *)v3 - 1);
        v3 -= 8;

      }
      while (v3 != v1);
      v4 = *a1;
    }
    a1[1] = v1;
    operator delete(v4);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

void **std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<PDFDetectedFormField * {__strong}*,PDFDetectedFormField * {__strong}*,PDFDetectedFormField * {__strong}*>(int a1, void **a2, void **a3, id *location)
{
  void **v5;
  void *v7;

  v5 = a2;
  if (a2 != a3)
  {
    do
    {
      v7 = *v5++;
      objc_storeStrong(location++, v7);
    }
    while (v5 != a3);
    return a3;
  }
  return v5;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<PDFDetectedFormRow>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(32 * a2);
}

uint64_t std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<PDFDetectedFormRow *,PDFDetectedFormRow *,PDFDetectedFormRow *>(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v5;

  v5 = a2;
  if (a2 != a3)
  {
    do
    {
      *a4 = *(_QWORD *)v5;
      if ((_QWORD *)v5 != a4)
        std::vector<PDFDetectedFormField * {__strong}>::__assign_with_size[abi:ne180100]<PDFDetectedFormField * {__strong}*,PDFDetectedFormField * {__strong}*>((uint64_t)(a4 + 1), *(void ***)(v5 + 8), *(void ***)(v5 + 16), (uint64_t)(*(_QWORD *)(v5 + 16) - *(_QWORD *)(v5 + 8)) >> 3);
      v5 += 32;
      a4 += 4;
    }
    while (v5 != a3);
    return a3;
  }
  return v5;
}

char *std::__split_buffer<PDFDetectedFormRow>::__construct_at_end_with_size<std::move_iterator<PDFDetectedFormRow*>>(char *result, uint64_t a2, uint64_t a3)
{
  char *v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;

  v3 = result;
  v4 = *((_QWORD *)result + 2);
  if (a3)
  {
    v6 = v4 + 8;
    v7 = 32 * a3;
    v4 += 32 * a3;
    do
    {
      *(_QWORD *)(v6 - 8) = *(_QWORD *)a2;
      *(_QWORD *)(v6 + 8) = 0;
      *(_QWORD *)(v6 + 16) = 0;
      *(_QWORD *)v6 = 0;
      result = std::vector<PDFDetectedFormField * {__strong}>::__init_with_size[abi:ne180100]<PDFDetectedFormField * {__strong}*,PDFDetectedFormField * {__strong}*>((char *)v6, *(void ***)(a2 + 8), *(void ***)(a2 + 16), (uint64_t)(*(_QWORD *)(a2 + 16) - *(_QWORD *)(a2 + 8)) >> 3);
      v6 += 32;
      a2 += 32;
      v7 -= 32;
    }
    while (v7);
  }
  *((_QWORD *)v3 + 2) = v4;
  return result;
}

void sub_209D80648(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 16) = v2 - 8;
  _Unwind_Resume(a1);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<PDFDetectedFormRow>,std::reverse_iterator<PDFDetectedFormRow*>,std::reverse_iterator<PDFDetectedFormRow*>,std::reverse_iterator<PDFDetectedFormRow*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[3];
  char v15;
  __int128 v16;
  __int128 v17;

  v7 = a7;
  *(_QWORD *)&v17 = a6;
  *((_QWORD *)&v17 + 1) = a7;
  v16 = v17;
  v14[0] = a1;
  v14[1] = &v16;
  v14[2] = &v17;
  v15 = 0;
  if (a3 == a5)
  {
    v12 = a6;
  }
  else
  {
    v9 = a3;
    do
    {
      v10 = *(_QWORD *)(v9 - 32);
      v9 -= 32;
      *(_QWORD *)(v7 - 24) = 0;
      v11 = v7 - 24;
      *(_QWORD *)(v11 - 8) = v10;
      *(_QWORD *)(v11 + 8) = 0;
      *(_QWORD *)(v11 + 16) = 0;
      std::vector<PDFDetectedFormField * {__strong}>::__init_with_size[abi:ne180100]<PDFDetectedFormField * {__strong}*,PDFDetectedFormField * {__strong}*>((char *)v11, *(void ***)(v9 + 8), *(void ***)(v9 + 16), (uint64_t)(*(_QWORD *)(v9 + 16) - *(_QWORD *)(v9 + 8)) >> 3);
      v7 = *((_QWORD *)&v17 + 1) - 32;
      *((_QWORD *)&v17 + 1) -= 32;
    }
    while (v9 != a5);
    v12 = v17;
  }
  v15 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<PDFDetectedFormRow>,std::reverse_iterator<PDFDetectedFormRow*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v14);
  return v12;
}

void sub_209D8070C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<PDFDetectedFormRow>,std::reverse_iterator<PDFDetectedFormRow*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<PDFDetectedFormRow>,PDFDetectedFormRow*,PDFDetectedFormRow*,PDFDetectedFormRow*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  _QWORD v8[3];
  char v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a4;
  v10 = a4;
  v11 = a4;
  v8[0] = a1;
  v8[1] = &v10;
  v8[2] = &v11;
  v9 = 0;
  if (a2 != a3)
  {
    v6 = a2;
    do
    {
      *(_QWORD *)v4 = *(_QWORD *)v6;
      *(_QWORD *)(v4 + 16) = 0;
      *(_QWORD *)(v4 + 24) = 0;
      *(_QWORD *)(v4 + 8) = 0;
      std::vector<PDFDetectedFormField * {__strong}>::__init_with_size[abi:ne180100]<PDFDetectedFormField * {__strong}*,PDFDetectedFormField * {__strong}*>((char *)(v4 + 8), *(void ***)(v6 + 8), *(void ***)(v6 + 16), (uint64_t)(*(_QWORD *)(v6 + 16) - *(_QWORD *)(v6 + 8)) >> 3);
      v4 = v11 + 32;
      v11 += 32;
      v6 += 32;
    }
    while (v6 != a3);
  }
  v9 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<PDFDetectedFormRow>,PDFDetectedFormRow*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v8);
  return v4;
}

void sub_209D807C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<PDFDetectedFormRow>,PDFDetectedFormRow*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<PDFDetectedFormRow>,std::reverse_iterator<PDFDetectedFormRow*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<PDFDetectedFormRow>,std::reverse_iterator<PDFDetectedFormRow*>>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<PDFDetectedFormRow>,std::reverse_iterator<PDFDetectedFormRow*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void **v3;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    v3 = (void **)(v1 + 8);
    std::vector<PDFDetectedFormField * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v3);
    v1 += 32;
  }
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<PDFDetectedFormRow>,PDFDetectedFormRow*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<PDFDetectedFormRow>,PDFDetectedFormRow*>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<PDFDetectedFormRow>,PDFDetectedFormRow*>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void **v4;

  v1 = **(_QWORD **)(a1 + 16);
  v2 = **(_QWORD **)(a1 + 8);
  if (v1 != v2)
  {
    do
    {
      v3 = v1 - 32;
      v4 = (void **)(v1 - 24);
      std::vector<PDFDetectedFormField * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v4);
      v1 = v3;
    }
    while (v3 != v2);
  }
}

void **std::__split_buffer<PDFDetectedFormRow>::~__split_buffer(void **a1)
{
  std::__split_buffer<PDFDetectedFormRow>::clear[abi:ne180100]((uint64_t)a1);
  if (*a1)
    operator delete(*a1);
  return a1;
}

void std::__split_buffer<PDFDetectedFormRow>::clear[abi:ne180100](uint64_t a1)
{
  uint64_t i;
  uint64_t v2;
  void **v4;

  v2 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v2; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 32;
    v4 = (void **)(i - 24);
    std::vector<PDFDetectedFormField * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v4);
  }
}

void std::__tree<double>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<double>::destroy(a1, *a2);
    std::__tree<double>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

uint64_t *std::__tree<double>::__emplace_unique_key_args<double,double const&>(uint64_t **a1, double *a2, uint64_t *a3)
{
  uint64_t *v5;
  uint64_t **v6;
  double v7;
  uint64_t **v8;
  double v9;
  uint64_t *v10;

  v6 = a1 + 1;
  v5 = a1[1];
  if (v5)
  {
    v7 = *a2;
    while (1)
    {
      while (1)
      {
        v8 = (uint64_t **)v5;
        v9 = *((double *)v5 + 4);
        if (v7 >= v9)
          break;
        v5 = (uint64_t *)*v5;
        v6 = v8;
        if (!*v8)
          goto LABEL_10;
      }
      if (v9 >= v7)
        break;
      v5 = (uint64_t *)v5[1];
      if (!v5)
      {
        v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v8 = a1 + 1;
LABEL_10:
    v10 = (uint64_t *)operator new(0x28uLL);
    v10[4] = *a3;
    std::__tree<std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>,std::__map_value_compare<double,std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>,std::less<double>,true>,std::allocator<std::__value_type<double,applesauce::CF::ObjectRef<__CTFont const*>>>>::__insert_node_at(a1, (uint64_t)v8, v6, v10);
    return v10;
  }
  return (uint64_t *)v8;
}

void std::vector<PDFDetectedFormRow>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  char *v2;
  char *v4;
  void *v5;
  char *v6;
  void **v7;

  v1 = *a1;
  v2 = (char *)**a1;
  if (v2)
  {
    v4 = (char *)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v6 = v4 - 32;
        v7 = (void **)(v4 - 24);
        std::vector<PDFDetectedFormField * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v7);
        v4 = v6;
      }
      while (v6 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void sub_209D8108C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_209D82D70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
  _Block_object_dispose(&a55, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void sub_209D84308(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__251(uint64_t a1, uint64_t a2)
{
  objc_moveWeak((id *)(a1 + 40), (id *)(a2 + 40));
}

void __Block_byref_object_dispose__252(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 40));
}

void sub_209D849F4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_209D84B80(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_209D85080(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
  uint64_t v9;

  _Block_object_dispose((const void *)(v9 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_209D8685C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id location)
{
  id *v28;

  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209D872DC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_209D8770C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_209D877DC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_209D87850(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_209D87C64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_209D87FAC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_209D882BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_209D88C60(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 136));
  objc_destroyWeak((id *)(v1 - 128));
  _Block_object_dispose((const void *)(v1 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_209D891A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  uint64_t v32;

  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 168), 8);
  _Unwind_Resume(a1);
}

void sub_209D89B38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_209D8A328(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_209D8A5E4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_209D8B000(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_209D8B7FC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_209D8BBD4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

double PDFRectGetMinX(double result, double a2, double a3)
{
  if (result >= result + a3)
    return result + a3;
  return result;
}

double PDFRectGetMinY(double a1, double a2, double a3, double a4)
{
  double result;

  result = a2 + a4;
  if (a2 < a2 + a4)
    return a2;
  return result;
}

double PDFRectGetMaxX(double result, double a2, double a3)
{
  if (result <= result + a3)
    return result + a3;
  return result;
}

double PDFRectGetMaxY(double a1, double a2, double a3, double a4)
{
  double result;

  result = a2 + a4;
  if (a2 > a2 + a4)
    return a2;
  return result;
}

double PDFRectGetMidX(double a1, double a2, double a3)
{
  return a1 + a3 * 0.5;
}

double PDFRectGetMidY(double a1, double a2, double a3, double a4)
{
  return a2 + a4 * 0.5;
}

double PDFPointScale(double a1, double a2, double a3)
{
  return a1 * a3;
}

double PDFRectScale(double a1, double a2, double a3, double a4, double a5)
{
  return a1 * a5;
}

BOOL PDFPointEqualToPoint(double a1, double a2, double a3, double a4)
{
  return a2 == a4 && a1 == a3;
}

BOOL PDFEdgeInsetsEqualToInsets(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  double v9;
  _BOOL4 v10;

  if (vabdd_f64(a1, a5) > 0.00000011920929)
    return 0;
  v9 = vabdd_f64(a4, a8);
  v10 = vabdd_f64(a2, a6) <= 0.00000011920929;
  if (vabdd_f64(a3, a7) > 0.00000011920929)
    v10 = 0;
  return v9 <= 0.00000011920929 && v10;
}

double PDFEdgeInsetsGetMaxInsets(double result, double a2, double a3, double a4, double a5)
{
  if (result < a5)
    return a5;
  return result;
}

double PDFScaleRectToRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  double result;

  result = a7 / a3;
  if (a4 * (a7 / a3) > a8)
    return a8 / a4;
  return result;
}

double PDFEdgeInsetsInsetRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  double v8;
  double v9;
  double v10;

  v8 = a1 + a6;
  v9 = a3 - (a8 + a6);
  v10 = v9 * 0.5;
  if (v9 > 0.0)
    v10 = -0.0;
  return v8 + v10;
}

uint64_t PDFNormalizeRotation(uint64_t a1)
{
  if (a1 < 0)
    a1 += 360 * (-a1 / 0x168uLL) + 360;
  return (uint64_t)(round((double)a1 / 90.0) * 90.0) % 360;
}

double PDFRectRotate(uint64_t a1, double a2, double a3)
{
  if (a1 != 270 && a1 != 90)
    return a2;
  return a3;
}

double PDFDegToRad(double a1)
{
  return a1 / 180.0 * 3.14159265;
}

double PDFRectGetCenterPoint(double a1, double a2, double a3)
{
  return a1 + a3 * 0.5;
}

double PDFRectMakeFromCenter(double a1, double a2, double a3)
{
  return a1 - a3 * 0.5;
}

double PDFRectFromPDFPoints(double result, double a2, double a3)
{
  if (result >= a3)
    return a3;
  return result;
}

void PDFPointsGetMinMaxValues(void *a1, double *a2, double *a3, double *a4, double *a5)
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t i;
  double v18;
  double v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v9 = a1;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    v13 = 3.40282347e38;
    v14 = 1.17549435e-38;
    v15 = 1.17549435e-38;
    v16 = 3.40282347e38;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "PDFKitPDFPointValue");
        if (v18 < v16)
          v16 = v18;
        if (v19 < v13)
          v13 = v19;
        if (v18 >= v15)
          v15 = v18;
        if (v19 >= v14)
          v14 = v19;
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }
  else
  {
    v13 = 3.40282347e38;
    v14 = 1.17549435e-38;
    v15 = 1.17549435e-38;
    v16 = 3.40282347e38;
  }
  *a2 = v16;
  *a3 = v13;
  *a4 = v15;
  *a5 = v14;

}

double PDFPointClampInPDFRect(double result, double a2, double a3, double a4, double a5)
{
  double v5;

  v5 = a3 + a5;
  if (result >= v5)
    result = v5;
  if (result < a3)
    return a3;
  return result;
}

double CGFloatClamp(double result, double a2, double a3)
{
  if (result < a2)
    result = a2;
  if (result > a3)
    return a3;
  return result;
}

BOOL PDFRectValid(double a1, double a2, double a3, double a4)
{
  double v4;
  _BOOL4 v5;

  v4 = fabs(a1);
  v5 = v4 < INFINITY;
  if (v4 > INFINITY)
    v5 = 1;
  if (fabs(a2) == INFINITY)
    v5 = 0;
  if (fabs(a3) == INFINITY)
    v5 = 0;
  if (fabs(a4) == INFINITY)
    return 0;
  return v5;
}

double PDFNormalizedCGVectorFromPoints(double a1, double a2, double a3, double a4)
{
  return (a1 - a3) / sqrt((a2 - a4) * (a2 - a4) + (a1 - a3) * (a1 - a3));
}

double PDFNormalizeCGVector(double a1, double a2)
{
  return a1 / sqrt(a2 * a2 + a1 * a1);
}

double PDFGetAngleBetweenCGVectors(double a1, double a2, double a3, double a4)
{
  return acos((a2 * a4 + a1 * a3) / (sqrt(a2 * a2 + a1 * a1) * sqrt(a4 * a4 + a3 * a3)));
}

id PDFGetToolTipNoLabel(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v1 = a1;
  v2 = v1;
  if (v1 && (objc_msgSend(v1, "document"), (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = (void *)v3;
    v5 = (void *)MEMORY[0x24BDD17C8];
    PDFKitLocalizedString(CFSTR("Go to page %lu"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", v6, objc_msgSend(v4, "indexForPage:", v2) + 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PDFKitLocalizedString(CFSTR("Broken link"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

id PDFKitLocalizedString(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x24BDD1488];
  v2 = a1;
  objc_msgSend(v1, "bundleWithIdentifier:", CFSTR("com.apple.PDFKit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", v2, &stru_24C25F170, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

CFStringRef createFilenameForEncoding(CGPDFObject *a1, CFStringEncoding a2)
{
  CFStringRef result;
  const UInt8 *v5;
  CGPDFDictionaryRef dict;
  __CFString *value;

  value = 0;
  if (!CGPDFObjectGetValue(a1, kCGPDFObjectTypeString, &value))
  {
    dict = 0;
    if (!CGPDFObjectGetValue(a1, kCGPDFObjectTypeDictionary, &dict)
      || !CGPDFDictionaryGetString(dict, "F", (CGPDFStringRef *)&value))
    {
      return 0;
    }
  }
  result = value;
  if (value)
  {
    result = (CFStringRef)CGPDFStringGetBytePtr((CGPDFStringRef)value);
    if (result)
    {
      v5 = (const UInt8 *)result;
      result = (CFStringRef)CGPDFStringGetLength((CGPDFStringRef)value);
      if (result)
        return CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD240], v5, (CFIndex)result, a2, 0);
    }
  }
  return result;
}

__CFString *getFilepathFromObjectDetermineEncoding(CGPDFObject *a1, const __CFString *a2)
{
  CFStringRef FilenameForEncoding;
  CFAllocatorRef *v5;
  const __CFString *v6;
  const __CFString *MutableCopy;
  __CFString *v8;
  CFIndex Length;
  CFIndex v10;
  uint64_t v11;
  char *v12;
  CFStringRef v14;
  const __CFString *v15;
  __CFString *v16;
  CFIndex v17;
  CFIndex v18;
  uint64_t v19;
  CFStringRef v20;
  const __CFString *v21;
  CFIndex v22;
  CFIndex v23;
  uint64_t v24;
  CFStringRef v25;
  const __CFString *v26;
  CFIndex v27;
  CFIndex v28;
  uint64_t v29;
  CFStringRef v30;
  const __CFString *v31;
  CFIndex v32;
  CFIndex v33;
  uint64_t v34;
  stat v35;

  if (!a2)
    return (__CFString *)0;
  memset(&v35, 0, sizeof(v35));
  FilenameForEncoding = createFilenameForEncoding(a1, 0);
  v5 = (CFAllocatorRef *)MEMORY[0x24BDBD240];
  if (FilenameForEncoding)
  {
    v6 = FilenameForEncoding;
    MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, a2);
    v8 = (__CFString *)MutableCopy;
    if (MutableCopy)
    {
      Length = CFStringGetLength(MutableCopy);
      if (CFStringGetCharacterAtIndex(v8, Length - 1) != 47)
        CFStringAppend(v8, CFSTR("/"));
      CFStringAppend(v8, v6);
      v10 = CFStringGetLength(v8);
      if (v10)
      {
        v11 = 2 * v10 + 2;
        v12 = (char *)malloc_type_malloc(v11, 0x26B87056uLL);
        if (CFStringGetCString(v8, v12, v11, 0x8000100u) && (stat(v12, &v35) & 0x80000000) == 0)
          goto LABEL_58;
        if (v12)
          free(v12);
      }
    }
    CFRelease(v6);
  }
  else
  {
    v8 = 0;
  }
  v14 = createFilenameForEncoding(a1, 1u);
  if (v14)
  {
    v6 = v14;
    v15 = CFStringCreateMutableCopy(*v5, 0, a2);
    if (v15)
    {
      v16 = (__CFString *)v15;
      v17 = CFStringGetLength(v15);
      if (CFStringGetCharacterAtIndex(v16, v17 - 1) != 47)
        CFStringAppend(v16, CFSTR("/"));
      CFStringAppend(v16, v6);
      v18 = CFStringGetLength(v16);
      if (v18)
      {
        v19 = 2 * v18 + 2;
        v12 = (char *)malloc_type_malloc(v19, 0x5D280693uLL);
        if (CFStringGetCString(v16, v12, v19, 0x8000100u) && (stat(v12, &v35) & 0x80000000) == 0)
          goto LABEL_59;
        if (v12)
          free(v12);
      }
      CFRelease(v16);
    }
    CFRelease(v6);
  }
  v20 = createFilenameForEncoding(a1, 2u);
  if (v20)
  {
    v6 = v20;
    v21 = CFStringCreateMutableCopy(*v5, 0, a2);
    if (v21)
    {
      v16 = (__CFString *)v21;
      v22 = CFStringGetLength(v21);
      if (CFStringGetCharacterAtIndex(v16, v22 - 1) != 47)
        CFStringAppend(v16, CFSTR("/"));
      CFStringAppend(v16, v6);
      v23 = CFStringGetLength(v16);
      if (v23)
      {
        v24 = 2 * v23 + 2;
        v12 = (char *)malloc_type_malloc(v24, 0xF28B4831uLL);
        if (CFStringGetCString(v16, v12, v24, 0x8000100u) && (stat(v12, &v35) & 0x80000000) == 0)
          goto LABEL_59;
        if (v12)
          free(v12);
      }
      CFRelease(v16);
    }
    CFRelease(v6);
  }
  v25 = createFilenameForEncoding(a1, 3u);
  if (v25)
  {
    v6 = v25;
    v26 = CFStringCreateMutableCopy(*v5, 0, a2);
    if (v26)
    {
      v16 = (__CFString *)v26;
      v27 = CFStringGetLength(v26);
      if (CFStringGetCharacterAtIndex(v16, v27 - 1) != 47)
        CFStringAppend(v16, CFSTR("/"));
      CFStringAppend(v16, v6);
      v28 = CFStringGetLength(v16);
      if (v28)
      {
        v29 = 2 * v28 + 2;
        v12 = (char *)malloc_type_malloc(v29, 0x7F0A2B40uLL);
        if (CFStringGetCString(v16, v12, v29, 0x8000100u) && (stat(v12, &v35) & 0x80000000) == 0)
          goto LABEL_59;
        if (v12)
          free(v12);
      }
      CFRelease(v16);
    }
    CFRelease(v6);
  }
  v30 = createFilenameForEncoding(a1, 0x19u);
  if (!v30)
  {
LABEL_64:
    v16 = v8;
    return v16;
  }
  v6 = v30;
  v31 = CFStringCreateMutableCopy(*v5, 0, a2);
  if (!v31)
  {
    v16 = v8;
LABEL_63:
    CFRelease(v6);
    return v16;
  }
  v16 = (__CFString *)v31;
  v32 = CFStringGetLength(v31);
  if (CFStringGetCharacterAtIndex(v16, v32 - 1) != 47)
    CFStringAppend(v16, CFSTR("/"));
  CFStringAppend(v16, v6);
  v33 = CFStringGetLength(v16);
  if (v33)
  {
    v34 = 2 * v33 + 2;
    v12 = (char *)malloc_type_malloc(v34, 0xDCD744E4uLL);
    if (CFStringGetCString(v16, v12, v34, 0x8000100u) && (stat(v12, &v35) & 0x80000000) == 0)
      goto LABEL_59;
  }
  else
  {
    v12 = 0;
  }
  CFRelease(v16);
LABEL_58:
  v16 = 0;
LABEL_59:
  if (v12)
    free(v12);
  CFRelease(v6);
  if (!v16)
    goto LABEL_64;
  v6 = v8;
  if (v8)
    goto LABEL_63;
  return v16;
}

id PDFCGColorCreateGenericGray(CGFloat a1, CGFloat a2)
{
  CGColorSpace *DeviceGray;
  CGColor *v5;
  void *v6;
  CGFloat components[3];

  components[2] = *(CGFloat *)MEMORY[0x24BDAC8D0];
  DeviceGray = CGColorSpaceCreateDeviceGray();
  components[0] = a1;
  components[1] = a2;
  v5 = CGColorCreate(DeviceGray, components);
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithCGColor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (DeviceGray)
    CGColorSpaceRelease(DeviceGray);
  if (v5)
    CGColorRelease(v5);
  return v6;
}

id PDFCGColorCreateGenericRGB(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  CGColorSpace *DeviceRGB;
  CGColor *v9;
  void *v10;
  CGFloat components[5];

  components[4] = *(CGFloat *)MEMORY[0x24BDAC8D0];
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  components[0] = a1;
  components[1] = a2;
  components[2] = a3;
  components[3] = a4;
  v9 = CGColorCreate(DeviceRGB, components);
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithCGColor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (DeviceRGB)
    CGColorSpaceRelease(DeviceRGB);
  if (v9)
    CGColorRelease(v9);
  return v10;
}

id PDFCGColorCreateGenericCMYK(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  CGColorSpace *DeviceCMYK;
  CGColor *v11;
  void *v12;
  CGFloat v14[6];

  v14[5] = *(CGFloat *)MEMORY[0x24BDAC8D0];
  DeviceCMYK = CGColorSpaceCreateDeviceCMYK();
  v14[0] = a1;
  v14[1] = a2;
  v14[2] = a3;
  v14[3] = a4;
  v14[4] = a5;
  v11 = CGColorCreate(DeviceCMYK, v14);
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithCGColor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (DeviceCMYK)
    CGColorSpaceRelease(DeviceCMYK);
  if (v11)
    CGColorRelease(v11);
  return v12;
}

id PDFColorCreateFromNSArray(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  float v4;
  float v5;
  CGFloat v6;
  void *v7;
  float v8;
  CGFloat v9;
  void *v10;
  float v11;
  float v12;
  CGFloat v13;
  float v14;
  CGFloat v15;
  float v16;
  CGFloat v17;
  void *v18;
  float v19;

  v1 = a1;
  switch(objc_msgSend(v1, "count"))
  {
    case 0:
      PDFCGColorCreateGenericGray(0.0, 0.0);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      objc_msgSend(v1, "objectAtIndex:", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "floatValue");
      PDFCGColorCreateGenericGray(v4, 1.0);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 3:
      objc_msgSend(v1, "objectAtIndex:", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "floatValue");
      v6 = v5;
      objc_msgSend(v1, "objectAtIndex:", 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "floatValue");
      v9 = v8;
      objc_msgSend(v1, "objectAtIndex:", 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "floatValue");
      PDFCGColorCreateGenericRGB(v6, v9, v11, 1.0);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 4:
      objc_msgSend(v1, "objectAtIndex:", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "floatValue");
      v13 = v12;
      objc_msgSend(v1, "objectAtIndex:", 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "floatValue");
      v15 = v14;
      objc_msgSend(v1, "objectAtIndex:", 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "floatValue");
      v17 = v16;
      objc_msgSend(v1, "objectAtIndex:", 3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "floatValue");
      PDFCGColorCreateGenericCMYK(v13, v15, v17, v19, 1.0);
      v2 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
LABEL_8:

      break;
    default:
      NSLog(CFSTR("Error: Cannot create color from given array: %@"), v1);
      v2 = 0;
      break;
  }

  return v2;
}

id PDFColorCreateFromCGPDFArray(CGPDFArray *a1)
{
  CGFloat v2;
  CGFloat v3;
  void *v4;
  size_t Count;
  id result;
  CGPDFReal value[2];
  CGPDFReal v8[3];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  *(_OWORD *)value = xmmword_209DC0840;
  *(_OWORD *)v8 = unk_209DC0850;
  switch(CGPDFArrayGetCount(a1))
  {
    case 0uLL:
      v2 = 0.0;
      v3 = 0.0;
      goto LABEL_4;
    case 1uLL:
      CGPDFArrayGetNumber(a1, 0, value);
      v2 = value[0];
      v3 = 1.0;
LABEL_4:
      PDFCGColorCreateGenericGray(v2, v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 3uLL:
      CGPDFArrayGetNumber(a1, 0, value);
      CGPDFArrayGetNumber(a1, 1uLL, &value[1]);
      CGPDFArrayGetNumber(a1, 2uLL, v8);
      PDFCGColorCreateGenericRGB(value[0], value[1], v8[0], 1.0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 4uLL:
      CGPDFArrayGetNumber(a1, 0, value);
      CGPDFArrayGetNumber(a1, 1uLL, &value[1]);
      CGPDFArrayGetNumber(a1, 2uLL, v8);
      CGPDFArrayGetNumber(a1, 3uLL, &v8[1]);
      PDFCGColorCreateGenericCMYK(value[0], value[1], v8[0], v8[1], 1.0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
      result = v4;
      break;
    default:
      Count = CGPDFArrayGetCount(a1);
      NSLog(CFSTR("Error: Cannot create color from given array of component count %d"), Count);
      result = 0;
      break;
  }
  return result;
}

void PDFKitPlatformColorGetRGBA(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v9;
  id v10;
  CGColor *v11;
  CGColorSpace *v12;
  CGColor *CopyByMatchingToColorSpace;
  id v14;

  v9 = a1;
  if (v9)
  {
    v10 = objc_retainAutorelease(v9);
    v11 = (CGColor *)objc_msgSend(v10, "CGColor");
    v12 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF2A0]);
    CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v12, kCGRenderingIntentDefault, v11, 0);
    CGColorSpaceRelease(v12);
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithCGColor:", CopyByMatchingToColorSpace);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    CGColorRelease(CopyByMatchingToColorSpace);
    objc_msgSend(v14, "getRed:green:blue:alpha:", a2, a3, a4, a5);

  }
}

BOOL PDFColorComponentsAreEqual(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  int64_t NumberOfComponents;
  id v7;
  const CGFloat *Components;
  const CGFloat *v9;
  int64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  BOOL v16;
  _BOOL8 v17;

  v3 = a1;
  v4 = a2;
  v5 = objc_retainAutorelease(v3);
  NumberOfComponents = CGColorGetNumberOfComponents((CGColorRef)objc_msgSend(v5, "CGColor"));
  v7 = objc_retainAutorelease(v4);
  if (NumberOfComponents == CGColorGetNumberOfComponents((CGColorRef)objc_msgSend(v7, "CGColor")))
  {
    Components = CGColorGetComponents((CGColorRef)objc_msgSend(objc_retainAutorelease(v5), "CGColor"));
    v9 = CGColorGetComponents((CGColorRef)objc_msgSend(objc_retainAutorelease(v7), "CGColor"));
    v10 = NumberOfComponents - 1;
    if (NumberOfComponents < 1)
    {
      v17 = 1;
    }
    else
    {
      do
      {
        v11 = *Components++;
        v12 = v11;
        v13 = *v9++;
        v14 = vabdd_f64(v12, v13);
        v16 = v10-- != 0;
        v17 = v14 <= 0.001;
      }
      while (v14 <= 0.001 && v16);
    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

BOOL PDFKitCGImageIsWideGamut(CGImage *a1)
{
  CGColorSpace *ColorSpace;

  return a1 && (ColorSpace = CGImageGetColorSpace(a1)) != 0 && CGColorSpaceIsWideGamutRGB(ColorSpace);
}

uint64_t PDFFontWithNameAndSize(uint64_t a1, double a2)
{
  if (a2 == 0.0)
    a2 = 12.0;
  return objc_msgSend(MEMORY[0x24BDF6A70], "fontWithName:size:", a1, a2);
}

double PDFScreenGetBackingScaleFactor()
{
  void *v0;
  double v1;
  double v2;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "scale");
  v2 = v1;

  return v2;
}

void PDFKitAddRelativeCurveToPoint(void *a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  double v13;
  double v14;
  id v15;

  v15 = a1;
  objc_msgSend(v15, "currentPoint");
  objc_msgSend(v15, "addCurveToPoint:controlPoint1:controlPoint2:", a2 + v13, a3 + v14, a4 + v13, a5 + v14, a6 + v13, a7 + v14);

}

uint64_t PDFKitBezierPathWithRoundedRect()
{
  return objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithRoundedRect:cornerRadius:");
}

uint64_t PDFURLLooksSuspicious(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;

  v1 = a1;
  objc_msgSend(v1, "scheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (((objc_msgSend(v3, "isEqualToString:", CFSTR("http")) & 1) != 0
     || objc_msgSend(v3, "isEqualToString:", CFSTR("https")))
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = objc_msgSend(v1, "_lp_userVisibleStringUsesEncodedHost");
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t PDFKitBundle()
{
  return objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.PDFKit"));
}

uint64_t GetDefaultsWriteValue(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a1;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      a2 = objc_msgSend(v5, "BOOLForKey:", v3);
  }

  return a2;
}

uint64_t GetUseWhippet()
{
  if ((sUseWhippet & 1) != 0)
    return 0;
  else
    return GetDefaultsWriteValue(CFSTR("PDFKit2_UseWhippet"), 1);
}

uint64_t GetUseIOSurfaceForTiles()
{
  if (sUseIOSurfaceForTiles_0 == 2)
    return GetDefaultsWriteValue(CFSTR("PDFKit2_UseIOSurfaceForTiles"), 1);
  else
    return sUseIOSurfaceForTiles_0 == 1;
}

uint64_t SetUseIOSurfaceForTiles(uint64_t result)
{
  sUseIOSurfaceForTiles_0 = result;
  if ((result & 1) == 0)
    sUseWhippet = 1;
  return result;
}

uint64_t GetDefaultsWriteColorTileEdge()
{
  return GetDefaultsWriteValue(CFSTR("PDFKit2_ColorTileEdge"), 0);
}

uint64_t GetDefaultsWriteDrawTiles()
{
  return GetDefaultsWriteValue(CFSTR("PDFKit2_DrawTiles"), 1);
}

uint64_t GetDefaultsWriteColorWidgetBackgrounds()
{
  return GetDefaultsWriteValue(CFSTR("PDFKit2_ColorWidgetBackgrounds"), 0);
}

uint64_t GetDefaultsWriteUseAppendMode()
{
  return GetDefaultsWriteValue(CFSTR("PDFKit2_UseAppendMode"), 1);
}

uint64_t GetDefaultsWriteDrawInvisibleText()
{
  return GetDefaultsWriteValue(CFSTR("PDFKit2_DrawInvisibleText"), 0);
}

uint64_t GetDefaultsWriteAnnotationLoggingEnabled()
{
  if (GetDefaultsWriteAnnotationLoggingEnabled_onceToken != -1)
    dispatch_once(&GetDefaultsWriteAnnotationLoggingEnabled_onceToken, &__block_literal_global_15);
  return GetDefaultsWriteAnnotationLoggingEnabled_value;
}

uint64_t GetDefaultsWriteDrawAccessibility()
{
  return GetDefaultsWriteValue(CFSTR("PDFKit2_DrawAccessibility"), 0);
}

uint64_t GetDefaultsWriteHighlightAnnotations()
{
  return GetDefaultsWriteValue(CFSTR("PDFKit2_HighlightAnnotations"), 0);
}

uint64_t GetDefaultsWriteHighlightRedactions()
{
  return GetDefaultsWriteValue(CFSTR("PDFKit2_HighlightRedactions"), 0);
}

uint64_t GetDefaultsWriteHighlightDetectedAnnotations()
{
  return GetDefaultsWriteValue(CFSTR("PDFKit2_HighlightDetectedAnnotations"), 0);
}

uint64_t GetDefaultsWriteLogPerfTimes()
{
  return GetDefaultsWriteValue(CFSTR("PDFKit2_LogPerfTime"), 0);
}

uint64_t PDFKitIsOCREnabled()
{
  uint64_t result;

  result = GetDefaultsWriteValue(CFSTR("PDFKit2_OCR_Enabled"), 1);
  if ((_DWORD)result)
  {
    if ((_os_feature_enabled_impl() & 1) != 0)
      return 1;
    else
      return _os_feature_enabled_impl();
  }
  return result;
}

uint64_t PDFKitIsVisionKitFormDetectionEnabled()
{
  uint64_t result;

  result = GetDefaultsWriteValue(CFSTR("PDFKit2_VisionKitFormDetectionEnabled"), 1);
  if ((_DWORD)result)
    return _os_feature_enabled_impl();
  return result;
}

uint64_t PDFKitIsFormFillingEnabled()
{
  return _os_feature_enabled_impl();
}

uint64_t GetDefaultsWriteDrawOCRQuads()
{
  return GetDefaultsWriteValue(CFSTR("PDFKit2_DrawOCRQuads"), 0);
}

BOOL ShouldRenderAnnotationsInPDFKit()
{
  return AKAdaptorEnabled == 0;
}

uint64_t GetDefaultsWriteAKEnabled()
{
  return AKAdaptorEnabled;
}

uint64_t PDFRectToString(double a1, double a2, double a3, double a4)
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%.2f, %.2f), [%.2f, %.2f]"), *(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

double GetMachSeconds()
{
  unint64_t v0;
  unint64_t v1;
  mach_timebase_info info;

  if (*(double *)&GetMachSeconds_kMachAbsTimeToSeconds <= 0.0)
  {
    info = 0;
    mach_timebase_info(&info);
    LODWORD(v1) = info.denom;
    LODWORD(v0) = info.numer;
    *(double *)&GetMachSeconds_kMachAbsTimeToSeconds = (double)v0 / (double)v1 / 1000000000.0;
  }
  return *(double *)&GetMachSeconds_kMachAbsTimeToSeconds * (double)mach_absolute_time();
}

uint64_t PDFKitDeviceIsiPhone()
{
  if (PDFKitDeviceIsiPhone_onceToken != -1)
    dispatch_once(&PDFKitDeviceIsiPhone_onceToken, &__block_literal_global_123);
  return PDFKitDeviceIsiPhone_deviceIsiPhone;
}

uint64_t PDFKitDeviceIsiPad()
{
  if (PDFKitDeviceIsiPad_onceToken != -1)
    dispatch_once(&PDFKitDeviceIsiPad_onceToken, &__block_literal_global_125);
  return PDFKitDeviceIsiPad_deviceIsiPad;
}

uint64_t PDFKitDeviceIsN61()
{
  if (PDFKitDeviceIsN61_onceToken != -1)
    dispatch_once(&PDFKitDeviceIsN61_onceToken, &__block_literal_global_126);
  return PDFKitDeviceIsN61_deviceIsN61;
}

uint64_t PDFKitDeviceIsN56()
{
  if (PDFKitDeviceIsN56_onceToken != -1)
    dispatch_once(&PDFKitDeviceIsN56_onceToken, &__block_literal_global_127);
  return PDFKitDeviceIsN56_deviceIsN56;
}

BOOL PDFSubclassOverridesSelector(objc_class *a1, objc_class *a2, SEL name)
{
  IMP MethodImplementation;
  IMP v6;
  BOOL v7;

  if (a1 == a2)
    return 0;
  MethodImplementation = class_getMethodImplementation(a1, name);
  v6 = class_getMethodImplementation(a2, name);
  if (MethodImplementation)
    v7 = v6 == 0;
  else
    v7 = 1;
  return !v7 && MethodImplementation != v6;
}

void sub_209D8F2B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_209D8F34C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_209D8F460(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_209D8FA10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id AKAnnotationClass()
{
  if (loadAnnotationKit_onceToken != -1)
    dispatch_once(&loadAnnotationKit_onceToken, &__block_literal_global_16);
  return (id)kAKAnnotationClass;
}

id AKControllerClass()
{
  if (loadAnnotationKit_onceToken != -1)
    dispatch_once(&loadAnnotationKit_onceToken, &__block_literal_global_16);
  return (id)kAKControllerClass;
}

id AKToolbarViewClass()
{
  if (loadAnnotationKit_onceToken != -1)
    dispatch_once(&loadAnnotationKit_onceToken, &__block_literal_global_16);
  return (id)kAKToolbarViewClass;
}

id AKPageModelControllerClass()
{
  if (loadAnnotationKit_onceToken != -1)
    dispatch_once(&loadAnnotationKit_onceToken, &__block_literal_global_16);
  return (id)kAKPageModelControllerClass;
}

id AKArrowAnnotationClass()
{
  if (loadAnnotationKit_onceToken != -1)
    dispatch_once(&loadAnnotationKit_onceToken, &__block_literal_global_16);
  return (id)kAKArrowAnnotationClass;
}

id AKArrowShapeAnnotationClass()
{
  if (loadAnnotationKit_onceToken != -1)
    dispatch_once(&loadAnnotationKit_onceToken, &__block_literal_global_16);
  return (id)kAKArrowShapeAnnotationClass;
}

id AKBorderMaskAnnotationClass()
{
  if (loadAnnotationKit_onceToken != -1)
    dispatch_once(&loadAnnotationKit_onceToken, &__block_literal_global_16);
  return (id)kAKBorderMaskAnnotationClass;
}

id AKCropAnnotationClass()
{
  if (loadAnnotationKit_onceToken != -1)
    dispatch_once(&loadAnnotationKit_onceToken, &__block_literal_global_16);
  return (id)kAKCropAnnotationClass;
}

id AKDoodleAnnotationClass()
{
  if (loadAnnotationKit_onceToken != -1)
    dispatch_once(&loadAnnotationKit_onceToken, &__block_literal_global_16);
  return (id)kAKDoodleAnnotationClass;
}

id AKInkAnnotationClass()
{
  if (loadAnnotationKit_onceToken != -1)
    dispatch_once(&loadAnnotationKit_onceToken, &__block_literal_global_16);
  return (id)kAKInkAnnotationClass;
}

id AKHeartAnnotationClass()
{
  if (loadAnnotationKit_onceToken != -1)
    dispatch_once(&loadAnnotationKit_onceToken, &__block_literal_global_16);
  return (id)kAKHeartAnnotationClass;
}

id AKImageAnnotationClass()
{
  if (loadAnnotationKit_onceToken != -1)
    dispatch_once(&loadAnnotationKit_onceToken, &__block_literal_global_16);
  return (id)kAKImageAnnotationClass;
}

id AKLoupeAnnotationClass()
{
  if (loadAnnotationKit_onceToken != -1)
    dispatch_once(&loadAnnotationKit_onceToken, &__block_literal_global_16);
  return (id)kAKLoupeAnnotationClass;
}

id AKOvalAnnotationClass()
{
  if (loadAnnotationKit_onceToken != -1)
    dispatch_once(&loadAnnotationKit_onceToken, &__block_literal_global_16);
  return (id)kAKOvalAnnotationClass;
}

id AKPolygonAnnotationClass()
{
  if (loadAnnotationKit_onceToken != -1)
    dispatch_once(&loadAnnotationKit_onceToken, &__block_literal_global_16);
  return (id)kAKPolygonAnnotationClass;
}

id AKRectAnnotationClass()
{
  if (loadAnnotationKit_onceToken != -1)
    dispatch_once(&loadAnnotationKit_onceToken, &__block_literal_global_16);
  return (id)kAKRectAnnotationClass;
}

id AKRedactionRectAnnotationClass()
{
  if (loadAnnotationKit_onceToken != -1)
    dispatch_once(&loadAnnotationKit_onceToken, &__block_literal_global_16);
  return (id)kAKRedactionRectAnnotationClass;
}

id AKSignatureAnnotationClass()
{
  if (loadAnnotationKit_onceToken != -1)
    dispatch_once(&loadAnnotationKit_onceToken, &__block_literal_global_16);
  return (id)kAKSignatureAnnotationClass;
}

id AKSpeechBubbleAnnotationClass()
{
  if (loadAnnotationKit_onceToken != -1)
    dispatch_once(&loadAnnotationKit_onceToken, &__block_literal_global_16);
  return (id)kAKSpeechBubbleAnnotationClass;
}

id AKStarAnnotationClass()
{
  if (loadAnnotationKit_onceToken != -1)
    dispatch_once(&loadAnnotationKit_onceToken, &__block_literal_global_16);
  return (id)kAKStarAnnotationClass;
}

id AKTextBoxAnnotationClass()
{
  if (loadAnnotationKit_onceToken != -1)
    dispatch_once(&loadAnnotationKit_onceToken, &__block_literal_global_16);
  return (id)kAKTextBoxAnnotationClass;
}

id AKTextFieldAnnotationClass()
{
  if (loadAnnotationKit_onceToken != -1)
    dispatch_once(&loadAnnotationKit_onceToken, &__block_literal_global_16);
  return (id)kAKTextFieldAnnotationClass;
}

id AKThoughtBubbleAnnotationClass()
{
  if (loadAnnotationKit_onceToken != -1)
    dispatch_once(&loadAnnotationKit_onceToken, &__block_literal_global_16);
  return (id)kAKThoughtBubbleAnnotationClass;
}

id AKTriangleAnnotationClass()
{
  if (loadAnnotationKit_onceToken != -1)
    dispatch_once(&loadAnnotationKit_onceToken, &__block_literal_global_16);
  return (id)kAKTriangleAnnotationClass;
}

id AKSignaturesPresentationContextClass()
{
  if (loadAnnotationKit_onceToken != -1)
    dispatch_once(&loadAnnotationKit_onceToken, &__block_literal_global_16);
  return (id)kAKSignaturesPresentationContextClass;
}

id AKWillBeginEditingTextAnnotationNotificationString()
{
  if (loadAnnotationKit_onceToken != -1)
    dispatch_once(&loadAnnotationKit_onceToken, &__block_literal_global_16);
  return (id)kAKWillBeginEditingTextAnnotationNotificationString;
}

id AKDidEndEditingTextAnnotationNotificationString()
{
  if (loadAnnotationKit_onceToken != -1)
    dispatch_once(&loadAnnotationKit_onceToken, &__block_literal_global_16);
  return (id)kAKWillDidEndTextAnnotationNotificationString;
}

id AKEditingTextAnnotationKeyString()
{
  if (loadAnnotationKit_onceToken != -1)
    dispatch_once(&loadAnnotationKit_onceToken, &__block_literal_global_16);
  return (id)kAKEditingTextAnnotationKeyString;
}

void __loadAnnotationKit_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  if (dlopen("/System/Library/PrivateFrameworks/AnnotationKit.framework/AnnotationKit", 1))
  {
    kAKAnnotationClass = (uint64_t)NSClassFromString(CFSTR("AKAnnotation"));
    kAKControllerClass = (uint64_t)NSClassFromString(CFSTR("AKController"));
    kAKToolbarViewClass = (uint64_t)NSClassFromString(CFSTR("AKToolbarView"));
    kAKPageModelControllerClass = (uint64_t)NSClassFromString(CFSTR("AKPageModelController"));
    kAKArrowAnnotationClass = (uint64_t)NSClassFromString(CFSTR("AKArrowAnnotation"));
    kAKArrowShapeAnnotationClass = (uint64_t)NSClassFromString(CFSTR("AKArrowShapeAnnotation"));
    kAKBorderMaskAnnotationClass = (uint64_t)NSClassFromString(CFSTR("AKBorderMaskAnnotation"));
    kAKCropAnnotationClass = (uint64_t)NSClassFromString(CFSTR("AKCropAnnotation"));
    kAKDoodleAnnotationClass = (uint64_t)NSClassFromString(CFSTR("AKDoodleAnnotation"));
    kAKInkAnnotationClass = (uint64_t)NSClassFromString(CFSTR("AKInkAnnotation"));
    kAKHeartAnnotationClass = (uint64_t)NSClassFromString(CFSTR("AKHeartAnnotation"));
    kAKImageAnnotationClass = (uint64_t)NSClassFromString(CFSTR("AKImageAnnotation"));
    kAKLoupeAnnotationClass = (uint64_t)NSClassFromString(CFSTR("AKLoupeAnnotation"));
    kAKOvalAnnotationClass = (uint64_t)NSClassFromString(CFSTR("AKOvalAnnotation"));
    kAKPolygonAnnotationClass = (uint64_t)NSClassFromString(CFSTR("AKPolygonAnnotation"));
    kAKRectAnnotationClass = (uint64_t)NSClassFromString(CFSTR("AKRectAnnotation"));
    kAKRedactionRectAnnotationClass = (uint64_t)NSClassFromString(CFSTR("AKRedactionRectAnnotation"));
    kAKSignatureAnnotationClass = (uint64_t)NSClassFromString(CFSTR("AKSignatureAnnotation"));
    kAKSpeechBubbleAnnotationClass = (uint64_t)NSClassFromString(CFSTR("AKSpeechBubbleAnnotation"));
    kAKStarAnnotationClass = (uint64_t)NSClassFromString(CFSTR("AKStarAnnotation"));
    kAKTextBoxAnnotationClass = (uint64_t)NSClassFromString(CFSTR("AKTextBoxAnnotation"));
    kAKTextFieldAnnotationClass = (uint64_t)NSClassFromString(CFSTR("AKTextFieldAnnotation"));
    kAKThoughtBubbleAnnotationClass = (uint64_t)NSClassFromString(CFSTR("AKThoughtBubbleAnnotation"));
    kAKTriangleAnnotationClass = (uint64_t)NSClassFromString(CFSTR("AKTriangleAnnotation"));
    kAKSignaturesPresentationContextClass = (uint64_t)NSClassFromString(CFSTR("AKSignaturesPresentationContext"));
    v0 = (void *)kAKWillBeginEditingTextAnnotationNotificationString;
    kAKWillBeginEditingTextAnnotationNotificationString = (uint64_t)CFSTR("com.apple.AnnotationKit.AKWillBeginEditingTextAnnotationNotification");

    v1 = (void *)kAKWillDidEndTextAnnotationNotificationString;
    kAKWillDidEndTextAnnotationNotificationString = (uint64_t)CFSTR("com.apple.AnnotationKit.AKDidEndEditingTextAnnotationNotification");

    v2 = (void *)kAKEditingTextAnnotationKeyString;
    kAKEditingTextAnnotationKeyString = (uint64_t)CFSTR("com.apple.AnnotationKit.AKEditingTextAnnotationKey");

  }
}

void sub_209D92600(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209D94344(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void sub_209D94C3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{

  _Unwind_Resume(a1);
}

uint64_t DrawPDFPageWithProgressCallback(uint64_t a1)
{
  void *v1;

  if (a1 && (v1 = *(void **)a1, ++*(_QWORD *)(a1 + 8), v1))
    return objc_msgSend(v1, "drawProgressCallback");
  else
    return 1;
}

void sub_209D95890(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209D97544(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209D97CD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _sortCGSelections(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;

  v2 = a2;
  CGPDFSelectionGetClientProperty();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "document");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "indexForPage:", v3);

  CGPDFSelectionGetClientProperty();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "document");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexForPage:", v6);

  if (v5 < v8)
    v9 = -1;
  else
    v9 = v5 > v8;

  return v9;
}

uint64_t _sortPageRanges(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;

  v3 = a1;
  v4 = a2;
  objc_msgSend(v3, "page");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "document");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "page");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "indexForPage:", v7);

  objc_msgSend(v4, "page");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "document");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "page");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "indexForPage:", v11);

  if (v8 >= v12)
  {
    if (v8 > v12)
    {
      v13 = 1;
    }
    else
    {
      v14 = objc_msgSend(v3, "range");
      v15 = objc_msgSend(v4, "range");
      if (v14 < v15)
        v13 = -1;
      else
        v13 = v14 != v15;
    }
  }
  else
  {
    v13 = -1;
  }

  return v13;
}

void sub_209DA4494(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209DAA298(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void sub_209DADCE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location,char a21)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

void sub_209DADE40(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t __getCRNormalizedQuadClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getVKCFormRegionClass_block_invoke_cold_1(v0);
}

uint64_t __getVKCFormRegionClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return ___ZL23getVKImageAnalyzerClassv_block_invoke_cold_1(v0);
}

uint64_t ___ZL23getVKImageAnalyzerClassv_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return ___ZL30getVKImageAnalyzerRequestClassv_block_invoke_cold_1(v0);
}

uint64_t ___ZL30getVKImageAnalyzerRequestClassv_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return CGBuf::CGBuf(v0);
}

uint64_t CGBuf::CGBuf()
{
  return _CGHandleAssert();
}

void ___ZL14getVKQuadClassv_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getAFInsertionManagerClass_block_invoke_cold_1(v0);
}

void __getAFInsertionManagerClass_block_invoke_cold_1()
{
  abort_report_np();
  CACurrentMediaTime();
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x24BDE5410]();
  return result;
}

uint64_t CAEncodeLayerTree()
{
  return MEMORY[0x24BDE5420]();
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x24BDE55D0](retstr, sx, sy, sz);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F0](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB810](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
  MEMORY[0x24BDBB880](theArray, idx);
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
  MEMORY[0x24BDBB898](theArray, idx, value);
}

CFAttributedStringRef CFAttributedStringCreate(CFAllocatorRef alloc, CFStringRef str, CFDictionaryRef attributes)
{
  return (CFAttributedStringRef)MEMORY[0x24BDBB8B0](alloc, str, attributes);
}

CFDictionaryRef CFAttributedStringGetAttributes(CFAttributedStringRef aStr, CFIndex loc, CFRange *effectiveRange)
{
  return (CFDictionaryRef)MEMORY[0x24BDBB8F0](aStr, loc, effectiveRange);
}

CFIndex CFAttributedStringGetLength(CFAttributedStringRef aStr)
{
  return MEMORY[0x24BDBB900](aStr);
}

CFStringRef CFAttributedStringGetString(CFAttributedStringRef aStr)
{
  return (CFStringRef)MEMORY[0x24BDBB908](aStr);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x24BDBBCB0](allocator, capacity);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x24BDBBCE8](theData, range.location, range.length, buffer);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDE0](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF8](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x24BDBBE00](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
  MEMORY[0x24BDBBE10](theDict, keys, values);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x24BDBBE48](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFTypeID CFNullGetTypeID(void)
{
  return MEMORY[0x24BDBC090]();
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC2F8]();
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC300]();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
  MEMORY[0x24BDBC338](rl, mode, block);
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
  MEMORY[0x24BDBC3B8](rl);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x24BDBC3C0](theSet, value);
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x24BDBC3D0](theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x24BDBC3E8](allocator, capacity, callBacks);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x24BDBC4A8](theString, appendedString);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC540](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x24BDBC558](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

Boolean CFStringFindWithOptions(CFStringRef theString, CFStringRef stringToFind, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x24BDBC5E8](theString, stringToFind, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x24BDBC618](theString, idx);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC660](length, *(_QWORD *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x24BDBC6A8](theString, prefix);
}

void CFStringInsert(CFMutableStringRef str, CFIndex idx, CFStringRef insertedStr)
{
  MEMORY[0x24BDBC6B8](str, idx, insertedStr);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8A0](retstr, t1, t2);
}

CGAffineTransformComponents *__cdecl CGAffineTransformDecompose(CGAffineTransformComponents *__return_ptr retstr, CGAffineTransform *transform)
{
  return (CGAffineTransformComponents *)MEMORY[0x24BDBD8A8](retstr, transform);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8C0](retstr, t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8D8](retstr, angle);
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

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD900](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD908](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x24BDBD918](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x24BDBD920](context);
}

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return MEMORY[0x24BDBD970](context);
}

size_t CGBitmapContextGetWidth(CGContextRef context)
{
  return MEMORY[0x24BDBD978](context);
}

uint64_t CGBitmapGetAlignedBytesPerRow()
{
  return MEMORY[0x24BDBD988]();
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x24BDBDA78](space, components);
}

CGColorRef CGColorCreateCopyByMatchingToColorSpace(CGColorSpaceRef a1, CGColorRenderingIntent intent, CGColorRef color, CFDictionaryRef options)
{
  return (CGColorRef)MEMORY[0x24BDBDA88](a1, *(_QWORD *)&intent, color, options);
}

CGColorRef CGColorCreateSRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x24BDBDAB0](red, green, blue, alpha);
}

BOOL CGColorEqualToColor(CGColorRef color1, CGColorRef color2)
{
  return MEMORY[0x24BDBDAC0](color1, color2);
}

CGFloat CGColorGetAlpha(CGColorRef color)
{
  CGFloat result;

  MEMORY[0x24BDBDAE8](color);
  return result;
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDAF0](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x24BDBDAF8](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x24BDBDB08](color);
}

CGPatternRef CGColorGetPattern(CGColorRef color)
{
  return (CGPatternRef)MEMORY[0x24BDBDB10](color);
}

void CGColorRelease(CGColorRef color)
{
  MEMORY[0x24BDBDB40](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceCMYK(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB78]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB80]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB88]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDBB8](name);
}

uint64_t CGColorSpaceEqualToColorSpace()
{
  return MEMORY[0x24BDBDBC8]();
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x24BDBDC10](space);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x24BDBDC20](space);
}

BOOL CGColorSpaceIsWideGamutRGB(CGColorSpaceRef a1)
{
  return MEMORY[0x24BDBDC58](a1);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x24BDBDC60](space);
}

CGColorSpaceRef CGColorSpaceRetain(CGColorSpaceRef space)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDC68](space);
}

void CGContextAddCurveToPoint(CGContextRef c, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBDCC0](c, cp1x, cp1y, cp2x, cp2y, x, y);
}

void CGContextAddEllipseInRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDCC8](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextAddLineToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBDCD0](c, x, y);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
  MEMORY[0x24BDBDCE0](c, path);
}

void CGContextAddRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDCF0](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextBeginPath(CGContextRef c)
{
  MEMORY[0x24BDBDD00](c);
}

void CGContextClip(CGContextRef c)
{
  MEMORY[0x24BDBDD28](c);
}

void CGContextClipToRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDD38](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextClosePath(CGContextRef c)
{
  MEMORY[0x24BDBDD48](c);
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
  MEMORY[0x24BDBDD50](c, transform);
}

uint64_t CGContextDrawDisplayList()
{
  return MEMORY[0x24BDBDDD0]();
}

uint64_t CGContextDrawPDFPageWithProgressCallback()
{
  return MEMORY[0x24BDBDE10]();
}

void CGContextDrawPath(CGContextRef c, CGPathDrawingMode mode)
{
  MEMORY[0x24BDBDE18](c, *(_QWORD *)&mode);
}

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDE60](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextFillPath(CGContextRef c)
{
  MEMORY[0x24BDBDE68](c);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDE70](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextFlush(CGContextRef c)
{
  MEMORY[0x24BDBDE78](c);
}

CGAffineTransform *__cdecl CGContextGetCTM(CGAffineTransform *__return_ptr retstr, CGContextRef c)
{
  return (CGAffineTransform *)MEMORY[0x24BDBDE98](retstr, c);
}

CGRect CGContextGetClipBoundingBox(CGContextRef c)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x24BDBDEA0](c);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

uint64_t CGContextGetProperty()
{
  return MEMORY[0x24BDBDEF0]();
}

uint64_t CGContextGetType()
{
  return MEMORY[0x24BDBDF10]();
}

void CGContextMoveToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBDF20](c, x, y);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x24BDBDF30](c);
}

void CGContextRestoreGState(CGContextRef c)
{
  MEMORY[0x24BDBDF58](c);
}

CGContextRef CGContextRetain(CGContextRef c)
{
  return (CGContextRef)MEMORY[0x24BDBDF60](c);
}

void CGContextRotateCTM(CGContextRef c, CGFloat angle)
{
  MEMORY[0x24BDBDF68](c, angle);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x24BDBDF70](c);
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
  MEMORY[0x24BDBDF78](c, sx, sy);
}

void CGContextSetAllowsAntialiasing(CGContextRef c, BOOL allowsAntialiasing)
{
  MEMORY[0x24BDBDF80](c, allowsAntialiasing);
}

uint64_t CGContextSetCTM()
{
  return MEMORY[0x24BDBDFB8]();
}

uint64_t CGContextSetCompositeOperation()
{
  return MEMORY[0x24BDBDFC0]();
}

void CGContextSetFillColor(CGContextRef c, const CGFloat *components)
{
  MEMORY[0x24BDBDFC8](c, components);
}

void CGContextSetFillColorSpace(CGContextRef c, CGColorSpaceRef space)
{
  MEMORY[0x24BDBDFD0](c, space);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBDFD8](c, color);
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
  MEMORY[0x24BDBE018](c, *(_QWORD *)&quality);
}

void CGContextSetLineCap(CGContextRef c, CGLineCap cap)
{
  MEMORY[0x24BDBE020](c, *(_QWORD *)&cap);
}

void CGContextSetLineDash(CGContextRef c, CGFloat phase, const CGFloat *lengths, size_t count)
{
  MEMORY[0x24BDBE028](c, lengths, count, phase);
}

void CGContextSetLineJoin(CGContextRef c, CGLineJoin join)
{
  MEMORY[0x24BDBE030](c, *(_QWORD *)&join);
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
  MEMORY[0x24BDBE038](c, width);
}

uint64_t CGContextSetLineWidthThreshold()
{
  return MEMORY[0x24BDBE040]();
}

uint64_t CGContextSetProperty()
{
  return MEMORY[0x24BDBE058]();
}

void CGContextSetRGBFillColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  MEMORY[0x24BDBE060](c, red, green, blue, alpha);
}

void CGContextSetRGBStrokeColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  MEMORY[0x24BDBE068](c, red, green, blue, alpha);
}

void CGContextSetShouldAntialias(CGContextRef c, BOOL shouldAntialias)
{
  MEMORY[0x24BDBE088](c, shouldAntialias);
}

void CGContextSetStrokeColor(CGContextRef c, const CGFloat *components)
{
  MEMORY[0x24BDBE0C0](c, components);
}

void CGContextSetStrokeColorSpace(CGContextRef c, CGColorSpaceRef space)
{
  MEMORY[0x24BDBE0C8](c, space);
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBE0D0](c, color);
}

uint64_t CGContextSetTextGreekingThreshold()
{
  return MEMORY[0x24BDBE0E8]();
}

void CGContextSetTextMatrix(CGContextRef c, CGAffineTransform *t)
{
  MEMORY[0x24BDBE0F0](c, t);
}

void CGContextSetTextPosition(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBE0F8](c, x, y);
}

void CGContextStrokeEllipseInRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBE108](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextStrokeLineSegments(CGContextRef c, const CGPoint *points, size_t count)
{
  MEMORY[0x24BDBE110](c, points, count);
}

void CGContextStrokePath(CGContextRef c)
{
  MEMORY[0x24BDBE118](c);
}

void CGContextStrokeRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBE120](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x24BDBE130](c, tx, ty);
}

CGDataConsumerRef CGDataConsumerCreateWithCFData(CFMutableDataRef data)
{
  return (CGDataConsumerRef)MEMORY[0x24BDBE148](data);
}

CGDataConsumerRef CGDataConsumerCreateWithURL(CFURLRef url)
{
  return (CGDataConsumerRef)MEMORY[0x24BDBE150](url);
}

void CGDataConsumerRelease(CGDataConsumerRef consumer)
{
  MEMORY[0x24BDBE160](consumer);
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x24BDBE180](data);
}

CGDataProviderRef CGDataProviderCreateWithURL(CFURLRef url)
{
  return (CGDataProviderRef)MEMORY[0x24BDBE1A0](url);
}

uint64_t CGDataProviderGetBytesInRanges()
{
  return MEMORY[0x24BDBE1B0]();
}

uint64_t CGDataProviderGetProperty()
{
  return MEMORY[0x24BDBE1B8]();
}

uint64_t CGDataProviderGetSizeOfData()
{
  return MEMORY[0x24BDBE1C0]();
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
  MEMORY[0x24BDBE1C8](provider);
}

uint64_t CGDataProviderSetProperty()
{
  return MEMORY[0x24BDBE1E0]();
}

uint64_t CGDisplayListContextCreate()
{
  return MEMORY[0x24BDBE1F0]();
}

uint64_t CGDisplayListCreate()
{
  return MEMORY[0x24BDBE1F8]();
}

uint64_t CGDisplayListCreateWithRect()
{
  return MEMORY[0x24BDBE200]();
}

uint64_t CGDisplayListDrawInContext()
{
  return MEMORY[0x24BDBE208]();
}

uint64_t CGDisplayListEntryGetBoundingBox()
{
  return MEMORY[0x24BDBE210]();
}

uint64_t CGDisplayListEntryGetType()
{
  return MEMORY[0x24BDBE218]();
}

uint64_t CGDisplayListEntryGlyphsCopyGlyphs()
{
  return MEMORY[0x24BDBE220]();
}

uint64_t CGDisplayListEntryGlyphsCopyPositions()
{
  return MEMORY[0x24BDBE228]();
}

uint64_t CGDisplayListEntryGlyphsGetCTM()
{
  return MEMORY[0x24BDBE230]();
}

uint64_t CGDisplayListEntryGlyphsGetCount()
{
  return MEMORY[0x24BDBE238]();
}

uint64_t CGDisplayListEntryGlyphsGetFTM()
{
  return MEMORY[0x24BDBE240]();
}

uint64_t CGDisplayListEntryGlyphsGetFont()
{
  return MEMORY[0x24BDBE248]();
}

uint64_t CGDisplayListEntryGlyphsGetScale()
{
  return MEMORY[0x24BDBE250]();
}

uint64_t CGDisplayListEntryImageGetImage()
{
  return MEMORY[0x24BDBE258]();
}

uint64_t CGDisplayListEntryPathGetPath()
{
  return MEMORY[0x24BDBE260]();
}

uint64_t CGDisplayListEnumerateEntriesWithOptions()
{
  return MEMORY[0x24BDBE268]();
}

uint64_t CGDisplayListGetNumberOfEntries()
{
  return MEMORY[0x24BDBE270]();
}

uint64_t CGDisplayListGetNumberOfEntriesOfType()
{
  return MEMORY[0x24BDBE278]();
}

uint64_t CGDisplayListRelease()
{
  return MEMORY[0x24BDBE280]();
}

uint64_t CGDisplayListRetain()
{
  return MEMORY[0x24BDBE288]();
}

uint64_t CGDisplayListSetBoundingBox()
{
  return MEMORY[0x24BDBE290]();
}

CFStringRef CGFontCopyPostScriptName(CGFontRef font)
{
  return (CFStringRef)MEMORY[0x24BDBE2B0](font);
}

CGRect CGFontGetFontBBox(CGFontRef font)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x24BDBE2F8](font);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

BOOL CGFontGetGlyphBBoxes(CGFontRef font, const CGGlyph *glyphs, size_t count, CGRect *bboxes)
{
  return MEMORY[0x24BDBE310](font, glyphs, count, bboxes);
}

uint64_t CGFontGetGlyphsForUnichars()
{
  return MEMORY[0x24BDBE320]();
}

int CGFontGetUnitsPerEm(CGFontRef font)
{
  return MEMORY[0x24BDBE350](font);
}

uint64_t CGIOSurfaceContextCreate()
{
  return MEMORY[0x24BDBE560]();
}

uint64_t CGIOSurfaceContextCreateWithOptions()
{
  return MEMORY[0x24BDBE568]();
}

uint64_t CGImageCreateFromIOSurface()
{
  return MEMORY[0x24BDD9030]();
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x24BDBE5F8](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x24BDBE648](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBE658](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x24BDBE680](image);
}

uint64_t CGImageGetSizeAfterOrientation()
{
  return MEMORY[0x24BDBE6D0]();
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x24BDBE6E0](image);
}

CFStringRef CGImageMetadataCopyStringValueWithPath(CGImageMetadataRef metadata, CGImageMetadataTagRef parent, CFStringRef path)
{
  return (CFStringRef)MEMORY[0x24BDD90A8](metadata, parent, path);
}

CGImageMetadataRef CGImageMetadataCreateFromXMPData(CFDataRef data)
{
  return (CGImageMetadataRef)MEMORY[0x24BDD90C0](data);
}

CGMutableImageMetadataRef CGImageMetadataCreateMutable(void)
{
  return (CGMutableImageMetadataRef)MEMORY[0x24BDD90C8]();
}

CGMutableImageMetadataRef CGImageMetadataCreateMutableCopy(CGImageMetadataRef metadata)
{
  return (CGMutableImageMetadataRef)MEMORY[0x24BDD90D0](metadata);
}

CFDataRef CGImageMetadataCreateXMPData(CGImageMetadataRef metadata, CFDictionaryRef options)
{
  return (CFDataRef)MEMORY[0x24BDD90D8](metadata, options);
}

void CGImageMetadataEnumerateTagsUsingBlock(CGImageMetadataRef metadata, CFStringRef rootPath, CFDictionaryRef options, CGImageMetadataTagBlock block)
{
  MEMORY[0x24BDD90E0](metadata, rootPath, options, block);
}

BOOL CGImageMetadataRegisterNamespaceForPrefix(CGMutableImageMetadataRef metadata, CFStringRef xmlns, CFStringRef prefix, CFErrorRef *err)
{
  return MEMORY[0x24BDD90E8](metadata, xmlns, prefix, err);
}

BOOL CGImageMetadataRemoveTagWithPath(CGMutableImageMetadataRef metadata, CGImageMetadataTagRef parent, CFStringRef path)
{
  return MEMORY[0x24BDD90F0](metadata, parent, path);
}

BOOL CGImageMetadataSetValueWithPath(CGMutableImageMetadataRef metadata, CGImageMetadataTagRef parent, CFStringRef path, CFTypeRef value)
{
  return MEMORY[0x24BDD9108](metadata, parent, path, value);
}

CFStringRef CGImageMetadataTagCopyPrefix(CGImageMetadataTagRef tag)
{
  return (CFStringRef)MEMORY[0x24BDD9118](tag);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x24BDBE778](image);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x24BDD9158](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x24BDD9180](url, options);
}

uint64_t CGPDFAnnotationCreate()
{
  return MEMORY[0x24BDBE7F8]();
}

uint64_t CGPDFAnnotationGetCGPDFDictionary()
{
  return MEMORY[0x24BDBE800]();
}

uint64_t CGPDFAnnotationIsPristine()
{
  return MEMORY[0x24BDBE810]();
}

uint64_t CGPDFAnnotationIsVersioned()
{
  return MEMORY[0x24BDBE818]();
}

uint64_t CGPDFAnnotationSetAnnotationForKey()
{
  return MEMORY[0x24BDBE820]();
}

uint64_t CGPDFAnnotationSetBurnIn()
{
  return MEMORY[0x24BDBE828]();
}

uint64_t CGPDFAppenderCreateCFObject()
{
  return MEMORY[0x24BDBE830]();
}

uint64_t CGPDFArchiveAddSelection()
{
  return MEMORY[0x24BE1F838]();
}

uint64_t CGPDFArchiveCreate()
{
  return MEMORY[0x24BE1F840]();
}

uint64_t CGPDFArchiveGetHTML()
{
  return MEMORY[0x24BE1F848]();
}

uint64_t CGPDFArchiveGetWebArchiveData()
{
  return MEMORY[0x24BE1F850]();
}

uint64_t CGPDFArchiveRelease()
{
  return MEMORY[0x24BE1F858]();
}

void CGPDFArrayApplyBlock(CGPDFArrayRef array, CGPDFArrayApplierBlock block, void *info)
{
  MEMORY[0x24BDBE838](array, block, info);
}

BOOL CGPDFArrayGetArray(CGPDFArrayRef array, size_t index, CGPDFArrayRef *value)
{
  return MEMORY[0x24BDBE840](array, index, value);
}

size_t CGPDFArrayGetCount(CGPDFArrayRef array)
{
  return MEMORY[0x24BDBE848](array);
}

BOOL CGPDFArrayGetDictionary(CGPDFArrayRef array, size_t index, CGPDFDictionaryRef *value)
{
  return MEMORY[0x24BDBE850](array, index, value);
}

BOOL CGPDFArrayGetInteger(CGPDFArrayRef array, size_t index, CGPDFInteger *value)
{
  return MEMORY[0x24BDBE858](array, index, value);
}

BOOL CGPDFArrayGetName(CGPDFArrayRef array, size_t index, const char **value)
{
  return MEMORY[0x24BDBE860](array, index, value);
}

BOOL CGPDFArrayGetNull(CGPDFArrayRef array, size_t index)
{
  return MEMORY[0x24BDBE868](array, index);
}

BOOL CGPDFArrayGetNumber(CGPDFArrayRef array, size_t index, CGPDFReal *value)
{
  return MEMORY[0x24BDBE870](array, index, value);
}

BOOL CGPDFArrayGetObject(CGPDFArrayRef array, size_t index, CGPDFObjectRef *value)
{
  return MEMORY[0x24BDBE878](array, index, value);
}

BOOL CGPDFArrayGetString(CGPDFArrayRef array, size_t index, CGPDFStringRef *value)
{
  return MEMORY[0x24BDBE880](array, index, value);
}

uint64_t CGPDFArrayRelease()
{
  return MEMORY[0x24BDBE888]();
}

uint64_t CGPDFArrayRetain()
{
  return MEMORY[0x24BDBE890]();
}

CGPDFContentStreamRef CGPDFContentStreamCreateWithPage(CGPDFPageRef page)
{
  return (CGPDFContentStreamRef)MEMORY[0x24BDBE898](page);
}

CGPDFContentStreamRef CGPDFContentStreamCreateWithStream(CGPDFStreamRef stream, CGPDFDictionaryRef streamResources, CGPDFContentStreamRef parent)
{
  return (CGPDFContentStreamRef)MEMORY[0x24BDBE8A0](stream, streamResources, parent);
}

CGPDFObjectRef CGPDFContentStreamGetResource(CGPDFContentStreamRef cs, const char *category, const char *name)
{
  return (CGPDFObjectRef)MEMORY[0x24BDBE8A8](cs, category, name);
}

void CGPDFContentStreamRelease(CGPDFContentStreamRef cs)
{
  MEMORY[0x24BDBE8B0](cs);
}

uint64_t CGPDFContextAddAnnotation()
{
  return MEMORY[0x24BDBE8B8]();
}

uint64_t CGPDFContextAddCatalogEntry()
{
  return MEMORY[0x24BDBE8C0]();
}

void CGPDFContextAddDocumentMetadata(CGContextRef context, CFDataRef metadata)
{
  MEMORY[0x24BDBE8D0](context, metadata);
}

void CGPDFContextBeginPage(CGContextRef context, CFDictionaryRef pageInfo)
{
  MEMORY[0x24BDBE8D8](context, pageInfo);
}

void CGPDFContextClose(CGContextRef context)
{
  MEMORY[0x24BDBE8E8](context);
}

CGContextRef CGPDFContextCreate(CGDataConsumerRef consumer, const CGRect *mediaBox, CFDictionaryRef auxiliaryInfo)
{
  return (CGContextRef)MEMORY[0x24BDBE8F0](consumer, mediaBox, auxiliaryInfo);
}

void CGPDFContextEndPage(CGContextRef context)
{
  MEMORY[0x24BDBE900](context);
}

uint64_t CGPDFContextIsValidPassword()
{
  return MEMORY[0x24BDBE910]();
}

uint64_t CGPDFContextSetIDTree()
{
  return MEMORY[0x24BDBE920]();
}

uint64_t CGPDFContextSetParentTree()
{
  return MEMORY[0x24BDBE928]();
}

uint64_t CGPDFContextSetRedactionPath()
{
  return MEMORY[0x24BDBE930]();
}

void CGPDFDictionaryApplyBlock(CGPDFDictionaryRef dict, CGPDFDictionaryApplierBlock block, void *info)
{
  MEMORY[0x24BDBE940](dict, block, info);
}

void CGPDFDictionaryApplyFunction(CGPDFDictionaryRef dict, CGPDFDictionaryApplierFunction function, void *info)
{
  MEMORY[0x24BDBE948](dict, function, info);
}

BOOL CGPDFDictionaryGetArray(CGPDFDictionaryRef dict, const char *key, CGPDFArrayRef *value)
{
  return MEMORY[0x24BDBE950](dict, key, value);
}

BOOL CGPDFDictionaryGetBoolean(CGPDFDictionaryRef dict, const char *key, CGPDFBoolean *value)
{
  return MEMORY[0x24BDBE958](dict, key, value);
}

BOOL CGPDFDictionaryGetDictionary(CGPDFDictionaryRef dict, const char *key, CGPDFDictionaryRef *value)
{
  return MEMORY[0x24BDBE960](dict, key, value);
}

BOOL CGPDFDictionaryGetInteger(CGPDFDictionaryRef dict, const char *key, CGPDFInteger *value)
{
  return MEMORY[0x24BDBE968](dict, key, value);
}

BOOL CGPDFDictionaryGetName(CGPDFDictionaryRef dict, const char *key, const char **value)
{
  return MEMORY[0x24BDBE970](dict, key, value);
}

BOOL CGPDFDictionaryGetNumber(CGPDFDictionaryRef dict, const char *key, CGPDFReal *value)
{
  return MEMORY[0x24BDBE978](dict, key, value);
}

BOOL CGPDFDictionaryGetObject(CGPDFDictionaryRef dict, const char *key, CGPDFObjectRef *value)
{
  return MEMORY[0x24BDBE980](dict, key, value);
}

uint64_t CGPDFDictionaryGetObjectReference()
{
  return MEMORY[0x24BDBE988]();
}

uint64_t CGPDFDictionaryGetRect()
{
  return MEMORY[0x24BDBE990]();
}

BOOL CGPDFDictionaryGetStream(CGPDFDictionaryRef dict, const char *key, CGPDFStreamRef *value)
{
  return MEMORY[0x24BDBE998](dict, key, value);
}

BOOL CGPDFDictionaryGetString(CGPDFDictionaryRef dict, const char *key, CGPDFStringRef *value)
{
  return MEMORY[0x24BDBE9A0](dict, key, value);
}

uint64_t CGPDFDictionaryGetUnresolvedObject()
{
  return MEMORY[0x24BDBE9A8]();
}

uint64_t CGPDFDocumentAppendDocumentInfo()
{
  return MEMORY[0x24BDBE9B0]();
}

uint64_t CGPDFDocumentAppendMetadata()
{
  return MEMORY[0x24BDBE9B8]();
}

uint64_t CGPDFDocumentAuthenticateOwnerPassword()
{
  return MEMORY[0x24BDBE9C0]();
}

uint64_t CGPDFDocumentAuthenticateUserPassword()
{
  return MEMORY[0x24BDBE9C8]();
}

uint64_t CGPDFDocumentCopyEncryptionKey()
{
  return MEMORY[0x24BDBE9D0]();
}

uint64_t CGPDFDocumentCopyHashedOwnerPassword()
{
  return MEMORY[0x24BDBE9D8]();
}

uint64_t CGPDFDocumentCopyHashedUserPassword()
{
  return MEMORY[0x24BDBE9E0]();
}

uint64_t CGPDFDocumentCopyPage()
{
  return MEMORY[0x24BDBE9E8]();
}

uint64_t CGPDFDocumentCopyToConsumerWithChanges()
{
  return MEMORY[0x24BDBE9F0]();
}

uint64_t CGPDFDocumentCreateLinearizedRangesForPage()
{
  return MEMORY[0x24BDBE9F8]();
}

CGPDFDocumentRef CGPDFDocumentCreateWithProvider(CGDataProviderRef provider)
{
  return (CGPDFDocumentRef)MEMORY[0x24BDBEA00](provider);
}

CGPDFDocumentRef CGPDFDocumentCreateWithURL(CFURLRef url)
{
  return (CGPDFDocumentRef)MEMORY[0x24BDBEA08](url);
}

uint64_t CGPDFDocumentEnableMRUMode()
{
  return MEMORY[0x24BDBEA10]();
}

uint64_t CGPDFDocumentExchangePagesAtIndices()
{
  return MEMORY[0x24BDBEA20]();
}

CGPDFAccessPermissions CGPDFDocumentGetAccessPermissions(CGPDFDocumentRef document)
{
  return MEMORY[0x24BDBEA28](document);
}

CGPDFDictionaryRef CGPDFDocumentGetCatalog(CGPDFDocumentRef document)
{
  return (CGPDFDictionaryRef)MEMORY[0x24BDBEA30](document);
}

uint64_t CGPDFDocumentGetDataProvider()
{
  return MEMORY[0x24BDBEA38]();
}

uint64_t CGPDFDocumentGetDestination()
{
  return MEMORY[0x24BDBEA40]();
}

uint64_t CGPDFDocumentGetEncryptMetadata()
{
  return MEMORY[0x24BDBEA48]();
}

uint64_t CGPDFDocumentGetEncryptionVersion()
{
  return MEMORY[0x24BDBEA50]();
}

CGPDFArrayRef CGPDFDocumentGetID(CGPDFDocumentRef document)
{
  return (CGPDFArrayRef)MEMORY[0x24BDBEA58](document);
}

CGPDFDictionaryRef CGPDFDocumentGetInfo(CGPDFDocumentRef document)
{
  return (CGPDFDictionaryRef)MEMORY[0x24BDBEA60](document);
}

size_t CGPDFDocumentGetNumberOfPages(CGPDFDocumentRef document)
{
  return MEMORY[0x24BDBEA68](document);
}

CGPDFPageRef CGPDFDocumentGetPage(CGPDFDocumentRef document, size_t pageNumber)
{
  return (CGPDFPageRef)MEMORY[0x24BDBEA70](document, pageNumber);
}

uint64_t CGPDFDocumentGetPageNoCreate()
{
  return MEMORY[0x24BDBEA78]();
}

uint64_t CGPDFDocumentGetPageNumberForPageDictionary()
{
  return MEMORY[0x24BDBEA80]();
}

uint64_t CGPDFDocumentGetRawPermissions()
{
  return MEMORY[0x24BDBEA88]();
}

void CGPDFDocumentGetVersion(CGPDFDocumentRef document, int *majorVersion, int *minorVersion)
{
  MEMORY[0x24BDBEA90](document, majorVersion, minorVersion);
}

uint64_t CGPDFDocumentGetXRef()
{
  return MEMORY[0x24BDBEA98]();
}

uint64_t CGPDFDocumentInsertPageAtIndex()
{
  return MEMORY[0x24BDBEAA0]();
}

BOOL CGPDFDocumentIsEncrypted(CGPDFDocumentRef document)
{
  return MEMORY[0x24BDBEAA8](document);
}

uint64_t CGPDFDocumentIsLinearized()
{
  return MEMORY[0x24BDBEAB0]();
}

uint64_t CGPDFDocumentIsSimpleSelectionEnabled()
{
  return MEMORY[0x24BDBEAB8]();
}

BOOL CGPDFDocumentIsUnlocked(CGPDFDocumentRef document)
{
  return MEMORY[0x24BDBEAC0](document);
}

void CGPDFDocumentRelease(CGPDFDocumentRef document)
{
  MEMORY[0x24BDBEAC8](document);
}

uint64_t CGPDFDocumentRemovePageAtIndex()
{
  return MEMORY[0x24BDBEAD0]();
}

CGPDFDocumentRef CGPDFDocumentRetain(CGPDFDocumentRef document)
{
  return (CGPDFDocumentRef)MEMORY[0x24BDBEAD8](document);
}

BOOL CGPDFDocumentUnlockWithPassword(CGPDFDocumentRef document, const char *password)
{
  return MEMORY[0x24BDBEAE0](document, password);
}

uint64_t CGPDFDrawingContextCreateWithStream()
{
  return MEMORY[0x24BDBEAE8]();
}

uint64_t CGPDFDrawingContextDrawWithContentTypes()
{
  return MEMORY[0x24BDBEAF8]();
}

uint64_t CGPDFDrawingContextRelease()
{
  return MEMORY[0x24BDBEB00]();
}

uint64_t CGPDFFontCreateWithObject()
{
  return MEMORY[0x24BDBEB08]();
}

uint64_t CGPDFFontDescriptorGetFlags()
{
  return MEMORY[0x24BDBEB10]();
}

uint64_t CGPDFFontGetFont()
{
  return MEMORY[0x24BDBEB18]();
}

uint64_t CGPDFFontGetFontDescriptor()
{
  return MEMORY[0x24BDBEB20]();
}

uint64_t CGPDFFontRelease()
{
  return MEMORY[0x24BDBEB28]();
}

uint64_t CGPDFFormCreate()
{
  return MEMORY[0x24BDBEB30]();
}

uint64_t CGPDFFormGetBBox()
{
  return MEMORY[0x24BDBEB38]();
}

uint64_t CGPDFFormGetMatrix()
{
  return MEMORY[0x24BDBEB40]();
}

uint64_t CGPDFFormGetResources()
{
  return MEMORY[0x24BDBEB48]();
}

uint64_t CGPDFFormGetStream()
{
  return MEMORY[0x24BDBEB50]();
}

uint64_t CGPDFFormRelease()
{
  return MEMORY[0x24BDBEB58]();
}

uint64_t CGPDFGStateConcatCTM()
{
  return MEMORY[0x24BDBEB60]();
}

uint64_t CGPDFGStateGetCTM()
{
  return MEMORY[0x24BDBEB68]();
}

uint64_t CGPDFLayoutCreateSelectionAtPoint()
{
  return MEMORY[0x24BE1F860]();
}

uint64_t CGPDFLayoutCreateString()
{
  return MEMORY[0x24BE1F868]();
}

uint64_t CGPDFLayoutGetCharacterBounds()
{
  return MEMORY[0x24BE1F870]();
}

uint64_t CGPDFLayoutGetCharacterUnicode()
{
  return MEMORY[0x24BE1F878]();
}

uint64_t CGPDFLayoutGetRootNode()
{
  return MEMORY[0x24BE1F880]();
}

uint64_t CGPDFLayoutRelease()
{
  return MEMORY[0x24BE1F888]();
}

uint64_t CGPDFLayoutRetain()
{
  return MEMORY[0x24BE1F890]();
}

uint64_t CGPDFNameCreate()
{
  return MEMORY[0x24BDBEB70]();
}

uint64_t CGPDFNodeGetBounds()
{
  return MEMORY[0x24BE1F898]();
}

uint64_t CGPDFNodeGetNodeContainingPoint()
{
  return MEMORY[0x24BE1F8A0]();
}

CGPDFObjectType CGPDFObjectGetType(CGPDFObjectRef object)
{
  return MEMORY[0x24BDBEB78](object);
}

BOOL CGPDFObjectGetValue(CGPDFObjectRef object, CGPDFObjectType type, void *value)
{
  return MEMORY[0x24BDBEB80](object, *(_QWORD *)&type, value);
}

CGPDFOperatorTableRef CGPDFOperatorTableCreate(void)
{
  return (CGPDFOperatorTableRef)MEMORY[0x24BDBEB88]();
}

void CGPDFOperatorTableRelease(CGPDFOperatorTableRef table)
{
  MEMORY[0x24BDBEB90](table);
}

void CGPDFOperatorTableSetCallback(CGPDFOperatorTableRef table, const char *name, CGPDFOperatorCallback callback)
{
  MEMORY[0x24BDBEB98](table, name, callback);
}

uint64_t CGPDFPageAddAnnotation()
{
  return MEMORY[0x24BDBEBA0]();
}

uint64_t CGPDFPageContainsWideGamutContent()
{
  return MEMORY[0x24BDBEBA8]();
}

uint64_t CGPDFPageCopyBackgroundColorHint()
{
  return MEMORY[0x24BDBEBB0]();
}

uint64_t CGPDFPageCopyPageLabel()
{
  return MEMORY[0x24BDBEBB8]();
}

uint64_t CGPDFPageCopyPageLayout()
{
  return MEMORY[0x24BDBEBC0]();
}

uint64_t CGPDFPageCopyString()
{
  return MEMORY[0x24BDBEBD0]();
}

uint64_t CGPDFPageCreateWithImage()
{
  return MEMORY[0x24BDBEBE0]();
}

uint64_t CGPDFPageEnumerateAnnotations()
{
  return MEMORY[0x24BDBEBE8]();
}

CGRect CGPDFPageGetBoxRect(CGPDFPageRef page, CGPDFBox box)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBEBF0](page, *(_QWORD *)&box);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CGPDFDictionaryRef CGPDFPageGetDictionary(CGPDFPageRef page)
{
  return (CGPDFDictionaryRef)MEMORY[0x24BDBEBF8](page);
}

CGPDFDocumentRef CGPDFPageGetDocument(CGPDFPageRef page)
{
  return (CGPDFDocumentRef)MEMORY[0x24BDBEC00](page);
}

uint64_t CGPDFPageGetLayout()
{
  return MEMORY[0x24BE1F8A8]();
}

size_t CGPDFPageGetPageNumber(CGPDFPageRef page)
{
  return MEMORY[0x24BDBEC10](page);
}

int CGPDFPageGetRotationAngle(CGPDFPageRef page)
{
  return MEMORY[0x24BDBEC18](page);
}

uint64_t CGPDFPageGetThumbnail()
{
  return MEMORY[0x24BDBEC20]();
}

uint64_t CGPDFPageInsertTableDescriptions()
{
  return MEMORY[0x24BDBEC28]();
}

uint64_t CGPDFPageLayoutGetAreaOfInterestAtPoint()
{
  return MEMORY[0x24BDBEC30]();
}

uint64_t CGPDFPageLayoutGetCharacterSelectionBoundingBox()
{
  return MEMORY[0x24BDBEC38]();
}

uint64_t CGPDFPageLayoutGetColumnBoundsAtPointWithCompletion()
{
  return MEMORY[0x24BDBEC40]();
}

uint64_t CGPDFPageLayoutGetStringRangeIndexNearestPoint()
{
  return MEMORY[0x24BDBEC48]();
}

uint64_t CGPDFPageLayoutGetTextRangeIndexAtPoint()
{
  return MEMORY[0x24BDBEC50]();
}

void CGPDFPageRelease(CGPDFPageRef page)
{
  MEMORY[0x24BDBEC58](page);
}

uint64_t CGPDFPageRemoveAnnotation()
{
  return MEMORY[0x24BDBEC60]();
}

uint64_t CGPDFPageRemoveLayout()
{
  return MEMORY[0x24BE1F8B0]();
}

uint64_t CGPDFPageRemoveProperty()
{
  return MEMORY[0x24BDBEC68]();
}

CGPDFPageRef CGPDFPageRetain(CGPDFPageRef page)
{
  return (CGPDFPageRef)MEMORY[0x24BDBEC70](page);
}

uint64_t CGPDFPageSetBoxRect()
{
  return MEMORY[0x24BDBEC78]();
}

uint64_t CGPDFPageSetExtraContentStream()
{
  return MEMORY[0x24BDBEC80]();
}

uint64_t CGPDFPageSetProperty()
{
  return MEMORY[0x24BDBEC88]();
}

uint64_t CGPDFPageSetRotationAngle()
{
  return MEMORY[0x24BDBEC90]();
}

uint64_t CGPDFPageSortAnnotations()
{
  return MEMORY[0x24BDBEC98]();
}

uint64_t CGPDFPageSubstituteAnnotationDictionary()
{
  return MEMORY[0x24BDBECA0]();
}

uint64_t CGPDFRStateCreate()
{
  return MEMORY[0x24BDBECA8]();
}

uint64_t CGPDFRStateCreateCopy()
{
  return MEMORY[0x24BDBECB0]();
}

uint64_t CGPDFRStateGRestore()
{
  return MEMORY[0x24BDBECB8]();
}

uint64_t CGPDFRStateGSave()
{
  return MEMORY[0x24BDBECC0]();
}

uint64_t CGPDFRStateGetGState()
{
  return MEMORY[0x24BDBECC8]();
}

uint64_t CGPDFRStateRelease()
{
  return MEMORY[0x24BDBECD0]();
}

CGPDFScannerRef CGPDFScannerCreate(CGPDFContentStreamRef cs, CGPDFOperatorTableRef table, void *info)
{
  return (CGPDFScannerRef)MEMORY[0x24BDBECD8](cs, table, info);
}

CGPDFContentStreamRef CGPDFScannerGetContentStream(CGPDFScannerRef scanner)
{
  return (CGPDFContentStreamRef)MEMORY[0x24BDBECE0](scanner);
}

BOOL CGPDFScannerPopArray(CGPDFScannerRef scanner, CGPDFArrayRef *value)
{
  return MEMORY[0x24BDBECE8](scanner, value);
}

BOOL CGPDFScannerPopName(CGPDFScannerRef scanner, const char **value)
{
  return MEMORY[0x24BDBECF0](scanner, value);
}

BOOL CGPDFScannerPopNumber(CGPDFScannerRef scanner, CGPDFReal *value)
{
  return MEMORY[0x24BDBECF8](scanner, value);
}

BOOL CGPDFScannerPopString(CGPDFScannerRef scanner, CGPDFStringRef *value)
{
  return MEMORY[0x24BDBED00](scanner, value);
}

void CGPDFScannerRelease(CGPDFScannerRef scanner)
{
  MEMORY[0x24BDBED08](scanner);
}

BOOL CGPDFScannerScan(CGPDFScannerRef scanner)
{
  return MEMORY[0x24BDBED10](scanner);
}

void CGPDFScannerStop(CGPDFScannerRef s)
{
  MEMORY[0x24BDBED18](s);
}

uint64_t CGPDFSelectionAddSelection()
{
  return MEMORY[0x24BE1F8B8]();
}

uint64_t CGPDFSelectionCreateAtPointWithOptions()
{
  return MEMORY[0x24BE1F8C0]();
}

uint64_t CGPDFSelectionCreateAttributedString()
{
  return MEMORY[0x24BE1F8C8]();
}

uint64_t CGPDFSelectionCreateBetweenPointsWithOptions()
{
  return MEMORY[0x24BE1F8D0]();
}

uint64_t CGPDFSelectionCreateForRange()
{
  return MEMORY[0x24BE1F8E0]();
}

uint64_t CGPDFSelectionCreateForStringRange()
{
  return MEMORY[0x24BE1F8E8]();
}

uint64_t CGPDFSelectionCreateFromPoint()
{
  return MEMORY[0x24BE1F8F0]();
}

uint64_t CGPDFSelectionCreateFromSelection()
{
  return MEMORY[0x24BE1F8F8]();
}

uint64_t CGPDFSelectionCreateInRect()
{
  return MEMORY[0x24BE1F900]();
}

uint64_t CGPDFSelectionCreateSelectionsByLine()
{
  return MEMORY[0x24BE1F908]();
}

uint64_t CGPDFSelectionCreateString()
{
  return MEMORY[0x24BE1F910]();
}

uint64_t CGPDFSelectionCreateToPoint()
{
  return MEMORY[0x24BE1F918]();
}

uint64_t CGPDFSelectionEnumerateRectsAndTransforms()
{
  return MEMORY[0x24BDBED20]();
}

uint64_t CGPDFSelectionEqualToSelection()
{
  return MEMORY[0x24BE1F920]();
}

uint64_t CGPDFSelectionExtendAtEnd()
{
  return MEMORY[0x24BE1F928]();
}

uint64_t CGPDFSelectionExtendAtStart()
{
  return MEMORY[0x24BE1F930]();
}

uint64_t CGPDFSelectionGetBounds()
{
  return MEMORY[0x24BE1F938]();
}

uint64_t CGPDFSelectionGetClientProperty()
{
  return MEMORY[0x24BE1F940]();
}

uint64_t CGPDFSelectionGetNumberOfRectsAndTransforms()
{
  return MEMORY[0x24BE1F948]();
}

uint64_t CGPDFSelectionGetNumberOfStringRanges()
{
  return MEMORY[0x24BE1F950]();
}

uint64_t CGPDFSelectionGetPage()
{
  return MEMORY[0x24BE1F958]();
}

uint64_t CGPDFSelectionGetRectAndTransform()
{
  return MEMORY[0x24BE1F960]();
}

uint64_t CGPDFSelectionGetStartIndex()
{
  return MEMORY[0x24BE1F968]();
}

uint64_t CGPDFSelectionGetStringRange()
{
  return MEMORY[0x24BE1F970]();
}

uint64_t CGPDFSelectionGetTextRange()
{
  return MEMORY[0x24BE1F978]();
}

uint64_t CGPDFSelectionIsEmpty()
{
  return MEMORY[0x24BE1F980]();
}

uint64_t CGPDFSelectionIsStandaloneGraphic()
{
  return MEMORY[0x24BE1F988]();
}

uint64_t CGPDFSelectionRelease()
{
  return MEMORY[0x24BE1F990]();
}

uint64_t CGPDFSelectionSetClientProperty()
{
  return MEMORY[0x24BE1F998]();
}

CFDataRef CGPDFStreamCopyData(CGPDFStreamRef stream, CGPDFDataFormat *format)
{
  return (CFDataRef)MEMORY[0x24BDBED28](stream, format);
}

CGPDFDictionaryRef CGPDFStreamGetDictionary(CGPDFStreamRef stream)
{
  return (CGPDFDictionaryRef)MEMORY[0x24BDBED30](stream);
}

CFDateRef CGPDFStringCopyDate(CGPDFStringRef string)
{
  return (CFDateRef)MEMORY[0x24BDBED38](string);
}

CFStringRef CGPDFStringCopyTextString(CGPDFStringRef string)
{
  return (CFStringRef)MEMORY[0x24BDBED40](string);
}

const unsigned __int8 *__cdecl CGPDFStringGetBytePtr(CGPDFStringRef string)
{
  return (const unsigned __int8 *)MEMORY[0x24BDBED48](string);
}

size_t CGPDFStringGetLength(CGPDFStringRef string)
{
  return MEMORY[0x24BDBED50](string);
}

uint64_t CGPDFStringRelease()
{
  return MEMORY[0x24BDBED58]();
}

uint64_t CGPDFStringRetain()
{
  return MEMORY[0x24BDBED60]();
}

uint64_t CGPDFXRefGetEntry()
{
  return MEMORY[0x24BDBEDA0]();
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBEDC8](path, m, x, y);
}

void CGPathAddPath(CGMutablePathRef path1, const CGAffineTransform *m, CGPathRef path2)
{
  MEMORY[0x24BDBEDD8](path1, m, path2);
}

void CGPathAddRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
  MEMORY[0x24BDBEDE8](path, m, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGPathApply(CGPathRef path, void *info, CGPathApplierFunction function)
{
  MEMORY[0x24BDBEE08](path, info, function);
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
  MEMORY[0x24BDBEE20](path);
}

BOOL CGPathContainsPoint(CGPathRef path, const CGAffineTransform *m, CGPoint point, BOOL eoFill)
{
  return MEMORY[0x24BDBEE28](path, m, eoFill, (__n128)point, *(__n128 *)&point.y);
}

CGPathRef CGPathCreateCopyByTransformingPath(CGPathRef path, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x24BDBEE60](path, transform);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x24BDBEE80]();
}

CGMutablePathRef CGPathCreateMutableCopy(CGPathRef path)
{
  return (CGMutablePathRef)MEMORY[0x24BDBEE88](path);
}

uint64_t CGPathIntersectsPathUsingEvenOdd()
{
  return MEMORY[0x24BDBEEF0]();
}

uint64_t CGPathIntersectsRect()
{
  return MEMORY[0x24BDBEEF8]();
}

BOOL CGPathIsEmpty(CGPathRef path)
{
  return MEMORY[0x24BDBEF10](path);
}

uint64_t CGPathIsLine()
{
  return MEMORY[0x24BDBEF18]();
}

BOOL CGPathIsRect(CGPathRef path, CGRect *rect)
{
  return MEMORY[0x24BDBEF28](path, rect);
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBEF40](path, m, x, y);
}

void CGPathRelease(CGPathRef path)
{
  MEMORY[0x24BDBEF48](path);
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

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x24BDBEFC0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFC8]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
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

CGRect CGRectIntegral(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x24BDBF038]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF040]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
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

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x24BDBF058]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x24BDBF060]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF078]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
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

CTFontRef CTFontCreateWithName(CFStringRef name, CGFloat size, const CGAffineTransform *matrix)
{
  return (CTFontRef)MEMORY[0x24BDC47C8](name, matrix, size);
}

CTFontDescriptorRef CTFontDescriptorCreateMatchingFontDescriptor(CTFontDescriptorRef descriptor, CFSetRef mandatoryAttributes)
{
  return (CTFontDescriptorRef)MEMORY[0x24BDC4818](descriptor, mandatoryAttributes);
}

uint64_t CTFontDescriptorCreateWithAttributesAndOptions()
{
  return MEMORY[0x24BDC4838]();
}

CTLineRef CTLineCreateJustifiedLine(CTLineRef line, CGFloat justificationFactor, double justificationWidth)
{
  return (CTLineRef)MEMORY[0x24BDC4A20](line, justificationFactor, justificationWidth);
}

CTLineRef CTLineCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTLineRef)MEMORY[0x24BDC4A30](attrString);
}

void CTLineDraw(CTLineRef line, CGContextRef context)
{
  MEMORY[0x24BDC4A68](line, context);
}

CGRect CTLineGetBoundsWithOptions(CTLineRef line, CTLineBoundsOptions options)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDC4A78](line, options);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

double CTLineGetTypographicBounds(CTLineRef line, CGFloat *ascent, CGFloat *descent, CGFloat *leading)
{
  double result;

  MEMORY[0x24BDC4AC8](line, ascent, descent, leading);
  return result;
}

CTLineRef CTTypesetterCreateLine(CTTypesetterRef typesetter, CFRange stringRange)
{
  return (CTLineRef)MEMORY[0x24BDC4BB0](typesetter, stringRange.location, stringRange.length);
}

CTTypesetterRef CTTypesetterCreateWithAttributedString(CFAttributedStringRef string)
{
  return (CTTypesetterRef)MEMORY[0x24BDC4BC0](string);
}

CFIndex CTTypesetterSuggestLineBreak(CTTypesetterRef typesetter, CFIndex startIndex, double width)
{
  return MEMORY[0x24BDC4BD8](typesetter, startIndex, width);
}

uint64_t DDResultIsPastDate()
{
  return MEMORY[0x24BE2B300]();
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x24BDD8B50](properties);
}

void IOSurfaceDecrementUseCount(IOSurfaceRef buffer)
{
  MEMORY[0x24BDD8B68](buffer);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x24BDD8B80](buffer);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x24BDD8D08](buffer, *(_QWORD *)&options, seed);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x24BDD8DD0](buffer, *(_QWORD *)&options, seed);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t MGIsDeviceOneOfType()
{
  return MEMORY[0x24BED84C0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

BOOL NSEqualRects(NSRect aRect, NSRect bRect)
{
  return MEMORY[0x24BDD0BE8]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height, (__n128)bRect.origin, *(__n128 *)&bRect.origin.y, (__n128)bRect.size, *(__n128 *)&bRect.size.height);
}

NSString *NSFullUserName(void)
{
  return (NSString *)MEMORY[0x24BDD0D60]();
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x24BDD0E08](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

NSRect NSIntersectionRect(NSRect aRect, NSRect bRect)
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSRect result;

  MEMORY[0x24BDD0E10]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height, (__n128)bRect.origin, *(__n128 *)&bRect.origin.y, (__n128)bRect.size, *(__n128 *)&bRect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

BOOL NSPointInRect(NSPoint aPoint, NSRect aRect)
{
  return MEMORY[0x24BDD1150]((__n128)aPoint, *(__n128 *)&aPoint.y, (__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromPoint(NSPoint aPoint)
{
  return (NSString *)MEMORY[0x24BDD1248]((__n128)aPoint, *(__n128 *)&aPoint.y);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return (NSString *)MEMORY[0x24BDD1260]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

int32_t NSVersionOfLinkTimeLibrary(const char *libraryName)
{
  return MEMORY[0x24BDAC4A8](libraryName);
}

uint64_t NSZoneReallyFree()
{
  return MEMORY[0x24BDD1430]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x24BDF78D8]();
}

void UIGraphicsPopContext(void)
{
  MEMORY[0x24BDF78E8]();
}

void UIGraphicsPushContext(CGContextRef context)
{
  MEMORY[0x24BDF78F0](context);
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x24BDF7CD8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CFPrefsSetDirectModeEnabled()
{
  return MEMORY[0x24BDBD080]();
}

uint64_t _CFPrefsSetReadOnly()
{
  return MEMORY[0x24BDBD088]();
}

uint64_t _CGHandleAssert()
{
  return MEMORY[0x24BDBF1E8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void CGBuf::CGBuf(CGBuf *this, CGImage *a2)
{
  MEMORY[0x24BDBF1F0](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

void std::mutex::lock(std::mutex *this)
{
  MEMORY[0x24BEDB368](this);
}

void std::mutex::unlock(std::mutex *this)
{
  MEMORY[0x24BEDB370](this);
}

void std::mutex::~mutex(std::mutex *this)
{
  MEMORY[0x24BEDB380](this);
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x24BEDB688](this);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_24C25B748(__p);
}

uint64_t operator delete()
{
  return off_24C25B750();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24C25B758(__sz);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

long double acos(long double __x)
{
  long double result;

  MEMORY[0x24BDAD108](__x);
  return result;
}

long double asin(long double __x)
{
  long double result;

  MEMORY[0x24BDAD188](__x);
  return result;
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x24BDAD220](__y, __x);
  return result;
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

IMP class_getMethodImplementation(Class cls, SEL name)
{
  return (IMP)MEMORY[0x24BEDCEB8](cls, name);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
  MEMORY[0x24BDADC70](iterations, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDB8](group, queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x24BDAE6E8]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
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

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x24BEDD020](dest, src, size, atomic, hasStrong);
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

void objc_moveWeak(id *to, id *from)
{
  MEMORY[0x24BEDD0F8](to, from);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
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

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  return MEMORY[0x24BDAF478](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

int rand(void)
{
  return MEMORY[0x24BDAFA38]();
}

long double sin(long double __x)
{
  long double result;

  MEMORY[0x24BDAFE18](__x);
  return result;
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

