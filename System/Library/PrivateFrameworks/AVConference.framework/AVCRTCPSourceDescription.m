@implementation AVCRTCPSourceDescription

- (AVCRTCPSourceDescription)initWithRTCPPacket:(tagRTCPPACKET *)a3
{
  AVCRTCPSourceDescription *v4;
  AVCRTCPSourceDescription *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)AVCRTCPSourceDescription;
  v4 = -[AVCRTCPPacket initWithRTCPPacket:](&v7, sel_initWithRTCPPacket_);
  v5 = v4;
  if (v4)
  {
    v4->_type = a3->var1.var2.var1.var0;
    v4->_text = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", (char *)&a3->var1.var5.var0.var1 + 2, a3->var1.var2.var1.var1, 1);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)AVCRTCPSourceDescription;
  -[AVCRTCPSourceDescription dealloc](&v3, sel_dealloc);
}

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)AVCRTCPSourceDescription;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@, type:%u, text:%@"), -[AVCRTCPPacket description](&v3, sel_description), -[AVCRTCPSourceDescription type](self, "type"), -[AVCRTCPSourceDescription text](self, "text"));
}

- (unsigned)type
{
  return self->_type;
}

- (void)setType:(unsigned __int8)a3
{
  self->_type = a3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
