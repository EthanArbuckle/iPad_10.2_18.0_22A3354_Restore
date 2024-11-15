@implementation CHUISMutableWatchComplicationsWidgetSnapshotMetadata

- (void)setLabelData:(id)a3
{
  NSArray *v4;
  NSArray *labelData;
  id v6;

  v6 = a3;
  v4 = (NSArray *)objc_msgSend(v6, "copy");
  labelData = self->super._labelData;
  self->super._labelData = v4;

}

- (void)setGauge:(id)a3
{
  CHSGaugeParameters *v4;
  CHSGaugeParameters *gauge;
  id v6;

  v6 = a3;
  v4 = (CHSGaugeParameters *)objc_msgSend(v6, "copy");
  gauge = self->super._gauge;
  self->super._gauge = v4;

}

- (void)setGaugeProviderData:(id)a3
{
  NSData *v4;
  NSData *gaugeProviderData;
  id v6;

  v6 = a3;
  v4 = (NSData *)objc_msgSend(v6, "copy");
  gaugeProviderData = self->super._gaugeProviderData;
  self->super._gaugeProviderData = v4;

}

- (void)setGaugeMinimumLabelData:(id)a3
{
  NSArray *v4;
  NSArray *gaugeMinimumLabelData;
  id v6;

  v6 = a3;
  v4 = (NSArray *)objc_msgSend(v6, "copy");
  gaugeMinimumLabelData = self->super._gaugeMinimumLabelData;
  self->super._gaugeMinimumLabelData = v4;

}

- (void)setGaugeMaximumLabelData:(id)a3
{
  NSArray *v4;
  NSArray *gaugeMaximumLabelData;
  id v6;

  v6 = a3;
  v4 = (NSArray *)objc_msgSend(v6, "copy");
  gaugeMaximumLabelData = self->super._gaugeMaximumLabelData;
  self->super._gaugeMaximumLabelData = v4;

}

- (void)setOuterLabelData:(id)a3
{
  NSArray *v4;
  NSArray *outerLabelData;
  id v6;

  v6 = a3;
  v4 = (NSArray *)objc_msgSend(v6, "copy");
  outerLabelData = self->super._outerLabelData;
  self->super._outerLabelData = v4;

}

@end
