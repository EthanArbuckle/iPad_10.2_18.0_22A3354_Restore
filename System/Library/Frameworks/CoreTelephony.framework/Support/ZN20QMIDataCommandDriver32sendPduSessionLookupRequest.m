@implementation ZN20QMIDataCommandDriver32sendPduSessionLookupRequest

std::string *___ZN20QMIDataCommandDriver32sendPduSessionLookupRequest_syncERK17TrafficDescriptorNSt3__18functionIFvRKNS3_12basic_stringIcNS3_11char_traitsIcEENS3_9allocatorIcEEEEEEE_block_invoke_3(uint64_t a1, std::string *this)
{
  const std::string *v2;

  v2 = *(const std::string **)(a1 + 32);
  if (!v2[11].__r_.__value_.__s.__data_[0])
    std::__throw_bad_optional_access[abi:ne180100]();
  return std::string::operator=(this, v2 + 10);
}

@end
