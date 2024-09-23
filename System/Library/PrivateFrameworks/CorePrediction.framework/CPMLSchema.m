@implementation CPMLSchema

- (id)init:(id)a3
{
  CPMLSchema *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CPMLSchema;
  v3 = -[CPMLSchema init](&v5, sel_init, a3);
  if (v3)
    NSLog(CFSTR("WARNING NO SCHEMA"));
  return v3;
}

- (CPMLSchema)initWithPlist:(id)a3
{
  id v4;
  CPMLSchema *v5;
  uint64_t v6;
  NSMutableArray *schema;
  uint64_t v8;
  NSMutableArray *attribute;
  uint64_t v10;
  NSMutableArray *schemaHDef;
  uint64_t v12;
  NSMutableString *schemaHeaderWithType;
  uint64_t v14;
  NSMutableArray *nsRemapTable;
  uint64_t v16;
  NSMutableArray *availableOptions;
  uint64_t v18;
  NSMutableArray *categoricalDataList;
  uint64_t v20;
  NSMutableArray *replaceMissingValue;
  uint64_t v22;
  NSMutableArray *matchReplaceValue;
  int v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  NSMutableArray *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSMutableArray *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  uint64_t v49;
  void *v50;
  NSMutableArray *v51;
  __CFString *v52;
  uint64_t v53;
  __CFString *v54;
  id v55;
  unint64_t v56;
  void *v57;
  NSMutableString *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  NSMutableString *schemaHeader;
  id v64;
  CPMLSchema *v65;
  unint64_t v66;
  int v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  int v75;
  int v76;
  void *v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  objc_super v82;
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v82.receiver = self;
  v82.super_class = (Class)CPMLSchema;
  v5 = -[CPMLSchema init](&v82, sel_init);
  if (v5)
  {
    v64 = v4;
    objc_msgSend(v4, "objectForKey:", CFSTR("schema"));
    v6 = objc_claimAutoreleasedReturnValue();
    schema = v5->schema;
    v5->schema = (NSMutableArray *)v6;

    v8 = objc_opt_new();
    attribute = v5->attribute;
    v5->attribute = (NSMutableArray *)v8;

    v10 = objc_opt_new();
    schemaHDef = v5->schemaHDef;
    v5->schemaHDef = (NSMutableArray *)v10;

    v12 = objc_opt_new();
    schemaHeaderWithType = v5->schemaHeaderWithType;
    v5->schemaHeaderWithType = (NSMutableString *)v12;

    v14 = objc_opt_new();
    nsRemapTable = v5->nsRemapTable;
    v5->nsRemapTable = (NSMutableArray *)v14;

    v16 = objc_opt_new();
    availableOptions = v5->availableOptions;
    v5->availableOptions = (NSMutableArray *)v16;

    v18 = objc_opt_new();
    categoricalDataList = v5->_categoricalDataList;
    v5->_categoricalDataList = (NSMutableArray *)v18;

    v20 = objc_opt_new();
    replaceMissingValue = v5->_replaceMissingValue;
    v5->_replaceMissingValue = (NSMutableArray *)v20;

    v22 = objc_opt_new();
    matchReplaceValue = v5->_matchReplaceValue;
    v5->_matchReplaceValue = (NSMutableArray *)v22;

    v5->yColumnPosition = -[NSMutableArray count](v5->schema, "count") - 1;
    if (-[NSMutableArray count](v5->schema, "count"))
    {
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v65 = v5;
      do
      {
        v75 = v24;
        -[NSMutableArray objectAtIndexedSubscript:](v5->schema, "objectAtIndexedSubscript:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectForKey:", CFSTR("Header"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("CPMLcol%ld_"), v26);
        v74 = v28;
        objc_msgSend(v28, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("_"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
        v31 = objc_claimAutoreleasedReturnValue();

        v32 = (void *)objc_opt_new();
        v73 = (void *)v29;
        objc_msgSend(v32, "appendString:", v29);
        v72 = (void *)v31;
        objc_msgSend(v32, "appendString:", v31);
        v71 = v32;
        -[NSMutableArray addObject:](v5->attribute, "addObject:", v32);
        objc_msgSend(v27, "objectForKey:", CFSTR("HeaderDef"));
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](v5->schemaHDef, "addObject:");
        v77 = v27;
        objc_msgSend(v27, "objectForKey:", CFSTR("reMapTable"));
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = v5->nsRemapTable;
        v69 = (void *)v33;
        if (v33)
        {
          -[NSMutableArray addObject:](v34, "addObject:", v33);
        }
        else
        {
          v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", v25);
          -[NSMutableArray addObject:](v34, "addObject:", v35);

        }
        v24 = v75;
        objc_msgSend(v27, "objectForKey:", CFSTR("predictedValue"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v36;
        if (!((v36 == 0) | v75 & 1))
        {
          if (objc_msgSend(v36, "BOOLValue"))
          {
            v5->yColumnPosition = v25;
            v24 = 1;
          }
          else
          {
            v24 = 0;
          }
        }

        objc_msgSend(v27, "objectForKey:", CFSTR("Options"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v5->availableOptions;
        if (v38)
        {
          -[NSMutableArray addObject:](v5->availableOptions, "addObject:", v38);
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](v39, "addObject:", v40);

        }
        objc_msgSend(v77, "objectForKey:", CFSTR("categoricalData"));
        v41 = objc_claimAutoreleasedReturnValue();
        v68 = (void *)v41;
        if (v41)
        {
          v42 = (void *)v41;
          v76 = v24;
          v66 = v26;
          v67 = v25;
          v43 = (void *)objc_opt_new();
          v78 = 0u;
          v79 = 0u;
          v80 = 0u;
          v81 = 0u;
          v44 = v42;
          v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v78, v83, 16);
          if (v45)
          {
            v46 = v45;
            v47 = *(_QWORD *)v79;
            do
            {
              for (i = 0; i != v46; ++i)
              {
                if (*(_QWORD *)v79 != v47)
                  objc_enumerationMutation(v44);
                v49 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * i);
                objc_msgSend(v43, "objectForKey:", v49);
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                if (v50)
                  NSLog(CFSTR("%s Cannot have duplicate category names"), "-[CPMLSchema initWithPlist:]");
                else
                  objc_msgSend(v43, "setValue:forKey:", CFSTR("1"), v49);

              }
              v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v78, v83, 16);
            }
            while (v46);
          }

          v5 = v65;
          -[NSMutableArray addObject:](v65->_categoricalDataList, "addObject:", v44);
          LODWORD(v25) = v67;
          v26 = v66;
          v24 = v76;
        }
        else
        {
          v51 = v5->_categoricalDataList;
          v43 = (void *)objc_opt_new();
          -[NSMutableArray addObject:](v51, "addObject:", v43);
        }
        v25 = (v25 + 1);

        objc_msgSend(v77, "objectForKey:", CFSTR("substituteValue"));
        v52 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "objectForKey:", CFSTR("substitutionMatch"));
        v53 = objc_claimAutoreleasedReturnValue();
        if (!v52)
          v52 = &stru_24C256E28;
        if (v53)
          v54 = (__CFString *)v53;
        else
          v54 = &stru_24C256E28;
        -[NSMutableArray addObject:](v5->_replaceMissingValue, "addObject:", v52);
        -[NSMutableArray addObject:](v5->_matchReplaceValue, "addObject:", v54);

        ++v26;
      }
      while (v26 < -[NSMutableArray count](v5->schema, "count"));
    }
    v55 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    if (-[NSMutableArray count](v5->schemaHDef, "count"))
    {
      v56 = 0;
      do
      {
        -[NSMutableArray objectAtIndex:](v5->attribute, "objectAtIndex:", v56);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableString appendString:](v5->schemaHeaderWithType, "appendString:", v57);
        -[NSMutableString appendString:](v5->schemaHeaderWithType, "appendString:", CFSTR(" "));
        v58 = v5->schemaHeaderWithType;
        -[NSMutableArray objectAtIndex:](v5->schemaHDef, "objectAtIndex:", v56);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableString appendString:](v58, "appendString:", v59);

        -[NSMutableArray objectAtIndex:](v5->attribute, "objectAtIndex:", v56);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "appendString:", v60);

        if (++v56 < -[NSMutableArray count](v5->schemaHDef, "count"))
        {
          -[NSMutableString appendString:](v5->schemaHeaderWithType, "appendString:", CFSTR(" , "));
          objc_msgSend(v55, "appendString:", CFSTR(" , "));
        }

      }
      while (v56 < -[NSMutableArray count](v5->schemaHDef, "count"));
    }
    v61 = objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithFormat:", CFSTR(" (%@) "), v55);
    schemaHeader = v5->schemaHeader;
    v5->schemaHeader = (NSMutableString *)v61;

    v4 = v64;
  }

  return v5;
}

- (unint64_t)getTotalAttributes
{
  return -[NSMutableArray count](self->attribute, "count");
}

- (BOOL)isNumType:(unint64_t)a3
{
  void *v3;
  char v4;

  -[NSMutableArray objectAtIndex:](self->schemaHDef, "objectAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INTEGER")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("REAL")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("BOOLEAN"));
  }

  return v4;
}

- (BOOL)isIntType:(unint64_t)a3
{
  void *v3;
  char v4;

  -[NSMutableArray objectAtIndex:](self->schemaHDef, "objectAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INTEGER")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("BOOLEAN"));

  return v4;
}

- (BOOL)isRealType:(unint64_t)a3
{
  void *v3;
  char v4;

  -[NSMutableArray objectAtIndex:](self->schemaHDef, "objectAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("REAL"));

  return v4;
}

- (BOOL)isStringType:(unint64_t)a3
{
  void *v3;
  int v4;

  -[NSMutableArray objectAtIndex:](self->schemaHDef, "objectAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BOOLEAN")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("INTEGER")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("REAL")) & 1) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("BLOB")) ^ 1;
  }

  return v4;
}

- (BOOL)isVectorType:(unint64_t)a3
{
  void *v3;
  char v4;

  -[NSMutableArray objectAtIndex:](self->schemaHDef, "objectAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("BLOB"));

  return v4;
}

- (BOOL)isColumnContinous:(unsigned int)a3
{
  void *v3;
  char v4;

  -[NSMutableArray objectAtIndex:](self->schemaHDef, "objectAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REAL")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("INTEGER"));

  return v4;
}

- (int)getColumnPosition:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;

  v4 = a3;
  if (-[NSMutableArray count](self->attribute, "count"))
  {
    v5 = 0;
    while (1)
    {
      -[NSMutableArray objectAtIndex:](self->attribute, "objectAtIndex:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithFormat:", CFSTR("CPMLcol%d_"), v5);
      objc_msgSend(v7, "appendString:", v4);
      if (objc_msgSend(v7, "isEqualToString:", v6))
        break;
      v8 = objc_msgSend(v4, "isEqualToString:", v6);

      if (v8)
        goto LABEL_8;
      if (++v5 >= (unint64_t)-[NSMutableArray count](self->attribute, "count"))
        goto LABEL_6;
    }

  }
  else
  {
LABEL_6:
    LODWORD(v5) = -1;
  }
LABEL_8:

  return v5;
}

- (id)getColumnName:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->attribute, "objectAtIndex:", a3);
}

- (int)getSchemaType:(unint64_t)a3
{
  if (-[CPMLSchema isStringType:](self, "isStringType:"))
    return 5;
  if (-[CPMLSchema isIntType:](self, "isIntType:", a3))
    return 3;
  if (-[CPMLSchema isRealType:](self, "isRealType:", a3))
    return 4;
  if (-[CPMLSchema isVectorType:](self, "isVectorType:", a3))
    return 7;
  NSLog(CFSTR("%s: unknown schema type"), "-[CPMLSchema getSchemaType:]");
  return 8;
}

- (int)getVectorContent:(unint64_t)a3
{
  int v5;
  void *v6;
  void *v7;

  if (-[NSMutableArray count](self->schema, "count") >= a3)
  {
    -[NSMutableArray objectAtIndex:](self->schema, "objectAtIndex:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("VectorType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("INTEGER")) & 1) != 0)
    {
      v5 = 3;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("REAL")) & 1) != 0)
    {
      v5 = 4;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("TEXT")))
    {
      v5 = 5;
    }
    else
    {
      v5 = 8;
    }

  }
  else
  {
    NSLog(CFSTR("%s index greater than content"), "-[CPMLSchema getVectorContent:]");
    return 8;
  }
  return v5;
}

- (int)getYColumnPosition
{
  return self->yColumnPosition;
}

- (BOOL)hasOptions:(unint64_t)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  -[NSMutableArray objectAtIndexedSubscript:](self->availableOptions, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 != v4;

  return v5;
}

- (id)getUserDefinedCategoricalData:(unint64_t)a3
{
  void *v5;

  if (-[NSMutableArray count](self->_categoricalDataList, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_categoricalDataList, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (unint64_t)getUserDefinedCategoricalDataCount:(unint64_t)a3
{
  void *v3;
  unint64_t v4;

  -[NSMutableArray objectAtIndex:](self->_categoricalDataList, "objectAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (BOOL)matchSubstituteValue:(unint64_t)a3 theValue:(id)a4
{
  NSMutableArray *matchReplaceValue;
  id v6;
  void *v7;

  matchReplaceValue = self->_matchReplaceValue;
  v6 = a4;
  -[NSMutableArray objectAtIndex:](matchReplaceValue, "objectAtIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(matchReplaceValue) = objc_msgSend(v7, "isEqualToString:", v6);

  return (char)matchReplaceValue;
}

- (id)getSubstituteValue:(unint64_t)a3
{
  __CFString *v5;
  void *v6;
  BOOL v7;
  void *v8;

  if (-[NSMutableArray count](self->schema, "count") >= a3)
  {
    -[NSMutableArray objectAtIndex:](self->_replaceMissingValue, "objectAtIndex:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[CPMLSchema isStringType:](self, "isStringType:", a3);
    if (v6 || !v7)
    {
      if (objc_msgSend(v6, "isEqualToString:", &stru_24C256E28))
        v8 = 0;
      else
        v8 = v6;
      v5 = v8;
    }
    else
    {
      v5 = CFSTR("0");
    }

  }
  else
  {
    NSLog(CFSTR("%s col access greater than known dimensions."), "-[CPMLSchema getSubstituteValue:]");
    v5 = 0;
  }
  return v5;
}

- (NSMutableArray)attribute
{
  return self->attribute;
}

- (NSMutableString)schemaHeader
{
  return self->schemaHeader;
}

- (NSMutableString)schemaHeaderWithType
{
  return self->schemaHeaderWithType;
}

- (NSMutableArray)nsRemapTable
{
  return self->nsRemapTable;
}

- (NSMutableArray)availableOptions
{
  return self->availableOptions;
}

- (NSMutableArray)indexColumnList
{
  return self->_indexColumnList;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexColumnList, 0);
  objc_storeStrong((id *)&self->availableOptions, 0);
  objc_storeStrong((id *)&self->_matchReplaceValue, 0);
  objc_storeStrong((id *)&self->_replaceMissingValue, 0);
  objc_storeStrong((id *)&self->_categoricalDataList, 0);
  objc_storeStrong((id *)&self->nsRemapTable, 0);
  objc_storeStrong((id *)&self->schemaHDef, 0);
  objc_storeStrong((id *)&self->attribute, 0);
  objc_storeStrong((id *)&self->schemaHeaderWithType, 0);
  objc_storeStrong((id *)&self->schemaHeader, 0);
  objc_storeStrong((id *)&self->schema, 0);
}

@end
