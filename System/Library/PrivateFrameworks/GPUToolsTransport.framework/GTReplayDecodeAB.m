@implementation GTReplayDecodeAB

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTReplayDecodeAB)initWithCoder:(id)a3
{
  id v4;
  GTReplayDecodeAB *v5;
  GTReplayDecodeAB *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GTReplayDecodeAB;
  v5 = -[GTReplayRequest initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("type"));
    v5->_index = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("index"));
    v5->_dispatchUID.uid = GTDispatchUIDDecode(v4, CFSTR("dispatchUID"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GTReplayDecodeAB;
  v4 = a3;
  -[GTReplayRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt32:forKey:", self->_type, CFSTR("type"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInt32:forKey:", self->_index, CFSTR("index"));
  GTDispatchUIDEncode(v4, self->_dispatchUID.uid, CFSTR("dispatchUID"));

}

- ($71565B17A5F3ED2E4525C95CCD99C39E)dispatchUID
{
  return ($71565B17A5F3ED2E4525C95CCD99C39E)self->_dispatchUID.uid;
}

- (void)setDispatchUID:(id)a3
{
  self->_dispatchUID.uid = a3.var1;
}

- (unsigned)type
{
  return self->_type;
}

- (void)setType:(unsigned __int16)a3
{
  self->_type = a3;
}

- (unsigned)index
{
  return self->_index;
}

- (void)setIndex:(unsigned int)a3
{
  self->_index = a3;
}

@end
