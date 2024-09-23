@implementation DOCTagStringRenderingRequest

+ (id)requestForTag:(id)a3 tagDimension:(double)a4 text:(id)a5 textAttributes:(id)a6 variant:(unint64_t)a7
{
  __CFString *v11;
  id v12;
  id v13;
  void *v14;
  const __CFString *v15;
  id v16;

  v11 = (__CFString *)a5;
  v12 = a6;
  v13 = a3;
  objc_msgSend((id)objc_opt_class(), "requestForTag:tagDimension:variant:", v13, a7, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    if (v11)
      v15 = v11;
    else
      v15 = &stru_24E330BE0;
    objc_msgSend(v14, "setText:", v15);
    if (v12)
      v16 = v12;
    else
      v16 = (id)MEMORY[0x24BDBD1B8];
    objc_msgSend(v14, "setTextAttributes:", v16);
  }

  return v14;
}

+ (id)requestForChainedTags:(id)a3 tagDimension:(double)a4 text:(id)a5 textAttributes:(id)a6
{
  __CFString *v9;
  id v10;
  id v11;
  void *v12;
  const __CFString *v13;
  id v14;

  v9 = (__CFString *)a5;
  v10 = a6;
  v11 = a3;
  objc_msgSend((id)objc_opt_class(), "requestForChainedTags:tagDimension:", v11, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if (v9)
      v13 = v9;
    else
      v13 = &stru_24E330BE0;
    objc_msgSend(v12, "setText:", v13);
    if (v10)
      v14 = v10;
    else
      v14 = (id)MEMORY[0x24BDBD1B8];
    objc_msgSend(v12, "setTextAttributes:", v14);
  }

  return v12;
}

- (DOCTagStringRenderingRequest)init
{
  DOCTagStringRenderingRequest *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DOCTagStringRenderingRequest;
  result = -[DOCTagRenderingRequest init](&v3, sel_init);
  if (result)
  {
    result->_tagToTitleSpacing = 8.0;
    result->_tagBaselineAdjustment = 0.0;
  }
  return result;
}

- (id)_UIImageCacheKeyWithAdditionalComponents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;
  _QWORD v13[5];

  v13[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_tagBaselineAdjustment);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_tagBaselineAdjustment);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v6;
  -[DOCTagStringRenderingRequest text](self, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v7;
  -[DOCTagStringRenderingRequest textAttributes](self, "textAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)DOCTagStringRenderingRequest;
  -[DOCTagRenderingRequest _UIImageCacheKeyWithAdditionalComponents:](&v12, sel__UIImageCacheKeyWithAdditionalComponents_, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
    objc_msgSend(v10, "addObjectsFromArray:", v4);

  return v10;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
}

- (NSDictionary)textAttributes
{
  return self->_textAttributes;
}

- (void)setTextAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_textAttributes, a3);
}

- (double)tagToTitleSpacing
{
  return self->_tagToTitleSpacing;
}

- (void)setTagToTitleSpacing:(double)a3
{
  self->_tagToTitleSpacing = a3;
}

- (double)tagBaselineAdjustment
{
  return self->_tagBaselineAdjustment;
}

- (void)setTagBaselineAdjustment:(double)a3
{
  self->_tagBaselineAdjustment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textAttributes, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
