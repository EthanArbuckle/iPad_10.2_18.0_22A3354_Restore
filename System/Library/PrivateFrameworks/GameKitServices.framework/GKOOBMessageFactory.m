@implementation GKOOBMessageFactory

+ (id)newMessageFromData:(id)a3
{
  __objc2_class **v5;

  if (!a3 || (unint64_t)objc_msgSend(a3, "length") < 2)
    return 0;
  if (*(_WORD *)objc_msgSend(a3, "bytes") == 16390)
    v5 = &off_24D465888;
  else
    v5 = &off_24D465860;
  return (id)objc_msgSend(objc_alloc(*v5), "initWithBytes:length:", objc_msgSend(a3, "bytes"), objc_msgSend(a3, "length"));
}

@end
