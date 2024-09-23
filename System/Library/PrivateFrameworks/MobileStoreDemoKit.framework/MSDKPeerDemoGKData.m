@implementation MSDKPeerDemoGKData

- (MSDKPeerDemoGKData)init
{
  MSDKPeerDemoGKData *v2;
  MSDKPeerDemoGKData *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MSDKPeerDemoGKData;
  v2 = -[MSDKPeerDemoGKData init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    -[MSDKPeerDemoGKData setDataValid:](v2, "setDataValid:", 0);
    LODWORD(v4) = 0;
    -[MSDKPeerDemoGKData setReliefBoxSpaceMM:](v3, "setReliefBoxSpaceMM:", v4);
    LODWORD(v5) = 0;
    -[MSDKPeerDemoGKData setReliefTotalBoxSpaceMM:](v3, "setReliefTotalBoxSpaceMM:", v5);
    LODWORD(v6) = 0;
    -[MSDKPeerDemoGKData setOffsetFromToleranceX:](v3, "setOffsetFromToleranceX:", v6);
    LODWORD(v7) = 0;
    -[MSDKPeerDemoGKData setOffsetFromToleranceY:](v3, "setOffsetFromToleranceY:", v7);
    LODWORD(v8) = 0;
    -[MSDKPeerDemoGKData setOffsetFromToleranceZ:](v3, "setOffsetFromToleranceZ:", v8);
  }
  return v3;
}

- (void)markAsValid
{
  -[MSDKPeerDemoGKData setDataValid:](self, "setDataValid:", 1);
}

- (void)addOffsetFromTolerance:(MSDKPeerDemoGKData *)self
{
  __int128 v2;
  double v4;
  __int128 v5;

  v5 = v2;
  -[MSDKPeerDemoGKData setOffsetFromToleranceX:](self, "setOffsetFromToleranceX:");
  HIDWORD(v4) = DWORD1(v5);
  LODWORD(v4) = DWORD1(v5);
  -[MSDKPeerDemoGKData setOffsetFromToleranceY:](self, "setOffsetFromToleranceY:", v4);
  -[MSDKPeerDemoGKData setOffsetFromToleranceZ:](self, "setOffsetFromToleranceZ:", COERCE_DOUBLE(__PAIR64__(DWORD1(v5), DWORD2(v5))));
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  _BOOL4 v6;
  float v7;
  double v8;
  float v9;
  double v10;
  float v11;
  double v12;
  float v13;
  double v14;
  float v15;
  void *v16;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MSDKPeerDemoGKData dataValid](self, "dataValid");
  -[MSDKPeerDemoGKData reliefBoxSpaceMM](self, "reliefBoxSpaceMM");
  v8 = v7;
  -[MSDKPeerDemoGKData reliefTotalBoxSpaceMM](self, "reliefTotalBoxSpaceMM");
  v10 = v9;
  -[MSDKPeerDemoGKData offsetFromToleranceX](self, "offsetFromToleranceX");
  v12 = v11;
  -[MSDKPeerDemoGKData offsetFromToleranceY](self, "offsetFromToleranceY");
  v14 = v13;
  -[MSDKPeerDemoGKData offsetFromToleranceZ](self, "offsetFromToleranceZ");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@[%p]: DataValid=%d reliefBoxSpaceMM=%f totalReliefBoxSpaceMM=%f offsetFromTolerance=(%f,%f,%f)>"), v5, self, v6, *(_QWORD *)&v8, *(_QWORD *)&v10, *(_QWORD *)&v12, *(_QWORD *)&v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MSDKPeerDemoGKData)initWithCoder:(id)a3
{
  id v4;
  MSDKPeerDemoGKData *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MSDKPeerDemoGKData;
  v5 = -[MSDKPeerDemoGKData init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dataValid"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDKPeerDemoGKData setDataValid:](v5, "setDataValid:", objc_msgSend(v6, "BOOLValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reliefBoxSpaceMM"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "floatValue");
    -[MSDKPeerDemoGKData setReliefBoxSpaceMM:](v5, "setReliefBoxSpaceMM:");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reliefTotalBoxSpaceMM"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "floatValue");
    -[MSDKPeerDemoGKData setReliefTotalBoxSpaceMM:](v5, "setReliefTotalBoxSpaceMM:");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("offsetFromToleranceX"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "floatValue");
    -[MSDKPeerDemoGKData setOffsetFromToleranceX:](v5, "setOffsetFromToleranceX:");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("offsetFromToleranceY"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "floatValue");
    -[MSDKPeerDemoGKData setOffsetFromToleranceY:](v5, "setOffsetFromToleranceY:");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("offsetFromToleranceZ"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "floatValue");
    -[MSDKPeerDemoGKData setOffsetFromToleranceZ:](v5, "setOffsetFromToleranceZ:");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
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
  id v16;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(v4, "numberWithBool:", -[MSDKPeerDemoGKData dataValid](self, "dataValid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("dataValid"));

  v7 = (void *)MEMORY[0x24BDD16E0];
  -[MSDKPeerDemoGKData reliefBoxSpaceMM](self, "reliefBoxSpaceMM");
  objc_msgSend(v7, "numberWithFloat:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("reliefBoxSpaceMM"));

  v9 = (void *)MEMORY[0x24BDD16E0];
  -[MSDKPeerDemoGKData reliefTotalBoxSpaceMM](self, "reliefTotalBoxSpaceMM");
  objc_msgSend(v9, "numberWithFloat:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("reliefTotalBoxSpaceMM"));

  v11 = (void *)MEMORY[0x24BDD16E0];
  -[MSDKPeerDemoGKData offsetFromToleranceX](self, "offsetFromToleranceX");
  objc_msgSend(v11, "numberWithFloat:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v12, CFSTR("offsetFromToleranceX"));

  v13 = (void *)MEMORY[0x24BDD16E0];
  -[MSDKPeerDemoGKData offsetFromToleranceY](self, "offsetFromToleranceY");
  objc_msgSend(v13, "numberWithFloat:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v14, CFSTR("offsetFromToleranceY"));

  v15 = (void *)MEMORY[0x24BDD16E0];
  -[MSDKPeerDemoGKData offsetFromToleranceZ](self, "offsetFromToleranceZ");
  objc_msgSend(v15, "numberWithFloat:");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v16, CFSTR("offsetFromToleranceZ"));

}

- (BOOL)dataValid
{
  return self->_dataValid;
}

- (void)setDataValid:(BOOL)a3
{
  self->_dataValid = a3;
}

- (float)reliefBoxSpaceMM
{
  return self->_reliefBoxSpaceMM;
}

- (void)setReliefBoxSpaceMM:(float)a3
{
  self->_reliefBoxSpaceMM = a3;
}

- (float)reliefTotalBoxSpaceMM
{
  return self->_reliefTotalBoxSpaceMM;
}

- (void)setReliefTotalBoxSpaceMM:(float)a3
{
  self->_reliefTotalBoxSpaceMM = a3;
}

- (float)offsetFromToleranceX
{
  return self->_offsetFromToleranceX;
}

- (void)setOffsetFromToleranceX:(float)a3
{
  self->_offsetFromToleranceX = a3;
}

- (float)offsetFromToleranceY
{
  return self->_offsetFromToleranceY;
}

- (void)setOffsetFromToleranceY:(float)a3
{
  self->_offsetFromToleranceY = a3;
}

- (float)offsetFromToleranceZ
{
  return self->_offsetFromToleranceZ;
}

- (void)setOffsetFromToleranceZ:(float)a3
{
  self->_offsetFromToleranceZ = a3;
}

@end
