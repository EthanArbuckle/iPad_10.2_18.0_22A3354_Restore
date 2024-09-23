@implementation MTLumaDodgePillStyleSettings

- (double)saturation
{
  return self->_saturation;
}

- (double)overlayBlendOpacity
{
  return self->_overlayBlendOpacity;
}

- (double)lumaMapPlusColorOpacity
{
  return self->_lumaMapPlusColorOpacity;
}

- (double)colorAddOpacity
{
  return self->_colorAddOpacity;
}

- (double)brightness
{
  return self->_brightness;
}

- (double)blur
{
  return self->_blur;
}

- (void)setDefaultValues
{
  -[MTLumaDodgePillStyleSettings setColorAddOpacity:](self, "setColorAddOpacity:", 0.0);
  -[MTLumaDodgePillStyleSettings setLumaMapPlusColorOpacity:](self, "setLumaMapPlusColorOpacity:", 0.0);
  -[MTLumaDodgePillStyleSettings setOverlayBlendOpacity:](self, "setOverlayBlendOpacity:", 0.0);
  -[MTLumaDodgePillStyleSettings setBlur:](self, "setBlur:", 0.0);
  -[MTLumaDodgePillStyleSettings setBrightness:](self, "setBrightness:", 0.0);
  -[MTLumaDodgePillStyleSettings setSaturation:](self, "setSaturation:", 1.0);
}

+ (id)settingsControllerModule
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
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
  _QWORD v27[14];

  v27[12] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE7B320], "rowWithTitle:valueKeyPath:", CFSTR("+Color: Opacity"), CFSTR("colorAddOpacity"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v25;
  objc_msgSend(MEMORY[0x24BE7B380], "rowWithTitle:valueKeyPath:", 0, CFSTR("colorAddOpacity"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "minValue:maxValue:", 0.0, 1.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v23;
  objc_msgSend(MEMORY[0x24BE7B320], "rowWithTitle:valueKeyPath:", CFSTR("Luma+Color Opacity"), CFSTR("lumaMapPlusColorOpacity"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v22;
  objc_msgSend(MEMORY[0x24BE7B380], "rowWithTitle:valueKeyPath:", 0, CFSTR("lumaMapPlusColorOpacity"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "minValue:maxValue:", 0.0, 1.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v20;
  objc_msgSend(MEMORY[0x24BE7B320], "rowWithTitle:valueKeyPath:", CFSTR("Overlay-Blend Opacity"), CFSTR("overlayBlendOpacity"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[4] = v19;
  objc_msgSend(MEMORY[0x24BE7B380], "rowWithTitle:valueKeyPath:", 0, CFSTR("overlayBlendOpacity"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "minValue:maxValue:", 0.0, 1.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27[5] = v17;
  objc_msgSend(MEMORY[0x24BE7B320], "rowWithTitle:valueKeyPath:", CFSTR("Blur Radius"), CFSTR("blur"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v27[6] = v2;
  objc_msgSend(MEMORY[0x24BE7B380], "rowWithTitle:valueKeyPath:", 0, CFSTR("blur"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "minValue:maxValue:", 0.0, 50.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v27[7] = v4;
  objc_msgSend(MEMORY[0x24BE7B320], "rowWithTitle:valueKeyPath:", CFSTR("Brightness"), CFSTR("brightness"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27[8] = v5;
  objc_msgSend(MEMORY[0x24BE7B380], "rowWithTitle:valueKeyPath:", 0, CFSTR("brightness"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "minValue:maxValue:", -10.0, 10.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27[9] = v7;
  objc_msgSend(MEMORY[0x24BE7B320], "rowWithTitle:valueKeyPath:", CFSTR("Saturation"), CFSTR("saturation"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27[10] = v8;
  objc_msgSend(MEMORY[0x24BE7B380], "rowWithTitle:valueKeyPath:", 0, CFSTR("saturation"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minValue:maxValue:", 0.0, 2.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[11] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x24BE7B338];
  objc_msgSend(MEMORY[0x24BE7B338], "sectionWithRows:title:", v11, CFSTR("Parameters"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v26, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "moduleWithTitle:contents:", 0, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)setColorAddOpacity:(double)a3
{
  self->_colorAddOpacity = a3;
}

- (void)setLumaMapPlusColorOpacity:(double)a3
{
  self->_lumaMapPlusColorOpacity = a3;
}

- (void)setOverlayBlendOpacity:(double)a3
{
  self->_overlayBlendOpacity = a3;
}

- (void)setBlur:(double)a3
{
  self->_blur = a3;
}

- (void)setBrightness:(double)a3
{
  self->_brightness = a3;
}

- (void)setSaturation:(double)a3
{
  self->_saturation = a3;
}

@end
