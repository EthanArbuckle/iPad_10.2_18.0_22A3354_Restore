@implementation BLSAlwaysOnTimelineEntrySpecifier

- (BLSAlwaysOnTimelineEntrySpecifier)initWithTimelineEntry:(id)a3 percentComplete:(double)a4 previousTimelineEntry:(id)a5 didChange:(BOOL)a6
{
  id v11;
  id v12;
  BLSAlwaysOnTimelineEntrySpecifier *v13;
  BLSAlwaysOnTimelineEntrySpecifier *v14;
  objc_super v16;

  v11 = a3;
  v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)BLSAlwaysOnTimelineEntrySpecifier;
  v13 = -[BLSAlwaysOnTimelineEntrySpecifier init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_lock._os_unfair_lock_opaque = 0;
    v13->_requestedFidelity = -1;
    v13->_grantedFidelity = -1;
    objc_storeStrong((id *)&v13->_timelineEntry, a3);
    v14->_percentComplete = a4;
    objc_storeStrong((id *)&v14->_previousTimelineEntry, a5);
    v14->_didChange = a6;
  }

  return v14;
}

- (int64_t)compare:(id)a3
{
  BLSAlwaysOnTimelineEntry *timelineEntry;
  void *v4;
  int64_t v5;

  timelineEntry = self->_timelineEntry;
  objc_msgSend(a3, "timelineEntry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BLSAlwaysOnTimelineEntry compare:](timelineEntry, "compare:", v4);

  return v5;
}

- (int64_t)requestedFidelity
{
  os_unfair_lock_s *p_lock;
  int64_t requestedFidelity;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  requestedFidelity = self->_requestedFidelity;
  if (requestedFidelity == -1)
    requestedFidelity = -[BLSAlwaysOnTimelineEntry requestedFidelity](self->_timelineEntry, "requestedFidelity");
  os_unfair_lock_unlock(p_lock);
  return requestedFidelity;
}

- (void)setRequestedFidelity:(int64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_requestedFidelity = a3;
  os_unfair_lock_unlock(p_lock);
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  BLSAlwaysOnTimelineEntrySpecifier *v11;
  id v12;

  v3 = (void *)objc_opt_new();
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __48__BLSAlwaysOnTimelineEntrySpecifier_description__block_invoke;
  v10 = &unk_1E621A3B8;
  v11 = self;
  v12 = v3;
  v4 = v3;
  objc_msgSend(v4, "appendProem:block:", self, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10, v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __48__BLSAlwaysOnTimelineEntrySpecifier_description__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  id v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  const __CFString *v15;
  id v16;
  void *v17;
  __CFString *v18;
  _QWORD v19[5];
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[5];

  objc_msgSend(*(id *)(a1 + 32), "timelineEntry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "previousTimelineEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timelineIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = CFSTR("0x0");
  if (v4)
    v6 = (__CFString *)v4;
  v18 = v6;

  v7 = (id)objc_msgSend(*(id *)(a1 + 40), "appendObject:withName:", v18, 0);
  v8 = objc_msgSend(v2, "isAnimated");
  v9 = MEMORY[0x1E0C809B0];
  if (v8)
  {
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __48__BLSAlwaysOnTimelineEntrySpecifier_description__block_invoke_2;
    v23[3] = &unk_1E621A368;
    v10 = *(void **)(a1 + 40);
    v23[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v10, "appendCustomFormatWithName:block:", 0, v23);
  }
  v11 = *(void **)(a1 + 40);
  v20[0] = v9;
  v20[1] = 3221225472;
  v20[2] = __48__BLSAlwaysOnTimelineEntrySpecifier_description__block_invoke_3;
  v20[3] = &unk_1E621A390;
  v21 = v2;
  v22 = v3;
  v12 = v3;
  v13 = v2;
  objc_msgSend(v11, "appendCustomFormatWithName:block:", 0, v20);
  v14 = *(void **)(a1 + 40);
  if (objc_msgSend(*(id *)(a1 + 32), "didChange"))
    v15 = CFSTR("∆");
  else
    v15 = CFSTR("-");
  v16 = (id)objc_msgSend(v14, "appendObject:withName:", v15, 0);
  v19[0] = v9;
  v19[1] = 3221225472;
  v19[2] = __48__BLSAlwaysOnTimelineEntrySpecifier_description__block_invoke_4;
  v19[3] = &unk_1E621A368;
  v17 = *(void **)(a1 + 40);
  v19[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v17, "appendCustomFormatWithName:block:", 0, v19);

}

uint64_t __48__BLSAlwaysOnTimelineEntrySpecifier_description__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "appendFormat:", CFSTR("%.3lf%"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
}

void __48__BLSAlwaysOnTimelineEntrySpecifier_description__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "presentationTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bls_shortLoggingString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendString:", v4);

  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v7, "appendString:", CFSTR("<-"));
    objc_msgSend(*(id *)(a1 + 40), "presentationTime");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bls_shortLoggingString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendString:", v6);

  }
}

uint64_t __48__BLSAlwaysOnTimelineEntrySpecifier_description__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFidelityToTarget:", a2);
}

- (void)appendFidelityToTarget:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = -[BLSAlwaysOnTimelineEntrySpecifier requestedFidelity](self, "requestedFidelity");
  v5 = -[BLSAlwaysOnTimelineEntrySpecifier grantedFidelity](self, "grantedFidelity");
  if (v4 == v5)
  {
    NSStringAbbreviatedFromBLSUpdateFidelity(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appendString:", v6);

  }
  else
  {
    if (v5 == -1)
    {
      NSStringAbbreviatedFromBLSUpdateFidelity(v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "appendString:", v10);

      v9 = CFSTR("(r)");
    }
    else
    {
      NSStringAbbreviatedFromBLSUpdateFidelity(v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "appendString:", v7);

      objc_msgSend(v11, "appendString:", CFSTR("(r:"));
      NSStringAbbreviatedFromBLSUpdateFidelity(v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "appendString:", v8);

      v9 = CFSTR(")");
    }
    objc_msgSend(v11, "appendString:", v9);
  }

}

- (id)debugDescription
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendDouble:withName:decimalPrecision:", CFSTR("percentComplete"), 2, self->_percentComplete);
  v5 = (id)objc_msgSend(v3, "appendBool:withName:", -[BLSAlwaysOnTimelineEntrySpecifier didChange](self, "didChange"), CFSTR("didChange"));
  NSStringFromBLSUpdateFidelity(-[BLSAlwaysOnTimelineEntrySpecifier requestedFidelity](self, "requestedFidelity"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("requestedFidelity"));

  NSStringFromBLSUpdateFidelity(-[BLSAlwaysOnTimelineEntrySpecifier grantedFidelity](self, "grantedFidelity"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendObject:withName:", v8, CFSTR("grantedFidelity"));

  -[BLSAlwaysOnTimelineEntry debugDescription](self->_timelineEntry, "debugDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v3, "appendObject:withName:", v10, CFSTR("entry"));

  -[BLSAlwaysOnTimelineEntry debugDescription](self->_previousTimelineEntry, "debugDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v3, "appendObject:withName:", v12, CFSTR("previousEntry"));

  objc_msgSend(v3, "build");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BLSAlwaysOnTimelineEntry *timelineEntry;
  void *v6;
  double percentComplete;
  double v8;
  BOOL v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    timelineEntry = self->_timelineEntry;
    objc_msgSend(v4, "timelineEntry");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[BLSAlwaysOnTimelineEntry isEqual:](timelineEntry, "isEqual:", v6))
    {
      percentComplete = self->_percentComplete;
      objc_msgSend(v4, "percentComplete");
      v9 = percentComplete == v8;
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[BLSAlwaysOnTimelineEntry hash](self->_timelineEntry, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_percentComplete);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[BLSAlwaysOnTimelineEntrySpecifier initWithTimelineEntry:percentComplete:previousTimelineEntry:didChange:]([BLSAlwaysOnTimelineEntrySpecifier alloc], "initWithTimelineEntry:percentComplete:previousTimelineEntry:didChange:", self->_timelineEntry, self->_previousTimelineEntry, -[BLSAlwaysOnTimelineEntrySpecifier didChange](self, "didChange"), self->_percentComplete);
}

- (BLSAlwaysOnTimelineEntry)timelineEntry
{
  return (BLSAlwaysOnTimelineEntry *)objc_getProperty(self, a2, 24, 1);
}

- (int64_t)grantedFidelity
{
  return self->_grantedFidelity;
}

- (void)setGrantedFidelity:(int64_t)a3
{
  self->_grantedFidelity = a3;
}

- (double)percentComplete
{
  return self->_percentComplete;
}

- (BLSAlwaysOnTimelineEntry)previousTimelineEntry
{
  return (BLSAlwaysOnTimelineEntry *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)didChange
{
  return self->_didChange;
}

- (void)setDidChange:(BOOL)a3
{
  self->_didChange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousTimelineEntry, 0);
  objc_storeStrong((id *)&self->_timelineEntry, 0);
}

@end
