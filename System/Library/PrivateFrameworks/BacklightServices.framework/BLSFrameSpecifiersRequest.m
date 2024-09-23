@implementation BLSFrameSpecifiersRequest

- (BLSFrameSpecifiersRequest)initWithDateInterval:(id)a3 previousPresentationDate:(id)a4 shouldReset:(BOOL)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  BLSFrameSpecifiersRequest *v14;
  BLSFrameSpecifiersRequest *v15;
  uint64_t v16;
  id completion;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)BLSFrameSpecifiersRequest;
  v14 = -[BLSFrameSpecifiersRequest init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v14->_dateInterval, a3);
    objc_storeStrong((id *)&v15->_previousPresentationDate, a4);
    v15->_shouldReset = a5;
    v16 = MEMORY[0x1B5E0F100](v13);
    completion = v15->_completion;
    v15->_completion = (id)v16;

  }
  return v15;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateInterval bls_shortLoggingString](self->_dateInterval, "bls_shortLoggingString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("interval"));

  -[NSDate bls_shortLoggingString](self->_previousPresentationDate, "bls_shortLoggingString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("previous"));

  v8 = (id)objc_msgSend(v3, "appendBool:withName:", self->_shouldReset, CFSTR("reset"));
  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_dateInterval);
  v5 = (id)objc_msgSend(v3, "appendObject:", self->_previousPresentationDate);
  v6 = (id)objc_msgSend(v3, "appendBool:", self->_shouldReset);
  v7 = objc_msgSend(v3, "hash");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  NSDateInterval *dateInterval;
  uint64_t v7;
  id v8;
  id v9;
  NSDate *previousPresentationDate;
  id v11;
  id v12;
  uint64_t shouldReset;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  dateInterval = self->_dateInterval;
  v7 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __37__BLSFrameSpecifiersRequest_isEqual___block_invoke;
  v21[3] = &unk_1E621A808;
  v8 = v4;
  v22 = v8;
  v9 = (id)objc_msgSend(v5, "appendObject:counterpart:", dateInterval, v21);
  previousPresentationDate = self->_previousPresentationDate;
  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = __37__BLSFrameSpecifiersRequest_isEqual___block_invoke_2;
  v19[3] = &unk_1E621A808;
  v11 = v8;
  v20 = v11;
  v12 = (id)objc_msgSend(v5, "appendObject:counterpart:", previousPresentationDate, v19);
  shouldReset = self->_shouldReset;
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __37__BLSFrameSpecifiersRequest_isEqual___block_invoke_3;
  v17[3] = &unk_1E621ACF0;
  v18 = v11;
  v14 = v11;
  v15 = (id)objc_msgSend(v5, "appendBool:counterpart:", shouldReset, v17);
  LOBYTE(shouldReset) = objc_msgSend(v5, "isEqual");

  return shouldReset;
}

uint64_t __37__BLSFrameSpecifiersRequest_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dateInterval");
}

uint64_t __37__BLSFrameSpecifiersRequest_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "previousPresentationDate");
}

uint64_t __37__BLSFrameSpecifiersRequest_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "shouldReset");
}

- (void)completeWithDateSpecifiers:(id)a3
{
  id v4;
  _BOOL4 lock_completed;
  void (**v6)(_QWORD, _QWORD);
  id completion;
  NSObject *v8;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  lock_completed = self->_lock_completed;
  self->_lock_completed = 1;
  v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x1B5E0F100](self->_completion);
  completion = self->_completion;
  self->_completion = 0;

  os_unfair_lock_unlock(&self->_lock);
  if (lock_completed)
  {
    bls_scenes_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[BLSFrameSpecifiersRequest completeWithDateSpecifiers:].cold.1((uint64_t)self, v8);

  }
  else if (v6)
  {
    ((void (**)(_QWORD, id))v6)[2](v6, v4);
  }

}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (NSDate)previousPresentationDate
{
  return self->_previousPresentationDate;
}

- (BOOL)shouldReset
{
  return self->_shouldReset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousPresentationDate, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong(&self->_completion, 0);
}

- (void)completeWithDateSpecifiers:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1B0C75000, a2, OS_LOG_TYPE_ERROR, "completeWithDateSpecifiers should only be called once for request:%@", (uint8_t *)&v2, 0xCu);
}

@end
