@implementation CKFetchRecordsOperation(IC)

- (uint64_t)ic_removeAllCompletionBlocks
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&off_1EF55C4C8;
  objc_msgSendSuper2(&v3, sel_ic_removeAllCompletionBlocks);
  objc_msgSend(a1, "setPerRecordCompletionBlock:", 0);
  objc_msgSend(a1, "setPerRecordProgressBlock:", 0);
  return objc_msgSend(a1, "setFetchRecordsCompletionBlock:", 0);
}

@end
