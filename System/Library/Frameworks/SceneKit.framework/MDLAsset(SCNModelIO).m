@implementation MDLAsset(SCNModelIO)

+ (uint64_t)assetWithSCNScene:()SCNModelIO
{
  if (a3 && objc_msgSend(a3, "rootNode"))
    return objc_msgSend(a1, "assetWithSCNNode:", objc_msgSend(a3, "rootNode"));
  else
    return 0;
}

+ (uint64_t)assetWithSCNScene:()SCNModelIO bufferAllocator:
{
  if (a3 && objc_msgSend(a3, "rootNode"))
    return objc_msgSend(a1, "assetWithSCNNode:bufferAllocator:", objc_msgSend(a3, "rootNode"), a4);
  else
    return 0;
}

+ (uint64_t)assetWithSCNNode:()SCNModelIO
{
  if (a3)
    return objc_msgSend(a1, "assetWithSCNNode:bufferAllocator:", a3, 0);
  else
    return 0;
}

+ (id)assetWithSCNNode:()SCNModelIO bufferAllocator:
{
  void *v6;

  if (!a3)
    return 0;
  v6 = (void *)objc_msgSend([a1 alloc], "initWithBufferAllocator:", a4);
  objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E0CC77C8], "objectWithSCNNode:bufferAllocator:", a3, a4));
  return v6;
}

@end
