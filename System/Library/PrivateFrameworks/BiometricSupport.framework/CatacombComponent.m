@implementation CatacombComponent

+ (id)masterComponent
{
  return +[CatacombComponent componentForUserID:](CatacombComponent, "componentForUserID:", 0xFFFFFFFFLL);
}

+ (id)componentForUserID:(unsigned int)a3
{
  CatacombComponent *v4;

  v4 = objc_alloc_init(CatacombComponent);
  if (v4)
  {
    v4->_component.userID = a3;
    v4->_component.group.type = 0;
  }
  return v4;
}

- ($EA2F7D24101002CF4BECDFD08DC3BA5A)component
{
  return ($EA2F7D24101002CF4BECDFD08DC3BA5A *)&self->_component;
}

- (unsigned)userID
{
  return self->_component.userID;
}

- (BOOL)isEqualToComponent:(id)a3
{
  _QWORD *v4;

  if (!a3)
    return 0;
  v4 = (_QWORD *)objc_msgSend(a3, "component");
  return *(_QWORD *)&self->_component.userID == *v4
      && *(_QWORD *)self->_component.group.uuid == v4[1]
      && *(_QWORD *)&self->_component.group.uuid[8] == v4[2];
}

- (BOOL)isMasterComponent
{
  return self->_component.userID == -1;
}

- (BOOL)isUserComponent
{
  return self->_component.userID != -1 && self->_component.group.type == 0;
}

- (id)description
{
  unsigned int type;
  void *v4;
  objc_class *v5;
  uint64_t v6;
  void *v7;
  uint64_t userID;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  uint64_t v16;

  if (self->_component.userID == -1)
  {
    v13 = (void *)MEMORY[0x24BDD17C8];
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("<%@: %p:(Master)>"), v7, self, v16);
LABEL_6:
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  type = self->_component.group.type;
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  userID = self->_component.userID;
  if (!type)
  {
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p:(User userID:%u)>"), v6, self, userID);
    goto LABEL_6;
  }
  v9 = self->_component.group.type;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", self->_component.group.uuid);
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p:(Group userID:%u, type:%u, uuid:%@)>"), v7, self, userID, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int128 v5;

  result = objc_alloc_init(CatacombComponent);
  if (result)
  {
    v5 = *(_OWORD *)&self->_component.userID;
    *((_QWORD *)result + 3) = *(_QWORD *)&self->_component.group.uuid[8];
    *(_OWORD *)((char *)result + 8) = v5;
  }
  return result;
}

- (unint64_t)hash
{
  return self->_component.userID;
}

- (BOOL)isEqual:(id)a3
{
  CatacombComponent *v4;
  BOOL v5;

  v4 = (CatacombComponent *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[CatacombComponent isEqualToComponent:](self, "isEqualToComponent:", v4);
  }

  return v5;
}

+ (id)component:(id *)a3
{
  CatacombComponent *v4;
  __int128 v5;

  if (!a3)
    return 0;
  v4 = objc_alloc_init(CatacombComponent);
  if (v4)
  {
    v5 = *(_OWORD *)&a3->var0;
    *(_QWORD *)&v4->_component.group.uuid[8] = *(_QWORD *)&a3->var1.var1[8];
    *(_OWORD *)&v4->_component.userID = v5;
  }
  return v4;
}

- ($7287BE6C16BD8CBBAFC45DEB4D81687E)group
{
  return ($7287BE6C16BD8CBBAFC45DEB4D81687E *)&self->_component.group;
}

- (BOOL)isGroupComponent
{
  return self->_component.userID != -1 && self->_component.group.type != 0;
}

@end
