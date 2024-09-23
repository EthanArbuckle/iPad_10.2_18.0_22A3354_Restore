@implementation MLUBlurryView

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  char v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MLUBlurryView;
  if (-[MLUBlurryView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4)
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("filters.gaussianBlur.inputRadius")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("path")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("cornerRadius")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("mask.path"));
  }

  return v5;
}

- (void)_activateBlurring
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BDE56B0]);
  v4 = (void *)objc_msgSend(v3, "initWithType:", *MEMORY[0x24BDE5A78]);
  objc_msgSend(v4, "setValue:forKey:", &unk_24E22E628, *MEMORY[0x24BDBF978]);
  objc_msgSend(v4, "setValue:forKey:", CFSTR("low"), CFSTR("inputQuality"));
  objc_msgSend(v4, "setValue:forKey:", CFSTR("low"), CFSTR("inputIntermediateBitDepth"));
  objc_msgSend(v4, "setName:", CFSTR("gaussianBlur"));
  -[MLUBlurryView setShouldRasterizeForTransition:](self, "setShouldRasterizeForTransition:", 1);
  v7[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLUBlurryView layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFilters:", v5);

}

- (double)blurRadius
{
  void *v2;
  void *v3;
  float v4;
  double v5;

  if (!self->_hasActivated)
    return 0.0;
  -[MLUBlurryView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKeyPath:", CFSTR("filters.gaussianBlur.inputRadius"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (void)setBlurRadius:(double)a3
{
  void *v5;
  id v6;

  if (!self->_hasActivated)
    -[MLUBlurryView _activateBlurring](self, "_activateBlurring");
  -[MLUBlurryView layer](self, "layer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKeyPath:", v5, CFSTR("filters.gaussianBlur.inputRadius"));

}

- (void)setShouldRasterizeForTransition:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  id v10;

  v3 = a3;
  self->_shouldRasterizeForTransition = a3;
  -[MLUBlurryView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShouldRasterize:", v3);

  -[MLUBlurryView window](self, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "screen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  v9 = v8;

  if (v9 >= 3.0)
    v9 = v9 * 0.5;
  -[MLUBlurryView layer](self, "layer");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRasterizationScale:", v9);

}

- (BOOL)shouldRasterizeForTransition
{
  return self->_shouldRasterizeForTransition;
}

@end
