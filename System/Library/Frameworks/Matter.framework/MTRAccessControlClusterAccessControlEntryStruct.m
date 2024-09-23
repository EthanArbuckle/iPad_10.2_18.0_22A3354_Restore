@implementation MTRAccessControlClusterAccessControlEntryStruct

- (MTRAccessControlClusterAccessControlEntryStruct)init
{
  MTRAccessControlClusterAccessControlEntryStruct *v2;
  MTRAccessControlClusterAccessControlEntryStruct *v3;
  NSNumber *privilege;
  NSNumber *authMode;
  NSArray *subjects;
  NSArray *targets;
  NSNumber *fabricIndex;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTRAccessControlClusterAccessControlEntryStruct;
  v2 = -[MTRAccessControlClusterAccessControlEntryStruct init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    privilege = v2->_privilege;
    v2->_privilege = (NSNumber *)&unk_250591B18;

    authMode = v3->_authMode;
    v3->_authMode = (NSNumber *)&unk_250591B18;

    subjects = v3->_subjects;
    v3->_subjects = 0;

    targets = v3->_targets;
    v3->_targets = 0;

    fabricIndex = v3->_fabricIndex;
    v3->_fabricIndex = (NSNumber *)&unk_250591B18;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRAccessControlClusterAccessControlEntryStruct *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;

  v4 = objc_alloc_init(MTRAccessControlClusterAccessControlEntryStruct);
  objc_msgSend_privilege(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPrivilege_(v4, v8, (uint64_t)v7);

  objc_msgSend_authMode(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAuthMode_(v4, v12, (uint64_t)v11);

  objc_msgSend_subjects(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSubjects_(v4, v16, (uint64_t)v15);

  objc_msgSend_targets(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTargets_(v4, v20, (uint64_t)v19);

  objc_msgSend_fabricIndex(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFabricIndex_(v4, v24, (uint64_t)v23);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: privilege:%@; authMode:%@; subjects:%@; targets:%@; fabricIndex:%@; >"),
    v5,
    self->_privilege,
    self->_authMode,
    self->_subjects,
    self->_targets,
    self->_fabricIndex);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)privilege
{
  return self->_privilege;
}

- (void)setPrivilege:(NSNumber *)privilege
{
  objc_setProperty_nonatomic_copy(self, a2, privilege, 8);
}

- (NSNumber)authMode
{
  return self->_authMode;
}

- (void)setAuthMode:(NSNumber *)authMode
{
  objc_setProperty_nonatomic_copy(self, a2, authMode, 16);
}

- (NSArray)subjects
{
  return self->_subjects;
}

- (void)setSubjects:(NSArray *)subjects
{
  objc_setProperty_nonatomic_copy(self, a2, subjects, 24);
}

- (NSArray)targets
{
  return self->_targets;
}

- (void)setTargets:(NSArray *)targets
{
  objc_setProperty_nonatomic_copy(self, a2, targets, 32);
}

- (NSNumber)fabricIndex
{
  return self->_fabricIndex;
}

- (void)setFabricIndex:(NSNumber *)fabricIndex
{
  objc_setProperty_nonatomic_copy(self, a2, fabricIndex, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fabricIndex, 0);
  objc_storeStrong((id *)&self->_targets, 0);
  objc_storeStrong((id *)&self->_subjects, 0);
  objc_storeStrong((id *)&self->_authMode, 0);
  objc_storeStrong((id *)&self->_privilege, 0);
}

@end
