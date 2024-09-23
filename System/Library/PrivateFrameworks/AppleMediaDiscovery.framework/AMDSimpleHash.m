@implementation AMDSimpleHash

- (AMDSimpleHash)initWithCapacity:(unsigned int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  AMDSimpleHash *v14;
  unsigned int v15;
  objc_super v16;
  unsigned int v17;
  SEL v18;
  AMDSimpleHash *v19;

  v18 = a2;
  v17 = a3;
  v19 = 0;
  v16.receiver = self;
  v16.super_class = (Class)AMDSimpleHash;
  v19 = -[AMDSimpleHash init](&v16, sel_init);
  objc_storeStrong((id *)&v19, v19);
  v3 = +[AMDSimpleHash getBase:](AMDSimpleHash, "getBase:", v17);
  -[AMDSimpleHash setModuloBase:](v19, "setModuloBase:", v3);
  -[AMDSimpleHash setNumEntries:](v19, "setNumEntries:", 0);
  v15 = 8 * -[AMDSimpleHash moduloBase](v19, "moduloBase");
  v4 = malloc_type_calloc(-[AMDSimpleHash moduloBase](v19, "moduloBase"), 8uLL, 0x100004000313F17uLL);
  -[AMDSimpleHash setKeys:](v19, "setKeys:", v4);
  v8 = (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:", -[AMDSimpleHash keys](v19, "keys"), v15);
  -[AMDSimpleHash setKeysStorage:](v19, "setKeysStorage:");

  v5 = malloc_type_malloc(v15, 0x26F29594uLL);
  -[AMDSimpleHash setValues:](v19, "setValues:", v5);
  v9 = (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:", -[AMDSimpleHash values](v19, "values"), v15);
  -[AMDSimpleHash setValuesStorage:](v19, "setValuesStorage:");

  v6 = malloc_type_calloc(-[AMDSimpleHash moduloBase](v19, "moduloBase"), 1uLL, 0x100004077774924uLL);
  -[AMDSimpleHash setMetadata:](v19, "setMetadata:", v6);
  v11 = (void *)MEMORY[0x1E0C99D50];
  v10 = -[AMDSimpleHash metadata](v19, "metadata");
  v12 = (id)objc_msgSend(v11, "dataWithBytesNoCopy:length:", v10, -[AMDSimpleHash moduloBase](v19, "moduloBase"));
  -[AMDSimpleHash setMetadataStorage:](v19, "setMetadataStorage:");

  v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[AMDSimpleHash setCollisionMap:](v19, "setCollisionMap:");

  v14 = v19;
  objc_storeStrong((id *)&v19, 0);
  return v14;
}

- (BOOL)addForKey:(unint64_t)a3 theValue:(unint64_t)a4
{
  id v5;
  id v6;
  NSMutableDictionary *v7;
  id v8;
  id v9;
  NSMutableDictionary *v10;
  id v11;
  id v12;
  NSMutableDictionary *v13;
  char v14;
  unsigned int v15;
  char v19;

  if (a3)
  {
    v15 = a3 % -[AMDSimpleHash moduloBase](self, "moduloBase");
    v14 = -[AMDSimpleHash metadata](self, "metadata")[v15];
    if (v14)
    {
      if (v14 == 1)
      {
        v10 = -[AMDSimpleHash collisionMap](self, "collisionMap");
        v9 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[AMDSimpleHash values](self, "values")[8 * v15]);
        v8 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[AMDSimpleHash keys](self, "keys")[8 * v15]);
        -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v9);

        v13 = -[AMDSimpleHash collisionMap](self, "collisionMap");
        v12 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
        v11 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
        -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v12);

        -[AMDSimpleHash metadata](self, "metadata")[v15] = 2;
      }
      else
      {
        v7 = -[AMDSimpleHash collisionMap](self, "collisionMap");
        v6 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
        v5 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
        -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v6);

      }
    }
    else
    {
      -[AMDSimpleHash values](self, "values")[8 * v15] = a4;
      -[AMDSimpleHash metadata](self, "metadata")[v15] = 1;
      -[AMDSimpleHash keys](self, "keys")[8 * v15] = a3;
    }
    -[AMDSimpleHash setNumEntries:](self, "setNumEntries:", -[AMDSimpleHash numEntries](self, "numEntries") + 1);
    v19 = 1;
  }
  else
  {
    v19 = 0;
  }
  return v19 & 1;
}

- (BOOL)getValueForKey:(unint64_t)a3 into:(unint64_t *)a4
{
  id v5;
  NSMutableDictionary *v6;
  id location;
  char v8;
  unsigned int v9;
  unint64_t *v10;
  unint64_t v11;
  SEL v12;
  AMDSimpleHash *v13;
  char v14;

  v13 = self;
  v12 = a2;
  v11 = a3;
  v10 = a4;
  v9 = a3 % -[AMDSimpleHash moduloBase](self, "moduloBase");
  v8 = 0;
  v8 = -[AMDSimpleHash metadata](v13, "metadata")[v9];
  if (v8)
  {
    if (v8 == 1)
    {
      if (-[AMDSimpleHash keys](v13, "keys")[8 * v9] == v11)
      {
        *v10 = -[AMDSimpleHash values](v13, "values")[8 * v9];
        v14 = 1;
      }
      else
      {
        v14 = 0;
      }
    }
    else
    {
      v6 = -[AMDSimpleHash collisionMap](v13, "collisionMap");
      v5 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v11);
      location = (id)-[NSMutableDictionary objectForKey:](v6, "objectForKey:");

      if (location)
      {
        *v10 = objc_msgSend(location, "longLongValue");
        v14 = 1;
      }
      else
      {
        v14 = 0;
      }
      objc_storeStrong(&location, 0);
    }
  }
  else
  {
    v14 = 0;
  }
  return v14 & 1;
}

- (BOOL)removeKey:(unint64_t)a3 andSaveValueInto:(unint64_t *)a4
{
  NSMutableDictionary *v5;
  NSMutableDictionary *v6;
  id location;
  id v8;
  char v9;
  unsigned int v10;
  unint64_t *v11;
  unint64_t v12;
  SEL v13;
  AMDSimpleHash *v14;
  char v15;

  v14 = self;
  v13 = a2;
  v12 = a3;
  v11 = a4;
  v10 = a3 % -[AMDSimpleHash moduloBase](self, "moduloBase");
  v9 = 0;
  v9 = -[AMDSimpleHash metadata](v14, "metadata")[v10];
  if (v9)
  {
    if (v9 == 1)
    {
      if (-[AMDSimpleHash keys](v14, "keys")[8 * v10] == v12)
      {
        -[AMDSimpleHash metadata](v14, "metadata")[v10] = 0;
        -[AMDSimpleHash setNumEntries:](v14, "setNumEntries:", -[AMDSimpleHash numEntries](v14, "numEntries") - 1);
        if (v11)
          *v11 = -[AMDSimpleHash values](v14, "values")[8 * v10];
        v15 = 1;
      }
      else
      {
        v15 = 0;
      }
    }
    else
    {
      -[AMDSimpleHash setNumEntries:](v14, "setNumEntries:", -[AMDSimpleHash numEntries](v14, "numEntries") - 1);
      v8 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v12);
      v6 = -[AMDSimpleHash collisionMap](v14, "collisionMap");
      location = (id)-[NSMutableDictionary objectForKey:](v6, "objectForKey:", v8);

      if (location)
      {
        v5 = -[AMDSimpleHash collisionMap](v14, "collisionMap");
        -[NSMutableDictionary removeObjectForKey:](v5, "removeObjectForKey:", v8);

        if (v11)
          *v11 = objc_msgSend(location, "longLongValue");
        v15 = 1;
      }
      else
      {
        v15 = 0;
      }
      objc_storeStrong(&location, 0);
      objc_storeStrong(&v8, 0);
    }
  }
  else
  {
    v15 = 0;
  }
  return v15 & 1;
}

- (void)removeAllKeys
{
  NSMutableDictionary *v2;

  -[AMDSimpleHash metadata](self, "metadata");
  -[AMDSimpleHash moduloBase](self, "moduloBase");
  __memset_chk();
  -[AMDSimpleHash keys](self, "keys");
  -[AMDSimpleHash moduloBase](self, "moduloBase");
  __memset_chk();
  v2 = -[AMDSimpleHash collisionMap](self, "collisionMap");
  -[NSMutableDictionary removeAllObjects](v2, "removeAllObjects");

  -[AMDSimpleHash setNumEntries:](self, "setNumEntries:", 0);
}

- (unsigned)count
{
  return -[AMDSimpleHash numEntries](self, "numEntries", a2, self);
}

- (void)getAllKeysInto:(unint64_t *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  NSMutableDictionary *obj;
  uint64_t v9;
  _QWORD __b[8];
  id v11;
  char v12;
  signed int i;
  unint64_t *v14;
  SEL v15;
  AMDSimpleHash *v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v16 = self;
  v15 = a2;
  v14 = a3;
  for (i = 0; i < -[AMDSimpleHash moduloBase](v16, "moduloBase"); ++i)
  {
    v12 = 0;
    v12 = -[AMDSimpleHash metadata](v16, "metadata")[i];
    if (v12 == 1)
      *v14++ = -[AMDSimpleHash keys](v16, "keys")[8 * i];
  }
  memset(__b, 0, sizeof(__b));
  obj = -[AMDSimpleHash collisionMap](v16, "collisionMap");
  v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v17, 16);
  if (v9)
  {
    v5 = *(_QWORD *)__b[2];
    v6 = 0;
    v7 = v9;
    while (1)
    {
      v4 = v6;
      if (*(_QWORD *)__b[2] != v5)
        objc_enumerationMutation(obj);
      v11 = *(id *)(__b[1] + 8 * v6);
      v3 = objc_msgSend(v11, "longLongValue");
      *v14++ = v3;
      ++v6;
      if (v4 + 1 >= v7)
      {
        v6 = 0;
        v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v17, 16);
        if (!v7)
          break;
      }
    }
  }

}

+ (unsigned)getBase:(unsigned int)a3
{
  unsigned int i;

  for (i = 0; i < numPrimes; ++i)
  {
    if (primes[i] >= 2 * a3)
      return primes[i];
  }
  return primes[numPrimes - 1];
}

- (unsigned)moduloBase
{
  return self->_moduloBase;
}

- (void)setModuloBase:(unsigned int)a3
{
  self->_moduloBase = a3;
}

- (NSMutableDictionary)collisionMap
{
  return self->_collisionMap;
}

- (void)setCollisionMap:(id)a3
{
  objc_storeStrong((id *)&self->_collisionMap, a3);
}

- (unsigned)numEntries
{
  return self->_numEntries;
}

- (void)setNumEntries:(unsigned int)a3
{
  self->_numEntries = a3;
}

- (unint64_t)keys
{
  return self->_keys;
}

- (void)setKeys:(unint64_t *)a3
{
  self->_keys = a3;
}

- (NSData)keysStorage
{
  return self->_keysStorage;
}

- (void)setKeysStorage:(id)a3
{
  objc_storeStrong((id *)&self->_keysStorage, a3);
}

- (unint64_t)values
{
  return self->_values;
}

- (void)setValues:(unint64_t *)a3
{
  self->_values = a3;
}

- (NSData)valuesStorage
{
  return self->_valuesStorage;
}

- (void)setValuesStorage:(id)a3
{
  objc_storeStrong((id *)&self->_valuesStorage, a3);
}

- (char)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(char *)a3
{
  self->_metadata = a3;
}

- (NSData)metadataStorage
{
  return self->_metadataStorage;
}

- (void)setMetadataStorage:(id)a3
{
  objc_storeStrong((id *)&self->_metadataStorage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataStorage, 0);
  objc_storeStrong((id *)&self->_valuesStorage, 0);
  objc_storeStrong((id *)&self->_keysStorage, 0);
  objc_storeStrong((id *)&self->_collisionMap, 0);
}

@end
