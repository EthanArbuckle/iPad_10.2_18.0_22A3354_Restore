@implementation CalculateTerm

- (CalculateTerm)init
{
  CalculateTerm *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CalculateTerm;
  result = -[CalculateTerm init](&v3, sel_init);
  if (result)
  {
    result->_decimalValue.w[0] = 0;
    result->_decimalValue.w[1] = 0x3040000000000000;
  }
  return result;
}

- (void)_setDecimalValue:(id)a3
{
  NSNumber *v4;
  NSNumber *value;

  self->_decimalValue = ($739D1A12408C92E4BFA0C2DF4C691557)a3;
  +[CalculateResult decimalNumberWithDecimal128:](CalculateResult, "decimalNumberWithDecimal128:");
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  value = self->_value;
  self->_value = v4;

}

- (id)resultContainingNumberFormatter
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  -[CalculateTerm result](self, "result");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    while (1)
    {
      objc_msgSend(v2, "numberFormatter");
      v3 = objc_claimAutoreleasedReturnValue();
      if (v3)
        break;
      objc_msgSend(v2, "parent");
      v4 = objc_claimAutoreleasedReturnValue();

      v2 = (id)v4;
      if (!v4)
        return v2;
    }
    v5 = (void *)v3;
    v2 = v2;

  }
  return v2;
}

- (id)numberFormatter
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[CalculateTerm resultContainingNumberFormatter](self, "resultContainingNumberFormatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3 || (objc_msgSend(v3, "numberFormatter"), (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[CalculateTerm locale](self, "locale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CalculateResult defaultNumberFormatter:](CalculateResult, "defaultNumberFormatter:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)locale
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[CalculateTerm result](self, "result");
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v8 = 0;
LABEL_14:
    +[Localize systemLocale](Localize, "systemLocale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  v3 = (void *)v2;
  do
  {
    objc_msgSend(v3, "locales");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(v3, "locales");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "count"))
      {
        objc_msgSend(v3, "locales");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }

    objc_msgSend(v3, "parent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      break;
    v3 = v8;
  }
  while (v8);
  if (!v7)
    goto LABEL_14;
LABEL_15:

  return v7;
}

- (BOOL)isCurrency
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[CalculateTerm units](self, "units");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 1)
  {
    -[CalculateTerm units](self, "units");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "unitType") == 16;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)getMaximumFractionDigits:(unint64_t *)a3 minimumFractionDigits:(unint64_t *)a4
{
  uint64_t v7;
  uint64_t v8;

  v7 = -[CalculateTerm decimalValue](self, "decimalValue");
  -[CalculateTerm getMaximumFractionDigits:minimumFractionDigits:forValue:](self, "getMaximumFractionDigits:minimumFractionDigits:forValue:", a3, a4, v7, v8);
}

- (void)getMaximumFractionDigits:(unint64_t *)a3 minimumFractionDigits:(unint64_t *)a4 forValue:(id)a5
{
  unint64_t v5;
  unint64_t v6;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unsigned int v39;
  int v40;
  unsigned int v41;
  CalculateResult **p_result;
  id WeakRetained;
  int v44;
  id v45;
  int v46;
  unint64_t *v47;
  id v48;
  int v49;

  v5 = a5.var0[1];
  v6 = a5.var0[0];
  -[CalculateTerm resultContainingNumberFormatter](self, "resultContainingNumberFormatter");
  v48 = (id)objc_claimAutoreleasedReturnValue();
  -[CalculateTerm numberFormatter](self, "numberFormatter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    v11 = objc_msgSend(v48, "flexibleFractionDigits");
  }
  else
  {
    -[CalculateTerm result](self, "result");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[CalculateTerm result](self, "result");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v13, "flexibleFractionDigits");

    }
    else
    {
      v11 = 1;
    }
  }
  v14 = objc_msgSend(v10, "minimumFractionDigits");
  if (-[CalculateTerm isCurrency](self, "isCurrency") && objc_msgSend(v10, "numberStyle") != 4)
  {
    v47 = a4;
    if (getMaximumFractionDigits_minimumFractionDigits_forValue__onceToken != -1)
      dispatch_once(&getMaximumFractionDigits_minimumFractionDigits_forValue__onceToken, &__block_literal_global_371);
    -[CalculateTerm units](self, "units");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)getMaximumFractionDigits_minimumFractionDigits_forValue__decimalPlaces, "objectForKeyedSubscript:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend((id)getMaximumFractionDigits_minimumFractionDigits_forValue__decimalPlaces, "objectForKeyedSubscript:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v20, "integerValue");
      v14 = v15;
    }
    else
    {
      v20 = (void *)objc_opt_new();
      objc_msgSend(v20, "setCurrencyCode:", v18);
      objc_msgSend(v20, "setNumberStyle:", 2);
      v14 = objc_msgSend(v20, "maximumFractionDigits");
      v15 = objc_msgSend(v20, "maximumFractionDigits");
    }

    a4 = v47;
  }
  else
  {
    v15 = -1;
  }
  v49 = 0;
  if (v15 == -1)
    v21 = v11;
  else
    v21 = 0;
  if (v21 == 1)
  {
    v34 = v5 & 0x7FFFFFFFFFFFFFFFLL;
    v22 = __bid128_round_integral_zero(v6, v5 & 0x7FFFFFFFFFFFFFFFLL, &v49);
    v24 = v23;
    v25 = __bid128_sub(v6, v34, v22, v23, 4, &v49);
    v27 = __bid128_log10(v25, v26, 4u, &v49);
    v29 = __bid128_round_integral_negative(v27, v28, &v49);
    v31 = __bid128_add(v29, v30 ^ 0x8000000000000000, 1uLL, 0xB040000000000000, 4, &v49);
    v33 = __bid128_to_int32_int(v31, v32, &v49);
    LODWORD(v34) = v33 & ~(v33 >> 31);
    if (__bid128_quiet_greater(v22, v24, 0, 0x3040000000000000, &v49))
    {
      v35 = __bid128_log10(v22, v24, 4u, &v49);
      v37 = __bid128_round_integral_negative(v35, v36, &v49);
      v39 = ~__bid128_to_int32_int(v37, v38, &v49);
    }
    else
    {
      v39 = 0;
    }
    v40 = objc_msgSend(v10, "maximumIntegerDigits");
    v41 = (v39 + v40) & ~((int)(v39 + v40) >> 31);
    if (v41 >= v34)
      v34 = v34;
    else
      v34 = v41;
    v15 = objc_msgSend(v10, "maximumFractionDigits") + v34;
  }
  if (v15 == -1)
    v15 = objc_msgSend(v10, "maximumFractionDigits");
  p_result = &self->_result;
  WeakRetained = objc_loadWeakRetained((id *)&self->_result);
  v44 = objc_msgSend(WeakRetained, "minimumFractionDigits");

  if (v44)
  {
    v45 = objc_loadWeakRetained((id *)p_result);
    v46 = objc_msgSend(v45, "minimumFractionDigits");

    if (v14 <= v46)
      v14 = v46;
  }
  if (a3)
    *a3 = v15;
  if (a4)
    *a4 = v14;

}

- (NSString)formattedValue
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  id WeakRetained;
  int v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  id v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSNumber *forceScientificNotation;
  void *v26;
  unint64_t v27;
  unint64_t v28;
  void *v29;
  void *v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  int v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void (**v72)(void *, void *);
  uint64_t v73;
  uint64_t v74;
  _QWORD v75[4];
  id v76;
  _QWORD aBlock[4];
  id v78;
  uint64_t v79;
  int v80;
  uint64_t v81;
  uint64_t v82;

  -[CalculateTerm resultContainingNumberFormatter](self, "resultContainingNumberFormatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalculateTerm numberFormatter](self, "numberFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = objc_msgSend(v3, "autoScientificNotation");
    v68 = objc_msgSend(v3, "scientificNotationFormat");
  }
  else
  {
    -[CalculateTerm result](self, "result");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[CalculateTerm result](self, "result");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v7, "autoScientificNotation");

      -[CalculateTerm result](self, "result");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = objc_msgSend(v8, "scientificNotationFormat");

    }
    else
    {
      v68 = 1;
      v5 = 1;
    }
  }
  v81 = 0;
  v82 = 0;
  -[CalculateTerm getMaximumFractionDigits:minimumFractionDigits:](self, "getMaximumFractionDigits:minimumFractionDigits:", &v82, &v81);
  if (objc_msgSend(v4, "usesSignificantDigits"))
    v9 = objc_msgSend(v4, "maximumSignificantDigits");
  else
    v9 = objc_msgSend(v4, "maximumIntegerDigits");
  v10 = v9;
  if (!v9
    || (WeakRetained = objc_loadWeakRetained((id *)&self->_result),
        v12 = objc_msgSend(WeakRetained, "isSimpleVerticalMath"),
        WeakRetained,
        v12))
  {
    v10 = 34;
  }
  if (v10 >= 0x22)
    v13 = 34;
  else
    v13 = v10;
  v14 = -[CalculateTerm isCurrency](self, "isCurrency");
  v80 = 0;
  v15 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __31__CalculateTerm_formattedValue__block_invoke;
  aBlock[3] = &unk_1E6E9FC00;
  v16 = v4;
  v78 = v16;
  v79 = v13;
  v75[0] = v15;
  v75[1] = 3221225472;
  v75[2] = __31__CalculateTerm_formattedValue__block_invoke_2;
  v75[3] = &unk_1E6E9FC28;
  v17 = _Block_copy(aBlock);
  v76 = v17;
  v72 = (void (**)(void *, void *))_Block_copy(v75);
  v18 = -[CalculateTerm decimalValue](self, "decimalValue");
  if (__bid128_quiet_greater(v18, v19, 1uLL, 0xB040000000000000, &v80))
  {
    v20 = -[CalculateTerm decimalValue](self, "decimalValue");
    v5 &= (__bid128_quiet_less(v20, v21, 1uLL, 0x3040000000000000, &v80) == 0) | ~v14;
  }
  objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithMantissa:exponent:isNegative:", 1, 0, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithMantissa:exponent:isNegative:", 1, (__int16)v13, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "decimalNumberByMultiplyingBy:", v22);
  v24 = objc_claimAutoreleasedReturnValue();
  forceScientificNotation = self->_forceScientificNotation;
  v71 = (void *)v24;
  if (!forceScientificNotation)
  {
    v69 = v16;
    -[CalculateTerm value](self, "value");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v26, "compare:", v23) != -1)
    {
LABEL_21:

      v16 = v69;
      goto LABEL_22;
    }
    v67 = v3;
    -[CalculateTerm value](self, "value");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "compare:", v24);

    if (v50 == 1)
      v51 = v5;
    else
      v51 = 0;
    if (v51 != 1)
    {
      v3 = v67;
      v16 = v69;
      if (v50 == 1)
        goto LABEL_23;
      goto LABEL_22;
    }
    objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithMantissa:exponent:isNegative:", 1, (__int16)(1 - v13), 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "decimalNumberByMultiplyingBy:", v22);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalculateTerm value](self, "value");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v53, "compare:", v26) == 1)
    {

    }
    else
    {
      -[CalculateTerm value](self, "value");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend(v60, "compare:", v52);

      v3 = v67;
      if (v61 != -1)
      {
LABEL_47:

        goto LABEL_21;
      }
    }
    v62 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setLocale:", v63);

    objc_msgSend(v62, "setNumberStyle:", 0);
    if (objc_msgSend(v69, "usesSignificantDigits"))
      objc_msgSend(v62, "setMaximumSignificantDigits:", objc_msgSend(v69, "maximumSignificantDigits"));
    else
      objc_msgSend(v62, "setMaximumFractionDigits:", v82);
    -[CalculateTerm value](self, "value");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "stringFromNumber:", v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v65, "isEqualToString:", CFSTR("0")) & 1) == 0
      && !objc_msgSend(v65, "isEqualToString:", CFSTR("-0")))
    {

      v3 = v67;
      v16 = v69;
      goto LABEL_23;
    }

    v3 = v67;
    goto LABEL_47;
  }
  if (!-[NSNumber BOOLValue](forceScientificNotation, "BOOLValue"))
    goto LABEL_23;
LABEL_22:
  v27 = -[CalculateTerm decimalValue](self, "decimalValue");
  if (__bid128_quiet_equal(v27, v28, 0, 0x3040000000000000uLL, &v80))
  {
LABEL_23:
    -[CalculateTerm value](self, "value");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, void *, uint64_t, uint64_t))v17 + 2))(v17, v29, v82, v81);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
  v70 = v16;
  v66 = v3;
  v31 = __bid128_log10(self->_decimalValue.w[0], self->_decimalValue.w[1] & 0x7FFFFFFFFFFFFFFFLL, 4u, &v80);
  v33 = __bid128_round_integral_negative(v31, v32, &v80);
  v35 = v34;
  v36 = bid128_pow_fix(0xAuLL, 0x3040000000000000uLL, v33, v34, 4u, &v80);
  v38 = v37;
  v39 = -[CalculateTerm decimalValue](self, "decimalValue");
  v41 = __bid128_div(v39, v40, v36, v38, 4, &v80);
  v43 = v42;
  +[CalculateResult decimalNumberWithDecimal128:](CalculateResult, "decimalNumberWithDecimal128:", v41, v42);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 10);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = 0;
  v74 = 0;
  -[CalculateTerm getMaximumFractionDigits:minimumFractionDigits:forValue:](self, "getMaximumFractionDigits:minimumFractionDigits:forValue:", &v74, &v73, v41, v43);
  if (v68 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), __bid128_to_int32_int(v33, v35, &v80));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "formatString:usesGroupingSeparator:", v54, 0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    v55 = (void *)MEMORY[0x1E0CB3940];
    (*((void (**)(void *, void *, uint64_t, uint64_t))v17 + 2))(v17, v29, v74, v73);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v72[2](v72, v44);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "stringWithFormat:", CFSTR("%@*%@^%@"), v48, v56, v46);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v68)
    {
      v72[2](v72, v44);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "formatString:byAppendingExponent:", v57, __bid128_to_int32_int(v33, v35, &v80));
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      v58 = (void *)MEMORY[0x1E0CB3940];
      (*((void (**)(void *, void *, uint64_t, uint64_t))v17 + 2))(v17, v29, v74, v73);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "stringWithFormat:", CFSTR("%@×%@"), v48, v46);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), __bid128_to_int32_int(v33, v35, &v80));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "formatString:usesGroupingSeparator:", v45, 0);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      v47 = (void *)MEMORY[0x1E0CB3940];
      (*((void (**)(void *, void *, uint64_t, uint64_t))v17 + 2))(v17, v29, v74, v73);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "stringWithFormat:", CFSTR("%@e%@"), v48, v46);
    }
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v3 = v66;

  v16 = v70;
LABEL_37:

  return (NSString *)v30;
}

- (double)_valueWithoutIrrelevantDecimals
{
  void *v3;
  void *v4;
  id v5;
  unsigned __int8 *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  int v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  int v40;
  unint64_t v41;
  uint64_t v43;
  int v44;

  v44 = 0;
  v3 = (void *)MEMORY[0x1E0CB3940];
  -[CalculateTerm value](self, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@"), v4);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (unsigned __int8 *)objc_msgSend(v5, "UTF8String");

  v7 = __bid128_from_string(v6, 4, &v44);
  v9 = v8;
  v10 = __bid128_quiet_less(v7, v8, 0, 0x3040000000000000, &v44);
  if (v10)
    v9 &= ~0x8000000000000000;
  if (__bid128_quiet_greater(v7, v9, 0x2710uLL, 0x3040000000000000, &v44))
  {
    v11 = __bid128_add(v7, v9, 0x2710uLL, 0xB040000000000000, 4, &v44);
    v13 = __bid128_fmod(v11, v12, 0x2710uLL, 0x3040000000000000uLL, &v44);
    v7 = __bid128_add(v13, v14, 0x2710uLL, 0x3040000000000000, 4, &v44);
    v9 = v15;
  }
  v43 = 0;
  -[CalculateTerm getMaximumFractionDigits:minimumFractionDigits:](self, "getMaximumFractionDigits:minimumFractionDigits:", &v43, 0);
  if (v43)
  {
    if ((int)v43 >= 0)
      v16 = v43;
    else
      v16 = -(int)v43;
    if ((int)v43 < 0)
      v17 = 0xB040000000000000;
    else
      v17 = 0x3040000000000000;
    v18 = bid128_pow_fix(0xAuLL, 0x3040000000000000uLL, v16, v17, 4u, &v44);
    v20 = v19;
    v21 = __bid128_mul(v7, v9, v18, v19, 4u, &v44);
    v23 = __bid128_round_integral_exact(v21, v22, 4, &v44);
    v25 = __bid128_div(v23, v24, v18, v20, 4, &v44);
    v27 = v26;
    v28 = __bid128_div(1uLL, 0x3040000000000000uLL, 0xAuLL, 0x3040000000000000uLL, 4, &v44);
    if ((int)v43 + 2 < 0)
      v30 = (-2 - v43);
    else
      v30 = (v43 + 2);
    if ((int)v43 <= -3)
      v31 = 0xB040000000000000;
    else
      v31 = 0x3040000000000000;
    v32 = bid128_pow_fix(v28, v29, v30, v31, 4u, &v44);
    v34 = v33;
    v35 = __bid128_round_integral_exact(v25, v27, 4, &v44);
    v37 = v36;
    v38 = __bid128_sub(v35, v36, v25, v27, 4, &v44);
    v40 = __bid128_quiet_less_equal(v38, v39 & 0x7FFFFFFFFFFFFFFFLL, v32, v34, &v44);
    if (v40)
      v9 = v37;
    else
      v9 = v27;
    if (v40)
      v7 = v35;
    else
      v7 = v25;
  }
  if (v10)
    v41 = v9 ^ 0x8000000000000000;
  else
    v41 = v9;
  return __bid128_to_binary64(v7, v41, 4, &v44);
}

- (id)emptyNumeratorString
{
  void *v2;
  void *v3;

  -[CalculateTerm numberFormatter](self, "numberFormatter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromNumber:", &unk_1E6EABF40);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CalculateUnit)primaryUnit
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[CalculateTerm units](self, "units", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v8, "isNumerator") & 1) != 0)
        {
          v9 = v8;

          goto LABEL_15;
        }
        if (!v5)
          v5 = v8;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v5 = 0;
  }

  v5 = v5;
  v9 = v5;
LABEL_15:

  return (CalculateUnit *)v9;
}

- (NSString)formattedUnit
{
  return (NSString *)-[CalculateTerm formattedUnitReplacingFirstNumerator:](self, "formattedUnitReplacingFirstNumerator:", 0);
}

- (id)localizedNameForValue:(double)a3 locale:(id)a4 retainingFormat:(BOOL)a5 unit:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  -[CalculateTerm result](self, "result");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "resolvedUnitFormats");
  }
  else
  {
    v29 = 0;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
  }
  v14 = *((_QWORD *)&v21 + objc_msgSend(v10, "unitType", v21, v22, v23, v24, v25, v26, v27, v28, v29));
  objc_msgSend(v13, "inputValueAndUnit");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 2;
  v17 = 4;
  if (v14 != 3)
    v17 = v14;
  if (v14 != 1)
    v16 = v17;
  if (v15)
    v18 = v16;
  else
    v18 = v14;
  objc_msgSend(v10, "localizedNameForValue:locale:retainingFormat:unitFormat:", v11, v6, v18, a3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)formattedUnitReplacingFirstNumerator:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  void *v15;
  int v16;
  double v17;
  double v18;
  void *v19;
  char v20;
  int v21;
  int v22;
  CalculateTerm *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  int v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  __CFString *v40;
  __CFString *v41;
  void *v43;
  id v44;
  void *v45;
  id obj;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  int v50;
  CalculateTerm *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CalculateTerm locale](self, "locale");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  -[CalculateTerm units](self, "units");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v57;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v57 != v8)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * i), "isNumerator") & 1) != 0)
        {
          v10 = 0;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 1;
LABEL_11:

  v11 = (void *)objc_opt_new();
  v12 = (void *)objc_opt_new();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  -[CalculateTerm units](self, "units");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v45 = v11;
  v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
  if (!v49)
    goto LABEL_46;
  v50 = 0;
  v13 = 1;
  v47 = *(_QWORD *)v53;
  v48 = v12;
  v51 = self;
  v44 = v4;
  do
  {
    v14 = 0;
    do
    {
      if (*(_QWORD *)v53 != v47)
        objc_enumerationMutation(obj);
      v15 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v14);
      v16 = objc_msgSend(v15, "isNumerator");
      v17 = 1.0;
      if (!v16)
      {
        if ((v10 & 1) == 0)
          goto LABEL_21;
LABEL_20:
        -[CalculateTerm _valueWithoutIrrelevantDecimals](self, "_valueWithoutIrrelevantDecimals");
        v17 = v18;
        goto LABEL_21;
      }
      if ((v13 & 1) != 0)
        goto LABEL_20;
LABEL_21:
      objc_msgSend(v15, "name");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v16 ^ 1;
      if (v4)
        v21 = v16 ^ 1;
      else
        v21 = 1;
      if (((v21 | v50) & 1) == 0)
      {
        v29 = v4;
        v50 = 1;
        v12 = v48;
        goto LABEL_37;
      }
      v22 = objc_msgSend(v15, "exponent");
      -[CalculateTerm result](self, "result");
      v23 = self;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "localizeUnit");

      if (!v25)
        goto LABEL_32;
      -[CalculateTerm localizedNameForValue:locale:retainingFormat:unit:](v23, "localizedNameForValue:locale:retainingFormat:unit:", v43, 0, v15, v17);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22 != 1)
      {
        objc_msgSend(v15, "unitInfo");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "impliesDivision");

        if (v28)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@)"), v26);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_32:
          v12 = v48;
          goto LABEL_33;
        }
      }
      if (objc_msgSend(v26, "hasSuffix:", CFSTR("²")))
      {
        objc_msgSend(v26, "stringByReplacingOccurrencesOfString:withString:", CFSTR("²"), &stru_1E6EA0F18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v22 *= 2;
        goto LABEL_32;
      }
      v12 = v48;
      if (objc_msgSend(v26, "hasSuffix:", CFSTR("³")))
      {
        objc_msgSend(v26, "stringByReplacingOccurrencesOfString:withString:", CFSTR("³"), &stru_1E6EA0F18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v22 *= 3;
      }
      else
      {
        v19 = v26;
      }
LABEL_33:
      -[CalculateTerm numberFormatter](v51, "numberFormatter");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v30;
      if (v22 >= 0)
        v32 = v22;
      else
        v32 = -v22;
      objc_msgSend(v30, "formatString:byAppendingExponent:", v19, v32);
      v29 = (id)objc_claimAutoreleasedReturnValue();

      v19 = v31;
      v4 = v44;
      v11 = v45;
      v20 = v16 ^ 1;
LABEL_37:

      if (v16)
        v33 = v11;
      else
        v33 = v12;
      v10 &= v16;
      v13 &= v20;
      objc_msgSend(v33, "addObject:", v29);

      ++v14;
      self = v51;
    }
    while (v49 != v14);
    v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
    v49 = v34;
  }
  while (v34);
LABEL_46:

  if (objc_msgSend(v11, "count") || objc_msgSend(v12, "count"))
  {
    -[CalculateTerm emptyNumeratorString](self, "emptyNumeratorString");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
    {
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR("·"));
      v36 = objc_claimAutoreleasedReturnValue();

      v35 = (void *)v36;
    }
    if (objc_msgSend(v12, "count") == 1)
    {
      v37 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "stringWithFormat:", CFSTR("/%@"), v38);
      goto LABEL_54;
    }
    if (objc_msgSend(v12, "count"))
    {
      v39 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v12, "componentsJoinedByString:", CFSTR("·"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "stringWithFormat:", CFSTR("/(%@)"), v38);
LABEL_54:
      v40 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v40 = &stru_1E6EA0F18;
    }
    v11 = v45;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v35, v40);
    v41 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v41 = &stru_1E6EA0F18;
  }

  return v41;
}

- (NSString)formattedResult
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[CalculateTerm units](self, "units");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v25;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v7);
      if ((objc_msgSend(v8, "isNumerator") & 1) != 0)
        break;
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v9 = v8;

    if (!v9)
      goto LABEL_15;
    -[CalculateTerm locale](self, "locale");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[CalculateTerm _valueWithoutIrrelevantDecimals](self, "_valueWithoutIrrelevantDecimals");
    -[CalculateTerm localizedNameForValue:locale:retainingFormat:unit:](self, "localizedNameForValue:locale:retainingFormat:unit:", v10, 1, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalculateTerm formattedValue](self, "formattedValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", CFSTR("%g"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[CalculateTerm numberFormatter](self, "numberFormatter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v9, "exponent");
    if (v15 >= 0)
      v16 = v15;
    else
      v16 = -v15;
    objc_msgSend(v14, "formatString:byAppendingExponent:", v13, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[CalculateTerm formattedUnitReplacingFirstNumerator:](self, "formattedUnitReplacingFirstNumerator:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_9:

LABEL_15:
    -[CalculateTerm formattedUnit](self, "formattedUnit");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[CalculateTerm formattedValue](self, "formattedValue");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length"))
    {
      -[CalculateTerm emptyNumeratorString](self, "emptyNumeratorString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v9, "hasPrefix:", v19);
      v21 = (void *)MEMORY[0x1E0CB3940];
      if (v20)
      {
        objc_msgSend(v9, "substringFromIndex:", objc_msgSend(v19, "length"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringWithFormat:", CFSTR("%@%@"), v10, v22);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v10, v9);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      v10 = v10;
      v18 = v10;
    }
  }

  return (NSString *)v18;
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;

  v4 = a3;
  -[CalculateTerm value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "compare:", v6);

  if (!v7)
  {
    -[CalculateTerm units](self, "units");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");
    objc_msgSend(v4, "units");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");
    v7 = v9 < v11 ? -1 : v9 > v11;

    if (!v7)
    {
      -[CalculateTerm units](self, "units");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v13, "count");

      if (v7)
      {
        v14 = 0;
        while (1)
        {
          -[CalculateTerm units](self, "units");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectAtIndexedSubscript:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "units");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectAtIndexedSubscript:", v14);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = objc_msgSend(v16, "compare:", v18);

          if (v7)
            break;
          ++v14;
          -[CalculateTerm units](self, "units");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "count");

          if (v14 >= v20)
          {
            v7 = 0;
            break;
          }
        }
      }
    }
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[CalculateTerm compare:](self, "compare:", v4) == 0;

  return v5;
}

- (NSNumber)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (NSArray)units
{
  return self->_units;
}

- (CalculateResult)result
{
  return (CalculateResult *)objc_loadWeakRetained((id *)&self->_result);
}

- (void)setResult:(id)a3
{
  objc_storeWeak((id *)&self->_result, a3);
}

- ($71D83D51AB0F57F7CF166351F850C832)decimalValue
{
  unint64_t v2;
  unint64_t v3;
  $71D83D51AB0F57F7CF166351F850C832 result;

  v2 = self->_decimalValue.w[1];
  v3 = self->_decimalValue.w[0];
  result.var0[1] = v2;
  result.var0[0] = v3;
  return result;
}

- (void)setDecimalValue:(id)a3
{
  self->_decimalValue = ($739D1A12408C92E4BFA0C2DF4C691557)a3;
}

- (NSNumber)forceScientificNotation
{
  return self->_forceScientificNotation;
}

- (void)setForceScientificNotation:(id)a3
{
  objc_storeStrong((id *)&self->_forceScientificNotation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forceScientificNotation, 0);
  objc_destroyWeak((id *)&self->_result);
  objc_storeStrong((id *)&self->_units, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

id __31__CalculateTerm_formattedValue__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v7 = a2;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__392;
  v24 = __Block_byref_object_dispose__393;
  v25 = 0;
  v8 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __31__CalculateTerm_formattedValue__block_invoke_400;
  v13[3] = &unk_1E6E9FBD8;
  v9 = v8;
  v17 = a3;
  v18 = a4;
  v19 = *(_QWORD *)(a1 + 40);
  v14 = v9;
  v16 = &v20;
  v10 = v7;
  v15 = v10;
  objc_msgSend(v9, "ignoreChanges:", v13);
  v11 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v11;
}

uint64_t __31__CalculateTerm_formattedValue__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __31__CalculateTerm_formattedValue__block_invoke_400(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v2 = objc_msgSend(*(id *)(a1 + 32), "maximumFractionDigits");
  v3 = objc_msgSend(*(id *)(a1 + 32), "minimumFractionDigits");
  v4 = objc_msgSend(*(id *)(a1 + 32), "maximumIntegerDigits");
  objc_msgSend(*(id *)(a1 + 32), "setMaximumFractionDigits:", *(_QWORD *)(a1 + 56));
  if (*(_QWORD *)(a1 + 64) >= *(_QWORD *)(a1 + 56))
    v5 = *(_QWORD *)(a1 + 56);
  else
    v5 = *(_QWORD *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "setMinimumFractionDigits:", v5);
  v6 = objc_msgSend(*(id *)(a1 + 32), "maximumIntegerDigits");
  if (v6 <= *(_QWORD *)(a1 + 72))
    v7 = *(_QWORD *)(a1 + 72);
  else
    v7 = v6;
  objc_msgSend(*(id *)(a1 + 32), "setMaximumIntegerDigits:", v7);
  objc_msgSend(*(id *)(a1 + 32), "stringFromNumber:", *(_QWORD *)(a1 + 40));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  objc_msgSend(*(id *)(a1 + 32), "setMaximumFractionDigits:", v2);
  objc_msgSend(*(id *)(a1 + 32), "setMinimumFractionDigits:", v3);
  return objc_msgSend(*(id *)(a1 + 32), "setMaximumIntegerDigits:", v4);
}

void __73__CalculateTerm_getMaximumFractionDigits_minimumFractionDigits_forValue___block_invoke()
{
  void *v0;

  v0 = (void *)getMaximumFractionDigits_minimumFractionDigits_forValue__decimalPlaces;
  getMaximumFractionDigits_minimumFractionDigits_forValue__decimalPlaces = (uint64_t)&unk_1E6EAD1F8;

}

+ (id)termWithValue:(id)a3 units:(id)a4 result:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_opt_new();
  v11 = *(void **)(v10 + 8);
  *(_QWORD *)(v10 + 8) = v7;
  v12 = v7;

  objc_storeWeak((id *)(v10 + 24), v9);
  v13 = *(void **)(v10 + 16);
  *(_QWORD *)(v10 + 16) = v8;

  return (id)v10;
}

@end
