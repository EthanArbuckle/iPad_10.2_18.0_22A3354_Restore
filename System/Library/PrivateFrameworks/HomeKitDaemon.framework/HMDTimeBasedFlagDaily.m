@implementation HMDTimeBasedFlagDaily

- (HMDTimeBasedFlagDaily)initWithContext:(id)a3 dateProvider:(id)a4
{
  id v6;
  id v7;
  HMDTimeBasedFlagDaily *v8;
  HMDTimeBasedFlagDaily *v9;
  uint64_t v10;
  NSDate *bit0Date;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  if (initWithContext_dateProvider__onceToken != -1)
    dispatch_once(&initWithContext_dateProvider__onceToken, &__block_literal_global_52612);
  v13.receiver = self;
  v13.super_class = (Class)HMDTimeBasedFlagDaily;
  v8 = -[HMDTimeBasedFlagDaily init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_context, v6);
    objc_storeStrong((id *)&v9->_dateProvider, a4);
    v9->_bits = 0;
    objc_msgSend(v7, "startOfCurrentDay");
    v10 = objc_claimAutoreleasedReturnValue();
    bit0Date = v9->_bit0Date;
    v9->_bit0Date = (NSDate *)v10;

  }
  return v9;
}

- (HMDTimeBasedFlagDaily)initWithSerializedFlag:(id)a3 context:(id)a4 dateProvider:(id)a5
{
  id v8;
  id v9;
  HMDTimeBasedFlagDaily *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  NSDate *v18;
  NSDate *bit0Date;

  v8 = a3;
  v9 = a5;
  v10 = -[HMDTimeBasedFlagDaily initWithContext:dateProvider:](self, "initWithContext:dateProvider:", a4, v9);
  if (v10)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("bits"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
    v13 = v12;

    v14 = objc_msgSend(v13, "unsignedLongLongValue");
    v10->_bits = v14;
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("bit0date"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
    v17 = v16;

    if (v17)
    {
      v18 = v15;
    }
    else
    {
      objc_msgSend(v9, "startOfCurrentDay");
      v18 = (NSDate *)objc_claimAutoreleasedReturnValue();
    }
    bit0Date = v10->_bit0Date;
    v10->_bit0Date = v18;

  }
  return v10;
}

- (void)setCurrentBit
{
  void *v3;
  id v4;

  -[HMDTimeBasedFlagDaily dateProvider](self, "dateProvider");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startOfCurrentDay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTimeBasedFlagDaily setBitForDate:](self, "setBitForDate:", v3);

}

- (void)setBitForDate:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend((id)minAllowedDate, "compare:") != 1)
  {
    os_unfair_lock_lock_with_options();
    v4 = -[HMDTimeBasedFlagDaily _bitMaskForDate:](self, "_bitMaskForDate:", v7);
    v5 = -[HMDTimeBasedFlagDaily bits](self, "bits");
    -[HMDTimeBasedFlagDaily setBits:](self, "setBits:", -[HMDTimeBasedFlagDaily bits](self, "bits") | v4);
    os_unfair_lock_unlock(&self->_lock);
    if ((v5 & v4) == 0)
    {
      -[HMDTimeBasedFlagDaily context](self, "context");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "flagChanged");

    }
  }

}

- (void)clearCurrentBit
{
  void *v3;
  id v4;

  -[HMDTimeBasedFlagDaily dateProvider](self, "dateProvider");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startOfCurrentDay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDTimeBasedFlagDaily clearBitForDate:](self, "clearBitForDate:", v3);

}

- (void)clearBitForDate:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend((id)minAllowedDate, "compare:") != 1)
  {
    os_unfair_lock_lock_with_options();
    v4 = -[HMDTimeBasedFlagDaily _bitMaskForDate:](self, "_bitMaskForDate:", v7);
    v5 = -[HMDTimeBasedFlagDaily bits](self, "bits");
    -[HMDTimeBasedFlagDaily setBits:](self, "setBits:", -[HMDTimeBasedFlagDaily bits](self, "bits") & ~v4);
    os_unfair_lock_unlock(&self->_lock);
    if ((v5 & v4) != 0)
    {
      -[HMDTimeBasedFlagDaily context](self, "context");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "flagChanged");

    }
  }

}

- (unint64_t)_bitMaskForDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  HMDTimeBasedFlagDaily *v10;
  void *v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BE4F188];
  -[HMDTimeBasedFlagDaily bit0Date](self, "bit0Date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "daysFromDate:toDate:", v6, v4);

  if (v7 != 0 && v7 < 0xFFFFFFFFFFFFFFC1)
  {
    if (v7 - 1 > 0x3E)
    {
      if (v7 + 127 <= 0x3F)
      {
        -[HMDTimeBasedFlagDaily setBits:](self, "setBits:", -[HMDTimeBasedFlagDaily bits](self, "bits") >> (-63 - v7));
        objc_msgSend(MEMORY[0x24BE4F188], "startOfDateByAddingDayCount:toDate:", 63, v4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDTimeBasedFlagDaily setBit0Date:](self, "setBit0Date:", v11);

        v8 = 0x8000000000000000;
        goto LABEL_9;
      }
      v10 = self;
      v9 = 0;
    }
    else
    {
      v9 = -[HMDTimeBasedFlagDaily bits](self, "bits") << v7;
      v10 = self;
    }
    -[HMDTimeBasedFlagDaily setBits:](v10, "setBits:", v9);
    -[HMDTimeBasedFlagDaily setBit0Date:](self, "setBit0Date:", v4);
    v8 = 1;
    goto LABEL_9;
  }
  v8 = 1 << -(char)v7;
LABEL_9:

  return v8;
}

- (unint64_t)currentBits
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[HMDTimeBasedFlagDaily dateProvider](self, "dateProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startOfCurrentDay");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HMDTimeBasedFlagDaily bitsForDate:bitCount:outValidBitCount:](self, "bitsForDate:bitCount:outValidBitCount:", v4, 64, 0);

  return v5;
}

- (unint64_t)bitsForDate:(id)a3 bitCount:(int64_t)a4 outValidBitCount:(int64_t *)a5
{
  id v8;
  os_unfair_lock_s *p_lock;
  void *v10;
  void *v11;
  uint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;

  v8 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v10 = (void *)MEMORY[0x24BE4F188];
  -[HMDTimeBasedFlagDaily bit0Date](self, "bit0Date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "daysFromDate:toDate:", v11, v8);

  if (v12 == 0 || (unint64_t)v12 >= 0xFFFFFFFFFFFFFFC1)
  {
    if (a5)
    {
      v13 = v12 + 64;
      if (v12 + 64 >= a4)
        v13 = a4;
      *a5 = v13;
    }
    if (a4 >= 64)
    {
      v14 = -[HMDTimeBasedFlagDaily bits](self, "bits") >> -(char)v12;
      goto LABEL_26;
    }
    v16 = -[HMDTimeBasedFlagDaily bits](self, "bits") >> -(char)v12;
LABEL_22:
    v14 = v16 & ~(-1 << a4);
    goto LABEL_26;
  }
  if ((unint64_t)(v12 - 1) <= 0x3E)
  {
    if (a5)
    {
      v15 = 64;
      if (a4 < 64)
        v15 = a4;
      *a5 = v15;
    }
    if (a4 >= 64)
    {
      v14 = -[HMDTimeBasedFlagDaily bits](self, "bits") << v12;
      goto LABEL_26;
    }
    v16 = -[HMDTimeBasedFlagDaily bits](self, "bits") << v12;
    goto LABEL_22;
  }
  if (v12 < 64)
  {
    if (a5)
    {
      v14 = 0;
      *a5 = 0;
      goto LABEL_26;
    }
LABEL_25:
    v14 = 0;
    goto LABEL_26;
  }
  if (!a5)
    goto LABEL_25;
  v14 = 0;
  v17 = 64;
  if (a4 < 64)
    v17 = a4;
  *a5 = v17;
LABEL_26:
  os_unfair_lock_unlock(p_lock);

  return v14;
}

- (id)serializeToDictionary
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v8[0] = CFSTR("bits");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[HMDTimeBasedFlagDaily bits](self, "bits"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v8[1] = CFSTR("bit0date");
  -[HMDTimeBasedFlagDaily bit0Date](self, "bit0Date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = CFSTR("periodicity");
  v9[1] = v5;
  v9[2] = &unk_24E96ACB8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)description
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = -[HMDTimeBasedFlagDaily bits](self, "bits");
  -[HMDTimeBasedFlagDaily bit0Date](self, "bit0Date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Daily flags: bits=0x%llx, date=%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (HMDTimeBasedFlagContext)context
{
  return (HMDTimeBasedFlagContext *)objc_loadWeakRetained((id *)&self->_context);
}

- (HMMDateProvider)dateProvider
{
  return self->_dateProvider;
}

- (unint64_t)bits
{
  return self->_bits;
}

- (void)setBits:(unint64_t)a3
{
  self->_bits = a3;
}

- (NSDate)bit0Date
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setBit0Date:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bit0Date, 0);
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_destroyWeak((id *)&self->_context);
}

void __54__HMDTimeBasedFlagDaily_initWithContext_dateProvider___block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend(v5, "setDay:", 1);
  objc_msgSend(v5, "setMonth:", 1);
  objc_msgSend(v5, "setYear:", 2022);
  v0 = objc_alloc(MEMORY[0x24BDBCE48]);
  v1 = (void *)objc_msgSend(v0, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
  objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneForSecondsFromGMT:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setTimeZone:", v2);

  objc_msgSend(v1, "dateFromComponents:", v5);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)minAllowedDate;
  minAllowedDate = v3;

}

+ (id)convertLegacyFlagBits:(id)a3 lastSaveTIme:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x24BDAC8D0];
  v10[0] = CFSTR("bits");
  v10[1] = CFSTR("bit0date");
  v11[0] = a3;
  v11[1] = a4;
  v10[2] = CFSTR("periodicity");
  v11[2] = &unk_24E96ACB8;
  v5 = (void *)MEMORY[0x24BDBCE70];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
