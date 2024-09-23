@implementation MTLFunctionConstantValuesInternal

- (void)setConstantValue:(const void *)a3 type:(unint64_t)a4 withName:(id)a5
{
  MTLConstantStorage::setConstantData((uint64_t **)self->_constantStorage, (char *)objc_msgSend(a5, "UTF8String"), a4, a3);
}

- (void)serializedConstantDataForFunction:(id)a3 dataSize:(unint64_t *)a4 errorMessage:(id *)a5
{
  return MTLConstantStorage::serializedConstantDataForFunction((MTLConstantStorage *)self->_constantStorage, (_MTLFunction *)a3, a4, (NSString **)a5);
}

- (id)newConstantScriptForFunction:(id)a3 name:(id)a4 specializedName:(id)a5 errorMessage:(id *)a6
{
  return MTLConstantStorage::constantAirScriptForFunction((MTLConstantStorage *)self->_constantStorage, (_MTLFunction *)a3, (NSString *)a4, (NSString *)a5, (NSString **)a6);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  MTLConstantStorage *v7;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (_QWORD *)v4;
  if (v4)
  {
    v6 = *(_QWORD *)(v4 + 8);
    if (v6)
    {
      std::__tree<std::__value_type<unsigned short,MTLConstantStorage::ConstantData>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,MTLConstantStorage::ConstantData>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,MTLConstantStorage::ConstantData>>>::destroy(v6 + 24, *(_QWORD **)(v6 + 32));
      std::__tree<std::__value_type<std::string,MTLConstantStorage::ConstantData>,std::__map_value_compare<std::string,std::__value_type<std::string,MTLConstantStorage::ConstantData>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,MTLConstantStorage::ConstantData>>>::destroy(v6, *(_QWORD **)(v6 + 8));
      MEMORY[0x186DABFBC](v6, 0x1020C404C310C12);
    }
    v7 = (MTLConstantStorage *)operator new();
    MTLConstantStorage::MTLConstantStorage(v7, (const void ***)self->_constantStorage);
    v5[1] = v7;
  }
  return v5;
}

- (MTLFunctionConstantValuesInternal)init
{
  MTLFunctionConstantValuesInternal *v2;
  _QWORD *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTLFunctionConstantValuesInternal;
  v2 = -[MTLFunctionConstantValuesInternal init](&v5, sel_init);
  if (v2)
  {
    v3 = (_QWORD *)operator new();
    v3[1] = 0;
    *v3 = v3 + 1;
    v3[5] = 0;
    v3[4] = 0;
    v3[2] = 0;
    v3[3] = v3 + 4;
    v2->_constantStorage = v3;
  }
  return v2;
}

- (void)dealloc
{
  _QWORD **constantStorage;
  objc_super v4;

  constantStorage = (_QWORD **)self->_constantStorage;
  if (constantStorage)
  {
    std::__tree<std::__value_type<unsigned short,MTLConstantStorage::ConstantData>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,MTLConstantStorage::ConstantData>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,MTLConstantStorage::ConstantData>>>::destroy((uint64_t)(constantStorage + 3), constantStorage[4]);
    std::__tree<std::__value_type<std::string,MTLConstantStorage::ConstantData>,std::__map_value_compare<std::string,std::__value_type<std::string,MTLConstantStorage::ConstantData>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,MTLConstantStorage::ConstantData>>>::destroy((uint64_t)constantStorage, constantStorage[1]);
    MEMORY[0x186DABFBC](constantStorage, 0x1020C404C310C12);
  }
  v4.receiver = self;
  v4.super_class = (Class)MTLFunctionConstantValuesInternal;
  -[MTLFunctionConstantValuesInternal dealloc](&v4, sel_dealloc);
}

- (void)reset
{
  _QWORD **constantStorage;
  _QWORD *v4;

  constantStorage = (_QWORD **)self->_constantStorage;
  if (constantStorage)
  {
    std::__tree<std::__value_type<unsigned short,MTLConstantStorage::ConstantData>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,MTLConstantStorage::ConstantData>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,MTLConstantStorage::ConstantData>>>::destroy((uint64_t)(constantStorage + 3), constantStorage[4]);
    std::__tree<std::__value_type<std::string,MTLConstantStorage::ConstantData>,std::__map_value_compare<std::string,std::__value_type<std::string,MTLConstantStorage::ConstantData>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,MTLConstantStorage::ConstantData>>>::destroy((uint64_t)constantStorage, constantStorage[1]);
    MEMORY[0x186DABFBC](constantStorage, 0x1020C404C310C12);
  }
  v4 = (_QWORD *)operator new();
  v4[1] = 0;
  *v4 = v4 + 1;
  v4[5] = 0;
  v4[4] = 0;
  v4[2] = 0;
  v4[3] = v4 + 4;
  self->_constantStorage = v4;
}

- (void)setConstantValues:(const void *)a3 type:(unint64_t)a4 withRange:(_NSRange)a5
{
  uint64_t v5;
  uint64_t v6;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v12;
  uint64_t ComponentType;
  uint64_t v14;
  uint64_t **constantStorage;
  size_t v16;
  void *v17;
  uint64_t **v18;
  uint64_t *v19;
  unsigned __int16 v20;
  unsigned __int16 *v21;

  length = a5.length;
  location = a5.location;
  v12 = a5.location + a5.length;
  if (a5.location + a5.length > 0x10000)
    MTLReportFailure(0, "-[MTLFunctionConstantValuesInternal setConstantValues:type:withRange:]", 745, (uint64_t)CFSTR("Constant index (%lu) must be smaller thank %u"), a5.location, a5.length, v5, v6, v12 - 1);
  if (MTLDataTypeGetComponentCount(a4) == 3)
  {
    ComponentType = MTLDataTypeGetComponentType(a4);
    v14 = 4 * _MTLConstantDataSize(ComponentType);
  }
  else
  {
    v14 = _MTLConstantDataSize(a4);
  }
  if (location < v12)
  {
    do
    {
      constantStorage = (uint64_t **)self->_constantStorage;
      v16 = _MTLConstantDataSize(a4);
      v17 = (void *)operator new[]();
      memcpy(v17, a3, v16);
      v20 = location;
      v21 = &v20;
      v18 = std::__tree<std::__value_type<unsigned short,MTLConstantStorage::ConstantData>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,MTLConstantStorage::ConstantData>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,MTLConstantStorage::ConstantData>>>::__emplace_unique_key_args<unsigned short,std::piecewise_construct_t const&,std::tuple<unsigned short &&>,std::tuple<>>(constantStorage + 3, &v20, (uint64_t)&std::piecewise_construct, &v21);
      v19 = v18[6];
      if (v19)
        MEMORY[0x186DABFA4](v19, 0x1000C8077774924);
      v18[6] = (uint64_t *)v17;
      *((_BYTE *)v18 + 40) = a4;
      a3 = (char *)a3 + v14;
      LOWORD(location) = location + 1;
      --length;
    }
    while (length);
  }
}

- (void)setConstantValue:(const void *)a3 type:(unint64_t)a4 atIndex:(unint64_t)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int16 v8;
  uint64_t **constantStorage;
  size_t v13;
  void *v14;
  uint64_t **v15;
  uint64_t *v16;
  unsigned __int16 v17;
  unsigned __int16 *v18;

  v8 = a5;
  if (a5 >= 0x10000)
    MTLReportFailure(0, "-[MTLFunctionConstantValuesInternal setConstantValue:type:atIndex:]", 736, (uint64_t)CFSTR("Constant index (%lu) must be smaller than %u"), a5, v5, v6, v7, a5);
  constantStorage = (uint64_t **)self->_constantStorage;
  v13 = _MTLConstantDataSize(a4);
  v14 = (void *)operator new[]();
  memcpy(v14, a3, v13);
  v17 = v8;
  v18 = &v17;
  v15 = std::__tree<std::__value_type<unsigned short,MTLConstantStorage::ConstantData>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,MTLConstantStorage::ConstantData>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,MTLConstantStorage::ConstantData>>>::__emplace_unique_key_args<unsigned short,std::piecewise_construct_t const&,std::tuple<unsigned short &&>,std::tuple<>>(constantStorage + 3, &v17, (uint64_t)&std::piecewise_construct, &v18);
  v16 = v15[6];
  if (v16)
    MEMORY[0x186DABFA4](v16, 0x1000C8077774924);
  v15[6] = (uint64_t *)v14;
  *((_BYTE *)v15 + 40) = a4;
}

- (unint64_t)hash
{
  return MTLConstantStorage::hashData((MTLConstantStorage *)self->_constantStorage);
}

- (BOOL)isEqual:(id)a3
{
  objc_class *Class;

  if (a3 == self)
    return 1;
  Class = object_getClass(self);
  return Class == object_getClass(a3)
      && MTLConstantStorage::isEqual((_QWORD *)self->_constantStorage, *((unsigned __int8 ***)a3 + 1));
}

- (id)newNamedConstantArray
{
  return MTLConstantStorage::newNamedConstantArray((MTLConstantStorage *)self->_constantStorage);
}

- (id)newIndexedConstantArray
{
  return MTLConstantStorage::newIndexedConstantArray((MTLConstantStorage *)self->_constantStorage);
}

- (id)description
{
  NSArray *v3;
  NSArray *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  objc_super v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v3 = -[MTLFunctionConstantValuesInternal newNamedConstantArray](self, "newNamedConstantArray");
  v4 = -[MTLFunctionConstantValuesInternal newIndexedConstantArray](self, "newIndexedConstantArray");
  v5 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)MTLFunctionConstantValuesInternal;
  v6 = -[MTLFunctionConstantValuesInternal description](&v10, sel_description);
  v11[0] = CFSTR("named constants");
  v7 = arrayDescription(v3);
  v11[1] = CFSTR("index constants");
  v12[0] = v7;
  v12[1] = arrayDescription(v4);
  v8 = (void *)objc_msgSend(v5, "stringWithFormat:", CFSTR("%@\n%@"), v6, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2));

  return v8;
}

- (const)constantValueWithFunctionConstant:(id)a3
{
  const void *result;
  const void *v5;
  uint64_t v6;

  result = MTLConstantStorage::findConstantValue((MTLConstantStorage *)self->_constantStorage, (MTLFunctionConstant *)a3);
  if (result)
  {
    v5 = result;
    v6 = *(unsigned __int8 *)result;
    if (objc_msgSend(a3, "type") == v6)
      return (const void *)*((_QWORD *)v5 + 1);
    else
      return 0;
  }
  return result;
}

@end
