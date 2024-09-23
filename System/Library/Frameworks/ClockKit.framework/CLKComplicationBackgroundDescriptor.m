@implementation CLKComplicationBackgroundDescriptor

- (CLKComplicationBackgroundDescriptor)initWithClearBackground
{
  CLKComplicationBackgroundDescriptor *v2;
  CLKComplicationBackgroundDescriptor *v3;
  NSArray *backgroundColors;
  NSArray *backgroundLocations;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLKComplicationBackgroundDescriptor;
  v2 = -[CLKComplicationBackgroundDescriptor init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    backgroundColors = v2->_backgroundColors;
    v2->_backgroundColors = 0;

    backgroundLocations = v3->_backgroundLocations;
    v3->_backgroundLocations = 0;

    v3->_style = 1;
  }
  return v3;
}

- (CLKComplicationBackgroundDescriptor)initWithMaterialBackground
{
  CLKComplicationBackgroundDescriptor *v2;
  CLKComplicationBackgroundDescriptor *v3;
  NSArray *backgroundColors;
  NSArray *backgroundLocations;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLKComplicationBackgroundDescriptor;
  v2 = -[CLKComplicationBackgroundDescriptor init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    backgroundColors = v2->_backgroundColors;
    v2->_backgroundColors = 0;

    backgroundLocations = v3->_backgroundLocations;
    v3->_backgroundLocations = 0;

    v3->_style = 0;
  }
  return v3;
}

- (CLKComplicationBackgroundDescriptor)initWithGradientBackgroundColors:(id)a3 locations:(id)a4
{
  id v6;
  id v7;
  CLKComplicationBackgroundDescriptor *v8;
  uint64_t v9;
  NSArray *backgroundColors;
  uint64_t v11;
  NSArray *backgroundLocations;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CLKComplicationBackgroundDescriptor;
  v8 = -[CLKComplicationBackgroundDescriptor init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    backgroundColors = v8->_backgroundColors;
    v8->_backgroundColors = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    backgroundLocations = v8->_backgroundLocations;
    v8->_backgroundLocations = (NSArray *)v11;

    v8->_style = 2;
  }

  return v8;
}

- (CLKComplicationBackgroundDescriptor)initWithGradientBackgroundColors:(id)a3
{
  return -[CLKComplicationBackgroundDescriptor initWithGradientBackgroundColors:locations:](self, "initWithGradientBackgroundColors:locations:", a3, 0);
}

- (CLKComplicationBackgroundDescriptor)initWithBackgroundColor:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  CLKComplicationBackgroundDescriptor *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v9[0] = a3;
  v9[1] = a3;
  v4 = (void *)MEMORY[0x24BDBCE30];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[CLKComplicationBackgroundDescriptor initWithGradientBackgroundColors:](self, "initWithGradientBackgroundColors:", v6);
  return v7;
}

- (NSArray)backgroundColors
{
  return self->_backgroundColors;
}

- (NSArray)backgroundLocations
{
  return self->_backgroundLocations;
}

- (int64_t)style
{
  return self->_style;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundLocations, 0);
  objc_storeStrong((id *)&self->_backgroundColors, 0);
}

@end
