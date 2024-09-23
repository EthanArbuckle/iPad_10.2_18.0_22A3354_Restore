@implementation ADArgumentParserPositionalArgument

- (ADArgumentParserPositionalArgument)initWithName:(SEL)a3 description:(id)a4 type:(unint64_t)a5 conversionDictionary:(id)a6
{
  id v11;
  id v12;
  ADArgumentParserPositionalArgument *v13;
  uint64_t v14;
  NSString *name;
  objc_super v17;

  v11 = a4;
  v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)ADArgumentParserPositionalArgument;
  v13 = -[ADArgumentParserPositionalArgument init](&v17, sel_init);
  if (v13)
  {
    NSStringFromSelector(a3);
    v14 = objc_claimAutoreleasedReturnValue();
    name = v13->_name;
    v13->_name = (NSString *)v14;

    objc_storeStrong((id *)&v13->_descriptionString, a4);
    v13->_type = a5;
    objc_storeStrong((id *)&v13->_conversionDictionary, a6);
  }

  return v13;
}

- (id)legalValuesString
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADArgumentParserPositionalArgument conversionDictionary](self, "conversionDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    && (-[ADArgumentParserPositionalArgument conversionDictionary](self, "conversionDictionary"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "count"),
        v5,
        v4,
        v6))
  {
    objc_msgSend(v3, "appendString:", CFSTR(" ("));
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[ADArgumentParserPositionalArgument conversionDictionary](self, "conversionDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v8);
          objc_msgSend(v3, "appendFormat:", CFSTR("%@|"), *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11++));
        }
        while (v9 != v11);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "deleteCharactersInRange:", objc_msgSend(v3, "length") - 1, 1);
    objc_msgSend(v3, "appendString:", CFSTR(")"));
    v12 = v3;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)shortUsage
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = -[ADArgumentParserPositionalArgument type](self, "type") - 5;
  v4 = (void *)MEMORY[0x24BDD17C8];
  -[ADArgumentParserPositionalArgument name](self, "name");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v3 > 2)
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@>"), v5);
  else
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@...>"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)fullUsage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADArgumentParserPositionalArgument name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "rightPaddToLength:", 45);
  -[ADArgumentParserPositionalArgument descriptionString](self, "descriptionString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@%@"), v5, v6);

  -[ADArgumentParserPositionalArgument legalValuesString](self, "legalValuesString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[ADArgumentParserPositionalArgument legalValuesString](self, "legalValuesString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v8);

  }
  return v3;
}

- (BOOL)setPropertyFromMap:()map<std:()docopt:()std:(std:(docopt:(id)a4 :value>>> *)a3 :allocator<std::pair<const)std::string :less<std::string> :value :string toCommand:
{
  id v6;
  void *v7;
  NSString *name;
  unint64_t type;
  char v10;
  int v12;
  std::string __p;
  uint64_t *v14[3];
  int v15;
  std::string v16;
  std::string *p_p;

  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@>"), self->_name);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  std::map<std::string,docopt::value>::map[abi:ne180100](v14, a3);
  getDocoptValueFromMap(v7, (uint64_t)v14, &v15);
  std::__tree<std::__value_type<std::string,docopt::value>,std::__map_value_compare<std::string,std::__value_type<std::string,docopt::value>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,docopt::value>>>::destroy(v14[1]);

  name = self->_name;
  type = self->_type;
  v12 = v15;
  switch(v15)
  {
    case 1:
      __p.__r_.__value_.__s.__data_[0] = v16.__r_.__value_.__s.__data_[0];
      break;
    case 2:
      __p.__r_.__value_.__r.__words[0] = v16.__r_.__value_.__r.__words[0];
      break;
    case 3:
      if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0)
        std::string::__init_copy_ctor_external(&__p, v16.__r_.__value_.__l.__data_, v16.__r_.__value_.__l.__size_);
      else
        __p = v16;
      break;
    case 4:
      memset(&__p, 0, sizeof(__p));
      std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&__p, (__int128 *)v16.__r_.__value_.__l.__data_, (__int128 *)v16.__r_.__value_.__l.__size_, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v16.__r_.__value_.__l.__size_ - v16.__r_.__value_.__r.__words[0]) >> 3));
      break;
    default:
      break;
  }
  v10 = setProperty(v6, name, type, (uint64_t)&v12, self->_conversionDictionary);
  if (v12 == 4)
  {
    p_p = &__p;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_p);
  }
  else if (v12 == 3 && SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (v15 == 4)
  {
    p_p = &v16;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_p);
  }
  else if (v15 == 3 && SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v16.__r_.__value_.__l.__data_);
  }

  return v10;
}

- (NSString)name
{
  return self->_name;
}

- (id)value
{
  return self->_value;
}

- (NSString)descriptionString
{
  return self->_descriptionString;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSDictionary)conversionDictionary
{
  return self->_conversionDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversionDictionary, 0);
  objc_storeStrong((id *)&self->_descriptionString, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)enumArgument:(SEL)a3 description:(id)a4 conversionDictionary:(id)a5
{
  id v7;
  id v8;
  ADArgumentParserPositionalArgument *v9;

  v7 = a4;
  v8 = a5;
  v9 = -[ADArgumentParserPositionalArgument initWithName:description:type:conversionDictionary:]([ADArgumentParserPositionalArgument alloc], "initWithName:description:type:conversionDictionary:", a3, v7, 0, v8);

  return v9;
}

+ (id)stringArgument:(SEL)a3 description:(id)a4
{
  id v5;
  ADArgumentParserPositionalArgument *v6;

  v5 = a4;
  v6 = -[ADArgumentParserPositionalArgument initWithName:description:type:conversionDictionary:]([ADArgumentParserPositionalArgument alloc], "initWithName:description:type:conversionDictionary:", a3, v5, 4, 0);

  return v6;
}

+ (id)integerArgument:(SEL)a3 description:(id)a4
{
  id v5;
  ADArgumentParserPositionalArgument *v6;

  v5 = a4;
  v6 = -[ADArgumentParserPositionalArgument initWithName:description:type:conversionDictionary:]([ADArgumentParserPositionalArgument alloc], "initWithName:description:type:conversionDictionary:", a3, v5, 2, 0);

  return v6;
}

+ (id)floatArgument:(SEL)a3 description:(id)a4
{
  id v5;
  ADArgumentParserPositionalArgument *v6;

  v5 = a4;
  v6 = -[ADArgumentParserPositionalArgument initWithName:description:type:conversionDictionary:]([ADArgumentParserPositionalArgument alloc], "initWithName:description:type:conversionDictionary:", a3, v5, 3, 0);

  return v6;
}

@end
