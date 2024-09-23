@implementation CopyBrokerInfoForDeviceID

void __browser_CopyBrokerInfoForDeviceID_block_invoke(_QWORD *a1)
{
  CFTypeRef *v2;
  CFTypeRef *v3;
  CFTypeRef *v4;
  _QWORD *v5;
  uint64_t DerivedStorage;
  const void *Int64;
  const void *Value;
  uint64_t v9;
  const void *BrokerGroupID;
  const void *ReceiverGroupUUID;
  const void *PublicReceiverUUID;
  const void *LTPKHash;
  int v14;

  v2 = (CFTypeRef *)a1[7];
  v4 = (CFTypeRef *)a1[8];
  v3 = (CFTypeRef *)a1[9];
  v5 = (_QWORD *)a1[10];
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  Int64 = (const void *)CFNumberCreateInt64();
  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(DerivedStorage + 344), Int64);
  if (!Value)
  {
    APSLogErrorAt();
    v14 = -6727;
    if (!Int64)
      goto LABEL_15;
    goto LABEL_14;
  }
  v9 = (uint64_t)Value;
  if (v2)
  {
    BrokerGroupID = (const void *)APBrokeredReceiverGetBrokerGroupID((uint64_t)Value);
    *v2 = CFRetain(BrokerGroupID);
  }
  if (v4)
  {
    ReceiverGroupUUID = (const void *)APBrokeredReceiverGetReceiverGroupUUID(v9);
    *v4 = CFRetain(ReceiverGroupUUID);
  }
  if (v3)
  {
    PublicReceiverUUID = (const void *)APBrokeredReceiverGetPublicReceiverUUID(v9);
    *v3 = CFRetain(PublicReceiverUUID);
  }
  if (!v5)
  {
    v14 = 0;
    if (!Int64)
      goto LABEL_15;
LABEL_14:
    CFRelease(Int64);
    goto LABEL_15;
  }
  LTPKHash = (const void *)APBrokeredReceiverGetLTPKHash(v9);
  if (LTPKHash)
    LTPKHash = CFRetain(LTPKHash);
  v14 = 0;
  *v5 = LTPKHash;
  if (Int64)
    goto LABEL_14;
LABEL_15:
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v14;
}

@end
