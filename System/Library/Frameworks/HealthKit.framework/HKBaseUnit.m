@implementation HKBaseUnit

+ (id)_uniquedRootUnit:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  void *v13;
  const char *v15;
  __int128 v16;
  __int128 v17;
  char *v18;
  __int128 v19;
  __int128 v20;
  char *v21;

  v4 = objc_retainAutorelease(a3);
  v5 = (const char *)objc_msgSend(v4, "UTF8String");
  v6 = 0;
  while (1)
  {
    v7 = (&__SIUnitDefinitions)[v6];
    v8 = *(_OWORD *)&(&__SIUnitDefinitions)[v6 + 3];
    v19 = *(_OWORD *)&(&__SIUnitDefinitions)[v6 + 1];
    v20 = v8;
    v21 = (&__SIUnitDefinitions)[v6 + 5];
    if (!strcmp(v7, v5))
      break;
    v6 += 6;
    if (v6 == 102)
    {
      v9 = 0;
      while (1)
      {
        v7 = (&__OtherUnitDefinitions)[v9];
        v10 = *(_OWORD *)&(&__OtherUnitDefinitions)[v9 + 3];
        v19 = *(_OWORD *)&(&__OtherUnitDefinitions)[v9 + 1];
        v20 = v10;
        v21 = (&__OtherUnitDefinitions)[v9 + 5];
        if (!strcmp(v7, v5))
          goto LABEL_11;
        v9 += 6;
        if (v9 == 222)
        {
          v11 = 0;
          while (1)
          {
            v7 = (&__ContextSpecificUnitDefinitions)[v11];
            v12 = *(_OWORD *)&(&__ContextSpecificUnitDefinitions)[v11 + 3];
            v19 = *(_OWORD *)&(&__ContextSpecificUnitDefinitions)[v11 + 1];
            v20 = v12;
            v21 = (&__ContextSpecificUnitDefinitions)[v11 + 5];
            if (!strcmp(v7, v5))
              goto LABEL_11;
            v11 += 6;
            if (v11 == 24)
            {
              objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid (un-prefixed) unit string: %@"), v4);
              v7 = 0;
              v21 = 0;
              v19 = 0u;
              v20 = 0u;
              goto LABEL_11;
            }
          }
        }
      }
    }
  }
LABEL_11:

  v15 = v7;
  v16 = v19;
  v17 = v20;
  v18 = v21;
  objc_msgSend(a1, "_uniquedRootUnitFromDefinition:", &v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)_uniquedRootUnitFromDefinition:(id *)a3
{
  void *v5;
  _BYTE *v6;
  __int128 v7;
  void *v8;
  id v9;
  void *v10;
  _OWORD v12[3];

  os_unfair_lock_lock((os_unfair_lock_t)&_uniquedRootUnitFromDefinition__lock);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3->var0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_uniquedRootUnitFromDefinition__units, "objectForKeyedSubscript:", v5);
  v6 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v7 = *(_OWORD *)&a3->var2;
    v12[0] = *(_OWORD *)&a3->var0;
    v12[1] = v7;
    v12[2] = *(_OWORD *)&a3->var4;
    objc_msgSend(a1, "_rootUnitWithDefinition:", v12);
    v6 = (_BYTE *)objc_claimAutoreleasedReturnValue();
    v6[72] = 1;
    v8 = (void *)_uniquedRootUnitFromDefinition__units;
    if (!_uniquedRootUnitFromDefinition__units)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v10 = (void *)_uniquedRootUnitFromDefinition__units;
      _uniquedRootUnitFromDefinition__units = (uint64_t)v9;

      v8 = (void *)_uniquedRootUnitFromDefinition__units;
    }
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v5);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&_uniquedRootUnitFromDefinition__lock);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKBaseUnit;
  -[HKUnit encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (id)unitString
{
  return self->_unitString;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_unitString, "hash");
}

+ (id)_uniquedUnitWithPrefix:(id)a3 rootUnit:(id)a4
{
  return (id)objc_msgSend(a1, "_uniquedUnitWithPrefix:conversionConstant:rootUnit:", a3, 0, a4);
}

+ (id)_uniquedUnitWithPrefix:(id)a3 conversionConstant:(id)a4 rootUnit:(id)a5
{
  id v7;
  __CFString *v8;
  id v9;
  void *v10;
  void *v11;
  _BYTE *v12;
  void *v13;
  id v14;
  void *v15;

  v7 = a3;
  v8 = (__CFString *)a4;
  v9 = a5;
  os_unfair_lock_lock((os_unfair_lock_t)&_uniquedUnitWithPrefix_conversionConstant_rootUnit__lock);
  objc_msgSend(v9, "unitString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _unitStringForUnit(v7, v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)_uniquedUnitWithPrefix_conversionConstant_rootUnit__units, "objectForKey:", v11);
  v12 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(v9, "_unitByPrefixing:withConversionConstant:", v7, v8);
    v12 = (_BYTE *)objc_claimAutoreleasedReturnValue();
    v12[72] = 1;
    v13 = (void *)_uniquedUnitWithPrefix_conversionConstant_rootUnit__units;
    if (!_uniquedUnitWithPrefix_conversionConstant_rootUnit__units)
    {
      v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v15 = (void *)_uniquedUnitWithPrefix_conversionConstant_rootUnit__units;
      _uniquedUnitWithPrefix_conversionConstant_rootUnit__units = (uint64_t)v14;

      v13 = (void *)_uniquedUnitWithPrefix_conversionConstant_rootUnit__units;
    }
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v11);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&_uniquedUnitWithPrefix_conversionConstant_rootUnit__lock);
  return v12;
}

- (HKBaseUnit)initWithCoder:(id)a3
{
  id v4;
  HKBaseUnit *v5;
  uint64_t v6;
  NSString *unitString;
  double v8;
  double v9;
  uint64_t v10;
  NSString *prefix;
  uint64_t v12;
  NSString *root;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HKBaseUnit;
  v5 = -[HKUnit initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5 && (objc_msgSend(v4, "containsValueForKey:", CFSTR("HKUnitStringKey")) & 1) == 0)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BaseUnitStringKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    unitString = v5->_unitString;
    v5->_unitString = (NSString *)v6;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("BaseUnitProportionalSizeKey"));
    v5->_proportionalSize = v8;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("BaseUnitScaleOffsetKey"));
    v5->super._scaleOffset = v9;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BaseUnitPrefixKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    prefix = v5->_prefix;
    v5->_prefix = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BaseUnitRootKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    root = v5->_root;
    v5->_root = (NSString *)v12;

    v5->_uniqued = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("BaseUnitUniquedKey"));
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_root, 0);
  objc_storeStrong((id *)&self->_prefix, 0);
  objc_storeStrong((id *)&self->_unitString, 0);
}

- (id)awakeAfterUsingCoder:(id)a3
{
  char v4;
  HKBaseUnit *v5;
  HKBaseUnit *v6;
  id v7;
  void *v8;
  NSString *prefix;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;

  v4 = objc_msgSend(a3, "containsValueForKey:", CFSTR("HKUnitStringKey"));
  v5 = self;
  v6 = v5;
  v7 = v5;
  if ((v4 & 1) == 0)
  {
    v7 = v5;
    if (v5->_uniqued)
    {
      if (v5->_root)
      {
        +[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        prefix = v6->_prefix;
        if (prefix)
        {
          _Prefixes();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKey:", v6->_prefix);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "doubleValue");
          v13 = v12;

          LOBYTE(prefix) = v6->_prefix != 0;
        }
        else
        {
          v13 = 1.0;
        }
        v14 = fabs(v6->_proportionalSize / v13 + -1.0);
        if ((prefix & 1) != 0 || v14 > 0.00000011920929)
        {
          if (v14 <= 0.00000011920929)
          {
            v15 = 0;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
          }
          +[HKBaseUnit _uniquedUnitWithPrefix:conversionConstant:rootUnit:](HKBaseUnit, "_uniquedUnitWithPrefix:conversionConstant:rootUnit:", v6->_prefix, v15, v8);
          v7 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v7 = v8;
          v15 = v6;
        }

      }
      else
      {
        +[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", v5->_unitString);
        v7 = (id)objc_claimAutoreleasedReturnValue();
        v8 = v6;
      }

    }
  }

  return v7;
}

+ (id)_rootUnitWithDefinition:(id *)a3
{
  NSString *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3->var2);
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3->var0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(NSClassFromString(v4)), "_initWithUnitString:proportionalSize:scaleOffset:", v5, a3->var3, a3->var4);

  return v6;
}

- (id)_initWithUnitString:(id)a3 proportionalSize:(double)a4 scaleOffset:(double)a5
{
  id v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKBaseUnit;
  v9 = -[HKUnit _init](&v13, sel__init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    v11 = (void *)v9[6];
    v9[6] = v10;

    *((double *)v9 + 10) = a4;
    *((double *)v9 + 1) = a5;
  }

  return v9;
}

- (id)_unitByPrefixing:(id)a3 withConversionConstant:(id)a4
{
  id v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;

  v6 = a3;
  v7 = (__CFString *)a4;
  v8 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "_init");
  _unitStringForUnit(v6, self->_unitString, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "copy");
  v11 = *(void **)(v8 + 48);
  *(_QWORD *)(v8 + 48) = v10;

  if (v6)
  {
    _Prefixes();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Invalid unit prefix: %@"), v6);
  }
  else
  {
    v13 = &unk_1E3895608;
  }
  if (v7)
    v14 = v7;
  else
    v14 = (__CFString *)&unk_1E3895608;
  v15 = v14;

  -[__CFString doubleValue](v15, "doubleValue");
  v17 = v16;
  objc_msgSend(v13, "doubleValue");
  v19 = v17 * v18;
  *(double *)(v8 + 80) = v19 * self->_proportionalSize;
  *(double *)(v8 + 8) = self->super._scaleOffset / v19;
  v20 = objc_msgSend(v6, "copy");
  v21 = *(void **)(v8 + 56);
  *(_QWORD *)(v8 + 56) = v20;

  v22 = -[NSString copy](self->_unitString, "copy");
  v23 = *(void **)(v8 + 64);
  *(_QWORD *)(v8 + 64) = v22;

  return (id)v8;
}

- (id)_computeBaseUnitReductionAndProportionalSize:(double *)a3 withCycleSet:(id)a4
{
  id v6;
  double proportionalSize;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v20;

  v6 = a4;
  proportionalSize = self->_proportionalSize;
  -[HKBaseUnit dimension](self, "dimension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "containsObject:", v8))
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99768];
    objc_msgSend(v8, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise:format:", v10, CFSTR("Illegal dimension dependency cycle involving %@"), v11);

  }
  if (objc_msgSend(v8, "canBeReduced"))
  {
    objc_msgSend(v8, "reducibleBaseUnit");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "proportionalSize");
    v14 = proportionalSize / v13;

    objc_msgSend(v8, "reductionCoefficient");
    v16 = v14 * v15;
    objc_msgSend(v6, "addObject:", v8);
    v20 = 1.0;
    objc_msgSend(v8, "reducedUnit");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_baseUnitReductionAndProportionalSize:withCycleSet:", &v20, v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    proportionalSize = v16 * v20;
    objc_msgSend(v6, "removeObject:", v8);
    if (!a3)
      goto LABEL_8;
    goto LABEL_7;
  }
  -[HKBaseUnit _baseUnits](self, "_baseUnits");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
LABEL_7:
    *a3 = proportionalSize;
LABEL_8:

  return v18;
}

- (id)_baseUnits
{
  return +[_HKFactorization factorizationWithFactor:exponent:](_HKFactorization, "factorizationWithFactor:exponent:", self, 1);
}

- (double)proportionalSize
{
  return self->_proportionalSize;
}

- (_HKBaseDimension)dimension
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKBaseUnit;
  -[HKUnit dimension](&v3, sel_dimension);
  return (_HKBaseDimension *)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)unitFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  _HKBaseUnitGrammar();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parseTreeForString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unable to parse base unit string: %@"), v3);
  objc_msgSend(v5, "evaluate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
