@implementation CFStringDecodeByteStream3

_OWORD *____CFStringDecodeByteStream3_block_invoke()
{
  _OWORD *result;

  result = CFStringEncodingGetConverter(134217984);
  __CFStringDecodeByteStream3___CFFromUTF8 = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))*((_QWORD *)result + 1);
  return result;
}

@end
