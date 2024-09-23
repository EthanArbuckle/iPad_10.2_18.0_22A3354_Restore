@implementation CMContinuityCaptureSMCreateTransitionsFromStateToDestinations

void __CMContinuityCaptureSMCreateTransitionsFromStateToDestinations_block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  CMContinuityCaptureStateTransition *v4;
  CMContinuityCaptureStateTransition *v5;

  v3 = a2;
  v5 = -[CMContinuityCaptureStateTransition initWithAttributes:dstState:event:guard:action:]([CMContinuityCaptureStateTransition alloc], "initWithAttributes:dstState:event:guard:action:", a1[4], v3, a1[5], a1[6], a1[7]);

  v4 = v5;
  if (v5)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1[8] + 8) + 40), "addObject:", v5);
    v4 = v5;
  }

}

@end
