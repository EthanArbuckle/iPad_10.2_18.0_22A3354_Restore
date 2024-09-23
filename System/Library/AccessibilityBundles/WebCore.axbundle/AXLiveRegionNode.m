@implementation AXLiveRegionNode

+ (id)createNodeFromObject:(id)a3
{
  id v3;
  AXLiveRegionNode *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc_init(AXLiveRegionNode);
  objc_msgSend(v3, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXLiveRegionNode setLabel:](v4, "setLabel:", v5);

  objc_msgSend(v3, "accessibilityValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXLiveRegionNode setValue:](v4, "setValue:", v6);

  -[AXLiveRegionNode setTraits:](v4, "setTraits:", objc_msgSend(v3, "accessibilityTraits"));
  -[AXLiveRegionNode setObject:](v4, "setObject:", v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[AXLiveRegionNode object](self, "object");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "object");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 == v6)
    {
      -[AXLiveRegionNode label](self, "label");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "label");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToString:", v9))
      {
        -[AXLiveRegionNode value](self, "value");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "value");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isEqualToString:", v11))
        {
          v12 = -[AXLiveRegionNode traits](self, "traits");
          v7 = v12 == objc_msgSend(v4, "traits");
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

  return v7;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (unint64_t)traits
{
  return self->_traits;
}

- (void)setTraits:(unint64_t)a3
{
  self->_traits = a3;
}

- (id)object
{
  return objc_loadWeakRetained(&self->_object);
}

- (void)setObject:(id)a3
{
  objc_storeWeak(&self->_object, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_object);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
