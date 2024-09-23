@implementation UIView

- (void)buddy_setSemanticContentAttributeRecursively:(int64_t)a3
{
  NSArray *v3;
  id v4;
  uint64_t v5;
  unint64_t i;
  _QWORD __b[8];
  id v8;
  int64_t v9;
  SEL v10;
  UIView *v11;
  _BYTE v12[128];

  v11 = self;
  v10 = a2;
  v9 = a3;
  memset(__b, 0, sizeof(__b));
  v3 = -[UIView subviews](v11, "subviews");
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", __b, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)__b[2];
    do
    {
      for (i = 0; i < (unint64_t)v4; ++i)
      {
        if (*(_QWORD *)__b[2] != v5)
          objc_enumerationMutation(v3);
        v8 = *(id *)(__b[1] + 8 * i);
        objc_msgSend(v8, "buddy_setSemanticContentAttributeRecursively:", v9);
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", __b, v12, 16);
    }
    while (v4);
  }

  -[UIView setSemanticContentAttribute:](v11, "setSemanticContentAttribute:", v9);
}

- (id)buddy_scaleHeightTo:(double)a3 ratio:(double)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  -[UIView bounds](self, "bounds");
  -[UIView bounds](self, "bounds");
  v14 = v4;
  v13 = v5;
  v16 = v6;
  v15 = v7;
  sub_1000FB980();
  -[UIView setBounds:](self, "setBounds:", v8, v9, v10, v11, *(_QWORD *)&v8, *(_QWORD *)&v9, *(_QWORD *)&v10, *(_QWORD *)&v11, *(_QWORD *)&v8, *(_QWORD *)&v9, *(_QWORD *)&v10, *(_QWORD *)&v11, v13, v14, v15, v16);
  return self;
}

- (id)buddy_scaleWidthTo:(double)a3 ratio:(double)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  -[UIView bounds](self, "bounds");
  -[UIView bounds](self, "bounds");
  v14 = v4;
  v13 = v5;
  v16 = v6;
  v15 = v7;
  sub_1000FB980();
  -[UIView setBounds:](self, "setBounds:", v8, v9, v10, v11, *(_QWORD *)&v8, *(_QWORD *)&v9, *(_QWORD *)&v10, *(_QWORD *)&v11, *(_QWORD *)&v8, *(_QWORD *)&v9, *(_QWORD *)&v10, *(_QWORD *)&v11, v13, v14, v15, v16);
  return self;
}

- (double)buddy_heightForContainerWidth:(double)a3 ratio:(double)a4
{
  double v4;

  -[UIView bounds](self, "bounds");
  -[UIView bounds](self, "bounds");
  sub_1000FB980();
  return v4;
}

@end
