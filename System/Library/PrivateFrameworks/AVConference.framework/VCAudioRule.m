@implementation VCAudioRule

- (VCAudioRule)init
{

  return 0;
}

- (VCAudioRule)initWithPayload:(int)a3 isSecondary:(BOOL)a4 sbr:(BOOL)a5 samplesPerBlock:(unsigned int)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  VCAudioRule *result;
  int v11;
  int v12;
  objc_super v13;
  uint64_t v14;

  v7 = a5;
  v8 = a4;
  v14 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)VCAudioRule;
  result = -[VCAudioRule init](&v13, sel_init);
  if (result)
  {
    result->_payload = a3;
    result->_isSecondary = v8;
    result->_sbr = v7;
    result->_samplesPerBlock = a6;
    if (v7)
      v11 = 0x10000;
    else
      v11 = 0;
    if (v8)
      v12 = 0x20000;
    else
      v12 = 0;
    result->_hash = v12 & 0xFFFF0000 | (unsigned __int16)a3 | v11 | (a6 << 18);
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  int payload;
  int isSecondary;
  int sbr;
  unsigned int samplesPerBlock;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    payload = self->_payload;
    if (payload == objc_msgSend(a3, "payload")
      && (isSecondary = self->_isSecondary, isSecondary == objc_msgSend(a3, "isSecondary"))
      && (sbr = self->_sbr, sbr == objc_msgSend(a3, "sbr")))
    {
      samplesPerBlock = self->_samplesPerBlock;
      LOBYTE(v5) = samplesPerBlock == objc_msgSend(a3, "samplesPerBlock");
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  const char *v6;
  const char *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = "yes";
  if (self->_isSecondary)
    v7 = "yes";
  else
    v7 = "no";
  if (!self->_sbr)
    v6 = "no";
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: payload=%u secondary=%s sbr=%s samplesPerBlock=%u"), v5, self->_payload, v7, v6, self->_samplesPerBlock);
}

- (int)payload
{
  return self->_payload;
}

- (BOOL)isSecondary
{
  return self->_isSecondary;
}

- (BOOL)sbr
{
  return self->_sbr;
}

- (unsigned)samplesPerBlock
{
  return self->_samplesPerBlock;
}

- (unint64_t)hash
{
  return self->_hash;
}

@end
