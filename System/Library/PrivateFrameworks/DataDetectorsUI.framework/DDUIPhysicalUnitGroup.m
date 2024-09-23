@implementation DDUIPhysicalUnitGroup

- (DDUIPhysicalUnitGroup)initWithName:(id)a3 units:(id)a4 restricted:(BOOL)a5 symbol:(id)a6
{
  id v11;
  id v12;
  id v13;
  DDUIPhysicalUnitGroup *v14;
  DDUIPhysicalUnitGroup *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)DDUIPhysicalUnitGroup;
  v14 = -[DDUIPhysicalUnitGroup init](&v26, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_name, a3);
    objc_storeStrong((id *)&v15->_units, a4);
    v15->_restrictedLinkification = a5;
    objc_storeStrong((id *)&v15->_symbol, a6);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v16 = v12;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v23;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v23 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v20++), "setGroup:", v15, (_QWORD)v22);
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v18);
    }

  }
  return v15;
}

- (NSArray)units
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (id)symbolNameForValue:(double)a3 unit:(id)a4
{
  id v6;
  NSString *p_isa;
  DDUIPhysicalUnitGroup *v8;
  DDUIPhysicalUnitGroup *v9;
  _BOOL4 v11;
  DDUIPhysicalUnitGroup *v12;
  double v13;
  const __CFString *v14;

  v6 = a4;
  p_isa = self->_symbol;
  objc_msgSend(v6, "group");
  v8 = (DDUIPhysicalUnitGroup *)objc_claimAutoreleasedReturnValue();
  if (v8 == self)
  {
    v11 = -[NSString isEqualToString:](p_isa, "isEqualToString:", CFSTR("thermometer"));

    if (!v11)
      goto LABEL_4;
    +[DDUIPhysicalUnit unitWithIdentifier:](DDUIPhysicalUnit, "unitWithIdentifier:", CFSTR("celsius"));
    v12 = (DDUIPhysicalUnitGroup *)objc_claimAutoreleasedReturnValue();
    v9 = v12;
    if (v12)
    {
      -[DDUIPhysicalUnitGroup valueFrom:unit:](v12, "valueFrom:unit:", v6, a3);
      if (v13 <= 0.0)
      {
        v14 = CFSTR("thermometer.snowflake");
      }
      else
      {
        if (v13 < 30.0)
          goto LABEL_3;
        v14 = CFSTR("thermometer.sun");
      }

      p_isa = &v14->isa;
    }
  }
  else
  {
    v9 = v8;
  }
LABEL_3:

LABEL_4:
  return p_isa;
}

- (NSString)symbol
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)restrictedLinkification
{
  return self->_restrictedLinkification;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbol, 0);
  objc_storeStrong((id *)&self->_units, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
