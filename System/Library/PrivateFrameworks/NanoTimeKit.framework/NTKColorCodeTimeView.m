@implementation NTKColorCodeTimeView

- (NTKColorCodeTimeView)init
{
  NTKColorCodeTimeView *v2;
  NSArray *v3;
  int v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSArray *colorViews;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSArray *digitToColor;
  uint64_t v21;
  NSCalendar *cal;
  void *v23;
  void *v25;
  void *v26;
  NSArray *v27;
  objc_super v28;
  _QWORD v29[11];

  v29[10] = *MEMORY[0x1E0C80C00];
  v28.receiver = self;
  v28.super_class = (Class)NTKColorCodeTimeView;
  v2 = -[NTKColorCodeTimeView init](&v28, sel_init);
  if (v2)
  {
    v3 = (NSArray *)objc_opt_new();
    v4 = 9;
    do
    {
      v5 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v7 = objc_msgSend(v6, "CGColor");
      objc_msgSend(v5, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setBorderColor:", v7);

      objc_msgSend(v5, "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setBorderWidth:", 2.0);

      -[NSArray addObject:](v3, "addObject:", v5);
      -[NTKColorCodeTimeView addSubview:](v2, "addSubview:", v5);

      --v4;
    }
    while (v4);
    colorViews = v2->_colorViews;
    v2->_colorViews = v3;
    v27 = v3;

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v26;
    objc_msgSend(MEMORY[0x1E0DC3658], "brownColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v25;
    objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v29[2] = v11;
    objc_msgSend(MEMORY[0x1E0DC3658], "orangeColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v29[3] = v12;
    objc_msgSend(MEMORY[0x1E0DC3658], "yellowColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v29[4] = v13;
    objc_msgSend(MEMORY[0x1E0DC3658], "greenColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v29[5] = v14;
    objc_msgSend(MEMORY[0x1E0DC3658], "blueColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v29[6] = v15;
    objc_msgSend(MEMORY[0x1E0DC3658], "purpleColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v29[7] = v16;
    objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v29[8] = v17;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v29[9] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 10);
    v19 = objc_claimAutoreleasedReturnValue();
    digitToColor = v2->_digitToColor;
    v2->_digitToColor = (NSArray *)v19;

    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v21 = objc_claimAutoreleasedReturnValue();
    cal = v2->_cal;
    v2->_cal = (NSCalendar *)v21;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    -[NTKColorCodeTimeView setBackgroundColor:](v2, "setBackgroundColor:", v23);
  }
  return v2;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  unint64_t v7;
  unint64_t v8;
  double v9;
  double x;
  double y;
  double width;
  double height;
  void *v14;
  objc_super v15;
  CGRect v16;
  CGRect v17;

  v15.receiver = self;
  v15.super_class = (Class)NTKColorCodeTimeView;
  -[NTKColorCodeTimeView layoutSubviews](&v15, sel_layoutSubviews);
  -[NTKColorCodeTimeView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v7 = -[NSArray count](self->_colorViews, "count");
  if (-[NSArray count](self->_colorViews, "count"))
  {
    v8 = 0;
    v9 = v4 / (double)v7;
    do
    {
      v16.origin.x = v9 * (double)(int)v8;
      v16.origin.y = 0.0;
      v16.size.width = v9;
      v16.size.height = v6;
      v17 = CGRectInset(v16, 2.0, 2.0);
      x = v17.origin.x;
      y = v17.origin.y;
      width = v17.size.width;
      height = v17.size.height;
      -[NSArray objectAtIndexedSubscript:](self->_colorViews, "objectAtIndexedSubscript:", v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setFrame:", x, y, width, height);

      ++v8;
    }
    while (-[NSArray count](self->_colorViews, "count") > v8);
  }
}

- (void)setDate:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[10];

  v10[9] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  objc_storeStrong((id *)&self->_date, a3);
  -[NTKColorCodeTimeView layoutSubviews](self, "layoutSubviews");
  -[NSCalendar components:fromDate:](self->_cal, "components:fromDate:", 32992, v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = objc_msgSend(v5, "hour") / 10;
  v10[1] = objc_msgSend(v5, "hour") % 10;
  v10[2] = objc_msgSend(v5, "minute") / 10;
  v10[3] = objc_msgSend(v5, "minute") % 10;
  v10[4] = objc_msgSend(v5, "second") / 10;
  v10[5] = objc_msgSend(v5, "second") % 10;
  v10[6] = objc_msgSend(v5, "nanosecond") / 100000000;
  v10[7] = objc_msgSend(v5, "nanosecond") / 10000000 % 10;
  v6 = 0;
  v10[8] = objc_msgSend(v5, "nanosecond") / 1000000 % 10;
  do
  {
    -[NSArray objectAtIndexedSubscript:](self->_digitToColor, "objectAtIndexedSubscript:", v10[v6]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray objectAtIndexedSubscript:](self->_colorViews, "objectAtIndexedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v7);

    ++v6;
  }
  while (v6 != 9);

}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_cal, 0);
  objc_storeStrong((id *)&self->_digitToColor, 0);
  objc_storeStrong((id *)&self->_colorViews, 0);
}

@end
