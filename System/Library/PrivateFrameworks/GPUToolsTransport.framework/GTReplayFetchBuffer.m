@implementation GTReplayFetchBuffer

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTReplayFetchBuffer)initWithCoder:(id)a3
{
  id v4;
  GTReplayFetchBuffer *v5;
  GTReplayFetchBuffer *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GTReplayFetchBuffer;
  v5 = -[GTReplayRequest initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_streamRef = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("streamRef"));
    v5->_range.location = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("range.location"));
    v5->_range.length = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("range.length"));
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
  v5.super_class = (Class)GTReplayFetchBuffer;
  v4 = a3;
  -[GTReplayRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", self->_streamRef, CFSTR("streamRef"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInt64:forKey:", self->_range.location, CFSTR("range.location"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_range.length, CFSTR("range.length"));
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

- (unint64_t)streamRef
{
  return self->_streamRef;
}

- (void)setStreamRef:(unint64_t)a3
{
  self->_streamRef = a3;
}

- (GTRange)range
{
  GTRange *p_range;
  unint64_t location;
  unint64_t length;
  GTRange result;

  p_range = &self->_range;
  location = self->_range.location;
  length = p_range->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRange:(GTRange)a3
{
  self->_range = a3;
}

@end
