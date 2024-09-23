@implementation BKSHIDEventAuthenticationOriginator

- (id)buildMessage:(id)a3
{
  id v5;
  __uint64_t v6;
  _BKSHIDEventAuthenticationKey *key;
  _BKSHIDEventAuthenticationKey *v8;
  BKSHIDEventAuthenticationOriginator *v9;
  uint64_t v10;
  _BKSHIDEventAuthenticationKey *v11;
  _BKSHIDEventAuthenticationKey *v12;
  _BKSHIDEventAuthenticationKey *v13;
  void (**v14)(id, _QWORD *);
  uint64_t v15;
  _BKSHIDEventAuthenticationKey *v16;
  _BKSHIDEventAuthenticationKey *v17;
  _QWORD *v18;
  uint64_t v19;
  _BKSHIDEventAuthenticationKey *v20;
  _QWORD *v21;
  const void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  void *v31;
  void *v32;
  objc_class *v33;
  void *v34;
  void *v35;
  objc_class *v36;
  void *v37;
  objc_class *v38;
  void *v39;
  void *v40;
  void *v41;
  objc_class *v42;
  void *v43;
  void *v44;
  objc_super v45;
  CCHmacContext bytes;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BKSHIDEventAuthenticationOriginator.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("builder != nil"));

  }
  v6 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  key = self->_key;
  if (!key)
  {
    objc_opt_self();
    CCRandomGenerateBytes(&bytes, 0x20uLL);
    v8 = [_BKSHIDEventAuthenticationKey alloc];
    if (v8)
    {
      v45.receiver = v8;
      v45.super_class = (Class)_BKSHIDEventAuthenticationKey;
      v9 = -[BKSHIDEventAuthenticationOriginator init](&v45, sel_init);
      if (v9)
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &bytes, 32);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = v9->_key;
        v9->_key = (_BKSHIDEventAuthenticationKey *)v10;

      }
    }
    else
    {
      v9 = 0;
    }
    v12 = self->_key;
    self->_key = (_BKSHIDEventAuthenticationKey *)v9;

    key = self->_key;
  }
  self->_keyLastAccessTime = (double)v6 / 1000000000.0;
  v13 = key;
  v14 = (void (**)(id, _QWORD *))v5;
  v15 = objc_opt_self();
  v16 = v13;
  if (!v16)
  {
    v28 = (void *)MEMORY[0x1E0CB3940];
    v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("key"), v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__withInternalKey_buildMessage_);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (objc_class *)objc_opt_class();
      NSStringFromClass(v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      bytes.ctx[0] = 138544642;
      *(_QWORD *)&bytes.ctx[1] = v32;
      LOWORD(bytes.ctx[3]) = 2114;
      *(_QWORD *)((char *)&bytes.ctx[3] + 2) = v34;
      HIWORD(bytes.ctx[5]) = 2048;
      *(_QWORD *)&bytes.ctx[6] = v15;
      LOWORD(bytes.ctx[8]) = 2114;
      *(_QWORD *)((char *)&bytes.ctx[8] + 2) = CFSTR("BKSHIDEventAuthenticationMessage.m");
      HIWORD(bytes.ctx[10]) = 1024;
      bytes.ctx[11] = 249;
      LOWORD(bytes.ctx[12]) = 2114;
      *(_QWORD *)((char *)&bytes.ctx[12] + 2) = v31;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&bytes, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v31), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A13CC18);
  }
  v17 = v16;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v35 = (void *)MEMORY[0x1E0CB3940];
    v36 = (objc_class *)-[_BKSHIDEventAuthenticationKey classForCoder](v17, "classForCoder");
    if (!v36)
      v36 = (objc_class *)objc_opt_class();
    NSStringFromClass(v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (objc_class *)objc_opt_class();
    NSStringFromClass(v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("key"), v37, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__withInternalKey_buildMessage_);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (objc_class *)objc_opt_class();
      NSStringFromClass(v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      bytes.ctx[0] = 138544642;
      *(_QWORD *)&bytes.ctx[1] = v41;
      LOWORD(bytes.ctx[3]) = 2114;
      *(_QWORD *)((char *)&bytes.ctx[3] + 2) = v43;
      HIWORD(bytes.ctx[5]) = 2048;
      *(_QWORD *)&bytes.ctx[6] = v15;
      LOWORD(bytes.ctx[8]) = 2114;
      *(_QWORD *)((char *)&bytes.ctx[8] + 2) = CFSTR("BKSHIDEventAuthenticationMessage.m");
      HIWORD(bytes.ctx[10]) = 1024;
      bytes.ctx[11] = 249;
      LOWORD(bytes.ctx[12]) = 2114;
      *(_QWORD *)((char *)&bytes.ctx[12] + 2) = v40;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&bytes, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v40), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A13CD54);
  }

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", sel__withInternalKey_buildMessage_, v15, CFSTR("BKSHIDEventAuthenticationMessage.m"), 250, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("builder != nil"));

  }
  v18 = -[BKSHIDEventAuthenticationMessage _init]([BKSMutableHIDEventAuthenticationMessage alloc]);
  v14[2](v14, v18);
  v19 = mach_continuous_time();
  if (v18)
  {
    v18[6] = v19;
    v20 = v17;
    v21 = (_QWORD *)objc_msgSend(v18, "copy");
    v22 = (const void *)-[_BKSHIDEventAuthenticationKey _context]((uint64_t)v20);

    memcpy(&bytes, v22, sizeof(bytes));
    -[BKSHIDEventAuthenticationMessage _calculateSignatureWithHMACContext:]((uint64_t)v21, &bytes);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "copy");
    v25 = (void *)v21[11];
    v21[11] = v24;

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (int64_t)validateMessage:(id)a3
{
  id *v5;
  id *v6;
  _BKSHIDEventAuthenticationKey *key;
  _BKSHIDEventAuthenticationKey *v8;
  const void *v9;
  void *v10;
  size_t v11;
  id v12;
  int v13;
  int64_t v14;
  NSObject *v15;
  const char *v16;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  objc_class *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  objc_class *v35;
  void *v36;
  objc_class *v37;
  void *v38;
  void *v39;
  void *v40;
  objc_class *v41;
  void *v42;
  CCHmacContext __dst;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = (id *)a3;
  if (!v5)
  {
    v18 = (void *)MEMORY[0x1E0CB3940];
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("message"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      __dst.ctx[0] = 138544642;
      *(_QWORD *)&__dst.ctx[1] = v22;
      LOWORD(__dst.ctx[3]) = 2114;
      *(_QWORD *)((char *)&__dst.ctx[3] + 2) = v24;
      HIWORD(__dst.ctx[5]) = 2048;
      *(_QWORD *)&__dst.ctx[6] = self;
      LOWORD(__dst.ctx[8]) = 2114;
      *(_QWORD *)((char *)&__dst.ctx[8] + 2) = CFSTR("BKSHIDEventAuthenticationOriginator.m");
      HIWORD(__dst.ctx[10]) = 1024;
      __dst.ctx[11] = 49;
      LOWORD(__dst.ctx[12]) = 2114;
      *(_QWORD *)((char *)&__dst.ctx[12] + 2) = v21;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&__dst, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A13D0BCLL);
  }
  v6 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v25 = (void *)MEMORY[0x1E0CB3940];
    v26 = (objc_class *)objc_msgSend(v6, "classForCoder");
    if (!v26)
      v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (objc_class *)objc_opt_class();
    NSStringFromClass(v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("message"), v27, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (objc_class *)objc_opt_class();
      NSStringFromClass(v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      __dst.ctx[0] = 138544642;
      *(_QWORD *)&__dst.ctx[1] = v31;
      LOWORD(__dst.ctx[3]) = 2114;
      *(_QWORD *)((char *)&__dst.ctx[3] + 2) = v33;
      HIWORD(__dst.ctx[5]) = 2048;
      *(_QWORD *)&__dst.ctx[6] = self;
      LOWORD(__dst.ctx[8]) = 2114;
      *(_QWORD *)((char *)&__dst.ctx[8] + 2) = CFSTR("BKSHIDEventAuthenticationOriginator.m");
      HIWORD(__dst.ctx[10]) = 1024;
      __dst.ctx[11] = 49;
      LOWORD(__dst.ctx[12]) = 2114;
      *(_QWORD *)((char *)&__dst.ctx[12] + 2) = v30;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&__dst, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v30), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A13D1F8);
  }

  key = self->_key;
  if (!key)
  {
    BKLogEventDelivery();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
LABEL_14:

      v14 = 1;
      goto LABEL_15;
    }
    LOWORD(__dst.ctx[0]) = 0;
    v16 = "message auth failure: backboardd hasn't signed any events";
LABEL_17:
    _os_log_error_impl(&dword_18A0F0000, v15, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&__dst, 2u);
    goto LABEL_14;
  }
  v8 = key;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v34 = (void *)MEMORY[0x1E0CB3940];
    v35 = (objc_class *)-[_BKSHIDEventAuthenticationKey classForCoder](v8, "classForCoder");
    if (!v35)
      v35 = (objc_class *)objc_opt_class();
    NSStringFromClass(v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (objc_class *)objc_opt_class();
    NSStringFromClass(v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("key"), v36, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__verifySignatureWithInternalKey_);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = (objc_class *)objc_opt_class();
      NSStringFromClass(v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      __dst.ctx[0] = 138544642;
      *(_QWORD *)&__dst.ctx[1] = v40;
      LOWORD(__dst.ctx[3]) = 2114;
      *(_QWORD *)((char *)&__dst.ctx[3] + 2) = v42;
      HIWORD(__dst.ctx[5]) = 2048;
      *(_QWORD *)&__dst.ctx[6] = v6;
      LOWORD(__dst.ctx[8]) = 2114;
      *(_QWORD *)((char *)&__dst.ctx[8] + 2) = CFSTR("BKSHIDEventAuthenticationMessage.m");
      HIWORD(__dst.ctx[10]) = 1024;
      __dst.ctx[11] = 263;
      LOWORD(__dst.ctx[12]) = 2114;
      *(_QWORD *)((char *)&__dst.ctx[12] + 2) = v39;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&__dst, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v39), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A13D338);
  }

  v9 = (const void *)-[_BKSHIDEventAuthenticationKey _context]((uint64_t)v8);
  memcpy(&__dst, v9, sizeof(__dst));
  -[BKSHIDEventAuthenticationMessage _calculateSignatureWithHMACContext:]((uint64_t)v6, &__dst);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6[11], "length");
  if (v11 != objc_msgSend(v10, "length"))
  {

    goto LABEL_13;
  }
  v12 = objc_retainAutorelease(v10);
  v13 = timingsafe_bcmp((const void *)objc_msgSend(v12, "bytes"), (const void *)objc_msgSend(v6[11], "bytes"), v11);

  if (v13)
  {
LABEL_13:
    BKLogEventDelivery();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    LOWORD(__dst.ctx[0]) = 0;
    v16 = "message auth failure: contents failed to verify; message is corrupt";
    goto LABEL_17;
  }
  if (objc_msgSend(v6, "registrantEntitled"))
    v14 = 2;
  else
    v14 = 3;
LABEL_15:

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
}

@end
