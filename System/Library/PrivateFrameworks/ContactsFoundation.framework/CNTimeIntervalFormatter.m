@implementation CNTimeIntervalFormatter

id __54__CNTimeIntervalFormatter_numberFormatterWith3SigFigs__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (!v2)
  {
    objc_msgSend((id)objc_opt_class(), "numberFormatterWithSignificantDigits:", 3);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 8);
    *(_QWORD *)(v4 + 8) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  }
  return v2;
}

id __54__CNTimeIntervalFormatter_numberFormatterWith4SigFigs__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (!v2)
  {
    objc_msgSend((id)objc_opt_class(), "numberFormatterWithSignificantDigits:", 4);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  }
  return v2;
}

+ (id)stringForTimeInterval:(double)a3
{
  void *v4;
  void *v5;

  objc_msgSend((id)objc_opt_class(), "sharedFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringForTimeInterval:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)stringForTimeInterval:(double)a3
{
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  void *v12;
  void *v13;
  uint64_t v14;
  __CFString *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v5 = fabs(a3);
  if (v5 >= 2.0)
  {
    v7 = 0;
  }
  else
  {
    v6 = 0;
    do
    {
      v5 = v5 * 1000.0;
      v7 = v6 - 1;
    }
    while (v5 < 2.0 && v6-- > -7);
  }
  if (v5 >= 2000.0 && v7 <= 7)
  {
    do
    {
      v5 = v5 / 1000.0;
      v10 = v7 + 1;
    }
    while (v5 >= 2000.0 && v7++ < 7);
  }
  else
  {
    v10 = v7;
  }
  objc_msgSend((id)objc_opt_class(), "multiplierForOrder:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNTimeIntervalFormatter numberFormatterWith3SigFigs](self, "numberFormatterWith3SigFigs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 >= 1000.0)
  {
    -[CNTimeIntervalFormatter numberFormatterWith4SigFigs](self, "numberFormatterWith4SigFigs");
    v14 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v14;
  }
  v15 = &stru_1E29BCC70;
  if (a3 < 0.0)
    v15 = CFSTR("-");
  v16 = (void *)MEMORY[0x1E0CB37E8];
  v17 = v15;
  objc_msgSend(v16, "numberWithDouble:", v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringFromNumber:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@s"), v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@ %@"), v17, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (NSNumberFormatter)numberFormatterWith3SigFigs
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__CNTimeIntervalFormatter_numberFormatterWith3SigFigs__block_invoke;
  v3[3] = &unk_1E29B8C60;
  v3[4] = self;
  cn_objectResultWithObjectLock(self, v3);
  return (NSNumberFormatter *)(id)objc_claimAutoreleasedReturnValue();
}

+ (CNTimeIntervalFormatter)sharedFormatter
{
  if (sharedFormatter_cn_once_token_1 != -1)
    dispatch_once(&sharedFormatter_cn_once_token_1, &__block_literal_global_87);
  return (CNTimeIntervalFormatter *)(id)sharedFormatter_cn_once_object_1;
}

+ (id)multiplierForOrder:(int64_t)a3
{
  if (a3 > 8)
    return CFSTR("Y");
  if (a3 < -8)
    return CFSTR("y");
  if ((unint64_t)(a3 + 8) > 0x10)
    return &stru_1E29BCC70;
  return off_1E29BC758[a3 + 8];
}

- (NSNumberFormatter)numberFormatterWith4SigFigs
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__CNTimeIntervalFormatter_numberFormatterWith4SigFigs__block_invoke;
  v3[3] = &unk_1E29B8C60;
  v3[4] = self;
  cn_objectResultWithObjectLock(self, v3);
  return (NSNumberFormatter *)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)numberFormatterWithSignificantDigits:(unint64_t)a3
{
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  objc_msgSend(v4, "setUsesSignificantDigits:", 1);
  objc_msgSend(v4, "setMaximumSignificantDigits:", a3);
  objc_msgSend(v4, "setMinimumSignificantDigits:", a3);
  return v4;
}

void __42__CNTimeIntervalFormatter_sharedFormatter__block_invoke()
{
  CNTimeIntervalFormatter *v0;
  void *v1;

  v0 = objc_alloc_init(CNTimeIntervalFormatter);
  v1 = (void *)sharedFormatter_cn_once_object_1;
  sharedFormatter_cn_once_object_1 = (uint64_t)v0;

}

- (id)stringForObjectValue:(id)a3
{
  objc_msgSend(a3, "doubleValue");
  return -[CNTimeIntervalFormatter stringForTimeInterval:](self, "stringForTimeInterval:");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberFormatterWith4SigFigs, 0);
  objc_storeStrong((id *)&self->_numberFormatterWith3SigFigs, 0);
}

@end
