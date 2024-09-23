@implementation ICFolderListSectionIdentifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_accountObjectID, 0);
}

+ (ICFolderListSectionIdentifier)tagSectionIdentifier
{
  if (tagSectionIdentifier_once[0] != -1)
    dispatch_once(tagSectionIdentifier_once, &__block_literal_global_211);
  return (ICFolderListSectionIdentifier *)(id)tagSectionIdentifier_identifier;
}

void __48__ICFolderListSectionIdentifier_initWithObject___block_invoke(uint64_t a1)
{
  char isKindOfClass;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  id v47;

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v3 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    v4 = *(void **)(a1 + 40);
    v47 = v3;
    v5 = objc_msgSend(v4, "accountSectionTypeForModernAccount:", v47);
LABEL_5:
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24) = v5;
    objc_msgSend(*(id *)(a1 + 32), "objectID");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(void **)(v8 + 16);
    *(_QWORD *)(v8 + 16) = v7;

    objc_msgSend(v47, "localizedName");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
    v12 = *(void **)(v11 + 32);
    *(_QWORD *)(v11 + 32) = v10;

LABEL_15:
    v38 = v47;
LABEL_16:

    return;
  }
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EED6F310))
  {
    v6 = *(void **)(a1 + 40);
    v47 = *(id *)(a1 + 32);
    v5 = objc_msgSend(v6, "accountSectionTypeForLegacyAccount:", v47);
    goto LABEL_5;
  }
  objc_opt_class();
  v13 = objc_opt_isKindOfClass();
  v14 = *(void **)(a1 + 32);
  if ((v13 & 1) != 0)
  {
    v15 = v14;
    objc_msgSend(v15, "account");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectID");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(a1 + 40);
    v19 = *(void **)(v18 + 16);
    *(_QWORD *)(v18 + 16) = v17;

    objc_msgSend(v15, "account");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedName");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = *(_QWORD *)(a1 + 40);
    v23 = *(void **)(v22 + 32);
    *(_QWORD *)(v22 + 32) = v21;

    v24 = *(void **)(a1 + 40);
    objc_msgSend(v15, "account");
    v47 = (id)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24) = objc_msgSend(v24, "accountSectionTypeForModernAccount:", v47);
LABEL_14:

    goto LABEL_15;
  }
  if (objc_msgSend(v14, "conformsToProtocol:", &unk_1EED6F370))
  {
    v25 = *(void **)(a1 + 40);
    v15 = *(id *)(a1 + 32);
    objc_msgSend(v15, "account");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "accountSectionTypeForLegacyAccount:", v26);
LABEL_12:
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24) = v27;

    objc_msgSend(v15, "account");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectID");
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = *(_QWORD *)(a1 + 40);
    v34 = *(void **)(v33 + 16);
    *(_QWORD *)(v33 + 16) = v32;

    objc_msgSend(v15, "account");
    v47 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "localizedName");
    v35 = objc_claimAutoreleasedReturnValue();
LABEL_13:
    v36 = *(_QWORD *)(a1 + 40);
    v37 = *(void **)(v36 + 32);
    *(_QWORD *)(v36 + 32) = v35;

    goto LABEL_14;
  }
  objc_opt_class();
  v28 = objc_opt_isKindOfClass();
  v29 = *(void **)(a1 + 32);
  if ((v28 & 1) != 0)
  {
    v30 = *(void **)(a1 + 40);
    v15 = v29;
    objc_msgSend(v15, "account");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v30, "accountSectionTypeForModernAccount:", v26);
    goto LABEL_12;
  }
  if (objc_msgSend(v29, "conformsToProtocol:", &unk_1EED6F3D0))
  {
    v39 = *(void **)(a1 + 40);
    v15 = *(id *)(a1 + 32);
    objc_msgSend(v15, "account");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24) = objc_msgSend(v39, "accountSectionTypeForLegacyAccount:", v40);

    objc_msgSend(v15, "account");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "objectID");
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = *(_QWORD *)(a1 + 40);
    v44 = *(void **)(v43 + 16);
    *(_QWORD *)(v43 + 16) = v42;

    objc_msgSend(v15, "account");
    v47 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "name");
    v35 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24) = 8;
    objc_msgSend(MEMORY[0x1E0D63B20], "localizedSectionTitle");
    v45 = objc_claimAutoreleasedReturnValue();
    v46 = *(_QWORD *)(a1 + 40);
    v38 = *(void **)(v46 + 32);
    *(_QWORD *)(v46 + 32) = v45;
    goto LABEL_16;
  }
}

- (int64_t)accountSectionTypeForModernAccount:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if (objc_msgSend(v3, "accountType") == 3)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isManaged"))
  {
    v4 = 3;
  }
  else
  {
    v4 = 2;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  ICFolderListSectionIdentifier *v4;
  ICFolderListSectionIdentifier *v5;
  void *v6;
  BOOL v7;

  v4 = (ICFolderListSectionIdentifier *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_opt_class();
    ICDynamicCast();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[ICFolderListSectionIdentifier isEqualToICFolderListSectionIdentifier:](self, "isEqualToICFolderListSectionIdentifier:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t result;
  uint64_t v4;
  void *v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  result = self->_hash;
  if (!result)
  {
    v4 = -[ICFolderListSectionIdentifier sectionType](self, "sectionType");
    -[ICFolderListSectionIdentifier accountObjectID](self, "accountObjectID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hash");
    self->_hash = ICHashWithHashKeys(v4, v7, v8, v9, v10, v11, v12, v13, v6);

    return self->_hash;
  }
  return result;
}

- (BOOL)isEqualToICFolderListSectionIdentifier:(id)a3
{
  id v4;
  int64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;

  v4 = a3;
  v5 = -[ICFolderListSectionIdentifier sectionType](self, "sectionType");
  v6 = objc_msgSend(v4, "sectionType");
  -[ICFolderListSectionIdentifier accountObjectID](self, "accountObjectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v4, "accountObjectID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8 != 0;

  }
  else
  {
    v9 = 0;
  }

  -[ICFolderListSectionIdentifier accountObjectID](self, "accountObjectID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(v4, "accountObjectID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v12 == 0;

  }
  if (v9)
  {
    -[ICFolderListSectionIdentifier accountObjectID](self, "accountObjectID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accountObjectID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v11 |= objc_msgSend(v13, "isEqual:", v14);

  }
  if (v5 == v6)
    v15 = v11;
  else
    v15 = 0;

  return v15;
}

- (NSManagedObjectID)accountObjectID
{
  return self->_accountObjectID;
}

- (int64_t)sectionType
{
  return self->_sectionType;
}

- (ICFolderListSectionIdentifier)initWithObject:(id)a3
{
  id v4;
  ICFolderListSectionIdentifier *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  ICFolderListSectionIdentifier *v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICFolderListSectionIdentifier;
  v5 = -[ICFolderListSectionIdentifier init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "managedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __48__ICFolderListSectionIdentifier_initWithObject___block_invoke;
    v8[3] = &unk_1E5C1D9A8;
    v9 = v4;
    v10 = v5;
    objc_msgSend(v6, "performBlockAndWait:", v8);

  }
  return v5;
}

+ (ICFolderListSectionIdentifier)systemSectionIdentifier
{
  if (systemSectionIdentifier_once[0] != -1)
    dispatch_once(systemSectionIdentifier_once, &__block_literal_global_9);
  return (ICFolderListSectionIdentifier *)(id)systemSectionIdentifier_identifier;
}

+ (NSArray)sortDescriptors
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("sectionType"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSString)expansionStateContext
{
  unint64_t v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = -[ICFolderListSectionIdentifier sectionType](self, "sectionType") - 1;
  if (v3 > 7)
    v4 = CFSTR("ICFolderListSectionTypeSystem");
  else
    v4 = off_1E5C1E2C0[v3];
  -[ICFolderListSectionIdentifier accountObjectID](self, "accountObjectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    -[ICFolderListSectionIdentifier accountObjectID](self, "accountObjectID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URIRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "absoluteString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@:%@"), v4, v9);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v4;
}

void __56__ICFolderListSectionIdentifier_systemSectionIdentifier__block_invoke()
{
  ICFolderListSectionIdentifier *v0;
  void *v1;

  v0 = -[ICFolderListSectionIdentifier initWithSectionType:]([ICFolderListSectionIdentifier alloc], "initWithSectionType:", 0);
  v1 = (void *)systemSectionIdentifier_identifier;
  systemSectionIdentifier_identifier = (uint64_t)v0;

}

void __53__ICFolderListSectionIdentifier_tagSectionIdentifier__block_invoke()
{
  ICFolderListSectionIdentifier *v0;
  void *v1;

  v0 = -[ICFolderListSectionIdentifier initWithSectionType:]([ICFolderListSectionIdentifier alloc], "initWithSectionType:", 8);
  v1 = (void *)tagSectionIdentifier_identifier;
  tagSectionIdentifier_identifier = (uint64_t)v0;

}

- (ICFolderListSectionIdentifier)initWithSectionType:(int64_t)a3
{
  ICFolderListSectionIdentifier *v4;
  ICFolderListSectionIdentifier *v5;
  NSManagedObjectID *accountObjectID;
  const __CFString *v7;
  NSString *title;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ICFolderListSectionIdentifier;
  v4 = -[ICFolderListSectionIdentifier init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    accountObjectID = v4->_accountObjectID;
    v4->_accountObjectID = 0;
    v4->_sectionType = a3;

    switch(a3)
    {
      case 0:
        title = v5->_title;
        v5->_title = (NSString *)&stru_1E5C2F8C0;
        goto LABEL_12;
      case 1:
        objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Quick Notes"), CFSTR("Quick Notes"), 0, 1);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      case 2:
      case 3:
      case 4:
      case 5:
      case 7:
        if ((unint64_t)(a3 - 2) > 5)
          v7 = CFSTR("ICFolderListSectionTypeSystem");
        else
          v7 = off_1E5C1E290[a3 - 2];
        return v5;
      case 6:
        objc_msgSend(MEMORY[0x1E0D639C8], "localizedLocalAccountName");
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      case 8:
        objc_msgSend(MEMORY[0x1E0D63B20], "localizedSectionTitle");
        v9 = objc_claimAutoreleasedReturnValue();
LABEL_11:
        title = v5->_title;
        v5->_title = (NSString *)v9;
LABEL_12:

        break;
      default:
        return v5;
    }
  }
  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)hasHeader
{
  return (unint64_t)(-[ICFolderListSectionIdentifier sectionType](self, "sectionType") - 1) < 8;
}

- (BOOL)isCollapsible
{
  return 1;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  unint64_t v6;
  const __CFString *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ICFolderListSectionIdentifier sectionType](self, "sectionType") - 1;
  if (v6 > 7)
    v7 = CFSTR("ICFolderListSectionTypeSystem");
  else
    v7 = off_1E5C1E2C0[v6];
  -[ICFolderListSectionIdentifier accountObjectID](self, "accountObjectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, sectionType: %@, accountObjectID: %@>"), v5, self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (int64_t)accountSectionTypeForLegacyAccount:(id)a3
{
  uint64_t v3;
  int64_t v4;

  v3 = objc_msgSend(a3, "legacyAccountType");
  v4 = 7;
  if (v3 == 1)
    v4 = 4;
  if (v3 == 2)
    return 5;
  else
    return v4;
}

- (void)setAccountObjectID:(id)a3
{
  objc_storeStrong((id *)&self->_accountObjectID, a3);
}

- (void)setSectionType:(int64_t)a3
{
  self->_sectionType = a3;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

@end
