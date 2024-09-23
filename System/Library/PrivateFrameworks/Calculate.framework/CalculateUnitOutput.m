@implementation CalculateUnitOutput

- (CalculateUnitOutput)initWithLocale:(id)a3
{
  id v5;
  CalculateUnitOutput *v6;
  CalculateUnitOutput *v7;
  uint64_t v8;
  UnitsInfo *unitsInfo;
  int v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CalculateUnitOutput;
  v6 = -[CalculateUnitOutput init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_locale, a3);
    +[UnitsInfo converterUnits](UnitsInfo, "converterUnits");
    v8 = objc_claimAutoreleasedReturnValue();
    unitsInfo = v7->_unitsInfo;
    v7->_unitsInfo = (UnitsInfo *)v8;

    v10 = -[UnitsInfo unitCount](v7->_unitsInfo, "unitCount");
    v7->_count = v10;
    v7->_lengths = ($A3B2E143E1A03423F9FC703C010436DC *)malloc_type_calloc(v10, 0x10uLL, 0x1000040451B5BE8uLL);
  }

  return v7;
}

- (unint64_t)resolvedUnitFormatForUnitID:(int)a3 string:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t (**v11)(void *, void *, uint64_t);
  void *v12;
  int v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  $A3B2E143E1A03423F9FC703C010436DC *lengths;
  int var1;
  int var2;
  int v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  int var0;
  int var3;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t);
  void *v31;
  id v32;
  _QWORD aBlock[5];

  v6 = a4;
  if (a3 < 0 || self->_count <= a3)
  {
    v14 = 4;
    goto LABEL_18;
  }
  v7 = a3;
  -[UnitsInfo objectAtIndexedSubscript:](self->_unitsInfo, "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "length");
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__CalculateUnitOutput_resolvedUnitFormatForUnitID_string___block_invoke;
  aBlock[3] = &unk_1E6E9FB68;
  aBlock[4] = self;
  v28 = MEMORY[0x1E0C809B0];
  v29 = 3221225472;
  v30 = __58__CalculateUnitOutput_resolvedUnitFormatForUnitID_string___block_invoke_2;
  v31 = &unk_1E6E9FB90;
  v10 = _Block_copy(aBlock);
  v32 = v10;
  v11 = (uint64_t (**)(void *, void *, uint64_t))_Block_copy(&v28);
  if (v9 != 3)
    goto LABEL_6;
  objc_msgSend(v8, "typeInfo", v28, v29, v30, v31);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isCurrency");

  if (!v13
    || (v14 = 2,
        (*((void (**)(void *, void *, uint64_t, _QWORD))v10 + 2))(v10, v8, 2, 0),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = objc_msgSend(v15, "compare:options:", v6, 1),
        v15,
        v16))
  {
LABEL_6:
    lengths = self->_lengths;
    var1 = lengths[v7].var1;
    if (!var1)
    {
      var1 = v11[2](v11, v8, 2);
      lengths = self->_lengths;
      lengths[v7].var1 = var1;
    }
    var2 = lengths[v7].var2;
    if (!var2)
    {
      var2 = v11[2](v11, v8, 3);
      lengths = self->_lengths;
      lengths[v7].var2 = var2;
    }
    v20 = v9 + 3;
    if (v20 < var1 || v20 > var2)
    {
      if (v20 < var1)
      {
        v25 = v7;
        var0 = lengths[v25].var0;
        if (!var0)
        {
          var0 = v11[2](v11, v8, 1);
          self->_lengths[v25].var0 = var0;
        }
        if (v20 <= var0)
        {
          v14 = 1;
        }
        else if ((double)var0 + (double)(var1 - var0) * 0.5 >= (double)v20)
        {
          v14 = 1;
        }
        else
        {
          v14 = 2;
        }
        goto LABEL_16;
      }
      var3 = lengths[v7].var3;
      if (!var3)
      {
        var3 = v11[2](v11, v8, 4);
        self->_lengths[v7].var3 = var3;
      }
      if (v20 > var3)
      {
        if (var3 == var2)
          v14 = 3;
        else
          v14 = 4;
        goto LABEL_16;
      }
      v21 = (double)var2 + (double)(var3 - var2) * 0.5 < (double)v20;
      v22 = 3;
      v23 = 4;
    }
    else
    {
      v21 = (double)var1 + (double)(var2 - var1) * 0.5 < (double)v20;
      v22 = 2;
      v23 = 3;
    }
    if (v21)
      v14 = v23;
    else
      v14 = v22;
  }
LABEL_16:

LABEL_18:
  return v14;
}

- (void)dealloc
{
  $A3B2E143E1A03423F9FC703C010436DC *lengths;
  objc_super v4;

  lengths = self->_lengths;
  if (lengths)
    free(lengths);
  v4.receiver = self;
  v4.super_class = (Class)CalculateUnitOutput;
  -[CalculateUnitOutput dealloc](&v4, sel_dealloc);
}

- ($A3B2E143E1A03423F9FC703C010436DC)lengths
{
  return self->_lengths;
}

- (void)setLengths:(id *)a3
{
  self->_lengths = a3;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (UnitsInfo)unitsInfo
{
  return self->_unitsInfo;
}

- (void)setUnitsInfo:(id)a3
{
  objc_storeStrong((id *)&self->_unitsInfo, a3);
}

- (int)count
{
  return self->_count;
}

- (void)setCount:(int)a3
{
  self->_count = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitsInfo, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

id __58__CalculateUnitOutput_resolvedUnitFormatForUnitID_string___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v7 = a2;
  objc_msgSend(v7, "typeInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_1E6EAD1D0, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (int)objc_msgSend(v10, "intValue");

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(v7, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[CalculateUnit localizedNameForValue:locale:retainingFormat:unitFormat:unitType:name:](CalculateUnit, "localizedNameForValue:locale:retainingFormat:unitFormat:unitType:name:", v12, a4, a3, v11, v13, 1.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

uint64_t __58__CalculateUnitOutput_resolvedUnitFormatForUnitID_string___block_invoke_2(uint64_t a1)
{
  void *v1;
  unint64_t v2;
  uint64_t v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "length");
  if (v2 <= 1)
    v3 = 1;
  else
    v3 = v2;

  return v3;
}

@end
