@implementation CGImageCreateMetadataFromData

std::string *__CGImageCreateMetadataFromData_block_invoke(uint64_t a1, const void *a2)
{
  const __CFString *v3;
  _BYTE v5[24];

  IIOString::IIOString((IIOString *)v5, a2);
  v3 = IIOString::utf8String((IIOString *)v5);
  std::string::append((std::string *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), (const std::string::value_type *)v3);
  IIOString::~IIOString((IIOString *)v5);
  return std::string::append((std::string *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "  ");
}

@end
