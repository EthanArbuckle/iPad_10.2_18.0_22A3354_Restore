@implementation BLSHInactiveProcessMinutesBudget

- (BLSHInactiveProcessMinutesBudget)initWithIdentifier:(id)a3 osInterfaceProvider:(id)a4
{
  id v6;
  id v7;
  BLSHInactiveProcessMinutesBudget *v8;
  BLSHInactiveProcessMinutesBudget *v9;
  uint64_t v10;
  NSMutableArray *lock_buckets;
  uint64_t v12;
  NSString *identifier;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)BLSHInactiveProcessMinutesBudget;
  v8 = -[BLSHInactiveProcessMinutesBudget init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_osInterfaceProvider, a4);
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v10 = objc_claimAutoreleasedReturnValue();
    lock_buckets = v9->_lock_buckets;
    v9->_lock_buckets = (NSMutableArray *)v10;

    v12 = objc_msgSend(v6, "copy");
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v12;

  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[BSTimerScheduleQuerying invalidate](self->_lock_invalidationTimer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)BLSHInactiveProcessMinutesBudget;
  -[BLSHInactiveProcessMinutesBudget dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  os_unfair_lock_s *p_lock;
  void *v4;
  id v5;
  id v6;
  void *v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v4, "appendArraySection:withName:multilinePrefix:skipIfEmpty:", self->_lock_buckets, CFSTR("buckets"), CFSTR("    "), 1);
  if (-[BSTimerScheduleQuerying isScheduled](self->_lock_invalidationTimer, "isScheduled"))
  {
    -[BSTimerScheduleQuerying timeRemaining](self->_lock_invalidationTimer, "timeRemaining");
    v6 = (id)objc_msgSend(v4, "appendTimeInterval:withName:decomposeUnits:", CFSTR("pendingInvalidation"), 1);
  }
  objc_msgSend(v4, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);

  return (NSString *)v7;
}

- (NSString)debugDescription
{
  os_unfair_lock_s *p_lock;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v4, "appendArraySection:withName:multilinePrefix:skipIfEmpty:objectTransformer:", self->_lock_buckets, CFSTR("buckets"), CFSTR("    "), 1, &__block_literal_global_27);
  if (-[BSTimerScheduleQuerying isScheduled](self->_lock_invalidationTimer, "isScheduled"))
  {
    -[BSTimerScheduleQuerying timeRemaining](self->_lock_invalidationTimer, "timeRemaining");
    v6 = (id)objc_msgSend(v4, "appendTimeInterval:withName:decomposeUnits:", CFSTR("pendingInvalidation"), 1);
  }
  if (self->_lock_lastInvalidationTimestamp)
  {
    BLSLoggingStringForMachTime();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:withName:skipIfEmpty:", v7, CFSTR("lastInvalidation"), 0);

  }
  objc_msgSend(v4, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);

  return (NSString *)v8;
}

uint64_t __52__BLSHInactiveProcessMinutesBudget_debugDescription__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "debugDescription");
}

- (int64_t)allowedFidelityAtDate:(id)a3 expectedFidelity:(int64_t)a4
{
  id v7;
  void *v8;
  int64_t v9;
  int64_t result;
  void *v11;

  v7 = a3;
  if (a4 == 1)
  {
    v8 = v7;
    if (-[BLSHInactiveProcessMinutesBudget hasSecondsBudgetAtDate:](self, "hasSecondsBudgetAtDate:", v7))
      v9 = 2;
    else
      v9 = 1;

    return v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("expectedFidelity == BLSUpdateFidelityMinutes"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BLSHInactiveProcessMinutesBudget allowedFidelityAtDate:expectedFidelity:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    result = _bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (BOOL)chargeSpecifier:(void *)a3 withChargeBlock:(void *)a4 fitInBucketBlock:(void *)a5 exceededBudgetBlock:(void *)a6 missedBucketBlock:
{
  id v11;
  void (**v12)(id, _QWORD);
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v26;
  NSObject *v27;
  id v28;
  id v29;
  objc_class *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  _BOOL4 v34;
  id v35;
  void (**v36)(id, _QWORD, double);
  void (**v37)(id, _QWORD);
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  id v43;
  uint64_t *v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t *v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  double *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  uint8_t buf[4];
  id v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  uint64_t v76;
  __int16 v77;
  const __CFString *v78;
  __int16 v79;
  int v80;
  __int16 v81;
  void *v82;
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  v35 = a2;
  v11 = a3;
  v37 = a4;
  v12 = a5;
  v36 = a6;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    v67 = 0;
    v68 = &v67;
    v69 = 0x2020000000;
    v70 = 0;
    v61 = 0;
    v62 = &v61;
    v63 = 0x3032000000;
    v64 = __Block_byref_object_copy__9;
    v65 = __Block_byref_object_dispose__9;
    v66 = 0;
    v57 = 0;
    v58 = (double *)&v57;
    v59 = 0x2020000000;
    v60 = 0x7FF8000000000000;
    v53 = 0;
    v54 = &v53;
    v55 = 0x2020000000;
    v56 = 0;
    v49 = 0;
    v50 = &v49;
    v51 = 0x2020000000;
    v52 = 0;
    v13 = *(void **)(a1 + 24);
    v42[0] = MEMORY[0x24BDAC760];
    v42[1] = 3221225472;
    v42[2] = __123__BLSHInactiveProcessMinutesBudget_chargeSpecifier_withChargeBlock_fitInBucketBlock_exceededBudgetBlock_missedBucketBlock___block_invoke;
    v42[3] = &unk_24D1BE230;
    v44 = &v57;
    v43 = v11;
    v45 = &v53;
    v46 = &v49;
    v47 = &v61;
    v48 = &v67;
    objc_msgSend(v13, "enumerateObjectsWithOptions:usingBlock:", 2, v42);
    if (*((_BYTE *)v54 + 24))
    {
      v12[2](v12, v62[5]);
      v34 = 0;
    }
    else
    {
      v14 = v62[5];
      if (*((_BYTE *)v50 + 24))
      {
        v37[2](v37, v14);
        v34 = 1;
      }
      else
      {
        v36[2](v36, v14, v58[3]);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v15 != 0;
        if (v15)
        {
          objc_msgSend(*(id *)(a1 + 24), "insertObject:atIndex:", v15, v68[3]);
          if (os_variant_has_internal_diagnostics())
          {
            bls_budget_log();
            v16 = objc_claimAutoreleasedReturnValue();
            v33 = v15;
            v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);

            if (v17)
            {
              v40 = 0u;
              v41 = 0u;
              v38 = 0u;
              v39 = 0u;
              v18 = *(id *)(a1 + 24);
              v19 = 0;
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v38, v83, 16);
              if (v20)
              {
                v21 = *(_QWORD *)v39;
                do
                {
                  v22 = 0;
                  v23 = v19;
                  do
                  {
                    if (*(_QWORD *)v39 != v21)
                      objc_enumerationMutation(v18);
                    v24 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v22);
                    if (v23 && objc_msgSend(v23, "compare:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v22)) != -1)
                    {
                      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(internal only) unsorted buckets %@"), *(_QWORD *)(a1 + 24));
                      v26 = (void *)objc_claimAutoreleasedReturnValue();
                      v27 = MEMORY[0x24BDACB70];
                      v28 = MEMORY[0x24BDACB70];
                      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                      {
                        NSStringFromSelector(sel_chargeSpecifier_withChargeBlock_fitInBucketBlock_exceededBudgetBlock_missedBucketBlock_);
                        v29 = (id)objc_claimAutoreleasedReturnValue();
                        v30 = (objc_class *)objc_opt_class();
                        NSStringFromClass(v30);
                        v31 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138544642;
                        v72 = v29;
                        v73 = 2114;
                        v74 = v31;
                        v75 = 2048;
                        v76 = a1;
                        v77 = 2114;
                        v78 = CFSTR("BLSHInactiveProcessMinutesBudget.m");
                        v79 = 1024;
                        v80 = 141;
                        v81 = 2114;
                        v82 = v26;
                        _os_log_error_impl(&dword_2145AC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

                      }
                      objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
                      v32 = _bs_set_crash_log_message();
                      -[BLSHInactiveProcessMinutesBudget chargeSpecifier:withChargeBlock:fitInBucketBlock:exceededBudgetBlock:missedBucketBlock:].cold.1(v32);
                    }
                    v19 = v24;

                    ++v22;
                    v23 = v19;
                  }
                  while (v20 != v22);
                  v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v38, v83, 16);
                }
                while (v20);
              }

              v15 = v33;
            }
          }
        }

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));

    _Block_object_dispose(&v49, 8);
    _Block_object_dispose(&v53, 8);
    _Block_object_dispose(&v57, 8);
    _Block_object_dispose(&v61, 8);

    _Block_object_dispose(&v67, 8);
  }
  else
  {
    v34 = 0;
  }

  return v34;
}

void __123__BLSHInactiveProcessMinutesBudget_chargeSpecifier_withChargeBlock_fitInBucketBlock_exceededBudgetBlock_missedBucketBlock___block_invoke(_QWORD *a1, void *a2, uint64_t a3, BOOL *a4)
{
  id v7;
  double v8;
  BOOL v9;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v7 = a2;
  *(double *)(*(_QWORD *)(a1[5] + 8) + 24) = (*(double (**)(_QWORD, id, BOOL))(a1[4] + 16))(a1[4], v7, a3 == 0);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = *(double *)(*(_QWORD *)(a1[5] + 8) + 24) == 0.0;
  v8 = *(double *)(*(_QWORD *)(a1[5] + 8) + 24);
  if (v8 > 0.0 && *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40) && (*(double (**)(void))(a1[4] + 16))() == 0.0)
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
  if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
    v9 = 1;
  else
    v9 = v8 > 0.0 || *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) != 0;
  *a4 = v9;
  if (v8 > 0.0)
  {
    v11 = a3 + 1;
LABEL_17:
    *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24) = v11;
    goto LABEL_18;
  }
  if (!a3)
  {
    v11 = 0;
    goto LABEL_17;
  }
LABEL_18:
  v12 = *(_QWORD *)(a1[8] + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v7;

}

- (id)validateAndChargeFutureSpecifier:(id)a3 nextSpecifier:(id)a4 expectedFidelity:(int64_t)a5
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  double v14;
  double v15;
  void *v16;
  char v17;
  void *v18;
  double v19;
  double v20;
  char v21;
  NSString *v22;
  uint64_t v23;
  id v24;
  NSString *v25;
  id v26;
  void *v27;
  id v28;
  void *v30;
  _QWORD v31[4];
  id v32;
  BLSHInactiveProcessMinutesBudget *v33;
  NSString *v34;
  id v35;
  uint64_t *v36;
  double v37;
  double v38;
  SEL v39;
  char v40;
  _QWORD v41[5];
  NSString *v42;
  id v43;
  id v44;
  double v45;
  _QWORD v46[5];
  NSString *v47;
  id v48;
  _QWORD v49[4];
  id v50;
  char v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;

  v9 = a3;
  v10 = a4;
  if (a5 != 1)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("expectedFidelity == BLSUpdateFidelityMinutes"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BLSHInactiveProcessMinutesBudget validateAndChargeFutureSpecifier:nextSpecifier:expectedFidelity:].cold.2(a2);
LABEL_14:
    objc_msgSend(objc_retainAutorelease(v30), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x214612310);
  }
  v11 = v10;
  v12 = objc_msgSend(v9, "fidelity");
  if ((unint64_t)(v12 - 4) <= 0xFFFFFFFFFFFFFFFALL)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("fidelity out of range:%ld"), v12);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BLSHInactiveProcessMinutesBudget validateAndChargeFutureSpecifier:nextSpecifier:expectedFidelity:].cold.1(a2);
    goto LABEL_14;
  }
  v52 = 0;
  v53 = &v52;
  v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__9;
  v56 = __Block_byref_object_dispose__9;
  v13 = v9;
  v57 = v13;
  objc_msgSend(MEMORY[0x24BE0B8F0], "secondsFidelityThreshold");
  v15 = v14;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(v13, "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[BLSHInactiveProcessMinutesBudget lock_hasSecondsBudgetAtDate:]((uint64_t)self, v16);
  objc_msgSend(v11, "date");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "timeIntervalSinceDate:", v16);
  v20 = v19;

  if (v20 > v15 + v15)
    v21 = 1;
  else
    v21 = v17;
  v22 = self->_identifier;
  os_unfair_lock_unlock(&self->_lock);
  v23 = MEMORY[0x24BDAC760];
  v49[0] = MEMORY[0x24BDAC760];
  v49[1] = 3221225472;
  v49[2] = __100__BLSHInactiveProcessMinutesBudget_validateAndChargeFutureSpecifier_nextSpecifier_expectedFidelity___block_invoke;
  v49[3] = &unk_24D1BE258;
  v50 = v13;
  v51 = v21;
  v46[0] = v23;
  v46[1] = 3221225472;
  v46[2] = __100__BLSHInactiveProcessMinutesBudget_validateAndChargeFutureSpecifier_nextSpecifier_expectedFidelity___block_invoke_2;
  v46[3] = &unk_24D1BE280;
  v46[4] = self;
  v47 = v22;
  v48 = v50;
  v41[0] = v23;
  v41[1] = 3221225472;
  v41[2] = __100__BLSHInactiveProcessMinutesBudget_validateAndChargeFutureSpecifier_nextSpecifier_expectedFidelity___block_invoke_30;
  v41[3] = &unk_24D1BE2C8;
  v41[4] = self;
  v42 = v47;
  v43 = v48;
  v45 = v20;
  v44 = v11;
  v31[0] = v23;
  v31[1] = 3221225472;
  v31[2] = __100__BLSHInactiveProcessMinutesBudget_validateAndChargeFutureSpecifier_nextSpecifier_expectedFidelity___block_invoke_33;
  v31[3] = &unk_24D1BE330;
  v37 = v15;
  v38 = v20;
  v40 = v17;
  v36 = &v52;
  v24 = v43;
  v32 = v24;
  v33 = self;
  v25 = v42;
  v34 = v25;
  v26 = v44;
  v35 = v26;
  v39 = a2;
  if (!-[BLSHInactiveProcessMinutesBudget chargeSpecifier:withChargeBlock:fitInBucketBlock:exceededBudgetBlock:missedBucketBlock:]((uint64_t)self, v24, v49, v46, v41, v31))
  {
    v27 = (void *)v53[5];
    v53[5] = 0;

  }
  v28 = (id)v53[5];

  _Block_object_dispose(&v52, 8);
  return v28;
}

- (uint64_t)lock_hasSecondsBudgetAtDate:(uint64_t)a1
{
  id v3;
  double v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  BOOL v12;
  NSObject *v13;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  _BYTE v30[24];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x24BE0B8F0], "secondsFidelityThreshold");
    v5 = llround(150.0 / v4);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v6 = *(id *)(a1 + 24);
    v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if (objc_msgSend(v11, "validAtDate:", v3, (_QWORD)v21))
          {
            if (objc_msgSend(v11, "isSecondsFidelity"))
            {
              v12 = __OFSUB__(v5--, 1);
              if ((v5 < 0) ^ v12 | (v5 == 0))
              {
                bls_budget_log();
                v13 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
                {
                  v15 = *(_QWORD *)(a1 + 8);
                  objc_msgSend(v3, "bls_shortLoggingString");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(*(id *)(a1 + 24), "bls_boundedDescription");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 134218754;
                  v26 = a1;
                  v27 = 2114;
                  v28 = v15;
                  v29 = 2114;
                  *(_QWORD *)v30 = v16;
                  *(_WORD *)&v30[8] = 2112;
                  *(_QWORD *)&v30[10] = v17;
                  _os_log_debug_impl(&dword_2145AC000, v13, OS_LOG_TYPE_DEBUG, "%p:%{public}@ budget full at date:%{public}@ buckets:%@", buf, 0x2Au);

                }
                a1 = 0;
                goto LABEL_18;
              }
            }
          }
        }
        v8 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
        if (v8)
          continue;
        break;
      }
    }

    bls_budget_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v18 = *(_QWORD *)(a1 + 8);
      objc_msgSend(v3, "bls_shortLoggingString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 24), "bls_boundedDescriptionWithMax:transformer:", 16, &__block_literal_global_73);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219010;
      v26 = a1;
      v27 = 2114;
      v28 = v18;
      v29 = 1024;
      *(_DWORD *)v30 = v5;
      *(_WORD *)&v30[4] = 2114;
      *(_QWORD *)&v30[6] = v19;
      *(_WORD *)&v30[14] = 2112;
      *(_QWORD *)&v30[16] = v20;
      _os_log_debug_impl(&dword_2145AC000, v6, OS_LOG_TYPE_DEBUG, "%p:%{public}@ budget available (%d) at date:%{public}@ buckets:%@", buf, 0x30u);

    }
    a1 = 1;
LABEL_18:

  }
  return a1;
}

uint64_t __100__BLSHInactiveProcessMinutesBudget_validateAndChargeFutureSpecifier_nextSpecifier_expectedFidelity___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "addFutureSpecifier:hasSecondsBudget:allowBeforeStart:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), a3);
}

void __100__BLSHInactiveProcessMinutesBudget_validateAndChargeFutureSpecifier_nextSpecifier_expectedFidelity___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  bls_budget_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __100__BLSHInactiveProcessMinutesBudget_validateAndChargeFutureSpecifier_nextSpecifier_expectedFidelity___block_invoke_2_cold_1();

}

void __100__BLSHInactiveProcessMinutesBudget_validateAndChargeFutureSpecifier_nextSpecifier_expectedFidelity___block_invoke_30(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  bls_budget_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = a1[4];
    v6 = a1[5];
    v8 = a1[7];
    v7 = a1[8];
    v9 = a1[6];
    objc_msgSend(*(id *)(v5 + 24), "bls_boundedDescriptionWithTransformer:", &__block_literal_global_32_0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 134219522;
    v12 = v5;
    v13 = 2114;
    v14 = v6;
    v15 = 2114;
    v16 = v9;
    v17 = 2048;
    v18 = v7;
    v19 = 2114;
    v20 = v8;
    v21 = 2114;
    v22 = v3;
    v23 = 2114;
    v24 = v10;
    _os_log_impl(&dword_2145AC000, v4, OS_LOG_TYPE_INFO, "%p:%{public}@ budget full will skip specifier:%{public}@ %.3lfs after nextSpecifier:%{public}@ bucket:%{public}@ existing:%{public}@", (uint8_t *)&v11, 0x48u);

  }
}

uint64_t __100__BLSHInactiveProcessMinutesBudget_validateAndChargeFutureSpecifier_nextSpecifier_expectedFidelity___block_invoke_2_31(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "shortLoggingString");
}

BLSHInactiveBudgetBucket *__100__BLSHInactiveProcessMinutesBudget_validateAndChargeFutureSpecifier_nextSpecifier_expectedFidelity___block_invoke_33(uint64_t a1, void *a2, double a3)
{
  id v5;
  double v6;
  double v7;
  double v8;
  BOOL v9;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  BLSHInactiveBudgetBucket *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  BLSHInactiveBudgetBucket *v19;
  BLSHInactiveBudgetBucket *v20;
  uint64_t v21;
  BLSHInactiveBudgetBucket *v22;
  BLSHInactiveBudgetBucket *result;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  BLSHInactiveBudgetBucket *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  BLSHInactiveBudgetBucket *v31;
  uint64_t v32;
  double v33;
  NSObject *v34;
  uint32_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  double v47;
  __int16 v48;
  BLSHInactiveBudgetBucket *v49;
  __int16 v50;
  BLSHInactiveBudgetBucket *v51;
  __int16 v52;
  BLSHInactiveBudgetBucket *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = *(double *)(a1 + 72);
  v7 = *(double *)(a1 + 80);
  v8 = -v6;
  if (*(_BYTE *)(a1 + 96))
    v9 = 0;
  else
    v9 = v8 <= a3;
  if (v9 && v6 >= a3 && v7 <= v6)
  {
    bls_budget_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v18 = *(_QWORD *)(a1 + 32);
      v17 = *(_QWORD *)(a1 + 40);
      v19 = *(BLSHInactiveBudgetBucket **)(a1 + 80);
      v21 = *(_QWORD *)(a1 + 48);
      v20 = *(BLSHInactiveBudgetBucket **)(a1 + 56);
      objc_msgSend(*(id *)(v17 + 24), "bls_boundedDescriptionWithTransformer:", &__block_literal_global_46);
      v22 = (BLSHInactiveBudgetBucket *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219522;
      v41 = v17;
      v42 = 2114;
      v43 = v21;
      v44 = 2114;
      v45 = v18;
      v46 = 2048;
      v47 = a3;
      v48 = 2048;
      v49 = v19;
      v50 = 2114;
      v51 = v20;
      v52 = 2114;
      v53 = v22;
      _os_log_impl(&dword_2145AC000, v16, OS_LOG_TYPE_INFO, "%p:%{public}@ will skip - out of budget specifier:%{public}@ %.3lfs after oldBucket %.3lfs before nextSpecifier:%{public}@ existing:%{public}@", buf, 0x48u);

    }
    v15 = 0;
    goto LABEL_19;
  }
  if (!*(_BYTE *)(a1 + 96))
  {
    v12 = objc_msgSend(*(id *)(a1 + 32), "newSpecifierWithMaxFidelity:", 1);
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

  }
  v15 = -[BLSHInactiveBudgetBucket initWithFutureSpecifier:]([BLSHInactiveBudgetBucket alloc], "initWithFutureSpecifier:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  if (*(_BYTE *)(a1 + 96))
  {
    bls_budget_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      __100__BLSHInactiveProcessMinutesBudget_validateAndChargeFutureSpecifier_nextSpecifier_expectedFidelity___block_invoke_33_cold_2(a1, (uint64_t)v15, v16);
    goto LABEL_19;
  }
  if (v6 < a3)
  {
    bls_budget_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v24 = *(_QWORD *)(a1 + 40);
      v25 = *(_QWORD *)(a1 + 48);
      v26 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      objc_msgSend(*(id *)(v24 + 24), "bls_boundedDescriptionWithTransformer:", &__block_literal_global_38);
      v27 = (BLSHInactiveBudgetBucket *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219266;
      v41 = v24;
      v42 = 2114;
      v43 = v25;
      v44 = 2114;
      v45 = v26;
      v46 = 2048;
      v47 = a3;
      v48 = 2114;
      v49 = v15;
      v50 = 2114;
      v51 = v27;
      v28 = "%p:%{public}@ specifier:%{public}@ %.3lfs after oldBucket newBucket:%{public}@ existing:%{public}@";
LABEL_29:
      v34 = v16;
      v35 = 62;
      goto LABEL_30;
    }
    goto LABEL_19;
  }
  if (v7 > v6)
  {
    bls_budget_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v29 = *(_QWORD *)(a1 + 40);
      v30 = *(_QWORD *)(a1 + 48);
      v31 = *(BLSHInactiveBudgetBucket **)(a1 + 56);
      v32 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      v33 = *(double *)(a1 + 80);
      objc_msgSend(*(id *)(v29 + 24), "bls_boundedDescriptionWithTransformer:", &__block_literal_global_40);
      v27 = (BLSHInactiveBudgetBucket *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219522;
      v41 = v29;
      v42 = 2114;
      v43 = v30;
      v44 = 2114;
      v45 = v32;
      v46 = 2048;
      v47 = v33;
      v48 = 2114;
      v49 = v31;
      v50 = 2114;
      v51 = v15;
      v52 = 2114;
      v53 = v27;
      v28 = "%p:%{public}@ specifier:%{public}@ %.3lfs before nextSpecifier:%{public}@ newBucket:%{public}@ existing:%{public}@";
      v34 = v16;
      v35 = 72;
LABEL_30:
      _os_log_debug_impl(&dword_2145AC000, v34, OS_LOG_TYPE_DEBUG, v28, buf, v35);

      goto LABEL_19;
    }
    goto LABEL_19;
  }
  if (v8 > a3)
  {
    bls_budget_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v36 = *(_QWORD *)(a1 + 40);
      v37 = *(_QWORD *)(a1 + 48);
      v38 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      objc_msgSend(*(id *)(v36 + 24), "bls_boundedDescriptionWithTransformer:", &__block_literal_global_42);
      v27 = (BLSHInactiveBudgetBucket *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219266;
      v41 = v36;
      v42 = 2114;
      v43 = v37;
      v44 = 2114;
      v45 = v38;
      v46 = 2048;
      v47 = a3;
      v48 = 2114;
      v49 = v15;
      v50 = 2114;
      v51 = v27;
      v28 = "%p:%{public}@ specifier:%{public}@ %.3lfs before oldBucket newBucket:%{public}@ existing:%{public}@";
      goto LABEL_29;
    }
LABEL_19:

    return v15;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("false"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __100__BLSHInactiveProcessMinutesBudget_validateAndChargeFutureSpecifier_nextSpecifier_expectedFidelity___block_invoke_33_cold_1(a1);
  objc_msgSend(objc_retainAutorelease(v39), "UTF8String");
  result = (BLSHInactiveBudgetBucket *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

uint64_t __100__BLSHInactiveProcessMinutesBudget_validateAndChargeFutureSpecifier_nextSpecifier_expectedFidelity___block_invoke_2_35(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "shortLoggingString");
}

uint64_t __100__BLSHInactiveProcessMinutesBudget_validateAndChargeFutureSpecifier_nextSpecifier_expectedFidelity___block_invoke_37(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "shortLoggingString");
}

uint64_t __100__BLSHInactiveProcessMinutesBudget_validateAndChargeFutureSpecifier_nextSpecifier_expectedFidelity___block_invoke_39(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "shortLoggingString");
}

uint64_t __100__BLSHInactiveProcessMinutesBudget_validateAndChargeFutureSpecifier_nextSpecifier_expectedFidelity___block_invoke_41(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "shortLoggingString");
}

uint64_t __100__BLSHInactiveProcessMinutesBudget_validateAndChargeFutureSpecifier_nextSpecifier_expectedFidelity___block_invoke_45(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "shortLoggingString");
}

- (void)resetFutureSpecifiers
{
  os_unfair_lock_s *p_lock;
  NSMutableArray *lock_buckets;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_buckets = self->_lock_buckets;
  -[NSMutableArray indexesOfObjectsPassingTest:](lock_buckets, "indexesOfObjectsPassingTest:", &__block_literal_global_49);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObjectsAtIndexes:](lock_buckets, "removeObjectsAtIndexes:", v5);

  os_unfair_lock_unlock(p_lock);
}

uint64_t __57__BLSHInactiveProcessMinutesBudget_resetFutureSpecifiers__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  objc_msgSend(v2, "resetFutureSpecifiers");
  if ((objc_msgSend(v2, "hasBeenRendered") & 1) != 0)
    v3 = 0;
  else
    v3 = objc_msgSend(v2, "containsInvalidation") ^ 1;

  return v3;
}

- (void)chargeRenderedSpecifier:(id)a3 expectedFidelity:(int64_t)a4
{
  id v7;
  NSString *v8;
  uint64_t v9;
  NSString *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  BLSHInactiveProcessMinutesBudget *v14;
  NSString *v15;
  SEL v16;
  _QWORD v17[4];
  id v18;
  BLSHInactiveProcessMinutesBudget *v19;
  int64_t v20;
  SEL v21;
  _QWORD v22[5];
  NSString *v23;
  id v24;
  _QWORD v25[4];
  id v26;

  v7 = a3;
  v8 = self->_identifier;
  v9 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __77__BLSHInactiveProcessMinutesBudget_chargeRenderedSpecifier_expectedFidelity___block_invoke;
  v25[3] = &unk_24D1BE398;
  v26 = v7;
  v22[0] = v9;
  v22[1] = 3221225472;
  v22[2] = __77__BLSHInactiveProcessMinutesBudget_chargeRenderedSpecifier_expectedFidelity___block_invoke_2;
  v22[3] = &unk_24D1BE280;
  v22[4] = self;
  v23 = v8;
  v24 = v26;
  v17[0] = v9;
  v17[1] = 3221225472;
  v17[2] = __77__BLSHInactiveProcessMinutesBudget_chargeRenderedSpecifier_expectedFidelity___block_invoke_50;
  v17[3] = &unk_24D1BE3C0;
  v20 = a4;
  v21 = a2;
  v18 = v24;
  v19 = self;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __77__BLSHInactiveProcessMinutesBudget_chargeRenderedSpecifier_expectedFidelity___block_invoke_53;
  v12[3] = &unk_24D1BE408;
  v13 = v18;
  v14 = self;
  v15 = v23;
  v16 = a2;
  v10 = v23;
  v11 = v18;
  -[BLSHInactiveProcessMinutesBudget chargeSpecifier:withChargeBlock:fitInBucketBlock:exceededBudgetBlock:missedBucketBlock:]((uint64_t)self, v11, v25, v22, v17, v12);

}

uint64_t __77__BLSHInactiveProcessMinutesBudget_chargeRenderedSpecifier_expectedFidelity___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "applyRenderedSpecifier:allowBeforeStart:", *(_QWORD *)(a1 + 32), a3);
}

void __77__BLSHInactiveProcessMinutesBudget_chargeRenderedSpecifier_expectedFidelity___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  bls_budget_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __77__BLSHInactiveProcessMinutesBudget_chargeRenderedSpecifier_expectedFidelity___block_invoke_2_cold_1();

}

void __77__BLSHInactiveProcessMinutesBudget_chargeRenderedSpecifier_expectedFidelity___block_invoke_50(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;

  v3 = a2;
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = *(_QWORD *)(a1 + 32);
  NSStringFromBLSUpdateFidelity();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("applyRenderedSpecifier: should never exceed budget:%@ specifier:%@ expectedFidelity:%@"), v3, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138544642;
    v13 = v8;
    v14 = 2114;
    v15 = v10;
    v16 = 2048;
    v17 = v11;
    v18 = 2114;
    v19 = CFSTR("BLSHInactiveProcessMinutesBudget.m");
    v20 = 1024;
    v21 = 251;
    v22 = 2114;
    v23 = v7;
    _os_log_error_impl(&dword_2145AC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

BLSHInactiveBudgetBucket *__77__BLSHInactiveProcessMinutesBudget_chargeRenderedSpecifier_expectedFidelity___block_invoke_53(uint64_t a1, void *a2)
{
  id v3;
  BLSHInactiveBudgetBucket *v4;
  double v5;
  NSObject *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  BLSHInactiveBudgetBucket *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = -[BLSHInactiveBudgetBucket initWithFutureSpecifier:]([BLSHInactiveBudgetBucket alloc], "initWithFutureSpecifier:", *(_QWORD *)(a1 + 32));
  -[BLSHInactiveBudgetBucket applyRenderedSpecifier:allowBeforeStart:](v4, "applyRenderedSpecifier:allowBeforeStart:", *(_QWORD *)(a1 + 32), 0);
  if (v5 != 0.0)
  {
    v12 = v5;
    v13 = (void *)MEMORY[0x24BDD17C8];
    v14 = *(_QWORD *)(a1 + 32);
    -[BLSHInactiveBudgetBucket startDate](v4, "startDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bls_shortLoggingString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "date");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeIntervalSinceReferenceDate");
    v19 = v18;
    -[BLSHInactiveBudgetBucket startDate](v4, "startDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "timeIntervalSinceReferenceDate");
    objc_msgSend(v13, "stringWithFormat:", CFSTR("newly allocated bucket failed to apply rendered specifier bucket:%@ specifier:%@ interval:%lf startDate:%@ (specifier:%a startDate:%a)"), v4, v14, *(_QWORD *)&v12, v16, v19, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __77__BLSHInactiveProcessMinutesBudget_chargeRenderedSpecifier_expectedFidelity___block_invoke_53_cold_1(a1);
    objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x214613238);
  }
  bls_budget_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v9 = *(_QWORD *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(v9 + 24), "bls_boundedDescriptionWithTransformer:", &__block_literal_global_57);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v24 = v9;
    v25 = 2114;
    v26 = v8;
    v27 = 2114;
    v28 = v10;
    v29 = 2114;
    v30 = v4;
    v31 = 2114;
    v32 = v11;
    _os_log_debug_impl(&dword_2145AC000, v6, OS_LOG_TYPE_DEBUG, "%p:%{public}@ rendered specifier:%{public}@ not found, applied to new bucket:%{public}@ existing:%{public}@", buf, 0x34u);

  }
  return v4;
}

uint64_t __77__BLSHInactiveProcessMinutesBudget_chargeRenderedSpecifier_expectedFidelity___block_invoke_56(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "shortLoggingString");
}

- (double)delayTimeToAddInvalidation:(char)a3 hasSecondsBudget:
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  double v9;
  double v10;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  char v24;

  v5 = a2;
  if (a1)
  {
    v6 = *(id *)(a1 + 8);
    v7 = MEMORY[0x24BDAC760];
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __80__BLSHInactiveProcessMinutesBudget_delayTimeToAddInvalidation_hasSecondsBudget___block_invoke;
    v22[3] = &unk_24D1BE258;
    v23 = v5;
    v24 = a3;
    v19[0] = v7;
    v19[1] = 3221225472;
    v19[2] = __80__BLSHInactiveProcessMinutesBudget_delayTimeToAddInvalidation_hasSecondsBudget___block_invoke_2;
    v19[3] = &unk_24D1BE280;
    v19[4] = a1;
    v20 = v6;
    v21 = v23;
    v16[0] = v7;
    v16[1] = 3221225472;
    v16[2] = __80__BLSHInactiveProcessMinutesBudget_delayTimeToAddInvalidation_hasSecondsBudget___block_invoke_58;
    v16[3] = &unk_24D1BE280;
    v16[4] = a1;
    v17 = v20;
    v18 = v21;
    v12[0] = v7;
    v12[1] = 3221225472;
    v12[2] = __80__BLSHInactiveProcessMinutesBudget_delayTimeToAddInvalidation_hasSecondsBudget___block_invoke_61;
    v12[3] = &unk_24D1BE470;
    v13 = v18;
    v14 = a1;
    v8 = v17;
    v15 = v8;
    if (-[BLSHInactiveProcessMinutesBudget chargeSpecifier:withChargeBlock:fitInBucketBlock:exceededBudgetBlock:missedBucketBlock:](a1, v13, v22, v19, v16, v12))
    {
      if (-[BLSHInactiveProcessMinutesBudget intervalSinceLastInvalidation]((os_unfair_lock_s *)a1) >= 0.9)
        v9 = 0.0;
      else
        v9 = 1.0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE0B8F0], "secondsFidelityThreshold");
      v9 = v10;
    }

  }
  else
  {
    v9 = 0.0;
  }

  return v9;
}

uint64_t __80__BLSHInactiveProcessMinutesBudget_delayTimeToAddInvalidation_hasSecondsBudget___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "addInvalidation:hasSecondsBudget:allowBeforeStart:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), a3);
}

void __80__BLSHInactiveProcessMinutesBudget_delayTimeToAddInvalidation_hasSecondsBudget___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  bls_budget_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __80__BLSHInactiveProcessMinutesBudget_delayTimeToAddInvalidation_hasSecondsBudget___block_invoke_2_cold_1();

}

void __80__BLSHInactiveProcessMinutesBudget_delayTimeToAddInvalidation_hasSecondsBudget___block_invoke_58(uint64_t a1)
{
  NSObject *v2;

  bls_budget_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __80__BLSHInactiveProcessMinutesBudget_delayTimeToAddInvalidation_hasSecondsBudget___block_invoke_58_cold_1(a1, v2);

}

uint64_t __80__BLSHInactiveProcessMinutesBudget_delayTimeToAddInvalidation_hasSecondsBudget___block_invoke_2_59(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "shortLoggingString");
}

BLSHInactiveBudgetBucket *__80__BLSHInactiveProcessMinutesBudget_delayTimeToAddInvalidation_hasSecondsBudget___block_invoke_61(_QWORD *a1, void *a2)
{
  id v3;
  BLSHInactiveBudgetBucket *v4;
  NSObject *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = -[BLSHInactiveBudgetBucket initWithInvalidation:]([BLSHInactiveBudgetBucket alloc], "initWithInvalidation:", a1[4]);
  bls_budget_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v8 = a1[5];
    v7 = a1[6];
    v9 = a1[4];
    objc_msgSend(*(id *)(v8 + 24), "bls_boundedDescriptionWithTransformer:", &__block_literal_global_63_0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 134219010;
    v12 = v8;
    v13 = 2114;
    v14 = v7;
    v15 = 2114;
    v16 = v9;
    v17 = 2114;
    v18 = v3;
    v19 = 2114;
    v20 = v10;
    _os_log_debug_impl(&dword_2145AC000, v5, OS_LOG_TYPE_DEBUG, "%p:%{public}@ invalidation:%{public}@ applied to new bucket:%{public}@ existing:%{public}@", (uint8_t *)&v11, 0x34u);

  }
  return v4;
}

uint64_t __80__BLSHInactiveProcessMinutesBudget_delayTimeToAddInvalidation_hasSecondsBudget___block_invoke_2_62(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "shortLoggingString");
}

- (double)intervalSinceLastInvalidation
{
  os_unfair_lock_s *v1;
  double v2;
  double v3;

  if (!a1)
    return 0.0;
  v1 = a1 + 12;
  os_unfair_lock_lock(a1 + 12);
  mach_continuous_time();
  BSTimeDifferenceFromMachTimeToMachTime();
  v3 = v2;
  os_unfair_lock_unlock(v1);
  return v3;
}

- (void)invalidateAtRequestDate:(id)a3 expectedFidelity:(int64_t)a4 invalidationBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  double v11;
  BLSHOSInterfaceProviding *v12;
  uint64_t v13;
  BLSHOSInterfaceProviding *v14;
  id v15;
  void (**v16)(_QWORD);
  int v17;
  NSObject *v18;
  _BOOL4 v19;
  NSString *identifier;
  void *v21;
  double v22;
  NSString *v23;
  BLSHOSInterfaceProviding *osInterfaceProvider;
  BSTimerScheduleQuerying *v25;
  BSTimerScheduleQuerying *lock_invalidationTimer;
  _QWORD v27[4];
  NSObject *v28;
  _QWORD v29[5];
  BLSHOSInterfaceProviding *v30;
  id v31;
  int64_t v32;
  BOOL v33;
  uint8_t buf[4];
  BLSHInactiveProcessMinutesBudget *v35;
  __int16 v36;
  NSString *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  double v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0B818]), "initWithDate:fidelity:", v8, a4);
  v11 = -[BLSHInactiveProcessMinutesBudget delayTimeToAddInvalidation:hasSecondsBudget:]((uint64_t)self, v10, -[BLSHInactiveProcessMinutesBudget hasSecondsBudgetAtDate:](self, "hasSecondsBudgetAtDate:", v8));
  v12 = self->_osInterfaceProvider;
  v13 = MEMORY[0x24BDAC760];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __95__BLSHInactiveProcessMinutesBudget_invalidateAtRequestDate_expectedFidelity_invalidationBlock___block_invoke;
  v29[3] = &unk_24D1BE498;
  v33 = v11 == 0.0;
  v29[4] = self;
  v14 = v12;
  v30 = v14;
  v32 = a4;
  v15 = v9;
  v31 = v15;
  v16 = (void (**)(_QWORD))MEMORY[0x2199D2BD8](v29);
  os_unfair_lock_lock(&self->_lock);
  if (v11 == 0.0)
  {
    os_unfair_lock_unlock(&self->_lock);
    v16[2](v16);
  }
  else
  {
    v17 = -[BSTimerScheduleQuerying isScheduled](self->_lock_invalidationTimer, "isScheduled");
    bls_budget_log();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
    if (v17)
    {
      if (v19)
      {
        identifier = self->_identifier;
        objc_msgSend(v8, "bls_loggingString");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[BSTimerScheduleQuerying timeRemaining](self->_lock_invalidationTimer, "timeRemaining");
        *(_DWORD *)buf = 134218754;
        v35 = self;
        v36 = 2114;
        v37 = identifier;
        v38 = 2114;
        v39 = v21;
        v40 = 2048;
        v41 = v22;
        _os_log_impl(&dword_2145AC000, v18, OS_LOG_TYPE_INFO, "%p:%{public}@ will ignore budgeted invalidation at requesteDate:%{public}@ already have scheduled invalidation in %.3lfs", buf, 0x2Au);

      }
    }
    else
    {
      if (v19)
      {
        v23 = self->_identifier;
        *(_DWORD *)buf = 134218754;
        v35 = self;
        v36 = 2114;
        v37 = v23;
        v38 = 2114;
        v39 = v10;
        v40 = 2048;
        v41 = v11;
        _os_log_impl(&dword_2145AC000, v18, OS_LOG_TYPE_INFO, "%p:%{public}@ will schedule budgeted invalidation specifier:%{public}@ in %.0lfs", buf, 0x2Au);
      }

      -[BSTimerScheduleQuerying invalidate](self->_lock_invalidationTimer, "invalidate");
      osInterfaceProvider = self->_osInterfaceProvider;
      v27[0] = v13;
      v27[1] = 3221225472;
      v27[2] = __95__BLSHInactiveProcessMinutesBudget_invalidateAtRequestDate_expectedFidelity_invalidationBlock___block_invoke_68;
      v27[3] = &unk_24D1BCD20;
      v28 = v16;
      -[BLSHOSInterfaceProviding scheduledTimerWithIdentifier:interval:leewayInterval:handler:](osInterfaceProvider, "scheduledTimerWithIdentifier:interval:leewayInterval:handler:", CFSTR("MinutesInvalidationBudgetExceeded"), v27, v11, v11 * 0.25);
      v25 = (BSTimerScheduleQuerying *)objc_claimAutoreleasedReturnValue();
      lock_invalidationTimer = self->_lock_invalidationTimer;
      self->_lock_invalidationTimer = v25;

      v18 = v28;
    }

    os_unfair_lock_unlock(&self->_lock);
  }

}

uint64_t __95__BLSHInactiveProcessMinutesBudget_invalidateAtRequestDate_expectedFidelity_invalidationBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;

  if (!*(_BYTE *)(a1 + 64))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = objc_alloc(MEMORY[0x24BE0B818]);
    objc_msgSend(*(id *)(a1 + 40), "now");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithDate:fidelity:", v4, *(_QWORD *)(a1 + 56));
    -[BLSHInactiveProcessMinutesBudget delayTimeToAddInvalidation:hasSecondsBudget:](v2, v5, 1);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __95__BLSHInactiveProcessMinutesBudget_invalidateAtRequestDate_expectedFidelity_invalidationBlock___block_invoke_68(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "invalidate");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)performInvalidation
{
  os_unfair_lock_s *p_lock;
  BSTimerScheduleQuerying *lock_invalidationTimer;
  NSMutableArray *lock_buckets;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_lastInvalidationTimestamp = mach_continuous_time();
  -[BSTimerScheduleQuerying invalidate](self->_lock_invalidationTimer, "invalidate");
  lock_invalidationTimer = self->_lock_invalidationTimer;
  self->_lock_invalidationTimer = 0;

  lock_buckets = self->_lock_buckets;
  -[NSMutableArray indexesOfObjectsPassingTest:](lock_buckets, "indexesOfObjectsPassingTest:", &__block_literal_global_70);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObjectsAtIndexes:](lock_buckets, "removeObjectsAtIndexes:", v6);

  os_unfair_lock_unlock(p_lock);
}

uint64_t __55__BLSHInactiveProcessMinutesBudget_performInvalidation__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  int v3;

  v2 = a2;
  objc_msgSend(v2, "resetFutureAndRenderedSpecifiers");
  v3 = objc_msgSend(v2, "containsInvalidation");

  return v3 ^ 1u;
}

- (BOOL)stillTrackingAfterPurgingStaleDataForNowDate:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  NSMutableArray *lock_buckets;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_buckets = self->_lock_buckets;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __81__BLSHInactiveProcessMinutesBudget_stillTrackingAfterPurgingStaleDataForNowDate___block_invoke;
  v10[3] = &unk_24D1BE4E0;
  v11 = v4;
  v7 = v4;
  -[NSMutableArray indexesOfObjectsPassingTest:](lock_buckets, "indexesOfObjectsPassingTest:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObjectsAtIndexes:](lock_buckets, "removeObjectsAtIndexes:", v8);

  LOBYTE(self) = -[NSMutableArray count](self->_lock_buckets, "count") != 0;
  os_unfair_lock_unlock(p_lock);

  return (char)self;
}

uint64_t __81__BLSHInactiveProcessMinutesBudget_stillTrackingAfterPurgingStaleDataForNowDate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "validAtDate:", *(_QWORD *)(a1 + 32)) ^ 1;
}

- (unint64_t)bucketCount
{
  os_unfair_lock_s *p_lock;
  unint64_t v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = -[NSMutableArray count](self->_lock_buckets, "count");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (unint64_t)secondsBucketCount
{
  os_unfair_lock_s *p_lock;
  void *v4;
  unint64_t v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableArray bs_filter:](self->_lock_buckets, "bs_filter:", &__block_literal_global_72_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  os_unfair_lock_unlock(p_lock);
  return v5;
}

uint64_t __54__BLSHInactiveProcessMinutesBudget_secondsBucketCount__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSecondsFidelity");
}

- (NSArray)buckets
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSMutableArray copy](self->_lock_buckets, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (BOOL)hasSecondsBudgetAtDate:(id)a3
{
  BLSHInactiveProcessMinutesBudget *v3;
  os_unfair_lock_s *p_lock;
  id v5;

  v3 = self;
  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  LOBYTE(v3) = -[BLSHInactiveProcessMinutesBudget lock_hasSecondsBudgetAtDate:]((uint64_t)v3, v5);

  os_unfair_lock_unlock(p_lock);
  return (char)v3;
}

uint64_t __64__BLSHInactiveProcessMinutesBudget_lock_hasSecondsBudgetAtDate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "shortLoggingString");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_invalidationTimer, 0);
  objc_storeStrong((id *)&self->_lock_buckets, 0);
  objc_storeStrong((id *)&self->_osInterfaceProvider, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)allowedFidelityAtDate:(const char *)a1 expectedFidelity:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_2145AC000, MEMORY[0x24BDACB70], v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)validateAndChargeFutureSpecifier:(const char *)a1 nextSpecifier:expectedFidelity:.cold.1(const char *a1)
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
  v2 = (objc_class *)OUTLINED_FUNCTION_13();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_2145AC000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)validateAndChargeFutureSpecifier:(const char *)a1 nextSpecifier:expectedFidelity:.cold.2(const char *a1)
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
  v2 = (objc_class *)OUTLINED_FUNCTION_13();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_2145AC000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

void __100__BLSHInactiveProcessMinutesBudget_validateAndChargeFutureSpecifier_nextSpecifier_expectedFidelity___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_3_3(&dword_2145AC000, v0, v1, "%p:%{public}@ specifier:%{public}@ fits in bucket:%{public}@");
  OUTLINED_FUNCTION_11_1();
}

void __100__BLSHInactiveProcessMinutesBudget_validateAndChargeFutureSpecifier_nextSpecifier_expectedFidelity___block_invoke_33_cold_1(uint64_t a1)
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

  NSStringFromSelector(*(SEL *)(a1 + 88));
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_12_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_1_0(&dword_2145AC000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

void __100__BLSHInactiveProcessMinutesBudget_validateAndChargeFutureSpecifier_nextSpecifier_expectedFidelity___block_invoke_33_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(v5 + 24), "bls_boundedDescriptionWithTransformer:", &__block_literal_global_36);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 134219010;
  v11 = v5;
  OUTLINED_FUNCTION_10_4();
  v12 = v6;
  v13 = v8;
  v14 = a2;
  v15 = v8;
  v16 = v9;
  _os_log_debug_impl(&dword_2145AC000, a3, OS_LOG_TYPE_DEBUG, "%p:%{public}@ have budget for specifier:%{public}@ created new newBucket:%{public}@ existing:%{public}@", (uint8_t *)&v10, 0x34u);

  OUTLINED_FUNCTION_15_0();
}

void __77__BLSHInactiveProcessMinutesBudget_chargeRenderedSpecifier_expectedFidelity___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_3_3(&dword_2145AC000, v0, v1, "%p:%{public}@ rendered specifier:%{public}@ applied to bucket:%{public}@");
  OUTLINED_FUNCTION_11_1();
}

void __77__BLSHInactiveProcessMinutesBudget_chargeRenderedSpecifier_expectedFidelity___block_invoke_53_cold_1(uint64_t a1)
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

  NSStringFromSelector(*(SEL *)(a1 + 56));
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_12_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_1_0(&dword_2145AC000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

void __80__BLSHInactiveProcessMinutesBudget_delayTimeToAddInvalidation_hasSecondsBudget___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_3_3(&dword_2145AC000, v0, v1, "%p:%{public}@ invalidation:%{public}@ applied to bucket:%{public}@");
  OUTLINED_FUNCTION_11_1();
}

void __80__BLSHInactiveProcessMinutesBudget_delayTimeToAddInvalidation_hasSecondsBudget___block_invoke_58_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  __int16 v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(v3 + 24), "bls_boundedDescriptionWithTransformer:", &__block_literal_global_60_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 134218754;
  v9 = v3;
  OUTLINED_FUNCTION_10_4();
  v10 = v4;
  v11 = v6;
  v12 = v7;
  _os_log_debug_impl(&dword_2145AC000, a2, OS_LOG_TYPE_DEBUG, "%p:%{public}@ invalidation:%{public}@ exceeded budget existing:%{public}@", (uint8_t *)&v8, 0x2Au);

  OUTLINED_FUNCTION_15_0();
}

@end
