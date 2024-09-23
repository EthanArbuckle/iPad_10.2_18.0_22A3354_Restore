@implementation CRKConcreteClassKitFacade

- (CRKConcreteClassKitFacade)init
{
  CRKConcreteClassKitFacade *v2;
  uint64_t v3;
  CRKClassKitAccountStateProvider *accountStateProvider;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRKConcreteClassKitFacade;
  v2 = -[CRKConcreteClassKitFacade init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    accountStateProvider = v2->_accountStateProvider;
    v2->_accountStateProvider = (CRKClassKitAccountStateProvider *)v3;

  }
  return v2;
}

+ (id)keyPathsForValuesAffectingAccountState
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("accountStateProvider.accountState"));
}

- (int64_t)accountState
{
  void *v2;
  int64_t v3;

  -[CRKConcreteClassKitFacade accountStateProvider](self, "accountStateProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "accountState");

  return v3;
}

- (BOOL)ownsError:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDB8508]);

  return v4;
}

- (void)registerDataObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CRKConcreteClassKitFacade dataStore](self, "dataStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerDataObserver:", v4);

}

- (void)deregisterDataObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CRKConcreteClassKitFacade dataStore](self, "dataStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deregisterDataObserver:", v4);

}

- (void)syncServerConfigWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CRKConcreteClassKitFacade dataStore](self, "dataStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syncServerConfigWithCompletion:", v4);

}

- (void)instructorsInClassWithObjectID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CRKConcreteClassKitFacade dataStore](self, "dataStore");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "personsInClassWithClassID:role:completion:", v7, 2, v6);

}

- (void)studentsInClassWithObjectID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CRKConcreteClassKitFacade dataStore](self, "dataStore");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "personsInClassWithClassID:role:completion:", v7, 1, v6);

}

- (id)personObserverWithPersonIDs:(id)a3 sortDescriptors:(id)a4
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K IN %@"), a4, *MEMORY[0x24BDB8528], a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKConcreteClassKitFacade makeDataObserverWithObjectType:predicate:sortDescriptors:](self, "makeDataObserverWithObjectType:predicate:sortDescriptors:", objc_opt_class(), v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)addStudent:(id)a3 toClass:(id)a4
{
  -[CRKConcreteClassKitFacade addPerson:withRole:toClass:](self, "addPerson:withRole:toClass:", a3, 1, a4);
}

- (void)removeStudent:(id)a3 fromClass:(id)a4
{
  -[CRKConcreteClassKitFacade removePerson:withRole:fromClass:](self, "removePerson:withRole:fromClass:", a3, 1, a4);
}

- (id)objectIDsOfStudentsInClass:(id)a3
{
  return -[CRKConcreteClassKitFacade objectIDsOfMembersInClass:withRole:](self, "objectIDsOfMembersInClass:withRole:", a3, 1);
}

- (void)addInstructor:(id)a3 toClass:(id)a4
{
  -[CRKConcreteClassKitFacade addPerson:withRole:toClass:](self, "addPerson:withRole:toClass:", a3, 2, a4);
}

- (void)removeInstructor:(id)a3 fromClass:(id)a4
{
  -[CRKConcreteClassKitFacade removePerson:withRole:fromClass:](self, "removePerson:withRole:fromClass:", a3, 2, a4);
}

- (id)objectIDsOfInstructorsInClass:(id)a3
{
  return -[CRKConcreteClassKitFacade objectIDsOfMembersInClass:withRole:](self, "objectIDsOfMembersInClass:withRole:", a3, 2);
}

- (id)classDataObserverWithSortDescriptors:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[CRKConcreteClassKitFacade makeDataObserverWithObjectType:predicate:sortDescriptors:](self, "makeDataObserverWithObjectType:predicate:sortDescriptors:", objc_opt_class(), 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)enrolledClassesWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CRKConcreteClassKitFacade dataStore](self, "dataStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enrolledClassesWithCompletion:", v4);

}

- (void)instructedClassesWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CRKConcreteClassKitFacade dataStore](self, "dataStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "instructedClassesWithCompletion:", v4);

}

- (void)saveClass:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v6;
  else
    v8 = 0;
  v9 = v8;
  if (v9)
  {
    -[CRKConcreteClassKitFacade dataStore](self, "dataStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __50__CRKConcreteClassKitFacade_saveClass_completion___block_invoke;
    v12[3] = &unk_24D9C7108;
    v13 = v7;
    objc_msgSend(v10, "saveClass:completion:", v9, v12);

  }
  else
  {
    CRKErrorWithCodeAndUserInfo(2, &unk_24DA07AA8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v11);

  }
}

uint64_t __50__CRKConcreteClassKitFacade_saveClass_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeClass:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  void (**v14)(_QWORD, _QWORD);

  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD))v7;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v6;
    else
      v9 = 0;
    v10 = v9;
    if (v10)
    {
      -[CRKConcreteClassKitFacade dataStore](self, "dataStore");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __52__CRKConcreteClassKitFacade_removeClass_completion___block_invoke;
      v13[3] = &unk_24D9C7108;
      v14 = v8;
      objc_msgSend(v11, "removeClass:completion:", v10, v13);

    }
    else
    {
      CRKErrorWithCodeAndUserInfo(2, &unk_24DA07AD0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v8)[2](v8, v12);

    }
  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

uint64_t __52__CRKConcreteClassKitFacade_removeClass_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)makeClassWithLocationID:(id)a3 name:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;

  v5 = (objc_class *)MEMORY[0x24BDB8540];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithLocation:customName:", v7, v6);

  return v8;
}

- (id)subscribeToCurrentUserDidChangeEvents:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = *MEMORY[0x24BDB8500];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __67__CRKConcreteClassKitFacade_subscribeToCurrentUserDidChangeEvents___block_invoke;
  v9[3] = &unk_24D9C7130;
  v10 = v3;
  v6 = v3;
  objc_msgSend(v4, "subscribeToNotificationWithName:object:handler:", v5, 0, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __67__CRKConcreteClassKitFacade_subscribeToCurrentUserDidChangeEvents___block_invoke(uint64_t a1)
{
  dispatch_async(MEMORY[0x24BDAC9B8], *(dispatch_block_t *)(a1 + 32));
}

- (id)subscribeToClassMembershipChangeEvents:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = *MEMORY[0x24BDB8530];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *MEMORY[0x24BDB8530]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subscribeToNotificationWithName:handler:", v6, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Could not subscribe to darwin notification %s."), v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[CRKEmptySubscription errorSubscriptionWithReason:](CRKEmptySubscription, "errorSubscriptionWithReason:", v9);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (void)currentUserWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[CRKConcreteClassKitFacade dataStore](self, "dataStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__CRKConcreteClassKitFacade_currentUserWithCompletion___block_invoke;
  v7[3] = &unk_24D9C7158;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "currentUserWithCompletion:", v7);

}

uint64_t __55__CRKConcreteClassKitFacade_currentUserWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)locationsObserverWithSortDescriptors:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[CRKConcreteClassKitFacade makeDataObserverWithObjectType:predicate:sortDescriptors:](self, "makeDataObserverWithObjectType:predicate:sortDescriptors:", objc_opt_class(), 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)locationsWithManagePermissionsForUserWithObjectID:(id)a3 completion:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v6 = (objc_class *)MEMORY[0x24BDB8580];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithOptions:behaviors:", 4, 3);
  NSStringFromCLSASMPrivilegeType();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requirePrivilege:onPersonIDs:", v10, v11);

  objc_msgSend(MEMORY[0x24BDB8570], "queryWithSearchSpecification:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setCompletion:", v7);
  -[CRKConcreteClassKitFacade executeQuery:](self, "executeQuery:", v12);

}

- (void)locationsWithObjectIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    -[CRKConcreteClassKitFacade makePredicateForObjectIDs:](self, "makePredicateForObjectIDs:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend(MEMORY[0x24BDB8570], "queryWithObjectType:predicate:error:", objc_opt_class(), v8, &v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v17;
    if (v9)
    {
      v12 = MEMORY[0x24BDAC760];
      v13 = 3221225472;
      v14 = __63__CRKConcreteClassKitFacade_locationsWithObjectIDs_completion___block_invoke;
      v15 = &unk_24D9C6DC0;
      v16 = v7;
      objc_msgSend(v9, "setCompletion:", &v12);
      -[CRKConcreteClassKitFacade dataStore](self, "dataStore", v12, v13, v14, v15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "executeQuery:", v9);

    }
    else
    {
      (*((void (**)(id, _QWORD, id))v7 + 2))(v7, 0, v10);
    }

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, MEMORY[0x24BDBD1A8], 0);
  }

}

uint64_t __63__CRKConcreteClassKitFacade_locationsWithObjectIDs_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)makeStudentQueryForSearchString:(id)a3 locationIDs:(id)a4 sortingGivenNameFirst:(BOOL)a5 pageSize:(int64_t)a6
{
  return -[CRKConcreteClassKitFacade makeQueryForPersonsWithRole:locationIDs:searchString:sortingGivenNameFirst:pageSize:](self, "makeQueryForPersonsWithRole:locationIDs:searchString:sortingGivenNameFirst:pageSize:", 6, a4, a3, a5, a6);
}

- (id)makeInstructorQueryForSearchString:(id)a3 locationIDs:(id)a4 sortingGivenNameFirst:(BOOL)a5 pageSize:(int64_t)a6
{
  return -[CRKConcreteClassKitFacade makeQueryForPersonsWithRole:locationIDs:searchString:sortingGivenNameFirst:pageSize:](self, "makeQueryForPersonsWithRole:locationIDs:searchString:sortingGivenNameFirst:pageSize:", 4, a4, a3, a5, a6);
}

- (id)makeQueryForPersonsWithIdentifiers:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v10;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB8580]), "initWithOptions:behaviors:", 1, 1);
  objc_msgSend(v4, "predicateForPersonsWithObjectIDs:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(MEMORY[0x24BDB8570], "queryWithObjectType:predicate:error:", objc_opt_class(), v5, &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v10;
  if (!v6)
  {
    _CRKLogASM_2();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CRKConcreteClassKitFacade makeQueryForPersonsWithIdentifiers:].cold.1(v3, (uint64_t)v7, v8);

  }
  return v6;
}

- (id)makeQueryForLocationsAllowingEasyStudentSignInForPersonID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB8580]), "initWithOptions:behaviors:", 4, 1);
  NSStringFromCLSASMPrivilegeType();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requirePrivilege:onPersonIDs:", v5, v6);

  objc_msgSend(MEMORY[0x24BDB8570], "queryWithSearchSpecification:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    _CRKLogASM_2();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CRKConcreteClassKitFacade makeQueryForLocationsAllowingEasyStudentSignInForPersonID:].cold.1((uint64_t)v3, v8);

  }
  return v7;
}

- (void)executeQuery:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[CRKConcreteClassKitFacade executeQuery:]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("CRKConcreteClassKitFacade.m"), 304, CFSTR("expected %@, got %@"), v8, v10);

  }
  -[CRKConcreteClassKitFacade dataStore](self, "dataStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executeQuery:", v11);

}

- (id)makeDataObserverWithObjectType:(Class)a3 predicate:(id)a4 sortDescriptors:(id)a5
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v14;

  v7 = (void *)MEMORY[0x24BDB8578];
  v8 = a5;
  objc_msgSend(v7, "querySpecificationWithObjectType:predicate:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSortDescriptors:", v8);

  v14 = 0;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB8548]), "initWithQuerySpecification:error:", v9, &v14);
  v11 = v14;
  if (!v10)
  {
    _CRKLogASM_2();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[CRKConcreteClassKitFacade makeDataObserverWithObjectType:predicate:sortDescriptors:].cold.1();

  }
  return v10;
}

- (void)addPerson:(id)a3 withRole:(unint64_t)a4 toClass:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  id v21;

  v21 = a3;
  v7 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[CRKConcreteClassKitFacade addPerson:withRole:toClass:]");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("CRKConcreteClassKitFacade.m"), 330, CFSTR("expected %@, got %@"), v12, v14);

  }
  v8 = v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[CRKConcreteClassKitFacade addPerson:withRole:toClass:]");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("CRKConcreteClassKitFacade.m"), 331, CFSTR("expected %@, got %@"), v18, v20);

  }
  objc_msgSend(v8, "addPerson:withRole:", v21, a4);

}

- (void)removePerson:(id)a3 withRole:(unint64_t)a4 fromClass:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  id v21;

  v21 = a3;
  v7 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[CRKConcreteClassKitFacade removePerson:withRole:fromClass:]");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("CRKConcreteClassKitFacade.m"), 336, CFSTR("expected %@, got %@"), v12, v14);

  }
  v8 = v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[CRKConcreteClassKitFacade removePerson:withRole:fromClass:]");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("CRKConcreteClassKitFacade.m"), 337, CFSTR("expected %@, got %@"), v18, v20);

  }
  objc_msgSend(v8, "removePerson:withRole:", v21, a4);

}

- (id)objectIDsOfMembersInClass:(id)a3 withRole:(unint64_t)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)objc_opt_new();
  v7 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[CRKConcreteClassKitFacade objectIDsOfMembersInClass:withRole:]");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("CRKConcreteClassKitFacade.m"), 344, CFSTR("expected %@, got %@"), v20, v22);

  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v7, "classMembers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if ((objc_msgSend(v13, "roles") & a4) != 0)
        {
          objc_msgSend(v13, "personID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v14);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v10);
  }

  v15 = (void *)objc_msgSend(v6, "copy");
  return v15;
}

+ (id)makePersonSortDescriptorsSortingGivenNameFirst:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("givenName"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("familyName"), 1);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v3)
    v8 = v5;
  else
    v8 = (void *)v6;
  if (v3)
    v9 = (void *)v6;
  else
    v9 = v5;
  objc_msgSend(v4, "addObject:", v8);
  objc_msgSend(v4, "addObject:", v9);
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("appleID"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v10);

  v11 = (void *)objc_msgSend(v4, "copy");
  return v11;
}

- (id)makeQueryForPersonsWithRole:(int64_t)a3 locationIDs:(id)a4 searchString:(id)a5 sortingGivenNameFirst:(BOOL)a6 pageSize:(int64_t)a7
{
  _BOOL8 v8;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;

  v8 = a6;
  v11 = a5;
  v12 = a4;
  objc_msgSend((id)objc_opt_class(), "makePersonSortDescriptorsSortingGivenNameFirst:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc(MEMORY[0x24BDB8580]);
  if (v11)
    v15 = (void *)objc_msgSend(v14, "initWithOptions:behaviors:searchString:", 1, 3, v11);
  else
    v15 = (void *)objc_msgSend(v14, "initWithOptions:behaviors:", 1, 3);
  v16 = v15;
  objc_msgSend(v15, "requireRoleType:atLocationIDs:", a3, v12);

  objc_msgSend(v16, "setPersonSortDescriptors:", v13);
  objc_msgSend(MEMORY[0x24BDB8570], "queryWithSearchSpecification:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFetchLimit:", a7);

  return v17;
}

- (id)makePredicateForObjectIDs:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD14C0];
  -[CRKConcreteClassKitFacade makePredicatesForObjectIDs:](self, "makePredicatesForObjectIDs:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "orPredicateWithSubpredicates:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)makePredicatesForObjectIDs:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    v9 = *MEMORY[0x24BDB8528];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K = %@"), v9, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v11);

        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v12 = (void *)objc_msgSend(v4, "copy");
  return v12;
}

- (id)dataStore
{
  return (id)objc_msgSend(MEMORY[0x24BDB8550], "shared");
}

- (CRKClassKitAccountStateProvider)accountStateProvider
{
  return self->_accountStateProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStateProvider, 0);
}

- (void)makeQueryForPersonsWithIdentifiers:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5;
  uint8_t v6[14];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_1_0();
  v7 = a2;
  OUTLINED_FUNCTION_0_2(&dword_218C99000, a3, v5, "Failed to create CLSQuery for %lu person IDs: %{public}@", v6);
}

- (void)makeQueryForLocationsAllowingEasyStudentSignInForPersonID:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_218C99000, a2, OS_LOG_TYPE_ERROR, "Failed to create CLSQuery for organizations allowing Easy MAID Sign In for user with object ID: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)makeDataObserverWithObjectType:predicate:sortDescriptors:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_0();
  v3 = v0;
  OUTLINED_FUNCTION_0_2(&dword_218C99000, v1, (uint64_t)v1, "Failed to create ClassKit data observer for type %{public}@: %{public}@", v2);
}

@end
