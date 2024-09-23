@implementation VNRGainValueArray

- (VNRGainValueArray)initWithArray:(id)a3
{
  id v4;
  unint64_t v5;
  VNRGainValueArray *v6;
  unint64_t v7;
  unint64_t v8;
  $94F468A8D4C62B317260615823C2B210 *v9;
  $94F468A8D4C62B317260615823C2B210 *v10;
  void *v11;
  float v12;
  float v13;
  void *v14;
  float v15;
  float v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  float v21;
  float v22;
  void *v23;
  float v24;
  float v25;
  $94F468A8D4C62B317260615823C2B210 *v26;
  objc_super v28;

  v4 = a3;
  if (!v4)
    goto LABEL_15;
  v28.receiver = self;
  v28.super_class = (Class)VNRGainValueArray;
  self = -[VNRGainValueArray init](&v28, sel_init);
  if (!self)
    goto LABEL_15;
  v5 = objc_msgSend(v4, "count");
  v6 = 0;
  if (v5 < 2)
    goto LABEL_13;
  v7 = v5;
  if ((v5 & 1) != 0)
    goto LABEL_13;
  v8 = v5 >> 1;
  v9 = ($94F468A8D4C62B317260615823C2B210 *)malloc_type_calloc(v5 >> 1, 8uLL, 0x100004000313F17uLL);
  if (!v9)
  {
LABEL_15:
    v6 = 0;
    goto LABEL_13;
  }
  v10 = v9;
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "floatValue");
  v13 = v12;

  objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "floatValue");
  v16 = v15;

  v10->var0 = v13;
  v10->var1 = v16;
  if (v7 >= 4)
  {
    v17 = 0;
    v18 = 2;
    if (v8 > 2)
      v18 = v7 >> 1;
    v19 = v18 - 1;
    while (1)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v17 * 2 + 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "floatValue");
      v22 = v21;

      objc_msgSend(v4, "objectAtIndexedSubscript:", v17 * 2 + 3);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "floatValue");
      v25 = v24;

      if (v22 <= v13)
        break;
      v26 = &v10[v17];
      v26[1].var0 = v22;
      v26[1].var1 = v25;
      ++v17;
      v13 = v22;
      if (!--v19)
        goto LABEL_12;
    }
    free(v10);
    goto LABEL_15;
  }
LABEL_12:
  self->_nGainValuePairs = v8;
  self->_gainValuePairs = v10;
  self = self;
  v6 = self;
LABEL_13:

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_gainValuePairs);
  v3.receiver = self;
  v3.super_class = (Class)VNRGainValueArray;
  -[VNRGainValueArray dealloc](&v3, sel_dealloc);
}

- (float)interpolateValueForGain:(float)a3
{
  $94F468A8D4C62B317260615823C2B210 *gainValuePairs;
  float var0;
  unint64_t nGainValuePairs;
  unint64_t v6;
  float *p_var1;
  float v8;
  BOOL v9;
  BOOL v10;

  gainValuePairs = self->_gainValuePairs;
  var0 = gainValuePairs->var0;
  if (gainValuePairs->var0 >= a3)
    return gainValuePairs->var1;
  nGainValuePairs = self->_nGainValuePairs;
  v6 = nGainValuePairs - 1;
  if (gainValuePairs[nGainValuePairs - 1].var0 <= a3)
    return gainValuePairs[v6].var1;
  if (nGainValuePairs >= 2)
  {
    p_var1 = &gainValuePairs[1].var1;
    do
    {
      v8 = *(p_var1 - 1);
      if (var0 >= v8)
        break;
      if (var0 <= a3)
      {
        v9 = v8 == a3;
        v10 = v8 < a3;
      }
      else
      {
        v9 = 1;
        v10 = 0;
      }
      if (!v10 && !v9)
        return *(p_var1 - 2)
             + (float)((float)((float)(a3 - var0) * (float)(*p_var1 - *(p_var1 - 2))) / (float)(v8 - var0));
      p_var1 += 2;
      var0 = v8;
      --v6;
    }
    while (v6);
  }
  return NAN;
}

@end
