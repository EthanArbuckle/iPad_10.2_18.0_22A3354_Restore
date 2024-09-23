@implementation BAAppStoreProgressInfoDescriptor

- (BAAppStoreProgressInfoDescriptor)initWithCoder:(id)a3
{
  id v4;
  BAAppStoreProgressInfoDescriptor *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BAAppStoreProgressInfoDescriptor;
  v5 = -[BAAppStoreProgressInfoDescriptor init](&v7, sel_init);
  if (v5)
  {
    v5->_progressState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_progressState"));
    v5->_countOfBytesReceived = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_countOfBytesReceived"));
    v5->_countOfBytesExpectedToReceive = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_countOfBytesExpectedToReceive"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[BAAppStoreProgressInfoDescriptor progressState](self, "progressState"), CFSTR("_progressState"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[BAAppStoreProgressInfoDescriptor countOfBytesReceived](self, "countOfBytesReceived"), CFSTR("_countOfBytesReceived"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[BAAppStoreProgressInfoDescriptor countOfBytesExpectedToReceive](self, "countOfBytesExpectedToReceive"), CFSTR("_countOfBytesExpectedToReceive"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  BAAppStoreProgressInfoDescriptor *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;

  v4 = (BAAppStoreProgressInfoDescriptor *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v5 = -[BAAppStoreProgressInfoDescriptor progressState](v4, "progressState"),
          v5 == -[BAAppStoreProgressInfoDescriptor progressState](self, "progressState"))
      && (v6 = -[BAAppStoreProgressInfoDescriptor countOfBytesReceived](v4, "countOfBytesReceived"),
          v6 == -[BAAppStoreProgressInfoDescriptor countOfBytesReceived](self, "countOfBytesReceived")))
    {
      v7 = -[BAAppStoreProgressInfoDescriptor countOfBytesExpectedToReceive](v4, "countOfBytesExpectedToReceive");
      v8 = v7 == -[BAAppStoreProgressInfoDescriptor countOfBytesExpectedToReceive](self, "countOfBytesExpectedToReceive");
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  int64_t v3;
  int64_t v4;

  v3 = -[BAAppStoreProgressInfoDescriptor progressState](self, "progressState");
  v4 = -[BAAppStoreProgressInfoDescriptor countOfBytesReceived](self, "countOfBytesReceived");
  return v3
       + 16
       * (-[BAAppStoreProgressInfoDescriptor countOfBytesExpectedToReceive](self, "countOfBytesExpectedToReceive") + v4);
}

- (int64_t)progressState
{
  return self->_progressState;
}

- (int64_t)countOfBytesExpectedToReceive
{
  return self->_countOfBytesExpectedToReceive;
}

- (int64_t)countOfBytesReceived
{
  return self->_countOfBytesReceived;
}

@end
