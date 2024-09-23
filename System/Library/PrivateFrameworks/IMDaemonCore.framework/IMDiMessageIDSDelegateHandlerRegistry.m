@implementation IMDiMessageIDSDelegateHandlerRegistry

- (BOOL)canAddCommand:(id)a3
{
  return +[IMBlastdoor _commandReadyForBlastdoor:](IMBlastdoor, "_commandReadyForBlastdoor:", objc_msgSend(a3, "integerValue"));
}

- (id)noopHandlerForCommand:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD aBlock[4];
  id v8;

  v3 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1D15AB9D8;
  aBlock[3] = &unk_1E922E3E8;
  v8 = v3;
  v4 = v3;
  v5 = _Block_copy(aBlock);

  return v5;
}

@end
