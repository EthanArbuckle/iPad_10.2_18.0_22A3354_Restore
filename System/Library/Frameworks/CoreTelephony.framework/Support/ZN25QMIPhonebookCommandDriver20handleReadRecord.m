@implementation ZN25QMIPhonebookCommandDriver20handleReadRecord

char **___ZN25QMIPhonebookCommandDriver20handleReadRecord_indEN3qmi16SubscriptionTypeERKN3pbm19ReadRecordUndecoded10IndicationE_block_invoke_5(char **result, unsigned __int16 **a2)
{
  unsigned __int16 *v2;
  unsigned __int16 *v3;
  uint64_t **v4;
  unsigned int v5;
  unsigned int v6;

  v2 = *a2;
  v3 = a2[1];
  if (*a2 != v3)
  {
    v4 = (uint64_t **)(*((_QWORD *)result[4] + 1) + 40);
    do
    {
      v5 = *v2;
      v6 = v5;
      result = std::__tree<std::__value_type<unsigned int,CSIPhoneBookEntry>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,CSIPhoneBookEntry>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,CSIPhoneBookEntry>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(v4, v5, &v6);
      *((_BYTE *)result + 416) = *((_BYTE *)v2 + 2) != 0;
      v2 += 2;
    }
    while (v2 != v3);
  }
  return result;
}

@end
