@implementation BWNodeStillImageReferenceFrameBracketedCaptureSequenceNumberMessage

+ (id)newMessageWithStillImageReferenceFrameBracketedCaptureSequenceNumber:(int)a3
{
  id result;
  objc_super v5;

  result = [BWNodeStillImageReferenceFrameBracketedCaptureSequenceNumberMessage alloc];
  if (result)
  {
    v5.receiver = result;
    v5.super_class = (Class)BWNodeStillImageReferenceFrameBracketedCaptureSequenceNumberMessage;
    result = objc_msgSendSuper2(&v5, sel_init);
    if (result)
    {
      *((_QWORD *)result + 1) = 0x600000001;
      *((_DWORD *)result + 4) = a3;
    }
  }
  return result;
}

- (int)referenceFrameBracketedCaptureSequenceNumber
{
  return self->_referenceFrameBracketedCaptureSequenceNumber;
}

@end
