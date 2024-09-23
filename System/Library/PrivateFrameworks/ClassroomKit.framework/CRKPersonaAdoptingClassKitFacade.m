@implementation CRKPersonaAdoptingClassKitFacade

- (CRKPersonaAdoptingClassKitFacade)initWithClassKitFacade:(id)a3 personaBlockPerformer:(id)a4
{
  id v6;
  id v7;
  CRKPersonaAdoptingClassKitFacade *v8;
  CRKClassKitPersonaAdopter *v9;
  CRKClassKitPersonaAdopter *personaAdopter;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRKPersonaAdoptingClassKitFacade;
  v8 = -[CRKClassKitFacadeDecoratorBase initWithClassKitFacade:](&v12, sel_initWithClassKitFacade_, v6);
  if (v8)
  {
    v9 = -[CRKClassKitPersonaAdopter initWithClassKitFacade:personaBlockPerformer:]([CRKClassKitPersonaAdopter alloc], "initWithClassKitFacade:personaBlockPerformer:", v6, v7);
    personaAdopter = v8->_personaAdopter;
    v8->_personaAdopter = v9;

  }
  return v8;
}

- (void)performBlockWithClassKitPersona:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CRKPersonaAdoptingClassKitFacade personaAdopter](self, "personaAdopter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performBlockWithClassKitPersona:", v4);

}

- (id)currentPersonaUniqueString
{
  void *v2;
  void *v3;

  -[CRKPersonaAdoptingClassKitFacade personaAdopter](self, "personaAdopter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentPersonaUniqueString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)keyPathsForValuesAffectingCurrentPersonaUniqueString
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("personaAdopter.currentPersonaUniqueString"));
}

- (void)registerDataObserver:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __57__CRKPersonaAdoptingClassKitFacade_registerDataObserver___block_invoke;
  v6[3] = &unk_24D9C72D0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[CRKPersonaAdoptingClassKitFacade performBlockWithClassKitPersona:](self, "performBlockWithClassKitPersona:", v6);

}

void __57__CRKPersonaAdoptingClassKitFacade_registerDataObserver___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "underlyingClassKitFacade");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerDataObserver:", *(_QWORD *)(a1 + 40));

}

- (void)deregisterDataObserver:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __59__CRKPersonaAdoptingClassKitFacade_deregisterDataObserver___block_invoke;
  v6[3] = &unk_24D9C72D0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[CRKPersonaAdoptingClassKitFacade performBlockWithClassKitPersona:](self, "performBlockWithClassKitPersona:", v6);

}

void __59__CRKPersonaAdoptingClassKitFacade_deregisterDataObserver___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "underlyingClassKitFacade");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deregisterDataObserver:", *(_QWORD *)(a1 + 40));

}

- (void)syncServerConfigWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __67__CRKPersonaAdoptingClassKitFacade_syncServerConfigWithCompletion___block_invoke;
  v6[3] = &unk_24D9C6F90;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[CRKPersonaAdoptingClassKitFacade performBlockWithClassKitPersona:](self, "performBlockWithClassKitPersona:", v6);

}

void __67__CRKPersonaAdoptingClassKitFacade_syncServerConfigWithCompletion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "underlyingClassKitFacade");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "syncServerConfigWithCompletion:", *(_QWORD *)(a1 + 40));

}

- (void)currentUserWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CRKClassKitFacadeDecoratorBase underlyingClassKitFacade](self, "underlyingClassKitFacade");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentUserWithCompletion:", v4);

}

- (void)enrolledClassesWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __66__CRKPersonaAdoptingClassKitFacade_enrolledClassesWithCompletion___block_invoke;
  v6[3] = &unk_24D9C6F90;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[CRKPersonaAdoptingClassKitFacade performBlockWithClassKitPersona:](self, "performBlockWithClassKitPersona:", v6);

}

void __66__CRKPersonaAdoptingClassKitFacade_enrolledClassesWithCompletion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "underlyingClassKitFacade");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enrolledClassesWithCompletion:", *(_QWORD *)(a1 + 40));

}

- (void)instructedClassesWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __68__CRKPersonaAdoptingClassKitFacade_instructedClassesWithCompletion___block_invoke;
  v6[3] = &unk_24D9C6F90;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[CRKPersonaAdoptingClassKitFacade performBlockWithClassKitPersona:](self, "performBlockWithClassKitPersona:", v6);

}

void __68__CRKPersonaAdoptingClassKitFacade_instructedClassesWithCompletion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "underlyingClassKitFacade");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "instructedClassesWithCompletion:", *(_QWORD *)(a1 + 40));

}

- (void)instructorsInClassWithObjectID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __78__CRKPersonaAdoptingClassKitFacade_instructorsInClassWithObjectID_completion___block_invoke;
  v10[3] = &unk_24D9C7938;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[CRKPersonaAdoptingClassKitFacade performBlockWithClassKitPersona:](self, "performBlockWithClassKitPersona:", v10);

}

void __78__CRKPersonaAdoptingClassKitFacade_instructorsInClassWithObjectID_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "underlyingClassKitFacade");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "instructorsInClassWithObjectID:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)studentsInClassWithObjectID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __75__CRKPersonaAdoptingClassKitFacade_studentsInClassWithObjectID_completion___block_invoke;
  v10[3] = &unk_24D9C7938;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[CRKPersonaAdoptingClassKitFacade performBlockWithClassKitPersona:](self, "performBlockWithClassKitPersona:", v10);

}

void __75__CRKPersonaAdoptingClassKitFacade_studentsInClassWithObjectID_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "underlyingClassKitFacade");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "studentsInClassWithObjectID:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)saveClass:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __57__CRKPersonaAdoptingClassKitFacade_saveClass_completion___block_invoke;
  v10[3] = &unk_24D9C7938;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[CRKPersonaAdoptingClassKitFacade performBlockWithClassKitPersona:](self, "performBlockWithClassKitPersona:", v10);

}

void __57__CRKPersonaAdoptingClassKitFacade_saveClass_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "underlyingClassKitFacade");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "saveClass:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)locationsWithManagePermissionsForUserWithObjectID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __97__CRKPersonaAdoptingClassKitFacade_locationsWithManagePermissionsForUserWithObjectID_completion___block_invoke;
  v10[3] = &unk_24D9C7938;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[CRKPersonaAdoptingClassKitFacade performBlockWithClassKitPersona:](self, "performBlockWithClassKitPersona:", v10);

}

void __97__CRKPersonaAdoptingClassKitFacade_locationsWithManagePermissionsForUserWithObjectID_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "underlyingClassKitFacade");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "locationsWithManagePermissionsForUserWithObjectID:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)locationsWithObjectIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __70__CRKPersonaAdoptingClassKitFacade_locationsWithObjectIDs_completion___block_invoke;
  v10[3] = &unk_24D9C7938;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[CRKPersonaAdoptingClassKitFacade performBlockWithClassKitPersona:](self, "performBlockWithClassKitPersona:", v10);

}

void __70__CRKPersonaAdoptingClassKitFacade_locationsWithObjectIDs_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "underlyingClassKitFacade");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "locationsWithObjectIDs:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)removeClass:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __59__CRKPersonaAdoptingClassKitFacade_removeClass_completion___block_invoke;
  v10[3] = &unk_24D9C7938;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[CRKPersonaAdoptingClassKitFacade performBlockWithClassKitPersona:](self, "performBlockWithClassKitPersona:", v10);

}

void __59__CRKPersonaAdoptingClassKitFacade_removeClass_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "underlyingClassKitFacade");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeClass:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)executeQuery:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__CRKPersonaAdoptingClassKitFacade_executeQuery___block_invoke;
  v6[3] = &unk_24D9C72D0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[CRKPersonaAdoptingClassKitFacade performBlockWithClassKitPersona:](self, "performBlockWithClassKitPersona:", v6);

}

void __49__CRKPersonaAdoptingClassKitFacade_executeQuery___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "underlyingClassKitFacade");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery:", *(_QWORD *)(a1 + 40));

}

- (CRKClassKitPersonaAdopter)personaAdopter
{
  return self->_personaAdopter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaAdopter, 0);
}

@end
