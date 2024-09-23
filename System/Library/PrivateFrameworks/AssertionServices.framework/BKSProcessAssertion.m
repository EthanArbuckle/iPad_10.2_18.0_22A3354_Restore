@implementation BKSProcessAssertion

- (void)dealloc
{
  RBSAssertion *mediaPlaybackHackAssertion;
  RBSAssertion *v4;
  objc_super v5;

  mediaPlaybackHackAssertion = self->_mediaPlaybackHackAssertion;
  if (mediaPlaybackHackAssertion)
  {
    -[RBSAssertion invalidate](mediaPlaybackHackAssertion, "invalidate");
    v4 = self->_mediaPlaybackHackAssertion;
    self->_mediaPlaybackHackAssertion = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)BKSProcessAssertion;
  -[BKSAssertion dealloc](&v5, sel_dealloc);
}

- (void)invalidate
{
  RBSAssertion *mediaPlaybackHackAssertion;
  RBSAssertion *v4;
  objc_super v5;

  mediaPlaybackHackAssertion = self->_mediaPlaybackHackAssertion;
  if (mediaPlaybackHackAssertion)
  {
    -[RBSAssertion invalidate](mediaPlaybackHackAssertion, "invalidate");
    v4 = self->_mediaPlaybackHackAssertion;
    self->_mediaPlaybackHackAssertion = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)BKSProcessAssertion;
  -[BKSAssertion invalidate](&v5, sel_invalidate);
}

- (BKSProcessAssertion)initWithPID:(int)a3 flags:(unsigned int)a4 reason:(unsigned int)a5 name:(id)a6 withHandler:(id)a7 acquire:(BOOL)a8
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v14;
  BKSProcessAssertion *v15;
  NSObject *v16;
  uint64_t v18;

  v10 = *(_QWORD *)&a5;
  v11 = *(_QWORD *)&a4;
  v12 = *(_QWORD *)&a3;
  v14 = a6;
  if ((int)v12 <= 0)
  {
    rbs_shim_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[BKSProcessAssertion initWithPID:flags:reason:name:withHandler:acquire:].cold.1();

    v15 = 0;
  }
  else
  {
    LOBYTE(v18) = a8;
    self = -[BKSProcessAssertion initWithBundleIdentifier:pid:flags:reason:name:withHandler:acquire:](self, "initWithBundleIdentifier:pid:flags:reason:name:withHandler:acquire:", 0, v12, v11, v10, v14, a7, v18);
    v15 = self;
  }

  return v15;
}

- (BOOL)acquire
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  RBSAssertion *v14;
  RBSAssertion *mediaPlaybackHackAssertion;
  RBSAssertion *v16;
  id v17;
  void *v18;
  NSObject *v20;
  objc_super v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  if (self->_reason != 1)
    goto LABEL_12;
  -[BKSAssertion _target](self, "_target");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "processIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v5 = (void *)MEMORY[0x1E0D87D68];
    objc_msgSend(MEMORY[0x1E0D87DA0], "predicateMatchingTarget:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleForPredicate:error:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "identity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (!objc_msgSend(v4, "isExtension"))
  {
LABEL_11:

LABEL_12:
    v21.receiver = self;
    v21.super_class = (Class)BKSProcessAssertion;
    return -[BKSAssertion acquire](&v21, sel_acquire);
  }
  objc_msgSend(v4, "hostIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    rbs_general_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v24 = v4;
      _os_log_impl(&dword_1B0792000, v11, OS_LOG_TYPE_DEFAULT, "MediaPlayback hack extensions %{public}@ doesn't have host", buf, 0xCu);
    }
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0D87D20], "attributeWithReason:flags:", 1, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v9;
  objc_msgSend(MEMORY[0x1E0D87C80], "attributeWithCompletionPolicy:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v11 = objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc(MEMORY[0x1E0D87C98]);
  objc_msgSend(MEMORY[0x1E0D87DF8], "targetWithProcessIdentifier:", v8);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (RBSAssertion *)objc_msgSend(v12, "initWithExplanation:target:attributes:", CFSTR("MediaPlackback hack assertion"), v13, v11);
  mediaPlaybackHackAssertion = self->_mediaPlaybackHackAssertion;
  self->_mediaPlaybackHackAssertion = v14;

  v16 = self->_mediaPlaybackHackAssertion;
  v22 = 0;
  LOBYTE(v13) = -[RBSAssertion acquireWithError:](v16, "acquireWithError:", &v22);
  v17 = v22;
  v18 = v17;
  if ((v13 & 1) != 0)
  {

LABEL_10:
    goto LABEL_11;
  }
  rbs_general_log();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    -[BKSProcessAssertion acquire].cold.1();

  return 0;
}

uint64_t __90__BKSProcessAssertion_initWithBundleIdentifier_pid_flags_reason_name_withHandler_acquire___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BKSProcessAssertion)initWithBundleIdentifier:(id)a3 pid:(int)a4 flags:(unsigned int)a5 reason:(unsigned int)a6 name:(id)a7 withHandler:(id)a8 acquire:(BOOL)a9
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  BKSProcessAssertion *v20;
  NSObject *v22;
  void *v23;
  _DWORD *v24;
  void *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  objc_super v33;
  _QWORD v34[4];
  NSObject *v35;
  _QWORD v36[2];

  v11 = *(_QWORD *)&a6;
  v12 = *(_QWORD *)&a5;
  v13 = *(_QWORD *)&a4;
  v36[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a7;
  v17 = a8;
  if (!v15 && (int)v13 <= 0)
  {
    rbs_shim_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[BKSProcessAssertion initWithBundleIdentifier:pid:flags:reason:name:withHandler:acquire:].cold.2();

  }
  if ((int)v11 > 10000)
  {
    if ((v11 - 50000) >= 4 && (_DWORD)v11 != 10003 && (_DWORD)v11 != 10001)
      goto LABEL_17;
  }
  else if (v11 > 0x18 || ((1 << v11) & 0x142C840) == 0)
  {
LABEL_17:
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __90__BKSProcessAssertion_initWithBundleIdentifier_pid_flags_reason_name_withHandler_acquire___block_invoke;
    v34[3] = &unk_1E61696B8;
    v22 = v17;
    v35 = v22;
    v23 = (void *)MEMORY[0x1B5E0B334](v34);
    v33.receiver = self;
    v33.super_class = (Class)BKSProcessAssertion;
    v24 = -[BKSAssertion _initWithName:handler:](&v33, sel__initWithName_handler_, v16, v23);
    v25 = v24;
    if (v24)
    {
      v26 = a9;
      v24[17] = v12;
      v24[16] = v11;
      if (v15)
      {
        objc_msgSend(MEMORY[0x1E0D87D80], "identityForEmbeddedApplicationIdentifier:", v15);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D87DF8], "targetWithProcessIdentity:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v26 = a9;
      }
      else if ((int)v13 < 1)
      {
        v28 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D87DF8], "targetWithPid:", v13);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v25, "_setTarget:", v28);
      v29 = objc_msgSend(v25, "_legacyFlagsForFlags:", v12);
      v30 = objc_msgSend(v25, "_legacyReasonForReason:", v11);
      objc_msgSend(MEMORY[0x1E0D87D20], "attributeWithReason:flags:", v30, v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = v31;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v25, "_setAttributes:", v32);
      if (v26)
      {
        if (v22)
          objc_msgSend(v25, "_acquireAsynchronously");
        else
          objc_msgSend(v25, "acquire");
      }

    }
    self = v25;

    v19 = v35;
    v20 = self;
    goto LABEL_16;
  }
  rbs_shim_log();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    -[BKSProcessAssertion initWithBundleIdentifier:pid:flags:reason:name:withHandler:acquire:].cold.1((uint64_t)v16, v11, v19);
  v20 = 0;
LABEL_16:

  return v20;
}

- (unint64_t)_legacyReasonForReason:(unsigned int)a3
{
  unint64_t result;

  result = 0;
  switch(a3)
  {
    case 1u:
      result = 1;
      break;
    case 2u:
      result = 2;
      break;
    case 3u:
      result = 3;
      break;
    case 4u:
      result = 4;
      break;
    case 5u:
      result = 5;
      break;
    case 6u:
    case 0xBu:
    case 0xEu:
    case 0xFu:
    case 0x11u:
    case 0x16u:
      return result;
    case 7u:
      result = 7;
      break;
    case 8u:
      result = 8;
      break;
    case 9u:
      result = 9;
      break;
    case 0xAu:
      result = 10;
      break;
    case 0xCu:
      result = 12;
      break;
    case 0xDu:
      result = 13;
      break;
    case 0x10u:
      result = 16;
      break;
    case 0x12u:
      result = 18;
      break;
    case 0x13u:
      result = 19;
      break;
    case 0x14u:
      result = 20;
      break;
    case 0x15u:
      result = 21;
      break;
    case 0x17u:
      result = 23;
      break;
    default:
      switch(a3)
      {
        case 0x2710u:
          result = 10000;
          break;
        case 0x2711u:
        case 0x2713u:
          return result;
        case 0x2712u:
          result = 10002;
          break;
        case 0x2714u:
          result = 10004;
          break;
        case 0x2715u:
          result = 10005;
          break;
        case 0x2716u:
          result = 10006;
          break;
        case 0x2717u:
          result = 10007;
          break;
        case 0x2718u:
          result = 10008;
          break;
        default:
          if (a3 == 50004)
            result = 50004;
          else
            result = 0;
          break;
      }
      break;
  }
  return result;
}

- (unint64_t)_legacyFlagsForFlags:(unsigned int)a3
{
  return a3 & 0x3F;
}

- (BKSProcessAssertion)initWithPID:(int)a3 flags:(unsigned int)a4 reason:(unsigned int)a5 name:(id)a6
{
  return -[BKSProcessAssertion initWithPID:flags:reason:name:withHandler:acquire:](self, "initWithPID:flags:reason:name:withHandler:acquire:", *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6, 0, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaPlaybackHackAssertion, 0);
}

- (BKSProcessAssertion)initWithPID:(int)a3 flags:(unsigned int)a4 reason:(unsigned int)a5 name:(id)a6 withHandler:(id)a7
{
  return -[BKSProcessAssertion initWithPID:flags:reason:name:withHandler:acquire:](self, "initWithPID:flags:reason:name:withHandler:acquire:", *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6, a7, 1);
}

+ (id)NameForReason:(unsigned int)a3
{
  id result;

  if ((int)a3 > 9999)
  {
    if ((int)a3 > 50003)
    {
      switch(a3)
      {
        case 0xC354u:
          return CFSTR("finishTaskAfterWatchConnectivity");
        case 0xEA60u:
          return CFSTR("domain");
        case 0xEA61u:
          return CFSTR("custom");
        default:
          return CFSTR("Unknown");
      }
    }
    else
    {
      switch(a3)
      {
        case 0x2710u:
          result = CFSTR("activation");
          break;
        case 0x2712u:
          result = CFSTR("transientWakeup");
          break;
        case 0x2714u:
          result = CFSTR("finishTaskUnbounded");
          break;
        case 0x2715u:
          result = CFSTR("continuous");
          break;
        case 0x2716u:
          result = CFSTR("backgroundContentFetching");
          break;
        case 0x2717u:
          result = CFSTR("notificationAction");
          break;
        case 0x2718u:
          result = CFSTR("PIP");
          break;
        default:
          return CFSTR("Unknown");
      }
    }
  }
  else
  {
    result = CFSTR("none");
    switch(a3)
    {
      case 0u:
        return result;
      case 1u:
        result = CFSTR("audio");
        break;
      case 2u:
        result = CFSTR("location");
        break;
      case 3u:
        result = CFSTR("external-accessory");
        break;
      case 4u:
        result = CFSTR("finishTask");
        break;
      case 5u:
        result = CFSTR("bluetooth");
        break;
      case 7u:
        result = CFSTR("backgroundUI");
        break;
      case 8u:
        result = CFSTR("interAppAudioStreaming");
        break;
      case 9u:
        result = CFSTR("viewServices");
        break;
      case 0xAu:
        result = CFSTR("newsstandDownload");
        break;
      case 0xCu:
        result = CFSTR("voIP");
        break;
      case 0xDu:
        result = CFSTR("extension");
        break;
      case 0x10u:
        result = CFSTR("WatchConnectivity");
        break;
      case 0x12u:
        result = CFSTR("complicationUpdate");
        break;
      case 0x13u:
        result = CFSTR("workoutProcessing");
        break;
      case 0x14u:
        result = CFSTR("complicationPushUpdate");
        break;
      case 0x15u:
        result = CFSTR("backgroundLocationProcessing");
        break;
      case 0x17u:
        result = CFSTR("audioRecording");
        break;
      default:
        return CFSTR("Unknown");
    }
  }
  return result;
}

- (BKSProcessAssertion)initWithBundleIdentifier:(id)a3 flags:(unsigned int)a4 reason:(unsigned int)a5 name:(id)a6 withHandler:(id)a7 acquire:(BOOL)a8
{
  uint64_t v10;
  uint64_t v11;
  id v14;
  BKSProcessAssertion *v15;
  NSObject *v16;
  uint64_t v18;

  v10 = *(_QWORD *)&a5;
  v11 = *(_QWORD *)&a4;
  v14 = a6;
  if (a3)
  {
    LOBYTE(v18) = a8;
    self = -[BKSProcessAssertion initWithBundleIdentifier:pid:flags:reason:name:withHandler:acquire:](self, "initWithBundleIdentifier:pid:flags:reason:name:withHandler:acquire:", a3, 0xFFFFFFFFLL, v11, v10, v14, a7, v18);
    v15 = self;
  }
  else
  {
    rbs_shim_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[BKSProcessAssertion initWithBundleIdentifier:flags:reason:name:withHandler:acquire:].cold.1();

    v15 = 0;
  }

  return v15;
}

- (BKSProcessAssertion)initWithBundleIdentifier:(id)a3 flags:(unsigned int)a4 reason:(unsigned int)a5 name:(id)a6 withHandler:(id)a7
{
  return -[BKSProcessAssertion initWithBundleIdentifier:flags:reason:name:withHandler:acquire:](self, "initWithBundleIdentifier:flags:reason:name:withHandler:acquire:", a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6, a7, 1);
}

- (BKSProcessAssertion)initWithBundleIdentifier:(id)a3 flags:(unsigned int)a4 reason:(unsigned int)a5 name:(id)a6
{
  return -[BKSProcessAssertion initWithBundleIdentifier:flags:reason:name:withHandler:acquire:](self, "initWithBundleIdentifier:flags:reason:name:withHandler:acquire:", a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6, 0, 0);
}

- (unsigned)flags
{
  unsigned int v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  int v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __28__BKSProcessAssertion_flags__block_invoke;
  v4[3] = &unk_1E61696E0;
  v4[4] = self;
  v4[5] = &v5;
  -[BKSAssertion _lock:](self, "_lock:", v4);
  v2 = *((_DWORD *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __28__BKSProcessAssertion_flags__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 68);
  return result;
}

- (void)setFlags:(unsigned int)a3
{
  _QWORD v3[5];
  unsigned int v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __32__BKSProcessAssertion_setFlags___block_invoke;
  v3[3] = &unk_1E6169708;
  v3[4] = self;
  v4 = a3;
  -[BKSAssertion _lock:](self, "_lock:", v3);
}

uint64_t __32__BKSProcessAssertion_setFlags___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  unsigned int *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(result + 32);
  v2 = *(_DWORD *)(result + 40);
  if (*(_DWORD *)(v1 + 68) != v2)
  {
    v3 = result;
    *(_DWORD *)(v1 + 68) = v2;
    v4 = *(unsigned int **)(result + 32);
    objc_msgSend(MEMORY[0x1E0D87D20], "attributeWithReason:flags:", v4[16], v4[17]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_lock_setAttributes:", v6);

    return objc_msgSend(*(id *)(v3 + 32), "_lock_reaquireAssertion");
  }
  return result;
}

- (void)assertion:(id)a3 didInvalidateWithError:(id)a4
{
  id v6;
  id v7;
  RBSAssertion *mediaPlaybackHackAssertion;
  RBSAssertion *v9;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  mediaPlaybackHackAssertion = self->_mediaPlaybackHackAssertion;
  if (mediaPlaybackHackAssertion)
  {
    -[RBSAssertion invalidate](mediaPlaybackHackAssertion, "invalidate");
    v9 = self->_mediaPlaybackHackAssertion;
    self->_mediaPlaybackHackAssertion = 0;

  }
  v10.receiver = self;
  v10.super_class = (Class)BKSProcessAssertion;
  -[BKSAssertion assertion:didInvalidateWithError:](&v10, sel_assertion_didInvalidateWithError_, v6, v7);

}

- (unsigned)reason
{
  return self->_reason;
}

- (void)initWithBundleIdentifier:(NSObject *)a3 pid:flags:reason:name:withHandler:acquire:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v4;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v4 = a2;
  v13 = *MEMORY[0x1E0C80C00];
  +[BKSProcessAssertion NameForReason:](BKSProcessAssertion, "NameForReason:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543874;
  v8 = a1;
  v9 = 2114;
  v10 = v6;
  v11 = 1024;
  v12 = v4;
  _os_log_fault_impl(&dword_1B0792000, a3, OS_LOG_TYPE_FAULT, "BKSProcessAssertion %{public}@ created with no longer supported reason %{public}@ (%d)", (uint8_t *)&v7, 0x1Cu);

}

- (void)initWithBundleIdentifier:pid:flags:reason:name:withHandler:acquire:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B0792000, v0, v1, "BKSProcessAssertion \"%{public}@\" created with no identifier or PID.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithBundleIdentifier:flags:reason:name:withHandler:acquire:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B0792000, v0, v1, "BKSProcessAssertion \"%{public}@\" initialized with nil bundleIdentifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithPID:flags:reason:name:withHandler:acquire:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B0792000, v0, v1, "BKSProcessAssertion \"%{public}@\" initialized with invalid pid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)acquire
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B0792000, v0, v1, "MediaPlayback hack assertion failed to acquire with error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
