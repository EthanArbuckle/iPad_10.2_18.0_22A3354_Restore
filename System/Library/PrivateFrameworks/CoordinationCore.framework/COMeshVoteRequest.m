@implementation COMeshVoteRequest

+ (id)acceptableResponses
{
  id v2;
  uint64_t v3;

  v2 = objc_alloc(MEMORY[0x24BDBCF20]);
  v3 = objc_opt_class();
  return (id)objc_msgSend(v2, "initWithObjects:", v3, objc_opt_class(), 0);
}

@end
