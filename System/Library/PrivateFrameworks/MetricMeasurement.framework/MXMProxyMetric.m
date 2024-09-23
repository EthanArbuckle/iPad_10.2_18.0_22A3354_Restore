@implementation MXMProxyMetric

- (MXMProxyMetric)initWithMetric:(id)a3
{
  id v4;
  MXMProxyMetric *v5;
  uint64_t v6;
  MXMMetric *underlyingMetric;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MXMProxyMetric;
  v5 = -[MXMMetric initWithIdentifier:filter:](&v9, sel_initWithIdentifier_filter_, CFSTR("proxy metric"), 0);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    underlyingMetric = v5->__underlyingMetric;
    v5->__underlyingMetric = (MXMMetric *)v6;

  }
  return v5;
}

- (MXMMetric)metric
{
  void *v2;
  void *v3;

  -[MXMProxyMetric _underlyingMetric](self, "_underlyingMetric");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (MXMMetric *)v3;
}

- (MXMProbe)_remoteProbe
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[MXMProxyMetric _underlyingMetric](self, "_underlyingMetric");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_constructProbe");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[MXMProxyMetric _underlyingMetric](self, "_underlyingMetric");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFilter:", v6);

  _MXMGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    -[MXMProxyMetric _underlyingMetric](self, "_underlyingMetric");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "filter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v4;
    v13 = 2112;
    v14 = v9;
    _os_log_impl(&dword_214474000, v7, OS_LOG_TYPE_INFO, "Created probe %@ for remote use using filter %@.", (uint8_t *)&v11, 0x16u);

  }
  return (MXMProbe *)v4;
}

- (MXMProxyMetric)initWithCoder:(id)a3
{
  id v4;
  MXMProxyMetric *v5;
  uint64_t v6;
  MXMMetric *underlyingMetric;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MXMProxyMetric;
  v5 = -[MXMMetric initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("underlyingMetric"));
    v6 = objc_claimAutoreleasedReturnValue();
    underlyingMetric = v5->__underlyingMetric;
    v5->__underlyingMetric = (MXMMetric *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MXMProxyMetric;
  v4 = a3;
  -[MXMMetric encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[MXMProxyMetric _underlyingMetric](self, "_underlyingMetric", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("underlyingMetric"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = objc_alloc((Class)objc_opt_class());
  -[MXMProxyMetric _underlyingMetric](self, "_underlyingMetric");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  v8 = (void *)objc_msgSend(v5, "initWithMetric:", v7);

  return v8;
}

- (unint64_t)_sampleMode
{
  void *v4;
  char v5;
  void *v6;
  unint64_t v7;
  void *v9;

  -[MXMProxyMetric _underlyingMetric](self, "_underlyingMetric");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_sampleMode");

  if ((v5 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MXMProxyMetric.m"), 70, CFSTR("Underlying metric expects continuous mode. This isn't supported"));

  }
  -[MXMProxyMetric _underlyingMetric](self, "_underlyingMetric");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_sampleMode");

  return v7;
}

- (BOOL)_shouldAlwaysWrapInProxy
{
  return 0;
}

- (BOOL)_shouldNeverWrapInProxy
{
  return 1;
}

- (BOOL)_shouldConstructProbe
{
  return 1;
}

- (id)_constructProbe
{
  MXMProxyProbe *v3;
  id v4;
  MXMProxyProbe *v5;

  v3 = [MXMProxyProbe alloc];
  v4 = -[MXMMetric copy](self, "copy");
  v5 = -[MXMProxyProbe initWithProxyMetric:](v3, "initWithProxyMetric:", v4);

  return v5;
}

- (BOOL)prepareWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MXMProxyMetric;
  if (-[MXMMetric prepareWithOptions:error:](&v10, sel_prepareWithOptions_error_, v6, a4))
  {
    -[MXMProxyMetric _underlyingMetric](self, "_underlyingMetric");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "prepareWithOptions:error:", v6, a4);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)willStartAtEstimatedTime:(unint64_t)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MXMProxyMetric;
  -[MXMMetric willStartAtEstimatedTime:](&v6, sel_willStartAtEstimatedTime_);
  -[MXMProxyMetric _underlyingMetric](self, "_underlyingMetric");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "willStartAtEstimatedTime:", a3);

}

- (void)didStartAtTime:(unint64_t)a3 startDate:(id)a4
{
  id v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MXMProxyMetric;
  v6 = a4;
  -[MXMMetric didStartAtTime:startDate:](&v8, sel_didStartAtTime_startDate_, a3, v6);
  -[MXMProxyMetric _underlyingMetric](self, "_underlyingMetric", v8.receiver, v8.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didStartAtTime:startDate:", a3, v6);

}

- (void)didStartAtContinuousTime:(unint64_t)a3 absoluteTime:(unint64_t)a4 startDate:(id)a5
{
  id v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MXMProxyMetric;
  v8 = a5;
  -[MXMMetric didStartAtContinuousTime:absoluteTime:startDate:](&v10, sel_didStartAtContinuousTime_absoluteTime_startDate_, a3, a4, v8);
  -[MXMProxyMetric _underlyingMetric](self, "_underlyingMetric", v10.receiver, v10.super_class);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "didStartAtContinuousTime:absoluteTime:startDate:", a3, a4, v8);

}

- (void)willStop
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MXMProxyMetric;
  -[MXMMetric willStop](&v4, sel_willStop);
  -[MXMProxyMetric _underlyingMetric](self, "_underlyingMetric");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "willStop");

}

- (void)didStopAtTime:(unint64_t)a3 stopDate:(id)a4
{
  id v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MXMProxyMetric;
  v6 = a4;
  -[MXMMetric didStopAtTime:stopDate:](&v8, sel_didStopAtTime_stopDate_, a3, v6);
  -[MXMProxyMetric _underlyingMetric](self, "_underlyingMetric", v8.receiver, v8.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didStopAtTime:stopDate:", a3, v6);

}

- (void)didStopAtContinuousTime:(unint64_t)a3 absoluteTime:(unint64_t)a4 stopDate:(id)a5
{
  id v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MXMProxyMetric;
  v8 = a5;
  -[MXMMetric didStopAtContinuousTime:absoluteTime:stopDate:](&v10, sel_didStopAtContinuousTime_absoluteTime_stopDate_, a3, a4, v8);
  -[MXMProxyMetric _underlyingMetric](self, "_underlyingMetric", v10.receiver, v10.super_class);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "didStopAtContinuousTime:absoluteTime:stopDate:", a3, a4, v8);

}

- (MXMMetric)_underlyingMetric
{
  return (MXMMetric *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__underlyingMetric, 0);
}

@end
