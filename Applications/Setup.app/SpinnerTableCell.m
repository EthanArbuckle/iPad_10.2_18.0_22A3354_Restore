@implementation SpinnerTableCell

- (SpinnerTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v4;
  id v5;
  void *v6;
  id v7;
  SpinnerTableCell *v8;
  objc_super v10;
  id location;
  int64_t v12;
  SEL v13;
  id v14;

  v14 = self;
  v13 = a2;
  v12 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v4 = v14;
  v14 = 0;
  v10.receiver = v4;
  v10.super_class = (Class)SpinnerTableCell;
  v14 = -[SpinnerTableCell initWithStyle:reuseIdentifier:](&v10, "initWithStyle:reuseIdentifier:", v12, location);
  objc_storeStrong(&v14, v14);
  if (v14)
  {
    v5 = objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);
    v6 = (void *)*((_QWORD *)v14 + 1);
    *((_QWORD *)v14 + 1) = v5;

    objc_msgSend(*((id *)v14 + 1), "startAnimating");
    v7 = objc_msgSend(v14, "contentView");
    objc_msgSend(v7, "addSubview:", *((_QWORD *)v14 + 1));

  }
  v8 = (SpinnerTableCell *)v14;
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v14, 0);
  return v8;
}

- (void)layoutSubviews
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  float v8;
  double v9;
  float v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  objc_super v17;
  SEL v18;
  SpinnerTableCell *v19;

  v19 = self;
  v18 = a2;
  v17.receiver = self;
  v17.super_class = (Class)SpinnerTableCell;
  -[SpinnerTableCell layoutSubviews](&v17, "layoutSubviews");
  v2 = -[SpinnerTableCell contentView](v19, "contentView");
  objc_msgSend(v2, "bounds");
  v14 = v3;
  v13 = v4;
  v16 = v5;
  v15 = v6;

  -[UIActivityIndicatorView frame](v19->_spinner, "frame", 0, 0, 0, 0, v13, v14);
  v8 = (v15 - v7) / 2.0;
  v12 = floorf(v8);
  v10 = (v16 - v9) / 2.0;
  v11 = floorf(v10);
  -[UIActivityIndicatorView setFrame:](v19->_spinner, "setFrame:", v12, v11, v7, v9, *(_QWORD *)&v12, *(_QWORD *)&v11, *(_QWORD *)&v7, *(_QWORD *)&v9);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
}

@end
