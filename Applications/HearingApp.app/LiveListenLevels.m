@implementation LiveListenLevels

- (LiveListenLevels)initWithFrame:(CGRect)a3 inCompact:(BOOL)a4
{
  int v4;
  double v5;
  double v6;
  LiveListenLevels *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id location;
  objc_super v19;

  if (a4)
    v4 = 4;
  else
    v4 = 5;
  v5 = 8.0;
  v6 = 4.0;
  if (a4)
  {
    v5 = 4.0;
    v6 = 2.0;
  }
  self->_meterDots = v4;
  self->_dotSize = v5;
  self->_dotSpacing = v6;
  v19.receiver = self;
  v19.super_class = (Class)LiveListenLevels;
  v7 = -[LiveListenLevels initWithFrame:](&v19, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    if (v7->_meterDots >= 1)
    {
      v9 = 0;
      do
      {
        v10 = objc_alloc_init((Class)CAShapeLayer);
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemOrangeColor](UIColor, "systemOrangeColor"));
        v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "colorWithAlphaComponent:", 0.25)));
        objc_msgSend(v10, "setFillColor:", objc_msgSend(v12, "CGColor"));

        v13 = (void *)objc_claimAutoreleasedReturnValue(-[LiveListenLevels layer](v7, "layer"));
        objc_msgSend(v13, "addSublayer:", v10);

        objc_msgSend(v8, "addObject:", v10);
        ++v9;
      }
      while (v9 < v7->_meterDots);
    }
    -[LiveListenLevels setLevels:](v7, "setLevels:", v8);

  }
  objc_initWeak(&location, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[AXHAServer sharedInstance](AXHAServer, "sharedInstance"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100001F38;
  v16[3] = &unk_10000C5B8;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v14, "registerListener:forLiveListenLevelsHandler:", v7, v16);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
  return v7;
}

- (void)layoutSubviews
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[9];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)LiveListenLevels;
  -[LiveListenLevels layoutSubviews](&v13, "layoutSubviews");
  -[LiveListenLevels bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[LiveListenLevels levels](self, "levels"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000020C4;
  v12[3] = &unk_10000C5E0;
  v12[4] = self;
  v12[5] = v4;
  v12[6] = v6;
  v12[7] = v8;
  v12[8] = v10;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v12);

}

- (void)updateLevel:(double)a3
{
  void *v5;
  _QWORD v6[6];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LiveListenLevels levels](self, "levels"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100002280;
  v6[3] = &unk_10000C608;
  *(double *)&v6[5] = a3;
  v6[4] = self;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);

}

- (NSMutableArray)levels
{
  return self->_levels;
}

- (void)setLevels:(id)a3
{
  objc_storeStrong((id *)&self->_levels, a3);
}

- (int)meterDots
{
  return self->_meterDots;
}

- (void)setMeterDots:(int)a3
{
  self->_meterDots = a3;
}

- (double)dotSize
{
  return self->_dotSize;
}

- (void)setDotSize:(double)a3
{
  self->_dotSize = a3;
}

- (double)dotSpacing
{
  return self->_dotSpacing;
}

- (void)setDotSpacing:(double)a3
{
  self->_dotSpacing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_levels, 0);
}

@end
