@implementation BKSHIDEventConciseDescriptionDigitizer

void ___BKSHIDEventConciseDescriptionDigitizer_block_invoke(uint64_t a1, void *a2)
{
  BSDescriptionStreamAppendBKSKeyModifierFlags(a2, *(_QWORD *)(a1 + 32));
}

void ___BKSHIDEventConciseDescriptionDigitizer_block_invoke_2(uint64_t a1, void *a2)
{
  int Type;
  void *v4;
  id v5;
  uint64_t IntegerValue;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  unsigned int v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v28[5];

  v27 = a2;
  Type = IOHIDEventGetType();
  v4 = *(void **)(a1 + 32);
  if (Type == 11)
  {
    v5 = v4;
    if (IOHIDEventGetType() == 11)
    {
      IntegerValue = IOHIDEventGetIntegerValue();
      IOHIDEventGetFloatValue();
      v8 = v7;
      IOHIDEventGetFloatValue();
      v10 = v9;
      v11 = (id)objc_msgSend(v5, "appendInteger:withName:", IntegerValue, CFSTR("path"));
      v12 = (id)objc_msgSend(v5, "appendPoint:withName:", 0, v8, v10);
      _BKSHIDEventAppendEventFlags((uint64_t)v27, v5);
    }
    else
    {
      objc_msgSend(v5, "appendString:withName:", IOHIDEventTypeGetName(), 0);
    }

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) < *(_QWORD *)(a1 + 56))
    {
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        v15 = objc_msgSend(v13, "pathIndex");
        if (v15 == IOHIDEventGetIntegerValue())
        {
          objc_msgSend(v14, "preciseLocationX");
          v17 = v16;
          objc_msgSend(v14, "preciseLocationY");
          v19 = v18;
          v20 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:format:", objc_msgSend(v14, "touchIdentifier"), CFSTR("touchID"), 1);
          v21 = objc_msgSend(v14, "locus");
          if (v21)
          {
            v22 = *(void **)(a1 + 32);
            NSStringFromBKSHIDTouchLocus(v21);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "appendString:withName:", v23, 0);

          }
          v24 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", 0, v17, v19, v27);
          objc_msgSend(v14, "authenticationMessage");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
            objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", CFSTR("auth"), 0);
          objc_msgSend(v14, "securityAnalysis");
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (v26)
            objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", CFSTR("sa"), 0);
        }
      }
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

    }
  }
  else
  {
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = ___BKSHIDEventConciseDescriptionDigitizer_block_invoke_3;
    v28[3] = &__block_descriptor_40_e43_v16__0___BSDescriptionStringAppendTarget__8l;
    v28[4] = v27;
    objc_msgSend(v4, "appendCustomFormatWithName:block:", CFSTR(":"), v28);
  }

}

void ___BKSHIDEventConciseDescriptionDigitizer_block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  BKSHIDEventGetConciseDescription(v2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

}

@end
