@implementation AXDataAnnotation

- (AXDataAnnotation)initWithLocation:(id)a3 label:(id)a4
{
  id v6;
  AXDataAnnotation *v7;
  AXDataAnnotation *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AXDataAnnotation;
  v7 = -[AXDataAnnotation init](&v10, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_location, a3);

  return v8;
}

- (AXDataAnnotation)initWithLocation:(id)a3
{
  return -[AXDataAnnotation initWithLocation:label:](self, "initWithLocation:label:", a3, 0);
}

- (AXDataPoint)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)playsHaptic
{
  return self->_playsHaptic;
}

- (void)setPlaysHaptic:(BOOL)a3
{
  self->_playsHaptic = a3;
}

- (BOOL)speakDuringPlayback
{
  return self->_speakDuringPlayback;
}

- (void)setSpeakDuringPlayback:(BOOL)a3
{
  self->_speakDuringPlayback = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end
