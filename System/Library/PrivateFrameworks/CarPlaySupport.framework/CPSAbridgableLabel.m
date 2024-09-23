@implementation CPSAbridgableLabel

- (CPSAbridgableLabel)init
{
  CPSAbridgableLabel *v3;
  id obj;
  objc_super v5;
  SEL v6;
  CPSAbridgableLabel *v7;

  v6 = a2;
  v7 = 0;
  v5.receiver = self;
  v5.super_class = (Class)CPSAbridgableLabel;
  v7 = -[CPSAbridgableLabel init](&v5, sel_init);
  objc_storeStrong((id *)&v7, v7);
  if (v7)
  {
    obj = (id)MEMORY[0x24BDBD1A8];
    objc_storeStrong((id *)&v7->_textVariants, MEMORY[0x24BDBD1A8]);
    objc_storeStrong((id *)&v7->_attributedTextVariants, obj);
    v7->_variantsIndex = 0;
  }
  v3 = v7;
  objc_storeStrong((id *)&v7, 0);
  return v3;
}

+ (id)sanitizedTextForText:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id location[3];
  id v10;
  dispatch_once_t *v11;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = (dispatch_once_t *)&sanitizedTextForText__onceToken;
  v10 = 0;
  objc_storeStrong(&v10, &__block_literal_global_3);
  if (*v11 != -1)
    dispatch_once(v11, v10);
  objc_storeStrong(&v10, 0);
  v4 = location[0];
  v5 = (id)objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v8 = (id)objc_msgSend(v4, "stringByTrimmingCharactersInSet:");

  v6 = (id)objc_msgSend(v8, "componentsSeparatedByCharactersInSet:", sanitizedTextForText____disallowedCharacterSet);
  v7 = (id)objc_msgSend(v6, "componentsJoinedByString:", &stru_24E271FF0);

  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v7;
}

void __43__CPSAbridgableLabel_sanitizedTextForText___block_invoke(void *a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7[3];

  v7[2] = a1;
  v7[1] = a1;
  v7[0] = (id)objc_opt_new();
  v3 = v7[0];
  v4 = (id)objc_msgSend(MEMORY[0x24BDD14A8], "illegalCharacterSet");
  objc_msgSend(v3, "formUnionWithCharacterSet:");

  v5 = v7[0];
  v6 = (id)objc_msgSend(MEMORY[0x24BDD14A8], "newlineCharacterSet");
  objc_msgSend(v5, "formUnionWithCharacterSet:");

  v1 = objc_msgSend(v7[0], "copy");
  v2 = (void *)sanitizedTextForText____disallowedCharacterSet;
  sanitizedTextForText____disallowedCharacterSet = v1;

  objc_storeStrong(v7, 0);
}

- (id)sanitizedAttributedStringForString:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  id v7;
  id v8;
  uint64_t v9;
  int v10;
  int v11;
  void (*v12)(id *, void *, uint64_t, uint64_t, uint64_t);
  void *v13;
  id v14;
  CPSAbridgableLabel *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id location[2];
  CPSAbridgableLabel *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = objc_alloc(MEMORY[0x24BDD1688]);
  v18 = (id)objc_msgSend(v3, "initWithAttributedString:", location[0]);
  v7 = v18;
  v4 = objc_msgSend(v18, "length");
  v22 = 0;
  v21 = v4;
  v23 = 0;
  v24 = v4;
  v16 = 0;
  v17 = v4;
  v9 = MEMORY[0x24BDAC760];
  v10 = -1073741824;
  v11 = 0;
  v12 = __57__CPSAbridgableLabel_sanitizedAttributedStringForString___block_invoke;
  v13 = &unk_24E26F868;
  v14 = v18;
  v15 = v20;
  objc_msgSend(v7, "enumerateAttributesInRange:options:usingBlock:", v16, v17, 0);
  v5 = objc_alloc(MEMORY[0x24BDD1458]);
  v8 = (id)objc_msgSend(v5, "initWithAttributedString:", v18);
  objc_storeStrong((id *)&v15, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
  return v8;
}

void __57__CPSAbridgableLabel_sanitizedAttributedStringForString___block_invoke(id *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v7;
  uint64_t v8;
  int v9;
  int v10;
  void (*v11)(uint64_t, void *, void *, void *);
  void *v12;
  id v13;
  id v14;
  __int128 v15;
  id *v16;
  uint64_t v17;
  id location[2];
  __int128 v19;

  *(_QWORD *)&v19 = a3;
  *((_QWORD *)&v19 + 1) = a4;
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v17 = a5;
  v16 = a1;
  v7 = location[0];
  v8 = MEMORY[0x24BDAC760];
  v9 = -1073741824;
  v10 = 0;
  v11 = __57__CPSAbridgableLabel_sanitizedAttributedStringForString___block_invoke_2;
  v12 = &unk_24E26F840;
  v13 = a1[4];
  v15 = v19;
  v14 = a1[5];
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:");
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

void __57__CPSAbridgableLabel_sanitizedAttributedStringForString___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  id v10;
  BOOL v11;
  id v15;
  id v16[3];
  id v17;
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v17 = 0;
  objc_storeStrong(&v17, a3);
  v16[2] = a4;
  v16[1] = (id)a1;
  if ((objc_msgSend(location[0], "isEqualToString:", *MEMORY[0x24BDF65C0]) & 1) != 0
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v16[0] = v17;
    v4 = (id)objc_msgSend(v16[0], "image");
    v11 = v4 != 0;

    if (v11)
    {
      v9 = (id)objc_msgSend(v16[0], "image");
      CGSizeMake_2();
      v15 = (id)CPImageByScalingImageToSize();

      objc_msgSend(v16[0], "setImage:", v15);
      v10 = (id)objc_msgSend(*(id *)(a1 + 40), "font");
      objc_msgSend(v10, "capHeight");
      objc_msgSend(v15, "size");
      objc_msgSend(v15, "size");
      objc_msgSend(v15, "size");
      CGRectMake_0();
      objc_msgSend(v16[0], "setBounds:", v5, v6, v7, v8);

      objc_storeStrong(&v15, 0);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", location[0], *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    }
    objc_storeStrong(v16, 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", location[0], *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

- (void)setTextVariants:(id)a3
{
  NSArray *v3;
  NSArray *textVariants;
  id v5;
  CPSAbridgableLabel *v6;
  id v7;
  uint64_t v8;
  int v9;
  int v10;
  id (*v11)(void *, void *);
  void *v12;
  CPSAbridgableLabel *v13;
  id location[2];
  CPSAbridgableLabel *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15->_useAttributedTextVariants = 0;
  v5 = location[0];
  v8 = MEMORY[0x24BDAC760];
  v9 = -1073741824;
  v10 = 0;
  v11 = __38__CPSAbridgableLabel_setTextVariants___block_invoke;
  v12 = &unk_24E26F890;
  v13 = v15;
  v3 = (NSArray *)(id)objc_msgSend(v5, "cps_map:");
  textVariants = v15->_textVariants;
  v15->_textVariants = v3;

  v6 = v15;
  v7 = -[NSArray firstObject](v15->_textVariants, "firstObject");
  -[CPSAbridgableLabel setText:](v6, "setText:");

  -[CPSAbridgableLabel _updateVariant](v15, "_updateVariant");
  objc_storeStrong((id *)&v13, 0);
  objc_storeStrong(location, 0);
}

id __38__CPSAbridgableLabel_setTextVariants___block_invoke(void *a1, void *a2)
{
  id v3;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v3 = (id)objc_msgSend((id)objc_opt_class(), "sanitizedTextForText:", location[0]);
  objc_storeStrong(location, 0);
  return v3;
}

- (void)setAttributedTextVariants:(id)a3
{
  NSArray *v3;
  NSArray *attributedTextVariants;
  id v5;
  CPSAbridgableLabel *v6;
  id v7;
  uint64_t v8;
  int v9;
  int v10;
  id (*v11)(id *, void *);
  void *v12;
  CPSAbridgableLabel *v13;
  id location[2];
  CPSAbridgableLabel *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15->_useAttributedTextVariants = 1;
  v5 = location[0];
  v8 = MEMORY[0x24BDAC760];
  v9 = -1073741824;
  v10 = 0;
  v11 = __48__CPSAbridgableLabel_setAttributedTextVariants___block_invoke;
  v12 = &unk_24E26F8B8;
  v13 = v15;
  v3 = (NSArray *)(id)objc_msgSend(v5, "cps_map:");
  attributedTextVariants = v15->_attributedTextVariants;
  v15->_attributedTextVariants = v3;

  v6 = v15;
  v7 = -[NSArray firstObject](v15->_attributedTextVariants, "firstObject");
  -[CPSAbridgableLabel setAttributedText:](v6, "setAttributedText:");

  -[CPSAbridgableLabel _updateVariant](v15, "_updateVariant");
  objc_storeStrong((id *)&v13, 0);
  objc_storeStrong(location, 0);
}

id __48__CPSAbridgableLabel_setAttributedTextVariants___block_invoke(id *a1, void *a2)
{
  id v4;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v4 = (id)objc_msgSend(a1[4], "sanitizedAttributedStringForString:", location[0]);
  objc_storeStrong(location, 0);
  return v4;
}

- (void)setAttributedText:(id)a3
{
  objc_super v3;
  id v4;
  id location[2];
  CPSAbridgableLabel *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[CPSAbridgableLabel sanitizedAttributedStringForString:](v6, "sanitizedAttributedStringForString:", location[0]);
  v3.receiver = v6;
  v3.super_class = (Class)CPSAbridgableLabel;
  -[CPSAbridgableLabel setAttributedText:](&v3, sel_setAttributedText_, v4);
  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
}

- (void)setText:(id)a3
{
  objc_super v3;
  id v4;
  id location[2];
  CPSAbridgableLabel *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = (id)objc_msgSend((id)objc_opt_class(), "sanitizedTextForText:", location[0]);
  v3.receiver = v6;
  v3.super_class = (Class)CPSAbridgableLabel;
  -[CPSAbridgableLabel setText:](&v3, sel_setText_, v4);
  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
}

- (void)setFrame:(CGRect)a3
{
  objc_super v3;
  SEL v4;
  CPSAbridgableLabel *v5;
  CGRect v6;

  v6 = a3;
  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)CPSAbridgableLabel;
  -[CPSAbridgableLabel setFrame:](&v3, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[CPSAbridgableLabel _updateVariant](v5, "_updateVariant");
}

- (void)setBounds:(CGRect)a3
{
  objc_super v3;
  SEL v4;
  CPSAbridgableLabel *v5;
  CGRect v6;

  v6 = a3;
  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)CPSAbridgableLabel;
  -[CPSAbridgableLabel setBounds:](&v3, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[CPSAbridgableLabel _updateVariant](v5, "_updateVariant");
}

- (id)_variantsList
{
  if (-[CPSAbridgableLabel useAttributedTextVariants](self, "useAttributedTextVariants"))
    return self->_attributedTextVariants;
  else
    return self->_textVariants;
}

- (unint64_t)_numberOfVariants
{
  id v3;
  unint64_t v4;

  v3 = -[CPSAbridgableLabel _variantsList](self, "_variantsList");
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (void)_updateVariant
{
  CGFloat v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  id v6;
  uint64_t v7;
  id v8;
  unint64_t v9;
  id v10;
  unint64_t j;
  uint64_t v12;
  id obj;
  uint64_t i;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int v18;
  id v19;
  char v20;
  id v21;
  char v22;
  id v23;
  id location;
  CGRect v25;
  SEL v26;
  CPSAbridgableLabel *v27;

  v27 = self;
  v26 = a2;
  -[CPSAbridgableLabel bounds](self, "bounds");
  v25.origin.x = v2;
  v25.origin.y = v3;
  v25.size.width = v4;
  v25.size.height = v5;
  if (!CGRectEqualToRect(*MEMORY[0x24BDBF090], v25))
  {
    v22 = 0;
    v20 = 0;
    if (-[CPSAbridgableLabel useAttributedTextVariants](v27, "useAttributedTextVariants"))
    {
      v23 = (id)-[CPSAbridgableLabel attributedText](v27, "attributedText");
      v22 = 1;
      v6 = v23;
    }
    else
    {
      v21 = (id)-[CPSAbridgableLabel text](v27, "text");
      v20 = 1;
      v6 = v21;
    }
    location = v6;
    if ((v20 & 1) != 0)

    if ((v22 & 1) != 0)
    v19 = -[CPSAbridgableLabel _variantsList](v27, "_variantsList");
    if (v19)
    {
      v17 = objc_msgSend(v19, "indexOfObject:", location);
      if (v17 == 0x7FFFFFFFFFFFFFFFLL)
        v17 = 0;
      v16 = -[CPSAbridgableLabel _numberOfVariants](v27, "_numberOfVariants");
      if (v16 >= 2 && v17 < v16)
      {
        v15 = -[CPSAbridgableLabel _compareBoundsSizeToLayoutSizeForString:](v27, "_compareBoundsSizeToLayoutSizeForString:", location);
        if (v15 == 1)
        {
          for (i = 1; ; ++i)
          {
            v9 = i;
            if (v9 > -[CPSAbridgableLabel variantsIndex](v27, "variantsIndex"))
              break;
            v8 = v19;
            v7 = -[CPSAbridgableLabel variantsIndex](v27, "variantsIndex");
            obj = (id)objc_msgSend(v8, "objectAtIndex:", v7 - i);
            v12 = -[CPSAbridgableLabel _compareBoundsSizeToLayoutSizeForString:](v27, "_compareBoundsSizeToLayoutSizeForString:", obj);
            if (v12 == 1)
            {
              objc_storeStrong(&location, obj);
              v17 -= i;
              v18 = 0;
            }
            else
            {
              v18 = 2;
            }
            objc_storeStrong(&obj, 0);
            if (v18)
              break;
          }
        }
        else if (v15 == -1 && v17 + 1 < v16)
        {
          for (j = v17 + 1; j < v16; ++j)
          {
            v10 = (id)objc_msgSend(v19, "objectAtIndex:", j);
            if (-[CPSAbridgableLabel _compareBoundsSizeToLayoutSizeForString:](v27, "_compareBoundsSizeToLayoutSizeForString:", v10) == 1)
            {
              objc_storeStrong(&location, v10);
              v17 = j;
              v18 = 5;
            }
            else
            {
              v18 = 0;
            }
            objc_storeStrong(&v10, 0);
            if (v18)
              break;
          }
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          -[CPSAbridgableLabel setAttributedText:](v27, "setAttributedText:", location);
        else
          -[CPSAbridgableLabel setText:](v27, "setText:", location);
        -[CPSAbridgableLabel setVariantsIndex:](v27, "setVariantsIndex:", v17);
        v18 = 0;
      }
      else
      {
        v18 = 1;
      }
    }
    else
    {
      v18 = 1;
    }
    objc_storeStrong(&v19, 0);
    objc_storeStrong(&location, 0);
  }
}

- (int64_t)_compareBoundsSizeToLayoutSizeForString:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v12;
  double v13;
  id v14;
  id v15;
  uint64_t v16;
  char v17;
  id v18;
  char v19;
  id v20;
  double v21;
  double v22;
  id v23;
  double v24;
  uint64_t v25;
  BOOL v26;
  id v27[3];
  __int128 v28;
  __int128 v29;
  id location[2];
  CPSAbridgableLabel *v31;
  int64_t v32;

  v31 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[CPSAbridgableLabel bounds](v31, "bounds");
  v27[1] = v3;
  v27[2] = v4;
  *(_QWORD *)&v28 = v5;
  *((_QWORD *)&v28 + 1) = v6;
  v29 = v28;
  v27[0] = (id)-[CPSAbridgableLabel font](v31, "font");
  v7 = -[CPSAbridgableLabel numberOfLines](v31, "numberOfLines");
  v26 = v7 != 1;
  *(_QWORD *)&v24 = v28;
  v25 = 0x7FEFFFFFFFFFFFFFLL;
  if (v7 == 1)
    v24 = 1.79769313e308;
  v23 = objc_alloc_init(MEMORY[0x24BDF6760]);
  objc_msgSend(v23, "setWrapsForTruncationMode:", v26);
  if (v26)
    v16 = -[CPSAbridgableLabel numberOfLines](v31, "numberOfLines");
  else
    v16 = 1;
  objc_msgSend(v23, "setMaximumNumberOfLines:", v16);
  objc_opt_class();
  v19 = 0;
  v17 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = location[0];
    v20 = (id)-[CPSAbridgableLabel traitCollection](v31, "traitCollection");
    v19 = 1;
    objc_msgSend(v20, "displayScale");
    v21 = CPSSizeForAttributedText(v15, v23, v24, v8);
  }
  else
  {
    v14 = location[0];
    v18 = (id)-[CPSAbridgableLabel traitCollection](v31, "traitCollection");
    v17 = 1;
    objc_msgSend(v18, "displayScale");
    v21 = CPSSizeForText(v14, v27[0], v23, v24, v10);
  }
  v22 = v9;
  if ((v17 & 1) != 0)

  if ((v19 & 1) != 0)
  if (v26)
    v13 = *((double *)&v29 + 1);
  else
    v13 = *(double *)&v29;
  if (v26)
    v12 = v22;
  else
    v12 = v21;
  if (v13 >= v12)
    v32 = v13 > v12;
  else
    v32 = -1;
  objc_storeStrong(&v23, 0);
  objc_storeStrong(v27, 0);
  objc_storeStrong(location, 0);
  return v32;
}

- (NSArray)textVariants
{
  return self->_textVariants;
}

- (NSArray)attributedTextVariants
{
  return self->_attributedTextVariants;
}

- (unint64_t)variantsIndex
{
  return self->_variantsIndex;
}

- (void)setVariantsIndex:(unint64_t)a3
{
  self->_variantsIndex = a3;
}

- (BOOL)useAttributedTextVariants
{
  return self->_useAttributedTextVariants;
}

- (void)setUseAttributedTextVariants:(BOOL)a3
{
  self->_useAttributedTextVariants = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedTextVariants, 0);
  objc_storeStrong((id *)&self->_textVariants, 0);
}

@end
