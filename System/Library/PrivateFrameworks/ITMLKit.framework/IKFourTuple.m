@implementation IKFourTuple

- (IKFourTuple)initWithStyleString:(id)a3
{
  id v4;
  IKFourTuple *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  int64_t v10;
  double *values;
  void *v12;
  float v13;
  void *v14;
  void *v15;
  double v16;
  float v18;
  _QWORD v19[4];
  id v20;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)IKFourTuple;
  v5 = -[IKFourTuple init](&v21, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR(" "));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __35__IKFourTuple_initWithStyleString___block_invoke;
    v19[3] = &unk_1E9F4DF28;
    v8 = v6;
    v20 = v8;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v19);

    v9 = objc_msgSend(v8, "count");
    v5->_specifiedValueCount = v9;
    if (v9 < 2)
    {
      if (v9 == 1)
      {
        objc_msgSend(v8, "objectAtIndex:", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3900]), "initWithString:", v14);
        v18 = 0.0;
        if (objc_msgSend(v15, "scanFloat:", &v18))
        {
          v16 = v18;
          v5->_values[2] = v18;
          v5->_values[3] = v16;
          v5->_values[0] = v16;
          v5->_values[1] = v16;
        }
        else
        {
          objc_storeStrong((id *)&v5->_namedStyle, v14);
        }

      }
    }
    else
    {
      v10 = 0;
      values = v5->_values;
      do
      {
        if (v10 >= v5->_specifiedValueCount)
        {
          values[v10] = 0.0;
        }
        else
        {
          objc_msgSend(v8, "objectAtIndex:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "floatValue");
          values[v10] = v13;

        }
        ++v10;
      }
      while (v10 != 4);
    }

  }
  return v5;
}

void __35__IKFourTuple_initWithStyleString___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "length"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (IKFourTuple)initWithCornerRadii:(IKCornerRadii)a3
{
  double var3;
  double var2;
  double var1;
  double var0;
  IKFourTuple *result;
  objc_super v8;

  var3 = a3.var3;
  var2 = a3.var2;
  var1 = a3.var1;
  var0 = a3.var0;
  v8.receiver = self;
  v8.super_class = (Class)IKFourTuple;
  result = -[IKFourTuple init](&v8, sel_init);
  if (result)
  {
    result->_specifiedValueCount = 4;
    result->_values[0] = var2;
    result->_values[1] = var3;
    result->_values[2] = var1;
    result->_values[3] = var0;
  }
  return result;
}

- (IKCornerRadii)cornerRadiiValue
{
  double v2;
  double v3;
  double v4;
  double v5;
  IKCornerRadii result;

  switch(self->_specifiedValueCount)
  {
    case 1:
      v2 = self->_values[0];
      v3 = v2;
      v4 = v2;
      v5 = v2;
      break;
    case 2:
      v2 = self->_values[0];
      v3 = self->_values[1];
      v4 = v2;
      goto LABEL_6;
    case 3:
      v2 = self->_values[0];
      v3 = self->_values[1];
      v4 = self->_values[2];
LABEL_6:
      v5 = v3;
      break;
    case 4:
      v2 = self->_values[0];
      v3 = self->_values[1];
      v4 = self->_values[2];
      v5 = self->_values[3];
      break;
    default:
      v2 = 0.0;
      v3 = 0.0;
      v4 = 0.0;
      v5 = 0.0;
      break;
  }
  result.var3 = v3;
  result.var2 = v2;
  result.var1 = v4;
  result.var0 = v5;
  return result;
}

- (UIEdgeInsets)edgeInsetsValue
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  switch(self->_specifiedValueCount)
  {
    case 1:
      v2 = self->_values[1];
      v3 = v2;
      v4 = v2;
      goto LABEL_5;
    case 2:
      v2 = self->_values[0];
      v3 = self->_values[1];
      v4 = v3;
LABEL_5:
      v5 = v2;
      break;
    case 3:
      v5 = self->_values[0];
      v3 = self->_values[1];
      v2 = self->_values[2];
      v4 = v3;
      break;
    case 4:
      v5 = self->_values[0];
      v3 = self->_values[1];
      v2 = self->_values[2];
      v4 = self->_values[3];
      break;
    default:
      v2 = 0.0;
      v3 = 0.0;
      v4 = 0.0;
      v5 = 0.0;
      break;
  }
  result.right = v3;
  result.bottom = v2;
  result.left = v4;
  result.top = v5;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_namedStyle, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  *(_QWORD *)(v5 + 16) = self->_specifiedValueCount;
  v8 = *(_OWORD *)self->_values;
  *(_OWORD *)(v5 + 40) = *(_OWORD *)&self->_values[2];
  *(_OWORD *)(v5 + 24) = v8;
  return (id)v5;
}

- (NSString)namedStyle
{
  return self->_namedStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namedStyle, 0);
}

@end
