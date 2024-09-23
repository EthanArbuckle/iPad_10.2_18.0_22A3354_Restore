@implementation DTBytesFormatter

+ (void)initialize
{
  id v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  id v74;

  if ((id)objc_opt_class() == a1)
  {
    v2 = objc_alloc_init(MEMORY[0x24BDD16F0]);
    v3 = (void *)qword_25583C8D8;
    qword_25583C8D8 = (uint64_t)v2;

    objc_msgSend_positiveInfinitySymbol((void *)qword_25583C8D8, v4, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_length(v8, v9, v10, v11, v12) == 2)
    {
      objc_msgSend_substringFromIndex_(v8, v13, 1, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setPositiveInfinitySymbol_((void *)qword_25583C8D8, v17, (uint64_t)v16, v18, v19);

    }
    v20 = objc_alloc_init(MEMORY[0x24BDD16F0]);
    v21 = (void *)qword_25583C8E0;
    qword_25583C8E0 = (uint64_t)v20;

    objc_msgSend_positiveInfinitySymbol((void *)qword_25583C8E0, v22, v23, v24, v25);
    v74 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend_length(v74, v26, v27, v28, v29) == 2)
    {
      objc_msgSend_substringFromIndex_(v74, v30, 1, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setPositiveInfinitySymbol_((void *)qword_25583C8E0, v35, (uint64_t)v34, v36, v37);

    }
    objc_msgSend_mainBundle(MEMORY[0x24BDD1488], v30, v31, v32, v33);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_localizedStringForKey_value_table_(v38, v39, (uint64_t)CFSTR("TiB"), (uint64_t)&stru_24EDCA888, 0);
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = (void *)qword_25583C8C8;
    qword_25583C8C8 = v40;

    objc_msgSend_mainBundle(MEMORY[0x24BDD1488], v42, v43, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_localizedStringForKey_value_table_(v46, v47, (uint64_t)CFSTR("GiB"), (uint64_t)&stru_24EDCA888, 0);
    v48 = objc_claimAutoreleasedReturnValue();
    v49 = (void *)qword_25583C8B0;
    qword_25583C8B0 = v48;

    objc_msgSend_mainBundle(MEMORY[0x24BDD1488], v50, v51, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_localizedStringForKey_value_table_(v54, v55, (uint64_t)CFSTR("MiB"), (uint64_t)&stru_24EDCA888, 0);
    v56 = objc_claimAutoreleasedReturnValue();
    v57 = (void *)qword_25583C8B8;
    qword_25583C8B8 = v56;

    objc_msgSend_mainBundle(MEMORY[0x24BDD1488], v58, v59, v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_localizedStringForKey_value_table_(v62, v63, (uint64_t)CFSTR("KiB"), (uint64_t)&stru_24EDCA888, 0);
    v64 = objc_claimAutoreleasedReturnValue();
    v65 = (void *)qword_25583C8C0;
    qword_25583C8C0 = v64;

    objc_msgSend_mainBundle(MEMORY[0x24BDD1488], v66, v67, v68, v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_localizedStringForKey_value_table_(v70, v71, (uint64_t)CFSTR("Bytes"), (uint64_t)&stru_24EDCA888, 0);
    v72 = objc_claimAutoreleasedReturnValue();
    v73 = (void *)qword_25583C8D0;
    qword_25583C8D0 = v72;

  }
}

+ (id)magnitudeFormatter
{
  return (id)qword_25583C8D8;
}

+ (id)stringForLongLong:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  void *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v51;

  if (a3 >= 0)
    v5 = a3;
  else
    v5 = -a3;
  if (v5 >> 40)
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    v7 = (void *)qword_25583C8D8;
    objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], a2, a3, v3, v4, (double)a3 * 9.09494702e-13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringFromNumber_(v7, v9, (uint64_t)v8, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v6, v13, (uint64_t)CFSTR("%@ %@"), v14, v15, v12, qword_25583C8C8);
  }
  else if (v5 >> 30)
  {
    v16 = (void *)MEMORY[0x24BDD17C8];
    v17 = (void *)qword_25583C8D8;
    objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], a2, a3, v3, v4, (double)a3 * 9.31322575e-10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringFromNumber_(v17, v18, (uint64_t)v8, v19, v20);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v16, v21, (uint64_t)CFSTR("%@ %@"), v22, v23, v12, qword_25583C8B0);
  }
  else if (v5 < 0x100000)
  {
    if (v5 < 0x400)
    {
      if (v5 == 1)
      {
        objc_msgSend_mainBundle(MEMORY[0x24BDD1488], a2, a3, v3, v4);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_localizedStringForKey_value_table_(v8, v40, (uint64_t)CFSTR("1 Byte"), (uint64_t)&stru_24EDCA888, 0);
      }
      else
      {
        if (a3)
        {
          v41 = (void *)MEMORY[0x24BDD17C8];
          v42 = (void *)qword_25583C8E0;
          objc_msgSend_numberWithLongLong_(MEMORY[0x24BDD16E0], a2, a3, v3, v4);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringFromNumber_(v42, v43, (uint64_t)v8, v44, v45);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringWithFormat_(v41, v46, (uint64_t)CFSTR("%@ %@"), v47, v48, v12, qword_25583C8D0);
          goto LABEL_16;
        }
        objc_msgSend_mainBundle(MEMORY[0x24BDD1488], a2, 0, v3, v4);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_localizedStringForKey_value_table_(v8, v51, (uint64_t)CFSTR("0 Bytes"), (uint64_t)&stru_24EDCA888, 0);
      }
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    v32 = (void *)MEMORY[0x24BDD17C8];
    v33 = (void *)qword_25583C8D8;
    objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], a2, a3, v3, v4, (double)a3 * 0.0009765625);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringFromNumber_(v33, v34, (uint64_t)v8, v35, v36);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v32, v37, (uint64_t)CFSTR("%@ %@"), v38, v39, v12, qword_25583C8C0);
  }
  else
  {
    v24 = (void *)MEMORY[0x24BDD17C8];
    v25 = (void *)qword_25583C8D8;
    objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], a2, a3, v3, v4, (double)a3 * 0.000000953674316);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringFromNumber_(v25, v26, (uint64_t)v8, v27, v28);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v24, v29, (uint64_t)CFSTR("%@ %@"), v30, v31, v12, qword_25583C8B8);
  }
LABEL_16:
  v49 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
  return v49;
}

+ (id)stringFromNumber:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = objc_msgSend_longLongValue(a3, a2, (uint64_t)a3, v3, v4);
  return (id)objc_msgSend_stringForLongLong_(a1, v7, v6, v8, v9);
}

- (id)stringFromNumber:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = objc_msgSend_longLongValue(a3, a2, (uint64_t)a3, v3, v4);
  return (id)objc_msgSend_stringForLongLong_(DTBytesFormatter, v6, v5, v7, v8);
}

+ (id)stringForObjectValue:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_retainAutorelease(v4);
    v14 = (const char *)objc_msgSend_objCType(v9, v10, v11, v12, v13);
    if (!strcmp(v14, "f") || !strcmp(v14, "d"))
    {
      objc_msgSend_doubleValue(v9, v15, v16, v17, v18);
      if (fabs(v19) == INFINITY)
      {
        v27 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend_stringFromNumber_((void *)qword_25583C8D8, v15, (uint64_t)v9, v17, v18);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithFormat_(v27, v29, (uint64_t)CFSTR("%@ B"), v30, v31, v28);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_8;
      }
    }
    v20 = objc_msgSend_longLongValue(v9, v15, v16, v17, v18);
    objc_msgSend_stringForLongLong_(a1, v21, v20, v22, v23);
    v24 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_description(v4, v5, v6, v7, v8);
    v24 = objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)v24;
LABEL_8:

  return v25;
}

- (id)stringForObjectValue:(id)a3
{
  return (id)((uint64_t (*)(__objc2_class *, char *, id))MEMORY[0x24BEDD108])(DTBytesFormatter, sel_stringForObjectValue_, a3);
}

@end
