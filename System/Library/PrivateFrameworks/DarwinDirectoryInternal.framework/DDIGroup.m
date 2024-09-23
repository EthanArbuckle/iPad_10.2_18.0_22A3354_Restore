@implementation DDIGroup

+ (id)groupWithUUID:(id)a3 gid:(unsigned int)a4 name:(id)a5 fullName:(id)a6
{
  id v9;
  id v10;
  id v11;
  id *v12;

  v9 = a6;
  v10 = a5;
  v11 = a3;
  v12 = -[DDIGroup initWithUUID:gid:name:fullName:]((id *)[DDIGroup alloc], v11, a4, v10, v9);

  return v12;
}

- (id)initWithUUID:(int)a3 gid:(void *)a4 name:(void *)a5 fullName:
{
  id v10;
  id v11;
  id v12;
  id *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v21;
  objc_super v22;
  __int128 v23[5];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v10 = a2;
  v11 = a4;
  v12 = a5;
  if (a1)
  {
    v22.receiver = a1;
    v22.super_class = (Class)DDIGroup;
    v13 = (id *)objc_msgSendSuper2(&v22, sel_init);
    if (!v13)
      -[DDIUser initWithUUID:uid:name:primaryGroupUUID:fullName:homeDirectory:shell:memberships:].cold.1(&v21, v23);
    a1 = v13;

    objc_storeStrong(a1 + 2, a2);
    *((_DWORD *)a1 + 2) = a3;
    v14 = objc_msgSend(v11, "copy");
    v15 = a1[3];
    a1[3] = (id)v14;

    v16 = objc_msgSend(v12, "copy");
    v17 = a1[4];
    a1[4] = (id)v16;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = a1[5];
    a1[5] = (id)v18;

  }
  return a1;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (unsigned)gid
{
  return self->_gid;
}

- (void)setGid:(unsigned int)a3
{
  self->_gid = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)fullName
{
  return self->_fullName;
}

- (void)setFullName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSMutableSet)nestedGroups
{
  return self->_nestedGroups;
}

- (void)setNestedGroups:(id)a3
{
  objc_storeStrong((id *)&self->_nestedGroups, a3);
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
  objc_storeStrong((id *)&self->_nestedGroups, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
