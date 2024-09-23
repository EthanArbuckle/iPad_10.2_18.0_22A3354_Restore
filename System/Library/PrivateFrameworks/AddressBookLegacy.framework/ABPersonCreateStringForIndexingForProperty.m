@implementation ABPersonCreateStringForIndexingForProperty

_QWORD *__ABPersonCreateStringForIndexingForProperty_block_invoke()
{
  _QWORD *v0;
  _QWORD *v1;
  _QWORD *result;

  v0 = malloc_type_calloc(9uLL, 8uLL, 0x6004044C4A2DFuLL);
  ABPersonCreateStringForIndexingForProperty_addressKeys = (uint64_t)v0;
  *v0 = CFSTR("Street");
  v0[1] = CFSTR("ZIP");
  v0[2] = CFSTR("State");
  v0[3] = CFSTR("Country");
  v0[4] = CFSTR("CountryCode");
  v0[5] = CFSTR("City");
  v0[6] = CFSTR("SubLocality");
  v0[7] = CFSTR("SubAdministrativeArea");
  v1 = malloc_type_calloc(3uLL, 8uLL, 0x6004044C4A2DFuLL);
  ABPersonCreateStringForIndexingForProperty_socialKeys = (uint64_t)v1;
  *v1 = CFSTR("username");
  v1[1] = CFSTR("identifier");
  result = malloc_type_calloc(2uLL, 8uLL, 0x6004044C4A2DFuLL);
  ABPersonCreateStringForIndexingForProperty_instantMessagingKeys = (uint64_t)result;
  *result = CFSTR("username");
  return result;
}

@end
