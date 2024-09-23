@implementation ZN4AABC15registerServiceEP20

CBDigitizerFilter *___ZN4AABC15registerServiceEP20__IOHIDServiceClient_block_invoke(CBDigitizerFilter *result, uint64_t a2, const AABC::ALS *a3)
{
  if (a3)
  {
    if (!*((_QWORD *)a3 + 3))
    {
      result = AABC::newDigitizerFilterForALS((AABC *)result->super._notificationBlock, a3);
      *((_QWORD *)a3 + 3) = result;
    }
  }
  return result;
}

@end
