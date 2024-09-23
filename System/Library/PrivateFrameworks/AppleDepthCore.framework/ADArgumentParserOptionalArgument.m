@implementation ADArgumentParserOptionalArgument

- (ADArgumentParserOptionalArgument)initWithName:(SEL)a3 shortName:(char)a4 defaultValue:(id)a5 description:(id)a6 type:(unint64_t)a7 conversionDictionary:(id)a8
{
  id v14;
  id v15;
  id v16;
  ADArgumentParserOptionalArgument *v17;
  uint64_t v18;
  NSString *name;
  objc_super v22;

  v14 = a5;
  v15 = a6;
  v16 = a8;
  v22.receiver = self;
  v22.super_class = (Class)ADArgumentParserOptionalArgument;
  v17 = -[ADArgumentParserOptionalArgument init](&v22, sel_init);
  if (v17)
  {
    NSStringFromSelector(a3);
    v18 = objc_claimAutoreleasedReturnValue();
    name = v17->_name;
    v17->_name = (NSString *)v18;

    v17->_shortName = a4;
    objc_storeStrong(&v17->_value, a5);
    objc_storeStrong((id *)&v17->_descriptionString, a6);
    v17->_type = a7;
    objc_storeStrong((id *)&v17->_conversionDictionary, a8);
  }

  return v17;
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
  -[ADArgumentParserOptionalArgument conversionDictionary](self, "conversionDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    && (-[ADArgumentParserOptionalArgument conversionDictionary](self, "conversionDictionary"),
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
    -[ADArgumentParserOptionalArgument conversionDictionary](self, "conversionDictionary");
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

- (id)defaultValueString
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  if (-[ADArgumentParserOptionalArgument type](self, "type") - 5 > 2)
  {
    if (-[ADArgumentParserOptionalArgument type](self, "type"))
    {
      v10 = (void *)MEMORY[0x24BDD17C8];
      -[ADArgumentParserOptionalArgument value](self, "value");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("%@"), v11);
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      -[ADArgumentParserOptionalArgument conversionDictionary](self, "conversionDictionary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "allKeys");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v26;
        while (2)
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v26 != v15)
              objc_enumerationMutation(v13);
            v17 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v16);
            -[ADArgumentParserOptionalArgument conversionDictionary](self, "conversionDictionary");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "objectForKeyedSubscript:", v17);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[ADArgumentParserOptionalArgument value](self, "value");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v19, "isEqual:", v20);

            if ((v21 & 1) != 0)
            {
              v9 = v17;

              return v9;
            }
            ++v16;
          }
          while (v14 != v16);
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          if (v14)
            continue;
          break;
        }
      }

      v22 = (void *)MEMORY[0x24BDD17C8];
      -[ADArgumentParserOptionalArgument value](self, "value");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringWithFormat:", CFSTR("%@"), v23);
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    -[ADArgumentParserOptionalArgument value](self, "value");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count"))
    {
      objc_msgSend(MEMORY[0x24BDD16A8], "string");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v5 = v3;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      if (v6)
      {
        v7 = *(_QWORD *)v30;
        do
        {
          v8 = 0;
          do
          {
            if (*(_QWORD *)v30 != v7)
              objc_enumerationMutation(v5);
            objc_msgSend(v4, "appendFormat:", CFSTR("%@ "), *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v8++));
          }
          while (v6 != v8);
          v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        }
        while (v6);
      }

      objc_msgSend(v4, "substringToIndex:", objc_msgSend(v4, "length") - 1);
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (id)shortUsage
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  switch(-[ADArgumentParserOptionalArgument type](self, "type"))
  {
    case 0uLL:
      v3 = (void *)MEMORY[0x24BDD17C8];
      -[ADArgumentParserOptionalArgument name](self, "name");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stringWithFormat:", CFSTR("[--%@ <enum>]"), v4);
      v5 = objc_claimAutoreleasedReturnValue();
      break;
    case 1uLL:
      v6 = (void *)MEMORY[0x24BDD17C8];
      -[ADArgumentParserOptionalArgument name](self, "name");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("[--%@]"), v4);
      v5 = objc_claimAutoreleasedReturnValue();
      break;
    case 2uLL:
      v7 = (void *)MEMORY[0x24BDD17C8];
      -[ADArgumentParserOptionalArgument name](self, "name");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("[--%@ <int>]"), v4);
      v5 = objc_claimAutoreleasedReturnValue();
      break;
    case 3uLL:
      v8 = (void *)MEMORY[0x24BDD17C8];
      -[ADArgumentParserOptionalArgument name](self, "name");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("[--%@ <float>]"), v4);
      v5 = objc_claimAutoreleasedReturnValue();
      break;
    case 4uLL:
      v9 = (void *)MEMORY[0x24BDD17C8];
      -[ADArgumentParserOptionalArgument name](self, "name");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("[--%@ <string>]"), v4);
      v5 = objc_claimAutoreleasedReturnValue();
      break;
    case 5uLL:
      v10 = (void *)MEMORY[0x24BDD17C8];
      -[ADArgumentParserOptionalArgument name](self, "name");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("[--%@ <int>]..."), v4);
      v5 = objc_claimAutoreleasedReturnValue();
      break;
    case 6uLL:
      v12 = (void *)MEMORY[0x24BDD17C8];
      -[ADArgumentParserOptionalArgument name](self, "name");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("[--%@ <float>]..."), v4);
      v5 = objc_claimAutoreleasedReturnValue();
      break;
    case 7uLL:
      v11 = (void *)MEMORY[0x24BDD17C8];
      -[ADArgumentParserOptionalArgument name](self, "name");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("[--%@ <string>]..."), v4);
      v5 = objc_claimAutoreleasedReturnValue();
      break;
    default:
      __assert_rtn("-[ADArgumentParserOptionalArgument shortUsage]", "ADArgumentParserOptionalArgument.mm", 114, "0");
  }
  v13 = (void *)v5;

  return v13;
}

- (id)fullUsage
{
  void *v3;
  int v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v13;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ADArgumentParserOptionalArgument shortName](self, "shortName"))
  {
    switch(-[ADArgumentParserOptionalArgument type](self, "type"))
    {
      case 0uLL:
        v4 = -[ADArgumentParserOptionalArgument shortName](self, "shortName");
        v5 = CFSTR("-%c <enum>, ");
        goto LABEL_8;
      case 1uLL:
        v4 = -[ADArgumentParserOptionalArgument shortName](self, "shortName");
        v5 = CFSTR("-%c, ");
        goto LABEL_8;
      case 2uLL:
      case 5uLL:
        v4 = -[ADArgumentParserOptionalArgument shortName](self, "shortName");
        v5 = CFSTR("-%c <int>, ");
        goto LABEL_8;
      case 3uLL:
      case 6uLL:
        v4 = -[ADArgumentParserOptionalArgument shortName](self, "shortName");
        v5 = CFSTR("-%c <float>, ");
        goto LABEL_8;
      case 4uLL:
      case 7uLL:
        v4 = -[ADArgumentParserOptionalArgument shortName](self, "shortName");
        v5 = CFSTR("-%c <string>, ");
LABEL_8:
        objc_msgSend(v3, "appendFormat:", v5, v4);
        break;
      default:
        v13 = 154;
        goto LABEL_22;
    }
  }
  switch(-[ADArgumentParserOptionalArgument type](self, "type"))
  {
    case 0uLL:
      -[ADArgumentParserOptionalArgument name](self, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("--%@ <enum>"), v6);
      goto LABEL_15;
    case 1uLL:
      -[ADArgumentParserOptionalArgument name](self, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("--%@"), v6);
      goto LABEL_15;
    case 2uLL:
    case 5uLL:
      -[ADArgumentParserOptionalArgument name](self, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("--%@ <int>"), v6);
      goto LABEL_15;
    case 3uLL:
    case 6uLL:
      -[ADArgumentParserOptionalArgument name](self, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("--%@ <float>"), v6);
      goto LABEL_15;
    case 4uLL:
    case 7uLL:
      -[ADArgumentParserOptionalArgument name](self, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("--%@ <string>"), v6);
LABEL_15:

      objc_msgSend(v3, "rightPaddToLength:", 45);
      -[ADArgumentParserOptionalArgument descriptionString](self, "descriptionString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendString:", v7);

      -[ADArgumentParserOptionalArgument legalValuesString](self, "legalValuesString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        -[ADArgumentParserOptionalArgument legalValuesString](self, "legalValuesString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v9);

      }
      -[ADArgumentParserOptionalArgument defaultValueString](self, "defaultValueString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        -[ADArgumentParserOptionalArgument defaultValueString](self, "defaultValueString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR(" [default: %@]"), v11);

      }
      return v3;
    default:
      v13 = 179;
      break;
  }
LABEL_22:
  __assert_rtn("-[ADArgumentParserOptionalArgument fullUsage]", "ADArgumentParserOptionalArgument.mm", v13, "0");
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
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("--%@"), self->_name);
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

- (char)shortName
{
  return self->_shortName;
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

+ (id)enumOption:(SEL)a3 shortName:(char)a4 defaultValue:(unint64_t)a5 description:(id)a6 conversionDictionary:(id)a7
{
  uint64_t v9;
  id v11;
  id v12;
  ADArgumentParserOptionalArgument *v13;
  void *v14;
  ADArgumentParserOptionalArgument *v15;

  v9 = a4;
  v11 = a6;
  v12 = a7;
  v13 = [ADArgumentParserOptionalArgument alloc];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[ADArgumentParserOptionalArgument initWithName:shortName:defaultValue:description:type:conversionDictionary:](v13, "initWithName:shortName:defaultValue:description:type:conversionDictionary:", a3, v9, v14, v11, 0, v12);

  return v15;
}

+ (id)BOOLOption:(SEL)a3 shortName:(char)a4 description:(id)a5
{
  uint64_t v5;
  id v7;
  ADArgumentParserOptionalArgument *v8;

  v5 = a4;
  v7 = a5;
  v8 = -[ADArgumentParserOptionalArgument initWithName:shortName:defaultValue:description:type:conversionDictionary:]([ADArgumentParserOptionalArgument alloc], "initWithName:shortName:defaultValue:description:type:conversionDictionary:", a3, v5, CFSTR("false"), v7, 1, 0);

  return v8;
}

+ (id)stringOption:(SEL)a3 shortName:(char)a4 defaultValue:(id)a5 description:(id)a6
{
  uint64_t v7;
  id v9;
  id v10;
  ADArgumentParserOptionalArgument *v11;

  v7 = a4;
  v9 = a5;
  v10 = a6;
  v11 = -[ADArgumentParserOptionalArgument initWithName:shortName:defaultValue:description:type:conversionDictionary:]([ADArgumentParserOptionalArgument alloc], "initWithName:shortName:defaultValue:description:type:conversionDictionary:", a3, v7, v9, v10, 4, 0);

  return v11;
}

+ (id)integerOption:(SEL)a3 shortName:(char)a4 defaultValue:(int64_t)a5 description:(id)a6
{
  uint64_t v7;
  id v9;
  ADArgumentParserOptionalArgument *v10;
  void *v11;
  ADArgumentParserOptionalArgument *v12;

  v7 = a4;
  v9 = a6;
  v10 = [ADArgumentParserOptionalArgument alloc];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[ADArgumentParserOptionalArgument initWithName:shortName:defaultValue:description:type:conversionDictionary:](v10, "initWithName:shortName:defaultValue:description:type:conversionDictionary:", a3, v7, v11, v9, 2, 0);

  return v12;
}

+ (id)floatOption:(SEL)a3 shortName:(char)a4 defaultValue:(float)a5 description:(id)a6
{
  uint64_t v7;
  id v9;
  ADArgumentParserOptionalArgument *v10;
  double v11;
  void *v12;
  ADArgumentParserOptionalArgument *v13;

  v7 = a4;
  v9 = a6;
  v10 = [ADArgumentParserOptionalArgument alloc];
  *(float *)&v11 = a5;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[ADArgumentParserOptionalArgument initWithName:shortName:defaultValue:description:type:conversionDictionary:](v10, "initWithName:shortName:defaultValue:description:type:conversionDictionary:", a3, v7, v12, v9, 3, 0);

  return v13;
}

+ (id)stringArrayOption:(SEL)a3 shortName:(char)a4 defaultValue:(id)a5 description:(id)a6
{
  uint64_t v7;
  id v9;
  id v10;
  ADArgumentParserOptionalArgument *v11;

  v7 = a4;
  v9 = a5;
  v10 = a6;
  v11 = -[ADArgumentParserOptionalArgument initWithName:shortName:defaultValue:description:type:conversionDictionary:]([ADArgumentParserOptionalArgument alloc], "initWithName:shortName:defaultValue:description:type:conversionDictionary:", a3, v7, v9, v10, 7, 0);

  return v11;
}

+ (id)integerArrayOption:(SEL)a3 shortName:(char)a4 defaultValue:(id)a5 description:(id)a6
{
  uint64_t v7;
  id v9;
  id v10;
  ADArgumentParserOptionalArgument *v11;

  v7 = a4;
  v9 = a5;
  v10 = a6;
  v11 = -[ADArgumentParserOptionalArgument initWithName:shortName:defaultValue:description:type:conversionDictionary:]([ADArgumentParserOptionalArgument alloc], "initWithName:shortName:defaultValue:description:type:conversionDictionary:", a3, v7, v9, v10, 5, 0);

  return v11;
}

+ (id)floatArrayOption:(SEL)a3 shortName:(char)a4 defaultValue:(id)a5 description:(id)a6
{
  uint64_t v7;
  id v9;
  id v10;
  ADArgumentParserOptionalArgument *v11;

  v7 = a4;
  v9 = a5;
  v10 = a6;
  v11 = -[ADArgumentParserOptionalArgument initWithName:shortName:defaultValue:description:type:conversionDictionary:]([ADArgumentParserOptionalArgument alloc], "initWithName:shortName:defaultValue:description:type:conversionDictionary:", a3, v7, v9, v10, 6, 0);

  return v11;
}

@end
