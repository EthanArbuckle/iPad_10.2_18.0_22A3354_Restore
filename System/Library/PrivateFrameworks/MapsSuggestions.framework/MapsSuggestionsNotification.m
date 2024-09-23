@implementation MapsSuggestionsNotification

- (MapsSuggestionsNotification)initWithCppNotification:(const void *)a3
{
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MapsSuggestionsNotification;
  -[MapsSuggestionsNotification self](&v7, sel_self);
  v5 = objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    std::string::operator=((std::string *)(v5 + 8), (const std::string *)a3);
    *(_OWORD *)(v5 + 32) = *(_OWORD *)((char *)a3 + 24);
  }
  return (MapsSuggestionsNotification *)v5;
}

- (const)darwinNotification
{
  const char *result;

  result = self->_notification.darwinNotification.__r_.__value_.var0.__s.__data_;
  if (*((char *)&self->_notification.darwinNotification.__r_.__value_.var0.__l + 23) < 0)
    return *(const char **)result;
  return result;
}

- (unint64_t)state
{
  return self->_notification.darwinNotification.var0;
}

- (BOOL)stateCouldHaveBeenPayloadString:(id)a3
{
  int64_t var0;

  var0 = self->_notification.darwinNotification.var0;
  return var0 == MapsSuggestionsIPCPayloadForNSString(a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[MapsSuggestionsNotification initWithCppNotification:](+[MapsSuggestionsNotification allocWithZone:](MapsSuggestionsNotification, "allocWithZone:", a3), "initWithCppNotification:", &self->_notification);
}

- (void).cxx_destruct
{
  if (*((char *)&self->_notification.darwinNotification.__r_.__value_.var0.__l + 23) < 0)
    operator delete(self->_notification.darwinNotification.__r_.__value_.var0.__l.__data_);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 8) = 0uLL;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
