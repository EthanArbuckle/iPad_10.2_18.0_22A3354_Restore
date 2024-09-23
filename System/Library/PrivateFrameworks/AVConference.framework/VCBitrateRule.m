@implementation VCBitrateRule

- (VCBitrateRule)initWithBitrate:(unsigned int)a3 connectionType:(int)a4 limitingRule:(id)a5
{
  VCBitrateRule *v8;
  VCBitrateRule *v9;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)VCBitrateRule;
  v8 = -[VCBitrateRule init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_bitrate = a3;
    v8->_connectionType = a4;
    v8->limitingRule = (VCVideoRule *)a5;
  }
  return v9;
}

- (int64_t)compare:(id)a3
{
  unsigned int v4;

  v4 = -[VCBitrateRule bitrate](self, "bitrate");
  if (v4 > objc_msgSend(a3, "bitrate"))
    return 1;
  else
    return -1;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bitrate rule bitrate %u connection type %d limit %@"), self->_bitrate, self->_connectionType, self->limitingRule);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCBitrateRule;
  -[VCBitrateRule dealloc](&v3, sel_dealloc);
}

- (unsigned)bitrate
{
  return self->_bitrate;
}

- (void)setBitrate:(unsigned int)a3
{
  self->_bitrate = a3;
}

- (int)connectionType
{
  return self->_connectionType;
}

- (void)setConnectionType:(int)a3
{
  self->_connectionType = a3;
}

- (VCVideoRule)limitingRule
{
  return self->limitingRule;
}

@end
