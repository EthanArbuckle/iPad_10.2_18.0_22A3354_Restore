@implementation AXSB_SBApplicationSafeCategory

- (void)_updateProcess:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  char v21;
  void *v22;
  void *v23;
  int v24;
  objc_super v25;
  char v26;

  v6 = a3;
  v7 = a4;
  v26 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  objc_msgSend(v8, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BDFE078]);

  v26 = 0;
  -[AXSB_SBApplicationSafeCategory safeValueForKey:](self, "safeValueForKey:", CFSTR("_internalProcessState"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "safeIntForKey:", CFSTR("taskState"));
  v15 = objc_msgSend(v13, "safeIntForKey:", CFSTR("visibility"));
  v25.receiver = self;
  v25.super_class = (Class)AXSB_SBApplicationSafeCategory;
  -[AXSB_SBApplicationSafeCategory _updateProcess:withState:](&v25, sel__updateProcess_withState_, v6, v7);
  v26 = 0;
  -[AXSB_SBApplicationSafeCategory safeValueForKey:](self, "safeValueForKey:", CFSTR("_internalProcessState"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
    abort();
  v18 = objc_msgSend(v17, "safeIntForKey:", CFSTR("taskState"));
  v19 = objc_msgSend(v17, "safeIntForKey:", CFSTR("visibility"));
  if (v14 == v18 && v15 == v19)
    v21 = 1;
  else
    v21 = v11;
  if ((v21 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE7CB68], "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "TTYHardwareEnabled"))
    {

LABEL_14:
      objc_msgSend(MEMORY[0x24BE7CB40], "cancelCallPromptDisplay");
      goto LABEL_15;
    }
    objc_msgSend(MEMORY[0x24BE7CB68], "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "TTYSoftwareEnabled");

    if (v24)
      goto LABEL_14;
  }
LABEL_15:

}

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBApplication");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end
