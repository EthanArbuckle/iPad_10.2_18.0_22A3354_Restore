@implementation MKTableRow

- (MKTableRow)init
{
  MKTableRow *v2;
  MKTableRow *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MKTableRow;
  v2 = -[MKTableRow init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[MKTableRow setDivider:](v2, "setDivider:", CFSTR("|"));
  return v3;
}

+ (id)rowWithTitle:(id)a3
{
  id v3;
  MKTableTitleRow *v4;

  v3 = a3;
  v4 = -[MKTableTitleRow initWithTitle:]([MKTableTitleRow alloc], "initWithTitle:", v3);

  return v4;
}

+ (id)rowWithCells:(id)a3
{
  id v3;
  MKTableRow *v4;
  MKTableRow *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MKTableRow);
  v5 = v4;
  if (v4)
  {
    -[MKTableRow setCells:](v4, "setCells:", v3);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[MKTableRow cells](v5, "cells", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          -[MKTableRow setTotalColumns:](v5, "setTotalColumns:", -[MKTableRow totalColumns](v5, "totalColumns")+ (int)objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10++), "columnSpan"));
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
  return v5;
}

+ (id)separatorRow
{
  return objc_alloc_init(MKTableSeparatorRow);
}

- (void)adjustColumnsToFit:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[MKTableRow cells](self, "cells");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v26;
    v21 = *(_QWORD *)v26;
    v22 = v4;
    do
    {
      v9 = 0;
      v23 = v6;
      do
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v9);
        -[MKTableRow formattedValueForCell:](self, "formattedValueForCell:", v10, v21, v22);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "length");

        if (objc_msgSend(v10, "columnSpan") == 1)
        {
          objc_msgSend(v4, "objectAtIndexedSubscript:", v7);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "adjustWidthToFit:", v12);
        }
        else
        {
          objc_msgSend(v4, "subarrayWithRange:", v7, (int)objc_msgSend(v10, "columnSpan"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "count");
          if ((int)v12 >= 1)
          {
            v15 = 0;
            v16 = vcvtpd_s64_f64((double)(int)v12 / (double)v14);
            do
            {
              objc_msgSend(v13, "objectAtIndexedSubscript:", v15);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = v17;
              if ((int)v12 >= v16)
                v19 = v16;
              else
                v19 = v12;
              objc_msgSend(v17, "adjustWidthToFit:", v19);
              -[MKTableRow divider](self, "divider");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v12) = v12 - v16 - objc_msgSend(v20, "length");

              ++v15;
            }
            while ((int)v12 > 0);
            v8 = v21;
            v4 = v22;
            v6 = v23;
          }
        }

        v7 += objc_msgSend(v10, "columnSpan");
        ++v9;
      }
      while (v9 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v6);
  }

}

- (id)formattedValueForCell:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a3, "formattedValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR(" %@ "), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)asciiRepresentationUsingColumns:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id obj;
  uint64_t v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BDBCEB8]);
  -[MKTableRow cells](self, "cells");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v5, "initWithCapacity:", objc_msgSend(v6, "count"));

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[MKTableRow cells](self, "cells");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v29 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v32 != v29)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        if ((int)objc_msgSend(v11, "columnSpan") < 1)
        {
          v13 = 0;
        }
        else
        {
          v12 = 0;
          v13 = 0;
          do
          {
            objc_msgSend(v4, "objectAtIndexedSubscript:", v9 + v12);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v13 += objc_msgSend(v14, "width");

            ++v12;
          }
          while (v12 < (int)objc_msgSend(v11, "columnSpan"));
        }
        v15 = objc_msgSend(v11, "columnSpan") - 1;
        -[MKTableRow divider](self, "divider");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v13 + v15 * objc_msgSend(v16, "length");

        -[MKTableRow formattedValueForCell:](self, "formattedValueForCell:", v11);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v11, "alignment");
        if (v19)
        {
          if (v19 == 1)
          {
            objc_msgSend(v18, "padToLength:withString:", v17, CFSTR(" "));
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (v19 != 2)
              goto LABEL_18;
            objc_msgSend(v18, "padLeftToLength:withString:", v17, CFSTR(" "));
            v20 = objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          objc_msgSend(v18, "padRightToLength:withString:", v17, CFSTR(" "));
          v20 = objc_claimAutoreleasedReturnValue();
        }
        v21 = (void *)v20;

        v18 = v21;
LABEL_18:
        objc_msgSend(v30, "addObject:", v18);
        v9 += objc_msgSend(v11, "columnSpan");

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v8);
  }

  v22 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  -[MKTableRow divider](self, "divider");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "appendString:", v23);

  -[MKTableRow divider](self, "divider");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "componentsJoinedByString:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "appendString:", v25);

  -[MKTableRow divider](self, "divider");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "appendString:", v26);

  return v22;
}

- (id)csvRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BDBCEB8]);
  -[MKTableRow cells](self, "cells");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[MKTableRow cells](self, "cells", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[MKTableRow csvSafeValueForCell:](self, "csvSafeValueForCell:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v12);

        if ((int)objc_msgSend(v11, "columnSpan") >= 2)
        {
          v13 = 1;
          do
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "string");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v14);

            ++v13;
          }
          while (v13 < (int)objc_msgSend(v11, "columnSpan"));
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(","));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)csvSafeValueForCell:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a3, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\"), CFSTR("\"\"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" "));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "containsString:", CFSTR(",")))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\"%@\"), v5);
      v6 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v6;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (int)totalWidthOfColumns:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t i;
  int v10;
  void *v11;
  int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v4);
        v7 += objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "width");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }
  v10 = objc_msgSend(v4, "count");
  -[MKTableRow divider](self, "divider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  return v7 + v12 + v12 * v10;
}

- (int64_t)totalColumns
{
  return self->_totalColumns;
}

- (void)setTotalColumns:(int64_t)a3
{
  self->_totalColumns = a3;
}

- (NSArray)cells
{
  return self->_cells;
}

- (void)setCells:(id)a3
{
  objc_storeStrong((id *)&self->_cells, a3);
}

- (NSString)divider
{
  return self->_divider;
}

- (void)setDivider:(id)a3
{
  objc_storeStrong((id *)&self->_divider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_divider, 0);
  objc_storeStrong((id *)&self->_cells, 0);
}

@end
