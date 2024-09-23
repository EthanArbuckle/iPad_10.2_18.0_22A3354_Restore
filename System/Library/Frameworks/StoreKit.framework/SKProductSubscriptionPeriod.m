@implementation SKProductSubscriptionPeriod

- (NSUInteger)numberOfUnits
{
  return *((_QWORD *)self->_internal + 1);
}

- (SKProductPeriodUnit)unit
{
  return *((_QWORD *)self->_internal + 2);
}

- (void)_setNumberOfUnits:(unint64_t)a3
{
  *((_QWORD *)self->_internal + 1) = a3;
}

- (void)_setUnit:(unint64_t)a3
{
  *((_QWORD *)self->_internal + 2) = a3;
}

- (SKProductSubscriptionPeriod)init
{
  SKProductSubscriptionPeriod *v2;
  SKProductSubscriptionPeriodInternal *v3;
  id internal;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKProductSubscriptionPeriod;
  v2 = -[SKProductSubscriptionPeriod init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SKProductSubscriptionPeriodInternal);
    internal = v2->_internal;
    v2->_internal = v3;

  }
  return v2;
}

- (SKProductSubscriptionPeriod)initWithISO8601String:(id)a3
{
  id v4;
  SKProductSubscriptionPeriod *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD *internal;
  uint64_t v12;
  SKProductSubscriptionPeriod *result;
  id v14;
  uint64_t v15;
  id v16;

  v4 = a3;
  v5 = -[SKProductSubscriptionPeriod init](self, "init");
  if (!v5)
    goto LABEL_18;
  objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v6, "scanString:intoString:", CFSTR("P"), &v16);
  v7 = v16;
  if (!v7)
  {

    v5 = 0;
  }
  v15 = 0;
  objc_msgSend(v6, "scanInteger:", &v15);
  if (v15)
  {
    *((_QWORD *)v5->_internal + 1) = v15;

    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("DWMY"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    objc_msgSend(v6, "scanCharactersFromSet:intoString:", v8, &v14);
    v9 = v14;
    v10 = v9;
    if (!v9 || objc_msgSend(v9, "length") != 1)
    {

      v5 = 0;
    }
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("D")))
    {
      *((_QWORD *)v5->_internal + 2) = 0;
    }
    else
    {
      if (objc_msgSend(v10, "isEqualToString:", CFSTR("W")))
      {
        internal = v5->_internal;
        v12 = 1;
      }
      else if (objc_msgSend(v10, "isEqualToString:", CFSTR("M")))
      {
        internal = v5->_internal;
        v12 = 2;
      }
      else
      {
        if (!objc_msgSend(v10, "isEqualToString:", CFSTR("Y")))
        {

          v5 = 0;
          goto LABEL_17;
        }
        internal = v5->_internal;
        v12 = 3;
      }
      internal[2] = v12;
    }
LABEL_17:

LABEL_18:
    return v5;
  }

  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_internal, 0);
}

@end
