@implementation CKModifyRecordsOperation(IC)

- (uint64_t)ic_removeAllCompletionBlocks
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&off_1EF55B128;
  objc_msgSendSuper2(&v3, sel_ic_removeAllCompletionBlocks);
  objc_msgSend(a1, "setPerRecordSaveBlock:", 0);
  objc_msgSend(a1, "setPerRecordProgressBlock:", 0);
  return objc_msgSend(a1, "setModifyRecordsCompletionBlock:", 0);
}

@end
