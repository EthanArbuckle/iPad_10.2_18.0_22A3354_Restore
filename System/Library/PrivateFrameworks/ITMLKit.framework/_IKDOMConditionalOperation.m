@implementation _IKDOMConditionalOperation

- (BOOL)passesForDataItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char v11;
  void *v12;
  void *v13;
  unint64_t v14;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  int v19;
  char v20;

  v4 = a3;
  -[_IKDOMConditionalOperation propertyPath](self, "propertyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForPropertyPath:boxed:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[_IKDOMConditionalOperation literal](self, "literal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (v6)
    {
      if (objc_msgSend(v6, "isString"))
      {
        objc_msgSend(v6, "toString");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[_IKDOMConditionalOperation literal](self, "literal");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "compare:", v9);
      }
      else
      {
        if (!objc_msgSend(v6, "isNumber"))
        {
          if (!objc_msgSend(v6, "isBoolean"))
          {
            v10 = 0;
LABEL_11:
            v14 = -[_IKDOMConditionalOperation type](self, "type");
            v16 = (~v14 & 0xFFFFFFFFFFFFFFFDLL) == 0 || v14 == -2;
            v17 = v14 ^ (v16 << 63 >> 63);
            if (v17 == 2)
            {
              v18 = v10 == 1;
            }
            else if (v17 == 1)
            {
              v18 = v10 == -1;
            }
            else
            {
              if (v17)
              {
                v20 = 0;
LABEL_32:
                v11 = (v14 > 0xFFFFFFFFFFFFFFFCLL) ^ v20;
                goto LABEL_33;
              }
              v18 = v10 == 0;
            }
            v20 = v18;
            goto LABEL_32;
          }
          v19 = objc_msgSend(v6, "toBool");
          -[_IKDOMConditionalOperation literal](self, "literal");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19 == objc_msgSend(v8, "BOOLValue"))
          {
            v10 = 0;
          }
          else if (objc_msgSend(v6, "toBool"))
          {
            v10 = 1;
          }
          else
          {
            v10 = -1;
          }
LABEL_10:

          goto LABEL_11;
        }
        objc_msgSend(v6, "toNumber");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)MEMORY[0x1E0CB37E8];
        -[_IKDOMConditionalOperation literal](self, "literal");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "doubleValue");
        objc_msgSend(v12, "numberWithDouble:");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "compare:", v13);

      }
      goto LABEL_10;
    }
    v11 = 0;
  }
  else
  {
    v11 = v6 != 0;
  }
LABEL_33:

  return v11;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (IKDataBindingPropertyPath)propertyPath
{
  return self->_propertyPath;
}

- (void)setPropertyPath:(id)a3
{
  objc_storeStrong((id *)&self->_propertyPath, a3);
}

- (NSString)literal
{
  return self->_literal;
}

- (void)setLiteral:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_literal, 0);
  objc_storeStrong((id *)&self->_propertyPath, 0);
}

@end
