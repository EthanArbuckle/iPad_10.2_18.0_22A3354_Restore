@implementation NSObject(UIAccessibilitySafeCategory_Private)

- (uint64_t)_safeValidatedValueForKey:()UIAccessibilitySafeCategory_Private expectedClass:expectedTypeEncoding:
{
  return objc_msgSend(a1, "_safeValidatedValueForKey:expectedClass:possibleExpectedTypeEncodings:", 0);
}

- (id)_safeValidatedValueForKey:()UIAccessibilitySafeCategory_Private expectedClass:possibleExpectedTypeEncodings:
{
  id v13;
  id v14;
  const char *v15;
  char v16;
  const char **v17;
  void *v18;
  objc_class *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  objc_class *v26;
  void *v27;
  void *v28;
  objc_class *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  void *v37;
  objc_class *v38;
  void *v39;
  id v40;
  void *v41;
  uint64_t i;
  uint64_t *v43;
  id v44;
  void *v45;
  void *v46;
  uint64_t v47;
  int v48;
  objc_class *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  void *v56;
  void *v57;
  const char **v58;
  uint64_t *v59;

  v13 = a3;
  objc_msgSend(a1, "safeValueForKey:", v13);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (AXShouldReportValidationErrors())
      {
        +[AXValidationManager sharedInstance](AXValidationManager, "sharedInstance");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "sendExceptionForSafeValueKey:onTarget:overrideProcessName:", v13, v20, 0);

      }
      v21 = v14;
      objc_opt_class();
      v22 = v21;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v21, "length"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringWithFormat:", CFSTR("<redacted string. len=%@"), v24);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

      }
      if (!AXPerformValidationChecks())
        goto LABEL_17;
      v25 = AXShouldCrashOnValidationErrors();
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromClass(a4);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = __UIAccessibilityHandleValidationErrorWithDescription(v25, 0, CFSTR("Value for key %@ on object <%@: %p> is not an %@; class: %@; value: %@"),
              v30,
              v31,
              v32,
              v33,
              v34,
              (uint64_t)v13);

      if (!v35)
      {
LABEL_17:

LABEL_18:
        v14 = 0;
        goto LABEL_19;
      }
      goto LABEL_34;
    }
    if (a5)
    {
      v14 = objc_retainAutorelease(v14);
      v15 = (const char *)objc_msgSend(v14, "objCType");
      if (strcmp(v15, a5))
      {
        v16 = 0;
        v58 = (const char **)&a9;
        while (1)
        {
          v17 = v58++;
          if (!*v17)
            break;
          if ((v16 & 1) == 0)
            v16 = 1;
          if (!strcmp(v15, *v17))
            goto LABEL_19;
        }
        if (AXShouldReportValidationErrors())
        {
          +[AXValidationManager sharedInstance](AXValidationManager, "sharedInstance");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = (objc_class *)objc_opt_class();
          NSStringFromClass(v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "sendExceptionForSafeValueKey:onTarget:overrideProcessName:", v13, v39, 0);

        }
        if (!AXPerformValidationChecks())
          goto LABEL_33;
        if ((v16 & 1) != 0)
        {
          v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%s"), a5);
          v59 = &a10;
          for (i = a9; i; i = *v43)
          {
            objc_msgSend(v41, "appendFormat:", CFSTR("\", \"%s"), i);
            v43 = v59++;
          }
          v40 = objc_retainAutorelease(v41);
          objc_msgSend(v40, "UTF8String");
        }
        else
        {
          v40 = 0;
        }
        v44 = v14;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v45 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v44, "length"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "stringWithFormat:", CFSTR("<redacted string. len=%@"), v46);
          v47 = objc_claimAutoreleasedReturnValue();

          v44 = (id)v47;
        }
        if (!AXPerformValidationChecks()
          || (v48 = AXShouldCrashOnValidationErrors(),
              v49 = (objc_class *)objc_opt_class(),
              NSStringFromClass(v49),
              v56 = (void *)objc_claimAutoreleasedReturnValue(),
              v55 = __UIAccessibilityHandleValidationErrorWithDescription(v48, 0, CFSTR("Value for key %@ on object <%@: %p> doesn't encapsulate the right type; value: %@; actual type encoding: \"%s\"; %s: \"%s\"."),
                      v50,
                      v51,
                      v52,
                      v53,
                      v54,
                      (uint64_t)v13),
              v56,
              !v55))
        {

LABEL_33:
          goto LABEL_18;
        }
LABEL_34:
        abort();
      }
    }
  }
LABEL_19:

  return v14;
}

@end
