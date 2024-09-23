@implementation CLKUIStackedDigitalTimeView

- (CLKUIStackedDigitalTimeView)initWithDevice:(id)a3 clockTimer:(id)a4
{
  id v6;
  id v7;
  CLKUIStackedDigitalTimeView *v8;
  CLKUITimeLabel *v9;
  CLKUITimeLabel *hourLabel;
  CLKUITimeLabel *v11;
  CLKUITimeLabel *minuteLabel;
  void *v13;
  CLKUITimeLabel *v14;
  CLKUITimeLabel *inactiveHourLabel;
  CLKUITimeLabel *v16;
  CLKUITimeLabel *inactiveMinuteLabel;
  void *v18;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CLKUIStackedDigitalTimeView;
  v8 = -[CLKUITimeView initWithDevice:clockTimer:](&v20, sel_initWithDevice_clockTimer_, v6, v7);
  if (v8)
  {
    v9 = -[CLKUITimeLabel initWithTimeLabelOptions:forDevice:clockTimer:]([CLKUITimeLabel alloc], "initWithTimeLabelOptions:forDevice:clockTimer:", 1024, v6, v7);
    hourLabel = v8->_hourLabel;
    v8->_hourLabel = v9;

    -[CLKUIStackedDigitalTimeView addSubview:](v8, "addSubview:", v8->_hourLabel);
    v11 = -[CLKUITimeLabel initWithTimeLabelOptions:forDevice:clockTimer:]([CLKUITimeLabel alloc], "initWithTimeLabelOptions:forDevice:clockTimer:", 2048, v6, v7);
    minuteLabel = v8->_minuteLabel;
    v8->_minuteLabel = v11;

    -[CLKUITimeLabel timeFormatter](v8->_minuteLabel, "timeFormatter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setIncludeSeparatorInTimeSubstringFromSeparatorText:", 0);

    -[CLKUIStackedDigitalTimeView addSubview:](v8, "addSubview:", v8->_minuteLabel);
    v14 = -[CLKUITimeLabel initWithTimeLabelOptions:forDevice:clockTimer:]([CLKUITimeLabel alloc], "initWithTimeLabelOptions:forDevice:clockTimer:", 1024, v6, v7);
    inactiveHourLabel = v8->_inactiveHourLabel;
    v8->_inactiveHourLabel = v14;

    -[CLKUITimeLabel setAlpha:](v8->_inactiveHourLabel, "setAlpha:", 0.0);
    -[CLKUIStackedDigitalTimeView addSubview:](v8, "addSubview:", v8->_inactiveHourLabel);
    v16 = -[CLKUITimeLabel initWithTimeLabelOptions:forDevice:clockTimer:]([CLKUITimeLabel alloc], "initWithTimeLabelOptions:forDevice:clockTimer:", 2048, v6, v7);
    inactiveMinuteLabel = v8->_inactiveMinuteLabel;
    v8->_inactiveMinuteLabel = v16;

    -[CLKUITimeLabel setAlpha:](v8->_inactiveMinuteLabel, "setAlpha:", 0.0);
    -[CLKUITimeLabel timeFormatter](v8->_inactiveMinuteLabel, "timeFormatter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setIncludeSeparatorInTimeSubstringFromSeparatorText:", 0);

    -[CLKUIStackedDigitalTimeView addSubview:](v8, "addSubview:", v8->_inactiveMinuteLabel);
  }

  return v8;
}

- (void)setConfiguration:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CLKUIStackedDigitalTimeView;
  -[CLKUITimeView setConfiguration:](&v24, sel_setConfiguration_, v4);
  objc_msgSend(v4, "timeLabelFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __48__CLKUIStackedDigitalTimeView_setConfiguration___block_invoke;
    v22[3] = &unk_1E86E02C8;
    v23 = v4;
    -[CLKUIStackedDigitalTimeView enumerateLabelsWithBlock:](self, "enumerateLabelsWithBlock:", v22);

  }
  objc_msgSend(v4, "timeLabelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "timeLabelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUITimeLabel setTextColor:](self->_hourLabel, "setTextColor:", v8);

    objc_msgSend(v4, "timeLabelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUITimeLabel setTextColor:](self->_minuteLabel, "setTextColor:", v9);

  }
  objc_msgSend(v4, "forcedNumberSystem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v17 = v6;
    v18 = 3221225472;
    v19 = __48__CLKUIStackedDigitalTimeView_setConfiguration___block_invoke_2;
    v20 = &unk_1E86E02C8;
    v21 = v4;
    -[CLKUIStackedDigitalTimeView enumerateLabelsWithBlock:](self, "enumerateLabelsWithBlock:", &v17);

  }
  objc_msgSend(v4, "minuteTimeLabelAttributes", v17, v18, v19, v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v4, "minuteTimeLabelAttributes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUITimeLabel setStringAttributes:](self->_minuteLabel, "setStringAttributes:", v12);

    objc_msgSend(v4, "minuteTimeLabelAttributes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUITimeLabel setStringAttributes:](self->_inactiveMinuteLabel, "setStringAttributes:", v13);

  }
  objc_msgSend(v4, "hourTimeLabelAttributes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v4, "hourTimeLabelAttributes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUITimeLabel setStringAttributes:](self->_hourLabel, "setStringAttributes:", v15);

    objc_msgSend(v4, "hourTimeLabelAttributes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUITimeLabel setStringAttributes:](self->_inactiveHourLabel, "setStringAttributes:", v16);

  }
}

void __48__CLKUIStackedDigitalTimeView_setConfiguration___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "timeLabelFont");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v4);

}

void __48__CLKUIStackedDigitalTimeView_setConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "forcedNumberSystem");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setForcedNumberSystem:", objc_msgSend(v4, "unsignedIntegerValue"));

}

- (void)setState:(unint64_t)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLKUIStackedDigitalTimeView;
  -[CLKUITimeView setState:](&v6, sel_setState_);
  if (a3)
  {
    if (a3 != 1)
      return;
    v5 = &__block_literal_global_5;
  }
  else
  {
    v5 = &__block_literal_global_6;
  }
  -[CLKUIStackedDigitalTimeView enumerateLabelsWithBlock:](self, "enumerateLabelsWithBlock:", v5);
}

uint64_t __40__CLKUIStackedDigitalTimeView_setState___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPaused:", 0);
}

uint64_t __40__CLKUIStackedDigitalTimeView_setState___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPaused:", 1);
}

- (void)setOverrideDate:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CLKUIStackedDigitalTimeView;
  -[CLKUITimeView setOverrideDate:](&v8, sel_setOverrideDate_, v4);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__CLKUIStackedDigitalTimeView_setOverrideDate___block_invoke;
  v6[3] = &unk_1E86E02C8;
  v7 = v4;
  v5 = v4;
  -[CLKUIStackedDigitalTimeView enumerateLabelsWithBlock:](self, "enumerateLabelsWithBlock:", v6);

}

void __47__CLKUIStackedDigitalTimeView_setOverrideDate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "timeFormatter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOverrideDate:", v2);

}

- (void)enumerateLabelsWithBlock:(id)a3
{
  void (*v5)(void);
  id v6;

  v5 = (void (*)(void))*((_QWORD *)a3 + 2);
  v6 = a3;
  v5();
  (*((void (**)(id, CLKUITimeLabel *))a3 + 2))(v6, self->_minuteLabel);
  (*((void (**)(id, CLKUITimeLabel *))a3 + 2))(v6, self->_inactiveHourLabel);
  (*((void (**)(id, CLKUITimeLabel *))a3 + 2))(v6, self->_inactiveMinuteLabel);

}

- (CLKUITimeLabel)hourLabel
{
  return self->_hourLabel;
}

- (CLKUITimeLabel)minuteLabel
{
  return self->_minuteLabel;
}

- (CLKUITimeLabel)inactiveHourLabel
{
  return self->_inactiveHourLabel;
}

- (CLKUITimeLabel)inactiveMinuteLabel
{
  return self->_inactiveMinuteLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inactiveMinuteLabel, 0);
  objc_storeStrong((id *)&self->_inactiveHourLabel, 0);
  objc_storeStrong((id *)&self->_minuteLabel, 0);
  objc_storeStrong((id *)&self->_hourLabel, 0);
}

@end
