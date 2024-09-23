@implementation MXMMutableSampleSet

- (void)appendSet:(id)a3
{
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  -[MXMSampleSet attributes](self, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "attributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToSet:", v6);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MXMSampleSet.m"), 392, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self.attributes isEqualToSet:set.attributes]"));

  }
  -[MXMSampleSet _appendSet:](self, "_appendSet:", v9);

}

- (void)appendSample:(id)a3
{
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  -[MXMSampleSet attributes](self, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "attributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToSet:", v6);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MXMSampleSet.m"), 397, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self.attributes isEqualToSet:sample.attributes]"));

  }
  -[MXMSampleSet _appendSample:](self, "_appendSample:", v9);

}

- (void)appendAttribute:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MXMMutableSampleSet;
  -[MXMSampleSet _appendAttribute:](&v3, sel__appendAttribute_, a3);
}

- (void)appendIntValue:(int)a3 timestamp:(unint64_t)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MXMMutableSampleSet;
  -[MXMSampleSet _appendDoubleValue:timestamp:](&v4, sel__appendDoubleValue_timestamp_, a4, (double)a3);
}

- (void)appendIntegerValue:(int64_t)a3 timestamp:(unint64_t)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MXMMutableSampleSet;
  -[MXMSampleSet _appendDoubleValue:timestamp:](&v4, sel__appendDoubleValue_timestamp_, a4, (double)a3);
}

- (void)appendUnsignedIntValue:(unsigned int)a3 timestamp:(unint64_t)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MXMMutableSampleSet;
  -[MXMSampleSet _appendDoubleValue:timestamp:](&v4, sel__appendDoubleValue_timestamp_, a4, (double)a3);
}

- (void)appendUnsignedIntegerValue:(unint64_t)a3 timestamp:(unint64_t)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MXMMutableSampleSet;
  -[MXMSampleSet _appendDoubleValue:timestamp:](&v4, sel__appendDoubleValue_timestamp_, a4, (double)a3);
}

- (void)appendDoubleValue:(double)a3 timestamp:(unint64_t)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MXMMutableSampleSet;
  -[MXMSampleSet _appendDoubleValue:timestamp:](&v4, sel__appendDoubleValue_timestamp_, a4, a3);
}

- (void)appendFloatValue:(float)a3 timestamp:(unint64_t)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MXMMutableSampleSet;
  -[MXMSampleSet _appendDoubleValue:timestamp:](&v4, sel__appendDoubleValue_timestamp_, a4, a3);
}

@end
