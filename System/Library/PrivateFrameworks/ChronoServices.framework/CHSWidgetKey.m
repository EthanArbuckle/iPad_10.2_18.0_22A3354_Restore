@implementation CHSWidgetKey

- (CHSWidgetKey)initWithWidget:(id)a3 metrics:(id)a4
{
  return -[CHSWidgetKey initWithWidget:metrics:hostIdentifier:](self, "initWithWidget:metrics:hostIdentifier:", a3, a4, 0);
}

- (CHSWidgetKey)initWithWidget:(id)a3 metrics:(id)a4 hostIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  CHSWidgetKey *v11;
  uint64_t v12;
  CHSWidget *widget;
  uint64_t v14;
  CHSWidgetMetrics *metrics;
  uint64_t v16;
  NSString *hostIdentifier;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CHSWidgetKey;
  v11 = -[CHSWidgetKey init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    widget = v11->_widget;
    v11->_widget = (CHSWidget *)v12;

    v14 = objc_msgSend(v9, "copy");
    metrics = v11->_metrics;
    v11->_metrics = (CHSWidgetMetrics *)v14;

    v16 = objc_msgSend(v10, "copy");
    hostIdentifier = v11->_hostIdentifier;
    v11->_hostIdentifier = (NSString *)v16;

  }
  return v11;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<CHSWidgetKey widget=%@ metrics=%@ hostIdentifier=%@>"), self->_widget, self->_metrics, self->_hostIdentifier);
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[CHSWidget hash](self->_widget, "hash");
  return 7 * v3 * -[CHSWidgetMetrics hash](self->_metrics, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  CHSWidget *widget;
  uint64_t v7;
  id v8;
  id v9;
  CHSWidgetMetrics *metrics;
  id v11;
  id v12;
  NSString *hostIdentifier;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  widget = self->_widget;
  v7 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __24__CHSWidgetKey_isEqual___block_invoke;
  v21[3] = &unk_1E2A5A268;
  v8 = v4;
  v22 = v8;
  v9 = (id)objc_msgSend(v5, "appendObject:counterpart:", widget, v21);
  metrics = self->_metrics;
  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = __24__CHSWidgetKey_isEqual___block_invoke_2;
  v19[3] = &unk_1E2A5A268;
  v11 = v8;
  v20 = v11;
  v12 = (id)objc_msgSend(v5, "appendObject:counterpart:", metrics, v19);
  hostIdentifier = self->_hostIdentifier;
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __24__CHSWidgetKey_isEqual___block_invoke_3;
  v17[3] = &unk_1E2A5A5A8;
  v14 = v11;
  v18 = v14;
  v15 = (id)objc_msgSend(v5, "appendString:counterpart:", hostIdentifier, v17);
  LOBYTE(v11) = objc_msgSend(v5, "isEqual");

  return (char)v11;
}

id __24__CHSWidgetKey_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 8);
}

id __24__CHSWidgetKey_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 16);
}

id __24__CHSWidgetKey_isEqual___block_invoke_3(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 24);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_widget, CFSTR("_w"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_metrics, CFSTR("_m"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_hostIdentifier, CFSTR("_hi"));

}

- (CHSWidgetKey)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CHSWidgetKey *v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v5, CFSTR("_w"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("_m"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_hi"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  if (v6 && v8)
  {
    self = -[CHSWidgetKey initWithWidget:metrics:hostIdentifier:](self, "initWithWidget:metrics:hostIdentifier:", v6, v8, v9);
    v10 = self;
  }

  return v10;
}

- (CHSWidget)widget
{
  return self->_widget;
}

- (CHSWidgetMetrics)metrics
{
  return self->_metrics;
}

- (NSString)hostIdentifier
{
  return self->_hostIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostIdentifier, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_widget, 0);
}

@end
