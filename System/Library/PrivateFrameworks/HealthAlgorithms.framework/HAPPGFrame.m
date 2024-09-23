@implementation HAPPGFrame

- (HAPPGFrame)initWithPPGProcessorOutput:(const void *)a3 rawPacket:(shared_ptr<const)std:()mimosa:()mimosa:()mimosa:()mimosa:()mimosa:(mimosa:(id)a5 :PacketV7>>)a4 :PacketV6 :PacketV5 :PacketV4 :PacketV3 :PacketV2 :variant<mimosa::PacketV1 bootDate:
{
  __shared_weak_count *cntrl;
  uint64_t *ptr;
  __shared_weak_count *v9;
  HAPPGFrame *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  HAPPGOpticalSample *v14;
  NSArray *v15;
  uint64_t i;
  uint64_t v17;
  HAPPGAccelSample *v18;
  double v19;
  double v20;
  double v21;
  HAPPGAccelSample *v22;
  NSArray *accelSamples;
  objc_super v25;

  cntrl = a4.__cntrl_;
  ptr = (uint64_t *)a4.__ptr_;
  v9 = a4.__cntrl_;
  v25.receiver = self;
  v25.super_class = (Class)HAPPGFrame;
  v10 = -[HAPPGFrame init](&v25, sel_init);
  std::shared_ptr<std::variant<mimosa::PacketV1,mimosa::PacketV2,mimosa::PacketV3,mimosa::PacketV4,mimosa::PacketV5,mimosa::PacketV6,mimosa::PacketV7> const>::operator=[abi:ne180100](&v10->_rawPacket.__ptr_, ptr);
  objc_storeStrong((id *)&v10->_startDate, cntrl);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 6);
  v12 = *(_QWORD *)a3;
  v13 = *((_QWORD *)a3 + 1);
  if (*(_QWORD *)a3 != v13)
  {
    do
    {
      v14 = -[HAPPGOpticalSample initWithPPGProcessorOutputSignal:]([HAPPGOpticalSample alloc], "initWithPPGProcessorOutputSignal:", v12);
      objc_msgSend(v11, "addObject:", v14);

      v12 += 64;
    }
    while (v12 != v13);
  }
  objc_storeStrong((id *)&v10->_opticalSamples, v11);
  v15 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a3 + 4) - *((_QWORD *)a3 + 3)) >> 3));
  v17 = *((_QWORD *)a3 + 3);
  for (i = *((_QWORD *)a3 + 4); v17 != i; v17 += 24)
  {
    v18 = [HAPPGAccelSample alloc];
    LODWORD(v19) = *(_DWORD *)(v17 + 12);
    LODWORD(v20) = *(_DWORD *)(v17 + 16);
    LODWORD(v21) = *(_DWORD *)(v17 + 20);
    v22 = -[HAPPGAccelSample initWithSamplingFrequency:timestamp:x:y:z:](v18, "initWithSamplingFrequency:timestamp:x:y:z:", *(unsigned __int16 *)(v17 + 8), *(_QWORD *)v17, v19, v20, v21);
    -[NSArray addObject:](v15, "addObject:", v22);

  }
  accelSamples = v10->_accelSamples;
  v10->_accelSamples = v15;

  return v10;
}

- (int64_t)timestamp
{
  uint64_t v2;
  char v4;
  char *v5;

  v2 = *((unsigned int *)self->_rawPacket.__ptr_ + 80);
  if ((_DWORD)v2 == -1)
    std::__throw_bad_variant_access[abi:ne180100]();
  v5 = &v4;
  return ((uint64_t (*)(char **))off_24D60B6D0[v2])(&v5);
}

- (unint64_t)usage
{
  uint64_t v2;
  char v4;
  char *v5;

  v2 = *((unsigned int *)self->_rawPacket.__ptr_ + 80);
  if ((_DWORD)v2 == -1)
    std::__throw_bad_variant_access[abi:ne180100]();
  v5 = &v4;
  return ((uint64_t (*)(char **))off_24D60B708[v2])(&v5);
}

- (HAPPGTemperatureSample)temperatureSample
{
  uint64_t v2;
  char v4;
  char *v5;

  v2 = *((unsigned int *)self->_rawPacket.__ptr_ + 80);
  if ((_DWORD)v2 == -1)
    std::__throw_bad_variant_access[abi:ne180100]();
  v5 = &v4;
  ((void (*)(char **))off_24D60B740[v2])(&v5);
  return (HAPPGTemperatureSample *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSArray)opticalSamples
{
  return self->_opticalSamples;
}

- (NSArray)accelSamples
{
  return self->_accelSamples;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accelSamples, 0);
  objc_storeStrong((id *)&self->_opticalSamples, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  std::shared_ptr<std::variant<mimosa::PacketV1,mimosa::PacketV2,mimosa::PacketV3,mimosa::PacketV4,mimosa::PacketV5,mimosa::PacketV6,mimosa::PacketV7> const>::~shared_ptr[abi:ne180100]((uint64_t)&self->_rawPacket);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
