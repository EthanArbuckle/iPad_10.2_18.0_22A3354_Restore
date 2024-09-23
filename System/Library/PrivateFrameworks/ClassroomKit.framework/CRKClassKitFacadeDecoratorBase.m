@implementation CRKClassKitFacadeDecoratorBase

- (CRKClassKitFacadeDecoratorBase)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithClassKitFacade_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKClassKitFacadeDecoratorBase.m"), 20, CFSTR("Use %@ instead"), v5);

  return 0;
}

- (CRKClassKitFacadeDecoratorBase)initWithClassKitFacade:(id)a3
{
  id v5;
  CRKClassKitFacadeDecoratorBase *v6;
  CRKClassKitFacadeDecoratorBase *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKClassKitFacadeDecoratorBase;
  v6 = -[CRKClassKitFacadeDecoratorBase init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_underlyingClassKitFacade, a3);

  return v7;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[CRKClassKitFacadeDecoratorBase underlyingClassKitFacade](self, "underlyingClassKitFacade");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { underlyingClassKitFacade = %@ }>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

+ (id)keyPathsForValuesAffectingAccountState
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("underlyingClassKitFacade.accountState"));
}

- (int64_t)accountState
{
  void *v2;
  int64_t v3;

  -[CRKClassKitFacadeDecoratorBase underlyingClassKitFacade](self, "underlyingClassKitFacade");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "accountState");

  return v3;
}

- (BOOL)ownsError:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CRKClassKitFacadeDecoratorBase underlyingClassKitFacade](self, "underlyingClassKitFacade");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "ownsError:", v4);

  return v6;
}

- (void)syncServerConfigWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CRKClassKitFacadeDecoratorBase underlyingClassKitFacade](self, "underlyingClassKitFacade");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syncServerConfigWithCompletion:", v4);

}

- (id)classDataObserverWithSortDescriptors:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CRKClassKitFacadeDecoratorBase underlyingClassKitFacade](self, "underlyingClassKitFacade");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "classDataObserverWithSortDescriptors:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)locationsObserverWithSortDescriptors:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CRKClassKitFacadeDecoratorBase underlyingClassKitFacade](self, "underlyingClassKitFacade");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationsObserverWithSortDescriptors:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)personObserverWithPersonIDs:(id)a3 sortDescriptors:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[CRKClassKitFacadeDecoratorBase underlyingClassKitFacade](self, "underlyingClassKitFacade");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "personObserverWithPersonIDs:sortDescriptors:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)registerDataObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CRKClassKitFacadeDecoratorBase underlyingClassKitFacade](self, "underlyingClassKitFacade");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerDataObserver:", v4);

}

- (void)deregisterDataObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CRKClassKitFacadeDecoratorBase underlyingClassKitFacade](self, "underlyingClassKitFacade");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deregisterDataObserver:", v4);

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

  v4 = a3;
  -[CRKClassKitFacadeDecoratorBase underlyingClassKitFacade](self, "underlyingClassKitFacade");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enrolledClassesWithCompletion:", v4);

}

- (void)instructedClassesWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CRKClassKitFacadeDecoratorBase underlyingClassKitFacade](self, "underlyingClassKitFacade");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "instructedClassesWithCompletion:", v4);

}

- (void)instructorsInClassWithObjectID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CRKClassKitFacadeDecoratorBase underlyingClassKitFacade](self, "underlyingClassKitFacade");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "instructorsInClassWithObjectID:completion:", v7, v6);

}

- (void)studentsInClassWithObjectID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CRKClassKitFacadeDecoratorBase underlyingClassKitFacade](self, "underlyingClassKitFacade");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "studentsInClassWithObjectID:completion:", v7, v6);

}

- (void)saveClass:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CRKClassKitFacadeDecoratorBase underlyingClassKitFacade](self, "underlyingClassKitFacade");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "saveClass:completion:", v7, v6);

}

- (void)addStudent:(id)a3 toClass:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CRKClassKitFacadeDecoratorBase underlyingClassKitFacade](self, "underlyingClassKitFacade");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addStudent:toClass:", v7, v6);

}

- (void)removeStudent:(id)a3 fromClass:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CRKClassKitFacadeDecoratorBase underlyingClassKitFacade](self, "underlyingClassKitFacade");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeStudent:fromClass:", v7, v6);

}

- (id)objectIDsOfStudentsInClass:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CRKClassKitFacadeDecoratorBase underlyingClassKitFacade](self, "underlyingClassKitFacade");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectIDsOfStudentsInClass:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)addInstructor:(id)a3 toClass:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CRKClassKitFacadeDecoratorBase underlyingClassKitFacade](self, "underlyingClassKitFacade");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addInstructor:toClass:", v7, v6);

}

- (void)removeInstructor:(id)a3 fromClass:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CRKClassKitFacadeDecoratorBase underlyingClassKitFacade](self, "underlyingClassKitFacade");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeInstructor:fromClass:", v7, v6);

}

- (id)objectIDsOfInstructorsInClass:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CRKClassKitFacadeDecoratorBase underlyingClassKitFacade](self, "underlyingClassKitFacade");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectIDsOfInstructorsInClass:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)makeClassWithLocationID:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[CRKClassKitFacadeDecoratorBase underlyingClassKitFacade](self, "underlyingClassKitFacade");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "makeClassWithLocationID:name:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)locationsWithManagePermissionsForUserWithObjectID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CRKClassKitFacadeDecoratorBase underlyingClassKitFacade](self, "underlyingClassKitFacade");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "locationsWithManagePermissionsForUserWithObjectID:completion:", v7, v6);

}

- (void)locationsWithObjectIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CRKClassKitFacadeDecoratorBase underlyingClassKitFacade](self, "underlyingClassKitFacade");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "locationsWithObjectIDs:completion:", v7, v6);

}

- (void)removeClass:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CRKClassKitFacadeDecoratorBase underlyingClassKitFacade](self, "underlyingClassKitFacade");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeClass:completion:", v7, v6);

}

- (id)makeStudentQueryForSearchString:(id)a3 locationIDs:(id)a4 sortingGivenNameFirst:(BOOL)a5 pageSize:(int64_t)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v7 = a5;
  v10 = a4;
  v11 = a3;
  -[CRKClassKitFacadeDecoratorBase underlyingClassKitFacade](self, "underlyingClassKitFacade");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "makeStudentQueryForSearchString:locationIDs:sortingGivenNameFirst:pageSize:", v11, v10, v7, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)makeInstructorQueryForSearchString:(id)a3 locationIDs:(id)a4 sortingGivenNameFirst:(BOOL)a5 pageSize:(int64_t)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v7 = a5;
  v10 = a4;
  v11 = a3;
  -[CRKClassKitFacadeDecoratorBase underlyingClassKitFacade](self, "underlyingClassKitFacade");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "makeInstructorQueryForSearchString:locationIDs:sortingGivenNameFirst:pageSize:", v11, v10, v7, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)makeQueryForPersonsWithIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CRKClassKitFacadeDecoratorBase underlyingClassKitFacade](self, "underlyingClassKitFacade");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "makeQueryForPersonsWithIdentifiers:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)makeQueryForLocationsAllowingEasyStudentSignInForPersonID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CRKClassKitFacadeDecoratorBase underlyingClassKitFacade](self, "underlyingClassKitFacade");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "makeQueryForLocationsAllowingEasyStudentSignInForPersonID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)executeQuery:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CRKClassKitFacadeDecoratorBase underlyingClassKitFacade](self, "underlyingClassKitFacade");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "executeQuery:", v4);

}

- (id)subscribeToClassMembershipChangeEvents:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CRKClassKitFacadeDecoratorBase underlyingClassKitFacade](self, "underlyingClassKitFacade");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subscribeToClassMembershipChangeEvents:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)subscribeToCurrentUserDidChangeEvents:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CRKClassKitFacadeDecoratorBase underlyingClassKitFacade](self, "underlyingClassKitFacade");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subscribeToCurrentUserDidChangeEvents:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CRKClassKitFacade)underlyingClassKitFacade
{
  return self->_underlyingClassKitFacade;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingClassKitFacade, 0);
}

@end
