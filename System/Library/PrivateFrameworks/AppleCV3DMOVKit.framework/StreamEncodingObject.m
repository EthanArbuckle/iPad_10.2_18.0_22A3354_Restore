@implementation StreamEncodingObject

- (StreamEncodingObject)initWithLossless:(BOOL)a3 bitrate:(float)a4 forceH264:(BOOL)a5 expectedFPS:(float)a6 extraConfigs:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v10;
  id v12;
  StreamEncodingObject *v13;
  StreamEncodingObject *v14;
  double v15;
  double v16;
  objc_super v18;

  v8 = a5;
  v10 = a3;
  v12 = a7;
  v18.receiver = self;
  v18.super_class = (Class)StreamEncodingObject;
  v13 = -[StreamEncodingObject init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    -[StreamEncodingObject setLossless:](v13, "setLossless:", v10);
    *(float *)&v15 = a4;
    -[StreamEncodingObject setBitrate:](v14, "setBitrate:", v15);
    -[StreamEncodingObject setForceH264:](v14, "setForceH264:", v8);
    *(float *)&v16 = a6;
    -[StreamEncodingObject setExpectedFPS:](v14, "setExpectedFPS:", v16);
    -[StreamEncodingObject setExtraConfigs:](v14, "setExtraConfigs:", v12);
  }

  return v14;
}

- (BOOL)lossless
{
  return self->_lossless;
}

- (void)setLossless:(BOOL)a3
{
  self->_lossless = a3;
}

- (float)bitrate
{
  return self->_bitrate;
}

- (void)setBitrate:(float)a3
{
  self->_bitrate = a3;
}

- (BOOL)forceH264
{
  return self->_forceH264;
}

- (void)setForceH264:(BOOL)a3
{
  self->_forceH264 = a3;
}

- (float)expectedFPS
{
  return self->_expectedFPS;
}

- (void)setExpectedFPS:(float)a3
{
  self->_expectedFPS = a3;
}

- (NSDictionary)extraConfigs
{
  return self->_extraConfigs;
}

- (void)setExtraConfigs:(id)a3
{
  objc_storeStrong((id *)&self->_extraConfigs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraConfigs, 0);
}

@end
