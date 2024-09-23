@implementation MXMClockMetric

- (id)_unit
{
  return -[MXMClockMetric _unitWithTag:](self, "_unitWithTag:", self->_tag);
}

- (id)_unitWithTag:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD18D8], "nanoseconds", a3);
}

+ (MXMClockMetric)allTime
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  +[MXMSampleTag ancestery](MXMClockSampleTag, "ancestery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithTag:", v3);

  return (MXMClockMetric *)v4;
}

+ (MXMClockMetric)absoluteTime
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  +[MXMClockSampleTag absoluteTime](MXMClockSampleTag, "absoluteTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithTag:", v3);

  return (MXMClockMetric *)v4;
}

+ (MXMClockMetric)continuousTime
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  +[MXMClockSampleTag continuousTime](MXMClockSampleTag, "continuousTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithTag:", v3);

  return (MXMClockMetric *)v4;
}

- (MXMClockMetric)initWithTag:(id)a3
{
  id v5;
  MXMClockMetric *v6;
  MXMClockMetric *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MXMClockMetric;
  v6 = -[MXMMetric initWithIdentifier:](&v9, sel_initWithIdentifier_, CFSTR("com.apple.metricmeasurement.metric.clock"));
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_tag, a3);

  return v7;
}

- (BOOL)_shouldConstructProbe
{
  return 0;
}

- (BOOL)harvestData:(id *)a3 error:(id *)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  MXMSampleTag *tag;
  void *v10;
  MXMSampleTag *v11;
  void *v12;
  MXMSampleTimeSeries *v13;
  MXMSampleTag *v14;
  void *v15;
  MXMSampleTag *v16;
  void *v17;
  MXMSampleTimeSeries *v18;
  MXMSampleData *v19;
  __int128 v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  +[MXMInstrument activeInstrument](MXMInstrument, "activeInstrument", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "currentIteration");

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    tag = self->_tag;
    +[MXMClockSampleTag absoluteTime](MXMClockSampleTag, "absoluteTime");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[MXMSampleTag containsTag:](tag, "containsTag:", v10))
    {

    }
    else
    {
      v11 = self->_tag;
      +[MXMClockSampleTag absoluteTime](MXMClockSampleTag, "absoluteTime");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v11) = -[MXMSampleTag isEqualToTag:](v11, "isEqualToTag:", v12);

      if (!(_DWORD)v11)
        goto LABEL_6;
    }
    v21 = *(_OWORD *)(v7 + 40);
    v13 = -[MXMSampleTimeSeries initWithAbsoluteTimeSeries:length:]([MXMSampleTimeSeries alloc], "initWithAbsoluteTimeSeries:length:", &v21, 2);
    objc_msgSend(v8, "addObject:", v13, v21);

LABEL_6:
    v14 = self->_tag;
    +[MXMClockSampleTag continuousTime](MXMClockSampleTag, "continuousTime");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[MXMSampleTag containsTag:](v14, "containsTag:", v15))
    {

    }
    else
    {
      v16 = self->_tag;
      +[MXMClockSampleTag continuousTime](MXMClockSampleTag, "continuousTime");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v16) = -[MXMSampleTag isEqualToTag:](v16, "isEqualToTag:", v17);

      if (!(_DWORD)v16)
      {
LABEL_10:
        v19 = objc_retainAutorelease(-[MXMSampleData initWithSets:]([MXMSampleData alloc], "initWithSets:", v8));
        *a3 = v19;

        return v7 != 0;
      }
    }
    v21 = *(_OWORD *)(v7 + 56);
    v18 = -[MXMSampleTimeSeries initWithContinuousTimeSeries:length:]([MXMSampleTimeSeries alloc], "initWithContinuousTimeSeries:length:", &v21, 2);
    objc_msgSend(v8, "addObject:", v18);

    goto LABEL_10;
  }
  return v7 != 0;
}

- (id)copy
{
  return -[MXMClockMetric copyWithZone:](self, "copyWithZone:", 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MXMClockMetric;
  v5 = -[MXMMetric copyWithZone:](&v9, sel_copyWithZone_);
  v6 = -[MXMSampleTag copyWithZone:](self->_tag, "copyWithZone:", a3);
  v7 = (void *)v5[8];
  v5[8] = v6;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MXMClockMetric;
  v4 = a3;
  -[MXMMetric encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_tag, CFSTR("_tag"), v5.receiver, v5.super_class);

}

- (MXMClockMetric)initWithCoder:(id)a3
{
  id v4;
  MXMClockMetric *v5;
  uint64_t v6;
  MXMSampleTag *tag;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MXMClockMetric;
  v5 = -[MXMMetric initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_tag"));
    v6 = objc_claimAutoreleasedReturnValue();
    tag = v5->_tag;
    v5->_tag = (MXMSampleTag *)v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tag, 0);
}

@end
