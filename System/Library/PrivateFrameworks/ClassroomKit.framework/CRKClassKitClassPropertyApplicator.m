@implementation CRKClassKitClassPropertyApplicator

- (CRKClassKitClassPropertyApplicator)initWithRequirements:(id)a3
{
  id v5;
  CRKClassKitClassPropertyApplicator *v6;
  CRKClassKitClassPropertyApplicator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKClassKitClassPropertyApplicator;
  v6 = -[CRKClassKitClassPropertyApplicator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_requirements, a3);

  return v7;
}

- (id)applyProperties:(id)a3 toClass:(id)a4 error:(id *)a5
{
  void *v5;
  id v9;
  id v10;
  CRKClassKitClassPropertyApplicatorResult *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  char v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  unint64_t v24;
  void *v25;
  uint64_t v26;
  char v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t k;
  void *v53;
  void *v54;
  char v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t m;
  void *v61;
  void *v62;
  int v63;
  void *v65;
  void *v66;
  CRKClassKitClassPropertyApplicator *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v67 = self;
  if (-[CRKClassKitClassPropertyApplicator additionsAndRemovalsIntersect:](self, "additionsAndRemovalsIntersect:", v9))
  {
    if (a5)
    {
      CRKErrorWithCodeAndUserInfo(153, 0);
      v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_58;
    }
LABEL_57:
    v11 = 0;
    goto LABEL_58;
  }
  objc_msgSend(v9, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    goto LABEL_9;
  objc_msgSend(v10, "displayName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(v9, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
      goto LABEL_9;
  }
  objc_msgSend(v10, "displayName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "isEqual:", v15);

  if (!v13)
  {

    if ((v16 & 1) != 0)
      goto LABEL_9;
LABEL_11:
    objc_msgSend(v9, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDisplayName:", v18);

    v17 = 1;
    goto LABEL_12;
  }

  if ((v16 & 1) == 0)
    goto LABEL_11;
LABEL_9:
  v17 = 0;
LABEL_12:
  objc_msgSend(v9, "mascot");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = +[CRKClassKitColorAndMascotUtility mascotForClass:](CRKClassKitColorAndMascotUtility, "mascotForClass:", v10);
    objc_msgSend(v9, "mascot");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "unsignedIntegerValue");

    if (v20 != v22)
    {
      if (!+[CRKClassKitColorAndMascotUtility setMascot:forClass:error:](CRKClassKitColorAndMascotUtility, "setMascot:forClass:error:", v22, v10, a5))goto LABEL_57;
      v17 = 1;
    }
  }
  objc_msgSend(v9, "color");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = +[CRKClassKitColorAndMascotUtility colorForClass:](CRKClassKitColorAndMascotUtility, "colorForClass:", v10);
    objc_msgSend(v9, "color");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "unsignedIntegerValue");

    if (v24 != v26)
    {
      if (!+[CRKClassKitColorAndMascotUtility setColor:forClass:error:](CRKClassKitColorAndMascotUtility, "setColor:forClass:error:", v26, v10, a5))goto LABEL_57;
      v17 = 1;
    }
  }
  v27 = v17;
  -[CRKClassKitClassPropertyApplicator requirements](v67, "requirements");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectIDsOfPersonsInClass:", v10);
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRKClassKitClassPropertyApplicator requirements](v67, "requirements");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v10;
  objc_msgSend(v29, "objectIDsOfTrustedPersonsInClass:", v10);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v65 = v9;
  objc_msgSend(v9, "usersToAdd");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v80, v87, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v81;
    do
    {
      for (i = 0; i != v34; ++i)
      {
        if (*(_QWORD *)v81 != v35)
          objc_enumerationMutation(v32);
        v37 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
        objc_msgSend(v37, "identifier");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v66, "containsObject:", v38);

        if ((v39 & 1) == 0)
        {
          -[CRKClassKitClassPropertyApplicator addUser:toClass:](v67, "addUser:toClass:", v37, v30);
          v27 = 1;
        }
      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v80, v87, 16);
    }
    while (v34);
  }

  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  objc_msgSend(v65, "usersToRemove");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v76, v86, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v77;
    do
    {
      for (j = 0; j != v42; ++j)
      {
        if (*(_QWORD *)v77 != v43)
          objc_enumerationMutation(v40);
        v45 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * j);
        objc_msgSend(v45, "identifier");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v66, "containsObject:", v46);

        if (v47)
        {
          -[CRKClassKitClassPropertyApplicator removeUser:fromClass:](v67, "removeUser:fromClass:", v45, v30);
          v27 = 1;
        }
      }
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v76, v86, 16);
    }
    while (v42);
  }

  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  objc_msgSend(v65, "trustedUsersToAdd");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v72, v85, 16);
  if (v49)
  {
    v50 = v49;
    v51 = *(_QWORD *)v73;
    do
    {
      for (k = 0; k != v50; ++k)
      {
        if (*(_QWORD *)v73 != v51)
          objc_enumerationMutation(v48);
        v53 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * k);
        objc_msgSend(v53, "identifier");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = objc_msgSend(v31, "containsObject:", v54);

        if ((v55 & 1) == 0)
        {
          -[CRKClassKitClassPropertyApplicator addTrustedUser:toClass:](v67, "addTrustedUser:toClass:", v53, v30);
          v27 = 1;
        }
      }
      v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v72, v85, 16);
    }
    while (v50);
  }

  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  objc_msgSend(v65, "trustedUsersToRemove");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v68, v84, 16);
  if (v57)
  {
    v58 = v57;
    v59 = *(_QWORD *)v69;
    do
    {
      for (m = 0; m != v58; ++m)
      {
        if (*(_QWORD *)v69 != v59)
          objc_enumerationMutation(v56);
        v61 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * m);
        objc_msgSend(v61, "identifier");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = objc_msgSend(v31, "containsObject:", v62);

        if (v63)
        {
          -[CRKClassKitClassPropertyApplicator removeTrustedUser:fromClass:](v67, "removeTrustedUser:fromClass:", v61, v30);
          v27 = 1;
        }
      }
      v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v68, v84, 16);
    }
    while (v58);
  }

  v11 = -[CRKClassKitClassPropertyApplicatorResult initWithClassWasModified:]([CRKClassKitClassPropertyApplicatorResult alloc], "initWithClassWasModified:", v27 & 1);
  v9 = v65;
  v10 = v30;
LABEL_58:

  return v11;
}

- (void)addUser:(id)a3 toClass:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[CRKClassKitClassPropertyApplicator addUser:toClass:]");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("CRKClassKitClassPropertyApplicator.m"), 125, CFSTR("expected %@, got %@"), v12, v14);

  }
  objc_msgSend(v15, "backingPerson");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKClassKitClassPropertyApplicator requirements](self, "requirements");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addPerson:toClass:", v7, v6);

}

- (void)removeUser:(id)a3 fromClass:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[CRKClassKitClassPropertyApplicator removeUser:fromClass:]");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("CRKClassKitClassPropertyApplicator.m"), 131, CFSTR("expected %@, got %@"), v12, v14);

  }
  objc_msgSend(v15, "backingPerson");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKClassKitClassPropertyApplicator requirements](self, "requirements");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removePerson:fromClass:", v7, v6);

}

- (void)addTrustedUser:(id)a3 toClass:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[CRKClassKitClassPropertyApplicator addTrustedUser:toClass:]");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("CRKClassKitClassPropertyApplicator.m"), 137, CFSTR("expected %@, got %@"), v12, v14);

  }
  objc_msgSend(v15, "backingPerson");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKClassKitClassPropertyApplicator requirements](self, "requirements");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addTrustedPerson:toClass:", v7, v6);

}

- (void)removeTrustedUser:(id)a3 fromClass:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[CRKClassKitClassPropertyApplicator removeTrustedUser:fromClass:]");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("CRKClassKitClassPropertyApplicator.m"), 143, CFSTR("expected %@, got %@"), v12, v14);

  }
  objc_msgSend(v15, "backingPerson");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKClassKitClassPropertyApplicator requirements](self, "requirements");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeTrustedPerson:fromClass:", v7, v6);

}

- (BOOL)additionsAndRemovalsIntersect:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = a3;
  objc_msgSend(v4, "usersToAdd");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKClassKitClassPropertyApplicator identifiersOfUsers:](self, "identifiersOfUsers:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "usersToRemove");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKClassKitClassPropertyApplicator identifiersOfUsers:](self, "identifiersOfUsers:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "trustedUsersToAdd");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKClassKitClassPropertyApplicator identifiersOfUsers:](self, "identifiersOfUsers:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "trustedUsersToRemove");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRKClassKitClassPropertyApplicator identifiersOfUsers:](self, "identifiersOfUsers:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "intersectsSet:", v8) & 1) != 0)
    v13 = 1;
  else
    v13 = objc_msgSend(v10, "intersectsSet:", v12);

  return v13;
}

- (id)identifiersOfUsers:(id)a3
{
  return (id)objc_msgSend(a3, "crk_mapUsingBlock:", &__block_literal_global_41);
}

uint64_t __57__CRKClassKitClassPropertyApplicator_identifiersOfUsers___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

- (CRKClassKitRosterRequirements)requirements
{
  return self->_requirements;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requirements, 0);
}

@end
