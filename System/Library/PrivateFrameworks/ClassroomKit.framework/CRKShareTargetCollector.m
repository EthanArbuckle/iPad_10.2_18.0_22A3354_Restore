@implementation CRKShareTargetCollector

- (CRKShareTargetCollector)init
{
  CRKShareTargetCollector *v2;
  uint64_t v3;
  NSSet *studentTargets;
  uint64_t v5;
  NSSet *instructorTargets;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRKShareTargetCollector;
  v2 = -[CRKShareTargetCollector init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    studentTargets = v2->_studentTargets;
    v2->_studentTargets = (NSSet *)v3;

    v5 = objc_opt_new();
    instructorTargets = v2->_instructorTargets;
    v2->_instructorTargets = (NSSet *)v5;

  }
  return v2;
}

- (void)studentTargetsDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v4 = a3;
  _CRKLogGeneral_13();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_218C99000, v5, OS_LOG_TYPE_INFO, "Classroom: Share target browser student targets did change", v8, 2u);
  }

  -[CRKShareTargetCollector studentTargets](self, "studentTargets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRKShareTargetCollector setStudentTargets:](self, "setStudentTargets:", v7);
  -[CRKShareTargetCollector diffNewTargets:againstOldTargets:](self, "diffNewTargets:againstOldTargets:", v7, v6);

}

- (void)instructorTargetsDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v4 = a3;
  _CRKLogGeneral_13();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_218C99000, v5, OS_LOG_TYPE_INFO, "Classroom: Share target browser instructor targets did change", v8, 2u);
  }

  -[CRKShareTargetCollector instructorTargets](self, "instructorTargets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRKShareTargetCollector setInstructorTargets:](self, "setInstructorTargets:", v7);
  -[CRKShareTargetCollector diffNewTargets:againstOldTargets:](self, "diffNewTargets:againstOldTargets:", v7, v6);

}

- (void)diffNewTargets:(id)a3 againstOldTargets:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "crk_setBySubtractingSet:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "crk_setBySubtractingSet:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRKShareTargetCollector didRemoveTargets:](self, "didRemoveTargets:", v9);
  -[CRKShareTargetCollector didFindTargets:](self, "didFindTargets:", v8);

}

- (void)didFindTargets:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    _CRKLogGeneral_13();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v8 = 138543362;
      v9 = v4;
      _os_log_impl(&dword_218C99000, v5, OS_LOG_TYPE_INFO, "Classroom: Share target browser did find targets: %{public}@", (uint8_t *)&v8, 0xCu);
    }

    -[CRKShareTargetCollector delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "shareTargetCollector:didFindTargets:", self, v7);

  }
}

- (void)didRemoveTargets:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    _CRKLogGeneral_13();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v8 = 138543362;
      v9 = v4;
      _os_log_impl(&dword_218C99000, v5, OS_LOG_TYPE_INFO, "Classroom: Share target browser did remove targets: %{public}@", (uint8_t *)&v8, 0xCu);
    }

    -[CRKShareTargetCollector delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "shareTargetCollector:didRemoveTargets:", self, v7);

  }
}

- (CRKShareTargetCollectorDelegate)delegate
{
  return (CRKShareTargetCollectorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSSet)studentTargets
{
  return self->_studentTargets;
}

- (void)setStudentTargets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSSet)instructorTargets
{
  return self->_instructorTargets;
}

- (void)setInstructorTargets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instructorTargets, 0);
  objc_storeStrong((id *)&self->_studentTargets, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
