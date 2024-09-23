@implementation CPLSimpleRecordTargetMapping

- (void)setTarget:(id)a3 forRecordWithScopedIdentifier:(id)a4
{
  id v7;
  unint64_t v8;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v7 = a4;
  v8 = objc_msgSend(v14, "targetState");
  if (v8 <= 3 && v8 != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = v7;
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLRecordTarget.m");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[CPLRecordTarget descriptionForTargetState:](CPLRecordTarget, "descriptionForTargetState:", objc_msgSend(v14, "targetState"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v12, 279, CFSTR("Trying to set target of %@ to %@ in %@"), v10, v13, objc_opt_class());

    abort();
  }

}

- (id)targetForRecordWithScopedIdentifier:(id)a3
{
  id v3;
  CPLRecordTarget *v4;

  v3 = a3;
  v4 = -[CPLRecordTarget initWithScopedIdentifier:otherScopedIdentifier:targetState:]([CPLRecordTarget alloc], "initWithScopedIdentifier:otherScopedIdentifier:targetState:", v3, 0, 1);

  return v4;
}

- (BOOL)hasUnknownTargets
{
  return 0;
}

- (BOOL)hasUpdatedTargets
{
  return 0;
}

- (id)updatedTargets
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)updatedTargetScopedIdentifiers
{
  return objc_alloc_init(MEMORY[0x1E0C99E60]);
}

@end
