@implementation _IMSPIConnectionController

+ (id)sharedController
{
  if (qword_1ECF12448 != -1)
    dispatch_once(&qword_1ECF12448, &unk_1E471D798);
  return (id)qword_1EE65F508;
}

- (void)setChatCap
{
  if (_IMWillLog())
    _IMAlwaysLog();
  sub_1A20AB0B4((*MEMORY[0x1E0D36CD0] | *MEMORY[0x1E0D36CB8]) | *MEMORY[0x1E0D36CF8]);
}

- (void)setChatSendCap
{
  if (_IMWillLog())
    _IMAlwaysLog();
  sub_1A20AB0B4(*MEMORY[0x1E0D36CD0] | *MEMORY[0x1E0D36CB8] | (*MEMORY[0x1E0D36D28] | *MEMORY[0x1E0D36CF8]));
}

- (void)setChatSendCapWithAttachments
{
  if (_IMWillLog())
    _IMAlwaysLog();
  sub_1A20AB0B4(*MEMORY[0x1E0D36CD0] | *MEMORY[0x1E0D36CB8] | (*MEMORY[0x1E0D36D28] | *MEMORY[0x1E0D36CF8]) | *MEMORY[0x1E0D36CE0]);
}

- (void)clearChatCap
{
  if (_IMWillLog())
    _IMAlwaysLog();
  sub_1A20AB0B4(0);
}

@end
