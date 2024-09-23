@implementation AXMMLElementGroup

- (AXMMLElementGroup)init
{
  AXMMLElementGroup *v2;
  AXMMLElementGroup *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AXMMLElementGroup;
  v2 = -[AXMMLElementGroup init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[AXMMLElementGroup setTopLevel:](v2, "setTopLevel:", 1);
    -[AXMMLElementGroup setIncludeChildren:](v3, "setIncludeChildren:", 1);
    -[AXMMLElementGroup setFrame:](v3, "setFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMMLElementGroup setSubfeatures:](v3, "setSubfeatures:", v4);

  }
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AXMMLElementGroup;
  -[AXMMLElementGroup description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMMLElementGroup feature](self, "feature");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMMLElementGroup subfeatures](self, "subfeatures");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("\n%@\n%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)featureLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  -[AXMMLElementGroup feature](self, "feature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_5;
  }
  -[AXMMLElementGroup feature](self, "feature");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (!v7)
  {
LABEL_5:
    -[AXMMLElementGroup textLabel](self, "textLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    return v9;
  }
  -[AXMMLElementGroup feature](self, "feature");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)textLabel
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __CFString *v28;
  void *v29;
  unint64_t v30;
  uint64_t v32;
  void *v33;

  -[AXMMLElementGroup subfeatures](self, "subfeatures");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = 0;
    v6 = &stru_1E6260C18;
    while (1)
    {
      -[AXMMLElementGroup subfeatures](self, "subfeatures");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndex:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "featureLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXMMLElementGroup subfeatures](self, "subfeatures");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count") - 1;

      if (v5 < v11)
        break;
      ++v5;
LABEL_19:
      __AXMStringForVariables(v6, v12, v13, v14, v15, v16, v17, v18, v9);
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue();

      -[AXMMLElementGroup subfeatures](self, "subfeatures");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "count");

      v6 = v28;
      if (v5 >= v30)
        return v28;
    }
    -[AXMMLElementGroup subfeatures](self, "subfeatures");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectAtIndex:", ++v5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "feature");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "uiClass");
    if (v22 == 5
      || (objc_msgSend(v8, "feature"),
          v33 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v33, "uiClass") == 16))
    {
      objc_msgSend(v20, "feature");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v23, "uiClass") == 11)
      {

        if (v22 != 5)
      }
      else
      {
        objc_msgSend(v20, "feature");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v24, "uiClass");

        if (v22 != 5)
        if (v32 != 17)
          goto LABEL_18;
      }
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v21);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "featureLabel");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stringByTrimmingCharactersInSet:", v21);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v27, "rangeOfString:options:", v25, 1))
      {

        v25 = 0;
      }
    }
    else
    {
      v27 = v33;
      v25 = v9;
    }

    v9 = v25;
LABEL_18:

    goto LABEL_19;
  }
  v28 = &stru_1E6260C18;
  return v28;
}

- (id)childFeatures
{
  void *v2;
  void *v3;

  -[AXMMLElementGroup subfeatures](self, "subfeatures");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ax_mappedArrayUsingBlock:", &__block_literal_global_17);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __34__AXMMLElementGroup_childFeatures__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "feature");
}

- (AXMVisionFeature)feature
{
  return self->_feature;
}

- (void)setFeature:(id)a3
{
  objc_storeStrong((id *)&self->_feature, a3);
}

- (NSMutableArray)subfeatures
{
  return self->_subfeatures;
}

- (void)setSubfeatures:(id)a3
{
  objc_storeStrong((id *)&self->_subfeatures, a3);
}

- (BOOL)topLevel
{
  return self->_topLevel;
}

- (void)setTopLevel:(BOOL)a3
{
  self->_topLevel = a3;
}

- (BOOL)includeChildren
{
  return self->_includeChildren;
}

- (void)setIncludeChildren:(BOOL)a3
{
  self->_includeChildren = a3;
}

- (double)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(double)a3
{
  self->_confidence = a3;
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subfeatures, 0);
  objc_storeStrong((id *)&self->_feature, 0);
}

@end
