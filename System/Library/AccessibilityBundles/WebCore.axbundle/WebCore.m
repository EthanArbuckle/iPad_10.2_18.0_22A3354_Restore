id accessibilityLocalizedString(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v1 = a1;
  v2 = (void *)accessibilityLocalizedString_axBundle;
  if (accessibilityLocalizedString_axBundle
    || (objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()),
        v3 = objc_claimAutoreleasedReturnValue(),
        v4 = (void *)accessibilityLocalizedString_axBundle,
        accessibilityLocalizedString_axBundle = v3,
        v4,
        (v2 = (void *)accessibilityLocalizedString_axBundle) != 0))
  {
    objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_24FF86C78, CFSTR("Accessibility"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t _runLoopExitObserver()
{
  void *v0;

  v0 = (void *)WebThreadPreparer;
  if (!WebThreadPreparer)
  {
    _AXAssert();
    v0 = (void *)WebThreadPreparer;
  }
  return objc_msgSend(v0, "setPreparedThisRunLoop:", 0);
}

void sub_230E23354(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
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

void sub_230E235AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230E23A28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230E247C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  uint64_t v63;

  _Block_object_dispose(&a15, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a51, 8);
  _Block_object_dispose(&a63, 8);
  _Block_object_dispose(&STACK[0x210], 8);
  _Block_object_dispose((const void *)(v63 - 224), 8);
  _Block_object_dispose((const void *)(v63 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_230E24DA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230E253C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230E25E04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230E267A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230E271B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230E27C68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a20, 8);
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

id _processEquationChild(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  char v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  __CFString *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  const __CFString *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  __CFString *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  const __CFString *v46;
  uint64_t v47;
  void *v48;
  char v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  const __CFString *v56;
  uint64_t v57;
  void *v58;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "safeValueForKey:", CFSTR("accessibilityMathType"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("AXMathFenceOperator"));
    v5 = (id)MEMORY[0x24BDBD1B8];
    if ((v4 & 1) != 0)
    {
LABEL_28:

      goto LABEL_29;
    }
    v6 = _axMathTypeForWebMathType_onceToken;
    v7 = v3;
    if (v6 != -1)
      dispatch_once(&_axMathTypeForWebMathType_onceToken, &__block_literal_global_1601);
    objc_msgSend((id)_axMathTypeForWebMathType_Mappings, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(v2, "_accessibilityProcessRootEquation");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v17;
      if (v17)
        v19 = (void *)v17;
      else
        v19 = v5;
      v5 = v19;

      goto LABEL_27;
    }
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x2348C4190](objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("AXMType")));
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("Fraction")))
    {
      objc_msgSend(v2, "safeValueForKey:", CFSTR("accessibilityMathNumeratorObject"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      _processEquationChild(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v11, CFSTR("AXMNumeratorObject"));

      objc_msgSend(v2, "safeValueForKey:", CFSTR("accessibilityMathDenominatorObject"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      _processEquationChild(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v13, CFSTR("AXMDenominatorObject"));

      objc_msgSend(v2, "safeValueForKey:", CFSTR("accessibilityMathLineThickness"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "integerValue");

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v15);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v16, CFSTR("AXMLineThickness"));
LABEL_25:

LABEL_26:
      objc_autoreleasePoolPop(v9);
LABEL_27:

      goto LABEL_28;
    }
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("Fenced")) & 1) != 0
      || (objc_msgSend(v8, "isEqualToString:", CFSTR("Row")) & 1) != 0
      || (objc_msgSend(v8, "isEqualToString:", CFSTR("Table")) & 1) != 0
      || (objc_msgSend(v8, "isEqualToString:", CFSTR("TableRow")) & 1) != 0
      || objc_msgSend(v8, "isEqualToString:", CFSTR("TableCell")))
    {
      _retrieveChildrenFromEquation(v2);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v16, CFSTR("AXMChildren"));
      if (!objc_msgSend(v8, "isEqualToString:", CFSTR("Fenced")))
        goto LABEL_25;
      objc_msgSend(v2, "safeValueForKey:", CFSTR("accessibilityMathFencedOpenString"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
        objc_msgSend(v5, "setObject:forKey:", v20, CFSTR("AXMOpenOperator"));
      objc_msgSend(v2, "safeValueForKey:", CFSTR("accessibilityMathFencedCloseString"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
        objc_msgSend(v5, "setObject:forKey:", v21, CFSTR("AXMCloseOperator"));
      goto LABEL_23;
    }
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("SubSuperScript")))
    {
      objc_msgSend(v2, "safeValueForKey:", CFSTR("accessibilityMathBaseObject"));
      v23 = objc_claimAutoreleasedReturnValue();
      v16 = (__CFString *)v23;
      if (v23)
      {
        _processEquationChild(v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v24, CFSTR("AXMBaseObject"));

      }
      objc_msgSend(v2, "safeValueForKey:", CFSTR("accessibilityMathSubscriptObject"));
      v25 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v25;
      if (v25)
      {
        _processEquationChild(v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v26, CFSTR("AXMSubscriptObject"));

      }
      objc_msgSend(v2, "safeValueForKey:", CFSTR("accessibilityMathSuperscriptObject"));
      v27 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v27;
      if (!v27)
        goto LABEL_23;
      _processEquationChild(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = CFSTR("AXMSuperscriptObject");
LABEL_51:
      objc_msgSend(v5, "setObject:forKey:", v28, v29);

LABEL_23:
LABEL_24:

      goto LABEL_25;
    }
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("UnderOver")))
    {
      objc_msgSend(v2, "safeValueForKey:", CFSTR("accessibilityMathBaseObject"));
      v30 = objc_claimAutoreleasedReturnValue();
      v16 = (__CFString *)v30;
      if (v30)
      {
        _processEquationChild(v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v31, CFSTR("AXMBaseObject"));

      }
      objc_msgSend(v2, "safeValueForKey:", CFSTR("accessibilityMathUnderObject"));
      v32 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v32;
      if (v32)
      {
        _processEquationChild(v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v33, CFSTR("AXMUnderObject"));

      }
      objc_msgSend(v2, "safeValueForKey:", CFSTR("accessibilityMathOverObject"));
      v34 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v34;
      if (!v34)
        goto LABEL_23;
      _processEquationChild(v34);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = CFSTR("AXMOverObject");
      goto LABEL_51;
    }
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("Multiscript")))
    {
      objc_msgSend(v2, "safeValueForKey:", CFSTR("accessibilityMathBaseObject"));
      v35 = objc_claimAutoreleasedReturnValue();
      v16 = (__CFString *)v35;
      if (v35)
      {
        _processEquationChild(v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v36, CFSTR("AXMBaseObject"));

      }
      objc_msgSend(v2, "safeValueForKey:", CFSTR("accessibilityMathPrescripts"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v37;
      if (v37)
      {
        _processMultiscriptArray(v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v38, CFSTR("AXMMultiscriptPrescripts"));

      }
      objc_msgSend(v2, "safeValueForKey:", CFSTR("accessibilityMathPostscripts"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v39;
      if (!v39)
        goto LABEL_23;
      _processMultiscriptArray(v39);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = CFSTR("AXMMultiscriptPostscripts");
      goto LABEL_51;
    }
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("RootOperation")))
    {
      v40 = objc_msgSend(v7, "isEqualToString:", CFSTR("AXMathSquareRoot"));
      objc_msgSend(v2, "safeArrayForKey:", CFSTR("accessibilityMathRadicand"));
      v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v16 = v41;
      if (v41)
      {
        if (v40 && (unint64_t)-[__CFString count](v41, "count") >= 2)
        {
          _retrieveChildrenFromEquation(v2);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "setObject:forKey:", CFSTR("Row"), CFSTR("AXMType"));
          objc_msgSend(v43, "setObject:forKey:", v42, CFSTR("AXMChildren"));
        }
        else
        {
          -[__CFString objectAtIndex:](v16, "objectAtIndex:", 0);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (*)(void))_processEquationChild)();
          v43 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v5, "setObject:forKey:", v43, CFSTR("AXMRadicandObject"));

      }
      objc_msgSend(v2, "safeValueForKey:", CFSTR("accessibilityMathRootIndexObject"));
      v47 = objc_claimAutoreleasedReturnValue();
      v48 = (void *)v47;
      if (v47)
        v49 = v40;
      else
        v49 = 1;
      if ((v49 & 1) == 0)
      {
        _processEquationChild(v47);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v50, CFSTR("AXMRootIndexObject"));

      }
      goto LABEL_25;
    }
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("Text")) & 1) != 0
      || (objc_msgSend(v8, "isEqualToString:", CFSTR("Number")) & 1) != 0
      || objc_msgSend(v8, "isEqualToString:", CFSTR("Identifier")))
    {
      if (objc_msgSend(v2, "accessibilityElementCount") != 1)
        goto LABEL_26;
      objc_msgSend(v2, "accessibilityElementAtIndex:", 0);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[__CFString accessibilityLabel](v16, "accessibilityLabel");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "stringByTrimmingCharactersInSet:", v45);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v20, "length"))
        goto LABEL_24;
      v46 = CFSTR("AXMContent");
      goto LABEL_63;
    }
    if (!objc_msgSend(v8, "isEqualToString:", CFSTR("Operator")))
      goto LABEL_26;
    v57 = objc_msgSend(v2, "accessibilityElementCount");
    if (v57 < 1)
    {
      v16 = &stru_24FF86C78;
    }
    else
    {
      v51 = 0;
      v16 = &stru_24FF86C78;
      do
      {
        objc_msgSend(v2, "accessibilityElementAtIndex:", v51, v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "accessibilityLabel");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "stringByTrimmingCharactersInSet:", v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v54, "length"))
        {
          -[__CFString stringByAppendingString:](v16, "stringByAppendingString:", v54);
          v55 = objc_claimAutoreleasedReturnValue();

          v16 = (__CFString *)v55;
        }

        ++v51;
      }
      while (v57 != v51);
    }
    if ((-[__CFString isEqualToString:](v16, "isEqualToString:", CFSTR("⎛⎜⎝"), v57) & 1) != 0)
    {
      v56 = CFSTR("(");
    }
    else if ((-[__CFString isEqualToString:](v16, "isEqualToString:", CFSTR("⎞⎟⎠")) & 1) != 0)
    {
      v56 = CFSTR(")");
    }
    else if ((-[__CFString isEqualToString:](v16, "isEqualToString:", CFSTR("⎡⎢⎣")) & 1) != 0)
    {
      v56 = CFSTR("[");
    }
    else if ((-[__CFString isEqualToString:](v16, "isEqualToString:", CFSTR("⎤⎥⎦")) & 1) != 0)
    {
      v56 = CFSTR("]");
    }
    else if ((-[__CFString isEqualToString:](v16, "isEqualToString:", CFSTR("⎧⎨⎩")) & 1) != 0)
    {
      v56 = CFSTR("{");
    }
    else
    {
      if (!-[__CFString isEqualToString:](v16, "isEqualToString:", CFSTR("⎫⎬⎭")))
      {
LABEL_93:
        objc_msgSend(v5, "setObject:forKey:", v16, CFSTR("AXMContent"));
        if (!-[__CFString length](v16, "length"))
          goto LABEL_25;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[__CFString characterAtIndex:](v16, "characterAtIndex:", 0));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = CFSTR("AXMUnichar");
LABEL_63:
        objc_msgSend(v5, "setObject:forKey:", v20, v46);
        goto LABEL_24;
      }
      v56 = CFSTR("}");
    }

    v16 = (__CFString *)v56;
    goto LABEL_93;
  }
  v5 = (id)MEMORY[0x24BDBD1B8];
LABEL_29:

  return v5;
}

void sub_230E2AEA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _AXPrintMarkerRangeInfo(void *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  NSObject *v6;

  v3 = a1;
  v4 = a2;
  VOTLogRotor();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    _AXPrintMarkerRangeInfo_cold_2(v3, v5);

  VOTLogRotor();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    _AXPrintMarkerRangeInfo_cold_1(v3, v4);

}

void sub_230E2B058(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_230E2B178(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230E2B5A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_230E2F188(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230E2F4AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void CGPathEnumerationCallback(uint64_t a1, uint64_t a2)
{
  void (**v3)(_QWORD, _QWORD);
  id v4;

  v3 = (void (**)(_QWORD, _QWORD))MEMORY[0x2348C42F8]();
  if (v3)
  {
    v4 = v3;
    v3[2](v3, a2);
    v3 = (void (**)(_QWORD, _QWORD))v4;
  }

}

void __fuzzyAccessibilityHitTest_block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  float v9;
  float v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;

  v7 = a2;
  v8 = v7;
  if (*(id *)(a1 + 32) == v7)
    goto LABEL_13;
  v15 = v7;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = v15;
    if (!v15)
      goto LABEL_13;
    v13 = (void *)fuzzyAccessibilityHitTest_hitQueue;
    v14 = v15;
LABEL_12:
    objc_msgSend(v13, "addObject:", v14);
    v8 = v15;
    goto LABEL_13;
  }
  closestDistanceFromObjectCorner(v15, *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72));
  v10 = v9;
  v8 = v15;
  if (v9 > *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    goto LABEL_13;
  objc_msgSend(v15, "safeValueForKey:", CFSTR("accessibilityCanFuzzyHitTest"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "BOOLValue"))
  {

    goto LABEL_11;
  }
  v12 = objc_msgSend(v15, "isAccessibilityElement");

  if (!v12)
  {
LABEL_11:
    v13 = (void *)fuzzyAccessibilityHitTest_hitQueue;
    v14 = v15;
    goto LABEL_12;
  }
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v10;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  v8 = v15;
  if (*(float *)(a1 + 80) == 0.0)
    *a4 = 1;
LABEL_13:

}

uint64_t closestDistanceFromObjectCorner(void *a1, CGFloat a2, CGFloat a3)
{
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  uint64_t result;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGPoint v20;
  CGRect v21;

  objc_msgSend(a1, "safeValueForKey:", CFSTR("accessibilityElementRect"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rectValue");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v21.origin.x = v7;
  v21.origin.y = v9;
  v21.size.width = v11;
  v21.size.height = v13;
  v20.x = a2;
  v20.y = a3;
  result = CGRectContainsPoint(v21, v20);
  if ((result & 1) == 0)
  {
    MEMORY[0x24BDAC7A8](0.0);
    v15 = 0;
    v16 = 1.79769313e308;
    v17 = 1.79769313e308;
    v18 = 1.79769313e308;
    do
    {
      result = AX_CGPointGetDistanceToPoint();
      if (v19 >= v16)
      {
        if (v19 >= v17)
        {
          if (v19 < v18)
            v18 = v19;
        }
        else
        {
          v17 = v19;
        }
      }
      else
      {
        v16 = v19;
      }
      v15 += 16;
    }
    while (v15 != 144);
  }
  return result;
}

id _retrieveChildrenFromEquation(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;

  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "accessibilityElementCount");
  if (v3 >= 1)
  {
    v4 = v3;
    for (i = 0; i != v4; ++i)
    {
      objc_msgSend(v1, "accessibilityElementAtIndex:", i);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      _processEquationChild();
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v7, "count"))
        objc_msgSend(v2, "addObject:", v7);

    }
  }

  return v2;
}

id _processMultiscriptArray(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id obj;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = v1;
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v17 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKey:", CFSTR("AXMSubscriptObject"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        _processEquationChild();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKey:", CFSTR("AXMSuperscriptObject"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        _processEquationChild();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v7)
        {
          objc_msgSend(v11, "setObject:forKey:", v8, CFSTR("AXMSubscriptObject"));
          objc_msgSend(v12, "setObject:forKey:", v10, CFSTR("AXMSuperscriptObject"));
        }
        objc_msgSend(v15, "addObject:", v12);

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v3);
  }

  return v15;
}

void ___axMathTypeForWebMathType_block_invoke()
{
  void *v0;

  v0 = (void *)_axMathTypeForWebMathType_Mappings;
  _axMathTypeForWebMathType_Mappings = (uint64_t)&unk_24FF8CAD0;

}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x18u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void _AXUIInstallBaseCategories()
{
  if (_AXUIInstallBaseCategories_onceToken != -1)
    dispatch_once(&_AXUIInstallBaseCategories_onceToken, &__block_literal_global_1);
}

id AXWebNotificationWithName(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  _NotificationMap();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id _NotificationMap()
{
  if (_NotificationMap_onceToken != -1)
    dispatch_once(&_NotificationMap_onceToken, &__block_literal_global_176);
  return (id)_NotificationMap_notificationsMap;
}

id AXWebNotificationName(void *a1)
{
  id v1;
  id v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  char v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  _NotificationMap();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v2, "objectForKeyedSubscript:", v6, (_QWORD)v10);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "isEqual:", v1);

        if ((v8 & 1) != 0)
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

void _AXPrintMarkerRangeInfo_cold_1(void *a1, void *a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  objc_msgSend(a1, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "positionForTextMarker:", v4);
  objc_msgSend(a1, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "positionForTextMarker:", v5);
  objc_msgSend(a2, "stringForTextMarkers:", a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_230E20000, v7, v8, "startRange.start = %d, startRange.end = %d, startRange.string = %{public}@", v9, v10, v11, v12, 2u);

  OUTLINED_FUNCTION_0();
}

void _AXPrintMarkerRangeInfo_cold_2(void *a1, NSObject *a2)
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109120;
  v3[1] = objc_msgSend(a1, "count");
  _os_log_debug_impl(&dword_230E20000, a2, OS_LOG_TYPE_DEBUG, "startRange.count = %d", (uint8_t *)v3, 8u);
  OUTLINED_FUNCTION_1();
}

uint64_t AXColorStringForColor()
{
  return MEMORY[0x24BDFF9B8]();
}

uint64_t AXDoesRequestingClientDeserveAutomation()
{
  return MEMORY[0x24BDFE8E8]();
}

uint64_t AXFormatFloatWithPercentage()
{
  return MEMORY[0x24BDFE050]();
}

uint64_t AXFormatInteger()
{
  return MEMORY[0x24BDFE058]();
}

uint64_t AXLogCommon()
{
  return MEMORY[0x24BDFE0F0]();
}

uint64_t AXLogScrollToVisible()
{
  return MEMORY[0x24BDFE178]();
}

uint64_t AXLogSpeakScreen()
{
  return MEMORY[0x24BDFE188]();
}

uint64_t AXPerformBlockOnMainThread()
{
  return MEMORY[0x24BDFE248]();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return MEMORY[0x24BDFE260]();
}

uint64_t AXPerformSafeBlock()
{
  return MEMORY[0x24BDFE278]();
}

uint64_t AXPerformValidationChecks()
{
  return MEMORY[0x24BDFE280]();
}

uint64_t AXRequestingClient()
{
  return MEMORY[0x24BDFE948]();
}

uint64_t AXSafeClassFromString()
{
  return MEMORY[0x24BDFE380]();
}

uint64_t AX_CGPointGetDistanceToPoint()
{
  return MEMORY[0x24BE004C8]();
}

uint64_t AX_CGRectGetCenter()
{
  return MEMORY[0x24BE00500]();
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

void CFRunLoopAddObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C0](rl, observer, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC2F8]();
}

CFRunLoopObserverRef CFRunLoopObserverCreate(CFAllocatorRef allocator, CFOptionFlags activities, Boolean repeats, CFIndex order, CFRunLoopObserverCallBack callout, CFRunLoopObserverContext *context)
{
  return (CFRunLoopObserverRef)MEMORY[0x24BDBC320](allocator, activities, repeats, order, callout, context);
}

void CGPathApply(CGPathRef path, void *info, CGPathApplierFunction function)
{
  MEMORY[0x24BDBEE08](path, info, function);
}

CGRect CGPathGetBoundingBox(CGPathRef path)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x24BDBEEC0](path);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGPathGetPathBoundingBox(CGPathRef path)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x24BDBEEE0](path);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x24BDBEFC0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
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

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x24BDBF050]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t GSMainScreenScaleFactor()
{
  return MEMORY[0x24BE3D610]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
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

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x24BDF6668]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x24BDF6670]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x24BDF6678]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromUIEdgeInsets(UIEdgeInsets insets)
{
  return (NSString *)MEMORY[0x24BDF6688](*(__n128 *)&insets.top, *(__n128 *)&insets.left, *(__n128 *)&insets.bottom, *(__n128 *)&insets.right);
}

uint64_t UIAccessibilityFrameForBounds()
{
  return MEMORY[0x24BEBAFC0]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x24BDF72C0]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
  MEMORY[0x24BDF72F8](*(_QWORD *)&notification, argument);
}

uint64_t UIAccessibilitySceneReferencePointForScreenPoint()
{
  return MEMORY[0x24BEBB070]();
}

uint64_t UIAccessibilitySpeakAndDoNotBeInterrupted()
{
  return MEMORY[0x24BEBB0C0]();
}

uint64_t UIKitAccessibilityLocalizedString()
{
  return MEMORY[0x24BEBB208]();
}

uint64_t VOTLogRotor()
{
  return MEMORY[0x24BDFE520]();
}

uint64_t _AXAssert()
{
  return MEMORY[0x24BDFE528]();
}

uint64_t _AXCreateAXUIElementWithElement()
{
  return MEMORY[0x24BDFECF8]();
}

uint64_t _AXLogWithFacility()
{
  return MEMORY[0x24BDFE538]();
}

uint64_t _AXSAutomationEnabled()
{
  return MEMORY[0x24BED20C0]();
}

uint64_t _AXServerCacheGetPossiblyNilObjectForKey()
{
  return MEMORY[0x24BEBB218]();
}

uint64_t _AXServerCacheInsertPossiblyNilObjectForKey()
{
  return MEMORY[0x24BEBB220]();
}

uint64_t _AXTraitsRemoveTrait()
{
  return MEMORY[0x24BDFED30]();
}

uint64_t _AXUIElementCreateData()
{
  return MEMORY[0x24BDFED48]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _UIAXDismissKeyboardIfNecessary()
{
  return MEMORY[0x24BEBB230]();
}

uint64_t _UIAccessibilityFocusedElementForAssistiveTech()
{
  return MEMORY[0x24BEBB288]();
}

uint64_t _UIAccessibilitySetAssociatedElementContextForNextNotification()
{
  return MEMORY[0x24BEBB2B8]();
}

uint64_t _UIAccessibilityVoiceOverVersion()
{
  return MEMORY[0x24BEBB2C8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t __UIAXStringForVariables()
{
  return MEMORY[0x24BEBB2D0]();
}

uint64_t __UIAccessibilityCastAsClass()
{
  return MEMORY[0x24BDFE550]();
}

uint64_t __UIAccessibilityGetAssociatedBool()
{
  return MEMORY[0x24BDFE570]();
}

uint64_t __UIAccessibilityGetAssociatedCGRect()
{
  return MEMORY[0x24BDFE580]();
}

uint64_t __UIAccessibilityGetAssociatedObject()
{
  return MEMORY[0x24BDFE5A8]();
}

uint64_t __UIAccessibilitySafeClass()
{
  return MEMORY[0x24BDFE5C0]();
}

uint64_t __UIAccessibilitySetAssociatedBool()
{
  return MEMORY[0x24BDFE5C8]();
}

uint64_t __UIAccessibilitySetAssociatedCGRect()
{
  return MEMORY[0x24BDFE5D8]();
}

uint64_t __UIAccessibilitySetAssociatedObject()
{
  return MEMORY[0x24BDFE608]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

