@implementation PQLConnection(SwiftWorkaround)

- (void)setAutoRollbackHandlerForSwift:()SwiftWorkaround
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __65__PQLConnection_SwiftWorkaround__setAutoRollbackHandlerForSwift___block_invoke;
  v6[3] = &unk_250BDC168;
  v7 = v4;
  v5 = v4;
  objc_msgSend(a1, "setAutoRollbackHandler:", v6);

}

@end
