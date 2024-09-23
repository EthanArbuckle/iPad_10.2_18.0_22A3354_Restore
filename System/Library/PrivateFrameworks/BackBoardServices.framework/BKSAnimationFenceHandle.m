@implementation BKSAnimationFenceHandle

- (id)CAFenceHandle
{
  return self->_caFence;
}

- (BOOL)isUsable
{
  return -[CAFenceHandle isUsable](self->_caFence, "isUsable");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_caFence, 0);
}

- (void)invalidate
{
  -[CAFenceHandle invalidate](self->_caFence, "invalidate");
}

- (void)dealloc
{
  objc_super v3;

  -[CAFenceHandle invalidate](self->_caFence, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)BKSAnimationFenceHandle;
  -[BKSAnimationFenceHandle dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<BKSAnimationFenceHandle:%p -> %@>"), self, self->_caFence);
}

- (BKSAnimationFenceHandle)initWithBSXPCCoder:(id)a3
{
  void *v4;
  void *v5;
  BKSAnimationFenceHandle *v6;

  objc_msgSend(a3, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C812F8], CFSTR("f"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getCAFenceHandleClass(), "handleFromXPCRepresentation:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[BKSAnimationFenceHandle _initWithCAFenceHandle:](self, "_initWithCAFenceHandle:", v5);

  return v6;
}

- (BKSAnimationFenceHandle)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  BKSAnimationFenceHandle *v6;

  v4 = a3;
  getCAFenceHandleClass();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("f"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[BKSAnimationFenceHandle _initWithCAFenceHandle:](self, "_initWithCAFenceHandle:", v5);
  return v6;
}

+ (id)newFenceHandleForCAFenceHandle:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[BKSAnimationFenceHandle _initWithCAFenceHandle:]([BKSAnimationFenceHandle alloc], "_initWithCAFenceHandle:", v3);

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BKSAnimationFenceHandle *v5;
  void *v6;
  id v7;

  v5 = [BKSAnimationFenceHandle alloc];
  v6 = (void *)-[CAFenceHandle copyWithZone:](self->_caFence, "copyWithZone:", a3);
  v7 = -[BKSAnimationFenceHandle _initWithCAFenceHandle:](v5, "_initWithCAFenceHandle:", v6);

  return v7;
}

- (id)_initWithCAFenceHandle:(id)a3
{
  id v5;
  BKSAnimationFenceHandle *v6;
  BKSAnimationFenceHandle *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKSAnimationFenceHandle;
  v6 = -[BKSAnimationFenceHandle init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_caFence, a3);

  return v7;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_caFence, CFSTR("f"));
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)-[CAFenceHandle createXPCRepresentation](self->_caFence, "createXPCRepresentation");
  if (v4)
    objc_msgSend(v5, "encodeXPCObject:forKey:", v4, CFSTR("f"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BKSAnimationFenceHandle)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BKSAnimationFence.m"), 27, CFSTR("you can't instantiate %@ directly"), objc_opt_class());

  return 0;
}

- (unint64_t)fenceName
{
  return 0;
}

- (unsigned)CAPort
{
  CAFenceHandle *caFence;
  unsigned int v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  caFence = self->_caFence;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__BKSAnimationFenceHandle_CAPort__block_invoke;
  v5[3] = &unk_1E1EA0BC0;
  v5[4] = &v6;
  -[CAFenceHandle accessMachPort:](caFence, "accessMachPort:", v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BKSAnimationFenceHandle)initWithXPCDictionary:(id)a3
{
  id v4;
  id CAFenceHandleClass;
  void *v6;
  void *v7;
  BKSAnimationFenceHandle *v8;

  v4 = a3;
  CAFenceHandleClass = getCAFenceHandleClass();
  if (v4)
  {
    xpc_dictionary_get_value(v4, "f");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(CAFenceHandleClass, "handleFromXPCRepresentation:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[BKSAnimationFenceHandle _initWithCAFenceHandle:](self, "_initWithCAFenceHandle:", v7);

  if (v4)
  return v8;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4;
  void *v5;
  xpc_object_t xdict;

  v4 = a3;
  if (v4)
  {
    xdict = v4;
    v5 = (void *)-[CAFenceHandle createXPCRepresentation](self->_caFence, "createXPCRepresentation");
    if (v5)
      xpc_dictionary_set_value(xdict, "f", v5);

    v4 = xdict;
  }

}

uint64_t __33__BKSAnimationFenceHandle_CAPort__block_invoke(uint64_t result, int a2, char a3)
{
  if ((a3 & 1) == 0)
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

+ (id)newFenceHandleForContext:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("BKSAnimationFence.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

  }
  v6 = (void *)objc_msgSend(getCAFenceHandleClass(), "newFenceFromDefaultServer");
  objc_msgSend(v5, "addFence:", v6);
  v7 = +[BKSAnimationFenceHandle newFenceHandleForCAFenceHandle:](BKSAnimationFenceHandle, "newFenceHandleForCAFenceHandle:", v6);

  return v7;
}

@end
