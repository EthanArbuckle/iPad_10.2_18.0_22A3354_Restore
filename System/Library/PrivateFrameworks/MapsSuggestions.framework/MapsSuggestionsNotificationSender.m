@implementation MapsSuggestionsNotificationSender

- (MapsSuggestionsNotificationSender)initWithDarwinNotification:(const char *)a3
{
  MapsSuggestionsNotificationSender *v4;
  std::string *v5;
  uint64_t value;
  objc_super v8;
  void *__p[2];
  char v10;

  v8.receiver = self;
  v8.super_class = (Class)MapsSuggestionsNotificationSender;
  v4 = -[MapsSuggestionsNotificationSender init](&v8, sel_init);
  if (v4)
  {
    v5 = (std::string *)operator new();
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)a3);
    MSg::NotificationSender::NotificationSender(v5, (__int128 *)__p);
    if (v10 < 0)
      operator delete(__p[0]);
    value = (uint64_t)v4->_sender.__ptr_.__value_;
    v4->_sender.__ptr_.__value_ = (NotificationSender *)v5;
    if (value)
      std::default_delete<MSg::NotificationSender>::operator()[abi:ne180100](value);
  }
  return v4;
}

- (void)notify
{
  MSg::NotificationSender::notify((MSg::NotificationSender *)self->_sender.__ptr_.__value_, 0);
}

- (void)notifyWithState:(unint64_t)a3
{
  MSg::NotificationSender::notify((MSg::NotificationSender *)self->_sender.__ptr_.__value_, a3);
}

- (void)notifyWithPayloadString:(id)a3
{
  NotificationSender *value;
  uint64_t v4;
  id v5;

  value = self->_sender.__ptr_.__value_;
  v5 = a3;
  v4 = MapsSuggestionsIPCPayloadForNSString(v5);
  MSg::NotificationSender::notify((MSg::NotificationSender *)value, v4);

}

- (void).cxx_destruct
{
  NotificationSender *value;

  value = self->_sender.__ptr_.__value_;
  self->_sender.__ptr_.__value_ = 0;
  if (value)
    std::default_delete<MSg::NotificationSender>::operator()[abi:ne180100]((uint64_t)value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
