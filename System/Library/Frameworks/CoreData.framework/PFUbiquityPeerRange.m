@implementation PFUbiquityPeerRange

- (void)loadFromBaselineDictionary:(void *)result
{
  void *v3;

  if (result)
  {
    v3 = result;
    objc_msgSend(result, "setPeerStart:", objc_msgSend(a2, "objectForKey:", CFSTR("peerStart")));
    objc_msgSend(v3, "setPeerEnd:", objc_msgSend(a2, "objectForKey:", CFSTR("peerEnd")));
    objc_msgSend(v3, "setEnd:", objc_msgSend(a2, "objectForKey:", CFSTR("rangeStart")));
    objc_msgSend(v3, "setStart:", objc_msgSend(a2, "objectForKey:", CFSTR("rangeEnd")));
    return (void *)objc_msgSend(v3, "setPeerEntityName:", objc_msgSend(a2, "valueForKey:", CFSTR("entityName")));
  }
  return result;
}

@end
