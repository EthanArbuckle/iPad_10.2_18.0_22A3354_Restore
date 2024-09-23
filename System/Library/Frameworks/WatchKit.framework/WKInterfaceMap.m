@implementation WKInterfaceMap

- (void)setVisibleMapRect:(id)a3
{
  double var1;
  double var0;
  double v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  v5 = a3.var0.var1;
  v12[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3.var0.var0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v8;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", var0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v9;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", var1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WKInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", v11, CFSTR("rect"));

}

- (void)setRegion:(id *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[5];

  v7 = v6;
  v8 = v5;
  v9 = v4;
  v21[4] = *MEMORY[0x24BDAC8D0];
  if (v4 < -180.0 || v4 > 180.0 || v3 < -90.0 || v3 > 90.0 || v5 < 0.0 || v5 > 180.0 || v6 < 0.0 || v6 > 360.0)
  {
    v16 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%+.8f, %+.8f"), *(_QWORD *)&v3, *(_QWORD *)&v4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("<center:%@ span:%+.8f, %+.8f>"), v17, *(_QWORD *)&v8, *(_QWORD *)&v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "stringWithFormat:", CFSTR("Invalid Region %@"), v18);
    v20 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v20, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "raise");

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v11;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v12;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2] = v13;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[3] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", v15, CFSTR("region"));

  }
}

- (void)addAnnotation:(CLLocationCoordinate2D)a3 withImage:(id)a4 centerOffset:(CGPoint)a5
{
  double y;
  double x;
  double longitude;
  double latitude;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];

  y = a5.y;
  x = a5.x;
  longitude = a3.longitude;
  latitude = a3.latitude;
  v16[4] = *MEMORY[0x24BDAC8D0];
  v10 = (void *)MEMORY[0x24BDD16E0];
  v11 = a4;
  objc_msgSend(v10, "numberWithDouble:", latitude);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", longitude);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v13;
  v16[2] = v11;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", x, y);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[WKInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", v15, CFSTR("annotation"));
}

- (void)addAnnotation:(CLLocationCoordinate2D)a3 withImageNamed:(id)a4 centerOffset:(CGPoint)a5
{
  double y;
  double x;
  double longitude;
  double latitude;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];

  y = a5.y;
  x = a5.x;
  longitude = a3.longitude;
  latitude = a3.latitude;
  v17[4] = *MEMORY[0x24BDAC8D0];
  v10 = (void *)MEMORY[0x24BDD16E0];
  v11 = a4;
  objc_msgSend(v10, "numberWithDouble:", latitude);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v12;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", longitude);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v13;
  v14 = (void *)objc_msgSend(v11, "copy");

  v17[2] = v14;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", x, y);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[WKInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", v16, CFSTR("annotation"));

}

- (void)addAnnotation:(CLLocationCoordinate2D)a3 withPinColor:(int64_t)a4
{
  double longitude;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];

  longitude = a3.longitude;
  v11[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3.latitude);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", longitude, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v8;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WKInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", v10, CFSTR("annotation"));

}

- (void)removeAllAnnotations
{
  -[WKInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", 0, CFSTR("annotation"));
}

@end
