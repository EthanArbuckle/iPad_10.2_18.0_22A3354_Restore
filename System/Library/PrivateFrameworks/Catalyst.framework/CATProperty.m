@implementation CATProperty

+ (void)initialize
{
  if (initialize_once != -1)
    dispatch_once(&initialize_once, &__block_literal_global_8);
}

void __25__CATProperty_initialize__block_invoke()
{
  id v0;
  void *v1;
  id v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x24BDBCE40]);
  v1 = (void *)CATPropertyPropertiesByClassName;
  CATPropertyPropertiesByClassName = (uint64_t)v0;

  v2 = objc_alloc_init(MEMORY[0x24BDBCE40]);
  v3 = (void *)CATPropertyPropertiesByProtocolName;
  CATPropertyPropertiesByProtocolName = (uint64_t)v2;

}

+ (id)propertiesForClass:(Class)a3
{
  objc_class *Superclass;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  objc_property_t *v9;
  unint64_t i;
  objc_property *v11;
  const char *Name;
  CATProperty *v13;
  void *v14;
  void *v15;
  unsigned int outCount;
  _QWORD v18[2];

  Superclass = a3;
  v18[1] = *MEMORY[0x24BDAC8D0];
  NSStringFromClass(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)CATPropertyPropertiesByClassName, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    do
    {
      outCount = 0;
      v9 = class_copyPropertyList(Superclass, &outCount);
      if (outCount)
      {
        for (i = 0; i < outCount; ++i)
        {
          v11 = v9[i];
          Name = property_getName(v11);
          v13 = -[CATProperty initWithName:attributes:]([CATProperty alloc], "initWithName:attributes:", Name, property_getAttributes(v11));
          objc_msgSend(v8, "addObject:", v13);

        }
      }
      free(v9);
      Superclass = class_getSuperclass(Superclass);
    }
    while (Superclass);
    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:selector:", CFSTR("name"), 1, sel_localizedStandardCompare_);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sortedArrayUsingDescriptors:", v15);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)CATPropertyPropertiesByClassName, "setObject:forKey:", v7, v4);
  }

  return v7;
}

+ (id)propertiesForProtocol:(id)a3
{
  Protocol *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  objc_property_t *v9;
  unint64_t i;
  objc_property *v11;
  const char *Name;
  CATProperty *v13;
  void *v14;
  void *v15;
  unsigned int outCount;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v3 = (Protocol *)a3;
  NSStringFromProtocol(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)CATPropertyPropertiesByProtocolName, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    outCount = 0;
    v9 = protocol_copyPropertyList(v3, &outCount);
    if (outCount)
    {
      for (i = 0; i < outCount; ++i)
      {
        v11 = v9[i];
        Name = property_getName(v11);
        v13 = -[CATProperty initWithName:attributes:]([CATProperty alloc], "initWithName:attributes:", Name, property_getAttributes(v11));
        objc_msgSend(v8, "addObject:", v13);

      }
    }
    free(v9);
    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:selector:", CFSTR("name"), 1, sel_localizedStandardCompare_);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sortedArrayUsingDescriptors:", v15);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)CATPropertyPropertiesByProtocolName, "setObject:forKey:", v7, v4);
  }

  return v7;
}

- (CATProperty)initWithName:(const char *)a3 attributes:(const char *)a4
{
  CATProperty *v8;
  uint64_t v9;
  NSString *name;
  size_t v11;
  char *v12;
  char *v13;
  char *v14;
  int v15;
  unsigned int v16;
  uint64_t v17;
  char *v18;
  int v19;
  uint64_t v20;
  NSString *instanceVariableName;
  size_t v22;
  size_t v23;
  char *v24;
  BOOL v25;
  uint64_t v26;
  void *v28;
  void *v29;
  uint64_t v30;
  objc_super v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  if (!a3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATProperty.m"), 110, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

    if (a4)
      goto LABEL_3;
LABEL_62:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATProperty.m"), 111, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("attributes"));

    goto LABEL_3;
  }
  if (!a4)
    goto LABEL_62;
LABEL_3:
  v31.receiver = self;
  v31.super_class = (Class)CATProperty;
  v8 = -[CATProperty init](&v31, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a3);
    v9 = objc_claimAutoreleasedReturnValue();
    name = v8->_name;
    v8->_name = (NSString *)v9;

    v8->_association = 0;
    v11 = strlen(a4);
    v12 = strcpy((char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a4);
    v13 = strtok(v12, ",");
    if (v13)
    {
      v14 = v13;
      while (1)
      {
        v15 = *v14;
        switch(*v14)
        {
          case 'G':
            v8->_customGetterSelector = sel_registerName(v14 + 1);
            goto LABEL_59;
          case 'H':
          case 'I':
          case 'J':
          case 'K':
          case 'L':
          case 'M':
          case 'O':
          case 'P':
          case 'Q':
          case 'U':
            goto LABEL_59;
          case 'N':
            v8->_nonAtomic = 1;
            goto LABEL_59;
          case 'R':
            v8->_readOnly = 1;
            goto LABEL_59;
          case 'S':
            v8->_customSetterSelector = sel_registerName(v14 + 1);
            goto LABEL_59;
          case 'T':
            v16 = v14[1];
            if (v16 > 0x5A)
            {
              v17 = 1;
              switch(v14[1])
              {
                case 'b':
                  v17 = 22;
                  break;
                case 'c':
                  break;
                case 'd':
                  v17 = 12;
                  break;
                case 'e':
                case 'g':
                case 'h':
                case 'j':
                case 'k':
                case 'm':
                case 'n':
                case 'o':
                case 'p':
                case 'r':
                case 't':
                case 'u':
                  goto LABEL_50;
                case 'f':
                  v17 = 11;
                  break;
                case 'i':
                  v17 = 2;
                  break;
                case 'l':
                  v17 = 4;
                  break;
                case 'q':
                  v17 = 5;
                  break;
                case 's':
                  v17 = 3;
                  break;
                case 'v':
                  v17 = 14;
                  break;
                default:
                  if (v16 == 91)
                  {
                    v17 = 19;
                  }
                  else
                  {
                    if (v16 != 123)
                      goto LABEL_50;
                    v17 = 20;
                  }
                  break;
              }
            }
            else if (v14[1] > 0x48u)
            {
              if (v14[1] > 0x50u)
              {
                if (v16 == 81)
                {
                  v17 = 10;
                }
                else
                {
                  if (v16 != 83)
                  {
LABEL_50:
                    v25 = v16 == 94;
                    v26 = 23;
                    if (!v25)
                      v26 = 0;
                    v8->_type = v26;
                    goto LABEL_59;
                  }
                  v17 = 8;
                }
              }
              else if (v16 == 73)
              {
                v17 = 7;
              }
              else
              {
                if (v16 != 76)
                  goto LABEL_50;
                v17 = 9;
              }
            }
            else
            {
              if (v14[1] > 0x39u)
              {
                switch(v14[1])
                {
                  case ':':
                    v17 = 18;
                    goto LABEL_58;
                  case '@':
                    v8->_type = 16;
                    v22 = strlen(v14);
                    v23 = v22 - 4;
                    if (v22 > 4)
                    {
                      v30 = (uint64_t)&v30;
                      v24 = strncpy((char *)&v30 - ((v22 + 12) & 0xFFFFFFFFFFFFFFF0), v14 + 3, v23);
                      v24[v23] = 0;
                      v8->_objectClass = objc_getClass(v24);
                    }
                    break;
                  case 'B':
                    v17 = 13;
                    goto LABEL_58;
                  case 'C':
                    v17 = 6;
                    goto LABEL_58;
                  default:
                    goto LABEL_50;
                }
                goto LABEL_59;
              }
              switch(v16)
              {
                case '#':
                  v17 = 17;
                  break;
                case '(':
                  v17 = 21;
                  break;
                case '*':
                  v17 = 15;
                  break;
                default:
                  goto LABEL_50;
              }
            }
LABEL_58:
            v8->_type = v17;
LABEL_59:
            v14 = strtok(0, ",");
            if (!v14)
              return v8;
            break;
          case 'V':
            v19 = v14[1];
            v18 = v14 + 1;
            if (v19)
            {
              v20 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v18);
              instanceVariableName = v8->_instanceVariableName;
              v8->_instanceVariableName = (NSString *)v20;

            }
            goto LABEL_59;
          case 'W':
            v8->_weakReference = 1;
            goto LABEL_59;
          default:
            if (v15 == 38)
            {
              v8->_association = 1;
            }
            else if (v15 == 67)
            {
              v8->_association = 2;
            }
            goto LABEL_59;
        }
      }
    }
  }
  return v8;
}

- (CATProperty)init
{
  return -[CATProperty initWithName:attributes:](self, "initWithName:attributes:", ", ");
}

- (NSString)name
{
  return self->_name;
}

- (NSString)instanceVariableName
{
  return self->_instanceVariableName;
}

- (int64_t)type
{
  return self->_type;
}

- (Class)objectClass
{
  return self->_objectClass;
}

- (BOOL)isReadOnly
{
  return self->_readOnly;
}

- (BOOL)isNonAtomic
{
  return self->_nonAtomic;
}

- (int64_t)association
{
  return self->_association;
}

- (SEL)customGetterSelector
{
  return self->_customGetterSelector;
}

- (SEL)customSetterSelector
{
  return self->_customSetterSelector;
}

- (BOOL)isWeakReference
{
  return self->_weakReference;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceVariableName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
