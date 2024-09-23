@implementation CRAccNavInfo

- (CRAccNavInfo)initWithComponent:(id)a3 accNavInfo:(id)a4
{
  id v6;
  id v7;
  CRAccNavInfo *v8;
  uint64_t v9;
  CRAccNavComponent *component;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRAccNavInfo;
  v8 = -[CRAccNavInfo init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    component = v8->_component;
    v8->_component = (CRAccNavComponent *)v9;

    objc_storeStrong((id *)&v8->_accNavInfo, a4);
  }

  return v8;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[CRAccNavInfo component](self, "component");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRAccNavInfo accNavInfo](self, "accNavInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cr_dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> component=%@ accNavInfo={\n%@\n}"), v4, self, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)valueForInfoType:(unsigned __int16)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = a3;
  -[CRAccNavInfo accNavInfo](self, "accNavInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copyInfo:", v3);

  return v5;
}

- (unsigned)uint8ForInfoType:(unsigned __int16)a3
{
  uint64_t v3;
  id v5;
  id v6;
  unsigned __int8 v7;

  v3 = a3;
  objc_opt_class();
  -[CRAccNavInfo valueForInfoType:](self, "valueForInfoType:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  v7 = objc_msgSend(v6, "unsignedCharValue");
  return v7;
}

- (unsigned)uint16ForInfoType:(unsigned __int16)a3
{
  uint64_t v3;
  id v5;
  id v6;
  unsigned __int16 v7;

  v3 = a3;
  objc_opt_class();
  -[CRAccNavInfo valueForInfoType:](self, "valueForInfoType:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  v7 = objc_msgSend(v6, "unsignedShortValue");
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[CRAccNavInfo component](self, "component");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_component);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[CRAccNavInfo accNavInfo](self, "accNavInfo");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cr_dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_accNavInfo);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

}

- (CRAccNavInfo)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  CRAccNavInfo *v17;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_component);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDBCF20];
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, v10, v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_accNavInfo);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "ACCNavigationInfoClass");
  v15 = (void *)objc_opt_new();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __30__CRAccNavInfo_initWithCoder___block_invoke;
  v19[3] = &unk_250963AE8;
  v20 = v15;
  v16 = v15;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v19);
  v17 = (CRAccNavInfo *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithComponent:accNavInfo:", v7, v16);

  return v17;
}

void __30__CRAccNavInfo_initWithCoder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "cr_setInfo:data:", objc_msgSend(a2, "unsignedShortValue"), v5);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRAccNavComponent)component
{
  return self->_component;
}

- (ACCNavigationInfo)accNavInfo
{
  return self->_accNavInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accNavInfo, 0);
  objc_storeStrong((id *)&self->_component, 0);
}

@end
