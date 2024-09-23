@implementation HFCharacteristicWriteActionBuilder

+ (Class)homeKitRepresentationClass
{
  return (Class)objc_opt_class();
}

- (HFCharacteristicWriteActionBuilder)initWithExistingObject:(id)a3 inHome:(id)a4
{
  HFCharacteristicWriteActionBuilder *v4;
  HFCharacteristicWriteActionBuilder *v5;
  void *v6;
  uint64_t v7;
  HMCharacteristic *characteristic;
  void *v9;
  uint64_t v10;
  NSCopying *targetValue;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HFCharacteristicWriteActionBuilder;
  v4 = -[HFItemBuilder initWithExistingObject:inHome:](&v13, sel_initWithExistingObject_inHome_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[HFActionBuilder action](v4, "action");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "characteristic");
    v7 = objc_claimAutoreleasedReturnValue();
    characteristic = v5->_characteristic;
    v5->_characteristic = (HMCharacteristic *)v7;

    -[HFActionBuilder action](v5, "action");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "targetValue");
    v10 = objc_claimAutoreleasedReturnValue();
    targetValue = v5->_targetValue;
    v5->_targetValue = (NSCopying *)v10;

  }
  return v5;
}

- (id)copyForCreatingNewAction
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc((Class)objc_opt_class());
  -[HFItemBuilder home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithHome:", v4);

  -[HFCharacteristicWriteActionBuilder characteristic](self, "characteristic");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCharacteristic:", v6);

  -[HFCharacteristicWriteActionBuilder targetValue](self, "targetValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTargetValue:", v7);

  return v5;
}

- (void)setCharacteristic:(id)a3
{
  HMCharacteristic *v5;
  void *v6;
  HMCharacteristic *characteristic;
  void *v8;
  id v9;

  v5 = (HMCharacteristic *)a3;
  -[HFActionBuilder action](self, "action");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFActionBuilder.m"), 214, CFSTR("Cannot change the characteristic for an existing action!"));

  }
  characteristic = self->_characteristic;
  self->_characteristic = v5;

  -[HFCharacteristicWriteActionBuilder targetValue](self, "targetValue");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[HFCharacteristicWriteActionBuilder _validateAndSetTargetValue:]((id *)&self->super.super.super.isa, v9);

}

- (void)_validateAndSetTargetValue:(id *)a1
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  _BOOL4 v14;
  NSObject *v15;
  _BOOL4 v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  unsigned __int8 isKindOfClass;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  int v30;
  BOOL v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  int v42;
  id v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  double v50;
  uint64_t i;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  id v57;
  id v58;
  _BOOL4 v59;
  NSObject *v60;
  _BOOL4 v61;
  objc_class *v62;
  void *v63;
  void *v64;
  void *v65;
  objc_class *v66;
  void *v67;
  void *v68;
  objc_class *v69;
  objc_class *v70;
  id v71;
  void *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint8_t v77[128];
  uint8_t buf[4];
  void *v79;
  __int16 v80;
  id v81;
  __int16 v82;
  id v83;
  __int16 v84;
  void *v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (a1)
  {
    objc_msgSend(a1, "characteristic");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5
      && (v6 = (void *)v5,
          objc_msgSend(a1, "characteristic"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "hf_shouldValidateActionTargetValues"),
          v7,
          v6,
          (v8 & 1) != 0))
    {
      if (v4)
      {
        objc_msgSend(a1, "characteristic");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "metadata");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10)
        {
          objc_storeStrong(a1 + 4, a2);
          HFLogForCategory(0x28uLL);
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
          {
            v66 = (objc_class *)objc_opt_class();
            NSStringFromClass(v66);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "characteristic");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v79 = v67;
            v80 = 2112;
            v81 = v4;
            v82 = 2112;
            v83 = v68;
            _os_log_fault_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_FAULT, "%{public}@ tried to validate target value %@ but missing metadata on characteristic %@", buf, 0x20u);

          }
          goto LABEL_52;
        }
        if (objc_msgSend(v10, "hf_isValidValue:", v4))
        {
          objc_storeStrong(a1 + 4, a2);
LABEL_52:

          goto LABEL_53;
        }
        v13 = v4;
        v14 = +[HFUtilities hasInternalDiagnostics](HFUtilities, "hasInternalDiagnostics");
        HFLogForCategory(0x28uLL);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
        if (v14)
        {
          if (!v16)
            goto LABEL_17;
          v17 = (objc_class *)objc_opt_class();
          NSStringFromClass(v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "characteristic");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v79 = v18;
          v80 = 2112;
          v81 = v13;
          v82 = 2112;
          v83 = v19;
          v84 = 2112;
          v85 = v20;
          _os_log_error_impl(&dword_1DD34E000, v15, OS_LOG_TYPE_ERROR, "%@ received invalid target value %@ for characteristic %@. Stack: %@", buf, 0x2Au);

        }
        else
        {
          if (!v16)
            goto LABEL_17;
          v69 = (objc_class *)objc_opt_class();
          NSStringFromClass(v69);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v79 = v18;
          _os_log_error_impl(&dword_1DD34E000, v15, OS_LOG_TYPE_ERROR, "%@ received invalid target value for characteristic.", buf, 0xCu);
        }

LABEL_17:
        objc_opt_class();
        v21 = v13;
        isKindOfClass = objc_opt_isKindOfClass();
        if ((isKindOfClass & 1) != 0)
          v23 = v21;
        else
          v23 = 0;
        v24 = v23;

        if (objc_msgSend(v10, "hf_isNumeric"))
        {
          objc_msgSend(v10, "minimumValue");
          v25 = objc_claimAutoreleasedReturnValue();
          if (v25)
          {
            v26 = (void *)v25;
            objc_msgSend(v10, "maximumValue");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = v21;
            v29 = v10;
            v30 = (v27 != 0) & isKindOfClass;

            v31 = v30 == 1;
            v10 = v29;
            v21 = v28;
            if (v31)
            {
              objc_msgSend(v10, "minimumValue");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "doubleValue");
              v34 = v33;

              objc_msgSend(v24, "doubleValue");
              v36 = v35;
              objc_msgSend(v10, "maximumValue");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "doubleValue");
              v39 = v38;

              if (v36 >= v39)
                v40 = v39;
              else
                v40 = v36;
              if (v34 >= v40)
                v40 = v34;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v40);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = objc_msgSend(v10, "hf_isValidValue:", v41);
              -[HFCharacteristicWriteActionBuilder _logInvalidNumericTargetValue:clamped:valid:metadata:](a1, v24, v41, v42, v10);
              if (v42)
              {
                v43 = a1[4];
                a1[4] = v41;
LABEL_57:

                goto LABEL_51;
              }

            }
          }
        }
        objc_msgSend(v10, "validValues");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if (v44 && objc_msgSend(v10, "hf_isNumeric"))
        {

          if (v24)
          {
            v71 = v21;
            v72 = v10;
            v75 = 0u;
            v76 = 0u;
            v73 = 0u;
            v74 = 0u;
            objc_msgSend(v10, "validValues");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v73, v77, 16);
            if (v46)
            {
              v47 = v46;
              v48 = 0;
              v49 = *(_QWORD *)v74;
              v50 = 1.79769313e308;
              do
              {
                for (i = 0; i != v47; ++i)
                {
                  if (*(_QWORD *)v74 != v49)
                    objc_enumerationMutation(v45);
                  v52 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
                  objc_msgSend(v52, "doubleValue");
                  v54 = v53;
                  objc_msgSend(v24, "doubleValue");
                  v56 = vabdd_f64(v54, v55);
                  if (v56 < v50)
                  {
                    v57 = v52;

                    v50 = v56;
                    v48 = v57;
                  }
                }
                v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v73, v77, 16);
              }
              while (v47);
            }
            else
            {
              v48 = 0;
            }

            v10 = v72;
            -[HFCharacteristicWriteActionBuilder _logInvalidNumberTargetValue:foundClosestValidValue:metadata:](a1, v24, v48, v72);
            v21 = v71;
            if (v48)
            {
              v43 = a1[4];
              a1[4] = v48;
              goto LABEL_57;
            }
          }
        }
        else
        {

        }
        v58 = v21;
        v59 = +[HFUtilities hasInternalDiagnostics](HFUtilities, "hasInternalDiagnostics");
        HFLogForCategory(0x28uLL);
        v60 = objc_claimAutoreleasedReturnValue();
        v61 = os_log_type_enabled(v60, OS_LOG_TYPE_FAULT);
        if (v59)
        {
          if (v61)
          {
            v62 = (objc_class *)objc_opt_class();
            NSStringFromClass(v62);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "characteristic");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v79 = v63;
            v80 = 2112;
            v81 = v64;
            v82 = 2112;
            v83 = v58;
            v84 = 2112;
            v85 = v65;
            _os_log_fault_impl(&dword_1DD34E000, v60, OS_LOG_TYPE_FAULT, "%@ for %@: Failed to automatically find a valid value similar to %@. Keeping it. Stack: %@", buf, 0x2Au);

LABEL_61:
          }
        }
        else if (v61)
        {
          v70 = (objc_class *)objc_opt_class();
          NSStringFromClass(v70);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v79 = v63;
          _os_log_fault_impl(&dword_1DD34E000, v60, OS_LOG_TYPE_FAULT, "%@: Failed to automatically find a valid value similar to assigned value. Keeping it", buf, 0xCu);
          goto LABEL_61;
        }

        objc_storeStrong(a1 + 4, a2);
LABEL_51:

        goto LABEL_52;
      }
      v11 = a1[4];
      a1[4] = 0;

    }
    else
    {
      objc_storeStrong(a1 + 4, a2);
    }
  }
LABEL_53:

}

- (void)setTargetValue:(id)a3
{
  NSCopying *v5;
  NSCopying *v6;
  void *v7;
  void *v8;
  NSCopying *v9;

  v5 = (NSCopying *)a3;
  v6 = v5;
  if (self->_targetValue != v5)
  {
    v9 = v5;
    if (!v5)
    {
      -[HFActionBuilder action](self, "action");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFActionBuilder.m"), 222, CFSTR("Cannot set target value to nil for an existing action!"));

      }
    }
    -[HFCharacteristicWriteActionBuilder _validateAndSetTargetValue:]((id *)&self->super.super.super.isa, v9);
    v6 = v9;
  }

}

- (void)_logInvalidNumericTargetValue:(void *)a3 clamped:(int)a4 valid:(void *)a5 metadata:
{
  id v9;
  id v10;
  id v11;
  _BOOL4 v12;
  NSObject *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  objc_class *v21;
  void *v22;
  const char *v23;
  objc_class *v24;
  objc_class *v25;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a5;
  v12 = +[HFUtilities hasInternalDiagnostics](HFUtilities, "hasInternalDiagnostics");
  HFLogForCategory(0x28uLL);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v12)
  {
    v20 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (a4)
    {
      if (!v20)
        goto LABEL_14;
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543362;
      v27 = v22;
      v23 = "%{public}@: Clamping";
    }
    else
    {
      if (!v20)
        goto LABEL_14;
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543362;
      v27 = v22;
      v23 = "%{public}@: Failed clamping";
    }
    _os_log_impl(&dword_1DD34E000, v14, OS_LOG_TYPE_DEFAULT, v23, (uint8_t *)&v26, 0xCu);

    goto LABEL_14;
  }
  if (!a4)
  {
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "characteristic");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "minimumValue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "maximumValue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138544386;
    v27 = v16;
    v28 = 2112;
    v29 = v17;
    v30 = 2112;
    v31 = v18;
    v32 = 2112;
    v33 = v19;
    v34 = 2112;
    v35 = v10;
    _os_log_error_impl(&dword_1DD34E000, v14, OS_LOG_TYPE_ERROR, "%{public}@ for %@: Failed to clamp to (%@, %@) as it produced an invalid value %@", (uint8_t *)&v26, 0x34u);
    goto LABEL_5;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "characteristic");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "minimumValue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "maximumValue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138413314;
    v27 = v16;
    v28 = 2112;
    v29 = v17;
    v30 = 2112;
    v31 = v18;
    v32 = 2112;
    v33 = v19;
    v34 = 2112;
    v35 = v10;
    _os_log_impl(&dword_1DD34E000, v14, OS_LOG_TYPE_DEFAULT, "%@ for %@: Clamping to (%@, %@) resulting in %@", (uint8_t *)&v26, 0x34u);
LABEL_5:

  }
LABEL_14:

}

- (void)_logInvalidNumberTargetValue:(void *)a3 foundClosestValidValue:(void *)a4 metadata:
{
  id v7;
  id v8;
  id v9;
  _BOOL4 v10;
  NSObject *v11;
  _BOOL4 v12;
  objc_class *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = +[HFUtilities hasInternalDiagnostics](HFUtilities, "hasInternalDiagnostics");
  HFLogForCategory(0x28uLL);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "characteristic");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138544130;
      v19 = v14;
      v20 = 2112;
      v21 = v15;
      v22 = 2112;
      v23 = v8;
      v24 = 2112;
      v25 = v7;
      _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ for %@: Found closest valid value %@ for requested target value %@", (uint8_t *)&v18, 0x2Au);

    }
  }
  else if (v12)
  {
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543362;
    v19 = v17;
    _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Found closest valid value for requested target value", (uint8_t *)&v18, 0xCu);

  }
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  -[HFCharacteristicWriteActionBuilder characteristic](self, "characteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "characteristicType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[HFUtilities hasInternalDiagnostics](HFUtilities, "hasInternalDiagnostics"))
  {
    objc_msgSend(MEMORY[0x1E0CBA458], "localizedDescriptionForCharacteristicType:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lowercaseString");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = CFSTR("<redacted>");
  }
  v7 = (void *)MEMORY[0x1E0CB3940];
  -[HFCharacteristicWriteActionBuilder targetValue](self, "targetValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCharacteristicWriteActionBuilder characteristic](self, "characteristic");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "service");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCharacteristicWriteActionBuilder characteristic](self, "characteristic");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "service");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "uniqueIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("<characteristic %@ set to targetValue: %@ in service: '%@' (%@)>"), v6, v8, v11, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (BOOL)canUpdateWithActionBuilder:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "characteristic");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCharacteristicWriteActionBuilder characteristic](self, "characteristic");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      objc_msgSend(v5, "targetValue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8 != 0;

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

- (BOOL)updateWithActionBuilder:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  BOOL v9;
  void *v10;

  v4 = a3;
  if (-[HFCharacteristicWriteActionBuilder canUpdateWithActionBuilder:](self, "canUpdateWithActionBuilder:", v4))
  {
    v5 = v4;
    objc_msgSend(v5, "targetValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCharacteristicWriteActionBuilder targetValue](self, "targetValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v6 == v7;
    v9 = v6 != v7;
    if (!v8)
    {
      objc_msgSend(v5, "targetValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFCharacteristicWriteActionBuilder setTargetValue:](self, "setTargetValue:", v10);

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)requiresDeviceUnlock
{
  void *v2;
  char v3;

  -[HFCharacteristicWriteActionBuilder characteristic](self, "characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "requiresDeviceUnlock");

  return v3;
}

- (id)createNewAction
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  -[HFCharacteristicWriteActionBuilder characteristic](self, "characteristic");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[HFCharacteristicWriteActionBuilder targetValue](self, "targetValue"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    v6 = objc_alloc(MEMORY[0x1E0CBA480]);
    -[HFCharacteristicWriteActionBuilder characteristic](self, "characteristic");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCharacteristicWriteActionBuilder targetValue](self, "targetValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v6, "initWithCharacteristic:targetValue:", v7, v8);
  }
  else
  {
    -[HFCharacteristicWriteActionBuilder characteristic](self, "characteristic");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCharacteristicWriteActionBuilder targetValue](self, "targetValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("HFCharacteristicWriteActionBuilder (%@) asked to build action with missing data: (characteristic: %@, targetValue: %@)"), self, v7, v8);
    v9 = 0;
  }

  return v9;
}

- (BOOL)hasSameTargetAsAction:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    -[HFCharacteristicWriteActionBuilder characteristic](self, "characteristic");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "characteristic");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)containedAccessoryRepresentables
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99D20];
  -[HFCharacteristicWriteActionBuilder characteristic](self, "characteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_arrayWithSafeObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)performValidation
{
  return -[HFItemBuilder lazy_verifyPropertiesAreSet:](self, "lazy_verifyPropertiesAreSet:", &unk_1EA7CDCD8);
}

- (id)validationError
{
  return -[HFItemBuilder verifyPropertiesAreSet:](self, "verifyPropertiesAreSet:", &unk_1EA7CDCF0);
}

- (id)commitItem
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[HFCharacteristicWriteActionBuilder performValidation](self, "performValidation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__HFCharacteristicWriteActionBuilder_commitItem__block_invoke;
  v7[3] = &unk_1EA726940;
  v7[4] = self;
  objc_msgSend(v3, "flatMap:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recover:", &__block_literal_global_79);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __48__HFCharacteristicWriteActionBuilder_commitItem__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[5];

  objc_msgSend(*(id *)(a1 + 32), "action");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __48__HFCharacteristicWriteActionBuilder_commitItem__block_invoke_2;
    v11[3] = &unk_1EA7268C8;
    v11[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithErrorOnlyHandlerAdapterBlock:", v11);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v3;
    v10[1] = 3221225472;
    v10[2] = __48__HFCharacteristicWriteActionBuilder_commitItem__block_invoke_3;
    v10[3] = &unk_1EA726940;
    v10[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v4, "flatMap:", v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "createNewAction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setAction:", v6);

    v7 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(*(id *)(a1 + 32), "action");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "futureWithResult:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

void __48__HFCharacteristicWriteActionBuilder_commitItem__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "action");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "targetValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateTargetValue:completionHandler:", v5, v4);

}

id __48__HFCharacteristicWriteActionBuilder_commitItem__block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(*(id *)(a1 + 32), "action");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "futureWithResult:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __48__HFCharacteristicWriteActionBuilder_commitItem__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(a2, "hf_errorWithOperationType:failedItemName:", CFSTR("HFOperationMediaSelection"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithError:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HMCharacteristic)characteristic
{
  return self->_characteristic;
}

- (NSCopying)targetValue
{
  return self->_targetValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetValue, 0);
  objc_storeStrong((id *)&self->_characteristic, 0);
}

- (id)compareToObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HFCharacteristicWriteActionBuilder;
  -[HFActionBuilder compareToObject:](&v15, sel_compareToObject_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsCriticalDifference") & 1) == 0)
  {
    -[HFCharacteristicWriteActionBuilder characteristic](self, "characteristic");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "characteristic");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFPropertyDifference compareObjectA:toObjectB:key:priority:](HFPropertyDifference, "compareObjectA:toObjectB:key:priority:", v7, v9, CFSTR("characteristic.uniqueIdentifier"), 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "add:", v10);

    -[HFCharacteristicWriteActionBuilder targetValue](self, "targetValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "targetValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFPropertyDifference compareObjectA:toObjectB:key:priority:](HFPropertyDifference, "compareObjectA:toObjectB:key:priority:", v11, v12, CFSTR("targetValue"), 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "add:", v13);

  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  void *v5;
  unint64_t v6;

  v3 = objc_msgSend((id)objc_opt_class(), "hash");
  -[HFCharacteristicWriteActionBuilder characteristic](self, "characteristic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v3;

  return v6;
}

@end
