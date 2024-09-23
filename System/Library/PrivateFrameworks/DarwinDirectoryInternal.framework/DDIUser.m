@implementation DDIUser

+ (id)userWithUUID:(id)a3 uid:(unsigned int)a4 name:(id)a5 primaryGroupUUID:(id)a6 fullName:(id)a7 homeDirectory:(id)a8 shell:(id)a9 memberships:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id *v23;

  v16 = a10;
  v17 = a9;
  v18 = a8;
  v19 = a7;
  v20 = a6;
  v21 = a5;
  v22 = a3;
  v23 = -[DDIUser initWithUUID:uid:name:primaryGroupUUID:fullName:homeDirectory:shell:memberships:]((id *)[DDIUser alloc], v22, a4, v21, v20, v19, v18, v17, v16);

  return v23;
}

- (id)initWithUUID:(int)a3 uid:(void *)a4 name:(void *)a5 primaryGroupUUID:(void *)a6 fullName:(void *)a7 homeDirectory:(void *)a8 shell:(void *)a9 memberships:
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  id v33;
  id v35;
  uint64_t v36;
  objc_super v37;
  __int128 v38[5];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v35 = a2;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  if (a1)
  {
    v37.receiver = a1;
    v37.super_class = (Class)DDIUser;
    v23 = (id *)objc_msgSendSuper2(&v37, sel_init);
    if (!v23)
      -[DDIUser initWithUUID:uid:name:primaryGroupUUID:fullName:homeDirectory:shell:memberships:].cold.1(&v36, v38);
    a1 = v23;

    objc_storeStrong(a1 + 2, a2);
    *((_DWORD *)a1 + 2) = a3;
    v24 = objc_msgSend(v17, "copy");
    v25 = a1[3];
    a1[3] = (id)v24;

    objc_storeStrong(a1 + 4, a5);
    v26 = objc_msgSend(v19, "copy");
    v27 = a1[5];
    a1[5] = (id)v26;

    v28 = objc_msgSend(v20, "copy");
    v29 = a1[6];
    a1[6] = (id)v28;

    v30 = objc_msgSend(v21, "copy");
    v31 = a1[7];
    a1[7] = (id)v30;

    v32 = objc_msgSend(v22, "mutableCopy");
    v33 = a1[8];
    a1[8] = (id)v32;

  }
  return a1;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (unsigned)uid
{
  return self->_uid;
}

- (void)setUid:(unsigned int)a3
{
  self->_uid = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSUUID)primaryGroupUUID
{
  return self->_primaryGroupUUID;
}

- (void)setPrimaryGroupUUID:(id)a3
{
  objc_storeStrong((id *)&self->_primaryGroupUUID, a3);
}

- (NSString)fullName
{
  return self->_fullName;
}

- (void)setFullName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)homeDirectory
{
  return self->_homeDirectory;
}

- (void)setHomeDirectory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)shell
{
  return self->_shell;
}

- (void)setShell:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSMutableSet)memberships
{
  return self->_memberships;
}

- (void)setMemberships:(id)a3
{
  objc_storeStrong((id *)&self->_memberships, a3);
}

- (NSMutableSet)aliases
{
  return self->_aliases;
}

- (void)setAliases:(id)a3
{
  objc_storeStrong((id *)&self->_aliases, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aliases, 0);
  objc_storeStrong((id *)&self->_memberships, 0);
  objc_storeStrong((id *)&self->_shell, 0);
  objc_storeStrong((id *)&self->_homeDirectory, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_primaryGroupUUID, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)initWithUUID:(_QWORD *)a1 uid:(_OWORD *)a2 name:primaryGroupUUID:fullName:homeDirectory:shell:memberships:.cold.1(_QWORD *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  __break(1u);
  sub_23A232E5C();
}

@end
