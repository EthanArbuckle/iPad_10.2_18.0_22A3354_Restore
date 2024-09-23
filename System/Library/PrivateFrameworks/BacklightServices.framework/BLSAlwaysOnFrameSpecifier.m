@implementation BLSAlwaysOnFrameSpecifier

- (BLSAlwaysOnFrameSpecifier)initWithTimelineEntrySpecifiers:(id)a3 presentationInterval:(id)a4
{
  id v6;
  id v7;
  BLSAlwaysOnFrameSpecifier *v8;
  BLSAlwaysOnFrameSpecifier *v9;
  uint64_t v10;
  NSArray *entrySpecifiers;
  uint64_t v12;
  NSDateInterval *presentationInterval;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)BLSAlwaysOnFrameSpecifier;
  v8 = -[BLSAlwaysOnFrameSpecifier init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    v10 = objc_msgSend(v6, "copy");
    entrySpecifiers = v9->_entrySpecifiers;
    v9->_entrySpecifiers = (NSArray *)v10;

    v12 = objc_msgSend(v7, "copy");
    presentationInterval = v9->_presentationInterval;
    v9->_presentationInterval = (NSDateInterval *)v12;

    v9->_grantedFidelity = -1;
  }

  return v9;
}

- (id)entrySpecifierForTimelineIdentifier:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = self->_entrySpecifiers;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__BLSAlwaysOnFrameSpecifier_entrySpecifierForTimelineIdentifier___block_invoke;
  v10[3] = &unk_1E621A3E0;
  v6 = v4;
  v11 = v6;
  v7 = -[NSArray indexOfObjectPassingTest:](v5, "indexOfObjectPassingTest:", v10);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    -[NSArray objectAtIndex:](v5, "objectAtIndex:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

uint64_t __65__BLSAlwaysOnFrameSpecifier_entrySpecifierForTimelineIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "timelineEntry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timelineIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32));

  if ((_DWORD)v8)
    *a4 = 1;
  return v8;
}

- (int64_t)compare:(id)a3
{
  NSDateInterval *presentationInterval;
  void *v4;
  int64_t v5;

  presentationInterval = self->_presentationInterval;
  objc_msgSend(a3, "presentationInterval");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NSDateInterval compare:](presentationInterval, "compare:", v4);

  return v5;
}

+ (id)loggingStringForPresentationInterval:(id)a3
{
  return (id)objc_msgSend(a3, "bls_loggingString");
}

+ (id)shortLoggingStringForPresentationInterval:(id)a3
{
  return (id)objc_msgSend(a3, "bls_shortLoggingString");
}

- (int64_t)requestedFidelity
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = self->_entrySpecifiers;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "requestedFidelity", (_QWORD)v10);
        if (v8 > v5)
          v5 = v8;
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int64_t)grantedFidelity
{
  os_unfair_lock_s *p_lock;
  int64_t grantedFidelity;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  grantedFidelity = self->_grantedFidelity;
  os_unfair_lock_unlock(p_lock);
  return grantedFidelity;
}

- (void)setGrantedFidelity:(int64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_grantedFidelity = a3;
  os_unfair_lock_unlock(p_lock);
  -[BLSAlwaysOnFrameSpecifier constrainEntriesToUpdateFidelity:]((uint64_t)self, a3);
}

- (void)constrainEntriesToUpdateFidelity:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v3 = *(id *)(a1 + 24);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          v9 = objc_msgSend(v8, "requestedFidelity", (_QWORD)v11);
          if (v9 >= a2)
            v10 = a2;
          else
            v10 = v9;
          objc_msgSend(v8, "setGrantedFidelity:", v10);
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v5);
    }

  }
}

- (id)correctedSpecifierWithNextSpecifier:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSArray *v17;
  id v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  int64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  BLSAlwaysOnFrameSpecifier *v29;
  BLSAlwaysOnFrameSpecifier *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  BLSAlwaysOnFrameSpecifier *v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v36 = self;
  v5 = self->_entrySpecifiers;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v39;
    do
    {
      v9 = 0;
      v37 = v7;
      do
      {
        if (*(_QWORD *)v39 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v9);
        if (objc_msgSend(v10, "requestedFidelity", v36) == -1)
        {
          objc_msgSend(v10, "timelineEntry");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "timelineIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "entrySpecifierForTimelineIdentifier:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "timelineEntry");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v11, "isEqual:", v14) & 1) != 0)
          {
            v15 = objc_msgSend(v13, "requestedFidelity");
          }
          else
          {
            objc_msgSend(v14, "presentationTime");
            v16 = v8;
            v17 = v5;
            v18 = v4;
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "presentationTime");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "timeIntervalSinceDate:", v20);
            v22 = v21;

            v4 = v18;
            v5 = v17;
            v8 = v16;
            v7 = v37;
            v23 = +[BLSFidelityThreshold fidelityForUpdateInterval:](BLSFidelityThreshold, "fidelityForUpdateInterval:", v22);
            if (v23 == 3)
              v15 = 2;
            else
              v15 = v23;
          }
          objc_msgSend(v10, "setRequestedFidelity:", v15);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v7);
  }

  -[BLSAlwaysOnFrameSpecifier presentationInterval](v36, "presentationInterval");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentationInterval");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "startDate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "endDate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "isEqualToDate:", v26);

  if ((v28 & 1) != 0)
  {
    v29 = 0;
  }
  else
  {
    v30 = [BLSAlwaysOnFrameSpecifier alloc];
    -[BLSAlwaysOnFrameSpecifier entrySpecifiers](v36, "entrySpecifiers");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(v24, "startDate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(v32, "initWithStartDate:endDate:", v33, v26);
    v29 = -[BLSAlwaysOnFrameSpecifier initWithTimelineEntrySpecifiers:presentationInterval:](v30, "initWithTimelineEntrySpecifiers:presentationInterval:", v31, v34);

  }
  return v29;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  id v5;
  NSArray *entrySpecifiers;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  BLSAlwaysOnFrameSpecifier *v14;

  v3 = (void *)objc_opt_new();
  v4 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __40__BLSAlwaysOnFrameSpecifier_description__block_invoke;
  v12[3] = &unk_1E621A3B8;
  v5 = v3;
  v13 = v5;
  v14 = self;
  objc_msgSend(v5, "appendProem:block:", 0, v12);
  entrySpecifiers = self->_entrySpecifiers;
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __40__BLSAlwaysOnFrameSpecifier_description__block_invoke_2;
  v10[3] = &unk_1E621A408;
  v11 = v5;
  v7 = v5;
  objc_msgSend(v7, "appendCollection:withName:itemBlock:", entrySpecifiers, 0, v10);
  objc_msgSend(v7, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __40__BLSAlwaysOnFrameSpecifier_description__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "bls_shortLoggingString");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v1, "appendObject:withName:", v3, 0);

}

void __40__BLSAlwaysOnFrameSpecifier_description__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__BLSAlwaysOnFrameSpecifier_description__block_invoke_3;
  v6[3] = &unk_1E621A368;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "appendCustomFormatWithName:block:", 0, v6);

}

void __40__BLSAlwaysOnFrameSpecifier_description__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  const __CFString *v12;
  id v13;

  v13 = a2;
  objc_msgSend(*(id *)(a1 + 32), "timelineEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentationTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bls_shortLoggingString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "appendString:", v5);

  objc_msgSend(v13, "appendString:", CFSTR(" "));
  if (objc_msgSend(v3, "isAnimated"))
  {
    objc_msgSend(*(id *)(a1 + 32), "percentComplete");
    objc_msgSend(v13, "appendFormat:", CFSTR("%.2lf%% "), v6);
  }
  objc_msgSend(*(id *)(a1 + 32), "appendFidelityToTarget:", v13);
  objc_msgSend(v13, "appendString:", CFSTR(" "));
  objc_msgSend(v3, "timelineIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = CFSTR("0x0");
  if (v7)
    v9 = (__CFString *)v7;
  v10 = v9;

  -[__CFString description](v10, "description");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "appendString:", v11);
  objc_msgSend(v13, "appendString:", CFSTR(" "));
  if (objc_msgSend(*(id *)(a1 + 32), "didChange"))
    v12 = CFSTR("∆");
  else
    v12 = CFSTR("-");
  objc_msgSend(v13, "appendString:", v12);

}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateInterval bls_loggingString](self->_presentationInterval, "bls_loggingString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("presentation interval"));

  NSStringFromBLSUpdateFidelity(-[BLSAlwaysOnFrameSpecifier grantedFidelity](self, "grantedFidelity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", v5, CFSTR("grantedFidelity"));

  NSStringFromBLSUpdateFidelity(-[BLSAlwaysOnFrameSpecifier requestedFidelity](self, "requestedFidelity"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendObject:withName:", v7, CFSTR("requestedFidelity"));

  objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:objectTransformer:", self->_entrySpecifiers, CFSTR("entries"), 1, &__block_literal_global);
  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __45__BLSAlwaysOnFrameSpecifier_debugDescription__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "debugDescription");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSDateInterval *presentationInterval;
  void *v6;
  NSArray *entrySpecifiers;
  void *v8;
  BOOL v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    presentationInterval = self->_presentationInterval;
    objc_msgSend(v4, "presentationInterval");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSDateInterval isEqual:](presentationInterval, "isEqual:", v6))
    {
      entrySpecifiers = self->_entrySpecifiers;
      objc_msgSend(v4, "entrySpecifiers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[NSArray isEqualToArray:](entrySpecifiers, "isEqualToArray:", v8);

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
  uint64_t v3;

  v3 = -[NSDateInterval hash](self->_presentationInterval, "hash");
  return -[NSArray hash](self->_entrySpecifiers, "hash") ^ v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BLSAlwaysOnFrameSpecifier *v4;
  void *v5;
  BLSAlwaysOnFrameSpecifier *v6;

  v4 = [BLSAlwaysOnFrameSpecifier alloc];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", self->_entrySpecifiers, 1);
  v6 = -[BLSAlwaysOnFrameSpecifier initWithTimelineEntrySpecifiers:presentationInterval:](v4, "initWithTimelineEntrySpecifiers:presentationInterval:", v5, self->_presentationInterval);

  return v6;
}

- (NSArray)entrySpecifiers
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSDateInterval)presentationInterval
{
  return (NSDateInterval *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationInterval, 0);
  objc_storeStrong((id *)&self->_entrySpecifiers, 0);
}

@end
