@implementation KGPropertyValue

- (id)initForSubclasses
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)KGPropertyValue;
  return -[KGPropertyValue init](&v3, sel_init);
}

- (unint64_t)dataType
{
  id v2;

  KGAbstractMethodException(self, a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (KGPropertyTypeProtocol)kgPropertyValue
{
  id v2;

  KGAbstractMethodException(self, a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)description
{
  void *v2;
  void *v3;

  -[KGPropertyValue kgPropertyValue](self, "kgPropertyValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)kgPropertyValueWithMAPropertyValue:(id)a3
{
  id v3;
  id v4;
  KGInt64PropertyValue *v5;
  uint64_t v6;
  KGStringPropertyValue *v7;
  id v8;
  KGDoublePropertyValue *v9;
  double v10;
  double v11;
  uint64_t v12;
  id v13;
  uint64_t v14;

  v3 = a3;
  switch(objc_msgSend(v3, "kgPropertyType"))
  {
    case 1:
      v4 = v3;
      v5 = [KGInt64PropertyValue alloc];
      v6 = objc_msgSend(v4, "integerValue");
      goto LABEL_7;
    case 2:
      v8 = v3;
      v9 = [KGDoublePropertyValue alloc];
      objc_msgSend(v8, "doubleValue");
      v11 = v10;

      v12 = -[KGDoublePropertyValue initWithValue:](v9, "initWithValue:", v11);
      goto LABEL_8;
    case 3:
      v13 = v3;
      v7 = -[KGStringPropertyValue initWithValue:]([KGStringPropertyValue alloc], "initWithValue:", v13);

      break;
    case 4:
      v4 = v3;
      v5 = [KGUInt64PropertyValue alloc];
      v6 = objc_msgSend(v4, "unsignedIntegerValue");
LABEL_7:
      v14 = v6;

      v12 = -[KGInt64PropertyValue initWithValue:](v5, "initWithValue:", v14);
LABEL_8:
      v7 = (KGStringPropertyValue *)v12;
      break;
    default:
      v7 = 0;
      break;
  }

  return v7;
}

+ (id)kgPropertiesWithMAProperties:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v10, (_QWORD)v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[KGPropertyValue kgPropertyValueWithMAPropertyValue:](KGPropertyValue, "kgPropertyValueWithMAPropertyValue:", v11);
        v12 = objc_claimAutoreleasedReturnValue();
        if (!v12)
        {

          v14 = 0;
          goto LABEL_11;
        }
        v13 = (void *)v12;
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }

  v14 = v4;
LABEL_11:

  return v14;
}

@end
