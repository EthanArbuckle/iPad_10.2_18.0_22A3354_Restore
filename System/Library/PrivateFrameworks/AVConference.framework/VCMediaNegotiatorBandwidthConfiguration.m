@implementation VCMediaNegotiatorBandwidthConfiguration

- (VCMediaNegotiatorBandwidthConfiguration)initWithConnectionType:(int)a3 maxBandwidth:(unsigned int)a4
{
  VCMediaNegotiatorBandwidthConfiguration *result;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)VCMediaNegotiatorBandwidthConfiguration;
  result = -[VCMediaNegotiatorBandwidthConfiguration init](&v7, sel_init);
  if (result)
  {
    result->_arbiterMode = 0;
    result->_isDefaultMode = 1;
    result->_connectionType = a3;
    result->_maxBandwidth = a4;
  }
  return result;
}

- (VCMediaNegotiatorBandwidthConfiguration)initWithArbiterMode:(unsigned __int8)a3 connectionType:(int)a4 maxBandwidth:(unsigned int)a5
{
  VCMediaNegotiatorBandwidthConfiguration *result;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)VCMediaNegotiatorBandwidthConfiguration;
  result = -[VCMediaNegotiatorBandwidthConfiguration init](&v9, sel_init);
  if (result)
  {
    result->_arbiterMode = a3;
    result->_connectionType = a4;
    result->_maxBandwidth = a5;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int arbiterMode;
  unsigned int maxBandwidth;
  int connectionType;
  int isDefaultMode;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  arbiterMode = self->_arbiterMode;
  if (arbiterMode != objc_msgSend(a3, "mode"))
    return 0;
  maxBandwidth = self->_maxBandwidth;
  if (maxBandwidth != objc_msgSend(a3, "maxBandwidth"))
    return 0;
  connectionType = self->_connectionType;
  if (connectionType != objc_msgSend(a3, "connectionType"))
    return 0;
  isDefaultMode = self->_isDefaultMode;
  return isDefaultMode == objc_msgSend(a3, "isDefaultMode");
}

- (unsigned)mode
{
  return self->_arbiterMode;
}

- (void)setMode:(unsigned __int8)a3
{
  self->_arbiterMode = a3;
}

- (int)connectionType
{
  return self->_connectionType;
}

- (void)setConnectionType:(int)a3
{
  self->_connectionType = a3;
}

- (unsigned)maxBandwidth
{
  return self->_maxBandwidth;
}

- (void)setMaxBandwidth:(unsigned int)a3
{
  self->_maxBandwidth = a3;
}

- (BOOL)isDefaultMode
{
  return self->_isDefaultMode;
}

- (void)setIsDefaultMode:(BOOL)a3
{
  self->_isDefaultMode = a3;
}

@end
