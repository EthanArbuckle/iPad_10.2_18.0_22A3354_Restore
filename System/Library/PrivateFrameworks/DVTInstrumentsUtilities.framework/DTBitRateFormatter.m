@implementation DTBitRateFormatter

+ (id)stringForLongLong:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;

  objc_msgSend_magnitudeFormatter(DTBytesFormatter, a2, a3, v3, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 >= 0)
    v11 = a3;
  else
    v11 = -a3;
  if (v11 < 0xE8D4A51000)
  {
    if (v11 < 0x3B9ACA00)
    {
      if (v11 < 0xF4240)
      {
        v35 = (void *)MEMORY[0x24BDD17C8];
        if (v11 < 0x3E8)
        {
          objc_msgSend_numberWithLongLong_(MEMORY[0x24BDD16E0], v6, a3, v8, v9);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringFromNumber_(v10, v42, (uint64_t)v13, v43, v44);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringWithFormat_(v35, v45, (uint64_t)CFSTR("%@ %@"), v46, v47, v17, CFSTR("bit/s"));
        }
        else
        {
          objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v6, v7, v8, v9, (double)a3 / 1000.0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringFromNumber_(v10, v36, (uint64_t)v13, v37, v38);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringWithFormat_(v35, v39, (uint64_t)CFSTR("%@ %@"), v40, v41, v17, CFSTR("kbit/s"));
        }
      }
      else
      {
        v28 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v6, v7, v8, v9, (double)a3 / 1000000.0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringFromNumber_(v10, v29, (uint64_t)v13, v30, v31);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithFormat_(v28, v32, (uint64_t)CFSTR("%@ %@"), v33, v34, v17, CFSTR("Mbit/s"));
      }
    }
    else
    {
      v21 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v6, v7, v8, v9, (double)a3 / 1000000000.0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringFromNumber_(v10, v22, (uint64_t)v13, v23, v24);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v21, v25, (uint64_t)CFSTR("%@ %@"), v26, v27, v17, CFSTR("Gbit/s"));
    }
  }
  else
  {
    v12 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v6, v7, v8, v9, (double)a3 / 1.0e12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringFromNumber_(v10, v14, (uint64_t)v13, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v12, v18, (uint64_t)CFSTR("%@ %@"), v19, v20, v17, CFSTR("Tbit/s"));
  }
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  return v48;
}

- (id)stringForObjectValue:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = objc_msgSend_longLongValue(v3, v4, v5, v6, v7);
    objc_msgSend_stringForLongLong_(DTBitRateFormatter, v9, v8, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

@end
