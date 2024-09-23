@implementation WFContentPropertyBuilder

- (id)multipleValues:(BOOL)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentPropertyBuilder setMultipleValues:](self, "setMultipleValues:", v4);

  return self;
}

- (id)sortable:(BOOL)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentPropertyBuilder setSortable:](self, "setSortable:", v4);

  return self;
}

- (id)filterable:(BOOL)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentPropertyBuilder setFilterable:](self, "setFilterable:", v4);

  return self;
}

- (id)gettable:(BOOL)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentPropertyBuilder setGettable:](self, "setGettable:", v4);

  return self;
}

- (id)setterBlock:(id)a3
{
  -[WFContentPropertyBuilder setSetterBlock:](self, "setSetterBlock:", a3);
  return self;
}

- (id)appendable:(BOOL)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentPropertyBuilder setAppendable:](self, "setAppendable:", v4);

  return self;
}

- (id)removable:(BOOL)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentPropertyBuilder setRemovable:](self, "setRemovable:", v4);

  return self;
}

- (id)primary:(BOOL)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentPropertyBuilder setPrimary:](self, "setPrimary:", v4);

  return self;
}

- (id)allowedOperators:(id)a3
{
  -[WFContentPropertyBuilder setAllowedOperators:](self, "setAllowedOperators:", a3);
  return self;
}

- (id)userInfo:(id)a3
{
  -[WFContentPropertyBuilder setUserInfo:](self, "setUserInfo:", a3);
  return self;
}

- (id)possibleValues:(id)a3
{
  id v4;
  WFContentPropertyPossibleValuesSynchronousGetter *v5;
  id v6;
  WFContentPropertyPossibleValuesSynchronousGetter *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = [WFContentPropertyPossibleValuesSynchronousGetter alloc];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __43__WFContentPropertyBuilder_possibleValues___block_invoke;
  v9[3] = &unk_24C4E0480;
  v10 = v4;
  v6 = v4;
  v7 = -[WFContentPropertyPossibleValuesSynchronousGetter initWithSynchronousGetter:](v5, "initWithSynchronousGetter:", v9);
  -[WFContentPropertyBuilder setPossibleValuesGetter:](self, "setPossibleValuesGetter:", v7);

  return self;
}

- (id)possibleValuesGetter:(id)a3
{
  id v4;
  WFContentPropertyPossibleValuesSynchronousGetter *v5;

  v4 = a3;
  v5 = -[WFContentPropertyPossibleValuesSynchronousGetter initWithSynchronousGetter:]([WFContentPropertyPossibleValuesSynchronousGetter alloc], "initWithSynchronousGetter:", v4);

  -[WFContentPropertyBuilder setPossibleValuesGetter:](self, "setPossibleValuesGetter:", v5);
  return self;
}

- (id)possibleValuesAsynchronousGetter:(id)a3
{
  id v4;
  WFContentPropertyPossibleValuesAsynchronousGetter *v5;

  v4 = a3;
  v5 = -[WFContentPropertyPossibleValuesAsynchronousGetter initWithAsynchronousGetter:]([WFContentPropertyPossibleValuesAsynchronousGetter alloc], "initWithAsynchronousGetter:", v4);

  -[WFContentPropertyBuilder setPossibleValuesGetter:](self, "setPossibleValuesGetter:", v5);
  return self;
}

- (id)caseInsensitive:(BOOL)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentPropertyBuilder setCaseInsensitive:](self, "setCaseInsensitive:", v4);

  return self;
}

- (id)negativeName:(id)a3
{
  -[WFContentPropertyBuilder setNegativeName:](self, "setNegativeName:", a3);
  return self;
}

- (id)singularItemName:(id)a3
{
  -[WFContentPropertyBuilder setSingularItemName:](self, "setSingularItemName:", a3);
  return self;
}

- (id)irrational:(BOOL)a3
{
  -[WFContentPropertyBuilder setIrrational:](self, "setIrrational:", a3);
  return self;
}

- (id)tense:(unint64_t)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentPropertyBuilder setTense:](self, "setTense:", v4);

  return self;
}

- (id)timeUnits:(unint64_t)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentPropertyBuilder setTimeUnits:](self, "setTimeUnits:", v4);

  return self;
}

- (id)comparableUnits:(unint64_t)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentPropertyBuilder setComparableUnits:](self, "setComparableUnits:", v4);

  return self;
}

- (id)measurementUnitType:(id)a3
{
  -[WFContentPropertyBuilder setMeasurementUnitType:](self, "setMeasurementUnitType:", a3);
  return self;
}

- (id)displayName:(id)a3
{
  -[WFContentPropertyBuilder setDisplayName:](self, "setDisplayName:", a3);
  return self;
}

- (id)canLowercaseName:(BOOL)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentPropertyBuilder setCanLowercaseName:](self, "setCanLowercaseName:", v4);

  return self;
}

- (id)build
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  int v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_class *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  BOOL v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  char v51;
  void *v52;
  unsigned int v53;
  objc_class *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  WFContentProperty *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  char v64;
  char v65;
  char v66;
  char v67;
  char v68;
  WFContentProperty *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  _QWORD v73[6];

  v71 = (void *)MEMORY[0x24BDBCF20];
  v70 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = (void *)objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  objc_msgSend(v71, "setWithObjects:", v70, v3, v4, v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentPropertyBuilder sortable](self, "sortable");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[WFContentPropertyBuilder sortable](self, "sortable");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLValue");
  }
  else
  {
    -[WFContentPropertyBuilder multipleValues](self, "multipleValues");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "BOOLValue") & 1) != 0)
    {
      v15 = 0;
    }
    else
    {
      v16 = -[objc_class instancesRespondToSelector:](-[WFContentPropertyBuilder propertyClass](self, "propertyClass"), "instancesRespondToSelector:", sel_compare_);
      if (v16)
      {
        v17 = -[WFContentPropertyBuilder propertyClass](self, "propertyClass");
        v15 = 1;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[objc_class isSubclassOfClass:](v17, "isSubclassOfClass:", objc_opt_class()))
          goto LABEL_8;
      }
      -[WFContentPropertyBuilder possibleValuesGetter](self, "possibleValuesGetter");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v18 != 0;

      if (v16)
LABEL_8:

    }
  }

  -[WFContentPropertyBuilder filterable](self, "filterable");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    -[WFContentPropertyBuilder filterable](self, "filterable");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v20, "BOOLValue");
  }
  else
  {
    v73[0] = MEMORY[0x24BDAC760];
    v73[1] = 3221225472;
    v73[2] = __33__WFContentPropertyBuilder_build__block_invoke;
    v73[3] = &unk_24C4E04D0;
    v73[4] = self;
    objc_msgSend(v12, "objectsPassingTest:", v73);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v20, "count") != 0;
  }

  -[WFContentPropertyBuilder gettable](self, "gettable");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    -[WFContentPropertyBuilder gettable](self, "gettable");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v22, "BOOLValue");

  }
  else
  {
    v66 = 1;
  }

  -[WFContentPropertyBuilder setterBlock](self, "setterBlock");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFContentPropertyBuilder appendable](self, "appendable");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    -[WFContentPropertyBuilder appendable](self, "appendable");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    HIDWORD(v47) = objc_msgSend(v25, "BOOLValue");
LABEL_19:

    goto LABEL_20;
  }
  if (v23)
  {
    -[WFContentPropertyBuilder multipleValues](self, "multipleValues");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    HIDWORD(v47) = v25 != 0;
    goto LABEL_19;
  }
  HIDWORD(v47) = 0;
LABEL_20:

  -[WFContentPropertyBuilder removable](self, "removable");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    -[WFContentPropertyBuilder removable](self, "removable");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(v27, "BOOLValue");
  }
  else
  {
    v28 = -[WFContentPropertyBuilder propertyClass](self, "propertyClass");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v28 != (objc_class *)objc_opt_class();
  }

  -[WFContentPropertyBuilder canLowercaseName](self, "canLowercaseName");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    -[WFContentPropertyBuilder canLowercaseName](self, "canLowercaseName");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v30, "BOOLValue");

  }
  else
  {
    v64 = 1;
  }

  -[WFContentPropertyBuilder tense](self, "tense");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    -[WFContentPropertyBuilder tense](self, "tense");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v32, "unsignedIntegerValue");

  }
  else
  {
    v63 = 3;
  }

  -[WFContentPropertyBuilder timeUnits](self, "timeUnits");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = v12;
  v68 = v15;
  if (v33)
  {
    -[WFContentPropertyBuilder timeUnits](self, "timeUnits");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v34, "unsignedIntegerValue");

  }
  else
  {
    v61 = 8220;
  }

  v59 = [WFContentProperty alloc];
  -[WFContentPropertyBuilder keyPath](self, "keyPath");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentPropertyBuilder block](self, "block");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentPropertyBuilder setterBlock](self, "setterBlock");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentPropertyBuilder name](self, "name");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = -[WFContentPropertyBuilder propertyClass](self, "propertyClass");
  -[WFContentPropertyBuilder multipleValues](self, "multipleValues");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v62, "BOOLValue");
  -[WFContentPropertyBuilder primary](self, "primary");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v60, "BOOLValue");
  -[WFContentPropertyBuilder allowedOperators](self, "allowedOperators");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentPropertyBuilder userInfo](self, "userInfo");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentPropertyBuilder possibleValuesGetter](self, "possibleValuesGetter");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentPropertyBuilder caseInsensitive](self, "caseInsensitive");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v52, "BOOLValue");
  -[WFContentPropertyBuilder negativeName](self, "negativeName");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentPropertyBuilder singularItemName](self, "singularItemName");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = -[WFContentPropertyBuilder isIrrational](self, "isIrrational");
  -[WFContentPropertyBuilder comparableUnits](self, "comparableUnits");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "unsignedIntegerValue");
  -[WFContentPropertyBuilder measurementUnitType](self, "measurementUnitType");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentPropertyBuilder displayName](self, "displayName");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v47) = v64;
  LOBYTE(v46) = v38;
  LOBYTE(v45) = v36;
  BYTE6(v44) = v51;
  BYTE5(v44) = v65;
  BYTE4(v44) = BYTE4(v47);
  BYTE3(v44) = v23 != 0;
  BYTE2(v44) = v66;
  BYTE1(v44) = v68;
  LOBYTE(v44) = v67;
  v69 = -[WFContentProperty initWithKeyPath:block:setterBlock:name:propertyClass:multipleValues:filterable:sortable:gettable:settable:appendable:removable:primary:allowedOperators:userInfo:possibleValues:caseInsensitive:negativeName:singularItemName:irrational:tense:timeUnits:comparableUnits:measurementUnitType:displayName:canLowercaseName:](v59, "initWithKeyPath:block:setterBlock:name:propertyClass:multipleValues:filterable:sortable:gettable:settable:appendable:removable:primary:allowedOperators:userInfo:possibleValues:caseInsensitive:negativeName:singularItemName:irrational:tense:timeUnits:comparableUnits:measurementUnitType:displayName:canLowercaseName:", v58, v57, v56, v55, v54, v53, v44, v49, v35, v50, v45, v48, v37, v46, v63,
          v61,
          v40,
          v41,
          v42,
          v47);

  return v69;
}

- (WFPropertyListObject)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (void)setKeyPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)setterBlock
{
  return self->_setterBlock;
}

- (void)setSetterBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (Class)propertyClass
{
  return self->_propertyClass;
}

- (void)setPropertyClass:(Class)a3
{
  objc_storeStrong((id *)&self->_propertyClass, a3);
}

- (NSNumber)multipleValues
{
  return self->_multipleValues;
}

- (void)setMultipleValues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSNumber)filterable
{
  return self->_filterable;
}

- (void)setFilterable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)sortable
{
  return self->_sortable;
}

- (void)setSortable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)gettable
{
  return self->_gettable;
}

- (void)setGettable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)settable
{
  return self->_settable;
}

- (void)setSettable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)appendable
{
  return self->_appendable;
}

- (void)setAppendable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSNumber)removable
{
  return self->_removable;
}

- (void)setRemovable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSNumber)primary
{
  return self->_primary;
}

- (void)setPrimary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSArray)allowedOperators
{
  return self->_allowedOperators;
}

- (void)setAllowedOperators:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (WFContentPropertyPossibleValuesGetter)possibleValuesGetter
{
  return self->_possibleValuesGetter;
}

- (void)setPossibleValuesGetter:(id)a3
{
  objc_storeStrong((id *)&self->_possibleValuesGetter, a3);
}

- (NSNumber)caseInsensitive
{
  return self->_caseInsensitive;
}

- (void)setCaseInsensitive:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)negativeName
{
  return self->_negativeName;
}

- (void)setNegativeName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)singularItemName
{
  return self->_singularItemName;
}

- (void)setSingularItemName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (BOOL)isIrrational
{
  return self->_irrational;
}

- (void)setIrrational:(BOOL)a3
{
  self->_irrational = a3;
}

- (NSNumber)tense
{
  return self->_tense;
}

- (void)setTense:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSNumber)timeUnits
{
  return self->_timeUnits;
}

- (void)setTimeUnits:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSNumber)comparableUnits
{
  return self->_comparableUnits;
}

- (void)setComparableUnits:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSString)measurementUnitType
{
  return self->_measurementUnitType;
}

- (void)setMeasurementUnitType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSNumber)canLowercaseName
{
  return self->_canLowercaseName;
}

- (void)setCanLowercaseName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_canLowercaseName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_measurementUnitType, 0);
  objc_storeStrong((id *)&self->_comparableUnits, 0);
  objc_storeStrong((id *)&self->_timeUnits, 0);
  objc_storeStrong((id *)&self->_tense, 0);
  objc_storeStrong((id *)&self->_singularItemName, 0);
  objc_storeStrong((id *)&self->_negativeName, 0);
  objc_storeStrong((id *)&self->_caseInsensitive, 0);
  objc_storeStrong((id *)&self->_possibleValuesGetter, 0);
  objc_storeStrong((id *)&self->_allowedOperators, 0);
  objc_storeStrong((id *)&self->_primary, 0);
  objc_storeStrong((id *)&self->_removable, 0);
  objc_storeStrong((id *)&self->_appendable, 0);
  objc_storeStrong((id *)&self->_settable, 0);
  objc_storeStrong((id *)&self->_gettable, 0);
  objc_storeStrong((id *)&self->_sortable, 0);
  objc_storeStrong((id *)&self->_filterable, 0);
  objc_storeStrong((id *)&self->_multipleValues, 0);
  objc_storeStrong((id *)&self->_propertyClass, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong(&self->_setterBlock, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
}

uint64_t __33__WFContentPropertyBuilder_build__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = objc_msgSend((id)objc_msgSend(v2, "propertyClass"), "isSubclassOfClass:", v3);

  return v4;
}

id __43__WFContentPropertyBuilder_possibleValues___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (id)keyPath:(id)a3 name:(id)a4 class:(Class)a5
{
  id v9;
  id v10;
  void *v11;
  WFContentPropertyBuilder *v12;
  void *v14;
  void *v15;
  void *v16;

  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFContentProperty.m"), 259, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

    if (a5)
      goto LABEL_4;
LABEL_7:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFContentProperty.m"), 260, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("propertyClass"));

    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFContentProperty.m"), 258, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keyPath"));

  if (!v11)
    goto LABEL_6;
LABEL_3:
  if (!a5)
    goto LABEL_7;
LABEL_4:
  v12 = objc_alloc_init(WFContentPropertyBuilder);
  -[WFContentPropertyBuilder setKeyPath:](v12, "setKeyPath:", v9);
  -[WFContentPropertyBuilder setName:](v12, "setName:", v11);
  -[WFContentPropertyBuilder setPropertyClass:](v12, "setPropertyClass:", a5);

  return v12;
}

+ (id)keyPath:(id)a3 setterBlock:(id)a4 name:(id)a5 class:(Class)a6
{
  id v10;
  void *v11;
  void *v12;
  id v13;

  v10 = a4;
  objc_msgSend(a1, "keyPath:name:class:", a3, a5, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "setSetterBlock:", v10);
    v13 = v12;
  }

  return v12;
}

+ (id)block:(id)a3 name:(id)a4 class:(Class)a5
{
  id v9;
  id v10;
  void *v11;
  WFContentPropertyBuilder *v12;
  void *v14;
  void *v15;
  void *v16;

  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFContentProperty.m"), 280, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

    if (a5)
      goto LABEL_4;
LABEL_7:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFContentProperty.m"), 281, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("propertyClass"));

    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFContentProperty.m"), 279, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  if (!v11)
    goto LABEL_6;
LABEL_3:
  if (!a5)
    goto LABEL_7;
LABEL_4:
  v12 = objc_alloc_init(WFContentPropertyBuilder);
  -[WFContentPropertyBuilder setBlock:](v12, "setBlock:", v9);
  -[WFContentPropertyBuilder setName:](v12, "setName:", v11);
  -[WFContentPropertyBuilder setPropertyClass:](v12, "setPropertyClass:", a5);

  return v12;
}

+ (id)block:(id)a3 setterBlock:(id)a4 name:(id)a5 class:(Class)a6
{
  id v10;
  void *v11;
  void *v12;
  id v13;

  v10 = a4;
  objc_msgSend(a1, "block:name:class:", a3, a5, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "setSetterBlock:", v10);
    v13 = v12;
  }

  return v12;
}

@end
