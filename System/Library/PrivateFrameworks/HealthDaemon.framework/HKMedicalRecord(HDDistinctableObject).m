@implementation HKMedicalRecord(HDDistinctableObject)

- (id)uniqueIdentifierForDistinctByKeyPath:()HDDistinctableObject error:
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v14;
  objc_super v15;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKSample+HDDistinctableObject.m"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keyPath"));

  }
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB4A40]))
  {
    objc_msgSend(a1, "primaryConcept");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

    goto LABEL_17;
  }
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB4A38]))
  {
    objc_msgSend(a1, "primaryConcept");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "groupByConcept");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB53B0]))
  {
    objc_msgSend(a1, "note");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      objc_msgSend(a1, "note");
    else
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB53A8]))
  {
    objc_msgSend(a1, "modifiedDate");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15.receiver = a1;
    v15.super_class = (Class)&off_1EF218310;
    objc_msgSendSuper2(&v15, sel_uniqueIdentifierForDistinctByKeyPath_error_, v7, a4);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v12;
LABEL_17:

  return v9;
}

@end
