@implementation BLSHBacklightEnvironmentStateMachineAbortPayload

+ (unsigned)presentationEntryIdentifierFromString:(id)a3
{
  id v3;
  unsigned int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqual:", CFSTR("com.apple.Carousel")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqual:", CFSTR("com.apple.clockface")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqual:", CFSTR("com.apple.Carousel.defaultblanking")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("com.apple.carousel.lockscreen")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("com.apple.carousel.bulletin.alert")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("remoteContextView")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("com.apple.Carousel.coordinatedBacklightTransitioner")) & 1) != 0)
  {
    v4 = 8;
  }
  else if (objc_msgSend(v3, "containsString:", CFSTR("alert:Legacy")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (void)populatePresentationStruct:(id *)a3 withPresentation:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int *p_var5;
  unsigned int *p_var4;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  unsigned int *v21;
  void *v22;
  unsigned int *p_var6;
  unsigned int *p_var7;
  id v26;

  v6 = a4;
  *(_BYTE *)a3 = *(_BYTE *)a3 & 0xFE | (v6 != 0);
  v26 = v6;
  if (v6)
  {
    objc_msgSend(v6, "flipbookContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isInverted"))
      v8 = 4;
    else
      v8 = 0;
    *(_BYTE *)a3 = *(_BYTE *)a3 & 0xFB | v8;

    objc_msgSend(v26, "flipbookContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "wantsTransform"))
      v10 = 2;
    else
      v10 = 0;
    *(_BYTE *)a3 = *(_BYTE *)a3 & 0xFD | v10;

    objc_msgSend(v26, "presentationEntries");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    v13 = 0;
    a3->var3 = v12;
    p_var6 = &a3->var6;
    p_var7 = &a3->var7;
    p_var5 = &a3->var5;
    p_var4 = &a3->var4;
    do
    {
      if (v12 == v13)
        break;
      objc_msgSend(v26, "presentationEntries");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "environment");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = objc_msgSend(a1, "presentationEntryIdentifierFromString:", v19);
      v21 = p_var4;
      switch((int)v13)
      {
        case 0:
          break;
        case 1:
          v21 = p_var5;
          break;
        case 2:
          v21 = p_var6;
          break;
        case 3:
          v21 = p_var7;
          break;
        default:
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Can't handle index %u"), v13);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            +[BLSHBacklightEnvironmentStateMachineAbortPayload populatePresentationStruct:withPresentation:].cold.1(a2);
          objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x2145CF64CLL);
      }
      *v21 = v20;

      ++v13;
    }
    while (v13 != 4);
  }

}

+ (void)populateTransitionStateStruct:(void *)a3 withTransitionState:
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  char v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_opt_self();
  *(_BYTE *)a2 = *(_BYTE *)a2 & 0xFE | (v9 != 0);
  if (v9)
  {
    objc_msgSend(v9, "environment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(a2 + 4) = objc_msgSend(v4, "presentationEntryIdentifierFromString:", v6);

    *(_BYTE *)(a2 + 8) = *(_BYTE *)(a2 + 8) & 0xFE | objc_msgSend(v9, "isUpdatingInitialState");
    if (objc_msgSend(v9, "isUpdatingVisualState"))
      v7 = 2;
    else
      v7 = 0;
    *(_BYTE *)(a2 + 8) = *(_BYTE *)(a2 + 8) & 0xFD | v7;
    if (objc_msgSend(v9, "isAnimating"))
      v8 = 4;
    else
      v8 = 0;
    *(_BYTE *)(a2 + 8) = *(_BYTE *)(a2 + 8) & 0xFB | v8;
  }

}

+ (void)populateEnvironmentStateMachineStruct:(id *)a3 machineIsNil:(BOOL)a4 presentation:(id)a5 addingEnvironmentsCount:(int)a6 updatingVisualStateTransitionStates:(id)a7 updatingDateSpecifierTransitionStates:(id)a8 backlightState:(int64_t)a9 previousBacklightState:(int64_t)a10 pendingNotifyBeganUpdatingState:(BOOL)a11 updatingState:(BOOL)a12 updatingPresentation:(BOOL)a13
{
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  $E9FC172C42E5E15B085ED6662D38B007 *p_var3;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  $E9FC172C42E5E15B085ED6662D38B007 *p_var8;
  char v29;
  char v30;
  void *v31;
  void *v32;
  id v33;

  v33 = a5;
  v19 = a7;
  v20 = a8;
  *(_BYTE *)a3 = *(_BYTE *)a3 & 0xFE | !a4;
  if (!a4)
  {
    objc_msgSend(a1, "populatePresentationStruct:withPresentation:", &a3->var1, v33);
    v21 = objc_msgSend(v19, "count");
    v22 = 0;
    a3->var2 = v21;
    do
    {
      if (v21 == v22)
        break;
      objc_msgSend(v19, "objectAtIndexedSubscript:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      p_var3 = &a3->var3;
      switch((int)v22)
      {
        case 0:
          break;
        case 1:
          p_var3 = &a3->var4;
          break;
        case 2:
          p_var3 = &a3->var5;
          break;
        case 3:
          p_var3 = &a3->var6;
          break;
        default:
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Can't handle index %u"), v22);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            +[BLSHBacklightEnvironmentStateMachineAbortPayload populateEnvironmentStateMachineStruct:machineIsNil:presentation:addingEnvironmentsCount:updatingVisualStateTransitionStates:updatingDateSpecifierTransitionStates:backlightState:previousBacklightState:pendingNotifyBeganUpdatingState:updatingState:updatingPresentation:].cold.2(a2);
          objc_msgSend(objc_retainAutorelease(v31), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x2145CF9F4);
      }
      +[BLSHBacklightEnvironmentStateMachineAbortPayload populateTransitionStateStruct:withTransitionState:]((uint64_t)a1, (uint64_t)p_var3, v23);

      ++v22;
    }
    while (v22 != 4);
    v25 = objc_msgSend(v20, "count");
    v26 = 0;
    a3->var7 = v25;
    do
    {
      if (v25 == v26)
        break;
      objc_msgSend(v20, "objectAtIndexedSubscript:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      p_var8 = &a3->var8;
      switch((int)v26)
      {
        case 0:
          break;
        case 1:
          p_var8 = &a3->var9;
          break;
        case 2:
          p_var8 = &a3->var10;
          break;
        case 3:
          p_var8 = &a3->var11;
          break;
        default:
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Can't handle index %u"), v26);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            +[BLSHBacklightEnvironmentStateMachineAbortPayload populateEnvironmentStateMachineStruct:machineIsNil:presentation:addingEnvironmentsCount:updatingVisualStateTransitionStates:updatingDateSpecifierTransitionStates:backlightState:previousBacklightState:pendingNotifyBeganUpdatingState:updatingState:updatingPresentation:].cold.1(a2);
          objc_msgSend(objc_retainAutorelease(v32), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x2145CFA50);
      }
      +[BLSHBacklightEnvironmentStateMachineAbortPayload populateTransitionStateStruct:withTransitionState:]((uint64_t)a1, (uint64_t)p_var8, v27);

      ++v26;
    }
    while (v26 != 4);
    a3->var12 = a9;
    a3->var13 = a10;
    if (a12)
      v29 = 2;
    else
      v29 = 0;
    if (a13)
      v30 = 4;
    else
      v30 = 0;
    *((_BYTE *)a3 + 140) = v29 | a11 | v30 | *((_BYTE *)a3 + 140) & 0xF8;
  }

}

+ (void)populateOperationCompletedMismatchedBacklightStatesStruct:(id *)a3 backlightState:(int64_t)a4 targetBacklightState:(int64_t)a5 performEventHistory:(id)a6 didBeginUpdateHistory:(id)a7 didCompleteUpdateHistory:(id)a8 envStateMachineIsNil:(BOOL)a9 envStateMachinePresentation:(id)a10 addingEnvironmentsCount:(int)a11 envStateMachineUpdatingVisualStateTransitionStates:(id)a12 envStateMachineUpdatingDateSpecifierTransitionStates:(id)a13 envStateMachineBacklightState:(int64_t)a14 envStateMachinePreviousBacklightState:(int64_t)a15 envStateMachinePendingNotifyBeganUpdatingState:(BOOL)a16 envStateMachineUpdatingState:(BOOL)a17 envStateMachineUpdatingPresentation:(BOOL)a18
{
  int v20;
  int v21;
  id v24;
  id v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char *v29;
  char v30;
  void *v31;
  unint64_t v32;
  unint64_t v33;
  $87CBB90781577737C22A7DE0C626EF6C *var6;
  void *v35;
  void *v36;
  unint64_t v37;
  unint64_t v38;
  $87CBB90781577737C22A7DE0C626EF6C *var8;
  char v40;
  void *v41;
  void *v42;
  uint64_t v43;
  id v44;
  id v45;
  id v46;
  id v47;

  v20 = a5;
  v21 = a4;
  v47 = a6;
  v24 = a7;
  v25 = a8;
  v46 = a10;
  v45 = a12;
  v44 = a13;
  a3->var0 = 1;
  a3->var1 = v21;
  a3->var2 = v20;
  v26 = objc_msgSend(v47, "count");
  v27 = 0;
  v28 = 0;
  a3->var3 = v26;
  do
  {
    v29 = (char *)a3 + v27 * 32;
    a3->var4[v27].var0 = 1;
    v30 = *((_BYTE *)&a3->var4[v27] + 4);
    if (v28 >= v26)
    {
      v29[20] = v30 & 0xFE;
    }
    else
    {
      v29[20] = v30 | 1;
      objc_msgSend(v47, "objectAtIndexedSubscript:", v28);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *((_DWORD *)v29 + 6) = objc_msgSend(v31, "stateMachineOldBacklightState");
      *((_DWORD *)v29 + 7) = objc_msgSend(v31, "eventPreviousBacklightState");
      *((_DWORD *)v29 + 8) = objc_msgSend(v31, "eventNewBacklightState");
      *((_QWORD *)v29 + 5) = objc_msgSend(v31, "startedTime");

    }
    ++v28;
    ++v27;
  }
  while (v27 != 5);
  v32 = objc_msgSend(v24, "count");
  v33 = 0;
  a3->var5 = v32;
  var6 = a3->var6;
  do
  {
    var6->var0 = 1;
    if (v33 >= v32)
    {
      LOBYTE(var6[5].var3) &= ~1u;
    }
    else
    {
      *((_BYTE *)var6 + 4) |= 1u;
      objc_msgSend(v24, "objectAtIndexedSubscript:", v33);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "environmentIdentifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      var6->var2 = objc_msgSend(a1, "presentationEntryIdentifierFromString:", v36);

      var6->var3 = objc_msgSend(v35, "newBacklightState");
      var6->var4 = objc_msgSend(v35, "pendingTransitionStateCount");
      var6->var5 = objc_msgSend(v35, "timeStamp");

    }
    ++v33;
    ++var6;
  }
  while (v33 != 5);
  v37 = objc_msgSend(v25, "count");
  v38 = 0;
  a3->var7 = v37;
  var8 = a3->var8;
  do
  {
    var8->var0 = 1;
    v40 = *((_BYTE *)var8 + 4);
    if (v38 >= v37)
    {
      *((_BYTE *)var8 + 4) = v40 & 0xFE;
    }
    else
    {
      *((_BYTE *)var8 + 4) = v40 | 1;
      objc_msgSend(v25, "objectAtIndexedSubscript:", v38);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "environmentIdentifier");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      var8->var2 = objc_msgSend(a1, "presentationEntryIdentifierFromString:", v42);

      var8->var3 = objc_msgSend(v41, "newBacklightState");
      var8->var4 = objc_msgSend(v41, "pendingTransitionStateCount");
      var8->var5 = objc_msgSend(v41, "timeStamp");

    }
    ++v38;
    ++var8;
  }
  while (v38 != 5);
  BYTE2(v43) = a18;
  LOWORD(v43) = __PAIR16__(a17, a16);
  objc_msgSend(a1, "populateEnvironmentStateMachineStruct:machineIsNil:presentation:addingEnvironmentsCount:updatingVisualStateTransitionStates:updatingDateSpecifierTransitionStates:backlightState:previousBacklightState:pendingNotifyBeganUpdatingState:updatingState:updatingPresentation:", &a3->var9, a9, v46, a11, v45, v44, a14, a15, v43);

}

+ (void)populatePresentationStruct:(const char *)a1 withPresentation:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_2145AC000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

+ (void)populateEnvironmentStateMachineStruct:(const char *)a1 machineIsNil:presentation:addingEnvironmentsCount:updatingVisualStateTransitionStates:updatingDateSpecifierTransitionStates:backlightState:previousBacklightState:pendingNotifyBeganUpdatingState:updatingState:updatingPresentation:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_2145AC000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

+ (void)populateEnvironmentStateMachineStruct:(const char *)a1 machineIsNil:presentation:addingEnvironmentsCount:updatingVisualStateTransitionStates:updatingDateSpecifierTransitionStates:backlightState:previousBacklightState:pendingNotifyBeganUpdatingState:updatingState:updatingPresentation:.cold.2(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_2145AC000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

@end
