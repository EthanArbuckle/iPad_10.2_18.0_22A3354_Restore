@implementation HFHomeBuilder

+ (Class)homeKitRepresentationClass
{
  return (Class)objc_opt_class();
}

- (HFHomeBuilder)initWithExistingObject:(id)a3 inHome:(id)a4
{
  id v6;
  HFHomeBuilder *v7;
  uint64_t v8;
  NSString *name;
  uint64_t v10;
  NSString *userNotes;
  void *v12;
  int v13;
  HFWallpaperEditCollectionBuilder *v14;
  HFWallpaperEditCollectionBuilder *wallpaperBuilder;
  objc_super v17;

  v6 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HFHomeBuilder;
  v7 = -[HFItemBuilder initWithExistingObject:inHome:](&v17, sel_initWithExistingObject_inHome_, a3, v6);
  if (v7)
  {
    objc_msgSend(v6, "name");
    v8 = objc_claimAutoreleasedReturnValue();
    name = v7->_name;
    v7->_name = (NSString *)v8;

    objc_msgSend(v6, "hf_notesApplicationData");
    v10 = objc_claimAutoreleasedReturnValue();
    userNotes = v7->_userNotes;
    v7->_userNotes = (NSString *)v10;

    if (+[HFExecutionEnvironment isHomeApp](HFExecutionEnvironment, "isHomeApp"))
    {
      +[HFWallpaperManager sharedInstance](HFWallpaperManager, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "wallpaperSourceRegistered");

      if (v13)
      {
        v14 = -[HFWallpaperEditCollectionBuilder initWithHomeKitObject:]([HFWallpaperEditCollectionBuilder alloc], "initWithHomeKitObject:", v6);
        wallpaperBuilder = v7->_wallpaperBuilder;
        v7->_wallpaperBuilder = v14;

      }
    }
  }

  return v7;
}

- (void)setHome:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v4 = a3;
  -[HFItemBuilder home](self, "home");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    v12.receiver = self;
    v12.super_class = (Class)HFHomeBuilder;
    -[HFItemBuilder setHome:](&v12, sel_setHome_, v4);
    v6 = objc_msgSend((id)objc_opt_class(), "homeKitRepresentationClass");
    v7 = v4;
    if (v7)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = v7;
      else
        v8 = 0;
      v9 = v7;
      if (v8)
        goto LABEL_9;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v6, objc_opt_class());

    }
    v9 = 0;
LABEL_9:

    -[HFItemBuilder setHomeKitRepresentation:](self, "setHomeKitRepresentation:", v9);
  }

}

- (id)commitItem
{
  void *v3;
  BOOL v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  BOOL v14;
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];
  BOOL v19;

  -[HFItemBuilder home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  -[HFHomeBuilder performValidation](self, "performValidation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __27__HFHomeBuilder_commitItem__block_invoke;
  v18[3] = &unk_1EA737968;
  v19 = v4;
  v18[4] = self;
  objc_msgSend(v5, "flatMap:", v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v6;
  v17[1] = 3221225472;
  v17[2] = __27__HFHomeBuilder_commitItem__block_invoke_2;
  v17[3] = &unk_1EA726940;
  v17[4] = self;
  objc_msgSend(v7, "flatMap:", v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __27__HFHomeBuilder_commitItem__block_invoke_3;
  v16[3] = &unk_1EA726940;
  v16[4] = self;
  objc_msgSend(v8, "flatMap:", v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __27__HFHomeBuilder_commitItem__block_invoke_4;
  v15[3] = &unk_1EA726940;
  v15[4] = self;
  objc_msgSend(v9, "flatMap:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __27__HFHomeBuilder_commitItem__block_invoke_5;
  v13[3] = &unk_1EA737990;
  v14 = v4;
  v13[4] = self;
  objc_msgSend(v10, "recover:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __27__HFHomeBuilder_commitItem__block_invoke(uint64_t a1)
{
  int v1;
  void *v2;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(void **)(a1 + 32);
  if (v1)
    objc_msgSend(v2, "createHome");
  else
    objc_msgSend(v2, "updateName");
  return (id)objc_claimAutoreleasedReturnValue();
}

id __27__HFHomeBuilder_commitItem__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "wallpaperBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "wallpaperBuilder");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "commitWallpaper");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

uint64_t __27__HFHomeBuilder_commitItem__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateUserNotes");
}

id __27__HFHomeBuilder_commitItem__block_invoke_4(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(*(id *)(a1 + 32), "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "futureWithResult:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __27__HFHomeBuilder_commitItem__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  __CFString **v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0D519C0];
  if (*(_BYTE *)(a1 + 40))
    v5 = HFOperationAddHome;
  else
    v5 = HFOperationEditHome;
  v6 = *v5;
  objc_msgSend(*(id *)(a1 + 32), "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v3, "hf_errorWithOperationType:failedItemName:", v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "futureWithError:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  return v11;
}

- (id)performValidation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D519C0];
  -[HFItemBuilder lazy_verifyPropertyIsSet:](self, "lazy_verifyPropertyIsSet:", CFSTR("name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  -[HFHomeBuilder name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemBuilder lazy_verifyNameIsNotEmpty:](self, "lazy_verifyNameIsNotEmpty:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chainFutures:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)createHome
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  id v15;
  HFHomeBuilder *v16;

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0D519C0];
  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __27__HFHomeBuilder_createHome__block_invoke;
  v14[3] = &unk_1EA72BB28;
  v7 = v4;
  v15 = v7;
  v16 = self;
  objc_msgSend(v5, "futureWithCompletionHandlerAdapterBlock:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __27__HFHomeBuilder_createHome__block_invoke_2;
  v12[3] = &unk_1EA7379E0;
  v12[4] = self;
  v13 = v7;
  v9 = v7;
  objc_msgSend(v8, "flatMap:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __27__HFHomeBuilder_createHome__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "name");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addHomeWithName:completionHandler:", v5, v4);

}

id __27__HFHomeBuilder_createHome__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id v16;

  v3 = a2;
  v4 = (id)objc_msgSend(v3, "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:", 1);
  v5 = (id)objc_msgSend(v3, "hf_setHomeHasMigratedServicesToAccessories:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setHome:", v3);
  objc_msgSend(*(id *)(a1 + 32), "wallpaperBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHkObject:", v3);

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __27__HFHomeBuilder_createHome__block_invoke_3;
  v14 = &unk_1EA7379B8;
  v15 = *(id *)(a1 + 40);
  v16 = v3;
  v8 = v3;
  objc_msgSend(v7, "dispatchHomeManagerObserverMessage:sender:", &v11, 0);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v8, v11, v12, v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __27__HFHomeBuilder_createHome__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "homeManager:didAddHome:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (id)updateName
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  _QWORD v13[5];

  -[HFItemBuilder home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFHomeBuilder name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AAB0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __27__HFHomeBuilder_updateName__block_invoke;
    v13[3] = &unk_1EA7268C8;
    v13[4] = self;
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithErrorOnlyHandlerAdapterBlock:", v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v9, "addFailureBlock:", &__block_literal_global_135);
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __27__HFHomeBuilder_updateName__block_invoke_3;
    v12[3] = &unk_1EA726940;
    v12[4] = self;
    objc_msgSend(v9, "flatMap:", v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

void __27__HFHomeBuilder_updateName__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "home");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateName:completionHandler:", v5, v4);

}

void __27__HFHomeBuilder_updateName__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  +[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logError:operationDescription:", v2, CFSTR("HFHomeBuilder.updateName"));

}

id __27__HFHomeBuilder_updateName__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  v3 = a2;
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __27__HFHomeBuilder_updateName__block_invoke_4;
  v7[3] = &unk_1EA726918;
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "dispatchHomeObserverMessage:sender:", v7, 0);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __27__HFHomeBuilder_updateName__block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "homeDidUpdateName:", v3);

  }
}

- (id)updateUserNotes
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;

  -[HFItemBuilder home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_notesApplicationData");
  v4 = objc_claimAutoreleasedReturnValue();

  -[HFHomeBuilder userNotes](self, "userNotes");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5 | v4
    && (v6 = (void *)v5,
        -[HFHomeBuilder userNotes](self, "userNotes"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isEqualToString:", v4),
        v7,
        v6,
        !v8))
  {
    -[HFItemBuilder home](self, "home");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFHomeBuilder userNotes](self, "userNotes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hf_setNotesApplicationData:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AAB0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)userNotes
{
  return self->_userNotes;
}

- (void)setUserNotes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (HFWallpaperEditCollectionBuilder)wallpaperBuilder
{
  return self->_wallpaperBuilder;
}

- (void)setWallpaperBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_wallpaperBuilder, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperBuilder, 0);
  objc_storeStrong((id *)&self->_userNotes, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
