@implementation GTReplayResponseStream

- (GTReplayResponseStream)initWithState:(unsigned int)a3
{
  GTReplayResponseStream *v4;
  GTReplayResponseStream *v5;
  GTReplayResponseStream *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GTReplayResponseStream;
  v4 = -[GTReplayResponse init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_state = a3;
    v6 = v4;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTReplayResponseStream)initWithCoder:(id)a3
{
  id v4;
  GTReplayResponseStream *v5;
  GTReplayResponseStream *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GTReplayResponseStream;
  v5 = -[GTReplayResponse initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_state = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("state"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GTReplayResponseStream;
  v4 = a3;
  -[GTReplayResponse encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt32:forKey:", self->_state, CFSTR("state"), v5.receiver, v5.super_class);

}

- (unsigned)state
{
  return self->_state;
}

- (void)setState:(unsigned int)a3
{
  self->_state = a3;
}

@end
