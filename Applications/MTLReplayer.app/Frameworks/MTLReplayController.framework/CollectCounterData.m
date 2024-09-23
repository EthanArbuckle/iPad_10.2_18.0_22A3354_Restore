@implementation CollectCounterData

id *__CollectCounterData_block_invoke(id *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3)
  {
    if (a4)
      return (id *)objc_msgSend(result[4], "appendData:");
  }
  return result;
}

@end
