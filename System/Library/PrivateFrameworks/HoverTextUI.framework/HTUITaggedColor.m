@implementation HTUITaggedColor

+ (id)color:(id)a3 identifier:(id)a4
{
  id v5;
  id v6;
  HTUITaggedColor *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(HTUITaggedColor);
  -[HTUITaggedColor setColor:](v7, "setColor:", v6);

  -[HTUITaggedColor setIdentifier:](v7, "setIdentifier:", v5);
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HTUITaggedColor color](self, "color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("color"));

  -[HTUITaggedColor identifier](self, "identifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("identifier"));

}

- (HTUITaggedColor)initWithCoder:(id)a3
{
  id v4;
  HTUITaggedColor *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HTUITaggedColor;
  v5 = -[HTUITaggedColor init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HTUITaggedColor setIdentifier:](v5, "setIdentifier:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("color"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HTUITaggedColor setColor:](v5, "setColor:", v7);

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[HTUITaggedColor identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HTUITaggedColor identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)localizedName
{
  void *v2;
  __CFString *v3;
  void *v4;

  -[HTUITaggedColor identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqual:", CFSTR("red")) & 1) != 0)
  {
    v3 = CFSTR("AXHoverTextTaggedColorRed");
  }
  else if ((objc_msgSend(v2, "isEqual:", CFSTR("green")) & 1) != 0)
  {
    v3 = CFSTR("AXHoverTextTaggedColorGreen");
  }
  else if ((objc_msgSend(v2, "isEqual:", CFSTR("blue")) & 1) != 0)
  {
    v3 = CFSTR("AXHoverTextTaggedColorBlue");
  }
  else if ((objc_msgSend(v2, "isEqual:", CFSTR("orange")) & 1) != 0)
  {
    v3 = CFSTR("AXHoverTextTaggedColorOrange");
  }
  else if ((objc_msgSend(v2, "isEqual:", CFSTR("yellow")) & 1) != 0)
  {
    v3 = CFSTR("AXHoverTextTaggedColorYellow");
  }
  else if ((objc_msgSend(v2, "isEqual:", CFSTR("pink")) & 1) != 0)
  {
    v3 = CFSTR("AXHoverTextTaggedColorPink");
  }
  else if ((objc_msgSend(v2, "isEqual:", CFSTR("purple")) & 1) != 0)
  {
    v3 = CFSTR("AXHoverTextTaggedColorPurple");
  }
  else if ((objc_msgSend(v2, "isEqual:", CFSTR("teal")) & 1) != 0)
  {
    v3 = CFSTR("AXHoverTextTaggedColorTeal");
  }
  else if ((objc_msgSend(v2, "isEqual:", CFSTR("indigo")) & 1) != 0)
  {
    v3 = CFSTR("AXHoverTextTaggedColorIndigo");
  }
  else if ((objc_msgSend(v2, "isEqual:", CFSTR("brown")) & 1) != 0)
  {
    v3 = CFSTR("AXHoverTextTaggedColorBrown");
  }
  else if ((objc_msgSend(v2, "isEqual:", CFSTR("mint")) & 1) != 0)
  {
    v3 = CFSTR("AXHoverTextTaggedColorMint");
  }
  else if ((objc_msgSend(v2, "isEqual:", CFSTR("cyan")) & 1) != 0)
  {
    v3 = CFSTR("AXHoverTextTaggedColorCyan");
  }
  else if ((objc_msgSend(v2, "isEqual:", CFSTR("gray")) & 1) != 0)
  {
    v3 = CFSTR("AXHoverTextTaggedColorGray");
  }
  else if ((objc_msgSend(v2, "isEqual:", CFSTR("white")) & 1) != 0)
  {
    v3 = CFSTR("AXHoverTextTaggedColorWhite");
  }
  else
  {
    if (!objc_msgSend(v2, "isEqual:", CFSTR("black")))
    {
      v4 = 0;
      goto LABEL_32;
    }
    v3 = CFSTR("AXHoverTextTaggedColorBlack");
  }
  HTUILocString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_32:

  return (NSString *)v4;
}

- (id)dataRepresentation
{
  void *v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v12;

  v12 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v12);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v12;
  if (v3)
  {
    AXLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[HTUITaggedColor dataRepresentation].cold.1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  }
  return v2;
}

+ (id)makeFromData:(id)a3
{
  id v3;
  HTUITaggedColor *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v15;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc_init(HTUITaggedColor);
    v15 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, &v15);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v15;
    -[HTUITaggedColor setColor:](v4, "setColor:", v5);

    if (v6)
    {
      AXLogCommon();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        +[HTUITaggedColor makeFromData:].cold.1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)makeFromData:(id)a3 withOpacity:(double)a4
{
  return +[HTUITaggedColor makeFromData:](HTUITaggedColor, "makeFromData:", a3, a4);
}

+ (id)userPickableColors
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[17];

  v34[15] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  +[HTUITaggedColor color:identifier:](HTUITaggedColor, "color:identifier:", v33, CFSTR("black"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v32;
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[HTUITaggedColor color:identifier:](HTUITaggedColor, "color:identifier:", v31, CFSTR("white"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v30;
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.556862745, 0.556862745, 0.576470588, 1.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[HTUITaggedColor color:identifier:](HTUITaggedColor, "color:identifier:", v29, CFSTR("gray"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v28;
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 1.0, 0.270588235, 0.22745098, 1.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[HTUITaggedColor color:identifier:](HTUITaggedColor, "color:identifier:", v27, CFSTR("red"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v34[3] = v26;
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.196078431, 0.843137255, 0.294117647, 1.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[HTUITaggedColor color:identifier:](HTUITaggedColor, "color:identifier:", v25, CFSTR("green"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v34[4] = v24;
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.0392156863, 0.517647059, 1.0, 1.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[HTUITaggedColor color:identifier:](HTUITaggedColor, "color:identifier:", v23, CFSTR("blue"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v34[5] = v22;
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 1.0, 0.839215686, 0.0392156863, 1.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[HTUITaggedColor color:identifier:](HTUITaggedColor, "color:identifier:", v21, CFSTR("orange"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v34[6] = v20;
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 1.0, 159.0, 0.0392156863, 1.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[HTUITaggedColor color:identifier:](HTUITaggedColor, "color:identifier:", v19, CFSTR("yellow"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v34[7] = v18;
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 1.0, 0.215686275, 0.37254902, 1.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[HTUITaggedColor color:identifier:](HTUITaggedColor, "color:identifier:", v17, CFSTR("pink"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v34[8] = v16;
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.749019608, 0.352941176, 0.949019608, 1.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[HTUITaggedColor color:identifier:](HTUITaggedColor, "color:identifier:", v15, CFSTR("purple"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v34[9] = v14;
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.250980392, 0.784313725, 0.878431373, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HTUITaggedColor color:identifier:](HTUITaggedColor, "color:identifier:", v2, CFSTR("teal"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v34[10] = v3;
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.368627451, 0.360784314, 0.901960784, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HTUITaggedColor color:identifier:](HTUITaggedColor, "color:identifier:", v4, CFSTR("indigo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v34[11] = v5;
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.674509804, 0.556862745, 0.407843137, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HTUITaggedColor color:identifier:](HTUITaggedColor, "color:identifier:", v6, CFSTR("brown"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v34[12] = v7;
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.388235294, 0.901960784, 0.88627451, 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HTUITaggedColor color:identifier:](HTUITaggedColor, "color:identifier:", v8, CFSTR("mint"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v34[13] = v9;
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.392156863, 0.823529412, 1.0, 1.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HTUITaggedColor color:identifier:](HTUITaggedColor, "color:identifier:", v10, CFSTR("cyan"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v34[14] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 15);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

- (void)dataRepresentation
{
  OUTLINED_FUNCTION_0(&dword_21A787000, a2, a3, "Failed to encode HTUITaggedColor. %@", a5, a6, a7, a8, 2u);
}

+ (void)makeFromData:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21A787000, a2, a3, "Failed to decode HTUITaggedColor. %@", a5, a6, a7, a8, 2u);
}

@end
