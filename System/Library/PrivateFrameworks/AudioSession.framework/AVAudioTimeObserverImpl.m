@implementation AVAudioTimeObserverImpl

- (AudioPresentationTimeStamp)currentPresentationTime
{
  AudioPresentationTimeStamp *result;

  as::client::DeviceTimeClient::currentPresentationTime((as::client::DeviceTimeClient *)self->_deviceTimeClient.__ptr_, (uint64_t)retstr);
  return result;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

- (AVAudioTimeObserverImpl)initWithDeviceTimeClient:(shared_ptr<as::client::DeviceTimeClient>)a3
{
  uint64_t *ptr;
  AVAudioTimeObserverImpl *v4;
  AVAudioTimeObserverImpl *v5;
  objc_super v7;

  ptr = (uint64_t *)a3.__ptr_;
  v7.receiver = self;
  v7.super_class = (Class)AVAudioTimeObserverImpl;
  v4 = -[AVAudioTimeObserverImpl init](&v7, sel_init, a3.__ptr_, a3.__cntrl_);
  v5 = v4;
  if (v4)
    std::shared_ptr<as::client::DeviceTimeClient>::operator=[abi:ne180100](&v4->_deviceTimeClient.__ptr_, ptr);
  return v5;
}

- (AudioTimeStamp)currentTime
{
  AudioTimeStamp *result;

  as::client::DeviceTimeClient::currentTime((as::client::DeviceTimeClient *)self->_deviceTimeClient.__ptr_, (uint64_t)retstr);
  return result;
}

- (AVAudioTimeInterval)currentLatency
{
  AVAudioTimeInterval *result;

  as::client::DeviceTimeClient::currentLatency((as::client::DeviceTimeClient *)self->_deviceTimeClient.__ptr_, (uint64_t)retstr);
  return result;
}

- (BOOL)isLatencyDynamic
{
  return as::client::DeviceTimeClient::isLatencyDynamic((as::client::DeviceTimeClient *)self->_deviceTimeClient.__ptr_);
}

- (shared_ptr<as::client::DeviceTimeClient>)deviceTimeClient
{
  DeviceTimeClient **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<as::client::DeviceTimeClient> result;

  cntrl = self->_deviceTimeClient.__cntrl_;
  *v2 = self->_deviceTimeClient.__ptr_;
  v2[1] = (DeviceTimeClient *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (DeviceTimeClient *)self;
  return result;
}

- (void).cxx_destruct
{
  std::shared_ptr<as::client::XPCConnection>::~shared_ptr[abi:ne180100]((uint64_t)&self->_deviceTimeClient);
}

@end
