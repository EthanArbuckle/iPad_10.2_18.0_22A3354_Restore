@implementation HFNaturalLightingActionBuilder

+ (Class)homeKitRepresentationClass
{
  return (Class)objc_opt_class();
}

- (HFNaturalLightingActionBuilder)initWithExistingObject:(id)a3 inHome:(id)a4
{
  HFNaturalLightingActionBuilder *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  HMLightProfile *lightProfile;
  char v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HFNaturalLightingActionBuilder;
  v4 = -[HFItemBuilder initWithExistingObject:inHome:](&v13, sel_initWithExistingObject_inHome_, a3, a4);
  if (v4)
  {
    objc_opt_class();
    -[HFActionBuilder action](v4, "action");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    objc_msgSend(v7, "lightProfile");
    v8 = objc_claimAutoreleasedReturnValue();
    lightProfile = v4->_lightProfile;
    v4->_lightProfile = (HMLightProfile *)v8;

    v10 = objc_msgSend(v7, "isNaturalLightingEnabled");
    v4->_naturalLightEnabled = v10;
    if (!v4->_lightProfile)
    {
      -[HFActionBuilder action](v4, "action");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        NSLog(CFSTR("Failed to get lightProfile from HMLightProfileNaturalLightingAction"));
    }
  }
  return v4;
}

- (id)copyForCreatingNewAction
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc((Class)objc_opt_class());
  -[HFItemBuilder home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithHome:", v4);

  -[HFNaturalLightingActionBuilder lightProfile](self, "lightProfile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLightProfile:", v6);

  objc_msgSend(v5, "setNaturalLightEnabled:", -[HFNaturalLightingActionBuilder naturalLightEnabled](self, "naturalLightEnabled"));
  return v5;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[HFNaturalLightingActionBuilder naturalLightEnabled](self, "naturalLightEnabled"), CFSTR("naturalLightEnabled"));
  -[HFNaturalLightingActionBuilder lightProfile](self, "lightProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", v5, CFSTR("lightProfile"));

  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)canUpdateWithActionBuilder:(id)a3
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

  objc_msgSend(v7, "lightProfile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFNaturalLightingActionBuilder lightProfile](self, "lightProfile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  return v10;
}

- (BOOL)updateWithActionBuilder:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  int v8;
  BOOL v9;

  v4 = a3;
  if (-[HFNaturalLightingActionBuilder canUpdateWithActionBuilder:](self, "canUpdateWithActionBuilder:", v4))
  {
    objc_opt_class();
    v5 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    if (!v7
      || (v8 = -[HFNaturalLightingActionBuilder naturalLightEnabled](self, "naturalLightEnabled"),
          v8 == objc_msgSend(v7, "naturalLightEnabled")))
    {
      v9 = 0;
    }
    else
    {
      -[HFNaturalLightingActionBuilder setNaturalLightEnabled:](self, "setNaturalLightEnabled:", objc_msgSend(v7, "naturalLightEnabled"));
      v9 = 1;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)createNewAction
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v8;
  uint8_t v9[16];

  -[HFNaturalLightingActionBuilder lightProfile](self, "lightProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CBA5D0]);
    -[HFNaturalLightingActionBuilder lightProfile](self, "lightProfile");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithLightProfile:naturalLightingEnabled:", v5, -[HFNaturalLightingActionBuilder naturalLightEnabled](self, "naturalLightEnabled"));

    return v6;
  }
  else
  {
    HFLogForCategory(0x28uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "HFNaturalLightingActionBuilder doesn't have a light profile, so returning nil for -createNewAction", v9, 2u);
    }

    return 0;
  }
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
    -[HFNaturalLightingActionBuilder lightProfile](self, "lightProfile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lightProfile");
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

  -[HFNaturalLightingActionBuilder lightProfile](self, "lightProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "services");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)performValidation
{
  return -[HFItemBuilder lazy_verifyPropertiesAreSet:](self, "lazy_verifyPropertiesAreSet:", &unk_1EA7CDD08);
}

- (id)validationError
{
  return -[HFItemBuilder verifyPropertiesAreSet:](self, "verifyPropertiesAreSet:", &unk_1EA7CDD20);
}

- (id)commitItem
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[HFNaturalLightingActionBuilder performValidation](self, "performValidation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__HFNaturalLightingActionBuilder_commitItem__block_invoke;
  v7[3] = &unk_1EA726940;
  v7[4] = self;
  objc_msgSend(v3, "flatMap:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recover:", &__block_literal_global_307);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __44__HFNaturalLightingActionBuilder_commitItem__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  _QWORD v12[5];

  objc_msgSend(*(id *)(a1 + 32), "action");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __44__HFNaturalLightingActionBuilder_commitItem__block_invoke_2;
    v12[3] = &unk_1EA7268C8;
    v12[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithErrorOnlyHandlerAdapterBlock:", v12);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v3;
    v11[1] = 3221225472;
    v11[2] = __44__HFNaturalLightingActionBuilder_commitItem__block_invoke_3;
    v11[3] = &unk_1EA726940;
    v11[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v4, "flatMap:", v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "createNewAction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setAction:", v6);

    objc_msgSend(*(id *)(a1 + 32), "action");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x1E0D519C0];
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "action");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "futureWithResult:", v9);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", -1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "futureWithError:", v9);
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

void __44__HFNaturalLightingActionBuilder_commitItem__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "action");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateNaturalLightingEnabled:completionHandler:", objc_msgSend(*(id *)(a1 + 32), "naturalLightEnabled"), v4);

}

id __44__HFNaturalLightingActionBuilder_commitItem__block_invoke_3(uint64_t a1)
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

id __44__HFNaturalLightingActionBuilder_commitItem__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(a2, "hf_errorWithOperationType:failedItemName:", CFSTR("HFOperationEditActionSet"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithError:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setLightProfile:(id)a3
{
  HMLightProfile *v5;
  void *v6;
  HMLightProfile *lightProfile;
  void *v8;

  v5 = (HMLightProfile *)a3;
  -[HFActionBuilder action](self, "action");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFActionBuilder.m"), 1022, CFSTR("Cannot change the lightProfile for an existing action!"));

  }
  lightProfile = self->_lightProfile;
  self->_lightProfile = v5;

}

- (HMLightProfile)lightProfile
{
  return self->_lightProfile;
}

- (BOOL)naturalLightEnabled
{
  return self->_naturalLightEnabled;
}

- (void)setNaturalLightEnabled:(BOOL)a3
{
  self->_naturalLightEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lightProfile, 0);
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
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HFNaturalLightingActionBuilder;
  -[HFActionBuilder compareToObject:](&v13, sel_compareToObject_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsCriticalDifference") & 1) == 0)
  {
    -[HFNaturalLightingActionBuilder lightProfile](self, "lightProfile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lightProfile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFPropertyDifference compareObjectA:toObjectB:key:priority:](HFPropertyDifference, "compareObjectA:toObjectB:key:priority:", v6, v7, CFSTR("lightProfile"), 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "add:", v8);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HFNaturalLightingActionBuilder naturalLightEnabled](self, "naturalLightEnabled"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "naturalLightEnabled"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFPropertyDifference compareObjectA:toObjectB:key:priority:](HFPropertyDifference, "compareObjectA:toObjectB:key:priority:", v9, v10, CFSTR("naturalLightEnabled"), 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "add:", v11);

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
  -[HFNaturalLightingActionBuilder lightProfile](self, "lightProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v3;

  return v6;
}

@end
