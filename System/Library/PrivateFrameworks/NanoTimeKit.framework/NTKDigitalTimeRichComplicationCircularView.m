@implementation NTKDigitalTimeRichComplicationCircularView

- (NTKDigitalTimeRichComplicationCircularView)init
{
  NTKDigitalTimeRichComplicationCircularView *v2;
  void *v3;
  NTKDigitalTimeRichComplicationCircularView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKDigitalTimeRichComplicationCircularView;
  v2 = -[NTKRichComplicationCircularBaseTextView init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_timeOffsetChanged, CFSTR("NTKTimeOffsetChangedNotification"), 0);

    v4 = v2;
  }

  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)NTKDigitalTimeRichComplicationCircularView;
  -[NTKDigitalTimeRichComplicationCircularView dealloc](&v4, sel_dealloc);
}

- (id)_createLabelViewWithFont:(id)a3
{
  id v4;
  void *v5;
  NTKDigitalTimeLabel *v6;
  NTKDigitalTimeLabel *timeLabel;

  v4 = a3;
  -[CDRichComplicationView device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CLKUITimeLabel labelWithOptions:forDevice:](NTKDigitalTimeLabel, "labelWithOptions:forDevice:", 0, v5);
  v6 = (NTKDigitalTimeLabel *)objc_claimAutoreleasedReturnValue();
  timeLabel = self->_timeLabel;
  self->_timeLabel = v6;

  -[CLKUITimeLabel setShowSeconds:](self->_timeLabel, "setShowSeconds:", 1);
  -[CLKUITimeLabel setFont:](self->_timeLabel, "setFont:", v4);

  -[NTKDigitalTimeRichComplicationCircularView timeOffsetChanged](self, "timeOffsetChanged");
  return self->_timeLabel;
}

- (void)timeOffsetChanged
{
  NTKDigitalTimeLabel *timeLabel;
  id v3;

  timeLabel = self->_timeLabel;
  +[NTKTimeOffsetManager sharedManager](NTKTimeOffsetManager, "sharedManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeOffset");
  -[NTKDigitalTimeLabel setTimeOffset:](timeLabel, "setTimeOffset:");

}

- (void)updateDate
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  NTKDigitalTimeLabel *timeLabel;
  uint64_t v8;
  void *v9;
  id v10;

  -[CDRichComplicationTemplateView template](self, "template");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metadata");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("NTKTimerComplicationMetadataShouldDisplayIdealizedStateKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  -[CDRichComplicationView timeTravelDate](self, "timeTravelDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  timeLabel = self->_timeLabel;
  if (v6)
  {
    -[CDRichComplicationView timeTravelDate](self, "timeTravelDate");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v5)
    {
      -[NTKDigitalTimeLabel setOverrideDate:duration:](self->_timeLabel, "setOverrideDate:duration:", 0, 0.0);
      goto LABEL_7;
    }
    NTKIdealizedDate();
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;
  -[NTKDigitalTimeLabel setOverrideDate:duration:](timeLabel, "setOverrideDate:duration:", v8, 0.0);

LABEL_7:
}

- (void)setTimeTravelDate:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a4;
  v6 = a3;
  +[NTKTimeOffsetManager sharedManager](NTKTimeOffsetManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeOffset");
  objc_msgSend(v6, "dateByAddingTimeInterval:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9.receiver = self;
  v9.super_class = (Class)NTKDigitalTimeRichComplicationCircularView;
  -[CDRichComplicationTemplateView setTimeTravelDate:animated:](&v9, sel_setTimeTravelDate_animated_, v8, v4);
  -[NTKDigitalTimeRichComplicationCircularView updateDate](self, "updateDate");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeLabel, 0);
}

@end
