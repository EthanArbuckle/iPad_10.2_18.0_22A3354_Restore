@implementation CRJSObject

- (CRJSObject)initWithClassName:(id)a3 objectType:(int64_t)a4
{
  id v6;
  CRJSObject *v7;
  __CFString *v8;
  NSString *v9;
  objc_class *v10;
  id v11;
  id backingObject;
  CRJSObject *v13;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CRJSObject;
  v7 = -[CRJSObject init](&v15, sel_init);
  if (v7)
  {
    if (a4)
    {
      if (a4 != 1)
      {
        v13 = 0;
        goto LABEL_10;
      }
      v8 = CFSTR("_INPB");
    }
    else
    {
      v8 = CFSTR("_SFPB");
    }
    -[__CFString stringByAppendingString:](v8, "stringByAppendingString:", v6);
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    v10 = NSClassFromString(v9);

    if (-[objc_class isSubclassOfClass:](v10, "isSubclassOfClass:", objc_opt_class()))
    {
      v11 = objc_alloc_init(v10);
      backingObject = v7->_backingObject;
      v7->_backingObject = v11;

    }
  }
  v13 = v7;
LABEL_10:

  return v13;
}

+ (id)objectWithClassName:(id)a3 objectType:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc((Class)objc_opt_class());
  objc_msgSend(v6, "toString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "toNumber");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v7, "initWithClassName:objectType:", v8, objc_msgSend(v9, "integerValue"));
  return v10;
}

- (void)setBackingObjectValue:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  objc_msgSend(v6, "toString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isNull") & 1) != 0 || (objc_msgSend(v9, "isUndefined") & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    -[CRJSObject _backingObjectForJSValue:](self, "_backingObjectForJSValue:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(self->_backingObject, "setValue:forKey:", v8, v7);

}

- (id)backingObjectValueForKey:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "toString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDDA730];
  objc_msgSend(self->_backingObject, "valueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDA720], "currentContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueWithObject:inContext:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_logErrorLog:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;

  v3 = (void *)MEMORY[0x24BDDA720];
  v4 = a3;
  objc_msgSend(v3, "currentContext");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("( function() { console.error('%@'); }());"),
                 v4);

  v6 = (id)objc_msgSend(v7, "evaluateScript:", v5);
}

- (id)_backingObjectForJSValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id *v14;
  id v15;
  void *v16;
  int v17;
  void *v19;
  id v20;
  id v21;
  id *obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "valueForProperty:", CFSTR("_backingObject"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isUndefined"))
    v6 = v4;
  else
    v6 = v5;
  objc_msgSend(v6, "toObject");
  v7 = (id *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = v7[1];

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = v5;
      v20 = v4;
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
      v21 = (id)objc_claimAutoreleasedReturnValue();
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      obj = v7;
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v24;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v24 != v10)
              objc_enumerationMutation(obj);
            v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v11);
            v13 = (void *)MEMORY[0x220754C58]();
            objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("_backingObject"));
            v14 = (id *)objc_claimAutoreleasedReturnValue();
            v15 = v14[1];
            -[CRJSObject backingObject](self, "backingObject");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v15, "isEqual:", v16);

            if (v17)
              -[CRJSObject _logErrorLog:](self, "_logErrorLog:", CFSTR("Invalid object. Has reference cycles."));
            else
              objc_msgSend(v21, "addObject:", v14[1]);

            objc_autoreleasePoolPop(v13);
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v9);
      }

      v5 = v19;
      v4 = v20;
    }
    else
    {
      v21 = v7;
    }
  }

  return v21;
}

- (id)backingObject
{
  return self->_backingObject;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_backingObject, 0);
}

@end
