@implementation GTReplayFetchWireframe

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTReplayFetchWireframe)initWithCoder:(id)a3
{
  id v4;
  GTReplayFetchWireframe *v5;
  GTReplayFetchWireframe *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GTReplayFetchWireframe;
  v5 = -[GTReplayRequest initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_solid = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("solid"));
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
  v5.super_class = (Class)GTReplayFetchWireframe;
  v4 = a3;
  -[GTReplayRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_solid, CFSTR("solid"), v5.receiver, v5.super_class);
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

- (BOOL)solid
{
  return self->_solid;
}

- (void)setSolid:(BOOL)a3
{
  self->_solid = a3;
}

@end
