@implementation MinMaxIntFormatter

+ (id)formatterForMin:(int64_t)a3 max:(int64_t)a4
{
  MinMaxIntFormatter *v6;
  const char *v7;

  v6 = [MinMaxIntFormatter alloc];
  return (id)objc_msgSend_initWithMin_max_(v6, v7, a3, a4);
}

- (MinMaxIntFormatter)initWithMin:(int64_t)a3 max:(int64_t)a4
{
  uint64_t v7;
  MinMaxIntFormatter *v8;
  const char *v9;
  MinMaxIntFormatter *v10;
  const char *v11;
  objc_super v13;

  v7 = objc_msgSend_decimalDigitCharacterSet(MEMORY[0x24BDD14A8], a2, a3);
  v13.receiver = self;
  v13.super_class = (Class)MinMaxIntFormatter;
  v8 = -[APFormatter initWithCharacterSet:withMaxLength:](&v13, sel_initWithCharacterSet_withMaxLength_, v7, 0);
  v10 = v8;
  if (v8)
  {
    objc_msgSend_setMinimum_(v8, v9, a3);
    objc_msgSend_setMaximum_(v10, v11, a4);
  }
  return v10;
}

- (void)setMinimum:(int64_t)a3
{
  self->_minimum = a3;
}

- (int64_t)minimum
{
  return self->_minimum;
}

- (void)setMaximum:(int64_t)a3
{
  self->_maximum = a3;
}

- (int64_t)maximum
{
  return self->_maximum;
}

- (BOOL)isPartialStringValid:(id)a3 newEditingString:(id *)a4 errorDescription:(id *)a5
{
  _BOOL4 v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  __CFString *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  const char *v27;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)MinMaxIntFormatter;
  v9 = -[APFormatter isPartialStringValid:newEditingString:errorDescription:](&v29, sel_isPartialStringValid_newEditingString_errorDescription_);
  if (v9)
  {
    if (objc_msgSend_length(a3, v10, v11))
    {
      v14 = objc_msgSend_integerValue(a3, v12, v13);
      if (v14 < objc_msgSend_minimum(self, v15, v16))
      {
        if (a4)
        {
          v19 = (void *)MEMORY[0x24BDD17C8];
          v20 = objc_msgSend_minimum(self, v17, v18);
          *a4 = (id)objc_msgSend_stringWithFormat_(v19, v21, (uint64_t)CFSTR("%ld"), v20);
        }
        if (a5)
        {
          v22 = CFSTR("gErG");
LABEL_13:
          LOBYTE(v9) = 0;
          *a5 = v22;
          return v9;
        }
        goto LABEL_15;
      }
      if (v14 > objc_msgSend_maximum(self, v17, v18))
      {
        if (a4)
        {
          v25 = (void *)MEMORY[0x24BDD17C8];
          v26 = objc_msgSend_maximum(self, v23, v24);
          *a4 = (id)objc_msgSend_stringWithFormat_(v25, v27, (uint64_t)CFSTR("%ld"), v26);
        }
        if (a5)
        {
          v22 = CFSTR("gErF");
          goto LABEL_13;
        }
LABEL_15:
        LOBYTE(v9) = 0;
        return v9;
      }
    }
    LOBYTE(v9) = 1;
  }
  return v9;
}

@end
