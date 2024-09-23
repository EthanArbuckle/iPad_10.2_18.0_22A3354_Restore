@implementation NTKSolarRichComplicationCircularViewColorPoint

+ (id)pointWithColor1:(id)a3 color2:(id)a4 color3:(id)a5 position1:(double)a6 position2:(double)a7 position3:(double)a8 progress:(double)a9
{
  UIColor *v15;
  UIColor *v16;
  UIColor *v17;
  NTKSolarRichComplicationCircularViewColorPoint *v18;
  UIColor *color1;
  UIColor *v20;
  UIColor *color2;
  UIColor *v22;
  UIColor *color3;

  v15 = (UIColor *)a3;
  v16 = (UIColor *)a4;
  v17 = (UIColor *)a5;
  v18 = objc_alloc_init(NTKSolarRichComplicationCircularViewColorPoint);
  color1 = v18->_color1;
  v18->_color1 = v15;
  v20 = v15;

  color2 = v18->_color2;
  v18->_color2 = v16;
  v22 = v16;

  color3 = v18->_color3;
  v18->_color3 = v17;

  v18->_position1 = a6;
  v18->_position2 = a7;
  v18->_position3 = a8;
  v18->_progress = a9;
  return v18;
}

+ (id)allPoints
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
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
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[11];

  v40[9] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.101960784, 0.125490196, 0.301960784, 1.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.062745098, 0.0823529412, 0.298039216, 1.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.00392156863, 0.00392156863, 0.160784314, 1.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKSolarRichComplicationCircularViewColorPoint pointWithColor1:color2:color3:position1:position2:position3:progress:](NTKSolarRichComplicationCircularViewColorPoint, "pointWithColor1:color2:color3:position1:position2:position3:progress:", v39, v38, v37, 0.0, 0.3, 0.9, -20.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v36;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.101960784, 0.2);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0941176471, 0.137254902);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.00784313725, 0.00784313725, 0.219607843, 1.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKSolarRichComplicationCircularViewColorPoint pointWithColor1:color2:color3:position1:position2:position3:progress:](NTKSolarRichComplicationCircularViewColorPoint, "pointWithColor1:color2:color3:position1:position2:position3:progress:", v35, v34, v33, 0.0, 0.3, 0.9, -15.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v32;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.368627451, 0.466666667, 0.921568627, 1.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.176470588, 0.321568627, 0.678431373, 1.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.101960784, 0.141176471, 0.349019608, 1.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKSolarRichComplicationCircularViewColorPoint pointWithColor1:color2:color3:position1:position2:position3:progress:](NTKSolarRichComplicationCircularViewColorPoint, "pointWithColor1:color2:color3:position1:position2:position3:progress:", v31, v30, v29, 0.0, 0.3, 0.9, -9.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v40[2] = v28;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.780392157, 0.6, 0.545098039, 1.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.125490196, 0.196078431, 0.470588235, 1.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKSolarRichComplicationCircularViewColorPoint pointWithColor1:color2:color3:position1:position2:position3:progress:](NTKSolarRichComplicationCircularViewColorPoint, "pointWithColor1:color2:color3:position1:position2:position3:progress:", v27, v26, v25, 0.0, 0.2, 0.9, -3.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v40[3] = v24;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.945098039, 0.784313725, 0.568627451, 1.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.568627451, 0.682352941, 0.847058824, 1.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.294117647, 0.42745098, 0.737254902, 1.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKSolarRichComplicationCircularViewColorPoint pointWithColor1:color2:color3:position1:position2:position3:progress:](NTKSolarRichComplicationCircularViewColorPoint, "pointWithColor1:color2:color3:position1:position2:position3:progress:", v22, v21, v20, 0.0, 0.3, 0.9, 6.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v40[4] = v19;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.541176471, 0.780392157, 0.901960784, 1.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.419607843, 0.674509804, 0.929411765, 1.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.215686275, 0.470588235, 0.8, 1.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKSolarRichComplicationCircularViewColorPoint pointWithColor1:color2:color3:position1:position2:position3:progress:](NTKSolarRichComplicationCircularViewColorPoint, "pointWithColor1:color2:color3:position1:position2:position3:progress:", v18, v17, v16, 0.0, 0.3, 0.9, 15.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v40[5] = v15;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.470588235, 0.737254902, 0.941176471, 1.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.396078431, 0.654901961, 0.878431373, 1.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.231372549, 0.501960784, 0.831372549, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKSolarRichComplicationCircularViewColorPoint pointWithColor1:color2:color3:position1:position2:position3:progress:](NTKSolarRichComplicationCircularViewColorPoint, "pointWithColor1:color2:color3:position1:position2:position3:progress:", v14, v13, v2, 0.0, 0.3, 0.9, 30.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v40[6] = v3;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.439215686, 0.745098039, 0.980392157, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.392156863, 0.670588235, 0.929411765, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.305882353, 0.623529412, 0.901960784, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKSolarRichComplicationCircularViewColorPoint pointWithColor1:color2:color3:position1:position2:position3:progress:](NTKSolarRichComplicationCircularViewColorPoint, "pointWithColor1:color2:color3:position1:position2:position3:progress:", v4, v5, v6, 0.0, 0.3, 0.9, 50.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v40[7] = v7;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.384313725, 0.670588235, 0.960784314, 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.380392157, 0.701960784, 0.949019608, 1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.521568627, 0.780392157, 0.949019608, 1.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKSolarRichComplicationCircularViewColorPoint pointWithColor1:color2:color3:position1:position2:position3:progress:](NTKSolarRichComplicationCircularViewColorPoint, "pointWithColor1:color2:color3:position1:position2:position3:progress:", v8, v9, v10, 0.0, 0.3, 0.9, 90.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v40[8] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 9);
  v23 = (id)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (UIColor)color1
{
  return self->_color1;
}

- (UIColor)color2
{
  return self->_color2;
}

- (UIColor)color3
{
  return self->_color3;
}

- (double)position1
{
  return self->_position1;
}

- (double)position2
{
  return self->_position2;
}

- (double)position3
{
  return self->_position3;
}

- (double)progress
{
  return self->_progress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color3, 0);
  objc_storeStrong((id *)&self->_color2, 0);
  objc_storeStrong((id *)&self->_color1, 0);
}

@end
