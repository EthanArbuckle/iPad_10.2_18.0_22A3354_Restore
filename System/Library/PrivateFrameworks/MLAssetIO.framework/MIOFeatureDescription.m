@implementation MIOFeatureDescription

- (MIOFeatureDescription)initWithSpecification:(const void *)a3
{
  MIOFeatureDescription *v4;
  MIOFeatureDescription *v5;
  uint64_t *type;
  MIOImageConstraint *v7;
  uint64_t v8;
  MIODictionaryConstraint *v9;
  MIOFeatureValueConstraint *constraint;
  void **ptr;
  uint64_t v12;
  NSString *cachedName;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MIOFeatureDescription;
  v4 = -[MIOFeatureDescription init](&v15, sel_init);
  v5 = v4;
  if (v4)
  {
    CoreML::Specification::FeatureDescription::CopyFrom((CoreML::Specification::FeatureDescription *)&v4->_featureDescriptionParams, (const CoreML::Specification::FeatureDescription *)a3);
    type = &CoreML::Specification::_FeatureType_default_instance_;
    if (v5->_featureDescriptionParams.type_)
      type = (uint64_t *)v5->_featureDescriptionParams.type_;
    switch(*((_DWORD *)type + 9))
    {
      case 4:
        v7 = -[MIOImageConstraint initWithSpecification:]([MIOImageConstraint alloc], "initWithSpecification:", type[3]);
        break;
      case 5:
        v7 = -[MIOMultiArrayConstraint initWithSpecification:]([MIOMultiArrayConstraint alloc], "initWithSpecification:", type[3]);
        break;
      case 6:
        v8 = type[3];
        v9 = [MIODictionaryConstraint alloc];
        goto LABEL_11;
      case 7:
        v7 = -[MIOSequenceConstraint initWithSpecification:]([MIOSequenceConstraint alloc], "initWithSpecification:", type[3]);
        break;
      case 8:
        v8 = type[3];
        v9 = [MIOStateConstraint alloc];
LABEL_11:
        v7 = -[MIODictionaryConstraint initWithSpecification:](v9, "initWithSpecification:", v8);
        break;
      default:
        v7 = 0;
        break;
    }
    constraint = v5->_constraint;
    v5->_constraint = (MIOFeatureValueConstraint *)v7;

    ptr = (void **)v5->_featureDescriptionParams.name_.ptr_;
    if (*((char *)ptr + 23) < 0)
      ptr = (void **)*ptr;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", ptr);
    v12 = objc_claimAutoreleasedReturnValue();
    cachedName = v5->_cachedName;
    v5->_cachedName = (NSString *)v12;

  }
  return v5;
}

- (const)featureDescriptionSpecification
{
  return &self->_featureDescriptionParams;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[MIOFeatureDescription initWithSpecification:]([MIOMutableFeatureDescription alloc], "initWithSpecification:", &self->_featureDescriptionParams);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  const char *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MIOFeatureDescription name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MIOFeatureTypeToString(-[MIOFeatureDescription type](self, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MIOFeatureDescription optional](self, "optional"))
    v6 = "YES";
  else
    v6 = "NO";
  -[MIOFeatureDescription constraint](self, "constraint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIOFeatureDescription shortDescription](self, "shortDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("MIOFeatureDescription (%@) {type: %@, optional: %s, constraint: %@, shortDescription: %@}"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  MIOFeatureDescription *v4;
  MIOFeatureDescription *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  int64_t v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  BOOL v19;
  void *v20;
  void *v21;

  v4 = (MIOFeatureDescription *)a3;
  if (self == v4)
  {
    v19 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MIOFeatureDescription name](self, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIOFeatureDescription name](v5, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqual:", v7);

      if ((v8 & 1) != 0)
      {
        -[MIOFeatureDescription shortDescription](self, "shortDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[MIOFeatureDescription shortDescription](v5, "shortDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

        if ((v11 & 1) != 0)
        {
          v12 = -[MIOFeatureDescription type](self, "type");
          if (v12 == -[MIOFeatureDescription type](v5, "type"))
          {
            v13 = -[MIOFeatureDescription optional](self, "optional");
            if (v13 == -[MIOFeatureDescription optional](v5, "optional"))
            {
              -[MIOFeatureDescription constraint](self, "constraint");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              if (v14
                && (-[MIOFeatureDescription constraint](v5, "constraint"),
                    v15 = (void *)objc_claimAutoreleasedReturnValue(),
                    v15,
                    v14,
                    v15))
              {
                -[MIOFeatureDescription constraint](self, "constraint");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                -[MIOFeatureDescription constraint](v5, "constraint");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = objc_msgSend(v16, "isEqual:", v17);

                if ((v18 & 1) != 0)
                  goto LABEL_19;
              }
              else
              {
                -[MIOFeatureDescription constraint](self, "constraint");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                if (v20)
                {

                }
                else
                {
                  -[MIOFeatureDescription constraint](v5, "constraint");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v21)
                  {
LABEL_19:
                    v19 = 1;
                    goto LABEL_17;
                  }
                }
              }
            }
          }
        }
      }
      v19 = 0;
LABEL_17:

      goto LABEL_18;
    }
    v19 = 0;
  }
LABEL_18:

  return v19;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  _BOOL4 v6;
  void *v7;
  unint64_t v8;

  -[MIOFeatureDescription name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[MIOFeatureDescription type](self, "type");
  v6 = -[MIOFeatureDescription optional](self, "optional");
  -[MIOFeatureDescription constraint](self, "constraint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5 ^ v4 ^ v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (NSString)name
{
  return self->_cachedName;
}

- (NSString)shortDescription
{
  void **ptr;

  ptr = (void **)self->_featureDescriptionParams.shortdescription_.ptr_;
  if (*((char *)ptr + 23) < 0)
    ptr = (void **)*ptr;
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", ptr);
}

- (void)setShortDescription:(id)a3
{
  id v4;

  v4 = objc_retainAutorelease(a3);
  CoreML::Specification::FeatureDescription::set_shortdescription((CoreML::Specification::FeatureDescription *)&self->_featureDescriptionParams, (char *)objc_msgSend(v4, "UTF8String"));

}

- (int64_t)type
{
  FeatureType *type;

  type = self->_featureDescriptionParams.type_;
  if (!type)
    type = (FeatureType *)&CoreML::Specification::_FeatureType_default_instance_;
  return *((unsigned int *)type + 9);
}

- (BOOL)optional
{
  FeatureType *type;

  type = self->_featureDescriptionParams.type_;
  if (!type)
    type = (FeatureType *)&CoreML::Specification::_FeatureType_default_instance_;
  return *((_BYTE *)type + 16);
}

- (MIOFeatureValueConstraint)constraint
{
  return self->_constraint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraint, 0);
  objc_storeStrong((id *)&self->_cachedName, 0);
  CoreML::Specification::FeatureDescription::~FeatureDescription((CoreML::Specification::FeatureDescription *)&self->_featureDescriptionParams);
}

- (id).cxx_construct
{
  CoreML::Specification::FeatureDescription::FeatureDescription((CoreML::Specification::FeatureDescription *)&self->_featureDescriptionParams);
  return self;
}

- (id)featureTypeStringForModelViewer
{
  FeatureType *type;
  std::string *p_p;
  void *v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  std::string __p;
  _BYTE v10[8];
  std::__shared_weak_count *v11;

  if (self->_featureDescriptionParams.type_)
    type = self->_featureDescriptionParams.type_;
  else
    type = (FeatureType *)&CoreML::Specification::_FeatureType_default_instance_;
  CoreML::FeatureType::FeatureType((CoreML::FeatureType *)v10, (const CoreML::Specification::FeatureType *)type);
  CoreML::FeatureType::toString((CoreML::FeatureType *)v10, &__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", p_p);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v5 = v11;
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v7 = __ldaxr(p_shared_owners);
    while (__stlxr(v7 - 1, p_shared_owners));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  return v4;
}

- (id)featureTypeDictionaryForModelViewer
{
  FeatureType *type;
  void *v3;
  _QWORD **v4;
  _QWORD *v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  _QWORD *v9;
  _QWORD **v10;
  BOOL v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  _QWORD **v16;
  _QWORD *v17[2];
  _BYTE v18[8];
  std::__shared_weak_count *v19;

  if (self->_featureDescriptionParams.type_)
    type = self->_featureDescriptionParams.type_;
  else
    type = (FeatureType *)&CoreML::Specification::_FeatureType_default_instance_;
  CoreML::FeatureType::FeatureType((CoreML::FeatureType *)v18, (const CoreML::Specification::FeatureType *)type);
  CoreML::FeatureType::toDictionary((CoreML::FeatureType *)v18, (uint64_t)&v16);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v17[1]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v16;
  if (v16 != v17)
  {
    do
    {
      v5 = v4 + 7;
      if (*((char *)v4 + 79) < 0)
        v5 = (_QWORD *)*v5;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v4 + 4;
      if (*((char *)v4 + 55) < 0)
        v7 = (_QWORD *)*v7;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, v8);

      v9 = v4[1];
      if (v9)
      {
        do
        {
          v10 = (_QWORD **)v9;
          v9 = (_QWORD *)*v9;
        }
        while (v9);
      }
      else
      {
        do
        {
          v10 = (_QWORD **)v4[2];
          v11 = *v10 == v4;
          v4 = v10;
        }
        while (!v11);
      }
      v4 = v10;
    }
    while (v10 != v17);
  }
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)&v16, v17[0]);
  v12 = v19;
  if (v19)
  {
    p_shared_owners = (unint64_t *)&v19->__shared_owners_;
    do
      v14 = __ldaxr(p_shared_owners);
    while (__stlxr(v14 - 1, p_shared_owners));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  return v3;
}

@end
