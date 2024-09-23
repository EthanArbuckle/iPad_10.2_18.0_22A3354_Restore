@implementation _HDUserDomainConceptManagerModificationOperation

- (_HDUserDomainConceptManagerModificationOperation)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (_HDUserDomainConceptManagerModificationOperation)initWithUserDomainConcepts:(id)a3 method:(int64_t)a4 syncProvenance:(int64_t)a5 syncIdentity:(int64_t)a6 syncVersion:(id)a7
{
  id v13;
  _HDUserDomainConceptManagerModificationOperation *v14;
  _HDUserDomainConceptManagerModificationOperation *v15;
  objc_super v17;

  v13 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_HDUserDomainConceptManagerModificationOperation;
  v14 = -[_HDUserDomainConceptManagerModificationOperation init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_userDomainConcepts, a3);
    v15->_method = a4;
    v15->_syncProvenance = a5;
    v15->_syncIdentity = a6;
    v15->_syncVersion = ($E7BD3517D03D6A5513A4727339E3F206)a7;
  }

  return v15;
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int64_t syncIdentity;
  id *v15;
  NSArray *userDomainConcepts;
  int64_t method;
  int64_t syncProvenance;
  $E7BD3517D03D6A5513A4727339E3F206 syncVersion;
  NSArray *v20;
  id v21;
  id *v22;
  id *v23;
  id WeakRetained;
  NSArray *v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  BOOL v33;
  NSArray *v34;
  uint64_t j;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  int v46;
  id v47;
  _BOOL4 v48;
  void *v49;
  void *v50;
  NSArray *v52;
  NSArray *v53;
  id v54;
  id v55;
  NSArray *v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  id *v60;
  NSArray *obj;
  id obja;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _QWORD v67[5];
  id v68;
  _BYTE v69[128];
  _QWORD v70[3];

  v70[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "syncIdentityManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "legacySyncIdentity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "entity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "persistentID");

  if (self->_syncIdentity == -1)
    syncIdentity = v13;
  else
    syncIdentity = self->_syncIdentity;
  objc_msgSend(v9, "userDomainConceptManager");
  v15 = (id *)objc_claimAutoreleasedReturnValue();

  userDomainConcepts = self->_userDomainConcepts;
  method = self->_method;
  syncProvenance = self->_syncProvenance;
  syncVersion = self->_syncVersion;
  v20 = userDomainConcepts;
  v21 = v8;
  if (!v15)
    goto LABEL_35;
  if ((unint64_t)(method - 1) < 2)
  {
    v22 = v15;
    v23 = a5;
    v60 = v22;
    WeakRetained = objc_loadWeakRetained(v22 + 8);
    v52 = v20;
    v25 = v20;
    v26 = WeakRetained;
    v54 = v21;
    v27 = v21;
    v63 = 0u;
    v64 = 0u;
    if (method == 2)
      v28 = 3;
    else
      v28 = 2;
    v65 = 0uLL;
    v66 = 0uLL;
    obj = v25;
    v29 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v64;
      while (2)
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v64 != v31)
            objc_enumerationMutation(obj);
          if (!+[HDUserDomainConceptEntity storeUserDomainConcept:method:syncProvenance:syncIdentity:syncVersion:profile:transaction:error:](HDUserDomainConceptEntity, "storeUserDomainConcept:method:syncProvenance:syncIdentity:syncVersion:profile:transaction:error:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * i), v28, syncProvenance, syncIdentity, syncVersion, v26, v27, v23))
          {
            v33 = 0;
            goto LABEL_33;
          }
        }
        v30 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
        if (v30)
          continue;
        break;
      }
    }
    v33 = 1;
LABEL_33:
    v15 = v60;

    v20 = v52;
    v21 = v54;
    goto LABEL_40;
  }
  if (method != 3)
  {
    v49 = (void *)MEMORY[0x1E0CB35C8];
    HKStringFromUserDomainConceptStoreMethod();
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "hk_assignError:code:format:", a5, 100, CFSTR("Unknown user domain concept modification method %@"), v50);

LABEL_35:
    v33 = 0;
    goto LABEL_40;
  }
  v34 = v20;
  v55 = v21;
  v59 = v21;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v56 = v34;
  v58 = -[NSArray countByEnumeratingWithState:objects:count:](v56, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
  if (v58)
  {
    v53 = v20;
    v57 = *(_QWORD *)v64;
    while (2)
    {
      for (j = 0; j != v58; ++j)
      {
        if (*(_QWORD *)v64 != v57)
          objc_enumerationMutation(v56);
        v36 = *(id *)(*((_QWORD *)&v63 + 1) + 8 * j);
        obja = v59;
        objc_msgSend(v15, "profile");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "daemon");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "userDomainConceptEntityRegistry");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "identifier");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = (void *)objc_msgSend(v39, "userDomainConceptEntityClassForTypeIdentifier:", v40);

        if ((objc_msgSend(v41, "supportsHidingSemanticDuplicates") & 1) != 0)
        {
          objc_msgSend(v41, "predicateMatchingSemanticDuplicatesOf:", v36);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", CFSTR("creation_date"), objc_opt_class(), 0);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v70[0] = v43;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 1);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v67[0] = MEMORY[0x1E0C809B0];
          v67[1] = 3221225472;
          v67[2] = __129__HDUserDomainConceptManager__enumerateAndDeleteSemanticDuplicatesOfConceptIfSupportsHidingSemanticDuplicates_transaction_error___block_invoke;
          v67[3] = &unk_1E6D0BFE0;
          v67[4] = v15;
          v45 = obja;
          v68 = v45;
          v46 = objc_msgSend(v15, "enumerateUserDomainConceptsWithPredicate:enumerationOptions:limit:orderingTerms:transaction:error:enumerationHandler:", v42, 2, 0, v44, v45, a5, v67);

          if (!v46)
            goto LABEL_36;
        }
        else
        {

        }
        v47 = objc_loadWeakRetained(v15 + 8);
        v48 = +[HDUserDomainConceptEntity deleteUserDomainConcept:profile:transaction:error:](HDUserDomainConceptEntity, "deleteUserDomainConcept:profile:transaction:error:", v36, v47, obja, a5);

        if (!v48)
        {
LABEL_36:
          v33 = 0;
          goto LABEL_37;
        }
      }
      v58 = -[NSArray countByEnumeratingWithState:objects:count:](v56, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
      if (v58)
        continue;
      break;
    }
    v33 = 1;
LABEL_37:
    v20 = v53;
  }
  else
  {
    v33 = 1;
  }

  v21 = v55;
LABEL_40:

  return v33;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  _HDUserDomainConceptManagerModificationOperation *v3;
  int64_t method;
  id v5;

  v3 = self;
  method = self->_method;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", method, CFSTR("method"));
  objc_msgSend(v5, "encodeInt64:forKey:", v3->_syncProvenance, CFSTR("sync_provenance"));
  objc_msgSend(v5, "encodeObject:forKey:", v3->_userDomainConcepts, CFSTR("concepts"));
  objc_msgSend(v5, "encodeInt64:forKey:", v3->_syncIdentity, CFSTR("sync_identity"));
  v3 = (_HDUserDomainConceptManagerModificationOperation *)((char *)v3 + 32);
  objc_msgSend(v5, "encodeInt32:forKey:", LODWORD(v3->super.super.super.isa), CFSTR("sync_version_minimum"));
  objc_msgSend(v5, "encodeInt32:forKey:", HIDWORD(v3->super.super.super.isa), CFSTR("sync_version_current"));

}

- (_HDUserDomainConceptManagerModificationOperation)initWithCoder:(id)a3
{
  id v4;
  _HDUserDomainConceptManagerModificationOperation *v5;
  void *v6;
  uint64_t v7;
  NSArray *userDomainConcepts;
  unsigned int v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_HDUserDomainConceptManagerModificationOperation;
  v5 = -[_HDUserDomainConceptManagerModificationOperation init](&v11, sel_init);
  if (v5)
  {
    v5->_method = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("method"));
    v5->_syncProvenance = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("sync_provenance"));
    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("concepts"));
    v7 = objc_claimAutoreleasedReturnValue();
    userDomainConcepts = v5->_userDomainConcepts;
    v5->_userDomainConcepts = (NSArray *)v7;

    v5->_syncIdentity = -1;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("sync_identity")))
      v5->_syncIdentity = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("sync_identity"));
    v9 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("sync_version_minimum"));
    v5->_syncVersion = ($E7BD3517D03D6A5513A4727339E3F206)(v9 | (unint64_t)(objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("sync_version_current")) << 32));
  }

  return v5;
}

- (int64_t)method
{
  return self->_method;
}

- (int64_t)syncProvenance
{
  return self->_syncProvenance;
}

- ($2825F4736939C4A6D3AD43837233062D)syncVersion
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_syncVersion;
}

- (int64_t)syncIdentity
{
  return self->_syncIdentity;
}

- (NSArray)userDomainConcepts
{
  return self->_userDomainConcepts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDomainConcepts, 0);
}

@end
