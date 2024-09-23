@implementation NTKComplicationVariant

+ (id)variantWithFamily:(int64_t)a3 metrics:(id)a4
{
  id v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;

  v5 = a4;
  v6 = objc_opt_new();
  v7 = (_QWORD *)v6;
  if (v6)
  {
    *(_QWORD *)(v6 + 8) = a3;
    v8 = objc_msgSend(v5, "copy");
    v9 = (void *)v7[2];
    v7[2] = v8;

  }
  return v7;
}

+ (id)defaultVariantForFamily:(int64_t)a3 device:(id)a4
{
  void *v6;
  void *v7;

  +[NTKComplicationMetrics defaultMetricsForFamily:device:](NTKComplicationMetrics, "defaultMetricsForFamily:device:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "variantWithFamily:metrics:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  int64_t family;
  uint64_t v7;
  id v8;
  id v9;
  NTKComplicationMetrics *metrics;
  id v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  id (*v16)(uint64_t);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  family = self->_family;
  v7 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __34__NTKComplicationVariant_isEqual___block_invoke;
  v19[3] = &unk_1E6BD0380;
  v8 = v4;
  v20 = v8;
  v9 = (id)objc_msgSend(v5, "appendInteger:counterpart:", family, v19);
  metrics = self->_metrics;
  v14 = v7;
  v15 = 3221225472;
  v16 = __34__NTKComplicationVariant_isEqual___block_invoke_2;
  v17 = &unk_1E6BD0630;
  v18 = v8;
  v11 = v8;
  v12 = (id)objc_msgSend(v5, "appendObject:counterpart:", metrics, &v14);
  LOBYTE(metrics) = objc_msgSend(v5, "isEqual", v14, v15, v16, v17);

  return (char)metrics;
}

uint64_t __34__NTKComplicationVariant_isEqual___block_invoke(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
}

id __34__NTKComplicationVariant_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 16);
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendInteger:", self->_family);
  v5 = (id)objc_msgSend(v3, "appendObject:", self->_metrics);
  v6 = objc_msgSend(v3, "hash");

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NTKComplicationVariant)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NTKComplicationVariant *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("family"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metrics"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[NTKComplicationVariant variantWithFamily:metrics:](NTKComplicationVariant, "variantWithFamily:metrics:", v5, v6);
  v7 = (NTKComplicationVariant *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t family;
  id v5;

  family = self->_family;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", family, CFSTR("family"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_metrics, CFSTR("metrics"));

}

- (int64_t)family
{
  return self->_family;
}

- (NTKComplicationMetrics)metrics
{
  return self->_metrics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
}

@end
