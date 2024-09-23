@implementation CRKASMCourseUpdateProperties

- (NSSet)usersToAdd
{
  NSSet *usersToAdd;
  NSSet *v4;
  NSSet *v5;

  usersToAdd = self->_usersToAdd;
  if (!usersToAdd)
  {
    v4 = (NSSet *)objc_opt_new();
    v5 = self->_usersToAdd;
    self->_usersToAdd = v4;

    usersToAdd = self->_usersToAdd;
  }
  return usersToAdd;
}

- (NSSet)usersToRemove
{
  NSSet *usersToRemove;
  NSSet *v4;
  NSSet *v5;

  usersToRemove = self->_usersToRemove;
  if (!usersToRemove)
  {
    v4 = (NSSet *)objc_opt_new();
    v5 = self->_usersToRemove;
    self->_usersToRemove = v4;

    usersToRemove = self->_usersToRemove;
  }
  return usersToRemove;
}

- (NSSet)trustedUsersToAdd
{
  NSSet *trustedUsersToAdd;
  NSSet *v4;
  NSSet *v5;

  trustedUsersToAdd = self->_trustedUsersToAdd;
  if (!trustedUsersToAdd)
  {
    v4 = (NSSet *)objc_opt_new();
    v5 = self->_trustedUsersToAdd;
    self->_trustedUsersToAdd = v4;

    trustedUsersToAdd = self->_trustedUsersToAdd;
  }
  return trustedUsersToAdd;
}

- (NSSet)trustedUsersToRemove
{
  NSSet *trustedUsersToRemove;
  NSSet *v4;
  NSSet *v5;

  trustedUsersToRemove = self->_trustedUsersToRemove;
  if (!trustedUsersToRemove)
  {
    v4 = (NSSet *)objc_opt_new();
    v5 = self->_trustedUsersToRemove;
    self->_trustedUsersToRemove = v4;

    trustedUsersToRemove = self->_trustedUsersToRemove;
  }
  return trustedUsersToRemove;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CRKASMCourseUpdateProperties name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setName:", v5);

  -[CRKASMCourseUpdateProperties color](self, "color");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColor:", v6);

  -[CRKASMCourseUpdateProperties mascot](self, "mascot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMascot:", v7);

  -[CRKASMCourseUpdateProperties usersToAdd](self, "usersToAdd");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUsersToAdd:", v8);

  -[CRKASMCourseUpdateProperties usersToRemove](self, "usersToRemove");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUsersToRemove:", v9);

  -[CRKASMCourseUpdateProperties trustedUsersToAdd](self, "trustedUsersToAdd");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTrustedUsersToAdd:", v10);

  -[CRKASMCourseUpdateProperties trustedUsersToRemove](self, "trustedUsersToRemove");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTrustedUsersToRemove:", v11);

  return v4;
}

- (BOOL)areFulfilledByCourse:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;

  v6 = a3;
  -[CRKASMCourseUpdateProperties name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[CRKASMCourseUpdateProperties name](self, "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "isEqualToString:", v4))
    {
      LOBYTE(v8) = 0;
LABEL_36:

      goto LABEL_37;
    }
  }
  -[CRKASMCourseUpdateProperties color](self, "color");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9
    || (-[CRKASMCourseUpdateProperties color](self, "color"),
        v55 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v55, "unsignedIntegerValue"),
        v10 == objc_msgSend(v6, "color")))
  {
    -[CRKASMCourseUpdateProperties mascot](self, "mascot");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[CRKASMCourseUpdateProperties mascot](self, "mascot");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v53, "unsignedIntegerValue");
      if (v12 != objc_msgSend(v6, "mascot"))
      {
        LOBYTE(v8) = 0;
LABEL_32:

LABEL_33:
        if (!v9)
          goto LABEL_35;
        goto LABEL_34;
      }
    }
    -[CRKASMCourseUpdateProperties usersToAdd](self, "usersToAdd");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v54, "count");
    v14 = v13;
    if (v13)
    {
      v15 = v13;
      -[CRKASMCourseUpdateProperties usersToAdd](self, "usersToAdd");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "allObjects");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      __53__CRKASMCourseUpdateProperties_areFulfilledByCourse___block_invoke((uint64_t)v50, v50);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "users");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      __53__CRKASMCourseUpdateProperties_areFulfilledByCourse___block_invoke((uint64_t)v48, v48);
      v49 = v16;
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v16, "isSubsetOfSet:"))
      {
        LOBYTE(v8) = 0;
LABEL_30:

LABEL_31:
        if (!v11)
          goto LABEL_33;
        goto LABEL_32;
      }
      v14 = v15;
    }
    -[CRKASMCourseUpdateProperties usersToRemove](self, "usersToRemove");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v52, "count");
    v18 = v17;
    if (v17)
    {
      v19 = v17;
      -[CRKASMCourseUpdateProperties usersToRemove](self, "usersToRemove");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "allObjects");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      __53__CRKASMCourseUpdateProperties_areFulfilledByCourse___block_invoke((uint64_t)v45, v45);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "users");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      __53__CRKASMCourseUpdateProperties_areFulfilledByCourse___block_invoke((uint64_t)v43, v43);
      v44 = v20;
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v20, "intersectsSet:") & 1) != 0)
      {
        LOBYTE(v8) = 0;
LABEL_28:

LABEL_29:
        if (!v14)
          goto LABEL_31;
        goto LABEL_30;
      }
      v18 = v19;
    }
    -[CRKASMCourseUpdateProperties trustedUsersToAdd](self, "trustedUsersToAdd");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v41, "count");
    if (!v40)
      goto LABEL_22;
    -[CRKASMCourseUpdateProperties trustedUsersToAdd](self, "trustedUsersToAdd");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "allObjects");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    __53__CRKASMCourseUpdateProperties_areFulfilledByCourse___block_invoke((uint64_t)v38, v38);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "trustedUsers");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    __53__CRKASMCourseUpdateProperties_areFulfilledByCourse___block_invoke((uint64_t)v36, v36);
    v37 = v21;
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "isSubsetOfSet:"))
    {
LABEL_22:
      -[CRKASMCourseUpdateProperties trustedUsersToRemove](self, "trustedUsersToRemove");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "count"))
      {
        -[CRKASMCourseUpdateProperties trustedUsersToRemove](self, "trustedUsersToRemove");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "allObjects");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        __53__CRKASMCourseUpdateProperties_areFulfilledByCourse___block_invoke((uint64_t)v30, v30);
        v31 = v22;
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "trustedUsers");
        v34 = v3;
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        __53__CRKASMCourseUpdateProperties_areFulfilledByCourse___block_invoke((uint64_t)v24, v24);
        v33 = v18;
        v25 = v14;
        v26 = v11;
        v27 = v4;
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v23, "intersectsSet:", v28) ^ 1;

        v4 = v27;
        v11 = v26;
        v14 = v25;
        v18 = v33;

        v3 = v34;
      }
      else
      {

        LOBYTE(v8) = 1;
      }
      if (!v40)
      {
LABEL_27:

        if (!v18)
          goto LABEL_29;
        goto LABEL_28;
      }
    }
    else
    {
      LOBYTE(v8) = 0;
    }

    goto LABEL_27;
  }
  LOBYTE(v8) = 0;
LABEL_34:

LABEL_35:
  if (v7)
    goto LABEL_36;
LABEL_37:

  return v8;
}

id __53__CRKASMCourseUpdateProperties_areFulfilledByCourse___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(a2, "crk_mapUsingBlock:", &__block_literal_global_2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __53__CRKASMCourseUpdateProperties_areFulfilledByCourse___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (NSNumber)mascot
{
  return self->_mascot;
}

- (void)setMascot:(id)a3
{
  objc_storeStrong((id *)&self->_mascot, a3);
}

- (void)setUsersToAdd:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setUsersToRemove:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setTrustedUsersToAdd:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setTrustedUsersToRemove:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trustedUsersToRemove, 0);
  objc_storeStrong((id *)&self->_trustedUsersToAdd, 0);
  objc_storeStrong((id *)&self->_usersToRemove, 0);
  objc_storeStrong((id *)&self->_usersToAdd, 0);
  objc_storeStrong((id *)&self->_mascot, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
