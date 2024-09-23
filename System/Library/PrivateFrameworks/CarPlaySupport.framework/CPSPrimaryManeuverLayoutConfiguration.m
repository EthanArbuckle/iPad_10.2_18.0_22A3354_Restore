@implementation CPSPrimaryManeuverLayoutConfiguration

- (id)description
{
  uint64_t v2;
  NSAttributedString *v4;
  void *v5;
  id v6;
  id v7;
  UIImage *v8;
  uint64_t v9;
  NSAttributedString *v10;
  char v11;
  NSString *v12;
  objc_super v13;
  SEL v14;
  CPSPrimaryManeuverLayoutConfiguration *v15;
  id v16;

  v15 = self;
  v14 = a2;
  v5 = (void *)MEMORY[0x24BDD17C8];
  v13.receiver = self;
  v13.super_class = (Class)CPSPrimaryManeuverLayoutConfiguration;
  v6 = -[CPSPrimaryManeuverLayoutConfiguration description](&v13, sel_description);
  v7 = -[CPSPrimaryManeuverLayoutConfiguration _layoutString](v15, "_layoutString");
  v8 = -[CPSPrimaryManeuverLayoutConfiguration symbolImage](v15, "symbolImage");
  -[CPSPrimaryManeuverLayoutConfiguration height](v15, "height");
  v9 = v2;
  v10 = -[CPSPrimaryManeuverLayoutConfiguration attributedInstruction](v15, "attributedInstruction");
  v11 = 0;
  if (v10)
  {
    v4 = v10;
  }
  else
  {
    v12 = -[CPSPrimaryManeuverLayoutConfiguration instruction](v15, "instruction");
    v11 = 1;
    v4 = (NSAttributedString *)v12;
  }
  v16 = (id)objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ [layout: %@, image: %@, height: %f, instruction: %@]"), v6, v7, v8, v9, v4);
  if ((v11 & 1) != 0)

  return v16;
}

- (id)_layoutString
{
  unint64_t v3;

  v3 = -[CPSPrimaryManeuverLayoutConfiguration layout](self, "layout");
  if (v3 <= 9)
    __asm { BR              X8 }
  return &stru_24E271FF0;
}

- (BOOL)isEqual:(id)a3
{
  id location[2];
  CPSPrimaryManeuverLayoutConfiguration *v5;
  char v6;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v5 == location[0])
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = -[CPSPrimaryManeuverLayoutConfiguration isEqualToConfiguration:](v5, "isEqualToConfiguration:", location[0]);
    else
      v6 = 0;
  }
  objc_storeStrong(location, 0);
  return v6 & 1;
}

- (BOOL)isEqualToConfiguration:(id)a3
{
  uint64_t v4;
  char v5;
  char v6;
  id v7;
  char v8;
  UIImage *v9;
  char v10;
  id v11;
  char v12;
  UIImage *v13;
  char v14;
  id v15;
  char v16;
  NSAttributedString *v17;
  char v18;
  id v19;
  char v20;
  NSString *v21;
  id location[2];
  CPSPrimaryManeuverLayoutConfiguration *v23;
  char v24;

  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[CPSPrimaryManeuverLayoutConfiguration layout](v23, "layout");
  v20 = 0;
  v18 = 0;
  v16 = 0;
  v14 = 0;
  v12 = 0;
  v10 = 0;
  v8 = 0;
  v6 = 0;
  v5 = 0;
  if (v4 == objc_msgSend(location[0], "layout"))
  {
    -[CPSPrimaryManeuverLayoutConfiguration height](v23, "height");
    objc_msgSend(location[0], "height");
    v5 = 0;
    if ((BSFloatEqualToFloat() & 1) != 0)
    {
      v21 = -[CPSPrimaryManeuverLayoutConfiguration instruction](v23, "instruction");
      v20 = 1;
      v19 = (id)objc_msgSend(location[0], "instruction");
      v18 = 1;
      v5 = 0;
      if (-[NSString isEqualToString:](v21, "isEqualToString:"))
      {
        v17 = -[CPSPrimaryManeuverLayoutConfiguration attributedInstruction](v23, "attributedInstruction");
        v16 = 1;
        v15 = (id)objc_msgSend(location[0], "attributedInstruction");
        v14 = 1;
        v5 = 0;
        if (-[NSAttributedString isEqualToAttributedString:](v17, "isEqualToAttributedString:"))
        {
          v13 = -[CPSPrimaryManeuverLayoutConfiguration symbolImage](v23, "symbolImage");
          v12 = 1;
          v11 = (id)objc_msgSend(location[0], "symbolImage");
          v10 = 1;
          v5 = 0;
          if ((-[UIImage isEqual:](v13, "isEqual:") & 1) != 0)
          {
            v9 = -[CPSPrimaryManeuverLayoutConfiguration junctionImage](v23, "junctionImage");
            v8 = 1;
            v7 = (id)objc_msgSend(location[0], "junctionImage");
            v6 = 1;
            v5 = -[UIImage isEqual:](v9, "isEqual:");
          }
        }
      }
    }
  }
  v24 = v5 & 1;
  if ((v6 & 1) != 0)

  if ((v8 & 1) != 0)
  if ((v10 & 1) != 0)

  if ((v12 & 1) != 0)
  if ((v14 & 1) != 0)

  if ((v16 & 1) != 0)
  if ((v18 & 1) != 0)

  if ((v20 & 1) != 0)
  objc_storeStrong(location, 0);
  return v24 & 1;
}

- (unint64_t)layout
{
  return self->_layout;
}

- (void)setLayout:(unint64_t)a3
{
  self->_layout = a3;
}

- (NSString)instruction
{
  return self->_instruction;
}

- (void)setInstruction:(id)a3
{
  objc_storeStrong((id *)&self->_instruction, a3);
}

- (NSAttributedString)attributedInstruction
{
  return self->_attributedInstruction;
}

- (void)setAttributedInstruction:(id)a3
{
  objc_storeStrong((id *)&self->_attributedInstruction, a3);
}

- (double)height
{
  return self->_height;
}

- (void)setHeight:(double)a3
{
  self->_height = a3;
}

- (UIImage)symbolImage
{
  return self->_symbolImage;
}

- (void)setSymbolImage:(id)a3
{
  objc_storeStrong((id *)&self->_symbolImage, a3);
}

- (UIImage)junctionImage
{
  return self->_junctionImage;
}

- (void)setJunctionImage:(id)a3
{
  objc_storeStrong((id *)&self->_junctionImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_junctionImage, 0);
  objc_storeStrong((id *)&self->_symbolImage, 0);
  objc_storeStrong((id *)&self->_attributedInstruction, 0);
  objc_storeStrong((id *)&self->_instruction, 0);
}

@end
